Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071FAD3B12
	for <lists+samba-technical@lfdr.de>; Tue, 10 Jun 2025 16:24:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=1SPAyIZ1Lk9M4AuVLSIHmuPrSLWmT8GABw+Ss4e+sF0=; b=wWI6ZyAvCIw3V4XwfqSZeiGtQh
	iSKxDIi8ym1gQrxB2nzY9JCZNmY189A6IehL2K6QIqQBvE/0N5hJXRo3k6DsmmQTg4bxePsabm3gh
	FJqD891OhWAYOUalKHomKUt/oryQpUaeNLdeBLzh+CnJ+RNAiAjEVofvMyhMSFaTPM+6TLaS2D5d7
	aaLkr7wQk76EWFFq53Tk3c/TafDINydyI7ODJ/oECisD5L4Xr8o9jMb7nFfhUEjJvRO4ERUKR7I8Y
	x8Xa54kEnvJisfDC5HTVbaFHcqyWbCiFuXAjLwdyYvEd75PFqiyMh/rJuP/hBKpxpJQO5wz516stI
	s2YSGWRw==;
Received: from ip6-localhost ([::1]:54712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uOztB-006xIs-6L; Tue, 10 Jun 2025 14:23:45 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:34371) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uOzt6-006xIl-3b
 for samba-technical@lists.samba.org; Tue, 10 Jun 2025 14:23:43 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id 00527C0F57;
 Tue, 10 Jun 2025 16:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1749564446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=1SPAyIZ1Lk9M4AuVLSIHmuPrSLWmT8GABw+Ss4e+sF0=;
 b=ncvdAhADtzh+xm7NK1VO9k8mYbCjNdzuxjH1Qej6ZebwwdJPK0Z/99g+fBmp0jG1juVdKe
 mfFvdb49jo5yl+7q0KP0QXnwvgYtdZCeZQpfYROg9lkB55yXmB3UuprqgHg2q9qrhPiXwN
 VJA0L4WF4vP9Zfl6XegY9C1/PdOxNtZRUAWIN0Z/PsZDqtX7ry3j90FgkA/G/HnKZWcY0M
 BME2pkUUVvNaVHd3UMVGMJgfYszVSXVbctrLSvXvfGAGSXY3ag6MrmEb49/YixFvHl41ou
 EGllxdwCiMVXCdzXPzExZAraOrZP+JEUV2HcGGl+C0t25ff6YreQI65mxwB3jw==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id 43rQerOvMTsw; Tue, 10 Jun 2025 16:07:17 +0200 (CEST)
Received: from [192.168.123.203] (p5b240cb2.dip0.t-ipconnect.de [91.36.12.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 2FE95C14AC
 for <samba-technical@lists.samba.org>; Tue, 10 Jun 2025 16:07:15 +0200 (CEST)
Message-ID: <e7ab3d5b-bc7d-4ac7-b9ac-da587c9e4fd2@kania-online.de>
Date: Tue, 10 Jun 2025 16:07:14 +0200
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Authentication Policies in Sambs 4.22
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pqPJI66DsfvrltKnBLOR0mrZ"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pqPJI66DsfvrltKnBLOR0mrZ
Content-Type: multipart/mixed; boundary="------------PYAKII5Z5Qy9RHcT9WzbQn5w";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <e7ab3d5b-bc7d-4ac7-b9ac-da587c9e4fd2@kania-online.de>
Subject: Authentication Policies in Sambs 4.22

--------------PYAKII5Z5Qy9RHcT9WzbQn5w
Content-Type: multipart/mixed; boundary="------------DPko6e1WK6n5RTxvFOuVyXP8"

--------------DPko6e1WK6n5RTxvFOuVyXP8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpJIG5vdyBoYWQgdGhlIHRpbWUgdG8gKGFnYWluKSB0ZXN0IGF1dGhlbnRpY2F0aW9uLXBv
bGljaWVzIGFuZCBzaWxvcy4gSXQncyBzdGlsbCBOT1Qgd29ya2luZy4gSW4gTERBUCBJIHNl
ZSB0aGUgc2FtZSBlbnRyaWVzIGFzIEkgc2VlIHdoZW4gY29uZmlndXJpbmcgcG9saWNpZXMg
YW5kIHNpbG9zIGluIFdpbmRvd3MgYnV0IHRoZXJlIGl0J3Mgd29ya2luZy4NCg0KSSB0aGlu
ayB0aGVyZSBhcmUgb25seSB0aHJlZSBwb3NzaWJpbGl0aWVzIGxlZnQ6DQoNCjEuIFlPVSBh
cyBkZXZlbG9wZXIgb2YgdGhlIGZ1bmN0aW9uLCB3cml0ZSBhIGdvb2Qgd29ya2luZyBkb2N1
bWVudGF0aW9uLiBUZXN0IHRoZSBkb2N1bWVudGF0aW9uIHdpdGggU2FtYmEgRENzIGFuZCBX
aW5kb3dzIGNsaWVudHMhIFRoYXQncyBieSB0aGUgd2F5IEkgZXhwZWN0IGZvciBBTlkgbmV3
IGZ1bmN0aW9uLg0KMi4gRml4IGl0IGlmIGl0J3MgYnJva2VuIGFuZCB0aGVuIHdyaXRlIHRo
ZSBkb2N1bWVudGF0aW9uLg0KMy4gVGVsbCB0aGUgd29ybGQgaXQncyBub3QgcG9zc2libGUg
dG8gZ2V0IGl0IHdvcmtpbmcgYW5kIHRha2UgaXQgb3V0Lg0KDQpBYm91dCB0aGUgZG9jdW1l
bnRhdGlvbjogRm9yIHRoZSBmb2xsb3dpbmcgbmV3IGZlYXR1cmVzIEknbSBtaXNzaW5nIGEg
d29ya2luZyBkb2N1bWVudGF0aW9uOg0KDQotIEdyb3VwIE1hbmFnZWQgc2VydmljZSBhY2Nv
dW50DQotIEtlcmJlcm9zIEFybW9yaW5nIHdpdGggRkFTVA0KLSBMaW51eCBHUE9zIChTdGls
bCBub3Qgd29ya2luZykNCi0gSW1wcm92ZWQgS0RDIEF1ZGl0aW5nDQoNCg0KQlRXIFRoZSBz
b3VyY2UtY29kZSBpc3Qgbm8gZG9jdW1lbnRhdGlvbi4NCg0KDQo=
--------------DPko6e1WK6n5RTxvFOuVyXP8
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------DPko6e1WK6n5RTxvFOuVyXP8--

--------------PYAKII5Z5Qy9RHcT9WzbQn5w--

--------------pqPJI66DsfvrltKnBLOR0mrZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCaEg8EgUDAAAAAAAKCRBS9tTdG7aKtfBu
AP0SCmWxUEyfiaQPWIcHAPAIf3qhGDpzRpCg7u0ZikcM/AEAiA0ohfSVytvs4byrJ8Khg+CFbV2w
MdrSy6uHJFsN6gY=
=1HG2
-----END PGP SIGNATURE-----

--------------pqPJI66DsfvrltKnBLOR0mrZ--

