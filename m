Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAE79977A
	for <lists+samba-technical@lfdr.de>; Sat,  9 Sep 2023 12:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SdCv1TIwDQWm7ycWDGZKfHN7qgVSred5gFeJdM5UUkQ=; b=Nc3zdANjFuect/2BS1GCFVpq2g
	GDjTTLZFF0yDUmSpYCOgt85thIBXUREA12iGYV1dRfc4OB0E41WTnvSj5NcMhFe2IAp98IlT/R7GP
	Ee6L4MOhi607AIQ1IZGgLAhYd8LEFCnwYGtNNHLP7vS/xrSBgx4hifEyGMrOD12Zc0hdg/7wbxk5r
	ByvRIcxqoSM+oO+tPaPXHJ3kCmRGiLT0mvlaWQT80O1Ia5jRgWVO3LrmqHuRRjC5a8LivDnJbI69/
	JQas1qsO7M8zzXI8RzDC86Oayfl6ZuW6hSFPmajzi7rQlls4B98BufYmOhkEWbuSK9rlluyecK/Ol
	qk85j83Q==;
Received: from ip6-localhost ([::1]:41314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qeveK-002NuL-Pu; Sat, 09 Sep 2023 10:57:12 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42425) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qeveF-002Ntx-6d
 for samba-technical@lists.samba.org; Sat, 09 Sep 2023 10:57:10 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7E60620503
 for <samba-technical@lists.samba.org>; Sat,  9 Sep 2023 13:57:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id AC01F26D1D
 for <samba-technical@lists.samba.org>; Sat,  9 Sep 2023 13:57:02 +0300 (MSK)
Message-ID: <57ba45df-732e-2449-1b83-c198e7c0a81d@tls.msk.ru>
Date: Sat, 9 Sep 2023 13:57:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: why does samba build system versions all public-lib symbols?
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

I grumbled on this list before about ABI symbol versioning in samba public libs
already.  Here comes a question, finally: why?

Most often this becomes problematic when back-porting some symbol changes
(usually newly added symbols) from current "mainline" branch to previous
branches, sometimes multiple.

For example, ldb 2.8.0 introduced ldb_msg_add_distinguished_name() and a
few others, while trying to fix an issue.  Current samba (4.19) uses this
symbol.  When built against current ldb 2.8.0, this symbol will be tied
to version 2.8.0.  Okay, so far so good.

This same symbol has been back-ported to previous ldb release, introduced
in 2.7.2 version, and is used by samba 4.18.1.  So when samba 4.18.1+ is
built against ldb-2.7.2 which comes with it, it will be linked to
ldb_msg_add_distinguished_name@LDB_2.7.2, instead of
ldb_msg_add_distinguished_name@LDB_2.8.0, despite the fact this is exactly
the same function.

So when I have, say, samba 4.18.4 installed, I can not upgrade ldb to
version 2.8.0, since this will break samba due to missing symbol of
version 2.7.2.

But it is more: the same symbol ldb_msg_add_distinguished_name has been
back-ported to samba 4.17 too, which comes with ldb-2.6.2.  And there,
it is named ldb_msg_add_distinguished_name@LDB_2.6.2 instead.  Which is
3rd name of the SAME symbol.  And I can't update libldb from 2.6.2 to
neither 2.7.2 nor 2.8.0, since this will obviously break samba.

Right now I have ldb-2.8.0 in debian, with ldb_msg_add_distinguished_name@LDB_2.8.0,
and samba 4.19.0 linked to it.  I can't re-build ldb with added sigs file
from version 2.7.2 or 2.6.2 without recompiling all deps.  So I'm, once
again, in a catch-22 situation, to decide which part to break.

Even if these symbols are only used by samba itself, - based on which I
can have strong versioned (=binary:Version) dependency between samba and
ldb packages, - this is possible because both are now built from the same
source, - but these symbols are still part of public ABI, and other software
*might* (start) using these symbols, and will be broken by each samba
upgrade.

So the question is: why to mark symbols with versions at all, why can't
these be unversioned like almost all other software does?  What good
such versioning serves?

I looked at the build system, - buildtools/wafsamba/samba_abi.py - where
it generates the ld script file. I'm about to drop the whole thing in
there for debian and use manually crafted symbols vile instead, to fix
this whole issue.  But even there I'll have to perform some sort of
transition from versioned to unversioned, or somesuch..

Thanks,

/mjt

