Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4CB46F9F5
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 05:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=D6iIgwPKXPtql/ACVjiutLyAEr+7X/xgaUZakipVhCc=; b=Dus+zmkj2A1LG6D8Hk9fzk72Mv
	QS9w7nUxwKYDaxk/8UvlaRqGVKtqg9ixKgAwTuSEZ0w5RhSaMGUDKYcsQ7CxhUbIQaUDHReaK8a0D
	20XD0emte6UkfDJ9IKgosZYBhR6cnThcXAUhz+5qhm+jkioKJLNDexFM4v4z60W3CGfNbuOY5YC2p
	lzGkRX1IR3c/cPVpOXprHIQhC4Sc3yUXYM5zcuWK9gNz25ErVVZApFo41QJyJDDVSWq1iQc4jvz4Q
	hjoebxLGbOkUKQJ7cKsgIpuKzsiKJhP+wUqwE+6G9pcRB4oQ7UD3s/6IwfoLGtN/fL3+Ij//Tcqg0
	EGUuO3xQ==;
Received: from ip6-localhost ([::1]:46564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvXlV-004kkO-1o; Fri, 10 Dec 2021 04:44:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvXlP-004kkF-Nk
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 04:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=D6iIgwPKXPtql/ACVjiutLyAEr+7X/xgaUZakipVhCc=; b=3JDIU07ih39NUQxEJxRWX6Xn/e
 6nUfT28UAhYYxRlqe3lBBbrkMWMSGq7iTZ1WE6CiC0OEbQLkhSqpR+Bn+F5YlTf9rNGTwKIXrpyvx
 pSY2OieGYOtlDYPkElv1S7Dlr9bsIopkMX/65TCghkNRBhYp+LFs19O4Rv/jDq10tS/sxSZeQwpal
 3u0lVmdQkmrdh27NxlzPpbd1AmwlU/7AakUR2t/qCT5a7CKW1voeWyoSIFsj4tX80VClviyu/MVIJ
 xNTDeRQwbA6Z/Nay9ZQQDiqbdAbDpfO/nzCEDqfv7yoXE7stAbSCLNlA+1GTAf5prMMzQkL29PJ3C
 5XyZ52sQPi/7bPQr3B3Mr8OZcHN4v3Duxu2qwdvwxBYowTvZy9bJsAkcFXkmK3nf99rKWSNNiD3zA
 sUKkwRCf83O6GaZG8T7AQclg1fIcm2R5pW+cED/RWVv9SbmZyL9xiQaKE+NNyJf8gp1RKs5hwEysl
 b1Wg64/mxli/vmbcdfYsuJsD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvXlO-0025Cj-5G; Fri, 10 Dec 2021 04:44:06 +0000
Message-ID: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
Date: Fri, 10 Dec 2021 05:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Tom Talpey <tom@talpey.com>, Andrew Walker <awalker@ixsystems.com>
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
In-Reply-To: <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fxk4wonEo8H0Je6fauqUno0m"
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
Cc: Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fxk4wonEo8H0Je6fauqUno0m
Content-Type: multipart/mixed; boundary="------------SZYxHhRAOA6IOTdwt1wY0Uwf";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, Andrew Walker <awalker@ixsystems.com>
Cc: Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
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
In-Reply-To: <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>

--------------SZYxHhRAOA6IOTdwt1wY0Uwf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvOS8yMSAyMjoxNCwgVG9tIFRhbHBleSB3cm90ZToNCj4gVGhlIFNNQjJfRklMRUlE
IGlzIGEgMi1wYXJ0IHN0cnVjdHVyZSwgNjQgYml0cyBmb3IgZWFjaCBoYW5kbGUgKGlkKToN
Cj4gaHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvb3BlbnNwZWNzL3dpbmRvd3Nf
cHJvdG9jb2xzL21zLXNtYjIvZjFkOWI0MGQtZTMzNS00NWZjLTlkMGItMTk5YTMxZWRlNGMz
IA0KDQpvaCwgd2UncmUgbm90IGRpc2N1c3NpbmcgdGhhdCBvbmUuIFRoaXMgb25lOg0KDQpN
Uy1GU0NDIDIuMS45IDY0LWJpdCBmaWxlIElEDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9l
aG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNl
ck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNh
bWJhDQo=

--------------SZYxHhRAOA6IOTdwt1wY0Uwf--

--------------Fxk4wonEo8H0Je6fauqUno0m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGy2xUFAwAAAAAACgkQqh6bcSY5nka4
wg//enC4RUogeecZ9fX/f81y3W21ydfoOllcFX2vQhLvoEIhtvDncpBhyBGZ9rdpm2ZtXSwl93Wj
cnXgtiDJLkEUSuRCXdByhFxzB9OyljrOnoNZmpEqshR8c/ho2w4Lzp+qYQl3eLtKhR4SXOcTkxw0
ix8ttzo91zEvhxqObTfHL28AyfXa0f5NhTTsxZ/WzbfTvnXl6ygkfkqpjDD8cJpwwr7TpFhbbjAn
fHWBCuKKxocYm1bXVrgUYeFVHVzwCA8KXgU5hPUScHmcb2dnMt44kgh31K1B8l1vYMfGnexvhLzC
/zIbe0VTBEDMrzmWWmT+UxHsVp/266d3N7gjTmd5Ka+5fGXdxj+OMwxgxLq8UctFrFrpZsAtrOP9
5EZgV0DE8YihESxeolNBKvKoAqV7RaCW8IzUgJT8Ix3wzjCgGzdu7FpYDqbTOhOXonT/Z0L9zw4P
rBfKPbxP+T8J3onKKJ2EqMh0fqJ38f2w2g5Q+LAI1yrWXDTLU9jmPbUKvcPoHlGfNSAu8uokQ4T9
U7IN5veAn94Y9HmomQnNVm85ejUFeSOQYcb9Dl4N4Q8FPvHcKzrEjLNwYTRsBDyxzA5hJOOAOvJu
yhZcCV8VHS0rAuo+ETUKlbnyYfhWBgXmPe18qvvoXml46Uwf0b659OTmoSbO+Nm2+Ye4huXWCPVC
D7g=
=Pgd+
-----END PGP SIGNATURE-----

--------------Fxk4wonEo8H0Je6fauqUno0m--

