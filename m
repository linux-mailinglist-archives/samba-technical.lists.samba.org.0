Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4FA02F06
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 18:33:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XBDYcNhHCaQiM3LLS0bVYzPogFenr3Fxk4FYS9vgld0=; b=O5iq1LkWgexugc90B6JDXFhiDl
	ig1Xvd1wf0eQBnRw6BjIKWhxRMZ+z+nrp+ekszXu1fmNZoPC9fhxUJ26WTzLGotocb/bjJiGJv6QS
	i/ArZpt79CDt1b1Mc9Pho4wlUIUTU7XjWU6BciD0b5Z+0aQcPS63og4TMhja4v7OAn4YwJ6U+uOV1
	U1VGCKyfeMBSmToVgQZSxvKeYRFMwUGzaulDkyxYJTSqUBh5CmVzhyqCk8BOBcY3li+Vq2vAtx+Et
	MTZ0yYGJna0BTGwmKtZkSDzVNalFSCPWu5FBAWkpHksGNtFrOPjk7Ol4yaMQGG1XvCg+bJJATHmnR
	79LvhHoA==;
Received: from ip6-localhost ([::1]:46588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUqyS-007Pmf-5q; Mon, 06 Jan 2025 17:33:08 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:35689) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUqyM-007PmY-My
 for samba-technical@lists.samba.org; Mon, 06 Jan 2025 17:33:06 +0000
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by plasma.jpberlin.de (Postfix) with ESMTP id 0409AAC0F0;
 Mon,  6 Jan 2025 18:32:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1736184776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XBDYcNhHCaQiM3LLS0bVYzPogFenr3Fxk4FYS9vgld0=;
 b=oavW0kYHUtUHjizP7vbWvI5sINh7+sUXT0idWkEY9qqSHq/mg9xfkW92wGoK1D8Cdi1FEy
 nR1vH9cNp1ee7Sq/e3qJAgdaXgUY3fv3boyDW76SxzkvdbUXYKPHZ7PETceWGZSBS29ihD
 bYOIBS043cN/Tjo6Q4+Okhsn2HYpNE/w1rlLNR2EmPIlOUJ6cjiAVzgSgXzIkDp19c4oH0
 LU/sfSHRx8d7evZ6MEBtcCkGawfb0kOWLdP7EBKTRVw3C8/oVVmf8RqZaJHQtjNkyG7Lm0
 x7s7upqu8l79tlw03J+APmOrgGDg/T/RwvEprX7QVGjjck0nHh2BBQJ8VCQZwQ==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id bPgsNV6Ob6rA; Mon,  6 Jan 2025 18:32:50 +0100 (CET)
Received: from [192.168.123.203] (p5b240852.dip0.t-ipconnect.de [91.36.8.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 98105AF7BA;
 Mon,  6 Jan 2025 18:32:49 +0100 (CET)
Message-ID: <7a8f7b00-28a9-4826-b725-dfa1fe40a19f@kania-online.de>
Date: Mon, 6 Jan 2025 18:32:49 +0100
MIME-Version: 1.0
Subject: Re: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
To: miguel medalha <medalist@sapo.pt>, samba-technical@lists.samba.org
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
 <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
 <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FiGv8HVyuTvLyMoMPYhxJfAD"
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
--------------FiGv8HVyuTvLyMoMPYhxJfAD
Content-Type: multipart/mixed; boundary="------------moOjv0ujzpz7HCp5GznpJair";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: miguel medalha <medalist@sapo.pt>, samba-technical@lists.samba.org
Message-ID: <7a8f7b00-28a9-4826-b725-dfa1fe40a19f@kania-online.de>
Subject: Re: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
 <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
 <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
In-Reply-To: <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>

--------------moOjv0ujzpz7HCp5GznpJair
Content-Type: multipart/mixed; boundary="------------X1CLsTbJ0gpA1A0Znxa1UxFO"

--------------X1CLsTbJ0gpA1A0Znxa1UxFO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjAxLjI1IHVtIDE4OjI4IHNjaHJpZWIgbWlndWVsIG1lZGFsaGE6DQo+IEhh
dmUgeW91IHJlYWQgdGhlIGJ1ZyByZXBvcnQ/DQo+IA0KPiBodHRwczovL2J1Z3ppbGxhLnNh
bWJhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTU3MzgNCg0KWWVzLCBhbmQgSSB0cmllZCBpdCBh
dCBteSB0ZXN0aW5nIGVudmlyb25tZWx0IHdpdGggRGViaWFuIDEyIGFuZCBTYW1iYSANCjQu
MjEgb3V0IG9mIHRoZSBCYWNrcG9ydHMuIEkgY291bGQgYWRkIG1vciB0aGVuIG9uZSBncm91
cCAoSSAgc3RvcHB0IA0Kd2l0aCBmb3VyKSBhbmQgSSBoYWQgbm8gcHJvYmxlbS4gSSB1c2Ug
UlNBVCB0byBtb2RpZnkgdGhlIEdQTy4NCg0KDQo=
--------------X1CLsTbJ0gpA1A0Znxa1UxFO
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

--------------X1CLsTbJ0gpA1A0Znxa1UxFO--

--------------moOjv0ujzpz7HCp5GznpJair--

--------------FiGv8HVyuTvLyMoMPYhxJfAD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZ3wTwQUDAAAAAAAKCRBS9tTdG7aKtaFb
AQDib10sTMby7mvugZc6xArkydJmzrbaqWKU776HtP6+8AEA6Icri/LAW3/+wIi6Sz165Dp9AuIq
tBxgG1xWi6+iEQw=
=03cx
-----END PGP SIGNATURE-----

--------------FiGv8HVyuTvLyMoMPYhxJfAD--

