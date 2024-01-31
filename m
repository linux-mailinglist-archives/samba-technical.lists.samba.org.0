Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6618448B9
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jan 2024 21:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YeIsgl8+EFYn5S6ni1qvspvfCQnicxx3gHZ+U13Srac=; b=zpnNC1/YF9avAWfxBpvwWHLOmp
	KgQeXFPqKevz6V2UaYXM/6Tg/M+vgDD1Ztwtnlc5Wn4C9FmAmIo+2l9lPCGhFQahk2y6fvFWUxMVo
	t3pjPRbQCvK+U4+PStnkVcGslRa+5nkrRq90gsim3+LnM9+zEz5uGyLJCz8p7oDqkQGvk3+8w9hWg
	Y+OPgkOMbp1t9YN9DfSZg4p8YWZXztIN8fzLZiB45fCSx6iXZ1fFxCCe2BWmDHs/fyhmi/282y2gy
	U4LgDrUwa5JV2LBGs3ZrT8A/hVtLXFbhsYAr2QJwnHvNsYBMwdNiO2uSGi7UqS3lJRbRXZlMKrqGs
	vebR6IeQ==;
Received: from ip6-localhost ([::1]:43896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVH4r-005Kl4-8Y; Wed, 31 Jan 2024 20:20:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:49184) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVH4l-005Kkw-BS
 for samba-technical@lists.samba.org; Wed, 31 Jan 2024 20:20:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5111f40b8beso156200e87.2
 for <samba-technical@lists.samba.org>; Wed, 31 Jan 2024 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706732448; x=1707337248; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YeIsgl8+EFYn5S6ni1qvspvfCQnicxx3gHZ+U13Srac=;
 b=C3n0meHT60gRp5IURZarLu5/2AAmG9P3vZdBfaTINEzMqexhP6PW7E9vqyRr7gr6v1
 L9hICM5YZs00dQoqTla5G7LCHF5nNuQfvoO939sYJ6Crgi3DT04JWpryPQelsyMQkWE5
 wexjTJyuA7QkhZZ6P0OCT2q3Lr/o6EGKqL5RSwZyZRvVJ+pT/NEexMGupTmU0QWHYrHA
 qvYH3OS3vkYk+HWdVy1wkUWqF9kuNnXE6NcvwHxRB0q6FICINptjYJ5KYyJ4fdbfj0SU
 FspUhQq8mf8va8hdBdjBevoq7jKQ0iVqHcI264f4jZIBPughelrkcR5Y9QWYsxDaavon
 RZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706732448; x=1707337248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YeIsgl8+EFYn5S6ni1qvspvfCQnicxx3gHZ+U13Srac=;
 b=Fuag6T5RfDxoeZ978cZyHZutQQJp4ijzyQpRk5RbzTqq+k6HA7qJATcBojPcpt1DZ5
 Hp/vQfKwrmhCG5XME1FlBAHYB567M46LjuP0hjycXNTF9vi9WD/+S/0qpbpXGlNhsw+C
 ICTma7BwUJHaKcRjQ4nMz0P+8oDMhZ0eDhb39Tq8DHCDqhOhwttAQjo/NXrhyH0XfZgL
 pVllcGRb0vLhx5LmEYqVx7YZ+Njh7OeQwD7A+fVtgUKO6nATDEqAMoeTHjEZVHUftKBH
 9Fpg89z7m2C1S8NGrbi10HwwWX4muGQUpaCtiK5YQBabxSis12xnc81/dldK/AouBRxB
 ByRA==
X-Gm-Message-State: AOJu0Yw/3zTb19eRHKSNqjC6cdS0Bc55DxU81C4I18OAFqiQtdd4yBto
 7nfJ7GyAGQFLI2P8NPGFF11QT9g3dOtr2MSHfrFuGxhCfB0DDCCOPbeec9Hi3ohru+N+jmOQzKL
 2c0f/ZPE5n7jA8sq1OcjbZIhi95E=
X-Google-Smtp-Source: AGHT+IFctTMEsBEALITPd9P9JYlZ+E6XiMU7oZunjT4jHOqSTOqn77q3mWKKZy/qhtYsP7ZUL8dO7lVf8n5NdeS5c6w=
X-Received: by 2002:a05:6512:1394:b0:511:fb6:b1a0 with SMTP id
 fc20-20020a056512139400b005110fb6b1a0mr207585lfb.52.1706732448077; Wed, 31
 Jan 2024 12:20:48 -0800 (PST)
MIME-Version: 1.0
References: <571c33b3-8378-49fd-84e1-57f622ef6db5@moroto.mountain>
In-Reply-To: <571c33b3-8378-49fd-84e1-57f622ef6db5@moroto.mountain>
Date: Wed, 31 Jan 2024 14:20:36 -0600
Message-ID: <CAH2r5mvFYd0bjajnNVwMzdmKwbMGwgrbxUV9+4-FOBxe5Ejx+A@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix a NULL vs IS_ERR() check in
 wsl_set_xattrs()
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch.  Thx.

Added Paulo's RB and added to cifs-2.6.git for-next


On Wed, Jan 31, 2024 at 1:17=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> This was intended to be an IS_ERR() check.  The ea_create_context()
> function doesn't return NULL.
>
> Fixes: 1eab17fe485c ("smb: client: add support for WSL reparse points")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/smb/client/reparse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/reparse.c b/fs/smb/client/reparse.c
> index ce69d67feefa..d4d2555ebd38 100644
> --- a/fs/smb/client/reparse.c
> +++ b/fs/smb/client/reparse.c
> @@ -225,7 +225,7 @@ static int wsl_set_xattrs(struct inode *inode, umode_=
t mode,
>         }
>
>         cc =3D ea_create_context(dlen, &cc_len);
> -       if (!cc)
> +       if (IS_ERR(cc))
>                 return PTR_ERR(cc);
>
>         ea =3D &cc->ea;
> --
> 2.43.0
>
>


--=20
Thanks,

Steve

