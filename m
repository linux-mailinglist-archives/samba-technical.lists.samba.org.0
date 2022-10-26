Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2660E32C
	for <lists+samba-technical@lfdr.de>; Wed, 26 Oct 2022 16:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=simo7HbZfHy2T8s9yrz0YnYxyfi4JQObo+KVKsuWZBs=; b=u4sm9Kw/viu1TVAv5yOIxQbzVG
	al3d99KjccyxeeA2W3OWGDtgKYdA0s60VQFBcpTxKgXYwG4/UwoulqE03pxtLg0PjM6WbPvrs9q4K
	cH5hbe90qbKV+Aflg39KVTzU8vO5aeRNTsKz3EQ65kFrghnKDOocxa3a27QLB+Hzi+li+QAhg9Brm
	VydHiJjVhGXPFnT9B5vgyeTBRRzfBdSl+pCkgleLEP/iXdp2wDVegUcsRIoutQIfdenlVpc5UF3tt
	Y+OBfGgX4ycDu3g4nZ2w+/IsD/WS0VnAk0SPmSg6NAibz726VmS8CDNzpCl9C2lMEMpHxAniChsp9
	y/evymDg==;
Received: from ip6-localhost ([::1]:25626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onhGH-006G1K-1P; Wed, 26 Oct 2022 14:20:05 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:33737) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onhGB-006G1B-QI
 for samba-technical@lists.samba.org; Wed, 26 Oct 2022 14:20:02 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1760840DC5;
 Wed, 26 Oct 2022 17:19:57 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id DD72E13A;
 Wed, 26 Oct 2022 17:19:59 +0300 (MSK)
Message-ID: <a1da055b-a3cb-ae78-f9d4-ce7332375565@msgid.tls.msk.ru>
Date: Wed, 26 Oct 2022 17:19:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: running only selected tests in samba sources
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <2656048.mvXUDI8C0e@magrathea>
 <afca8f8d-f9df-3489-902c-bc82ced76731@msgid.tls.msk.ru>
 <2855388.e9J7NaK4W3@magrathea>
In-Reply-To: <2855388.e9J7NaK4W3@magrathea>
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

25.10.2022 20:16, Andreas Schneider via samba-technical wrote:
..
> cd lib/ldb
> ./configure
> make
> make test

Well.. that can be done indeed.

It'd be nice if the same binaries of ldb can be tested which
will be installed, not the ones which are built especially for
the test (with different config options, since main build is
samba itself).  I dunno how useful it is, - probably still
useful but much less so than testing actual binaries.

It also requires copying whole source to a temporary/scratch
directory because samba does not support out-of-tree builds
and `make clean' doesn't work either.

Thank you for the suggestions!

/mjt

