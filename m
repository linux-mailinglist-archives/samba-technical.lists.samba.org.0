Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B2976C60
	for <lists+samba-technical@lfdr.de>; Thu, 12 Sep 2024 16:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=teklIScTz8cpi7D+lxRSYAqGeTz2FE9plHf+jEFXVvk=; b=ho6HV2/Fw7LzXXom/Th7xGPXna
	Lc3S/lGGCQReWptjvaGDecjL1iPFObQKk8lCRcHF358tuBmiSd1U5dLCyFtNz7nf+9iMW18zKPW56
	BLBNYiL27OBNOrt/vrIZXZsDgM/0ABupfpndzVji4Hm8nyIAwqF/NVc8FzgJDvYu8jwbrT9VY2PUg
	ZO2dCjcl76ISPs7eIaUnVA++Ivx0okmYu6weJqURLx72Bl+TGP4d5tqX74b94bLjJOR3/0pSb710/
	zATngj1qaaHVQuiYbqHk/VyRs4Dis5q0doHbiNbi3BnyCAavVpI2D61xgHPk75hJDxI9xxP0ArZmu
	taQf4nrw==;
Received: from ip6-localhost ([::1]:54710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sol2h-008KTa-2j; Thu, 12 Sep 2024 14:43:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11200) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sol2Z-008KTB-Hv; Thu, 12 Sep 2024 14:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=teklIScTz8cpi7D+lxRSYAqGeTz2FE9plHf+jEFXVvk=; b=H/hIBuUiO0VY1kjzsFAZDnUuxP
 yIdNvTinWugzo4U92PnT1mcYpvAhr+OJtOr81vMcNM5AOOXGeT5Fo5PTzM5BhgVyf+GpK6WinH3wW
 1N4BUgIGnK2Qm7HDd2vHgLSmL3r3XMYkYnUvsrpVLAatDAuYRu6T0ChsIH4QQT+CGwHVokyubYDQS
 1BHv52oY2iqDcgUn4sP32tpMEOKWM72abKwwKWnUhG+tTPiSTh/6whSIcaviLw31jfCcm2ZWMdMXO
 AQiq7mQiSZnSKXCDztWoKospZKLUy9IC9dChww/SiR1SepHv46KX9JwJhA7upRAuhaa2bwtEI/ndZ
 9pIzE3szAhZuFcQ5oOk8cUBNAOMxXhIHN55o7ocope4gfU6MWSNn5qNlXIJ884ByldyA6NGURj7WD
 5gAA64+bn1jF/vk9Lcvr8ogIFUNi1BXKnF96VV1PFvw0HnzgYUugBVW8AgDv7rOMOv+X8FiCMtnRp
 pL2ErL8I2YUz5Jej98/MINd9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sol2X-00BtSX-2L; Thu, 12 Sep 2024 14:43:21 +0000
Message-ID: <be66c54e-7e37-4bac-8d7c-efde20d22d48@samba.org>
Date: Thu, 12 Sep 2024 16:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
Subject: Samba secures funding from Sovereign Tech Fund
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NPAH4LnK0V0kSNu58Pvih0Cg"
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
--------------NPAH4LnK0V0kSNu58Pvih0Cg
Content-Type: multipart/mixed; boundary="------------47Qns4VqntKfTtWthrcnP0JI";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <be66c54e-7e37-4bac-8d7c-efde20d22d48@samba.org>
Subject: Samba secures funding from Sovereign Tech Fund

