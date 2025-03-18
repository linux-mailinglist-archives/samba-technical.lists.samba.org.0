Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3945A67D09
	for <lists+samba-technical@lfdr.de>; Tue, 18 Mar 2025 20:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HcAQOZqccXx0I77tL5o+cupSfQdFfy6XH0pXLyfYY9g=; b=ABF5Vgoi8KOsXFSNORhAHBvL5Q
	bDTa+wWcqEgZd7u0a8J8+I2zH4bVyzGotDipDD15yNBNw1yBi1gNenVGk96y8jxwTH76gTQX13wum
	dpz9ixTEPmsPCzyfxPJjFW550ockGafYWheZIU9Y9kA6DhWAWIQCH+FtlHEDPPWL2IyxN12XeKr4b
	UkNIHOr1ME9JvyJDBKZzzay+w1NHxSs5D4aLPdlrcBPEIOKXdYWGUWwyEoNxhOHW7IF2AZcknGJgq
	e1AJYtoMDR5jMwxlezWgDpguotMga1ZaDgPuB0m5uhVSsNIboPD1yEcoHwiWR8sThriW9Xj+qwTLR
	03BROo3A==;
Received: from ip6-localhost ([::1]:33158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tucXV-00GUbF-NV; Tue, 18 Mar 2025 19:23:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:54327) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tucXR-00GUb8-An
 for samba-technical@lists.samba.org; Tue, 18 Mar 2025 19:23:48 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5499bd3084aso6044483e87.0
 for <samba-technical@lists.samba.org>; Tue, 18 Mar 2025 12:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742325812; x=1742930612; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcAQOZqccXx0I77tL5o+cupSfQdFfy6XH0pXLyfYY9g=;
 b=FLIBFdTznooOECqHs4IpOZznhWICQz2N8LSjKMq3QM9UkdhkQutvZk5ifJpwr4Og9Y
 8Wl+JLmJ1d3Gw+3khNxbWXVSRoLXDGMaDZlY7HcYhytDgeXH5IeEQIQ8InnijsN2MHd8
 AfpqUyR8RAtwkZMZcqlpZraSEayB/ZZv2zpbe3qc+hskpYamlaKWN1pcRh1AK8bjR8bk
 HiOrayNQ0iFZeQljyy/MhQePEpla/EJX0S4NZ5wZMg+pho7W9w/E27N8L7aERcmYd+vt
 utXPnImDbpSO4PoxdSnQLIu4pVVEYOb3vSZiERhP7XwP7KoynGspJhtqA8NkZy8mHT78
 w6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742325812; x=1742930612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcAQOZqccXx0I77tL5o+cupSfQdFfy6XH0pXLyfYY9g=;
 b=qXcxh25tGNWmmeV9Bq5CX6TkJ/92Eqhnmn/9Jfzb/Te6+7USvvb/GinJNxU96MVDua
 jhQlYt0THkPeuV5p4P7Mwdl+OdNth15NXMvZ5MJjfqJEN7ZwOZaTpYXwJrveaioZnhWZ
 sD5PHD6lq38wBoiW71UaPJIWWkvO4LbGWgHaFsfvBGToWKc+e5LhBI4p9Xj/L+K54Ffi
 8IlC9DVyp2gq40gDnQefz20tW5S+YkFyZWGcNiX75wPsgTRJrtrbu6eMtmRhMAfR65YX
 0lQUAxeJrmJGblEUv2uV3yhPqcj4xFe16YIWxN+XPtlwOVpIscFol9igfmmd35Jy54XO
 i+1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mUyWTLEt/wdmDJLqkwNUwtqm7dUALWmBToFyQxFBi9TsIcmUFAHSSnAJGJsnNsbl4blGcNrf9zyGX6D8edU=@lists.samba.org
X-Gm-Message-State: AOJu0Yxk9Q4MrTWp3nIsaUHd5QaWrZcDYmyoAMiHngom13c2G8gUVDG1
 9rzydOUmniC3ZKd8AFePMiCVRBmbOp3GTZc8CckTc7VJ6aOYCooVSAoz4EwxcnfOgt+v4vu3M2U
 /4A8UAuk6VB5+/pcIIm2FM+Gr0KE=
X-Gm-Gg: ASbGncvSwhfhEDsfH3W6FO/SqJ0XGUC3shM8ZoUu7ZlDM+xrfDN19SzmSLm9DayojRS
 MW0xKogKAS2ITt90k3AoU1BOwQoy/+0lULC7tIEfW1LSh4lVuC5A360XcANVsFFlRJYGZDcIKSv
 FI6s39RBzd4mTCU4T9jbCZMY9s
X-Google-Smtp-Source: AGHT+IFOLhiQE/d6AlA+tjXhw7+XvaECaCbQ38+34V9DySHBXKzREfXr6Z8MxgWAeMNTdvXYO64bPwLzVzp5ZXLuGv4=
X-Received: by 2002:a05:6512:282c:b0:549:39ca:13fc with SMTP id
 2adb3069b0e04-54ac9cc1605mr128555e87.49.1742325811315; Tue, 18 Mar 2025
 12:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250310140458.249202-1-i.abramov@mt-integration.ru>
In-Reply-To: <20250310140458.249202-1-i.abramov@mt-integration.ru>
Date: Tue, 18 Mar 2025 14:23:19 -0500
X-Gm-Features: AQ5f1JrmmOMudtqyljKZ_6xAXW64rX_tC4AA0k3-HNQfvMGj1Gew5-5Qs2LWUm0
Message-ID: <CAH2r5msSqt7iJ9rCFDWZqTbG5o85nbM3Ucx73w-YwBLKbr4cXw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Remove redundant check in
 smb2_is_path_accessible()
To: Ivan Abramov <i.abramov@mt-integration.ru>
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
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged both patches into cifs-2.6.git for-next pending additional testing

On Mon, Mar 10, 2025 at 9:05=E2=80=AFAM Ivan Abramov
<i.abramov@mt-integration.ru> wrote:
>
> There is an unnecessary NULL check of cifs_sb in smb2_is_path_accessible(=
),
> since cifs_sb is dereferenced multiple times prior to it.
>
> It seems that there is no need to introduce any NULL checks of cifs_sb,
> since arguments of smb2_is_path_accessible() are assumed to be non-NULL.
>
> Therefore, this redundant check can be removed.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
> ---
>  fs/smb/client/smb2ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 4dd11eafb69d..6958825431af 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -969,7 +969,7 @@ smb2_is_path_accessible(const unsigned int xid, struc=
t cifs_tcon *tcon,
>                         if (islink)
>                                 rc =3D -EREMOTE;
>                 }
> -               if (rc =3D=3D -EREMOTE && IS_ENABLED(CONFIG_CIFS_DFS_UPCA=
LL) && cifs_sb &&
> +               if (rc =3D=3D -EREMOTE && IS_ENABLED(CONFIG_CIFS_DFS_UPCA=
LL) &&
>                     (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_DFS))
>                         rc =3D -EOPNOTSUPP;
>                 goto out;
> --
> 2.39.5
>
>


--=20
Thanks,

Steve

