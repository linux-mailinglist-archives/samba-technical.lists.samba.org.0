Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B97DBEDB
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 18:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ocjtg8hEzLvEP5nuMbOqFII7Fj4YABhWCXb2PSLLyB0=; b=b1E/dT9AGdIU5cJBO7bPmcfiG1
	qOY0Mtoy8oopY/8UMuiD3Bj4QQMGihCMkpjPRXpz88FbnCmj/M2J+C76eYBS8YhGGxcrEq5E9YgRk
	9+0TTmVUL6VqsU8eGliV8r8hr7FlbjZ4l4BeakNW3PFm198cc0/69fVBkwIfMjrar+ayATx9cZ/Ne
	TTKTwp763vm2TO+mpHRzZ8oHvoEaSch23tETQzQJb2T86Cb/rTIW7Fs1j13L7eFHMJxImch0yiEhT
	EJTD5K6hAV4/sp1hRTOUh1NUssvaOWU9HhfayjSUDKzKtfxiA96BOJIz7WQ2ywdHsafeoc6viPKb9
	ROCyGBEw==;
Received: from ip6-localhost ([::1]:54078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxW1x-003aY5-SD; Mon, 30 Oct 2023 17:26:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxW1s-003aXw-JE
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 17:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Ocjtg8hEzLvEP5nuMbOqFII7Fj4YABhWCXb2PSLLyB0=; b=vILUmzaMYuwS7Y+n47nKCVwDJH
 HZluNb/M+y5EoZ8M3ZB7GlGMGnAJIJyNKIvoYv1+iVS3quDoDgdGqMADqgfKEt1rRPgY4PxXBjaP8
 6Ob6rm8hGmSbKeGHwQlzUB0nGsTjNgy8BzhWJdiBi3X/8VIGLPiBEO54MsDsv/D5G4NarOiXdaea3
 q2W2VuMJHLK5/zkEQn2GjYndSN6k0IhXXRp3byLVXc1+SaOjUDAo2YCCakLI6Xw6QjcWGrVDxXqug
 Fvn3ra3zT9D3HuQcWpk9S22YEsd5d/sNshpLA7ub4uUNIOdoqfNuNoyyu+Akps+T9M3ukbt0SVqUI
 +WvIJNaOILCnfkYThYmtZCyTrIAPv/OAB4rOQxtWFFusVHqMAcngNrlTN/ZRqI3k4INo58/sLZzxi
 p4F46UuZ7idmYyZ7JCzHtZcEAPZZ7pT5ANkJwNFBs37COJJE/Tw6JCmIobcC/UcsXhUWFsjYaE6eh
 mYpQPYqNmSR40wL4M5q+gsPe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxW1p-003MKi-2b; Mon, 30 Oct 2023 17:26:17 +0000
Message-ID: <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
Date: Mon, 30 Oct 2023 18:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------03OS0HnQ7f4Uyp1UPLPAuvu6"
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------03OS0HnQ7f4Uyp1UPLPAuvu6
Content-Type: multipart/mixed; boundary="------------y9gDkqJPhZ9YDILLUmN9iZr1";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>
Message-ID: <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>

--------------y9gDkqJPhZ9YDILLUmN9iZr1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMzAvMjMgMTc6MjgsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBJICp0aGluayog
aXQgd2FzIGJhY2sgZnJvbSB3aGVuIG1vc3Qgc2VydmVycyB3ZXJlIHJ1bm5pbmcNCj4gd2l0
aG91dCBFQSdzLCBzbyBhcmNoaXZlIHdhcyBtYXBwZWQgdG8gYSBQT1NJWCBwZXJtcyBiaXQu
DQoNCmFoLCB0aGF0IG1ha2VzIHNlbnNlLiBUaGFua3MhDQoNClNvIGJ1aWxkaW5nIG9uIHRo
YXQsIG1heWJlIGEgdHdlYWsgbGlrZQ0KDQppZiAobmV3X2Rvc19hdHRyaWJ1dGVzICYgRklM
RV9GTEFHX1BPU0lYX1NFTUFOVElDUykNCiAgICAgaWYgKGxwX3N0b3JlX2Rvc19hdHRyaWJ1
dGVzKFNOVU0oY29ubikpKSB7DQogICAgICAgICAgbmV3X2Rvc19hdHRyaWJ1dGVzIHw9IEZJ
TEVfQVRUUklCVVRFX0FSQ0hJVkU7DQogICAgIH0gZWxzZSB7DQogICAgICAgICAgbmV3X2Rv
c19hdHRyaWJ1dGVzID0gMDsNCiAgICAgfQ0KfSBlbHNlIHsNCiAgICAgLi4uDQp9DQoNCm9y
IHNpbWlsYXIgbG9naWMgaXMgZHVlPw0KDQpUaGFua3MhDQotc2xvdw0KDQotLQ0KU2VyTmV0
IFNhbWJhIFRlYW0gTGVhZCAgICAgICAgICBodHRwczovL3NhbWJhLnBsdXMvDQpTYW1iYSBU
ZWFtIE1lbWJlciAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNBTUJBKyBw
YWNrYWdlcyAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5wbHVzLw0KV29ybGR3aWRl
IFNhbWJhIFN1cHBvcnQsIENvbnN1bHRpbmcgYW5kIERldmVsb3BtZW50DQoNCg==

--------------y9gDkqJPhZ9YDILLUmN9iZr1--

--------------03OS0HnQ7f4Uyp1UPLPAuvu6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmU/5zkFAwAAAAAACgkQqh6bcSY5nkZy
Sg//aIjxboE37ZjFhKv1F0NyP9mx6QBSaDX65PummW7EodbeVoOETcPHSNvKW1Hk50E8BnSh2uCl
pmVKLs/RWlHheIUaBN8w7B7t9EZLEQ+06hpCwOXRTpNe0fwEp7rLjVVnsjcZDWGqhGON4cyiPYG2
m2CxXKyT/bIUI8bHbFERxYnFWQA1i9rG05QoPwHKkEcohzBfSOZCZbGF2y6wdpm8uqG/v+6B22mD
naZQUr+LDDtjxgsKlAKiP7Pemo3NZ2qmgMOx+cx3AgqRXPkRDbIIkG/q+E+syYKCvPhvkZWcUmON
mlZ/zUzxgZZ3ASKKFQsp6YN6NTG1jGh529UDR0l5tBRk4BMMMTG5FL8NmcYZukLBsY2Y1+LljDtt
qrTHkh/F8pJL2t2YBdhfceEnv98cTGYA0fJsqlEd0eB8gKIFbmGJoH5+0Ta3lhRDMB/PnD6ZIwrp
KyNeeVm6wp4cpZjgo982N2HrJD0Eg/HDjq6V71RVurttnPqXlRaG5SMpQcESLVYbtvOlSACe5yOh
7lLz8P3E43DrsveRmYbmecey8lqPhyCAFyJsbCRK4oAYf9TOqbWkqEg5akkS0RcubpIwNaCYhYUI
esMJ4F8yPt41zR2AnYRqGYzPbOzrvL+x6Xh1AY3PBQkgEBtRQUAzOYUUYzcsn14eG86caZhAmto0
b+U=
=0GFh
-----END PGP SIGNATURE-----

--------------03OS0HnQ7f4Uyp1UPLPAuvu6--

