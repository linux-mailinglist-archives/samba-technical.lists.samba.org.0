Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4251B1C959
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 17:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/ApoWVTSci8E4yNRCwXuKeEJEYoIgtG+UcwYQj+OW38=; b=faZ3d9Y9EkLC+PCQJDMpZOPEYv
	PXxKSkRpb+S2rMSADVJg8HZRf1k6ZK2Ac5Zm2+hCc/NOM4Uc8ToiaXxCQ3v+sQT14yaSP7vgkXQo8
	xwEqfDsLUsTGN6rfC10nWu4aR+ah3AK7169AujXNJOVEiw4Rl2nAeMgdJskm8mAqNP+tZh7zYxRUb
	5Wxvc0LTx4CdewKx4pCQzBBU4eKdVIO+yOOLiYefChyiRR7tqvWUy9fjbhej/Z2gD0LTkbL5o7j3t
	X+taXT0skKjEzOYjJpwaxN0aoTjrpJxXCpixKCsceSBvbWGivG6BK1eDPq8ElKCsyXlS1QMILGy6r
	tOs/Ajyg==;
Received: from ip6-localhost ([::1]:53646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujgRA-00EQwo-2J; Wed, 06 Aug 2025 15:52:20 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:44013) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujgR4-00EQwf-VD; Wed, 06 Aug 2025 15:52:18 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id D202AC1089;
 Wed,  6 Aug 2025 17:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1754495530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=/ApoWVTSci8E4yNRCwXuKeEJEYoIgtG+UcwYQj+OW38=;
 b=H+sfGTzzQYw5m8l2rt+60PREyyQZrI1jxLcZF6C3C7XM6naBtWYAkfVOuerjVrBhFxMJPz
 XvrgU2Tg6n+PRBYSp/nib1GmqdimBsf0Ng+XXTuseAHqqNqDMfdbuiNjVKHMTTcpKT91T9
 QMzsnz0gwWGKA1Dlp54s3dXyCAHqtqgeEl+hfGUfnHjBFFdbCbLy8Z/k+K48RobhaN2OHA
 8j0y+0H6tpi1tkJt4KiwYpUdGLVGpeLGrDLSK6imYz6WKxTKMEWJCIDsGeCzxgWffS/8Gz
 ybwQTIm1mQmKJ8STdoniglZvtAuLRGjh/IH/XkkDNGxvmbwerrANLEFjyvACMw==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id 98ieMP3S4O3r; Wed,  6 Aug 2025 17:52:03 +0200 (CEST)
Received: from [192.168.123.203] (p5b240f5b.dip0.t-ipconnect.de [91.36.15.91])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 038E7C1147;
 Wed,  6 Aug 2025 17:52:02 +0200 (CEST)
Message-ID: <34b25add-522d-407c-b06c-836396b441c3@kania-online.de>
Date: Wed, 6 Aug 2025 17:52:02 +0200
MIME-Version: 1.0
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical@lists.samba.org
Content-Language: en-US, de-DE
Subject: English version of my Samba-book
Organization: Stefan Kania
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kSh6L0Rtt5uTDXwIGOJKuVCh"
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
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kSh6L0Rtt5uTDXwIGOJKuVCh
Content-Type: multipart/mixed; boundary="------------I1DpmpeenMwpcaBcTqXm6bUQ";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical@lists.samba.org
Message-ID: <34b25add-522d-407c-b06c-836396b441c3@kania-online.de>
Subject: English version of my Samba-book

--------------I1DpmpeenMwpcaBcTqXm6bUQ
Content-Type: multipart/mixed; boundary="------------pnEv0wkxybVrZtnilzghgpyl"

