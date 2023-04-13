Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0926E1544
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 21:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=clxxWd1BIk8JAn+jxBpwIl6beBx8maXscRpxoELEqTU=; b=LISNjRu6rLbHMuYpgS5ZYllIrL
	zhxEkxAN4dL6p/XHPli3vVdJmRWfFVu6nhd/RqmO4Nuss6XlS34qUdEySL2qFP+hflVxv5SPdVVqK
	SKMQicIqHeekoqGMcikKMrndMe/CHStALQD5PqKEeLQpZz6asqkSAhpSEJw30UwCl4g/NSTU3Hx82
	dkjxrNuE/OpvKUB031oJi9wG7YlKZ1E0zO81zmYrK5x7Kzju0pYtCYPoQkZZqJe2i6cfMbAgMwYLl
	DW0e4kf2TjvFx1Y2TIYtmT0/HXcoeOSPd5BSdvmeSV8x5b8zmEvRk9woAP4LaZqSN+mEZTBql3h9m
	v72Qlimg==;
Received: from ip6-localhost ([::1]:47944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn2ko-001Bu7-Ge; Thu, 13 Apr 2023 19:37:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn2ki-001Bqy-L8
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 19:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=clxxWd1BIk8JAn+jxBpwIl6beBx8maXscRpxoELEqTU=; b=uykQ0tvfLiZC6nQE9e3hVRuvbT
 NVJUGOs66i+/zUCf+GAYxe+Efq78AIjWCEsopQtdj2qFMIWRsPMSXnbUF8tvflT5ZFhVyrp5nHsup
 ZUGJKUxurQ5LG71WD8EXdS5pQoLH6wCe6g8CxRLZg4tRJAmSu5Th2JWki4YVsLsiKzbKAlsLoxVwL
 u3/0q1mP05SLIEKZTuJ77M5sO0rdMIwjBKR9HTunVjFKJLVuj9xBtjeZgDvi7sQLoctDwVIOvka8J
 P89+v3uLQIu97AeKukrrJX7I2MmEYp6nHqQU45muBRbvLphiOdn74LSg2dQidLkgiRq0jq8Znce/q
 uFPydHeSUCudeXOVCYPNhieVKFbcA/CIW9cnnWIzMjbgIuFY/AV2eH6WG/1ChOJ5WfhG7m9krNZP9
 lyPo7Gwai4Mnc1lSlY4susDaO9qkmAJXdJ/5GXUMewEC70CRbzqTN+J6/9VAZKWGNb+zNFenaWGgL
 L5TV3mU9v4na/aSDcoaU7A2k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pn2kh-000zyf-UN; Thu, 13 Apr 2023 19:37:04 +0000
Message-ID: <45a21c30-3f90-4fa5-f427-b5d3afc6dd68@samba.org>
Date: Thu, 13 Apr 2023 21:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: smbd tries to read ~root/* files
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
In-Reply-To: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cBmipXkjkHLgZQXN0pDdV6Of"
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
--------------cBmipXkjkHLgZQXN0pDdV6Of
Content-Type: multipart/mixed; boundary="------------jhPzwDbUAK7trCYjcoOAgTZg";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <45a21c30-3f90-4fa5-f427-b5d3afc6dd68@samba.org>
Subject: Re: smbd tries to read ~root/* files
References: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
In-Reply-To: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>

--------------jhPzwDbUAK7trCYjcoOAgTZg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xMy8yMyAyMDo1NiwgTWljaGFlbCBUb2thcmV2IHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IFRoaXMgbWlnaHQgYmUsIGF0IHRoZSB2ZXJ5IGxlYXN0LCBxdWl0ZSB1bmV4
cGVjdGVkLCAtIG9uY2UNCj4gdGhlcmUncyBzb21ldGhpbmcgaW4gcm9vdCdzIGNvbmZpZ3Ms
IHNhbWJhIHdpbGwgZG8gc3R1ZmYgbm90DQo+IGNvbmZpZ3VyZWQgaW4gc21iLmNvbmY/DQoN
CkVDQU5UUkVQUk9EVUNFDQoNCkkgc3RhcnQgU2FtYmEsIGNvbm5lY3Qgd2l0aCBzbWJjbGll
bnQsIGdldCB0aGUgcGlkIG9mIHRoZSBzbWJkIHNlc3Npb24gDQpwcm9jZXNzIHdpdGggc21i
c3RhdHVzIGFuZCB0aGVuIHJ1biBzdHJhY2UgLXYgLXAgUElEIG9uIHRoYXQgcGlkIGZvciBh
IA0KZmV3IHNlY29uZHMuDQoNClBsZWFzZSBwb3N0IHlvdXIgc21iLmNvbmYgYW5kIGV4cGxh
aW4gaW4gYSBiaXQgbW9yZSBkZXRhaWwgaG93IHlvdSdyZSANCmNvbm5lY3RpbmcgYW5kIHdo
YXQgeW91ciB0cmFjaW5nLg0KDQpCdHcsIHRoZXJlJ3MgYWxzbyBzZWN1cml0eUBzYW1iYS5v
cmcgdGhlIG5leHQgdGltZSB5b3UgcnVuIGludG8gc3VjaCBhIA0KbmljZSBvbmUuLi4gOikN
Cg0KVGhhbmtzIQ0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAg
ICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVh
ZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENClNBTUJBKyBwYWNrYWdl
cyAgICAgICAgICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLnBsdXMvDQoNCg==

--------------jhPzwDbUAK7trCYjcoOAgTZg--

--------------cBmipXkjkHLgZQXN0pDdV6Of
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQ4Wd8FAwAAAAAACgkQqh6bcSY5nkbv
ORAAgrfaE+jnU7+fNwKPLBBkSVO1o7aD+lwvpWWJ4b+KLBglUaOvb0WiMHjXheFC7syEvy8e0Vng
IB3x4a4E0EbbxLB++u+JdueP3L17aytPdaon6XWTsnAnVDNYejR55GTMyJ4SaGBiEsduvmz/8ttH
2mP6rLYcx7i5yGEhlyaSYrjEfuWdQ0k1jBtg0SIGHRrB1mwSc5YYU6/3qLTmK8xvW52cOQdGTsU5
RZ0o3DMljYPiq6YnVNF8JwfvhDZRhlXuaP8UNzfbAF2JfcrzxMczpYrWBhvWCZlwcw8jF4G21WBA
24G+BzKTc5YG+CRJQ45MUoLg7vb7fPgXkGrejgijTYyXSxik8JC85+SG5LgI9x8aH23syxCOOiEw
BbWCAlkVTy7UuEBqogMIV8D6l1Cl+rhcJPkVFUALXDNv78/3Y6KsmUu59qt9MRSvIi1oMpi5ANYj
B2tFtuzuMnqXZNXE9lxTX89oMFiBOLGJu8xUuJhSryPzg6SBt4d6Ofl4UdzfTXMQ/3VtM3RInJR/
mTNE4E3KnFIyfQDYFEJ0+jV4qAVNzN6oezvllS6LFv9j2PasaT0nCzfldWYCiC+tlkocitVwc+Zi
j7IsBEAWIgKWaJebbVeKqqYguWeWTpoI09QT+tDqPhVS5eEd1cdfrxfGt29VHDQ6hEpfvgG0iRT6
LUI=
=A10h
-----END PGP SIGNATURE-----

--------------cBmipXkjkHLgZQXN0pDdV6Of--

