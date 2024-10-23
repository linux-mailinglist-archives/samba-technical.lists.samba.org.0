Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C229AD363
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2024 19:55:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2uWMniEQ3U7vm0n8JvgSWUern/sklcV2D/Tz1p+299s=; b=jHEAs1t1IfI3yt4J84WHPc0wCa
	lxWYw5yDV3OJG1vrXkrszdcgVTNk6P3Q5m8nhgZ8G4mleB2r0WPLd06QxiFneQ1fuoHsVoljBZHWB
	D11dNYPUJiS7QpfBZF4tMcGbv5JKrKvsAIpUG+MFDcPgub08aX5x7TDrsRwyHi6WtsxbSVGPvwEeo
	hNWezfW6EJ+Q0tbPHbTXnETaA5P6+1Gl16URr1TLHDD/LCXt/FzCeVEkT+/4JdXXTwE5tORzkCnok
	Wt2HbN5Urn/bGPJZfYqPwHISZA11Eq0Z5+F5T3F4Mu2Am760ViinZ8C+vdWrU4V5HRBiM7gnCECsC
	IhJwvInQ==;
Received: from ip6-localhost ([::1]:23872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t3fZY-004r8p-MN; Wed, 23 Oct 2024 17:55:04 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:54543) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t3fZT-004r8f-PZ
 for samba-technical@lists.samba.org; Wed, 23 Oct 2024 17:55:03 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id D3FF1AB752;
 Wed, 23 Oct 2024 19:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1729706095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2uWMniEQ3U7vm0n8JvgSWUern/sklcV2D/Tz1p+299s=;
 b=jxNQ2+bu/xx8ej9Egur4aa3XZ8c0Y3eN9UWMk8LqymjRAGK2HENQdRanD5HQLTcuDv9cmA
 eYoyZujrmzW5H01wuQl1T0Mkvpl6g5mOBXBwfKht1MBAV50f+IqYZCMP8Ip8My3Zek+Y0d
 ic6c2Y56NHkpeP2Hf4l62b4ksdNh8N2whSX+LNHyPaOI6/s1YOZPJQ2Xqwi9k6ArRpBOad
 4a8lFByxE9FJf2f+/IlzFL+C7VaBw7Mknj3at7xfJneRWGcRkNEwZHiR/Hnba1oCBW3bFN
 gjlY+z7JYFhjuBZ3yGyxyw72267TCUhEFgKfY3S6LvbrkGo+0IR4sNOYuDevAg==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id eiOMsDpderOy; Wed, 23 Oct 2024 19:54:48 +0200 (CEST)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 23455AC597;
 Wed, 23 Oct 2024 19:54:48 +0200 (CEST)
Message-ID: <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
Date: Wed, 23 Oct 2024 19:54:47 +0200
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pHqf4o7ACqo0ugNROzzS77bw"
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
--------------pHqf4o7ACqo0ugNROzzS77bw
Content-Type: multipart/mixed; boundary="------------w841w8L9Yb3tnV9nDbioNqxu";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <f1cbcc0d-3f5e-4e1b-94da-ae76d2f2b9d5@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
In-Reply-To: <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>

--------------w841w8L9Yb3tnV9nDbioNqxu
Content-Type: multipart/mixed; boundary="------------hex4TrXTD9pNozJhxBqSPcdL"

--------------hex4TrXTD9pNozJhxBqSPcdL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSBmb3VuZDoNCmh0dHBzOi8vbGVhcm4ubWljcm9zb2Z0LmNvbS9lbi11cy9vcGVuc3BlY3Mv
d2luZG93c19wcm90b2NvbHMvbXMtYWRhMi85ZjFlYjIxNS1kYWYxLTRmZTUtYTMxYi0xYmVm
OGNjMWJhYTQNCg0KU28gdXNpbmcgbXNEUy1Bc3NpZ25lZEF1dGhOUG9saWN5QkwgaW5zdGVh
ZCBvZiBtc0RTLUFzc2lnbmVkQXV0aE5Qb2xpY3kgDQpzaG91bGQgd29yaw0KDQoNCg0KQW0g
MjMuMTAuMjQgdW0gMTk6MzUgc2NocmllYiBTdGVmYW4gS2FuaWEgdmlhIHNhbWJhLXRlY2hu
aWNhbDoNCj4gTXkgY29uY2x1c2lvbjogQXMgbG9uZyBhcyBpdCBpcyBub3QgcG9zc2libGUg
dG8gKG9yIG1heWJlIEkgY2FuJ3QgZmlndXJlIA0KPiBvdXQgd2hvIGl0IHdvcmtzKSBhc3Np
Z24gdGhlIHBvbGljeSB0byBhIHVzZXIgYnkgYWRkaW5nIHRoZSBhdHRyaWJ1dGUgDQo+IG1z
RFMtQXNzaWduZWRBdXRoTlBvbGljeSB0aGUgYXV0aC1wb2xpY2EgLyBhdXRoLXNpbG8gc3R1
ZmYgaXMgbm90IA0KPiB3b3JraW5nIHdpdGggc2FtYmEuDQoNCi0tIA0KU3RlZmFuIEthbmlh
DQpMYW5kd2VnIDEzDQoyNTY5MyBTdC4gTWljaGFlbGlzZG9ubg0KDQoNCg==
--------------hex4TrXTD9pNozJhxBqSPcdL
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

--------------hex4TrXTD9pNozJhxBqSPcdL--

--------------w841w8L9Yb3tnV9nDbioNqxu--

--------------pHqf4o7ACqo0ugNROzzS77bw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZxk4ZwUDAAAAAAAKCRBS9tTdG7aKtd3u
AQCV9a2OLa9cB65UdmpfEM0p3fyjLeVXSpyV0aJHBvgshAEA+7RXGbDcKIFqZa7/3Tf9OPWSTos+
HB9vh3D4qdMONAs=
=69Dp
-----END PGP SIGNATURE-----

--------------pHqf4o7ACqo0ugNROzzS77bw--

