Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B538AD59F2
	for <lists+samba-technical@lfdr.de>; Wed, 11 Jun 2025 17:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5d4rQ7j/tpr5QKroSCDl0E2qZSLxiAsShxNtEN6jKek=; b=N6yDXWz457M4D6qwFQpdxAMy7C
	MLQG64r+FVZGHzgkAyA1eUjgwIJKMDSQIOo6gPfhn3Pe1DojhcJrhN9bGzSJzz/QXobSlz3+STw0s
	ymbPd4l5czzE0lCLGRZCgUvrYxHDYhGkrNpoOenvaYyreLa/yVBlEWzsdLcmKJzyasBAWQLlTzhsM
	HL+ySF6URCY5DgNS3YsU3lGdrn/dNGt+0RrnmY5zYLtDWqBgMN1RQDb2FZz+DlA4XTYeEm/hkVOAC
	MwdyreVdN7Koh8uPJt4WohL9kEdXxoBi6RIc/BV2tIAyfdZMWwfgreTQxtn37sqXTYxeGQoWkDe7c
	keCVpW6w==;
Received: from ip6-localhost ([::1]:54420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uPN7p-0070tc-5u; Wed, 11 Jun 2025 15:12:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:52553) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uPN7k-0070tV-KL
 for samba-technical@lists.samba.org; Wed, 11 Jun 2025 15:12:23 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32ae3e94e57so45688811fa.1
 for <samba-technical@lists.samba.org>; Wed, 11 Jun 2025 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749654739; x=1750259539; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5d4rQ7j/tpr5QKroSCDl0E2qZSLxiAsShxNtEN6jKek=;
 b=XvRzBjVIO9ip2O6F7fNL4RzC2jfo2KTcm4tiNG6zEMEzcFMVn1RUm+sJ9TPlBQ/KlJ
 k5axkqmcIpWKC4cXjK13y0sf9DQfLD0zQNzlOfxHyZYlvWmgDPyvthual3h+tF+9ndZz
 LrmbO9OcSIZfG9B4kpjuoeE5cIBvEt2R5MRp/ZADPhWWdiEaGQ7X/CKFeZ0wwfYY1Zu8
 cChAgjFeTNYifJIryJkEydMaTBQdWCFus3gWl8FPC6LcqqBrrY25YStLig4+W4Tejapt
 vTyPxns+q1Bf6DvMz4kzEcXIk16gxO+Vv615IsBDYFSwkHLsJqUyxGqhQAAbvO4WAO0v
 2htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749654739; x=1750259539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5d4rQ7j/tpr5QKroSCDl0E2qZSLxiAsShxNtEN6jKek=;
 b=U5emF/VA90ZFmkbPawzLLpO4F6hoy385VOZTVUpVZ+e7UsKd6PkpRbOQKFajuRL2lX
 nPJN+nk6afh1+HKt/O9JeF+vG4YFgoVETWaw4G4alOfCW0RSvYWXAKUnd7rp7I/yy+uu
 oIUd9xaz73zS4O32uRqvLWMKhsOuYFuGhR0CIFy/M/YRC3IUUZTSyKa/nBYDjkKUlRMr
 fxBNkBDaA84J/1GNIL5JlkLjqQlmXL/Sm1n4zyXZejPF0H+O6i8GGXCt5kXgZVxj+h42
 y5oAdlsikyeRudaX+TvkGpFS50ThobFUovSuHz4axUG/NcOOrAGYRsQ7GqlUO+BRN02w
 GTIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyt7aXoezqe7GDb9vezRX6t8JFRETVy04knUqbjA/icHIQ0ywGk+UxQA2TdXctIFAWcf1DXKmB737NusuB3cI=@lists.samba.org
X-Gm-Message-State: AOJu0Yxo/PAMiIDpgLCpII3e41+uAtSvD4AqRwjQHF/bWlTE6fIrz65a
 yUURFxrELhKB5LxPPuKaqzupYoQdcKvc7wbvgRlZ7eJ9MfxvRPmr2D9kgo8dk2vnnPSrk2AWkNn
 SJJrG8/4Aexs/VeW2yV28bGs1ncFh1nY=
