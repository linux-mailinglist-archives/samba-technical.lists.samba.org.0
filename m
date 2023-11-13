Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 635BB7E9EAD
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 15:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SoA1b8Up4x8pZio6ByZeNAkTlls2h3yw+QI4oJ4g1QY=; b=WWKAIc8Iw2OJTwE342chFlp2iA
	67yH5gOdlaVxVsYSZkHPxN7S8YTuQaF2aC/6ZhuAnNhppTVhlK/XmKh5ToBx9dwB+zCpXbSNFTWjg
	ijvQ/VWgNHa/jN3TQfR1ur38/6vM1q21ZNIUL1qO6zCR11rTVb24hX8/X98mIkbr2yN4iPB5zmJX4
	m6djpfhGEwmV9tatPzRazzFSqPjc2hySIZkGDF9UUOBhOWx0+nAacESfLdYesayta/QXMLTiRsssD
	ajd9wrSOO8EjYyAcZj97mfwfHBIb2iwuzXx0kA6qcVIatAAEU520eGazElWRd2pH2hB2LPtVufq4T
	Kjk4PQeA==;
Received: from ip6-localhost ([::1]:50506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2XvE-007x3C-UQ; Mon, 13 Nov 2023 14:28:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2Xv5-007x32-Jb
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 14:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=SoA1b8Up4x8pZio6ByZeNAkTlls2h3yw+QI4oJ4g1QY=; b=r0zCKsgtC+t6FYVwJkdh+1cb/T
 BAePVLHWgFPbiJt8ciKxpKuTrIqfrotv5RN8gorGT2bnlR8xsyIzvXLUxE9eoR9m6sKQ3p59ly4Ly
 J17AOiy0qSEm9C94cEJyxJtrXUI3bsKWCXDsWSpyDE05eiMKxsPDPOLLKzBzN8MUVCJlPBoW9G3c8
 YYhiCx0oS/Gp1pbbz5mYuGjnaOedTr4qVzdTWce9l6/Gn9Xz1bHPDqNaklnW+ubutFWCg9tD7rvq+
 XoOJn7zSiAePnqn/FhuZUmFkIsVdDH/qS5bZAp6b3kIcTCzKOXMdf4TH+U5DF4KvqaN3zvfJmAY32
 gaSw8suBv309o4RJAwPxSrq4PVnTnYztBDJKzGtFxGcJWLbTNmOliPE6StrgGX6vW3d2HpzBHBKzd
 UxiHLSZduC+ZwBhReM2K4YAnQD0RVT7f8UkihF9EDw68ekLCg4f+PAqg1oOOes9mIHDUkkJtxk+Ul
 R2HSUxT1cFezfubj7Lxhb0WN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2Xv3-005veG-2Y; Mon, 13 Nov 2023 14:28:05 +0000
Message-ID: <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
Date: Mon, 13 Nov 2023 15:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: I want to make ADCS support better and I need some advice
Content-Language: en-US, de-DE
To: David Mulder <dmulder@samba.org>, samba-technical@lists.samba.org
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
In-Reply-To: <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------08J03xrtEVI6fgP7J5NGDUaM"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: =?UTF-8?Q?Bj=C3=B6rn_Jacke?= <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------08J03xrtEVI6fgP7J5NGDUaM
Content-Type: multipart/mixed; boundary="------------gWIbSu0GIJHRhi689RHbTpk5";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Mulder <dmulder@samba.org>, samba-technical@lists.samba.org
Cc: =?UTF-8?Q?Bj=C3=B6rn_Jacke?= <bjacke@samba.org>
Message-ID: <6c0ddbb6-4375-4d18-8e4e-0114dc7736cd@samba.org>
Subject: Re: I want to make ADCS support better and I need some advice
References: <922de58f-d011-427d-8248-9f8ce7c90e74@app.fastmail.com>
 <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>
In-Reply-To: <19507e01-a2f0-fcd1-9b98-47a72cdf11f2@samba.org>

--------------gWIbSu0GIJHRhi689RHbTpk5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTMvMjMgMTQ6NTYsIERhdmlkIE11bGRlciB2aWEgc2FtYmEtdGVjaG5pY2FsIHdy
b3RlOg0KPiBJJ2QgYWRkaXRpb25hbGx5IGxpa2UgdG8gYmUgYWJsZSB0byBjb250cmlidXRl
IHJ1c3QgY29kZSB0byBTYW1iYSwgYW5kIA0KPiBJJ20gY2VydGFpbmx5IGdsYWQgdG8gc2Vl
IHNvbWVvbmUgd2FudGluZyB0byB3b3JrIG9uIGNlcnRpZmljYXRlIGF1dG8gDQo+IGVucm9s
bG1lbnQuIEkga25vdyB0aGVyZSBpcyBzb21lIG9wcG9zaXRpb24gdG8gcHJvdmlkaW5nIHJ1
c3QgY29kZSBpbiANCj4gU2FtYmEsIEkgdGhpbmsgYmVjYXVzZSBvZiBwbGF0Zm9ybSBzdXBw
b3J0Lg0KDQppaXJjIHRoaXMgd2FzIGFib3V0IEFJWCBmb3Igd2hpY2ggd2UgZG8gcHJvdmlk
ZSBvdXIgU0FNQkErIHBhY2thZ2VzLCBidXQgDQpsYXN0IHRpbWUgSSBjaGVja2VkIHNldmVy
YWwgbW9udGhzIGFnbyBBSVggc3VwcG9ydCB3YXMgYWJvdXQgdG8gYmUgDQpyZWxlYXNlZCBp
biBydXN0LCBzbyB0aGlzIGlzIGxpa2VseSBub3QgYW4gaXNzdWUgYW55bW9yZS4NCg0KLXNs
b3cNCg0KLS0gDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgICAgIGh0dHBzOi8vc2Ft
YmEucGx1cy8NClNhbWJhIFRlYW0gTWVtYmVyICAgICAgICAgICAgICAgIGh0dHBzOi8vc2Ft
YmEub3JnLw0KU0FNQkErIHBhY2thZ2VzICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJh
LnBsdXMvDQpXb3JsZHdpZGUgU2FtYmEgU3VwcG9ydCwgQ29uc3VsdGluZyBhbmQgRGV2ZWxv
cG1lbnQNCg0KDQo=

--------------gWIbSu0GIJHRhi689RHbTpk5--

--------------08J03xrtEVI6fgP7J5NGDUaM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVSMnUFAwAAAAAACgkQqh6bcSY5nkZT
mxAAh8oWseaSTd/Fl4QvAsYnw2LmiLV50MEYHdOwvf0RghFs/5QG5br6qZSYgbU4DR296l2NFQf5
f9vQWruQNmxSt6a0rV40rI6rUdwjbwIv/28nISVpcddqCdjXOdetLqjC8WOsnwZW4Rn3JaYen7vs
2fRju8fs10dLKAa4gO/kJ4bGAsTpNJE1PqACaU27XxkoJr4fwA9r8R4hxs0rAW+r8jC6WgCRdzbl
F2+xqtCshlbA/i7tryv/5eKSAksyAnlC+s1d0wFiOvyEI6sS3FUXCuXUWY/Osjlt58+yuLjQ8YIs
AiN99fi5Z9OpTEMnPgxzbzJKzj6tNheanMdU3Z2ffohn0P1cxWjj98W8TSBZherhj0Xhy6a5k3m6
aHeWZDD5Vh6HrB8BYoOfdlACAM8UpRAgTz8Poj0Dbo1nonEuTvX7qd7HCJITn4N3PH56repTdp1U
XOzwYjMS3cyi5D8fBVxh2xco4L8RFFwU8nRAsyKNRE9/H4zWzsS22w+DHQSi1bmcqShHU0WlmkOB
1P9ibeJJYosMg6AOIHLm6+yvoyIi4kLZuIchBtRAqXxlk6fcaEQCjBSu9QCbONbY06QSjeYNQpaW
nMra8D2DA9UQ2FWZOy94htIZ0MVThNsXSF1aaQLJvwcOEl/Pi0sk0aeQLnN+0P4BTG36Zkdvxzb+
7vg=
=0UMR
-----END PGP SIGNATURE-----

--------------08J03xrtEVI6fgP7J5NGDUaM--

