Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F712D9E14
	for <lists+samba-technical@lfdr.de>; Mon, 14 Dec 2020 18:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=S1kiC1ut+mhFCRAhcsLAeVn8gYDEYs9XFKw5gyZy4oE=; b=EEO6teF8h2sFjYqbCuF+ookKHb
	RvTvloz7lEpOENzcogO+6kBnzmVahK8rGGQzrKDxqFU0qT7rfqdqOXM82QqDXQfJd1UbMtPuegCKz
	OcTB0ETPCp/QLWWieLrV0OqYADtOXud7Eg67Mc5MUZcpzGEJzYKNrSaRAJxCaHyhvBohRzolwm2cg
	ihGLHi3g65RUnv7dp2Cz/lfpa6+QInBVpKQZZWX1l7IfQrigWCcjNAO5OZvXH9+FCyCJDlW+wrugB
	bY+Egen5lYHRaiwFsN/Vc2SYu+Le8kGU2Y+6AzTgKJrfwcpcKAqIo57HQruPHXibfzwzezbpUSnxP
	x6Ved0vg==;
Received: from ip6-localhost ([::1]:51452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1korvY-001AN5-5a; Mon, 14 Dec 2020 17:46:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1korvO-001AMy-Ic
 for samba-technical@lists.samba.org; Mon, 14 Dec 2020 17:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=S1kiC1ut+mhFCRAhcsLAeVn8gYDEYs9XFKw5gyZy4oE=; b=Juy8/UH7Sz7tcqnk5fs+Mnk93D
 bgaYK7SzJe3vqV7/6C/vv/QO3eU7ioQNOeih0ubsRVqm54uEcdNLxKl6iSGbp5FVgW5t7Ys7AiVJ2
 wfjkCi3lDatIW7cEAXO3de8NrZLgWdvPO3kwK1FHXTigAv0LUTGwFSCB848MQq8kw9bQawAa0sLLN
 Dy/T7YfbES+f7WjwIDhH6rwE7wZKplPOmeUXbyP3OeCzPnkRstRpFzofmgRXKAiwy6zS/GNuuTo0O
 CWdSQwDTB4yxzhK3clqXtB9jhvICmL1n6Bgcn3+1y8y40sH2OJezqBhasOGJwaB8a4npxts2D5hBm
 hlr4ylzmqQeH7rid1BuGxRqPaY/f5LY7bEZRUJ0/txPfL9phpk4KkkLbjD8jMY3t0/jJ1hsIDn+53
 WiPb+YHFN77MEseAR4gLhx3ZMFd2N3VL7+Kh3vqQ7ITewZTFr5Qc7GA3WRZm01IvnVE7g/ZTl4qZu
 jdfVhh6BJs57rBCH7BaPC0p1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1korv5-0001a4-Rp; Mon, 14 Dec 2020 17:45:59 +0000
To: Steve French <smfrench@gmail.com>, Namjae Jeon <namjae.jeon@samsung.com>
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
Subject: Re: updated ksmbd (cifsd)
Message-ID: <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
Date: Mon, 14 Dec 2020 18:45:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="gxgJCBOBRIyAZHwatUnd02dKxfxuPOr1p"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gxgJCBOBRIyAZHwatUnd02dKxfxuPOr1p
Content-Type: multipart/mixed; boundary="1FhrrPgeO6ROvl6OCmLZfSnqR3io7hrih";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>, Namjae Jeon <namjae.jeon@samsung.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <3bf45223-484a-e86a-279a-619a779ceabd@samba.org>
Subject: Re: updated ksmbd (cifsd)
References: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>
In-Reply-To: <CAH2r5muRCUzvKOv1xWRZL4t-7Pifz-nsL_Sn4qmbX0o127tnGA@mail.gmail.com>

--1FhrrPgeO6ROvl6OCmLZfSnqR3io7hrih
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 14.12.20 um 02:20 schrieb Steve French via samba-technical:
> I just rebased https://github.com/smfrench/smb3-kernel/tree/cifsd-for-n=
ext
> ontop of 5.10 kernel. Let me know if you see any problems.   xfstest
> results (and recent improvements) running Linux cifs.ko->ksmbd look
> very promising.

I just looked briefly, but I'm wondering about a few things:

1. The xattr's to store additional meta data are not compatible with
   Samba's way of storing things:
   https://git.samba.org/?p=3Dsamba.git;a=3Dblob;f=3Dlibrpc/idl/xattr.idl=


   In order to make it possible to use the same filesystem with both serv=
ers
   it would be great if the well established way used in Samba would be u=
sed
   as well.

2. Why does smb2_set_info_sec() have fp->saccess |=3D FILE_SHARE_DELETE_L=
E; ?

3. Why does ksmbd_override_fsids() only reset cred->fs[g|u]id, but group_=
info
   is kept unchanged, I guess at least the groups array should be set to =
be empty.

4. What is work->saved_cred_level used for in ksmbd_override_fsids()?
   It seems to be unused and adds a lot of complexity.

5. Documentation/filesystems/cifsd.rst and fs/cifsd/Kconfig still referen=
ces https://github.com/cifsd-team/cifsd-tools
   instead of https://github.com/cifsd-team/ksmbd-tools

6. Why is SMB_SERVER_CHECK_CAP_NET_ADMIN an compile time option and why i=
s it off by default?
   I think the behavior should be enforced without a switch.

These are just some initial thoughts.

metze


--1FhrrPgeO6ROvl6OCmLZfSnqR3io7hrih--

--gxgJCBOBRIyAZHwatUnd02dKxfxuPOr1p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl/XpM8ACgkQDbX1YShp
vVaBSA/+MqbIrA/jiGpW6HYhD1IdKGNvlRnJErWMsIe0CjtGXiQhlutSDqMcHkic
Uaa/8D59S4rrXIbbcKFj51vvvvg3SZ0j1CNeu7sDOZFJbI3o6UtaC9rX/2tXW3Fz
zAhSBw01mD2Fs/EfQi3clLPIMW6pSwk7NRUot0CV5vY1LaVm8NFjeQMskw7ewI7Y
bSrwZUoHzWT2zidD0XEpCymlS5FiK+H3FjMw8J6DhqxPn6r+HAQ3iO3BRhH6M1iF
+DSDhLgSrysoutnViy9dtwyQQPj+YtT3bZnYJy0SmnaWzVbkrVKBeYdfoKDFQjDp
LXE4N0ikYpcycHXeCAsaBAsS9wbnQ5hl9O654sCtSommyJKdG7J3mfvT5TOQITS1
9IV8aZ9S3oks6EX8gp/FintbxGm5dG3vHrr1YDXICg1sBE5WonRS9TdhlsEkNJ45
BR5/b035Mcwiqmi5sSTGAVWDTic9YRRNkWwLz+NZ7h2rMgVd4MAhNk7bDRC8yhb8
vWhrbMhRhd5R/C0GUXeCnie/y8rcL3N7mLS6VGNYYYjCDGrP7cMz6PmSEI9kyPJY
rfRYuqTQbGVSGuH3SbGGKpmxN/nFTr3F6UDEm/g6WY8Ja/m54Yclxr/evXjlLfef
JKAXGoHjcj6mOdXZ1cYs7Vz3zxkcejsF4C0PZJ/FQzf9r8nSElw=
=+sXE
-----END PGP SIGNATURE-----

--gxgJCBOBRIyAZHwatUnd02dKxfxuPOr1p--

