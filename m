Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEA898C78
	for <lists+samba-technical@lfdr.de>; Thu,  4 Apr 2024 18:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GKe4TbHaFkrhkd8fngKmLpFXroA4XkE7iNIAvqEzJ2o=; b=WBYNL5n90lEUaQIbWFP4XsjkrB
	n8fvyNyjugCJCataZgdoeKtjD+Wuc7YZbQ18hWYmQJiWN+3jeDxiilie3lCXgLeyRVkQn/hkyd27C
	6cSsVOD6MQ4xXR8PSEoa9wVW1HAPsvDZOHxs5NxAq+1CojoNKlMYJa6AAsUOACOh9puOMdlZydOxu
	aNZcx2Bd09ZtQii20P5lSxLcUSjS0d7JOpkU0l0I1vxmvMz877kaqxbiM/reAwpBb37GkFVW4qCJR
	BTHu87WGNva88PM5Pmtho2eae961n8Nop3R0S+UYxQoOSaOJLI61ayhNUxyXMZDpopHciT7bhHVlu
	iTDo7BMA==;
Received: from ip6-localhost ([::1]:22092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rsQED-003vJo-Uz; Thu, 04 Apr 2024 16:46:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50990) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsQE9-003vJh-Ia
 for samba-technical@lists.samba.org; Thu, 04 Apr 2024 16:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=GKe4TbHaFkrhkd8fngKmLpFXroA4XkE7iNIAvqEzJ2o=; b=0EufCmbqMOU4FXZJ/86OCGlIQB
 EM4z5VaG9P6TxbCNhd926AKBxQ7yW3SmZLxX1CwekfXoBwVejzvunGdP5yt9uDbRX+Cpc4TEClJuG
 QmZfLc14KvmFXEHxXDrJ/xU/TtMtDrUMVdCagyUlbY6nqf2hhnNOHvqaRJFNKc2wQW4m8vD+ptL6a
 /3tpEL3BPC0oo+vj8+6TyJ/bvbCTGYRThl9xVFkw/HNl+79qSWRtCyEZzpKlPgolotEqQKRmErkqQ
 TCo9gMLxYS9/Fkn4XMhrerFYBnUG5pKjoNWAtuKcTH+8ZnzSJb6g04ETtMr5VORJ4QSj340QToGex
 nte7z99xwnLPASV6wdha4ZYZnhq/62qdpa9YxDIpfkWJmGaIHP8xqgWuvQZ/PMQO30r8+atS+bJ7T
 DR5pE6xqHHbtsn/j1hhI2NgHSpU1bhWjGoroYBlVDjTXsQdnBoHitwORFIiuhtrTwLoFZNzNpNpHY
 j3Nczb34YLlO/6gM+mxRyqgF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rsQE8-004jRg-22; Thu, 04 Apr 2024 16:46:12 +0000
Message-ID: <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
Date: Thu, 4 Apr 2024 18:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Simplify copy-reflink code
To: David Disseldorp <ddiss@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
Content-Language: en-US, de-DE
In-Reply-To: <20240404125840.230c5d67@echidna>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oX6dWXLqUXpbbOkjJ28xaKee"
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
--------------oX6dWXLqUXpbbOkjJ28xaKee
Content-Type: multipart/mixed; boundary="------------UeDJg0Ra0WrUXzYuMOazHi3w";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
Subject: Re: Simplify copy-reflink code
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
In-Reply-To: <20240404125840.230c5d67@echidna>

