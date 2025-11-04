Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC454C309B3
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 11:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=6pddpnOQNkLJjclX4f0ILaQYa6yHn/AADNr/miz3FkQ=; b=yvzEHj7DJL1p1Fs0AehLk/D5KB
	exbfMD2KL/wOQyDhSlHbhx+fI3JxmlMAUEdWgFwY66RTxhpObJ0C4ck5g6cMtI2EA/KfRSeAxaKG9
	sUwH8zog5MudNi1vlh7v5xUwVGidKFc5d6LAJEH2VhUKpE3yptnWLf45VKx3ntFiTpRT0HRdx3wKy
	+PvVjqISuc0iMZsQxovoB66DorCsbTk5q9gsK82ZnR+gCe97by6jCLTKhz2wP8VIEKiZ578WPMoSF
	7fj4LSmDgw+SqWOXZdLJWqu1dwB0p0JnJ0IxDUJvtaV8TdmtC2gr/45EVscVxCdfG3Z3tomoWblAj
	9FM0pbfQ==;
Received: from ip6-localhost ([::1]:48650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGEf2-00BSB9-Ub; Tue, 04 Nov 2025 10:53:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44238) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEey-00BSB2-91
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 10:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6pddpnOQNkLJjclX4f0ILaQYa6yHn/AADNr/miz3FkQ=; b=JIdsR/iTbxT/FYdF5HAyeQfsrC
 1qH6uP4/mIKVjTl8otRdXJW5xx9IeLg/Hl1bWOcSEQExZ3wXRisBpV+c+Y4d7CINdSrVx03AUgX9A
 P2kBiGnmcaA9WQIjZOpj71lfRDNnF8fPvyH9Tx83uf3RWFp5kZJRgYwId1Lh7Bf/RAKJAsZBgyXSN
 PMI8jdc9BTtd68jJx4xjjh5AYht6Xm7s5jWOSqw3WIvpYMNWbUVg/52/86Hoq/ovAKHsSmVUbhZr0
 s8vF7p04UVt+0ESGNd5j61PyH8BTA0fz4+Twj5TaZxywQVsJV0F3+cjoouxMl39HRgw6FXRWXbbz9
 hFB4wB7FOePvPN9Do80XZoFJYxf5Ald8Wx3a/TAHtcWk+R347IXjZI/1rZX51XFZJwiwug92YWLCi
 +czij7pxu1Xrkm8JoSCxcZpuki9w4sE4ImoUX/smAj9PBMm+/+rEoqYBayyPVdpVddd+vkO6VmEHa
 hkD/0tmOhOGXn7Fej1b81jv0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEex-00CW9S-2Q for samba-technical@lists.samba.org;
 Tue, 04 Nov 2025 10:53:07 +0000
Message-ID: <644afb6f-e2b7-48f2-8759-f87d8c3b5ad1@samba.org>
Date: Tue, 4 Nov 2025 11:53:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: samba-technical <samba-technical@lists.samba.org>
Subject: =?UTF-8?Q?Invitation=3A_Samba_Developer_Online_Gathering_=E2=80=93_?=
 =?UTF-8?Q?Tuesday=2C_November_11th?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VBdrqHj0WXf8HqX0VUA0pO0L"
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
--------------VBdrqHj0WXf8HqX0VUA0pO0L
Content-Type: multipart/mixed; boundary="------------qe25Scs9uMwTTplRaHs3jOzv";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <644afb6f-e2b7-48f2-8759-f87d8c3b5ad1@samba.org>
Subject: =?UTF-8?Q?Invitation=3A_Samba_Developer_Online_Gathering_=E2=80=93_?=
 =?UTF-8?Q?Tuesday=2C_November_11th?=