X-Gm-Gg: ASbGncsCHQYCRQDSaaQCwW8i25SNIxdzY8YLaCf4ozRx2aRZppZO51W2d/4QzMVfwQr
 sBMFC69KticQ8El3Pj21BTOoTi3CiBce6bLqg4v8NgySEl7EkP5p6fpVkHV/Cc1oqTWSR799cJE
 1AYyPApk4FZ1WSp+GcJy5FYWKdsgw3nkl3scUJeYNsCPys2Modf3rfDjB8QYS10XAT+aPAKBtal
 xFTWg==
X-Google-Smtp-Source: AGHT+IFszMwNbQOCxLYs447Esu6qG70KcmNWlNBnyPZ1yAO4cpvg7wgpGE8lTuKNZIyYQGWkQcLuCCxfOrwW4HkGyK4=
X-Received: by 2002:a05:651c:1548:b0:32a:710f:5a0 with SMTP id
 38308e7fff4ca-32b222c7d03mr10075481fa.11.1749654738677; Wed, 11 Jun 2025
 08:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250611112902.60071-1-bharathsm@microsoft.com>
In-Reply-To: <20250611112902.60071-1-bharathsm@microsoft.com>
Date: Wed, 11 Jun 2025 10:12:07 -0500
X-Gm-Features: AX0GCFtw4ZL5H3ESFLIgEc4QBM2Y_lSXiLUunkjaEMIXSJz4XxyRURpq4BmwYyc
Message-ID: <CAH2r5munktDK1VstQRZ6VcRWyYMasHnR53VM+3i=cz1JYpcpaA@mail.gmail.com>
Subject: Re: [PATCH] smb: improve directory cache reuse for readdir operations
To: Bharath SM <bharathsm.hsk@gmail.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical <samba-technical@lists.samba.org>,
 Bharath SM <bharathsm@microsoft.com>, paul@darkrain42.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged this updated patch into cifs-2.6.git for-next, running xfstests
on it now.

Looks very promising, and we have a couple more dir lease
optimizations to try out that should also help a lot with perf, and
reducing load on servers by sending fewer metadata ops over the wire

