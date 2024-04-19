Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC2E8AB43D
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 19:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3NVl9qSacZBS5IqeCCrpAT0TgTIQeaOTJ7o9X4ThQ5E=; b=HQUK0knzVbLm21C+EZK3olyd6S
	QvIzt/G0EytACxLeRSObtEL4bnb2Qe26UntO6tdoiuMjvBJdZP1JQqK7HpD+F+vM57f5f8590OBW/
	siomdEN/mGmpUTVhd5ROA9cgU1Pz9f0rt/kn87VogpmFzYi9a29BmttDr+wetsa5CXtY0LJMw5RF0
	UPEGsJHCaoNfL+AikexhWOTCEAUZKIV+g1RuFJtS2ncea8ZxsjGdDDiDH7c/VVWbpw7pvnE7sUoBr
	y9+SWCoWCFdbmUfbjcgrKepm8pjKklzDo2U4J9eZsoT5phSQvHPu0Pzq17Eu6AQh8+Th5dN6roHPy
	Tk+ZYoqQ==;
Received: from ip6-localhost ([::1]:43728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxrqi-005DPf-8s; Fri, 19 Apr 2024 17:16:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22400) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrqd-005DPY-23
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 17:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=3NVl9qSacZBS5IqeCCrpAT0TgTIQeaOTJ7o9X4ThQ5E=; b=YYZLt37d1l0V9yNT3idQX27VVf
 qMuOK3ecEowTPgMBQZCEXKWKPdVYQBL1vEesPF+FyQVEnlIg6ijxs/N+wWBNrnA49lDhE7c3ig0Ih
 +GKoIpS+MY5aYzOIeycPOq7HO/938sDXyOscvOxBX0hmuzx8OkLD2GxJZOQUzHHm+x/LnNjqcyQpL
 IUTXTmStLXpGWPEkn8vsDlYEJJoCs4JBWbgO0VnMN3CnfltvHjwaQwxlR0514tPigMJrj3SBBOeAA
 TyEwzXI15bgD2j0G0kl5pucdOBlEBgYoEwNPmBzp0jKkZZHXbxRPKGB4IX8jrOkS7Q1z5ksn9mh+J
 ujYL41AukO+qFp+0o2pwx4x0uGbrUofny+xt0VjXu4pRjdYagWD95GKJ/5cqxsh95lARrk9+AIjAR
 EhyzPgdmtWXZ1DSUW8iFbsCvFLlvg8Zd0sA0wMBm+KkitBhbPlzu3QY3P46kZypj7G4lTppnQlZvi
 R9wydYRktUB7YULyEomOeGDs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxrqb-007IEx-13; Fri, 19 Apr 2024 17:16:25 +0000
