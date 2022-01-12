Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6648CC5E
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jan 2022 20:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=s4L4UwCJxujet1ynm1Y/FVumqDbAKgur/GOwl7Rk6ZA=; b=SfByjxqaKUT+3tBIVmqJv0+78z
	aXoTefmAqy739hvt8R8quT9Bdn8xph0wQ824Yw2fftHDbEGyVzVu0vcAHrnXGSFDcokRjTJikFstV
	3geNwVc2HAI+xYFbyc9YKWDyPZNveH1a/ZmXzFv3iU+ZEar9oCh43DsR/ukRP+0VigC8vsQ7PF+Qg
	50vXdLZiJq5geggMBOxKzOQ2V5D8CinP6HlfW+zvqFmi1C+qCk3woXKKmTRzqbCOHOlke6990Q8Zm
	W6y0+mLyrH1kPK5xd2jRU3YNVn4AH+tr3o08rKLGqaf2V96kwIizgCym3Bk6v/7llo7CxG2vhA2rz
	AY3r5mkw==;
Received: from ip6-localhost ([::1]:31854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n7jfJ-007idw-4t; Wed, 12 Jan 2022 19:52:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54938) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n7jfD-007idi-QD; Wed, 12 Jan 2022 19:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=s4L4UwCJxujet1ynm1Y/FVumqDbAKgur/GOwl7Rk6ZA=; b=YEqmSdaiTUAbv4H+gLHZoyViR5
 loM98QOFyGTr2WvMkDf+IfYlBVsIAMEo1jyO3SQ+T2WGpIhZb6do6A49jFGgtz1ULYbImelPvUXSW
 6IS7W23RFKMW0btwmOWDoEjVJZdKwdvSyCzzSyrc3Eek8z1sHG2aJLdlprbkw04gw3LAMsmCNPwd0
 j23viLnFQ3pzfoZTPXCss0ao3gzI1CxjNSS6HkdLP/nhoWgHx7u3DRWqh/kqxZ+S3d49Pz47jSmdh
 8sBqg+1FB4YNcOLuO80EC/AGYcLeU8HlA1fBMMaJMh7M3XkBFH7LTMXCBcbNDSl/fIDUux151jpQ0
 tRkqfqHwtMEU5qXhjJZUNJCjWTi37+K/E2zmTKvZi+hiPnr4MP+r6uCtmEcpTfoWysTasM+k7s/g9
 SfbDGHVisropXZGZfP9dF+77N+UgjEs8Z8I87tvpZHrfV6P4jjiSt+Si7pUb0Zi+uIamxz7gBk+7m
 6mkiOhGv75SJT5gZKzFK3mtJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n7jfA-006yuD-PK; Wed, 12 Jan 2022 19:52:04 +0000
Message-ID: <07456f70-6a59-9591-d096-6d42132db41d@samba.org>
Date: Wed, 12 Jan 2022 20:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Samba] Samba in Containers/Kubernetes Status Update 2
Content-Language: en-US
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
References: <2815519.vuYhMxLoTh@edfu>
In-Reply-To: <2815519.vuYhMxLoTh@edfu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yHRBZECTGQnJR3BQ0wBoob9n"
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yHRBZECTGQnJR3BQ0wBoob9n
Content-Type: multipart/mixed; boundary="------------Xe8uSyxLmf0EHemlh3yOejAp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Cc: samba@lists.samba.org
Message-ID: <07456f70-6a59-9591-d096-6d42132db41d@samba.org>
Subject: Re: [Samba] Samba in Containers/Kubernetes Status Update 2
References: <2815519.vuYhMxLoTh@edfu>
In-Reply-To: <2815519.vuYhMxLoTh@edfu>

