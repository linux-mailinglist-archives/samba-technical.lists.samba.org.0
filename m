Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747C295557
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 01:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=L3Fr/gkbjOXdqAJZGaAvzufgXTYPgQLrBGfw5bxLbzU=; b=KqByfGolYqTc9jo+JAa0y7yHBC
	8iG6+PHlVQ2qLS3iDHo4GfrSh+38BvunjvaeVmFVco02p/WaPWcaiTDGMfn1VCsucqjhiI/RU/GOQ
	tj1K68pEUm/FOXgRdTnNWmMZMohs29roupp5ZnKuAvmO1kq8np1WZaA/+oV2LaEg15efyInnbDtws
	sx4icZu391UB3exjlEblfr27b+yBllcc9crSE3pnGU4fSRHQWjT2/CWYEfHKogt+j1YA27F7Yarm5
	ZU8RiNmEPihVEnO1WQEi3yGeW/npLxGqIqP774XhPopn+UbpYeCThxOTcqnIfHDd/JHD5TMhR+37Q
	fZ7QPvKg==;
Received: from ip6-localhost ([::1]:29494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVNt2-00DCtT-7e; Wed, 21 Oct 2020 23:51:20 +0000
Received: from mail.networkradius.com ([62.210.147.122]:65450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVNst-00DCtM-Ld
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 23:51:15 +0000
Received: from [192.168.0.5] (unknown [177.240.134.64])
 by mail.networkradius.com (Postfix) with ESMTPSA id 03AB54A0;
 Wed, 21 Oct 2020 23:51:06 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: Other minor issues/queries
In-Reply-To: <20201021183701.GA809738@jeremy-acer>
Date: Wed, 21 Oct 2020 18:51:04 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
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


>> 
>> I'm happy to put together patches...  Recording const vs non-const
>> wouldn't seem to be that contentious.  Preserving explicitly set names/
>> types seems like it'd need more discussion.
> 
> That seems reasonable to me, but I'd rather Metze also
> comment on this. It is a behavior change.

OK.

>>> Second, I'd like to remove the memlimit code. Can you be
>>> *really* clear as to what you are using them for, and
>>> can we find some other way to do this ?
>> 
>> We want to ensure heap allocations can't occur when a pool is full.
>> 
>> a. In cases where these pools are composed of mprotected pages,
>>    or pages that will be mprotected.
>> b. Where we want to trigger allocation of an additional "slab" of memory
>>    when an existing pool is used up.  This is used where we're performing
>>    configuration parsing on startup.
>> 
>> That's it, that's really our only use cases for memlimit. We never use 
>> them on any other type of chunk.
>> 
>> A flag saying "don't allow heap allocations" would be absolutely fine
>> for us in all cases, and much simpler to implement.
> 
> OK - that sounds *much* easier. An additional 'uint32_t flags'
> argument passed into talloc_pool() and talloc_pooled_object()
> with a 'CONFINE_TO_POOL' flags being the only one defined
> at present would be the way to go IMHO.

Sure, or talloc_set_pool_confined(TALLOC_CTX *ctx, bool) would 
maintain backwards compatibility/consistency, and allow the flag
to be flipped.

I guess it really depends on whether there's a desire to keep the 
current API style or move to something new.

> This would have to be a new major rev of the library
> as we'd be removing the memlimit code as well in order
> to make the internals of talloc understandable again :-).

Indeed :)

Would references would be on the chopping block for a new major
release also? I have to say that's one of the features we also use
but one we could easily replicate internally and wouldn't really mourn.

-

Now we're discussing major revs, there are a couple of other issues 
we've run into that it'd be good to get comment on.

First, is that the lack of parent pointer for the majority of chunks makes
any call that needs to access the parent ctx, very slow, when there 
are a large number of chunks at the same level.

I'm assuming it's a trade off between cheap reallocs and cheap
talloc_steal/talloc_parent_*.  Is allocing a bunch of chunks off of a 
context that gets realloced a common pattern for Samba? Am I 
missing something else that makes recording the parent in each chunk
painful?

I mention this because we had to strip out almost all calls to
talloc_steal and talloc_parent*, because they featured so heavily
in code profiling.  If it really is just a tradeoff between realloc and
talloc_parent* it might be good to revisit how parents are 
recorded.

Second, is expandable pools.

In FreeRADIUS the instance data for modules is only protected 
when a user sets a special environmental variable to specify the pool
size for all instance data memory. The user has to guess at how 
big this pool needs to be (which is pretty terrible) but it's the only way 
to handle this with the current version of talloc.

When we're building up the dictionaries we have a similar problem
in that we need to guess at how big the pool needs to be because
we can't expand it.  This leaves the pool massively oversized in the
majority of cases.

Having talloc automatically expand pools would be amazing 
(imagining a linked list of fixed size malloced chunks).  I know there's
additional complexity here, but it does seem to be limited to very
specific areas of the code.
Would this functionality ever be considered?

-Arran

