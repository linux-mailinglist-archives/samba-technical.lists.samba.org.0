Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EAA84CF6
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 21:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DFZsSjGTmNtZjBJwUF48LQpn1+gf4oNmep4zO1aZNQU=; b=uDsy+xda+O3STDu26LqpGheJZv
	hhwhfkbgvjGjCz4E7RHsjLCBU0GZ9U65QRZiKzMxIpE1lk2C5gh7dFJCqnmirFp7axs1I3i4qveGV
	1Yp10BxtHMDdqOtPya4xOdwR1RtHWL+aHEbKz446/4pKSuaoimuZQa6V2f0MBhOYmq6e7srneNfjD
	tgDGVyM83OVMN5lulhwdudMnh5bbgI5CBMqtXg8O2PzLmpOD2XwDgjGs9AEXIlOq5VifZ/TpvZbW3
	zsRKjkho7I7kOzyTtuqa3Kv8mJHpjVIbIMrW2RA3GlPlv6TEV1Eob/vQluS5CYlJRelVSY69csjHb
	ckxUuLGw==;
Received: from ip6-localhost ([::1]:45384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2xYH-002Ats-OW; Thu, 10 Apr 2025 19:27:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29858) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2xYC-002Atl-R9
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 19:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=DFZsSjGTmNtZjBJwUF48LQpn1+gf4oNmep4zO1aZNQU=; b=EBsFXisD2lqPXrOZF7A/oBc8Tf
 CuVATmgJxAtDYdaqgYOW8KB6eZjp+doPMuFaL8Sz/LyznCsN41/qGxGLFmEmeoixXiuQ8szvnelJF
 Xzf9xVqewAOuVcaxY1h3j4dtwgBFdrTTT5PiCVVII6XxTThhG+FgitGg7JYSQdLTwWFGAPpRvmIi4
 Ot4E9fhXpF6pSIq9/1KtoAajNGvgok+qWzC9ykOs0usOenX0ej2G7eglY+fWWc/14HfqtGAC3Usra
 PF2EsWQn0iR8CaBPKYXS/rAu87mVj8fLFnrtd8cdKFGsZqx4IkiHwI9p2uOLjYR2mKJ31MYdqfk/D
 Xgb6EVFgW+eXgbwqUo4PX5zDfRleO0294T0yqtxfaq3Zmlk+2pYIWeoCXvdijoJYKZaHOfBUPHQLT
 FOLjPuju8wElxjmqwz0beg64zQwVNzNkB+srxMXGvZ0H81OG2TfnNmQrPOGMv1j17jfOrmmZ16mdB
 pRAREr6Gf+8RTQE/6T4bZJZm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2xXz-009AYD-00; Thu, 10 Apr 2025 19:26:47 +0000
Message-ID: <6707c2c4-3677-4705-8f0c-86d572ed1810@samba.org>
Date: Thu, 10 Apr 2025 21:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Jeremy Allison <jra@samba.org>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
 <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
 <Z_fdfszysLKt4Xij@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <Z_fdfszysLKt4Xij@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w2n6Q8QNBUoPdxxoZza1ImX0"
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w2n6Q8QNBUoPdxxoZza1ImX0
Content-Type: multipart/mixed; boundary="------------mzfdtiiLdin1uzzaHdSomZ00";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Steven French <Steven.French@microsoft.com>,
 "vl@samba.org" <vl@samba.org>, Stefan Metzmacher <metze@samba.org>
Message-ID: <6707c2c4-3677-4705-8f0c-86d572ed1810@samba.org>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <Z_b4DS3kOpbCI4pG@jeremy-HP-Z840-Workstation>
 <9f7da486-5d85-4ef3-8fcf-14b408d78700@samba.org>
 <Z_fdfszysLKt4Xij@jeremy-HP-Z840-Workstation>
In-Reply-To: <Z_fdfszysLKt4Xij@jeremy-HP-Z840-Workstation>
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

