Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF226A78F88
	for <lists+samba-technical@lfdr.de>; Wed,  2 Apr 2025 15:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4bhwADJHBgANbxxMUCw9lwqOW2Js4XauDMe6mgZYAG4=; b=G70KawKMUNa+Mr9hCOi+giIxfF
	DOZIVNNYNd1QUoeBfeQqd7QECycQjYlFJsOFAUeNml+DBIpiItuzSmHiIFfH+c8lEqCDyXQj7WqE+
	jiByxc6spDqwtAJzbBbb0y72oZiPrB4bxDSeC9x73Z6PQ8JyghiBqGn+WD3p3kEPm1VpeB2aC1moU
	ZD2Juj8aHim4Yeoe1CAhrSCCj9HpRIFzVZ/DHjzWWPcdDE96hlwJkmVeIsgg2A44c6zTu8ux6F+26
	dnr3AVWIcHWPl3OPgmYmdNvHrMhRaxi/P+ZHxZAf6MWq7/nbCGR4RtsNGRYrQIyNFWlfuGpTEmPqO
	0MemCS8A==;
Received: from ip6-localhost ([::1]:35360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzxts-001aTr-Ec; Wed, 02 Apr 2025 13:13:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64322) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzxto-001aTk-2z
 for samba-technical@lists.samba.org; Wed, 02 Apr 2025 13:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=4bhwADJHBgANbxxMUCw9lwqOW2Js4XauDMe6mgZYAG4=; b=rXwPMNnp6Eq0XLNSfzyj4C4xg+
 3GQysgMAGibBe6CQEMdES0wO/KTeeZirgfbeHecwAKYUGznhlHvNyqQrLqSy4X+ci/iswB6UMQLQ9
 w5hMIiWWr66YjNp0tS9zewn5DSCRmfEmH9gwwzyby2PRu86STQjJbOzaeQ73Fz1EDXn+II8BKjamg
 npoI7agZ+g2MmyiomnhBSzmouERG/24tlnr1F6krqvl+oSprMD9gqESrGl0TVhdDL9wWnjhfdkQoy
 q4N7RmI+N/PyPwjg0s6HSHh6n7rpbsywZd9u+IKWrl5h07lkyEk/hADdcrcAMF3cx1HGCG7+cnbNc
 nfX40xklpSj8ol/E7sCOh5b8m+OLS9jiUumwTxBV4uUYeGPofmHkKRFAqQPjNP3sVK7+3oFvYPDnh
 f5PfU9LJXdix1XkHT8m9Vgnb/K0o0Zjnytw0a+I1WaIKBuYCEfRu6Z6C7OMn/4WUnFNgcdhFh1ah6
 ZPPJ7mXoeOipe/ehC75tnU7q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzxta-007pbn-2R; Wed, 02 Apr 2025 13:12:42 +0000
Message-ID: <37c06470-57fa-47b4-9aa8-50f1cefa713f@samba.org>
Date: Wed, 2 Apr 2025 15:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: I/O-stat module for Samba
To: Shachar Sharon <ssharon@redhat.com>, samba-technical@lists.samba.org
References: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4xutNTeQljrxPTc0uxmq86BM"
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
--------------4xutNTeQljrxPTc0uxmq86BM
Content-Type: multipart/mixed; boundary="------------daNSUI3iB47BS80AQZOHx8LY";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Shachar Sharon <ssharon@redhat.com>, samba-technical@lists.samba.org
Message-ID: <37c06470-57fa-47b4-9aa8-50f1cefa713f@samba.org>
Subject: Re: I/O-stat module for Samba
References: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>
In-Reply-To: <CAF8sLVX=j571xk8Z10WRinb=tb4OjJNgcQ+vm-eO8SR6C0XU=A@mail.gmail.com>

