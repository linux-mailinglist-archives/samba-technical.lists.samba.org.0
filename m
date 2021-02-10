Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DDE3173A1
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 23:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EOXELKtUQF4NYVNNk8KvJkz8CMlKR27U6unsCkuvXpE=; b=iETO3sxVSf8PooyDNtbnykDeq1
	ISn/+sMaecDj+spY7EfbKgR8gbtAfYgyy0zWGe3uNOM/c7xgFBFG4OfTZDQV87Kooiq5oy0+N1LS0
	3GOFXW1mNz2yu9vKUQIyKmKIph3fhzzTeelAFXJh49oJ5OyuZouGd5GdkaxAfcPZZaNkbKKWq6Lx9
	96x2OgBx/s5CRZtY/mQvWgNtR9O/ZcP3noaRsUqk5FAURLxwBZh5G4eqqHAZaBPsOFoNbIV2+usl/
	oJE/ZMebHDu3az2ebtOJfNcpQWO+iuWgB3e3lFqoIzaf8Uuj2Fr4MTyrbouVUbI8+J+MLwSjwlx0d
	DPNrFdEw==;
Received: from ip6-localhost ([::1]:43402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9yFa-00C80c-Hf; Wed, 10 Feb 2021 22:46:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28858) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9yFW-00C80V-5Z
 for samba-technical@lists.samba.org; Wed, 10 Feb 2021 22:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=EOXELKtUQF4NYVNNk8KvJkz8CMlKR27U6unsCkuvXpE=; b=jK871qp9XMilfp5g4z3lWm4w76
 rjNpKGvy+gx3DdoX/ablFnvG6Kd4EjQRViqiyc1wf/e2LchBKMxL+elaf24Hwj1js2a0hvI6AoRFY
 snU+YObs/f9jzYTFJMJU0lx2ZovzzoY+z26ArKnxxJEkqNwJ9kEmYKhML5+L2TIeCuL2eTci/IP+Q
 ZP9OHh01jz9sebChMloMBykl9iJ5QFkuiDaLdacIL3qe6Os1aQ5oR9lz1OeLVKhEr9tDfnMgLmJ0P
 vRdroN73CElboLFmtnpFbHG7bjRWaWZHBFgVZl7k8ckVC1naf+u1izAYBaq+1OoMB/LyBmStuFHTT
 Duczrciv7b9YXXLq/BDpsl2QYKCAufiHazTcxvwm8/sWfvS7bh6puWNco3ZaKhbnWvVxL+AooWF2q
 /fFdYJCKBqftkTGgL0fEOm7CL+W7ZBx9aundCsJbKVlo9kWmdhRtAqJmlYrhL3zhT4tu1x9KytWuO
 4plr6Uy5H631q7x5Kzpu9kFJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9yFU-0006qB-UB; Wed, 10 Feb 2021 22:46:17 +0000
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
References: <E1l9wbe-005h28-1I@hrx0.samba.org>
 <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
 <20210210215859.GG328304@jeremy-acer>
Subject: Re: Conflicting public symbols... (Re: [SCM] Samba Shared Repository
 - branch master updated)
Message-ID: <5364e8cf-f322-2dcf-3f88-8078bc54b3a1@samba.org>
Date: Wed, 10 Feb 2021 23:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210215859.GG328304@jeremy-acer>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7FsnWNLYC4Wu4DLgq4uMJ2GZ0myhFx4zk"
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
Cc: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7FsnWNLYC4Wu4DLgq4uMJ2GZ0myhFx4zk
Content-Type: multipart/mixed; boundary="lMrErdeUYdPcWgfjfsEaefTYiIm2dAlhY";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Cc: Alexander Bokovoy <ab@samba.org>
Message-ID: <5364e8cf-f322-2dcf-3f88-8078bc54b3a1@samba.org>
Subject: Re: Conflicting public symbols... (Re: [SCM] Samba Shared Repository
 - branch master updated)
References: <E1l9wbe-005h28-1I@hrx0.samba.org>
 <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
 <20210210215859.GG328304@jeremy-acer>
In-Reply-To: <20210210215859.GG328304@jeremy-acer>

