Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E53597B2
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 10:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=8/JHfQmSXazvlk9LZte2qIo/m6PoTzjyEIVJQiu5I0I=; b=6N+JvKMtggSGbJ8BwfXNe9S3WI
	tXunROMw0cMbmn0qA8tKnY32jZJNN2hDBoCXa3Wub+Vh+X4j1vNrLkjMEttBWbWqjq8PPBMyQtino
	h4R/NW2xPCENmBhjWNQenL3srih7+UO2IwVzOv5PrjtB7g/+Lc6LP0VVRLg7yYb5PX1twv8Ayw1G4
	S/gwOOHLaXjk9/rdNWOINXmdeOKK2YQCXTViO9PAbEsIWayAh3QR953kJnfZsZpZcsVKz7MlscypV
	2GRXJfVYyi361tm+iStNMYeOHxluRjuAmVvwMwoOSihDQ1ptmWy4pEyaFhMoJnpZoiBsaDzjSx1aV
	Bkcd+VVg==;
Received: from ip6-localhost ([::1]:56744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUmQ1-00Ad6o-LI; Fri, 09 Apr 2021 08:23:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUmPw-00Ad6g-HJ
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 08:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=8/JHfQmSXazvlk9LZte2qIo/m6PoTzjyEIVJQiu5I0I=; b=zdT8ZmJw4VlcCV4dheSb/hcLnA
 fBjKHdqw0w0owXF9jS2RdBqbjOxOqZAeKPr72IUPQ71Q4lQatWu7n4Ion3tgXmJnbmCWe0lFKwAOT
 Hn9RYlu7YxLw1fCY2uRrLzUQAMzlSrMo6HNodrxndXpptX3NmLxCvNRsRVuonZ/ZbQL8Hom1KPDGE
 4uzZojbattGPwlnZWlQjNqWhxt+18KocURypog8kqUoi40b6dv+3IGLlwI3qLWX3qcIGcE1sfWhnh
 bHk4gvlGuCjzTWL48SK17hdmhMDp3MIUAPHZjpZtfi6Cv9F9FGqTk5ObrmbmyJcJPEX6yqlI5C0RP
 dgrDJ+yj9fzmhVrPH+ux31maxD2BWMhavQLCc/7Day6bWlCKCDipXjA+kvPt8I4zNKOfJOLKhUOy/
 hIW2Of3IKJhMfbd2/C+17XY06BhKie3/8Hx6yGg0m6f+XogWAac7pQmo99DIrLF79pRUszuWDj0Uj
 LbZz5plB0SmlqXStmeW+14j2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUmPv-0000di-KG; Fri, 09 Apr 2021 08:23:03 +0000
Subject: Re: Setting up QtCreator for Samba development
To: Igor Chudov <nir@basealt.ru>, samba-technical@lists.samba.org
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
Message-ID: <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org>
Date: Fri, 9 Apr 2021 10:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UGYyBuOgSdrWCmDWIxTuUMw3ZAVZVbp36"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UGYyBuOgSdrWCmDWIxTuUMw3ZAVZVbp36
Content-Type: multipart/mixed; boundary="4yQrB8xNMq82M6avMt5dUQGChWL7Uu1VN";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Igor Chudov <nir@basealt.ru>, samba-technical@lists.samba.org
Message-ID: <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org>
Subject: Re: Setting up QtCreator for Samba development
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
In-Reply-To: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>

--4yQrB8xNMq82M6avMt5dUQGChWL7Uu1VN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 4/9/21 um 9:57 AM schrieb Igor Chudov via samba-technical:
> I've used Vim+grep for quite some time but Samba codebase is large and =

> I'm trying to find a way to increase my productivity. Could anyone=20
> possibly share project file for QtCreator for Samba?

if you're open for other IDEs, I've recently looked at Visual Studio=20
Code on Linux and that looked amazing. I was just about to dump my Emacs =

setup and switch but then mehhhh! :)

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--4yQrB8xNMq82M6avMt5dUQGChWL7Uu1VN--

--UGYyBuOgSdrWCmDWIxTuUMw3ZAVZVbp36
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmBwDuYFAwAAAAAACgkQqh6bcSY5nkZ/
UQ/8Cdyuzprf7ZJ4lhCDPvfugsqVdodQOJ+dyCNu8epsWYOLQp9HuF/IA0DnhHCQY3Rwp7WvRk85
2pKZvzeZgme2mIaOZZGJO1Bj7Vobf2JS7XWkwIPuv/07ib7ZhBer35ID9Tq/gM4mP1w27BL5Jseu
zAYkXClgCCyjq8hD9aqNZhm7wleFb7iw+vvtjXd8WzbXmEqp41eBT9WBsOkWCSFGnIGGiT76mVTw
FyZKjoEMWVr2xEHLfJwniLvdpKb4Xm60xu3DIgD/s744yO+jbUNmkB3gkwWOjRrkN46io72euHfi
GI55XBBfl+/45SF+9iyJiiUznCtqVBs+BH+WkKpJcpFNilKVc9+I5Iwg8PJARmQEB5dCepvjuz6r
wId9SMrq4hx44dcCZ3p1nCAbo12zXzXPojTnFHh1BXXzoaVw5Msm3jTUE0ysNGuwOypaXWF2nv9b
M6H28dWtcJ/kArkHp2dHzl8oeMT2c5ZXu44zGFqfy/DAAgPqBabLRkJf2Qf7tCHGTqyO649/piN2
uqmaaFvy1uFwmIpTKTWZZfWRd6Mo8mEmRc6Dcx+d94d15BOtzUlyt9/r2YgROBNS/oPV/z+uwI0c
0BLV+ftSIAxtdZKBPqf22BQ+HSyG5jrWeR0p/rVYWkjcJKq4WnXoqEVcUc7M4tNTux+4mFnv2s5M
6Po=
=ZYBo
-----END PGP SIGNATURE-----

--UGYyBuOgSdrWCmDWIxTuUMw3ZAVZVbp36--