On Wed, Jun 11, 2025 at 6:29=E2=80=AFAM Bharath SM <bharathsm.hsk@gmail.com=
> wrote:
>
> Currently, cached directory contents were not reused across subsequent
> 'ls' operations because the cache validity check relied on comparing
> the ctx pointer, which changes with each readdir invocation. As a
> result, the cached dir entries was not marked as valid and the cache was
> not utilized for subsequent 'ls' operations.
>
> This change uses the file pointer, which remains consistent across all
> readdir calls for a given directory instance, to associate and validate
> the cache. As a result, cached directory contents can now be
> correctly reused, improving performance for repeated directory listings.
>
> Performance gains with local windows SMB server:
>
> Without the patch and default actimeo=3D1:
>  1000 directory enumeration operations on dir with 10k files took 135.0s
>
> With this patch and actimeo=3D0:
>  1000 directory enumeration operations on dir with 10k files took just 5.=
1s
>
> Signed-off-by: Bharath SM <bharathsm@microsoft.com>
> ---
>  fs/smb/client/cached_dir.h |  8 ++++----
>  fs/smb/client/readdir.c    | 28 +++++++++++++++-------------
>  2 files changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/fs/smb/client/cached_dir.h b/fs/smb/client/cached_dir.h
> index 1dfe79d947a6..bc8a812ff95f 100644
> --- a/fs/smb/client/cached_dir.h
> +++ b/fs/smb/client/cached_dir.h
> @@ -21,10 +21,10 @@ struct cached_dirent {
>  struct cached_dirents {
>         bool is_valid:1;
>         bool is_failed:1;
> -       struct dir_context *ctx; /*
> -                                 * Only used to make sure we only take e=
ntries
> -                                 * from a single context. Never derefere=
nced.
> -                                 */
> +       struct file *file; /*
> +                           * Used to associate the cache with a single
> +                           * open file instance.
> +                           */
>         struct mutex de_mutex;
>         int pos;                 /* Expected ctx->pos */
>         struct list_head entries;
> diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
> index f9f11cbf89be..ba0193cf9033 100644
> --- a/fs/smb/client/readdir.c
> +++ b/fs/smb/client/readdir.c
> @@ -851,9 +851,9 @@ static bool emit_cached_dirents(struct cached_dirents=
 *cde,
>  }
>
>  static void update_cached_dirents_count(struct cached_dirents *cde,
> -                                       struct dir_context *ctx)
> +                                       struct file *file)
>  {
> -       if (cde->ctx !=3D ctx)
> +       if (cde->file !=3D file)
>                 return;
>         if (cde->is_valid || cde->is_failed)
>                 return;
> @@ -862,9 +862,9 @@ static void update_cached_dirents_count(struct cached=
_dirents *cde,
>  }
>
>  static void finished_cached_dirents_count(struct cached_dirents *cde,
> -                                       struct dir_context *ctx)
> +                                       struct dir_context *ctx, struct f=
ile *file)
>  {
> -       if (cde->ctx !=3D ctx)
> +       if (cde->file !=3D file)
>                 return;
>         if (cde->is_valid || cde->is_failed)
>                 return;
> @@ -877,11 +877,12 @@ static void finished_cached_dirents_count(struct ca=
ched_dirents *cde,
>  static void add_cached_dirent(struct cached_dirents *cde,
>                               struct dir_context *ctx,
>                               const char *name, int namelen,
> -                             struct cifs_fattr *fattr)
> +                             struct cifs_fattr *fattr,
> +                                 struct file *file)
>  {
>         struct cached_dirent *de;
>
> -       if (cde->ctx !=3D ctx)
> +       if (cde->file !=3D file)
>                 return;
>         if (cde->is_valid || cde->is_failed)
>                 return;
> @@ -911,7 +912,8 @@ static void add_cached_dirent(struct cached_dirents *=
cde,
>  static bool cifs_dir_emit(struct dir_context *ctx,
>                           const char *name, int namelen,
>                           struct cifs_fattr *fattr,
> -                         struct cached_fid *cfid)
> +                         struct cached_fid *cfid,
> +                         struct file *file)
>  {
>         bool rc;
>         ino_t ino =3D cifs_uniqueid_to_ino_t(fattr->cf_uniqueid);
> @@ -923,7 +925,7 @@ static bool cifs_dir_emit(struct dir_context *ctx,
>         if (cfid) {
>                 mutex_lock(&cfid->dirents.de_mutex);
>                 add_cached_dirent(&cfid->dirents, ctx, name, namelen,
> -                                 fattr);
> +                                 fattr, file);
>                 mutex_unlock(&cfid->dirents.de_mutex);
>         }
>
> @@ -1023,7 +1025,7 @@ static int cifs_filldir(char *find_entry, struct fi=
le *file,
>         cifs_prime_dcache(file_dentry(file), &name, &fattr);
>
>         return !cifs_dir_emit(ctx, name.name, name.len,
> -                             &fattr, cfid);
> +                             &fattr, cfid, file);
>  }
>
>
> @@ -1074,8 +1076,8 @@ int cifs_readdir(struct file *file, struct dir_cont=
ext *ctx)
>          * we need to initialize scanning and storing the
>          * directory content.
>          */
> -       if (ctx->pos =3D=3D 0 && cfid->dirents.ctx =3D=3D NULL) {
> -               cfid->dirents.ctx =3D ctx;
> +       if (ctx->pos =3D=3D 0 && cfid->dirents.file =3D=3D NULL) {
> +               cfid->dirents.file =3D file;
>                 cfid->dirents.pos =3D 2;
>         }
>         /*
> @@ -1143,7 +1145,7 @@ int cifs_readdir(struct file *file, struct dir_cont=
ext *ctx)
>         } else {
>                 if (cfid) {
>                         mutex_lock(&cfid->dirents.de_mutex);
> -                       finished_cached_dirents_count(&cfid->dirents, ctx=
);
> +                       finished_cached_dirents_count(&cfid->dirents, ctx=
, file);
>                         mutex_unlock(&cfid->dirents.de_mutex);
>                 }
>                 cifs_dbg(FYI, "Could not find entry\n");
> @@ -1184,7 +1186,7 @@ int cifs_readdir(struct file *file, struct dir_cont=
ext *ctx)
>                 ctx->pos++;
>                 if (cfid) {
>                         mutex_lock(&cfid->dirents.de_mutex);
> -                       update_cached_dirents_count(&cfid->dirents, ctx);
> +                       update_cached_dirents_count(&cfid->dirents, file)=
;
>                         mutex_unlock(&cfid->dirents.de_mutex);
>                 }
>
> --
> 2.43.0
>


--=20
Thanks,

Steve