--------------qe25Scs9uMwTTplRaHs3jOzv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQouLi5hZnRlciBhIGdyZWF0IG1lZXRpbmcgdG9kYXksIHdoaWNoIGVuZGVk
IGFmdGVyIHR3byBob3VycyBkZXNwaXRlIG9ubHkgDQpoYXZpbmcgY292ZXJlZCBoYWxmIG9m
IHRoZSBhZ2VuZGEuLi4NCg0KU2F2ZSB0aGUgZGF0ZSBmb3IgdGhlIG5leHQgU2FtYmEgRGV2
ZWxvcGVyIE9ubGluZSBHYXRoZXJpbmc6DQoNCkRhdGU6IFR1ZXNkYXksIE5vdmVtYmVyIDEx
dGgNClRpbWU6IDY6MDAgQU0gVVRDDQpMaW5rOiA8aHR0cHM6Ly9iYmItbmV3LnNmY29uc2Vy
dmFuY3kub3JnL3Jvb21zL3g0cy13bjctbHR3LWwzYi9qb2luPg0KDQpJbiB0aGUgbmFtZSBv
ZiB0aGUgU2FtYmEgVGVhbSwgSeKAmWQgbGlrZSB0byBpbnZpdGUgZXZlcnlvbmUgYWN0aXZl
bHkgDQp3b3JraW5nIG9uIG9yIGNvbnRyaWJ1dGluZyB0byBTYW1iYSB0byBqb2luIHRoZSBT
YW1iYSBEZXZlbG9wZXIgT25saW5lIA0KR2F0aGVyaW5nLg0KDQpUaGUgZ29hbCBpcyB0byBj
cmVhdGUgYW4gaW5mb3JtYWwgc3BhY2Ugd2hlcmUgZGV2ZWxvcGVycyBjYW4gZGlzY3VzcyAN
CmN1cnJlbnQgZGV2ZWxvcG1lbnQgdG9waWNzLCBvbmdvaW5nIHdvcmssIGFuZCBmdXR1cmUg
cGxhbnMg4oCUIG11Y2ggbGlrZSANCm91ciBoYWxsd2F5IGNoYXRzIGF0IFNhbWJhWFAsIGJ1
dCBpbiBhbiBvbmxpbmUgZm9ybWF0Lg0KDQpJZiB5b3UgaGF2ZSB0b3BpY3MgeW914oCZZCBs
aWtlIHRvIGRpc2N1c3Mgb3Igc2hvcnQgdXBkYXRlcyB5b3XigJlkIGxpa2UgdG8gDQpzaGFy
ZSwgcGxlYXNlIHNlbmQgdGhlbSB0byBtZSBkaXJlY3RseSBpbiBhZHZhbmNlIHNvIHdlIGNh
biBwcmVwYXJlIGEgDQpyb3VnaCBhZ2VuZGEuDQoNCkEgZmV3IGRldGFpbHM6DQoNCkR1cmF0
aW9uOiB1cCB0byAyIGhvdXJzDQpSZWNvcmRpbmc6IHRoZSBtZWV0aW5nIHdpbGwgbm90IGJl
IHJlY29yZGVkDQpGb3JtYXQ6IG9wZW4gZGlzY3Vzc2lvbiDigJQgdGVjaG5pY2FsIGFuZCBp
bmZvcm1hbA0KDQpOb3RlcyBmcm9tIHRoZSBwcmV2aW91cyBtZWV0aW5nIGNhbiBiZSBmb3Vu
ZCBoZXJlOg0KDQo8aHR0cHM6Ly93aWtpLnNhbWJhLm9yZy9pbmRleC5waHAvU2FtYmFfRGV2
ZWxvcGVyX09ubGluZV9HYXRoZXJpbmc+DQoNCldl4oCZcmUgbG9va2luZyBmb3J3YXJkIHRv
IHNlZWluZyBtYW55IG9mIHlvdSB0aGVyZSBhbmQgaGF2aW5nIGEgDQpwcm9kdWN0aXZlIGFu
ZCBmcmllbmRseSBleGNoYW5nZSENCg0KQW5kIHJlbWVtYmVyOiB0aGUgdGltZSA2IGFtIGlz
IGluIFVUQyEgWW91IGhhdmUgdG8gZG8gdGhlIG1hdGggZm9yIHlvdXIgDQp0aW1lem9uZSEg
OikNCg0KU2VlIHlvdSBuZXh0IFR1ZXNkYXksDQpSYWxwaA0K

--------------qe25Scs9uMwTTplRaHs3jOzv--

--------------VBdrqHj0WXf8HqX0VUA0pO0L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmkJ2xMFAwAAAAAACgkQqh6bcSY5nkbY
mw//UgU1hnxLt987Tn3byajL22IXO2xni7BBVwRAwBB2V8iUuiWjlNArFGim45m/N8sJpJBmIq/y
F3NItU8CYm+pZ6KTVaPH9WV4y81LYQJk1VWPN4otnVeZtdTtrlZnVtdu3Jcz+SxXp+BEI5JoptQh
Bf7xnjfhaUhtZRjKQQFoLp7fF2P6JWtU0wKIelsV7xzMbLnzvYCX5BnbdXtlK3VdwIZKzDlRTjy6
aaakJNCuwcuNb7Da5dQEZFBv8XI3TXD/6EvlQm+2SYxvRLSjYLEajuA7WcX0Z0c6EIHKPCqQH9fq
2nJODBogAF6uvCJ8tGI2UqGwz7Qli6ZOO8jsf5BZGJeR5gMC7LhsmR9zgCIbXwUBH98G3hj5pZvI
6Ey8few36zfi15uvPk0tQ0FkeoEjiVOsBCjIrgQVsgUFR1IbbMas/dPZrCDDVbdb2FlCA+S02VLt
UeCSBZcRw87wKrOAFrsB6ithK4BexHvXS4WrvJ5dR3acGVc0glzM6f+3Kir3amJPjEWTHJO42NYK
qHZ1l37QmFiQRZQK61IUiNDuQRcxtKrkNy6o+CRuWjkL+BiX72a8vJo5hQGc8JXttCGqpgWFMMsi
QttXaLX39hN13jEFnloljXH+cPsLzSLg3Zz8YeLz+ELVX/LbwYhyS51MCK78WIDbnP/n+c58zbxC
ojw=
=wt4b
-----END PGP SIGNATURE-----

--------------VBdrqHj0WXf8HqX0VUA0pO0L--

