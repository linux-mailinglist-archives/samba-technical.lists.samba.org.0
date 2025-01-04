Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC36A0160F
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jan 2025 18:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=MFyGHGkH2f1AtyrJCQwdHez9jsDMOXIGKx09Sa0H1iA=; b=jeu7oGsL49o4esclJSHKreeVxb
	QXwTf8CXGjOkTGZjP2lGYof7TtaDhw75kyuWvJdS4X9lwkeWovSQDbF0ehwJf44QjmDUuWPT9lo1G
	hxH2/xGWj8n8P/2ggASB0ehUExLSdBq9XKnnF0j25He2atsijaaqWLv/Jznda6UhD/8EdmQsQ9m3d
	zWRk4tBfd9H3owMjOrAvajKYzbJkbCZZ0arq2/MzXJCV/OBlPURYyVn+5FTn8FvSx/51EQ6RhlCwQ
	csiQlhri0t7FK5072tzyv2pXzLjSCJcy20W7YL0gQlLO/wHu//3tseJJzFsO6LvtDS1gGETWqTcLV
	fdhXalRg==;
Received: from ip6-localhost ([::1]:31858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tU7Yn-007HIm-PD; Sat, 04 Jan 2025 17:03:37 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:40687) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tU7Yi-007HIf-A1
 for samba-technical@lists.samba.org; Sat, 04 Jan 2025 17:03:35 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 23269AB2AD;
 Sat,  4 Jan 2025 18:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1736010205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MFyGHGkH2f1AtyrJCQwdHez9jsDMOXIGKx09Sa0H1iA=;
 b=HTwGx/GNXGSxindJYqieaXcVe/LSYuZB7KwzSpNMpItbQG7efiLaUfX6tq4q6VnOj/gW2p
 0MTgg1t5Ylt58BiCvYCKwSKzvxOhOZARjYOP0Q9AZGtwqeFwElS/b4haTXFydJdFMylG6L
 Q38jupt38GzPNtg8cq70KXla8SxgQL43/fDkOz7w/SHBE+6WFdCQGnhZSDhh/tYvG2upWy
 MaizduNgNqEISXjAZt0dW/3cNZmjDbd1jY0P8r79YAD4yWw+y9XeK/OI8hndOMs566xWk2
 JCKqxg6zVY+/bPmQDeYa+l6cvFX9G+sEWhnQzeYwKrxx1sBMEv5dvZj8aB+JMQ==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id YggCBpJYek-0; Sat,  4 Jan 2025 18:03:19 +0100 (CET)
