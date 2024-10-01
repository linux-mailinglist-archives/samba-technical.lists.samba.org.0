Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3AA98BC91
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2024 14:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Om0zulssCTV8fC7qLQvjhDy7SecOLwTaziprfrll/2o=; b=2gmoP6zmjOTCEGNUPZ1efTMVcQ
	8rhxt1xu4QvM7ZE2/DQoUDp6+1yAWrHUDki6s8RGGvsp5LbkNOhHwDm8qzz2fnJPos0Tla/4NqYsp
	OkKaDOHnpdtl0V1ioi0XKV1qjMP0kAxyG97lrvHv4tOr44bKcDc9qiC9r2qoKOMf0lOaQE6fNazZr
	67iQwvaB0e+jshkaIpMmcM86YkS36Gs24hal6OZRyAo0SzKKvAjncylsoZEiS1rFdYclCMtnJcNhy
	1f24zsS3sW2/e2ws1x4aY05DrLds1TJ9Dxv96B4kweJQTV752SGvfQhjbYBvws4suO/lWJjunF9S5
	IVerQA2w==;
Received: from ip6-localhost ([::1]:26838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svcGp-002mUi-2F; Tue, 01 Oct 2024 12:46:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58272) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svcGi-002mUH-KH; Tue, 01 Oct 2024 12:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Om0zulssCTV8fC7qLQvjhDy7SecOLwTaziprfrll/2o=; b=tSGjdruW/DBfOS55lyCXcL644/
 9AVfYgXnRYhkzQCYCyGaikLipRMb6SIb7NrfXujq5WnRhkoWhemAbleTSR1lYGbdUvqLm5Hqxcmpy
 IBTaU/CCDlBQHBxEMNUWWuINR8nAeE+bVyrBN/F1dP1Q+AsiWx9cFN5EyRItO1/YKAANTHric3T8j
 oaGcYU+RjumA7zeC4qXwOcPwvzUZwI+wgpO/dpizNzHvnxdll/qrGDfHO3JzSWbWSiK9TFeefVUtA
 VCiAGp40chC5FXODi0iTCoWZq0AP6kO0hN/EjiQy5AQmCB70XiYuX4CDoAV7G2vX2ynP1saj95cgY
 K/o7Xis9IhfNpuBs8xrec30FlDy9Ug74XLVduY9c+CugPxozZUUMYIBIdi1urjAXfNJ/7d+CgCy1R
 4VBOTyUuHeKjxybu0UVAv8DjhUA6Y5LpCtVY9zeZmZKDhKQAUK97SRbXDE0ybE05H/n/c6bW7/qr4
 6GgpSAllM25IVG1zLEDNAKHN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svcGh-002tW8-2V; Tue, 01 Oct 2024 12:46:19 +0000
Message-ID: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>
Date: Tue, 1 Oct 2024 14:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: SambaXP 2025
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gxoKEShsObP0MpzsTWgybPs1"
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
--------------gxoKEShsObP0MpzsTWgybPs1
Content-Type: multipart/mixed; boundary="------------CEaQnqDPiA08kztOuTxdVgxB";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <280dfadf-cf54-4cd1-b98e-1248686decc4@samba.org>
Subject: SambaXP 2025

