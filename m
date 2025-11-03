Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E5C2D9AD
	for <lists+samba-technical@lfdr.de>; Mon, 03 Nov 2025 19:10:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4FZM//nE+HUtkbRRPZMO20zJmbu83J8M2lwzroMyDBo=; b=gpnu9yiiZxSy+ttXTeMEu/lgND
	dXDeyFOO+RA/gPfe1moUlxLneE7xUpoOClIT5s3NrB3IEuJDEUtKHG073/9TLLBDlfcxDEbbykjlt
	nY9AutbGYgt+MKmr+ZyMzKkWY/UFr7OYn96TYaVujenMK7HOpnM9sqsrXLZnsKLrD3sl0wS5le8+h
	INRFYVmVfhNB3eLmuhLLL7oi3Lw2jVKLdfY8rfGfTdgijJNLV94z1cQSKkm6hwT3IkZmkg6RVgVZ6
	5EAetAsCURKD+fm6QY+HsX9iNytVvVUjD3ho7ivgk5dee/wo0nJTizERg3aOYmo8P8OSfrydS9hGu
	ebppY4tA==;
Received: from ip6-localhost ([::1]:40544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vFz0X-00BNIE-AF; Mon, 03 Nov 2025 18:10:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26650) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vFz0O-00BNI5-Of
 for samba-technical@lists.samba.org; Mon, 03 Nov 2025 18:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4FZM//nE+HUtkbRRPZMO20zJmbu83J8M2lwzroMyDBo=; b=T8zNFH89nnfsqPkEYgCiKcECsq
 vZTnD90HjMs1C40p8b7pIRRFN95fwNzuI5wvg2Uzvj4opCyPqHczZfFQgwtC4F6JzttDtNgBF/T/w
 pJQF/FvP9foxDmkkofekiKMX893zTiAC1T+tmU2bsyfDxXagwm/txKBO6HsJIE+WTd3ppkdqXlWNs
 FucquiunPHIRxD23cyUjr36OdjQTgBFbGwE5TAk4zpaszyAAmglzxvw5Z/GVGSIyh41Fmn0R3nNPG
 jPxqItnv2qnIJ8Q3qKp13HhnU58yXE1TK+olaXMC7dgUI+SGBAdnCrSFS6ur5l8W7XC75qieTEGTK
 rrkenr8n/ld+Z1tncp8y60tMGyTu3uMu9+vNszsQgzOstpWXFs8ZAZ/gFDKPsLLrNzIwivK7qPABX
 VBAUHQB2gMuLM5Um8pKmHTNXaSUsEOhDvyJi2oAb14qP0TN9OgREDVza3LslHozIqLjjlQsRdjsgr
 +0a1r+K++ppB/jsUDcCqaDMX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vFz0N-00CO6D-3D for samba-technical@lists.samba.org;
 Mon, 03 Nov 2025 18:10:12 +0000
Message-ID: <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>
Date: Mon, 3 Nov 2025 19:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_Invitation=3A_Samba_Developer_Online_Gathering_?=
 =?UTF-8?Q?=E2=80=93_Tuesday=2C_November_4th?=
To: samba-technical <samba-technical@lists.samba.org>
References: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EnsyfwiLlqi2tjbAgESQNx00"
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
--------------EnsyfwiLlqi2tjbAgESQNx00
Content-Type: multipart/mixed; boundary="------------w05C20AaPtsJHcGt14WhWZpH";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <4da1127e-121e-499b-91ee-b8a9e4a3c4bd@samba.org>
Subject: =?UTF-8?Q?Re=3A_Invitation=3A_Samba_Developer_Online_Gathering_?=
 =?UTF-8?Q?=E2=80=93_Tuesday=2C_November_4th?=
References: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>
In-Reply-To: <77b153b3-94f1-4100-a51d-b32d05faae48@samba.org>

