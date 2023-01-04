Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED665CFC3
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 10:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wFzGN3sJcSLZSOICAOb7HXjUGlKtwM93EjsKl7ZOxqI=; b=Hc2rg5SI1BnJ5xjfkSMTD6W0nh
	acQT8mnX9AzyIvzf/FoCjz0n3zUNkn0+49HZRkuch0/lIhR5VQwLd2b3iU/OxYsg3hkNwVHAursOY
	j3h1mEP+bXzrSwf2/RUzwaz5AJ2ZBraevGPjHdvFKk/Q8fUJ8HQBjyZFGcyCcrfkGxRYc4VezOTNB
	fH9BkVtwW3jSuqFyNsWSlmrkk5g2dEuhzLRT5bnnfXUKgtdsxqggUNsOq4AYfUFSAgNS7h2WZDRrs
	xFdKpHOQYDxLV7oCc73i5vwhNNbRcP0PKVbXkqg5gKq4PxAKjaR/WwgkowxtF6L5+FcgRDNaV4ulv
	XuH7fxLw==;
Received: from ip6-localhost ([::1]:34540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD0Cz-00EWXH-Tx; Wed, 04 Jan 2023 09:37:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54850) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD0Cu-00EWX8-S4
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 09:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=wFzGN3sJcSLZSOICAOb7HXjUGlKtwM93EjsKl7ZOxqI=; b=EyMSKwJgR85rXHuSM3jb/HqT/S
 UBLBMwnq0fJmAOhp0OAKbRV3mH3VctYMMr2tK13OflZm3ikaFa8H3tgs/JQWVJwokl2I7WgR8+L/R
 TiCW/YZiHxaiKl6581j/S4lhyUvAzYRzLnq/Hli7vdFdXC7pxZuxkuVlVHwvas7EbHD4MN3rdC8w2
 01CTzuJ4+qGIC3fJfqkcHYai1YNu1wSKz5l4B7DClZEfoUAfMu0Ehoj7LS41HLLZ2AV5JT6q+9nYn
 MTmQ7w61MtK7W6HokDjmkRSF9fNoR+BEVsK+FrLcAk3+dDKe3I45QNZF87OKp9VU26u+jWycSKYvj
 cnrkJVmA/b+SPqtbw3G44jAnbRUV90RzwCwa+kI+9unBDxrpa8SA63ofSRwIYerLYx48KZkUe+idg
 RJ09YsWs/LfnrFjdNaWB68dl81t4mJDlqk6RBGZXLUOOfm744eND3BrKhY/QUJAJemtd58yxaeDTp
 5sFwFR1ERk3Ill2qmh4oRFXB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD0Cf-006hEn-4F; Wed, 04 Jan 2023 09:36:57 +0000
Message-ID: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
Date: Wed, 4 Jan 2023 10:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Samba-technical <samba-technical@lists.samba.org>
Subject: Wiki: 64 bit printer drivers
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MXkqw90Gan9JTSOQ3ZxsAitp"
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
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MXkqw90Gan9JTSOQ3ZxsAitp
Content-Type: multipart/mixed; boundary="------------jvVdgOXavRrc0R03VKHn5xkL";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Samba-technical <samba-technical@lists.samba.org>
Cc: Rowland penny <rpenny@samba.org>, Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
Subject: Wiki: 64 bit printer drivers

--------------jvVdgOXavRrc0R03VKHn5xkL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUm93bGFuZCwNCg0KaXQgc2VlbXMgeW91IHJldmVydGVkIE1pY2hhZWwncyBjb21tZW50
IG9uIHRoZSA2NCBiaXQgcHJpbnRlciBkcml2ZXIgDQp0b3BpYyBpbiB0aGUgd2lraToNCg0K
PGh0dHBzOi8vd2lraS5zYW1iYS5vcmcvaW5kZXgucGhwP3RpdGxlPVNldHRpbmdfdXBfQXV0
b21hdGljX1ByaW50ZXJfRHJpdmVyX0Rvd25sb2Fkc19mb3JfV2luZG93c19DbGllbnRzJmFj
dGlvbj1oaXN0b3J5Pg0KDQpNaWNoYWVsJ3MgY29tbWVudCBpcyBiYXNpY2FsbHkgY29ycmVj
dCBhcyB0aGVzZSBkYXlzIFNQT09MU1MgYW5ub3VuY2VzIA0KaXRzZWxmIGFzIGEgNjQgYml0
IHByaW50ZXIgYnkgZGVmYXVsdCBzaW5jZSBjb21taXQgDQo5MmZjNmE2YzI1NDcwM2I3NzFk
ZWMwYjU2YjU5OGMyNjg0YjQyNzhhIGZyb20gMjAxNy4gSSBndWVzcyB0aGUgd2hvbGUgDQpz
ZWN0aW9uICJVcGxvYWRpbmcgT25seSA2NC1iaXQgRHJpdmVycyB0byBhIFNhbWJhIFByaW50
IFNlcnZlciIgY2FuIGp1c3QgDQpiZSByZW1vdmVkLg0KDQpUaGFua3MgdG8gTWljaGFlbCBm
b3IgcG9pbnRpbmcgb3V0IHRoaXMgaXNzdWUgYW5kIHRoYW5rcyBSb3dsYW5kIGZvciANCm1h
aW50YWluaW5nIGFuZCBpbXByb3ZpbmcgdGhlIHdpa2khDQoNCkNoZWVycyENCi1zbG93DQoN
Ci0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczov
L3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5l
dC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------jvVdgOXavRrc0R03VKHn5xkL--

--------------MXkqw90Gan9JTSOQ3ZxsAitp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmO1SLgFAwAAAAAACgkQqh6bcSY5nkbU
Uw//RN0NCmLRjkfBlfGEZElAkQg407Y+9EgYk7L/Zmfq4RoU3mLG107DVw7JwiK57fQMNzuF4USO
Q3XfYV3sQPpjAIsIzqgVZpGVz8a+D0gm9VsGoTeQDTdS18DeCbVpA+YPZTtBGAtGUKJPbjmL+9Cv
Zuatt6hiQIRv8ngBRfZ3YL7rQLGMTCC8v63xs8QLsEGe6oqDscBFIORdZsCGC/UWuS/FbMKY4Nbb
IyEuM+mXXRbDV5qpeEvFr1IdleGwQh+accdkJsKG/iXk4ubDxL7osrQ1AVDjZWlgD56ps/wrQRYA
KoXGa6rEC1rUC4zXeCdfngfeGMSt9ht8PghA8QRvhqFuB4bhltSGJrQqfuNTz2sWfCDbrRbpXlo+
86yJyzAMRSyA/tWL6NQT6MKFkoDgqHlT+92sr/0BJ3DDCx6tMt3QO/UDEy03F11rFG5k2uF00fUl
isZszrlDvlthGL3DnLMlN8p/1KFqZjA78P5XJ3pGRcqsudQE6hFaJNXJskt3qDzVo2BOCfQy5lN5
R27O/1NyuYgsdPm+3ykY/B8cbbL9DIQ+hJMKqZ+O3BjSudo2NUZrKQKrpGOrpse0QWfHGulQAB0j
Ltd6yAyeyDjUDYy9xoRfJDIa9/3fbMPZrM/HCALpJ6AzbSv/XKxKIefIx/405efTSsDKBTL69fkJ
0dE=
=Hat+
-----END PGP SIGNATURE-----

--------------MXkqw90Gan9JTSOQ3ZxsAitp--

