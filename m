Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D927B9C64
	for <lists+samba-technical@lfdr.de>; Thu,  5 Oct 2023 12:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3JmcJmVRbwQK91ggFRVHUcgjYOd4TKVkFAYGG+PetYY=; b=XpKzkKEitVuXg3HGP3SxNjhc+4
	d0Jdvu7mn3YfBFgrPKxYFc/y8nyZIZIOfZRCBKXwxfJPj8m6Mh+V+OV2mLZxwDW5V6j3zLUCXuPhi
	2h14+HTzgxy+CK5+GCZiTsRWMwmHNsDvp9bBuQ56BaelFI0sK85PEtz1x3ItNUActYXoo1xEOWKEi
	WQGOpBVgG6wLf2gCTDFRbP9owUaJogh3TbN92x3rb0Utyo6hHqMjELBGDgq6oPmTgD8ra+wh4k553
	rtN8XKhtA7uvR2LeOIKL/q3jDK9vgFdoLv53KUSGg4s24VaCsqykvGFHLTo4sGAHiclWzvMvONGBK
	3htaPODw==;
Received: from ip6-localhost ([::1]:39562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qoLB0-000QNs-OW; Thu, 05 Oct 2023 10:01:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41144) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qoLAt-000QNk-8b
 for samba-technical@lists.samba.org; Thu, 05 Oct 2023 10:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3JmcJmVRbwQK91ggFRVHUcgjYOd4TKVkFAYGG+PetYY=; b=R9qG2NxsKuaEpBXHD/aAWOJ9xo
 7+ehf/MNKDqkS/YJhCHervC8ch6C1Ey8u6iwnIIqKslTdR96sg5xq9WC/90X0KhHW8plwNxHnfsiZ
 UdGulU/xe750YtX5nTLJSaTghLXWxlbPsyDeK+qys5zp4n+d8Dbi2jagG2Q9y8806A/1cq+EevFK6
 tVnIAJADCx64Ah5/3GAX2MOleT6DF5H7e5+nfEN7kMhjPB0xul0D8aUfrD7rr5ohQLcEzo0F4Jane
 BvrL80loNOpCn6YMc70WgNToDOZ/WAvshtDvQfbxsPFcR2z20N8TXM6Q6V19j7VLWKUlIwIddcMUX
 7IdGqeQ9YtB09S0B9ihPbu+GJPO3xoPDyIRXhLwxt9e3wfPWk6cM1sNewT/JD2Wex+xdhGUp5v0Lz
 hFG4Ltfx34gh0+NH2YBTuHxrXG90nvtMsIqpXdJ8xkNdkGpDN1+HSJulp0dpJ0WrdSotdVspZnWH3
 xqSI5/qnP4o4ZjqynndjIiZ1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qoLAq-00Gp09-2E; Thu, 05 Oct 2023 10:01:40 +0000
Message-ID: <e4750f34-182e-9e41-0fd4-46e14f79a128@samba.org>
Date: Thu, 5 Oct 2023 12:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Mount point detection by device id comparison
Content-Language: en-US, de-DE
To: Carson Buttars <carson@et.byu.edu>, samba-technical@lists.samba.org
References: <cf3ce5e3-2204-ea22-01e3-cae651c86ab0@et.byu.edu>
 <242580f2-8a90-7bab-3702-5ff7ea9adc98@et.byu.edu>
In-Reply-To: <242580f2-8a90-7bab-3702-5ff7ea9adc98@et.byu.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------F2blkIAma0icD1qwaHoeFjRs"
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
--------------F2blkIAma0icD1qwaHoeFjRs
Content-Type: multipart/mixed; boundary="------------kYnnjTb2Dq7kYU16UGraS3JL";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Carson Buttars <carson@et.byu.edu>, samba-technical@lists.samba.org
Message-ID: <e4750f34-182e-9e41-0fd4-46e14f79a128@samba.org>
Subject: Re: Mount point detection by device id comparison
References: <cf3ce5e3-2204-ea22-01e3-cae651c86ab0@et.byu.edu>
 <242580f2-8a90-7bab-3702-5ff7ea9adc98@et.byu.edu>
In-Reply-To: <242580f2-8a90-7bab-3702-5ff7ea9adc98@et.byu.edu>

