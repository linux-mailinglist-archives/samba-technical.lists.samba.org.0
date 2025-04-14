Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DFCA88BE6
	for <lists+samba-technical@lfdr.de>; Mon, 14 Apr 2025 21:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J3LGH0ep29MPGt2QhXsO8nSZ8hd7UbDIB3o6lLzjnr8=; b=xaeF/pj89hxyUAXanEziUPhxhU
	5nMilFEw9WXq07G8q2/QKKQIy/SqKHJfezugfclOuqwvVccz1rI4P/jxaZ1pBH/JkGyLWCDDpqHeb
	Ht4Gaj0SMy5feff3qXGKWL9E/8+AMef/MjkRBzOBAhjGcbtvQ34i0MfbilTJnKJvYyVmnBMSnjixs
	7I+bJUUSC6jhjKudGbNHvQAz8eHCd7hREknMW5/yW0X3Ugbo9RwNHZ5qLlV7JodM+cDkQlgcf3Yl6
	bM0ejdWmr8esT270MF+v5hUj2U5VxO2g92nqLliEMo1ZW/yt3idspJOsedmMWyXp+L0vNJkL2KIRh
	iaJDA5BQ==;
Received: from ip6-localhost ([::1]:60102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u4P5J-002OY8-8A; Mon, 14 Apr 2025 19:03:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12362) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u4P5D-002OY1-OR
 for samba-technical@lists.samba.org; Mon, 14 Apr 2025 19:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=J3LGH0ep29MPGt2QhXsO8nSZ8hd7UbDIB3o6lLzjnr8=; b=ZiavqdaMODluBd5w9EydhNKeyI
 dmI7y3CM1tG7YPNRO+Q3b3itj2LCOlhZWFNaFNQCEHqt9++OGZZ5JZ+4iy35EySGADEELf3Gseukh
 AYxgLAkEatuvcHM6g/vrRStuE8LU8Tiuqacty0aMRI1pK/an42CMgfxWszPxd+UP/Bxprpo/oaskA
 7XUH85HUgvjLvTurXUPcDZOEsLcZNpQsV605Qll/S4eJuh5XtUuzHNVMJxnX/XuodRwSRsTpQmC1Y
 93UOeW/mZ3WDCAD8msWiSIl69U26ajvkU1IRnkIf0xDIyYj6ixn3t1MH1Rwyb15tvwdAJTiFIKDas
 pRjAYYdZhl2pcgsgs90Rm/yCD1Q+FnFsD9pGgdai1GgpjCCYckmfiGoZd8HvKQUOitA14567Aloa3
 b2Zz9W+Gw18d8TsNyoXWnJQHUDWY6O0n/vRPblIgRPDReJFulMDga/zWPWDZD97N597Q+OcyliUG1
 E1qCW8VT/RALpFnt0RMzab+f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u4P4z-009pGA-2A; Mon, 14 Apr 2025 19:02:49 +0000
Message-ID: <bfe46e3d-5c7c-42ec-987d-d70b4f513e85@samba.org>
Date: Mon, 14 Apr 2025 21:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------doGG261B5rdjwIn24ltVY12n"
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
--------------doGG261B5rdjwIn24ltVY12n
Content-Type: multipart/mixed; boundary="------------jiqNRYb0M6IQPYAl05gH2ydu";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Tom Talpey <tom@talpey.com>, "vl@samba.org" <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>, Jeremy Allison <jra@samba.org>
Message-ID: <bfe46e3d-5c7c-42ec-987d-d70b4f513e85@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
In-Reply-To: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
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

