Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 294722A00BC
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 10:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0yLKSo9atKBGzlte1G5K+XfVW05ssNPLnaFNkciXFsU=; b=i/f3qz7bIQYBKTrijZ2GjrF8jN
	rBz5VHFccplDpNSQqvqP+HrfuR+RRZ8PmlGvTwU9C7IxiTKwEDltUOUoBBcxQ/zDvGUDRByCckXxB
	jiSHMptSLcO8BiNUfJPL2WqIhbLw7co0SYxM1B7kahnoloTFq0hV65lej8QGpv5kxQS1fZCSFEo0P
	ITjPQUON5H/hnI6NuzhzyNUbkQJvSucCGkKLpB6iZ/R8E8rA1lQnajNXZhh6zCr1lK85DTtSS8VHI
	IcUz0gpEhoQ2qFWaRRvqPiMt+ZRWmH/AyNUxuFWae2eAgwyteFSgJ685RpKT3dp7wVA5ajTdQ5ECU
	kWxFradw==;
Received: from ip6-localhost ([::1]:64260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYQO8-00Ed5Z-Ut; Fri, 30 Oct 2020 09:08:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59874) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQO2-00Ed5S-Ej
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 09:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=0yLKSo9atKBGzlte1G5K+XfVW05ssNPLnaFNkciXFsU=; b=QysT0wcec96SPhgEkwVDC8lsmA
 nY15GG0nn26PjyUaGg2hWKVvE4uBqPmdlCJT19yGg8PoPlZhncynknivmw16l97bUcEw9RdobdloX
 ZhBLJ8RSCFad4+wS5v2I5mABKQ+tGOyIKmkiVHOmBIcaUJ+/Q72APOKkmhCkUYlEk3XjPY06O315F
 fo3FXldXFIRdPSssY2dOJPf0UdHenU3ZKjXGwWOYU8EqFs2zUF4cCNkcVRXG0AWgA5264dXRHG5b+
 O+yhMCwvN1QJECbN/uJXyUh0I9Qg3n8zEwhlM7Nnu3J4Mu+fyaqDoaPOyh4OERFpojheIsCD4lsoX
 8PB0MSAxFsbMgeODmk+Is3qKUVtx1hAD8tmAtPqcedKtOtcwhINjbF/jqRrX4rvYMSc0FdRLLcVSl
 Vv0qU62/JNNWt3Taff9VPYRTXE6qS7lziJv17W8vEp+UV0AIDb0hnI/GEgS4gOVl6rkSuyyRPjDyk
 6eZQ1Lhz6p+mvAAckVT8gDGh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQO1-0000A9-C4; Fri, 30 Oct 2020 09:07:53 +0000
Subject: Re: can't start smbd after install samba posix branch
To: Rowland penny <rpenny@samba.org>,
 ronnie sahlberg <ronniesahlberg@gmail.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
 <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
 <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
Message-ID: <fbb67349-b1ed-672f-450d-b9332c7571a6@samba.org>
Date: Fri, 30 Oct 2020 10:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iWsKRmYYPoZZDtg5iy4SYgyPYxT1KQhKz"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iWsKRmYYPoZZDtg5iy4SYgyPYxT1KQhKz
Content-Type: multipart/mixed; boundary="pm2d5xWTBkwlOUNFcw6mGsHHYIfVEDeHm"

--pm2d5xWTBkwlOUNFcw6mGsHHYIfVEDeHm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/30/20 um 9:52 AM schrieb Rowland penny via samba-technical:
> Sorry, but I treat anything outside of master as experimental and only
> to be used for testing, you might use it, but would you use it in
> production ?

*caugh*, such questions are on-topic here on samba-technical.

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--pm2d5xWTBkwlOUNFcw6mGsHHYIfVEDeHm--

--iWsKRmYYPoZZDtg5iy4SYgyPYxT1KQhKz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+b1+cACgkQqh6bcSY5
nkZkNg//SqHGGdssUDH0B8GFPjF9H0IhfYeaNAwG+NuuFZ4gpu5fhmhZDuPO409X
EVI+D0ydBze5vVAjtESTI74NbAw6PW/tlHeWIoIqZLYFTP/90ZiW0WafPHzSe4bQ
N0I6k9rJkS/u8TRRScm6bR98U0OxNmtsIIweFPSl+fKI33BQBWDsZ6OtE+7skggY
jEUEEvnpXApqDnfcIxrA4iibq3uRgGG6JCnjjMFbux6fX2eZ2nSIgyIIgVulde2D
YlBeKQKb5ztbewciwbejGctwxYcEnLz8RWd3FOLMUVdJPIET/GJcdvCh1N6858hB
bbdNYVCXVZxwTEXq+ddQtEi5GJYwSUhEoe/Phs/u7M6LLOXwL9w4xXPk6+HepRzO
3HvqD6DweAWvlMZ2S5DFI4uVhFk6aCT2zfvC1SB7hYmhB0U3y0NeyWstX34BodIL
90G3xVs11+/pPMNqYz7WxTzBRQA6sa6JSkOxQBDr2mt4ZdvEbDH4ggAYe8TofrQx
pOb+xgyf54+L1VUC3vChXQE5valx/0YCpI9biA/cugJsgY1ayQ06hOwbL9e5oolD
eK87yazYU1BqSAmHuKrd7s7WCKmPaLmO9LJGqg/o3yaTPEK8/El1S1DZR0H0hVXx
9iE38waux0nT2KIEGSR+S+voaHJmKlK1Wq+LoEEKEotYieqNCls=
=60L7
-----END PGP SIGNATURE-----

--iWsKRmYYPoZZDtg5iy4SYgyPYxT1KQhKz--

