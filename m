Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3278B0CA5
	for <lists+samba-technical@lfdr.de>; Wed, 24 Apr 2024 16:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DoDS40ejuGyJypAyS5g6HDkRC/n4OllwY0g1bgRicKQ=; b=fp/ED190Wh6seZDisuyWgosBS9
	CDY1ZhTVUiDVgvX2ApH+vjU0hppFU1raGP7uvhML7dT6ESZXuL02wYx3R2IPGY8usXD95WvCZkmiB
	mHL00h7HMlGZGnQFGHfoo/DEBdZnO9SBhvXjsEPWi+5c31ape3zp/I+dxBYL9TX7IMjTbfnYTFrd5
	1bXubf9uX0wFeFYU8Cbo9uV/BSn2CGK/YFQqgAJvaSkzp5Q3fjOwY+Twgtu8LCCgwuIm/97z5eaKs
	R9wLgsxG4Q4wsdBJSaCxVkCqkxRqKgDb/Fe4BN8GcBsEKriHrhF5ucwwoFHyEZlbyudvqTeYFFj2F
	Vtb9W4cw==;
Received: from ip6-localhost ([::1]:54080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzdhs-005Yf5-PA; Wed, 24 Apr 2024 14:34:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36604) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzdho-005Yey-2P
 for samba-technical@lists.samba.org; Wed, 24 Apr 2024 14:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=DoDS40ejuGyJypAyS5g6HDkRC/n4OllwY0g1bgRicKQ=; b=wasbdfEq0yreNqKyxDqRxDvnir
 A1FcIpNbhfFFEHLgAR//jGBV377+BM68rsSNVoJlmCY5YtycpA2IpMhsuZgc0N2xQmW+5NFtI7oqo
 yg0TWVniFF4XGEoFKlrasr4XxVPFD93HbTDscvzXec9B9u4RxqiJ42XflLsceYOu9PJTHcNPms3nr
 H5tlMqL2bXRf7TERNKqqAhpNubZhUPrsvMhut+6Xfe5xZEPnDaGsin5Ki0sYIMYeXdSi8vdodfma9
 oWySu7zvWTnCsa43C62X8fwduxMrZp1edQ+zgjsoVI5CdsNEgdG57jkAFr3aoq5Q8d36VLPXQaea2
 Brzo1zyxqjvmpaXaHOchZVFFwJE7CC3qDsV/NCQv+ZsJAP1Xhzbi9uwSCWlYqzfxSakpuA4qezr18
 bt0LjKwsVvyZJLDo9a5j+UzYjM8/fy2kJ1bUdUX6Fleu1oH++Zlf9wUsCx7CxzK5NdSAg0usPFB3N
 KxzRtQtYbv4w/cqenpwxZbED;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzdhn-0086CF-0V; Wed, 24 Apr 2024 14:34:39 +0000
Message-ID: <56a06285-f2dc-46c9-8a89-d1a8b44e531e@samba.org>
Date: Wed, 24 Apr 2024 16:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal for changes in become root
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
 <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
 <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
 <CAO9H7P9jncCW14O9=Tv9BNqHQ+L7E3Bia4YiSstyyJdoxudNGw@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P9jncCW14O9=Tv9BNqHQ+L7E3Bia4YiSstyyJdoxudNGw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jN0NtsaUG7m8MPBqXAA2rZGT"
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
--------------jN0NtsaUG7m8MPBqXAA2rZGT
Content-Type: multipart/mixed; boundary="------------WDzGYmUBjaODCiy48DKmUzs7";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Message-ID: <56a06285-f2dc-46c9-8a89-d1a8b44e531e@samba.org>
Subject: Re: Proposal for changes in become root
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
 <17264f9a-2d6f-4bf4-a0e7-f28372a6f82a@samba.org>
 <CAO9H7P8jocp0J_8oFqnYCmheS0o83x6B7koFBMQa_Y2vwdETtw@mail.gmail.com>
 <928cdbd1-a1ed-4b5e-93e9-866ba5f8e504@samba.org>
 <CAO9H7P9jncCW14O9=Tv9BNqHQ+L7E3Bia4YiSstyyJdoxudNGw@mail.gmail.com>
In-Reply-To: <CAO9H7P9jncCW14O9=Tv9BNqHQ+L7E3Bia4YiSstyyJdoxudNGw@mail.gmail.com>

