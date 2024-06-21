Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4D911FC1
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2024 10:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=d+kbcoGavva3UhEVHwjwXK5lIFfthaHHa7hEzAML8HI=; b=yuB3yOrRb44f2XyrG2q2BBvFRO
	rEb4+mpcoZIQG/03NG7NgLk8pSzgLDUF3rI6qnAnHnkHwN1NCD641VG/TNZnDrdR4m91JIp5pxA6Y
	kHQRUqM5z8Ki7gKKtb/72Mjn483oCm68gGbMAl73V4WK9Ex8K04XEEcBjfw+InojjIeFmpMlum25o
	GXUL6mu4e4fwsZxBFEBsd+vCdRALsBITEmlzF8DuVErsuDzaVUgZGnz/j0GoVvATSIQwmNGqsTgN+
	HtB1h+c0/1LszJpwC299qLaJj+JvMQs3CpAbIOHPyYKx8DtnUY240UPUqFRZAE0ZXJ3a65cikaqbU
	b4iN3K3Q==;
Received: from ip6-localhost ([::1]:26456 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKa6p-00EpzB-1Q; Fri, 21 Jun 2024 08:59:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKa6k-00Epz4-OZ
 for samba-technical@lists.samba.org; Fri, 21 Jun 2024 08:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=d+kbcoGavva3UhEVHwjwXK5lIFfthaHHa7hEzAML8HI=; b=m2OhlGaTQdgn8E3WrMU0M0R1VH
 MPa6GZqmLxEsdWq0EwNA07ghJcmMtG+JakCxl4neuAy96SUpdh7XxNg5DqTe3EdHD68Y+nKQBbW7W
 EaKtmCggjT6T2qC3G3AhlgSIRGFM6YmSKTKICWQtqcnwDmrdcVEPNnRa8RZndqH/FU76N7S6Sk2Bi
 yvwNkcnRbm70hAnRU/FH5xFWeObisL/XTRH51lAGIhpbNbbHWI/CVkVBDNTBT/1AsDPy0JLj3VnU4
 waD1e63eiNNAo2v2Z0yvFFaK8qnjyYmn02cad5cJ1sqn+J6RaijQS8wRC2n4C4cedOYbJRCbxsnXz
 zs9FvMwrPzHpNklyVyfSgRIvK/gjzejY3OUGronenKd0GOI2+JFkEkv0YvDd+fa3MNrJwwlPfjX7R
 DZXduxwQRqyrxKliKQAPKPx93nmxbXWX7fjWZM7XMA0g8R6zRiMN7I+Z+t66DfAUlnyhTf2+HYxYF
 4FwVmvh8VkvsCNL3pHw9iBRI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKa6j-000EBW-0O; Fri, 21 Jun 2024 08:58:57 +0000
Message-ID: <6f38ea75-1646-48fc-8bea-c7cf28b83c07@samba.org>
Date: Fri, 21 Jun 2024 10:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Understanding fstat call in streams_xattr
To: Varun Mittal <vmittal@egnyte.com>, samba-technical@lists.samba.org
References: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MVhLYR4dfIAgEilOMDlshbVh"
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
--------------MVhLYR4dfIAgEilOMDlshbVh
Content-Type: multipart/mixed; boundary="------------zgjZMJZz2pTHpR8EBaV0DtHq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Varun Mittal <vmittal@egnyte.com>, samba-technical@lists.samba.org
Message-ID: <6f38ea75-1646-48fc-8bea-c7cf28b83c07@samba.org>
Subject: Re: Understanding fstat call in streams_xattr
References: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>
In-Reply-To: <CAF2c6-HkQ9_6R4Q8MmBE+i_XcU_rmMdTfWmDvV4R3fNmyKRx1g@mail.gmail.com>

--------------zgjZMJZz2pTHpR8EBaV0DtHq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi8yMS8yNCA2OjMyIEFNLCBWYXJ1biBNaXR0YWwgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gV2h5IGlzIHRoZXJlIC0xIGluIHRoZSByZXN1bHQgPw0KPiBJZiBJIHNpbXBs
eSByZW1vdmUgdGhpcyAtMSwgSSB3YXMgYWJsZSB0byBnZXQgc2V0eGF0dHIgdG8gd29yaw0K
DQp0aGF0IGxvb2tzIGxpa2UgdGhlIHBsYWNlIHdoZXJlIHdlJ3JlIHN0cmlwcGluZyBvZmYg
dGhlIHRyYWlsaW5nIG51bCANCmJ5dGUgd2hpY2ggaW4gdGhlIHBhc3Qgd2FzIHJlcXVpcmVk
IHRvIGhhdmUgaW4gb3JkZXIgdG8gaW1wbGVtZW50IA0KemVyby1ieXRlcyBzaXplZCBzdHJl
YW1zIHdpdGggYW4geGF0dHIgYmFja2VuZCB3aGVuIGluIHRoZSBwYXN0IHhhdHRycyANCmRp
ZG4ndCBhbGxvdyBmb3IgMC1ieXRlIHNpemVkIHhhdHRycywgc28gd2UgaGFkIHRvIHN0b3Jl
IGFuIGVtcHR5IGJ5dGUuDQoNCi1zbG93DQoNCi0tIA0KU2VyTmV0IFNhbWJhIFRlYW0gTGVh
ZA0KU2FtYmEgU3VwcG9ydCwgQ29uc3VsdGluZyBhbmQgRGV2ZWxvcG1lbnQNClNhbWJhIFRl
YW0gTWVtYmVyICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTQU1CQSsgcGFja2FnZXMgICAg
ICAgaHR0cHM6Ly9zYW1iYS5wbHVzLw0K

--------------zgjZMJZz2pTHpR8EBaV0DtHq--

--------------MVhLYR4dfIAgEilOMDlshbVh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmZ1QNAFAwAAAAAACgkQqh6bcSY5nkYd
RQ/+K0M1c5PWjYbD+wXknRLiEzfLl2FdfNdDFsWkSl/D4eVDp5KCRdAsBX30QN+avNVxeEviL79q
rwMdTByL/AwuyPH9FuvmwMtwjd/gN+is9fTOVqZcUbHhrMlwdqA5TimSt/VrKdLtkFUIBsoiy00N
EU6h8rS5TUilCG8cvKvC9khezZfCvjNp3+HhuFhhvu7TTQ0WUgjp9HH0qETQYzXJFUwjhjzIxpCq
6chwJwJneUuoK0myJlkIOP+ZSXazpSiO+3RvfEwsIKIqAe6iPeDaVMQSqNnLGLNuvNg2J1ZaVI5h
wPsbZ3X/Rp6noXWkzAs00nTgYeF+7S7vwxiJ2mT9ATpKp7xjAVLdba7kEDidYpqy3+/Jh9UbPCfp
5uqRYIH+QSw2qE3PRj4Yrw7a8+kK5BYkCxjTfyiD/l+Lx5FwDq9Vw9pggRnBbAlvfr0aOJ0rfJDX
bfQYoxMd3CREJaXYHGnPZB1QbnH+twARDkBcFYYHLWuNyhvcju32qLbwPSK662HerfrQn4XpMBCZ
ifpcLLfOhQv2J7+hx3GRtlIUDdjTQj3tlZjpoiVQRSBKu5BHMXBynOZtkMFBo4j4wQ1ARRegk2dn
1IHXJN3ueqZn0wG4iWYVXHFqcGsoiXuZgSGHLoXjctYai5NShY1Qwudt3XtyhBDXh0q2LA9UNvTW
VVM=
=5dLi
-----END PGP SIGNATURE-----

--------------MVhLYR4dfIAgEilOMDlshbVh--

