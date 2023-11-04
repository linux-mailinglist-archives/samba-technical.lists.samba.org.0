Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F007E104D
	for <lists+samba-technical@lfdr.de>; Sat,  4 Nov 2023 17:09:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mY1ufqQGfgYS58Nma908qOACC7VtNBWsgb8LanVg8sg=; b=Cl+pIkvVGtu4/PclBgtCckZIBm
	/zpOgi+AFTP7Q8txT1oXZwx7/ztHKA2Z1JpU4cF7GA5BpEpaPX+8Du/ei2a63vgD9AeJaSqUruYG9
	AdrN0Ch4PScuYxfkHg2BKxcuat3YvAlvM6MdiV9aOf1EG8w6CpGEHnTcx26R1Qmz0+J411GgCg9o+
	zPpXPxGFGm4bsIfhS7R6JzWHqLl6BNEPKsLQ5jg5sbQCGjikabBDhjTQQTVi7GVZ/o1MKtZHWXJdo
	scBE/gnwfc9xDo/scJdpEoJflt1mO2WmtipCvCzXT8a4b+qYAuFjBE/dJyXjzoZuATq2QPQ4FFnsr
	EVOtTEPg==;
Received: from ip6-localhost ([::1]:42780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qzJCc-006MRt-Nw; Sat, 04 Nov 2023 16:08:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qzJCW-006MRk-Tr
 for samba-technical@lists.samba.org; Sat, 04 Nov 2023 16:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=mY1ufqQGfgYS58Nma908qOACC7VtNBWsgb8LanVg8sg=; b=nZpMmaYZJkgnFgF40S9ad+a2Ka
 fg0rbgn2qaLPlfLzgnAcBBHx+IxqJqUu7YKhrkf2SIAh+XyISOWdchJCBzt1v/FCq62HsX7GdBv+6
 bqCrsg5xXooIHq3N+5d8Dar5BEFKEp9ZcioCOR5iBJdiQada1Vfkx9OYPPjMPnRllt7Ki9z0CAFcQ
 /cVNMciba8wh3OIWWYAPftwG+dIP5mCbdKh8ljhKxDFwn3LZx4Rqp3GlhEjEbAgblObz1HrFFb/Br
 14V9+4l2jLWtv+x5BW87TUlcBdlCpxsoc6zpZNqNnV/nQqymeqWYxKJD6TJOuv0gyKohq44y8NIdX
 Jba8oftqx1wpc0BGGrMs7aidZ1VN7roK0wHSQ6FBWxpc4BCii58FqMBVD0VFsCDNqW/sj7Mv9Aitb
 0BYp1VvObcsbXLyiE/xVqCjGkpCsPlO1z7Z86Au76f6p+S73rjgAaXSBhl1TZkCwAwLp6EHfxDCFP
 lSOGVaE7VNr8NBPW7C0tHMlh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qzJCP-004KBh-2c; Sat, 04 Nov 2023 16:08:37 +0000
Message-ID: <e15589c9-1481-4344-8030-85fc737a1b56@samba.org>
Date: Sat, 4 Nov 2023 17:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
Subject: [SMB3UNIX] Add POSIX fs-info to the sepc
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g3st2WNxjbSpQcUZYwCfV1N0"
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
Cc: Stefan Metzmacher <metze@samba.org>, Volker Lendecke <vl@samba.org>,
 Tom Talpey <tom@talpey.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Mulder <david.mulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g3st2WNxjbSpQcUZYwCfV1N0
Content-Type: multipart/mixed; boundary="------------6SCW9Lfpm5aK0TWLU0ugs7Wx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, Volker Lendecke <vl@samba.org>,
 Tom Talpey <tom@talpey.com>, David Mulder <david.mulder@suse.com>
Message-ID: <e15589c9-1481-4344-8030-85fc737a1b56@samba.org>
Subject: [SMB3UNIX] Add POSIX fs-info to the sepc

--------------6SCW9Lfpm5aK0TWLU0ugs7Wx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmVyZW15LA0KDQpJIGp1c3Qgbm90aWNlZCB0aGF0IFBPU0lYIGZzLWluZm8gaXMgbm90
IGluIHRoZSBTTUIzIFVOSVggc3BlYy4NCg0KQXMgaXQncyB0aGUgc2FtZSBhcyBDSUZTIFVO
SVgsIEkndmUganVzdCBjcmVhdGVkIGEgc2VjdGlvbiBmb3IgaXQgaW4gdGhlIA0KbmV3IHNw
ZWMuDQoNCkNhbiB5b3UgcGxlYXNlIHRha2UgYSBxdWljayBsb29rIGJlZm9yZSBEYXZpZCBy
ZXZpZXdzIGFuZCBwb3NzaWJseSANCm1lcmdlcz8gVGhhbmtzIQ0KDQpodHRwczovL2NvZGVi
ZXJnLm9yZy9TTUIzVU5JWC9zbWIzX3Bvc2l4X3NwZWMvcHVsbHMvNA0KDQpCdHcsIEkgd29u
ZGVyIHdoZXRoZXIgaXQgd291bGQgbWFrZSBzZW5zZSB0byBob3N0IHRoZSBzcGVjIG9uIGdp
dGxhYiwgc28gDQp0aGUgd2hvbGUgdGVhbSBjYW4gbW9yZSBlYXNpbHkgY29vcG9yYXRlIG9u
IGl0LCByYXRoZXIgdGhlbiBoYXZpbmcgDQpldmVyeW9uZSBpbnRlcmVzdGVkIHRvIHNpZ24g
dXAgdG8gY29kZWJlcmcgdG9vLg0KDQpJJ2QgYWxzbyBsaWtlIHRvIGhvc3QgaXQgb24gZ2l0
LnNhbWJhLm9yZywgYXV0b21hdGljYWxseSBtaXJyb3JpbmcgdGhlIA0KcHJpbWFyeSBjb29w
ZXJhdGlvbiBwbGF0Zm9ybS4NCg0KVGhvdWdodHM/DQotc2xvdw0K

--------------6SCW9Lfpm5aK0TWLU0ugs7Wx--

--------------g3st2WNxjbSpQcUZYwCfV1N0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVGbIUFAwAAAAAACgkQqh6bcSY5nkYI
KhAAjJMQki3ap4WJnH8nMjNaUHnff5xbIkqukMeJ2j7+KSvERYrPM58JOYM0nHpLAl0ZSwY1C4Kv
32WgAWxpHdgRtbsa+6WY6kRi4i1awbWY2T+67n07YzA1qgKPvSlbbnB33/Cmu70Yrc82s+5XUeKA
cfHDJ1Y1Hf80AXhjtBAWuQAy3xyzwS8LHyew+Udp5kdtq58pfdtkEMhZxyZsQeeKOw+O43ekRtdi
yJ+YcWPHY7WYbKRRoqQ3UhMCa4Xm3ejJy8YGW24YrdzdqooeUsZT4yKsMEgK9EaGsWtDm/3Nv78y
7kI9ATk6H46LnfCqJcegTFU7j8/k/TyZi98OGj+S2ek8mZ+gL/uhRjgiPrX78vr4f3vBZomSJE1W
sISBjof/4nOlQbrPkcUPIaKLTCCWMaiFpq8Y4EcdYsq+40hOFgpFsPwsgNvICGC78F1vXeVD0c4T
T+PK9x5LHTXzaJeL/adgI/ar68VzxDpYHOeRTJwYOWrFaCK0AYk09ol7zQlGxNsMD1mvSeW2RsjJ
jY1+zljNqwsxdZb6Y/5qZEFYnAe94YdFfXukgSIpe3NOXbpnHZGEnxeFvGo9vvurEU32wjYvlo1m
sT+bKpOvGLfTO0RbPkydoRK8g+FyrSxIn01ANLIHP17Iqgh6Yjwy4jsGqB6tVgvDkNSQuUzxB1xz
a7w=
=FRGM
-----END PGP SIGNATURE-----

--------------g3st2WNxjbSpQcUZYwCfV1N0--

