Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8522BC6D28
	for <lists+samba-technical@lfdr.de>; Thu, 09 Oct 2025 00:54:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=47AXLHvQXpecw9Pk0xc8k8pWjnyMcJASaicwR2IjVYI=; b=VGMkf5HR4/sRCqfMsZDbHFIMBr
	PyJGUvVK0z5BmbAxJ84GOgDX5gAgpMNRq6bJscVDurplkrSXOfaVxkqk9I9FeVCEDRHvux0Q1fv8g
	ZKVKAlamZexfAAhu8vGP85qTs62sIdrAh0+jzi5Mku33NDrN/qOG2cSqyfSChxOZDyNgWuHv0LHJr
	N7UMkn3XhbQeMunP2yJpDDxK8cpZtg7+n7XW9jGBZMFRYMgGrafPA/1kQ0nnoltKKoTNTbhlB6Euj
	UszNG3h8E2evh1YD+KqxNjPTqJ9wvYYRjvYp5Xuew4k9LHukCdMrTXHOxNcfJCqca6klOxgLUvSJ0
	hAP19zBA==;
Received: from ip6-localhost ([::1]:48026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6d2g-007KXi-KJ; Wed, 08 Oct 2025 22:53:54 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:46472) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6d2a-007KXb-0o
 for samba-technical@lists.samba.org; Wed, 08 Oct 2025 22:53:51 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-79390b83c7dso3486266d6.1
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 15:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759964026; x=1760568826; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6Jn4FQVnIEEzozZxa5pXe0h2sv2A1IA4RDvoU17E+k8=;
 b=WYdVv9vqImY4tLhM7Ex2Y06IVCutXUFutnzfJxYun6qcRtqreCGiHIbfFgEay4i67/
 OoQ2u+vRP2nM7CWTcO5YInah67nTITizJWd3gPEo1JrjdJr2815Z0jVIRwY+GXSqg9Cu
 QbNyDQFZ6LCTnqQmugGndgd1PSFswBY2jaDL0a54hLv9iZuvg4Qz/kezjTNBBbsAy9xt
 AA/uHbKrJwEHBrrCxh+0FdYbqbn/EHS51dfLvtKnXRmVOONh0co5lPrr+6d6o8M+ZBRL
 H1douh0y7tc/VVuR0UOeynoanRcwNxHCX0eJv9n6xWbjeMErT3ujVsjhGORSTAWVAUuJ
 FQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759964026; x=1760568826;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Jn4FQVnIEEzozZxa5pXe0h2sv2A1IA4RDvoU17E+k8=;
 b=WUhGXZVHytWMQADOVaFG479ZznvO69051PLhOGSce9+Z0sRdjS07aBcRjFEzg/vmUN
 wudizSv99oIyarR808d5Ym8C1QsCDI520FQy8UNMsPgt6eMO3TE6pf+xBBEgkHm/SA59
 YV7tKCrVYHIsUrVPayANXmbf5WlKNoGWMDi7TkniJtSQ0xxezMz+ldq8Dbq3dDr0E6GH
 cNo2ef8ykr1Fj984W7+MUpkMEhE4BnkrpbEIQPz4OsqAmKMErVomwt8KCW9sl1a62uD2
 +1xQM5lMAc4IUb4K75eFTcstM/6nLKtgGHM4l6NpwEcdt5nUjdtNCR3SDLc04v0Kxp4n
 yRmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR+W/VdWhfonq1zQ8lwBiAV82PWuy11IPqZEWziIB5GfUUkQxBp3Lx7K4QCugUv7UL7d8jMMjp1XSqBdTm2r8=@lists.samba.org
X-Gm-Message-State: AOJu0YyZA+2qSdGvMGdUcEoQy8Dba1TBy3IWVkGxHnt4C2e1w3X/575f
 gtJ6y3fgBOoSCo+kQNhHJRQ0hpKudwefkNC8ntO4CM30US4cbTtxny14MaX3tzyrRWxUMNOnlyX
 /3RL6tuifLz/IBnaFppyp6c1zbuy7Wck=
X-Gm-Gg: ASbGncsFnAJRBTUX4fGeyo/0ig9E7Qxi0rXS+fnPv8UlwYS+T1mntMWZ6HzVXclWGky
 Q1M2t1nDQsdkKOJKctkhwXAlyOc9pz12IfOciaG8/6l4NgGjQdUaHIkTJeAzD7PQahARJ4ltPrz
 BZG1Z53Mb9I7k/qeklHmuBMYgzC2YtROx2900Zs7zrfEP9Qrk/zuUoHmW7nqYV9eckQ26exX+M3
 lqWtsGuimG6HYjpBxJe1aLMjKKexmVe1ZdqyzCOHtxLzjnQ/HHPdgXr+8GxEIm+OYLnLDlNIxhM
 iNWm6/j5HPTaqr+5/vTW7RRXzk8e5qscECTDj5hUKWQScXHNnMoX06fxxLVGS9mrN32esKSk9Ox
 Bh5UfR0g85vu39iAzLYX9K8KGyjP1TdlSufAUfRGuKcm7
X-Google-Smtp-Source: AGHT+IGLQ2cdTQq2I1HpgeuVZkKGrejbDF8REgp0Bu53zWo6Ki9XAT7mYDeHTs1l7MeG4LIjZJ/kFzETYrzqzniCsH4=
X-Received: by 2002:a05:6214:d44:b0:78f:2a6c:19 with SMTP id
 6a1803df08f44-87b2106db02mr84848396d6.23.1759964025955; Wed, 08 Oct 2025
 15:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
In-Reply-To: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
Date: Wed, 8 Oct 2025 17:53:34 -0500
X-Gm-Features: AS18NWCyt91Mld5W_ebG5hFRs3KVR5Vl9S-myS2IKO_CpowYBl9wt7bkA-ZOKYM
Message-ID: <CAH2r5mtpoLscs9sodXcRMO3-dqMDBSTR+ncExdqy4dQR=4uE8A@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Simplify a return statement in
 get_smb2_acl_by_path()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an example of one that is probably slightly worth it, it shrinks
one line of code, and also doesn't have risk, but at least three of the
others today don't shrink and sometimes grow lines of code (and don't fix
anything ) so are unlikely to be worth it since they slightly increase risk
of adding difficulty to stable backports of future fixes

Thanks,

Steve

On Wed, Oct 8, 2025, 3:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.de>=
 wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 21:56:34 +0200
>
> Return an error pointer without referencing another local variable
> in an if branch of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..bb5eda032aa4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3216,9 +3216,8 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
> -               rc =3D -ENOMEM;
>                 free_xid(xid);
> -               return ERR_PTR(rc);
> +               return ERR_PTR(-ENOMEM);
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> --
> 2.51.0
>
>
>