--------------mzfdtiiLdin1uzzaHdSomZ00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xMC8yNSA1OjAyIFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gT24gVGh1LCBB
cHIgMTAsIDIwMjUgYXQgMTA6MzM6NTRBTSArMDIwMCwgUmFscGggQm9laG1lIHdyb3RlOg0K
Pj4gT24gNC8xMC8yNSAxMjo0MyBBTSwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+Pj4gRG9l
cyBXaW5kb3dzIGV2ZXIgc2VuZCBGSUxFX0RJU1BPU0lUSU9OX0lHTk9SRV9SRUFET05MWV9B
VFRSSUJVVEUgb3Zlcg0KPj4+IHRoZSB3aXJlID8NCj4+DQo+PiBObywgaXQncyBsb2NhbCBv
bmx5LCBjZiBNUy1GU0NDIGFuZCB0aGUgdGhyZWFkICJTTUIyIERFTEVURSB2cyBVTkxJTksi
IA0KPj4gb24gdGhlIExpbnV4IGNpZnMgbWFpbGluZyBsaXN0Lg0KPj4NCj4+IDxodHRwczov
L2xlYXJuLm1pY3Jvc29mdC5jb20vZW4tdXMvb3BlbnNwZWNzL3dpbmRvd3NfcHJvdG9jb2xz
L21zLSANCj4+IGZzY2MvNDcxOGZjNDAtZTUzOS00MDE0LThlMzMtYjY3NWFmNzRlM2UxPg0K
PiANCj4gT0ssIGJ1dCBkb2VzIHRoZSBXaW5kb3dzIFNNQjMgc2VydmVyIGZpbHRlciBpdCBv
dXQgPw0KDQp5ZXMuDQoNCj4gQ2FuIGEgTGludXggY2xpZW50IHNlbmQgaXQgb3ZlciB0aGUg
d2lyZSBhbmQgZG9lcw0KPiBpdCBoYXZlIHRoZSBkZXNpcmVkIGVmZmVjdCA/DQoNCm5vLiAg
Q2YgdGhlIHRocmVhZCBJIG1lbnRpb25lZC4NCg0KVGhhbmtzIQ0KLXNsb3cNCg==

--------------mzfdtiiLdin1uzzaHdSomZ00--

--------------w2n6Q8QNBUoPdxxoZza1ImX0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf4G3YFAwAAAAAACgkQqh6bcSY5nkYF
hA/+KzvTZlFr7UwElEbL8PgNOtyGdkDodqOCzLc/82Ob/rWbpJU4e5zBAyJ9CRXu2NlDZJGteW7L
IKL1acCUm9nk0wlmdN4rd2K9/htwvBSkE4F79xmztkVDGKhytAjARbY/MhxcFznM++/0wBtEb3qi
De5a31q8VCIHqhY+LgtbLAzsqwHTi0fQPkyoej8sZVb5nWiuI4NVlmeu8EDDhVrKk6xI4Dw4ZN9p
nUrryzHzlECuqdLCfQQ6OreI9O7EYSrWVPNufv3vr+v8rr1mZBz0mm4MtQbulzXVOGv3tQQCos2E
D+Xxngl2la/sShXM6GGnFhKqzUP9BBcnLiqdhTVsukcMTEK/6Kk+A26L09F/EbtSJBGVianyb3bF
0ygD53UQzgXzZ3hNKb/4Wkjo86qU9JHs8fBWKy61q/5gK0yKn8ypWyvS5bOsYT+jJ6d2MrxweyrM
xi6kcGNBw8NbtHfhfuP8UJgJ/x5xYwWTLygflWO67h1cDqpe18V2bBMpsls4ltI74Jw9dip8iRAj
vvgib7K4dHwpJ33eVXuj0HmXYkZXQ1BBBRmnpbVuAgpotpq8momZjlKi/TRvloxaqKMgas+MjW/7
1N9CHWTtSvEd50330OMZoZAqAcdy1Y7fc2C2FC6B9oyl0KJC+76hsFbeh1TfyuZNUXcHOXIxrUTR
ORk=
=HE8e
-----END PGP SIGNATURE-----

--------------w2n6Q8QNBUoPdxxoZza1ImX0--

