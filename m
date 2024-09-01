Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF596750C
	for <lists+samba-technical@lfdr.de>; Sun,  1 Sep 2024 06:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aBtRKRMQWYzKZO+mGYF6UE6dJWp8UJ4hAbPEjFtpHqo=; b=6aqiSeE6NCWqy59oEb4VxZl3au
	5WHz1WhZGVOPIOO/O/t/HoUz6SMIxRxuw1CXDNINrKUEAAVJh6DCoI9mZ3qOpSarNFn2fUPHMw/5b
	dNCfWJhRZMK+XcvjlZRkyFE/25tXdMQWbWJCv48E73vCXN4nKVK9oPdBZ724oJTIyh8XxrrxhczQ5
	9FW7MAhB8fe4488aw3FaBfFheOZkTWrkvdi+DDXl4HBMWcdKlbq7WinAwtbFcsArUGpFBLImdKsyI
	6cMsj17EmlO0oR8AcY6BTr53SfhnyF0AH9Ls1f1tM8da/uXF75iQbUIHXsSAifunl/KBQd+IjKSpm
	AsLHnSHA==;
Received: from ip6-localhost ([::1]:65484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1skcRv-007lYz-JY; Sun, 01 Sep 2024 04:44:28 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:59899) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1skcRo-007lYF-3V
 for samba-technical@lists.samba.org; Sun, 01 Sep 2024 04:44:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5334adf7249so4161332e87.3
 for <samba-technical@lists.samba.org>; Sat, 31 Aug 2024 21:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725165859; x=1725770659; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBtRKRMQWYzKZO+mGYF6UE6dJWp8UJ4hAbPEjFtpHqo=;
 b=HdVQw2gwvHCZtvP1mOB8oXaq8f5XeBD1D8VL8rNJVS8a/lM07JIJH5Bn6/n9TpCUfS
 alp9kBPjNzAKKW8bRikcx2QbcpXnYcpc3UQgisZdw1CWSF1XX0KaIN1iMpEQkn4Yrjm6
 AX1ZUkVR4zKIcMjNtdkc6Kr8xzr6weSXgEtdSA0LLB9YmvfZrI3IH8ouVMUpzpG5Nf18
 eeT0xG4spEp77zBQHurXnc907+Kv1lFOHYlqdBL1SM/058gOVf64QZGT2l5UvIHz3EVE
 BThcJqoF/Kc70GRYIyQZlUGXL/4J0OY1YStoamLz0Fga3mbAhfCzEzu3ul3PVb5ygxjo
 V1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725165859; x=1725770659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aBtRKRMQWYzKZO+mGYF6UE6dJWp8UJ4hAbPEjFtpHqo=;
 b=Ck8qJZEcxhV7FuEpYMiYfjGvgTmtxJwEbOJ3BoSmnA/ANoo59hWibbFthdBYIN5j+x
 h5ZqfSLzO41TpN4ifgjE0pIl0JRrGJxRsGYRBehwWKTm3oxo+JdJBPnQElAp+RMwfb3y
 VUIm7ExWAQ9yifZt5b6uid9ZD99IBUS34oIsWAATKLRfNj2WWRVky7dasAA/OSj3KrbI
 EXio0JjnoY1D7Wkxtpop+/QvcQF5CkizEiIziVYTzJ71A5LO1ICjmubE/SsnPeivabLF
 3P/aUMC/sKGXa4GTgKb05VBCkjY0H4vIaGiMIUSq3ImG7EJxoPVAZUYwl7H4yhl2q9sS
 MzPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl9n2EkCxo6gYMCL+zGL9FdFRv42S7/fhAWce/famV8SeL4GS1BOuf/y1p2Xic2fMFW8IWY447KLOhv5CDB68=@lists.samba.org
X-Gm-Message-State: AOJu0Yyj52zik44zR6pgasx3WuTlbr326UE+8Rmk23nuLP+szgLd/kgf
 1rz1lYo72836yDOzRnr6nmTmLuu+iMsPkm5j4r3TU16Pn6Q1qDN3KmOQBQH20xnuqlnQ6avSS04
 i+zvxSYgyZDJYDpAFlQlVjRRGLc4=
X-Google-Smtp-Source: AGHT+IFPecv30WQWJ10cN57Q/RGQoGMicgHiKPf3/lUr3fyGdydhdb5QraimYObk1KPkSWRX5zbkHO34p/i+7q/WlTY=
X-Received: by 2002:a05:6512:3ba5:b0:530:ad8b:de11 with SMTP id
 2adb3069b0e04-53546afd8dfmr3791376e87.9.1725165858324; Sat, 31 Aug 2024
 21:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240829115241.3204608-1-liyuesong@vivo.com>
In-Reply-To: <20240829115241.3204608-1-liyuesong@vivo.com>
Date: Sat, 31 Aug 2024 23:44:07 -0500
Message-ID: <CAH2r5mtBGfU-UFmzJv4YKPKQ==Zs+r6j2TG1m_uzAJm2GJJguQ@mail.gmail.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 opensource.kernel@vivo.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged to cifs-2.6.git for-next-next (target for 6.12-rc)
pending additional review and testing

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

