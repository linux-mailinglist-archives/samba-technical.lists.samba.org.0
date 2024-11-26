Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED79D9E8D
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 21:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QPBlQoAtbHEv2BpF1MEPkOSPZ/kJyjrNc+sUWgs/GLY=; b=3JIo56PwxDjdIA6X7R3s1ov9Ja
	qqAAOycnAkbHl43T11aPzln6gGgVr9uya65nffHQ2wjpmZta42+c9HVX5MLqdcqDf0l5wsGn/jZ44
	7p964a+R6jyLw73gEDA8vWwwgUl2lrU5JTJ0SNkD+z4kXjKsiuqTztuYDZeCiD9ZZpJqGrN0WSe0t
	9BBPBM/3bpxlMfxvPCNOuPxaWWuz1jR3iUgwqDFpCAQmnOP52L/yrf4Pp6nsHcDzdKqQ83iwJIgaf
	tBv0fOjcmZo0trs6AFVZxocwG27U2KUmLZe6RxRRQPefXTB9FFKVT1WPd0HymgIVxGlH5r7TNlFyS
	QBGYjX9g==;
Received: from ip6-localhost ([::1]:64314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tG2VL-000vLX-VL; Tue, 26 Nov 2024 20:49:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40314) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tG2VH-000vLQ-Hs
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 20:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5JJNb5YzrQ7VUwo1NiY3iRUlHfgthSHq93rtIQz5hbg=; b=2BxFdZB11aoqBtcVd71Np8up55
 mENZNswUw0qKSIDFdB19wc9ZqVg/6OjU1F0ioEaiIdYhtk3AxLbuNSD9nteUnZ6cwtEfgcnaULeNi
 gdObiiVM7fbyCV7V6C4NPL8n2Ej1h04+CZ3J4QQZjeyPTKFyt+Rb6rcbnJoyPbobHYI27diQ2D7UA
 HW9IIemjzYk5/kbIT7v+bKYvldhGdB9r+V5/aPYfGjUYTDbBmk7tRPqZx/hUrgWBchMn4vFv/OdsF
 9SDhyvN2GMgTfJLjSggg72fGCuvMfZWdSxLjDVEaklJvdW4at7FLzED2+VPh6TLJ3bageua8/TE+n
 33ST7s3eSmk7w5ScQ5hjXBG1tJ0HArz2TjsKzIa9ebqe5rrIHJRwEmfJhIinS3Eii7Tz24Kf+K4hI
 KaABCnJ5rsRN68koBqSDPMd1cVuRq9qWwpZ6VXIAHgAvy2M3Cwd0eGxfZ+mlobHgwYc9QSOWA5c/9
 6sKpFiOfco4Ll78E3Xt+y56t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tG2VG-001auH-0A; Tue, 26 Nov 2024 20:49:46 +0000
Message-ID: <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
Subject: Re: [debian] building bundled talloc/tevent/tdb libs out of main
 samba sources
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Wed, 27 Nov 2024 09:49:40 +1300
In-Reply-To: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2024-11-26 at 21:39 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> After a few times dealing with incompatibilities of older
> talloc/tevent/tdblibs with new samba and shipping stuff for debian
> backports and other olderdistributions, I decided to give it a try:
> to build these 3 bundled libs outof samba source, without using
> separate tarballs (which also lacks githistory).
> The result is rather simple, speaking for the packaging it's
> available at
> https://salsa.debian.org/samba-team/samba/-/merge_requests/64 - 3
> commitsimporting packaging for tdb, tevent and talloc libs, one by
> one.

I support this idea.

Rather than needing to patch the wscript files, have you tried:

--private-library=!tdb
My intention (but I didn't do any testing with the other libraries) was
to try and have this as generic as possible, pulling any library in or
out if needed, with only the default position being encoded in the
source, to help with this kind of thing.

I'm not in a position to follow up on the review, but a patch that
allowed this if it didn't just work I hope would be considered
positively upstream.
> The only downsides of this are 2:
> 1. this is not supported by samba upstream directly (I had to
> patch    lib/{talloc,tevent,tdb}/wscript a little bit)
> 2. these 3 bundled libs will be recompiled more often than
> it's    actually needed, since they don't change with every
> samba    release, and especially with every samba packaging release.
> But speaking of maintaining this stuff, and (re)building for
> olderdistributions, this is definitely a significant simplification.

I totally agree.
> Speaking of the resulting binary packages, - nothing really
> changed,the set of packages is the same as before, with the same
> versions,except packages for the bundled libs has got an extra
> version suffixafter samba source version, just like ldb subpackages.
> I don't plan to make these to be "internal to samba" in any way,
> thebinary packages remains independent from samba.  But since
> theirdevelopment happens within the samba source, I see no good
> reasonto package them separately.  If upstream chooses to split them
> intoits own source repositories, we can easily resurrect the
> separatesource packages.

I don't think this is likely.  All the maintenance of these things
happens in Samba, for Samba.
> I remember the samba team had its own view on how packaging should
> bedone downstream, so I thought I'd ask before pushing this.

Thanks for checking.  It is useful to know what folks want from us for
packaging, and to be able to provide input on strategy. 
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