--------------jiqNRYb0M6IQPYAl05gH2ydu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QXMgZGlzY3Vzc2VkIGF0IFNhbWJhWFAsIHdoYXQgYWJvdXQgdGhpcz8NCg0KaHR0cHM6Ly9n
aXRsYWIuY29tL3NhbWJhLXRlYW0vc21iMy1wb3NpeC1zcGVjLy0vbWVyZ2VfcmVxdWVzdHMv
Ni9kaWZmcw0KDQpPbiA0LzkvMjUgODoxOCBQTSwgUmFscGggQm9laG1lIHZpYSBzYW1iYS10
ZWNobmljYWwgd3JvdGU6DQo+IEhpIGZvbGtzLA0KPiANCj4gd2hhdCBzaG91bGQgYmUgdGhl
IGJlaGF2aW9yIHdpdGggU01CMyBQT1NJWCB3aGVuIGEgUE9TSVggY2xpZW50IHRyaWVzIHRv
IA0KPiBkZWxldGUgYSBmaWxlIHRoYXQgaGFzIEZJTEVfQVRUUklCVVRFX1JFQURPTkxZIHNl
dD8NCj4gDQo+IFRoZSBtYWpvciBxdWVzdGlvbiB0aGF0IHdlIG11c3QgYW5zd2VyIGlzLCBp
ZiB0aGlzIHdlIHdvdWxkIHdhbnQgdG8gDQo+IGFsbG93IGZvciBQT1NJWCBjbGllbnRzIHRv
IGlnbm9yZSB0aGlzIGluIHNvbWUgd2F5OiBlaXRoZXIgY29tcGxldGVseSANCj4gaWdub3Jl
IGl0IG9uIFBPU0lYIGhhbmRsZXMgb3IgZmlyc3QgY2hlY2sgaWYgdGhlIGhhbmRsZSBoYXMg
cmVxdWVzdGVkIA0KPiBhbmQgYmVlbiBncmFudGVkIFdSSVRFX0FUVFJJQlVURVMgYWNjZXNz
Lg0KPiANCj4gQ2hlY2tpbmcgV1JJVEVfQVRUUklCVVRFUyBmaXJzdCBtZWFucyB3ZSB3b3Vs
ZCBjb3JyZWN0bHkgaG9ub3IgDQo+IHBlcm1pc3Npb25zIGFuZCB0aGUgY2xpZW50IGNvdWxk
IGhhdmUgcmVtb3ZlZCBGSUxFX0FUVFJJQlVURV9SRUFET05MWSANCj4gYW55d2F5IHRvIHRo
ZW4gcmVtb3ZlIHRoZSBmaWxlLg0KPiANCj4gV2luZG93cyBoYXMgc29tZSBuZXcgYml0cyBG
SUxFX0RJU1BPU0lUSU9OX0lHTk9SRV9SRUFET05MWV9BVFRSSUJVVEUgdG8gDQo+IGhhbmRs
ZSB0aGlzIGxvY2FsbHkgKCEpIGFuZCBpdCBzZWVtcyB0byBiZSBkb2luZyBpdCB3aXRob3V0
IGNoZWNraW5nIA0KPiBXUklURV9BVFRSSUJVVEVTIG9uIHRoZSBzZXJ2ZXIuDQo+IA0KPiA8
aHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29tL2VuLXVzL29wZW5zcGVjcy93aW5kb3dzX3By
b3RvY29scy9tcy0gDQo+IGZzY2MvMmU4NjAyNjQtMDE4YS00N2IzLTg1NTUtNTY1YTEzYjM1
YTQ1Pg0KPiANCj4gVGhvdWdodHM/DQo+IA0KPiBUaGFua3MhDQo+IC1zbG93DQoNCg==

--------------jiqNRYb0M6IQPYAl05gH2ydu--

--------------doGG261B5rdjwIn24ltVY12n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf9W9gFAwAAAAAACgkQqh6bcSY5nkaK
Iw//a9EZmKYx7arqDWiyJEPhzBlGVlMfqPH+oNZlhHRQGpRASyCyiRaSYdZykcgPseJngEpLVfDt
DeIUlH2MSngET9TPQM38gV7l6wGuLfcdXN/IqIMIzinD20KX8KrcWXy3XALar65kRkD+QchDLqAv
MxE17ABhMFit9YFvHDUjrgz407W6ILFBWL4X1PL6sl4BTo3xGyJiiubmMpUPxZzWDSg+pDvZOaDK
OxViLtCueAw9gCqC+qxztJIza62i7MjEjB45EY56mG2ag/czqiLcBShacd8a8Hf3kAyzbdCWn2Dv
wxV2zXSH0sYxeeMaZHF9xcAdbchVTh7TMiC6Imz5UZe2wSKdU/UBPquFKnao0MUQTZ04qRdQ2D0g
46GWPf8YH73IhDmyhHbwDpqQN2+OcG4XxE3zWME1kyxtIWQxqvu8F1Tuq9XhlK7dRkezjIG3rMX8
/rI6zV/uOAiWkuA7McGNJvN3xgXjGhtPFTTc6ZNWRE1vTimV5ND3NOioM0HuURi4tF8K8Vpuav0u
Q9sroqgMt59YIomBNV0DZ1nJDuzSs6ODofTTWOgo0XaM7WhGHFKbO3vwHfjWm2myFFAQkqY35N4l
19lM+tJNV6S05QBH/BeypAakg7rw0Z2JQk8Oiy/ss35Pmq6dfmldWZr6qop0ERwZs8krOqBSGOwB
/Z4=
=YweZ
-----END PGP SIGNATURE-----

--------------doGG261B5rdjwIn24ltVY12n--

