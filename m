Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C88955AF
	for <lists+samba-technical@lfdr.de>; Tue,  2 Apr 2024 15:45:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MF2zL9JEQx5TTorHWP5H4onNcOrsRi46rdJxOwpDL6M=; b=BtKGjOwuxVEulHaQdMxtBdfD9c
	qxkJ02Ha78VeNHSVEz1z0SEaM+PaeUVwhTUR8EKU2G4XqkMkRqZ6M7LnWR1Nmerxtku9g6ZWbVpR2
	KaIFeLKjlkWBQNS4Qf0Myc2IPEBamRyxSqmPKRA7FEhexYQ9Krb/sZNZ4p2+EGYoSVeHyFVLQYLQP
	1sKCLqi1rKD+bDFonWk+UzoOGM4o0KwXACVGDS37cYE5VImAP2pbJxC9uZxfeGVR6uuRGYecA7XSb
	Nn+eyVNY2uPSNkKjOnL632oiNTfbHR4vC9AImMZmyL+6bz3uCwzbvD3MspJSwQIiG/0l147lQ2VZY
	SK5wfqjg==;
Received: from ip6-localhost ([::1]:22614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rreQa-003mHM-EX; Tue, 02 Apr 2024 13:43:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41246) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rreQV-003mHE-TK
 for samba-technical@lists.samba.org; Tue, 02 Apr 2024 13:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MF2zL9JEQx5TTorHWP5H4onNcOrsRi46rdJxOwpDL6M=; b=dlDLE6/RkZo635d6SDwSy0WDoV
 GZPpRPon1NGE4+gVeTshq+9QgB7alc/FZp7uiQvbHIQk8cwGLzP2OTUbfgqYogeCKlYGizt/rFBOR
 T3noeTX+JFq5Taj03Cdl1tvlcrXe58k9ABJmLx840o0m0j3pKZfNWwBx9gHzAmtB0AOthbdLXeLs6
 ZzTJ7w1pSP9xyPCQZJTGnPwYzuW70QndRVZcUxNZrdAe6Q+jNmPK/24W855I6MRskNJZYAidRiOZI
 yiYsCZTyMJw4+W4ROZUBCU5ECvGpbBoEMKTJtyzIztFrwnUhxkP2x28GSEU4ps9c024jeykTrpiVp
 2fPL4n9gNE6IIhMHYRHm7N3rzNWutegPIVyCpt9+IZJiY6iAChPbohs60kovkEnRplDsgLXmGq834
 JBP7NFROs4hZLZtBmfcGGDt6RKr15YXP3/vqZSkHTOUsDrfYdQp6byGnJVfhngGcO3lLpJWic++pq
 6JWoUjvoN+7frGPz8e7rjpcc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rreQU-004I0n-2K; Tue, 02 Apr 2024 13:43:46 +0000
Message-ID: <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
Date: Tue, 2 Apr 2024 15:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Simplify copy-reflink code
To: David Disseldorp <ddiss@samba.org>
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
Content-Language: en-US, de-DE
In-Reply-To: <20240402202621.2c234f13@echidna>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vtUWGDV28SKiWn0RAMu0aAmQ"
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
--------------vtUWGDV28SKiWn0RAMu0aAmQ
Content-Type: multipart/mixed; boundary="------------1PnGF4uH0Qt5SENjm5Vn3y8q";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <e5c49135-4fa4-40ec-bdbd-6446e1d156cb@samba.org>
Subject: Re: Simplify copy-reflink code
References: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
 <20240402202621.2c234f13@echidna>
In-Reply-To: <20240402202621.2c234f13@echidna>

