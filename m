Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB6A894CE2
	for <lists+samba-technical@lfdr.de>; Tue,  2 Apr 2024 09:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QGw9q7c93jupl6VgVdJEmMhbyJMIT+WNEFg+0u6NpNs=; b=ATMdzDMLgaeF0GwVSTIXrx4/jk
	aFvryJy7gzGZ5QisPHl0fX0AIDIAWrwsNfMXHhhFzUqzcZVRyOdpJyOrTIiU0Dj/KAslL8ibDV8u1
	Q1tESQ2uz4Y8D8kIIY5pszi6NfZWl18fVRjZ/aivwXw3EyFqQ4H7GwdHYedanj1h1/x7Cm+dg3uZi
	j3CQ0hGwClZR8zfyJUgklJx3CWgbT5eysmNxCoTSPpnpGVO9OzLoZLQ9EQe1RRNB1YwoT5As4iMWZ
	XlW6WTc8WWavLtgJa7+hTJdYV0vgPbTsq53JPB38ajyumItRk6eCli3rCZtrhervC6fhmIzGGtYsk
	72megeZg==;
Received: from ip6-localhost ([::1]:42144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rrYuD-003jn6-Ob; Tue, 02 Apr 2024 07:50:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61256) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rrYu7-003jmx-IV
 for samba-technical@lists.samba.org; Tue, 02 Apr 2024 07:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=QGw9q7c93jupl6VgVdJEmMhbyJMIT+WNEFg+0u6NpNs=; b=RPUBjkcaJ++w7zB8ega0PPSETL
 zx8EhwZ76wNQ80kr2zX5hUHD8prUwI50bE3fsvcFCdMJkhuKbwhiI5FlVPTlG+EVVhDTtFsktHT+W
 iIBNRWxY83BVYoOphMstV22O6zLW83982ZAogSkNmVzQbKP1+rQNdeoupZGHeuApON1xExJx7yiIi
 YCLqwzmDCl6cSFD3eVprV+raLe1gTRkZZS/6+vcWPWxhlWCXg0KvSGi73kTMcHDEK9wN22+clXf6b
 1OPuiBpURVVgMhY1ofTLVH/OxUmgGVGrmkV/6xFrhNF9kYX4feqx24j/DMDpPvw5KjItr8ot7GVT+
 /0d1aBgVdvCYXmZFdfelNyzbuMNlluT8vJOCt84NbTFkl5UE9YazORjLQn+kSBWr6NKdie+en3PUa
 +exqn6hjK57kqLx7LcWLMgfj5wvx6YgOcSuYjD7tAEj4v2+WlVOkvnVRImp6ZeV+EI9Z11p5U9xMu
 Nhbs0mzKECqaiZDgw4iDliwx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rrYu6-004CvQ-1z; Tue, 02 Apr 2024 07:49:58 +0000
Message-ID: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
Date: Tue, 2 Apr 2024 09:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: David Disseldorp <ddiss@samba.org>
Subject: Simplify copy-reflink code
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------X80kQftvNnJYFv20w0ArR1HV"
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
--------------X80kQftvNnJYFv20w0ArR1HV
Content-Type: multipart/mixed; boundary="------------pum0lplCWaceLoZc0hnnr1yq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <2c5e4e5d-4115-49b5-9af5-a488cfc601a8@samba.org>
Subject: Simplify copy-reflink code

