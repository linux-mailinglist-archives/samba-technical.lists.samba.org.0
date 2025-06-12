Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B78AD7900
	for <lists+samba-technical@lfdr.de>; Thu, 12 Jun 2025 19:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dI1SbB8e38knDmJ+zxjruGIp/w/QqIYx1kxMBUPFR3I=; b=J53UdqjtOB6fccT6HbWOj/c142
	SWkSCMhkGCT73VtVT3pbjlgBvUmbjgUdngVOI/S31CZmDStoPBUQS4hXAwd4wADh5K6cWAbMgRqcp
	PjitZ77CJWPhE7XMIe6tQY8wRm7E75PqjFhs/d5BDgw8fXGNVyQDbU/GVrbH9650qcikW6dF3PmGA
	2V/x2YlFjPMil6EvXvlQOQNKezrKLSXsaH+sNKzNs/G56c+U00F0cXhLjL6+OYTWzYXahVkP3wd9s
	NXhLNH+ZwDLsGX6WvJEJEs2G2Q6E/uxRMmVIT17UHn13tAW/9i/phmEFCkvSXPfUXODC5CbozjOS3
	9DRKxFhg==;
Received: from ip6-localhost ([::1]:25762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uPlji-0074Jq-3J; Thu, 12 Jun 2025 17:29:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:59434) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uPlje-0074Jj-54
 for samba-technical@lists.samba.org; Thu, 12 Jun 2025 17:29:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-606c5c9438fso2650178a12.2
 for <samba-technical@lists.samba.org>; Thu, 12 Jun 2025 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749749345; x=1750354145; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dI1SbB8e38knDmJ+zxjruGIp/w/QqIYx1kxMBUPFR3I=;
 b=L8Cgmj0/MQ8IIddNvb1K1JBZ54hIyA27Gk4KLK5TY/j42GmTp8DdOO0Q3uy0H9ceyw
 fTrum8VufXhzTGSHkLXchnGVOcGtrHoQkYGrjrceNUP0nIK53L5jkvM3lVuqbSIL7yyN
 ZRPxEuA/UAC/rqcG8a8mLFpjbSd0ebt4QAt7wdYZetBV/KfydqrmJb08QhfICqzp1rgp
 wf9v8RoXmBUCblnjv5TT1j6qTI/aaZEsKzcAOlXjj99/QHGno5QTI1Cm5+mgJsNCtaxB
 B7wP6443ao0Q4WzONvCY7KL5Hy8Z/H5QPSWIt0zWrp0wIHVkcarNFIKaO+7mRqy9VCfX
 CxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749749345; x=1750354145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dI1SbB8e38knDmJ+zxjruGIp/w/QqIYx1kxMBUPFR3I=;
 b=I57myV25t6S/QRqpqwZO/J6v1a1jtU3tV6KC7b685K5K1krijTRFLEeQEoA7MlWgkX
 GK5MuKpTDoAzSObNKhgEZxrFBPuvPMNbQ1fbpSMMLEQus2ELhStX6jdVv6sCovvDoWJc
 gfAMLWPkqeuzyXm3CRTU+ZGMge5HRrl4aT4NX9O8CF8BGFsiZsO+EputXuvUiiWZ2USa
 vam5oPcNO+UWcOrNJYJxdWAYA2/7hZIbmSYERHMKKxOrxT8JZuu+9SHddsCWYugupxZH
 VSaQGDjxcwLtg/iV4iC/aanJZuIhHzpwDl6bilM5pxfe7FymPFiSA24WllAiNT5zUsv7
 HG5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuOoJ5GQU1IoqbRbgJ5mbhHm3YmAUOwhlsHtwKEx46uO/VHx7q69oVnJYXGi9d4ZIZ4LCC18YyVYBnWqJ0WZU=@lists.samba.org
X-Gm-Message-State: AOJu0YywHEXmzaAE8vOCRV+o6ew49WuLWykgQVQB1yQr+H3D1Hj9Ipez
 aN3MBIKziw4wQfpr+RUFgLvCDd+gi8ubBEXifgaMDTyqhezQZObAxp3MmkVUEFeLRg6lj1sP32q
 B9wLjFJLeNvoxYGWT+XkzIx5QXPg3pIM=
X-Gm-Gg: ASbGncsvGE+Lu8Xd/t0xcdiOZOSHLRC4c/D7Ll8eXpfpO5cYLHDYyZKSbnyn/sZ7DNs
 eko7CCho93Lq8I7fpPlLvh6c90mtG51KECdwO3hzWkCwTjTbBVv57z61UqcVwP06R1t66fj41DP
 RiTly/LQ3CAsqfVkgwSPQsgjoLth8qwMxoAZG9GxI/yQ==
