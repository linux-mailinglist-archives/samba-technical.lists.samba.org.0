Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 517CB295248
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 20:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=v0f7P83lG8VbUuBzlDp4oOiOTvnJkPmNyoux/HkOFIU=; b=PpSCYSlS/1JL/qwlynaCcUCq6D
	wPTxj2vig2nP1Rle+ixVON+13sniroYeBx1KuJg1sY6TTA600rl319qVNtAfJLDQGMb1tVmA9HsDE
	Dm0rFMo6S+c136eRbZLTyme7PV0JipATKJb/cNU47JlHebd0CZ2Z4VUwbPj8MCVXIlI2p45Af9j21
	TqYn0hNUgO6rjruoyFONVApiFabJKJhTVNgaimMPl8zsPsOATifjiQjuiP6tk4WkLe7sVY6Q6rFgF
	mAE9ApvrssN/KV1UJpd8oX4Z/vFAR4DzsnOFA9vmrclAPZiG7H1OuRiQM5mXvEYcpZA+TNUo0xs7X
	UIz9/ssA==;
Received: from ip6-localhost ([::1]:23052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVItr-00DBXk-OY; Wed, 21 Oct 2020 18:31:51 +0000
Received: from mail.networkradius.com ([62.210.147.122]:52711) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVItl-00DBXc-G8
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 18:31:48 +0000
Received: from [192.168.0.5] (unknown [177.240.134.64])
 by mail.networkradius.com (Postfix) with ESMTPSA id 8510942E;
 Wed, 21 Oct 2020 18:31:41 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: Other minor issues/queries
In-Reply-To: <20201021001113.GA754426@jeremy-acer>
Date: Wed, 21 Oct 2020 13:31:39 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
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



> On Oct 20, 2020, at 7:11 PM, Jeremy Allison <jra@samba.org> wrote:
>=20
> On Tue, Oct 20, 2020 at 03:10:14PM -0500, Arran Cudbard-Bell via =
samba-technical wrote:
>> Just to keep this separate from the memlimit/pools discussion.
>>=20
>> - I've noticed talloc_realloc_size clears the name/type of the chunk =
be=20
>> allocated.  This isn't mentioned in the documentation.  Is clearing =
the=20
>> name/type of the chunk expected behaviour?
>=20
> Doesn't it add the name of the program text that called the realloc ?

Sorry yes, I should have been more specific.  It clears the the existing
name, and sets the name to be the program text.

There's a number of places where this happens. All the *_append_*=20
functions drop the name of the chunk and set it it to be the string=20
content.

For buffers its less relevant, but for structures... Well it just seems
like a rather unfriendly thing for a type validation system to do.
It seems like talloc_realloc* was originally envisioned primarily as a =
way
of extending arrays or buffers, and not working with flexible array=20
members in structs, or struct "compositing"
=
(https://github.com/FreeRADIUS/freeradius-server/blob/master/src/lib/util/=
ext.c).

The cost to fix this would appear to be two bits in the flags field.
One to record whether the name was explicitly specified, one to
record whether the name was originally const or not.

There'd actually be some efficiency benefits to recording const vs not=20=

const in talloc_free_children. talloc_free_children currently walks=20
over the list of children searching for a chunk that provides the name
for the context.

If we knew the context had a const name, then we could avoid that=20
additional O(n) operation in the majority of cases.

I'm happy to put together patches...  Recording const vs non-const
wouldn't seem to be that contentious.  Preserving explicitly set names/
types seems like it'd need more discussion.

>> - talloc_set_memlimit is marked as deprecated in the
>>  current HEAD version of talloc, with a note to use cgroups.
>>  cgroups wouldn't offer equivalent functionality for us.  Could I =
humbly
>>  request memlimits not be deprecated? :)
>=20
> OK, I think memlimits add horrible extra complexity to
> save applications some bookkeeping.
>=20
> I want to *reduce* complexity in talloc.
>=20
> First fix I want to do after the memlimit changes and tests
> have gone in is to remove the code paths around ALWAYS_REALLOC.
> We never compile with it in test, and we have tests that
> depend on it *not* being set, so it really needs to go.

Sounds good.

> Second, I'd like to remove the memlimit code. Can you be
> *really* clear as to what you are using them for, and
> can we find some other way to do this ?

We want to ensure heap allocations can't occur when a pool is full.

a. In cases where these pools are composed of mprotected pages,
    or pages that will be mprotected.
b. Where we want to trigger allocation of an additional "slab" of memory
    when an existing pool is used up.  This is used where we're =
performing
    configuration parsing on startup.

That's it, that's really our only use cases for memlimit. We never use=20=

them on any other type of chunk.

A flag saying "don't allow heap allocations" would be absolutely fine
for us in all cases, and much simpler to implement.

> If we can do that, then.....
>=20
>> - Is there any appetite for functions which return chunks of a =
specific
>>  alignment?  i.e. talloc_aligned, talloc_aligned_array,
>>  talloc_aligned_pool.
>>  I've had to fudge some horrible variants of the above for local use.
>>  We use aligned memory for the following purposes:
>>  - Page aligned pools for protecting memory areas with mprotect
>>    to prevent runtime modifications.
>>  - 8 byte aligned buffers that can have the start and end regions
>>    easily poisoned with ASAN.
>>  - Cache line aligned ring buffers, with the cache line=20
>>    alignment done to reduce contention where the producer and
>>    consumer are close.
>=20
> Adding this, more interesting functionality becomes
> a lot easier to handle and manage complexity wise.

Agreed.

-Arran=

