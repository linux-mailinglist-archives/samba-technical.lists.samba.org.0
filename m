Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F103294247
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=Pv0Bz9hUyH3d7IhLe8s0D/nBAVKbfPVHRyXt9fFt5k4=; b=Nwv5Hs/G8xWdsvDjDoBpqN+sFz
	4SGwTw1h2cuqOjT5hktS/0cbdvZf/zmo53QQzTGmk/NZRfFYo0FbrDjuuhpBw/7qeEv44kbuy0bYq
	ID2lj0IHCF3aAMRWd2NqcPWjj2ajhbNz+ekgj1tmaGNS0sIDiwLAecchrxYGHGGgFkey/Aw/DePzO
	GtHVlRJTNCobjiYpJMTGeuScxSZ9XbON0gvLxhrkTfuX508wsDaTMpwmMbuk4Wj58k5PefTvNf0ab
	pNjevhM52B1wgSFX2hMlSfeNcg845qvIxN5LONZ52EY5X6w/Hcd9Edcn1eue83r24ifOvKht/LrKv
	ci1jsi5A==;
Received: from ip6-localhost ([::1]:20298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwaM-00CvrH-Ht; Tue, 20 Oct 2020 18:42:14 +0000
Received: from mail.networkradius.com ([62.210.147.122]:53189) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwaE-00Cvox-DQ
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:42:09 +0000
Received: from shinyhead.rga.ip (unknown [187.142.130.164])
 by mail.networkradius.com (Postfix) with ESMTPSA id DF46051F;
 Tue, 20 Oct 2020 18:42:02 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
In-Reply-To: <20201020183336.GB642265@jeremy-acer>
Date: Tue, 20 Oct 2020 13:42:00 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
References: <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer> <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
To: Jeremy Allison <jra@samba.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



> On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
> 
> On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
>> 
>> Then there's another issue with object_count ending
>> up off by one, which means talloc_free_children doesn't
>> actually return memory to the pool, and that messes up
>> some of the other tests I'm adding.  Just tracking down
>> when and why this happens now.... It might have been a
>> pre-existing issue and not related to this patch, I'm just
>> seeing it because of using talloc_free_children to reset
>> the pool between some tests.

Apologies, there was a steal I didn't spot in the tests.
One of the chunks was moved out of the pool into the root ctx.

Explicitly freeing the chunk or stealing it back into the pool
means talloc_free_children works as expected.

> Oh, I think that may be here:
> 
> 1894 #if ALWAYS_REALLOC
> 1895         if (pool_hdr) {
> 1896                 new_ptr = tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
> 1897                 pool_hdr->object_count--;
> 1898 
> 
> We don't reset pool_hdr->object_count on early return
> in this codepath.
> Are you setting ALWAYS_REALLOC==1 in your tests ?

I wasn't but that does look like a valid issue.  We'd end up with
with too few chunks in the allocation failed due to a memlimit.

> Not sure if this should be:
> 
> 1894 #if (ALWAYS_REALLOC != 0)

That would be consistent with the other check at 1841.

-Arran