--------------w05C20AaPtsJHcGt14WhWZpH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVyZSdzIHRoZSBjdXJyZW50IGFnZW5kYToNCg0KaHR0cHM6Ly9oYWNrbWQub2tmbi5kZS9F
Y3VReHFHZVFVYU5Cd09TaVdwd1BnDQoNClNlZSB5b3UgdG9tb3Jyb3chDQotc2xvdw0KDQot
LSANCkpvaW4gdXMgZm9yIHRoZSAyNXRoIHNhbWJhWFAgMjAyNiBjb25mZXJlbmNlDQpBcHJp
bCAyMHRoICYgMjF0aCwgMjAyNiBhdCBIb3RlbCBGcmVpemVpdCBJbg0Kc3BvbnNvcmVkIGJ5
IFRyYW5xdWlsSVQgJiBNaWNyb3NvZnQgJiBTZXJOZXQNClRpY2tldGluZyAmIG1vcmUgSW5m
byBhdCBodHRwczovL3NhbWJheHAub3JnDQoNClNlck5ldCBTYW1iYSBUZWFtIExlYWQgaHR0
cHM6Ly9zZXJuZXQuZGUvDQpTYW1iYSBUZWFtIE1lbWJlciAgICAgIGh0dHBzOi8vc2FtYmEu
b3JnLw0KU2FtYmEgU3VwcG9ydCBhbmQgRGV2ICBodHRwczovL3NhbWJhLnBsdXMvc2Vydmlj
ZXMvDQpTQU1CQSsgcGFja2FnZXMgICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy9wcm9kdWN0
cy9zYW1iYQ0KDQpPbiAxMC8yNy8yNSA2OjQ4IFBNLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJh
LXRlY2huaWNhbCB3cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gU2F2ZSB0aGUgZGF0ZSBmb3Ig
dGhlIG5leHQgU2FtYmEgRGV2ZWxvcGVyIE9ubGluZSBHYXRoZXJpbmc6DQo+IA0KPiBEYXRl
OiBUdWVzZGF5LCBOb3ZlbWJlciA0dGgNCj4gVGltZTogNjowMCBBTSBVVEMNCj4gTGluazog
aHR0cHM6Ly9iYmItbmV3LnNmY29uc2VydmFuY3kub3JnL3Jvb21zL3g0cy13bjctbHR3LWwz
Yi9qb2luDQo+IA0KPiBJbiB0aGUgbmFtZSBvZiB0aGUgU2FtYmEgVGVhbSwgSeKAmWQgbGlr
ZSB0byBpbnZpdGUgZXZlcnlvbmUgYWN0aXZlbHkgDQo+IHdvcmtpbmcgb24gb3IgY29udHJp
YnV0aW5nIHRvIFNhbWJhIHRvIGpvaW4gdGhpcyBmaXJzdCBTYW1iYSBEZXZlbG9wZXIgDQo+
IE9ubGluZSBHYXRoZXJpbmcuDQo+IA0KPiBUaGUgZ29hbCBpcyB0byBjcmVhdGUgYW4gaW5m
b3JtYWwgc3BhY2Ugd2hlcmUgZGV2ZWxvcGVycyBjYW4gZGlzY3VzcyANCj4gY3VycmVudCBk
ZXZlbG9wbWVudCB0b3BpY3MsIG9uZ29pbmcgd29yaywgYW5kIGZ1dHVyZSBwbGFucyDigJQg
bXVjaCBsaWtlIA0KPiBvdXIgaGFsbHdheSBjaGF0cyBhdCBTYW1iYVhQLCBidXQgaW4gYW4g
b25saW5lIGZvcm1hdC4NCj4gDQo+IElmIHlvdSBoYXZlIHRvcGljcyB5b3XigJlkIGxpa2Ug
dG8gZGlzY3VzcyBvciBzaG9ydCB1cGRhdGVzIHlvdeKAmWQgbGlrZSB0byANCj4gc2hhcmUs
IHBsZWFzZSBzZW5kIHRoZW0gdG8gbWUgZGlyZWN0bHkgaW4gYWR2YW5jZSBzbyB3ZSBjYW4g
cHJlcGFyZSBhIA0KPiByb3VnaCBhZ2VuZGEuDQo+IA0KPiBBIGZldyBkZXRhaWxzOg0KPiAN
Cj4gRHVyYXRpb246IHVwIHRvIDIgaG91cnMNCj4gUmVjb3JkaW5nOiB0aGUgbWVldGluZyB3
aWxsIG5vdCBiZSByZWNvcmRlZA0KPiBGb3JtYXQ6IG9wZW4gZGlzY3Vzc2lvbiDigJQgdGVj
aG5pY2FsIGFuZCBpbmZvcm1hbA0KPiANCj4gV2XigJlyZSBsb29raW5nIGZvcndhcmQgdG8g
c2VlaW5nIG1hbnkgb2YgeW91IHRoZXJlIGFuZCBoYXZpbmcgYSANCj4gcHJvZHVjdGl2ZSBh
bmQgZnJpZW5kbHkgZXhjaGFuZ2UhDQo+IA0KPiBTZWUgeW91IG5leHQgVHVlc2RheSwNCj4g
UmFscGgNCg0K

--------------w05C20AaPtsJHcGt14WhWZpH--

--------------EnsyfwiLlqi2tjbAgESQNx00
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmkI8AMFAwAAAAAACgkQqh6bcSY5nkY6
PhAAgEiPUu4SNoffO0tEvNv8YHMgIp6Qd1JocEs0Gi4PC5qnnT5bDScZIHb6hKu4602a5EI2SHiN
wrB8RTeSpwh64GMsC4kaZCwwlOZgK/YqxTJ0Or/7r8wmAZ1o1A8sVJ6GHtnAvEmZCmF2dvMmkdR1
rvXmFifTVQCFxQYWGhil0wbbd7q4W3tZl0skP+WHdGkJ0gWa+wTL4PQy0KBKOGY/TW3KXl2duWlH
WUGfm9Bnuokz4s3yHvShxiYDuZGdI3m06CDF6xzIkzBrieRDPy7vRo577QxLf0dshDxqK5mjoP49
E6yxO4v9RlcUEn5O4o2Fpk1XA0IEjeLHU7Z1XUBuIBz2zsajCUW/j+hRbzjcB7RY4+ZcOlT0qWIQ
8dqVlcA1ANYhaJEJN4tzOWmEawxRIy1lzbTsQG0FvaHDJLHqRllTcJca2uinQc6Uglo4fELZdtF5
XSAgaykgbgvXBT60E4QPkKOX7T2so/HXRZ1ww9Z3W0sRER35K/0Ck/7F9IVPrn7KT7tt+/gnrvHx
wPZFKilrFI7Bq6Q1MI4W42uSmcdP8l+/inXyDv97Nul2wJ+jgHggh3aMQEt16YOJF9rRyMW+2H/4
vyNzjyOQuOU8JCA1AOYrSv2Xv+OVTJwyiFV0WNBDQuW/UK44LBxbrCtKXtOZE0uQL/mV69fW77eo
+54=
=1RZA
-----END PGP SIGNATURE-----

--------------EnsyfwiLlqi2tjbAgESQNx00--