Message-ID: <93429498-3f66-483e-bb4c-c051f5dcc2f0@samba.org>
Date: Fri, 19 Apr 2024 19:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Doubts about Samba's unicode translation tables
To: Xavi Hernandez <xhernandez@gmail.com>, samba-technical@lists.samba.org
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dHp6WDFX9pUa9PEHMPhXydgt"
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
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dHp6WDFX9pUa9PEHMPhXydgt
Content-Type: multipart/mixed; boundary="------------Zqe8dag0B0LCoDtmwjBJYIJ1";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Xavi Hernandez <xhernandez@gmail.com>, samba-technical@lists.samba.org
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org
Message-ID: <93429498-3f66-483e-bb4c-c051f5dcc2f0@samba.org>
Subject: Re: Doubts about Samba's unicode translation tables
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
In-Reply-To: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
Autocrypt-Gossip: addr=gd@samba.org; keydata=
 xsDiBDaNYHARBACl7XpcrfyfnRrvx3b+LeD47TTIe+zUmYlbePtd1PzlvLDQQEsa8lJH6wuv
 v3b3pFCcOCpMbdY2MTsvUCqLobNevn6mBJcJPc9qUxc7COzDUwKzr+rwMr63kNEh7Wgc7f6K
 suXvNnvxFKV+xdg9Qy6aMogliRIiLCJaXt5uWNdg6wCgndm6MvXltQZ9P4+m+IWyXTeW5nsD
 +wYlGl9dncl1MW2cTBL/Petbw+FGW+OX+7c3IZm4pO4fWX4SSbRSrnDd/I5EBBWYG/7yKupF
 cinkebL8azCceewx5m1JQjZJj6eL35nlvhxQ4FOWMqFpV4b49mDv3O+CGDejkcz4bQmQ/rpY
 zafIFqwpi53r3JasjISyYnFemkWUA/4t2ouMLculMji+cS1PTyR2/XPSE7Qn3ny8ZGpEGeeM
 FFRd164G2QtfFdVh+EBwajc1DpwwbRqrIvsVjoFhHLRUZhbzF28gkXj48ZoxCW9zyJOywVzV
 Qh43sfCgUhR7fDYObqEUy+yr9PB6o85L8ZCeDAgLNTG1PGtdzLgnBrrcSs0gR3VlbnRoZXIg
 RGVzY2huZXIgPGdkQHNhbWJhLm9yZz7CYQQTEQIAIQIbAwYLCQgHAwIDFQIDAxYCAQIeAQIX
 gAUCQX+tOgIZAQAKCRBI6TdojuEWiOBkAJ9m/IZFxFnMcBc5YLwoOzl0X4+3egCfb55AmIJQ
 wWROneEdHdQm3colxETOwU0ENo1gpxAIAK9NcjS4DVKhKTxIsGjUvdOfSwUecdIIyyj/EtG1
 Mjvo6OmY9gfMqUI7f2UvdVediEB81QXSV6qXUWrPt7GqS5NL+9HlUpL6XyWwGA95mM3ZEW2s
 jCKKOTocOyH0N16juwqn3h6fxCV/oEwO9MjQnJLHPHZTwXbrxL+GCuinKcdFBsgQcbJeJ48/
 1Z/dzHaJUCEM4WGhq0P3LfCNvDZ1VttS6oo2YpklJDtKMsF6Sg2qmWd8acpBSWwpsEIg1wpF
 VDbdTbkgGSt2HSePo6VonMrcUHfHMOV0i33CqpLleHLutlTNdNgXV+CN+E8bMz/AUTZ+cWa5
 sJZ+CU6RECZ4tlMAAwUH/A/WHRu8HWGsrCBZfTlBR4z0YzFvO7kV3WS8grO1hmd5q06qdz7/
 AObBvjtGBxSJAlo8nMtgDwqrvJRYfbuFjbHcBdcE4ZzTCLTG4gAcvVlp/k38L6HqykQsol7P
 iW1o4jex7JY7s3o4/OsFmQIbVzaHftikD3Mv7E/ES5D1+u7SaPNlb3SFftV/F2v5yzGzURwT
 A1vZyPSIs25WoScIN+0DSOTeEkIVJsxSd24XrBdLUkK2zFINvTQVHThCPq5pOBPEge3Xnvfs
 AOlHYjhwNTlhaM9OgiRZpLNBwLWMYqdfSwS2xmjwoXgXhj5+VYqOeEKNr9wliann4u8VMHz4
 2bLCTgQYEQIABgUCNo1gpwASCRBI6TdojuEWiAdlR1BHAAEB5yAAnR6OnCjd7/1wFqM/kVhU
 p+Ev+osyAJ0XkXCcO77GcA46WS32g1uf8dMqKg==

