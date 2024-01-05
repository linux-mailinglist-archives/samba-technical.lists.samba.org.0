Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD828256C6
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 16:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ozCZ2U4ukwkSxFk7IeJWkrbQwjWr0eH1KswzVusrmTQ=; b=5unwqh7OiK+ifM6pbm+LIZUlRK
	MbIVg0oyFQJPwwJmGLcvbiQpBTD/nJMtP04exolu5mHhWQSYQ3wwzElrtlqADYlDlLNpwMassbPpf
	9/e82q4NAWCvbyrp8Z/giwLLowZe9Nd/ac40NjEXA8bSVZh+eVOouDJ7x1svbyKZ+LZZrrT1CaEcH
	+8B4RxVioXZ+b2xp1JKEGR8Yp43/cZaDDfztrjcnqCBwPuLcWYFxSQNKUW/0UkwPmKvAdCBAoN1Sz
	RnBWAaa1vMwIM56UoxDXV1Wm4DadOSUviSmA2NnmovjTDn6UMYxPHMMo50izZ9VPTFkkEYLN+iGXl
	ZkLs7t1g==;
Received: from ip6-localhost ([::1]:32240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLmFB-002Wla-KK; Fri, 05 Jan 2024 15:36:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26744) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLmF6-002WlO-7U
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 15:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ozCZ2U4ukwkSxFk7IeJWkrbQwjWr0eH1KswzVusrmTQ=; b=KsqqVIgoIva1pvfuJhdJoCFS90
 OtW1IbRDOxt2R3du5tXWY8qVcKfjDmUct4oQmBGFX1KQWxVF1938z1Bc0r0CHDjXw/EJxIBQHmIRd
 wyqV21T65vreX+sFk/UCNAXyHj3B0LhnSCkdhL0XguVAtlBUfb+TCx/6gGIGagISFObCHC2jCrq1P
 frhcKICw29xQlNc82yZyrCy1pln8hHPx20lih30k5a4PetYzXzxWogmWEShkWJIrYgfFLafIzhOo/
 /f94V7txuhh8QxO7wRMnkbldy4kPcteKqPxZRQhsKPu6PwzIe1C/flnuAdEHKr/+IzzlXIZLJmrwQ
 jdpMcNi1nUtTiDZcUOfPMVnw+UyHmxS3nZUz6pYr+88qPbQYX/F2Y/NXsZQnHxER5HjSmOaTTUsSN
 8+789HeC4YcQTl/3k4a0AK/BLokpoesEG56LBwzWS04uuTjIvOUl6GMOK8060HaUHxFWPGO7cQ5tU
 2+JNKlE5DambEN7/5c/bmFc/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLmF4-006d5F-2W; Fri, 05 Jan 2024 15:36:14 +0000
Message-ID: <9872c173-8fcc-4ea4-bddb-c734c10d0334@samba.org>
Date: Fri, 5 Jan 2024 16:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CTDB and per record persistency
Content-Language: en-US, de-DE
To: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ThXf7cnZ4mxOhsl2GPKE1ptL"
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
--------------ThXf7cnZ4mxOhsl2GPKE1ptL
Content-Type: multipart/mixed; boundary="------------30ja0oqPdiI2R0w3reni1jDH";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <9872c173-8fcc-4ea4-bddb-c734c10d0334@samba.org>
Subject: Re: CTDB and per record persistency
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>

