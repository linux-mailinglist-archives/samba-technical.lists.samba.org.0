Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223A2961B7
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 17:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=A8L6mlEwiov0GpRUQTjSh042Mw4Occ8KAooZ9V+o+yQ=; b=mUYyXxSbTMsQMQC0uPqa9RzVFp
	Miuvs7mQGoOTrLCqPqVPaAOz4aXju/jfsEpydfF35yymCs8lhfpJFTgNhFB+tNrZkFhNRjxbUCabo
	CEoPzCMCXow02z28mrjlAz5Rc1fgVEzOocnnkRdotbYhKsJRBUe8War9P2rfsuZCrTLqcipbPSck9
	7D2qyKfk+FuydjfrHatcHyLMVKPb6MGsNUpFbIslGvB5W6zBSDF703Tu+IIB35Vgh5tNEbmh6n0h6
	3OSvtOZBFLUAVm1vFwS4DzZLea8+agGzjNqMOiGRxRauESqm4gNxZdVBXviI7+fd2sQ6FDZb55Ttl
	3czMZNuQ==;
Received: from ip6-localhost ([::1]:61216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVccE-00DItI-B7; Thu, 22 Oct 2020 15:34:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVcc9-00DItB-6J
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 15:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=A8L6mlEwiov0GpRUQTjSh042Mw4Occ8KAooZ9V+o+yQ=; b=uywD7KK+G6T8yR7ZVuHG/pmGFO
 9PyxGH8Spjh9kGMRmqFhWem9CJP2V/g8R3VHTzGZtSUPZJEgO+Jps7YyXekDX48DlU6KLrdZiSxiZ
 8EnEq5gtdVOSbksjpoCjQEuIA2Tl8GLc54VhuV57aLOZqzuJb4+qYuYRGnJKEnaM2itAtz95OCgV1
 lMxrHFEBvV2Zqy2Yg83ipWfw//ERht1FvnhZ3jsFPDAT2yr3eJDycMcXIigOBVh0aAyn+wNvkQFYD
 lZgh8eDnjqGyjrkQSUT3jIu3651mC2OnFzi3gr9j47ZMClMuSnhbXxRgMsdyyapHuMWovkShugbwT
 mQ3mBlSB4huKXLDqJ06A/8B9oq3MeEmJ4l/Fy0OcURDiROWi5VfxesPFviRIdRBp+KPAegUO8waJY
 7K8GyBhs3yPOIePZI+fNjW3YCAPUAqkxh5qirhLgHZrCvFBfiNpU4b2cWrERilPI4OjbHMDukOiyF
 e7fn0TOAH0vGPwPjBv9VDCG4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVcc8-0003bV-2a; Thu, 22 Oct 2020 15:34:52 +0000
Date: Thu, 22 Oct 2020 08:34:49 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <20201022153449.GB941511@jeremy-acer>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
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
Cc: samba-technical@lists.samba.org,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 22, 2020 at 10:57:36AM +0200, Stefan Metzmacher wrote:
> 
> Maybe we could have a FLAG_FIXED_POOL, which avoids the fallback to head memory.
> 
> But I guess we'd need something implemented a bit differently,
> 
> Currently we're very bad at reusing free memory within pools, we don't maintain a free list.
> But that's ok for our two main use cases talloc_stackframe_pool()
> and talloc_pooled_object() for both our main goal is to avoid calling malloc/free more than needed.
> But they don't really implement a SLAB allocator.
> https://en.wikipedia.org/wiki/Slab_allocation
> 
> The Linux kernel has a separation of 'struct kmem_cache' and 'mempool_t', see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/slab.h
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/slab_def.h
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mempool.h
> 
> So there's 'mempool_t *mempool_create_slab_pool(int min_nr, struct kmem_cache *kc)'
> and 'mempool_t *mempool_create_kmalloc_pool(int min_nr, size_t size)', but that's all
> for fixed size objects.

I don't think we should mess with pools that much.

They're a specific optimization IMHO with restricted
use.

As I said in the previous email, my first goal is
to get rid of the talloc_memlimit stuff - that's
*horrible* added complexity for very little benefit.

Once that's gone adding FLAG_FIXED_POOL becomes
somewhat easier as there are then only 2 points
inside talloc we fall back to system malloc/realloc
if allocating from POOLMEM fails.

I don't think we should make pools a sub-allocator
with their own freelist. That's not really what
they are designed for.

Jeremy.

