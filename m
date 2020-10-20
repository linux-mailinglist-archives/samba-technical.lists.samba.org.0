Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C22942AA
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 21:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sRNG5ALh/YcDUo3TIdVne78ibQKRanC1TikubyQ1vyY=; b=bmKzTjdj5p5cX6ywp0ZkhdsGdy
	yZosz6RYMqbdW7QVfkt4aprRmCJ6+1MzvRVaVd/KPgRu7VDVNQP5xaz7IyNRPcMD3WvLVokbHx1CB
	wyOcYDO9bRcsYaQiaIu1TfbefBTLvxTWVz7/HPpi+1GifQND7f51EZgNDXainJB8t+iJsHjNgc8dw
	DoqmpJy0EtNCpXAbijXyJI6PPD4kCCH33Hj+TAY8mqaF0UzLk5lmE/hGmOzoaCmYJ7Cz2mgoLjvTs
	EKKtj3Qn1sqHXBjnAqH6JDlpYB/kEiPi/NQoIA8AeKTLtM0aF59QQZlpxTicc/4Np0hKjJHoaziPt
	66jhXyVQ==;
Received: from ip6-localhost ([::1]:24368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwtU-00CwQg-At; Tue, 20 Oct 2020 19:02:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwtP-00CwQY-8P
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 19:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=sRNG5ALh/YcDUo3TIdVne78ibQKRanC1TikubyQ1vyY=; b=1RvMZ4rQODLCrA+adV0P7RhdbG
 Mwt/UILx/5bujDuAtsev1l3kELXhvBHBcT+6195ZYfCet59Y6au1pvXoJpj4vJjGIHrqTLkVtSl9C
 l2HmdpIwfEmzSXWPs8qUqLleppKXNnvoCwg62qvhq8EDaSr1mRqzc4ASVFukZFnqZ6QRm1MWao0Ok
 9pJYu5Le8HZKfXZ5P+b/URsbGPbYM76yUH3tCaHFg/k9C7BjQ53MusmNBqdBGY++Tmna1O2VTgyaL
 ojpjxAR/Zp/u3grt4ekpnUgu367GmbV+O8y0rw6gav7r54NoE0WbrfCl5UAQrdreDiwQFXcEuj5BK
 pto/ae/H+I3X2HBrJwHimFb4/0us7o+7+6h0vqEJ7q3NUup0zhQM8MNXk4wm2ns26+sCNbJ5RHGwW
 lgIH9ze5Qrdn5MYGM6c54+EOhpL69y7HAHkjn1WMsCvkXvV1rfvT2pC/Lmk3ewZoKdoW4j1l8bGrI
 aR1+yLcssKUI8+rztWHf0HCf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwtO-0003cm-B0; Tue, 20 Oct 2020 19:01:54 +0000
Date: Tue, 20 Oct 2020 12:01:51 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020190151.GE642265@jeremy-acer>
References: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
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

On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
> 
> 
> > On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
> > 
> > On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> >> 
> >> Then there's another issue with object_count ending
> >> up off by one, which means talloc_free_children doesn't
> >> actually return memory to the pool, and that messes up
> >> some of the other tests I'm adding.  Just tracking down
> >> when and why this happens now.... It might have been a
> >> pre-existing issue and not related to this patch, I'm just
> >> seeing it because of using talloc_free_children to reset
> >> the pool between some tests.
> 
> Apologies, there was a steal I didn't spot in the tests.
> One of the chunks was moved out of the pool into the root ctx.
> 
> Explicitly freeing the chunk or stealing it back into the pool
> means talloc_free_children works as expected.
> 
> > Oh, I think that may be here:
> > 
> > 1894 #if ALWAYS_REALLOC
> > 1895         if (pool_hdr) {
> > 1896                 new_ptr = tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
> > 1897                 pool_hdr->object_count--;
> > 1898 
> > 
> > We don't reset pool_hdr->object_count on early return
> > in this codepath.
> > Are you setting ALWAYS_REALLOC==1 in your tests ?
> 
> I wasn't but that does look like a valid issue.  We'd end up with
> with too few chunks in the allocation failed due to a memlimit.

Yes, for that codepath we need to move the:

1897                 pool_hdr->object_count--;

to the point where we know we're returning a
valid new object and we've successfully done
the memcpy. But that's a different bugfix
I think.

> > Not sure if this should be:
> > 
> > 1894 #if (ALWAYS_REALLOC != 0)
> 
> That would be consistent with the other check at 1841.

Yeah, again a tidyup for later.

