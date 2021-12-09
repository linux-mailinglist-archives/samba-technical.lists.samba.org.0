Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E070746F389
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 19:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sGgX9CiBgGEQ8x6yaNU/9mcKsEPtzJvWeBhRBtmUvyY=; b=naGabgRcq3DIPUa+WviEv+J3MK
	txM3aUec0e8J3mvbA8C1C6swiPdqUjPS4Vu7lGFjRyjMItN3qAuaenLB/w1HYlygoxlqCU0JCPBwM
	knV01YGwCv9Y5Tck604iFxyWCqR9YqURMQXpXQi39pnwiskVdtGTcyZU6avPCpxLifk/ZQE4asi+s
	v/ifNhE0j/Y4M6Ptz3u8bb9sX1FZB7pdQuXXFkgciFfF61W6OBSJs0+VGmYDsTVmnk+Vn+M9BZbDz
	gvJoWcccgrTYUaukjdJJjM+X7sFiBBMhuHrz7UP3PZ0BBXtUi+5QulK2qCgWvlQuQ03cT46dSxkS9
	OznXAtFQ==;
Received: from ip6-localhost ([::1]:35876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvOcQ-004ffU-FU; Thu, 09 Dec 2021 18:58:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvOcJ-004fdS-Mx
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 18:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=sGgX9CiBgGEQ8x6yaNU/9mcKsEPtzJvWeBhRBtmUvyY=; b=Iy8IpMXaCTQ/ISfcO12D1APWV8
 8sZGhqF8HRcIY5P/VA9zQpt2LePhdDJQxO7Ojgq9If9ZeKBJ6fQwirSuFMoFGcAj9fmi1SApO/ii8
 3jhVObxT+iQDOYbY6d4PZ7vNmHhlMpL2y5fCzl7Xph2m1WsQ6aZVPXCRLCzUFiQ8AcfMPSORmsL0m
 idyJ/Vyt9B8mM1php8ow17OSeOElvYra7zIvt58+i5aH24aMy2FiICy2ERHjW5oe3TGVMSAo216Pc
 M/NrWfIQGj73Yj98uXLA6zk/89rqRXurLim5OOynCVEOv/s62wyGiwvnotRl1s0IBu/jvSK2GAtoE
 iGjUbJo8OmxVXnaqSOz3teX2+nO+Sc8dlw/AhvJrWcYD2XhW6HiZef0yU3mcBiqwq8lr0cwbHVdXb
 RpmzfPTHZuI4KSoQV+JHlgFixCIbUHo7NLtYpuzO5vxdXxTM5/PPk67XbIpi0dC2ByeZ40sxM4UUn
 nOkLanAVh+C3Djv6SQT7jbBt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvOcI-0021dP-Qf; Thu, 09 Dec 2021 18:58:06 +0000
Message-ID: <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
Date: Thu, 9 Dec 2021 19:58:06 +0100
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
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
In-Reply-To: <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5gLu5jNqCk3i2KA80wAKq0U0"
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
--------------5gLu5jNqCk3i2KA80wAKq0U0
Content-Type: multipart/mixed; boundary="------------f7pT3n9eVOV3Z1HxacnEHHbB";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
In-Reply-To: <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>

--------------f7pT3n9eVOV3Z1HxacnEHHbB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVG9tLA0KDQpPbiAxMi85LzIxIDE5OjQ4LCBUb20gVGFscGV5IHdyb3RlOg0KPiBJIHJl
YWxseSB0aGluayB5b3UgbmVlZCBhIGJ1bGxldHByb29mIG1hdGhlbWF0aWNhbGx5IGNvcnJl
Y3QNCj4gdW5pcXVlaWQgZ2VuZXJhdG9yIGhlcmUuDQoNClBhdGNoZXMgd2VsY29tZS4gOikp
KQ0KDQpJIGd1ZXNzIGFsbCB3ZSBjYW4gZ2V0IGlzIGFuIGFwcHJveGltYXRpb24uDQoNClRo
YW5rcyENCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAg
ICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAg
ICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------f7pT3n9eVOV3Z1HxacnEHHbB--

--------------5gLu5jNqCk3i2KA80wAKq0U0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGyUb4FAwAAAAAACgkQqh6bcSY5nkZT
7Q/+M7XBPjmDxPVmqai//QwYZNBDQAPczNiz9xgfFK0Q2MhCNYQCsLc7vIzM85sNLj+PvIrMrFMG
Fb7YGOm8COr0kq0S/5oecNQ5w/pV9Q6G8dHdq5ZELfb3KhYzXUSMWnRUK3kI3zWTFVkzhU2LgE4H
JDS6N20wqkJz0LhfVAxwXZKXJAktNmLPFf7+lOx9uavXvDL522dPofLXyfQGsEqcAeme3V2wQVZN
Cs0/6Ppo2+st3y3SPMnbSuyu5MPM1tnegUSnljBTddlx62v1T/AwI46wPXH0IMfQw95TPG1Q1C7S
3iATfF+SGU9fCpL/3SKuQopjxBug3kox2fPaLBz/GnO+YhuyhRcgDsjKf4hs3E2krRJNwSU8zqmC
Q+YjdCjwECNVV2vorTvojWClLMUwseNrub88v5Df1gBfdZFz1cehLMfELuynwiftlXIZr4xUXKWt
wAgP9Grm3tC2B2WKbRhu/etAyVt15LW6ivl5nbRm6eeIRXrQPRoj/OFFjLuA9jGYpJq5BI/nEoLB
XuXzxYWdAJFv+N/8FpTuKW0wrbs4muiZoxeRYSNxpfBDOd+XidUMkoBynd5GERAV/f560B0gSJEV
RIiJn8OBa0NoYCP5+n4qFA/CigNeqDOOhvi8XIaHqVhdm4ZtKDkEt4cuy6oyoylnt4h7BraHyZAs
AyI=
=ydHu
-----END PGP SIGNATURE-----

--------------5gLu5jNqCk3i2KA80wAKq0U0--

