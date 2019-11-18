Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D51007D6
	for <lists+samba-technical@lfdr.de>; Mon, 18 Nov 2019 16:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=o9mmau0haTTAZdVpHGc+8q6SxvADz0vISOEZ5AXwcMU=; b=vTzzSyG8ntexaqPURwzVvoNcGN
	ao4uuwTmKx//T4RiZqzPasq1mHEHKGXZ4ymQsLtXxoDTw0ZFRXmfJcfTHtcbwzrILTxz7N10iwGPK
	968RPU7SQfHOzHsf0Tyof0cWxy5oL6cyZbyu8Q84b5ZWGMdqGiokRtY8iyVi70QizKdm5uup+t0+Q
	nsMymN63IJ8ekxM28tD4pdKTBWbX+FUD/IloxkYoHY49IHbyy2utGxvm2Nmbwp5HqSVILDEMpmf8h
	+apYtu79lh3SUgcnJVyFXB13QlTV/XCnW7DNr1wM7sIjIW4rzB2lRGZ6/argi6eqn3pwc+tUuGL+2
	gh6jJ+cQ==;
Received: from localhost ([::1]:48740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iWiXY-001Yku-Co; Mon, 18 Nov 2019 15:02:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38386) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWiXQ-001Ykn-Ep
 for samba-technical@lists.samba.org; Mon, 18 Nov 2019 15:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=o9mmau0haTTAZdVpHGc+8q6SxvADz0vISOEZ5AXwcMU=; b=q71DyylkTZeahV+dudZ9lSNzy4
 +nEiw2mxdvyaqNdjWoY+CHa6Z2g/WQvz978Ph5vO3gCn+HJ2WlPJQFlL4e7bGWhZPWz6zodLrDG1n
 7pRLbJMxZprTLIxjmjBXvinWILk5jzFXc0YkrXWkcGlayOyEH2+HK1VRGx3/jgPG8F5ny3All64CZ
 ogKuzikcUtLY64mmJqoarJ2qeeKJjaj5DzoALmGH9M0CeT1YTw41FDULjzR4cW2af9wMf0hpKjivN
 irR0ujwKNmelxqiR/1CSnTJjaUo8b0GY+/E2ixZ7bmp94hE0qZGz2S9F1DnxbZthU4m51QaQG+JxV
 hr/enHcd7Nr7yf/GWMW/6BWzryIxnRwCDWxQ35NmvS48I2jnOx011fvpvn7+1MGMTHi8cJMs6KFb4
 5UM4MpWDUpYKmCcrvl5q4R9I7KeehglLwjaxH0tXNAQC1a25L7le0V9+LAdaBv2AAncreVfpLBd6B
 BMU6FLzC+i5mgFVjKACOKsAr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWiXN-0002Vj-Pa; Mon, 18 Nov 2019 15:01:57 +0000
To: Uri Simchoni <uri@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: library versioning
Message-ID: <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
Date: Mon, 18 Nov 2019 16:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="u27KTipswrnc1D0VYkjuQfc8fcLFqpaYY"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--u27KTipswrnc1D0VYkjuQfc8fcLFqpaYY
Content-Type: multipart/mixed; boundary="6q1GwjybKU2e7CiVRGtvNsuhOOlgizDfe";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Uri Simchoni <uri@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
Subject: Re: library versioning
References: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
In-Reply-To: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>

--6q1GwjybKU2e7CiVRGtvNsuhOOlgizDfe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Uri,

Am 18.11.19 um 14:38 schrieb Uri Simchoni:
> (taking the thread of https://bugzilla.samba.org/show_bug.cgi?id=3D1384=
6
> to the list)
>=20
> Hi,
>=20
> Can someone reiterate our versioning scheme for libraries? I'm a bit
> confused because there seem to be some contradictions.
>=20
> - v4-11 branch has talloc v2.2.0 and master has v2.3.0 (additions to AB=
I
> - 2.3.0 was released without a Samba version that uses it)
> - Due to a bugfix, master goes to talloc 2.3.1 and Metze suggests that
> v4-11 should also go to 2.3.1 (and I remember that indeed this is the
> way it used to work)

