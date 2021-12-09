Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BE46E152
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 04:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=SqS7PGK4AYJGtG5KpHAktG+dS6f+6E72rePDQKgZ4GI=; b=srtQlrruKicd6fkCRzl+yXQtB+
	ZWYzf/6x2aWeQ+yP82KQ9s022JRGdbTkWtyKL81BALK1s0J8+sAVrNkVGBima4ydKEZxhfimWkcAe
	KyUu4lfOXZARqELlsnJBaZJSeLHvio8Y1jwlpiMls1iSHz58/HGN17wk4P0dX/vAXDo9JlypLstLG
	fWOnqy23RNyIFnsXuuUdNad5cRf+jzcYmvyQd5JYNOkgJujnrI18YXyyz3oQsIAswN2zxB/wOvQC5
	3A0OtbL7tUu00X2d6nznk3La2Pu+2+PCQV4Zb2CMUvXPiAdrB6cWQlNQG8VvTbPVZ0SWRRAIFesoC
	3ehSm+yA==;
Received: from ip6-localhost ([::1]:49648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvAF1-004Qjv-UE; Thu, 09 Dec 2021 03:37:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54368) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvAEw-004Qjm-Rj
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 03:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=SqS7PGK4AYJGtG5KpHAktG+dS6f+6E72rePDQKgZ4GI=; b=MyBt4ypdxfPz5r4QLq+sV1TQ7T
 BDIg1n6mWlefhzTc9k47oxuSMTksAZjlSj+H+/YMPO0oF2WiD6RSJ2GagqeLYY/w2wOn/ZHO+2bVS
 jBRKoT7L3Zi7AMlTfHo4F4VH5/Hp+Bm1Duml350vMfngGHcSPvdjKXcRqyryfilXPnCGonOMVcFeZ
 cwEo3Kbw/UnSKs9RbjdjJxZar1G68C+ZQgDAcbdWcitQcp6PNvUsLgj0SBpz8uZiTaedp+w5srIUM
 Fde9h1uMyXJR/mLecrRGvGWHyFiDF6+IoMLAJ80C0eyBgLmXk+EAz3CgvCdUbKBPWPyXtzD92jSoo
 f0FkFxfQ6uIJkPqm/24J9F+GpTsuwKlGABilIBGrV3gh7XxqRRt4qR5LwPohH3/Wc5FSnl/HW8u+K
 6SwijzqXO5tYayAp8tnyHbDFSLRegCGyhK1Rv364oRXy9gMyaFT9B0rQOrO+yOqsKO0yDCqTxJycj
 TnHJgklCZGr+ZSMFQpnIfjuP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvAEr-001tbs-8A; Thu, 09 Dec 2021 03:36:57 +0000
Message-ID: <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
Date: Thu, 9 Dec 2021 04:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Tom Talpey <tom@talpey.com>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
In-Reply-To: <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ug3o5Rk2YmTntKdaZiCvV0FA"
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
--------------Ug3o5Rk2YmTntKdaZiCvV0FA
Content-Type: multipart/mixed; boundary="------------3I4ir001z3w0Bn3NFTWcx8TU";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
In-Reply-To: <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>

