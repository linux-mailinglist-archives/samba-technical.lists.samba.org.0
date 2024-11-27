Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5749DA1A6
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 06:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uhpQZ8ovsGVnEgxbTAgdMNnRHJDx2df+j/dMbLTdYRs=; b=NdbvhY/kCqhQcDW6mr5MTnmeV+
	I7kmujFuiW4VNBxcEXyOMOwoU+WoM8Wx2rOV/6Iccput7g9Mph0bv650tf4E/yxGyEgtY0sGfPfoD
	KRNlY31i+rwn4Yzn12srum2aSGow9jB/QXmNm65xoscA27cYiiAfL2Ros0ciDUyWa6qzWgatGDYau
	I/1mNOyuYvSd57dE/mixw++7DAavWSxoiMknnWurWfAhuKujNhLsmlFiMO0kE+4EJ95vvqIKdnefP
	Yn70in9xqjW/yPbRyDV2z+wVCu7CYEeqg39ycQ1d1F323v+szn6/ZMq2lqrkE2548hhuJKPV9Mpxe
	Y1joJqaw==;
Received: from ip6-localhost ([::1]:63010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGALi-000we3-4m; Wed, 27 Nov 2024 05:12:26 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:53415) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGALe-000wdw-4E
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 05:12:24 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A89B6B5240;
 Wed, 27 Nov 2024 08:12:01 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 18ECE17AFA3;
 Wed, 27 Nov 2024 08:12:18 +0300 (MSK)
Message-ID: <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
Date: Wed, 27 Nov 2024 08:12:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [debian] building bundled talloc/tevent/tdb libs out of main
 samba sources
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
Content-Language: en-US, ru-RU
In-Reply-To: <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
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

26.11.2024 23:49, Andrew Bartlett via samba-technical wrote:
> On Tue, 2024-11-26 at 21:39 +0300, Michael Tokarev via samba-technical
> wrote:
>> Hi!
>> After a few times dealing with incompatibilities of older
>> talloc/tevent/tdblibs with new samba and shipping stuff for debian
>> backports and other olderdistributions, I decided to give it a try:
>> to build these 3 bundled libs outof samba source, without using
>> separate tarballs (which also lacks githistory).
>> The result is rather simple, speaking for the packaging it's
>> available at
>> https://salsa.debian.org/samba-team/samba/-/merge_requests/64 - 3
>> commitsimporting packaging for tdb, tevent and talloc libs, one by
>> one.
> 
> I support this idea.
> 
> Rather than needing to patch the wscript files, have you tried:
> 
> --private-library=!tdb
> My intention (but I didn't do any testing with the other libraries) was
> to try and have this as generic as possible, pulling any library in or
> out if needed, with only the default position being encoded in the
> source, to help with this kind of thing.

Unfortunately this option does nothing for this kind of libraries.
This is exactly why we had to patch ldb in debian before (when
switched to building ldb from samba sources), in exactly the same
way as I'm patching tdb/etc now.  And this is exactly what you
did with ldb too, in de1ab855ee2 "lib/ldb: Always build standalone".

Without patching lib/tdb/wscript, it is always built as libsamba-private-tdb.so,
with no headers installed.

Please note that currently, --private-libraries=!ldb does exactly
nothing to the result - ldb is built as a regular public samba library,
by default already. --private-libraries=ldb however, disables this
"publicity", and builds ldb as libprivate-samba-ldb.so (with no ldb.h
installed), - it looks like 4.21.0 WHATSNEWS.txt entry about !ldb is
wrong.

> I'm not in a position to follow up on the review, but a patch that
> allowed this if it didn't just work I hope would be considered
> positively upstream.

We had this patch to make ldb stand-alone for some years in debian,
it were written before my time, by Mathieu Parent in 2021 in his
draft series to build ldb from samba sources (which I used as a
base for this work later).

I see nothing "uneasy" about patching this place a bit for tdb/etc,
it's rather stright-forward, but since whole samba build system is
rather complex, it's more difficult to do within samba.


But my attempt were unsuccessful so far, as it turned out.

Once I arrange to build all 3 libs out of samba, the build system
suddenly stops embedding rpath-private into all binaries, so the
resulting thing, while having the same set of files, actually does
not work, - not finding samba private libraries in libdir/samba.
I'm investigating it now, - but again, the build system is just too
complex and very difficult to debug, so it might take some time.
It's something I didn't expect at all, as all other changes are
rather simple.

Thanks,

/mjt

