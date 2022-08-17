Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9359764F
	for <lists+samba-technical@lfdr.de>; Wed, 17 Aug 2022 21:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=28mEnYhrl4h+s3inQ/FuMWrfQZ1yXJz7uao54VwiUJ8=; b=ucnAPr3t3pPPTMzoI5Y9PsFtXm
	/mlhPhZTsWObGl8ELrksMWA+lfcVYRN2icLfr44w5ewrhQamqmFcvb4QGAAY6/IjdwGQHrGWBetJB
	y9IYTmCkmXVh13GuzJbKWlDChellTQkWlepg7cmOmhRn9DR95/i3YgckB9TK3onaKGmuHewtqcbWz
	5TRjAYhBiE7D36NJphmrllJ4579WG78MPsHQ6jm0uQ1Cnxab8UdLWT9ZKZ5emNvB4IpEAm5kDk2h+
	tn71nYL+vuhd2Yh2w4ntTZP09FJgInUz2jVQcSh1LcfVBXBe1aNjXCX73T9thJ3fu5ExgMMFipXnQ
	12R9NzRA==;
Received: from ip6-localhost ([::1]:51758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOOVC-000hXs-T4; Wed, 17 Aug 2022 19:14:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOOV7-000hXj-N5
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 19:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=28mEnYhrl4h+s3inQ/FuMWrfQZ1yXJz7uao54VwiUJ8=; b=C5fxNueLcGgNYdttSeLgnU+vyC
 aSUfaXc/IBMCP/Cw3UaTnftgYy2sKxI1+Lyn4xqc3vSrKxbVZVELXh9ryKaOR3dYIXl0PUaYP6+kl
 aENNFn8m5fT/w2/SnzUo3ebkmWjJFkNRAMq4oy4lZQoA31EfuDCv/SBl4cT9XMBmHIHnAkkU0wwIV
 yBUSUzR6ayRrEH5PQ79Y8xHn6SSN7hp406bfZniIgwOCy7Yvj31Xrc/odXMtyupufSEjTiHOmc+86
 KMEuMpZPyJdBbQCRZpMhfy1lafwOWBiOEEU6nEGHk3U0qzX8aKQk6wojoi6FTLSRiMeRu/UVpdxAf
 cL5fCnpwCGTpl3JBdR5dLurvMSHMxzcSZlsmwFE9XVETBzDqi1Yly8FmCk/DVIn1y7b7/MDN5Hbqz
 3nrJJBcGcsMrqSY/9B7iBX71yRtW8T32iCqXsMWnhQrbPSfP6J9jc1oli63xrnQTw1LzhZZZb3kFe
 Kg3DQ+21r5RmHHSj+vK3/RDT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oOOV5-000aaN-1H; Wed, 17 Aug 2022 19:14:47 +0000
Message-ID: <5966ee03-d528-3b10-5354-fcdb3a3008c5@samba.org>
Date: Wed, 17 Aug 2022 21:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, Christian Ambach <ambi@samba.org>,
 Stefan Metzmacher <metze@samba.org>, Jule Anger <janger@samba.org>
References: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
 <Yv0vkWopKBzdKlEq@jeremy-acer>
In-Reply-To: <Yv0vkWopKBzdKlEq@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yBOZHoqSfb1Zr8wz9UdmRd2j"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yBOZHoqSfb1Zr8wz9UdmRd2j
Content-Type: multipart/mixed; boundary="------------fq0rL3bzU3NMDr9Gt9Lplf7F";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Christian Ambach <ambi@samba.org>,
 Stefan Metzmacher <metze@samba.org>, Jule Anger <janger@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <5966ee03-d528-3b10-5354-fcdb3a3008c5@samba.org>
Subject: Re: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
References: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
 <Yv0vkWopKBzdKlEq@jeremy-acer>
In-Reply-To: <Yv0vkWopKBzdKlEq@jeremy-acer>

--------------fq0rL3bzU3NMDr9Gt9Lplf7F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8xNy8yMiAyMDoxMiwgSmVyZW15IEFsbGlzb24gdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gT24gV2VkLCBBdWcgMTcsIDIwMjIgYXQgMDE6NTY6MDVQTSArMDIwMCwgQ2hy
aXN0aWFuIEFtYmFjaCB2aWEgDQo+IHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4+IFNvcnJ5
LCBmb3Jnb3QgdG8gYWRkIHRoZSBuZXcgcGFyYW1ldGVyIHRvIFdIQVRTTkVXIHdoaWxlIHdv
cmtpbmcgb24gaXQuDQo+Pg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpc3RpYW4NCj4gDQo+
IENocmlzdGlhbiwgaWYgeW91IHdhbnQgdGhpcyBpbiA0LjE3IHlvdSdsbCBuZWVkIHRvIGxv
Zw0KPiBhIGJ1ZyAtIHJlcXVpcmVkIGZvciBhbGwgYmFja3BvcnRzIGZvciA0LjE3LnJjWFhY
IHJlbGVhc2VzLg0KDQpub3QgcXVpdGUuDQoNCklpcmMgd2UganVzdCBwdXNoIHRoaXMgdG8g
dGhlIHY0LTE3IGJyYW5jaGVzIGRpcmVjdGx5LCB0aGlzIHdpbGwgbmV2ZXIgDQpnbyBpbnRv
IG1hc3Rlci4NCg0KSnVsZSBvciBtZXR6ZSwgY2FuIHlvdSBwbGVhc2UgcGljayB0aGlzIHVw
IG9yIHRoZSBuZXh0IHJjPw0KDQpUaGFua3MhDQotc2xvdw0KDQotLSANClJhbHBoIEJvZWht
ZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJO
ZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1i
YQ0K

--------------fq0rL3bzU3NMDr9Gt9Lplf7F--

--------------yBOZHoqSfb1Zr8wz9UdmRd2j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmL9PiUFAwAAAAAACgkQqh6bcSY5nkbx
IA/+OvNlw2dC0YNLxXBlGtFot07CC+4GmcE/W/1ocvKKlewMbr2Whe4gxwkp/gGxCyZZk1NLlaJG
MJwALuW/ma+5CjAqWwnPKRuOiSiC+nstfJtA1yCCIyNQpRbt2Nfj8DrNHcrggcrZIudobPdYoUxU
bn4w3QMqjCTzl/fRgDuMnxNtKWjQGeaTV6jyoqeX/fJ82aXjAmVQQicWg4CPOaDW2VRrT/nYrOSf
bvn3qotqfNh7is7BrGScKQGUXW+SnQGpAyUYFv6Law8VdEQ0yFPRXg9F5YiVjgtlq7pk36XY1K/7
rkW+18PptIS6y2NZRPiqpLB5a+2w+5J6iU1uX7afV3N4Dwb3CUH29kG9H9TDUf0fdCztnn5CJjlY
2N9sbx/95o9AqARoSij9HVPwdytagtBX3nlLiCcr3t82lsqxI1EyIULKPfTyaRCTGgD8JzHRvPNM
D69CalREx6e2VAnl2TW0XyQL1OqLaOSnfYKNn9wLZ+XsJhEguxupHrT1D1hvG4j8t4ssFLvsS40Y
FmLXLFxIPAk2sJxz/PN60MN3tg6CWHYQpa4kM+LRm4VWJhZwKALR8JDhEAWYWcrhManPB6wZfizW
T3d1ZaecpV2BqAYoSpS3346bYtb3t0zCXWeh4ckSgp2sVzs+4iY7b577S4PduUaAPRX6yJRkEUu/
IEI=
=l6rY
-----END PGP SIGNATURE-----

--------------yBOZHoqSfb1Zr8wz9UdmRd2j--