--------------30ja0oqPdiI2R0w3reni1jDH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMjcvMjMgMDg6NDAsIOmZiCDmlrnov5sgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90
ZToNCj4gSGVsbG8gLCBJIGxlYXJuZWQgZnJvbSBSYWxwaCBCw7ZobWUncyBzcGVlY2ggb24g
cGVyc2lzdGVudCBoYW5kbGVzIGF0IA0KPiB0aGUgMjAxOCBTYW1iYVhQIGNvbmZlcmVuY2Ug
dGhhdCBhbWl0YXkgaGFkIHByb3Bvc2VkIGFuIGlkZWEgDQo+IHJlZ2FyZGluZyB0aGUgcGVy
c2lzdGVuY2Ugb2YgZWFjaCByZWNvcmQgaW4gQ1REQi4gSSdtIGN1cmlvdXMgdG8NCj4ga25v
dyBpZiB0aGVyZSBoYXMgYmVlbiBhbnkgcHJvZ3Jlc3Mgc2luY2UgdGhlbi4NCg0Kbm8sIHVu
Zm9ydHVuYXRlbHkgbm90LiBJdCdzIHNldmVyYWwgbW9udGhzIG9mIHdvcmsuIEkgaGF2ZW4n
dCBiZWVuDQphYmxlIHRvIGNvbnRpbnVlIHdvcmtpbmcgb24gdGhpcyBpbiBteSBzcGFyZSB0
aW1lIGFuZCBzbyBmYXIgdGhlcmUncyANCmFsc28gbm8gcmVhbCBpbnRlcmVzdCBpbiB0aGUg
aW5kdXN0cnkgdG8gZnVuZCBkZXZlbG9wbWVudCBvZiB0aGlzIA0KZmVhdHVyZSBpbiBTYW1i
YS4NCg0KTXkgUGVyc2lzdGVudCBIYW5kbGVzIFdJUCBjb2RlIGRvZXMgc29tZSBjbGV2ZXIg
dHJpY2tzIHRvIGNvbWJpbmUgDQpleGlzdGluZyBjdGRiIHNlbWFudGljcyB0byBwcm92aWRl
IHBlciByZWNvcmQgcGVyc2lzdGVuY3kuIFNvIHRoZSByZWFsIA0KcHJvYmxlbSBpcyBub3Qg
cmVhbGx5IGF0IHRoZSBDVERCIGxheWVyLCBpdCdzIG1vcmUgYXQgaW1wbGVtZXRpbmcgDQpl
dmVyeXRoaW5nIDEwMCUgc2FmZSBhbmQgY29ycmVjdCBpbiB0aGUgU01CIHNlcnZlciB3aXRo
IHRlc3RzLg0KDQotc2xvdw0KDQotLSANClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICAg
aHR0cHM6Ly9zYW1iYS5wbHVzLw0KU2FtYmEgVGVhbSBNZW1iZXIgICAgICAgICAgICAgaHR0
cHM6Ly9zYW1iYS5vcmcvDQpTQU1CQSsgcGFja2FnZXMgICAgICAgICAgICAgIGh0dHBzOi8v
c2FtYmEucGx1cy8NClNlck5ldCBTYW1iYSBTdXBwb3J0LCBDb25zdWx0aW5nIGFuZCBEZXZl
bG9wbWVudA0K

--------------30ja0oqPdiI2R0w3reni1jDH--

--------------ThXf7cnZ4mxOhsl2GPKE1ptL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmWYIe4FAwAAAAAACgkQqh6bcSY5nkZI
5Q/9Fc1I7JkBPR6qn1Zdh+CN7LbCvg05XszXMVOCMCm1vvMm950inQ/x5MLeNLMqxLY/e6so1QWx
SX45gqoBGdKidMp66onmZeudDo6AdoLGTzO3GfU4c5HmkWWa7rBu/fRARcl0HxoQ0ZKnGdpHJyFT
hYPhM5xlaa4zSogYbkFm2pcF6BQa63G1jHcHfh9mWd5OAhKTbAFPjHiipBIvJX15IBokSnQVlp9Q
igOdMUbHTxy3UjaafKWq5Ee2A9SEo7G8mOIqySBwwZ0IrQJOpus8OPr+mB69ybnjF5ICY9SgG8fe
FszX7f8FxwD4O68dSdUUs/l+FTHmEZmlM57uTgMsFXD8ap6rgwKSKKdqAzaduxLWGjD8Cc3935DK
ihX+oCEv4nvDBjIdMTBqke80aGVgXu7kEB4lqSyVCPolYV/+LM+AqxrUSkFHw7hGkqdyT10TYAEO
JQuUtcfhZUqsHFnziMa/GgTNTnNLpMNdtr/krNGaFVje7ktJlCagbBo5pKZh6iuc9yF4mEDyLSEH
pF3F6JF+97vpGJtc7vjJG2ydHht+Mj3E9VkGIbMr/kKV7ujsbMErzYFe24o0kKjjFZmMx05GMJ+e
axPu1sgTdUrM0nU1AmuK6yTEhM1zNXFWy0yNXB4yup/zOwxX6ao9Ot6u7l6OHKQh5E7ASundSMdl
hPU=
=uKcv
-----END PGP SIGNATURE-----

--------------ThXf7cnZ4mxOhsl2GPKE1ptL--

