Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8F7EB524
	for <lists+samba-technical@lfdr.de>; Tue, 14 Nov 2023 17:54:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=szPP4cNC0ZPgOT1gs7o+J56B82kKGZudaddQQDfN/1c=; b=YyFMn9QHI2A3PyUcsoR0C/JZTy
	bK4HdWAdRqE+mkPtGOz/OB+0N0uNBvjFDFcO5jDQK0L5jNaoXkqnnV0z5UUvTNTM0WwjdXPuX1sux
	QKaPKHFOHy8RfkrIOZQqiBtg/fkUh2Q5RKQIOe9ntvGXVYI795PPMDB6i/MYozCHYZy7dGHPCm/vb
	k9SwN3wSqSkMzI6CoYdfU3tOtfjeP0mndk5qe2gGp6jYKf5LCv0Xh/lG43MNrzeBcVD3l+/rzRGDw
	Th+bEJwZ4TzMhq5dqGK1jsZUfT0mrzEfbFniOYVtu0qbMdekctRvQ89NBRuYiGgsFjXhrZTBlyRUL
	UBz+BYqQ==;
Received: from ip6-localhost ([::1]:47930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2wg9-008HPE-BF; Tue, 14 Nov 2023 16:54:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32804) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2wg4-008HP3-M3
 for samba-technical@lists.samba.org; Tue, 14 Nov 2023 16:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=szPP4cNC0ZPgOT1gs7o+J56B82kKGZudaddQQDfN/1c=; b=DoFmNegBAySl++9r3zr5UU6u4d
 6tmLdaa0zQhOvAsHOANjd0rb2O6PqFAMvJ+LcjzZ+AupKKYEw10HpsmvZxkRVwOaPYZrAf34uCN8m
 Ag4fvogBVoG++t7hoeqX9en5ILApccZ/ypz+ZZGuej74AMNYgqHAySo0bHEMqkXuZ4w/fmNEG0W2G
 SrVJKWxrxJ1w7CnMgBvMp2wCB76lCKbA92u+4fM/lJfY2qJIVRHOnBAC6OHrtCXiA7eFp3zJ7NyD/
 gU/jVC2M2O1i/OmpwR8d2rktwKGlmTB/myEQmvvLy2qg9rObrFKD7x0rUadB5ZEvp5FiVGiwz0VpL
 V5d5E0rkNrl//kzvKYaj5y69MaYIyFZ/qrJHXmWxWnWnvzqb7dZ2sKGo7Otvs0e4F4nopaN6tuvhX
 HHdGMFVxCW46SCmekjXE2XLpKWnDHpfexDNcxawxNcN55pzy1AUailGT4Apm7fsfiJlczpk8MxhU0
 GYzfxjvzMYiSHbfqBLSfMaWz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r2wg2-0069bb-0W; Tue, 14 Nov 2023 16:54:14 +0000
Message-ID: <344f5d90-c76b-450b-832a-c6f55ac7930f@samba.org>
Date: Tue, 14 Nov 2023 17:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US, de-DE
To: ronnie sahlberg <ronniesahlberg@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
In-Reply-To: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HdemrEHtamUVc6h5E3UisSWC"
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HdemrEHtamUVc6h5E3UisSWC
Content-Type: multipart/mixed; boundary="------------OQUxY7lPR7S8MMk2jNLCwDjs";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <344f5d90-c76b-450b-832a-c6f55ac7930f@samba.org>
Subject: Re: [SMB3POSIX] File attributes
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
In-Reply-To: <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>

--------------OQUxY7lPR7S8MMk2jNLCwDjs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTQvMjMgMTA6MzAsIHJvbm5pZSBzYWhsYmVyZyB3cm90ZToNCj4gTm90IHRvIGRl
cmFpbCwgYnV0ICJjaGF0dHIgK2kiIGlzIG5vdCBhIHJhYmJpdGhvbGUuIEl0IGlzIHZlcnkg
bXVjaCByZWFsLg0KDQpraW5kIG9mIHByb29mcyB0aGUgcG9pbnQ6IHRoZSByYWJiaXQgaG9s
ZSBpcyBzbyBiaWcgeW91IGRpZG4ndCBldmVuIA0Kbm90aWNlIHlvdSBlbnRlcmVkIGl0LiA6
KSkpDQoNCkl0J3MganVzdCBhIHF1aXRlIHNvbWUgYWRkaXRpb25hbCB3b3JrOiBmbGVzaGlu
ZyBvdXQgYSBzcGVjLCANCmltcGxlbWVudGluZyBpdCAoSSB3b3VsZG4ndCB3YW5uYSBzaGlw
IGEgc3BlYyB3aXRob3V0IGJlaW5nIGFibGUgdG8gDQp2ZXJpZnkgdGhhdCBpdCB3b3JrcyBu
aWNlbHkgZW5kLXRvLWVuZCksIHRlc3RpbmcgaXQgYW5kIHNvIG9uLg0KDQpBcyB0aGVyZSBz
ZWVtcyB0byBiZSBsaXR0bGUgZGVtYW5kIGZvciB0aGlzLCBhcyBjYW4gYmUgc2VlbiBmcm9t
IHRoZSANCmZhY3QgdGhhdCBTYW1iYSBkb2Vzbid0IGltcGxlbWVudCBzdXBwb3J0IGZvciB0
aGUgZmxhZ3Mgb24gTGludXgsIG9ubHkgDQpCU0QsIEkgZG9uJ3QgdGhpbmcgaXQncyB3b3J0
aCB0aGUgZWZmb3J0Lg0KDQotc2xvdw0K

--------------OQUxY7lPR7S8MMk2jNLCwDjs--

--------------HdemrEHtamUVc6h5E3UisSWC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVTpjUFAwAAAAAACgkQqh6bcSY5nkav
ahAAlG/VmYRHib3X4Opy9T9HBHfQTeVuYuubXDi9UgUOr/yDKBBnP4I7RiikDntzkgb9pIOv/GGH
Y8/2oDIg7qAVeBLpub1sIzkFvi/m5GgGXBrQtbvOBNCcUyxeJPOdWZp5imNoHlCQUZt8sLMSc43G
Ajo+c0Z6hMnTfZmNIgTSrTxG3ppD3fPgbSw10D2C9qAH2VU5pgc3H1LX+vM2jsRabQJoBYlZM0/h
jQH/pqYoiK0HQdgalpm0zEG3u0QhD6pFkunVPvqfHlJQ92+YixdKLZ+OSFce2mT8VMBcaibfzVYi
bvlYbhaLUuqw16Qik8mwM6Wqb1rYdhzhcZVsXJuiOknYaIKdPp2iIIJcBkYS6YbTkW3BfPHBhGjR
dG4dyqI7U95wrHbmPpq7pGolbxoJtlPcfp91IkFUvxtn1qvWk/OBG1vGBnuHq4Z6fsjoBPe+ELJR
LmaFY6JtcPIBf6LOQWmE608LkMNaVJ8WDgo3sxtYupCazy1H9EVYfWFDpMiWssxsvN0jN/xOILMi
wuXqP39ZdbI3DYhWrTWFprexCqvGpb/GjOvCMIm0lYwD8tTaITRdeImfITQjV5onY3EeBhTtcxd/
XopSvi8kSErZZea2l+R545lwmRwIBrESDU9Va9IrK8jSdNFxM8eXdPXbKGoT1ZGHQp5FRSjjP0KJ
XRI=
=r6x8
-----END PGP SIGNATURE-----

--------------HdemrEHtamUVc6h5E3UisSWC--