--------------daNSUI3iB47BS80AQZOHx8LY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2hhY2hhciwNCg0KcGxlYXNlIGV4dGVuZCB0aGUgZXhpc3RpbmcgcHJvZmlsaW5nIG1l
dHJpY3Mgb3IgZXhwbGFpbiB3aHkgdGhvc2UgY2FuJ3QgDQpiZSBleHRlbmRlZCB0byBwcm92
aWRlIHRoZSBuZXcgcGVyLXNoYXJlIG1ldHJpY3MuDQoNCldlIHNob3VsZCBoYXZlIDgwJSBv
ZiB0aGUgY29kZSBhbHJlYWR5IGluIHBsYWNlLCBzbyB1bmxlc3MgSSBzZWUgDQpjb252aW5j
aW5nIGFyZ3VtZW50cyBJJ20gb3Bwb3NlZCB0byBhZGRpbmcgYW5vdGhlciBWRlMgbW9kdWxl
Lg0KDQpUaGFua3MhDQotc2xvdw0KDQpPbiA0LzIvMjUgNjoyNCBBTSwgU2hhY2hhciBTaGFy
b24gdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4gU2FtYmEgb3ZlciBDZXBoRlMgaGFz
IGJlZW4gdW5kZXIgaGVhdnkgZGV2ZWxvcG1lbnQgcmVjZW50bHkgKGhlcmUsIGF0DQo+IFJI
L0lCTSkgYW5kIHdlIHJlYWNoZWQgdGhlIHBvaW50IHdoZXJlIHdlIHdvdWxkIGFsc28gbGlr
ZSB0byBleHRlbmQNCj4gU2FtYmEncyBJL08gbW9uaXRvcmluZyBjYXBhYmlsaXRpZXM6IGlu
c3BlY3QgdGhlIGxhdGVuY3kgYW5kDQo+IHRocm91Z2hwdXQgb2YgZXZlcnkgc2hhcmUgZnJv
bSB3aXRoaW4gdGhlIHNtYmQgcHJvY2VzcyBpdHNlbGYgKHBlcg0KPiBub2RlKS4gSGF2aW5n
IHN1Y2ggcnVuLXRpbWUgbWV0cmljcywgd2hlbiBleHBvcnRlZCB0byB0aGUgc3RvcmFnZQ0K
PiBhZG1pbmlzdHJhdG9yICh2aWEgQ2VwaCBkYXNoYm9hcmQpLCB3b3VsZCBwcm92aWRlIGEg
YmV0dGVyIG92ZXJ2aWV3IG9mDQo+IGNsdXN0ZXIgc21iIEkvTyBhY3Rpdml0eS4NCj4gDQo+
IFNhbWJhIGFscmVhZHkgaGFzIHByb2ZpbGUgY2FwYWJpbGl0aWVzICh3aGVuIGVuYWJsZWQp
IGJ1dCB0aG9zZQ0KPiBjb3VudGVycyByZXByZXNlbnQgZ2xvYmFsIHN0YXRlIGluc3RlYWQg
b2YgKGR5bmFtaWMpIHBlci1zaGFyZSBzdGF0ZS4NCj4gDQo+IFdlIHdvdWxkIGxpa2UgdG8g
cHJvcG9zZSBhIG5ldyBzb2x1dGlvbiB3aGljaCBtYXkgYmUgdXNlZnVsIHRvIG90aGVyDQo+
IHVzZXJzIGFzIHdlbGw6IHVzZSBTYW1iYSdzIHN0YWNrYWJsZSBtb2R1bGVzIGNhcGFiaWxp
dGllcyBhbmQgcHJvdmlkZQ0KPiBuZXcgVkZTIG1vZHVsZSAoInZmc19pb3N0YXQuYyIpIHdo
aWNoIHRyYWNrcyBJL08gY291bnRlcnMgcGVyLXNoYXJlDQo+IChhbmQgcGVyLW5vZGUpIHVz
aW5nIGluLW1lbW9yeSBjYWNoZS4gVGhvc2UgaW4tbWVtb3J5IGNvdW50ZXJzIHdpbGwgYmUN
Cj4gZmx1c2hlZCBwZXJpb2RpY2FsbHkgaW50byBsb2NhbCBUREIgZmlsZSBhbmQgbWF5IGJl
IGNvbnN1bWVkIGFuZA0KPiBkaXNwbGF5ZWQgdmlhIG9uZSBvZiBTYW1iYSdzIHV0aWxpdGll
cyAoZS5nLiBzbWJzdGF0dXMgb3Igc2ltaWxhcikuDQo+IA0KPiBBZHZhbnRhZ2VzOg0KPiAx
LiBUcmFja2luZyBJL08gY291bnRlciBwZXItc2hhcmUgZHluYW1pY2FsbHkgKG9ubHkgZm9y
IHRob3NlIHdpdGgNCj4gaW9zdGF0IGluIHRoZWlyICd2ZnMgb2JqZWN0JyBzdGFjaykuDQo+
IDIuIExvdyBvdmVyaGVhZCB3aGVuIHdyaXRpbmcgdG8gVERCIGZpbGUsIGV2ZW4gd2hlbiBo
YXZpbmcgaHVuZHJlZHMgb2YNCj4gYWN0aXZlIHNtYiBzaGFyZXMgKGVhY2ggcHJvY2Vzcy9z
aGFyZSBoYXMgaXRzIG93biB1bmlxdWUgVERCIGVudHJ5KS4NCj4gMy4gTWF5IGJlIGV4dGVu
ZGVkIGJleW9uZCBtb25pdG9yaW5nIChlLmcuOiByYXRlIGxpbWl0cykuDQo+IA0KPiBBIGJh
c2ljIFBPQyB0byBkZW1vbnN0cmF0ZSB0aGUgYWJvdmUgaWRlYXMgY2FuIGJlIGZvdW5kIGF0
Og0KPiAgICBodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9kZXZlbC9zYW1iYS8tL2Nv
bW1pdHMvc3luYXJldGUvdmZzX2lvc3RhdF9wb2MNCj4gDQo+IENvbW1lbnRzIGFuZCBpZGVh
cyBhcmUgbW9zdCB3ZWxjb21lLg0KPiANCj4gLSBTaGFjaGFyLg0KPiANCj4gDQoNCg==

