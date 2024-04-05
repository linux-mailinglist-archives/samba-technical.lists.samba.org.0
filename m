Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B68994D9
	for <lists+samba-technical@lfdr.de>; Fri,  5 Apr 2024 07:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nYg1UoZwrVuCtdzzBWhufU5B3raca01Wt3IPExmvCXs=; b=DoxwxiGeTM2jOZlNoiiu2qe7ZK
	VhpAPU5ehuZep45S9o7g4+/ShrVQmmkD6Eydfxx9yIs2bey+qJQY0/VjS6E9YTl2/4iDpI5OUahPD
	LRyF0kA8OWnEENoi4Ao0U5XQKZDb3+1QQndcIeoGReHmjtZzIkPPY4Jf0cV1VBukol4WoaAjWyF2D
	BPU4qrVS+PFWHn67Gt+5A/i7crQpYMWo+nL+TKj/AOtcnfXafb0LynC101zpDSDEyHGIYO+h6v3P3
	3n3r6hxQBU21dZRH+zi5be4VjOzKDUXE4m2DNjZDhrFGsnYQU+gGBYDP6Gmhcvrt31pS+v2y9Zsax
	yC7DLpRg==;
Received: from ip6-localhost ([::1]:42106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rscZx-003wyL-Ed; Fri, 05 Apr 2024 05:57:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11786) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rscZt-003wyE-Mq
 for samba-technical@lists.samba.org; Fri, 05 Apr 2024 05:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=nYg1UoZwrVuCtdzzBWhufU5B3raca01Wt3IPExmvCXs=; b=MAgmawktORfQhEO6yHfVHlqQVN
 auUlcWL1lNWPEu0mxi7XGLpMn6U9S3afCTQTwbEl8YoP1H3rIdkGe/OU/sJ/jHWiUIAjZ/Dps7lOh
 fwZbD9AjYSZQSltAamYgzbgmREkR+xwL3zrPp8D1NW45FTXYUp27fWf1b4oJ8uu8yG6VYpIzklb7y
 pCJmzxjG0DW2sS4PKeoXsE9FNk1IuKxFSXTY0zjsrGDfT7SJNr3AWxHvbZU0pJR0rPxiraavq5Lru
 on3i4tQoTbYGgcchjbcihjEmYajGiPVq8AQNSV3DHy7fH/Uywylg1BwhuyCzOJ4Cj4KSU9vzKqq6v
 cr5vDU2t5fAcXznLGrS+n57yUkrtEzc2rIpSEnppXYRFKzZbWRvWGRFYyS0JksP7YEsBms0jcFSkf
 1b80wKkobVMZSwEeMrX/++bfghNb3GRdFvfwhzZisLuaLPfdJHA3/TuNwaXT3Un1yiyWi6QYK4Rkn
 D9RA0Mm8/8uqHBLmeQHOl5N6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rscZt-004phW-0A; Fri, 05 Apr 2024 05:57:29 +0000
Message-ID: <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
Date: Fri, 5 Apr 2024 07:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Simplify copy-reflink code
To: David Disseldorp <ddiss@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
 <20240405162145.40ac3bc4@echidna>
Content-Language: en-US, de-DE
In-Reply-To: <20240405162145.40ac3bc4@echidna>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0z0pUNejMSgp6j6vxYLYD20G"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0z0pUNejMSgp6j6vxYLYD20G
Content-Type: multipart/mixed; boundary="------------b4OfDOYRWcddw69dbdv0IOoZ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <b0967fbb-0805-4021-96cf-0735c3c1b5c1@samba.org>
Subject: Re: Simplify copy-reflink code
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
 <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
 <20240404125840.230c5d67@echidna>
 <b5f914db-41b9-4e76-89a8-fb5dc45e28f8@samba.org>
 <20240405162145.40ac3bc4@echidna>
In-Reply-To: <20240405162145.40ac3bc4@echidna>

