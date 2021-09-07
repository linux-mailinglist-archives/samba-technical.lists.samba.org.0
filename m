Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7654025C0
	for <lists+samba-technical@lfdr.de>; Tue,  7 Sep 2021 10:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tH16zRYtlYH71Np1ZjZYCbSbc9HgWgJYPFi4jp+v7Qg=; b=byV3M7Sts3gUgsCa3lbzE3bX3f
	gEIa5aTy1oDlU/LOA/csJ3irnyO3jyuFrS7drhZ1K3nxonh0if1bplazxyHPlln2PDBm10UVrZ29z
	CU6bJ8C+hS0E6v45ZeUl8nPHtP7f6pEwlaVgv7tPcHiPbI+zlbhwDjOKATX0JZGc6F4ze3E8VUK90
	6Ytt428bgPrm5RfliKPcdEf7gmP9g/eBLwR7NsLp0U9QrCc9JW+mQcuuuJtw4DmbxE30tMOitdQKw
	TaklPeyKF+xWf7pGwgnAWloZ2/9DNHM5YxeR5TZbIDMwwGOjgLTudIw68J6h4aio1egQB6tbtU3mr
	tiYhrLKg==;
Received: from ip6-localhost ([::1]:58636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNWts-00Dd0N-UV; Tue, 07 Sep 2021 08:56:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46266) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mNWtn-00Dd09-Kh; Tue, 07 Sep 2021 08:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=tH16zRYtlYH71Np1ZjZYCbSbc9HgWgJYPFi4jp+v7Qg=; b=kVePWhwWsOPSikRkZP0m5hDSOu
 PFu4B80LfS1rXHZg0Nbi3v9FcjyNEB/KphwgCgBTul/YUXCNUs/6J36/QdKS1teIBQGOXcCmkXz+1
 mhPi5RsHJmSoDuwTN7xaJlIo6JSpA77rnmOjFq6d/RIOxAtRJufRRcnVA0DsFOezQwsCeK9CrSzU+
 wW6LbJogzfaYPiZzKrxvbMcJHtpVUWQVRRfp8fQdyz1JhnuavsPhA5cCqPnCjvxkqbA3CkO1Xc+E5
 mjBgt5mwlhmiBtT0Lfn5z6Bn6UJ15FaFWBdGZASv1nm3J+jNWUxq3P+2oaNd5rBjKlruuzP01RXly
 I5vOyn9wtZ/w+BhX2nDKJKFT+Mj1A5o07AOSxVNI421B6Ivcys9eJEPRBmatiFlqs03qKx5FDfXgk
 TYxHYekdGD1cnG6SQQhZNACjXfMixBYSUE+DaD6KRYfcsh6A28cf7m0GE1PJgBr/aCJCCO0gSUGVW
 MpCp+WYzTT5Lns4i1h+SKnKR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mNWtm-005250-Ps; Tue, 07 Sep 2021 08:56:10 +0000
Subject: Re: [Samba] [Announce] Samba 4.15.0rc5 Available for Download
To: Jule Anger <janger@samba.org>, samba@lists.samba.org,
 samba-technical@lists.samba.org
References: <5246deff-7962-aa9c-a622-6fbe8be8fd9b@samba.org>
Message-ID: <da358dfd-9f37-cf57-d481-a9f43cc5f7f1@samba.org>
Date: Tue, 7 Sep 2021 10:56:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5246deff-7962-aa9c-a622-6fbe8be8fd9b@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WnXYhqdkr7CVY1IFGmTkcV7M5cLEt9nsi"
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
--WnXYhqdkr7CVY1IFGmTkcV7M5cLEt9nsi
Content-Type: multipart/mixed; boundary="VF00mf08oX4aRSzv3KZZrkrTmVm3TSblR";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jule Anger <janger@samba.org>, samba@lists.samba.org,
 samba-technical@lists.samba.org
Message-ID: <da358dfd-9f37-cf57-d481-a9f43cc5f7f1@samba.org>
Subject: Re: [Samba] [Announce] Samba 4.15.0rc5 Available for Download
References: <5246deff-7962-aa9c-a622-6fbe8be8fd9b@samba.org>
In-Reply-To: <5246deff-7962-aa9c-a622-6fbe8be8fd9b@samba.org>

--VF00mf08oX4aRSzv3KZZrkrTmVm3TSblR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 07.09.21 um 10:43 schrieb Jule Anger via samba:
> Release Announcements
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This is the fifth release candidate of Samba 4.15.=C2=A0 This is *not*
> intended for production environments and is designed for testing
> purposes only.=C2=A0 Please report any defects via the Samba bug report=
ing
> system at https://bugzilla.samba.org/.
>=20
> Samba 4.15 will be the next version of the Samba suite.

I just wanted to says a big THANK YOU for taking care of the releases so =

smoothly!

I guess doing the releases most of the times the only feedback you will=20
receive is when something goes wrong, releases are delayed etc, so I=20
wanted to take the occasion to cheer and celebrate! :)

If you need any help, have any questions or run into any issues don't=20
hesitate to ask, we'll do our best to support you!

Thanks again!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team       https://www.sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--VF00mf08oX4aRSzv3KZZrkrTmVm3TSblR--

--WnXYhqdkr7CVY1IFGmTkcV7M5cLEt9nsi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmE3KSkFAwAAAAAACgkQqh6bcSY5nka9
fBAAxUpyUs8f8OzvUOXxKplqYQtcsEbCk1TsFo1Du4f2C64gHjs/mEluPBhFrvfp/5S6eBv//T0b
Ll9pfT5mpNLDkaHqxz23/UQC9LTIrzNX8LB4pVElU6wOH/ng9Lp3o7IoNoie/ihXmJkZ9gkUPfxl
6DUiI/s21qn9lA4CnAfKl2DAM35FFUMgRnHKjUy55vyMFkFPjGmGCXsAJJEUpLtRc/RcC2WeH7g/
jiKE33HTeOztBSXeXkQISSRWDdef0SKmzSmDBxJ7mH+iFRXY6/w9jQ4Qa+9E1zYiLZpOicqbeGex
2Z5BmZgt7EEWPm8+cOjndnkVtBYAR8HaeZQ6KH5czA5nXe1HkaZO602csa5aQG9qBoELR+FRUguY
6eNCtvo650SD3GPz0WmAuRn/y2vzXxqo/3e/NoyGoZZu1LJgnUGqEDMMEHal9Vx8EaF+g13WP5Mm
NnOnsYRdm4Fkua+Y+31ZYEXYHC3M8N3hsQuNHiezMNbGoavSfBdN1BdPZLOZhJNoSlN7fgqrbivN
nUzP0QpbL9VHuNsIZEVrrJx7ZjNgIMiblBLL38fLOtEkV3J+cT77+/LKLpER4VEdDFGnOVPyO7Qe
ToncONh688PwJ0F0aorVHvUQNIPsDHayJ20RXr1azMU2gLG0/RTIKuhSz/+LNTKxygpHiPIrBsNZ
LoQ=
=fItO
-----END PGP SIGNATURE-----

--WnXYhqdkr7CVY1IFGmTkcV7M5cLEt9nsi--

