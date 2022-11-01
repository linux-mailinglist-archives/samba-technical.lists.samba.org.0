Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277761478B
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 11:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=y/Ux0yRrezn9C+u9iFs7luZHIoj3DHxqDpZWVsAysyk=; b=5HVgBRfxfYcLLnnDSNfnCgt7vf
	Ee6iQu/SqOfjb3m0nXm8FqnYIZ3yX/aXOZbJVPDt8xiT4TOz3htLLT9WvOw5dqR79bz61752cdGQN
	c1jEA+fmxwIl7KvgGh0iwMGuuBX4Ywd1uz+qMseVDxcjS4sXRHDrvHGo1/RG6bXCRDtxwPhEF+fc/
	G9awy3M+3+evnXhvEp1T3emxgj9/hyjjQTE9mUvKdAniqFHhX1HGCC4iG8VSJexIc0xbuJ8YYhDRX
	jKypzuLIy0zepBk+K0mvTf4f9/CJGPGZAchi4c5NOZRl8wRwIVWMDmH1iWHg05pPO5fnJiBJTAi36
	Mz08M7XA==;
Received: from ip6-localhost ([::1]:36550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opoIB-009o5P-Hj; Tue, 01 Nov 2022 10:14:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opoI7-009o5G-Db
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 10:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=y/Ux0yRrezn9C+u9iFs7luZHIoj3DHxqDpZWVsAysyk=; b=E6NQktpddexK7wRMGAbGoholBS
 5U/hDAuArfpdBDppZBVQ8NLjPRlictB23atMtDk9BYaz5yCpePeFIZrQEfZpM/5xHX2QLQBfg6E80
 +vdf4YHZbdjfW20QyZKRUFw4X18WdNp8bFJI7PJtXd1sohQ1xhDyFfbRE/IRE/p30IJtTG5EPoqQr
 FpgzAquqkFR9zw5D6T5DNz3r/UYcmRRzMg9sBGb3OhTJ8d9ZdvH+VJ92Jl8XxhOzcjiQKTviKpweQ
 0ZYAoy0/qFvd6+LHM9Bp2TMzVzcfwpig3HGyidD/m8vDNPbIMyDO0MMOBiGT3ssFgpbd45sbr1z88
 m1l2N167/4R9JKX8WJJXbkIeCBAnhlP4E0l6JN2/0oYPvTtXLGYpfZSz4AGgbm2ApifoOOr2moOAJ
 rfWvAFloq/T8fvWWrb7p2J8uWiOPWzJp7UJUhLE+kRtr+/+nuu8Rjfil+1iSG7ErN2JmyDcwPvyVV
 PXCwt1sEkKsegpPqMTu6o9Kt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1opoI5-006iUG-VA; Tue, 01 Nov 2022 10:14:42 +0000
Message-ID: <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
Date: Tue, 1 Nov 2022 11:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Michael Stone <mstone@debian.org>,
 1013259@bugs.debian.org, Andrew Bartlett <abartlet@samba.org>,
 =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipen@redhat.com>,
 Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5dbe20a-592d-11ed-a0b8-0dc32809422e@msgid.mathom.us>
 <21220e0e-8c2c-f9ed-402f-6d95f1489d0b@msgid.tls.msk.ru>
 <C5F51D22-A00B-4165-966E-EA4724984304@debian.org>
 <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5341d49-8d32-9ec2-b78e-8fa2ab4ea0f0@msgid.tls.msk.ru>
 <3c737677-d905-2657-bad5-d00deaa73043@tls.msk.ru>
 <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>
In-Reply-To: <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZR2nHxtvEQJG8nJ1T5pNHzAa"
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
--------------ZR2nHxtvEQJG8nJ1T5pNHzAa
Content-Type: multipart/mixed; boundary="------------1nVtX02q0xdd0ngJs06qgDf0";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Michael Stone <mstone@debian.org>,
 1013259@bugs.debian.org, Andrew Bartlett <abartlet@samba.org>,
 =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipen@redhat.com>,
 Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <a7bc19e7-ba95-8d9f-3d0e-69efeabb4b9f@samba.org>
Subject: Re: samba-libs: Possible policy violation (now with unnecessary
 soname bump libndr.so.2 => libndr.so.3)
References: <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5dbe20a-592d-11ed-a0b8-0dc32809422e@msgid.mathom.us>
 <21220e0e-8c2c-f9ed-402f-6d95f1489d0b@msgid.tls.msk.ru>
 <C5F51D22-A00B-4165-966E-EA4724984304@debian.org>
 <165571437894.409869.15645128981524194043.reportbug@dhcp-1.rz.nm-ict.de>
 <d5341d49-8d32-9ec2-b78e-8fa2ab4ea0f0@msgid.tls.msk.ru>
 <3c737677-d905-2657-bad5-d00deaa73043@tls.msk.ru>
 <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>
In-Reply-To: <8753e50d-5041-ae56-8b94-acee48afd32a@msgid.tls.msk.ru>

--------------1nVtX02q0xdd0ngJs06qgDf0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMS8yMiAwOToxNSwgTWljaGFlbCBUb2thcmV2IHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IENvbnRyb2w6IHRhZyAtMSArIHVwc3RyZWFtDQo+IA0KPiBPcmlnaW5hbCBj
b250ZXh0IHdhcyBhdCBodHRwOi8vYnVncy5kZWJpYW4ub3JnLzEwMTMyNTkgLCBidXQgd2hv
bGUNCj4gdGhpbmcgKm5vdyogaGFzIGlzIGFib3V0IGNvbXBsZXRlbHkgdW5uZWNlc3Nhcnkg
c29uYW1lIGJ1bXAgb2YgbGlibmRyDQo+IGluIDQuMTcgZHVlIHRvIGRlYnVnZ2luZyByZWZp
bmVtZW50cy4NCg0KdG8gbWUgdGhpcyBsb29rcyBsaWtlIGEgcGFja2FnaW5nIGJ1Zy4NCg==


--------------1nVtX02q0xdd0ngJs06qgDf0--

--------------ZR2nHxtvEQJG8nJ1T5pNHzAa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmNg8ZEFAwAAAAAACgkQqh6bcSY5nkZ/
DhAAurc814FW97loaICp8LOabm/Ss9PaSO9/zM1KiQUXJ5VbIx3pprLuozaGPAzBhVGhBMlaxXGB
ZNGFYc+t4z/2Fv/AEhE0ZgdKaP1DjqBc3+CXkBJzSk8imFTw2dN1SS8PcFwEPXAtnezl5GMt8eXc
hUdrmiwnI8pR1DIGxKflZzZMy2+WAeYYHAQojTRKZ6h8NxbXeSQJPs3oKqx8AVXsN07RczqZsWpk
MXrzzniNrzCI/eqt/qP+nP4fVjSw4DwFE74Cl0uasKjMeofEeZUACnLK/7L7aD6rL5HXhGjd8SOR
O7ZPC/vCJrCly8COo8pH5l3T2PFTlNUTJhn8PhcnPRZtxZWl/3LJMWEtDd7LPy7nogUL2gLfku34
AmQmQFtw1AKqoLwy9o2am4sRuLJ4LDn5dlgmnQhem+NuCOVxyeRfaZ2tQf07aSVR/DXIqvrzv89J
FUuzUnBfW1IjhHtfZaAIPL3QHXiRIfVIIqSTBQU6lG5QGDSHqQAvxnj1Oa6hhMfZBFNVw2+P3Eh6
yrZPpTJl2E5mKpOwCyeRoVYtcHn1Dtd+O5PrYvHD7dWFJaIgD0hTTrOJdGQnLkuEsg5IXcxfN+m2
r8/PbKfxSzkSsY9lA8p/3PjcS7xVGubzvKnlJc0YON5seSPAO/k136+bdFQ8huupsvocBCHu56Fz
c3I=
=UP3T
-----END PGP SIGNATURE-----

--------------ZR2nHxtvEQJG8nJ1T5pNHzAa--

