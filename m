Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA0D9B474A
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2024 11:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mSXsTk3LKqJCqb2l3RG2IEqwWRBJSntXJyWLdGDUhxg=; b=Q/lhXZeUThndEsGICwSULIIoXL
	J95brVwX1nc+D4SGBGwEwrPf/UYIHHJxvWq0WE7Eth9QECnrcDwN11q3pmSXN0DtUo3WtjDbnMJOi
	PBtRmoJLk4uGrYnVO3X/QxczVJ34tmwdc01oRRQUrrEQiKVa1SYphlco+zl9K5cgyXleR5axkJy+N
	X2Z9y55D8RQKo+xT1SgSZfPRUVQrdaXeoEZQNfK15+XsoQGnLSIvkigCcQNsJL8K3HuzThWMRdLBw
	hp9jNxT2N0cdzMXsykpwE87Smy5G+yGdinoRuAyxE39gVOiCormPdNg3/GCKz6x5IPLXKLQzYqdyG
	/3JdU60g==;
Received: from ip6-localhost ([::1]:60136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5jnZ-005Snh-Qk; Tue, 29 Oct 2024 10:50:05 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:35265) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5jnV-005SmO-On
 for samba-technical@lists.samba.org; Tue, 29 Oct 2024 10:50:04 +0000
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by plasma.jpberlin.de (Postfix) with ESMTP id 78BF6AC8A8;
 Tue, 29 Oct 2024 11:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730198996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mSXsTk3LKqJCqb2l3RG2IEqwWRBJSntXJyWLdGDUhxg=;
 b=dvMc7IUGIr7VWVqVOhcUzWzYizHzuv+ueZbi05RGDpjhUVDY+nZsoUa/gyE2lZ8ldQrBHk
 5o5V7dhlWZ1g6FnHccj9LH8q+jaYuKurvGgrX/MODCJwR4quJgK8Wu1PpMe0cp3m/x4hdQ
 TiDDp0DLA3R8aSS0oK4xHGPYQeb7nh5aMoXadkWkKNEIQZhlUfsuX8c7X2dw6usvNHX5nu
 0rWkCXD7dDQYnnIc0bqIsCoY2DxHgN+Tz/Kc2/XMX4uy1I5bZOQVlYrgT/xiXr2sTBhI5f
 2npccDonDPAbryzHAivOxNhMRHWSWvQcrbgfeRQmWImNCEiMd35BVmvueAVLZQ==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id SEiEul4dxnF8; Tue, 29 Oct 2024 11:49:48 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id AACA8A6A5E;
 Tue, 29 Oct 2024 11:49:47 +0100 (CET)
Message-ID: <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
Date: Tue, 29 Oct 2024 11:49:47 +0100
MIME-Version: 1.0
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pUFhMuP0RCveSKQvweFahhA1"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pUFhMuP0RCveSKQvweFahhA1
Content-Type: multipart/mixed; boundary="------------ahr90oCkB9P9G07E0QEr4dPz";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Message-ID: <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
In-Reply-To: <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>

--------------ahr90oCkB9P9G07E0QEr4dPz
Content-Type: multipart/mixed; boundary="------------9qJbXY6h8RNNEAlxlvqWacto"

--------------9qJbXY6h8RNNEAlxlvqWacto
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI5LjEwLjI0IHVtIDExOjI3IHNjaHJpZWIgRG91Z2xhcyBCYWduYWxsOg0KPiBX
ZSBuZWVkIHRoaXMgdG8gYmUibXNEUy1Db21wdXRlckFsbG93ZWRUb0F1dGhlbnRpY2F0ZVRv
OjoiLg0KPiANCj4gQmVjYXVzZSB0aGUgdGhpbmcgeW91IHdhbnQgdG8gY29udHJvbCBhdXRo
ZW50aWNhdGlvbiB0byBpcyBhIGNvbXB1dGVyLg0KSSB3aWxsIGxvb2sgaXQgdXAgaW4gYSBN
aWNyb3NvZnQgZW52aXJvbm1ldCBpZiBpdCdzIHRoZSBzYW1lIHRoZXJlLiANCkJlY2F1c2Ug
SSB0aGluayBpdCBzaG91bGQgYmUgIlVzZXJzQWxsb3dlZFRvQXV0aGVudGljYXRlVG8iLiBC
dXQgZXZlbiBpbiANCnRoZSBtb3N0IE1pY3Jvc29mdCBtYW51YWxzIHRoZSBwb2xpY3kgc3R1
ZmYgaXMgbm90IHZlcnkgZ29vZCBkb2N1bWVudGVkLg0KDQpCdXQgdGhhdCBkaWQgaXQgOi0p
IE5vdyBJIGNhbiBvbmx5IGxvZ2luIG9uIGNvbXB1dGVycyBub3QgYSBtZW1iZXIgb2YgDQp0
aGUgc2lsbyAoQW5kIGdldHRpbmcgdGhlIHJpZ2h0IG1lc3NhZ2UpIC4gSSB3aWxsIHRyeSBp
dCBsYXRlciBvbiB0byBkbyANCml0IHdpdCAhPSB0byBjaGFuZ2UgdGhlIGJlaGF2aW9yIHNv
IHRoYXQgdXNlcnMgY2FuIG9ubHkgbG9naW4gdG8gDQpjb21wdXRlciB3aGljaCBhcmUgbWVt
YmVyIG9mIHRoZSBzaWxvDQpidXQgdGhlIHByb2JsZW0gd2l0aCB0aGUgdGlja2V0LWxpdmV0
aW1lIHN0aWxsIGV4aXN0cy4NCg0KSSB3aWxsIHdyaXRlIGEgbGl0dGxlIGhvd3RvIGlmIGV2
ZXJ5dGhpbmcgaXMgdGVzdGVkIGFnYWluLg0KDQpUaGFuaydzIHNvIGZhcg0KDQpTdGVmYW4N
Cg0KLS0gDQpTdGVmYW4gS2FuaWENCkxhbmR3ZWcgMTMNCjI1NjkzIFN0LiBNaWNoYWVsaXNk
b25uDQoNCg0K
--------------9qJbXY6h8RNNEAlxlvqWacto
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------9qJbXY6h8RNNEAlxlvqWacto--

--------------ahr90oCkB9P9G07E0QEr4dPz--

--------------pUFhMuP0RCveSKQvweFahhA1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyC9ywUDAAAAAAAKCRBS9tTdG7aKtTL0
AQClr5xLstvYgvLdiomCI4bfOBs0Kwh979i5dw6xROdWJwEA/cEzU0LGCWTu/EEvJhw86b5CDWys
9w6njp757YsGVAc=
=2j9e
-----END PGP SIGNATURE-----

--------------pUFhMuP0RCveSKQvweFahhA1--

