Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA629634B
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 19:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=8WMfhQgzlywWginNfpFk/XO44TzshGHgNlnl0UsfQoE=; b=UcwZFfxX7CRE/ZjEQWtQQVMP5y
	Lk76xY/suQOK891l6moLtIvB49EQEGDsCVv/y7UqzofgzNODQIPrCEYjM+KbPU4+0rww1MG7Tkv8V
	J6v7oHUnAGaWN/CTPV/iSzCYezYPDHPyNRbLUrmIR0CZkwzR5jk8LiOMMgpIMEJqgLbzVkxRqG8Qm
	F4MMP+glj8kP0zeOU8q1BBlVpklBq7+wOTqBDZVeN5YmZD2cjs8IEFKYmL03S/WqxzluODiG7IyuM
	1oRZjJdaEjjT20Kr1LssN2Mi6ygE74iV5p+e5qLUv7RgVYr7ESAVObcotOFzm8rglsRuI8kqltNWK
	G6H7diMA==;
Received: from ip6-localhost ([::1]:27332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVdyn-00DKpr-9p; Thu, 22 Oct 2020 17:02:21 +0000
Received: from mail.networkradius.com ([62.210.147.122]:57515) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVdyh-00DKpk-VN
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 17:02:18 +0000
Received: from [192.168.0.5] (unknown [177.240.134.64])
 by mail.networkradius.com (Postfix) with ESMTPSA id 0DBC23B8;
 Thu, 22 Oct 2020 17:02:10 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: Other minor issues/queries
In-Reply-To: <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
Date: Thu, 22 Oct 2020 12:02:08 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E820532-3A76-4713-B3C1-0E010F3B354C@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
 <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
To: Stefan Metzmacher <metze@samba.org>
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
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


> We always have a the parent pointer, but it's left as NULL
> for all but the first child.

Yes, that's how I understood it to work.

> Currently the chunk header is 88 bytes (padded to a 16 byte boundary =
=3D> 96 bytes)
> on 64bit architectures, which is more than the typical cacheline size =
of 64 bytes.

Max talloc chunk size is 268435456, so it'd fit comfortably in a =
uint32_t.
Changing the size field to be a uint32_t and moving to after the flags
field gives an immediate saving of 8 bytes.

With clang 10.0.1

sizeof(struct talloc_chunk) =3D 88
+ size_t -> uint32_t and re-arranging  =3D 80
+ removing refs and limits =3D 64

There's no guarantee the system malloc would return cache line aligned=20=

blocks of memory, that'd be where the 'aligned' variants of the =
allocation
functions would be useful.

Current struct talloc_chunk
------------------------------------
talloc: 6827970 ops/sec
talloc_pool: 14650240 ops/sec
malloc: 10992723 ops/sec

talloc: 6966185 ops/sec
talloc_pool: 14945391 ops/sec
malloc: 11628633 ops/sec

talloc: 7064589 ops/sec
talloc_pool: 14970238 ops/sec
malloc: 11319955 ops/sec

talloc-avg: 6952914
talloc_pool-avg: 14855290

32bit size field
-------------------
talloc: 6751118 ops/sec
talloc_pool: 14736652 ops/sec
malloc: 11301125 ops/sec

talloc: 6952915 ops/sec
talloc_pool: 14979351 ops/sec
malloc: 10980855 ops/sec

talloc: 6789687 ops/sec
talloc_pool: 14853362 ops/sec
malloc: 11576574 ops/sec

talloc-avg: 6788595
talloc_pool-avg: 14814459

So there's possibly 1.8% penalty for using a 32bit size field with =
talloc,=20
and no real impact for talloc pools.

This is just on my local machine, so there'll be a lot of random noise.
I wouldn't really expect unaligned accesses to have a huge penalty=20
on x86-64.

I can re-run the tests somewhere quieter if there's interest in making
this change.

> Removing the memlimit pointer would shrink it to 80 bytes, but I guess =
it's to hard to
> make it fit into 64 bytes...
>=20
> There's also an alignment gad of 4 bytes after 'unsigned flags',
> so we're currently wasting 12 bytes for each chunk.
>=20
> It means that we could change flags to uint64_t or split of the magic =
into
> a separate uint32_t. Both would allow expanding the flags mask from =
0xF to
> more, so we could have flags regarding the a const name, or it a chunk
> was realloc'ed.

Is there any real issue with only having 24bits of magic if 32bit
size fields were implemented?

> We could start with filling the parent pointer on each child first
> on the first realloc of the parent we'll mark the parent with =
FLAG_REALLOCED
> and the children with FLAG_INDIRECT_PARENT.

Yes, it's still O(n) for realloc, but I'm thinking that reallocing =
chunks
with large numbers of children is something that's unlikely to be
a common pattern in either Samba, FreeRADIUS or other projects.

> Maybe we could have a FLAG_FIXED_POOL, which avoids the fallback to =
head memory.
>=20
> But I guess we'd need something implemented a bit differently,
>=20
> Currently we're very bad at reusing free memory within pools, we don't =
maintain a free list.

IIRC it's basically when the chunk with the chunk with the highest =
address
in the pool gets freed, the memory gets reclaimed?

Yes, it's not great.=20

> But that's ok for our two main use cases talloc_stackframe_pool()
> and talloc_pooled_object() for both our main goal is to avoid calling =
malloc/free more than needed.
> But they don't really implement a SLAB allocator.
> https://en.wikipedia.org/wiki/Slab_allocation
>=20
> The Linux kernel has a separation of 'struct kmem_cache' and =
'mempool_t', see:
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/linux/slab.h
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/linux/slab_def.h
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/linux/mempool.h
>=20
> So there's 'mempool_t *mempool_create_slab_pool(int min_nr, struct =
kmem_cache *kc)'
> and 'mempool_t *mempool_create_kmalloc_pool(int min_nr, size_t size)', =
but that's all
> for fixed size objects.
>=20
> Maybe we could abstract the low level allocation (malloc,realloc,free) =
in talloc and just
> implement the other allocation schemes below the main talloc logic.

Yes, definitely, if the primary goal is speed.  The slab allocation code =
needn't=20
even be in talloc.  Talloc just needs to allow swapping out the default =
malloc,=20
realloc, free functions. It's maybe a 30-40 LoC change. It doesn't =
really add any=20
complexity, or impact performance.

Unfortunately this doesn't solve our immediate need. I'll give it some =
more thought.

> These are some ideas, but it will be a long road to get there, so I =
guess we need to
> find incremental mini steps...

Indeed. =20

-Arran=

