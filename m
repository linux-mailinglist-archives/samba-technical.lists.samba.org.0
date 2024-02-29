Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DF86D645
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 22:39:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Vi+ts8FFE+CV2qlVCBRDNZPSavMmtzhuC4ByFuU1dyY=; b=gNNm7lzViLLV1uodYEJMMUg88E
	foQGumFCo00cq2+lgEr3GiX5DS8zOx2G2OzIsjg6E5krKhe1RRHy9EyvsdhGjkZCpu3wHTBBM6Qrc
	6r9bFUz0I3ZXyOO+30kqfaITTmLsTl0KS7c11kk2p4F0skrYY35/vohRaAnshZ93zkC23XWPRscqs
	Wqzb4pHonccX7Z/Q4CVhBgto7RpGS4rR5hg/S4Hy1GvbXpLPzp4zCRuVW/8Tll6w8fUgqFgB4enCn
	vxOaqAQFh+hwbcixmR0ua5qAN8B6EgI8WxG/ozSrya82X0aWf2TselWtGjQtB2MBn3rU3PWp9KiEm
	uisZnTzA==;
Received: from ip6-localhost ([::1]:34252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfo80-009kGs-62; Thu, 29 Feb 2024 21:39:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29624) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfo7w-009kGl-2g
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 21:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=8Bf8qa3Bjqt7FgkQYRoGg8EO2gZYVZrg7e0pFmMggBg=; b=CSGbBWCJcaEVU7oT3vPxIZTMe8
 X9UGuMNz37yM0t9frzJviTc1vZILm1M14OscIYzZRqY3r56giSr3Edo9weucvuPpOH7Vd5cIOXzHt
 PpcJi36ZMajeN2PVv+oxX0+gAn7/ncfEATcjnlBwEanMeC4gt0fSvYtyJaar9xkS+ERDBzxGA7MQK
 88jsfWjt9JrgzXdvkoKYYhrOLpe2n3XFTFI7u0OXf+HBDzAOUvsQMC8oo2Fy9jjPd4jn9CbdKZlxK
 D0UJZWewFamkLrtNqurS7uWpeXUvJFM5r+Jygl/Jrp6UBeeyvtpUu24I+wPAurnc52KVlicYETvK7
 VzLQSsORR2H8ykJhPLa6HlIxCxVlih3PohuqgNpk/fNW7uSPqDpBVA4sk+4rzCl1DRTkTMVLyzs0I
 1VFy0ZsgyD4YqYut0abcEwM9QfgyeW86jfMz44Fb2VcD5hox41LNCv8ANQjzrJn0HzAIZHFbM30oj
 z8Jm1A3hOT70s/LoHm/ZGgY7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfo7u-00FVbK-1O; Thu, 29 Feb 2024 21:39:39 +0000
Message-ID: <741d1eaff17826e83259005d75db43c6b400282e.camel@samba.org>
Subject: Re: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 01 Mar 2024 10:39:35 +1300
In-Reply-To: <26313942.1r3eYUQgxm@magrathea>
References: <2223722.hkbZ0PkbqX@magrathea>
 <975d227206d53fe93ef5cb5a3561f5363eae1832.camel@samba.org>
 <26313942.1r3eYUQgxm@magrathea>
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

On Thu, 2024-02-29 at 22:31 +0100, Andreas Schneider wrote:
> On Thursday, 29 February 2024 21:19:52 CET Andrew Bartlett via samba-
> technical wrote:
> > On Thu, 2024-02-29 at 16:36 +0100, Andreas Schneider via samba-
> > technical wrote:
> > > Hi,my colleagues discovered a performance issue in libldb:
> > > https://bugzilla.samba.org/show_bug.cgi?id=15590
> > > 
> > > As soon as you use indexes, ldbadd will be magnitudes slower than
> > > itwas before.Could some ldb expert please look into it?
> > 
> > Your subject says a regression.  What version is this a
> > regressionagainst?
> 
> Isn't that obvious from the bug report?
> Here is the short summary:
> $ bash repro.sh 20000 indexesAdded 2 records successfullyAdded 20000
> records successfully
> On Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times
> slower)
> 
> > The very nature of a DB index is that it will take time to
> > create,possibly a lot of time, but should make reads faster.
> 
> Either the DB index doesn't work at all in Samba 4.10 or there is a
> huge performance problem in Samba 4.19. What is it?

Thanks, that wasn't written as obviously on the bug, thanks for the
clarification. 
I will follow up on the bug. 
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



