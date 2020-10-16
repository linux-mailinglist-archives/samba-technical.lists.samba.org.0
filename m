Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA78290C5F
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=R+F6AWP17pxuALXIzGxLz+LiRLsBxCtcLBCWZ5ZsY5s=; b=QqGPgUS7rter3x3jNOc/FhW/io
	LViO+EJiNKKFh3IvWWjz6kdO0ZyHVzL/pTI+9Y25WG5SMPl2wqEHbdq3w2Rbx3fNFpYOUtMKCopHI
	mGkzOZvu5MAkWJU4NuRdP0JUUmzhy9h0wW3koixQOAMzASOmjJCqquxni8BCwE0fg/hEfYwCRCbaJ
	A8VZUgMggUqMZOd9vQsgQpngaoOX6Gyam7cTtxXmWNk+pAFEz5rdReex4Dxeuc1QY//9xHdFKxyQz
	YzQQEXQ2OkmT0oRteGBWwX7aKEDrSzGg/pMSA+Z5INZo3n0RaHxZSGTOfSyDWl8/h4cQwy3DFOXzH
	TpB2pTGQ==;
Received: from ip6-localhost ([::1]:57744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVb5-00CRTx-8f; Fri, 16 Oct 2020 19:41:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVb0-00CRTq-KS
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=R+F6AWP17pxuALXIzGxLz+LiRLsBxCtcLBCWZ5ZsY5s=; b=ixfUtXQ+1rlYnFC+Ym7uDjXRrW
 AtfJKDBhUQMFM+iwG+0VS9XGBCkFycwQlhamwYlYeVEJHR925KudiY8Xh9k7LYC4f4qCK6awZtGQU
 tS51cSjX8Bg3zU43FeU6iHU4EuKAWEKWuDgRqiVY/sDWRZO1zX4SCOFFnyQc7rzFwX2UxhsgDm7gc
 28rtuokun3bUdAYSfXRjQIKIfEVmGJZF6C1erYgIJ6fvyUdIVF0GqgcwCQ4vP2FwxkH7F4lHH5ZxW
 CTO60dQKZidJokLCXDH79lu3RyQ1tm9fhI0EQkQVj/EszjsaDDXlZhOB89xE9VHYxDonm0wol7rYg
 NCA6kp98cAGEhdIoU3QAtm2UJScrvIbW796LNpXe0h4jZH+iknI92F4BZd2u+FA4akrxm63w8LuFL
 4NlRAUCEK1Sy7EG/wW9DkxKjeEigvDldWS1gMsVlcF92sudxtJpm9MdqI2PWhfRM7rMh3kytziqqJ
 lb0gKTOgdHXJPEEXYPquqtaB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVaz-00063F-RO; Fri, 16 Oct 2020 19:40:58 +0000
Date: Fri, 16 Oct 2020 12:40:55 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>,
 samba-technical@lists.samba.org
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016194055.GC67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016193653.GB67086@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016193653.GB67086@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 12:36:53PM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, Oct 16, 2020 at 01:59:11PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> > Apologies if this is a repost.  The original message didn't make it into the archives, so I'm assuming it also didn't make it to mailing list subscribers.
> > 
> > First I'd like to thank the contributors to the Samba project.  We've been using talloc since ~2013 and it has made an immeasurably large contribution to code clarity and the general stability of FreeRADIUS.
> > 
> > -
> > 
> > Reviewing the talloc code shows provisions (and test cases) for applying memlimits to pools, unfortunately in practice, memlimit functionality on pools seems fairly broken.
> > 
> > 1. Calling talloc_set_memlimit on a pool results in a limit structure being created with limit->cur_size being set to the size of the pool + chunk header + pool header.  This seems to effectively mark the entire pool as already in use.
> 
> As suspected, this one is on me :-(.
> 
> commit 4159a78ed7eda340758e22286f16186987a20f2f
> Author: Jeremy Allison <jra@samba.org>
> Date:   Tue Aug 27 12:46:09 2013 -0700
> 
>     Change _talloc_total_mem_internal() to ignore memory allocated from a pool when calculating limit size.
>     
>     We must only count normal tallocs, or a talloc pool itself.
>     
>     Signed-off-by: Jeremy Allison <jra@samba.org>
>     Reviewed-by: Simo Sorce <idra@samba.org>
> 
> diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
> index 7b827ca0c15..1e25dfde4e1 100644
> --- a/lib/talloc/talloc.c
> +++ b/lib/talloc/talloc.c
> @@ -1817,7 +1817,14 @@ static size_t _talloc_total_mem_internal(const void *ptr,
>                 break;
>         case TOTAL_MEM_LIMIT:
>                 if (likely(tc->name != TALLOC_MAGIC_REFERENCE)) {
> -                       total = tc->size + TC_HDR_SIZE;
> +                       /*
> +                        * Don't count memory allocated from a pool
> +                        * when calculating limits. Only count the
> +                        * pool itself.
> +                        */
> +                       if (!(tc->flags & TALLOC_FLAG_POOLMEM)) {
> +                               total = tc->size + TC_HDR_SIZE;
> +                       }
>                 }
> 
> I'm not sure talloc_set_memlimit() should actually *work*
> when applied to a pool pointer. Maybe we should just
> return an error ?

OK, looking at the tests - here seem to be the semantics
of talloc_set_memlimit() on pools:

        /* Test memlimits with pools. */
        pool = talloc_pool(NULL, 10*1024);
        torture_assert("memlimit", pool != NULL,
                "failed: alloc should not fail due to memory limit\n");
        talloc_set_memlimit(pool, 10*1024);
        for (i = 0; i < 9; i++) {
                l1 = talloc_size(pool, 1024);
                torture_assert("memlimit", l1 != NULL,
                        "failed: alloc should not fail due to memory limit\n");
        }
        /* The next alloc should fail. */
        l2 = talloc_size(pool, 1024);
        torture_assert("memlimit", l2 == NULL,
                        "failed: alloc should fail due to memory limit\n");

        /* Moving one of the children shouldn't change the limit,
           as it's still inside the pool. */
        root = talloc_new(NULL);
        talloc_steal(root, l1);
        l2 = talloc_size(pool, 1024);
        torture_assert("memlimit", l2 == NULL,
                        "failed: alloc should fail due to memory limit\n");

        talloc_free(pool);
        talloc_free(root);

A pool counts as already allocated memory, so setting
limit->cur_size to the size of the pool seems correct to
me.

