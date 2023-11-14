Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA377EB51A
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 17:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OX+44GVo48hH8XzOv1fpRWjWS2iMyZLWuPM111+0/Zo=; b=Z+W58k/g1zRzlWkj9gkkVAIdEf
	9Zm2EZQo98Pp+ujwR3kxoAqh5mE/LyvW7XSrEdK+7V6cylm0/x6NwBYBwAIQsWeEEkyJ4GVAgBOd7
	EuRBRU3sZXtufTsuOaFQM7Ss8y9p1xXv5kEqrU67GsmKI8KU1l+xpoDfJ9XSMVPkdxRDPejNFDLpt
	pf6hTgeX87jRVwMZ70K94lG3cCHj1Yr0NS/RTapjptz4fZ2t1qFh2Et8hTFYX3uSYHuNcqsUohjwt
	cxvi3irbcUD6KXYwZkJgIaW4Pa83vG40tfEgrDSCn3a934dr6lSf4hG5iKH7MyrTtco7DKXa8xhjQ
	vPhnhGHA==;
Received: from ip6-localhost ([::1]:55132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2wXB-008H7i-N3; Tue, 14 Nov 2023 16:45:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62248) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2wX6-008H7W-Ew
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 16:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=OX+44GVo48hH8XzOv1fpRWjWS2iMyZLWuPM111+0/Zo=; b=0VDehOaCGUnu0Qyu6ftT7cu7Si
 hU+EJODkWQktKpSnKT7gnZr94lwm0l8FTh4y4uDtVTBK960zkH1SWByhg9ROmQr0GNaEAlqfxiFLK
 jXK/F3LPfirdQHMQJI3uOcdIjAux4kSmZpON11SdQhV+wvbTaN+d3AVtthnQS9v9Mw5hPRfvvq3vY
 +/kmnzQZjFZQw+XbPk1jtSfqZprG9wT0guulW/Md8Hi6Ihgs1SwsvqyDVeNL6VzJK2HTaORq6FHnu
 vzo7/s6LGmWmpFy7mpvdaLzYoJM/gptg3W5krWPL85v2O3tT77F6cr0iA4p5Q+NChlV2zGArqFF7p
 tGE8R6Em7+dsz8fszcP8GD8q0UzQnguc8p6f04h5t4PhjsluRQJg6+8w5nO7HivLSzyKKpaLfkE5v
 O03mNWgzaXJGbE+YMY065x8GPihtWhIQZfkYYxFcbncTLO0q528RbBdtR9cveroQ2iv9STdGp8xzF
 Ziqa8eB7srprBFB+89uAX4IA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2wX4-0069TJ-2B; Tue, 14 Nov 2023 16:44:59 +0000
Message-ID: <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
Date: Tue, 14 Nov 2023 17:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US, de-DE
To: Tom Talpey <tom@talpey.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
In-Reply-To: <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0NuKU3xOU7110AlHKm7ytsGw"
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
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0NuKU3xOU7110AlHKm7ytsGw
Content-Type: multipart/mixed; boundary="------------DPpG000gQSL4J0tq25Snn390";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <45f53fba-a78a-407c-b711-c2a61b836b9d@samba.org>
Subject: Re: [SMB3POSIX] File attributes
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>
In-Reply-To: <137faebc-3bcc-4e01-add2-679465c934eb@talpey.com>

--------------DPpG000gQSL4J0tq25Snn390
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTQvMjMgMTc6MjIsIFRvbSBUYWxwZXkgd3JvdGU6DQo+IEJ1dCwgZG9lcyBpdCBu
ZWVkIHRvIGJlIGV4cG9zZWQgdG8gcmVtb3RlIGFjY2Vzcz8gSXQgd291bGQgc2VlbSB0byBi
ZSBhbg0KPiBhZG1pbiBmdW5jdGlvbiwgbW9zdCBhcHByb3ByaWF0ZSB0byBhcHBseSB2aWEg
dGhlIHNlcnZlci1sb2NhbCBBUEkuDQo+IA0KPiBTbyB0byBmbGlwIHRoZSBxdWVzdGlvbiwg
ZG9lcyAiY2hhdHRyIC1pIiAob3IgYW55IG9mIHRoZSB6aWxsaW9uIG90aGVycykNCj4gZXhw
b3NlIGFueSBuZXcgdnVsbmVyYWJpbGl0eSBpZiByZW1vdGU/IFNvbWUgb2YgdGhlbSBsb29r
IGZhaXJseSBqdWljeQ0KPiB0YXJnZXRzIGZvciByYW5zb213YXJlIGluZmlsdHJhdGlvbi4N
Cg0KdGhlcmUgc2VlbXMgdG8gYmUgYSB3b3JraW5nIGxvY2FsIHByaXZpbGVnZSBzeXN0ZW0g
YXNzb2NpYXRlZCB3aXRoIHRoZSANCmF0dHJpYnV0ZXMuIElmIHRoaXMgd2FzIGZsYXdlZCB0
aGVyZSdkIGFscmVhZHkgYmUgYSBzZXJpb3VzIHByb2JsZW0gd2l0aCANCmxvY2FsIGFjY2Vz
cywgc28gSSBkb24ndCB0aGluayByZW1vdGUgYWNjZXNzIGNoYW5nZXMgdGhlIGJpZyBwaWN0
dXJlLCANCmRvZXMgaXQ/DQoNCg==

--------------DPpG000gQSL4J0tq25Snn390--

--------------0NuKU3xOU7110AlHKm7ytsGw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVTpAkFAwAAAAAACgkQqh6bcSY5nkYr
chAAwkqAaldFsWMgJMRzQ8grF8NEkOaASXkqqt237SHEb+8XLEsHe7ZNsDDv5Wdv2WJX1FnRTmdb
gpjv74LX+QErgFS/iyZQeBFMPjoxMYgeW7HXxPNTrOsrjj+dx23P05UKVczoZwC9LS8TaOKSq34L
/BKK8cLBlNf1CWG6Wqb5theyYhx0syknQg6bFvJJBOj8obwZXI59gYnv9bQIWwwMkpIXPe1Ntwl4
cld+H5Y1q3D5C31BGAqKH9xPpTRj9XBsH8FjS5vY+2L/17LkWDtctigSiGHgqwKLYb39ouXUSKan
WC7wKo0K0GfNyqHnc8+wy3cI2mNJ/LT+e4jJh29snAjQZnti9hS/KiHXpFztNtO9SV/8JeCbmnR3
lz0QRRJ4uxwVbXJTZU6Ta+URwI9UOZiEG7AWMa/OepT0CFtoa4YdT33thCj7CMWMmpA/poalZ5Jd
dUGkdVyL9w22lhoUMNNKoCwJ9uTOJRRUUsTM2YsfVi2W11WLVwab0SGHUn0T17zjQVQHGSbSoBok
5s1COhrb+SSciwFOO3Cs+oAdttJSDXC0OrSBeR4FXtKddwogLnThWzdnLIXM1hMhVTUJWAzcBmNy
U5vD5iihIYZ+qIEZy2jELikNwyjxucOSvWS264joFdWbQ6ochvXNUoz8P7Fw91HmYc7JeZWCKBcq
SY4=
=IQUz
-----END PGP SIGNATURE-----

--------------0NuKU3xOU7110AlHKm7ytsGw--