--------------47Qns4VqntKfTtWthrcnP0JI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gU2FtYmFpc3RhcyENCg0KU29tZSBvZiB5b3UgaGF2ZSBhbHJlYWR5IG5vdGljZWQg
dGhlIGV4Y2l0aW5nIG5ld3MgdGhhdCBJJ2QgbGlrZSB0byANCmhlcmVieSBzaGFyZSB3aXRo
IGFsbCBvZiB5b3U6DQoNClRoZSBTYW1iYSBwcm9qZWN0IGhhcyBzZWN1cmVkIHNpZ25pZmlj
YW50IGZ1bmRpbmcgWzFdIGZyb20gdGhlIEdlcm1hbiANClNvdmVyZWlnbiBUZWNoIEZ1bmQg
KFNURikgdG8gYWR2YW5jZSB0aGUgcHJvamVjdC4gVGhlIGludmVzdG1lbnQgd2FzIA0Kc3Vj
Y2Vzc2Z1bGx5IGFwcGxpZWQgZm9yIGJ5IFNlck5ldC4gT3ZlciB0aGUgbmV4dCAxOCBtb250
aHMsIFNhbWJhIA0KZGV2ZWxvcGVycyBmcm9tIFNlck5ldCB3aWxsIHRhY2tsZSAxNyBrZXkg
ZGV2ZWxvcG1lbnQgc3VicHJvamVjdHMgYWltZWQgDQphdCBlbmhhbmNpbmcgU2FtYmHigJlz
IHNlY3VyaXR5LCBzY2FsYWJpbGl0eSwgYW5kIGZ1bmN0aW9uYWxpdHkuDQoNClRoZSBTb3Zl
cmVpZ24gVGVjaCBGdW5kIGlzIGEgR2VybWFuIGZlZGVyYWwgZ292ZXJubWVudCBmdW5kaW5n
IHByb2dyYW0gDQp0aGF0IHN1cHBvcnRzIHRoZSBkZXZlbG9wbWVudCwgaW1wcm92ZW1lbnQs
IGFuZCBtYWludGVuYW5jZSBvZiBvcGVuIA0KZGlnaXRhbCBpbmZyYXN0cnVjdHVyZS4gVGhl
aXIgZ29hbCBpcyB0byBzdXN0YWluYWJseSBzdHJlbmd0aGVuIHRoZSBvcGVuIA0Kc291cmNl
IGVjb3N5c3RlbS4gWzJdDQoNClRoZSBwcm9qZWN0J3MgZm9jdXMgaXMgb24gYXJlYXMgbGlr
ZSBTTUIzIFRyYW5zcGFyZW50IEZhaWxvdmVyLCBTTUIzIA0KVU5JWCBleHRlbnNpb25zLCBT
TUItRGlyZWN0LCBQZXJmb3JtYW5jZSBhbmQgbW9kZXJuIHNlY3VyaXR5IHByb3RvY29scyAN
CnN1Y2ggYXMgU01CIG92ZXIgUVVJQy4gVGhlc2UgaW1wcm92ZW1lbnRzIGFyZSBkZXNpZ25l
ZCB0byBlbnN1cmUgdGhhdCANClNhbWJhIHJlbWFpbnMgYSByb2J1c3QgYW5kIHNlY3VyZSBz
b2x1dGlvbiBmb3Igb3JnYW5pemF0aW9ucyB0aGF0IHJlbHkgDQpvbiBhIHNvdmVyZWlnbiBJ
VCBpbmZyYXN0cnVjdHVyZS4gRGV2ZWxvcG1lbnQgd29yayBiZWdhbiBhcyBlYXJseSBhcyAN
ClNlcHRlbWJlciB0aGUgMXN0IGFuZCBpcyBleHBlY3RlZCB0byBiZSBjb21wbGV0ZWQgYnkg
dGhlIGVuZCBvZiBGZWJydWFyeSANCjIwMjYgZm9yIGFsbCBzdWJwcm9qZWN0cy4NCg0KQWxs
IGRldmVsb3BtZW50IHdpbGwgYmUgZG9uZSBpbiB0aGUgb3BlbiBmb2xsb3dpbmcgdGhlIGV4
aXN0aW5nIFNhbWJhIA0KZGV2ZWxvcG1lbnQgcHJvY2Vzcy4gRmlyc3QgZ2l0bGFiIENJIHBp
cGVsaW5lcyBoYXZlIGFscmVhZHkgYmVlbiBydW5uaW5nIA0KWzRdIGFuZCBnaXRsYWIgTVJz
IHdpbGwgYXBwZWFyIHNvb24hDQoNCldpdGggYSBncmVhdCBkZXZlbG9wbWVudCB0ZWFtLCBJ
IGFtIGxvb2tpbmcgZm9yd2FyZCB0byBzaWduaWZpY2FudGx5IA0KaW1wcm92aW5nIFNhbWJh
IG92ZXIgdGhlIG5leHQgMTggbW9udGhzIGFuZCBjYW4ndCB3YWl0IHRvIHNlZSB0aGUgDQpm
ZWF0dXJlIGluIHRoZSBoYW5kcyBvZiBvdXIgdXNlcnMhDQoNCkNoZWVycyENCi1zbG93DQoN
ClsxXSA8aHR0cHM6Ly93d3cuc292ZXJlaWdudGVjaGZ1bmQuZGUvdGVjaC9zYW1iYT4NClsy
XSA8aHR0cHM6Ly93d3cuc292ZXJlaWdudGVjaGZ1bmQuZGUvPg0KWzNdIA0KPGh0dHBzOi8v
d3d3LnNlcm5ldC5kZS9lbi9uZXdzL25ld3MtZGV0YWlsL3NvdmVyZWlnbi10ZWNoLWZ1bmQt
aW52ZXN0cy1pbi1zYW1iYS1wcm9qZWN0Pg0KWzRdIDxodHRwczovL2dpdGxhYi5jb20vc2Ft
YmEtdGVhbS9kZXZlbC9zYW1iYS8tL3BpcGVsaW5lcy8xNDQ2Mjk5NjczPg0KDQotLSANClNl
ck5ldCBTYW1iYSBUZWFtIExlYWQgaHR0cHM6Ly9zZXJuZXQuZGUvDQpTYW1iYSBUZWFtIE1l
bWJlciAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU0FNQkErIHBhY2thZ2VzICAgICAgIGh0
dHBzOi8vc2FtYmEucGx1cy8NCg0K

