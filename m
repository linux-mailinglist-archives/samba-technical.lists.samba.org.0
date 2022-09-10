Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8A5B45E7
	for <lists+samba-technical@lfdr.de>; Sat, 10 Sep 2022 12:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TIYUgoOhaQNv+lYRM+/1XO/8MNrpAcWGFp2KgVSY3IY=; b=5tdVeR49g91C1XHGovGSKv4+sb
	iQCN5O9Q7jyxB6dLa7Ak05Wjo0StpZIo6HzgndFblZ9mV6PnpRzJO84YOho9+NfOKkuHyBz+D57Kj
	ghbOyJowA840RHvZ7mgyDfbHdb01L0vuuCn9vb6I2GYJ3k/K1+4+O5LaejY+clMMfV+nBGpyhNWAy
	BWu1HwqMVoCIaha0x9aeSsN0UU6DGfWSsGan2v+A0Lk2N7Tc7GvMOIPOOTT+TVznqzGI/fZDdFj+E
	vFLFk29B1lGrfBrRFJKhIPCGqzXNyjLn/DExygDvLPywchToSaQN2r2uSp6p1t9WYKzHu3Q6jIX8q
	8IrXeyPQ==;
Received: from ip6-localhost ([::1]:52666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWxb6-000VoE-0d; Sat, 10 Sep 2022 10:20:24 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35119) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWxat-000Vo4-Eb
 for samba-technical@lists.samba.org; Sat, 10 Sep 2022 10:20:18 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B937240930;
 Sat, 10 Sep 2022 13:20:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D0F8F12D;
 Sat, 10 Sep 2022 13:20:07 +0300 (MSK)
Message-ID: <84f22458-d5cc-f74c-9a35-596e22929f59@msgid.tls.msk.ru>
Date: Sat, 10 Sep 2022 13:20:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: ldb ABI versions in 4.17: should it include 2.5.1 & 2.5.2
 versions too?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <cc05692a-2a75-a9d8-6f33-88ffb91a9588@msgid.tls.msk.ru>
 <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
In-Reply-To: <7e33db4d2504d4458ddc67aa5fac47a22592dce5.camel@samba.org>
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

09.09.2022 23:20, Andrew Bartlett via samba-technical wrote:
> On Fri, 2022-09-09 at 14:19 +0300, Michael Tokarev via samba-technical
> wrote:
>> I'm not sure if this matter or not (since ldb is tied with samba), but ldb in 4.17.0rc5
>> lacks versions 2.5.1 and 2.5.2 released within samba 4.16.x series, while previous minor
>> ldb releases are listed there.
> 
> No, we don't normally include the branched history of ldb there.

Maybe this is something which can be reviewed?

The thing is.  Giving this ldb-2.5.2 version as an example.

Let's imagine there's a program using ldb (linking with ldb).  And it
has been compiled with ldb-2.5.2.  And it uses, say, ldb_msg_add_string_flags
symbol.  When compiled/linked against ldb-2.5.2, the executable is marked with
NEEDS: ldb_msg_add_string_flags@LDB_2.5.2, and generally needs LDB_2.5.2
version in libldb.

Now we upgrade libldb from 2.5.2 to 2.6.1. But there, the same
ldb_msg_add_string_flags is versioned as LDB_2.6.1. But it is the
same symbol, doing exactly the same thing.

So this program which were linked with ldb-2.5.2, will not run after
upgrade. - runtime linker will complain it can't find LDB_2.5.2 version
(and this symbol) in just-upgraded ldb-2.6.1.  So we'll have to
recompile the program just to fix the ldb versioning references.

Maybe for ldb this is more theoretical, since main its user is samba,
and as far as I can tell, samba should use exactly the same version of
ldb at runtime as it were compiled with.  In debian we do have this
requirement now, - maybe someday it can be lifted, I dunno.  But for
other libraries this might be more interesting.

Thanks,

/mjt

