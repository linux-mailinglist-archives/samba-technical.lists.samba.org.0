Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67859A81CC1
	for <lists+samba-technical@lfdr.de>; Wed,  9 Apr 2025 08:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jUkmKwL4hFCIVkAqUyOiOb1SwxnX+MBicB8PqIqnIz8=; b=4PpLPKZmUCsx6VAm5jPa6Vihqr
	C7d4OfCUotIBrq6YuSV2x6gidp9eJiOsKwnni8yY+n+aZ3M3qq0n0qpnKLVr8zFqUyLZu7GJI08uO
	8QScfPd5FiDLR1lY1pbLb4dOLJJhz19UNUe0+frzzZVLqoM434vgbFXvpGu4VS4JCp3oyamQA/YfJ
	w0kvTr0YB0vAIzMQ2Q/Tu8mmuFKmedznyo6pIMDu1Ewvjk9o121ECFHAr3ySRw8UXJmlP8PK5/LnB
	vAf/jItcen5VlwPecjEF82zW4QmeFT7SrHKmoy3MdbTZ1xv+2aPY1Yl2bMUKt/+82vHrGlUp0U3Kj
	RaEmkc8w==;
Received: from ip6-localhost ([::1]:55216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2Ogd-001ypF-EP; Wed, 09 Apr 2025 06:13:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61540) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2OgY-001yp7-Ar
 for samba-technical@lists.samba.org; Wed, 09 Apr 2025 06:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=jUkmKwL4hFCIVkAqUyOiOb1SwxnX+MBicB8PqIqnIz8=; b=JERV4QZ3CTZ5/QiRuqtvUKIDOD
 rCGtPX9c101MB9WuBf5aCyqqhrVvo8PjjA723OiavlM4z9g5Qv+sLP9B5e3HbvRxetEKw+L2y51Ch
 nRivPb6HDx8X1/LWWGA/aK5KSGXJRxLzhiZOR0q5n+0onyRShhw24znQ0VfyYYkal1JlXNTNwVj+D
 +NPXIpyNnsVFwyblESUgxfniMTKs8zmwEn/A8liMPCnwU8CBy9NXQljfQYu/CuxD8Vkr4VEmjj3ux
 vyjfO4ijqSqNvzrpSb/de2Ua51sBhlgED80ZvuXY0/6LOhGAMykbQ4J8Nejg4FJQKfBj4nFTMdUmm
 fQeeJOpbw+2tG3JYjt7XNx5QFWt0Rhqgakh30KGBKG9hxlD1NosH6TjPwzkem7TMb7mw5fj2u+NHU
 yUSl94sbjjcbW5BdaSdV6E6vQl0yKZ3pSJ/UgnH2+J/PnRlGJukEl08N25HqZYdCbWJhdmKqY1S3p
 4qJfH+SNDnOWqy/UG5fgdlbA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u2OgL-008okN-0I; Wed, 09 Apr 2025 06:13:05 +0000
Message-ID: <ef44bc0c-f715-482b-b133-b2fecdb78a27@samba.org>
Date: Wed, 9 Apr 2025 08:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: directory lease handling perf bug
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mq6JEVi2dugO1boWp1t0vVsu"
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Enzo Matsumiya <ematsumiya@suse.de>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mq6JEVi2dugO1boWp1t0vVsu
Content-Type: multipart/mixed; boundary="------------D0I8qGn0REZ0mtySzIxtLJwO";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Enzo Matsumiya <ematsumiya@suse.de>
Message-ID: <ef44bc0c-f715-482b-b133-b2fecdb78a27@samba.org>
Subject: Re: directory lease handling perf bug
References: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>
In-Reply-To: <CAH2r5mvSBqF1uW+hZ+1syN=bZsqn6RPPfDgsho6FxpMgJRBHzw@mail.gmail.com>

