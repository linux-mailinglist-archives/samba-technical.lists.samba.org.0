Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C90141E78CD
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 10:53:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZKyvotySQCnycnf8k7+CYSk0YmO46WihdJwfOq8/Jwo=; b=GX8b9WHZ5wjiIC7Gc+ffI1KKs8
	hluWSFvKqneIAqE/gxpvrjJ+uEhkxFgfOXX5q6vwLdQaA0R8gJjzK7A/4JCJqla3UTavDsIv4p/LR
	c5+bQ9n3uZ64SSm8USSO/QBHof2X7AVsikktfsEId8b2fz2STQRuXNSli3PmpZl53SKlAJHlf2pvi
	YFsJWxw9pDJzbb+BGG0VbFFnRaNUD+lbjj5Cvy7Ei61OrzDZTL3eCGlzC8gpZBe4ST99086SZS+a0
	NXl7jJg/2lc/pFP91DHA/PI9Zf2KIZ74AqUB1g5khmCiqQB3FIAR9wgnNpKaJtCtSTpB24fJ4Rlur
	UzylvquA==;
Received: from localhost ([::1]:63968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jealF-006KVg-Ul; Fri, 29 May 2020 08:53:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53938) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jealB-006KVZ-4o
 for samba-technical@lists.samba.org; Fri, 29 May 2020 08:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ZKyvotySQCnycnf8k7+CYSk0YmO46WihdJwfOq8/Jwo=; b=w3p5EOV5YJQdM9WLI4AquamrYV
 E35Sh+7VWh8QQaVKAlTuPtPWWhs4orKnH1vzACbMi3hgGDRAkf3O7JH/pyD/1OB+i+O0BqM8r4qm3
 ixRZiRMNo572836XbJ5+uQ21/bYOdbREu9EGEVUmqV6b5VJSQy7P5NnN98EoGqfBnu12yoOQ3ZhOn
 CLACfygi11XPjmR5EGgj9wOV9cjNbFg3iVCs/tR8NoreWFQv4DykQQDWZXB7ulk8kPpIocnl83sDN
 P8bSiif1x3DVBIb9qvWKY6NamIJT9rkIZ8t/TpuFaOAsBrQevSFensrlP+0bgilfpTeKOz0py224l
 HSDwd9/ST1HpBB67dBkzpkzsrQeMrhBRHZoQstliLV5NrQyeYmeD0l+miB4Lx4rOP9CIAKrOv+n8W
 GPzU3/yjyQKdmPYMXyTyh0Nq5i/Mz2yFuzYZHpf6XTGx8UwVYlk0GOznADN3ITwzRxk/NDm2HbuJf
 1iZaarIVStuJ2+8UVpBPDRMX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeal8-0004ds-1h; Fri, 29 May 2020 08:52:58 +0000
To: Krishna Harathi <krishna.harathi@storagecraft.com>,
 Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
References: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
Subject: Re: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Message-ID: <5f4e8287-f23c-b5e1-0371-ca04706003d7@samba.org>
Date: Fri, 29 May 2020 10:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="CHQu0NdK11A5wPUCxX3vnjMKmal35ALVe"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CHQu0NdK11A5wPUCxX3vnjMKmal35ALVe
Content-Type: multipart/mixed; boundary="vTIioS6g6tGTSTiKsQ52WSntRGJJmV0ac";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Krishna Harathi <krishna.harathi@storagecraft.com>,
 Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Message-ID: <5f4e8287-f23c-b5e1-0371-ca04706003d7@samba.org>
Subject: Re: Windows 2019 Server getting Invalid signature with Samba 4.7.11
References: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
In-Reply-To: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>

--vTIioS6g6tGTSTiKsQ52WSntRGJJmV0ac
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Krishna Harathi,

> We are using Samba 4.7.11.>
> Windows 2019  Server SQL Backup  workload is failing (randomly) after r=
unning 5 to 6 hours with =E2=80=9Cinvalid signature=E2=80=9D, an instance=
 of failure shown below.
>=20
> Write on "XXXX.bak=E2=80=9D failed: 0x80090006(Invalid Signature.)  Msg=
 3013, Level 16, State 1, Server YYYY, Line 1  BACKUP DATABASE is termina=
ting abnormally.  Outcome: Failed  Duration: 08:06:20  Date and time: 202=
0-05-25 01:06:21     Date and time: 2020-05-25 01:06:21.  Process Exit Co=
de 1.  The step failed.
>=20
> I searched Samba buzilla and found https://bugzilla.samba.org/show_bug.=
cgi?id=3D13427 but the fix is already in 4.7.11.
>=20
> Is this a known issue or fix? Any help to resolve this is appreciated.

https://bugzilla.samba.org/show_bug.cgi?id=3D13661 seems to be missing in=

4.7, maybe that's the problem.

metze


--vTIioS6g6tGTSTiKsQ52WSntRGJJmV0ac--

--CHQu0NdK11A5wPUCxX3vnjMKmal35ALVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7QzWUACgkQDbX1YShp
vVa2KRAAnVsi+ibgN3wItp1F+7HxAQ6Shb0fQ7Wq4Gcgv3HX/XrqlbhcErAJ7qrP
P6bvIq1mPTvMEgo2P37SUCFRa5vljidrxQDnXkP6E0pbfRH6Rx7eGyz5V+K+E/4+
as6VVEPWxpKwSSUjq/0TKApiCWiYhvILB53hWITDjp3nJA8AjEAl2DShc5nOzKQr
eLLeBNXWfccM+dlVs9bgwLozoZeUU/N+sMO94ykdtIF2WUAXhkl/TmdNdz0qesCo
ssZnLUWZiw9iyo2kIZqg4PYc/4sKU6eaYoh7k9D0WEAIXpEVVlk4ytAeuXYnxSzx
zt5j43nS9e8U/k+VWWYPPBbbwwbv1YTrI560K1zPDsWa9ApraK9BoUiDhKfV2ziq
U7Sh+bkfG+LnwhdYDCGYFbxO2qH4b+pnX6tFOCGlpZiboqBsU8MYE4gcsld9K1vQ
5BL/CHWbKU2MxZYoomuju4CgXioTxLrmhk9c8uUbFWsuzC6toqAZ1mOPghLN9aA+
fERhXQFC7YTUYLOgINSjT/hRCJcGWF3R50W1IgMUlf0sA3y3VcjWFfwXT1Hshoxf
hU10mcibOAXLRgun/ccRidNloX7dp1uRr+9TIMpcMIs2cLhqOR2u2oOowQk+VroT
zOCXlDE+zyMEfGFKxbNC4v/HEyRNxxpDN2Tp5HQp5NKvJ1QKg38=
=q/Vg
-----END PGP SIGNATURE-----

--CHQu0NdK11A5wPUCxX3vnjMKmal35ALVe--

