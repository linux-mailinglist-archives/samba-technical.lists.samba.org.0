Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7124705F7
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 17:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DcLA/OVqPPjNylzYrPNsTG6DMkWdqXRmp3AuFZaW4Zc=; b=YclaOXhZGtynP2uPtGUd5b+6CL
	CFcwlUKRFGNYijgjFjyI4JbtIxbk0wPwMkOBnk/jJgqlOiRteK5q7dZhQWizBiplXq3NZl3W32xdq
	sxcHiVfkubKyolIN2xwsAm2iRGgfIQkKkgsv0V9fWKzE1/5e8PKFuvjtH1TAAMBz/kr5eKcU/1m4e
	/982EYLqCxIFjHKA8WZjK9tT2eoHZPtvANx9a6Itp3xk6DvwixUb19IcgosA8N+6mfDPXu15QxUAl
	iJgo4mgCMyRG55XzC8xgTguHC39uRz4DWRURf77pHoGZW5KMYuw4PGzOiJdL9UpwUnLmlCx+IhfsD
	f6gg/XLg==;
Received: from ip6-localhost ([::1]:39094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvivk-0051tL-Bl; Fri, 10 Dec 2021 16:39:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvive-0051tB-Oa
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 16:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=DcLA/OVqPPjNylzYrPNsTG6DMkWdqXRmp3AuFZaW4Zc=; b=BCIfmsK+YVn9Zvu31wOi7LmYg3
 gI0Ekba+C54MJE0e+FQqCI7pxq/8LwLAHFn8IL3Iyaa5IRgalqyL8gHvbSzqKYnueFrpFIqlOiUWt
 P0yNslZtmFZSWSt3kp6n1tWXzA6HLcVZ3Ne9xv1n9kRSqJu8b7Rgf5JHuuYjQjNbdtdz5FxrTvHEf
 OgEVgfQxEcgWk+nE/iVoXlGbyvo1eKRJBibaPvdCTYmwgv6+oJAeY40W68RCQSOC+lGHnYVhLRAIf
 xFTD2DaO1+cj1EbInd7Ycvvwi1N8l4G+6qayBIWX/3cLGGmCVVkk4lqYm9QEkZl99eUriFdV49N5s
 a39Tn+gi6UY3F8FaXS+98IFIYD5Ltq6Mq/sujCTtiLoDDLqKkTU9P0waTUYj5PC+QCzb+pM0a0X6G
 fGjzBj+MDalxYfd+vMzHBx4IPwm30fNlH87DMWbBQwTPjpsoeTLg+hqsZK+6DmoxOI/VxsqOM/Rhj
 FTGzKchTD+gHvcN+hPzGorLl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvivd-002C43-Kh; Fri, 10 Dec 2021 16:39:25 +0000
Message-ID: <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
Date: Fri, 10 Dec 2021 17:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
In-Reply-To: <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hMkRdbKqA8TLr2x5rXOTRZ9A"
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
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hMkRdbKqA8TLr2x5rXOTRZ9A
Content-Type: multipart/mixed; boundary="------------l71bTTvHXA7P6y9lgLcEVSHQ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
In-Reply-To: <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>

--------------l71bTTvHXA7P6y9lgLcEVSHQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTAvMjEgMTY6NTMsIEFuZHJldyBXYWxrZXIgd3JvdGU6DQo+IERvIHdlIGtub3cg
dGhhdCB0aGVyZSBhcmUgc3RpbGwgaXNzdWVzIHdpdGggTWFjT1Mgd2hlbiBhbiBpbm9kZSBp
cw0KPiByZXVzZWQgZHVyaW5nIHRoZSBsaWZldGltZSBvZiBhbiBTTUIgc2Vzc2lvbj8gRG8g
d2UgaGF2ZSBhbiBlYXN5IHdheQ0KPiB0byByZXByb2R1Y2UgdGhlIE1hY09TIGlzc3VlPyBQ
ZXJoYXBzIGlmIHdlIGNhbiBkZXRlcm1pbmUgdGhhdCB0aGUNCj4gaXNzdWUgb25seSBpbXBh
Y3RzIGxlZ2FjeSB2ZXJzaW9ucyBvZiBNYWNPUyB3ZSBjYW4gZ28gYmFjayB0byBqdXN0DQo+
IHJldHVybmluZyB0aGUgaW5vZGUgYW5kIHRlbGwgcGVvcGxlIHdpdGggRU9MIE1hY09TIHRv
IHVwZ3JhZGUgOikNCg0KQWxsIEkga25vdyBpcyB0aGF0ICJzb21lIGFwcGxpY2F0aW9ucyIg
ZW5jb21wYXNzZXMgY29yZSBzdHVmZiB0aGF0IHVzZXMgDQp0aGUgZmlsZS1pcyBhIHByaW1h
cnkga2V5IHRvIGEga2V5L3ZhbHVlIHN0b3JlIHRoYXQgbWFwcyBpZHMgdG8gDQpmaWxlc3lz
dGVtIG9iamVjdHMuIFNvIHJldXNpbmcgaWRzIGlzIChvciB3YXMpIGEgc3VyZSB3YXkgdG8g
c2NyZXcgdXAgDQpNYWMgY2xpZW50cy4NCg0KSSdsbCBjaGVjayB3aXRoIEJyYWQgd2hhdCBo
ZSB3b3VsZCBwcmVmZXIuDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBU
ZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBU
ZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------l71bTTvHXA7P6y9lgLcEVSHQ--

--------------hMkRdbKqA8TLr2x5rXOTRZ9A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGzgrwFAwAAAAAACgkQqh6bcSY5nkYI
Gw/8DNysvsf3wq91RKXZRZxmY2UQcFd97z09CKaDfrC0psuxaTLbNDKdoe00iCDq/bXLghoDw0Qa
SYhDqAQgVI02rt5CU2tr00Ff3w01b6/MQ72EU0XHZ8/AF+JbSNShz0KuxuLWfjfxaVFVxiqAwy5m
QsETHnmllET6axq++cKGSz5583BFLwSumAbFMMfQ5USX6lMAqKzMUDFaHFaKkKMQOzieThVtJgMx
1IFZ+M2CLC76eioiLkyeoac8PVY18iOpe1tD2ZslqllmsuiuanLDejG0QHJFlGdVTShgUwBBkXuY
92H0FK3KHEr/1DVNFf5TsDlJ+IEqKZSbMOzaA+vPiNifH03FLfeXk/A/aA3L9fgaxsCYUON4SjUf
placP2saSgZjSwDxWBDct8+HHYp/4RyCz99CQdv8bpK7MgQU8ePkfAVdfVk89pk1KIOuQ+JVaKaG
dsAGbV9+up1phtwrLpB/j5O0iXlAcIcfYMzgLmlwVkY8Af0b8QQ8W1uz8rJBnoyeMiNA5xmyBtQj
0bN1oRF43Tp7ynMcXQgCxWGe3bJgdkSly/sOwz6JR9SKJlRl0vKuxbgvz6TtQrzPr4oHzX7c5i5G
P7m5cbehKW2DIZyOp/TXnS2C4zhnk409DkvaUxvFKCoYWByPdgucX64tle6TfzfoYc/l5eV4Tuao
XBc=
=yDGr
-----END PGP SIGNATURE-----

--------------hMkRdbKqA8TLr2x5rXOTRZ9A--

