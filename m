Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81970972992
	for <lists+samba-technical@lfdr.de>; Tue, 10 Sep 2024 08:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QHHDxP8q1G6s76c8erH0zozRAfA5zWrhh1AM5ajLUl4=; b=6QOlCRkwn0KnqMeJtS9XuXuo1n
	iU3Z30MVxNOr2m8d3nPwIS3raijtaB+VsWVWogmDfa+aBvrFlloPHim3wozHlvkZnwWo26UzB5Nx1
	2pWKJ+XFsNISlDqTA/g4EDrxbAV52L+5flza/ygwSg9FkjaqdHkTyvto5GzGkrcLc2MYzvErOzCtD
	NNwi8EAW/D1rqSNQyiKBXO6QA3z+WHL1HhZTT1l1X7GN6LWV9QQBReuGrVJupwFrifNPJQZGDlptc
	f3xIzA6m5rgSSS2OkkR7K7XqyTm9ExTSuQLhtmkfRsoqafcBzHny8QXrpzF3FDxu6zrBVMkKWkANS
	7qs4tOVg==;
Received: from ip6-localhost ([::1]:26006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1snuQ0-008BTq-F5; Tue, 10 Sep 2024 06:32:05 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:57624) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1snuPr-008BSv-Ru
 for samba-technical@lists.samba.org; Tue, 10 Sep 2024 06:31:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53658f30749so4297373e87.3
 for <samba-technical@lists.samba.org>; Mon, 09 Sep 2024 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725949915; x=1726554715; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHHDxP8q1G6s76c8erH0zozRAfA5zWrhh1AM5ajLUl4=;
 b=N/jk8Y2x34GhMWTQylcRXdIChsaoahAFR17n2RDYYSF4O7rgkxL6KDDVfVytj9VXhv
 gNXOvxDfCxdt/eTOnIsFU5VWH5dw5dyIB57QKf6BcoA8CXmIVIOUBO0vsBgW4XMWaEcm
 a1xGSZ7Fk59SpblIcHUgllJaXY8tNnXVItN5XkW4QGX4hNKVMJcvhlv23ZrzsNAmiQd/
 NhJdm/kHYges4GMgffHkjBrn7MtwocQvVVpm9HTwtW2bczn00Y6EORV3TfWRpz0aPNO+
 CuWAZa+UpXAINdnh+bdypBlKA9ZjLLyQyPwFQ+uNIJrureSkjTTbkp72RNErDjIVWtgS
 WPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725949915; x=1726554715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHHDxP8q1G6s76c8erH0zozRAfA5zWrhh1AM5ajLUl4=;
 b=tJhlmk7s4nFd6SWWavKMH2+fBrZhdC5Eru+f6Eh9eYgZvKnpmU8BcqPx3k4D3PUEx1
 atT9ASpxqAedzJ1gfTOugjHU5TCrbQwVp7sexcpsXPNxZcqsS6UTkDinxaoOKdWWEqbl
 sQlRfIKEV2pyPwZAZ/2EleE8oKQ7/kYD+Z6090BqDTqnbuJuvOWEP1EXAkKnb7OhZSfJ
 VaxXdXLGMgT6PnGWajcUsvfrGv7FpCsmGAeYS5e2rLgIR/M3N9+llCEqyldiWkAkdOoE
 IpsgKju5HtATrazM6Eao8vmDMVxxiRRC6hLofYfh0X0H1H2hwWo19hWcTBsM5+TQ4QPp
 sn4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcUPH3RA9B0v0fHSjYoTJGH0C4K1EnMHtb+tu/l2RVu4B5UuUXOKFnobiLkHTS7tAlWJJc8PaWo/5fgMUZHg0=@lists.samba.org
X-Gm-Message-State: AOJu0YxL2rxF9LMup5abRFwcxuaOmDH54E8nsgS1G7S97jo3wdhkI2lt
 Vod0wxgBVjElBvO55v1G9I2RzmCMyOOcK2u3b38zJdh0NqzAsQkTkeSrZb9+hPQLag5MIvGoUDa
 7tOj7hazWoflrFhU399PqHeMQAMg=
X-Google-Smtp-Source: AGHT+IH+7EEc+C2nGHJwLNTOiThWrJQIkEF3cND3sycvQdbIm3Qrf4Plp+uRx9QJO0EjbFk8/NH4qpMM4wHQbWeDI/U=
X-Received: by 2002:a05:6512:1395:b0:52e:764b:b20d with SMTP id
 2adb3069b0e04-536587b4d0emr7807964e87.28.1725949914702; Mon, 09 Sep 2024
 23:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240829115241.3204608-1-liyuesong@vivo.com>
In-Reply-To: <20240829115241.3204608-1-liyuesong@vivo.com>
Date: Tue, 10 Sep 2024 01:31:43 -0500
Message-ID: <CAH2r5mt4TNMYe73UJCA_VLXMCm+5p48yDL7dEprJc4fgr0+tsA@mail.gmail.com>
Subject: Re: [PATCH v1] cifs: convert to use ERR_CAST()
To: Yuesong Li <liyuesong@vivo.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Aug 29, 2024 at 6:53=E2=80=AFAM Yuesong Li <liyuesong@vivo.com> wro=
te:
>
> Use ERR_CAST() as it is designed for casting an error pointer to
> another type.
>
> This macro uses the __force and __must_check modifiers, which are used
> to tell the compiler to check for errors where this macro is used.
>
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>
> ---
>  fs/smb/client/connect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index c1c14274930a..c51b536aa9ad 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -4069,7 +4069,7 @@ __cifs_construct_tcon(struct cifs_sb_info *cifs_sb,=
 kuid_t fsuid)
>
>         ses =3D cifs_get_smb_ses(master_tcon->ses->server, ctx);
>         if (IS_ERR(ses)) {
> -               tcon =3D (struct cifs_tcon *)ses;
> +               tcon =3D ERR_CAST(ses);
>                 cifs_put_tcp_session(master_tcon->ses->server, 0);
>                 goto out;
>         }
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