--------------daNSUI3iB47BS80AQZOHx8LY--

--------------4xutNTeQljrxPTc0uxmq86BM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmftN8kFAwAAAAAACgkQqh6bcSY5nkZk
FRAAuNJHFB2MXswEhZWdh5+Gn7s2EVyv3/9lJu1PV+gKCDFFlOgFH/y6PoeVivYGcLO+eb73BTH6
NhjX/PCUO0ll6JruJqtdlnG9Y3SU/JkcEmK0Z7NX9B6PHTbjqKmXRrPiHgyCxOe1PkWS6sBh4zPk
ruEcRDTjxR8y8YCoZG8PNokb41pbz64q6o0FgLFA2FrG3u+Gp7f+AVHWcLvrirgJdVWSzpI5rvUB
ffGs5Qfv7ZBquHmoyC+M8teVQ+9G2vIfx5pEAqLalXjl3Njzf0S6yR9xqv0NCInwsBVp93vXivuK
4Hh2M871/UfRmDDe2s+ZYjoK81OZAoilFulNdFB+W6A1DPSF5ygp3No2EyOvfiA83Cz7Sy8hZzYk
hepeHNHhNsqfN1FknpMs25/ef0++F5cOnbdcAV4Y3KeWNSN4Sq0J1qSyO53NwnjLiw3qf+oCBYpF
oFwt45V0JZIjOseIUaRjZJ5z3X8E5LfcEeXGiA0rh6XWSz/QUcBgOmoRuxvqpAFeXn6dRa98mWSh
viLoBTxUJFy15hBXTpoEu7cmb6bRlsi8FvvfHfrUBFj1c1yEuIQ3fyiv3DSNBuN4Qqvd3cJvMkHj
Af/+QhFsXKl4atMCsVMD/HvNYKLQoz1XeNnDIqlfFnwkk6AS9ErGAG9Os+hGMgDxlvZhsZyQyq2P
PXw=
=R2MH
-----END PGP SIGNATURE-----

--------------4xutNTeQljrxPTc0uxmq86BM--

