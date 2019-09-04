Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534EA7F1E
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 11:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Q+kZZdqM1SqKyLL3loaha6b0v5yAWGIUYM8o6dxlLyM=; b=ukiX8YsxjZ9JcdbHRa5jvjSgtg
	2p6d5WKpjaWBjhXu0FkeRdcSVEHhPFHJ/tyqP65OPaTd4XNJ2uoJX9tUarLHW0X4oe3E/GQP95vUF
	GJ7KnZPYmHNIMyvpKWrwFp8eqcO6YcxGJK5OvDbS7GbLFcxMVqZ8Et9VraVTUbZyggmfoouOFK0Zb
	zQKiSsEpfymzcDXbX4g4vWIeWFEgSnh/iWj+y5xiDaBjd5Ku0zUrQYyL0vw6FkFU81qwHPFSwf0Qs
	J/MhxHlY++HCXhdVAMPnSOzKCWcaLxgheF+9JQ+gGoutPrqn/3RV+SANtyvM4U97oxpW7Flczd0N9
	TFBE+K+w==;
Received: from localhost ([::1]:46346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5RQS-003Lwa-VQ; Wed, 04 Sep 2019 09:18:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5RQO-003LwT-Se
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 09:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=Q+kZZdqM1SqKyLL3loaha6b0v5yAWGIUYM8o6dxlLyM=; b=sgWfOJi4Ta8plA0hy73nOOymiz
 IWFmGM/MMQ1MPOZUON7GnmRH9ggrtXSW7sYjoPOlSQ+VmXooHjV10vM8uUHpTKVhETwPgWY/iLkx4
 IxgiH9lTCCmQl1izl0RT0sZPX6bmG8eJB3JQR0Cc+JF5zBDyQZP22TFBXA6TeKV+8N4Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5RQN-0003jL-8o; Wed, 04 Sep 2019 09:17:59 +0000
Subject: Re: [Announce] Samba 4.11.0rc3 Available for Download
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
 <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <f22b0ebb-ffd1-0cca-60f7-81622ace6ad6@samba.org>
Date: Wed, 4 Sep 2019 11:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9784VzliESTg6mbJj4bYQ1edq04AxFrG2"
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
Cc: Lukas Slebodnik <lslebodn@fedoraproject.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9784VzliESTg6mbJj4bYQ1edq04AxFrG2
Content-Type: multipart/mixed; boundary="peSOBMYiwqGaTomir6dMEKhfnWdTnrkcd";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: "L.P.H. van Belle" <belle@bazuin.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Lukas Slebodnik <lslebodn@fedoraproject.org>
Message-ID: <f22b0ebb-ffd1-0cca-60f7-81622ace6ad6@samba.org>
Subject: Re: [Announce] Samba 4.11.0rc3 Available for Download
References: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
 <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>
In-Reply-To: <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>

--peSOBMYiwqGaTomir6dMEKhfnWdTnrkcd
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 04.09.19 um 11:15 schrieb L.P.H. van Belle via samba-technical:
> Hai,
>=20
> Check again.=20
> I see 2.3.0 is uploaded.=20

I'll do tevent-0.10.1 in the next hours.

metze


--peSOBMYiwqGaTomir6dMEKhfnWdTnrkcd--

--9784VzliESTg6mbJj4bYQ1edq04AxFrG2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1vgUMACgkQDbX1YShp
vVax4w//VfPdIUOtc6aE3LlzBOMpNVbwNmgH+cuJx2d6NkqaWqifTpu/++Fn9jaM
UH6Pl+TyPQ/JZgHR3MKbuWJR1KnmWJwzbM+Z68EFxphgCyuQ8F7RgrTG2TcCBp7S
KQ6fu2PJPPnYVAI9woNd289EiAHDSx5JFZzo/mcp7gVAdkics0ht0VfeZlpPT2R8
+FmDohFYw/TJagzyRSV3Ou4HKJ9gK8S9vKL8zn+y3pELIKf1qEm+KUP7rsjkyUKw
OV06yZNDkUkRwFVLohuh+D+KHWu8eGfKpJRnCMQqd1+c9ZAyC7FaEv+y1RAiMvEC
nkHNCwlkHInJ8zqmZL/2SpxBAzufk1f0BnFhRmI/LeZCwtp6jDthBe/mFSUibsuM
jCfO3tIKL+ig02CJCDGsc4Z5rF0yqlLHkaYVhqZvXAiIL9aACcyUSGzO3rqGvGO6
fIq5BxlKGKJbN90nLbFa/zwxmMt6yxCVYmY5zUwXDxgHETPCogPx1KLQa9pmvtyV
dXlOtAdIkYnTJs0LqLEZmVHjwpTn6p3TLU4tUgBQ2++xPibyQ0mokMGT3M3x5s3K
NaQNPDZuHRzvdcGpV+4DVx1hxwu7H8vVeel8kAXamGKjtAzNlCVBX3esLAImbTkb
ioSGw7drzbzDVK14E3bpxV5OAc3I070B8lkKqW6E1M0n37QBJjQ=
=sMYF
-----END PGP SIGNATURE-----

--9784VzliESTg6mbJj4bYQ1edq04AxFrG2--

