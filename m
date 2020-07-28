Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BB23042C
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 09:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VK9cUBWp+DhX2c4Y2SGRaLW1wv3LYtv//C/KLCfLQP0=; b=vE9kS7gSmvXDaDoA7FpGnrS9I9
	0pgNfn8PVmESvGrCXYfnYX2BT5nOWUUnRGtsYR+YlTu+zJ3AwWLD1DISwZhsx7X3wEwEQ3TTO0LjM
	cqHrXziC5HP86yR5Bd98YWBBGvoX4vEaJcobZHVCudICZqBH+6yCZYWAZiBq56LlTfB29ICRYZfxW
	y0qXT9bLOeLAPqeyvKlKA1eo6PBIAcraDj6amoqIv5cFObbLXU1X8Qsok7gY7lH4hhTVyeVQMWfI1
	T/49yMhjOsrzWd7k3NoDzBb5ycDRpwTprsQxFoTYYD5+Ru8WjGkaHTkoFV9AC0OHvkFR4N9ancEde
	bTFuiqzw==;
Received: from localhost ([::1]:55944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0K7I-00A7Su-Aw; Tue, 28 Jul 2020 07:33:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20742) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0K7B-00A7Sm-0X
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 07:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=VK9cUBWp+DhX2c4Y2SGRaLW1wv3LYtv//C/KLCfLQP0=; b=qAUDcwf98I2ibBwp9uFEh4xb+R
 aruvPo4rp9DgAOYJ06RI0vZA0kF8p7ClCmpIiIdEnVyya/ktu0uH6NRhT3iePbIsCfnR3EUWZ+eQi
 IRF6Di91NcO0+NKl+UhX1aFoozIoe3s9HWtnqGbGWpgU9SbrZPUE/qWwrsze2tGz0n8PRKCarGilu
 rncdyU58zf4p0z3VxghuGHNcA/SXDS9FrMaY5p5kn6kXHqkQgXTV/6i5LLUJbsJpkf8JeYEVNFaSt
 K31Kz+AoMqk5XNi2+2ltNcS6ixDYfnkNslS4t8fg220xrhdyc1BtPAoOvjjFcE9z4KSFAejYQi6uq
 V/kmVqyXvdp7lb15aB9NllykK5vDMIahm83QF17enulOmedzfzNqJCfgtM9lrVhsUbPqk6KETE1gI
 SIpYt5iTLNopcYAIoyJwaWBRpZkY0jFzqdFfMDftDTQqw+C+ZE9TH0ycS6edQ7pNjoohccHDc4fVC
 ChYpjncASmDVGFKHYyRBOrTZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0K76-0003TO-Ax; Tue, 28 Jul 2020 07:33:28 +0000
To: Isaac Boukris <iboukris@gmail.com>, admin@prawda.net.pl
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
 <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
Message-ID: <69868d2b-4365-ad14-7238-0b92de9309e9@samba.org>
Date: Tue, 28 Jul 2020 09:33:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="DGgUB5pYUaMW4NqUszf32fqPYDCOpNOap"
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
--DGgUB5pYUaMW4NqUszf32fqPYDCOpNOap
Content-Type: multipart/mixed; boundary="MJnAxWgDFUYpaVYlP51ns3thNlqIvgDXh";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>, admin@prawda.net.pl
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <69868d2b-4365-ad14-7238-0b92de9309e9@samba.org>
Subject: Re: Samba migrate from ver 4.11.11 to 4.12.5
References: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
 <CAC-fF8STW7otKinVGG_w9Ut17qODzD0KaxK+P7VDDZbJz2G6ew@mail.gmail.com>
 <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>
In-Reply-To: <05853c98-f6a0-5f71-26a2-b4eee9f8dba4@samba.org>

--MJnAxWgDFUYpaVYlP51ns3thNlqIvgDXh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 28.07.20 um 09:28 schrieb Stefan Metzmacher via samba-technical:
> Am 28.07.20 um 09:21 schrieb Isaac Boukris via samba-technical:
>> On Tue, Jul 28, 2020 at 8:57 AM admin--- via samba-technical
>> <samba-technical@lists.samba.org> wrote:
>>>
>>>
>>> I thing I have problem with encryption, ver 4.12 not supported DES an=
d I
>>> see in log:
>>>
>>>   Kerberos: Server not found in database:
>>> <mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
>>> ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3=
 not
>>> supported
>>>
>>> How migrate old database encryption to supportet in samba 4.12?
>>
>> It's technically not possible to convert DES hashes to another encrypt=
ion type.
>>
>>> Change user password not help.
>>
>> Try resetting the server secret and regenerate its keytab (ldap/debian=
).
>=20
> No, I don't think that's useful.
> Adjusting msDS-SupportedEncryptionTypes for debian.prawda.local from 31=

> to 28 should help.
>=20
> @Isaac didn't we had a fix and a bug report for the problem already?

Found it here:
https://bugzilla.samba.org/show_bug.cgi?id=3D14354

@Isaac should we just push the patch I attached to the bug report
in order to have the regression fixed in master and 4.12?

metze




--MJnAxWgDFUYpaVYlP51ns3thNlqIvgDXh--

--DGgUB5pYUaMW4NqUszf32fqPYDCOpNOap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8f1MMACgkQDbX1YShp
vVY48Q//RI5BdlobqydZ69CpPz3eGU6xBUPE7xgobpuQik4o/zs1XA7Gb+6J03Qk
yLSRt5gbZ5MlFdKeT0Cz7tI/6Md/WkO/hUmDMH7CJpt9BAU5tKAYYnm25IMX2KS9
dFbbaEKsIbFiEQxV/0KvrEQ46/1dYbaBituS5VzOc5Zv56MIfn5hl4zIN9BV2PDk
DnyNtC5DLnpkz/NJHDaIn795K7xN6DgFMJ2DdrPnAVNztCsxzyDI/+HtO3EYhSm6
bzRwuyvwTPRZ/O8qfGzDbqSCkkd3OBVCrHIsrQkhJT9ESbNrbJ62u8dHciBxI2m2
Qqns7bJXVpjV8OyOunmQScJm3SaEhavEGCcZ4N+rX8QcMxbMLe97mSKwR2vptJW0
7Edef7e7ZOg+ngFJwv203vpgaTQ1qdWX1228nDEzE7ygTyzC+CYtg2OiVICT+UHv
qUHG36eKrUix5jifJsa+hLfjq3EDLPXytf9V8v4dknIWO6+igYxYCkYnndZckk0s
zJ+MPs4uZnzAk8isA/ztLzzxpHM5JJxH3Ss++G7/YiRFl2A2of2BEJR/9EQ4NPN6
wIgVBT50bNoRM1j/dsZi/FStY05PZ4ITu5N6aoRqt+k+su0n8T9bqLboGitV1P5n
mMhsPxiusac/k4suoFNNoKL3DQutncrfyong2kdpA5mW/yNr15Q=
=fXBL
-----END PGP SIGNATURE-----

--DGgUB5pYUaMW4NqUszf32fqPYDCOpNOap--

