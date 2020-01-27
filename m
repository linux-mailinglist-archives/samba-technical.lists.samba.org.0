Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B214A220
	for <lists+samba-technical@lfdr.de>; Mon, 27 Jan 2020 11:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=wUpdoHXOO3jIE8CZV0TvH6/Hch3Km5eloJsWkg3WLqI=; b=kKF/ZzxSv32tl/ho0UvE6okgdI
	PXlC6XXRl0JcvTTAbg0BQ2kDrZ7p7311bWqa6vE8bsxFQKXVQKMXlc2AtUbSFbiPVezrVQjr62mx3
	D2ikCa0w1BrluFJv3MvdlwDK0clydAgaMIT2zdz1MYzg/Eg4yGCDmkkqfZy26ysGg68iJwyjEATwf
	eqT6EEtj3ct9gGkPu3re4vxqoHwTMwRyKCeSUf6ljZHrSHVLYjKCqd38VY6pl379Ot3EUHkPUhyVl
	Rq1ok6t0YBl0ibIerAG01IfDOjHWgHa3KZoPbdQYU0MNnRwhP751/HkLELG+e5W7G9dP7nrxtuH5d
	13KRJVTg==;
Received: from localhost ([::1]:29674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iw1og-004up1-3p; Mon, 27 Jan 2020 10:40:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34454) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iw1ob-004uot-JH
 for samba-technical@lists.samba.org; Mon, 27 Jan 2020 10:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=wUpdoHXOO3jIE8CZV0TvH6/Hch3Km5eloJsWkg3WLqI=; b=i96MmOKpHLI7xm1HE9/J8lWi7w
 Pj4re+ETjPuBrIxUC+LEWRhFeHRggNsDgtIUcGh0lHZi62mQP38bvzW8eyI1Iq8dkmnI4S/mjRY0f
 r6jjliOn8kdUPb1slxFvyhSeIxOSG2i0QtK9j9CJdL0mnGyQklApusfQhtVgVBtW/iKGNU2VY4F7k
 5I6mutyGHgPrzspSQZvlY9/1HOMy+r1+HeXDRF44yk8aZEUgJ+hAOdWg4UOYZv/vePRSxXFwQTFoN
 QHKQj1jWMtF88YRB7BO1pCLaRIuyUVoSFLu449yP/x4rRL58S21mEQ6b6rdK4mMwScuCq/pDleOfj
 D82zlmqeGaO7c8p3csYUDVGVf4456l2Nr6YTvcH6iVQOOqW6i4kfcDBOeDjDulSFSBH5Mu9EIA+mX
 59wbQb2d9ypRV4K/jFmbi40Bz6I6zZdZDfHUlzLZ5uTFEc0ivCFtL/TMxN+NQGAzxwiIfa6M0/AsA
 AXMXJ0kO+WerxHqgpUR2K9B/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iw1oZ-0000QI-BX; Mon, 27 Jan 2020 10:40:19 +0000
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <20200125002104.GA188423@jra4>
Subject: Re: Linux io_uring VFS backend.
Message-ID: <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
Date: Mon, 27 Jan 2020 11:40:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200125002104.GA188423@jra4>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Rys1xoiKhFqMSeGmB8KiiPGa34xYoVaTa"
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
--Rys1xoiKhFqMSeGmB8KiiPGa34xYoVaTa
Content-Type: multipart/mixed; boundary="areBJQ5JxboHCymu3o8d6qpDHlMTiyUqA";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Message-ID: <9de9b007-07ec-e9d2-f2ff-8c3c4eee215c@samba.org>
Subject: Re: Linux io_uring VFS backend.
References: <20200125002104.GA188423@jra4>
In-Reply-To: <20200125002104.GA188423@jra4>

--areBJQ5JxboHCymu3o8d6qpDHlMTiyUqA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jeremy,

> Any chance we can get the io_uring VFS
> code checked in for 4.12 ?
>=20
> Would love to see that as an option
> for Linux users.
>=20
> I'm happy to review / test !

Look at https://gitlab.com/samba-team/samba/merge_requests/529
I just rebased on current master.

The ubuntu 18.04 hwe kernel is up to 5.3 now.
But you need the liburing library from https://git.kernel.dk/liburing

I typically use
 ./configure --prefix=3D$HOME/prefix/liburing
 make
 make install

And for Samba

 PKG_CONFIG_PATH=3D"$HOME/prefix/liburing/lib/pkgconfig/:${PKG_CONFIG_PAT=
H}"
 export PKG_CONFIG_PATH
 ./configure ...

Note it won't currently work with a 5.4.15 kernel. The regression
is revert in 5.5 and most likely backported to 5.4.16.

Please test and it and play with the possible config options.
If you can provide some numbers, which show if the options have
any impact.

If everything works out ok, I'm happy to push it to master and
backport to v4-12-test.

I guess in the long run that module will be the default on
Linux. I'm currently discussing how to use IORING_OP_OPENAT2
from Samba and have the correct impersonation for the async
requests.

metze


--areBJQ5JxboHCymu3o8d6qpDHlMTiyUqA--

--Rys1xoiKhFqMSeGmB8KiiPGa34xYoVaTa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl4uvg4ACgkQDbX1YShp
vVYachAAsqNkrnOEivZwLbhmEUHhEpEdJ1sty1hJd7dPd85enjnrpHkuJTeStYlt
WtYFG7zPEIkJ7Gkxjmzj3ByW0Tmi/cg1zVysS5fPg3tn84wvZrGJm31+b5gWf0tx
jYQJf9xK+ZHT4+Mi7Uui5dtEfP3WwbBS7Mty7zN8owETLURIMtpztsd5HSHgNpQY
oCjkTSf4QHGpD6Ah/ppCj3FToRe7l99xs/UUjYfptx2QEaebWkBt9zYJCYSCS4it
tCYAagGWhScwdupmYIUEMZCmzQ8IvqNdjPfvK+E5kAlHC1B9KL9xjqeNXaEtXP0M
UZrA9gGyiMoxLxREhp9BKZDlyDH+HsDyagKs9FIL7EiS76hiLBd3GA/l5B4AfL5E
qOa3PBr1njd/jqMmB4o1mCoiSdwG8hS5Ohmn9ARkDcLMHZjsWcApL8LsB0CAtWzD
5aYZJznaTciA4TOQ2RAdyRqKNyxHLEH8jD6owWgQHo/xpv2BtXXmUgWpoX5nVkAh
ylpraRaXGpeWG0Rs22Ye2n7feX7LOKblNNp6OhwcDOgf1NlezugjCyXUohtEXbUx
IEjPYaZ1dlFQpqX0rkxcRh1u71Q+v25Jh9bqCFaWshYEfQ7XSYSJkQSjNsUytnfk
8Wr5GTw1W0CNNm5JJZ+XYzJxxzWbNkItzP3DseguqZN7lt9lnNo=
=yXuc
-----END PGP SIGNATURE-----

--Rys1xoiKhFqMSeGmB8KiiPGa34xYoVaTa--

