Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5836989C76
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2024 10:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TZNrqUfZlPxWQH5MhtuTial7uFizInb4E/jJBCYBrXs=; b=QsNZIcB1OCRG+/tPkDKiFEGEuM
	xxMQvx8+0r4LC/QnZp8b1h4olU0cng9vlz82UQng2vr9qklvEsuo/QN3wWIf9jce3vmMgbV4BPv4k
	7o4SWLhwZl8GKBYCaSe04tdFNZUgtXdmdtektEvC45DLpeejsnsx1qVQ1yjBtfcVbHI3Z03vsz2CV
	XGSFQfgEXg1fmVcYnRxH7qq5yh7HeE0nNOVn+3OGsayT5moV1VKUqxqXDGP6gDICHavArJc8SqNAQ
	4bylGBGZTasDLwWZEQlCgxpXv2tG3mqh9YxVXxC+6KRB0ZCakc7Oig72MFTPT0PHgAk4u2WMcj/yZ
	uuX5q3Qw==;
Received: from ip6-localhost ([::1]:19036 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svBat-000soA-Nh; Mon, 30 Sep 2024 08:17:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44894) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svBao-000so3-FZ
 for samba-technical@lists.samba.org; Mon, 30 Sep 2024 08:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=TZNrqUfZlPxWQH5MhtuTial7uFizInb4E/jJBCYBrXs=; b=lD1cyoDFFd5NYzpveQTCsNCETq
 rjwB1KhAdTTQXHjoVT8X5fIwz/IZHvvd0ucBCqNqMwCc4Y5aAKOl1l8jCOOKn3DcYM0M29xhuWv5s
 Q3HNNf5hO4pefi824RWdykkhPNfNMcc6IuVSCYLDotvOJK4gNQ8g1HJHKtUVhMlsJk9dnS8xePqnT
 kW7VhObUpqLb9LWLa9aa+dboWDfhv8BhXHLxdLN+4lGcMiVbNEVGCoVFDs1UwZmGj0eAAr4A7noHF
 zGxRBPYacz5mBEUyiT1EfVD6FGQ1HLtv2qcCSrWXFJgWbExZnGubB5fFNtxTdFr3X6LtjFghRBL5D
 RlZJgjUn9+lvjfQqcCOTcHCoIH2aG+u5QHzclUnXQhJ8heUTD2bAGhTTsnEaK76RpB4oCNd2vejtw
 OfVnNxXvHNus/jYka1k5P3P3JqhdqgMUA1P2UR3rWwu+p6TshQXnspiZG9i5nOvACHqNLfpLkW4Nt
 wlw0S6kLN9eQ3K+KwJc46y/4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svBan-002g7S-1z; Mon, 30 Sep 2024 08:17:17 +0000
Message-ID: <faa88fc1-369b-4278-bdf1-28ce69baa41a@samba.org>
Date: Mon, 30 Sep 2024 10:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: VFS fruit and streams_xattr fake_fd passed on to other modules in
 stack
To: Varun Mittal <vmittal@egnyte.com>, samba-technical@lists.samba.org
References: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nyD328zcOVFcRoXxsNp8zVjr"
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
--------------nyD328zcOVFcRoXxsNp8zVjr
Content-Type: multipart/mixed; boundary="------------PuVEGZ0EOzq1vrivZXJDKKQX";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Varun Mittal <vmittal@egnyte.com>, samba-technical@lists.samba.org
Message-ID: <faa88fc1-369b-4278-bdf1-28ce69baa41a@samba.org>
Subject: Re: VFS fruit and streams_xattr fake_fd passed on to other modules in
 stack
References: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>
In-Reply-To: <CAF2c6-EiavvBJmf6gKRp394E1s4AjANH29PqWeJbiNdbCas3YA@mail.gmail.com>

--------------PuVEGZ0EOzq1vrivZXJDKKQX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVmFydW4sDQoNCk9uIDkvMjYvMjQgMTA6NDEgQU0sIFZhcnVuIE1pdHRhbCB2aWEgc2Ft
YmEtdGVjaG5pY2FsIHdyb3RlOg0KPiBBbSBJIG1pc3Npbmcgc29tZSBjb25maWd1cmF0aW9u
ID8NCg0KSSBndWVzcyB0aGlzIGlzIGN1cnJlbnRseSBub3Qgc3VwcG9ydGVkIGJ5IGZydWl0
IGFuZCB3b3VsZCByZXF1aXJlIHNvbWUgDQpkZXZlbG9wbWVudCBlZmZvcnQgdG8gaW1wbGVt
ZW50IHRoaXMuDQoNClVubGVzcyB1c2luZyBzdHJlYW1zX2RlcG90LCBrZXJuZWwgc2hhcmUg
bW9kZXMgY2FuJ3Qgd29yayB3aGVuIHN0cmVhbXMgDQphcmUgYmFja2VkIGJ5IHhhdHRycywg
c28gSSBndWVzcyB0aGUgZml4IGlzIHRvIGltcGxlbWVudCANCmZpbGVzeXN0ZW1fc2hhcmVt
b2RlIGluIGZydWl0IGFzIGEgbm8tb3AsIGJ1dCBJJ2QgaGF2ZSB0byB0YWtlIGEgY2xvc2Vy
IA0KbG9vay4NCg0KLXNsb3cNCg0KLS0gDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkIGh0dHBz
Oi8vc2VybmV0LmRlLw0KU2FtYmEgVGVhbSBNZW1iZXIgICAgICBodHRwczovL3NhbWJhLm9y
Zy8NClNBTUJBKyBwYWNrYWdlcyAgICAgICBodHRwczovL3NhbWJhLnBsdXMvDQo=

--------------PuVEGZ0EOzq1vrivZXJDKKQX--

--------------nyD328zcOVFcRoXxsNp8zVjr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmb6XowFAwAAAAAACgkQqh6bcSY5nkZ4
+hAAl3ny2yUjkbS0gWLZI1edVvkF9R6ky2T2EZxCY7AUwfrvWeKij7rrISDuv0EHkLgZqcdlmuo2
AAfrH3+oAGRtms+yUC7Ew9BVA7tXWyMy1l3G9RVf1pPN8v6Fo5WimngMlGzIN23xpD5PE5IABuyp
8USCtNWcb5ZhsxKrxPEVKIEt0bKxJBFs50z7VsgFs6VZ3sDWFu2QKefZC5PG6IeLLrMSXoFAPam4
lgXxcafUHvE/mOWQMRvmvnbge338Vbheywdf6yyHwtj+hx65PwLgQCRmk0aPOXOoQPXixrTCZHjt
4aVscvBogGAO1M3ZBmHHWE7z8cGnq9GP2nmnVPzzGFngw8f9xfCOHjXrunxe8PIg2kj1Q6M/r/2a
cv1/UjyPsOdcZHVyTDdYqpJPZMc2uWgPSEpDn9XewDZOm72TE/xeUV+9l9jz3Ll81izTV7WZjqo8
yJGzZSqSxVE116LfqMZx4rHvkDuNaTiYRk2Ma21cVucC7AxYHCZDVjeIsHcu9MTmp+2w1T0Dx/Lg
C7oNWUpbWQbjkafV8OYoY6U53NwPfmqrxhuYXZWXkx3TqwrP4hof2Zq24y5Bwwx84f26NzahltQp
9w77VJw+ba4cYkaAdouj8nZYPtda9Gb3ghEOebSW7YK1nchrDa/cJQrM9h4mSUddv3UZqwUihV2Q
ITk=
=UE1s
-----END PGP SIGNATURE-----

--------------nyD328zcOVFcRoXxsNp8zVjr--

