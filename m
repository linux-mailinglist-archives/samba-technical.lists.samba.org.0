Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB173B03957
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 10:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=x4YzWj4GqVdDA0sKrEqc2L64WaPLS/TaCaQCEn1PqHA=; b=tZPD8mWEbLyjcP2BRWocf1rfCr
	ZcI0A3/GJ0sY3ccerPeXrOqSPy79UHH6QaFE7Vg44go7x6JxhcaLBKRhoY/GtR0pM+k61DsuJN0Yt
	pXWAkQIX0/jcS6vVP23waXSvkx6YF3KHUwi3YjkHSKHA96OLdbfcP2vXhXlAce89z0sQkBtzYP8UD
	sNWFIEFArP3BMOKeHYUFDyMqGBasMkv5xmzowEMqkjpefvkyAB7dL4va0ipQXgj9zjX3O+DOr2/Rg
	Ce1WVZ4BoVTO/ekZvpNCamyoklkdchzjbfjsUOg6YkTYD3J9+vZDd44F7Ntuh9J5ekMG/FRZxyvcx
	PkFtyv4w==;
Received: from ip6-localhost ([::1]:52064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ubET6-00B7BL-NS; Mon, 14 Jul 2025 08:23:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32110) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubET2-00B7BE-2b
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 08:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=x4YzWj4GqVdDA0sKrEqc2L64WaPLS/TaCaQCEn1PqHA=; b=fMrcMHYws1P00w4C2BKDQQJ89r
 oqT2GnL9dA2l46c7gWF+gmo7RuEX5GNvJEe+Jl25GQhjLlZhET8mHKOg0d/p4mz9WmsEXi6Gq1Or4
 otVc33nW0jX4cQvGUrPxUNFElfGUwoR53gJTzYAhFMHp2ufYAw2PBpyTq/1Cc1VwBlFC4Kzo+Akw6
 wJGYoXk/+3RrRF9n0PHAPD3rhZ6TqzjeVRQKAY3gjr/SeU1/KpPEsFrYPfwCDiaWRGGzIuXwPsJk9
 DZKGN6ZYhpXZUosTB9GofiuNqA/0Qsg42EwvO1yd50FexeEkevoQhzNh8WVrlWU3bK0tQyMNcIk5m
 NrN/f1y42QdncGC94km4xP31yHkdubZPzBRUZRSp/4o6m2w8atZfbsKUFxax1/J+iXvLx62fSfBge
 hjTkU7RH4oDyTngWloJl4UyL8oDNwn2T/NAV76e6QngdOtjvDtVFeg9tHwluqAeQ7rxmTZ1nmJUPk
 A+NgquMDJsnDjnPu9qJruuW2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ubET0-00FHte-2D; Mon, 14 Jul 2025 08:23:18 +0000
Message-ID: <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
Date: Mon, 14 Jul 2025 10:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba support for creating special files (via reparse points)
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 vl@samba.org
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Y1Q7M3zbH6bM0Gmi9RkPc1V"
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
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Y1Q7M3zbH6bM0Gmi9RkPc1V
Content-Type: multipart/mixed; boundary="------------PULKC1GUuxdIF2FZOcmCoZCN";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 vl@samba.org
Cc: samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Message-ID: <5519b2d9-600c-4a3f-b44f-594877417df7@samba.org>
Subject: Re: Samba support for creating special files (via reparse points)
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
 <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
 <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
In-Reply-To: <42e549c1-0f92-4b95-b62b-3e0efab9aa10@samba.org>
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