--lMrErdeUYdPcWgfjfsEaefTYiIm2dAlhY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10.02.21 um 22:58 schrieb Jeremy Allison via samba-technical:
> On Wed, Feb 10, 2021 at 10:36:18PM +0100, Stefan Metzmacher wrote:
>> Hi,
>>
>>> - Log ---------------------------------------------------------------=
--
>>> commit 551532d007970ab11dca71b532754728a6a78496
>>> Author: xzhao9 <i@xuzhao.net>
>>> Date:=C2=A0=C2=A0 Sun Jan 3 13:02:18 2021 -0500
>>>
>>> =C2=A0=C2=A0=C2=A0 s3:registry Renaming get_charset() to smbreg_get_c=
harset()
>>>
>>> =C2=A0=C2=A0=C2=A0 Rename to smbreg_get_charset() function to avoid n=
aming conflict
>>> =C2=A0=C2=A0=C2=A0 with MariaDB.
>>>
>>> =C2=A0=C2=A0=C2=A0 Signed-off-by: xzhao9 <i@xuzhao.net>
>>> =C2=A0=C2=A0=C2=A0 Reviewed-by: Jeremy Allison <jra@samba.org>
>>> =C2=A0=C2=A0=C2=A0 Reviewed-by: David Mulder <dmulder@suse.com>
>>>
>>> =C2=A0=C2=A0=C2=A0 Autobuild-User(master): Jeremy Allison <jra@samba.=
org>
>>> =C2=A0=C2=A0=C2=A0 Autobuild-Date(master): Wed Feb 10 21:00:28 UTC 20=
21 on sn-devel-184
>>
>> Do we need a bug report to backport this?
>=20
> I'll create one.
>=20
>> There's a similar problem reported here:
>> https://www.downtowndougbrown.com/2021/01/tracking-down-a-segfault-tha=
t-suddenly-started-happening/
>>
>> Does anyone have time to have a deeper look?
>=20
> Looks like "-fvisibility=3Dhidden" is the way
> to go here.

readelf -a bin/shared/private/libsamba-sockets-samba4.so |grep socket_sen=
d |grep GLOBAL
   119: 0000000000013386   186 FUNC    GLOBAL DEFAULT   13 socket_sendto@=
@SAMBA_4.15.0PRE1_DEVELOPERBUILD
   126: 00000000000131f5   401 FUNC    GLOBAL DEFAULT   13 socket_send@@S=
AMBA_4.15.0PRE1_DEVELOPERBUILD
   257: 00000000000131f5   401 FUNC    GLOBAL DEFAULT   13 socket_send
   258: 0000000000013386   186 FUNC    GLOBAL DEFAULT   13 socket_sendto

I think we need to find a way to drop all unversioned symbols from privat=
e libraries (at least the once
we install with 'make install'. So that ld will never pick up symbols fro=
m private libraries if applications
link against out public libraries.

Does anyone now how to do that?

metze



--lMrErdeUYdPcWgfjfsEaefTYiIm2dAlhY--

--7FsnWNLYC4Wu4DLgq4uMJ2GZ0myhFx4zk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAkYjMACgkQDbX1YShp
vVb6rg/+M1Elhht2FtviefxtSOyr8qrv2an83WFWmN1CPtdSDJjLx5Ou6tWVWZh+
YEDuvqQt8RFAvDq0054q19Ib85gYV1ZrLAnCtg3R+toGgtwhD+lpGJHeO6DizxH/
a1FWMpheEdB6Aew9J4l76Q4J4x/pkyAiyuKO2PCmEVEKxTZsIgQM/4JdDBX0SV8K
egGWqZER3Y0OCyGnZEQOu4gQ01jj+c71QyDtZ9Q8mRryhNz0q2Mnj1jhpumcIHlf
jZmj/F4J0A3r0BBZaI2SU2+xGAcEvUrM4pKlZ6UpQw2TzrqKPtmwwmbJmx51jgWE
3h/92qx8Vo338Zg66+1guzSxMfpCTGYN0Pl5lZjz7ZZgPtYxqb+SR4NcNFOUqBGK
3YuKq1lkYb8XzVit5Od24KfrhqPaLZrVG1QU3ca48DriuG1skIiYesBjdeg9tSO+
L0IEo4DPqFg7boGW7nBauAOFXX0B4zfJfapKPxWTNcDNfB1IhPuzm3sDNUtkrU65
m6n0SjdBIZEvGq6+QtLpuqfsEGSfDxqIuNbc8nvDQ/pUvelI2pCo2ttdJG6SkElp
zzC6mjRlzfRoJYTwFeHSSyDa5wSJUGWo0V4ViSdKqiPolNhI4Emue3RJiO3Xo8xG
3luR5pi229Xz3QHQSWvfttwlwPcwTm9plH0dINU5KNGuLNobU1M=
=oLL9
-----END PGP SIGNATURE-----

--7FsnWNLYC4Wu4DLgq4uMJ2GZ0myhFx4zk--