--------------D0I8qGn0REZ0mtySzIxtLJwO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDQvOS8yNSAxMjowOCBBTSwgU3RldmUgRnJlbmNoIHdyb3RlOg0K
PiBUaGUgZGlyX2NvbnRleHQgcGFzc2VkIGludG8gY2lmc19yZWFkZGlyKCkgbmV2ZXIgc2Vl
bXMgdG8gbWF0Y2ggdGhlDQo+IGNhY2hlZCBkaXJfY3R4dCBwb2ludGVyIHNvIHdlIHdvbid0
IHNldCBjZGUtPmlzX3ZhbGlkLiBPbiBlYWNoIGNhbGwgdG8NCj4gY2lmc19yZWFkZGlyIChm
b3IgdGhlIHNhbWUgZGlyZWN0b3J5KSBpdCBsb29rcyBsaWtlIGN0eCBpcyBkaWZmZXJlbnQu
DQoNCndoZW4gZG9pbmcgc29tZSBxdWljayB0ZXN0aW5nIHllc3RlcmRheSBJIGhhZCBub3Rp
Y2VkIHRoYXQgZm9yIGEgc2ltcGxlIA0KbHMgLWwgdGVzdCB0aGUgU01CMl9GSU5EIGlzIG5v
dCBkb25lIG9uIHRoZW4gIFNNQjJfQ1JFQVRFIHRoYXQgYWNxdWlyZWQgDQp0aGUgUkggbGVh
c2U6IEkgc2VlIHR3byBTTUIyX0NSRUFURSBvbiB0aGUgZGlyZWN0b3J5LCB0aGUgZmlyc3Qg
b25lIA0KZ3JhYnMgdGhlIFJIIGxlYXNlIGFuZCB0aGUgc2Vjb25kIG9uZSBpcyB1c2VkIGZv
ciB0aGUgcXVlcnktZGlyLiBHdWVzcyANCnRoYXQgZXhwbGFpbnMgaXQ/DQoNCi1zbG93DQo=


--------------D0I8qGn0REZ0mtySzIxtLJwO--

--------------mq6JEVi2dugO1boWp1t0vVsu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmf2D8UFAwAAAAAACgkQqh6bcSY5nkYA
aA/+LmPKTjIjEtBd4zxvvC1ASVBWuQ6QQNNMCi3R25w4ba0u0XXLnrkDy5aTlI3k9QFCwD/FMSvV
ZJW3G/ZbFNUO56OCDN7FvMyzE1p9DNghOK1QZNGzNmKIVhColPg+FxhMgGvmwz1vQOY/MZ1v/U5h
rlJjTyTZuPr3bY2EHVAw+S8LTwZ/JKypXKjrxHRGwTbh98XuQrW8NBKpzPUMRK5OXRObFHWJGkS1
/VCBrkHqH38uOLfJCEq5IRbqe1si41xx4vubU+8zrdrSWXP8c2t41rj401N2tatFd2svqH46uzmg
1ucHCj7oQIyy0EpUrB8OJRZJc3J2S5K824biODHQxzNVR7fNXlDG0yzk0rGQ5SMlSXKQLPdnL2qw
HZe8ofvMI0eijLunnzpnNF6zBvjuQDTaZDIckReZmJxdbUzKNGBCwg0ZgxlOMh+RK0S2xJwKgd+G
RGhiW8Zc6HVrmaio1N68Zzx1ZNUpKvQE6pzSyF97uwvNOBuaH076bM0gPDg0YiUPbMKz1ul4U+nD
FiMdnYOmHlscs+5ywtQ2INfBwdA7UVR3MocO8tvQmRWjZmPT67wb0+xRKdtV799fsy8o5llS48v1
QmW8ze8BViZ+5CVHiU1TQR/vj7fwLmjQPNwSXNRYDivCHQAT5A5w3oXDGe+Kv3Xs6mAC5sBFtFVU
SW4=
=vORL
-----END PGP SIGNATURE-----

--------------mq6JEVi2dugO1boWp1t0vVsu--

