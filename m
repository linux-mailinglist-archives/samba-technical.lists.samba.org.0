Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DD3AF74D1
	for <lists+samba-technical@lfdr.de>; Thu,  3 Jul 2025 14:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=9tQAGp5g3aDSGnDHJrkguYJUFsFzTcUBiqTR9o1I5yk=; b=UoFmpALiB4tY2FdCEcu3Aect+K
	1iQKks7wXDfx7jXHSesvrU5Q7+3GU0zhlf55xfW+oGPnXAgQF6oAt7tHoLtHmubFiUtzjeFVOg+2t
	SSAJJgKToH1W5aWnzIYYdWuhabmnBFIZcWISqtnScUWbXzPbQ1aCXVmSI+4fQ2Z5dUsrfK4926SAA
	MkaEfyENn+SJx7gYbWh/I8RYz6lDrAlZ2Q+jQ+tzGeHlD41fEKErgVQ+IJBlJLtZ4Fd3GWQPwXjGi
	7z4tYmg6Jksn9b+heqnf5dgnOozbdsy83pFwSaMp4O/8RPiKXTjxJUswtRJNGMU3aK/7t7OOZnGgn
	dw2eqi3Q==;
Received: from ip6-localhost ([::1]:50346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uXJVd-00ATFu-Ds; Thu, 03 Jul 2025 12:57:49 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:58745) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uXJVW-00ATFm-9X
 for samba-technical@lists.samba.org; Thu, 03 Jul 2025 12:57:47 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id BED76C087D;
 Thu,  3 Jul 2025 14:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1751547457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=9tQAGp5g3aDSGnDHJrkguYJUFsFzTcUBiqTR9o1I5yk=;
 b=oI+vbfJOwho6hj8QOHkj4DqNB05/rgbAwIN0IJOssnyNemqRgGyNMvv0ww1RSZdH68fj4W
 3Sfp6mQ5Li9hcVlnP3m4TdLQY6V/U0vENdzqCsAkZymAO5J867Rb1ceOyIFEPJM31hVlu3
 3xlPpXJawy9k/41wf8uphA4EkpfXKlyblUPzppaphdOxmjN2YtGBbeh02DNeejmNGDBw53
 +MmsPcnDzTtsiXu101NvmnituB0wuTX4OWzw59U03Rw2sQikk3wMoJ0bd9HMxpDgusX6sI
 cztGZ7XMq45WP2WZ0RjTBC05r0pn0VkA02G53xtgELLFxHSzSL/CpFPC86hxLg==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id f8aUZ7zb89bY; Thu,  3 Jul 2025 14:57:28 +0200 (CEST)
Received: from [192.168.123.203] (p5b240cb2.dip0.t-ipconnect.de [91.36.12.178])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id E0BD6C1595
 for <samba-technical@lists.samba.org>; Thu,  3 Jul 2025 14:57:27 +0200 (CEST)
Message-ID: <d31afc27-b3a4-4bc2-bcbf-b5265e878cad@kania-online.de>
Date: Thu, 3 Jul 2025 14:57:26 +0200
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Questions about gMSA
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b0QSvxNzJb0PO2PR0MmQ8IN8"
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
--------------b0QSvxNzJb0PO2PR0MmQ8IN8
Content-Type: multipart/mixed; boundary="------------T9uAQGzIhMrpa1vjnbcOmf0X";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <d31afc27-b3a4-4bc2-bcbf-b5265e878cad@kania-online.de>
Subject: Questions about gMSA

--------------T9uAQGzIhMrpa1vjnbcOmf0X
Content-Type: multipart/mixed; boundary="------------inv1wrEZJU0pm7dDJ6VIY87i"

