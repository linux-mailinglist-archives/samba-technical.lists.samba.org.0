Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5D2099B6
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jun 2020 08:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5mnPHLLhYW2P7A/H/SaEOWH/fN8dkkuVeh09PpZLnI8=; b=tEtViiC6J28DDKWBmbxGIRKaZ+
	tGsAoOKluT8tgt1cb39UIhemNCP3/ZhMX+MiG1XbrwvDAEbsicrvjQovlWVJrxkqVFulAyozVsqPi
	Szx7M2j7xYI6DSOms1p8d93EmE9E/u/qhUDucKLpi1DRU2ir/Vnk5oJLUSvp9XYTJCCUn8EWBwuFg
	/vslaXX/7zOKJDafwkS6xL0GZJ9vWOwvJquqiicZfieTVy6uI3+i7QZ3dMWps4j32bIflSMJU90Ck
	R4pmspHTmDBz/Hsiu1VxEXPRs21gzVnAB8kSDSIVNanHz9lFwtHYlirUhglGg10UZutuDeWx+wDlY
	/cmxJiug==;
Received: from localhost ([::1]:63404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joL3K-002FLU-Nj; Thu, 25 Jun 2020 06:08:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32740) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL3E-002FLN-Do
 for samba-technical@lists.samba.org; Thu, 25 Jun 2020 06:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=5mnPHLLhYW2P7A/H/SaEOWH/fN8dkkuVeh09PpZLnI8=; b=IXuKlc3uh4DxXrVSAYbL6D1TiO
 hyvF8Y0BNjM0MXD1+9hmwPgDXROJgP01Hs+HnTI0vkF19FkPhVDyQ39tyP/c6v3s+BS755On5PNIn
 rc88zrAJ5z+c027CuoyjGH8mzH0ZQZLx6ecoduj4qXeCaDLMnfDzy2m/Rb6DyQqmN+B/fuZ6YtRl9
 Vrj5clsOyWET+Uvuz64OwfYdk3doK+HDSFNvdXbj/pMYcODvClIFD8DacgDjo0P/kuSAJ1Yxh7qAc
 Wtt2SGyD860pdy+arXbVgf7k2Qs94Q0oXXPcy7IyGUaugqMCIuY/nAXlKnPagsVNpPL1XHF/VrXzf
 +79DUFqoRAOmT32tEr3CL9DhrKaunUPqvCgJvyttE57r4esey3fvxcgstanMPGlcddlO6Np65UMIe
 bm7Pfb7X7oxap63l9lvjNzZ6UsVwIaR3mXjTCtId0RFCfuQic8gs4LmyGm7oA2uydwQZm/oVN2s5q
 4MTKEt8IHmtFTlh3BO0oXcG4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joL3D-0006I2-Gu; Thu, 25 Jun 2020 06:07:55 +0000
To: Andrew Bartlett <abartlet@samba.org>, Anoop C S <anoopcs@redhat.com>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
Subject: Re: network namespace support in selftest (was: Re: socket-wrapper
 fd-passing)
Message-ID: <c8aa6a4e-51b0-7f3c-9144-395e8f1869ee@samba.org>
Date: Thu, 25 Jun 2020 08:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="E2pfhnqrwUsHbR1tCGyP393TGej6VtFW9"
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E2pfhnqrwUsHbR1tCGyP393TGej6VtFW9
Content-Type: multipart/mixed; boundary="ZXwg2s6P9kEOkj3cjmLQp2won1LOS7GPC";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Anoop C S <anoopcs@redhat.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <c8aa6a4e-51b0-7f3c-9144-395e8f1869ee@samba.org>
Subject: Re: network namespace support in selftest (was: Re: socket-wrapper
 fd-passing)
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
In-Reply-To: <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>

--ZXwg2s6P9kEOkj3cjmLQp2won1LOS7GPC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 24.06.20 um 23:26 schrieb Andrew Bartlett:
> On Wed, 2020-06-24 at 23:14 +0200, Stefan Metzmacher via samba-
> technical wrote:
>> Hi Anoop,
>>
>> I rebased your fd-passing patches on top of socket_wrapper master.
>>
>> See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/
>>
>> Please also notice my commit on top where I added some more hints
>> on a better design:
>=20
> I've not looked into this in any detail at all, and I'm sure you are
> aware that with the network namespace mode for selftest we can avoid
> socket_wrapper and so base ourselves directly on kernel sockets. =20
>=20
> This of course requires privileges so has other implications, but I
> wanted to mention this more broadly in case this helps us get out of a
> tight spot here.
>=20
> This is the work Tim Beale did a year or so ago.

Yes, I'm aware of it, but it's Linux only.
We may be able to make use of it for smb-direct testing (which will most
likely be Linux only too). But multi-channel should at least also be
testable on FreeBSD with just 'make test'.

metze



--ZXwg2s6P9kEOkj3cjmLQp2won1LOS7GPC--

--E2pfhnqrwUsHbR1tCGyP393TGej6VtFW9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl70PzQACgkQDbX1YShp
vVasag//bhE51j3qivLWYWiuUtWu/1nfQgDg/0/RN9JlXIWJnnv8hbnXiieIDl7S
EbPxOP8oVJFtO6g8C5ycCeejKlVWqv9wslL3tOpULsM0V/K6VlMq1tT4gjvbnMl0
T3nHEnFPQucEpZPQzEGSNz8/cUFYML32iP2D1KIO5wMI8F55tf/PZYbCyAVZf7h4
9pH0a+xvzVKOea9cw2z9Ja1Y/3I5KFA/idus8wlZTVe2Rr5SyLf9R7E8UsLRq2rW
lnfYxbnCvfMLnmeXYLoe2LwETjGnrwc8qnV9iwiC8ggaCHJBbjb4qlztOBbC56YS
MLUiP9pBD3s3lKCysdbH8QZDVQYqq95dyGpndR9whuwQhZhWW9Vm9YLrvwvD+dK7
mEPqXBNnyGSclc4VUwLSit616hzy/tHv12aYB20HxQza2k96Lm4VV8ntR+3OtMoe
5Sefk0+Jblrivhr/G8MdHDkeTLtv2s5y8CnecnG+ML2RYuZHwEV7K6BcJhqMX/uA
KAYgoRjKDi5aBcdfgo4FFP+0P6RlE231hi9qQ+y5+JtetiduwObptrTNrXGCAHNm
iTgPwJFeTCQcErSruGIuZMqWWQjMxoScUvRV/hEN/IVOel4l/iT2hN9kP67Yh9OO
56aa1Yts4hsCV77Gf7ybgwv2F8km4SCd7xsYMZ390ZglNj+RwOQ=
=tSpo
-----END PGP SIGNATURE-----

--E2pfhnqrwUsHbR1tCGyP393TGej6VtFW9--