--------------UeDJg0Ra0WrUXzYuMOazHi3w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC80LzI0IDAzOjU4LCBEYXZpZCBEaXNzZWxkb3JwIHdyb3RlOg0KPiBJIGhhZCBhIHF1
aWNrIHBsYXkgd2l0aCB5b3VyIGNoYW5nZXMuIEJUUkZTX0lPQ19DTE9ORV9SQU5HRSBmYWxs
YmFjayBpcw0KPiB0cmlnZ2VyZWQgYnkgdGhlIGV4aXN0aW5nIHNtYjIuaW9jdGwuY29weV9j
aHVua190aW55IHRlc3QuIHN0cmFjZQ0KPiBpbmRpY2F0ZXMgdGhhdCBpdCdzIGRvaW5nIHRo
ZSByaWdodCB0aGluZyBvbiB0aGUgc3lzY2FsbCBzaWRlIGJlZm9yZSBhbmQNCj4gYWZ0ZXIg
eW91ciA0OGQ4YjljN2FkNSAoInZmc19idHJmczogZml4IEJUUkZTX0lPQ19DTE9ORV9SQU5H
RSBmYWxsYmFjayIpDQo+IGNoYW5nZSAod2l0aCByZXQgPSAtMSByZXZlcnRlZCBiYWNrIHRv
IHJldCA9IGlvY3RsLi4uKToNCj4gICAgaW9jdGwoMzAsIEJUUkZTX0lPQ19DTE9ORV9SQU5H
RSAsIHtzcmNfZmQ9MjgsIHNyY19vZmZzZXQ9MCwgc3JjX2xlbmd0aD00OCwgZGVzdF9vZmZz
ZXQ9MH0pID0gLTEgRUlOVkFMDQo+ICAgIC4uLg0KPiAgICBjb3B5X2ZpbGVfcmFuZ2UoMjgs
IFswXSwgMzAsIFswXSwgNDgsIDApID0gNDgNCg0Kb2gsIHllcywgc3VyZSwgdGhlIGZhbGxi
YWNrIGZvciBhIGNvcHktY2h1bmsgcmVxdWVzdCB3aWxsIHdvcmssIGJlY2F1c2UgDQp0aGF0
IGdvZXMgdmlhIFZGU19ORVhUIGluIHRoZSBSRUFEX1NFTkQgZnVuY3Rpb24sIHNvIHZmc19k
ZWZhdWx0IGtub3duIA0KYWJvdXQgdGhlIHRva2VuLg0KDQpXaGF0IHdpbGwgbm90IHdvcmsg
aXMgdGhlIGZhbGxiYWNrIGZvciBhbiBEVVBfRVhURU5UUyBpb2N0bC4gSWYgeW91IGVnIA0K
bW9kaWZ5IHRoZSB0ZXN0IHNtYjIuaW9jdGwuZHVwX2V4dGVudHNfc2ltcGxlIHRvIHVzZSBh
IGxlbmdodCBvZiBlZyAxIA0KYnl0ZXMsIHRoZSBpb2N0bCB3aWxsIGZhaWwgYW5kIHRoZW4g
Y2FsbHMgDQpTTUJfVkZTX05FWFRfT0ZGTE9BRF9XUklURV9TRU5EKCkgd2hpY2ggd2lsbCB0
aGVuIGZhaWwgaW4gdmZzX2RlZmF1bHQgYXMgDQp0aGF0IGRvZXNuJ3Qga25vdyBhYm91dCB0
aGUgdG9rZW4sIGJlY2F1c2UgaW4gUkVBRF9TRU5EIGluIHZmc19idHJmcyB3ZSANCmNyZWF0
ZSB0aGUgdG9rZW4vZnNwIGFzc29jaWF0aW9uIHZpYSB0aGUgZGIgb3Vyc2VsdmVzIGZvciB0
aGUgDQpEVVBfRVhURU5UUyBjYXNlLg0KDQpOb3cgdGhlIGludGVyZXN0aW5nIHF1ZXN0aW9u
IGlzIHdoZXRoZXIgdGhlIGZhbGxiYWNrIHRvIG5vcm1hbCBkYXRhIGNvcHkgDQppcyBhY3R1
YWxseSBjb3JyZWN0IGlmIHRoZSBjbGllbnQgZXhwbGljaXRseSByZXF1ZXN0cyBEVVBfRVhU
RU5UUy4gDQpBZmFpY3QgaXQgaXMgY2xlYXJseSBub3QgY29ycmVjdCBhbmQgbXkgY2hhbmdl
IHRvIGNvbnNvbGlkYXRlIA0KRFVQX0VYVEVOVFMgaW1wbGVtZW50YXRpb24gaW4gdmZzX2Rl
ZmF1bHQgYWN0dWFsbHkgZG9lc24ndCBoYXZlIGEgDQpmYWxsYmFjayBpZiBhbiBTTUIyIGxl
dmVsIERVUF9FWFRFTlRTIGZhaWxzIGluIHRoZSBpb2N0bCgpLg0KDQpCdXQgYXMgdGhlIGN1
cnJlbnQgY29kZSBoYWQgdGhpcyBiZWhhdmlvdXIgdW50aWwgSSBicm9rZSBpdCB3aXRoIA0K
YWY2Y2JjN2E0NDFlMDVmNzFhZTRlOTdjN2Q4MmMyNzg2ODYzM2U1MyBhbmQgZnJpZW5kcywg
SSB3YW50ZWQgdG8gYnJpbmcgDQp0aGlzIHRvIHlvdXIgYXR0ZW50aW9uIGFuZCBnZXQgeW91
ciBmZWVkYmFjayBiZWZvcmUgcHJvY2VlZGluZy4gOikNCg0KLXNsb3cNCg==

--------------UeDJg0Ra0WrUXzYuMOazHi3w--

--------------oX6dWXLqUXpbbOkjJ28xaKee
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYO2VQFAwAAAAAACgkQqh6bcSY5nkZQ
vRAAhsp2i+Z8SOn+tOORLZ9M41AlsZYKozWbb0RdrjudkkOISM8j7Rq/iLAt0LlfXs6W+7z6nKGg
D2/bgksvos/mxir7C0fOPLXuj40c0km3qqlbHOpCP18CsS2HKUR5jjXqzWOebcBkFl8M1V43Zeu7
EAOt6jVcrV8i0W6VIxBae6qQMrto+Mo+c5LBGs8ElXooYHChMP8Y7ogre8M5rTeO64bnua5ggip5
Q4XAByd/ISL2QhFHGJEVUIbjnIb5xTDCqxjn1rk2DMGZpnmTOKqVya3eJWPegpyycJwtaUXryOGZ
cKbp4qCdm/qFxuRLfXNgIplBWrwXcLEnt6BYitIsip1cTGojS1mN0O7xVWw8WE+wnVIHOxr97Den
4UW0r+1XAEdvqjZ6pS1LlIIMpRoF2zrsGo74VeWduaHejpQQtgoeNUFNEr/TXTUft+xH4FPLFkA8
5WfLL+SqWIaIPMMnDdhQglB54UpL/se/Py1+6e0scK36fh48eTUzuPX9Jy9XnqkeLZ6GfUFDDpmJ
5LhTW8Xb4PJtVHsD37xk64vOl9XMLvr/LmM1kpfxHCyvynreHWp/2j0yFt1teOkS8DvFYHTIRZz6
vj8VxBW87ib1fRwStnEYIJRa51N0SokmC9De036Mmf0z2wcFhu0zutOWU3eMGJZPcdDY0sPISwjJ
JxI=
=239h
-----END PGP SIGNATURE-----

--------------oX6dWXLqUXpbbOkjJ28xaKee--

