Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FAA24263C
	for <lists+samba-technical@lfdr.de>; Wed, 12 Aug 2020 09:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GLVJ8YAwUxbdlIa6qV2xqQKlyfcWGM2GHWNhVPWIQ4Y=; b=It9vp8o6vyaW4gNiypGHfBGBFL
	VE5cd8435E3XFTqeRIEGsq2eiCFtjLytXQ7tmb/e+3Da2KJlV18uFn+u2OAPOTs1JBnkOtwyp6P6Q
	kG7P+FSM11wvNfblLqr+q8AL3e20Xm8vtJINVvLdyQzoOYucstYSKiwbno5Pzg3HSJboVmCXWHzUK
	Q/FNNgaXgByPNlctz438dy2fYB+b7Gep0R+ITeBZu2rTgbOl6uZH8A+YwIKOERLZ11nVGHXrJ/ONf
	aINqqpfL+sPsH9oWg9vdm5iOeStAG3vVe30bxUOsgqX8d9uu8CcqIzV0ZzW5coy+KylF3oan3JSfT
	vtqk/1/g==;
Received: from localhost ([::1]:23016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5lQj-00DJNu-HQ; Wed, 12 Aug 2020 07:44:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52772) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5lQb-00DJNm-Pr
 for samba-technical@lists.samba.org; Wed, 12 Aug 2020 07:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=GLVJ8YAwUxbdlIa6qV2xqQKlyfcWGM2GHWNhVPWIQ4Y=; b=kqveTRuSguGfaZZo4gAX5dGYc8
 o2+aXF/xukiKHE1VdRYPcp+UB9fyikizfzc4nZa1wL2KhnYOaQKtGzCyHF3ryacYA2TZTeRfgV0v2
 F44maPGLwPHX0FrX55ykewXS++lnH2RWyW48rZUfn4DfVJEWUkn19lDkhYNkMPF5SPtvkJJ65kDAj
 KOO+HPSqzCVYdZeqIu40fujbCB0EM3+L1LhgoE6PlLdZRNQj4VQPgBX+6HMKan9MRVfWCcOhwGOvQ
 IvbdJkE1jbtHkFpzGYWonEm9hLucE9vIjo/c2sZHdb9jyiWT5qlYtFt2g5h5HXgjJcECGqBZx4t+T
 U4VHX2nMu/6oBSrJpQnyTfX3g5q3F+651+y73QRIPQAos+YaJjgR3gHD309Ct9cTS3p+dCVN4ZZOM
 ujo76hmfp+dgUSefp7/A+aj9EZmk5ZHrdX2rQcS10KlIxWFS+pmZDA8jKP5q6tIf/bQJyUcTaaBou
 4cmEEmS4LfMe+4Enp4joDxjG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5lQb-0001nP-Al; Wed, 12 Aug 2020 07:44:05 +0000
To: Matthew DeVore <matvore@google.com>, samba-technical@lists.samba.org
References: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
Subject: Re: Creating a VFS backend
Message-ID: <0f42582a-eee8-5e05-a55a-1f1c80f11845@samba.org>
Date: Wed, 12 Aug 2020 09:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="YNHbavlvojtrCvHhF7ncoOaR8xSbYy0Ky"
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
--YNHbavlvojtrCvHhF7ncoOaR8xSbYy0Ky
Content-Type: multipart/mixed; boundary="aSVgBBMYqlHnEXfDyKdtZTUTzuJPQrWhh";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Matthew DeVore <matvore@google.com>, samba-technical@lists.samba.org
Message-ID: <0f42582a-eee8-5e05-a55a-1f1c80f11845@samba.org>
Subject: Re: Creating a VFS backend
References: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
In-Reply-To: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>

--aSVgBBMYqlHnEXfDyKdtZTUTzuJPQrWhh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello Matthew,

