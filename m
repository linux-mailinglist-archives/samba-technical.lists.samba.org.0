Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE32CA83D04
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 10:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MUPrFxy1OY4M37SJZ3j1CQ7mxTbB3uFy1xFtAvpL15Y=; b=WTHmvyUQuz6Lr6s7SIFnl0WSnt
	3lVDy//QaZ6NuDiiTVv7Nq9at31HXHw1n1uAUHrIgFAU2eao0vVs14VvWODQuoy7DpjKt2J/6FnfA
	4itdsMMhKhECOzqEYUtLozfCb6uerG7F8pHX8NN786Ur7X9MyBWyUzaV70THtR6y+vvLopGWCgGrA
	QxuAewZDiLU2YG6aShOjEPPIOi+uDf65BJXSuAMGh3IfMKEUSUyAbEffLCfDQZCSFsT0A/yA8dvU2
	fIrRd83NVVFTowAoM1QYXRXVdgptOQB/rusCzrD5IX3DETPD3Ij1TXtavCj0qNohAHomUvoTqgjaK
	+pHwLhMQ==;
Received: from ip6-localhost ([::1]:22342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2nKd-0027SH-G5; Thu, 10 Apr 2025 08:32:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34744) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2nKX-0027Qt-Oh
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 08:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MUPrFxy1OY4M37SJZ3j1CQ7mxTbB3uFy1xFtAvpL15Y=; b=fF4c+tfzTjvLPPOzbP03vqCqYg
 czF+Ua48VjlOBon96WZhawyuVtRrTDKO1r0L46sQFGC8xdkvCrfCJ61kAlyzMAppy/fdH9EGqpVE3
 QPP61eSbsfMmgsrVDQuMso37BnVY+epHGrD3G5qeYgoAsUBGpeG7lbXdCiVDGNSUWQXnrJKCB8i8D
 CKnQm1SOr/6ImvWZX83LeVZNWoOrhUF+KMN2B+K38piN1Cu4DHLK/XAnhBhcv/CD3RBbEwduSQGHf
 lrr/xFgTq2LdxovoZf0T1+ieCcqFqEniLN7S7aJll2081At8YIX3ZDcSxFwziKgn5c4IHwk6zfBUJ
 oW8t0AWtlyHJCyb7hAeYcnDmPB7ICtfped9QJwFIhxFmoIzt4R2ZSteFRNg/f7Pbpe/VwWh5YP4Wc
 QqK4Ar5qzWSOkcngVyI0yxwPRr406YKAApUUJXMFf9ift5E9QXcl3X/kU7wnyDZvviDliOFBb3Q4B
 OeNUNhN5NkJ/FTG1+vR15HSv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2nKJ-0094Ry-2c; Thu, 10 Apr 2025 08:31:59 +0000
Message-ID: <085204d2-22e6-4de6-aeec-620dba38280b@samba.org>
Date: Thu, 10 Apr 2025 10:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
 <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
 <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
Content-Language: en-US, de-DE
In-Reply-To: <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C8fZul9XqU1hVCQwPdZVY0JY"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, "vl@samba.org" <vl@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C8fZul9XqU1hVCQwPdZVY0JY
Content-Type: multipart/mixed; boundary="------------VvpdYyyneIx03bIKMqPMuqDE";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Steven French <Steven.French@microsoft.com>, Jeremy Allison <jra@samba.org>,
 "vl@samba.org" <vl@samba.org>, Stefan Metzmacher <metze@samba.org>
Message-ID: <085204d2-22e6-4de6-aeec-620dba38280b@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
 <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
 <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
In-Reply-To: <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
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

