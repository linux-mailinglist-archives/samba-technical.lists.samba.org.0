Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECF1DF6F6
	for <lists+samba-technical@lfdr.de>; Sat, 23 May 2020 13:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=u5DuDopLWclx0lfVJ0d10yJT38d6XZ3nO13bKsA2Vhg=; b=wXqyXmaGQYlZ+h+KfBSu2BFUZX
	qy4adCg08G7aqqjCv2dzfcu7IwqTmDTfinAhF1in+OeYjK2aeTRHwZ8+Uu8oqf9/4e7Gu6pVEqOCe
	sOhlScthp1USASQ41yY7YRs4+2DqwZgNExa8MFWvC4dpTnN4YenjXaCEmXB0+YIJWKqClvrxYZYku
	pSDM0RQe1voOGdS9MRwy9VFZrLgFjwWFsN3AUlwPvPHnMTyRnuQbts+vGOc82gL1w90oRy6qQ+L3i
	7YMwVTbYWdzC1GYJ/UwmOjQ2cTz29IGF39o6VvHPe3otJvTnFTIio1cDge7ICMbO3k81RrEE6L3KH
	IeIR3yRQ==;
Received: from localhost ([::1]:62918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jcShZ-005a0e-Qy; Sat, 23 May 2020 11:52:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62154) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcShT-005a0X-Sv
 for samba-technical@lists.samba.org; Sat, 23 May 2020 11:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=u5DuDopLWclx0lfVJ0d10yJT38d6XZ3nO13bKsA2Vhg=; b=18ghUPrkSFuvjyBgWZudgydn2D
 X0aN/55SB9/sad3iPWMBIxI7Lrin9Jd9TjOEPF8FcmCoSJiBHbFMzifMC94wHK87Urx8IrdVwYD2w
 I20ghcYomk4pXnO35RaxXUmlorDf8g/FxVR5B7jc+ror2CLXwsL3TyaP61IfjWyVQRiHs7YVqGS9k
 BDYGIo2cVm1GXX96n6XEuOr6hb2of5pGbqD0bJAYqeK6U8EJZorWCGfYrma9uy4H+Rh07Yx79D/P8
 JEUFsgqtXS+JJM7Wv8TjzxoE9Dz1e70MtsmgWkntyBsvVNfe6KHc5bdPr7ZPiRD0cV4qe/4uZQMEU
 8nOB9px/I/Wi5vNl5a5lj2Npc7KI48JFk1L86UQfoHCWtwUvSVW/DBUxxkyRaxnetlMzP4LuVQn+z
 0csnNhTn3ZYB87VrrZtFihD2awDrNPjezXPzHK7EAoZsr/eIs25gngNVZfJU2pKKF+qK16HQD/rL5
 h5PrDlKHfzolsuczFsBlDzmh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcShS-0007iw-Pi; Sat, 23 May 2020 11:52:22 +0000
Subject: Re: BUG 14352: follow up on that bug. Still issues.
To: Rouven WEILER <Rouven_Weiler@gmx.net>,
 samba-technical <samba-technical@lists.samba.org>
References: <0A3C18BE-42EE-4394-B2B4-CD183F0431A3@gmx.net>
Message-ID: <2f3f9bfa-ab22-4ab8-6205-11f967a98c0b@samba.org>
Date: Sat, 23 May 2020 13:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0A3C18BE-42EE-4394-B2B4-CD183F0431A3@gmx.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UnM7TpECrx3AJl4tOekj05EzonVChFGO8"
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
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UnM7TpECrx3AJl4tOekj05EzonVChFGO8
Content-Type: multipart/mixed; boundary="o0zMwx5n5G0CsQOuw9pfuFFRD2FrSJm47"

--o0zMwx5n5G0CsQOuw9pfuFFRD2FrSJm47
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/23/20 um 1:32 PM schrieb Rouven WEILER via samba-technical:
> There are logs with log level 10 available as a tar.
> Shall I open a bug in bugzilla and file them there or upload them to on=
edrive or so?

please file a bugreport and attach the compressed logs to the bugreport
if bugzilla accepts the size.

I assume you have fruit:locking=3Dnetatalk, removing this should fix the
issue.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--o0zMwx5n5G0CsQOuw9pfuFFRD2FrSJm47--

--UnM7TpECrx3AJl4tOekj05EzonVChFGO8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7JDnYACgkQqh6bcSY5
nkbX5xAAnJ74wQ4RFAREjon0RbhlC7X1ubwgQbyGfWLJXCti0Jx+/5mfWmTY0JOJ
mTXC6joK0MjAI0gwHWyQoehsR7n7mLOyZA4n09PMxdIifw0D+qnvQDTg+bqMwgfH
vkKWmqv8+5XY3DcXtfxpiC6qKvZCMUp1N3iKGiTp9QQYlafHHBoJDuqM2CtUL2st
t/lF8lnp3Pe18tnii/iO+Jg3T67f23S/1Xg+vKDJRtGNEkmgUxonTSBbNtNzy1lH
dn8Op2r4BSCJLSbTmxFgb3hGMxcxl8vtpxRmSSDbdkMt1Mkp5bb6PbO/EPiuOraB
RA6jeG1L3ud6+eY3MlOaDJCcJqkHaJxaQ1/LUjUMTBKZ/O0nRNA8WRQCo+d7mH5T
6cOmpEWxwxapN6Wv18C46o0gZ1tZSletXwXA7kj2qbWyyYvJaERKEYlStvawvAwF
w335noxkvfNLn5WFHNfVz7NO2UuqLrwZQF8Ev+4IxhAs6D0ucXfyfXrBZlpKStaV
44OMnuhScIhvV86DE1AcFPYWRFfxifgaOxtS1VXEL/lWcezxZNiFnQ5MMKVVqWrw
DTDlO44gUPipOxDqViQhnjM3z0cswTH53VU2zO08YIcMv8UbXHAOGMaZDQOnaZvi
t5H5mxwLtDLqtUibcHbTYDfd+zK01ptPhtNNDgPBRqFRQikkrxo=
=4K8+
-----END PGP SIGNATURE-----

--UnM7TpECrx3AJl4tOekj05EzonVChFGO8--

