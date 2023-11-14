Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FF57EB59B
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 18:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=w/kYGtZVxAAqj3CV+OoIlNpo3Z/WNsvqzhWaI8QQAPU=; b=qkcdyjEpPRdLzwjG16m2m1Bf5a
	Zqw1ivtXm7W0NqfBEKG65NKdU9G/TGp2BPhG98z1J+4rujYIaBGZs882hTrq2MKAg9TLBuN5Tsw1U
	eFlPUuaclLAjZ0W+xIAIu6UztvycH9VGCJ0LOJbA/pogr9d/oBOyuEwbXc6SbBOnAw7vJ1wvva/Xr
	Q2O4tH14BiV9gstUwig99/T8Fijn6lsQOdiUGxgMNuXxhyPXGUP5NC8HC9N67YbopHoJ/XypqB66v
	6oGHo6fwUdDFIXpLEEI/KrT9CWNr9m6v+uWkrvm19f38uXKVfPbQ33a+UmwMglzR7wuGmK2yeZ+kr
	ywozx+3g==;
Received: from ip6-localhost ([::1]:22406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2xL9-008Hzf-M7; Tue, 14 Nov 2023 17:36:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2xL5-008HzW-1B
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 17:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=w/kYGtZVxAAqj3CV+OoIlNpo3Z/WNsvqzhWaI8QQAPU=; b=SmHAZZmotu6k6EIm+X+pLU38GD
 07XKRM3hyGb2p1FDfuiN8SN22GNNu5QUFhiZuHYd+f1Wg6AYjQAYBxr36EW//pOsdoR69jQ5C4Krs
 wkLUkCmmcCx+XtGwVELOUDyt0Sysw4RJjzGXxX0o1N1bgqDsXmRBJqpV3SYT5/qRdAWRtvQp45LSG
 WElJc1I0E+m1C/ldazpVZi5xiWSB2qC2shfc1uW4TwVBIJxIqNknyuojpnZ5/9QfZgLXcvLURsQ1x
 euA4XlZdJH4M5bAh+efQkFKMznzTn02Uk0xckkxgiZmu65JMtnQaV1TU5R13QE82qQ5/qto2JvX8e
 EDskjBlO+g7URe3zqBgJTsRramm6NoWdDBFX4+8qLkUdcO0BzvMKzrmhfOtFaRi8ZSWYHd5HVhe+k
 IF2sz2o3ppYMDgHoqJ9fJjycY3rqkZy35PQEZQoMxo9bluz8GI/AXIIu7kQm9IwgCnTGU16V2DFDQ
 LPmWS/3YQojA3h0g/MEXGep9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2xL3-006A1y-0v; Tue, 14 Nov 2023 17:36:37 +0000
Message-ID: <b37a0a89-3b0c-41ed-a1da-00a5872f282e@samba.org>
Date: Tue, 14 Nov 2023 18:36:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US, de-DE
To: Tom Talpey <tom@talpey.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
 <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
 <87e931d2-9780-478d-9b60-1dc32d9faf29@talpey.com>
In-Reply-To: <87e931d2-9780-478d-9b60-1dc32d9faf29@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5H0QpFIMOwvg6PrT8R8uV0Gi"
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
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5H0QpFIMOwvg6PrT8R8uV0Gi
Content-Type: multipart/mixed; boundary="------------m0RcumGgehLuGnumSF80Q0XF";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <b37a0a89-3b0c-41ed-a1da-00a5872f282e@samba.org>
Subject: Re: [SMB3POSIX] File attributes
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
 <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
 <87e931d2-9780-478d-9b60-1dc32d9faf29@talpey.com>
In-Reply-To: <87e931d2-9780-478d-9b60-1dc32d9faf29@talpey.com>

--------------m0RcumGgehLuGnumSF80Q0XF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTQvMjMgMTg6MzQsIFRvbSBUYWxwZXkgd3JvdGU6DQo+IE9uIDExLzE0LzIwMjMg
MTE6NDQgQU0sIFJhbHBoIEJvZWhtZSB3cm90ZToNCj4+IE9uIDExLzE0LzIzIDE3OjIyLCBU
b20gVGFscGV5IHdyb3RlOg0KPj4+IEJ1dCwgZG9lcyBpdCBuZWVkIHRvIGJlIGV4cG9zZWQg
dG8gcmVtb3RlIGFjY2Vzcz8gSXQgd291bGQgc2VlbSB0byBiZSBhbg0KPj4+IGFkbWluIGZ1
bmN0aW9uLCBtb3N0IGFwcHJvcHJpYXRlIHRvIGFwcGx5IHZpYSB0aGUgc2VydmVyLWxvY2Fs
IEFQSS4NCj4+Pg0KPj4+IFNvIHRvIGZsaXAgdGhlIHF1ZXN0aW9uLCBkb2VzICJjaGF0dHIg
LWkiIChvciBhbnkgb2YgdGhlIHppbGxpb24gb3RoZXJzKQ0KPj4+IGV4cG9zZSBhbnkgbmV3
IHZ1bG5lcmFiaWxpdHkgaWYgcmVtb3RlPyBTb21lIG9mIHRoZW0gbG9vayBmYWlybHkganVp
Y3kNCj4+PiB0YXJnZXRzIGZvciByYW5zb213YXJlIGluZmlsdHJhdGlvbi4NCj4+DQo+PiB0
aGVyZSBzZWVtcyB0byBiZSBhIHdvcmtpbmcgbG9jYWwgcHJpdmlsZWdlIHN5c3RlbSBhc3Nv
Y2lhdGVkIHdpdGggdGhlIA0KPj4gYXR0cmlidXRlcy4gSWYgdGhpcyB3YXMgZmxhd2VkIHRo
ZXJlJ2QgYWxyZWFkeSBiZSBhIHNlcmlvdXMgcHJvYmxlbSANCj4+IHdpdGggbG9jYWwgYWNj
ZXNzLCBzbyBJIGRvbid0IHRoaW5rIHJlbW90ZSBhY2Nlc3MgY2hhbmdlcyB0aGUgYmlnIA0K
Pj4gcGljdHVyZSwgZG9lcyBpdD8NCj4gDQo+IEFncmVlZCB0aGF0IHRoZSBwcml2aWxlZ2Ug
bmVlZHMgdG8gYmUgY29ycmVjdGx5IG1hbmFnZWQhIEJ1dCBleHBvc2luZw0KPiBpdCByZW1v
dGVseSBpbmNyZWFzZXMgdGhlIGF0dGFjayBzdXJmYWNlIHNpZ25pZmljYW50bHksIHNvIGlu
IG15IHZpZXcNCj4gaXQgbmVlZHMgYSBnb29kIHJlYXNvbiwgYW5kIGNhcmVmdWwgc2VjdXJp
dHkgYW5hbHlzaXMuIFRoYXQncyBhbGwuDQoNCnl1cCwgc28gaW1obyBhbm90aGVyIHJlYXNv
biB0byBhdm9pZCBpdCBmb3IgdGhlIHRpbWUgYmVpbmcuIDopDQoNCg==

--------------m0RcumGgehLuGnumSF80Q0XF--

--------------5H0QpFIMOwvg6PrT8R8uV0Gi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVTsCQFAwAAAAAACgkQqh6bcSY5nkYk
Nw/9ES7OZW+0S/gyciUHqcH2QYzNoAODuCJQItkGLtRl1ztuWXr9Kaq5jV+cfKH0lbKIG43NXfgN
wC7MEf/f0xwyyYP6EdiRXxLT/kSTbgUzmWX7SXSzDtELjALFbx8xlvZPaeMUzYQVzi+kii+ou8Qj
tzPZ0oFASXnJLTam31+FoWv+/tGWJTn0vPF02hYo6S5IykjwwC3KIYcxv5BdjHboWns1G1xqNqe8
/ZGrCSbNcbaFFDmIruV5EPE2V5QWqYK6f5kitzaQ1HUDbQBk6RO+5mAuhXyQqJWFu5aMyeklZE6b
+nDQWmV/qO9wNlL6SLc3YhjcLNOC8oTs9fz2bTcFdDESCm00zUqMfKdU0oUz0Z+a4INNKw2eZ+tr
JfTsO09tddvGUT1PTWqWJmi3uW7kBxETAc4Mo6qcsy9pBJIuTRflILtZ9ZfFC4J2LI3cUJRbLlgc
rmRai6euZn57sIRoNOcu7/xIDk/2fZaLMi+8fL3n+olYadEi6xLEKeArAOm7SBsHv2VneVoEq1e+
QaDwkckfIEd6iMTxj1JTZ3Kmm7Ks3De5yjPsFG+bhE0IVMbv2ehgf5oEgegfkSIrExlsXSm9gGG5
f5Lz3/69OdUy9ApftmNne+zinjkFwRnBNK/2qnKKssBGn0yo6zwQsB9j2nDURHiDb+QLriCVfjTI
PTI=
=QFRj
-----END PGP SIGNATURE-----

--------------5H0QpFIMOwvg6PrT8R8uV0Gi--

