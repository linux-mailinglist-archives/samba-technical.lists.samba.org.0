Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AC59F5715
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2024 20:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=f22HL5gpkon9dTeKpgexWS/AAUlUTb2ka1v0JukniNo=; b=PVaqzhCtYSiGuDuMRim1t4o8mk
	nuqAN1oRJFlMtuIMbC0YIcbGRthfSalL3/V+h6AU479JIVNFld2KoekD5sGpZOb7TpXNacK4sJ1ns
	YOtB0BMLA6kr3dO9T+IUNtrlXiUnRZvFwZ0TojtwsY+wRJO7c4gLAg8snfyRsbalAV4OWg70XSu63
	OK/PBgBsY0+gvgm0cuIKgoEASxbap2MusKdk2jnF0VlW+FRB56b1TMiRLs1ZO1buzGWBd/2ifqfr1
	ZUdtVhDJJu5R1FS+m7bleUVNOo+7y0GX8LI/np0RH/htWb7VNbgMuMUDA2uJWWa+InsDxsDUdRjUJ
	IYXWRMng==;
Received: from ip6-localhost ([::1]:42586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tNdVA-004Uzg-Vq; Tue, 17 Dec 2024 19:45:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:48218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tNdV5-004UzC-TL
 for samba-technical@lists.samba.org; Tue, 17 Dec 2024 19:45:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso6169248e87.0
 for <samba-technical@lists.samba.org>; Tue, 17 Dec 2024 11:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734464698; x=1735069498; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f22HL5gpkon9dTeKpgexWS/AAUlUTb2ka1v0JukniNo=;
 b=LESPYw5zceH2nGb08a6TU1RtMQMW2gKGAtsXPayWxwtuGvXswc15TLAQwzu7Y+Ejym
 AfUarpCe8LY7S5m9JDyTJwlAxwzaZkum46MHBByMYomaYBry0NbLNwozx7HCZ+smVpM6
 ivZuM6rtFdwG7iIOAYyMgw8DwWNBPYV/ogiEEPOKLpQYT0I66LZPwvJ1ZHgMx6Gginl8
 y63AfpbzNAz3MCBKVw0crpJqsxoLvQJKHS4oS2cGJRxNOiF74ux3w1FHuxfTpljD45bv
 gvv4rrS6VB1S0nCeX6qcgZ1y65mPqeRw1saBf12cDcGwiyO2DzhrbYWoe1S0iCRcQaFQ
 DiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734464698; x=1735069498;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f22HL5gpkon9dTeKpgexWS/AAUlUTb2ka1v0JukniNo=;
 b=lpVt53DFrcwGDgoVIgENpJM/LnPH85q5IeVxzWkU4CLMU+7xdulwqMFrQ4TNN883q1
 4lzLCt7kjn+Hzjx+3+tFF2zcTCRVJbiRTM3BrwBMvKnxbzO02TjEAqlMzbClmdCxv9pR
 EqQ9B0QSdPmtX8Y3ffTNWlMMumWp3SVq+d1d8AfsbyZzh4CfYZGLbiRJrdXNdHEMQH4T
 e78zmAOClmzbVbJOHiT690aXggkki9RWiKeo7wNHFyiKkAJA9fmA3PvFVSvBQeoAsgMf
 JZ0mnI6Y7vHfxpa0TUqaih2QXwiUbUjOcqtVgd71ltaYJMJd4fcOrof3WYz81vop56R7
 CW/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfaga6tng7zq0bHq0Ee/4gdOSb/BoMoLgsJkZ5utYSQ6bvuzsoNGJ5lGdE3JfCbbOuedLMg/qSF9mJhr9oa28=@lists.samba.org
X-Gm-Message-State: AOJu0Yzuguss4SFOKcRZ9yyEi2J+VT8QOT2BEjSMZ00wsgJimC8KHNWh
 CBw9fMNW4Pju12RtHVlhbEcwOKXXC/qnWjr6bMbmLE2JJOUr3n4/JiFgyI9rrtbzIFLKxn1ajel
 9Y/BvoVu40F3Jm8eXjOLFMPoBWLmZPw==
X-Gm-Gg: ASbGncsGPJBz9sDtHLznvxXODipbvJP95MNLp53dnMqiKX9msXy0nk1PMYAR6Gp1O4m
 d4Mvsiy9OwRoEqgkbVWeXXNXE/MgeDDhFc0CRQ4LPr2Ufst3b8CsTFoF+N3xS+qS9FDZmi1TY
X-Google-Smtp-Source: AGHT+IF1nXqvs58oTofaVWDDwLovRaku8gSvBcTPCFZXJbG01IddUoietGed7rjgiN70w/10suvRe1C+OZrNvbiuo7w=
X-Received: by 2002:a05:6512:b97:b0:541:d287:a53b with SMTP id
 2adb3069b0e04-541e67473c6mr90611e87.19.1734464698185; Tue, 17 Dec 2024
 11:44:58 -0800 (PST)
MIME-Version: 1.0
References: <011da8e5ae7537ad188cc49cee6f96e09eb1b8db.1734427173.git.dsimic@manjaro.org>
 <CAH2r5mt61UvqdE-15ndegOHROObk0CfcZxMnTZeSn9oJymY=YA@mail.gmail.com>
In-Reply-To: <CAH2r5mt61UvqdE-15ndegOHROObk0CfcZxMnTZeSn9oJymY=YA@mail.gmail.com>
Date: Tue, 17 Dec 2024 13:44:46 -0600
Message-ID: <CAH2r5mvyCvu+bjak7abXiBxK2k-a8AOJFNnD6tDx3k0BN3XrVA@mail.gmail.com>
Subject: Fwd: [PATCH] smb: client: Deduplicate "select NETFS_SUPPORT" in
 Kconfig
To: LKML <linux-kernel@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Dec 17, 2024 at 3:26=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Repeating automatically selected options in Kconfig files is redundant, s=
o
> let's delete repeated "select NETFS_SUPPORT" that was added accidentally.
>
> Fixes: 69c3c023af25 ("cifs: Implement netfslib hooks")
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  fs/smb/client/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/client/Kconfig b/fs/smb/client/Kconfig
> index 2aff6d1395ce..9f05f94e265a 100644
> --- a/fs/smb/client/Kconfig
> +++ b/fs/smb/client/Kconfig
> @@ -2,7 +2,6 @@
>  config CIFS
>         tristate "SMB3 and CIFS support (advanced network filesystem)"
>         depends on INET
> -       select NETFS_SUPPORT
>         select NLS
>         select NLS_UCS2_UTILS
>         select CRYPTO
>


--=20
Thanks,

Steve


--=20
Thanks,

Steve