--------------VvpdYyyneIx03bIKMqPMuqDE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xMC8yNSA3OjIzIEFNLCBUb20gVGFscGV5IHdyb3RlOg0KPiBPbiA0LzkvMjAyNSA5
OjA2IFBNLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+PiBPbiA0LzkvMjUgODo0MyBQTSwgU3Rl
dmUgRnJlbmNoIHdyb3RlOg0KPj4+IE9uIFdlZCwgQXByIDksIDIwMjUgYXQgMToxOOKAr1BN
IFJhbHBoIEJvZWhtZSA8c2xvd0BzYW1iYS5vcmc+IHdyb3RlOg0KPj4+PiB3aGF0IHNob3Vs
ZCBiZSB0aGUgYmVoYXZpb3Igd2l0aCBTTUIzIFBPU0lYIHdoZW4gYSBQT1NJWCBjbGllbnQg
DQo+Pj4+IHRyaWVzIHRvDQo+Pj4+IGRlbGV0ZSBhIGZpbGUgdGhhdCBoYXMgRklMRV9BVFRS
SUJVVEVfUkVBRE9OTFkgc2V0Pw0KPj4+Pg0KPj4+PiBUaGUgbWFqb3IgcXVlc3Rpb24gdGhh
dCB3ZSBtdXN0IGFuc3dlciBpcywgaWYgdGhpcyB3ZSB3b3VsZCB3YW50IHRvDQo+Pj4+IGFs
bG93IGZvciBQT1NJWCBjbGllbnRzIHRvIGlnbm9yZSB0aGlzIGluIHNvbWUgd2F5OiBlaXRo
ZXIgY29tcGxldGVseQ0KPj4+PiBpZ25vcmUgaXQgb24gUE9TSVggaGFuZGxlcyBvciBmaXJz
dCBjaGVjayBpZiB0aGUgaGFuZGxlIGhhcyByZXF1ZXN0ZWQNCj4+Pj4gYW5kIGJlZW4gZ3Jh
bnRlZCBXUklURV9BVFRSSUJVVEVTIGFjY2Vzcy4NCj4+Pg0KPj4+IEkgYWdyZWUgdGhhdCB0
byBkZWxldGUgYSBmaWxlIHdpdGggUkVBRF9PTkxZIHNldCBzaG91bGQgYnkgZGVmYXVsdCAN
Cj4+PiByZXF1aXJlDQo+Pj4gV1JJVEVfQVRUUklCVVRFUyAoYW5kIGRlbGV0ZSkNCj4gDQo+
IFNpbmNlIHdoZW4gZG9lcyBQb3NpeCByZXF1aXJlIHRoaXM/Pw0KDQpPYnZpb3VzbHkgaXQg
ZG9lc24ndC4NCg0KTGV0IG1lIHRyeSB0byBhc2sgaXQgZGlmZmVyZW50bHk6IGRvIHdlIHdh
bnQgdG8gcmVsYXggV2luZG93cyBzZWN1cml0eSANCm1vZGVsIG9uIGEgUE9TSVggaGFuZGxl
IGZvciB0aGlzIG9wZXJhdGlvbiwgZXZlbiBpZiB3ZSBjYW4gYnVpbGQgc2FuZSANCnNlbWFu
dGljcyBpbnRvIHRoZSBwcm90b2NvbCB0aGF0IGRvZXNuJ3QgcmVxdWlyZSB0aGlzPw0K

--------------VvpdYyyneIx03bIKMqPMuqDE--

--------------C8fZul9XqU1hVCQwPdZVY0JY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf3gf8FAwAAAAAACgkQqh6bcSY5nkaF
XA/9F7AepJ0eZNIUC1Aj1UrXXi0Gk7zXxUr+h6t/Bonkqr6mD35iWsYXlwD5S1JsFgtmkLZPH/RK
YL5v8uPZfIky8lEA293YKt3MgQ2tIzM7DodKEu5wWDngf/MIbmtM167VFaAa8NaGG05xVIMdqpiJ
A6jnXgfmu0K21g1GbGpb9H23qznAL2+LoJgP4VVuoJSIfApggZUukiNFE2ty9NkfH3QzKIAbKN2L
rb9OaH0nuNfjzwRCzijIvT1t6KEEY8gkhk7e3xJow0JBasiFcz5hRHsdXYk0SOwFX2+79Mt6mINF
HzVDrfq47uYrgXbU7UpBYL3U7hK+6naKVB5ZMpAkZta53Q1owTxEJOPeldjyaTl1qpWd1w/DymNY
gHaFGfziw9sKpNpGbLBLYL3uEEqpsEtPUgj66yrAtzWXHDwn6Pb/nNP3qNZqfTkOe+BondtsOXxj
fEQN796o/of8+LTjoRVOcH/QoXPrpFeRnjR1DUpOTdocBMNGaJxn5N0BFHcPFGAC+/ryV2JOyJ+p
oc5Su8yH6gC5VnM9uua1M8VKEP3ecT8RFvGzXHtMG1hYH4wi4UgQTz/6sTeGpfAAxRkJ5mFxKoYu
tfJjjNj3tcBmSihD5f8fi7hRv2HF5S6GRooDsa7dEisYyz37W/WqfHuZdHUmVneg9jvhsRcbrsZi
7F4=
=Her/
-----END PGP SIGNATURE-----

--------------C8fZul9XqU1hVCQwPdZVY0JY--