> I'm investigating using Samba to host a custom filesystem which
> currently relies on FUSE.
>=20
> To get started, I wanted to make a trivial VFS backend which exposed a
> few hard-coded files in a single directory. Samba is invoking
> connectpath, get_realpath, and some other methods that I've
> implemented but for some reason it's giving up ("it" refers to either
> Samba's smbclient and the macOS SMB client). It never seems to attempt
> an opendir or openat operation.
>=20
> TL;DR: what VFS operation did I omit or implement wrongly that, if
> fixed, will result in opendir or openat being attempted?
>=20
> Here is the source code: https://gitlab.com/matvore/samba/-/commits/vfs=
_hello
>=20
> Only the last commit is relevant - the others are hacks and tweaks to
> make the code work on macOS. Detailed output follows.
>=20
> Thank you,
> Matt
>=20
> ---
>=20
> This is what I tried to do in smbclient:
>=20
> $ ~/samba_build/bin/smbclient -p 8111 //localhost/sambashare
> Enter WORKGROUP\matvore's password:
> Try "help" to get a list of possible commands.
> smb: \> dir
> NT_STATUS_NOT_IMPLEMENTED listing \*
> smb: \> ls
> NT_STATUS_NOT_IMPLEMENTED listing \*
> smb: \> more foo
> smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost=
]
> NT_STATUS_REVISION_MISMATCH opening remote file \foo
> smb: \>

My guess should be hello_create_dfs_pathat or hello_get_dfs_referrals.

> Here is the output of smbd:
>=20
> $ sudo ~/samba_build/sbin/smbd  --foreground --port 8111 --debuglevel=3D=
1 -S

Add debug messages to all the calls, btw. you should use
DBG_{ERR,WARNING,DEBUG,...}() instead of the raw DEBUG() macro.

And let it run with log level 10, I'd also skip the -S option.

Also look take network captures on the server side
(because the timestamps of the capture and log files come from the same c=
lock).
and check what requests are sent on the wire.

With that you should be able to make progress.

metze


--aSVgBBMYqlHnEXfDyKdtZTUTzuJPQrWhh--

--YNHbavlvojtrCvHhF7ncoOaR8xSbYy0Ky
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl8zncEACgkQDbX1YShp
vVYJNw/+IvmkCdD6pK9lpFFn6MxY9aGJpflahXS3sG7Xwbi5dapEcUVEJDb8m+sJ
VrtQtBnY63XB4d/X3RpJ2sVVRc5HCd8O/yVsonS0r0F7abgiNdNqipQbguodDuay
xnIxw9pf+DtmF1iN0oACCeinbIouvf248N5uwsO2V/55p+0jQTQCeMbOnsJhgJ/T
iOI5xhDvi/8LwG5i2BajQVpKjUSLNkLf5gUletWZUXM2CX/SPQNLydlXqykAbrW0
yqrhEOh0vVo300msYMsO4VuFv/V9YNE5MhALJh0t4kZ3elbqEX7jF1p3nfo0C0+1
mZYwSBnQ3DiKOaafwM0TgAZLRufZPNmt+d9aX1iLDckMxxuKI82VfBiBMy3Dq7Q+
k/kMcRbUijOQnG/8gYhtWWv6dsxCflEZuRcowd+w5T8B4DHiOZdSjnnk/8lfkpAM
RZeWreOqzZbubzh3GnyeknupVrn2HXqbje+v3GJ5k9e96GO1qZY6K53eyOvIHjIq
tHwLSO0GMAeyixJwTVYMTTA5HJnc+G590XxuuGkySHqSUH+KMoRVkxrU8rfaU5u+
JUFGRiOc/NB/6H9gvSOhznsGBTEPw3cf2iRRxHaADb9aGQRIChFL7/SfKdq4kbH1
50amIYHNf/7gPnKjQvV5NoGukwalZgtzKZOe548tiETtZTXjLzo=
=NLAi
-----END PGP SIGNATURE-----

--YNHbavlvojtrCvHhF7ncoOaR8xSbYy0Ky--