--------------47Qns4VqntKfTtWthrcnP0JI--

--------------NPAH4LnK0V0kSNu58Pvih0Cg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmbi/gkFAwAAAAAACgkQqh6bcSY5nkYs
ARAAm9TvNM1nXkKibJp77oXf2Tmotnp8lD5nCoUaZdOMAkV6SmfetAAvrLaQj1FhiS4+zEsGvInf
8HZCynE3rZf4mRgC6+6zvSnjtliMM/VnN/H2rU4id0ld4Ng2w8WnCuCyIT+rdQo7nT2SwH8lklrP
0Zy0Y4ZMNVhAp+fSt3vb1hofhYt9cFDqMCXSGuebQEoQ999PnaCccuDHwjPZG5IEzDAFi47qXMAv
2yDRl0xaIuRczToNCTTEgL43dKRxdTGP8uaxlZyouYKFWJgxmblTiivfSbGx+R2jn2YNNI2pFLMm
KBMJq9b0Lqx3H6YOwV2WV9TZ7eiqBdhIHNvoWJXMTA0o6ghPI6Jkj5JyG10dIgqJ7YklmtgsmU1r
0iQ+elcz4o3tPKu1GFkv41QmIT9qP2JyFPakxj3SnHNeUgwvcsTgBDYTea+jiK5LteutIBbs044M
v42TCO147jsEjduE8IjfeTDOpw6ro6SLaV94T8zy8C/D5CRsWxUXszNtrdxagSg/VE7+CDrlAFXc
b1I1RE/3DfakNQvoKGpHby31Kd3Q3LWSnCK9VYRy0rffRFAvM4YZGJvS3yIoMU9wDvsCa+2krrwo
ov+aNoJOVAHOm3eUvbMZn2butIILuohOYnxZ790oEC7TpCbSY5rSJWL9r/6dbEG6EPibMD9AIui0
nSQ=
=h8/1
-----END PGP SIGNATURE-----

--------------NPAH4LnK0V0kSNu58Pvih0Cg--

