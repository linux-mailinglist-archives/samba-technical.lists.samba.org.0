Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EA545571
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jun 2022 22:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rz85sLw4ANJNlp9PsPvaI8mDrxj0TW3Wit7Lo7S5Xo8=; b=W3TxhQi3KtlUftQoM//sPqf9Ap
	ybOVjPR3uOtuNm+Mz+ceEh/pV6qJD2AxszmR4KhWdLSfh1M16xaS5SycJ08WJvMtbamhGQHKQrUhH
	arHkrpMOO4KZlGOQJfgUtOb/FuWfIFg3ADputtvdBrPtejOwIsnX/cRBJYIxWr4tz9X4pIM7i25/b
	qcYrnfIxICJohmsquedxzZb7CF+3tLSLTMz9Q2+rS/XzP2CNgfqFQKXxpY+ycMNuG1Q3GfHZvl83s
	xKHH7uQd1rllxeq8Uw50JSkfjKHLiUqXP0gTG4TrDiH8LKNHK9kPJV4bym5M4c6PEjGNtFxN0+8Sw
	+Qpbtkcw==;
Received: from ip6-localhost ([::1]:39270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzOYn-008uft-FO; Thu, 09 Jun 2022 20:15:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62214) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nzOYY-008ufI-2k; Thu, 09 Jun 2022 20:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=rz85sLw4ANJNlp9PsPvaI8mDrxj0TW3Wit7Lo7S5Xo8=; b=HRznJR3mvz0ktMODSfkaReZtcO
 UIAtoJy4Djsc7FoFg1lbuxydu9rviH1+S9kYIq/fE6Q/u1XSKBiohmLVdxlqBu3g1bqGFf0cAqJyu
 SMb7gtfGpLt7sFz2xvAJyL5ZDUcFpVHKbSs2/BsECfnsal4HHjkd1EXmKnSyvY04KE/Ll3U0Y4Drf
 VxuEj2nvZv5xnrMKLi4icw8mvWWJRfHotYDf0VJkflvwzO5Vunfif6H37uPqZFJP7E4d6plgU1wSR
 AMs/yGz2/AITVT56Mo3OIgnRIjzsH9hazeW8DNMe1qpsrXNoRbl+LhFS6ljnLebBszDooXoJw91PY
 rQlF39E3SUMlcOggFraZZbwwT+riwDUJe177H1ARD/IbUEjRaUIq+rruI/rMD8Mlj5BNzmXarS/4q
 ueV6UEWTYYm88xvNBzoQTjz+pAszPsRzLshCOhxeyDN77cVkuDpjWhF19sIYnJ3ud2mPgl+zS2teO
 H8nM2RQFtEfm6t7QN5rMz53/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nzOYX-004r4h-0c; Thu, 09 Jun 2022 20:15:01 +0000
Message-ID: <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
Date: Thu, 9 Jun 2022 22:15:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
Content-Language: en-US
To: John Mulligan <phlogistonjohn@asynchrono.us>
References: <3245098.9o76ZdvQCi@pretzel>
In-Reply-To: <3245098.9o76ZdvQCi@pretzel>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S0DxVGPbuFVF078m8E5DxyU3"
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S0DxVGPbuFVF078m8E5DxyU3
Content-Type: multipart/mixed; boundary="------------XT8zx94kFu2n6s3RjrRf2aeU";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Message-ID: <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
References: <3245098.9o76ZdvQCi@pretzel>
In-Reply-To: <3245098.9o76ZdvQCi@pretzel>