--------------inv1wrEZJU0pm7dDJ6VIY87i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gdG8gYWxsLA0KDQpGaXJzdCBvZiBhbGwsIHllcyBJIGNyZWF0ZWQgdGhlIHJvb3Qt
a2V5IGFuZCBJIHdhaXRlZCAxMCBob3VycyB0byBtYWtlIHRoZSBrZXkgdmFsaWRlLiBJdCdz
IHdoYXQgdG8gZG8gaW4gYSBXaW5kb3dzLWVudmlyb25tZW50Og0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KWW91IG11c3Qgbm93IHdhaXQgMTAgaG91cnMgYmVmb3JlIHRoZSBmaXJzdCBh
Y2NvdW50cyBjYW4gYmUgY3JlYXRlZC4gVGhpcyBpcyBhIGZ1bmN0aW9uIHRvIGVuc3VyZSB0
aGF0IGFsbCBkb21haW4gY29udHJvbGxlcnMgaGF2ZSBjb21wbGV0ZWQgcmVwbGljYXRpb24g
YmVmb3JlIHRoZSBmaXJzdCBnTVNBIGFjY291bnRzIGFyZSBjcmVhdGVkLg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KDQpJIHRyeSB0byBzZXR1cCB0aGUgZ01TQSBidXQgdHdvIHRoaW5n
cyBhcmUgbm90IHJlbGF5IGNsZWFyIHRvIG1lOg0KDQpJIGNyZWF0ZWQgdGhlIGFjY291bnQg
d2l0aDoNCi0tLS0tLS0tDQpzYW1iYS10b29sIHNlcnZpY2UtYWNjb3VudCBjcmVhdGUgLS1u
YW1lIG1zYSAtLWRucy1ob3N0LW5hbWUgbXNhLmV4YW1wbGUubmV0IC0tbWFuYWdlZC1wYXNz
d29yZC1pbnRlcnZhbCAzMA0KLS0tLS0tLS0NCkJ1dCBpZiBJIGNvbXBhcmUgdGhlIGNyZWF0
aW9uIG9mIHRoZSBnTVNBIHdpdGggV2luZG93cyBJJ20gbWlzc2luZyB0aGUgUHJpbmNpcGFs
c0FsbG93ZWRUb1JldHJpZXZlTWFuYWdlZFBhc3N3b3JkIHBhcmFtZXRlci4gVGhpcyBwYXJh
bWV0ZXIgaXMgdGhlIGNvbXB1dGVyIGFjY291bnRuYW1lIGxpa2Ugc2VydmVyMDEkIGFuZCBj
YW4gaGF2ZSBhIGNvbW1hIHNlcGFyYXRlZCBsaXN0IG9mIGhvc3RuYW1lcy4NCg0KVGhlIC0t
ZG5zLWhvc3QtbmFtZSBpcyBqdXN0IGNyZWF0aW5nIGEgRE5TLW5hbWUgZm9yIHRoZSBnTVNB
IGFuZCBoYXMgbm90IGJlZW4gY3JlYXRlZCBpbiBETlMuDQoNClNvIGhvdyBkbyBJIGFzc2ln
biB0aGUgSG9zdG5hbWVzIHRvIHRoZSBnTVNBPw0KDQpTZWNvbmQgcXVlc3Rpb246DQpMb29r
aW5nIGF0IHRoZSAtLWhlbHAgSSBzZWU6DQpzYW1iYS10b29sIHNlcnZpY2UtYWNjb3VudCBj
cmVhdGUgLS1oZWxwDQouLi4NCi0tZ3JvdXAtbXNhLW1lbWJlcnNoaXA9R1JPVVBfTVNBX01F
TUJFUlNISVANCiAgICAgICAgICAgICBQcm92aWRlIG9wdGlvbmFsIEdyb3VwIE1TQSBNZW1i
ZXJzaGlwIFNEREwuDQouLi4NCg0KQnV0IGl0J3Mgbm90IGV4cGxhaW5lZCBob3cgdG8gc2V0
IHRoaXMgcGFyYW1ldGVyIGFuZCB3aGF0IGl0IGlzIG5lZWRlZCBmb3IuIEEgZ3Vlc3M6IElz
IHRoaXMgdGhlIGxpc3Qgb2YgaG9zdG5hbWVzIHVuZGVyIFdpbmRvd3MgcHJvdmlkZWQgYnkg
UHJpbmNpcGFsc0FsbG93ZWRUb1JldHJpZXZlTWFuYWdlZFBhc3N3b3JkPw0KDQoNCg0KDQo=

--------------inv1wrEZJU0pm7dDJ6VIY87i
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

--------------inv1wrEZJU0pm7dDJ6VIY87i--

--------------T9uAQGzIhMrpa1vjnbcOmf0X--

--------------b0QSvxNzJb0PO2PR0MmQ8IN8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCaGZ+NgUDAAAAAAAKCRBS9tTdG7aKtYKy
AP95bCTMR956wvcEx9vvdEYOYxhG/zeeLynzP0z3QOsonAEAkqQziBKWQQFUrTil8DnOxTrGXNFZ
CMRDSx0HJxifuQg=
=1GKj
-----END PGP SIGNATURE-----

--------------b0QSvxNzJb0PO2PR0MmQ8IN8--