--------------3I4ir001z3w0Bn3NFTWcx8TU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVG9tIQ0KDQpPbiAxMi84LzIxIDIyOjE4LCBUb20gVGFscGV5IHdyb3RlOg0KPiBJIGhh
dmUgdG8gc2F5IHRoYXQgSSdtIHNpZGluZyB3aXRoIFN0ZXZlIG9uIG5vdCB1c2luZyB0aW1l
c3RhbXBzLA0KPiBldmVuIHdpdGggYSBtb25vdG9uaWNpdHkgc2FsdC4gVGhleSdyZSB0ZXJy
aWJseSBvbGQtc2Nob29sIGFuZA0KPiBmb3IgZ29vZCByZWFzb24uIElmIHlvdSB3YW50IHJl
bGlhYmxlIHJlc3VsdHMgd2hlbiBydW5uaW5nIG9uDQo+IGV2ZXJ5dGhpbmcgZnJvbSBlbWJl
ZGRlZCBBUk0gc3lzdGVtcyB3aXRoIEZBVCAoMi1zZWNvbmQgZ3JhbnVsYXJpdHkpDQo+IG9u
IGFuIE1NQyBjYXJkLCBhbGwgdGhlIHdheSB1cCB0byBzZXJ2ZXJzIHdpdGggUE1FTSAoPDwx
dXMgYWNjZXNzDQo+IHRpbWUpIGFuZCBuZXR3b3JrcyB3aXRoIDEwMCsgR2JwcyBwaXBlcywg
dGltZXN0YW1wcyB3aWxsIGJlDQo+IHdoYWNrLWEtbW9sZSBmb3IgbWFueSB5ZWFycy4gTUhP
Lg0KDQpJIGd1ZXNzIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGZpbGVzeXN0ZW0gdGltZXN0YW1w
cz8gSSB3YXMgc3VnZ2VzdGluZyANCm1vdmluZyBhd2F5IGZyb20gdGhhdCBhbmQgdXNpbmcg
c3lzdGVtIGhpZ2ggcmVzb2x1dGlvbiB0aW1lciwgbm90IA0KZmlsZXN5c3RlbSB0aW1lc3Rh
bXAuIFRoYXQncyB3aGF0IHdlJ3JlIGN1cnJlbnRseSB1c2luZyB3aGljaCBzZWVtcyB0byAN
CmJyZWFrIG9uIGNlcnRhaW4gZmlsZXN5c3RlbSB3aXRoIHRvbyBsb3cgcmVzb2x1dGlvbi4g
V2UndmUgYmVlbiB1c2luZyANCnRoZSBpbm9kZSBudW1iZXIgYmVmb3JlIHdoaWNoIGhhcyBp
dHMgb3duIHByb2JsZW1zIGR1ZSB0byBpbm9kZSBudW1iZXIgDQpyZXVzYWdlLg0KDQotc2xv
dw0KDQotLSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0
cHM6Ly9zYW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9z
ZXJuZXQuZGUvZW4vdGVhbS1zYW1iYQ0K

--------------3I4ir001z3w0Bn3NFTWcx8TU--

--------------Ug3o5Rk2YmTntKdaZiCvV0FA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGxedgFAwAAAAAACgkQqh6bcSY5nkYs
HxAAhwBPbipYSofi8HvQJ54YOsRD7x6oAqJUArIH4JprgfwD+ICSCDsx6V4yFVwqG35JijH7Ijq2
3iC8YFPOmOHqacyuPqS0A0rfk0Bm3TzYcWYHWf3BCGN6s5xSJ6dbcmJnNSHqFGgU3W5FbGbO9FEL
JF7zq18aVROhGFaersw0s88f/fDnZAb2dswq2I/1lF2briPTiTrMGhIQ0Gde4DEiqUtGPTpQCpvo
5+LkacG7m3DkYoku148bzFE88LEnPXq3cLnNCt29gd7c35Fibgb/pkhwYGcUh+ebsV7nZXO4TjWd
fLAA6WokkH19NrkEjUbHIpHmr2sqAentk8kFsZyw9wAMrQuGCiZDgnee/X5ssuCgsVdn94wNM6ik
DPWhmsIOd08GqpAV8jBFkUzN4sUkBKKx5wB/3on91K1EDxyf0h8swy0oLMP3qi6sqEJDnOKaBxJq
2yKGakbQVAHsveIhmTW/l5gjJzPd+2DuNQ5iWmkDdMCsS9Z+83/LwJlV9WHU/YRsRFy/xMLuRUcz
EaQv8dslgsryZ+1s1XpZxAt7WNDqRYsM8RkzFCbd9ix9QKT6Y1FhciwZaGO80B2DLh4urMreSSkf
nr2rs8Kq3mRi/Hee6lK8gFIpGDvOpMOIE9e51iLoCc0HSwi8P5cmfldxXoWWyvOuhK8FxxguJ6VU
O3Y=
=6iEm
-----END PGP SIGNATURE-----

--------------Ug3o5Rk2YmTntKdaZiCvV0FA--

