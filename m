Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7DB5EF516
	for <lists+samba-technical@lfdr.de>; Thu, 29 Sep 2022 14:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fHAzdV9Nm2Ba7r3AwMwXbOx3mytGZ/9ChoJLVQnCqFo=; b=6KcZ+wdYWK80mbqNB9wZF3I00x
	FpzFJCd6uZPy+412I+qWJuqWEJ9AE5L1sRy+FNiU0gN94aBErHOtPCuoOZxX6O1HiwJJDtPo5GLjG
	JeT2IifJIVG8gtz4PEIPxS1hHTO7p7+9gHbWi07Oc0/2r03ay1JpIEz9vZD7gTkMAzVsSXcNb8QV4
	5kjspo2ZcTyAzbcV2iGYn+l7vbrbu2daduMqoDbEIXE1fkacovnKjz0vV2c3Fss+AsEV4Lsz7K7sI
	aLuw0VZSSH0KHpKcm4AoPiXDj0LTpf9Tp0J5Eu9/1fQ/MZ7PJzCAcXCZ4bdeN99TRMfszsEQvOz5h
	ETSW05AA==;
Received: from ip6-localhost ([::1]:36276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odsUP-004qyr-7E; Thu, 29 Sep 2022 12:18:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10650) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odsUK-004qyi-J5
 for samba-technical@lists.samba.org; Thu, 29 Sep 2022 12:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=fHAzdV9Nm2Ba7r3AwMwXbOx3mytGZ/9ChoJLVQnCqFo=; b=jsbA/Ah6oYjG3nncfIEIb8qVNP
 CZs5hlX7ASSibJLtvzyom7Mn3R8fdsohRToj58E2WQ4YgpPjE5zjHB/HUNFQMewXZeRkFa0jj0iU1
 uoCnxkvfDeTefKGKqXcjlKxtnIgX24RpX6YCq7K/vzcEj7bxiysIYoqNWwj5jbp7PBZYaxArYsz+I
 vS1wIU8IAcDuAADMdVawoQR4+ySwsvbneT023ltLzgTsT+cH56zMv6WZId5SzPczEkNOdE9Tn/Yrr
 hPKwUjQfumWXGzje/ir2DCulp/nd5c88U9w+gE5QR24Ied2x3Kn4HvB/5sHi6WCI0UhwRIAvn/CLW
 Lp9MHWNQAR+Y9lUJtHRHXd0nDPHlbWU3Zm9HXtt39Uu9SOH3Stg3OQTZG9EdXBJRSiutRgFctnLv5
 mpO3MI/ItkFlYyHwYAiLIIu0XgzOPV5yZjowXliF/d0l3EtlRgS39JFaDsfqMITrOfXtsVXcriAM2
 2BkHVrXBp0WpUesPKPZDMPgy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odsUI-002MN5-KY; Thu, 29 Sep 2022 12:17:58 +0000
Message-ID: <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
Date: Thu, 29 Sep 2022 14:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Content-Language: en-US
To: Daniel Kobras <kobras@puzzle-itc.de>, Jeremy Allison <jra@samba.org>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
In-Reply-To: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HIMhBrY0ItYhaFPw8cHNRuyW"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HIMhBrY0ItYhaFPw8cHNRuyW
Content-Type: multipart/mixed; boundary="------------e4PO84ywZHRW0RDU4ALxYyaO";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Daniel Kobras <kobras@puzzle-itc.de>, Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
In-Reply-To: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>

