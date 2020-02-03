Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED9150073
	for <lists+samba-technical@lfdr.de>; Mon,  3 Feb 2020 03:06:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=GZ54b9i1Dj7VdnO6ffYFzqcVL1iJTzbyQoFI5dRi4Sw=; b=MXnkHtlBzzHHLrycc8/dD29wu7
	aFQA8S0uKLarwKTd8ZCEbNyDPED4HZeQ5/FkUB+NKRcONrXT+8noXkpAAa6SOqTt91zoXPHOIyGA7
	wyMPB23DdOMhLLvMoroelhYI+qAiaHV9FPb02NfEzQMmjRpxk4TijpMtIPh1BbdXBPjm7K+uc8rNm
	4Y4Q9F9SZLIFxfIN8OuWXt2KyiqzxlGK61Cmt41+EHcPT0aBzr/O8rczVHNvmaNV5eYMfdSNjLr0w
	pgR+RkPiQqj0kqFaDUttXcwPvgC9eD9gVOwkVfqR31bcpfCYlVFoJOi2bcW0vTggI3YP1boHcw/F1
	PSfENflA==;
Received: from localhost ([::1]:27480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iyR75-007r1P-TY; Mon, 03 Feb 2020 02:05:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26880) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iyR6u-007r1I-8O
 for samba-technical@lists.samba.org; Mon, 03 Feb 2020 02:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=GZ54b9i1Dj7VdnO6ffYFzqcVL1iJTzbyQoFI5dRi4Sw=; b=1iwhXWtoJFC30kbDZgY5rYW0ji
 DZ7HuTIzsTY0LMWumrgd5KAFW1BJ6UsAiXre5A9xRLedff/hXWI3GoUuv89X3btjnGyKp9Ibrh3b+
 76ExV1Q6C68M84R8MvH3bqYQUcUjPHzkkTdT8q/mMRDEgLxnhJJuzRGckiqqJHgrnsiIGDIf3hqiy
 6Yeh0+Hrduj5vvLS1UXsh/h+N1uNb4vJKFPHvjfWdceZoQQc9o3UZi4NT3ypgoYz2zuZpgyMNgMGX
 soi+vzNVApMOpVcR7wnp2wTrISnPk2tmEgJ3a4KLf/U009mEA1PO5yyxVP1GCGAxlVgm2R8Gp7Ykm
 5ABQ3rbuAKnLI+sHJsLzT/vp9gywhqlhGbr7tTGH/SU8harWZlyHIKOkYUSF0H5PcAkMa/fbmXkYz
 ez4eJ/Lrn9BXm4h57vI8tbmsoR7MqioXMww/ywkAd++ePo0552WZ/kNVCBs1G+KcgkaJoeChj7O+X
 K4Auec4gg12IjfOlgkVsQDEL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iyR6r-0008GJ-Bq; Mon, 03 Feb 2020 02:05:10 +0000
Message-ID: <b86ac091440b67943a5178b03940ad1a9c543338.camel@samba.org>
Subject: Re: regshell.c: compiler uses -m32 as well as -m64
To: Rouven WEILER <Rouven_Weiler@gmx.net>
Date: Mon, 03 Feb 2020 15:05:05 +1300
In-Reply-To: <1AC2EC10-48DE-4EC6-B88F-0C7AAE6E7C60@gmx.net>
References: <F2128FA3-16EC-428F-8E37-447C96E99F90@gmx.net>
 <bfb0a2aed55e58e3f40822fd1bbc7815042a9a16.camel@samba.org>
 <1AC2EC10-48DE-4EC6-B88F-0C7AAE6E7C60@gmx.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-01-26 at 07:52 +0100, Rouven WEILER via samba-technical
wrote:
> The system is Openindiana which is based on Illumos. Frankly said it
> is the „gcc“ version of Solaris.
> Right now I just wanted to update to distro-package. Therefore, on e
> just needs to change the Makefile in the respective package build
> system.
> For an impression here a link: 
> https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/components/network/samba/Makefile
>  <
> https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/components/network/samba/Makefile
> >
> Using that build system I actually do not set the -m64 on my own, it
> it done in the background of the openindiana Makefiles. 
> If samba does set that also I cannot tell as I am not very familiar
> with waf.
> 
> Version 4.11.4 of samba worked very well in that build environment,
> version 4.11.5 throws a "READELF32 error" when linking
> "regshell.15.o“
> regshell has that compiler line I already sent containing a "-m64“ as
> well as a "-m32“ which does not seem correct and causing the linker
> error.
> So my main idea was to find out why there is this "-m32“ and probably
> kick it out.
> 
> Referring to ncurses: I do not see how this would harm the build.
> Could you give me some more background.

When we build against a system package we run a program on the system
to work out what compile flags to use.  

Those programs are ncurses5-config, ncurses6-config

My thought is that this flags is coming from that.  On my system this
is what I get:

$ ncurses5-config --cflags
-D_GNU_SOURCE -D_DEFAULT_SOURCE

If you get -m32 in there, then that is how it sneaks in.  We pass
unfiltered whatever is the output from ncurses-config --cflags along
just as we would (on my system) the 
"-D_GNU_SOURCE -D_DEFAULT_SOURCE"

when compiling the parts of Samba that #include the ncurses headers,
which would explain why only a single .o file is 32-bit.

You should also determine if ncurses is built as 32-bit on Openindiana.

I hope this helps you understand this a little better. 

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