--------------b4OfDOYRWcddw69dbdv0IOoZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCnRoYW5rcyBhZ2FpbiBmb3IgdGFraW5nIGEgbG9vayENCg0KT24gNC81
LzI0IDA3OjIxLCBEYXZpZCBEaXNzZWxkb3JwIHdyb3RlOg0KPiBJIGRvbid0IHRoaW5rIGR1
cC1leHRlbnRzIHNob3VsZCBmYWxsYmFjayB0byBjb3B5OyB3aXRoIHRoZSBpbml0aWFsDQo+
IGltcGxlbWVudGF0aW9uIHdlIGhhZCBWRlNfQ09QWV9DSFVOS19GTF9NVVNUX0NMT05FIHRv
IG1ha2UgdGhpcw0KPiBleHBsaWNpdC4gSG93ZXZlciwgdGhlIE1TLUZTQ0Mgc3BlYyBkb2Vz
bid0IGFwcGVhciB0byBzdGF0ZSB0aGF0IGNsb25pbmcNCj4gaXMgYSBoYXJkIHJlcXVpcmVt
ZW50LCBvbmx5IHRoYXQgaXQgc2hvdWxkIGJlIHN1cHBvcnRlZCBhbG9uZ3NpZGUNCj4gRklM
RV9TVVBQT1JUU19CTE9DS19SRUZDT1VOVElORyBhbmQgdGhhdCBvZmZzZXRzK2xlbmd0aHMg
bmVlZCB0byBiZQ0KPiAibG9naWNhbCBjbHVzdGVyIGJvdW5kYXJ5IiBhbGlnbmVkLg0KDQpN
Uy1GU0EgMi4xLjUuOS40IEZTQ1RMX0RVUExJQ0FURV9FWFRFTlRTX1RPX0ZJTEUgbWFrZXMg
aXQgcHJldHR5IGNsZWFyIA0Kd2hhdCBzaG91bGQgYmUgZG9uZSBhbmQgdGhhdCBhIGZhbGxi
YWNrIHRvIGRhdGEgY29weSBpcyBub3QgaW4gc2NvcGUuDQoNCj4gV2UgcHJvYmFibHkgbmVl
ZCB0byBkbyBzb21lIHRlc3RpbmcgYWdhaW5zdCBtb2Rlcm4gUmVGUyB0byBjaGVjayBzb21l
IG9mDQo+IHRoZXNlIHF1ZXN0aW9ucy4NCg0KDQpJJ20gd29ya2luZyB3aXRoIGEgY3VzdG9t
ZXIgd2hvIGlzIHRlc3Rpbmcgd2l0aCBhIFdpbmRvd3Mgc2VydmVyIHdpdGggDQpSZUZTIHdo
ZXJlIGhlIHVzZXMgYSB0ZXN0aW5nIHByb2dyYW0gWzFdIHJ1bm5pbmcgb24gdGhlIGNsaWVu
dCB0aGF0IA0KYWxsb3dzIG1hbnVhbCBjb250cm9sIG92ZXIgdGhlIG9wZXJhdGlvbiBhbmQg
cmVzdWx0cyBjb25maXJtIHRoZSBzcGVjOiANCm5vIGZhbGxiYWNrLCBmYWlsdXJlIG9uIG5v
biBhbGlnbmVkIElPIHJlcXVlc3QuDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vdGRld2lu
L3JlZnMtZmNsb25lDQoNClRoYW5rcyENCi1zbG93DQo=

--------------b4OfDOYRWcddw69dbdv0IOoZ--

--------------0z0pUNejMSgp6j6vxYLYD20G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYPksgFAwAAAAAACgkQqh6bcSY5nkZG
5BAAu7A2tgi4+jQVGgPWHZ8J0fU5K/fowriTYLi/NiUxN/PPR0DLeVD/5JdZxPbVyHkAmArgrJsX
rhbvbrBKDSQDKSxmlHvYOc1t3ZQBbw48r0ops6T1qbzieCR6xxr/bGAne42Fsk/TyBpPv+7REkKH
Fx6pBMQ4G0o6XcNhqZ/bq2lAsKrzvoonNZ/wTvmsoJFiKdxw48bwyPrUwdkToQzcFOCErw4ggd/F
Fk7VYnjmMmoEb/KaeOF3VStP0Pm1D8mxLKE74VpOSC4E5GlywpDvFZDwR4B8wUUzJaaFLixHwPHZ
ReJLovf12V4kQEjM2G8OjCDDinYBFnmTphW3OLkXd00G8hVk8oLvuzvBx6KKOphRjXcyxGiOJr5W
0CtmcNyvcs7CD3cRvTFM9inRBNJst3jkTTDLd+zmXpGic0SkJCjMEqE3TpbhgAq+j9BAzHrtOT9Q
SiPUa5pVJ4YFjsdr9q/TIXjVv5ngiEmAI1QT7b1eUacMtIAhtX7L8VkNt87+7P/bzyRLdRmIzRrD
wPrds+OUGgOfBoHk/59l+KNfuXfuHqYkm8p9vF9DMTEan3A1OiMg9WeceE42PsdjxcyKHjz73QIP
OW1GS6qhJpdHQaMFFb8U/zLjJ4Gw/y1Li+NGkXxUVagiNaRWOygj9TMP133oYfDgzEWeSiLUmtSI
R80=
=dtMN
-----END PGP SIGNATURE-----

--------------0z0pUNejMSgp6j6vxYLYD20G--

