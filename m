Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A45290CB1
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 22:22:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4YJA3UAN3euIA5Foz8RmfiS1IwplCH6WOG0Jh9B+J14=; b=xA/o1nbfUlrGnTwR9lNgwybxWK
	OSj71QKKtL9QPUHoHFd9qtwkruJJ/WWYBo6MJE2YxHLfbpaKFANSHJWcejCvC1XzOGLUtP2tnnpiS
	DbeSYfvliuKV78AiIWh53SRFgdHEwxci8V8fcvrTtuKVQ6Zxve73rBcCP5BoeKIYOF3uToMUoT/hM
	ab7EqKxVcAZ6WRx8aWsZDIEccEMu1r0G9sNWbmbYlap2wZ5tjQv7glgXSujn8bWdi7lHRsgOq1Vfh
	UCVPYPYpRWxSIk7/FGBhIOhnpNGKRFWcdatpuDhuIfGn4mBc3v14hQhlg+CNIO/ZPEaVSZ/IMvatB
	26ExjcBA==;
Received: from ip6-localhost ([::1]:63642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTWEz-00CSLB-OM; Fri, 16 Oct 2020 20:22:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWEu-00CSL4-Qu
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 20:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4YJA3UAN3euIA5Foz8RmfiS1IwplCH6WOG0Jh9B+J14=; b=YeKy3kRoConO3asGBnCSEHOR8Z
 vZydzJ7twZRAm55PNjwyBw3ZVohojPIiCCiWzab5V9mApiiEakqQS2dTwF/bD6DBnOgI0kFr3WjPU
 iEntRX0aAfYo1hgL8zIi3Mycr0NNim3gyc/1oV+kKAaUAsg6RA2zE6BEK5UqqNnaSHTfGzXeYjZcV
 BOA7OV+yV7islSr5mQFGzCXDVT7bMlKH+AF50OoANtlxje8IpJ5YQX1PdYXVGpOk6Ibg583/63S7K
 X+cVl4Jmsua2ZuhbJj6nVo9FEwwGLaz55zHhBOmUaBeGOZiuUyJBEh7y+ZdHJFUTGFW2IojIqBS3V
 mRdwGzbMrNkXEli1Yn3jaT0cD2HvbZAbklT05cLMYVZcM4mIqpzQmtIe2YGJn1DKdzBvh3n0uPkPD
 yY8aDKyJ6Rs8VboB8Klp5H6/5G+I6fW4VVknFnIjDOSwcEscmygHLty0T0CYcHJ5t8fjil+8XuJVM
 oo790rxvb4bQJ2Pv94RG0MYO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWEt-0006Lz-94; Fri, 16 Oct 2020 20:22:12 +0000
Date: Fri, 16 Oct 2020 13:22:08 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016202208.GE67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
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

On Fri, Oct 16, 2020 at 02:51:39PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> > On Oct 16, 2020, at 2:44 PM, Jeremy Allison <jra@samba.org> wrote:
> > 
> > OK, looking at this more closely, I think this is
> > a fundemental misunderstanding of what a talloc_pool
> > is.
> > 
> > A talloc_pool() is pre-allocated memory, that can
> > then be further divided without having to call
> > into malloc.
> 
> Yes, we use them for slab allocation and for creating
> read only regions of memory with mprotect.  We have a
> special wrapper that ensures the first child allocated in the pool is page aligned.
> 
> When we do this, we don't want to allow allocations to
> occur outside of the pool so set a memlimit on the pool.
> I know this is a really weird use case, but it's ended up being quite a useful debugging tool.

To do that, allocate the pool as a child of
a talloc pointer, then set the memlimit on
the parent pointer to be the size of the
allocated pool.

What you're asking for is a feature enhancement,
not a bug-fix I think.

> > It's ALREADY allocated memory, so setting a memlimit size
> > smaller than the pool size makes no sense - once you've
> > done that all allocations should fail.
> 
> In addition to preventing allocations outside of the pool,
> It would still be useful to be able to apply limits to pools
> so that a pool passed into a function cannot be entirely
> consumed by allocations by that function. i.e. if you want to reserve some space in the pool.

Again, that's a feature enhancement - you want a
sub-pool allocator limit.

