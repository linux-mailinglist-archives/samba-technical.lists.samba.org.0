Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C32997526
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2024 20:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=n7ooIvy69r4CG9DaMKh3mwQN1GmE9Mye+zOvfL41Hwk=; b=PQgB5qofPX+3swdAsB8uDj2WZ9
	19oDQ4cbXC3v/Do/7tMW9AAJ9RKsifGnCv168t4lldPdPc6+2gTqEDsPhvqiaf2U4tqNqY4E5MxkI
	kum8JDrQxj5cd2kkEXDUN8OEJEf+ijhICzpyYkRbKMQvXqmsGPryW77dNUi0Rdw33wtGtqsn/JFVC
	ztWk1fSJr5ehHI1WdhnSjfcrmZzknfrwmUW5g0KaldtdhZZQVBjhf8Jm5O01bce/4QilNqJ/hQvmx
	dmxPgXMmaR0oB1jpJaGgtZK4ALLz9/Jhcfq/4IfJazlUxqYLuZdx2jXoeGZ4fnG1Z9MPnMkH/6Cth
	4Ku2Cj4Q==;
Received: from ip6-localhost ([::1]:58974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sybpB-003OoN-PP; Wed, 09 Oct 2024 18:54:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37496) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sybp7-003OoG-SX
 for samba-technical@lists.samba.org; Wed, 09 Oct 2024 18:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=n7ooIvy69r4CG9DaMKh3mwQN1GmE9Mye+zOvfL41Hwk=; b=ZFTNZE3+GY1mumtd7BdMR/MdSN
 mKTwSkNw64TH81b0lurq7hZ+WxOaw9ZNmjQOrgxuQ7HG4/0ABG+7UJt0P02xZhdWmX/DnR0EFGCUh
 eWwqfTT71IKOzZQj35WCo0ULQwejug1kpVub3tMVHz8/9yXE3McMYosXFAXjCWkKzoT/jqQ5qAkWU
 bHBBBPT7UVN3vnSYPlPkexs6WRNGTVR5qXboet96LNtw4IxT71YbXWLvUGXbfFtrAeZCj4gCioKPi
 bsI77a4ZTw2nIwpZyWK7KWk9goK8ChXmxe8SdfFDUyHbhGE5P2DMxsZQ6T3idYCiTSgytqAu0Li2A
 //UZ6IEuolOzZNQu5Cp05uewQhNsoTB++Zt+j5d3pCg/r4BoermTy5xCIAaLB5KSamJobJbJXTx3m
 bqBjrwF6SNpq4XRob0ziI7eFO+H9E705+lWrkBnQh3RY2yA6DhD4v9t55UDAZ7zqyfsAGbJ7m8+DQ
 HK3jvkdEE0C4UL96lLilQ4e4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sybp6-0045g8-2v; Wed, 09 Oct 2024 18:54:13 +0000
Message-ID: <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
Date: Wed, 9 Oct 2024 20:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Za4vIQZXxM2o0Z0AAG0lUqsV"
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Za4vIQZXxM2o0Z0AAG0lUqsV
Content-Type: multipart/mixed; boundary="------------D6KSnJNAG0ZS08GgGamvou1f";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
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

--------------D6KSnJNAG0ZS08GgGamvou1f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOC8yNCA1OjE2IFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gSXQgd2FzIGRv
bmUgYXMgcGFydCBvZiB0aGUgU01CMSBleHRlbnNpb25zIC0gdHJ5aW5nIHRvICJwYXNzLXRo
cm91Z2giIGFsbA0KPiBwb3NzaWJsZSBQT1NJWCBvcGVuIGZsYWdzLg0KPiANCj4gSnVzdCBy
ZW1vdmUgaXQuDQoNCm9rLg0KDQpCdXQgdGhlbiB3ZSBzdGlsbCBuZWVkIGEgd2F5IHRvIHBh
c3MgT19BUFBFTkQgb3ZlciB0aGUgd2lyZSB3aXRoIFNNQjMgDQpQT1NJWCBhbmQgd2UncmUg
Y3VycmVudGx5IGxhY2tpbmcgYSBzYW5lIHdheSBpdCBzZWVtcy4NCg0KV2hhdCBhYm91dCB1
c2luZyBvbmUgYml0IG9mIHRoZSAxNyByZXNlcnZlZCBiaXRzIGluDQoNCjxodHRwczovL3d3
dy5zYW1iYS5vcmcvfnNsb3cvU01CM19QT1NJWC9mc2NjX3Bvc2l4X2V4dGVuc2lvbnMuaHRt
bCNwb3NpeC1tb2RlPg0KDQpUaGVyZSBhcmUgbW9yZSBwb3NzaWJseSBpbnRlcmVzdGluZyBv
cGVuIGZsYWdzIHRob3VnaCBhbmQgSSB3b25kZXIgDQp3aGV0aGVyIHBhY2tpbmcgYWxsIG9m
IHRoaXMgaW50byB0aG9zZSAzMiBiaXRzIGlzIGEgZ29vZCBpZGVhLCBidXQgdGhlIA0KYWx0
ZXJuYXRpdmUgb2YgY2hhbmdpbmcgdGhlIFNNQjJfQ1JFQVRFX0NPTlRFWFQgcmVxdWVzdCB0
byBhZGQgYSBuZXcgDQpmaWVsZCAiT3BlbkZsYWdzIiBpcyBub3QgcmVhbGx5IGEgZ3JlYXQg
bG9va2luZyBvcHRpb24gZWl0aGVyLg0K

--------------D6KSnJNAG0ZS08GgGamvou1f--

--------------Za4vIQZXxM2o0Z0AAG0lUqsV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcG0VQFAwAAAAAACgkQqh6bcSY5nkb3
dg/+IUDIHHJDPY5Wle0xhg4MgXFwiFfUuR6At9Lqx6JtHIDC5Q/h/bTjGBPNaYqCzB43L7JuRcIL
P807CmNTY5E4tO1gKRGjuqnVZtRbKNUek45oyHbOBQhD73s47Bergj8k+H2xIh3UfMpoBc3I2ptR
ZOHfySaOaz7tTnP0VLGwD9rU9QByFHbjTWUC9Y6unlyjCSQViWO0uG/8EqJdTS1jmAlZ6ZDs07BD
BrTZOoGuWwN9ehO2FlcBeOqsSS5sebkG2dRFV8BN1rwe0tiSXMkTRqpDSHr2RnO6eQxLdjwkWwA5
Sn77SRDSaiUGtHaQS4bvyMrxSQbFbBhDeZvjuQ3ZnwCU3EBurAzp/CG34g4jmlSlnT5hF5M84x+V
8I2KhbNn1dni2P+0obUkD+uqK6RtPhMpKyDkbIk5Tt04bpyyNMnLmzwB7zHaVv7g4w7dkTgs8WON
NLViQCnxvgDWAN8VxtH+WOLeDHoX7f6R/4JDkF1q9ZAW3KbSYOkXBfUSA/6SR6aXGNh06e7ltdB8
SpG8CV3mur83unI2nMv/7b8R+ODFFkHBtnlOoqGtY0v/BrfMONwzF1Tcaji82wf1psKhl3N7CCDE
EwfRvvZ5gQgy89PSNl8HVLIimjaGFchpx+lNaGP/PmFdoQsk1mAgzS4C6uthefUqN3tBHCBLiKl9
z34=
=V7Ee
-----END PGP SIGNATURE-----

--------------Za4vIQZXxM2o0Z0AAG0lUqsV--

