Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3B877BC0
	for <lists+samba-technical@lfdr.de>; Mon, 11 Mar 2024 09:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jdI6nv25z5nVPnftdHSu59IzF6kLzzsHE4135U3ooC0=; b=snSTS5mJD89L4iewRJqwrYjTuO
	CsYcPdEj99Wu+Idu3fzXeWp409KR/aqgoD3eMBWzyyhOcAdS0VOYm1IwDWFyweCNZ19ZaMZCGXu0d
	tYl0aRTOemXi3QoRtdN6s8xUIqza4GHb5qf0cUVFAF1/XTvh5AUYnF5De16JLht8e4ydT89EEoGM5
	vMoSIr0WfepD0DOtuh9d9U8fCNvk4sxn+PjkEreayM5A1Lc2D6W9eJYM+H0evyBjBLvUC14b/W0Kg
	bwDx+867ubBgdamp+s7aOBuOhmThCX/Nv5sifT/pfQa8Puu4TI3KFUgjsIV/fqS+D0PCetLxdPhPB
	004lUbuw==;
Received: from ip6-localhost ([::1]:31236 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rjb8y-0006qg-3m; Mon, 11 Mar 2024 08:36:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjb8t-0006qZ-GD
 for samba-technical@lists.samba.org; Mon, 11 Mar 2024 08:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jdI6nv25z5nVPnftdHSu59IzF6kLzzsHE4135U3ooC0=; b=lCW4OhuzFTxLoCF2EFV4kWcOmy
 EAdoagdELs6aYURvQaVgAl2p2CCNg4/RilyclMHgD/JmDvLl/PrjjzdOhKdNbj6XUbboXTB5zB4o0
 uKCa7+tkh8GI+QuvNJZphekZ2Jn7Lo36jl96x5o8R8Ajfw0PZCbBzjByZiT7QBuxr2YdizN5JzwFZ
 Osayf7r8L1Jm6Xw9S+IIuKHJiXtlisQb2+d0kOYLDmm7JD6pNA+YGbkTIAN2DxRpQbE5TuWMIuq8t
 81dzoES9WPdYwb4huoy5LVqdrDEUc6fI8tGoxSbQO44LtpBWW/PEWzYTz0C6e5AmwtIcaDGMtMo0Z
 J1/Y2pRTt+a5IZ+WTg7WrsrCxj4O5ZdBH/1wxAcZHfTz9E2CbkM7re2/c7bJn+8r7uUdgOK3gdlSZ
 NzSAPUMVXh93mAdTkq9jhB1fKXP67IWOY1O1scDrRZMLXuQb75PQ4xiic5vdZUGeyVSsh7MrODVSF
 Xpq3ZDn98Dxsp6h2iVTMGs1x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjb8r-000ESk-1S; Mon, 11 Mar 2024 08:36:17 +0000
Message-ID: <09f8323b-d230-4605-af6a-cfd88b87a83a@samba.org>
Date: Mon, 11 Mar 2024 09:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Samba] Assistance Needed with Persistent Handles Integration
 into Version 4.19.3
Content-Language: en-US, de-DE
To: chin housin <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <DB9P192MB1684DD738FE6C6B4132AEBD6FE272@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684DD738FE6C6B4132AEBD6FE272@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XsF0exXLkipeRM0XU27VO3sp"
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
--------------XsF0exXLkipeRM0XU27VO3sp
Content-Type: multipart/mixed; boundary="------------Y5RsacCrWCOCJI0NrE8OBFvg";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: chin housin <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <09f8323b-d230-4605-af6a-cfd88b87a83a@samba.org>
Subject: Re: [Samba] Assistance Needed with Persistent Handles Integration
 into Version 4.19.3
References: <DB9P192MB1684DD738FE6C6B4132AEBD6FE272@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684DD738FE6C6B4132AEBD6FE272@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>