--------------Xe8uSyxLmf0EHemlh3yOejAp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8xMi8yMiAxOTo0MiwgSm9obiBNdWxsaWdhbiB2aWEgc2FtYmEgd3JvdGU6DQo+IFdy
YXAgVXANCj4gLS0tLS0tLS0tDQo+IA0KPiBXb3JrIGNvbnRpbnVlcyBvbiBtYW55IG9mIHRo
ZSBwcm9qZWN0cyBsaXZpbmcgdW5kZXIgdGhlIHNhbWJhLWluLWt1YmVybmV0ZXMNCj4gdW1i
cmVsbGEuICBXZSdyZSBob3BpbmcgdGhhdCB0aGVzZSAoc2VtaS0pcmVndWxhciB1cGRhdGVz
IGhlbHAgY3JlYXRlIHNvbWUNCj4gYWRkaXRpb25hbCBpbnRlcmVzdCBpbiB0aGVzZSBlZmZv
cnRzLiBGZWVsIGZyZWUgdG8gcmVwbHkgd2l0aA0KPiBxdWVzdGlvbnMvY29tbWVudHMvY29u
Y2VybnMuIFdlJ2QgYWxzbyBsb3ZlIGl0IGlmIHlvdSBkcm9wIGJ5IG91ciBnaXRodWINCj4g
cHJvamVjdHMgYXMgd2VsbC4gRXZlbiBmZWF0dXJlIHJlcXVlc3RzIGFyZSB3ZWxjb21lLiA6
LSkNCj4gDQo+IA0KPiBUaGFua3MgZm9yIHJlYWRpbmchDQoNCnRoYW5rcyBmb3IgdGhlIHVw
ZGF0ZSwgZm9yIGFsbCB0aGUgZ3JlYXQgd29yayBhbmQgZm9yIHByb3ZpZGluZyBzdWNoIGFu
IA0KZXhjZWxsZW50IHN1bW1hcnkhIExvb2tpbmcgZm9yd2FyZCB0byBzZWUgU2FtYmEgaW4g
Y29udGFpbmVycyB0aHJpdmUhDQoNCkxldCBtZSBrbm93IGlmIHRoZXJlJ3MgYW50aGluZyB5
b3UgbmVlZCBoZWxwIHdpdGggYW5kIEknbGwgc2VlIHdoYXQgSSANCmNhbiBkbyENCg0KVGhh
bmtzIGFnYWluIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAg
ICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVh
ZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------Xe8uSyxLmf0EHemlh3yOejAp--

--------------yHRBZECTGQnJR3BQ0wBoob9n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmHfMWQFAwAAAAAACgkQqh6bcSY5nkZr
Rw//Xjt1wUZu+oYTUcABnP+Vgf8Eyn/f5OHH/gkwCoOMICFX2NMaKWWqR9ZU/baFdv4ZqvRlDM9/
M8LB6JjHoNXfmlPiCVGU6nOQ8l5cHVAd/UQ3+L9tnrhpTl+O/DyzUdglMQ4UASncu/UMRwCsCpcq
SE3Ys5zZ3l+0TmfamrApj+0eSH8PckJBPb6ltQS2ZA2qeUCWl5dcWbc5+bx1qwefBE6xMeSGKGRT
CK1UBl/7856uhp9xb07VcaAUiRu4aOmyRgHHo3QBTFeQB0+crqHF2wep0gvBYi11FahMWwuI5TBN
ULxpj8WwDN+w2gUUQF/mY8ESRfeGz1eiTnjbeicvz5uRwgUhXwxJo1CbGeTxO+Md6iPy6K2i0DSJ
16THSEStyGYiaJzNK6BLwYWIYc12I17h6ZrcjA7uvC3RupO3wmSshCfv5Au2+8ms9fDhYt3Sx1Qh
/4rpBf0kmgkOiakinMhLpdrTH2YvDOUiBbccBQZOgxdxO6ykBc/IrQ6YwHkulsQeh4lNUe3SBYTf
/l9FnKJd6KyNqJohK2gYJIkhn88DYgCclZANEfKoo/UhmrEuHjSijBrdugUo4kcQPY0DGtpzz3L1
AMD1PfVzgnMTGAjlK6IzhoS1WneHQBVGR8OZDgDgIF9H9Tg/jlva+ckvNdTHeZ217wfuJtt6n9ds
1z0=
=0+Jc
-----END PGP SIGNATURE-----

--------------yHRBZECTGQnJR3BQ0wBoob9n--

