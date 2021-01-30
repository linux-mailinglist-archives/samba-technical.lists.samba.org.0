Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764430951C
	for <lists+samba-technical@lfdr.de>; Sat, 30 Jan 2021 13:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tim4KKqaLg3wKV/MfS5LZBYM3gYAt9Xxteyn1La5/zI=; b=0NMl6I2KAeELSND+m7OjM6dR88
	msNOQ2PUe/1IvWx7aWT8pe50x3mrb+f2+8xcY02AO9/lv3d+rTTnzSE/siBdraA+D/4xjRUGhWd7Z
	t+UdkyoZQaRe6nu5Xz++qOHR+dSGaug0gmkXbn6U5/TmatWFn1DC8A1+33shtxVWS1zKBoT2ds2sQ
	XE6I7Ema2O+pU4csyv3UjzmnD7vhqRE4LeyYTT5CBSkCta75ZWJ39BCIhNX/7N7RePRiM2gv1PNBZ
	NRjvQ7BZ923uBZz0lNsHFnCgYcm0VMeGQnblt2PWDC7eYKbM7nn6LOFV1OzR89keovyHecsOS+rXg
	WtNd3gog==;
Received: from ip6-localhost ([::1]:26292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5pSY-007vN6-Ny; Sat, 30 Jan 2021 12:34:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65266) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5pSS-007vMz-Nk
 for samba-technical@lists.samba.org; Sat, 30 Jan 2021 12:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=tim4KKqaLg3wKV/MfS5LZBYM3gYAt9Xxteyn1La5/zI=; b=xLvxlUaUmnUhwTcu2CQGKYMZG9
 OjrO4bYsNgV92wofn1HZD4Mv3IR/+ezYEWxz0z1jWLgru76lio9uVnMjB6N1kDcadtV9soSuAmtUd
 7AGO/6SrIvBOMXB0km0K7wG1eCAvNK7t2kIn1Yek+QMHJ552GKP5YW2X3wcqF6jhqKMFMGZIC+ldJ
 MdyP1Vu6aQjM3RY6PZWySQA2rrsg/UC1pfJ5pgkwjODtt5mvDSx4MrtOEkZabOgNJQErxLBq4YjW6
 MzEAlC86/NKh/qXt/f/2RMHB9lnKbT5ou9vTEJgTQLycXiY49DBsmovFdThKy7fdpmFSxMtqo9/MJ
 ZMYbvbLkZs7HOLCqo73bxXHoguwyVssTlb3dxlC9+Ec9q6EOflqPnedJnGeU37mW56vVxvconyMNE
 GWRqCXFhHZQR8vgpfE9IBYRXqRIF22rXcMxDqG6G2tbOdMJcTOymK3DJYsVjOK+04yHBX9X9/zXI9
 Ll2RF92x73QUpYMxC/lkEBfM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5pSQ-0005mS-Uy; Sat, 30 Jan 2021 12:34:31 +0000
To: Anoop C S <anoopcs@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
 <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
 <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>
Subject: Re: socket-wrapper fd-passing
Message-ID: <95ec1707-a638-0d26-da5f-1bd48ba900c6@samba.org>
Date: Sat, 30 Jan 2021 13:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="nh8etRNuEkSzbXEiLl7TnV1QE7i7YBNIh"
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
Cc: Andreas Schneider <asn@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nh8etRNuEkSzbXEiLl7TnV1QE7i7YBNIh
Content-Type: multipart/mixed; boundary="CuSUdfcpfau4Yr3HcW9CnX9PHhUPmB5Sq";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>
Message-ID: <95ec1707-a638-0d26-da5f-1bd48ba900c6@samba.org>
Subject: Re: socket-wrapper fd-passing
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
 <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
 <e0441676a67f6a10c1e5d4fdbd8fa0463c668c89.camel@samba.org>
 <f5c3e252-2783-d96c-8e89-1fd51bc6fa38@samba.org>
 <9208357e5cb0d33ef1a4e6e021341edb41ce6c80.camel@samba.org>
 <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>
In-Reply-To: <779c563c-19d6-4299-cf03-29fb655699ff@samba.org>

--CuSUdfcpfau4Yr3HcW9CnX9PHhUPmB5Sq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

> There are two main items left to do:
> 1. cleanup the socket_wrapper.c:
>   - struct swrap_unix_scm_rights =3D> adding a uint64 magic
>     (if possible the magic should be derived from the
>     definition of swrap_unix_scm_rights_payload,
>     see profile_setup() in source3/profile/profile.c
>     where we do something similar.
>   - we need to remove some #if 0 code

I changed it a bit differently and have merge request ready for review he=
re:
https://gitlab.com/cwrap/socket_wrapper/-/merge_requests/14

I improved your test a bit in order to let recvmsg() block reliable
until the incoming message arrived (on FreeBSD).

metze


--CuSUdfcpfau4Yr3HcW9CnX9PHhUPmB5Sq--

--nh8etRNuEkSzbXEiLl7TnV1QE7i7YBNIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAVUlEACgkQDbX1YShp
vVaOEw//SoY3UhrXewHP513+yd62aFOERdHLvjtuRC4c6pxvYcPwIQu4xMLgi650
XCSCvqtg5koAZkVLaWeDEj+GfagaXOkL2memPvEQ9BUdHxPoYoexZzBZolpnhYod
LMmup0a81MEdlogXGt1PXpVzf27F2E+hfQbJRB/uJO3GHFkeVt1CKcICJO0VjzMZ
up1fEItpx2xnAIFU++eAdwyZE1pn7reJe6ybtrTWPdVS1HjtJZhQva39+VeQW027
g6LJ2GdBzzFqqCDPAXRQbi1P68XvixYCPIvQ7fB+Ed7UHxpNkDYk7BCrQEIOVPD9
5AZReXlAq0+m2UPQ1MyGyM7QKojRErGTuozj1neLbSFDpghoA/PtkXmzagyF/Yez
JGzP+DcFsPmgv7THQyTK09ZBOwzEkhIYmRbjyHB0jK2kJf0iVKCMNVg7mjAMwWtb
rMuPrqWszL+Yf5y6Uj3tcmx/fkgJGN1gqfiUkEc9hE651mHbu0DX9mSrUbpLOvqy
Jvp4J3Kt2gdIBteHmg9eg22QJTtExedFDpLMbMgmPf6Y7g6YAvItqtaZM7FOH/ko
XyjIKFYS+BPPAHShnyFYj3DOGaUYa+GShuc6kFv26zXnYfM4nR1VYFlP4Idlf0kV
Wx5m4Sg1oAEhaa8P/cuf+kF5PSKOoqtKo20jdj7YBdshlI0mMoA=
=Vaje
-----END PGP SIGNATURE-----

--nh8etRNuEkSzbXEiLl7TnV1QE7i7YBNIh--

