Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A624598BD
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 12:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pOJX2LaPcfVehZxhUU+9sXTntIOF5an/l31w6FW8780=; b=PGhxQw49Hsv45QR9Opb82/ta0w
	/GODEBETgPg9+bbMdAJxcPb1yKhrKb59/nqjwhWXlf3iQiBvh6VLCKNSPrrOB4m08tr/09PR3D+UJ
	4yb2weKYqyv8AU812fySJEVVCjUZSfbCO3gR7BdpTr2t2oKsXcZwI2fCmDO4BYopdey0mTlh2FoB1
	nKg8jBXzJL/B2qOv2ChBm/wXFg+NcnkfZPU7H4PNLwus9WMWUbX37nyT5lqDG3YG9AAJR891Nzibl
	Cz+QOBjEnUlvZ9NXBpiyGpgTijx+75f25JXL/CJtC1fKhOzbl5zmHEuRDO4h9O0SyYNr247A6NDEr
	do+X03OQ==;
Received: from localhost ([::1]:38798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgoOl-002KXh-UI; Fri, 28 Jun 2019 10:46:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32988) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgoOh-002KXa-48
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 10:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=pOJX2LaPcfVehZxhUU+9sXTntIOF5an/l31w6FW8780=; b=Fk8qV9gr+yrg3VEVpNFt61ltCF
 E77S+X179H62ADjhtNKifYZdCVrlq/gak/5nsjjL+SyvC+y2lXNGUpP0DAViCAODnLw1O3oLNTVOx
 ajC6jtchKUeQbSo3tDzzYHPKvwMfNpktyfa4HU7ZUR/z6pAYdpz5kuIqWciltySazC9g=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgoOg-0008Dz-Ex; Fri, 28 Jun 2019 10:46:26 +0000
Date: Fri, 28 Jun 2019 12:46:25 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190628104624.GF32415@samba.org>
References: <1561079117.28284.21.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <1561079117.28284.21.camel@samba.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-21 at 13:05 +1200, Andrew Bartlett via samba-technical wrote:
>=20
> [...]
> So, I would like to propose this.  That given the practice of the Samba
> Team and almost all contributors is to contribute via a merge request
> against https://gitlab.com/samba-team/samba that we document this, and
> only this, as how to contribute to new patches to Samba.
>
> [...]
>=20
> Essentially it would mean a better version of this being prominently
> placed:
>=20
> https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_requ=
est

There is one thing I find confusing about the above page and that
needs to be cleared: It creates the impression that the only way
to file a merge request for samba via gitlab is to get access to
the CI repository https://gitlab.com/samba-team/devel/samba
and push to a personal subdir+branch there and create a MR from there.

In contrast, if I get it right, I think the *normal* way to file a MR,
would be to create your own personal fork of https://gitlab.com/samba-team/=
samba
on gitlab, push your branch there, and create a MR from there.
Upon filing the MR, the CI is triggered on the proposed patchset.

My understanding is that the CI repo is intended to give access
to the CI with*out* requiring to file a MR to the main repo.
This is useful for team member and regular contributors who want
to test their WIP code against the CI and don't want to clobber
the MR space with those possibly many many throw-away MRs and
CI runs.

Is that understanding correct?

If this is correct, then we need an entirely different document
for describing the contribution flow via gitlab.

Thanks - Michael

> and updates to:
> https://wiki.samba.org/index.php/Using_Git_for_Samba_Development
>=20
> Non patch, meta and broader architectural discussions still belong on
> samba-technical of course.=20
>=20
> Any thoughts?
>=20
> Andrew Bartlett
>=20
> --=20
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT  =20
> https://catalyst.net.nz/services/samba
>=20
>=20
>=20
>=20
>=20

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQ4hxRJ4GXWNWIKYh7JT0k4GE+QNAUCXRXv/gAKCRDJT0k4GE+Q
NBVOAJ9jh/ZEqPwUqHVkqiAPOgV59rjmoQCfVYPqM3mQs3+B/ICpzUvz37MOuQY=
=9LBN
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--

