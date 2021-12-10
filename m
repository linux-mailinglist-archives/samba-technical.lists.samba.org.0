Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCC47016B
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 14:19:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tbCxUFRCITnIinH0UvnhfzvBFdLVZ7+MLVrbO2+GyM0=; b=AFvVRvZAArAD6qo3VYVy4CQkLg
	8COLT9EMgfy/9qJj5DC3LhicpWyxhAFdcOdu/IGqXgt7gIEGlSZw9e40dGCTaq0xDmNwzHsHFSeG1
	5QtIUd9A6UfEZBODewDTqcsbSGyPaEPPya8oalvnxkoZZw311coXCuYCN0O8pGPiUVvZOJL7VDY9o
	nq6MC8jAJNwMi8bsZk8ug62SVCvu7BRc94v0Oe6L+2k44+jT6ApYndQUzsseGG0Lb7ai/4A9BKKS/
	EAJMiTiTvEkdYYH1824D/w50izsN2MCSb11mZRY9YyBwIOkKrp/6rDVADmjH/1bM38XRsE/TA160b
	dPbnaOEw==;
Received: from ip6-localhost ([::1]:60778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvfnX-004rDV-AR; Fri, 10 Dec 2021 13:18:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54410) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvfnS-004rDK-4y
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 13:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=tbCxUFRCITnIinH0UvnhfzvBFdLVZ7+MLVrbO2+GyM0=; b=Rvdh3EnHVkBIcZyy+jVWUPUuwt
 0Obq8jpy+bROJAvk9TcyLEFJubdwTHwapGn6FL7ROFnsyvQUKX9HSycCf/sDcQK7f9A8PFsyQUHQk
 e83x0YFOkfIGEwJH7UnxBx920RbVjJLfIEoemlmhhTUhLoj3y/fIwAizuLI2xrsfzgsuWvPj/mQTV
 cZ58XOaaofJhfiK2HhLNaClxmEDojPPZV5sJuFRcjNH95KfKvRi0roOa9/XaKvYOmYrihOnOtLE3D
 1zdPQu2BFGzRsDo38c9JZhZyGgV8vhc9OtqDPrXcPcCC76zSk1n01VNV2TM9qmfWj6UEBl++1BerX
 i/0uZZ4VZ9fxk8jrTJVtHgoRUrFN3QrfsOK/MtsMYG3aNNoJqovM/mVjONY+2c7HczCHvI8jtQvWI
 8rXzHSPCywMNdbwzzZ1b9AKUBhHuQXlYSwK0irP4gH6yTcWEuI29gFRwIKb5ewbL/nTwZlt+UcNYS
 lM0C+eBzHrOIDZ3joF5ZF40u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvfnN-002AEX-DZ; Fri, 10 Dec 2021 13:18:41 +0000
Message-ID: <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
Date: Fri, 10 Dec 2021 14:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
In-Reply-To: <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iwy18sZOmNmkZAyoZI2HD0lN"
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
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iwy18sZOmNmkZAyoZI2HD0lN
Content-Type: multipart/mixed; boundary="------------Bjq7whfJnIZkVGEoYhVkVm6u";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
In-Reply-To: <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>

