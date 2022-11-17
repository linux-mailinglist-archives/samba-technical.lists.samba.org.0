Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0262D058
	for <lists+samba-technical@lfdr.de>; Thu, 17 Nov 2022 02:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ggYwO0s9p6n6AAybfmUpfNfmnXJWgMdX/yhdeN9w0VU=; b=zqJplWzf0DR1vXPrp0yWgHi3DB
	tDJ9QtYMJ2oJAbTQrg7JR4avo9IrBu7njKJ0IPcc7LBinfBSCT0iZ1qx+iti5c5C4gIzcLNXKPPDr
	p2s4FJeLS7CwDc7vg/OZpsOwgGv+3/F/eI40UC58tvZR7xLHccTrb/VFYbwSnQ84k+W66r8Eyx6qb
	VXU3c78O306YHO6D9irsX73oAHWgF+oKNTyWi1QQFlnC3K80vm64OvOsXBbT4SG+FhEGao5awi1E7
	+8F7Ye1ckcP0HAotRW/vFe8UCnyLGxCVtjD2lgOUTVz5YWNyEa+ytu7c+GqGhEHnI599f2g40o0KK
	wTlm0P5w==;
Received: from ip6-localhost ([::1]:51274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ovTIZ-00Ec8H-3v; Thu, 17 Nov 2022 01:02:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ovTIT-00Ec88-Pf
 for samba-technical@lists.samba.org; Thu, 17 Nov 2022 01:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ggYwO0s9p6n6AAybfmUpfNfmnXJWgMdX/yhdeN9w0VU=; b=DusxpihvPhDSw0fNJJ6LJSuJbP
 NgV3wMKKzlza/Ru/TI+8vTKcxfHlmeFUl/5FIwyjNrFZu0DnwlYRG18YsE6gYRuvhGM1IjXvgZu0q
 i19uPEbwDCXB0XHalxcDfwK+BoUYOx21eHPk/GDUW4qQmGnvR/DsfHTpb5w/LrzXiCylawGQotOny
 EDBH4qy2NLS1y9XkiXuU+k24uA7NQy7jjxYHh9NK81v/A+iR/eJWQ44czaCX435zzhM56M6qqY5Up
 PUR5eSpqxbzva+WWvvzImsoIfICBUJ4WDIDCD24QMZmdGNzdJxp9IzXmYxNT6BKpgTLb4YvKPABo6
 OwP7/Ffp4g2WpQK5wXcEfQB6kXedm0/XWzqBMwk1buEwjZcHVUDp9QNDCXqo2UQPZHTTk1ZEEsSQC
 PJ5Om7M6EnA/YflPls9Ew7aexQuHtPkNBSA3pAyn6vM8Y9XHj1kvoc8vFdTj4rSBo3p4rmtSa8jXv
 Yjo7wWhwiTp+1C6VThNxVtrs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ovTIS-008yHw-8K; Thu, 17 Nov 2022 01:02:28 +0000
Message-ID: <c2802ea35aa48ada6a638c31ff19b7235845c268.camel@samba.org>
Subject: Can someone please build us a 32-bit Debian container image please?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 17 Nov 2022 14:02:25 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

https://github.com/docker-32bit/debian is GPLv3 and small, could
someone please adapt that into our bootstrap system and buildar and
have us build a Debian i686 image for our CI?

We might even be able to do less, provided we do two stages, one to get
enough for our normal bootstrap to run, and then proceed as normal.

We have had (eg 
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=974868) a number of
32 bit bugs, not just the recent PAC issue and we need CI and safe and
easily downloaded image we can use.

We are assuming that 32-bit userspace on a 64-bit host will be enough
for now, so no emulation is needed, just time setting up the image and
getting us past the samba-o3 build on it.

Uri:  You have been incredibly helpful with things like this before,
would you happen to have time?

Thanks,

Andrew
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source 
Solutions






