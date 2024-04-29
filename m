Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE18B5377
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 10:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BGlSpBuzsCN8B4JIiKQRPN7B1GoppBegFDNF4/yRgsw=; b=w2nmBDNaihc2kZcSI04VhheU3p
	GOt1+yPsZYfUCDdAge4XMO+1xEcdAzHx6dYe9iY05q3G146BL1WHcbDmxhpisigXPeldNqqlRFzIZ
	2RedfnAO9tidZMBeC3IyAIGdC/7hCVTR8c4s1MYlzYQi2WB1zf8lFXhRDGm/Yoth2/v6gjcyLAbjn
	DjasgyPtrnYCxmOjX/U6ZcJyFFq2MfOIoBVZeq1OgmT+qgK8cmwddqSrXbWFJyXU2LYr1L/kO4GH+
	2I2e9xq8ikKGtel2A6LtUzgv7HKU4eRdjvmhp1hxfmt0aEd0VQgnlHe3HlA1qKbUGNIs3mC9PWV/z
	qECn6z9A==;
Received: from ip6-localhost ([::1]:59006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1MjQ-005ynK-Lg; Mon, 29 Apr 2024 08:51:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49910) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1MjL-005ynD-PH
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 08:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=BGlSpBuzsCN8B4JIiKQRPN7B1GoppBegFDNF4/yRgsw=; b=b10wt43TnSzhKaqReDIerDrycd
 tl+ByQVk3FrrS9KxEvDFbfE06w+VmdTVWQia1XilJT+2ZrhYEeBxn1tc6LJTQmVD+Ws/gomSvs67N
 0LEs7zO58xAPb44PixJN6n057I+I7fDgFf5uOQEJh64ADykFD59PlN2fnuu3yXjJETpYHDC7J7oNo
 H1q4jyfiJe1j8W7k14X/sqEoFdlMGR+VF8S4Svrgb0VH/+SqdjxbUQmFz2NYNOIPdY0ifVLK4R9iz
 0wk6kUyewQMWqm3wFnKKtus5SHEu4iI/o8xw5NSZa1q5MzS5JC28xvrpYnpr7qgcMoZyUYQluTBju
 3CIwrI84wRSANsP2kwxsMiGbsVkaqswdDfqGmAilIZ4MDZAnDEJp1L0mIWTQHKbIhEulabNRWKt2U
 NHNOUBPIWCh3D5KIJdoxFu0z7HYwUfEyUIjvvhBxnJbtl5HIrIIKbykNxloO8+HthikhBvABPPQc0
 bylbhjVRBoYqLU+IKKboxNXy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1MjK-008tYj-1b; Mon, 29 Apr 2024 08:51:22 +0000
Message-ID: <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
Date: Mon, 29 Apr 2024 10:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba ctime still reported incorrectly
To: Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rU6BYgZkl7nteXUCEJG502jR"
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
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rU6BYgZkl7nteXUCEJG502jR
Content-Type: multipart/mixed; boundary="------------H31Wrr9StC30mgo9MWOXxwP1";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>, Jeremy Allison <jra@samba.org>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
Subject: Re: Samba ctime still reported incorrectly
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
In-Reply-To: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
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

