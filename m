Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0330A46CDE0
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 07:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5gIx9HH1oFADuy9lmIqlau/kLWN/HT+HDAmh3P9H8I4=; b=BFyancNjr7K02BpBHHmgbAYpId
	HXd/QgVgZIslrZHNSmhpGqvy6rUid7qnImLHuKdcz+nyW8DWpkJlGuF4GwDhZ2GG0NyPEK5/hfXfA
	tsNqiNlBjYoWhwGnJoT1raqzVgrEUtpi15m0xbPqldPioH2p3ndGJSaL5OpP3veYHajTfz3XCqqco
	vv3XHwQZ0VtcgwgjYrhbdNFoksWd3sqMAFVupEIiv3uUy9+/Ol0qvGGk3pTvIv1I0wSwFc9vm0dmH
	9rdZ+sXK1517xuiT9zao63DANyg+rFLs/OkdkpadYmLGaPbL+LSKXOq3ZCl0oocSvo2iSYred6TSG
	jhhaTHqA==;
Received: from ip6-localhost ([::1]:34326 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muqd7-003zPZ-7d; Wed, 08 Dec 2021 06:40:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54314) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1muqch-003zPP-MA
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 06:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=5gIx9HH1oFADuy9lmIqlau/kLWN/HT+HDAmh3P9H8I4=; b=BbaBWco02BMsW+v46Qbsf49aDA
 EzUTeyyBQidT5qCvlJqW9DZ2cuPc3HQ5Q3kAnmZe7X4cWXmMDvc8l0f3nCxXZsqcLk1ncgMzBswwM
 AFJ4EFs1G2V+b3uAlD7auyLFyCbYcLkmPJT4KfK5xkZcaSFp60zSqUjUzVUZguEyv7JrssHlqywXH
 pJxYcBYKNu3brCvo2ztomYngCZ4+RR/0sr5Q9wkpnXGYqEsvQmz8Dq+9R2So09w+85ospuiCqizaS
 y2DcGfjawolB7uy/XexnkQUWcXSM0/BVtKaqb5SRUs3IwqmUYd7NCYuBqEz2i+2g9/celuGtZwv0Q
 lImOjUfz+rx62p5gWU9aOeVrE2m5BDMxsyqvNU24iv0L0u8JJvdWCMv60EhsxHzcsNzDVb8IqEDg0
 CkkybvIJMBd3IpyqvYrcqyAVoccGd9Jk82htyv/xsT/ktitywCcA+hyPvvCxp9y8gLgay3jUKROW/
 3LUoagZs7cknvExqgOzs2QZ3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1muqcd-001jcY-6H; Wed, 08 Dec 2021 06:40:11 +0000
Message-ID: <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
Date: Wed, 8 Dec 2021 07:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7OC4Jpf1Ni60cJmp1nDumwQj"
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
--------------7OC4Jpf1Ni60cJmp1nDumwQj
Content-Type: multipart/mixed; boundary="------------gDyl2yvbw4oHnPaevpu0tJUx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>

--------------gDyl2yvbw4oHnPaevpu0tJUx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvOC8yMSAwMDoxOCwgU3RldmVuIEVuZ2VsaGFyZHQgdmlhIHNhbWJhLXRlY2huaWNh
bCB3cm90ZToNCj4gV2Ugd291bGQgYXBwcmVjaWF0ZSBhbnkgZ3VpZGFuY2Ugb24gdGhlIGNv
cnJlY3QgbG9uZy10ZXJtIHJlc29sdXRpb24NCj4gb2YgdGhpcyBpc3N1ZS4NCg0KdGhlIGZ1
bmN0aW9uIHRoYXQgY2FsY3VsYXRlZCB0aGUgaXRpbWUgZnJvbSB0aGUgZmlsZXN5c3RlbSB0
aW1lc3RhbXBzIGlzIA0KbWFrZV9maWxlX2lkX2Zyb21faXRpbWUoKS4NCg0KSXQgd2lsbCB1
c2UgdGhlIG9sZGVzdCBvbmUgb2YgYXRpbWUsIG10aW1lIG9yIGN0aW1lLiBXaGF0IGlzIHlv
dXIgDQpzZXJ2ZXJzJ3MgZmlsZXN5c3RlbSB0aW1lc3RhbXAgZ3JhbnVsYXJpdHk/DQoNCkNh
biB5b3Ugc2hhcmUgdGhlIHJlc3VsdCBvZiBydW5uaW5nIHN0YXQgY2xpIGNvbW1hbmQgb24g
ZmlsZXMgdGhhdCANCnRyaWdnZXJlZCB0aGUgaXNzdWU/IE9yIGp1c3QgZ2VuZXJhbGx5IHNo
YXJlIGluZm8gYWJvdXQgeW91ciBmaWxlc3lzdGVtIA0KYW5kIGl0cyB0aW1lc3RhbXAgZ3Jh
bnVsYXJpdHk/DQoNCkknTSB0aGlua2luZyB0aGF0IG1heWJlIHdlIHNob3VsZCBqdXN0IHVz
ZSB0aGUgY3VycmVudCB0aW1lIGZvciB0aGUgDQppdGltZSBhcyByZXR1cm5lZCBieSBjbG9j
a19nZXR0aW1lX21vbm8oKS4NCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJh
IFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJh
IFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------gDyl2yvbw4oHnPaevpu0tJUx--

--------------7OC4Jpf1Ni60cJmp1nDumwQj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGwU0oFAwAAAAAACgkQqh6bcSY5nkYC
Vw/+KkZ17y8znEdtGuaIRBCeY2skktm9trsn4lGa9kOeQELY4A+i/xtbPvMwRC3wE6tXyDdZ/HfS
0RWIyNCrS+F0nZpRtqlEOWVCj/jdoMk7k1YQwfjSLnxf8GXm/Ker5lk7E8WbKF+Fg4zCD0548vLs
HstPJp6gIP42d9VwKFIeWiAoZ0qAK48Xjb1cdRdA0LRfz3DaThewq13Gle5HOeNQIJKpKliRM7S8
zMxKS1c/EzDQQwsgY0jJCDx2uyFIkPVMjBHdH2Kxla3DDagiBPLo+AYtFG5MlhECtDg8AWLqUFxI
DlwUj2JTg6t0P8ThV+MKXWZO+nD3JaakZUQZV+5+3cdX0mRlpUrad8Qs3zHP1d9DFPlLwg6Om6Lr
7SaxXC3pgpQtCqM8fPexZyNJdDE5e1alPG8ttfdJL1xt7emiTYTkRGvjdVGmh9YIG/kvNtlOrLy2
XfKKqFoSYMNnYDLgNwPq+5Ka5exbZ99WBrBCmZ2Yhl/EUeEH03j41ORR1Z2pykjkSEwmcNi0ACZ2
dTRZXiemLjGYaLZnY73bktwuYAb1fcu29LpV7t1ggsGB4o4Q1Q/E+BUc9fI9++oeupnbvJ1YMiDB
KFUDV5K1CtNYFfKjQiJJdLZeeg+Sp9P/ARdKf3fiEMkOxRHENUJHNUkrCGqkrCm/7ZiVLkcbN/k2
iQs=
=VE0o
-----END PGP SIGNATURE-----

--------------7OC4Jpf1Ni60cJmp1nDumwQj--

