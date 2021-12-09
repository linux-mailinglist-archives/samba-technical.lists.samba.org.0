Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B950F46F3C4
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 20:16:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0rdsW9suf3MBJysEposnHv8ZiYvfMmsVZF771HrAO1U=; b=MmE8PwizLKL9sEBHF2wWErAi3G
	3t5QYNPqI+Ziua9z76cvZp5N6R1FmbO9/DFY6hi7Qen+Q8qVOf31GmmWiZBjpxdVoOVEk2Wa/Ijvu
	VNQfMCLP6jzE5zBnwbhaz2xgcifeBfie6aHEfblRFWARJ/3MpIpsS+V++E0ZHTk+/WRjjmPhLacM5
	2w5hDKiYiGkNXiG5hE86Crc/Sfr5RFuV2yp32AC+C0Q6fWWSM6wMHYXOWwbjbAcgxEJyJXg6m50rL
	tXFcJ9kgomyXTaJ7r0lfuP/63EQSTv2UZ1jrn9Q8nf6ORxEWM3wzbdYFv8nyqtklSa22w3oi1cwRN
	Ze6p59ZA==;
Received: from ip6-localhost ([::1]:41564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvOtJ-004i0s-Ks; Thu, 09 Dec 2021 19:15:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvOtA-004i0j-Of
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 19:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=0rdsW9suf3MBJysEposnHv8ZiYvfMmsVZF771HrAO1U=; b=t95H5PuJlNveEuUXZUSVamPRoH
 +qBWaPrdVXZl79D+vVugWpFeCVFMCEfIwMMj3I88TwRaXTt14zKr5Kalzb+fv9HBJAR2zqJRPYcjd
 1a/GtGgD1utLhZLgH3cIn17S1QAsaKMy4iDNjtpw48Fq7EVU79U9M3VAQ9Rqk+1/vpmJIWIr1+7oq
 S9ytBWw1LsC2yEdmVMyh/c5YKHxUpWyrRfjbJskivi7OvnRZ0ax9IBz9QqFh216+PVS8No7jN/dEy
 bmYwfPM5EA0POOUQqmd+nwfi4olgxihCl3RNCqF9dDWdq1qhLXVg5z/0o9XuWNIgCpF+nUWUUZSYB
 qFnrSnr/eWC25Q3nk1NpgdGcA8rDBnylTBlck9RyiCGb9Y87S9NpvrUDDLjrYKnFiyCi4agS2w6e6
 XZKU57I07rUCS1d+jYh3X/2IB+PwkXntbBnzoN0g1UfnVmnjYZCiJrRLRNejzmNZAbFpbPc6HHOk1
 MHZfCcHg1NUa7om4YVvvIO//;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvOt5-0021tm-NQ; Thu, 09 Dec 2021 19:15:27 +0000
Message-ID: <8d97a6eb-87da-0bb2-b7bd-c5a85da5dd64@samba.org>
Date: Thu, 9 Dec 2021 20:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <YbJTwPO4ytMGFPoc@jeremy-acer>
In-Reply-To: <YbJTwPO4ytMGFPoc@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I0NJ12G3l6iDUiF1gngIoWJx"
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
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I0NJ12G3l6iDUiF1gngIoWJx
Content-Type: multipart/mixed; boundary="------------kLvSMXd2MtlBsdzAA01FLscH";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <8d97a6eb-87da-0bb2-b7bd-c5a85da5dd64@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <YbJTwPO4ytMGFPoc@jeremy-acer>
In-Reply-To: <YbJTwPO4ytMGFPoc@jeremy-acer>

--------------kLvSMXd2MtlBsdzAA01FLscH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvOS8yMSAyMDowNiwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+IE9uIFRodSwgRGVj
IDA5LCAyMDIxIGF0IDA3OjU4OjA2UE0gKzAxMDAsIFJhbHBoIEJvZWhtZSB2aWEgDQo+IHNh
bWJhLXRlY2huaWNhbCB3cm90ZToNCj4+IEhpIFRvbSwNCj4+DQo+PiBPbiAxMi85LzIxIDE5
OjQ4LCBUb20gVGFscGV5IHdyb3RlOg0KPj4+IEkgcmVhbGx5IHRoaW5rIHlvdSBuZWVkIGEg
YnVsbGV0cHJvb2YgbWF0aGVtYXRpY2FsbHkgY29ycmVjdA0KPj4+IHVuaXF1ZWlkIGdlbmVy
YXRvciBoZXJlLg0KPj4NCj4+IFBhdGNoZXMgd2VsY29tZS4gOikpKQ0KPj4NCj4+IEkgZ3Vl
c3MgYWxsIHdlIGNhbiBnZXQgaXMgYW4gYXBwcm94aW1hdGlvbi4NCj4gDQo+IEdVSURTICEh
ISA6LSkuIHV1aWRnZW4gOi0pLg0KDQo2NCBiaXRzLi4uDQoNCi1zbG93DQoNCi0tIA0KUmFs
cGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9y
Zy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90
ZWFtLXNhbWJhDQo=

--------------kLvSMXd2MtlBsdzAA01FLscH--

--------------I0NJ12G3l6iDUiF1gngIoWJx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGyVc4FAwAAAAAACgkQqh6bcSY5nkZn
yQ//R/EDayvRXWTuA//sADZzXsYKkRWg+WakzfgESI3neg8vwR56tuS11owMJEunHSljruAxAjjG
QcEQjgUYsT/KjdLIcAJ2C187KgienP2nuVhx3Ic5wcptiOw+Ob7fFxHUhp/wOGmgIVr9E0heQWUk
L536ziwJGhxEwpe/wGZfRFB8AtXb5xMHIlmDxDBX8eFuKo7mYsM7pM8QjoXtCp0b4YT7odP6dipt
iOYx7fso5fyBJlj58kAPZ0TXC/0VG4wFK96jjbMS8Lo/bAjX0HvnGYJCi3zU0ZP1vE/AlgR0p7/O
wJ8aG3FGET96EZ75dfL3vGRwjg0FDjgpPHKnSPyO9juW2/t+pjhk4efmb+tP+O2CS7LB3X8WyyGZ
dDUoKU08jwhUh1vdk9HSAZKdLi+rZNE2F/fNpDFAw/Ge/gYdXKrpTFYrrq2wAZLeFhBs4+1/z5yr
zg7Sr8q8IHN9f7RazNhlEcLq+MXj9KAALFKo4htbJpk8RlIro4Qw6+qEnBb4yeBxLuRt0S2HScph
JuNn878tv8x8bNURXfo9PJzs7LPuLFA/fYMuuoG57ZFnX+vhS862IPtfMda2Oe2PmBSEmXXcfJ2j
HRUHGcTzYba01FXOQ+cEzLDeFvlLHxzbVe5J/pAmUTaOPzYLKdTaoTo3aLl20rrCk5WgDg/jWgRO
sFg=
=ppqZ
-----END PGP SIGNATURE-----

--------------I0NJ12G3l6iDUiF1gngIoWJx--