X-Google-Smtp-Source: AGHT+IE01VyG/r4ztHCMbfZbcP4Zx1hdy7s2/j98R3aBn83AnEw7gEzw+XPgoM3qCwxtlhFFqEaDYzL7kVVRG1jEPeg=
X-Received: by 2002:a05:6402:4408:b0:607:2417:6d04 with SMTP id
 4fb4d7f45d1cf-608af55d1c7mr688968a12.14.1749749345009; Thu, 12 Jun 2025
 10:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250611112902.60071-1-bharathsm@microsoft.com>
 <CAH2r5munktDK1VstQRZ6VcRWyYMasHnR53VM+3i=cz1JYpcpaA@mail.gmail.com>
In-Reply-To: <CAH2r5munktDK1VstQRZ6VcRWyYMasHnR53VM+3i=cz1JYpcpaA@mail.gmail.com>
Date: Thu, 12 Jun 2025 22:58:53 +0530
X-Gm-Features: AX0GCFt_Ub0YNDlpxqAexc0F6OnHyGsxQv8Q3adoiYKFYuoD6ZwoTWSX-NTi9DU
Message-ID: <CANT5p=rC2gd6aD4On4HkojHFz4-547v12Cu1oUBOOzNCMuANFQ@mail.gmail.com>
Subject: Re: [PATCH] smb: improve directory cache reuse for readdir operations
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical <samba-technical@lists.samba.org>,
 Bharath SM <bharathsm@microsoft.com>, paul@darkrain42.org,
 Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 11, 2025 at 8:45=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> merged this updated patch into cifs-2.6.git for-next, running xfstests
