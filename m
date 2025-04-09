Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61DA82E77
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 20:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eL2oEJnAL9vVf+dfgpxTMH6cSGedDGOYLaJmiLDGRWU=; b=jBgdQ8PJndQukp5NQyjDQI6sy5
	UiNMfSgt8RRKLMG2phppc7BeOTCQX74lhQhHv1C2ZCSTnokaSDvVOj6unyb9sKZNkHb2jTy0Xhn65
	k4OoL4nA6q3Y+OG0/JYvt88HmZXVrHjpc5q/mtncMc8f6WVWvWsebVsQ9kqX0c0JcmMQfMm11s4iP
	FhCFvw/IOpZJwvH2Dszx1SYMtNzRkCbAX2W1R5hagGc6pwqFGidRJpEJpa31q6QAl2Ake938aEF+r
	aC3+xABzACorwca0n8LDqA9Ic9oGgh062cGVJgcQLEFpHyeVRJMTd8cFD6Fh5ptYkzul28s2Irz1F
	NqNRjvDQ==;
Received: from ip6-localhost ([::1]:27022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2a0X-0024FJ-TD; Wed, 09 Apr 2025 18:18:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58820) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2a0T-0024FB-V5
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 18:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=eL2oEJnAL9vVf+dfgpxTMH6cSGedDGOYLaJmiLDGRWU=; b=hxq/kLbfCBqf8J+mp2wKOjAgrb
 /3DfpYnBHO1nLyga+wn31CaioteCqlCNep7g9DBjcE69nVKY5wi31hXTJ190ZKO54xCEXZXD7Yy10
 O7AJEREr68ACDY+zE/2OAIzlgACjKvgP87w1oZ0N3lcjPuL/7Vaeg2aaiMB159FHfPuVwNPRld+Ze
 g/IiW1qFFXBGIbpyEU5DXQv0AFpJwe3JSsLP8VqDE4KJDjNtgTkBRlAwspaoT4U923Ze42dyRTCyS
 Pp/ZWtjUmpHZMwSLMVVm/DSe+KkKra4AYIqJcPNNzFRhCAAke+FZEH94fCY26/544FivFhMtlKbfL
 YwkzYOUpjOkP7ij1j8D7Ak20IKvbCX3K7DbUkaHkdvV6wdt+RMqs4CJw472a6mDQI0lLh+pvBLTz3
 VziEU7AUU6CZUjRolTjr4zbWfTdYkKVF4Hicu9hXXMfH4QGimjhgx1bZzqnCGdNmXMuL+mJqRKksL
 F14Ku5P0NF0Fs+y+hXf3Kx3I;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2a0F-008xVS-2i; Wed, 09 Apr 2025 18:18:23 +0000
Message-ID: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
Date: Wed, 9 Apr 2025 20:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------004DSA1vM0zjHiF7aKkzJj5D"
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
Cc: Tom Talpey <tom@talpey.com>, "vl@samba.org" <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------004DSA1vM0zjHiF7aKkzJj5D
Content-Type: multipart/mixed; boundary="------------0W4MGtXi4LRnJg0Y6djN6hHi";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 Jeremy Allison <jra@samba.org>, "vl@samba.org" <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>
Message-ID: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
Subject: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
Autocrypt-Gossip: addr=jra@samba.org; keydata=
 xsDiBDxEcLsRBADMQzpWoVuu4oiq23q5AfZDbakENMP/8ZU+AnzqzGr70lIEJb2jfcudViUT
 97+RmXptlnDmE4/ILOf6w0udMlQ9Jpm+iqxbr35D/6qvFgrgE+PnNAPlKSlI2fyGuLhpv1QP
 forHV13gB3B6S/ZWHpf/owKnJMwu8ozQpjnMnqOiVwCg8QnSX2AFCMd3HLQsqVaMdlO+jBEE
 AKrMu2Pavmyc/eoNfrjgeRoNRkwHCINWO5u93o92dngWK/hN1QOOCQfAzqZ1JwS5Q+E2gGug
 4OVaZI1vZGsAzb06TSnS4fmrOfwHqltSDsCHhwd+pyWkIvi96Swx00e1NEwNExEBo5NrGunf
 fONGlfRc+WhMLIk0u2e2V14R+ebDA/42T+cQZtUR6EdBReHVpmckQXXcE8cIqsu6UpZCsdEP
 N6YjxQKgTKWQWoxE2k4lYl9KsDK1BaF6rLNz/yt2RAVb1qZVaOqpITZWwzykzH60dMaX/G1S
 GWuN28by9ghI2LIsxcXHiDhG2CZxyfogBDDXoTPXlVMdk55IwAJny8Wj4s0eSmVyZW15IEFs
 bGlzb24gPGpyYUBzYW1iYS5vcmc+wlcEExECABcFAjxEcLsFCwcKAwQDFQMCAxYCAQIXgAAK
 CRCl3XhJ1sA2rDHZAKDwxfxpGuCOAuDHaN3ULDrIzKw9DQCdHb3Sq5WKfeqeaY2ZKXT3AmXl
 Fq7OwE0EPERwvhAEAIY1K5TICtxmFOeoRMW39jtF8DNSXl/se6HBe3Wy5Cz43lMZ6NvjDATa
 1w3JlkmjUyIDP29ApqmMu78Tv4UUxAh1PhyTttX1/aorTlIdVYFjey/yW4mSDXUBhPvMpq52
 TncLRmK9HC6mIxJqS0vi6W9IqGOqDRZph3GzVzJN7WvLAAMGA/sGAyg2rVsBzs77WH0jPO+A
 QZDj+Hf/RFHOwmcyG7/XgmV6LOcQP4HfQHH3DGYihu5cZj3BeWKPDJnjOjB2qmr+FTjYEsjw
 LDBNG7rjRye412rUbNwmEtcD2/dw4xNyu5h2u+1++KVBPf4SqG/a10gDqGJXDHA1Os5MmnQl
 3CTq9sJGBBgRAgAGBQI8RHC+AAoJEKXdeEnWwDasbeIAoL6+EsZKAYrZ2w22A6V67tRNGOIe
 AJ0cV9+pk/vqEgbv8ipKU4iniZclhg==

