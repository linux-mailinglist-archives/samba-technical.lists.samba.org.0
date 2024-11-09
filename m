Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EB9C2E30
	for <lists+samba-technical@lfdr.de>; Sat,  9 Nov 2024 16:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3ndEaZSkUEK3L30O/5Q72jkM+JUOw8ML+pDEzUQgukM=; b=OFz7plZp4ySDR5OTUR5N8/gINb
	QcpqgqxKShb4wMMA8rMPezoUlKNqTU251qmJzxoOEmCVpOSsIhOC1OU+k5oQCqJlF1W88OvDqEjI5
	nNsds4/upC25iUd3W+7brMpx2vmy8Wt4qi7ri+cwI/jtcy41xPsTELcyhJCUGDTMBL5DcWHlYUh89
	mh4Yn3wkKh/yfon/G/LyCQzcU5N1joinyiOSUZe4LiAM3lk3VfN2ec94l35EXhcfcVUVSgAvnNogP
	jVIBuPhWnb+D41/FDR0Fk7kp6m6nmEf3r5TdcJkg6xdXJjX1WVGrMChQGC7xEo1lp+B1gku1Lp1Hq
	6p1kAQjA==;
Received: from ip6-localhost ([::1]:28590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9nMM-008Bjr-0L; Sat, 09 Nov 2024 15:26:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23384) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9nMH-008Bjk-7j
 for samba-technical@lists.samba.org; Sat, 09 Nov 2024 15:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=3ndEaZSkUEK3L30O/5Q72jkM+JUOw8ML+pDEzUQgukM=; b=MCtJMv3hqNE7H50yROuLumEyEq
 2wL/MvO8XfWp0MufihAbezGrLtYv+vkerdQCJtScZqar+QTqpRu321kgfCsMQkyRAV3Ybl2+cO3Xq
 MpkeGqdpzd30wNa45wh0Co1eOMXLlHf8CqSAksyi1sUYUmRPLKfrDUh0Y/P0mXkr9dtnJorSmaEep
 fOT2SdONjLttkEY6HuoUhQHkuRWuXoLyozeDAQwtFt4ThXoT9q4st9SZ9fj8GHGSmkFDn/u2JRQgl
 P5zq87kKkjrFSLE2h4kgK+H/j+5tbYNk8xA3RuKFv0+MpcGPDMDLNp9YuWF/eIBUwrJC583zB5kuM
 7h/Q6ju5kovqw1QHgllPGbcwRshXyELphfv8KsdX0J92eCxGsXmtyjk+Y0BFWX18n5jMSVscizsPr
 cNV3XdtzemQdW33JJ0/Be3jydpNJtGmbtZa1We5AKCAiG7YUtCm0LRzrz1lV38Ql4Qkqe+2fxZ95o
 rgDChmmPUrSAQy4X1ao8sdR6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9nMG-009n9r-09; Sat, 09 Nov 2024 15:26:40 +0000
Message-ID: <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
Date: Sat, 9 Nov 2024 16:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Jeremy Allison <jra@samba.org>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
Content-Language: en-US, de-DE
In-Reply-To: <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cOEj8OXwS68UUQXua0fyKnEh"
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cOEj8OXwS68UUQXua0fyKnEh
Content-Type: multipart/mixed; boundary="------------LsgPkVcuPDgTiCXaDwff07Y5";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <c146a052-40e2-4d90-9a8e-9236a0b2dc20@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
Autocrypt-Gossip: addr=jra@samba.org; keydata=
 xsDiBDxEcLsRBADMQzpWoVuu4oiq23q5AfZDbakENMP/8ZU+AnzqzGr70lIEJb2jfcudViUT
 97+RmXptlnDmE4/ILOf6w0udMlQ9Jpm+iqxbr35D/6qvFgrgE+PnNAPlKSlI2fyGuLhpv1QP
 forHV13gB3B6S/ZWHpf/owKnJMwu8ozQpjnMnqOiVwCg8QnSX2AFCMd3HLQsqVaMdlO+jBEE
 AKrMu2Pavmyc/eoNfrjgeRoNRkwHCINWO5u93o92dngWK/hN1QOOCQfAzqZ1JwS5Q+E2gGug
 4OVaZI1vZGsAzb06TSnS4fmrOfwHqltSDsCHhwd+pyWkIvi96Swx00e1NEwNExEBo5NrGunf
 fONGlfRc+WhMLIk0u2e2V14R+ebDA/42T+cQZtUR6EdBReHVpmckQXXcE8cIqsu6UpZCsdEP
 N6YjxQKgTKWQWoxE2k4lYl9KsDK1BaF6rLNz/yt2RAVb1qZVaOqpITZWwzykzH60dMaX/G1S
 GWuN28by9ghI2LIsxcXHiDhG2CZxyfogBDDXoTPXlVMdk55IwAJny8Wj4s0eSmVyZW15IEFs
 bGlzb24gPGpyYUBzYW1iYS5vcmc+wlcEExECABcFAjxEcLsFCwcKAwQDFQMCAxYCAQIXgAAK
 CRCl3XhJ1sA2rDHZAKDwxfxpGuCOAuDHaN3ULDrIzKw9DQCdHb3Sq5WKfeqeaY2ZKXT3AmXl
 Fq7OwE0EPERwvhAEAIY1K5TICtxmFOeoRMW39jtF8DNSXl/se6HBe3Wy5Cz43lMZ6NvjDATa
 1w3JlkmjUyIDP29ApqmMu78Tv4UUxAh1PhyTttX1/aorTlIdVYFjey/yW4mSDXUBhPvMpq52
 TncLRmK9HC6mIxJqS0vi6W9IqGOqDRZph3GzVzJN7WvLAAMGA/sGAyg2rVsBzs77WH0jPO+A
 QZDj+Hf/RFHOwmcyG7/XgmV6LOcQP4HfQHH3DGYihu5cZj3BeWKPDJnjOjB2qmr+FTjYEsjw
 LDBNG7rjRye412rUbNwmEtcD2/dw4xNyu5h2u+1++KVBPf4SqG/a10gDqGJXDHA1Os5MmnQl
 3CTq9sJGBBgRAgAGBQI8RHC+AAoJEKXdeEnWwDasbeIAoL6+EsZKAYrZ2w22A6V67tRNGOIe
 AJ0cV9+pk/vqEgbv8ipKU4iniZclhg==

