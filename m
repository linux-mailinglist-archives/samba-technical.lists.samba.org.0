Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 123C6295B17
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 10:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yaqbLBwaAxGRK2HDz19R/jM/ctBN1+OcA+IEYAeR8Lo=; b=fol9LQXH3NKwBSgHgmH0rHD0MC
	p7cKRudbjR68yeHFWQzTLCMywB7Tzl95NV7zufLQBwXl5L8fvwxOcLUUKHQFI9Ku7fo+POMoNCEKq
	f2vpO1eg1JBuWaDc6JUKr6/0zFY5lYUt+BTXuZoWa/wdj0p5E17c3ussJ+zQ7+7XkOKoTu/dEamAt
	Uir+UFbTHNYYwV+UVu9hjs2MnRV3Nl1HfAuIhO6009TVZ18QR5Exfke4YZowpMWKSx1BUHvKUA7PC
	uRcT5zffgVum8xRUjbkAUt9SJU92DtiRU2lhVYXnUcLBSg3iNLMe9Zro+i56byTy51/u7bRzqkugB
	XImd5vzg==;
Received: from ip6-localhost ([::1]:37258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVWPu-00DF6S-NS; Thu, 22 Oct 2020 08:57:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVWPo-00DF6L-Px
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 08:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=yaqbLBwaAxGRK2HDz19R/jM/ctBN1+OcA+IEYAeR8Lo=; b=jX96fVPjU/bq5mtYl3nO0ZEznQ
 FOIQ5/Ba918oUZLFAk9Fapq1g42x08xQx8xhSAgiDsaincyUiPuacBEr8nBBlaOaYvbH4aY/V+qB8
 XRtWE6jLuCtN1gR1BSzPET9taa2zG8OIO4Ra2Vvnsp50WdeC1nAZywbMWPVwcTqYekqLEKfPBHJUl
 /m7sBfQdApPrbcmYrpJHZdAF7mpCPwkTm/hmnsht2mGym+0A0EiJjMGj5q83TPdah6BaeiE0Ii0zM
 ov+kVI7Rg/HmjqJEAy3VGxhay7rKvvqVYob5lc3xnQYLLPHkCNMuYDdjzg1PE4QNSs9gBWfk/6NdG
 8/LDpb3WXoAxp9x7fo+o8IrfOykOl+lESQ426UKQ1Zu8weUs4brjJvTBp85Q6EXfBJLaggehTD0uN
 TVoSECYApA6DFbPCvkKXv4Otf6IvBxxUW4hubNdtCVTsH5f4K6dJkvWWVnBpRP8YpKT7vF9tykINS
 tT1kzt/xEr41SsOyRSRsqymo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVWPn-0007lG-Ju; Thu, 22 Oct 2020 08:57:43 +0000
To: Jeremy Allison <jra@samba.org>,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
Date: Thu, 22 Oct 2020 10:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022010855.GA853779@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="dbDwjiwwsrEH8rV5KPMXnPu6TWDxCLk41"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dbDwjiwwsrEH8rV5KPMXnPu6TWDxCLk41
Content-Type: multipart/mixed; boundary="dzehONmmX9hdXcvqlNpTQ4CLVbNxnISjX";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>,
 Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Cc: samba-technical@lists.samba.org
Message-ID: <dbf19314-7d9e-76d1-cdb7-116148e91c34@samba.org>
Subject: Re: talloc: Other minor issues/queries
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
 <20201021001113.GA754426@jeremy-acer>
 <264F0B23-F45D-49F3-A0B7-4E717B129898@freeradius.org>
 <20201021183701.GA809738@jeremy-acer>
 <8E5EC9FB-62C2-4BA7-B809-72F26FEF2CD1@freeradius.org>
 <20201022010855.GA853779@jeremy-acer>
In-Reply-To: <20201022010855.GA853779@jeremy-acer>

--dzehONmmX9hdXcvqlNpTQ4CLVbNxnISjX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 22.10.20 um 03:08 schrieb Jeremy Allison via samba-technical:
> On Wed, Oct 21, 2020 at 06:51:04PM -0500, Arran Cudbard-Bell wrote:
>>
>> Would references would be on the chopping block for a new major
>> release also? I have to say that's one of the features we also use
>> but one we could easily replicate internally and wouldn't really mourn=
=2E
>=20
> I would *love* to get rid of references. I once had a long
> conversation with Josh Bloch:
>=20
> https://en.wikipedia.org/wiki/Joshua_Bloch
>=20
> who used to be an office-mate of mine (one of
> the benefits of working for Google :-). As he's
> an expert in API design I ran the talloc API
> past him.
>=20
> He said it was mostly OK but *hated* talloc_reference() :-).
>=20
> Unfortunately we'd need to get rid of it from Samba
> first. Something I've been working (slowly:-) towards
> for years...
>=20
>> Now we're discussing major revs, there are a couple of other issues=20
>> we've run into that it'd be good to get comment on.
>>
>> First, is that the lack of parent pointer for the majority of chunks m=
akes
>> any call that needs to access the parent ctx, very slow, when there=20
>> are a large number of chunks at the same level.
>>
>> I'm assuming it's a trade off between cheap reallocs and cheap
>> talloc_steal/talloc_parent_*.  Is allocing a bunch of chunks off of a =

>> context that gets realloced a common pattern for Samba? Am I=20
>> missing something else that makes recording the parent in each chunk
>> painful?
>=20
> It's probably a size optimization to avoid bloating out
> the talloc chunk header more than we need.

We always have a the parent pointer, but it's left as NULL
for all but the first child.

Currently the chunk header is 88 bytes (padded to a 16 byte boundary =3D>=
 96 bytes)
