Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527245E6FA
	for <lists+samba-technical@lfdr.de>; Fri, 26 Nov 2021 05:54:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=21w45EqBRe4RkM6lvtVcYrUwF9Rp3Hur4JLbnMRA/Ng=; b=olp9L1v+c6k2P/tQwwXVNFNwnH
	6jxQ2Un3Co/4cvbdjmjmEaKEZPps14cZSzFoQOEygLI6Gs+lGqLZ13DMs5gDJfVYouUsXJ5JUaQ/g
	Um2W1IIQ5gZTgg7s/iNYylM0bAnWhUaaiDKLECBRrajH2EnS1Tg/A7LTbpKW7uSYNGbHPqC9jjSEZ
	6Ah8gscds5K3dFuycrCM8U0g60Nw8zNsd2S9QtDSDU9HEL2okk6bvKS7zjthYBPneLTwwAumdQMAu
	LNdcPKGxfhays1YDEOYYd3w7KG75d0Z5cqphTp3jwGHeMr2hkW6fRgXCULwUIO8NUqC9/XFega05B
	/eqv9oSw==;
Received: from ip6-localhost ([::1]:31286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqTFF-004mNr-Hy; Fri, 26 Nov 2021 04:53:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqTF9-004mNi-4n
 for samba-technical@lists.samba.org; Fri, 26 Nov 2021 04:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=21w45EqBRe4RkM6lvtVcYrUwF9Rp3Hur4JLbnMRA/Ng=; b=hitjvhjk0Nauc+gSg038ny8Icy
 5AvMpLRIl6HhgNH4WhrvwI+h1B4dKAlCH70CLzSr83S5lk8Jd9UGZlPtXL4n6yneCoSoLmbneLO8+
 1bvSXc8wT3QrWWLxyOdrrrcZvmwLMG43oSaZv7PrX43ew1qlLk0fLKvUkoTe3KtreKnBw3Bo/eepi
 CkutIBhBG4kTZjevP2AZc7VaXGTLMeY1RgxT4NLytWx7uVMEGBRRkIUmj6VKDRGo+9+cgjbrL0ANe
 FgWf2Lg/xsPj0mTx8W6XuWOnOdIZLzXeHcfkUHjNydkUwz+5QTPBIiZjU+O4/ValDrkJ+3JAKEtGx
 MNdjIRSAUh0lkDvFqGFnyaieXKY1llgEmTh1ML3CTQ58InxHcMCdYHEr7QtIusRrjAEKdxYJhgaVU
 +mK5EzuoxupMKEpf6hhQ1BI0sB55zkf1kFhUZ3PQz2ykK9UrJANS2fTksDMtO1fXPF00g1kp9aUqI
 5uJL2kuagU8lzpJrWNiwZVaQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mqTF5-0091D6-Np; Fri, 26 Nov 2021 04:53:47 +0000
Message-ID: <fa1baa3a-13e0-94ec-7bbf-69453a2d49fc@samba.org>
Date: Fri, 26 Nov 2021 05:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Failing pipeline build,
 https://gitlab.com/samba-team/samba/-/merge_requests/2271/pipelines
Content-Language: en-US
To: Matt Grant <matt@mattgrant.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
In-Reply-To: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pvCSfT01sW80xRpM5hFqTG7w"
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
--------------pvCSfT01sW80xRpM5hFqTG7w
Content-Type: multipart/mixed; boundary="------------JN6p10H5oEjxl0E2ImlULQA0";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Matt Grant <matt@mattgrant.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <fa1baa3a-13e0-94ec-7bbf-69453a2d49fc@samba.org>
Subject: Re: Failing pipeline build,
 https://gitlab.com/samba-team/samba/-/merge_requests/2271/pipelines
References: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
In-Reply-To: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>

--------------JN6p10H5oEjxl0E2ImlULQA0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gTWF0dCwNCg0KT24gMTEvMjYvMjEgMDQ6MzEsIE1hdHQgR3JhbnQgdmlhIHNhbWJh
LXRlY2huaWNhbCB3cm90ZToNCj4gSGF2ZSBhIGZhaWxpbmcgcGlwZWxpbmUgYnVpbGQgZm9y
IGEgcGF0Y2ggc2V0IHdoaWNoIEkgd291bGQgbGlrZSBSRkNlZCBmb3INCj4gd29yayBvbiBm
b3IgbWVyZ2luZy4gIFRoaXMgYnVpbGRzIGNsZWFubHkgb24gbXkgc2V0IHVwIGF0IGhvbWUs
IGFuZA0KPiB0aGVyZSBkb24ndCBhcHBlYXIgdG8gYmUgYW55IGJ1aWxkIGxvZ3MgdGhhdCB0
ZWxsIG1lIHdoZXJlIGdpdGxhYi1jaSBpcw0KPiBnb2luZyB3cm9uZyBmb3IgbWVyZ2UgcmVx
dWVzdCAyMjcxLi4uLg0KDQpodHRwczovL2dpdGxhYi5jb20vc2FtYmEtdGVhbS9kZXZlbC9z
YW1iYS8tL2pvYnMvMTgyMTM3ODA1Ng0KDQouLi8uLi9zb3VyY2U0L2Ruc19zZXJ2ZXIvZG5z
X3VwZGF0ZS5jOiBJbiBmdW5jdGlvbiDigJhkbnNfdXBkYXRlX2dldF9jYWRkcuKAmToNCi4u
Ly4uL3NvdXJjZTQvZG5zX3NlcnZlci9kbnNfdXBkYXRlLmM6Nzc1Ojc6IGVycm9yOiB1bnVz
ZWQgdmFyaWFibGUgDQrigJh1bmFtZV9sY2hy4oCZIFstV2Vycm9yPXVudXNlZC12YXJpYWJs
ZV0NCiAgIGNoYXIgdW5hbWVfbGNocj0wOw0KDQpIdGghDQotc2xvdw0KDQotLSANClJhbHBo
IEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcv
DQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUvZW4vdGVh
bS1zYW1iYQ0K

--------------JN6p10H5oEjxl0E2ImlULQA0--

--------------pvCSfT01sW80xRpM5hFqTG7w
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGgaFsFAwAAAAAACgkQqh6bcSY5nkbN
fw//fB/GdXLRlndALfW5QgbY77uC6VNrZJjBRJwCDF+48o/o32MqCxzMcHae5g7HkPwubOKEh9XX
iP1XxhS8ajtSPya4SgFWNyVmtJOTdRVsaBxtuQsieNkplXl6/rMJwUue3U8c0/Qf+UjCAk5c83BE
MrlFoOBMDl7Gu+pQVy75V8MKrolSA8dqF76cemL4X1y/HKghU0hr5KOYMfUBxBQs5mmKC+Nr+AQ4
0TdchY9GFlktsgU/pT0lokZ+oTjlR2pj+mJW9HfnGjj2evW45tEDW3NCr4omdMX45A+ZaT/F7sOV
2FL4I/P3gCYZExsTvot3WeToozLICjyCBgodT/bGfcnR58gFaTS0VCKR4OcZ9oCWM0P0tow3bECH
BNK8t97fGqIXsHgHdH/k6HGzNhP0HZixwS/RRxmLn5Jl4iLc5fMQef4Gv692TnLDa9Q4tKvMwj5v
qQY6SiZiPJyCl1aC2XDNZV4po61OKXc8W+F9U6ktubOymt9TFO+AqKpTnqAectL4aaNSa7j1Lr2V
4NdVY0R7bsEhcvK8+x/l9MfeEYEUM4m1go9kc9TND9iwC6sFcaL0ygt0X6gljkDUCCIJ307ljC8x
6qZlZIqGVoyHRc14cn0b6JGk1StGxMI3R/tVRV4P20m3EAFHRIgdQ3MqCFYlEPFiNqmKsJQeq3DX
wXI=
=xgMG
-----END PGP SIGNATURE-----

--------------pvCSfT01sW80xRpM5hFqTG7w--

