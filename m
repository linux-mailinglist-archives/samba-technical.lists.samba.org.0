Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DEB7D007F
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 19:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MZXF6KW0dimxImgdzZJdzTMKWKRA1fk3HsjlLvwaqSk=; b=Ta0zFKuQyYSKUL9VkGGAY8RVMA
	E+UFSNFbUYNUPB+q0pIi28fglzDpF9Og0OXMCmj7RgChxFTm+OElG3iVmz8uYKgJg9HwrjHPhiBJ7
	MGaMN5sds/WPnnhKUb/lPF2uNagkLuBAhbg0Ux+t2Ffi1n/G6Fh6VMoGLVwCsHSj9hEIIO2avhK8o
	OAJEgqH9gqAXwtzzrQgVcg99eFiI2/XMkyOTNeVNIGVVX44M7i356dpw4SL0AkTx/scn/Tast3Neb
	De8DzDj77IwqqLJ4Toq5PZ8XUdo7vfAYqMRXx5+AdkR7SHijz2RWdqyfwHughuSJy1duZYV+UNC10
	R4brZ2+g==;
Received: from ip6-localhost ([::1]:43072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtWnr-001MaF-Rw; Thu, 19 Oct 2023 17:27:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtWnl-001Ma6-Hq
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 17:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MZXF6KW0dimxImgdzZJdzTMKWKRA1fk3HsjlLvwaqSk=; b=qQJ5osdEoTiTaJ+Q7w81FmqLsZ
 RGsqbUuc+TTYj7HjrhywwlryJG4oCamuqdwIeX/SL/VfsgLSBKvc25U0WNtZyBhIPfuBwtzPhqHgn
 ZkCdR+ZNSGffIIDWb8xZF+YuNyDPwoDsCUiBLedLoQodItfQC89wkS9DwpT+PdqRgs7JfITxLPSBG
 B8VLSt54TwHMi9urHOr99Bsajwrj4kcXHN4e8ukQz40JsFgi/MAqUF3RJaUv5tgtOzjMnAb7FAgGk
 UNaQ4xjapovo0nrpJwf7LW08HJLuNVwlZlHDLOGS4lKVO+vlw7SNLrYMikwPOANBkFzJkf1dW0OGz
 NeJvI+p9JE9bLKW3jvsAHZHen4x3Lrn+toNYcq60jw52hCIAxQpBF6VTt4TrZHD12vdkx5w61ys94
 nteBvwiNMC+kXS6r400zUH3aS6T9ESTaEZE1bnunJuIHCzqHVjmasHV4Si8qRoFcLq/EFcu8ogT5T
 gA16b+YmP4NN7m9D1do8e+PJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtWnj-001XPG-2k; Thu, 19 Oct 2023 17:27:16 +0000
Message-ID: <7861de81-2176-4996-82da-11b663c20991@samba.org>
Date: Thu, 19 Oct 2023 19:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3-POSIX: Move section 3 inside section 2 as 2.3
Content-Language: en-US, de-DE
To: David Mulder <dmulder@samba.org>
References: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
 <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>
In-Reply-To: <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GSBVaZzvxrP7ZzEqyp0dNBn7"
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
Cc: Tom Talpey <tom@talpey.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GSBVaZzvxrP7ZzEqyp0dNBn7
Content-Type: multipart/mixed; boundary="------------WuYn2S1tDFxXKupLohsiQkZc";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Mulder <dmulder@samba.org>
Cc: Jeremy Allison <jra@samba.org>, Tom Talpey <tom@talpey.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <7861de81-2176-4996-82da-11b663c20991@samba.org>
Subject: Re: SMB3-POSIX: Move section 3 inside section 2 as 2.3
References: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
 <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>
In-Reply-To: <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>

--------------WuYn2S1tDFxXKupLohsiQkZc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMTkvMjMgMTk6MTIsIERhdmlkIE11bGRlciB3cm90ZToNCj4gDQo+IE9uIDEwLzE5
LzIzIDExOjA5IEFNLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+PiBIaSBEYXZpZCwNCj4+DQo+
PiB3aGF0IHdvdWxkIGJlIHlvdXIgdGhvdWdodHMgb24gdGhpcyBvbmU/DQo+Pg0KPj4gaHR0
cHM6Ly9jb2RlYmVyZy5vcmcvU01CM1VOSVgvc21iM19wb3NpeF9zcGVjL3B1bGxzLzMNCj4+
DQo+PiBASmVyZW15OiBkbyB5b3UgdGhpbmsgeW91J2QgaGF2ZSBzb21lIHNwYXJlIHRpbWUg
dG8gd29yayB3aXRoIG1lIG9uIA0KPj4gdGhlIHNlY3Rpb24gMyBzZXJ2ZXIgYmVoYXZpb3Ig
c3R1ZmY/DQo+Pg0KPj4NCj4gRmluZSB3aXRoIG1lLiBSYWxwaCwgSSd2ZSBtYWRlIHlvdSBh
IG1lbWJlciBvZiB0aGUgcHJvamVjdCwgc28geW91IGNhbiANCj4gbWFrZSBhbnkgY2hhbmdl
cyB5b3UgbGlrZSBub3cuDQoNCnRoYW5rcywgYnV0IEknZCBsaWtlIHRvIGtlZXAgYSAibmVl
ZHMgdHdvIHRlYW0gbWVtYmVycyBhY2siIHBvbGljeS4gSSANCmRvbid0IHRoaW5nIHdlIG5l
ZWQgc2lnbmVkLW9mZiBhbmQgcmV2aWV3LWJ5IHN0dWZmLCBidXQgd2UgZGVmaW5pdGVseSAN
Cm5lZWQgbW9yZSB0aGVuIHR3byBleWVzIG9uIGNoYW5nZXMuIDopDQoNClRoYW5rcyENCi1z
bG93DQoNCg0KDQo=

--------------WuYn2S1tDFxXKupLohsiQkZc--

--------------GSBVaZzvxrP7ZzEqyp0dNBn7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmUxZvMFAwAAAAAACgkQqh6bcSY5nkZ/
qRAAtyH9DJoQ3nKdeBoiitgcrdkzFVa/M5Q2HAKw5WD7CvRO7lhoSTVbwdsTVn8suu/ZnjG0W+bn
dAylz0dfdib6NyeIwZWXVUJELVAUkujZ6+Go5wLPoig72g38LbEYK85GYHU0jxLx+GxNqLnZVpXo
MNR8Uds/RFefT3SukOWn/yZlyMrjvMhjTZT1bZQhyg1H88A+gmktseoFAhxnigIzvgfGrfSbvWfL
3cx32paDprLKB3n2dKKIDfHSuJY0qMC3vWOPUgx3P3pvFzvx6bylwE+9SL5ST5KVia/j+jXOBHoq
+DZWCjAvGygfpksRmfnqkUxjRw6/ZOqAcM4im7HNKTLikExX7R7gYbl7skrzp61N3MeyXZ1bP9UI
7ygpeBdTFUOGtRrybeP2L9Z3ezCfVy2PZvQzWlKrCPA9K/y6DGIvY9N92eU69gxU7Jx7NN4vwLRS
TVAVSPPMCoXJGYkxfxTRBNmnhbPnkHnfU1TqHqEWK0RYfWGfGQNahuFA8swfaC4k5yH6FcFfaU6V
odUWWbyfuqTzh3hpkvODlsshSoRKkovELyFeUTMecGXd6y2RKvgeE8aaps1xFxBESygaPQs5yDSM
8IsA8zyZ25B7ML82K2/Caw/OsVPdeAMTlMPx32FlyacdXlMT7JDTsBWv2BptTK/tbQ+zL3kA5k22
r7w=
=4dms
-----END PGP SIGNATURE-----

--------------GSBVaZzvxrP7ZzEqyp0dNBn7--

