Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 334CE9B6BF4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 19:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=BlUKV7d8YzuCx1mRw0YzuGHvXP1v91RrYnjOjyiYVuk=; b=qmcvBST0ynWLyS6freeMuAZvtE
	G4uAAA4wfaVOMtR5+1vvof8+W62S7xFw30aH4VogdRNy3yv+5aMQT8owbIFwS6jCvfmwfRBgwOhvG
	BYAPGa/8D4v4e+MJZlBOFZ+R5vzmlM9JKqsRbfsmSJARyQXRzQ4muasmop/fqjhpZw3U0doxLOgCQ
	DbSNUh9iUl0ZHmlszvNlw14NGQlhfNWmMHHZta/0KAz6bJAXkyQFZe0WLbC+cyfpXK+Nl+oeHBUKp
	m64W67RtLDGBysfBGxU5+7rLh/LKdFNYW8mXqCX9c4bOsoDDdW7OPHbVcuyff4K7zXMlvUeJLCcpo
	yUkHZhcA==;
Received: from ip6-localhost ([::1]:32670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6DFm-005bRp-Gv; Wed, 30 Oct 2024 18:17:10 +0000
Received: from plasma31.jpberlin.de ([80.241.56.82]:45195) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6DFi-005bRi-1v
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 18:17:08 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id D8E74A27E3;
 Wed, 30 Oct 2024 19:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1730312219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BlUKV7d8YzuCx1mRw0YzuGHvXP1v91RrYnjOjyiYVuk=;
 b=BxnQpCqEts1qDBdJpEzjBokohjcbUDbPnRrNrYc5JSDsBSEBuOK1RY8YcuChjEkwz9s7N2
 xIyWpxAQKJzVV+DmWZ5mNKHCkX//OBcSaQ+VD31RMAaGzBgHP6/vJE/8yAccu56JBRgVVm
 elfLCH8Ej3Tcig6ldkUBVFfZo3NaDg+ZMOVVXrqXYIPGMEGyniwaE9Tj6u7DscYgHuP98b
 aZfG0Y0eVjVUqclLZCX8IwnY7l0JL5CKDmWnV3j/+kSOmDw33BVVgigBJdUFNLDUNYNE6y
 9i8Bc8S+CelA9KxwCYm1r9vLqD/2ByFhm6E8frUp32ij/Chifv8J/ODmr9bb6A==
Received: from plasma.jpberlin.de ([80.241.56.76])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id CQ96S3VkOUNS; Wed, 30 Oct 2024 19:16:53 +0100 (CET)
Received: from [192.168.123.203] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 78F0DA27DE
 for <samba-technical@lists.samba.org>; Wed, 30 Oct 2024 19:16:53 +0100 (CET)
Message-ID: <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
Date: Wed, 30 Oct 2024 19:16:53 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <20241030171507.5d092646@devstation.samdom.example.com>
Content-Language: en-US, de-DE
Organization: Stefan Kania
Subject: Re: authentication policies in Samba 4.21
In-Reply-To: <20241030171507.5d092646@devstation.samdom.example.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0jn59SwRWuh0fTrm01WtGYnp"
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
--------------0jn59SwRWuh0fTrm01WtGYnp
Content-Type: multipart/mixed; boundary="------------bvV0iBLblVFJynUSsHNngTE0";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <920d8e6f-2215-427c-a6f6-e515bbb6cad8@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <20241030171507.5d092646@devstation.samdom.example.com>
In-Reply-To: <20241030171507.5d092646@devstation.samdom.example.com>

--------------bvV0iBLblVFJynUSsHNngTE0
Content-Type: multipart/mixed; boundary="------------VU0Dd0Q6zOgTkfLBokBzklzR"

--------------VU0Dd0Q6zOgTkfLBokBzklzR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBbSAzMC4xMC4yNCB1bSAxODoxNSBzY2hyaWViIFJvd2xhbmQgUGVubnkgdmlhIHNhbWJh
LXRlY2huaWNhbDoNCj4gVHJ5IGFkZGluZyAnLS1zaG93LWJpbmFyeScgdG8gdGhlIGxkYnNl
YXJjaCBjb21tYW5kDQoNCk5vLCBJIG9ubHkgZ2V0IGFuIGVtcHR5IHN0cmluZy4gSSB0aGlu
ayB0aGUgcHJvYmxlbSBpcywgdGhhdCB0aGUgYmluYXJ5IA0KaXMgY29udmVydGVkIHRvIGJh
c2U2NCBpZiBsaXN0ZWQgd2l0aCBsZGJzZWFyY2guDQoNCnJvb3RAZGViY2xpZW50On4jIGxk
YnNlYXJjaCAtSCBsZGFwOi8vd2luMjAyMi53aW5leGFtcGxlLm5ldCANCidDTj13aW4xMS1w
b2xpY3knIC0tY3Jvc3MtbmNzICBtc0RTLVVzZXJBbGxvd2VkVG9BdXRoZW50aWNhdGVUbyAg
LVUgDQphZG1pbmlzdHJhdG9yIC0tc2hvdy1iaW5hcnkNClBhc3N3b3JkIGZvciBbV0lORVhB
TVBMRVxhZG1pbmlzdHJhdG9yXToNCiMgcmVjb3JkIDENCmRuOiBDTj13aW4xMS1wb2xpY3ks
Q049QXV0aE4gUG9saWNpZXMsQ049QXV0aE4gUG9saWN5IA0KQ29uZmlndXJhdGlvbixDTj1T
ZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdpbmV4YW1wbGUsREM9bmV0DQptc0RTLVVz
ZXJBbGxvd2VkVG9BdXRoZW50aWNhdGVUbzogDQogIA0KDQoNCiMgcmV0dXJuZWQgMSByZWNv
cmRzDQojIDEgZW50cmllcw0KIyAwIHJlZmVycmFscw0KDQpTdGVmYW4NCg0KDQoNCg==
--------------VU0Dd0Q6zOgTkfLBokBzklzR
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

--------------VU0Dd0Q6zOgTkfLBokBzklzR--

--------------bvV0iBLblVFJynUSsHNngTE0--

--------------0jn59SwRWuh0fTrm01WtGYnp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZyJ4FQUDAAAAAAAKCRBS9tTdG7aKtah6
AP96TYg/yA5YHGuQ37SrOVKNLbXna5FCbsOikPuqswvYJgD/ddLXrhuF6x88tXCRm+fqhUpv4ANC
ql2SzLHcrKmmLw8=
=RhVi
-----END PGP SIGNATURE-----

--------------0jn59SwRWuh0fTrm01WtGYnp--

