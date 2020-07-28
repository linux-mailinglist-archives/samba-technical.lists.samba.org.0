Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE86230418
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 09:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=s5vMmTdcxPOz/WOYG6OiBxxMTsehrORn6Ek1kueiQyo=; b=brUS5qhWboBVkJLqlb/vNIKGUc
	r4CNLNZiAmr2iQ4rykLW5L5jt/ZS2OuN71OZZ7Taos30iBoqPe3owMA2zImHDMEP9BoK6B0wOFeaR
	TItdwf1zHTR0/I4hYSgUeA/cbkG5cJQM92OLVcMHuf+ub22FnrB8Wl95NSLhccsqobf2gUp2y5jQR
	gO+B6p9owfeUYoKnGdVGENV5HYez8cpntDaYysFcj1mmuWsCalCnBNa3NukLvv2Qs9BP8te1ut5lc
	nUBQMeUdl7sUv4rBjwziUbah9bqIYah4EBQBD0TUmUyh40+gL7qlqXWdvSI+HB5dzNcffji1L+7Vd
	ntrJjnzQ==;
Received: from localhost ([::1]:55170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0K28-00A7M0-Ci; Tue, 28 Jul 2020 07:28:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0K1x-00A7Lt-1x
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 07:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=s5vMmTdcxPOz/WOYG6OiBxxMTsehrORn6Ek1kueiQyo=; b=dlQe9vKmTX8HxbELVQtARpiPCX
 5cuM/8lV+36DJzDhkRpImm2/LDHfjlecz3pgpyOMzvzFYyp9k95qIXUcNNa0ULTjyukThuBGOX6rd
 7IAUdEetDJCQw8DPFdFE+2OtIUGqmV3ixDDiXJDcvnZ+HVUTXmtcRARdRw9WzRr98Zea6hhcEtlT6
 OYVwAnld4cl1zQa6L4CGDSAo+WyXUCHsGlkknipjSPkAcmiKuHwSeJuBdOM6YVGft+iFJh2NzhzNF
 hsUHihMtjrtL6gT+LoKkWUN9keY8nu66UEatuhorNgPwCvSIZYG4OHQg/uiNVeILX0wE0YmH6JSYt
 IZ7Hou/0fL7Q+Lam6iFkkaCTuYaacc3MsXzFxLDmGLakTQnrYPu/DPLa7eWbrf5UyjAn2GVdkLOwf
 OGQcPNVlQL06esCYdrCkML+P3E9S8YIu03LtVQPZoRITOpSygjFQlS3+jrqn8jC+8Wn9m1k6Twsru
 BaHovYY0b8BUXLpU49UmvPEE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0K1w-0003P2-8N; Tue, 28 Jul 2020 07:28:08 +0000
To: Isaac Boukris <iboukris@gmail.com>, admin@prawda.net.pl
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
Message-ID: <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
Date: Tue, 28 Jul 2020 09:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cfSXwPy21OQISOo4cG7u7ATbs8VkSpBL0"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cfSXwPy21OQISOo4cG7u7ATbs8VkSpBL0
Content-Type: multipart/mixed; boundary="g1qTCXulYaKHxLc7dl0b615zeZhmpmiEV";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>, admin@prawda.net.pl
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
In-Reply-To: <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>

--g1qTCXulYaKHxLc7dl0b615zeZhmpmiEV
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 28.07.20 um 09:21 schrieb Isaac Boukris via samba-technical:
> On Tue, Jul 28, 2020 at 8:57 AM admin--- via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>>
>> I thing I have problem with encryption, ver 4.12 not supported DES and=
 I
>> see in log:
>>
>>   Kerberos: Server not found in database:
>> <mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
>> ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3 =
not
>> supported
>>
>> How migrate old database encryption to supportet in samba 4.12?
>=20
> It's technically not possible to convert DES hashes to another encrypti=
on type.
>=20
>> Change user password not help.
>=20
> Try resetting the server secret and regenerate its keytab (ldap/debian)=
=2E

No, I don't think that's useful.
Adjusting msDS-SupportedEncryptionTypes for debian.prawda.local from 31
to 28 should help.

@Isaac didn't we had a fix and a bug report for the problem already?

metze


--g1qTCXulYaKHxLc7dl0b615zeZhmpmiEV--

--cfSXwPy21OQISOo4cG7u7ATbs8VkSpBL0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8f04QACgkQDbX1YShp
vVbolxAAt3VcZgwr3FoyTtZj9q6tV90uS01Krem+3oa9xXt5KSaI9q3d/t+VGPi/
CskoXmPisBlngpgkO89u4NPXfix7RFqNii6dbBZIG0kGVOsG9miEvVQKhIsiicUQ
DBrk2M1p5GC+RMYlU4mCOBXYJ9U9KEhdb8kHszxV8MKcS5/OvyirrebqHQH+A7U5
x+sRyq1c8WOLp0ez3zeB9Js5rlofFPl4k85r7Ba9H9em3QSRBNZ24R+XX3/USJCb
Q35K041eo9pZBgDti0WTVGFET8aR3X2Z+rshtBZNSIJ3Mr8MWhC8Wi89HxgOzZOI
5sUCDrsQD0ty5tFMKrZkampoO0Sxz7PTc9FR6lnva0yMKdbNRo5fMvX9j3rrL7XC
su9y5V1E9/BLsdS5kgxgoGDaVrr4nwporeCvSUEfm+6G4FYWHOvbFu5jXtQozGio
GUCWgTcerZDjtZiZ5tsCuErMjowe5TOipiVx5lLWP/dDlqhOQZq3JiDfrx+mjf38
YjghNf6/R8MeVoQ9gPoVSEbhe8HZ3cyBBDlunOsq+AfWqCi+XzJ+qytaVpDLqjHE
hGmUhgcfgSk2w1V/uJLqsFA67p/1ZdJIxw0tRbXFvqwqSmWeugIOHKV//Y++Hdno
Bc8+mveG+QBk1rOvttsDnEQrX3/3uc9OnoDu8Unundji3KOcVtQ=
=YrSz
-----END PGP SIGNATURE-----

--cfSXwPy21OQISOo4cG7u7ATbs8VkSpBL0--

