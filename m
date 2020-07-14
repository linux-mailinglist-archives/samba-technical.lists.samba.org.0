Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F2421EB56
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jul 2020 10:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+ZTlw3g1Oi3aGX53opw7/VuCfgzBy3+AD6Rq2NBllMU=; b=XFV6Pk7bYC0Vum2GHAvIGGcFO3
	9KgxrGAq+cfv+/uEyI+v21WqTPanpUdaEKKaP9pFt1G0Wwu35u027nFBL2C0Xs5j9S9xa1/uyXTld
	SrTCPwIHbvzErWNavB/odLu6V4/rzsAbRgyZR/FdvbR9OBIF39icdZl41W/qKJAQZgjkPmJUdso1U
	O2AMI811YXnEAv/fsEIL4eByW0hlOktdhMYzujOrnoBV6UNTAjv1bmwHE8z/OAxBd1b8u4VlnHeQq
	lmGfQCCcVL8+wt3fZRgvgjdtC7kuDhoVvs49HABrptjGI//3RndsVG99lGbHax+SebHfQG9grGrsg
	XPUCP3+g==;
Received: from localhost ([::1]:58500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvGIC-007LTs-Cn; Tue, 14 Jul 2020 08:28:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvGI6-007LTl-0F
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 08:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=+ZTlw3g1Oi3aGX53opw7/VuCfgzBy3+AD6Rq2NBllMU=; b=347DI8SH8I8ZMHC8IEV/Tm7PU9
 U6Cyww+n+w4tvoUqwAiybdxqAdByCKrVWVs4h63o+d3eWMIrMqdywrMC2pEhicRibvXKGjju8yTso
 sJLzl1nxuMuqQ1/r7UrudIr492HayJY0bFFG7N/VArkU9aO9e63nK6ZrnxUZ2F2DsCj7OqaWhy8PV
 YnzUcvWgG1WNwwbKjWZr2w/LWvxAZBumgRXN5kzmFJ1MvgNPz6xnWYv7BS77NL7J5urmEkQiTZRR6
 YW70w5a/ON727nBdwoblCoFJpk7iCSO0ePaUnKv1eH6bkQOz9lDshqNUZN9J6zoX2HwEu8K2Hbv0y
 KARwG7etNlKwNNwcDGJ73UtA01alD+1+0ayuhvOrB5ER3lsSjeYkxnhecriTqBrD5v19oSsBjYsh+
 pIWQcJjrYdQOrqgTufGhltKUxC4zfoNQ6biE9eyptOMtUiymEussm+pgRsF8KkmFbsgfVI4UouYYw
 XmWl33kfM/YzStnVn7F41tZ3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvGI3-0001FA-8j; Tue, 14 Jul 2020 08:27:51 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: =?UTF-8?Q?Bj=c3=b6rn_Jacke?= <bjacke@samba.org>,
 samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <3b2342e4-6e0b-24c1-44c6-d11e1a4b0d80@samba.org>
Message-ID: <d15e0fca-98be-ac10-9902-aea3234d136b@samba.org>
Date: Tue, 14 Jul 2020 10:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3b2342e4-6e0b-24c1-44c6-d11e1a4b0d80@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dmbXXd7KFrKX9YTdUxWNyw23fvnX4uwzl"
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
Cc: David Disseldorp <ddiss@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dmbXXd7KFrKX9YTdUxWNyw23fvnX4uwzl
Content-Type: multipart/mixed; boundary="D3d9fnwuWlzwlqPQGRGZSwhE1S45FVuDW"

--D3d9fnwuWlzwlqPQGRGZSwhE1S45FVuDW
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 7/13/20 um 7:06 PM schrieb Bj=F6rn Jacke:
> this looks good, thanks you!

thanks!

I guess at least Andrew is currently on vacation so lets give this some
more time until folks come back from beaches and mountains or wherever
they may idle along. :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--D3d9fnwuWlzwlqPQGRGZSwhE1S45FVuDW--

--dmbXXd7KFrKX9YTdUxWNyw23fvnX4uwzl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8NbIQACgkQqh6bcSY5
nkbEXRAAhcLYL0WVVwg7gd/v7tFuQWAGQyJEUVUtZKKauK/GK7N2PTT7MgyRa2Uj
gWx811bKizn0IYwik0FwJvqTJXCw3wLLfazTgtnFSeJnetFgVMv/wGWWC1DC0562
nZjCRrFFjeazRt30L8vzLN7/WqWzZKrNshJ5otz2J9jHs8K9A4nGqtX2Md/VbO8y
8AfQd/pI6h0UahK2lDUXV71UbAQ8qqP5yIArrreiUQenPGSNRPzrgXuB2t/tHzdW
0S1MMcnzYieAl9HBtieuLrVgw6CeUH2hk+x6SgvGDhHjBF3q8cm+3c0/VXGjtDJZ
dDBeRhELv3RUXdU85izhyNwNK1tu4kCTY32+wxK1ic0Ir5rz8k9vRJ/0pzp10z5Y
I16DXKx6DykWfSwQ7FzjTS8GzGbKtzno5LghlyZjXMCflBY/sCk3n5W0goKj0pgC
1JyzxIDJGQqN+SNsbeQ+FCS8Jr0pv7VuYsus6jU5tt+BcL0J/bTzfLXjHWBj4oJX
FOdgfWEdP6lI4KiNvcYCZpKgpWqUjYi0KadtTkTRRCIyLAKw0LmZ2oXvxtDsE95B
nYtxO/CAtzBBMfmo4l3wmmCZa9HrWqe7mV0tzmrOfRoV8jex/ECZvY7JNm/onlnq
xLAUuKTioHBr1Fl4ISIo44Uh3GL8TJlN36DS3zofJ4Jgq5x7IhU=
=uXWP
-----END PGP SIGNATURE-----

--dmbXXd7KFrKX9YTdUxWNyw23fvnX4uwzl--