--------------Y5RsacCrWCOCJI0NrE8OBFvg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy84LzI0IDA4OjQxLCBjaGluIGhvdXNpbiB2aWEgc2FtYmEgd3JvdGU6DQo+IEhp77yM
IEkgYW0gY3VycmVudGx5IGluIHRoZSBwcm9jZXNzIG9mIGludGVncmF0aW5nIHBlcnNpc3Rl
bnQgaGFuZGxlDQo+IGNvZGUgaW50byB2ZXJzaW9uIDQuMTkuMyBhbmQgaGF2ZSBlbmNvdW50
ZXJlZCBhIGNvdXBsZSBvZiBpc3N1ZXMgZm9yDQo+IHdoaWNoIHdlIHNlZWsgeW91ciBndWlk
YW5jZToNCg0Kd2hpY2ggY29kZT8gTXkgb2xkZXIgV0lQIGJyYW5jaGVzPyBQbGVhc2Ugbm90
ZSB0aGF0IHRob3NlIGFyZSAqZmFyKiBmcm9tIA0KcHJvZHVjdGlvbiByZWFkeSBhbmQgc2hv
dWxkIG5vdCBiZSB1c2VkDQoNCj4gMS4gSW4gdGhlIHJlcGxheSBjYWNoZSBzZWN0aW9uIG9m
IHZlcnNpb24gNC4xOS4zLCB0aGUgZnVuY3Rpb24NCj4gYHNtYlhzcnZfb3Blbl9zZXRfcmVw
bGF5X2NhY2hlYCBoYXMgZGlzY29udGludWVkIHRoZSB1c2Ugb2YNCj4gYGdsb2JhbF9pZGAg
YW5kIG9ubHkgYWRkZWQgYSBsb2NhbCBmbGFnIChEQldSQVBfUkVQTEFDRSkuIEkgd29uZGVy
IGlmDQo+IHRoZXJlIGhhcyBiZWVuIGFueSBjb25zaWRlcmF0aW9uIHRvIGluY2x1ZGUgdGhl
IHBlcnNpc3RlbnQgZmxhZw0KPiAoREJXUkFQX1BFUlNJU1RFTlQpIGFzIHdlbGwuIDIuIFdo
ZW4gSSBjaGFuZ2UgdGhlIGZsYWcgZnJvbQ0KPiBgREJXUkFQX0ZMQUdfTk9ORWAgdG8gYERC
V1JBUF9GTEFHX1BFUl9SRUNfUEVSU0lTVEVOVGAgaW4gdGhlDQo+IGBsb2NraW5nX2luaXRf
aW50ZXJuYWxgIGZ1bmN0aW9uIG9mIHNoYXJlX21vZGVfbG9jay5jLCBJIGFtIHVuYWJsZSB0
bw0KPiBhY2Nlc3MgdGhlIHNoYXJlZCBmb2xkZXIuIFRoZSBlcnJvciBtZXNzYWdlICBpczog
IlwxOTIuMTY4LjI0LjhccGggaXMNCj4gaW5hY2Nlc3NpYmxlLiBZb3UgbWlnaHQgbm90IGhh
dmUgcGVybWlzc2lvbiB0byB1c2UgdGhpcyBuZXR3b3JrDQo+IHJlc291cmNlLiBDb250YWN0
IHRoZSBhZG1pbmlzdHJhdG9yIG9mIHRoaXMgc2VydmVyIHRvIGZpbmQgb3V0IGlmIHlvdQ0K
PiBoYXZlIGFjY2VzcyBwZXJtaXNzaW9ucy4gVGhlIHJlcXVlc3Qgb3BlcmF0aW9uIGNvdWxk
IG5vdCBiZSBjb21wbGV0ZWQNCj4gYmVjYXVzZSBvZiBhIHNldmVyZSBtZWRpYSBmYWlsdXJl
IG9yIGNvcnJ1cHRpb24gb2YgdGhlIGRhdGEgc3RydWN0dXJlDQo+IG9uIHRoZSBkaXNrLiIN
Cj4gDQo+IEZ1cnRoZXJtb3JlLCBJIHdvdWxkIGxpa2UgdG8gaW5xdWlyZSBzaW5jZXJlbHkg
aWYgcGVyc2lzdGVudCBoYW5kbGVzDQo+IGFyZSBzdGlsbCB1bmRlciBjb25zaWRlcmF0aW9u
IGZvciB2ZXJzaW9uIDQuMTkuMz8gQXJlIHRoZXkgc3RpbGwgb24NCj4gdGhlIGRldmVsb3Bt
ZW50IGFnZW5kYT8NCg0KU2FkbHksIGR1ZSB0byBtaXNzaW5nIGZ1bmRpbmcgdGhlcmUgaGFz
bid0IGJlZW4gYWN0aXZlIGRldmVsb3BtZW50IG9uIA0KdGhpcyBmZWF0dXJlIGZvciBzZXZl
cmFsIHllYXJzLiBUaGVyZSdzIGxpa2VseSBlbm91Z2ggdG8gZG8gdG8ga2VlcCBhIA0KU2Ft
YmEgZGV2ZWxvcGVyIGJ1c3kgZm9yIHNldmVyYWwgbW9udGhzLg0KDQpDaGVlcnMhDQotc2xv
dw0KDQotLSANClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICAgaHR0cHM6Ly9zYW1iYS5w
bHVzLw0KU2FtYmEgVGVhbSBNZW1iZXIgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcv
DQpTQU1CQSsgcGFja2FnZXMgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy8NClNl
ck5ldCBTYW1iYSBTdXBwb3J0LCBDb25zdWx0aW5nIGFuZCBEZXZlbG9wbWVudA0K

--------------Y5RsacCrWCOCJI0NrE8OBFvg--

--------------XsF0exXLkipeRM0XU27VO3sp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmXuwoAFAwAAAAAACgkQqh6bcSY5nkbg
SxAAnUFqs9kBp/H3MRX7Km4Rr8rUItUsA66J/2dPoSIaDOc7X3sy34+XJdJy0T3zwg76XSlPlwm6
3IwLdMdNaWre17pJ5zOdhz5ptBxO082ySCoEfZBLIUj0foxWsJAdr6kL2H83KVlARERDaxj2vZ7U
fqFhGVj1zbBsEL9/nhGiui/f81eFVTcJlX4/fAJxXxMG9sSGYQQCOtGAgm9bzZlQbsCupgkUUDxe
8r8VUOmUu5lTlQqcDnrTQG32R2why2THnSjWd1fb5BOtOxFfOfjWvje/Q3dgoCZd5U3BvNvd3gLp
lfIAfqyQeZgakoCN4W2ao3lETTjGPFMF/NwaDPSp1QO6IqurSZq1oCdoblQdlEUKYD5VkHoM4HwH
yGy92oJ4GomXtqrcrmG3fc67tZX8kvp4oFS6H4Sh5tPDQiroSMnEFlOwJhEx4LKw9IAD6jZ59Rs2
Efo7ug8PxejTfR4YkM4O7fI/hOHhmt5KbM7REKF84cVKbEVb9v4GE1Hu47JiaJLd59nbbGGCysWk
faGt4hF/vrySj+LHjDpXKAgM+nnSE3UAPwmQ2E1gwLFbz1+q7Lu3WYZc9//GVXq55GYGYfUTbVWH
LUjt9fLhsoUWQ3kGKeb7wOGUSaDi+FkB+tT0FOuS1M2U8CuPpsXCNEx2XwKWCMCyIOd0zp+Z4mCg
P2A=
=M0Un
-----END PGP SIGNATURE-----

--------------XsF0exXLkipeRM0XU27VO3sp--

