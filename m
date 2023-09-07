Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 797677972D4
	for <lists+samba-technical@lfdr.de>; Thu,  7 Sep 2023 15:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ON719R8nPk5rzmjpGdfsuHAGkoaRi6GmoBtHyPzJYL8=; b=UhqDZGxaZ+Hm4EtH3XFZMg2ZXd
	rESK6XneF0BLJ1UKAlCz3C1vjbsBvPk/UiLaMpqDMY5X65USki/F2UkUDKH2p2ds2hIjJbWp0yqIJ
	7U5AfD5SKeWzGUI1afX2t3E8VJls3E0DmMrKZeU0xXHpDhmGP85QSkstq5G2+TBlSvyRQacsoOpT0
	aYChnXYSFlLLyJV8XmcDbcfpoQGi98ts2IwHZIiEK4RLoDfy7Asmp/DDbFxgMkcd+AYDSV35hOus0
	oHONHlMzfMXv1oFBnVumaqKCCugRmoRrxxiZUn7In9vws0vL1TmInp1P8xZIXXzKdpMu+G7rYE0xz
	u8D0WCYg==;
Received: from ip6-localhost ([::1]:29410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qeF1E-001eFC-TY; Thu, 07 Sep 2023 13:26:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qeF17-001eEh-Kw
 for samba-technical@lists.samba.org; Thu, 07 Sep 2023 13:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ON719R8nPk5rzmjpGdfsuHAGkoaRi6GmoBtHyPzJYL8=; b=MNyZw15NWedWToK7W678PAIpYg
 7BeIN0CSYL/etoTah4JYtuVoNVQjba1d4gFKw2d6/M/faMmBAnC9oPcQCcEPfVnUp6I4NhATtqscO
 n+pkkV/lZ1cTBv3bfpHmIDqt4vzHSfvaAi2dt9UE9bcLFFPr+apueJ6ZCptrmB7vz74DFsW3a7XLZ
 +//Rc147GBt5Lf5udQdm+saBMqIfi/jTo5Ug8rFkW32ZoEG1PiFqo347lehrGy6soL/z+YM2Oy9DX
 9215BaWIlYc43v5NizAhistSCikCVq0A1SNMsdYybOydn1v2U71jd/kQOcdqqnMBYGPa5br98UMqU
 Aq4Ki8Ciaf69gQN0PLCX2WPLlDv7S+tXD8gmnMHeQ9mJ2jBbxpO9M4BaN7HZ2ke/ZzKT41lTTNTVB
 6x0cYjEIQjDYiR7Rhgas0N9UBiqJ2JXIHuiD56renQEH7uIuNuHVFAaLGhKvwLh6r0oMA8tXYdoES
 2KQR0Q4+lfFXX4s1IItcFKjM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qeF16-00CKxb-2K; Thu, 07 Sep 2023 13:25:52 +0000
Message-ID: <3beafeac-ae25-d696-d0ef-4cec677c4e6d@samba.org>
Date: Thu, 7 Sep 2023 15:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: The current progress of transparent failover features
Content-Language: en-US, de-DE
To: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g9c2debEM1yRyFToXaM0gul2"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g9c2debEM1yRyFToXaM0gul2
Content-Type: multipart/mixed; boundary="------------Lx6Q1JxEWO6ytiod1TZYpva7";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <3beafeac-ae25-d696-d0ef-4cec677c4e6d@samba.org>
Subject: Re: The current progress of transparent failover features
References: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>

--------------Lx6Q1JxEWO6ytiod1TZYpva7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS83LzIzIDEyOjA2LCDpmYgg5pa56L+bIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6
DQo+IEkgd2FudCB0byBrbm93IHRoZSBjdXJyZW50IGRldmVsb3BtZW50IHByb2dyZXNzIG9m
IHRyYW5zcGFyZW50DQo+IGZhaWxvdmVyIGZlYXR1cmVzLiBXaGVyZSBjYW4gSSBnZXQgcmVs
YXRlZCByZXNvdXJjZXM/DQoNCmh0dHBzOi8vZ2l0LnNhbWJhLm9yZy8/cD1zbG93L3NhbWJh
LmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFkcy9waC10ZXN0cw0KDQpJIHdhcyB3b3JraW5n
IG9uIHRoaXMgaW4gbXkgc3BhcmUgdGltZS4gSXQgd2FzIGEgd29ya2luZyBwcm90b3R5cGUg
YmFjayANCmluIDIwMTksIGEgcmViYXNlIG9uIHRvcCBvZiBjdXJyZW50IG1hc3RlciB3aWxs
IGJlIGEgc2VyaW91cyBlZmZvcnQgaW4gDQppdHMgb3duIHJpZ2h0LiBBbmQgc3Vic2VxdWVu
dGx5IHRoZXJlJ3Mgc3RpbGwgYSAqbG90KiB0byBkbyB0byBtYWtlIHRoaXMgDQpwcm9kdWN0
aW9uIHJlYWR5Lg0KDQpDaGVlcnMhDQotc2xvdw0KDQotLQ0KTWVldCB1cyBhdCBTdG9yYWdl
IERldmVsb3BlciBDb25mZXJlbmNlIChTREMpDQpPbiAxOHRoIHRvIDIxc3QgU2VwdGVtYmVy
IDIwMjMgaW4gRnJlbW9udCwgQ0ENCk1vcmUgaW5mb3JtYXRpb24gYXQgaHR0cHM6Ly9zYW1i
YS5wbHVzL2V2ZW50cw0KDQpNZWV0IHVzIGF0IHRoZSBjb25mZXJlbmNlIHN0b3JhZ2UyZGF5
IDIwMjMhDQoyNnRoICYgMjd0aCBTZXB0ZW1iZXIsIGluIEZyYW5rZnVydCBhbSBNYWluDQpF
dmVudCBvbiBTdG9yYWdlIE5ldHdvcmtzICYgRGF0YSBNYW5hZ2VtZW50DQpGaW5kIG1vcmUg
aW5mbyBhdCBodHRwczovL3NhbWJhLnBsdXMvZXZlbnRzDQoNClJhbHBoIEJvZWhtZSwgU2Ft
YmEgVGVhbSAgICAgICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5l
dCBTYW1iYSBUZWFtIExlYWQgICAgICAgICAgICAgICAgICAgICBodHRwczovL3Nlcm5ldC5k
ZS9lbi8NClNBTUJBKyBTYW1iYSBwYWNrYWdlcyAgICAgICAgICAgICAgICAgICAgICAgIGh0
dHBzOi8vc2FtYmEucGx1cy8NClNBTUJBKyBXZWJpbmFyICAgICAgICAgICAgICAgICBodHRw
czovL3NhbWJhLnBsdXMvc2FtYmEtd2ViaW5hcnMNCg0K

--------------Lx6Q1JxEWO6ytiod1TZYpva7--

--------------g9c2debEM1yRyFToXaM0gul2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmT5z2AFAwAAAAAACgkQqh6bcSY5nkY5
lQ//V4hbYkHNIBWuGpsnp04YszWKlHhl+ljIPBpUe7qdZmswtY8SGY0hHe3isGIH/Q8gdo2qSgVU
FtbhR4Q0mUWln/bY7yMStLvSv3hw9Vd8A0J7FXi+0hWJfSNCnoTi6gmbKwPIU3yTufDyWZhwZtn+
vKQ0NhomySBWVPnh8nRJzVAu4Dt4MkQs9pOJ6jwBrUwrD4xDqCpVdYtcFD3jcNeQH+9P+uzI7mw2
AJ6hS0iXzq7FwhsW6fBYMakFLjg5eIPBYDJMvP8Co6JyiWr3HPVQtmYUDFCGYdH8muZc5c/eUOs8
a40mIAh/fR8jl4kv9r4ConQ+7/N8LM+57TtER7MQLqBrSlBOq/SAmp5F8mSzOpCTw/jW31UgU0y9
D4Ml14hXNvFGkfiMqSnfqR+GcpqPtbJJoNZ0IcIrKCF2uW0eU5kTzvMuKiMyogeXFMJZ7bkaxmTm
XNY++9s82mzLThbkP02kkvt5EctK53NycZu5XkG7TJXybj4Xs73bzeRAYoxrwPyy8oi+UXvUzycY
2iH6vk4STHgKMapZrKJFGboSXmx8sYgWUcwgAgdZyXDYLvEhoarYUw7AT1nNqPOgD0bYLar25q7y
LVG0Td90MDdZw6CBR8A52ty5V05oD3UXpw0LPAtQdmj2QL1ebqtaZ5e3Q0pI7jiFU52PexItcaJ+
OP8=
=Ywck
-----END PGP SIGNATURE-----

--------------g9c2debEM1yRyFToXaM0gul2--

