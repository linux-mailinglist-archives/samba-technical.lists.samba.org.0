Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 870B57EACCB
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 10:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+eVqhQS2GDz51Zw6xoF3463FXyU8BtJdFkm6NGoCyoE=; b=slZqDZW5JW3f9eRNLBnQOTqESK
	PSUt4b8+sf5wOIhPk6KpjezY0D9uh5+FCuxYBOh0JiuR/I4tfeMk18TuPGFidAuH+sm2uFar4llpM
	c1VogaLUhKuJjSpM3fs7MoJ7nPfblRWNYDKSGNRj3t2cqQxeVFd3D7XgrtT/01AtNXq8hVaP4XC2e
	MX6zEmibx/Tsv4BUD6AHDEjzCtJjO4IUOwdG8EMDJWAZ1RNSGpTalHx5k/Ec71OJ6rZYeGmx/Vnbs
	N/0ETlhbBrtt5XMgJYVb6WHARXcJBgbGZ+exwoJHlfrZqjC1hbcW3H2I0EKukGGZPH/hdZZaIZjQM
	8TpEahig==;
Received: from ip6-localhost ([::1]:39506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2pWK-008D1F-6P; Tue, 14 Nov 2023 09:15:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2pW1-008D16-GA
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 09:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=+eVqhQS2GDz51Zw6xoF3463FXyU8BtJdFkm6NGoCyoE=; b=D/evhWzcoCMq8hXfEnDDYCmWdZ
 PpTxZZg8MMtbpUDU7oOaCcY4Bu1VxuJQEw2BlDOYiGbD0RHmUMHiE3xjEPPlcvo8qatcQ5YC0yZfr
 kluW789jAL3TQa6PiSO6dR+k8QO4evx1fPEB7j5433ZXAEWzVZbskG86c5NokeLNJTGwRc6OBxguj
 IAEGY4H45/42m2z3L8ZWpGtq9WinhIQlUMNuoFoYuAf9R1Y2irntY5qyTyKPNytqf6Q3+5QRwt0fr
 CizQ7X8EANvZVd82h0Sh8cfkAG+mQUKxrvgsG5e7OJ3fGE8huo52ZwdvyYLPyEjfl6JU8A0gp4MAd
 Mi7FfRWV63nqQkz6GYNUdzVlmo7e5NEfZlvg76NdrRxgaNaNrWIJQTwMY9Tdefph5eE0M8RhV6Mox
 zu2HGaPmV9njp3fiObHKtIyd66NX9wVfFiLso7DFkg8ZYUK7AnBu/eUbUcPbDk5UsrYW2wqJ2aZz4
 UpcF5aCppkRykvtkXKhGvsJ9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2pVw-0065Cc-2F; Tue, 14 Nov 2023 09:15:20 +0000
Message-ID: <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
Date: Tue, 14 Nov 2023 10:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YoLkZwK0QDMy6uw0YGG8UOim"
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YoLkZwK0QDMy6uw0YGG8UOim
Content-Type: multipart/mixed; boundary="------------Thyi7o4HppQZ577KsV0vRnzi";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>
Message-ID: <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
Subject: Re: [SMB3POSIX] File attributes
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>

--------------Thyi7o4HppQZ577KsV0vRnzi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTMvMjMgMTg6NTAsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBPbiBNb24sIE5v
diAxMywgMjAyMyBhdCAxMjoyODoxOFBNICswMTAwLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+
PiBXZSBoYWQgc3VwcG9ydCBmb3IgZmlsZSBhdHR0cmlidXRlcyBpbiB0aGUgQ0lGUyBVTklY
IGV4dGVuc2lvbnMsIHRoaXMgDQo+PiBpcyBjdXJyZW50bHkgbm90IGluIHRoZSBzcGVjIChv
ciBjb2RlKSBmb3IgU01CMyBQT1NJWC4NCj4+DQo+PiBJcyB0aGlzIGludGVudGlvbmFsPyBX
aGF0IGlzIHRoZSByZWFzb24/DQo+IA0KPiBEbyB5b3UgbWVhbiB0aGUgYXR0cmlidXRlcyBs
aXN0ZWQgYnk6DQo+IA0KPiBtYW4gY2hhdHRyLg0KDQp5ZXMuDQoNCj4gY2hhdHRyIC0gY2hh
bmdlIGZpbGUgYXR0cmlidXRlcyBvbiBhIExpbnV4IGZpbGUgc3lzdGVtDQo+IA0KPiBUaGlz
IHdhcyBhdCB0aGUgaW5zaXRlbmNlIG9mIFN0ZXZlIGFzIEkgcmVjYWxsLg0KDQphZGRpbmcg
U3RldmUgdG8gdGhlIGxvb3AuDQoNCj4gV2UgbmV2ZXIgaW1wbGVtZW50ZWQgdGhpcy4NCj4g
DQo+IE1pZ2h0IGJlIGRvbmUgdmlhIGEgdHVubmVsbGluZyBpb2N0bCA/IE90aGVyIHRob3Vn
aHRzID8NCg0Kd2VsbCwgaXQncyBhIHJhYmJpdCBob2xlIG9mIGl0cyBvd24gYW5kIHN0aWxs
IHNlZW0gdG8gYmUgcmFyZWx5IHVzZWQgb24gDQpMaW51eCBhbmQgdGhlIEJTRHMuIEl0J3Mg
bm90IFBPU0lYIGFueXdheSBzbyBqdXN0IGRlY2xhcmUgaXQgb3V0IG9mIA0Kc2NvcGUgZm9y
IG5vdz8NCg0KVGhlIExpbnV4IGludGVyZmFjZSBpcyB2aWEgaW9jdGxzIHNvIGRvaW5nIGl0
IG92ZXIgdGhlIHdpcmUgdmlhIFNNQjIgDQpJT0NUTHMgbG9va3MgbGlrZSBhIGdvb2Qgd2F5
IGZvcndhcmQgYWxsb3dpbmcgdXMgdG8gaWdub3JlIHRoaXMgZm9yIG5vdyANCmFuZCBwb3Nz
aWJseSBhZGQgaXQgbGF0ZXIgaWYgdGhlcmUncyBkZW1hbmQgYW5kIHJlc291cmNlcyB0byBp
bXBsZW1lbnQgaXQuDQoNCi1zbG93DQo=

--------------Thyi7o4HppQZ577KsV0vRnzi--

--------------YoLkZwK0QDMy6uw0YGG8UOim
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVTOmMFAwAAAAAACgkQqh6bcSY5nkZp
IQ//UagROhg18acryVQmHXxI+6Sr+XgpEgwkPoZzfmdfZVpNsiiKTTlV80HBOjBqw4jGglE3n+aF
gbmntpLqQYqptZnKyCnTwv60FFnj7eHCw5J2VCCg05LHHYkrBd3gTCtaRBuoo3Guy00CD8bFR206
3eYhThluF4xQFIAaHklVtON7OGBU+fG2JillL4xAKJmMxZYFlN6EX1aFV2gN1+eVaLXhDwtaBoo9
7SC3bfRthNj/djQFS+4zp8lga90cJDJLHXjzRseHrOkn1yoDOCQMorA22MWvJzMCg0w5xt6QBY+w
e/HX2Vv6r8myQoPRLs5YrAahq5OKU5rTvHFApBG5WXjAp8VhNBdHafYMuHAVGHyJEKIkEfLvE8B8
6L0a8Ej2z0fu/KG02RPx69wA9OQe3ZV2tKpHwP18ot3Sc+dv2luEVlZb3GxN+p6lb6yx+2SA1HyO
giFx7JG7vo94lBzkOxsrxTfunLIjGG/CJU4Smj4Vhcp8HyzuMAQlO1BmhImAl4/j3ahvrVWw07Bx
h8rCNLNs9P2276uROiSSSVhn952KL5nn3lVyb7uzs0eUPfT0PIIGqlGw1TLKTCuDzZ6b/3WlYHeN
/HiHj0azI09S50o1lrxKxIeeNepmtYahJXW1Yma8he7QOH7xFbEolNLDsYxJOcvgR5/keTZoUIPt
RgQ=
=xVtQ
-----END PGP SIGNATURE-----

--------------YoLkZwK0QDMy6uw0YGG8UOim--

