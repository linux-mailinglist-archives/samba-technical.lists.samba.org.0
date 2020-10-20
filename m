Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4129346C
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 07:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OTyDn5/0/tvNbvhBguaBqGkoWTh+TD4l3/IyAzWp6S0=; b=fAeSym+r99P1fBenSAzEHJNXA1
	m0P0laX29zWKZ9vbqj6cHdHQqXSe52stiYjXD1W7RnlqhlSAbWLeGFP0s+Rm6bN+XVBxuJeC592LP
	9MFtfSuz1DnqWvpwR/YnsjUHT+wRl4wfgONXdiupvLLhN/UR0D1b9hhy+8xuaKhYdxn0+HLQ6M7pe
	83SdvHSSbHLE+oLqOkbBeNyA5U6Es3LwiruT1d8ki5LZycMZB5YkyUNp+0nOMw2VhoK22l5C2mLSD
	EBlD7wwsP+wXf8GYEx0wa2OZkq3vLZdOymN6Zfbp9gsFDlr+MYftos6vWtiNE+76Cwma4UJzy9yTP
	FRMO2p4g==;
Received: from ip6-localhost ([::1]:24910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUkXk-00Cosa-26; Tue, 20 Oct 2020 05:50:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUkXZ-00Copr-6W
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 05:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=OTyDn5/0/tvNbvhBguaBqGkoWTh+TD4l3/IyAzWp6S0=; b=Mb2QbT5Uexb+MoEiwtXLkvPS8n
 QvVxUNP9587IZUzP5+IQlquRwINGAX1e71Aj1Hh2+lMRMW6axJymPO9Kpazq3PnM7X3KYQeb9w8ic
 MRd9XbZ325wJS5M3spUqptEKrO+AO8czYaUZEEIULch7M2EeGh0L2WTR2iYwwpn8BlHUlvcLeQYKc
 mK9UZ0Oqip08dirvInPmSA36Zf1k2ngQegSWCWPnhWjrAqSfrKkUrehTal8I/YiylYogUH4bhEOpS
 Is2OjhUPejmcln5kAVDkyl72tgtJmgHF7DDsz4Q2YPjEPKnjXa8GiCVuQFZISAuLsy1+l8IYN7htV
 1Le3VN9fSORr2KMb99HMeVN2mtxqUEaWBg7WsngabZMeB9WeTg4BNu+QaSQGGR/4Mt/m4Ui+KQ2fQ
 4VKDp85IZarVu7x6CyBt/h2CRCB482ZM+xCFR5TitPAtfwetAMOUFAKiswBzNkP8Ocw3vzoXn406a
 PW0ezpFbrkBiGC/n/Ftb+YQ1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUkXS-0003lh-6H; Tue, 20 Oct 2020 05:50:27 +0000
Date: Mon, 19 Oct 2020 22:50:23 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020055023.GA606244@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
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

On Mon, Oct 19, 2020 at 11:17:29PM -0500, Arran Cudbard-Bell via samba-tech=
nical wrote:
> Much appreciated!  I'll try this out tomorrow.
>=20
> Just so I'm clear on the expected behaviour, could
> you verify that these assumptions are correct:
>=20
> 1. If there's a 1024 byte pool, with a 2048 byte memlimit,
> the amount of memory allocated outside of the pool would=20
> be limited to 1024 bytes.

Yes. Pool =3D=3D 1024 bytes allocated, any extra must be
below total size (including pool, which is treated
as allocated).

> 2. If there's a 1024 byte pool, with a 1024 byte memlimit,
> any alloc or realloc up to the pool size would succeed,
> but any alloc or realloc which'd result in a chunk being
> allocated outside of pool memory would fail.

Yes. memlimit =3D=3D pool size, so any further mallocs/reallocs
adding memory should fail.

> 3. If there's a 1024 byte pool, with a 512 byte memlimit,
> the memlimit would cause all reallocs and allocs to
> fail, because the pool size is already greater than the
> memlimit.

No. Allocations inside the pool below 1024 bytes would
always succeed (until the pool is filled) as when allocating
=66rom a pool the memlimit isn't checked if the allocation
can be filled from within the pool.

memlimit is only checked in actual malloc/realloc calls.

If a pool already exists, it's assumed that it must already
have fit within the memlimit. It makes no sense to
set the limit lower than the pool size.

> Additionally, if the third assumption is correct, do you=20
> see any value in instead having talloc_set_memlimit=20
> fail if a caller specifies a memlimit smaller than the pool?

Nope. See above.

