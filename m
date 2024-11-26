Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DE9D9DC4
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 20:04:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=sdLktAuf/RUyi51TXoyFK8GCDXDx27So/Tfj9wZCLow=; b=1V0aAZcvrTHBbTYGs8J6/t8zjD
	I69+kgsOQGrcL4IYcLHv+YrStCuFMN/OXk5ZUBHbAbZonolu/S3ccpXNKf0yM+6ftWh6Q0edq8pP9
	OHIugeVoQWcWt4Yk1ttabOX8q/rcqYsNi3OQA/TMQNUUypze5X7+EYiW04/nSG7qdLwJH4Pe9hdL6
	iuWud+ot5x/75coNSx0IW/fQy2+R5/Xna1rApDmU+T8G3+BE8SUAg0XCnCmPmf+XvDecdhRliGIbZ
	FM1cQQlFjxMVGjGxESade1tt+m3GSMYCKyCTi+X4ILjZ+DX/DqPv2LJjCPxMvJAOGhE9syceRbMp6
	XvFDAJ4w==;
Received: from ip6-localhost ([::1]:37006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tG0r8-000v2k-8w; Tue, 26 Nov 2024 19:04:14 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:39295) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tG0r0-000v2d-A4
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 19:04:11 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id CF54DB499E
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2024 21:38:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0274717A24C
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2024 21:39:12 +0300 (MSK)
Message-ID: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
Date: Tue, 26 Nov 2024 21:39:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ru-RU
To: samba-technical@lists.samba.org
Subject: [debian] building bundled talloc/tevent/tdb libs out of main samba
 sources
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

Hi!

After a few times dealing with incompatibilities of older talloc/tevent/tdb
libs with new samba and shipping stuff for debian backports and other older
distributions, I decided to give it a try: to build these 3 bundled libs out
of samba source, without using separate tarballs (which also lacks git
history).

The result is rather simple, speaking for the packaging it's available at
https://salsa.debian.org/samba-team/samba/-/merge_requests/64 - 3 commits
importing packaging for tdb, tevent and talloc libs, one by one.

The only downsides of this are 2:

1. this is not supported by samba upstream directly (I had to patch
    lib/{talloc,tevent,tdb}/wscript a little bit)

2. these 3 bundled libs will be recompiled more often than it's
    actually needed, since they don't change with every samba
    release, and especially with every samba packaging release.

But speaking of maintaining this stuff, and (re)building for older
distributions, this is definitely a significant simplification.

Speaking of the resulting binary packages, - nothing really changed,
the set of packages is the same as before, with the same versions,
except packages for the bundled libs has got an extra version suffix
after samba source version, just like ldb subpackages.

I don't plan to make these to be "internal to samba" in any way, the
binary packages remains independent from samba.  But since their
development happens within the samba source, I see no good reason
to package them separately.  If upstream chooses to split them into
its own source repositories, we can easily resurrect the separate
source packages.

I remember the samba team had its own view on how packaging should be
done downstream, so I thought I'd ask before pushing this.

What do you think?

Thanks,

/mjt

