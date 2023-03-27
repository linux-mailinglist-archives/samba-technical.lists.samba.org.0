Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 673786CA992
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 17:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=SxVd4ZqPPC8AVpiYalFeDwycViEnKYH95dTnueKbKVo=; b=jIyA7dsO5upXh4nibYhmXK1GjJ
	vBV9w1a4AvozdBOhiL/r9vxiJ9jP52FkpdW0SuFupQElUTZ4kNsc++susjW3akgxyQJ8oukaWZx83
	TRvkDXuwAeSj5HcdErkPnwNkNGTJksVPyn6ZcGUDXhaZddOLa8zTqFOIuqeqegf8Q7a4ehvzNykGd
	UswxqHTFJV7yZmCjhh0trWRnG+aKnbgBgWKJC4tkVijZrzKiuIPSnpgwec/4wcxPXXLh2E95pyc7u
	HDJgS+8RF0SsK2bIn0V6UlDHItYPtb53xEizBLLRF1oIhT5YOqXYqMzbaA7+ZRXumW/bNS/q4G8Wx
	yiXCcERw==;
Received: from ip6-localhost ([::1]:45000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgp9z-004mJV-0l; Mon, 27 Mar 2023 15:53:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgp9u-004mJM-0e
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 15:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=SxVd4ZqPPC8AVpiYalFeDwycViEnKYH95dTnueKbKVo=; b=GJ3HrlDRr1E9oOyViBAWQSog59
 AmeORed4xxu+M5vwg/l66RGt15hZMuKkwhod+pTCEYllRR9o9mAr+xmAPw8aA1hu+3YnDGoA0O0rS
 1GhlUovxT1Dk5Geg+TFciL/qOkMV4BWAKP0hDvCHnVynGEigjJypdZfRA8ccETxALxmUgL4hlfXsT
 w7Jba6jX8Jo9FbZfO/a/DUhfJEAlzSdiWaRbDECyvi+MDjdW+ukomWz4Y2YQOsKp1xQmesdnnOg3A
 +LtnA9MHqChn03XhIQb2KRj90BcXQ+LvnMXth052SY5ZveUTtemMiDGE8lHdodLeJZ7s7FzCbR/tz
 W822GiSyChaisix8Xo83RKI80V2Lfe/SVcamKJ4vHw3R/3b8DOprHyjnyDaEFeNS+v4SujwhmNSMC
 6uspGX23JOuDnwvYIo4QfJd/F8wZaBJvyCFNITUUJeSrmq0T9OFAaHFbtQHdRELbjaFZXJTAoV7Gd
 qB6wZdHdGziA3N8JZJfABVUZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgp9t-005g61-5E
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 15:53:21 +0000
Message-ID: <2ba1435c-4d93-5dea-4e98-b277d14ac565@samba.org>
Date: Mon, 27 Mar 2023 17:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Joining a Windows DC to a Samba AD Domain
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <4682ba67-7598-e424-4761-624cc962b4a5@samba.org>
In-Reply-To: <4682ba67-7598-e424-4761-624cc962b4a5@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SzZ0yXt5QKtJSJJeC955r9SQ"
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
--------------SzZ0yXt5QKtJSJJeC955r9SQ
Content-Type: multipart/mixed; boundary="------------vzSeHBdXG2eboXI9JK16RFgp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org
Message-ID: <2ba1435c-4d93-5dea-4e98-b277d14ac565@samba.org>
Subject: Re: Joining a Windows DC to a Samba AD Domain
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
 <4682ba67-7598-e424-4761-624cc962b4a5@samba.org>
In-Reply-To: <4682ba67-7598-e424-4761-624cc962b4a5@samba.org>

--------------vzSeHBdXG2eboXI9JK16RFgp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8yNy8yMyAxNjozOSwgUm93bGFuZCBQZW5ueSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdy
b3RlOg0KPiBJIGRpZG4ndCB0aGluayB0aGluZ3Mgd2VyZSB0aGF0IGJhZCwgSSB0aG91Z2h0
IHlvdSBjb3VsZCBqb2luIGEgMjAwOFIyIA0KPiBhcyBhIERDLCB0aG91Z2ggd2l0aCB0aGUg
dXN1YWwgY2F2ZWF0cyhubyBzeXN2b2wgcmVwbGljYXRpb24gZXRjKSBhbmQgDQo+IHRoYXQg
U2FtYmEgd2FzIG5vdyBoYWxmd2F5IHRoZXJlIG9uIHRoZSAyMDEyUjIgREMsIG5ldyBIZWlt
ZGFsLCAnY2xhaW1zJyANCj4gYmVpbmcgYWN0aXZlbHkgd29ya2VkIG9uIGV0Yywgc28gSSB0
aGluayAnVGhlcmUgYmUgZHJhZ29ucycgbWlnaHQgYmUgYSANCj4gYml0IGRyYW1hdGljLg0K
DQpmcm9tIGRpc2N1c3Npb24gaGVyZSBhdCB0aGUgU2VyTmV0IHRlYW0gd2hhdCBJIHNlZW0g
dG8gcmVtZW1iZXIgaXMgdGhhdCANCml0IGlzIGdlbmVyYWxseSBub3Qgc29tZXRoaW5nIHlv
dSBzaG91bGQgYmUgcnVubmluZyBpbiBwcm9kdWN0aW9uLiBUaGlzIA0Kd2FzIGNvbmZpcm1l
ZCBieSBCasO2cm4uIEhvd2V2ZXIsIHRoZSBvbmx5IG9uZXMgd2hvIGtub3cgdGhlIHN0YXRl
IG9mIA0KYWZmYWlycyBhcmUgcHJvYmFibHkgbWV0emUgYW5kIEFuZHJldy4gbWV0emUgaXMg
Y3VycmVudGx5IG9uIHZhY2F0aW9uIHNvIA0KSSBjb3VsZG4ndCBpbnRlcnZpZXcgaGltIHJp
Z2h0IG5vdy4gOikNCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0g
ICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0g
TGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENClNBTUJBKywgU2Ft
YmEgcGFja2FnZXMgICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLnBsdXMvDQoNCg==


--------------vzSeHBdXG2eboXI9JK16RFgp--

--------------SzZ0yXt5QKtJSJJeC955r9SQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQhu/AFAwAAAAAACgkQqh6bcSY5nkbm
qw//RWmb7JhZnPJxyKZhiPL75sDTRlrPDNved7OdtADJqU/AYqBsemB3/1qJwlBXSi1GkeDrK3mB
nmHcAv8hB1bGtSLho0HkspdiqZwPkwa86z4LyFgpXgPCKV1bV4WNv+fFO/FRJjQ8ALvwFVdhmndS
/AExo+OQfAK3lc6JOwnoZV1yLhIabnEVwiKD+Aaj22nMxI/YTVyGdnmVLS6adAvoLHkZ+K6Aay7m
n3eR0nWJGhS1m/OzQxFmF+4wWuS10vEA2MzoLKOlZXcWQ1Hzb3vViY431f5Frh79iDOqEENRyY/F
LAeatAZXuoA8M8cAkvpSR2sJDDYTtFcK3clGj402PiGWRNe1tziUWyQt6B2EH/KsbQ1Sad7WmoTl
Om8TXPt3MmXKa8WR8IjrmbVMLjNbnFx4ZwnRuCCkhuKGSmr/roh1n2GSM7tO2DfqlLC0EPpbg9Kf
Tg2Ofus+BPYZN5DsJw9f6xG+V2RCUX1y6yBHObgO3XE0Ed3V4AGCvQLYt441D/jOhTLhWhD42FyY
N2xMp5o7ljRx3vzWULHjJuZSO4NKClZGHHUlohkmHe7SBqKsK8zVGHuuJ9G0K8l/iz/v//aL2uzx
xkPRfqsRxSn89nPnxnehMBAnhD1ceXnkmMRNk6hMehGGr3AzzVGY47KoJOTDYZRQCfmlrobY6Pom
sbQ=
=uXIn
-----END PGP SIGNATURE-----

--------------SzZ0yXt5QKtJSJJeC955r9SQ--

