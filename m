Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14885290C5B
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=l8nxEwe694EUAGDzxXKPIFKyQ9HfRBUfOEbeaU8g4yE=; b=AfUpo/n0iO0UvRQy4QI4Mi6ELM
	MWuyNb/U2bltNW+GiZX3Ciy4ztSsKEMPnS38Lg1uSN6ilhRPzuLaAYqYRQ9ZkJhH5Wtt34XD1WIgO
	SfbLTQzpHEMMHi+bpBlDIU3kpKWp7uqBKjH6WB7DTB2m/GTXXs756MWhciY5VuSFXh54N8f+YkLwm
	jN7xKjSdNHBao9mGSioeNgW23/mTL2oZd6EPOvLb+gL1/T0sDF8lCUIz5wBf4WKc6O9qdCCK9kWM0
	p0M257GS8G2HmHqKyriMpjfAXUwS3eWZO6LB1YFcXfLDa14Vd0aVKS9IAayqhUWQuA029PqpuAsic
	LVY7gLLA==;
Received: from ip6-localhost ([::1]:57032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVXB-00CRNl-L2; Fri, 16 Oct 2020 19:37:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVX7-00CRNe-0W
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=l8nxEwe694EUAGDzxXKPIFKyQ9HfRBUfOEbeaU8g4yE=; b=IuD/NE9+qfjI/eteMd7Xqy7cqy
 aMl6ZgoQp3QtBgYvlUA0a4/fLePNYijQhX2bCZZbh7muAAblvwgkAiHI99D2bLdyTF9pWd7R9ZxQH
 fo8SzO42i78pLKYaW9ObShJnPmRCU+2CRw8eeBFBzzWAWpDTaVLmxfbZ2duh2dZhGL9hp3BBtlAOc
 7ACcmvhq98RRRJaPJll02helFPiy1uXYDfS3p7K+iNH4b5gHJ5057B6mN/KFw+jguuKCfoTE3fNdo
 /cytjwNo92J8kIpNmgzbmbcHcdiEw+n3m0Xr8rHDR0B6+TZe4UP4ZDflwKT02L20ILQXddEs0PRb4
 /covY+ewhu6LbI7m+e28BX+kxil8rhx/Um/IYOFjzDZP3OadkTvBPjQLP3/vvdM2k2NisxU0JDvMM
 PrV8TUQ3hlmapaCtM+VGnKOgQUTI2wElQBuR8kbNbG4BKAdxs7QM28df43rBoWgeMe8bU9RH+f8sV
 uw5VPneoLn74HF63/OqLzjVs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVX6-00060s-B3; Fri, 16 Oct 2020 19:36:56 +0000
Date: Fri, 16 Oct 2020 12:36:53 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016193653.GB67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> Apologies if this is a repost.  The original message didn't make it into the archives, so I'm assuming it also didn't make it to mailing list subscribers.
> 
> First I'd like to thank the contributors to the Samba project.  We've been using talloc since ~2013 and it has made an immeasurably large contribution to code clarity and the general stability of FreeRADIUS.
> 
> -
> 
> Reviewing the talloc code shows provisions (and test cases) for applying memlimits to pools, unfortunately in practice, memlimit functionality on pools seems fairly broken.
> 
> 1. Calling talloc_set_memlimit on a pool results in a limit structure being created with limit->cur_size being set to the size of the pool + chunk header + pool header.  This seems to effectively mark the entire pool as already in use.

As suspected, this one is on me :-(.

commit 4159a78ed7eda340758e22286f16186987a20f2f
Author: Jeremy Allison <jra@samba.org>
Date:   Tue Aug 27 12:46:09 2013 -0700

    Change _talloc_total_mem_internal() to ignore memory allocated from a pool when calculating limit size.
    
    We must only count normal tallocs, or a talloc pool itself.
    
    Signed-off-by: Jeremy Allison <jra@samba.org>
    Reviewed-by: Simo Sorce <idra@samba.org>

diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
index 7b827ca0c15..1e25dfde4e1 100644
--- a/lib/talloc/talloc.c
+++ b/lib/talloc/talloc.c
@@ -1817,7 +1817,14 @@ static size_t _talloc_total_mem_internal(const void *ptr,
                break;
        case TOTAL_MEM_LIMIT:
                if (likely(tc->name != TALLOC_MAGIC_REFERENCE)) {
-                       total = tc->size + TC_HDR_SIZE;
+                       /*
+                        * Don't count memory allocated from a pool
+                        * when calculating limits. Only count the
+                        * pool itself.
+                        */
+                       if (!(tc->flags & TALLOC_FLAG_POOLMEM)) {
+                               total = tc->size + TC_HDR_SIZE;
+                       }
                }

I'm not sure talloc_set_memlimit() should actually *work*
when applied to a pool pointer. Maybe we should just
return an error ?