--------------Zqe8dag0B0LCoDtmwjBJYIJ1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xOS8yNCAxMTowNCwgWGF2aSBIZXJuYW5kZXogdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gVGhlIGZpcnN0IHF1ZXN0aW9uIGlzIHdoeSBTYW1iYSB1c2VzIHR3byB0YWJs
ZXMgd2hpbGUgV2luZG93cyBvbmx5IHJlcXVpcmVzDQo+IG9uZSA/DQoNCmNmIDNlZDljOTAz
NjcxZTc5NTk2NGNlM2RhOWQwMDgwNDQ0ZWYzZWI1ZTkgYW5kDQoNCmh0dHBzOi8vYnVnemls
bGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzAxOA0KDQo+IEZvciB3aGF0IHB1cnBv
c2UgaXMgdGhlIGxvd2VyY2FzZSB0cmFuc2xhdGlvbiB0YWJsZSBpbiBTYW1iYSB1c2VkID8N
Cj4gSXMgdGhlIFNhbWJhJ3MgY2FzZS1pbnNlbnNpdGl2ZSBjb21wYXJpc29uIG1ldGhvZCBh
Y3R1YWxseSBlcXVhbCB0byBXaW5kb3dzDQo+ID8NCg0KSG9wZWZ1bGx5LiA6KQ0KDQo+IEkn
dmUgYWxzbyBleHRyYWN0ZWQgdGhlICRVcENhc2UgZmlsZSBmcm9tIGEgV2luZG93cyAxMSBt
YWNoaW5lIGFuZCBJJ3ZlDQo+IGZvdW5kIHRoYXQgdGhlIFNhbWJhJ3MgdXBwZXJjYXNlIHRh
YmxlIGlzIHZlcnkgc2ltaWxhciBidXQgbm90IGlkZW50aWNhbA0KPiAodGhlcmUgYXJlIDMz
OSBkaWZmZXJlbnQgdmFsdWVzKS4gSXMgdGhpcyBleHBlY3RlZCA/DQoNCkkgZ3Vlc3Mgbm90
LiBDYW4geW91IHNoYXJlIHRoZSBkaWZmZXJlbmNlcz8NCg0KPiBJJ20gbmV3IHRvIFNhbWJh
LCBzbyBJIHdpbGwgYmUgdmVyeSBncmF0ZWZ1bCBmb3IgYW55IGluc2lnaHRzIHlvdSBtaWdo
dA0KPiBnaXZlIG1lIGFib3V0IGhvdyB0aGUgdW5pY29kZSB0YWJsZXMgd29yayBpbiBTYW1i
YSBhbmQgYW55IG90aGVyIGltcG9ydGFudA0KPiBkZXRhaWxzIHJlbGF0ZWQgdG8gdGhlIGNh
c2UtaW5zZW5zaXRpdmUgYWNjZXNzZXMuDQoNClRoZSBoaWdoZXIgbGV2ZWwgcHJvY2Vzc2lu
ZyBpcyBmcm9tIGdldF9yZWFsX2ZpbGVuYW1lX2F0KCkgdHJ5IHRoZSBWRlMgDQp2aWEgU01C
X1ZGU19HRVRfUkVBTF9GSUxFTkFNRV9BVCgpIGFuZCBpZiB0aGUgVkZTIGRvZXNuJ3QgaW1w
bGVtZW50IHRoaXMgDQoodmZzX2RlZmF1bHQgcmV0dXJucyBOVF9TVEFUVVNfTk9UX1NVUFBP
UlRFRCksIGdvIHZpYSANCmdldF9yZWFsX2ZpbGVuYW1lX2Z1bGxfc2Nhbl9hdCgpIHdoaWNo
IGVuZHMgdXAgY2FsbGluZw0KDQpmbmFtZV9lcXVhbCgpIC0+IHN0cmVxdWFsKCkgLT4gc3Ry
Y2FzZWNtcF9tKCkgLT4gc3RyY2FzZWNtcF9tX2hhbmRsZSgpIA0Kd2hpY2ggY29udGFpbnMg
dGhlIGNvcmUgbG9naWMuDQoNCi1zbG93DQo=

--------------Zqe8dag0B0LCoDtmwjBJYIJ1--

--------------dHp6WDFX9pUa9PEHMPhXydgt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYipugFAwAAAAAACgkQqh6bcSY5nkZY
nA//cNGQgDB1PgWbT/VOoyQOKVB8tEjaWtBWo2A5//ZqBnh96aR+Q6Pa+IAPJzLz65wGcKPeNt/3
lN8hxLUz/DraKYaVHUfuKfwcg8Amcbi2fgrUf+gPi5xolCgUoqxp9Z5O+7DfimN9GcRYLpwL+olp
U1zsw4yjDeaEWPhVeP1zKaTDkpqIPRMsc6L4+nIaFhAOy6ujfTAgFXouV6P+8kIyfXJ61VUqhgi3
1psaZbvaLpREC/njlQ/djGSgaalaCxDUUNUZMGNGfTYWzNKI9Go+KKNUYAVXwnPqaJu3oXTpdUNG
wOjn/NIjIr+NU/bYlssrUdO0xHJPTHjXnVimRC1jM3TETTCVAR+VknUKpb/Llab//WkCO+KeqJUa
UHtB5IJsz27nJWg6hXybG2GysHkWkDxx8CUiI8vJ8lAsK0uCZfuX746aabktCHv13G1EzCiWZALL
7ri206zvM2ikyRSivTHfCC2gVsbNCUe9jci3r9w5dO6FX0Rf9eCwGP2oXSUXBFenD5t3waJZoh4B
UJtj2GZQP6g4gt5d37NLa++MIloRLxAu+rVaUvGJHFKUzgBWRASH6RsXvfZJWjTQanoEwt4s8GUE
+VC/2ikN83COCCXH122aNkWkn9DHvn+Ym0+d6SDYKpnPcxFY89aqKoI/dQB/xhEZMtSP5S7uY8Gw
jyg=
=NqMG
-----END PGP SIGNATURE-----

--------------dHp6WDFX9pUa9PEHMPhXydgt--

