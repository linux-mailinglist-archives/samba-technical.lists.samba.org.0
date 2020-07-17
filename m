Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDED0224623
	for <lists+samba-technical@lfdr.de>; Sat, 18 Jul 2020 00:05:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CJLozjRiPEwMdfOSh8GGdGxXcZ3f14AQ6DEnkY8oBFU=; b=31RU1XWkdTJKms5Pm3Zv+x60rd
	6k0Hbj/DtOX4eviy/B4NAzNHwiy0f47DGFJKnv4d7zRzsIXjDwWR/u5z3tQ7gl+hdm3rcSJ5aR45f
	tAHwYsqlfMsRogOJ0kD+BOmm3ccZccsoSAu2jEKcW/7/EtOyhuEYUsy0mQqaR3SHHu8nG1BBwOmF9
	fOTxSAlF9a0PpF/5lAPAGMhV9d4YZBQKMa7Aq4N6t7O9kCkulw55HhfcBy3BqVwK8hDUKSm2CEYeZ
	/FhdHE56vrfUN4z9C17qCyt9G1V9bf6wmkcU/LGthF+KAsIr5S8hACYJVdkLARIY3XgGRdW044JTx
	gpSt6eiQ==;
Received: from localhost ([::1]:21638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jwYTi-008Tzh-Ch; Fri, 17 Jul 2020 22:05:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42486) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwYTb-008TzV-4o; Fri, 17 Jul 2020 22:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CJLozjRiPEwMdfOSh8GGdGxXcZ3f14AQ6DEnkY8oBFU=; b=fhvrL9N/Lt/e7VDHz5K0cK+xc0
 s7rmFKQ7BDzc+63+JJ+jrzGFGl/mM9EKCu5jzFKWkEhM1ctAzNJTNzLmWpLiTvu/t1ibDJ2UaDkVK
 oE+3qoHLxmtt5jhmHeo3vZhKIsQvvVJRBWqlMZeS/QNWBtnOqcj1ls8ACgzyY6f2Z3x+9qbjx2OkF
 wnYgiElEZDlVMCVAbh/7jzVq3pxGhIDP5rd65Q3g51D35LTZCyVjREzA2aWFVtQq7FgX+6Y/JSMFI
 VN1GR+SkivAft72TfsQ1ipMZDQ9iJaiN2afL89d+5B5F/Wo0dkDXKMAZNI8qyX9SeReZYkwxqjvzG
 3ECzKTBcJI4MRTRvtNpw5LfeHMnIJWAVTdgLg2W/QiCmCmtSME8D42Xp3PEq/wWfZ1mFsUqLqpdqU
 s5KMAaUi0JFrt2j3uOxKYwvuUarSnYEj0vxCGdL6WGc/1EeapjtcZHT/DKWK6Ldcl4URnTIBEuyvd
 eUZi0Ypf8mhVdbaTmM0Lw0vb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwYTY-00060C-J7; Fri, 17 Jul 2020 22:05:04 +0000
Date: Fri, 17 Jul 2020 15:05:00 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Problematic port field in struct ip_service in Samba.
Message-ID: <20200717220500.GA22835@jeremy-acer>
References: <20200716222600.GC6574@jeremy-acer> <19699373.5neafNTYPK@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19699373.5neafNTYPK@magrathea>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: metze@samba.org, samba-technical@lists.samba.org,
 samba-team@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 17, 2020 at 07:58:38AM +0200, Andreas Schneider wrote:
> On Friday, 17 July 2020 00:26:00 CEST Jeremy Allison via samba-team wrote:
> > Hi Team & all interested parties,
> 
> Hi Jeremy,
> 
> > Eventually I'd like to replace all
> > uses of struct ip_service -> struct sockaddr_storage,
> > but that's a bigger cleanup for another
> > day.. :-).
> 
> we actually should replace this with `struct samba_sockaddr`
> to avoid strict aliasing issues!
> 
> See lib/util/util_net.h for `struct samba_sockaddr`
> 
> and
> 
> https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/master-strict-aliasing
> 
> I've just recently had to fix a crash on arm in nss_wrapper which was caused 
> by not following strict aliasing rules:
> 
> https://gitlab.com/cwrap/nss_wrapper/-/commit/
> 6ec14bb96f0e0447132472910657569f1188149b

Good point. But I'll move to struct sockaddr_storage first
- I already have that working with my test async DNS
resolver code:

https://gitlab.com/samba-team/devel/samba/-/commits/WIP-jra-resolve_ads_test

as that's what most of the calling code expects.

We can then move to struct samba_sockaddr in stages after.

Don't want to boil the ocean today, just heat up some
small pots and pans full :-).