--------------0W4MGtXi4LRnJg0Y6djN6hHi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZm9sa3MsDQoNCndoYXQgc2hvdWxkIGJlIHRoZSBiZWhhdmlvciB3aXRoIFNNQjMgUE9T
SVggd2hlbiBhIFBPU0lYIGNsaWVudCB0cmllcyB0byANCmRlbGV0ZSBhIGZpbGUgdGhhdCBo
YXMgRklMRV9BVFRSSUJVVEVfUkVBRE9OTFkgc2V0Pw0KDQpUaGUgbWFqb3IgcXVlc3Rpb24g
dGhhdCB3ZSBtdXN0IGFuc3dlciBpcywgaWYgdGhpcyB3ZSB3b3VsZCB3YW50IHRvIA0KYWxs
b3cgZm9yIFBPU0lYIGNsaWVudHMgdG8gaWdub3JlIHRoaXMgaW4gc29tZSB3YXk6IGVpdGhl
ciBjb21wbGV0ZWx5IA0KaWdub3JlIGl0IG9uIFBPU0lYIGhhbmRsZXMgb3IgZmlyc3QgY2hl
Y2sgaWYgdGhlIGhhbmRsZSBoYXMgcmVxdWVzdGVkIA0KYW5kIGJlZW4gZ3JhbnRlZCBXUklU
RV9BVFRSSUJVVEVTIGFjY2Vzcy4NCg0KQ2hlY2tpbmcgV1JJVEVfQVRUUklCVVRFUyBmaXJz
dCBtZWFucyB3ZSB3b3VsZCBjb3JyZWN0bHkgaG9ub3IgDQpwZXJtaXNzaW9ucyBhbmQgdGhl
IGNsaWVudCBjb3VsZCBoYXZlIHJlbW92ZWQgRklMRV9BVFRSSUJVVEVfUkVBRE9OTFkgDQph
bnl3YXkgdG8gdGhlbiByZW1vdmUgdGhlIGZpbGUuDQoNCldpbmRvd3MgaGFzIHNvbWUgbmV3
IGJpdHMgRklMRV9ESVNQT1NJVElPTl9JR05PUkVfUkVBRE9OTFlfQVRUUklCVVRFIHRvIA0K
aGFuZGxlIHRoaXMgbG9jYWxseSAoISkgYW5kIGl0IHNlZW1zIHRvIGJlIGRvaW5nIGl0IHdp
dGhvdXQgY2hlY2tpbmcgDQpXUklURV9BVFRSSUJVVEVTIG9uIHRoZSBzZXJ2ZXIuDQoNCjxo
dHRwczovL2xlYXJuLm1pY3Jvc29mdC5jb20vZW4tdXMvb3BlbnNwZWNzL3dpbmRvd3NfcHJv
dG9jb2xzL21zLWZzY2MvMmU4NjAyNjQtMDE4YS00N2IzLTg1NTUtNTY1YTEzYjM1YTQ1Pg0K
DQpUaG91Z2h0cz8NCg0KVGhhbmtzIQ0KLXNsb3cNCg==

--------------0W4MGtXi4LRnJg0Y6djN6hHi--

--------------004DSA1vM0zjHiF7aKkzJj5D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf2ue4FAwAAAAAACgkQqh6bcSY5nkZ+
chAAlBxYxMmJvWTCCeym5jj/L+N5XOeDXsjw369kRjtGOurPdeO35tU2AgafBgRUDS7aN7Izz9lG
OCwETliwnjS3Ps7GYHbB8Y1lXwhXc1eSSQZ3FNQfEp9ksY/cJ8mXYU5hsFzbPDnGNU1ao8qRXG9W
kGiDcQGhP1IUuVNA+alW43+bWAyEM/0Nj5SJ8v9zQPbCZPPsn0W3/q8gIF/Iyw18QLlos388HqoZ
TCC6VPmtRAwfCtJZ5BzFVApyfSKAFqaJGinwlTtxrb4fvjiHQ24gsW+mYojhIJ2fMq0uuul2Sj9E
PeGWyERaHAPEOYz+t46J1Xg+KijYEJWZgqOyo5xB1Dw9JuPuRgXT7Cjd0q37JsD+mns3cWuNLz0E
lANTiiyayB4B25kpcL0td3xAizL/D4NyYaFgt/5sU9tkMHO9WPl787rOx+yrJJh8LyUB+Pv9Ji+V
PXrPcL5VpoVQKz88ZoeLcudwq3nWjfEQGU6BpnqJPB3wPWU6mIxVC2FAf40aKrVmmhjsRCFSoWz4
+tvQL3kyQGYoUlypvVPyWWmi5gI4rdJ8YrHYwsw3i3XdYVuiFIZFF7NCA3WNgnYFpbtP29kXYVK/
zAZShupHRSHzMhMXblX07Sic/1JbGPh3frQjVqPFYz7oH+71couJ7vc4/vMJX1wfHHxeAy0gULcd
WsM=
=v0BM
-----END PGP SIGNATURE-----

--------------004DSA1vM0zjHiF7aKkzJj5D--

