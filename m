Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0419E5289
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2024 11:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=QJLAHT28qvtSi4fdc1SSe5DrMmzg5ZGiKAdAoxM/JfU=; b=n97CLsty3DXEpBkEomdFmLwD9u
	QWw1PjQ3ZGJ3gupMaM3KMUmwD9Gy6KMx1nsxk8CpsTLojFhG4sBK9ZMjQI1MsIBjL5EJ1oq6E7qiU
	uXV1kJLi8aF6voKuDNrZcqbE0M4pyP/+wk+5B0Zb7PcICT6EvB1XoRCvyu+4OU29TMccrOb3XAwrn
	GX775VXWvgrCBbG/zr+0cyk9l8v5UUn1I9ZEfMryPaHaYBVXSn6QXsuFBiqtAnLlxnZMhE9jxfQxw
	+u6ud7PAVz7QvOhD+UyqWqWLCqHYMT56GKs8DOfqFaGvWfwe46waRWz06vCy8G/i+Q4k2lSkdJz0I
	JULSFa2g==;
Received: from ip6-localhost ([::1]:39292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tJ9Fp-003Vsx-I6; Thu, 05 Dec 2024 10:38:41 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:33069) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJ9Fk-003Vsp-TA
 for samba-technical@lists.samba.org; Thu, 05 Dec 2024 10:38:39 +0000
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by plasma.jpberlin.de (Postfix) with ESMTP id 25101AA62A;
 Thu,  5 Dec 2024 11:19:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1733393952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=QJLAHT28qvtSi4fdc1SSe5DrMmzg5ZGiKAdAoxM/JfU=;
 b=eIp62sD30RJAZH6CKaVPdcyMvwIKeDdaXNWZJJ730+eaYzJiTJPeJ/CiscyDsHL7V1YyBP
 Mhzqg5Qe/JimY2koDWXGg61Xf3dOQv1L7csHzrGN68AJpT2aRWe/QSy5+sYbfp6obb4SWs
 18b1BCmjZNOAWKjQ1fGR4YCP4eLsFEx1N7Zn9ZCXl1CH9H6RI4sRzw540/rQZzalpO2O6R
 bbLCjKVzQC4Tnag/We0OrOt9+6p4kvQhnrZCZZRWLFIpUSoJO5SWqRBKilz4A8sGDH3tEJ
 rQS7ae/Dor86itk+DeHIlkKuJEpHEqrQ+pV+agDwTofqAxCmUVBrgRavjA0GWw==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id SEzs_6PLaZAi; Thu,  5 Dec 2024 11:19:03 +0100 (CET)
Received: from [192.168.123.203] (p5b240852.dip0.t-ipconnect.de [91.36.8.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 70E68AC0B7
 for <samba-technical@lists.samba.org>; Thu,  5 Dec 2024 11:19:03 +0100 (CET)
Message-ID: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
Date: Thu, 5 Dec 2024 11:19:02 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: en-US, de-DE
Subject: script enablerecyclebin
Organization: Stefan Kania
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Kdd7spAiagkLNe0xSlZ4aot0"
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
--------------Kdd7spAiagkLNe0xSlZ4aot0
Content-Type: multipart/mixed; boundary="------------fJCj8vSV1uuvfv9kjdyUSJlY";
 protected-headers="v1"
From: Stefan Kania <stefan@kania-online.de>
To: samba-technical@lists.samba.org
Message-ID: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
Subject: script enablerecyclebin

--------------fJCj8vSV1uuvfv9kjdyUSJlY
Content-Type: multipart/mixed; boundary="------------8NLxAOvXEyekXpt09FSwPtaP"

--------------8NLxAOvXEyekXpt09FSwPtaP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCmFmdGVyIGVuYWJsaW5nIHJlY3ljbGViaW4gd2l0aCB0aGUgc2NyaXB0IGVuYWJs
ZXJlY3ljbGViaW4gZnJvbSB0aGUgDQpzb3VyY2VzLCB0aGVyZSBhcmUgbm8gbW9yZSBkZWxl
dGVkIG9iamVjdCBpbiAiY249ZGVsZXRlZCBvYmplY3RzIiBpdCANCmxvb2sgbGlrZSB0aGUg
b2JqZWN0cyB3aWxsIGJlIGRlbGV0ZWQgaW1tZWRpYXRlbHkuDQpJJ20gdXNpbmcgU2FtYmEg
NC4yMS4xIGZyb20gdGhlIERlYmlhbiBib29rd29ybS1iYWNrcG9ydHMgYW5kIHRoZSBzY3Jp
cHQgDQpmcm9tIHRoZSBzb3VyY2VzIG9mIFNhbWJhIDQuMjEuMS4NCg0KQW55IGtub3duIGlz
c3VlPw0KDQpTdGVmYW4NCg==
--------------8NLxAOvXEyekXpt09FSwPtaP
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

--------------8NLxAOvXEyekXpt09FSwPtaP--

--------------fJCj8vSV1uuvfv9kjdyUSJlY--

--------------Kdd7spAiagkLNe0xSlZ4aot0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRsT9azWR5AolaZQIFS9tTdG7aKtQUCZ1F+FgUDAAAAAAAKCRBS9tTdG7aKtWaN
AQC7N4hqVGNLBZrp92JvQjSAGpk/YWuY/b3Tt5MmpqiRgQEA+qsb5rtxk0YInhirAlR04duRQxgO
ozljOfmwRAoEwwY=
=o9/2
-----END PGP SIGNATURE-----

--------------Kdd7spAiagkLNe0xSlZ4aot0--

