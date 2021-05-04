Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D633727A6
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 10:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QJ3EfiKo5XnubjB+By5tE34pJNes2TLgo1jEWfLlZFA=; b=qOxk/M+4UcvhJsEABTO0sIWm8I
	J8CUyFXIxu2AgEgVOLSiKMHKv7tSquZvzZL7GcsNQCHe54ZRRnbvEa4je1ojCPJWWnOX7SxAhiguq
	EsGu8BHnlOP9EPBS3mnkdNR5qoz8BD8EyQ0sKq0nBq4299rXKo74ZwztdTZe62Df+Vgfuka+F70sw
	HPDntjyE6Js2H1mD3wc3lDIGyyoNc84N/awY+mmrn6QUAUXCnGu3mhZJxcM6xVREgLUbzzplTX4/c
	ojltAco3ZV4LkL3ddyaHwSmwvBxQEjLnw2SqKjjy86GwvakkV5ZIhRsw4eaIfgI7KkpHCOhody/0G
	ZxmLvviA==;
Received: from ip6-localhost ([::1]:49338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldqqD-00FPmC-Pl; Tue, 04 May 2021 08:55:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49674) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldqq8-00FPm5-7l
 for samba-technical@lists.samba.org; Tue, 04 May 2021 08:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=QJ3EfiKo5XnubjB+By5tE34pJNes2TLgo1jEWfLlZFA=; b=v6YjGVzSmJQCgrsmzb9ZEQJqUK
 qcECnKOMwaFe2v49Q79cf8NXNHiWkFxeEwVb1vDpbSDFwOMIolz9qHqcyiIaGAde27/P958WtzHs7
 vy+dWbqhf06qe4Ukt4+wPQ4Pa0GSKLJ1hAB0SE6rQFr0ZRNzdTTEZX5FytHEsDB8ZrOitBCU01bjO
 BJc4i7na5ufJ+UsdklyWtr36f3+fRL2RaMQZmaxhIBLaL1o4OTJCoaY77xO1j5NpG/dahG1UaXpct
 657up2a7QQDAreicsooEuQBxejI73vcv/JamzlNpzKTAdPUmCSpWodwmfUqGnngBne9UdUg2YSZ5W
 CD74aW/crf542eajZ6uXpU5PUhV0ynIg1598YTv1+tVBZgdFzzmnaevo/y2J2OqeMXiKgHCnxVksO
 T5O+Dfj6fiDqG35/ZRZGQGVRfWCio/TgLI29y775Pk3yrNoVFNwEZSbFyzNb/K/s0792RZzGkwP4L
 9kVe6OWJhhAX/KWZ0DEb8ZVJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldqq6-0003oj-G5; Tue, 04 May 2021 08:55:34 +0000
Subject: Re: entry in winbindd_cache.tdb gets overwritten if child domain
 names in 2 different forests are same
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAHbM3qgLd2RuVMo+nfnhCOB8Ocrf_9KzMyyzcHmvOU1fO1xKhw@mail.gmail.com>
Message-ID: <69cb73e9-0423-4655-f2ca-d1b5eea87c86@samba.org>
Date: Tue, 4 May 2021 10:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHbM3qgLd2RuVMo+nfnhCOB8Ocrf_9KzMyyzcHmvOU1fO1xKhw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fBcM8fCQJCjuOqhxRpOrltWvoMTxCYUHe"
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
--fBcM8fCQJCjuOqhxRpOrltWvoMTxCYUHe
Content-Type: multipart/mixed; boundary="mPU9qvlcEfc8TZRndPw9VmdujjV5el0AO";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <69cb73e9-0423-4655-f2ca-d1b5eea87c86@samba.org>
Subject: Re: entry in winbindd_cache.tdb gets overwritten if child domain
 names in 2 different forests are same
References: <CAHbM3qgLd2RuVMo+nfnhCOB8Ocrf_9KzMyyzcHmvOU1fO1xKhw@mail.gmail.com>
In-Reply-To: <CAHbM3qgLd2RuVMo+nfnhCOB8Ocrf_9KzMyyzcHmvOU1fO1xKhw@mail.gmail.com>

--mPU9qvlcEfc8TZRndPw9VmdujjV5el0AO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Shilpa,

> We had a setup where child domains in 2 different forests had the same
> names. In this case, we noticed that the child domain name of one fores=
t in
> trusted domain cache  (TRUSTDOMCACHE/<domainname>) gets overwritten wit=
h
> the child domain name of another forest.
>=20
> Attached patch helped us. Could you please let me know if it is applica=
ble
> to master as well?

Can you use "winbind scan trusted domains =3D no", that should avoid the =
problem,
it's planed to make that the default for 4.15.

metze




--mPU9qvlcEfc8TZRndPw9VmdujjV5el0AO--

--fBcM8fCQJCjuOqhxRpOrltWvoMTxCYUHe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCRDAEACgkQDbX1YShp
vVZ7Rg//RSrsFiFgpxORcQd6+JeQLHN9ZzMZTsItXbIwoYWgj43VwVayqCFbg3Wx
YOnygVzPIN3IU83Nk4mcpR4hr4o6OFh7pemhkePKoGe4BDfWkw5rXNHlXvAwkBU4
XzSjxkSEsCfC03aCCi0Bx6wNgyRtUx6VhaH+4V/vj00dLu/3PGgruKlZJ0dB9OsV
nuGlh+risJlIbgqBqer/tSx4jRAWYNpNkOBeNyDfbfyxrpZ9qWRTUcynnoPyfRVQ
rmkKwma5hH5Ah/O2ovWGtoasH+mFDngxb1p76kxGK2SD/bY6zCDSfZg03kHMRI1B
i6SZYIy1PWulBj7se/PNmwtbxFe+ts1nKFOzVGfXvjmkVuSsKbcukb2S13tvK4EF
7xx6J645nCxIdzv2vjiSzg17XiabMqDark+XG5QEpTATJ3CDW+4qir2SbioHnWEt
/uQ9YjZ25jxoMkic1bNxJ728MjRtxpckP35q/w+zzUyoJb48l4f8nBIw3xFEi0iW
qSl+fi8VGhpQGwKSzmHdCoNzwAczdwsPV59YpB8m2Z7trut3rbaOU8rFyQk9v4MO
SakIFhCSrOsowNXno29HiDF30hVIJPKEY5AtR+HqYsGQT/mpp0VjrEHivuiA09Ve
OhUW6mjehFUdC2X/79DRkRrlU0Dwscyd9HV5plWUy2wcKD4y8ak=
=z/bp
-----END PGP SIGNATURE-----

--fBcM8fCQJCjuOqhxRpOrltWvoMTxCYUHe--

