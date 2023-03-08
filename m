Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A37456B09C3
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 14:48:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=10j4FXKiBISHWzGbhqUaGZ+pYlH/lZqn/pjX6moqLms=; b=UgpoMaDELfT7rg3cQM3GHa9zw7
	lTJZPWyaBe9BHaacWBoF5DdT98CydupIaiMuNfLe4fxN64KKVIW4shh0q49iFTnxJMemvxr57zFNk
	x6eXB+VUd9AUi4U6n/2CrOf1w6DICt3f3IjutNTIqawHzIZLXjaKgwKC8BuPs7L67ftteIyEti3+1
	MnA6MS5iAnfeXR6NGyS9QrKOrfprIMLeM/CKqZDXfmJVrRTPFNYckQe0HBQLpQEfBmTJShSaOCRrX
	j/Z6bVIkKsfU/0S60C+XiVAOJE9c3HAHzy61RFY49ohGGTFxqEFP9ZGmXl1ke8M33e1gdP7p7/AJC
	7OMJ2Huw==;
Received: from ip6-localhost ([::1]:65152 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZu9S-000EC4-79; Wed, 08 Mar 2023 13:48:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57468) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZu9N-000EBv-FR
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 13:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=10j4FXKiBISHWzGbhqUaGZ+pYlH/lZqn/pjX6moqLms=; b=yCcEta1G6o1dv7eDcGVxQWzTJ2
 RWy+EdP7pTUtIhnBjego+GZCdeMSNVbUsmqbPVyDPR9yHF4KsyI3S8DgppZwhxAcZOiEIPghU5eZK
 12Ge2djBajjqzf0t5OVa+t2LdiqYXzWfVDitlAsPNGhBQz+KNCKoZIdjmiioNokiBHjFPB+i5pGN6
 aufPRgWpznXb7ynjPxtDIpM8F2xRhy57MXVBIJfSSLEhKN0//uesIrha0mpmohGd5qrU4azx3t7N/
 Fo65b9h3t3s/OlxaK6nC7VC9WxxLa9Lkny7WhoGPmYlmT3y9MoJHT31JkvtxtJQXYb5Lf4zI66dAS
 ezcG3583vlRsGUIN8Rc9s2i+FcWsXbm27TQYeXWtlPEwqujbwKy88VODrBgloyyYwanIw0Gw2nCCr
 Wk9PO0uwIL12QHwzZ2cpI/I7Rjsc9OSKXmcDHyQ9WN8R8PCK8KqV466dFcUITBzylXgfA85zp1n6c
 MEJrSOiyb9iUZT+vDRkXWMoe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZu9M-001T0B-B2; Wed, 08 Mar 2023 13:48:12 +0000
Message-ID: <ce3c72ee-b260-5913-e732-755281476aa1@samba.org>
Date: Wed, 8 Mar 2023 14:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
Subject: Status of openat2() RESOLVE_NO_SYMLINKS on FreeBSD
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aGgjOYXHyy0DLydoiDGdkKxf"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aGgjOYXHyy0DLydoiDGdkKxf
Content-Type: multipart/mixed; boundary="------------VL8cWdYrUbJyAYogShYA9Q9c";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <ce3c72ee-b260-5913-e732-755281476aa1@samba.org>
Subject: Status of openat2() RESOLVE_NO_SYMLINKS on FreeBSD

