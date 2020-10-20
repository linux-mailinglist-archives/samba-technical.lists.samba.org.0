Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D742941D5
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=V7S3BYW3QgRzMtsUcur2cH7b7huptjFh3H90uVFsM3w=; b=UUd/nH35VVUBt9270YlSrBsPJ4
	XHtxyt3ZVlFE5hsFaaM/9NsFEp6O4ODSXEuP6jW4XmPLi3hCDuMNm0vevwK4BKoaDxRxdROA7xSLU
	JL2o0eMRAivokUupGKYw71Cb2dFR0y8OAUJYe5J92PAJ0gZ4WdLNDXmZv2O8qigpQvIB5U41hbHYJ
	+r1Guhtp402IPmpwSRSOfqQIkW1SXW5pPkSVGkHKOCzCoAxV/HL2fOLsf2MqXMSMUfC66mM9ru3Xp
	IHEDdP0dEp04c8cGKHtocjPnS6vWMaIu/AFwPyUyzR6ssvYjx9Tc8x5/obPGv/0Kfj4hifz9DU6Hz
	Vr77Nt/g==;
Received: from ip6-localhost ([::1]:64480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUvyo-00CvM4-0O; Tue, 20 Oct 2020 18:03:26 +0000
Received: from mail.networkradius.com ([62.210.147.122]:50889) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUvyj-00CvLx-1I
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:03:23 +0000
Received: from shinyhead.rga.ip (unknown [187.142.130.164])
 by mail.networkradius.com (Postfix) with ESMTPSA id 4C6924FD;
 Tue, 20 Oct 2020 18:03:17 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Message-Id: <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_C55BE5D6-3900-4A17-B300-98D689D643AA"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
Date: Tue, 20 Oct 2020 13:03:14 -0500
In-Reply-To: <20201020055023.GA606244@jeremy-acer>
To: Jeremy Allison <jra@samba.org>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer> <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
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


--Apple-Mail=_C55BE5D6-3900-4A17-B300-98D689D643AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Oct 20, 2020, at 12:50 AM, Jeremy Allison <jra@samba.org> wrote:
>=20
> On Mon, Oct 19, 2020 at 11:17:29PM -0500, Arran Cudbard-Bell via =
samba-technical wrote:
>> Much appreciated!  I'll try this out tomorrow.
>>=20
>> Just so I'm clear on the expected behaviour, could
>> you verify that these assumptions are correct:
>>=20
>> 1. If there's a 1024 byte pool, with a 2048 byte memlimit,
>> the amount of memory allocated outside of the pool would=20
>> be limited to 1024 bytes.
>=20
> Yes. Pool =3D=3D 1024 bytes allocated, any extra must be
> below total size (including pool, which is treated
> as allocated).
>=20
>> 2. If there's a 1024 byte pool, with a 1024 byte memlimit,
>> any alloc or realloc up to the pool size would succeed,
>> but any alloc or realloc which'd result in a chunk being
>> allocated outside of pool memory would fail.
>=20
> Yes. memlimit =3D=3D pool size, so any further mallocs/reallocs
> adding memory should fail.
>=20
>> 3. If there's a 1024 byte pool, with a 512 byte memlimit,
>> the memlimit would cause all reallocs and allocs to
>> fail, because the pool size is already greater than the
>> memlimit.
>=20
> No. Allocations inside the pool below 1024 bytes would
> always succeed (until the pool is filled) as when allocating
> from a pool the memlimit isn't checked if the allocation
> can be filled from within the pool.
>=20
> memlimit is only checked in actual malloc/realloc calls.
>=20
> If a pool already exists, it's assumed that it must already
> have fit within the memlimit. It makes no sense to
> set the limit lower than the pool size.
>=20
>> Additionally, if the third assumption is correct, do you=20
>> see any value in instead having talloc_set_memlimit=20
>> fail if a caller specifies a memlimit smaller than the pool?
>=20
> Nope. See above.

OK.  That patch seems to mostly work but there are a few
issues.

First is an easy one. After a realloc failure due to hitting the
memlimit, the chunk remains marked as free, so when a
report gets run later in the test suite, we get a use-after-free
error.


--Apple-Mail=_C55BE5D6-3900-4A17-B300-98D689D643AA
Content-Disposition: attachment;
	filename=0001-Mark-chunks-that-failed-realloc-as-not-free.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-Mark-chunks-that-failed-realloc-as-not-free.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=202c46ea92dbcbf6f403d90b67370b63055d49ed36=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0ADate:=20Tue,=2020=20Oct=202020=2012:45:05=20=
-0500=0ASubject:=20[PATCH]=20Mark=20chunks=20that=20failed=20realloc=20=
as=20"not=20free"=0A=0ASigned-off-by:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0A---=0A=20lib/talloc/talloc.c=20|=204=20=
++++=0A=201=20file=20changed,=204=20insertions(+)=0A=0Adiff=20--git=20=
a/lib/talloc/talloc.c=20b/lib/talloc/talloc.c=0Aindex=20=
2e7a803d995..7698f66bee7=20100644=0A---=20a/lib/talloc/talloc.c=0A+++=20=
b/lib/talloc/talloc.c=0A@@=20-1912,6=20+1912,7=20@@=20_PUBLIC_=20void=20=
*_talloc_realloc(const=20void=20*context,=20void=20*ptr,=20size_t=20=
size,=20cons=0A=20=09=09=09=09=20*/=0A=20=09=09=09=09if=20=
(!talloc_memlimit_check(tc->limit,=20size))=20{=0A=20=09=09=09=09=09=
errno=20=3D=20ENOMEM;=0A+=09=09=09=09=09_talloc_chunk_set_not_free(tc);=0A=
=20=09=09=09=09=09return=20NULL;=0A=20=09=09=09=09}=0A=20=09=09=09}=0A@@=20=
-1936,6=20+1937,7=20@@=20_PUBLIC_=20void=20*_talloc_realloc(const=20void=20=
*context,=20void=20*ptr,=20size_t=20size,=20cons=0A=20=09=09=09if=20=
(!talloc_memlimit_check(tc->limit,=0A=20=09=09=09=09=09(size=20-=20=
old_size)))=20{=0A=20=09=09=09=09errno=20=3D=20ENOMEM;=0A+=09=09=09=09=
_talloc_chunk_set_not_free(tc);=0A=20=09=09=09=09return=20NULL;=0A=20=09=09=
=09}=0A=20=09=09}=0A@@=20-2057,6=20+2059,7=20@@=20_PUBLIC_=20void=20=
*_talloc_realloc(const=20void=20*context,=20void=20*ptr,=20size_t=20=
size,=20cons=0A=20=09=09=09=09=20*/=0A=20=09=09=09=09if=20=
(!talloc_memlimit_check(tc->limit,=20size))=20{=0A=20=09=09=09=09=09=
errno=20=3D=20ENOMEM;=0A+=09=09=09=09=09_talloc_chunk_set_not_free(tc);=0A=
=20=09=09=09=09=09return=20NULL;=0A=20=09=09=09=09}=0A=20=09=09=09}=0A@@=20=
-2083,6=20+2086,7=20@@=20_PUBLIC_=20void=20*_talloc_realloc(const=20void=20=
*context,=20void=20*ptr,=20size_t=20size,=20cons=0A=20=09=09=09if=20=
(!talloc_memlimit_check(tc->limit,=0A=20=09=09=09=09=09(size=20-=20=
old_size)))=20{=0A=20=09=09=09=09errno=20=3D=20ENOMEM;=0A+=09=09=09=09=
_talloc_chunk_set_not_free(tc);=0A=20=09=09=09=09return=20NULL;=0A=20=09=09=
=09}=0A=20=09=09}=0A--=20=0A2.28.0=0A=0A=

--Apple-Mail=_C55BE5D6-3900-4A17-B300-98D689D643AA
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



Then there's another issue with object_count ending
up off by one, which means talloc_free_children doesn't
actually return memory to the pool, and that messes up
some of the other tests I'm adding.  Just tracking down
when and why this happens now.... It might have been a
pre-existing issue and not related to this patch, I'm just
seeing it because of using talloc_free_children to reset
the pool between some tests.

-Arran



--Apple-Mail=_C55BE5D6-3900-4A17-B300-98D689D643AA--

