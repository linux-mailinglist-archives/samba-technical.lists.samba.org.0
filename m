Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1ED2955F1
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 03:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=y+tZO0R4gFbpdRORyNLY4DVCD4l0WDG0v6+VDgO56jQ=; b=Zl/z2JesteKEAN8nTPT10te5+m
	KLi1mbHZKB4g8L/PMXTRVzAZajm3Wl9aSTzRQ5VK94aTR2XDDD1iGcYTE59bJStgsQTZwysSpkSH4
	XUM42Ocb1sl2l5ZtzxVr1vmsO6Do3goBydkA25ArKgVrpZd1vtfapZcymLZDCBHkQTRRUk6nILvMp
	MBJLyW+UBsvmyFVM45QiGzp1vs42x9ZXMAy4UkmfE9u84QMDEV/OQpVx9tD+GYpp8RMd5Yl1x3P1D
	z7JneUZseY3n27oZ3TLteSNiSRsHZXdJR4K+p/wJAMvEsQ+qMXgi+j39XEZm98rzazFQ8WyCihfrL
	7H/XBd6Q==;
Received: from ip6-localhost ([::1]:31836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVP6S-00DDPO-Ql; Thu, 22 Oct 2020 01:09:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVP6L-00DDPH-I4
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 01:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=y+tZO0R4gFbpdRORyNLY4DVCD4l0WDG0v6+VDgO56jQ=; b=q6E14e/FZJasiZtnYEJ5qgBl7i
 U85Prj4lIdwO8LAERzOFkavMi5k52DgS0LQsHR0RW++WYzGzlgb8Ih7kUoBOipbsLKx2L43WPohtw
 yb0wybj6aJ9W5O375xPEScuW4VS1mHIwVdoAfJib5MRk3ScRW9Hpvft+oI7MRvIDs6+r/zkvhLn7h
 LwzBXJ+5T5MotAJ8Ex8Mbn9Iw2b8XzYu1lIzJAn0Ph7arIJit8wGDuQ0UZ23z33D76n60XRhvP8Vq
 qTb22T43oABA7s1xOXq15vSVom1XEc6IffOOErqM8xtpI921hoHbpP7G61P182pCrxM5es21wKb9Q
 CIIHClLokxRKBJAq3URX2eJk8LuZAA5xXmsnsUQpFvy76CGQ282FdkDPUCj9/LSZmEyeNPQe7yEMN
 9CbsE/hMcU3hZLBOueGQQ3D64THrzQaoyBc92BtMBDhBLNfGqMkJPLJZDEkItSmEbp7TOhsrbh8wO
 O/1xDNAAnREInosvfaY9p2us;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVP6A-0002tI-DR; Thu, 22 Oct 2020 01:08:58 +0000
Date: Wed, 21 Oct 2020 18:08:55 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <20201022010855.GA853779@jeremy-acer>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
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

On Wed, Oct 21, 2020 at 06:51:04PM -0500, Arran Cudbard-Bell wrote:
> 
> Would references would be on the chopping block for a new major
> release also? I have to say that's one of the features we also use
> but one we could easily replicate internally and wouldn't really mourn.

I would *love* to get rid of references. I once had a long
conversation with Josh Bloch:

https://en.wikipedia.org/wiki/Joshua_Bloch

who used to be an office-mate of mine (one of
the benefits of working for Google :-). As he's
an expert in API design I ran the talloc API
past him.

He said it was mostly OK but *hated* talloc_reference() :-).

Unfortunately we'd need to get rid of it from Samba
first. Something I've been working (slowly:-) towards
for years...

> Now we're discussing major revs, there are a couple of other issues 
> we've run into that it'd be good to get comment on.
> 
> First, is that the lack of parent pointer for the majority of chunks makes
> any call that needs to access the parent ctx, very slow, when there 
> are a large number of chunks at the same level.
> 
> I'm assuming it's a trade off between cheap reallocs and cheap
> talloc_steal/talloc_parent_*.  Is allocing a bunch of chunks off of a 
> context that gets realloced a common pattern for Samba? Am I 
> missing something else that makes recording the parent in each chunk
> painful?

It's probably a size optimization to avoid bloating out
the talloc chunk header more than we need.

We tend not to reparent or realloc much. Just allocate
off a context and children and then free it.

> I mention this because we had to strip out almost all calls to
> talloc_steal and talloc_parent*, because they featured so heavily
> in code profiling.  If it really is just a tradeoff between realloc and
> talloc_parent* it might be good to revisit how parents are 
> recorded.
>
> Second, is expandable pools.
> 
> In FreeRADIUS the instance data for modules is only protected 
> when a user sets a special environmental variable to specify the pool
> size for all instance data memory. The user has to guess at how 
> big this pool needs to be (which is pretty terrible) but it's the only way 
> to handle this with the current version of talloc.
> 
> When we're building up the dictionaries we have a similar problem
> in that we need to guess at how big the pool needs to be because
> we can't expand it.  This leaves the pool massively oversized in the
> majority of cases.

Pools are really designed to be used for *known* data sizes.

Look at how we use them for filename in cp_smb_filename()
via talloc_pooled_object().

Remember, talloc is our internal library that others found
useful, so we design it around our needs first.

Selfish, but that's just the way it is :-).

> Having talloc automatically expand pools would be amazing 
> (imagining a linked list of fixed size malloced chunks).  I know there's
> additional complexity here, but it does seem to be limited to very
> specific areas of the code.
> Would this functionality ever be considered?

Be very clear about what you want this to look like.

Are pools the right thing ?

