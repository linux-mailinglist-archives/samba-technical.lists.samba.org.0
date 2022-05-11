Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA2B523B05
	for <lists+samba-technical@lfdr.de>; Wed, 11 May 2022 19:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mKYOoxEIB0VIvJy8k59zc0hofKcy4uocvBoK2G0EEC8=; b=RU8ptTbf6Et488q/na9xjnPE+B
	4cBp/sjBW1MFNFaqQnoGCmtA7qZrYmLGw9Vw9L+FcNJtPsk51ohdMl+ktmhbo8Ob4YggeXzTDg0ce
	xPmkTVco4RwML+l41cC1svDOaJwfFVqudxmnGsoV175prVRUg4S3tIjvHDEoo2y30QMFC0kbLwxTI
	YS98k14wsK6lyLzeX546R11dcvEXrm6/fbzkDF9c4Hj+XHfdswcVKL/VZpKAslTnVaT3jHySyMflH
	pnhiAkRzKSn6yJ9OEUqAshI2Q3POz99fPm+022/xkgJfXaO2V5RXtJmfEbZeYBL62RxhSjpb5QB12
	QME+6lmQ==;
Received: from ip6-localhost ([::1]:52834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nopgh-000jvA-H7; Wed, 11 May 2022 16:59:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nopgZ-000juc-HV; Wed, 11 May 2022 16:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mKYOoxEIB0VIvJy8k59zc0hofKcy4uocvBoK2G0EEC8=; b=F4mHKO6a7LHiFevfysw44BUz0A
 1BZ5BVB4PY49k8w6XJ0Q/petrSCYyXD6+z+4KQA61+fvdaRyh8HFVFgm+AyfThQY24dP1LqBgWsi7
 eUxxrXuY6jeOrqAqZj56vtrgWoIYk72xOPSFK/P6OT0C/uiB1f+xT5NxNgyR7iZjgf3zCg/HAE/iW
 ls3Q3Jlz8zsPfjdeEL7r2rjlb+a/qmYIC2Nm+TjX5aPG74rp4D6IzogfF/5/vt5b8nPHrLTck4hF+
 WRuf9zBzas6+mB2NqAT5xgXFodQ+qNV/YzYAYo77NCnNuWJya1JKxqoXkHC2ERXu+YIHcWhoubery
 BV4fZk0Udkut/YODeW3Gu6fbhdmsuAvYwp0WPzyQ01fJ5Yg+kcBmVqsCSuhsoM+B/LxKlt6Bk2LFT
 neXh3ds1LqLhBHoStwC+Us2fmFXB4cHgsFijAO+qLs8BsmmX9Rb0swxmkgnrVH3TMpgQHlGyUSjfL
 3bbkwJwJJFo/FVZMSqjLZqau;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nopgY-000OYR-Qh; Wed, 11 May 2022 16:59:38 +0000
Message-ID: <0597e6ea-0538-e867-542f-bf65ba641901@samba.org>
Date: Wed, 11 May 2022 18:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Invitation to sambaXP 2022: digital & free - 31 May to 2 June
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LiiIYJQCOjLJ28NL3TB8FrDy"
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
--------------LiiIYJQCOjLJ28NL3TB8FrDy
Content-Type: multipart/mixed; boundary="------------uFwJg8H7yKCvgfo6iHFLgD8g";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <0597e6ea-0538-e867-542f-bf65ba641901@samba.org>
Subject: Invitation to sambaXP 2022: digital & free - 31 May to 2 June

--------------uFwJg8H7yKCvgfo6iHFLgD8g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gYWxsIQ0KDQogRnJvbSAzMSBNYXkgdG8gMiBKdW5lIDIwMjIsIFNlck5ldCB3aWxs
IGJlIGhvc3Rpbmcgc2FtYmFYUCBmb3IgdGhlIDIxc3QgDQp0aW1lIOKAkyBmb3IgdGhlIHRo
aXJkIHRpbWUgYXMgYSBwdXJlbHkgZGlnaXRhbCBldmVudC4gVGhlIE9yZ2EgQ29tbWl0dGVl
IA0KaGFzIHB1Ymxpc2hlZCB0aGUgYWdlbmRhIGF0IGh0dHBzOi8vc2FtYmF4cC5vcmcuIFRp
Y2tldHMsIHdoaWNoIGFyZSBmcmVlIA0Kb2YgY2hhcmdlLCBhcmUgYWxzbyBhdmFpbGFibGUg
dGhlcmUuIFRvIGFsbG93IGFzIG1hbnkgcGVvcGxlIGFzIHBvc3NpYmxlIA0Kd29ybGR3aWRl
IHRvIHBhcnRpY2lwYXRlIHRoZSBwcm9ncmFtIHdpbGwgc3RhcnQgYXQgMyBwbSAoQ0VTVCkg
dG8gc2VydmUgDQphcyBtYW55IGRpZmZlcmVudCB0aW1lIHpvbmVzIGFzIHBvc3NpYmxlLg0K
DQpTcGVjaWFsIHRoYW5rcyBnbyB0byB0aGlzIHllYXIncyBzcG9uc29ycyBHb29nbGUsIE1p
Y3Jvc29mdCBhbmQgU2VyTmV0Lg0KDQpUaGUga2ljay1vZmYgb24gTWF5IDMxIGJlbG9uZ3Mg
YWdhaW4gdG8gdGhlIHRyYWRpdGlvbmFsIHNhbWJhIHdvcmtzaG9wIA0KYnkgU3RlZmFuIEth
bmlhLiBIaXMgdHV0b3JpYWwgKDMgcG0gdG8gOTozMCBwbSBDRVNUKSB3aWxsIGNvdmVyIHRo
ZSANCnRvcGljcyAiU2V0dGluZyB1cCBHUE9zIHdpdGggU2FtYmEiIGFuZCAiRGlzYXN0ZXIg
cmVjb3Zlcnkgb2YgYW4gQWN0aXZlIA0KRGlyZWN0b3J5IiBhdCBvbmNlLg0KDQpUaGUgYWN0
dWFsIGNvbmZlcmVuY2Ugd2lsbCBiZSBvcGVuZWQgYnkgY2hhaXJtYW4gSmVyZW15IEFsbGlz
b24gKEdvb2dsZSANCi8gU2FtYmEgVGVhbSkgb24gSnVuZSAxc3QgYXQgM3BtLg0KDQpEZXRh
aWxlZCBhYnN0cmFjdHMgYW5kIGV2ZXJ5dGhpbmcgbmVlZGVkIGZvciBwYXJ0aWNpcGF0aW9u
IGNhbiBhbHNvIGJlIA0KZm91bmQgYXQgaHR0cHM6Ly9zYW1iYXhwLm9yZy4NCg0KQW55IHF1
ZXN0aW9ucz8gWW91IGNhbiBhbHdheXMgY29udGFjdCB0aGUgTE9DIOKAkyBqdXN0IG1haWwg
dXMgYXQgDQpsb2NAc2FtYmFYUC5vcmcuDQoNCi1SYWxwaA0KDQotLSANClJhbHBoIEJvZWht
ZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJO
ZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1i
YQ0K

--------------uFwJg8H7yKCvgfo6iHFLgD8g--

--------------LiiIYJQCOjLJ28NL3TB8FrDy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJ763oFAwAAAAAACgkQqh6bcSY5nkYL
uBAAsYs8OCuQQsm1pdIdMrOQ9/zQXk3czZ0ggkWl1J04s0Z+jubdj45Kr+tRhg6tdeiauNmeS+LP
dfLQFJE3pwm0Jx0gP0PbuKJwIObEz8QUyPsQ9OnjEDMNum8T/1ZZAd5cDccR4eb+87TtYjkchHbD
KLQMovkbljylqxYDZFVd/pq6OTcCLWjUjqzTPsXCbjNxk4r9f5IgjceuOZGaBF+/pBtC/FsRuffV
WmZ8otgu3nH1C3xVKl97BLSplQ9NXfuvX/l0asm3uguO7yl6RNb3fe8Z5cwLU8XBNlW13+dXEL1A
4uOGmI5bz1jmrErGm9nATA0mFKIfr2H4JaXIv+kd9qvqD5tGju6W2hk2TFzaEU5VaN/SSnXJJTyv
Gkx7bedPFYCQWso1lzFhPS1LTNQtdQxTa0nsmoJs7aJlkExY7PVhKwq5vc5PGnV/Hfh9iZ5tg5XJ
3Q51brNfB/0i4ltnq2+Hr02owtengHMyeEPteZH4Pw3njswedTvNlIcVZ29DcYzZR+50lFAEGdnK
8FrYOuhw4/uym2NZYm9Agkum8/3sBoTPXHebMslPQgX6D98c3YfDEogBr56K8pCj7cO3KrpQtgi3
0XopbWAaiGJ357J/kGd/Q/tJ70hOQKwuBTMcdLGO62wHAtEX4M4+APZsjfz5PPN7Cy98T2iz7yF8
eeE=
=Pw+0
-----END PGP SIGNATURE-----

--------------LiiIYJQCOjLJ28NL3TB8FrDy--

