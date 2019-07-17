Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D46B9EE
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2019 12:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qqH0kCWEYBEEp0tFZZ4XGZKl0NnaU6u0CdTeF16UfXg=; b=XsaK0NnGuLhQaTXDdiTfUShllJ
	8+q6jfOqHgtAv9Kauqx221n5TmPLnfGek6F5I2TsvFclz5xoW94HpCkJFOHnD9CO0VETtro9VGvzF
	7G1QhzjWrIJatFfAqCe3Z5k3OcYlF87TQNPLukq3hePR7IE1IWE0rtXcBYGUrrC8YNngCvklvrNGz
	yLcW90D/2TZxqZgqLN78Cs5MCyTUG5HhbS9po3GOOhSn1mRpWcojtQwVyZwz5O75lJ8y0SFGEU7p6
	Xhpvl9Wtgj7255emR004XN0qq3Gxkf3br6NffNl145CmsSLKgERXa7l5OLNYTt1GlCcEFr7iTQjIP
	1UoTRWDg==;
Received: from localhost ([::1]:37366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnh1Q-000Rd2-Dq; Wed, 17 Jul 2019 10:18:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnh1L-000Rcv-Q9
 for samba-technical@lists.samba.org; Wed, 17 Jul 2019 10:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=qqH0kCWEYBEEp0tFZZ4XGZKl0NnaU6u0CdTeF16UfXg=; b=gXKrlNi5nPPDHJtpyApswrPH/B
 avVO0arySSvGQmxLziSjS+Yx0YYBd1P9iTSnJwNyH3JjoXo3jNdrS/jwnzA35CN8SsZYi3taKU6UX
 CJlaE8PpM5IRFGMUwQRCgowCXKBhV8R+DaHfIAudSAWyXhl6L77bHUQbOwPVsLWwH7wc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnh1L-0003nF-CH; Wed, 17 Jul 2019 10:18:47 +0000
Subject: Re: Samba 4.11rc1 and tdb packaging.
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <84eca39f-6552-0394-3e69-2a0a2a95113d@samba.org>
Date: Wed, 17 Jul 2019 12:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Fp5v8wXgCi0jPcdeaBma1dCVxZghaKBNj"
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
--Fp5v8wXgCi0jPcdeaBma1dCVxZghaKBNj
Content-Type: multipart/mixed; boundary="Y4Ti1ZXDcK8vJgvgXK41My3xs4lGPbF8y";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <84eca39f-6552-0394-3e69-2a0a2a95113d@samba.org>
Subject: Re: Samba 4.11rc1 and tdb packaging.
References: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>
In-Reply-To: <vmime.5d2ef100.310f.4ee297007e278100@ms249-lin-003.rotterdam.bazuin.nl>

--Y4Ti1ZXDcK8vJgvgXK41My3xs4lGPbF8y
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 17.07.19 um 11:57 schrieb L.P.H. van Belle via samba-technical:
> Hai,=20
> =A0
> Im having a quick look for a test build on samba 4.11 rc1=20
> =A0
> im stopped at:=A0=20
> Checking for system tdb (>=3D1.4.1)=A0=A0
> Latest here:=A0=A0 https://ftp.samba.org/pub/tdb/?C=3DM;O=3DD=A0=20
> Shows only 1.4.0.tar.gz=20
> =A0
> Can someone update this to 1.4.1 is available also.=20

The same applies to ldb, I hope we can sort this out
for rc2. See https://gitlab.com/samba-team/samba/merge_requests/374

metze



--Y4Ti1ZXDcK8vJgvgXK41My3xs4lGPbF8y--

--Fp5v8wXgCi0jPcdeaBma1dCVxZghaKBNj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl0u9gMACgkQDbX1YShp
vVbz3RAAmCRk2WTufoQi0SgoVo65JBg6YckEufgPww6WpavnU6KczShts4CM7glC
LDd7E0lhZoYhKLVhj9PuIgu799XSgh3pUqWqyFNthg7hl2ybTGvE7k8YwkDyQNn0
4F/o0E84gpSFDrrxZup017+MxH1brSdc/c2JjMkczG7NBNrecC3Vo2XYthE4C01g
E6Zu4KFViMvR4uiJ1D5Ayn11php8XdNKqSdtZq5XdbMxKCzerObNIzViX7TbcHEW
fRuUVSlHoSAW9rLyv7URDQV+a9DRVuyp2AGrzYAAYo6x9XvkEpP7GH+94cJ787BH
l2QNOaocq184n1kI+hPEGe6XywzA9tWgPy7cBc9+4Ye9r37K4Bu2fgfCIX4/Sp13
D/DMik+9SUCEy/C2UzbGrkoIzAh/19lMOfN4EJdHUYRJcjc4354+/JZxaKks9vjG
eF/LbIxEwHXhLFk+IU3bALbQdcE6zWOGGvo/fNBjZsTzxlXVw0iEmcgVNAdvsCXZ
99oT1iGNG3e7wNPbLPP7FWVnldMa/xZJuFEOF6bUqBaN2UyOS/Pt92mdMRy2qD4j
Z6l8XBieBgzehtWNf2pA6mkXFC31WFyxcSHVOMICPXpn28LgEHu0dVFpiVemmbcE
ayH9ji3PAHxk3Dk3ho+iZ/nbq8Q8Nk96kKEolgVJvMTa7Daw5no=
=ljHN
-----END PGP SIGNATURE-----

--Fp5v8wXgCi0jPcdeaBma1dCVxZghaKBNj--