Received: from [192.168.123.203] (p5b240852.dip0.t-ipconnect.de [91.36.8.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id EB5B6AB1CC
 for <samba-technical@lists.samba.org>; Sat,  4 Jan 2025 18:03:18 +0100 (CET)
Message-ID: <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
Date: Sat, 4 Jan 2025 18:03:18 +0100
MIME-Version: 1.0
Subject: Re: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
To: samba-technical@lists.samba.org
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xouKIGllK3gZaX4OKXd4bu1s"
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
--------------xouKIGllK3gZaX4OKXd4bu1s
Content-Type: multipart/mixed; boundary="------------FPb0Wf6J7x9RGxPHX60odArs";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
Subject: Re: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
In-Reply-To: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>

--------------FPb0Wf6J7x9RGxPHX60odArs
Content-Type: multipart/mixed; boundary="------------BQlHiJbFn1oz5mc6ej78DYWY"

--------------BQlHiJbFn1oz5mc6ej78DYWY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T19PIFdoeSBzaG91bGQgaXQgYmUgbm90IHBvc3NpYmxlIHRvIGNyZWF0ZSBHUE9zIHdpdGgg
U2FtYmEgNC4yMCBhbmQgDQo0LjIxPyBBdCB0aGUgbW9tZW50IEknbSB3cml0aW5nIG15IG5l
dyBTYW1iYTQgYm9vayAoaW4gR2VybWFuKSwgSSB1c2UgDQpTYW1iYSA0LjIxIGZyb20gRGVi
aWFuMTIgQmFja3BvcnRzIHVuZCBJIGNyZWF0ZWQgYSBsb3QgR1BPcywgYm90aCBmb3IgDQpX
aW5kb3dzLSBhbmQgTGludXgtY2xpZW50cy4NCg0KDQpBbSAwNC4wMS4yNSB1bSAxNzoxOSBz
Y2hyaWViIG1pZ3VlbCBtZWRhbGhhIHZpYSBzYW1iYS10ZWNobmljYWw6DQo+IEFyZSBTYW1i
YSBkZXZlbG9wZXJzIGF3YXJlIHRoYXQgdGhlIG9ubHkgd2F5IHRvIGNyZWF0ZSB1c2FibGUg
R1BPcyAod2hpY2gNCj4gYXJlIGFyZ3VhYmx5IG9uZSBvZiB0aGUgbW9zdCBpbXBvcnRhbnQg
ZmVhdHVyZXMgb2YgYW4gQUQgZW52aXJvbm1lbnQpIGlzIHRvDQo+IHVzZSBhIFNhbWJhIHZl
cnNpb24gKDQuMTkueCkgdGhhdCBpcyB0d28gdmVyc2lvbnMgYmVoaW5kIHRoZSBjdXJyZW50
IG9uZSBhbmQNCj4gdGhhdCwgYWNjb3JkaW5nIHRvICJTYW1iYSBSZWxlYXNlIFBsYW5uaW5n
IGFuZCBTdXBwb3J0ZWQgUmVsZWFzZSBMaWZldGltZSIsDQo+IGlzIHNjaGVkdWxlZCBmb3Ig
ZGlzY29udGludWF0aW9uIGluIE1hcmNoIDIwMjU/DQo+IA0KPiBodHRwczovL3dpa2kuc2Ft
YmEub3JnL2luZGV4LnBocC9TYW1iYV9SZWxlYXNlX1BsYW5uaW5nDQo+IA0KPiBQbGVhc2Ug
bm90ZSB0aGF0IEkgYW0gbm90IGJpdGNoaW5nIG9yIGRlbWFuZGluZyBhbnl0aGluZywgSSBh
bSBncmF0ZWZ1bCBmb3INCj4gd2hhdCB3ZSBoYXZlIGFuZCBJIHRydWx5IGFwcHJlY2lhdGUg
dGhlIGhhcmQgd29yayBvZiB0aGUgU2FtYmEgdGVhbSBtZW1iZXJzLg0KPiBJIGFtIGp1c3Qg
Y2FsbGluZyBhdHRlbnRpb24gdG8gdGhpcyBmYWN0LiBJIHJlYWxseSB3aXNoIEkgY291bGQg
aGVscCwgYnV0DQo+IHVuZm9ydHVuYXRlbHkgSSBhbSBqdXN0IGEgc3lzYWRtaW4sIG5vdCBh
IGRldmVsb3Blci4NCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVn
LmNnaT9pZD0xNTczOA0KPiANCj4gDQo+IA0KDQo=
--------------BQlHiJbFn1oz5mc6ej78DYWY
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

--------------BQlHiJbFn1oz5mc6ej78DYWY--

--------------FPb0Wf6J7x9RGxPHX60odArs--

--------------xouKIGllK3gZaX4OKXd4bu1s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZ3lp1gUDAAAAAAAKCRBS9tTdG7aKtZRT
AQDP+bDP6GF+vrcdC4W7qnEACMGw3JdFKyifKSLsyu0CMQD/XGsRgeP/beH5i6aYmhepAmlJ4aM1
TvkeHpAMAeqEZAg=
=gnuj
-----END PGP SIGNATURE-----

--------------xouKIGllK3gZaX4OKXd4bu1s--

