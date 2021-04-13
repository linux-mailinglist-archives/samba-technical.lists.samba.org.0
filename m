Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F9235DFE2
	for <lists+samba-technical@lfdr.de>; Tue, 13 Apr 2021 15:15:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zNZcjDC32Gj9hgNPvPLWXoMpfcH/bZM8Enz9JKg1ZhI=; b=smmkv/N7UIo4kMhkE/5DA/iZJp
	PpJPz8RKS9Kb4mHNFKaKJHyV1MMmGqvebm733RV/SWQmTtYDbSNYePvCGGG6LABjREvM+MvYVNuLF
	c7RP0p9sfl48MX137jFKYgXUKBVvyshJjaxTJ7wOI/4dLJKjZXCjDefFeHGDhIxsL2bOviv/odewm
	SygTATIkouoG0q0DSiVrHswmO/brLDiHn3jyfn6oxUv141Xga3yiEJXcF1ScmwA/s7PhTEfRA7LS2
	SLs6yoSu/VU8DxPLLag/oJItzSIHy7O3FF0dF2SG8nB4y2EbfcXQkPQz3cpcBwxP7ilDfeUxW+XPC
	kprS3Tgw==;
Received: from ip6-localhost ([::1]:25192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWIs2-00B7Ho-EU; Tue, 13 Apr 2021 13:14:22 +0000
Received: from rs07.intra2net.com ([85.214.138.66]:54780) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lWIrx-00B7Hh-Ei
 for samba-technical@lists.samba.org; Tue, 13 Apr 2021 13:14:19 +0000
Received: from mail.m.i2n (unknown [172.17.128.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by rs07.intra2net.com (Postfix) with ESMTPS id 3FDAD150016D;
 Tue, 13 Apr 2021 14:49:17 +0200 (CEST)
Received: from localhost (mail.m.i2n [127.0.0.1])
 by localhost (Postfix) with ESMTP id 19330986;
 Tue, 13 Apr 2021 14:49:17 +0200 (CEST)
Received: from crust.home.phg (unknown [172.17.68.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: smtp-auth-user)
 by mail.m.i2n (Postfix) with ESMTPSA id 142E34E5;
 Tue, 13 Apr 2021 14:49:15 +0200 (CEST)
Date: Tue, 13 Apr 2021 14:49:13 +0200
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: CI failure on account of C99
Message-ID: <YHWTScggnmWQ9ZDq@crust.home.phg>
Mail-Followup-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <YHVls6bU63Xhd32H@crust.home.phg>
 <380b9ca0-3322-b8cd-36da-8ba84b017b1a@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BNG7CQe3h7Xvles/"
Content-Disposition: inline
In-Reply-To: <380b9ca0-3322-b8cd-36da-8ba84b017b1a@catalyst.net.nz>
X-Sent-From-My: toaster
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
From: Philipp Gesang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Philipp Gesang <philipp.gesang@intra2net.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--BNG7CQe3h7Xvles/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday, 2021-04-13 22:20:31 +1200 Douglas Bagnall <douglas.bagnall@cata=
lyst.net.nz> wrote=20
> On 13/04/21 9:34 pm, Philipp Gesang via samba-technical wrote:
> >     ../../lib/util/tests/time.c:119:2: error: =E2=80=98for=E2=80=99 loo=
p initial declarations are only allowed in C99 mode
> >       for (int i =3D 0; i < sizeof(data) / sizeof(data[0]); ++i) {
> >       ^
> >     ../../lib/util/tests/time.c:119:2: note: use option -std=3Dc99 or -=
std=3Dgnu99 to compile your code
> >=20
> > AFAICS there=E2=80=99s numerous C99 constructs all over the source and
> > README.Coding explicitly mentions it. Is there a special
> > precaution that must be taken for this test target to work?
>=20
> The Samba style is to declare all the things first.

Ok, centos7 is happy now. Thanks for the explanation.

Philipp

--BNG7CQe3h7Xvles/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEnZTDO4wmd424wPWRCSLGx8z5U5wFAmB1k0kACgkQCSLGx8z5
U5yg+A//UeIwNXU843k/fOilXV1vRDFnkbsWZmnUP8UeU0AEsQwoK2lAZ08Dr7Ds
JzGvvsRq5RtRp1+iX8kKSTUo0UiDfNGNk47HqxrPDnfXZLt4qVlYc4LygTyX0Lr+
r6mfjJJvRhOk+3TK6s0GBGjNZrJZnfuFYdsJxM+AU1Qzfm3t+6TT36ET+8HRxjnP
d2axcdaABNtaZNY/BKwGYvuiHW2Q6JYoWwz5reH8epbTwLG0AxPRBAS9TsVJsfyV
HHExMplrNRWBuYXr0GI9dxFxzZywQR+nlw5r6wxYcFRhk66wquoLC++9O4Ux99PK
m/t5bByJwWrHKLuiFpDzFO6BLOWPHPtaUZcWMTNgVbt5TxvK0R7bUfWMTMfw1Wq7
U2ElOb2yzEGHm4e4W5/v9YX5HhqoGewZ8gyVU5QmQuyusRLV978wWB+VvPm7kfxI
f7ftz12dyAwN2usGGiUuxbRfthKyCRXfi83lqmF7jj8vUIdW1mx7s9t6DNm6RVoL
UAsym88Reqye+2fuHpwIsSJLMRSVHEwY4S8JCsbPJOlPymec+Rx0VFrRXdJdeVbR
+WmLIZjmgzOCnjnp5hkSRth1WrPbcMk4otBnMMWlv6tmFtW4skZs/QwXr6P+9gHl
M51sRj0CTAcFpvcclSHa3jB8zTuCkQcUPln+U2jU4Esm83PvwQk=
=k0P6
-----END PGP SIGNATURE-----

--BNG7CQe3h7Xvles/--