on 64bit architectures, which is more than the typical cacheline size of =
64 bytes.

Removing the memlimit pointer would shrink it to 80 bytes, but I guess it=
's to hard to
make it fit into 64 bytes...

There's also an alignment gad of 4 bytes after 'unsigned flags',
so we're currently wasting 12 bytes for each chunk.

It means that we could change flags to uint64_t or split of the magic int=
o
a separate uint32_t. Both would allow expanding the flags mask from 0xF t=
o
more, so we could have flags regarding the a const name, or it a chunk
was realloc'ed.

We could start with filling the parent pointer on each child first
on the first realloc of the parent we'll mark the parent with FLAG_REALLO=
CED
and the children with FLAG_INDIRECT_PARENT.

> We tend not to reparent or realloc much. Just allocate
> off a context and children and then free it.

Actually I think in some parts we reparent (talloc_steal/talloc_move) a l=
ot
in others (e.g. ldb or ndr) we realloc a bit more.

>> I mention this because we had to strip out almost all calls to
>> talloc_steal and talloc_parent*, because they featured so heavily
>> in code profiling.  If it really is just a tradeoff between realloc an=
d
>> talloc_parent* it might be good to revisit how parents are=20
>> recorded.
>>
>> Second, is expandable pools.
>>
>> In FreeRADIUS the instance data for modules is only protected=20
>> when a user sets a special environmental variable to specify the pool
>> size for all instance data memory. The user has to guess at how=20
>> big this pool needs to be (which is pretty terrible) but it's the only=
 way=20
>> to handle this with the current version of talloc.
>>
>> When we're building up the dictionaries we have a similar problem
>> in that we need to guess at how big the pool needs to be because
>> we can't expand it.  This leaves the pool massively oversized in the
>> majority of cases.
>=20
> Pools are really designed to be used for *known* data sizes.
>=20
> Look at how we use them for filename in cp_smb_filename()
> via talloc_pooled_object().
>=20
> Remember, talloc is our internal library that others found
> useful, so we design it around our needs first.
>=20
> Selfish, but that's just the way it is :-).
>=20
>> Having talloc automatically expand pools would be amazing=20
>> (imagining a linked list of fixed size malloced chunks).  I know there=
's
>> additional complexity here, but it does seem to be limited to very
>> specific areas of the code.
>> Would this functionality ever be considered?
>=20
> Be very clear about what you want this to look like.
>=20
> Are pools the right thing ?

Maybe we could have a FLAG_FIXED_POOL, which avoids the fallback to head =
memory.

But I guess we'd need something implemented a bit differently,

Currently we're very bad at reusing free memory within pools, we don't ma=
intain a free list.
But that's ok for our two main use cases talloc_stackframe_pool()
and talloc_pooled_object() for both our main goal is to avoid calling mal=
loc/free more than needed.
But they don't really implement a SLAB allocator.
https://en.wikipedia.org/wiki/Slab_allocation

The Linux kernel has a separation of 'struct kmem_cache' and 'mempool_t',=
 see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/slab.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/slab_def.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/i=
nclude/linux/mempool.h

So there's 'mempool_t *mempool_create_slab_pool(int min_nr, struct kmem_c=
ache *kc)'
and 'mempool_t *mempool_create_kmalloc_pool(int min_nr, size_t size)', bu=
t that's all
for fixed size objects.

Maybe we could abstract the low level allocation (malloc,realloc,free) in=
 talloc and just
implement the other allocation schemes below the main talloc logic.

In order to be able to handle much higher IOPS in our SMB server, we need=
 to find ways
to optimize our talloc/tevent_req handling.

These are some ideas, but it will be a long road to get there, so I guess=
 we need to
find incremental mini steps...

metze


--dzehONmmX9hdXcvqlNpTQ4CLVbNxnISjX--

--dbDwjiwwsrEH8rV5KPMXnPu6TWDxCLk41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+RSYMACgkQDbX1YShp
vVZRig/7B13FhAN+6Z5heRBBAXqR3Gssi/W05lZXG9xqFaPsBDAwGu7UaQ/b2OZe
oHmJKL0CnF/dlJU+eko6BDZOPjzmnKH3klxoDI95kKgCOJyzjrBNUZWEuxMSic3D
6o1YJ6T5uk8PaexDVROVMwHJ2xHq0uySq+RDuSMZLNoQ3Tccz5RJdhdriDHIp/tb
BIfr+jh/Jm+nZxyp1+goqYUhLTdf8nRPkRIPIWkPKnZIE2vILrK5LQlqB7hOYk0G
W2P4qw5wfpZMfQTnXaGQkXO/dFG4IDLIQN3VKLXRgEJaWmeiX6TsN1LAAQpQ+MDj
axjPR8d9aVrxnMtAG54kyRHRmK28gcOdl5HJ42zJyoWUUu52d0EzQRl3eG9l40+g
0IbhRDaunAxkrhdEgBQPWDitcpUdpZ6SF4U+t7GOdGoUqNBdVtP6nZin+JUf1K0D
/TJ9svPcfQ1Btf/mONjjAQ5C2MxFvp7+2tFN3+5NjIgDWSvnVgXnGtKz5Q0oY9p0
fNnxJaDclJ+I/dm+W47fLvyhFoUtm6ipGSnH73KzFhVUlCX462M1rNxLfzdHN5QE
1RQXIQbzTApFhGLYK8MXObGI3DcVZpRekc0F5m97uCY1a+ERZWTEK23NtEbADHod
POS4Neq3jGHJHHA/+Zch93t/HgB5AyvSJRyHhusIxKo6GmWSiZw=
=G8AL
-----END PGP SIGNATURE-----

--dbDwjiwwsrEH8rV5KPMXnPu6TWDxCLk41--

