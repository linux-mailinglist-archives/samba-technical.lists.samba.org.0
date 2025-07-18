Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F34ABB0A3D6
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jul 2025 14:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OBDAndfWd+q7CuDluG38X32e9tdqZExFlObku+dMfY8=; b=Ltldw4I/JYmEvO1zGOPIWc/lAN
	n7V7qPwZ4iuaQYtJgmCRnzm/ozPWoC3+Yy2MQNA8xWhueK508rC3R8BZIqPUw+Lrl22iQ7tcezy2R
	eIc2KXKUenwXxT2PDi4fsgdHfQGaRc6KhAc6ORcnCG5frwwrbssf6nPnliijBzioQe4q9HFfZmcpc
	+E4XC+N4Sw9i43fzEUnquJNwU9U3gz0fmVilimLTIPnZLGrJ028lohPopcBgJaDwZ8GFjLq80K8PH
	G5wNZlK+vxaWK7vz6hNITHPYs2hyN8HLyw2chQEexpbLgI4gNwZCGJewZL+moh7p+iDYdO3s29+fy
	elzKfRag==;
Received: from ip6-localhost ([::1]:30658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ucjt0-00BRhf-7f; Fri, 18 Jul 2025 12:08:22 +0000
Received: from isrv.corpit.ru ([212.248.84.144]:51993) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ucjsw-00BRhY-7p
 for samba-technical@lists.samba.org; Fri, 18 Jul 2025 12:08:20 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B8C03138315
 for <samba-technical@lists.samba.org>; Fri, 18 Jul 2025 14:43:14 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9217F249F56
 for <samba-technical@lists.samba.org>; Fri, 18 Jul 2025 14:43:24 +0300 (MSK)
Message-ID: <57f12264-b359-4057-b5f9-41464debeb8d@tls.msk.ru>
Date: Fri, 18 Jul 2025 14:43:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical@lists.samba.org
Subject: growth of smbXsrv_session_global.tdb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is the second time I'm hitting this issue and have to do something
with it.

It looks like this file can grow quite large.  I had to increase amount
of RAM a few times already just to hold this very file, which is in
/run/samba on debian.  I'm considering moving it to a persistent storage
just to lessen memory requirements.

The growth seems to happen when there are multiple sessions being
created and removed rapidly.  In this mode, the file can grow up
very fast, even if the total amount of sessions isn't large.

For example, we've a server which acts just as a DFS redirector for
a relatively large number of clients - redirecting them to one or
another server.  So the sessions there are really short-living, each
client just gets the DFS reference and ends the session, to do the
same after a while, to refresh the reference.  The amount of
concurrent sessions hardly reaches 30..50.  Yet, the size of
smbXsrv_session_global.tdb stays at 400..600M, and grows to this
size quite rapidly right after a (re)start.

There's another server, which acts as a regular file server,
where amount of concurrent sessions stays at about 2K mark,
which is rather large.  There, sometimes, there are multiple
clients creating short-lived sessions in relatively short time.
Amount of actual parallel sessions does not grow much, but
there are multiple short sessions created/removed in a short
time.  With these, smbXsrv_session_global.tdb can grow larger
than 2Gb in a short time.

It feels like old/unused records/places in this file aren't
re-used for new sessions before some timeout, and this timeout
is rather large, so number of unused entries there can grow
quite high until the cleanup kicks in.  Or something like
that anyway.

I wonder if I can make this file to be a symlink from
/run/samba to /var/cache/samba or something.  Or else we're
getting out of memory on regular basis, just to keep all the
unused gaps in smbXsrv_session_global.tdb in ram.

How one can remedy the underlying problem?

Thanks,

/mjt

