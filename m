Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38F7DBF8E
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 19:13:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p6Op0WAju9Xghos1LZJ4/JMMP8fi/8r4jgKJacxg/+w=; b=sHacRrBDOQhlGXKH796kNdx0F4
	yzo8c+hj9jWzsUF3vwOs+OnOTADa2a7kQGi1JfrEkM1Aqnk+JhEGAeKGonM0h93VSl7hVz2p5Bx68
	lWdbwpVbUibm737gwvFXrOVqE7Lr0vM/+uGGvYDLZzU+jKjRkfvpg00mp46h3Csi9A+QNcKnHILM5
	zjnaDXqKrK56da9J4kSVRSRRLJfUnleKJsZamPjz+a1SI/VYreVMOIb/v6XlcKgezo56QlRr2kCSZ
	igg7fzegbuRXc7+E0zTPByKmWt8W/lYIQgUeJ9LjJK7a8O9k4/dhjvFPc5COdG26XqJ+WAvv3dXvd
	53z+wGaA==;
Received: from ip6-localhost ([::1]:52978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxWlO-003bBC-7T; Mon, 30 Oct 2023 18:13:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54142) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxWlJ-003bB3-Fa
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 18:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=p6Op0WAju9Xghos1LZJ4/JMMP8fi/8r4jgKJacxg/+w=; b=NxhmCbCQSurDdkcDZyO9oroXEl
 TDxkn/U0x7G9HRnYL0IS4+e6t9Sv3DmErL9BXOTLY/fzEo51LG8/gX32nRQXF1qb9pC0vBBTh735t
 cU3hxxpidGhcFMeSQ6KiiZBrx+R8+/y3xP+RHo0/cLmTgD0VUagmYe0oOs1HLGACqApBOh+rd7MZR
 yaz/9Xh8wBx7uIBLcS836kH5orfCfmY6+PEKTivuxGyB5B0PEuSAQsH87NktDs+G3cj4JJMQnYW/J
 nrCWrraD/+PSuVEhp1tMsL6TAzleo8Lt3bafGXxRjWwLFh6aEgM1wmaxnS+qX8FupVk/yz5r4p3aY
 XOqpUJamyZ1Ls+8NimVPLYAvHNrcFAp2gXiE+p/pP5G9Rc1K0C3I7RFkTFiEGjJBlCSu8ibUVt1Ud
 D+rvQgLf6555WtCN606Smh4u+wakWpew5e09VICSg9RO0PalELpllCj45prlmTgFl1iRi1LJTQeOE
 Wp2M56JBStKWsdKWxVCFm4cn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxWlG-003MlF-2K; Mon, 30 Oct 2023 18:13:14 +0000
Message-ID: <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
Date: Mon, 30 Oct 2023 19:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0HOyOgoRdBFALiGcCdcjeUjX"
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
--------------0HOyOgoRdBFALiGcCdcjeUjX
Content-Type: multipart/mixed; boundary="------------2d0mVufShmMtvqtThTgeZayE";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>
Message-ID: <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>

--------------2d0mVufShmMtvqtThTgeZayE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMzAvMjMgMTg6NTIsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBZZXAsIHNvdW5k
cyBnb29kIHRvIG1lICENCg0Kb2suIE5vdGljZWQgd2UgbmVlZCB0aGUgdHdlYWsgYXQgYSBz
bGlnaHRseSBkaWZmZXJlbnQgcGxhY2UsIGJ1dCBhbnl3YXksIA0Kd29ya2luZyBvbiBpdCB3
aGlsZSBhdCBpdC4NCg0KVGhhbmtzIQ0KDQotLSANClNlck5ldCBTYW1iYSBUZWFtIExlYWQg
ICAgICAgICAgaHR0cHM6Ly9zYW1iYS5wbHVzLw0KU2FtYmEgVGVhbSBNZW1iZXIgICAgICAg
ICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTQU1CQSsgcGFja2FnZXMgICAgICAgICAg
ICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy8NCldvcmxkd2lkZSBTYW1iYSBTdXBwb3J0LCBD
b25zdWx0aW5nIGFuZCBEZXZlbG9wbWVudA0KDQo=

--------------2d0mVufShmMtvqtThTgeZayE--

--------------0HOyOgoRdBFALiGcCdcjeUjX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmU/8jkFAwAAAAAACgkQqh6bcSY5nkbr
QA//YN2S27PQlla+ogh4MV1Q0/QcspuEFmsdLNU+le6vWZT1SH7Jhj28Qap5+tm//fUYmwkV1fFq
0Pdw70se3/rLbTjm1rsTBSEvvoKDPxGoVwRfFqlPPZfsMAi9sRVWmhsU1jsDQTMbfvXZIfx0JEaF
FuXe9PO8H5aS1SbuUX6cKwXKlz+HPT7BYy7l+yXUBf7KIcWevwOjP4n268JfdvJP5yGoczasLuRE
GJOMU/mfUdGvQKFMiSc31LD3hIsP0JE6jR3oS1PeAFxZc2UIFnR9Erg4CYn+9aj0qPkUUNnxesBi
yq4perIASGforYdr1R2mDCdzsvlyvjQQ9wYJzn2R5BA5cvhfK+sYdOEkwA+XQyndbHb8d1HqUQiE
zuvJL8PjGsWkhUkUIvPQbuIfbAT1MtK9ZPtwadL6YpmLOTKPzL/mbiDdX089Slbc0MexgsxiVuKD
SBNuBKONwOxuSA2uYr8rc/3AKyq1G5/hqzs8li+G//UcZ7ER4MKiZKZaFUmevmXHhF//HvQGdDIw
Iuv/1jkm6zYhomVdD8jZjwz5f4ylYNIfIQLhL2qzydxiCtH/css8ni8kEIDp2paWL0IDSLUZv24U
jeET5bi5gSZTVqfYAuxSd6uMPMCiO0J7tMlV1CMyh5ftigJZr2IkhECuZDmdkJFrjADr9MaWnXRZ
c6o=
=dopM
-----END PGP SIGNATURE-----

--------------0HOyOgoRdBFALiGcCdcjeUjX--

