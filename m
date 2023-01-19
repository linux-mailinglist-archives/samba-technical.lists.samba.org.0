Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA0673F05
	for <lists+samba-technical@lfdr.de>; Thu, 19 Jan 2023 17:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uFYcbX1LJdaSi9NfeJVhnK0Y/fRA/l4Legtg2Qr6Nuo=; b=BFGThB02xorkhU4b9PIsrmyFkw
	ijerXVac0rei3iZFGbgiP7p/cDSAMSlnZkJyO0eXkKqRVQ2WCybsbLI1RFEcIWZSraGDxszumGv7b
	j2VVkr5dWksC6IeHJmcYK7srQcqMXFMU7YnKw89t5SuG3nBpdEahyvoro8zNeo35DU95KsOTL8RQc
	b3kLrfQ1L59j/K70mpIsuUVeqNVdYg6YmYTt2rGbVeQrRmwsrRL65+a+EtNtQ1EC11tlW+JN9wjno
	i16pIsa8XL9rzAIiaJoKh3VvhIkhY5bMvKrI1ntGm11s1BDdX54LpFGsjTGZCOIudnzqnsZxkMvyI
	vGVS090A==;
Received: from ip6-localhost ([::1]:52936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIXvG-000s8Q-4b; Thu, 19 Jan 2023 16:37:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIXvA-000s8H-Aq
 for samba-technical@lists.samba.org; Thu, 19 Jan 2023 16:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=uFYcbX1LJdaSi9NfeJVhnK0Y/fRA/l4Legtg2Qr6Nuo=; b=gzYnc20QgQ+MIRD9lamONYgbBA
 4brJDY9QfMjr/KgitA0kRqdD/CUzUQFiJxXNtBbHsyCryirQcadfmz2f/J7iJ72LfUGy+oJb0iK1C
 l/xMejijwmBmXQtCC3ikAJxrO0mkHo/pLlAr2Tcki/ccTQURExDyIdfAgXaC/wWsXXxp+EEmVg/Ib
 kR8oC5HsCf/NjTzsLTytjUdfFFqixd3uQZyCnMvjZR0geY/QsKeiCZMjzK9/dd19c+VYwkT5LEoxe
 TZeUNT48XAsr+yPbg3YD1mpvHfZllrgahujRjQJ402dgYkDcRPbneJiBVgc+XIVyV/PoDjTnjjW+j
 YheviecHRvUiTfDGCUb64i7v+ElvWTyV58Muz63gMQtEkpDFOuFSn5O/KNoK47EQY5SUMr4LWYir9
 J+q2DfcXPV4io+zekU6+giFAv6i84InLz+XQLI0ABS6GFTwqLDXH7pQg60Qh0vcpEd8MnMFKZF/JS
 bCWWsMz2Hr1tY/WYNkfl5arS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pIXv8-009NxS-5z; Thu, 19 Jan 2023 16:37:46 +0000
Message-ID: <4fc8850b-28d6-9ecf-8230-6cb2f235bebb@samba.org>
Date: Thu, 19 Jan 2023 17:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: dbwrap_py: rapid dbwrap backend prototyping and FoundationDB
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
 <Y8cCQmnpnLi91qvk@jeremy-acer>
In-Reply-To: <Y8cCQmnpnLi91qvk@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OFHAD5CaqS6bAnhgby6btqzq"
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 gd <gd@samba.org>, Samba-Technical <samba-technical@lists.samba.org>,
 Samuel Cabrero <scabrero@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OFHAD5CaqS6bAnhgby6btqzq
Content-Type: multipart/mixed; boundary="------------fW9zp4MU8xOOWo3NnRORSEw7";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Samba-Technical <samba-technical@lists.samba.org>,
 Samuel Cabrero <scabrero@samba.org>, Volker Lendecke <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>, gd <gd@samba.org>
Message-ID: <4fc8850b-28d6-9ecf-8230-6cb2f235bebb@samba.org>
Subject: Re: dbwrap_py: rapid dbwrap backend prototyping and FoundationDB
References: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
 <Y8cCQmnpnLi91qvk@jeremy-acer>
In-Reply-To: <Y8cCQmnpnLi91qvk@jeremy-acer>

--------------fW9zp4MU8xOOWo3NnRORSEw7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8xNy8yMyAyMToxNywgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+IEdyZWF0IHdvcmsg
UmFscGggISBJJ20gbG9va2luZyBmb3J3YXJkIHRvIHBsYXlpbmcgd2l0aCB0aGlzLg0KDQpu
b3cgeW91J2xsIGhhdmUgbW9yZSBmdW46IHRyYXZlcnNlIHdvcmtzLiA6KQ0KDQokIHN1ZG8g
YmluL3NtYnN0YXR1cyAtTCAtLWpzb24NCnsidGltZXN0YW1wIjogIjIwMjMtMDEtMTlUMTc6
MzY6MjcuNzg2OTM1KzAxMDAiLCAidmVyc2lvbiI6IA0KIjQuMTguMHByZTEtREVWRUxPUEVS
QlVJTEQiLCAic21iX2NvbmYiOiAiL29wdC9zYW1iYS9ldGMvc21iLmNvbmYiLCANCiJvcGVu
X2ZpbGVzIjogeyIvc3J2L3NhbWJhL3Rlc3QvZmlsZTEiOiB7InNlcnZpY2VfcGF0aCI6IA0K
Ii9zcnYvc2FtYmEvdGVzdCIsICJmaWxlbmFtZSI6ICJmaWxlMSIsICJmaWxlaWQiOiB7ImRl
dmlkIjogMzQsICJpbm9kZSI6IA0KODUzMzc1MSwgImV4dGlkIjogMH0sICJudW1fcGVuZGlu
Z19kZWxldGVzIjogMCwgIm9wZW5zIjogeyI2NzkyMDYvMyI6IA0KeyJzZXJ2ZXJfaWQiOiB7
InBpZCI6ICI2NzkyMDYiLCAidGFza19pZCI6ICIwIiwgInZubiI6ICI0Mjk0OTY3Mjk1Iiwg
DQoidW5pcXVlX2lkIjogIjk1MTIyNDUyNDYyNjEzMjM0MDkifSwgInVpZCI6IDEwMDAsICJz
aGFyZV9maWxlX2lkIjogIjMiLCANCiJzaGFyZW1vZGUiOiB7ImhleCI6ICIweDAwMDAwMDAz
IiwgIlJFQUQiOiB0cnVlLCAiV1JJVEUiOiB0cnVlLCANCiJERUxFVEUiOiBmYWxzZSwgInRl
eHQiOiAiUlcifSwgImFjY2Vzc19tYXNrIjogeyJoZXgiOiAiMHgwMDAwMDAwMyIsIA0KIlJF
QURfREFUQSI6IHRydWUsICJXUklURV9EQVRBIjogdHJ1ZSwgIkFQUEVORF9EQVRBIjogZmFs
c2UsICJSRUFEX0VBIjogDQpmYWxzZSwgIldSSVRFX0VBIjogZmFsc2UsICJFWEVDVVRFIjog
ZmFsc2UsICJSRUFEX0FUVFJJQlVURVMiOiBmYWxzZSwgDQoiV1JJVEVfQVRUUklCVVRFUyI6
IGZhbHNlLCAiREVMRVRFX0NISUxEIjogZmFsc2UsICJERUxFVEUiOiBmYWxzZSwgDQoiUkVB
RF9DT05UUk9MIjogZmFsc2UsICJXUklURV9EQUMiOiBmYWxzZSwgIlNZTkNIUk9OSVpFIjog
ZmFsc2UsIA0KIkFDQ0VTU19TWVNURU1fU0VDVVJJVFkiOiBmYWxzZSwgInRleHQiOiAiUlci
fSwgImNhY2hpbmciOiB7IlJFQUQiOiANCmZhbHNlLCAiV1JJVEUiOiBmYWxzZSwgIkhBTkRM
RSI6IGZhbHNlLCAiaGV4IjogIjB4MDAwMDAwMDAiLCAidGV4dCI6IA0KIiJ9LCAib3Bsb2Nr
Ijoge30sICJsZWFzZSI6IHt9LCAib3BlbmVkX2F0IjogDQoiMjAyMy0wMS0xOVQxNzoyNDox
MS45NTI2MzMrMDE6MDAifX19fX0NCg0KSSBmZWVsIHNvIGJsZWVkaW5nIGVkZ2UuLi4gSlNP
TiBhbmQgRm91bmRhdGlvbkRCLiA6KSkpDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1l
LCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5l
dCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJh
DQoNCg==

--------------fW9zp4MU8xOOWo3NnRORSEw7--

--------------OFHAD5CaqS6bAnhgby6btqzq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmPJcdkFAwAAAAAACgkQqh6bcSY5nkYd
qg//ZV/tFJKjP3YtwlbEu6fOzHcVIoHMvzg/lhcK14qgtgdl9uWKs8rhmtYIIpbbqzzCOpU6PKEj
Y7B6ubpyfKHJZZ6KhxTFGLNJjwR+5/2P9altlhCowSaLf32ddY9gi5SPNEvSYwCBKn8J2WA74aNx
wlAZjMenhwOTc9HWuUKQ3SqrzM7pqBF3JQ9Pj1ZBgX3BXO7KGe+/VLYQUww1906W2rTE92i50BSG
0PrZ9WeSiRf7q9NdgZoKfZCjyk/RUujBJ7S1CW8shi5nPLJ0mXn1JDd9qz2u/8WZkn1AFXMMvlKX
1iryAXP9NoXNRiiDg4RoGgowchzNdVIavmw1eOBBBSlb4o4YRHiY3/ETobaKhIGN/V6f18IUzn1M
M+P71A9/ccl23slcLKt1nRWyDMXPeYqAmC+qPblut/LoluGcQpJjWyAcBKgiFQOtuJds2KGTdUbo
ZGklGtMJBwIe6dVaDvOATemdDPJN1tRnjpemSDtYIPEvpRstlk20wVo6A5qAAtPf3i9u0ej+X5xj
AlbhiDRpZcKlhtoAOOtZ8gIF8KvPtNHUq5pOldSWTqLlwfzaHznzJf0Jp1uUSdtRKV0loZjWM9h+
vbhPA7AARYUV8iQ5tQe2KNCBkrBhBSXLpeBH/J6Z2TKDbQi0rzVZJ54zG8zcUYPAbU+sqUb9BIDT
eWI=
=63Xn
-----END PGP SIGNATURE-----

--------------OFHAD5CaqS6bAnhgby6btqzq--

