Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B15F79B6
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 16:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QjEFCJv9vhlSa3wbLxEQd8Je4akVYHanS3yH1eRvVQw=; b=2uHexxjEl5KhmIGXTOdY6GF16F
	IfV6M3wMcd320ddhY/jD6HntQaBTXQtoZeYBrKYSXONWNWAnAp6DKuRgk8GVgnUGCzbslC/wpoBhV
	oVHqmBwPX9h9VPoLVC5aylHqwx5FY5pzc8MB+2TB/VV2hQd7HtZxH1opmnH7Fk9o/RySIm+aY3jUg
	28raSvX5qpXrMlHkT9+aAXmciiBEVzbscKWOOygEIYBzyYj4HAOP7aC3qckBZ9uhX1WasgVUw5fH+
	3Qio212ymeQkHy0BXJdnQEFC4Mtl2Y4/s0knh09jE3gy3x/7VxfZc2T4rYS6DavxX4Kd1uyPVBHbK
	2k/CxKDA==;
Received: from ip6-localhost ([::1]:29054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogoPm-000aF7-91; Fri, 07 Oct 2022 14:33:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogoPh-000aEw-JH
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 14:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=QjEFCJv9vhlSa3wbLxEQd8Je4akVYHanS3yH1eRvVQw=; b=rn+UKUoDunEZdAZ3jS9IxXLwdI
 M/dtq3sXpqELahgFXGl4em3PnKRr7tclCkLVtbFgCpMP9k0T8Gy5vNAYEizA8reXcxD3uyPCl+hXF
 JhcVF03xPYFamj0g8O/7oZdTQQ/kcqmFkvMmRqT5apf8PjiyQb2OhokpEyORPh7fR59pGy1UJYMOn
 bTCNo5nq01dMe3TLPdHZvxRobgmfrfqBv+BepgRw/5dl/Nvx9jOAFD8OO/lcJj4WjOa2riO/fVcJf
 6ayO1DXUyxaeDWo04mKkxWw5+zht8dK61yFtSOUPARBfb1oKKZW80GeeaX+h9e0lQvuPuYoIZpt5A
 pwWhqH/jt+8kQeP6l4p71/2tqggyJqqfZM9MVigILMY2smsJAUZBesSR/T4/XWj1ju1OGtg2+9uym
 uhRVBQMY6ZlL3nvV3nJwHcuzLYKKSKxshJZStDHf4sRSWXUPDDmExkK/gPhRlVQ25w/sMY6K7ks24
 LMPMxg5MZ5CMmUj1GeUpDZBu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogoPg-003Oc2-6R; Fri, 07 Oct 2022 14:33:20 +0000
Message-ID: <e6c04961-5a5a-7ce3-8473-4159acee25e9@samba.org>
Date: Fri, 7 Oct 2022 16:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>,
 Stefan Metzmacher <metze@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
 <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
In-Reply-To: <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CbvGw9zwgXH70lwbqkSBBA72"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CbvGw9zwgXH70lwbqkSBBA72
Content-Type: multipart/mixed; boundary="------------P0PoD5NAlBOwlQis95HSejzc";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>,
 Stefan Metzmacher <metze@samba.org>
Cc: samba-technical@lists.samba.org
Message-ID: <e6c04961-5a5a-7ce3-8473-4159acee25e9@samba.org>
Subject: Re: vfs_crossrename not working in samba-4.15.*
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
 <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
In-Reply-To: <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>

--------------P0PoD5NAlBOwlQis95HSejzc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvNy8yMiAxNjoyNSwgUGF2ZWwgRmlsaXBlbnNrw70gd3JvdGU6DQo+IEkgYmVsaWV2
ZSB0aGF0IHRoZSBidWcgd2FzIGludHJvZHVjZWQgaW4NCj4gDQo+IDVjMThmMDcgMjAyMS0w
Ni0xNiAyMTowMSAtMDcwMCBKZXJlbXkgQWxsaXNvbsKgwqDCoMKgIG8gczM6IFZGUzogDQo+
IGNyb3NzcmVuYW1lLiBVc2UgcmVhbCBkaXJmc3AgZm9yIFNNQl9WRlNfUkVOQU1FQVQoKQ0K
PiANCj4gDQo+IHdoaWNoIHJlbW92ZXMNCj4gDQo+IC3CoMKgwqDCoMKgwqAgaWYgKHVubGlu
ayAoZGVzdCkgJiYgZXJybm8gIT0gRU5PRU5UKSB7DQo+IA0KPiBhbmQgYWRzcw0KPiANCj4g
DQo+ICvCoMKgwqDCoMKgwqAgcmV0ID0gU01CX1ZGU19ORVhUX1VOTElOS0FUKGhhbmRsZSwu
Lg0KPiArwqDCoMKgwqDCoMKgIGlmIChyZXQgPT0gLTEpIHsNCj4gDQo+ID09PT09DQo+IA0K
PiBJIGFtIHRyeWluZyB0byBmaXggaXQgaW4gbWFzdGVyIHZpYSByZWludHJvZHVjaW5nICdl
cnJubyAhPSBFTk9FTlQnIGJ1dCANCj4gdGhlIGZpeCBwYW5pY3MgaW4gX3NoYXJlX21vZGVf
ZW50cnlfcHJlcGFyZV9sb2NrKCkNCj4gDQo+IC4uLg0KDQpJIGd1ZXNzIHRoaXMgaXMgY29t
cGxpY2F0ZWQgaW4gbWFzdGVyIGR1ZSBhIHBvc3NpYmxlIHByb2JsZW0vaW50ZXJhY3Rpb24g
DQp3aXRoIG1ldHplJ3MgbmV3IGxvY2tpbmcgY29kZSB0aGF0IHdhcyBtZXJnZWQgYSBmZXcg
ZGF5cyBhZ28uDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAg
ICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExl
YWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQoNCg==

--------------P0PoD5NAlBOwlQis95HSejzc--

--------------CbvGw9zwgXH70lwbqkSBBA72
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmNAOK8FAwAAAAAACgkQqh6bcSY5nka/
Gw//WXNEPGVceacNQasyboXRLM0p38Pt0OrGBKxFox+1MQVv+PcZtSlR0VQArhCWmbbO5eIfHvtB
rr+zHH3vqi03fWy5Omb1JTv7mw+cOW79xDttOkx+81TUA8QhwzBrqLzvG60e3OXsQKmoAyr6i6R4
yVpruSZeMPBE4YqhoIHHAAWBrp0t/nLO/hRgg9U6cjrA55QEArzGgFrs1YN5T8l9JT8ehJfUH0ds
tCNg6tCc1FMIHpHVn69ZPnYysqtYU7BBe2AVVvvho+u3+ZNiUZoCsCI0rDF2z2vQNwdwFiHlsR3K
ZljGABsMqWxjCJzppNb178RhKJGwAMh5U85913F1qZ6y0N+lf1a0R3e44UWD6AIeSM0b25BMmSao
XyWm/yCs5b1Kpk/yU8+oqfL2nc656c999NrolkD2Dhy2GmdR6jdekU1zrZb43zPguHqizr672doT
YyNKlP8qcN219EoLLfGxa4uFWEnWv6DzP1qPjDHHJ5oDSEBWzF3Z529yyb9nruNj5s3jQtbReMXU
znVvmSuzNXEhWQxqzw7yn216NkTSvkrcN5jJqOat551UEWm17K/37oJNFry7yYJlq8n1HylS6ltd
16VxM43lc3EXjPiC0UW3CHqkrPVdDWHeA9/9lew+PL7hdqbJ5CHlCNVCzbVz6UKXZ0SKfhGzW8ed
koA=
=oZpK
-----END PGP SIGNATURE-----

--------------CbvGw9zwgXH70lwbqkSBBA72--

