Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD331BEE1
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2019 22:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=z90EQxCmEWPgpI2fXrjsjLEY5uks/d9hVA6H7xxcpxI=; b=X9W1+PrAeCaOh9WjhriCof//ha
	6pFGzG+i4ZCJuhtXHnwQinXZhX7v49lBrYf1GyAnup7/kmRARlr5Cxy7L3/M259o0THWL9uri+WKi
	WPZMHdXUThCH1auiqxfsaP4PaTrCkTYhIJGh/qiz8em20jOP8NfqDou0iaH4TIR/TmJ/+SjXogiYI
	tz1FkvfqWYMXn/RmklKV+p97H/cz3KabsIPSaZMT1o3EmRoJJdOaZ0vcVoJtOFAgkahMuXUjb+gDB
	PxgYCY8bWD1I9+GYwQrjkhw2tjuIemO3W//DkGgyVJEDMkx/vQl2Gjgq1lUOUUmnYEx/qRsfF3+gR
	vsCCEhoA==;
Received: from localhost ([::1]:55100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQI0D-003PtT-Nk; Mon, 13 May 2019 20:56:53 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:58282) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQI09-003PtM-2l
 for samba-technical@lists.samba.org; Mon, 13 May 2019 20:56:52 +0000
Received: from [IPv6:2404:130:0:1000:1963:cbfc:7f97:eb8e] (unknown
 [IPv6:2404:130:0:1000:1963:cbfc:7f97:eb8e])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 084BF80FBC
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 08:56:41 +1200 (NZST)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Address Sanitizer progress to date
Openpgp: preference=signencrypt
Message-ID: <ba8e34d9-5898-2db4-4670-0adc9cedbf11@catalyst.net.nz>
Date: Tue, 14 May 2019 08:56:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ocTR6D2N92OpcwapuiTbNUducJfcNfYwB"
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
--ocTR6D2N92OpcwapuiTbNUducJfcNfYwB
Content-Type: multipart/mixed; boundary="D0kocOFSRzdtDD3AzmRC4T1HCKpVgbhFN";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <ba8e34d9-5898-2db4-4670-0adc9cedbf11@catalyst.net.nz>
Subject: Address Sanitizer progress to date

--D0kocOFSRzdtDD3AzmRC4T1HCKpVgbhFN
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

I've been working on getting Address Sanitizer working again, it is now
possible to configure and make samba with --address-sanitizer enabled.

make quicktest passes with address-sanitizer enabled, however it needs
around 21GiB of physical memory. I've been running the tests on a 32GiB
cloud instance.

Have not been able to get "make test" to complete due to:
 * AddressSanitizer errors
 * The performance overhead causing timing issues in tests
 * Out of memory errors from AddressSanitizer

I've raised bugs for the AddressSanitizer errors, which are currently
tagged as "core developer only", I'll triage them today but I don't
think there are any security issues in those I've discovered.

Ng=C4=81 mihi
Gary




--D0kocOFSRzdtDD3AzmRC4T1HCKpVgbhFN--

--ocTR6D2N92OpcwapuiTbNUducJfcNfYwB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAlzZ2gMACgkQei/9ZKIy
R1OQ8AgAxANT805WLjcgV5kDzu9WZ5YN4rK/iUUTvva1pNbEvj5+cAvNmw9gKToZ
vpgn5W8R7iAONdZ4libc1JzM6IRlmn0Ght7iz2LaKognbCbyldhHsMlR/0SYVJjf
lMUV7BsXeEvA0VVapmH+od8MGUSbuMwOfFNgrh4+D23vJ9x7vxfO+m2morMt0Ta2
+0ANGfYs1kygOXi13Q1P5H1LlOlyxc84Oi1yY34gMXEaMv5t1/Hvih0+L6C1bDGz
UVZaHMkKOIB06ph3ByNjFXW0NFi47GOP6O0uleJ6xL09sZFons88RU+mI2jZcvwR
CqWz5WPJSFsAtRWVSAxvK0y4CSaG8Q==
=LhtW
-----END PGP SIGNATURE-----

--ocTR6D2N92OpcwapuiTbNUducJfcNfYwB--