--------------LsgPkVcuPDgTiCXaDwff07Y5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOS8yNCA5OjQzIFBNLCBKZXJlbXkgQWxsaXNvbiB3cm90ZToNCj4gQ2FuIHdlIGp1
c3QgbWFwIChhY2Nlc3NfbWFzayAoRklMRV9BUFBFTkRfREFUQXxTWU5DSFJPTklaRSkpID09
ICANCj4gKEZJTEVfQVBQRU5EX0RBVEF8U1lOQ0hST05JWkUpKQ0KPiB0byBPX0FQUEVORCwg
cmVnYXJkbGVzcyBvZiBQT1NJWCBtb2RlID8NCg0KdGhpbmtpbmcgYWJvdXQgdGhpcyBhIGJp
dCBtb3JlLCB0aGlzIHNlZW1zIGRvYWJsZSwgYWxiZWl0IG9ubHkgZm9yIFBPU0lYIA0KbW9k
ZS4gRm9yIG5vbi1QT1NJWCBtb2RlIHdlIGNvdWxkIHBvdGVudGlhbGx5IGJyZWFrIFdJbmRv
d3MgYXBwbGljYXRpb24gDQp0aGF0IG9wZW4gb25seSB3aXRoIEZJTEVfQVBQRU5EX0RBVEE6
IEkgY2hlY2tlZCB3aXRoIGEgdG9ydHVyZSB0ZXN0IHRoYXQgDQpXaW5kb3dzIGRvZXNuJ3Qg
ZW5mb3JjZSBhcHBlbmQgYmVoYXZpb3VyIGZvciBGSUxFX0FQUEVORF9EQVRBfFNZTkNIUk9O
SVpFLg0KDQpGb3IgUE9TSVggb3BlbnMgd2Ugc2hvdWxkIGFsc28gYWxsb3cgY29tYmluYXRp
b25zIGxpa2UgDQpGSUxFX1JFQURfQVRUUklCVVRFU3xGSUxFX0FQUEVORF9EQVRBIHRvIG1h
cCB0byBPX0FQUEVORCwgc28gY2xpZW50cyBjYW4gDQp3cml0ZSBpbiBhcHBlbmQgbW9kZSB0
byB0aGUgaGFuZGxlIGFuZCBzdGlsbCBhcmUgYWJsZSB0byBmc3RhdCgpIGl0Lg0KDQpodHRw
czovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9zYW1iYS8tL21lcmdlX3JlcXVlc3RzLzM4NjMN
Cg0KVGhvdWdodHM/DQoNCi1zbG93DQo=

--------------LsgPkVcuPDgTiCXaDwff07Y5--

--------------cOEj8OXwS68UUQXua0fyKnEh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcvfy8FAwAAAAAACgkQqh6bcSY5nkZG
ohAAgVzoWwNAYkqYR72AH7Bp2ZTlXerXK7u0Kf1LUAGWuS0xHG/JmmjaR2RJJC/1Ua4lcNwWBQxA
0x3oIlm+4m/EP9NuveT89LZnleOzt/CufOBydgR9yTnAOraEYf9++9PY/+I2jQJKvWXJkczbKCuV
sbBO6WM2iGFg4ywc/edHz3ysim3FMvYe4Pt+0j1jcAtex9Zw4CYgR/8GtbFMY2YXaacmxq8Wl7Ft
AQejEAYOzohmAaMe6J68NauMJSUXjIuK/BKPn8SQtQ2p6kykN/LQBsTQjqih2q1tE/PcdCOJ8F4A
GahCQo/2EffQ+pI2MBTI3bu0zQduzGYvuw0NM+/eAoEpkBjVjMsIcSX/PAzQGntdYcqjR6BM6fNH
QsHOI8LJDoO+9y7kxgvXS+ZCg9HOOE+EFxavqHOzdFCT/qvMDC5dJcC9wCTRjbYidznWmqeG/pvT
+CDfVleT8EuT+/gB7n1gnXKngfmnHJL8tyizuZO4FtGr9BVBQpyaJlPq5xOn0yr5wm3oFrlBUZdn
1UH7G7vlpgzCCzxVprx9viNvwT5n1vUkx33/YN4Y6JQsRnoBA6ZBSQT+QDP4ecsL0AFA+uYMloGa
o7mi33TkY3NT7vGOoP+vfyCtoIVIWT7aLlNz6c44dp0f24ibPJUOz9LudCDNWedk0dmgwAUn1wtE
h3M=
=eYq3
-----END PGP SIGNATURE-----

--------------cOEj8OXwS68UUQXua0fyKnEh--