--------------PULKC1GUuxdIF2FZOcmCoZCN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8xNC8yNSA4OjAxIEFNLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gT24gNy8xNC8yNSA0OjE4IEFNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4+
IEl0J3MgYW4gb3ZlcnNpZ2h0IEknbSBhZnJhaWQuDQo+IA0KPiBobS4uLiBpdCBzZWVtcyBy
ZXBhcnNlIHBvaW50cyBzdXBwb3J0IGlzIG1hbmRhdG9yeSBmb3IgU01CMyBQT1NJWCBzbyBJ
IA0KPiB3b25kZXIgd2hhdCB0aGlzIGFkZGl0aW9uYWwgY2hlY2tzIGJ1eXMgdXMuDQo+IA0K
PiBXaGlsZSBJIGFncmVlIHRoYXQgZ2VuZXJhbGx5IHdlIHNob3VsZCBsaWtlbHkgc2V0IHRo
aXMsIGZvciBTTUIzIFBPU0lYIA0KPiB0aGUgY2xpZW50IHNob3VsZCBwcm9iYWJseSBub3Qg
Y2hlY2sgdGhpcyBhbmQgd2Ugc2hvdWxkIGtlZXAgaXQgb3V0IG9mIA0KPiB0aGUgc3BlYy4N
Cg0Kb25lIGFkZGl0aW9uYWwgdGhvdWdodDogaXQgc2VlbXMgbGlrZSBhIHZhbGlkIHNjZW5h
cmlvIHRvIGJlIGFibGUgdG8gDQpzdXBwb3J0IFNNQjMgUE9TSVggb24gYSBzZXJ2ZXIgdGhh
dCBkb2VzIG5vdCBzdXBwb3J0IHhhdHRycyBvbiB0aGUgDQpiYWNraW5nIGZpbGVzeXN0ZW0g
YW5kIGhlbmNlIG1heSBub3QgaGF2ZSBhIHdheSBvZiBzdG9yaW5nIGFyYml0cmFyeSANCnJl
cGFyc2UgcG9pbnRzLg0KDQpJbiBTTUIzIFBPU0lYIHdlJ3JlIGp1c3QgdXNpbmcgdGhlbSBh
cyBhIHdpcmUgdHJhbnNwb3J0LCBub3QgbmVjZXNzYXJpbHkgDQpleHBlY3RpbmcgZnVsbCBz
dXBwb3J0IGZyb20gdGhlIHNlcnZlci4NCg0KSGVuY2UsIGZvciBTYW1iYSBJIHNlZSB0aGUg
Zm9sbG93aW5nIGNoYW5nZQ0KDQogICAgIHNtYmQ6IGFubm91bmNlIHN1cHBvcnQgZm9yIEZJ
TEVfU1VQUE9SVFNfUkVQQVJTRV9QT0lOVFMgaWYgdGhlIA0Kc2hhcmUgc3VwcG9ydHMgRUFz
DQotLS0NCiAgc291cmNlMy9zbWJkL3Zmcy5jIHwgMyArKysNCiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvc291cmNlMy9zbWJkL3Zmcy5jIGIv
c291cmNlMy9zbWJkL3Zmcy5jDQppbmRleCA3Njg5NWY1MmUwMzkuLmVhM2ZhNGM4Nzg0ZiAx
MDA2NDQNCi0tLSBhL3NvdXJjZTMvc21iZC92ZnMuYw0KKysrIGIvc291cmNlMy9zbWJkL3Zm
cy5jDQpAQCAtMTM0NSw2ICsxMzQ1LDkgQEAgdWludDMyX3QgdmZzX2dldF9mc19jYXBhYmls
aXRpZXMoc3RydWN0IA0KY29ubmVjdGlvbl9zdHJ1Y3QgKmNvbm4sDQogICAgICAgICBpZiAo
bHBfbnRfYWNsX3N1cHBvcnQoU05VTShjb25uKSkpIHsNCiAgICAgICAgICAgICAgICAgY2Fw
cyB8PSBGSUxFX1BFUlNJU1RFTlRfQUNMUzsNCiAgICAgICAgIH0NCisgICAgICAgaWYgKGxw
X2VhX3N1cHBvcnQoU05VTShjb25uKSkpIHsNCisgICAgICAgICAgICAgICBjYXBzIHw9IEZJ
TEVfU1VQUE9SVFNfUkVQQVJTRV9QT0lOVFM7DQorICAgICAgIH0NCg0KICAgICAgICAgY2Fw
cyB8PSBscF9wYXJtX2ludChTTlVNKGNvbm4pLCAic2hhcmUiLCAiZmFrZV9mc2NhcHMiLCAw
KTsNCg0KaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvLS9tZXJnZV9yZXF1
ZXN0cy80MTA0DQoNCkZvciB0aGUgY2xpZW50IHRoaXMgd291bGQgbWVhbiwgaXQgbXVzdCBh
bGxvdyByZXBhcnNlIHBvaW50cyBmb3IgdGhlIA0Kc3BlY2lhbCBmaWxlcyBpZiBTTUIzIFBP
U0lYIGlzIG5lZ290aWF0ZWQuDQoNCk1ha2VzIHNlbnNlPw0KDQotc2xvdw0K

--------------PULKC1GUuxdIF2FZOcmCoZCN--

--------------0Y1Q7M3zbH6bM0Gmi9RkPc1V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmh0vnUFAwAAAAAACgkQqh6bcSY5nkb4
hQ/+OwWJv4tQ2E72XPRbiPw+Gn8eXRg+sPTqE0nonBgCBBcITdauDiQ1N7RXun91gHbhYuCit6IH
TKmR8OLSbZKhUw0vIQDApFxPykS3lalhjw4ZYN9AogpFw2HtGtt4/JqIBkSfJHgov2oQ94XW5BTi
s6c1uoE++p05vzxjY6Mk1Pbwpea708mEmUALnFf2PLwoUgvq8KG92ZM2JglGjsynoW/E7ymvMSwV
L9L7yH4vJZkaMF2XNrBI1flLvAaSszHNG3XFRuKJ3h8q493uXcrMkg81CwmmLIx4/2IoKVeZdsrf
SXRYOVPlsxMadLVwBsAi/XawfAfjHripQ2TN0Y4a2RXICceqk+RxzjcpQcjKzCXRENP7014e93XU
1MMGwfo7eoQd+ir3NB8LWSaHLDRKm1gXoGDlwcg8sx6Kf0mbYULFdyaEJiv7kfamEMI3KV9imyYf
FCFfkxzlg2gl8oGDydVGvKOvVAg4+O8d6XJzlwIe71Sp1a4HqoPK0ye5mAaBx5jIh+SIXXFan74a
OnZPuih+dUSaDl+WhW4CLBGo/fwHThIpZbyOYgT13iR7p8CnrpVV6pID9J9nns6GtLU47IrCp1Vp
iKI1okU5L8UhIPLVVDS73v864jCsAwa500Di/iSPdy2dd8DKd8yZHAkJ4govtIfM5v5a6i92/EKV
bb0=
=j+L6
-----END PGP SIGNATURE-----

--------------0Y1Q7M3zbH6bM0Gmi9RkPc1V--

