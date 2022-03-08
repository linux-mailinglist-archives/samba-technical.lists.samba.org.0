Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD744D1E17
	for <lists+samba-technical@lfdr.de>; Tue,  8 Mar 2022 18:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3jnu/ZjrrtTmIlgxgJZYslZM/MOmn7YSAKtrQxxuA2k=; b=dXljXwq4AiemKIPA8TVMAUPwGj
	EnwTtgjlL7bTKS4XO5OBbPP47KAFwsT9WoLCz7HoVc+tewtLv6DiIDwyuWRbarVcu50r/DRtoM1gE
	2E3kg7yXtRfSpiMB804K4DkLKQEnoa5L9QWeUS6Ti0U0qMjNgRfy0UpFARiKq3jZySH+9INqeirOz
	9YHfgTUQ6T6Nihgz85lGsRKw3AuLQAnyCG1gfNO0UaMtapvBZ9VLgoauXbUdHyCft1kfvHD0txjJS
	n0Z6805iiy5bQ9Dta7fJY/zXQ56TOpCZ2rb9Z8jo1oDnNjgGUq8RocweShDM7Ssly3PZEhWu/GKpT
	zn4J1kWQ==;
Received: from ip6-localhost ([::1]:63214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nRdGg-000XCY-BT; Tue, 08 Mar 2022 17:05:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nRdGa-000XCP-PQ
 for samba-technical@lists.samba.org; Tue, 08 Mar 2022 17:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3jnu/ZjrrtTmIlgxgJZYslZM/MOmn7YSAKtrQxxuA2k=; b=NBKSYnQSktPqpOpTvx1cAefVOB
 WkeIcSUoXKAMGMtizRGXX6YgAulCFXJ4TTDQRajEk2IlNmGphEY6h7TLMJLcuOICJzYIaYQm4hZop
 jFQZq13nTyQxYexKC2xXmdjap3Ev1YIBKrQCCmLvrwJNSc5V+bi4NMY9Kmc/Zpalu9L1HyI+YOILr
 J0DZPrBrvZoVeTh7AVwXCUHURI5m0KqdygSXaU4o6t/FX0onuMS92AFkV6F97IqpDTp2D4W3rg5te
 kaXF1hyxe9SicFCTwnRUxI1hSN9Wgzrxtbh7b0eTUWid7jz/gnwEpmaM12i864IQOUn0A+gFWvPDL
 M5lb2l9ePKCfWJsY0P7AgjL7xEaYE658rHYdn0cHrPA6HccEtvBy9KlZdhQuiByjPyShDP7FWTOqt
 mNuN9n0hUtp1T6UYb4/xUUS/6dMXPJ3I+3NFj+TMzWGRS7yPebUeTTXZCnWYDYIkQMvONdvgRYvOD
 bYqIHFkm5/TQ9pWhUK4fi+vb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nRdGZ-000Niu-Pi; Tue, 08 Mar 2022 17:04:55 +0000
Message-ID: <19386c78-84f6-5510-2246-c55ff02217ac@samba.org>
Date: Tue, 8 Mar 2022 18:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: check_reduced_name() with vfs_streams_depot fails if :STREAM/ not
 in root of samba share
Content-Language: en-US
To: Dave Baukus <daveb@spectralogic.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <ffce2444-308a-333e-6a23-2a17106e40f5@spectralogic.com>
In-Reply-To: <ffce2444-308a-333e-6a23-2a17106e40f5@spectralogic.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RrL4edjJR8GCm0dCnj5bpBUn"
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
--------------RrL4edjJR8GCm0dCnj5bpBUn
Content-Type: multipart/mixed; boundary="------------o5Uo0y8FKy4rcgNuApHzkrug";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Dave Baukus <daveb@spectralogic.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <19386c78-84f6-5510-2246-c55ff02217ac@samba.org>
Subject: Re: check_reduced_name() with vfs_streams_depot fails if :STREAM/ not
 in root of samba share
References: <ffce2444-308a-333e-6a23-2a17106e40f5@spectralogic.com>
In-Reply-To: <ffce2444-308a-333e-6a23-2a17106e40f5@spectralogic.com>

--------------o5Uo0y8FKy4rcgNuApHzkrug
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy84LzIyIDE3OjE2LCBEYXZlIEJhdWt1cyB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3Rl
Og0KPiBTYW1iYSA0LjEzLjcgb24gRnJlZUJTRC1zdGFibGUxMyBJIGFtIGdldHRpbmcgdGhl
IGZvbGxvd2luZyBlcnJvcnM6DQo+IA0KPiAgICBjaGVja19yZWR1Y2VkX25hbWU6IEJhZCBh
Y2Nlc3MgYXR0ZW1wdDogLiBpcyBhIHN5bWxpbmsgb3V0c2lkZSB0aGUgc2hhcmUgcGF0aA0K
PiAgICBjb25uX3Jvb3RkaXIgPS9leHBvcnQveHh4Vm9sL3NoYXJlcw0KPiAgICByZXNvbHZl
ZF9uYW1lPS9leHBvcnQveHh4Vm9sLzpTVFJFQU0vQTkvQ0UvOUUxNDI0MTJERUExRTAzMjA2
MDAwMDAwMDAwMDAwMDANCj4gDQoNCg0KaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hv
d19idWcuY2dpP2lkPTE0NzYwDQoNCkZpeGVkIGluIDQuMTUueCwgYnV0IG5vdCBpbiBvbGRl
ciB2ZXJzaW9ucyBpdCBzZWVtcy4NCg0KQ2hlZXJzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBC
b2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0K
U2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0t
c2FtYmENCg==

--------------o5Uo0y8FKy4rcgNuApHzkrug--

--------------RrL4edjJR8GCm0dCnj5bpBUn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmInjLcFAwAAAAAACgkQqh6bcSY5nkZC
RxAAt1+c/k91mQzl3slR/O+PGEDOv5hBSgnfeSeq3qUVKUAei7Lp4RyhuZPfIgUqf6O+q89Lx2o9
f/O7HER9iC8m1j/NtM19N0H1UwThbGKDG7WbCjYCVu9jfq7bGgkiKnajYMMrdRh7ninJhPmS/gXo
66oRCiTxHtvhItdyStIgmfwgQD8UaIubN5zygaxFhkwMYK2Ob4mVfmotuLbsXDtZO/UvwMpj2p0y
1xRm6goOt8UGwB9vtVXVlFJ3FM6J5NvFXAPjsgU2fGlNlL4g2Z6pr/lUi1fcJw6AiaOQoTthSnfi
iDuXxw3UuVhrOAnqS0yt+nuGQ912akZ9Sjj4LXNxh8yW5fEHtbrJrUYtdFIeXhS48a7KTFhEcM3x
PkaFopw4DC5TRjcp5UiDWUGbXsgINicKA7ELu2nkyNz5bXw7QAupG7pI8t0LCDSB6dgc7YSgFT4/
jrtM0TGaBx4BF3ddVcx0UwsNBD6Oerfil2Owo26t5SzlcqxUkzA/tHwTH2RDwR1/J4JlE+gB0eRQ
/E7wUqS9JXVRHU5JLNjsHQ/mTy3i48bJwzVh5N3AqoAAJ7V3ey8VT/7V8GJTCZyQe5cBHxI8ArPE
XuVrcDe708EJlzet37CO3C8uOcM2cDIRf31Wo2JhXGXq7mZZW9gp2zN7lwrnH+cAbUjKfrMlMraw
A6c=
=jb5n
-----END PGP SIGNATURE-----

--------------RrL4edjJR8GCm0dCnj5bpBUn--