--------------CEaQnqDPiA08kztOuTxdVgxB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVhciBTYW1iYSB1c2VycyBhbmQgaGFja2VycywNCg0KSSdtICBleGNpdGVkIHRvIGFubm91
bmNlIHRoYXQgU2FtYmFYUCAyMDI1IHdpbGwgdGFrZSBwbGFjZSBvbiBBcHJpbCA5dGggDQph
bmQgMTB0aCBvbi1zaXRlIGluIEfDtnR0aW5nZW4sIEdlcm1hbnkgb25jZSBhZ2Fpbi4gVGhp
cyBhbm51YWwgZXZlbnQgDQpwcm9taXNlcyB0byBicmluZyB0b2dldGhlciBTYW1iYSBlbnRo
dXNpYXN0cyBhbmQgZXhwZXJ0cyBmb3IgYW4gDQppbnRlcmVzdGluZyBhbmQgZW5qb3lhYmxl
IHR3by1kYXkgY29uZmVyZW5jZS4NCg0KRWFybHktQmlyZCBUaWNrZXRzIGFyZSBub3cgYXZh
aWxhYmxlIGhlcmU6IGh0dHBzOi8vc2FtYmF4cC5vcmcvDQoNClRoZSBjYWxsIGZvciBwYXBl
cnMgaXMgYWxyZWFkeSBvcGVuIGFuZCB3ZSBhcmUgbG9va2luZyBmb3J3YXJkIHRvIA0KaW5u
b3ZhdGl2ZSBhbmQgZW5nYWdpbmcgc3VibWlzc2lvbnMuDQoNCklmIHlvdSBoYXZlIGlkZWFz
LCBxdWVzdGlvbnMsIG9yIGFueSBpc3N1ZXMgcmVsYXRlZCB0byB5b3VyIA0KcGFydGljaXBh
dGlvbiwgcGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byByZWFjaCBvdXQgdG8gdGhlIExvY2Fs
IA0KT3JnYW5pemluZyBDb21taXR0ZWUgKGxvY0BzYW1iYXhwLm9yZykuIFdlIGFyZSByZWFk
eSB0byBhc3Npc3QgYW5kIG1ha2UgDQp5b3VyIFNhbWJhIGVYUGVyaWVuY2UgYXMgc21vb3Ro
IGFzIHBvc3NpYmxlLg0KDQpMb29raW5nIGZvcndhcmQgdG8gc2VlIHlvdSBpbiBHw7Z0dGlu
Z2VuIQ0KLVJhbHBoDQoNCi0tIA0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCBodHRwczovL3Nl
cm5ldC5kZS8NClNhbWJhIFRlYW0gTWVtYmVyICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQoN
Cg==

--------------CEaQnqDPiA08kztOuTxdVgxB--

--------------gxoKEShsObP0MpzsTWgybPs1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmb77xsFAwAAAAAACgkQqh6bcSY5nkZk
xQ/5Aef2tK96ll9Vbho3zvTPImnNrc+zqDP3A6lS+UcchnDFH3GeqS3aJrkWGEhmm4rhHFemjEEB
kGE9s/AeHmUn2e+V8GaQfIzwW+CgRYYq+JdYFs/JDW1McworYgK6eQigY2TmktdtkQz/ivjycEeL
1ZLfioj2ViThcZ9/rv2B+0fhNf0ZS5QXpLyDZksK4hIKI5DOkwSOUtsP/8x5O1RhXC8TQFAySDSL
HBPJV7L/rlIcWrPVuWn4AnkKdJGYEkIQdVcVrDE9+G6yRFA3H6ubFVVRa1xFTdx5GGBK6zz0GD7/
RM7qneqATFV2pos0XAMKlldOtu4qEdEi7oi/JIddstxShGoSrc5o1JHsz0F9gyzwoqS8c4ZPUi6l
nvghigObD6nT7ds9zcoF/DfNXL6FgqncHVwjdFeaRRqjE4ADSwfO1SO9SWi8bM5wWBU481Bln8uJ
va9M2iozJhiOxMZjvFvliPSaNoxzEparGH1TF6nOTXQK41LLRA3mtV9FB07Un6UDt47ILFU/dD/P
6BZNqfOBTnsVcZTSqLVElUsVSJLX6lIN/v3Q3EH832YZZp/KNO0gUix8l14KUO1VAaFEgmgy5Gdm
nLRJFAvErr8pPA1u2QjYcoouLS77cdPETYABpvWyYnYKPd7CVQcG2jI+IQzF+37Y9aXyT6VuB3mn
bJQ=
=uSKh
-----END PGP SIGNATURE-----

--------------gxoKEShsObP0MpzsTWgybPs1--