Yes, that's it works for talloc, tevent and tdb.
Here Samba is simply a consumer of the api, which is very stable
and additional features don't impact older Samba versions.

There's also the question if we really need to backport library releases
to 4.11 in order to fix cross compiling. If someone wants to use
talloc, tevent and tdb as system library, the versions releases
from master would work fine. As it's no problem if the library
is newer than the version shipped in 4.11.

> Now trying to apply same logic to ldb:> - v4-11 branch has ldb v2.0.7 a=
nd master has unreleased v2.1.0
> (additions to ABI)
> - In the same way, I suppose that we need to release ldb 2.1.0 and
> upgrade v4-11's ldb to 2.1.0. But in ldb, we have 2.0.6 and 2.0.7 which=

> are bugfix versions off v4-11 branch - why did we publish bugfix
> versions off v4-11 instead of releasing 2.1.x and moving v4-11 to use t=
hat?

ldb is the exception as there's a strong interaction between samba's ldb
modules and the library, that's why we can no longer use the same scheme
and need one ldb release stream per samba minor version.

Regarding talloc, tevent and tdb we have an new temporary exception
because Samba 4.10 still supports python2 and python3 bindings (also at
the same time). While 4.11 and master only support python3 bindings.
That means in order to do new releases (which can work with Samba 4.10)
be need to do them from v4-10-test. The question is if we really need
to do that for 4.10 or if 4.11 and newer would be enough (which I'd
actually prefer).

I'd prefer that we only backport waf 2.0.18 (commit
09e282ec8173f2935bdb579e0396f269ce712e0d) to 4.11 and 4.10.
And we need new ldb versions for 4.11 and 4.10. All other libraries
can come from master.

metze



--6q1GwjybKU2e7CiVRGtvNsuhOOlgizDfe--

--u27KTipswrnc1D0VYkjuQfc8fcLFqpaYY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl3Ssl8ACgkQDbX1YShp
vVYkpg//UUcNYrgorc0yXrFASNfdnqBjpWj1cuUxvWBvYDbvybCcgLtWRHnWpzgH
h1+iYApikxFtCzrfcWbAvqjj+X1N0v9DSybxkC1uiB5qaC0x25zdPZh8i64cO/p1
Rwr0E8/Wf1cwTP+j8X34wLmxQtknQlV4HIlzlnrezy9jWWdeF5dOGGp7nO4Sq/+G
/mwzH6EV8Osrvt3uX189viKCnRViZOQ4t8BzJOMjturCOFoGv3ed4kKgHWfBYzsW
3kCE0JFrJ1l6F1CQElC0+C+gC1kTYyPjQYEugtDh/yhgba6I/+6SVaffDLrg7+rr
gAxb5R+tkrhXV168+4nSN48TxyyebFhP4MKYgR8p6vg5ZxagROS+aYjozv+hiAcr
s1GvHwQDTqzywPcMlSjiswc8tO5hWzk9ehXA8I0V1JaQIg4RgtnRbdKZGMrUq7tv
WtOrYppPoXoAtiousv4DTp3vqEgcYqgmwWSAbWAb1Q2b/Wyq4ml0GfcXyWJZVNmO
cYVgu85G5wJBU21nwNHwFVc3koeE0ej1ZLY92kLg86DYON+daR3KFMDcHbCuNrsb
Nqz4NYIHXN7ujDpz7ZJCsl9RvJv9OeFdrKwqAnf4gJzNQWXTzQgccU/1CU/a5HEv
3GpmwJBmKgn9b60YKUj3MR16MyzTg/SwqKE6ty28T+IgeCmJe5s=
=+D/y
-----END PGP SIGNATURE-----

--u27KTipswrnc1D0VYkjuQfc8fcLFqpaYY--

