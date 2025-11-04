Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0711EC3094A
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 11:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YSUXvagzrBAdNrKgNvH502TIDw4d0Z3Oeu6s7nMS10k=; b=KbUfhGjL2idbZkRe0rua7t0hsD
	x937GrtGRCk5LfiQ1OuLkH/qA7QIqztPU7ouNo0stF+4Co9k1RZMB2hgau5RaMfyiBAmje8vqX4HS
	hVDMSfu6rXru439iSp6Ks/BKmeE/PYTYqVxClRTAxQlWg5RaQk4lKESJ14CnfdTC6sgiYaAwf62vR
	2L/YIIljHsIE6caJCtZE2vtDNQ4ghby4FoGap9hiZAbElmM/wrY0HVeClJdsMxcf8w43gsxV9Fjf6
	HW6JpiX192axTmYbYKUQJPgXYU7LGwEqOyNRD6DQ3FD52+UWaa/MfwdvEeeiToa7eFpX48skU0PfW
	Ar0H1gEA==;
Received: from ip6-localhost ([::1]:47772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGEa3-00BS15-5u; Tue, 04 Nov 2025 10:48:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47876) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEZz-00BS0y-3X
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 10:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=YSUXvagzrBAdNrKgNvH502TIDw4d0Z3Oeu6s7nMS10k=; b=FXH4s8SGyU8AJwBVqH6ykPoIon
 eVK4BsAOsNBNK4sQvX8RI7v04SIsK5nK4NAv9x3MR8/6hqfoVhg7YlzzAbuZAEGBlP3XFVoN52qYg
 1+xyhKx+vJPVWNeA3ChhWFxeBWY+VGYyV71Vnd97GA0jRwElcqrzQj7cdvSdqSPXVOPw6WW1BOq5i
 ulEW3ZML95vgRPQHvzuc8gLVHKmUwnalaj/eISqV9SKtqonmyZGC2zKTYYfsMcZPEM7UqcUneNoDy
 v3DGToJQ3VDCiNRUrEZ1CTsBmzokYpvOJK5kK37O6Oy0CFdFspuvd9uSk1NJBIIf5inFWdg+zWfS1
 M850/wsdy8HxplrzqWKc36QqTdeuhHg5zUEX4kUHvfCUSqg4PUQwgQIOJEEHoY8IxrXLjyZV3E0u/
 rlonFYGu5++K52cStayRdCoc2N2nkqwvT8zggs/jZ8Auk/r8VmsNFd6fCmczVMa+k8HTAkIg4/Jd/
 Jgw4SVoGuLr3ywc/HUYd1pEc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEZy-00CW2w-2X for samba-technical@lists.samba.org;
 Tue, 04 Nov 2025 10:47:58 +0000
Message-ID: <5227d933-d068-4d3e-af79-76f5e1cb4845@samba.org>
Date: Tue, 4 Nov 2025 11:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_Invitation=3A_Samba_Developer_Online_Gathering_?=
 =?UTF-8?Q?=E2=80=93_Tuesday=2C_November_4th?=
To: samba-technical <samba-technical@lists.samba.org>
References: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
 <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NZcj325Jxu7lsgu0On50QlXF"
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
--------------NZcj325Jxu7lsgu0On50QlXF
Content-Type: multipart/mixed; boundary="------------FMLCVx4pe98i09axHe7byxJu";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <5227d933-d068-4d3e-af79-76f5e1cb4845@samba.org>
Subject: =?UTF-8?Q?Re=3A_Invitation=3A_Samba_Developer_Online_Gathering_?=
 =?UTF-8?Q?=E2=80=93_Tuesday=2C_November_4th?=
References: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
 <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>
In-Reply-To: <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>

--------------FMLCVx4pe98i09axHe7byxJu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzIHRvIGV2ZXJ5b25lIHdobyBwYXJ0aWNpcGF0ZWQhDQoNCkkndmUgcHV0IHRoZSBt
ZWV0aW5nIG5vdGVzIG9uIG91ciB3aWtpOg0KDQpodHRwczovL3dpa2kuc2FtYmEub3JnL2lu
ZGV4LnBocC9TYW1iYV9EZXZlbG9wZXJfT25saW5lX0dhdGhlcmluZw0KDQpPbiAxMS8zLzI1
IDc6MTAgUE0sIFJhbHBoIEJvZWhtZSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KPiBI
ZXJlJ3MgdGhlIGN1cnJlbnQgYWdlbmRhOg0KPiANCj4gaHR0cHM6Ly9oYWNrbWQub2tmbi5k
ZS9FY3VReHFHZVFVYU5Cd09TaVdwd1BnDQo+IA0KPiBTZWUgeW91IHRvbW9ycm93IQ0KPiAt
c2xvdw0KPiANCg0K

--------------FMLCVx4pe98i09axHe7byxJu--

--------------NZcj325Jxu7lsgu0On50QlXF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmkJ2d4FAwAAAAAACgkQqh6bcSY5nkbC
Jg/9GO3mJtT1uCpzeFMglt8r0BwZxcOWih/ZA9IP6hPl7eucAXcBtXsUa8YvlYMCG94tssmIPLOT
lh8tvx5t5vrmglcJtIXrrrqHIfIj22FiOB8CTAMfMA91FkPMBv/NgGGye5RkiWZzB6z8aYHtQK3F
HIgNS+/IVTKUGCag04abq1ZKDxZ9OubUHf8jAoS8xKxLG/ftO+GZ6VuFCGkbMLwC5MF83pQqAh5F
9HnSjK1ZOh9n4GEmt5J8KHerE9kTnJjt/E2GdKWyvNPooeypq7r8tts9TJs3kc0zSD0XSxIlJA8A
HR/pkWPrHmUOUUFEvBXwk0OwSalH9K2LQ7wX/2G3j9wqnLb2vzRjjfSStUPnncmkHrmqcRkx9ToM
1E0XcaXVXjBa3HogshqUBTbpAS0KcE6GMbn8oPSeGlEGa3fDGd20ya+BKRVLfLplam/Lq7TZPEPo
qCmmpxa2SDbKGDb3bd9XZpZ2K+WtutNR/N7fuJwfPd+uO3YIQM66yMdwoCsZvqZDGdqQCZklT1fH
BDFelq+ttK22CosOUhHLUJR1+9ei5fhNOGzexuSDkfxL4v1dvDXgvOzZWPIsSxoFdmZsjZn66jX8
h18pvPTiTW+FMS0waTDuJK+WWLkYS5as7P0SYv4Zk4tW2PQj9yOwWU+V4pyXS5QC277KBz7qAhCT
Kd4=
=Cs8t
-----END PGP SIGNATURE-----

--------------NZcj325Jxu7lsgu0On50QlXF--