--------------XT8zx94kFu2n6s3RjrRf2aeU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9obiwNCg0KT24gNi85LzIyIDE5OjQwLCBKb2huIE11bGxpZ2FuIHZpYSBzYW1iYSB3
cm90ZToNCj4gVGhlIHRlYW0gYmVoaW5kIHRoZSAiU2FtYmEgaW4gS3ViZXJuZXRlcyIgcHJv
amVjdCBpcyBoYXBweSB0byBhbm5vdW5jZSBvdXINCj4gZmlyc3Qgc2V0IG9mIHJlbGVhc2Vz
LiBSZWxlYXNlIHYwLjIgbWVhbnMgd2UncmUgY29uZmlkZW50IHRoYXQgbW9yZSBwZW9wbGUg
Y2FuDQo+IHVzZSB0aGUgc2FtYmEtb3BlcmF0b3IsIHRoZSBzYW1iYS1jb250YWluZXIgaW1h
Z2VzLCBvciBhbnkgb2Ygb3VyIG1hbnkgb3RoZXINCj4gcHJvamVjdHMgd2l0aG91dCBoYXZp
bmcgdG8gYmUgYSBkZXZlbG9wZXIgZGVlcGx5IGludm9sdmVkIHdpdGggdGhlc2UgY29kZQ0K
PiBiYXNlcy4NCg0KY29uZ3JhdHMgYW5kIHRoYW5rcyB0byB5b3UgYW5kIGFueW9uZSBpbnZv
bHZlZCBpbiB0aGUgZWZmb3J0IQ0KDQpGd2l3LCBpdCBzZWVtcyB3ZSdyZSBmaW5hbGx5IGFi
bGUgdG8gaGVscCB5b3UgYW5kIHRoZSBTSU5LIHByb2plY3QgYnkgDQpzZXR0bGluZyBvbiBh
biB2aWFibGUgYXBwcm9hY2ggaG93IHRvIG1hbmFnZSB0aGUgTlRBQ0xzIGluIHhhdHRycyBp
biANCmNvbnRhaW5lcnMuDQoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJh
Ly0vbWVyZ2VfcmVxdWVzdHMvMjU1Nw0KDQpJJ2xsIHRyeSB0byB3cmFwIHRoaXMgdXAgYW5k
IHJlcXVlc3QgZm9yIHJldmlldyBpbiB0aGUgbmV4dCBkYXlzLCBzdGF5IA0KdHVuZWQuDQoN
CkNoZWVycyENCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAg
ICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQg
ICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------XT8zx94kFu2n6s3RjrRf2aeU--

--------------S0DxVGPbuFVF078m8E5DxyU3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmKiVMQFAwAAAAAACgkQqh6bcSY5nkaX
mQ//U6KOgM0lCKznww1TmYLnlbjxeKQUbD5XgsapMeUnBytWP+wdpAOPMxrsfjxc/jjrp3nn9Oid
XIoussAY6B8lBRHQer4MZHfqHTFA20/vLs+7MpGgUEy//JvqGWyCedwbi1Jw3k1xUQLLxeGv7EdE
jZCWNg4M/PWV4hqByzf6kSp0UWGfu9YWbhOnMR8MaCFKDEDzMns8JoPS9VgXrHm4M/JWIOAgVKzG
uVWx7FfI5yYNetqKn6rv5qq2LSYCu1+3s2xIfzSyw5dFFRO9RbiHEp9Ru+NfckFegulfVvwragSE
JtAnwPI2vvgEOKgLlrjHv4+ALcmWNlP2ZwKU6gWlEeuqUcvF4sHKc1qI0YhDjszaIrs647GaXS5Z
72z2KMNdyzex1ywFhbKCGcEdBRWkSMN8+oLnF0a7ZxJAUdZdszpyaj8nXRB88yZJ/vBtFIsHgx8M
7LNNN0XhnbZsPJhRqEu+DbtK6mKRPXep9BM0Ig7PRIrxA3vVAoTX/pswmlf+kLspTe86yErB2upk
7DfMuOfs6LYZ6ViNpQEBqQ7BQYk7ix46y7Jq+G6eTERbOU3rKzB0bJVrB6M/Usit4JwLM+IRO5tL
saBC9CUaHnUNKoddNlq+sGLscbo5a6H+aJvj2o031NSd9pmKMZDRZLzr2ugz7TwaBstxxusPMjwR
9+4=
=qrYZ
-----END PGP SIGNATURE-----

--------------S0DxVGPbuFVF078m8E5DxyU3--

