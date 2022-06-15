Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C478B54D1F2
	for <lists+samba-technical@lfdr.de>; Wed, 15 Jun 2022 21:49:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PvaY/DpWqySaF0dUiTPhki6rqtMjvFqw/Q0pw+pUOvA=; b=O/FvTTmcuUfSl6NQkWXwihFJyy
	ArSDMy+GRGcRIViLOslIMLrv67lGYgHU3Lja1wkVMVZURdkplAPNZFwgU8BjWiWcSUfj16xtMf+F+
	RaOlEUCkP5GwSwRvJhgFQ59IkRG+kfszIm1O3QNTHeuqFUIU2ZOotqPjCHIu8BVV/KOyu8U8iCeL0
	SSi9wPvxeKWru95BvtuX/1PXvQI/5i1W82OJ7xARgOSEbnkl9AYYO/jCLpkpKYEsYRyj04izxNNPW
	pCc+pzNxkx4a9d39pJm+tdoGrld1+Bw5Z+qNF6jQjKjKFbD80jDIWzkTAmN9V5emRzAPMr25+UODd
	IshlS+og==;
Received: from ip6-localhost ([::1]:31670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o1Z0H-00AUFw-Uz; Wed, 15 Jun 2022 19:48:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o1Z09-00AUEx-Fo; Wed, 15 Jun 2022 19:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=PvaY/DpWqySaF0dUiTPhki6rqtMjvFqw/Q0pw+pUOvA=; b=Ar2z7eRbTJ2DPqQrXGmBTImMu5
 ABKrE2f83v+hsWi1E7urBh43ia3XLTWW6QjK5ug611qmnHrhLQeEruOSEx52UtBk7NORR7d74c94J
 NP8F2HqvKY0PWPDf58Zq1q8CXc51Fbz28Vine2S+nAAl61UH5jDPC8V27oUcgXCAoo1dcBL4j2JOY
 aue/l+4eTBmLNUlH75Mtm8TD74R+W24MIzufCLLXAV7rQN68t8Ef7PQ/KGLcYl2PhME65lCNH5RYo
 S1LGhmv67FuLC0YN6/4ylD6xsRceZgtAYXNlKDyyu+t2nDhy5paMGmINQhT0g/R1/sRRsVBIYixq+
 DmlHtTdSde+y7kUHHrE955WdMVTFz62DD5Y6PPwq5AOhcx8Us+L4Gqttpd5sQEvKO2ADSWBcH7zr9
 HKmAsvqMoGwJMeRXnw21ORMnbhllg6Kbcw66/W/Sjzgfio1K0J1d4Pp2pKQt72UkSKjN25r5q6GrD
 y1uHNvuPr3kbA5s0QUR9EEr1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o1Z08-005tsr-PM; Wed, 15 Jun 2022 19:48:28 +0000
Message-ID: <29ff9d62-e5f8-56be-7b54-3347187f5fa3@samba.org>
Date: Wed, 15 Jun 2022 21:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Samba] full_audit logs way too much
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>,
 Rowland Penny via samba <samba@lists.samba.org>
References: <327195e7-c757-622f-7d32-d6b9ba5ff7cf@gmail.com>
 <e26019c9f29601592b7d17966134fbd0f07f7a92.camel@samba.org>
 <YqorHg9IGj97L+vE@jeremy-acer>
In-Reply-To: <YqorHg9IGj97L+vE@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eYKx9utDnlz5ZSpKZM3m8zy0"
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
--------------eYKx9utDnlz5ZSpKZM3m8zy0
Content-Type: multipart/mixed; boundary="------------GA30UOqgoPEDIE6UWVOqbUYc";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>,
 Rowland Penny via samba <samba@lists.samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <29ff9d62-e5f8-56be-7b54-3347187f5fa3@samba.org>
Subject: Re: [Samba] full_audit logs way too much
References: <327195e7-c757-622f-7d32-d6b9ba5ff7cf@gmail.com>
 <e26019c9f29601592b7d17966134fbd0f07f7a92.camel@samba.org>
 <YqorHg9IGj97L+vE@jeremy-acer>
In-Reply-To: <YqorHg9IGj97L+vE@jeremy-acer>

--------------GA30UOqgoPEDIE6UWVOqbUYc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi8xNS8yMiAyMDo1NSwgSmVyZW15IEFsbGlzb24gdmlhIHNhbWJhIHdyb3RlOg0KPiBX
ZSBzaG91bGQgcHJvYmFibHkganVzdCBsb2cgYSBkZWJ1ZyBtZXNzYWdlDQo+IGFib3V0IHRo
ZSB1bmtub3duIG5hbWUgYW5kIHRoZW4gaWdub3JlIHRoZQ0KPiB1bmtub3duIG5hbWUgaW5z
dGVhZCBvZiBnb2luZyBmdWxsICJBTEwiDQo+IG9uIHRoZSBhdWRpdC4NCg0KZndpdywgYXMg
SSd2ZSBmYWNlZCB0aGlzIGlzc3VlIGJlZm9yZSBhcyB3ZWxsLCBteSB0YWtlIGlzIHRoYXQg
d2Ugc2hvdWxkIA0KZmFpbCB0aGUgY29ubmVjdCBpZiB0aGUgY29uZmlnIGhhcyB3cm9uZyBW
RlMgbmFtZXMgaW4gdGhlIGF1ZGl0IGNvbmZpZy4NCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBC
b2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0K
U2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0t
c2FtYmENCg==

--------------GA30UOqgoPEDIE6UWVOqbUYc--

--------------eYKx9utDnlz5ZSpKZM3m8zy0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmKqN4wFAwAAAAAACgkQqh6bcSY5nkYM
iQ/+JGnThomlapQA8Safgn8Bu1UdNNiRSZDGgovSDXUiMUgC9300TnQwAPGoI8rMe+n9dwWiZyIq
Kp61V6L4W5kM1ipMrtTfcG1nrB5FG37y764PJHt8h7fJVQqAGs3cE2kR30KFn+WnvmdFKA/kPZcG
XgDuPllS+eeVxu+jJ98EIVghwEyi3+6P3y9OXrqlj5s3NS7N/k4DrB3vG5Wtx6Uixb2FlHhOKm3f
e6P2Xu2SrLRqgpubPNnRKW1kV+GHpGs22OhpehlvX+oUpOKNw0XNCRftmP7qPWK8uR+1h/lUHrsM
cyRRvtUuBGVee86y1obuxw5D/+QlctW03n3yn76lCTT7uJi03NxmullUt/31UqOezuHBRSDmTUNo
vnK0YxlPRA/0FUR5SW+gHoO9onxmLWxmpqHBdMiFO7Kq+0rwNgrF86BNjh2dNTB6Cp+/UUF7z9E7
uVZt767g6CUvjis8s7zgSX2VBpy4PJfhaLw3ZD5cFJ5JbjUin0kWrddphVYrMhjkdgH011OsBjco
UKAhMOwF3btiCrbFUxWpyDVyEdKDoIHOT6SlcthTfqkF04Feb9dJpHnITMtk3F0TXwJJqSs9l3pQ
w9OTki6rFL4wnDpkjM1JIVgcaV6QYOK/1/2INK6O54V+gMiMw3jc6ZDXU3DBx6x2t4ZI/+F77Z60
Y14=
=E6JE
-----END PGP SIGNATURE-----

--------------eYKx9utDnlz5ZSpKZM3m8zy0--

