Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A67274BD
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 05:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=rrbwXqg5kJAc40c5YrAWUQBawZpLKr+fxx+i7mZcnjg=; b=IOBKxQgCmeYlBmeTBzRayxjaOq
	c8Bi2hz7x4nO4ojkrNycXDoSqSopgbZVm5RbJIuREUttel/rOlxXdjTNaRHYG/jGBRU8B64luHbvy
	2QgmJU8MsEQwKsRNLcXLj2xA7OvTbPRCya5lUz5q+j4HG08i5rXYWil+wjUtw+D0vVSGLi43ENnEW
	Nkjxf1mRFhmWTYZYf8Jv8LGeo00oK1Y9adH4EvL92j1f9kNVxI4MXbx4IJL7m2Oa8FJa7SGMcdUzm
	fklo1iDSZ/RA1bSaqG4sxXM7ZFtjYpSF/tUlz7ZCubDvGIQLMULfq/n0lTESUkf9Ro/Fy7JnPSYie
	iRsCH8wQ==;
Received: from localhost ([::1]:27112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTeHv-001Nh0-Fi; Thu, 23 May 2019 03:21:03 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:43268) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTeHp-001Ngt-Tx
 for samba-technical@lists.samba.org; Thu, 23 May 2019 03:21:01 +0000
Received: from [IPv6:2404:130:0:1000:78d8:5ce0:d0d9:91f6] (unknown
 [IPv6:2404:130:0:1000:78d8:5ce0:d0d9:91f6])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 4F80B80EA2
 for <samba-technical@lists.samba.org>; Thu, 23 May 2019 15:20:45 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558581645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 openpgp:openpgp:autocrypt:autocrypt;
 bh=rrbwXqg5kJAc40c5YrAWUQBawZpLKr+fxx+i7mZcnjg=;
 b=ogaaNg0AvjyJICbkbT7EQqPwyeLUEPKKVO+FOv+no8wTTBbHyxf9KuXc44so02XUbLJfHk
 SW4L0HvRP4Pt6mOCkjp5fSVF8oj85zzvZyMPYHVJRmTYFmUC4IqmbLX09ccmp5MfRhDGbr
 4IphSRdsRHxxV/g3NOnZZTjOMXs8qceSq4AaIj1MBaiknwDi/zLe+ntYteUnCR8JGd26pR
 C67fFFSaWjgUCS2maKwYUlnVCK/JF2FGnP1CfoXV0FWAG5HW5NfaacixSx7UM6YMb+PpsR
 OqUb6sus6slMwlg4ZEENrdnsShw5gadrTmanbl8BpiGih6waHRYdHEStcnVJng==
To: Samba Technical <samba-technical@lists.samba.org>
Subject: UBSAN warnings on calls to memcpy
Openpgp: preference=signencrypt
Message-ID: <80078990-84ab-4399-3b61-ee1dd908dc9c@catalyst.net.nz>
Date: Thu, 23 May 2019 15:20:40 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1VjHevMTPKXaUWcHa1SkvtthM3NgmLsoH"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1558581645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 openpgp:openpgp:autocrypt:autocrypt;
 bh=rrbwXqg5kJAc40c5YrAWUQBawZpLKr+fxx+i7mZcnjg=;
 b=s4Y9XIMxXIxQkPKSHUFNmzDqnbld9Od44lWpX8R1tksKmwKZyeHp50TIN9Z/G/3VL/Hroq
 ugrg1zieQmkBSbqZv9I/ZnCSQdwZvlolVwG7QgEZ2hMUuvFfvnn1RNIvxaalWAnkdyt0lq
 ucwh466X1v41E7TzfYuYiLKkTEo1Qo4RAyZ9cIqN1jdWZxU4yxlZmqrhkmAF9IcYxewZUb
 zqPtXf3W4PUQRj0SpqC+oGFMx8+8+6KID+2LfZMPbKjnhbqQJl9X9WnJJc2wTo77mQPivw
 x8IwwAIz8TE8/65578o+KG9mk8BwbHnTpYFt6ujTBw/t/aU7ttMa/63TU6Ow2A==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1558581645; a=rsa-sha256;
 cv=none;
 b=mmjeyyrf/YxZTxFwS1NfF32bQQj0e3MnsTLewtTDUcpiqygwPszDbtss+9hpcsb5M9G6er
 WsCx3jjTzQSXPcoQ0XRHbngJm9utnSC7bTQ0esDmDPtRACnG/aeQ4ktmg3eqYQT485xpDC
 QmX9HwUSE40WDimMeETfyphtcSU6FgEaMklBg+lw8ajyh6lAKdtzfbaWRuSUbaAbIHddGJ
 KS7j6z1ooXtplMmiN74BYeIJyteGk2VQd57TEyELCnXYrZAcStr2O2haqyUbdWdl91ZzkX
 HaiqSnX6mYlIqN5/D/UQnmHQ080NMh8xKDT0txv+CgmaJAUmQhRJFyYNu77R0g==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1VjHevMTPKXaUWcHa1SkvtthM3NgmLsoH
Content-Type: multipart/mixed; boundary="PQCBRdZqtDbsdiNmTgYL8f5MdTQR2IEKc";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <80078990-84ab-4399-3b61-ee1dd908dc9c@catalyst.net.nz>
Subject: UBSAN warnings on calls to memcpy

--PQCBRdZqtDbsdiNmTgYL8f5MdTQR2IEKc
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

One of the more common UBSAN errors is
"null pointer passed as argument 2, which is declared to never be null"

These are calls to memcpy where the source length is 0, and the data is
NULL. Adding an "if (length > 0) {" guard before the memcpy would fix
the warning.

I'm inclined to think we should do this, but also agree that it does
clutter the code. While the call to memcpy should be safe, removing the
warnings reduces the clutter and makes it less likely we'll miss a real
issue.

Thoughts and comments appreciated.

Ng=C4=81 mihi
Gary.


--PQCBRdZqtDbsdiNmTgYL8f5MdTQR2IEKc--

--1VjHevMTPKXaUWcHa1SkvtthM3NgmLsoH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAlzmEYwACgkQei/9ZKIy
R1MPRgf+MY+8lRlXIyx6LQqqrYbh1a51vlc4HuzSoVKUPEF8Qx8Bgesn4Z62/M6W
CkI9njHFjddRYG282ODQH148fHmez1Poyyt51krjzVqVkGzx9UxP6ZMyOD6itGY5
nYFV/ihmYGkvXVXPXIK16sMT7B85cupHpx2cvvIwmGtXRS1hoGi6+RW0ShrUWJvK
EXUJP2FKrQqGaetHGWkewMtqmRymV2Ye2I0vtPeiV4TKIT2YfwzHysi+tYyao4g6
YPXKwq1nhHkCluWy7ybEUWf2ffaIfdVcH/t4rPZk6BveQnxLlVwcMSeEAZ4WgOCy
nZHPTvoNnHAtdDYNY+PfixRnvqqUlw==
=g/q4
-----END PGP SIGNATURE-----

--1VjHevMTPKXaUWcHa1SkvtthM3NgmLsoH--

