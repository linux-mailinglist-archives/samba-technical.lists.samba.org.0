Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2AA7B7AF
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 03:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Nr6V7nqffymWMtThC1wDhBRUGI1N9y7avty7kFa4Lbw=; b=u6Q6T/ehZgBilINtnbmqyR8r4C
	ddQvbLpwANhmmgXqPLBo0Tv5dZcx6poU6rsTpr3AccesG/lfQ6L/jHfvCYWbg4zqqnEMTbUVCI5+9
	9JiDU4CLHYXvyfSec7MXxqU1Ib1wKr9fDzo2l9md/z4FX28D41T5KcBkFpbr4ZlWaOOJExn3fSvVB
	VpXQVwXx4CTqOgv7aw3m7lAs5XwzHMVPrk7P1LtyDVwc3kXzSG3V4UpvUmyg5UK36JemSPJkIVneJ
	bFpV2pxNej7JR+J7yfpcGksFtpWoDBlRXPPan7EEePqnT925OFL6zsE8A5RoV1hIwk2nUZLuC/RsL
	jG7EA5cA==;
Received: from localhost ([::1]:60768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsdZd-00178L-9W; Wed, 31 Jul 2019 01:38:37 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55693 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsdZS-00178E-FG
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 01:38:29 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ywzs0GBvz9sBF;
 Wed, 31 Jul 2019 11:38:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1564537097; bh=KxYR3pX2rrehPD4rsnp9CGk7DfWcsiCJ63vT149EkXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e83/8gMbT+HTqmXoBqidhXFcfedkZ+PTJ8hN/I6Q7/nZgT6yhHLoNh0rEFSKk+hj+
 iRG5CYkNejsLzv9mL8z3LlvAV9Ff4yDQ1jpRy30fQo/KY65fbiZcNsMWWR7S97P4Xr
 ivfo+BFWwffPGl4wbu/zrgFpTX9yfAkWPlEs9Pz4gsXl8MyL4qZhSbLOLNGv3fJ3KF
 0aLrJfrRqeOQaX8jtAF9pvac8sMofJIM68ObtLUIikCENy924lYiejDWQFElFPxS/j
 gQb6kYf6ZQKzH8qth9zUcAl2KSnnin/ZWsypGVPNcVdTq6aoDw0h/76pmW2IN2NriI
 WgO+/OW91L8dg==
Date: Wed, 31 Jul 2019 11:38:04 +1000
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
Message-ID: <20190731113804.3c4a88d4@martins.ozlabs.org>
In-Reply-To: <1dfda6d3-27ec-3d05-4f82-9d4b8814ccaa@samba.org>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
 <20190730100948.3e72f009@martins.ozlabs.org>
 <1dfda6d3-27ec-3d05-4f82-9d4b8814ccaa@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/cwAVHuLkm6uVXo/rwdl8ci_"; protocol="application/pgp-signature"
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Noel Power <NoPower@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--Sig_/cwAVHuLkm6uVXo/rwdl8ci_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Metze,

On Tue, 30 Jul 2019 09:51:14 +0200, Stefan Metzmacher <metze@samba.org>
wrote:

> > I like the idea.  Those fancy options sometimes find bugs before the
> > code gets merged.  ;-)
> >=20
> > It would be good if we could even go stronger.  I always try to build
> > with CFLAGS=3D"-O3" and --picky-developer. However, with those options =
you
> > can't build against bundled Heimdal Kerberos, because it is a roaring
> > dumpster fire... and I don't think anyone has looked at fixing
> > building against system Heimdal either...  :-( =20
>=20
> Are you sure that's still the case?
> It was the problem at the time I wrote the patches
> ~ 5 years ago.
>=20
> But autobuild and gitlab-ci use that for quite some time now.
>=20
> See https://gitlab.com/samba-team/samba/merge_requests/667
> the pipeline works fine and we're running the O3 build on a lot of
> distributions and never need to use --disable-warnings-as-errors.

I'm not sure... let me try it all!  :-)

I'm happy to see that I'm wrong and that bundled Heimdal now builds with
O3 and --picky-developer!  Yay!

--with-system-heimdalkrb5 still fails to build.

Anyway, I'm happier.  Thanks for letting me know bundled Heimdal works
now!

peace & happiness,
martin

--Sig_/cwAVHuLkm6uVXo/rwdl8ci_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEpl+9WVt0RsCS8yPD7qs4B6MivQgFAl1A8PwACgkQ7qs4B6Mi
vQiSLA//XGx9kUvEUStCYnUeqViRMhWxoZnchdKlqUHU8xULlgDz1/IOHN/Yi4Ew
36N4To4F8hZixbojwun/nzNKfe9ZsruOXKUKaZuWLDLpjK+dDg4w4h2+0CJwlZtD
HjIOBgpMAXK82cQItyJoyyJhdf4vYoWbtKaivSmZO+p2b5wJ/7u6YAwbYfyeKc6k
1dGd+0nwraMOPC1gQCtKFRhdYE44w2vuGKFaVk8TFgjoMIbr5BnLsAWxJlA12NxV
b5LXw944H/i4ftlx5RKlJ8YtgZLEfANgb4VanJybvZizNgJyZ8xhJiLWdo422W1f
4XpwaOKXzKeARUPEPmUMJUVHPpem74UR5+lhZsri/qTWIi12f3cDqwnPZEQeol1b
NGnxF3TyqOZ4MdH20yAFO1h50uqeiNAAvIUuAZskOucfTzzRVVpnh7HhXUkCBhhP
RguBCLY4kYVo3xHjnwi1w5HPG/1M2DeM/IP9Yx5lMH0WdoZpmDVE1MnwA2OOGaQA
VQkYBwT/AWb7Lb9fWE3XQ8gbfWUwtmmp7jNhl09/ICQATC4Z/zjd3vp1HOTYcOAy
yPjFBj65VcogSjaapziG37xi+JkS8j7bEHR3s9xI7N1czFFMVKF7AHL5GHSC6z+E
XahKv6iunrKGMjFJ6FN06PAvyg6VXGa9zbo92XAax20WqblaArQ=
=v2ID
-----END PGP SIGNATURE-----

--Sig_/cwAVHuLkm6uVXo/rwdl8ci_--

