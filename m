Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A848D8B50BE
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 07:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p3Eum7I6d+MgZJIrdOjx0mNYw+5CYzm3MhSzTQ0hvYI=; b=3zqHj4NPwDJB2F/9WLB2qxriXS
	ke9s+Tpk/D05Njn4SHRnXYbjY58MSsCm6D7kjuUnAdxJcAcTk6Xiqn7lbYtS4uj5rZVLgkO2FTTBk
	SPGjDGudaezJbHv3St4X7WKASnj5PE2f9XW93YrULZPZ9kPKkkGYx4zQWZRB0BePlc7eALqJmqky7
	8PlQW1ESMgbMcPdbDHBVF7aMXoE5TDjfLOS7NFrfqNIGk3BJ3okFXLa7qpaXQk+na74JZC0FSE8in
	whHIFTmCd2Uau4/zZzArtodvvlZ063UuxqspbtTq+RxslPw/2e5CRzG6FfwQourGoMPkUjWLSwDk6
	7Lguvuxw==;
Received: from ip6-localhost ([::1]:56032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1JcP-005y8d-3o; Mon, 29 Apr 2024 05:32:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12490) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1JcL-005y8W-LC
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 05:31:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=p3Eum7I6d+MgZJIrdOjx0mNYw+5CYzm3MhSzTQ0hvYI=; b=R+5Sd3XNJaLVc1j21oKtBfcOPW
 lpLXiogsc5ck4ZzbzEDxSTtjjss5IC6GXv+bTyoMHu1OmAQZNjaJVoLmX1IZb5txwKFf2bJaTxLgV
 za1pdvjS5Ect4ukUnp0MtHtcA3M5/8Bx4x0AhxgFAkvvLD7dkEbMVGZjEGzv0G7tNaiWW+DNS+TDA
 iuZg3KdmEne1MFZK/fr377ux7mU9aB5Apgnpkru1w3P3Z8ZGkC1k2P0gWD2lhMMYoOyDzi+N2pv/q
 waqEtQk6bps9khp/E5a2yLdsiHPObjRJgMK512TcVMTUYhHNYNyBFOCRoVMoaNTMlVEndK5cI/4wA
 00ZmHFJGXfr4LmyMRqEXVEQLu/UTTpULp8xcdvFbz0M/EkaE/4jpTMbS/pV6r/ZOjdQjuP3E3c+Nn
 jlNcVfuiDeGDae8QTSiGilJxD/UZOx4mXFK/UvypmW1z98pc6b5OqgB6TpoeFsOWVvZjOTcq9LrsK
 Ec0y9Chv2HNLoH5fl0/VKEnI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1JcK-008pXz-14; Mon, 29 Apr 2024 05:31:57 +0000
Message-ID: <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
Date: Mon, 29 Apr 2024 07:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: query fs info level 0x100
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o9RmA0wNNX5GWx15gD3Ex9gS"
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
 "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o9RmA0wNNX5GWx15gD3Ex9gS
Content-Type: multipart/mixed; boundary="------------dIbrp0mITgGTkMrG8DbDZ0U9";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Cc: "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 Jeremy Allison <jra@samba.org>, CIFS <linux-cifs@vger.kernel.org>
Message-ID: <72ec968a-ac67-415f-8478-d1b9017c0326@samba.org>
Subject: Re: query fs info level 0x100
References: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
In-Reply-To: <CAH2r5msg91ad+K+eZmCjKCJeDgyb6xcUUhmpaXeeTFjqFZUeBA@mail.gmail.com>
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

--------------dIbrp0mITgGTkMrG8DbDZ0U9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yOS8yNCAxOjI3IEFNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IFRyeWluZyBzb21l
IHhmc3Rlc3RzIHRvIGN1cnJlbnQgU2FtYmEgKG1hc3RlciBicmFuY2gsIFNhbWJhIDQuMjEp
LA0KPiB0aGV5IGZhaWwgYmVjYXVzZSBxdWVyeSBmcyBpbmZvIChsZXZlbCAweDEwMCkgaXMg
cmV0dXJuaW5nDQo+IFNUQVRVU19JTlZBTElEX0lORk9fQ0xBU1MpIC0gdGhpcyB3b3JrcyB0
byBrc21iZCBhbmQgSSB0aG91Z2h0IGl0IHVzZWQNCj4gdG8gd29yayB0byBTYW1iYS4gICBJ
IGRvIHNlZSB0aGUgU01CMy4xLjEgb3BlbnMgd2l0aCB0aGUgUE9TSVggb3Blbg0KPiBjb250
ZXh0IHdvcmtzIC0gYnV0IHRoZSBxdWVyeSBmcyBpbmZvIGZhaWxpbmcgY2F1c2VzIHhmc3Rl
c3RzIHRvIGZhaWwuDQo+IA0KPiBJcyB0aGF0IG1pc3Npbmcgcm9tIGN1cnJlbnQgbWFpbmxp
bmUgU2FtYmE/DQoNCmhhdmUgeW91IGVuYWJsZWQgU01CMyBVTklYIEV4dGVuc2lvbnM/DQoN
CnNtYjMgdW5peCBleHRlbnNpb25zID0geWVzDQoNCkNoZWVycyENCi1zbG93DQo=

--------------dIbrp0mITgGTkMrG8DbDZ0U9--

--------------o9RmA0wNNX5GWx15gD3Ex9gS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYvMMsFAwAAAAAACgkQqh6bcSY5nkZT
Eg/+Kml14KKdpzxXKljkQr9atTF7jhMlewAs5k4GcXvNNs5cvy4sI2cNxijc3rI0vUb6Fn49W7qo
DHe2/uJ68BhLouV9zLjBDIyKEZPsA6yE3ch9RIH0fd7pHzoVN6QiudIMghM8OUnUlrSrApEJx8sW
Z5vZKcz431bsjNFFrkxhUpLX/mzZE5Bv693Y+0h5uJwIHugxAuVc/kjIRvBRS/NSZwtMASv7W7EQ
wKKDOcxDY63NXAhdgkbBjnMYR2DB0OFdd2Bx2S+4on100dqVyoS3FGvf8AWWosoHeroJwVlJUpL9
T09oYDrxABYLJC+SMyc05Rt9PsWJiQK2YGFAiU+tNXa57b+6ZwjOBcLOZLV+GoXNT7wEVpFpJZNm
xgy/tsY7WSl3WEJKr2EUuMNPCoQEJZ79GLM8cTL0GgOO6OykC6qZ02e9u21VEGyCC4X/CfGxjt9S
hugzOrrO4BX95fQcpDLcrviB6Wl/PEdUg56yB/w5i4SvTgd7uiiajCw8MJUy1TkyycQ+VDpOcJ/T
58cYYPM3feglgT/3bF3aW34CSInx1DVMyaK0a3jekpZ1LI2Srx/OkA99vdnNIysBNyJ41cSk8xng
I7BlAcQTktRkiktBkmJDWCYxFb9eUcZdiZq1W7VykUGuI2fLMN5muPbgTP6/LQBIw515KZVW0xTs
a5Q=
=z2xR
-----END PGP SIGNATURE-----

--------------o9RmA0wNNX5GWx15gD3Ex9gS--

