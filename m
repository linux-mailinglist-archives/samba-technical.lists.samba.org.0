Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF09F56FF
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2024 20:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=U2GacLjc8FX3B74AudZ8c6vsq8B7+/8+n4FnAcM4NZ8=; b=lFmIJsY5Xf5UT3l2UFs3SGtZSh
	u4OYzFx5ScfbUNHJUt77aBUveI59opH/maVyzOV8xDEqLrJNNQCxVIez2+kNix/uJt7uJXhRjmuAT
	PqWtbTvISfWQ0klFXVr9/yyGcII16bnaZ2eFgZFhAZHWHt0qNTz19mPmLWK7pB9H585fKKAz+dajN
	4biBsnAxD1O3PH/EcVeyM+JNedqA+Pf8zKdmhWI7J0zIZbSUJNRUDQApnEjTtf9mIpkH/J2z+97SW
	w+RSvczi00MevdUMvsmQ7Cz5kLo2UxpG92t6H0qnOzWiM7Jbw0buJRoWyTcfeHavcLYNtJ2HzBj5H
	FcyGKEgQ==;
Received: from ip6-localhost ([::1]:61474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tNdRG-004Um6-8B; Tue, 17 Dec 2024 19:41:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:57549) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tNdRB-004Ulz-Po
 for samba-technical@lists.samba.org; Tue, 17 Dec 2024 19:41:00 +0000
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so5752854e87.2
 for <samba-technical@lists.samba.org>; Tue, 17 Dec 2024 11:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734464455; x=1735069255; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3X8IEkoXe3b715VYGF9ZQCq4bYE/OmXoGy0qO9sTq8U=;
 b=ehHDovNFX07dUSQ00hDiVjdGFTVqTBjS0v0cbtfzS/Q9r0ECI9oEGV08Oao3b96lI6
 qmf8ChaJsJw8Zas1stuKEtKO6zy3Y8Zx0n9KfRdsHKa6Oft0o/U/j/9xkedJ7WHvDYia
 JPuxEaX+83JyLD2n1n8Un6ivZ0y32X+21ktwdfL84l10zJ4nUnAVt7+FdHlCTXzmBrCW
 P/m/iSUisBPdRUAxyslaEfDrcxMKghniDtFBAid2OiLnrlsmm24zWn4op8RNfS+R8A28
 2uvlQTsd5+6BFad4JNGvxLehj80xAwS3KPSwsaweW5mmOazKUxVPn163qqHtX639rd87
 5XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734464455; x=1735069255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3X8IEkoXe3b715VYGF9ZQCq4bYE/OmXoGy0qO9sTq8U=;
 b=FQ8uj1InkEHxQseYKjvEUAJqvrksZEVe5nkUg91XmrY/0pz0FEdxLNs3g707o0Qe9q
 LTVXaiYAZe7Gw+ZLz7VfUQEOKPrIHPfi1Tf68b0jAolItyMTeX5DKPUVusZ6efVyest8
 IkQ2l4COpSqs5YADYfOHlkd8LMe9FdbnMedwcFFHCNo8xEVEtLL0yg6lgGnBA2jVQml9
 Ftd3itYuP9XzCTPp7wrtRHJ9KTzvrruTCvOfWQzLBF/wtAlfi/yOuuvAktXL47ssOZWQ
 B+MbwAozw7gO5/Yst2vfWNboY2BniY2Yhc1ePzxdC7/PBCb2CzL7xdzstYO5HZq637LW
 L4Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjYW1kfu6JNPScaRlc8+LwLbPxjUEiyFNnrBqPSGg2l0C2o/R3l2Ia60hcK7ZCJ34N/0VxpRsUeBscC1d0vpQ=@lists.samba.org
X-Gm-Message-State: AOJu0YwSod6kpGYqgtOKsw9ka3xN9EfLYpvidr13fyuM0n4ML15VRYmJ
 BS5IHsDUXu55H/TlEdAu7AmwdLrWVhN57ZFgM9Yz3zsSY9Vd20GNDjusmppHSb2RuPT5UTROG0n
 nShvMuwvc081Jp10noXS9kJ3NblE=
X-Gm-Gg: ASbGncsT1QVlmGCAtCvYMPDhhEwpBzZKtx4BN0/7tquje9h5xO3T0LYHSMd2nxzNnn3
 lQIxtaoHZ/sWjvDih+3kCl6FMnDVZmttBdv5P85ygT9Bozd0KWsq+9GXbtWcEGC2G2hBQHPrU
X-Google-Smtp-Source: AGHT+IEUoal6u81q+PaMZo7ewS58cvZcTR4plu2PbEY1N2Ol9awvTAG6tQvgN7aBDYSzuGToKq+fzCABiigg9AnkE9E=
X-Received: by 2002:a05:6512:6c2:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-541ed907261mr94223e87.47.1734464454939; Tue, 17 Dec 2024
 11:40:54 -0800 (PST)
MIME-Version: 1.0
References: <011da8e5ae7537ad188cc49cee6f96e09eb1b8db.1734427173.git.dsimic@manjaro.org>
In-Reply-To: <011da8e5ae7537ad188cc49cee6f96e09eb1b8db.1734427173.git.dsimic@manjaro.org>
Date: Tue, 17 Dec 2024 13:40:43 -0600
Message-ID: <CAH2r5mt61UvqdE-15ndegOHROObk0CfcZxMnTZeSn9oJymY=YA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Deduplicate "select NETFS_SUPPORT" in Kconfig
To: Dragan Simic <dsimic@manjaro.org>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Dec 17, 2024 at 3:26=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:

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
>

--=20
Thanks,

Steve
