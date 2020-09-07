Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C82325F475
	for <lists+samba-technical@lfdr.de>; Mon,  7 Sep 2020 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=NTIFNJDDGOaaLbiLScgl/a4x/EQ7hQ8fkCHGG7XWe9c=; b=vMijU4EBP2AbGhgCehb227D7Xc
	GSeyDSRS4EdG2Z8XPgQaJCla+0vmmGtzjNNojAv7znUb0wvQd4E4POcSlPjzsRj3aXJyAkIPyOH/2
	BIyVj2DOHnZXkAv129l3uQmQcSpngpjnx7BjphagQhQyx18ohl3esYVQLzKLWqOakk0nL6bndfSbs
	cwMCE9Lf65pYOcOLe1PVZypYMV4D9dWSoErdjcjNUopdoXVC7glkJKS4IcOzLjGcD/T1QiarqkzhN
	HCisEKlssnGbLJ4TArqvkU4+3QVWFknCBrnWsuTUtT5Le0chcjp3QdsdhSfP9ujsnqG1imbq6wVJI
	IExPrdvw==;
Received: from localhost ([::1]:64598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFC2z-004SQG-HB; Mon, 07 Sep 2020 07:58:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21842) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFC2s-004SQ9-42
 for samba-technical@lists.samba.org; Mon, 07 Sep 2020 07:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=NTIFNJDDGOaaLbiLScgl/a4x/EQ7hQ8fkCHGG7XWe9c=; b=Lwp52XgdJXbNB0fZAamB93xukg
 6jOy6p5cjaBQZpfTK26GeatDJ98jJ5uz1PTv3C7Vw9W2KFU/1wH/4HielkWRthpwBp4wUHdNPnZdW
 tD/HxqvwVPi2t+tDMt8ksNpgTgTILXdRa4SIvpfEfPI+OU3+ssXR2cq+0UPS5q3gGQW095HLOjoLg
 q9uVV9R/VOaJ6sAfryx2losEu68aXh9OYr4cihpzpHXoejrQk0UzTPfaaV0NuskAVOrtE3qn6nEh6
 Ute8wVyI7r0KHIh/k8WwbhZ5pBn/zBtOYCWMClc6fnHDhrhuJ1TU6mGDfajUc0/31cE8KpYxsmmvj
 mbuNpFkytfyKH8RiSalOPiZ93qQgLDtW0YO6nUnY6fWP8YTkKI+VEECzK0Hq94QSBHnf3NvBmqZoH
 erSrtqXYb8XxbTFJD+rjYTwLhY1FRek9+4zfiUK0jXCV61HQiApmhH2fLavFjLRmovWb0DlKgqgZU
 zECqio4cDhn0me8p83WdcBku;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFC2r-0003pc-3V; Mon, 07 Sep 2020 07:58:33 +0000
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger <kseeger@samba.org>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
Message-ID: <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
Date: Mon, 7 Sep 2020 09:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="b1dhKBwbecxFxEuEq35uWyi5TOiWJ38FU"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b1dhKBwbecxFxEuEq35uWyi5TOiWJ38FU
Content-Type: multipart/mixed; boundary="khXBPcH3zfAzivwcaOAmFmDmlJRpiQseW";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Karolin Seeger <kseeger@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <e279b12e-0b88-3f40-3733-ea575486db28@samba.org>
Subject: Re: [PATCH] [WHATSNEW] Re: Drop Python2 for the build?
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
 <CAOCN9rwV1JJEH04cuZUK9nBBOw83HaymwU7OYjXLiyahkfL55g@mail.gmail.com>
 <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>
In-Reply-To: <12ae82a7f574030f0911b51f397ece6de2c557b2.camel@samba.org>

--khXBPcH3zfAzivwcaOAmFmDmlJRpiQseW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.09.20 um 08:14 schrieb Andrew Bartlett via samba-technical:
> On Sun, 2020-09-06 at 01:08 -0400, Nico Kadel-Garcia via samba-
> technical wrote:
>>
>> MacOS has working python3 according to my developer friends. Any
>> operating still based on python3 is so old that it should *not* be
>> running a contemporary Samba server, only perhaps cifs-utils for
>> mounting from Windows or Samba servers on a more contemporary and
>> securable operating system.
>=20
> Thanks all for your positive feedback.
>=20
> Without pre-empting the remainder discussion attached is a proposed
> patch for the WHATSNEW for the pending 4.13.
>=20
> This gives our users fair warning.  We can then change the build system=

> at our leisure (giving us a little more time for user feedback).
>=20
> To be clear, I'm not proposing changing the actual code in master yet,
> please do continue to send in your feedback. =20
>=20
> (Even after such a warning is given in 4.13 we can still change our
> minds, but our users will have been warned).=20

I guess you mean: we'll remove support for Python 2.6 as well as 2.7?
This is not really clear from the WHATSNEW entry.

metze



--khXBPcH3zfAzivwcaOAmFmDmlJRpiQseW--

--b1dhKBwbecxFxEuEq35uWyi5TOiWJ38FU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl9V6CQACgkQDbX1YShp
vVZOww//X55zYcEihRu+UQ9ux0PZx6A15XqBVYVYmYljtWs/GNO3ATVfxQ+rqoKd
QVpTxv0w+7+x0gHRtZAD55WP2y8t4jWcyhMioMq/PTMjnoPAVq+gPXBAu9JVjLD/
SGdKK1wUDcJm1VFmVgJGimW67Z+QC/ADCAsbr4WxF0toK7V198XC7OEU4sy39X2F
f6LJs2cF7mJhfRJwoCcQ8M+3R9QZplnPcs34EXT6w3pXBQxo1Tp22npMrVH+xA1n
gUNFIxv4Aurivw86nz4zHLIGii/aaVUG8aQHAfd9raYHbnF0RHOLdNiFQbhc/H0o
d0tDu6ZZoru9Lq2oddR/BlmiVmwRXcAyt93I0y8n3q7E8XlOMljFRmBkLGMGT86/
6tNQQ8vEQj8w+//wBFyUPdzudz1THxaIsF3cGFVn72j2vWQxTFle5TPSBXnYxeHx
VbpNaEa6nMEfUe4mx6kNrm2lgABmgezBqvshlcPqrYN9GWotoXxDOPTlKQyAA1Ug
f1fkGHRro2ZhDDtd3aR11ciDvwzYSVs1Ss57bLVCwnozPPFIRwD6U5+3kysmSN4k
rixvqx0B7s52DoanePFqOS5XxxwJ/qBhxE67wECo5h36QyaP9Php/Vovmtq3yW0w
BarjW+FiLVbdt2bdxDK59p3pSTW4FqmgMlicpb4IhUD0xhWp4j4=
=8Cgv
-----END PGP SIGNATURE-----

--b1dhKBwbecxFxEuEq35uWyi5TOiWJ38FU--