--------------e4PO84ywZHRW0RDU4ALxYyaO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yNy8yMiAxMzoxMCwgRGFuaWVsIEtvYnJhcyB2aWEgc2FtYmEtdGVjaG5pY2FsIHdy
b3RlOg0KPiBUaGUgaXNzdWVzIGNhbiBiZSBhdm9pZGVkIHdpdGggYSBjb25zaXN0ZW50IG1h
cHBpbmcgYmV0d2VlbiBXaW5kb3dzIEVBcw0KPiBhbmQgdGhlICd1c2VyJyBuYW1lc3BhY2Ug
aW4gYm90aCBkaXJlY3Rpb25zLCBpZS4gbm8gbG9uZ2VyIHByZXNlbnQgRUFzDQo+IG91dHNp
ZGUgb2YgJ3VzZXInIGFzIFdpbmRvd3MgRUFzIGluIFNNQl9JTkZPX1FVRVJZX0FMTF9FQVMg
YW5kIGZyaWVuZHMuDQo+IERvIHlvdSBhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2g/IEFyZSB0
aGVyZSBhcHBsaWNhdGlvbnMgdGhhdCByZWx5IG9uDQo+IHRoZSBjdXJyZW50IG1hcHBpbmcg
b2Ygbm9uLXVzZXIgRUFzPyBQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBzaG91bGQNCj4gc3Vi
bWl0IHRoZSBwYXRjaCBhcyBhIHByb3BlciBNUi4NCmJlZm9yZSBqdW1waW5nIHRvIGFjdGlv
biBjYW4gd2UgYWxzbyBwbGVhc2UgYnJpZWZseSBjb25zaWRlciB0aGUgTGludXggDQprZXJu
ZWwgbW91bnQgY2FzZSB3aXRoIFNNQjMgVW5peCBFeHRlbnNpb25zIGFuZCBtb3VudCBvdmVy
IFNNQj8NCg0KVGhlIHByb3Bvc2VkIGFwcHJvYWNoIG1ha2VzIHNlbnNlIGZvciBXaW5kb3dz
IGNsaWVudHMsIG1heWJlIGJlIHNob3VsZCANCmluY29ycG9yYXRlIGV4cG9zaW5nIHRoZSBy
YXcgbmFtZXNwYWNlIHdoZW4gVU5JWCBleHRlbnNpb25zIGFyZSANCm5lZ290aWF0ZWQuIElu
IHRoZSBlbmQgdGhpcyBpcyBsaWtlbHkgZ29pbmcgdG8gYmUgYSBtYWRlIHZpYSBhIGxhdGVy
IE1SIA0KaW4gdGhlIGZ1dHVyZSwgYnV0IEknZCBsaWtlIHRvIHNlZSBib3RoIGNhc2VzIGNv
bnNpZGVyZWQgbm93IHRoYXQgd2UncmUgDQptYWtpbmcgY2hhbmdlcy4NCg0KVGhhbmtzIQ0K
LXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAg
IGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBz
Oi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg0K

--------------e4PO84ywZHRW0RDU4ALxYyaO--

--------------HIMhBrY0ItYhaFPw8cHNRuyW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmM1jPUFAwAAAAAACgkQqh6bcSY5nkaT
Eg//cRb/at4Vgwdi+GorqQNdo0T4E4LDTNaabWyq9+rG+Uo0FpNdRVfKXJj6aC7JyTAPOrut/i/C
+Z3wc1IuqXIeS/MbIfYQzjiUO4p1QxV5CTIS/T+IIqBgQpqCsOOerQadNslI1hMgCTZ6F+dWxnqc
FzOuFewGEBeTKIG60vo8q0gr+hbOOt4+zp2RI606D+FeR1EV+43KfpMZKmYbypTX7BaQBq+ZbUmh
6xJv7T2lF2zsGcrflWuXjJWK09h7ky6WW0p83AM75C/FnE5Xrfh4xM10Ss1/EBMvinZbntz73uDK
xKGVqjzKx2kKyYQ2edbOpRFhg4TZ4IOLZ+95GQFPXoDw4hICOO5mCw3m2Qbh1SLO2FI8CB6aGVM/
qLTnpahB0YyySPd2q2crMyv5fW7paFhNs+LmDuiKIuVSviD+VAAmVekOnLrfq7f44DfeoXrsHi3m
EXcXlDg81qtXPLNsF4Cdp8+gt88rwiUgcdz5CRMPK7ueKHmNGgEaAa5KWCZxLdIhB2DI+gNfn9Gn
1mBVuK3H8Z5g2C7+cB3ZoscA3alsOZmGIggJJ+cqL0FYzRcx9cBjtYhtcWlAerDEU3rxJ2wfmMwW
H7Gf4Xl0vW0MEQ2bPPzxmuW36nXKxxvS2Lty+f+FiGQjKKRbr5MonctqmLAfWqa2qEsS5NJGebRK
/oo=
=3LOI
-----END PGP SIGNATURE-----

--------------HIMhBrY0ItYhaFPw8cHNRuyW--