--------------pum0lplCWaceLoZc0hnnr1yq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2aWQhDQoNCklmIHlvdSBoYXZlIHRoZSB0aW1lLCBjYW4geW91IHBsZWFzZSB0YWtl
IGEgbG9vayBhdA0KDQpodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1iYS8tL21l
cmdlX3JlcXVlc3RzLzM1NjYgPw0KDQpJJ20gYmFzaWNhbGx5IGFkZGluZyBjb3B5LXJlZmxp
bmsgc3VwcG9ydCB0byB2ZnNfZGVmYXVsdCBhbG9uZ3NpZGUgYSBuZXcgDQpvcHRpb24gImZp
bGVzeXN0ZW0gcmVmbGlua3MiIHRoYXQgc2V0cyBGSUxFX1NVUFBPUlRTX0JMT0NLX1JFRkNP
VU5USU5HIA0KaW4gdGhlIHNoYXJlIGNhcGFiaWxpdGllcyBpZiBlbmFibGVkLi4NCg0KVGhp
cyB3b3JrcyBvbiBlZyBaRlMgYnkganVzdCBzZXR0aW5nICJmaWxlc3lzdGVtIHJlZmxpbmtz
ID0geWVzIi4gDQp2ZnNfYnRyZnMgc3RpbGwgc2V0cyBGSUxFX1NVUFBPUlRTX0JMT0NLX1JF
RkNPVU5USU5HIGlmIHRoZSBtb2R1bGUgaXMgDQpjb25maWd1cmVkLCBzbyB0aGVyZSdzIG5v
IGJlaGF2aW91ciBjaGFuZ2UgZm9yIGJ0cmZzLiBCdXQgZm9yIG90aGVyIA0KZmlsZXN5c3Rl
bXMgd2UgaGF2ZSB0aGUgY2hvaWNlIG9mIGVpdGhlciBzZXR0aW5nIA0KRklMRV9TVVBQT1JU
U19CTE9DS19SRUZDT1VOVElORyBpbiB0aGUgbW9kdWxlIG9yIHJlbHlpbmcgb24gdGhlIG5l
dyBvcHRpb24uDQoNCkkgaGFkIGluaXRpYWxseSBzcG90dGVkIGEgYnVnIGluIHZmc19idHJm
cyBhbmQgYWZ0ZXIgZml4aW5nIHRoYXQgWzFdLCBJIA0KcmVhbGl6ZWQgdGhhdCByZXF1aXJp
bmcgYWxsIFZGUyBtb2R1bGVzIHRvIGV4cGxpY2l0bHkgY29kZSBjb3B5LXJlZmxpbmsgDQpz
dXBwb3J0IGludG8gdGhlbSBpcyBub3QgaWRlYWwgYW5kIGp1c3QgbW92aW5nIGl0IHRvIHZm
c19kZWZhdWx0IA0Kc2ltcGxpZmllcyB0aGUgbW9kdWxlcyBhIGxvdC4gVGhlIGJyYW5jaCBz
dGlsbCBjb250YWlucyB0aGUgY29tbWl0IGFuZCANCml0cyByZXZlcnQgdG8gZGVtb25zdHJh
dGUgdGhlIHByb2JsZW0uDQoNCnRsO2RyOg0KDQpubyBjaGFuZ2UgaW4gYmVoYXZpb3VyLCBn
cmVhdCBzaW1wbGlmaWNhdGlvbi4NCg0KVGhhbmtzIQ0KLXNsb3cNCg0KDQpbMV0gDQo8aHR0
cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvLS9tZXJnZV9yZXF1ZXN0cy8zNTY2
L2RpZmZzP2NvbW1pdF9pZD00OGQ4YjljN2FkNTI4NzkwYjI0ZGU1YjFjY2JmZDhiMDRhMjYy
MmNmPg0K

--------------pum0lplCWaceLoZc0hnnr1yq--

--------------X80kQftvNnJYFv20w0ArR1HV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYLuKUFAwAAAAAACgkQqh6bcSY5nkbI
HA/9EiJL5UOBy1rqUbXuUgs6yvO37XIWrvcVLmgfwPocFkufXaV4cMQbxnwi5WtLVyXVikf40aEx
i0QTbSOto5UiMijU7mV4hsXgY8TyySTybQ3OBMVex4b3VnogZIQOIRbqLgx3MozOKFP4uiDBLauE
Xr6eD4BSnP9Xi06kLUeoVIU0JOVoAn2qz/xftYhvfSnVxZuKGaznMu4CblRildnlltsjKtHm0nqV
Bz6TVCW8tTE5+zvslmm86ic3HGUp88rAWxoGl1LrBYPe/vPVBkuTROU/xm7a9tLbFT4XbfJ1MAxq
5/x8e1wrO1z06gA3aY5LswhHLG55fI8WK+SBSJvhjuQlaKiJ7WfRCZ6kWWOntufGxPhuSMbxWhGJ
HfbfpEf/gRWymAb/IDMItlR+9IJp1GV11QtGJuc1ftqpUaFBd4vEWHwPzy6eK1gLexcurUGkoWnW
R+slJQl6C9dDSAjSir63njptI+bHc/c6FYDmG9xLZdaS5fe9C8qOb0BsYk9lwmmPWoKDB9bII5w3
NQGnzSzzbuejt+JgYzLvKA9nTUxx2MIz9gfKYXcI2f6NGcTdtkvtkKIPXntWtWbEZqAJZUI7zC5C
ZBqJnc7Xsu9EuPNwnVe5tWJxKyKsrF3ad3yNPS9PiGG18gbCLdIL1V7rg2EKvlqZqF7B+x3ZdGdJ
bXs=
=VvVy
-----END PGP SIGNATURE-----

--------------X80kQftvNnJYFv20w0ArR1HV--