--------------H31Wrr9StC30mgo9MWOXxwP1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDQvMjgvMjQgOTo0MSBQTSwgU3RldmUgRnJlbmNoIHZpYSBzYW1i
YS10ZWNobmljYWwgd3JvdGU6DQo+IEkgZGlkIGFub3RoZXIgdGVzdCBvZiB0aGUgU2FtYmEg
c2VydmVyIGN0aW1lIGJ1ZyBvbiBTYW1iYSBtYXN0ZXINCj4gKDQuMjEuMHByZTEpIGFuZCBT
YW1iYSBzZXJ2ZXIgaXMgc3RpbGwgYnJva2VuIGluIGhvdyBpdCByZXBvcnRzIGN0aW1lLg0K
PiBBbiBleGFtcGxlIHNjZW5hcmlvIGlzIHNpbXBsZSwgY3JlYXRpbmcgYSBoYXJkbGluayBp
cyBzdXBwb3NlZCB0bw0KPiB1cGRhdGUgY3RpbWUgb24gYSBmaWxlIChhbmQgdGhpcyB3b3Jr
cyBmaW5lIHRvIFdpbmRvd3Mgc2VydmVyIGFuZA0KPiBrc21iZCBldGMpIGJ1dCBTYW1iYSBz
ZXJ2ZXIgbWlzdGFrZW5seSByZXBvcnRzIGN0aW1lIGFzIG10aW1lICh1bmxlc3MNCj4geW91
IG1vdW50IHdpdGggdGhlICJwb3NpeCIgbW91bnQgb3B0aW9uKS4gIFRoaXMgZS5nLiBicmVh
a3MgeGZzdGVzdA0KPiBnZW5lcmljLzIzNiB3aGVuIHJ1biB0byBTYW1iYQ0KPiANCj4gTW9y
ZSBpbmZvcm1hdGlvbiBpcyBhdDoNCj4gaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hv
d19idWcuY2dpP2lkPTEwODgzDQoNCkkgd29uZGVyIGlmIHRoaXMgaXMgYSBidWcgZ29pbmcg
YmFjayBhcyBmYXIgYXMgDQpjOWRjYTgyZWQ3NzU3ZjQ3NDVlZGY2ZWU2MDQ4YmQ5NGQ4NmM0
ZGJjDQoNCkBKZXJlbXk6IGRvIHlvdSByZW1lbWJlciB3aHkgeW91IGNob3NlIHRvIHJldHVy
biBtdGltZSBpbiANCmdldF9jaGFuZ2VfdGltZXNwZWMoKSBhbmQgbm90IGN0aW1lPw0KDQot
c2xvdw0K

--------------H31Wrr9StC30mgo9MWOXxwP1--

--------------rU6BYgZkl7nteXUCEJG502jR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYvX4kFAwAAAAAACgkQqh6bcSY5nka5
CBAAuynUkQo/s/YFiwOyfdxBKqdlEgG1RFvQAbkXV/BfvpTbdTnE1kYLFlNlQdbJEZvvZiLqWnRZ
Jc4KNFRFveiBUO/BZbxsauCUkcOJDq0GZy/XT9zuCpMuNA1gnY+yxW+03QFfr5Da9bfVhXtOT629
JzU1PZaBSvxCc6WsLjW048WCxuoMMEOjcEhk02XGgyKI8P79CSaW8Sk94eo2ECdi9XklRmplaEsQ
9uN7JmlSgGaj/A/dGwIx93voe2vqR4p4ccg/k1GcF0jk740IYikmw2kif9NkxWrkcLuR1aI7AJf5
GB81kHzHZ0q/7lxMvaBSF3iME9zuSOPl4QeAiuQyGMDKpmbeHbX7lbKc5ZtHPnktYy4R8XpgJff3
Z9y287NmR7o578f8hm0fxvWGRM7x2HbeehmZQ1739i3DuKgxsomW2H6s2L9Pi5AI1D7pONitpoMD
4irL+pno7PDrBT208RXcZJ9MzvUcjH1qBIcMePxrBN6NE7Q50nngDpNXDcoF28udDz0sAA8pI8L+
gYJjk2FfyRkOTzd59unAB5BXkFUwhLRMAKHaK8vzBOTrMQ1Rk6Jh8hxTpxtKMZViu/pG1fj7grHV
lIVaNl/xeCiB7YX8jJtxN/GqdLBlsnmKhf8bzAZX+uglyQ/ttIWgZJ0kpOMecyCrUbkPVcEUmi56
YaY=
=m1Pw
-----END PGP SIGNATURE-----

--------------rU6BYgZkl7nteXUCEJG502jR--

