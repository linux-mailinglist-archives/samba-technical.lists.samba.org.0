Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4151F182AFC
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 09:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Yn3BM3b5P4NCSJA3QL9gdyIkJfPHdTURvjTa3SXZ8v8=; b=qD+FQJshZvm+w2XrtBCYf4VurA
	S+S/sTyWqRYgKWhH9g4wQ/bOYYhcLV4/Trb+WqNzgLC9J6YBZOmbfsbhKuX8ZcEr8AWNQv3jLDhg/
	p44VgOPQTsxRF7OW5UHjKoZYkFRCN9f1RlmfIkPnKRU8ktZac96/8p0pipb23da8Q5r4lw4K29B/s
	g6GXT9/fRSqas31gsaT7Vo8BpEhPmJrKvdFXE+RzXvMTH0+zu3k6QTYzLuKxO0ipqNXKgGFrBOFPG
	uCLCTx5LrR4IMPtDU3+AT6yqGCahDESwrUWaXvWWihT0EB5N7jEb9wASQHeYwhGN3u8Ox+yMsTM3W
	eKVwkVSg==;
Received: from ip6-localhost ([::1]:37324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCJ0a-00FtnT-6x; Thu, 12 Mar 2020 08:16:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49352) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJ0W-00FtnM-1Y
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 08:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Yn3BM3b5P4NCSJA3QL9gdyIkJfPHdTURvjTa3SXZ8v8=; b=byhbTfDBWIr7Ex0xdY0aSlUZpE
 FEPa4+kjvareTGI5jZ1OUr4MaWDD8YGnPWbVmuCOK/eD8+6nOEI7NF+86HgYnO8nsso0juIRBBbhL
 yGFF71JKW/Hvqe5fgYHYxoYw8GRBRxQt7Oz8yi2CbrufnhbP6txeZc6byUhfCfoVOySHAvS14L2yN
 ufvg5b3EJFNlh2bW7vHecJnvDwju0mCmdKbduwaiEzy9RyWfEBvSabVeRXCmbOAig7h2oiod1FedQ
 9ZiqXAfjnVkCob+pY2rIdJqXID+Cdp3IRwe2hweRnWPvtyUCDVPR0YCdF1TKVgmMljGCPRYqO0sT1
 9S/rI3jKw8kxsL8lO+gZutGJ/r8DR4vlBOWQWdTzS3tf54GROzOM4f3ki1cj/km/s4U2SSPOHOhLK
 eKyyQpDdxzbaortivcBgjSdvBOG+6dju8pvQLKx2+Qr0r/fhJ6XY5c780LS/uvyRXqaWgX3pJhICK
 7EzUV2xEhpsQMDMKE3XVaTc/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJ0U-0003oF-UY; Thu, 12 Mar 2020 08:15:55 +0000
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 asn@samba.org
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
Message-ID: <a308b5b2-7778-7ebd-1023-52ae28585c13@samba.org>
Date: Thu, 12 Mar 2020 09:15:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="JzJTqyrpBFBmVM25Df8eAAIZzrTJdKmdo"
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
--JzJTqyrpBFBmVM25Df8eAAIZzrTJdKmdo
Content-Type: multipart/mixed; boundary="qyhl5vlRnySB8yV3owEjcGX9Jz2CIKbZF";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 asn@samba.org
Message-ID: <a308b5b2-7778-7ebd-1023-52ae28585c13@samba.org>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
In-Reply-To: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>

--qyhl5vlRnySB8yV3owEjcGX9Jz2CIKbZF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 12.03.20 um 04:17 schrieb Andrew Bartlett via samba-technical:
> G'Day Andreas and the list,
>=20
> It bothers me a little that for every Samba change we make we spin up
> 37 builds on 37 VMs.  It feels a little excessive, and while CI is
> awesome when it saves us all time we should also use the earth and
> Samba Team's resources carefully.  (Even jobs aimed at the 'free' CI
> can be run on our servers if GitLab.com's servers are busy, and the
> planet pays either way).=20
>=20
> Therefore I wondered if we should also stop running CI on Fedora 29 and=

> OpenSUSE 15.0, both of which are now it is EOL upstream?
>=20
> Both went EOL in Nov/Dec 2019.
>=20
> In the future I think we should set policy to only CI on (some, subject=

> to other constraints) supported distributions.=20

Sounds useful.

metze


--qyhl5vlRnySB8yV3owEjcGX9Jz2CIKbZF--

--JzJTqyrpBFBmVM25Df8eAAIZzrTJdKmdo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl5p77cACgkQDbX1YShp
vVYwAQ//Xdnq5Z+5n7I1ZM8sT6pfhP5WpxS0gOy/f0LcnfD6oVPguF645grSMREk
yh+iFCRbAXHXIIpKKJwu5PJVOwWvlE4V+qXUJx2Gl8ltMTcv7/BXq0KbWjt7DjzO
eA4IvLmlIsZNLrbtM6xniYriIKMyLspdLGdEE4h55PBa7worc18SIJymVdJM0hU8
AfWyS5iP10aZQZOQfdqoV//dV/WpmkBuMhT26LXwzELGmWbwpKdOqJpq1sKtuQn2
djn/5EIQDSzL95PKYPACKnMe5jG3U5gYx+3lYrjla6WeijxmekEP1b40BpvMwRFU
34ehKeXsyi19XkZA8q9yYMfrjj7XTKaJADsUzqueKW7OB0ptekvhjgRUmmvZgqSa
sZ1jXV7yELNlc5MTE5wifNy+F1fl6k9Q9nmuD8kNKS+THtZjou/rslR/gH24WBij
KiA/M1HHZqkWsj1OHs2NihVt6Xcjz4C6ZPkmpTND5/3jXGwwqWttTagyze/FDFNg
YmDitcV7Gt4OpWrApJFrhtPdg1+MfSVJw0/z+qGdq6jhd9ja+/LoEFKkvtM8jHyh
0YfjRCkzv4xK6MzRiP+pSE+KKcmxQNzJyKC7QFEd5xe106J7/QYzLdRt0emrkzbN
ghTtPjmBZDtBzU2WK2qKMXCUG34e7s2vKb0A4Okum8HZryYr7BE=
=OT49
-----END PGP SIGNATURE-----

--JzJTqyrpBFBmVM25Df8eAAIZzrTJdKmdo--