--------------1PnGF4uH0Qt5SENjm5Vn3y8q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQsDQoNCnRoYW5rcyBmb3IgdGFraW5nIGEgbG9vayENCg0KT24gNC8yLzI0IDEx
OjI2LCBEYXZpZCBEaXNzZWxkb3JwIHdyb3RlOg0KPiBTb3VuZHMgZ29vZCB0byBtZSwgYWx0
aG91Z2ggSSdsbCBuZWVkIGEgYml0IG9mIHRpbWUgdGhpcyB3ZWVrIHRvIHRha2UgYQ0KPiBs
b29rIChhbmQgZG8gc29tZSB0ZXN0aW5nKS4NCg0KdGhhdCB3b3VsZCBiZSBhd2Vzb21lIQ0K
DQo+IElmIGl0J3MgcGFzc2luZyB0aGUgY29weS1jaHVuayAmIGR1cC1leHRlbnQNCj4gdG9y
dHVyZSB0ZXN0cyBvbiBhIGJ0cmZzLWJhY2tlZCBzaGFyZSwgdGhlbiBJJ20gY29uZmlkZW50
IHRoYXQgaXQgc2hvdWxkDQo+IGJlIGZpbmUuIA0KDQp5ZXMsIHRoZXkncmUgc3RpbGwgcGFz
c2luZy4NCg0KPiBIb3dldmVyLCBteSBjb25maWRlbmNlIGluIHRoZSB0ZXN0cyBpcyByZWR1
Y2VkIC0gSSB0aG91Z2h0IHRoZXkNCj4gZXhlcmNpc2VkIHRoZSBCVFJGU19JT0NfQ0xPTkVf
UkFOR0UgZmFsbGJhY2sgY29kZS1wYXRoLCBzbyBzaG91bGQgaGF2ZQ0KPiBjYXVnaHQgWzFd
LiBQZXJoYXBzIGl0J3MganVzdCB0aGF0IG5vYm9keSB0ZXN0cyBhdG9wIGJ0cmZzPw0KDQpJ
IGd1ZXNzIGZvciB0aGUgY29tbW9uIHdvcmtsb2FkIG9mIGNvcHlpbmcgZmlsZXMgdGhlIGZh
bGxiYWNrIGlzIGp1c3QgDQpuZXZlciB0cmlnZ2VyZWQuDQoNCi1zbG93DQoNCg==

--------------1PnGF4uH0Qt5SENjm5Vn3y8q--

--------------vtUWGDV28SKiWn0RAMu0aAmQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYMC5AFAwAAAAAACgkQqh6bcSY5nkYf
tg//WonjV58AnYX7CnRKVeOOADuoCfZK1MZluJoZJHP8dfjOWdrpQ1Vbi2TtYcHa61EBbZi6qG3s
836j17PP6dBWGBCQthpah5vnRA6bxiv+fWxaS1VWKX1dB9gcCg8oK8YesXLXoclDFQzY0iKusZ9E
dSLo/wmQ9zSxXI6OhOEzZy3/Epr7JdbWsRWp1aIL54A51p5oJau8vjsxMmmHk0rGNMRfCkPKyHvr
fq5zm8SzR0M+Dch4ecGNx7G0JnLd76/zUdjVReBHk1CcqwWFAx7w02j7MpY/eI7WSLCUQoUGzEvd
fqSR2TBs9iuFaKzi4UGCSS7rSNj3Ko+zf56KuTLalWZeDXmW0ZBe2gb5hGe/hXsLLikeiT6teDy3
leYjtd01d7HvNVmR3yGapipTCSXnbHCr4PEePr3pYydlYzodWTH6XkcBFVbJIa8HXvkN+navikMz
0DxMr4M2rJoECfhi4PhOZrsLMBLhyPKD0WQ6E6y/aV9Z4QQp0QwazLKuTbqPurzHbZAa4qfnXykK
aJv8zpc6htLUqB5UD+KBoyhYhz0FNYp+nxQvpfuuTy54p+3vNylbNWYNAr4O2xUUYR6mFojR6GDG
wxhW3vPGzgKyIRTOuS3FGKUkTCxxi3/LyAwqqVIoaX/QeKajtUeugXqbM6lN6leAo1D7jadNCu7K
yMg=
=LsY5
-----END PGP SIGNATURE-----

--------------vtUWGDV28SKiWn0RAMu0aAmQ--