--------------Bjq7whfJnIZkVGEoYhVkVm6u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTAvMjEgMTI6NDksIEFuZHJldyBXYWxrZXIgd3JvdGU6DQo+IENvcnJlY3Q/DQoN
CmV4YWN0bHkuIFRoYW5rcyBmb3IgZGlnZ2luZyBvdXQgdGhlIHJlZmVyZW5jZXMuIERpZG4n
dCByZW1lbWJlciBJIGV2ZXIgDQp3cm90ZSBzdWNoIGEgY29tcHJlaGVuc2l2ZSBzdW1tYXJ5
LiA6KQ0KDQpTbyB3aGF0IHNoYWxsIHdlIGRvPyBCYWNrIHRvIGlub2RlIG51bWJlcnM/IEkn
dmUgYmVlbiByZWNvbW1lbmRpbmcgDQpmcnVpdDp6ZXJvX2ZpbGVfaWQ9eWVzIHRvIGN1c3Rv
bWVycyB3aG8ndmUgYmVlbiByZXBvcnRpbmcgc3RyYW5nZSBpc3N1ZXMgDQp3aXRoIE1hYyBj
bGllbnRzLiBUaGF0IGNhdXNlcyBTYW1iYSB0byByZXR1cm4gMCBmaWxlLWlkcyB3aGljaCBo
YXMgYmVlbiANCnByb2JsZW1hdGljIGluIHRoZSBwYXN0LCBidXQgaXQgc2VlbXMgdG8gYmUg
d29ya2luZyBhdG0uDQoNClRvbSwgZG8geW91IGtub3cgaWYgaXQgdXNpbmcgYW55IG9mIHRo
ZSBtZW50aW9uZWQgZmFsbGJhY2tzIGZyb20gTVMtRlNDQzoNCg0KICAgRm9yIGZpbGUgc3lz
dGVtcyB0aGF0IGRvIG5vdCBzdXBwb3J0IGEgNjQtYml0IGZpbGUgSUQsDQogICB0aGlzIGZp
ZWxkIE1VU1QgYmUgc2V0IHRvIDAsIGFuZCBNVVNUIGJlIGlnbm9yZWQuDQoNCiAgIEZvciBm
aWxlcyBmb3Igd2hpY2ggYSB1bmlxdWUgNjQtYml0IGZpbGUgSUQgY2Fubm90IGJlDQogICBl
c3RhYmxpc2hlZCwgdGhpcyBmaWVsZCBNVVNUIGJlIHNldCB0byAweGZmZmZmZmZmZmZmZmZm
ZmYsDQogICBhbmQgTVVTVCBiZSBpZ25vcmVkLg0KDQp3b3VsZCBiZSBhIHdheSBmb3J3YXJk
PyBNYWNzIGNhbiBkZWFsIHdpdGggMCwgbm90IHN1cmUgYWJvdXQgVUlOVDY0X01BWC4NCg0K
VGhhbmtzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAg
ICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAg
ICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------Bjq7whfJnIZkVGEoYhVkVm6u--

--------------iwy18sZOmNmkZAyoZI2HD0lN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGzU7AFAwAAAAAACgkQqh6bcSY5nkbB
fw//ezPHS34woexlqIRx57+gQlPBR+lL9g0+BmGNA7KfrDozAWezTr2L+hIJkPJiGQleBf6YZcfV
VSvyBaWPON5j3XDNRLxNFvPsuoLYIgTaupPmiwikC3QopMM4rmm8mwvq9LDMvXW3s//kKkEHGS2d
e7pcKRtV5WKm5ErNJJJQtajd1Pvj0Z/uF5kZa6aU0sBW6ho7l4kdNPNXqxr0fOAphWaRKjDPcQE0
RvMyKIh34x0wv+LzfwPfNccJKAlNiSbqhFBJ7Mbe79l5JxxVeQ6OFno8ffRaM0WBPROjAQxFUuQD
M5jVEAfThzOa5YppvfKjABfNRvottfPTqRgNC8XDONWwiMvG1uEZNUVGTdxfmsi4eYzV48BFoL4u
fnnGrFz1Yo96N1LBWuozgsHEXnic4qLF1LWYF3bUjXdlBB96/XkXB6/ohoblN46cxwo9kjZ2ALyW
c8ym7oHSUqnVAq4BhupYAUqQC8KqtDE5UuStoQcj+tD/hqB6oSr7T/TiPi40wIklzRF/CN8q6Dmn
Yl8ctQh86/BwTaebmo1kWsqtvGdP42Zf0p1XP69NpF05sO5CstOWp6Koz5EqNGJTDXH8YqofdX27
YnDHGRThPzm/KWa8YcZKgvz4/Useb6+ovXd5hwMb9Hi4wF3xwvwN4oytgB4n7kqOS2pDbDVnKQul
dY4=
=g99W
-----END PGP SIGNATURE-----

--------------iwy18sZOmNmkZAyoZI2HD0lN--