--------------WDzGYmUBjaODCiy48DKmUzs7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNC8yNCAxOjIyIFBNLCBYYXZpIEhlcm5hbmRleiB3cm90ZToNCj4gVGhlIGxhdGVz
dCB2ZXJzaW9uIGlzIGhlcmU6IA0KPiBodHRwczovL2dpdGxhYi5jb20veGhlcm5hbmRlei9z
YW1iYS8tL3RyZWUvaW1wZXJzb25hdGlvbiANCj4gPGh0dHBzOi8vZ2l0bGFiLmNvbS94aGVy
bmFuZGV6L3NhbWJhLy0vdHJlZS9pbXBlcnNvbmF0aW9uPg0KPiANCj4gSXMgaXQgcG9zc2li
bGUgdG8gY2hlY2sgdGhhdCBJIGhhdmVuJ3QgbWFkZSBhbnkgYmlnIG1pc3Rha2UgDQo+ICh1
bmZvcnR1bmF0ZWx5IHRoZSBjb2RlIGlzIGluY29tcGxldGUgYW5kIGRvZXNuJ3QgY29tcGls
ZSwgc28gSSBjYW4ndCANCj4gdGVzdCBpdCkgPyBJIHdpbGwgdHJ5IHRvIGNvbnRpbnVlIGZy
b20gaGVyZS4NCg0KTG9va3MgZ29vZC4NCg0KSSd2ZSBmaXhlZCB0aGUgYnVpbGQgdXAgdG8g
dGhlIFdJUCBjb21taXQsIHNlZSB0aGUgdHdvIG5ldyBjb21taXRzIGluIG15IA0KaW1wZXJz
b25hdGlvbiBicmFuY2gNCg0KODk4ZWI3MTViMzQ0ICAyMDI0LTA0LTI0IDE2OjE0OjM0ICsw
MjAwIFJhbHBoIEJvZWhtZSBidWlsZCBmaXhlczogdXNlIA0Kc2FtYmFfaW1wZXJzb25hdGlv
bl9zZXNzaW9uX2luZm8oKQ0KZjMxZTFjNThkODE2ICAyMDI0LTA0LTI0IDE2OjI1OjUyICsw
MjAwIFJhbHBoIEJvZWhtZSBidWlsZGZpeGVzIA0Kc21iX3Zmc19pbXBlcnNvbmF0aW9uDQoN
ClNvIHdpdGhvdXQgdGhlIFdJUCBjb21taXQgaXQgc2hvdWxkIGF0IGxlYXN0IGNvbXBpbGUu
DQoNCi1zbG93DQoNCg==

--------------WDzGYmUBjaODCiy48DKmUzs7--

--------------jN0NtsaUG7m8MPBqXAA2rZGT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYpGH4FAwAAAAAACgkQqh6bcSY5nkb6
6g/+OMIk2iOdpqNJJHcICjB32z4uFyJABbeerZMxYyM8zEMP2QbmGqpUqq87Mu48h5BauDpkG0pA
FXbxRJaqT59kYyL/BsRnVoBJhDIPEYtM1bDUgjIzZZ4/K/b55Fcb4bdZ6NQBUsrdLAp8H38eQAe7
bDqEnp9hGXTz2BEhRm7tteJ4FslpVq3Mxy5AglbzV2J5QaaU/U7bYiQ9V5tVGhHIGzjpkXPgHw8z
1YZNmwpKbptQrrAV9+VPqq/fsGDX1EEmDr7YkVX9SMMoKKzbDB+ikQpzV73sNfLXzxHKmbWTK0Y0
iOLgxFA3ZV1bNnJWiT1AFygYKKNYoDW/tX9lkqf3udmzAMbylWRwRNCpVaBXk7V+K+/83wljy4wR
h8oAwwF5w08/nmey2+MiTnog78Ws4yOoKIXRIFHWoRShj2HRI6/97FgTP5Z5a66S9GW0HUKWeR6J
PVW8vOncbwPS9qPuDHlmuhV+kwdL2eKZgvW0IAJUOF7BkhuM5rzAe6NppYrKUnE+kh59b1PYknf8
ks204c1v3zSGmt+wdflAFYZLBZOhSZnn9gPmdY8+gNcc6q1hg1zlEFEQlZ1BKir3vYYz1Gsyg4h9
NKyPngWqu2XP6eXGziMiYrREkP4Rh3LnQZEwc/GzcC5teZ092Jwa4O4lbXtdAmqo/T49R53QeTln
Zb0=
=8kqc
-----END PGP SIGNATURE-----

--------------jN0NtsaUG7m8MPBqXAA2rZGT--

