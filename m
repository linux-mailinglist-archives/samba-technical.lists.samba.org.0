Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B48A061DA
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2025 17:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+yq8t26qUTqoEBw1n9p3Sj2znRFL91cvHGsA8liBxpA=; b=VbkbDqoaltYvJoG3LxqRM9xkcf
	lBAVhXwgOa3K/8RVSjDsq7KzMf2uRyYNf2DRN6bWy/YuB9TUuzRNuKTFvSjgcJt8XsoOnH9+wFfC9
	PUDEgeo3QZzCV5LYNN5FOyQO+xYBUDFoPWATnlnnkw6v5N+4l8lmWuEn58qw817A+ZOE74yzTCwcX
	WZdFuP2IIM6o5OR+yNNWgdx/gZMKaM09CHgX2T0kPvzZfzbaigSj7m6I+obAfklidqd9x0J/0p+aI
	62ADYMW9An8dexDenP4ZRmQmLjZlb/lkyeXHPC7WaldOwgZi0EwNZD+2Ktsoh7ciJtXes4APX+c7g
	e6W8bNpQ==;
Received: from ip6-localhost ([::1]:62648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tVYvM-007cFy-0Z; Wed, 08 Jan 2025 16:28:52 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:58529) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tVYvH-007cFr-PG
 for samba-technical@lists.samba.org; Wed, 08 Jan 2025 16:28:50 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id BA399ABF71;
 Wed,  8 Jan 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1736353722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+yq8t26qUTqoEBw1n9p3Sj2znRFL91cvHGsA8liBxpA=;
 b=NjU+ZCBVfMBKZaglsD6obfCvuqWTXsaH5rcrRZMqoC+J0sVWqbH5/oTxzllEc6alk7nHPc
 33JCeIBN697jTAxW7ZYrNR/hKZA+/6NUwzKSyx7UQmwY65FbnloADxDbewkgUmyFBlP0AY
 +tt1jLueZyUJYyEeJmNFsnXxNlVJFkqor2lxyksGK2Gk2MVtbz5x0l1nZ3UJglU3iLJ4LT
 gYiXOx45FvsYLyobZuQgECLYvbd/Ut+nSYMJ8SGjVl9W2PeHyUxwXIS8A9bBS06T3fz9ga
 9RYwaJ9LKXW1tTXlxOenb6zM1HZcYIURQ/ssU6Xh22qe1SHzVoU2OFtcszUgbA==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id pR3S7eAGsiMK; Wed,  8 Jan 2025 17:28:33 +0100 (CET)
Received: from [192.168.123.203] (p5b240852.dip0.t-ipconnect.de [91.36.8.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 079B9A996C
 for <samba-technical@lists.samba.org>; Wed,  8 Jan 2025 17:28:32 +0100 (CET)
Message-ID: <a9ee23c9-de32-464f-b1a5-6256a0bd4e6a@kania-online.de>
Date: Wed, 8 Jan 2025 17:28:32 +0100
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
Content-Language: en-US, de-DE
Organization: Stefan Kania
In-Reply-To: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NSqg9NSao4FjzSpmhDf2nPlv"
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
--------------NSqg9NSao4FjzSpmhDf2nPlv
Content-Type: multipart/mixed; boundary="------------uls5PUHSCO7VikcNZj90PW73";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <a9ee23c9-de32-464f-b1a5-6256a0bd4e6a@kania-online.de>
Subject: Re: authentication policies in Samba 4.21
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
In-Reply-To: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>

--------------uls5PUHSCO7VikcNZj90PW73
Content-Type: multipart/mixed; boundary="------------zE1Q2fo7SAGBhs0CwKAX5CTA"

--------------zE1Q2fo7SAGBhs0CwKAX5CTA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

U3RpbGwgbm90IHdvcmtpbmcsIGFmdGVyIHNldmVyYWwgdGVzdHMgOi0oIGdpdmluZyB1cC4N
Cg0K
--------------zE1Q2fo7SAGBhs0CwKAX5CTA
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

--------------zE1Q2fo7SAGBhs0CwKAX5CTA--

--------------uls5PUHSCO7VikcNZj90PW73--

--------------NSqg9NSao4FjzSpmhDf2nPlv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZ36nsAUDAAAAAAAKCRBS9tTdG7aKtZlc
AQDRlDUkzLuyI6KAj4j+obU11fIRmBTuHj43MMNmeGxI4QD/RRyfZaM3tIWkWJ8i1aF7iEyrFqk1
aOp4nIpUButEGQc=
=gAgC
-----END PGP SIGNATURE-----

--------------NSqg9NSao4FjzSpmhDf2nPlv--