--------------kYnnjTb2Dq7kYU16UGraS3JL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2Fyc29uLA0KDQpzb3JyeSBmb3IgdGhlIGxvbmcgZGVsYXksIGJ1dCB0aGUgd2hvbGUg
ZmlsZSBzZXJ2ZXIgdGVhbSB3YXMgYnVzeSBhdCBTREMgDQppbiBGcmVtb250LiBBbmQgdGhh
bmtzIGZvciBjb250cmlidXRpbmchDQoNCk9uIDkvMjAvMjMgMTg6MDIsIENhcnNvbiBCdXR0
YXJzIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQo+IEkndmUgZ290dGVuIG5vIHJlc3Bv
bnNlIG9uIHRoaXMuIElzIHRoZSByaWdodCBwbGFjZSB0byB0YWxrIGFib3V0IGl0IG9uIA0K
PiBtYXRyaXg/DQoNCkVpdGhlciBvbmUgd2lsbCBkbywgbW9zdCBkZXZzIGFyZSBwcmVzZW50
IGF0IGJvdGggcGxhY2VzLg0KDQpJIGd1ZXNzIFZvbGtlciB3b3VsZCBiZSBiZXR0ZXIgc3Vp
dGVkIHRvIGFuc3dlciB5b3UgcXVlc3Rpb25zIGJ1dCBsZXQgbWUgDQp0cnk6DQoNCi0gc3Vi
bWl0dGluZyBNUnMgdmlhIGdpdGxhYiBhbmQgdHJ5aW5nIHRvIGdldCBhdHRlbnRpb24gdmlh
IHRoaXMgTUwgaXMgDQp0aGUgZGVmaW5pdGVseSB0aGUgd2F5IHRvIGdvDQoNCi0gYWZhaWN0
IGZvciBjb21wbGV0ZSBoYW5kbGluZyBvZiANCkZJTEVfQVRUUklCVVRFX1JFUEFSU0VfUE9J
TlQvSU9fUkVQQVJTRV9UQUdfTU9VTlRfUE9JTlQgdGhlcmUncyBtb3JlIA0Kc3R1ZmYgbmVl
ZGVkLCBjZiBNUy1GU0NDIDIuMS4yLjUgTW91bnQgUG9pbnQgUmVwYXJzZSBEYXRhIEJ1ZmZl
ciBhbmQgDQo8aHR0cHM6Ly9sZWFybi5taWNyb3NvZnQuY29tL2VuLXVzL3dpbmRvd3Mvd2lu
MzIvZmlsZWlvL3JlcGFyc2UtcG9pbnRzPg0KDQotIFZvbGtlciBpcyBjdXJyZW50bHkgd29y
a2luZyBhbiByZXBhcnNlIHBvaW50IHN1cHBvcnQgYXMgcGFydCBvZiBhbiANCmVmZm9ydCB0
byBpbXBsZW1lbnQgU01CMyBVTklYIEV4dGVuc2lvbnMsIGJ1dCB0aGlzIHNob3VsZCBiZSwg
YWZhaWN0LCANCmxhcmdlbHkgdGFuZ2VudGlhbA0KDQpIdGghDQotc2xvdw0KDQotLQ0KUmFs
cGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICAgICAgIGh0dHBzOi8vc2Ft
YmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgICAgICAgICAgICAgICAgIGh0
dHBzOi8vc2VybmV0LmRlL2VuLw0KU0FNQkErIFNhbWJhIHBhY2thZ2VzICAgICAgICAgICAg
ICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5wbHVzLw0KU0FNQkErIFdlYmluYXIgICAgICAg
ICAgICAgICAgIGh0dHBzOi8vc2FtYmEucGx1cy9zYW1iYS13ZWJpbmFycw0KDQo=

--------------kYnnjTb2Dq7kYU16UGraS3JL--

--------------F2blkIAma0icD1qwaHoeFjRs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmUeiYMFAwAAAAAACgkQqh6bcSY5nkZZ
wQ//TYgHJ/NK2p+vys4PHNMXonKbH+/ZnV8/lT4Q3QDANA/qsV/YK6EfqpXNeKwETMpHC8hTLSOn
3rOEV+KXJzQdG//u1wTqfFscF5C3+XJJ54CI9he+eENFIbVYX5VBfoZHc/fy/usbZN3kVMaI8Xwo
2cngR+TpGVT0lXd2qIPlxKg2WNg3ySbcWTovTf+BNGuRsucNGqKS0C7v9wbZfDhGhe4JZK7k28Az
49i4N9p2RqwfmT/5rdr2kTdId3CCodu3x4bjSbZWu+pzLk/lKxt8+ZZjl1tDFhTwubqhq3+3K6h0
yLxf3Mxo2G20WKb/RhcNhRXuAgH8qUeXUmrsObA8o642tdiUI166sAIex34Ku5ekseP/IFHimIwJ
1X9272zmTu6YmqEsyimkeFq718wp+KyY/ApbZNG81Zq1+tfr1UEipNnY7P/KoewWTfbMMKWc0Rdn
vPdlW3QlYzpW2Av1WuG9VtVR8jWVm37JFCIlHPxbtaJFPd9L/LZ3SgedsSd65ic4EaDXEkQETulX
UJqF8y3RDkzOAFQzXZNyKmbwb9D2yFaDVDy2LuRM94+ijCsNUhfqmtjVUSOBD3jCRuk+LtLhNt0r
3eMEm9XEZU+dI2YDmNaCzcCeD/LgPofTjzfBHce4aLNFSXCk3yRaf2hSJqFV3MIqJY1cFoaH4WwX
DUI=
=gzjE
-----END PGP SIGNATURE-----

--------------F2blkIAma0icD1qwaHoeFjRs--

