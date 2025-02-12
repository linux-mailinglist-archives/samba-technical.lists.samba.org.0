Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEBA32D2D
	for <lists+samba-technical@lfdr.de>; Wed, 12 Feb 2025 18:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o6cjl2BNpJPSE0QEZoBlqL1EJUQwVEdGw1hrNBIRY/E=; b=HslT52IEaLXu3sag79FGhFPI2F
	HyxDFrrKI682Kobl60syryw08WGMq7iiN5v6u/zbY1keVoaLtDlwuwhkXs5KbcddF6DHXRbJ0+TPW
	dbdjXYRmBcje4JFGjBPFP8RzvQS6W9Mo64626D6OBHkR3nWwScvXs0npudBYpRhDxvUN9fxGNbQKl
	VEK3pxZywkv94NMnUr842x/ZhJFq69QUXJkhrRUH2exiz3TxDjrUxGj0KMZxOlJZ8hewvNGQ20fvc
	DD5bv31V5jNSi3b0bxberZ7uE1mPnA3++C8b7G069ZP4gkH0X+NuvYsrVi66FoV6F84y3RBSBv6QO
	ICOJ7DQg==;
Received: from ip6-localhost ([::1]:31712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tiGL2-00CH9q-HL; Wed, 12 Feb 2025 17:15:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30636) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiGKx-00CH9j-QU
 for samba-technical@lists.samba.org; Wed, 12 Feb 2025 17:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=o6cjl2BNpJPSE0QEZoBlqL1EJUQwVEdGw1hrNBIRY/E=; b=V38PiAaD7Vavd+/VuHtLdR7g11
 /iH3YO6CTCehBXXfLNvFIJRhJI/h/c4ZelaQ9/3yaskVlMndc4pmoUZGl/xUAVzTjpK3DjXm+zBbf
 nY58U0gIJY0tsv1U2sjIhKMUUk3A0+UGh8bNsvFqgA9FbMWd2n72rOhC+f6eFPm+JxuORMYLDUTCc
 iVVHk2gTYYhhiUUwPKv/Bw5lq/lUwv1WBBo7vXihtsO7olp1EME+h2Rl209UjShmh3V37zYOjafVI
 K2c4jmZVyHUbpv6npBoyM56zxIY0FxlsxKZtg28z4dpX0z0woU4U8UqDfp/GdLu9XHnBx8dsWWPLh
 nmul/Wv8ZJGkk7o/Euq3KScvUBjzGR3sE4IgthWLKDIc+8GJuxzrhb2hAftKpWTAm0Vqn/DmsnQrr
 eCuJBOy5xWYRTv8iHOUjh9mlV5AUJaaX83I2CiH3R3VIN8Q8yQNjBccNDq6QwMmw48Td5dv8BqZOo
 imA3YiyPEjgDHo1lz9Zhmfy5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tiGKx-002Efy-0O; Wed, 12 Feb 2025 17:15:47 +0000
Message-ID: <e2b5b40b-fc56-4ade-b264-0f84f33f44b0@samba.org>
Date: Wed, 12 Feb 2025 18:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
To: pb+samba@Arkthis.com, samba-technical@lists.samba.org
References: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
Content-Language: en-US, de-DE
In-Reply-To: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EX9C60aUig93m0KBoq1pn1lP"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EX9C60aUig93m0KBoq1pn1lP
Content-Type: multipart/mixed; boundary="------------MN80YGzmsf0jgX7LgWM2INTt";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: pb+samba@Arkthis.com, samba-technical@lists.samba.org
Message-ID: <e2b5b40b-fc56-4ade-b264-0f84f33f44b0@samba.org>
Subject: Re: Reading >4kB xattrs (from ZFS) = input/output error
References: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>
In-Reply-To: <71282fd4-3da7-4176-badf-66bcd478e609@Arkthis.com>

--------------MN80YGzmsf0jgX7LgWM2INTt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCk9uIDIvMTIvMjUgNDozOCBQTSwgUGV0ZXIgQi4gdmlhIHNhbWJhLXRlY2huaWNh
bCB3cm90ZToNCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBpbiBhZHZhbmNlIGZvciBhbnkgaW5z
aWdodHMgOikNCg0KaW4gMjAyMSB3ZSBhZGRlZA0KDQpzbWJkIG1heCB4YXR0ciBzaXplDQoN
CndpdGggYSBkZWZhdWx0IG9mIDY0S0IuDQoNCkJ1dCA0MEtCIHNob3VsZCB3b3JrIHJlZ2Fy
ZGxlc3MsIGJ1dCBtYXliZSBub3Qgb24gdGhhdCBvbGQgdmVyc2lvbi4NCg0KLXNsb3cNCg0K
LS0gDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkIGh0dHBzOi8vc2VybmV0LmRlLw0KU2FtYmEg
VGVhbSBNZW1iZXIgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNBTUJBKyBwYWNrYWdlcyAg
ICAgICBodHRwczovL3NhbWJhLnBsdXMvDQo=

--------------MN80YGzmsf0jgX7LgWM2INTt--

--------------EX9C60aUig93m0KBoq1pn1lP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmes10IFAwAAAAAACgkQqh6bcSY5nkaC
aBAAlFSWfefMk7LErXkNNnlnmL0K85FxJwboYMc4NrTmUrF0pkGihZMPX5HZS0Ps9FB7uSsEW5G2
T3O7LtZ4v6yMJfJvls32QSMeZG2WAdezN5g05pfZlwcrrW1EHaFnldl9Y2jc1P9R0oUdubl+hNVx
Y+FzaqYWpSDMpeVcPeLdivrrmR+iI7AYvlf3NNBU038SUXcgdVjX5qQvtJYDh/2Y+aAUbSnYq2Nj
69hxRU3cfYAGZfkD9sDpXex50gYCRwHiJdsAOhyaa2S7Nz88Rzi+Jzk6eaVsSUkBAvyoehxTU0vK
dDTw5nQOsqCZLkhKr6lg37FuVUDMwU/lyRFpDfNvYXMF/QSgDcZoqF28sV/TGcX5ztHNAMwwyTEc
hJFORFlY/d0TkiE0D6u6XG1sA1Dso6IiXFmE6HXpbupPnhTzLIW1UsHDCLC4+uJ7Jqmu2buUwTOV
3TxhTlGQs+tpvayUuVLkSIFy7qOslPugx5KgO8BpC2en/opnFNQrYVt4iWN2sZM3wjW462BdZ/IR
AYQzFzVHKOBlMCvCrRBUcUGwSNW/Jga/C/Ks4oc+IgHTsZDjqmOcs6Ns2a4kBPtf2AnU3mLFdqJQ
FJvAqdgdhekobBpQuzQE5lnKjyK8HkJMWFT5vujbzGl0eaXbsXMFuLq/fcRnH08ErVd+mCypHQro
qog=
=HjNK
-----END PGP SIGNATURE-----

--------------EX9C60aUig93m0KBoq1pn1lP--

