Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0E2978E93
	for <lists+samba-technical@lfdr.de>; Sat, 14 Sep 2024 09:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DIKb1Ydx4IscWCfyIBM4d64+iaaXSfV1J2zQfsF6eI0=; b=LANHw46OhRsxEjKUHWFRgkrMXD
	QgEufODXCR80s0kZxctEWjKJElSGU4ufjx+hpEkZJ1vGMRMZdtaYVjWPwpyH5j9CWHP3iUrb+r+XW
	bvi479Y3OefUENBWBazpK8VQ5/f3XWc+BFgEP8rXLVD8jLXtvppmP/5PI1hO5up7AolaW9ZqHxVxs
	SeVKtuzNzFM1m801K+xerhTEqxcSDayQucZMqlcK8VAZ7YM1zJnQFlAwD3P9mxp2Wtktemc04g90H
	nPuXmUdlDbDmzawVTuRDGH/oWcaiiup/FjZx1Z8n6MRkRgPJx19+3+bAKy+F3rDnpRg+6e4ZcR9nc
	SUrznXkg==;
Received: from ip6-localhost ([::1]:59890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1spMls-0001uk-L6; Sat, 14 Sep 2024 07:00:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:58552) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1spMll-0001ud-H5
 for samba-technical@lists.samba.org; Sat, 14 Sep 2024 07:00:36 +0000
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso382275966b.0
 for <samba-technical@lists.samba.org>; Sat, 14 Sep 2024 00:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726297232; x=1726902032; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIKb1Ydx4IscWCfyIBM4d64+iaaXSfV1J2zQfsF6eI0=;
 b=lcTLHR5B74uJa9JOpwVyEYrOxLbxvs2JDCQF25NVofyshL5oJDX9mqbeSviLxSXbnB
 wdq6ZZbhWC8xuaJ700AVC4Mtl95VS1Df1xtmWvryMwzEgpI3Xx1/qYnSaRSQOnrCsRqx
 KD/Nz9wstAbh9+kr6DFEVsNIfutWGLCgw+Fcf07aO4P0UQax8NURHu1uxBLtqQMveKfN
 2YwMJS4Qkwz5UMRJRAOAquYSHfuMFl59vQKGyeKB5cvMtlPqFEKw9HokiKSitgR/FFqb
 pyCiTlln/jTl/JAc5w0nqR/p54YHTxsp8luzVCcALOnWNM32bfX5NJ9Sn9V9/+tfqZCt
 MMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726297232; x=1726902032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIKb1Ydx4IscWCfyIBM4d64+iaaXSfV1J2zQfsF6eI0=;
 b=fBX8JLqjc0MvWEjkYf5Db54g8PlvKbMfpRTo3OKHKoNXcUaHkkVSS4fci/qesWT5C/
 PCMIk6RGtRA6K5VkvVdVipAfHSYzpXmEixw/obNSvSN8jUG13T2wpjj3ZjAkkODODGjz
 lV7Q05v5ZLG6KCMOFhuIBPh9RYbdvj/1i3FGiFxMLfFxQOI+sl1h+M9fInwnGmQbmYJL
 PUGcFwHoRjdz+qW5NWUBj2yMT6dnbLkOhICaWLHQVRWz4RAjNq3obsDw3KWw23xT9dqT
 pAqyWJcW2k45lSPSL28/gkhS1CohWlW73NZ6E6RJwrQQN6DhNV/EMVLZXmSPvszK5hmZ
 ysFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfK2K1C661ls6RkR1gzdtDXwjLXRquJziinaOEO+6wITYhxzLR73mlGiyiQbIiYK8E0oCxXd4BAO0cYgbPeVA=@lists.samba.org
X-Gm-Message-State: AOJu0Yzs6VPB+B+atWwzMiSSDd+dcyX0jaVmZRwHgbtPOgm5SKDWSEjB
 4fI3UwBGFKROt3pk21pTAk/61l6oZ6hlYqGqlKz8c8F7UxWzzzowksvA+fDozd38mK0iB+Z/n53
 XEGtudcQknHR9sd45xcoiLu8cNqo=
X-Google-Smtp-Source: AGHT+IHhZ7hzKoGRxLECmu8/o6p6ngS0GyKLDs3INxkradcgbHhzRsOwBplkx0I3h6HjbtrUvfJL/FNvG7auoqtYbiw=
X-Received: by 2002:a17:907:60d4:b0:a8a:7248:d4c5 with SMTP id
 a640c23a62f3a-a90296202aemr960914566b.42.1726297231746; Sat, 14 Sep 2024
 00:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240826032803.4017216-1-cuigaosheng1@huawei.com>
In-Reply-To: <20240826032803.4017216-1-cuigaosheng1@huawei.com>
Date: Sat, 14 Sep 2024 02:00:19 -0500
Message-ID: <CAH2r5mvnh7KKLceWPkg2WG8J9btcAVp=-NZ24YWHMo8k7okgng@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Remove obsoleted declaration for cifs_dir_open
To: Gaosheng Cui <cuigaosheng1@huawei.com>
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
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

thx

On Sun, Aug 25, 2024 at 10:28=E2=80=AFPM Gaosheng Cui <cuigaosheng1@huawei.=
com> wrote:
>
> The cifs_dir_open() have been removed since
> commit 737b758c965a ("[PATCH] cifs: character mapping of special
> characters (part 3 of 3)"), and now it is useless, so remove it.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>  fs/smb/client/cifsfs.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
> index ca2bd204bcc5..61ded59b858f 100644
> --- a/fs/smb/client/cifsfs.h
> +++ b/fs/smb/client/cifsfs.h
> @@ -106,7 +106,6 @@ extern int cifs_flush(struct file *, fl_owner_t id);
>  extern int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)=
;
>  extern int cifs_file_strict_mmap(struct file *file, struct vm_area_struc=
t *vma);
>  extern const struct file_operations cifs_dir_ops;
> -extern int cifs_dir_open(struct inode *inode, struct file *file);
>  extern int cifs_readdir(struct file *file, struct dir_context *ctx);
>
>  /* Functions related to dir entries */
> --
> 2.25.1
>
>


--=20
Thanks,

Steve