--------------pnEv0wkxybVrZtnilzghgpyl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWZ0ZXIgcHVibGlzaGluZyBmaXZlIGVkaXRpb25zIG9mIG15IHNhbWJhIGJvb2sgaW4gR2Vy
bWFuLCB0aGUgdGltZSBoYXMgZmluYWxseSBjb21lIGZvciBhbiBFbmdsaXNoIGVkaXRpb24u
IEZvciBhIGxvbmcgdGltZSwgaXQgd2FzIGRpZmZpY3VsdCB0byBmaW5kIHBlb3BsZSB0byBo
ZWxwIG1lIHdpdGggdGhlIHRyYW5zbGF0aW9uLiBJdCBuZXZlciB3b3JrZWQgb3V0IGZvciB0
aGUgbGFzdCB0aHJlZSBlZGl0aW9ucy4gSXQncyBzaW1wbHkgYSBsb3Qgb2Ygd29yayB0byBj
cmVhdGUgYSBib29rIGxpa2UgdGhpcywgZXZlbiBpZiB0aGVyZSBpcyBhbHJlYWR5IGEgR2Vy
bWFuIGVkaXRpb24gdG8gc2VydmUgYXMgYSBiYXNpcy4gTm93LCB0d28gY2lyY3Vtc3RhbmNl
cyBoYXZlIGVuc3VyZWQgdGhhdCBpdCBoYXMgZmluYWxseSB3b3JrZWQgb3V0LiBGaXJzdCwg
RGVlcGwgY2FuIHRyYW5zbGF0ZSBMYVRlWCBkb2N1bWVudHMgY29tcGxldGVseSBjb3JyZWN0
bHkgd2l0aG91dCBtZXNzaW5nIHVwIHRoZSBmb3JtYXR0aW5nLiBTZWNvbmQsIHRoZSB0cmFu
c2xhdGlvbnMgYXJlIG5vdyByZWFzb25hYmx5IGdvb2QuDQoNCiAgVGhlIHNlY29uZCBjaXJj
dW1zdGFuY2UgaXMgdGhhdCBvbmUgb2YgbXkgY3VzdG9tZXJzIGhhcyBjb3ZlcmVkIHRoZSBj
b3N0cyBvZiB0aGUgRW5nbGlzaCBlZGl0aW5nLiBUaGUgYm9vayB3aWxsIGJlIGF2YWlsYWJs
ZSBkaXJlY3RseSBmcm9tIEFtYXpvbiAoSSBwdWJsaXNoZWQgdGhlIGJvb2sgbXlzZWxmIHZp
YSBBbWF6b24ncyBLRFAgcHJvZ3JhbSkgYXQgdGhlIGJlZ2lubmluZyBvZiBTZXB0ZW1iZXIu
IFRoaXMgaXMgYW5vdGhlciBmYWN0b3IgdGhhdCBoYXMgY29udHJpYnV0ZWQgdG8gaXQgZmlu
YWxseSBoYXBwZW5pbmcuIEkgdHlwZXNldCB0aGUgYm9vayBlbnRpcmVseSBteXNlbGYgYW5k
IGRpZCB0aGUgZmlyc3QgcHJvb2ZyZWFkaW5nLg0KDQogIE9mIGNvdXJzZSwgSSByZWRpZCBh
bGwgdGhlIHNjcmVlbnNob3RzLCB0aGlzIHRpbWUgd2l0aCBhbiBFbmdsaXNoIHZlcnNpb24g
b2YgV2luZG93cy4gQWxsIGxpc3RpbmdzIGFyZSBjb21wbGV0ZWx5IGluIEVuZ2xpc2guIFRo
ZSBib29rIGlzIGJhc2VkIChqdXN0IGxpa2UgdGhlIEdlcm1hbiB2ZXJzaW9uIGFscmVhZHkg
cHVibGlzaGVkKSBvbiBTYW1iYSA0LjIxLiBEdWUgdG8gdGhlIGFtb3VudCBvZiB3b3JrIGlu
dm9sdmVkLCBhIG1vcmUgcmVjZW50IHZlcnNpb24gaXMgbm90IHBvc3NpYmxlLiBJdCB3YXMg
YWxzbyBpbXBvcnRhbnQgdG8gbWUgdGhhdCB0aGUgR2VybWFuIGFuZCBFbmdsaXNoIHZlcnNp
b25zIG9mIHRoZSBib29rIGFyZSBpZGVudGljYWwuDQoNCklmIHlvdSB3b3VsZCBsaWtlIHRv
IHRha2UgYSBsb29rIGF0IHRoZSBjb250ZW50cyBhbmQgdGhlIGNvdmVyLCB5b3UgY2FuIGRv
IHNvIGF0IHd3dy5zYW1iYS1ib29rLmNvbS4NCg0KVGhlIGJvb2sgd2lsbCBwcm9iYWJseSBi
ZSBwdWJsaXNoZWQgYXMgYSBwYXBlcmJhY2sgYW5kIGUtYm9vay4NCg0K
--------------pnEv0wkxybVrZtnilzghgpyl
Content-Type: application/pgp-keys; name="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Disposition: attachment; filename="OpenPGP_0x52F6D4DD1BB68AB5.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZD5zHxYJKwYBBAHaRw8BAQdAMVmXn59f0nkYv5WMsQq+KrcYCsNfaUj/WZtg
zdF72yDNJVN0ZWZhbiBLYW5pYSA8c3RlZmFuQGthbmlhLW9ubGluZS5kZT7CiQQT
FggAMRYhBGxP1rNZHkCiVplAgVL21N0btoq1BQJkPnNQAhsDBAsJCAcFFQgJCgsF
FgIDAQAACgkQUvbU3Ru2irXx0QEAtwVwH3XaKI4V5K8xNBFjLCvNHZsOBiF1zXRe
V3+ocvcA/i+HTEj2s+Xw0AdOCzTKpUetOkifYMHmRdzoRdjItaUIzjgEZD5zHxIK
KwYBBAGXVQEFAQEHQLCpLYCfOAWfcF2Za/K3FymUQPfyIZ/eupKMlQrGRJUhAwEI
B8J4BBgWCAAgFiEEbE/Ws1keQKJWmUCBUvbU3Ru2irUFAmQ+c1ACGwwACgkQUvbU
3Ru2irV69QEAxwzfX/shQahBfmica2GbWv7hytmlnu/QFNP2WNDb/9MA/133+PWv
q8PePaEGS4s2tRUd8ktDKmVYz7EnJwaCyqcH
=3Dxppn
-----END PGP PUBLIC KEY BLOCK-----

--------------pnEv0wkxybVrZtnilzghgpyl--

--------------I1DpmpeenMwpcaBcTqXm6bUQ--

--------------kSh6L0Rtt5uTDXwIGOJKuVCh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCaJN6IgUDAAAAAAAKCRBS9tTdG7aKteXg
AP44PEiwut1rIwn9bXnyPQwiKqiv+duEGuURwHRJlUZb2AD/aPbW0WuWyuHKNtTQzIALPRMQtmEC
AFsK0y7RHR33KAk=
=LJBF
-----END PGP SIGNATURE-----

--------------kSh6L0Rtt5uTDXwIGOJKuVCh--

