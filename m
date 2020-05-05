Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F561C61E5
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 22:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eWnusL2q81m/Y39y0RfZmDxiICedY+SLHkVqmlBJAzk=; b=hSngLrrbnRY5q5sAUgSr1zwX+d
	BseL64Tc5rHkQpkTQ41Xyg0oLUoYQWBNGOodDY614sG+cFvVs7htypZ6R602hWm4VwpQy3FTvFymd
	o1SlPNReU4w3fm5s3CFjcQTIhfKz4IaKnWCarjDGmq9fSNG4wK8Sy36AKWjBEcrgu0F6ABCJEY1Ul
	jYNpRjAURRvNIM4IsN6A2EuHSI0JlaQID0QnXSciwgjP26/3u7o/IoPIroS7KvyC9qHtPXPBCHSTS
	DMp+amR4mtwlOFbybr49ZBtsA34tLhJj1UHAUzEqGcLeYQSHa04O6RAk8X1Zj+1a+mwECnYOcp0eV
	rSPIZ4Ng==;
Received: from localhost ([::1]:20744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jW42U-002v10-HC; Tue, 05 May 2020 20:19:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jW42N-002v0t-FF
 for samba-technical@lists.samba.org; Tue, 05 May 2020 20:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=eWnusL2q81m/Y39y0RfZmDxiICedY+SLHkVqmlBJAzk=; b=jvmGbyEVWzeTZoy3160j6vfidU
 fzuH44xcgEL76UMpdsO3KcwsT2VPAMsaZDy+n+ARH7nTYZo4QmfxUTy81s+genZkp4sJzGWyvFDBn
 Px9KCi1AeRpa2QehUXfy+iSxS2x+r+e5jp8ZbifkkDPUQBEzRsUhbvGqtZO0RpB8k+ora8vTZx+2h
 CjuLmhAGZjDexzqUZHOQVdunVQ/RH+NU+6R/Ngxo6JJtvMFwgcAZTszcdUkhozI1dvtbhLUNhBncJ
 q7EUm91iZSjThm+6xQiqVaTdHiK0bWX/HTqzRkP31CEaom2tiKnmx3zy7SNV54NzZ8FiibFUdW0hy
 wR3KvP79zYTEkayQCrJLL8tr8E8iGbe+aq/cfaqTxyufx+DnjhdDe4EfMpwR1derqaHUYL5SPCvI2
 bhgdRrZJIEDCbiI01E3QgEUl/Rz4u+2ccwgWpmAtJDeSO411fX69vT5cD/8iuBZ/vBtOuR3S5yQMp
 bsipJBJFEEJ2vmSKHhBEQ+IB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jW42M-0006cb-47; Tue, 05 May 2020 20:19:30 +0000
To: Jens Axboe <axboe@kernel.dk>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
Date: Tue, 5 May 2020 22:19:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="xQ63XlDeSybsHBvvgfdWmEWs50XvIWUA9"
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xQ63XlDeSybsHBvvgfdWmEWs50XvIWUA9
Content-Type: multipart/mixed; boundary="H95GPMizWsTeXIPmMzAxALRfawanzZ0P6";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring <io-uring@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Message-ID: <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
In-Reply-To: <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>

--H95GPMizWsTeXIPmMzAxALRfawanzZ0P6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jens,

> Got it working, but apparently the arch samba doesn't come with io_urin=
g...
> One question, though, from looking at the source:

Thanks for taking a look!

> static ssize_t vfs_io_uring_pread_recv(struct tevent_req *req,
> 				  struct vfs_aio_state *vfs_aio_state)
> {
> [...]
> 	if (state->ur.cqe.res < 0) {
> 		vfs_aio_state->error =3D -state->ur.cqe.res;
> 		ret =3D -1;
> 	} else {
> 		vfs_aio_state->error =3D 0;
> 		ret =3D state->ur.cqe.res;
> 	}
>=20
> 	tevent_req_received(req);
> [...]
>=20
> I'm assuming this is dealing with short reads?
>=20
> I'll try and see if I can get an arch binary build that has the
> vfs_io_uring module and reproduce.

I guess I don't expect short reads for files unless the client asked
for a read beyond EOF. Does IORING_OP_READV may return short reads
similar to preadv2 with RWF_NOWAIT? And if so, did this got changed
since 5.3?

By default Samba uses pread()/pwrite() from within a helper thread
and I modeled the io_uring module with the same expecations that
we wouldn't get a short read if only part of the requested buffer (can
be up to 8MB) is returned because only some of it is already in the
buffer cache.

I'll try the ubuntu 5.4 kernel tomorrow.

metze


--H95GPMizWsTeXIPmMzAxALRfawanzZ0P6--

--xQ63XlDeSybsHBvvgfdWmEWs50XvIWUA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6xyk0ACgkQDbX1YShp
vVa0sA//eF30Crdt6N1MlYtVMVSYKMNqvbWwpCrtmlz+CROuzfKMrdqbyG01FZul
kOT7y8w3yGBkVK0f/QGlBGBKDXwEmWPMMeXPk9cv2fD146rPw6FSuOe5Vhutp8fj
yTH1Wr3T1PIep05muaV4P7D0OqKgjldDExVxHhqt0WKXh4d8PE4y6TjNBDNt/fYF
/2ViQQomcSWxFlW2PTc1mRf5Sbikmx+51Jdioqqz5xyjwrh7rdGzB7/v3ZBiCrCz
7jd7y/Tn9zmz+oVrh73rKIb45+JX/mYCqrSn3vClGIJGJX7/dppLg1fkQ6RdnAFj
K0VKQcwO//ynY8ebpYzOXdKYIYBjsLN2xsbNz8orx8Pw+5yoiteAGcqlnHtWNVuy
Lvd4puunk1m587GgeZLX2ueJEPwPFleafwpxFuv7H9Ehn44+5sZfKmUdTOXLx3G3
X4GLsF7Vy40PnjaDWd+itRNIXiEsxesucyLtxX4aYF7ngxSUtax8vLhK6HY0qfSs
J0mQJbJt0jfxWffkSiP8wlwUbnJPxo9LTh5WU97Agk9wTwm1MKidtsoTkVpCF2h0
AUozX6pAhivLLrbiYLuCaVxAtFXwqsCL7i2Svwd/hPINNXHYeo4vbJkenYyFOvK+
SYXmswauiPc7A4Pycbvw4QnO1YdslLCPg3o/jTcF/b/McP6DkGA=
=OQwJ
-----END PGP SIGNATURE-----

--xQ63XlDeSybsHBvvgfdWmEWs50XvIWUA9--