--------------VL8cWdYrUbJyAYogShYA9Q9c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQW5kcmV3IQ0KDQpEbyB5b3UsIG9yIGFueW9uZSBlbHNlLCByZW1lbWJlciB0aGUgc3Rh
dHVzIG9mIHVzaW5nIGFuIGFuYWxvZ3VlIHRvIA0KTGludXggb3BlbmF0MigpIFJFU09MVkVf
Tk9fU1lNTElOS1Mgb24gRnJlZUJTRD8NCg0KSW4gY2FzZSB5b3UgZG9uJ3QgcmVtZW1iZXIg
KGlpcmMgd2UndmUgZGlzY3Vzc2VkIHRoaXMgYmVmb3JlKSBvcGVuYXQyKCkgDQpSRVNPTFZF
X05PX1NZTUxJTktTIG9uIExpbnV4IGFsbG93cyBhdG9taWNhbGx5IGNoZWNraW5nIGEgbXVs
dGljb21wb25lbnQgDQpwYXRoIGZvciBzeW1saW5rcyB3aGljaCBhdm9pZHMgZG9pbmcgdGhl
IHdvcmsgbWFudWFsbHkgcGVyLWNvbXBvbmVudCBpbiANClNhbWJhLCB3aGljaCBpcyBhIHBl
cmZvcm1hbmNlIGhvZy4NCg0KSSBzZWUgRnJlZUJTRCBvcGVuYXQoKSBoYXMgT19SRVNPTFZF
X0JFTkVBVEggYW5kIHlvdSB3ZXJlIHRhbGtpbmcgYWJvdXQgDQphZGRpbmcgc3VwcG9ydCBo
ZXJlDQoNCjxodHRwczovL3d3dy50cnVlbmFzLmNvbS9jb21tdW5pdHkvdGhyZWFkcy90cnVl
bmFzLTEzLTAtYmV0YS1leHBlcmllbmNlcy45ODkzNi9wYWdlLTIjcG9zdC02ODUwODg+DQoN
Ckkgc2VlIGEgYnVuY2ggb2YgTVJzIGluIHRoZSB3b3JrIGZyb20geW91IG9uIGdpdGxhYjoN
Cg0KPGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLy0vbWVyZ2VfcmVxdWVz
dHM/c2NvcGU9YWxsJnN0YXRlPW9wZW5lZCZhdXRob3JfdXNlcm5hbWU9YW5vZG9zMzI1Pg0K
DQpCdXQgbm9uZSBvZiB0aGVtIHNlZW1zIHRvIGJlIGFib3V0IHRoaXMgcGFydGljdWxhciBp
c3N1ZS4NCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAg
ICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAg
ICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENClNBTUJBKyBTYW1iYSBwYWNr
YWdlcyAgICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLnBsdXMvDQo=

--------------VL8cWdYrUbJyAYogShYA9Q9c--

--------------aGgjOYXHyy0DLydoiDGdkKxf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQIkhsFAwAAAAAACgkQqh6bcSY5nkYD
mA/7B+7KJFlXB4WAthSiS/5KPsIXTj8ulOzSlRoVceJo777tuLyJjU2HK+W0m88mUl3TMx1FVI4R
3ePbLXIbCYFOHbgsGY8D/Jg7KYYhHUrhxuvs+HwNI7kSsplu/qMhbKGps31WlvN+XN5Z/EQti9BH
NbVOYHW3I4wjbl/6TX7mtiuU1V7pXcnVbDQ5PwXGa6rjQaMgjCDSPnZOeh9DhUNJvAxCgn1lo/61
UopvcwNJd/GlkG5vKKw2dHI8KyeXOxtw5cvROHD/aLE1VSpMN8/n8zeXVjzYm3HGUTrCjo23qg++
2NZ0fC8YkKjtE9dL26BgK5Li56RWU6wK9a+wR1j52mzedz3x6AFZ7VYfgskfgeASthIlzVHFNQ65
2GgRex/tU7McMvI35kLgZ2kwoU0losOInAgUymYCLN6knWCYFkCAIniz9idYcun5kIUqEptA/FBT
W82at78pF0SCW64RzCFp+nzeiZrFzffUYARn2kGVuJby2/koYNxEVcR8Rt5HCGlRFonZiqi2yyGi
CnHIdP1U4GltML0VACoR/NF8G8Cqs4LaYarPqGMejKV+mdUqdLemBDHI1fpIRnbjFnOK7KAHajff
AqkxhdJOKQaXWoiH9qjwDp3uQVURdsRa3ajyIeGO70zj8ULiVBA2NG3HUidIdoaQQ3bH5a75xFOZ
zpM=
=37UR
-----END PGP SIGNATURE-----

--------------aGgjOYXHyy0DLydoiDGdkKxf--