> on it now.
>
> Looks very promising, and we have a couple more dir lease
> optimizations to try out that should also help a lot with perf, and
> reducing load on servers by sending fewer metadata ops over the wire
>
> On Wed, Jun 11, 2025 at 6:29=E2=80=AFAM Bharath SM <bharathsm.hsk@gmail.c=
om> wrote:
> >
> > Currently, cached directory contents were not reused across subsequent
> > 'ls' operations because the cache validity check relied on comparing
> > the ctx pointer, which changes with each readdir invocation. As a
> > result, the cached dir entries was not marked as valid and the cache wa=
s
> > not utilized for subsequent 'ls' operations.
> >
> > This change uses the file pointer, which remains consistent across all
> > readdir calls for a given directory instance, to associate and validate
> > the cache. As a result, cached directory contents can now be
> > correctly reused, improving performance for repeated directory listings=
.
> >
> > Performance gains with local windows SMB server:
> >
> > Without the patch and default actimeo=3D1:
> >  1000 directory enumeration operations on dir with 10k files took 135.0=
s
> >
> > With this patch and actimeo=3D0:
> >  1000 directory enumeration operations on dir with 10k files took just =
5.1s
> >
> > Signed-off-by: Bharath SM <bharathsm@microsoft.com>
> > ---
> >  fs/smb/client/cached_dir.h |  8 ++++----
> >  fs/smb/client/readdir.c    | 28 +++++++++++++++-------------
> >  2 files changed, 19 insertions(+), 17 deletions(-)
> >
> > diff --git a/fs/smb/client/cached_dir.h b/fs/smb/client/cached_dir.h
> > index 1dfe79d947a6..bc8a812ff95f 100644
> > --- a/fs/smb/client/cached_dir.h
> > +++ b/fs/smb/client/cached_dir.h
> > @@ -21,10 +21,10 @@ struct cached_dirent {
> >  struct cached_dirents {
> >         bool is_valid:1;
> >         bool is_failed:1;
> > -       struct dir_context *ctx; /*
> > -                                 * Only used to make sure we only take=
 entries
> > -                                 * from a single context. Never derefe=
renced.
> > -                                 */
> > +       struct file *file; /*
> > +                           * Used to associate the cache with a single
> > +                           * open file instance.
> > +                           */
> >         struct mutex de_mutex;
> >         int pos;                 /* Expected ctx->pos */
> >         struct list_head entries;
> > diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
> > index f9f11cbf89be..ba0193cf9033 100644
> > --- a/fs/smb/client/readdir.c
> > +++ b/fs/smb/client/readdir.c
> > @@ -851,9 +851,9 @@ static bool emit_cached_dirents(struct cached_diren=
ts *cde,
> >  }
> >
> >  static void update_cached_dirents_count(struct cached_dirents *cde,
> > -                                       struct dir_context *ctx)
> > +                                       struct file *file)
> >  {
> > -       if (cde->ctx !=3D ctx)
> > +       if (cde->file !=3D file)
> >                 return;
> >         if (cde->is_valid || cde->is_failed)
> >                 return;
> > @@ -862,9 +862,9 @@ static void update_cached_dirents_count(struct cach=
ed_dirents *cde,
> >  }
> >
> >  static void finished_cached_dirents_count(struct cached_dirents *cde,
> > -                                       struct dir_context *ctx)
> > +                                       struct dir_context *ctx, struct=
 file *file)
> >  {
> > -       if (cde->ctx !=3D ctx)
> > +       if (cde->file !=3D file)
> >                 return;
> >         if (cde->is_valid || cde->is_failed)
> >                 return;
> > @@ -877,11 +877,12 @@ static void finished_cached_dirents_count(struct =
cached_dirents *cde,
> >  static void add_cached_dirent(struct cached_dirents *cde,
> >                               struct dir_context *ctx,
> >                               const char *name, int namelen,
> > -                             struct cifs_fattr *fattr)
> > +                             struct cifs_fattr *fattr,
> > +                                 struct file *file)
> >  {
> >         struct cached_dirent *de;
> >
> > -       if (cde->ctx !=3D ctx)
> > +       if (cde->file !=3D file)
> >                 return;
> >         if (cde->is_valid || cde->is_failed)
> >                 return;
> > @@ -911,7 +912,8 @@ static void add_cached_dirent(struct cached_dirents=
 *cde,
> >  static bool cifs_dir_emit(struct dir_context *ctx,
> >                           const char *name, int namelen,
> >                           struct cifs_fattr *fattr,
> > -                         struct cached_fid *cfid)
> > +                         struct cached_fid *cfid,
> > +                         struct file *file)
> >  {
> >         bool rc;
> >         ino_t ino =3D cifs_uniqueid_to_ino_t(fattr->cf_uniqueid);
> > @@ -923,7 +925,7 @@ static bool cifs_dir_emit(struct dir_context *ctx,
> >         if (cfid) {
> >                 mutex_lock(&cfid->dirents.de_mutex);
> >                 add_cached_dirent(&cfid->dirents, ctx, name, namelen,
> > -                                 fattr);
> > +                                 fattr, file);
> >                 mutex_unlock(&cfid->dirents.de_mutex);
> >         }
> >
> > @@ -1023,7 +1025,7 @@ static int cifs_filldir(char *find_entry, struct =
file *file,
> >         cifs_prime_dcache(file_dentry(file), &name, &fattr);
> >
> >         return !cifs_dir_emit(ctx, name.name, name.len,
> > -                             &fattr, cfid);
> > +                             &fattr, cfid, file);
> >  }
> >
> >
> > @@ -1074,8 +1076,8 @@ int cifs_readdir(struct file *file, struct dir_co=
ntext *ctx)
> >          * we need to initialize scanning and storing the
> >          * directory content.
> >          */
> > -       if (ctx->pos =3D=3D 0 && cfid->dirents.ctx =3D=3D NULL) {
> > -               cfid->dirents.ctx =3D ctx;
> > +       if (ctx->pos =3D=3D 0 && cfid->dirents.file =3D=3D NULL) {
> > +               cfid->dirents.file =3D file;
> >                 cfid->dirents.pos =3D 2;
> >         }
> >         /*
> > @@ -1143,7 +1145,7 @@ int cifs_readdir(struct file *file, struct dir_co=
ntext *ctx)
> >         } else {
> >                 if (cfid) {
> >                         mutex_lock(&cfid->dirents.de_mutex);
> > -                       finished_cached_dirents_count(&cfid->dirents, c=
tx);
> > +                       finished_cached_dirents_count(&cfid->dirents, c=
tx, file);
> >                         mutex_unlock(&cfid->dirents.de_mutex);
> >                 }
> >                 cifs_dbg(FYI, "Could not find entry\n");
> > @@ -1184,7 +1186,7 @@ int cifs_readdir(struct file *file, struct dir_co=
ntext *ctx)
> >                 ctx->pos++;
> >                 if (cfid) {
> >                         mutex_lock(&cfid->dirents.de_mutex);
> > -                       update_cached_dirents_count(&cfid->dirents, ctx=
);
> > +                       update_cached_dirents_count(&cfid->dirents, fil=
e);
> >                         mutex_unlock(&cfid->dirents.de_mutex);
> >                 }
> >
> > --
> > 2.43.0
> >
>
>
> --
> Thanks,
>
> Steve
>
Looks good to me. You can add my RB.

--=20
Regards,
Shyam

