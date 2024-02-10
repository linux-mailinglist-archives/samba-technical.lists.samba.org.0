Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B47968502B5
	for <lists+samba-technical@lfdr.de>; Sat, 10 Feb 2024 07:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Wek0JZ73neh6GWKWE+h3Kw/oFlmB85kyLUmRA1c2rc4=; b=0ZAbGFoe5AWMxdhc+4cDvKXwy1
	/UYxi8v1J2XT9OpP0G4MJ4ppzE7o812aqZRDzxzQVIuJbNlf5hWmmMRI+mytO/RWIFo5YI6/reMAO
	ZG83mwujqWjuU9YUOGDsLKfMRDM6k+xKMmiy9zQooNuBLJU57STK/7BztUeq5LcPcJrX3mxxCY6Ul
	pEaIFuY23U6lESx+f15/Pjp+LGnaTQyNLitHGcg9B0VE844/D+ysy38jojUxx27BYeAEPCOQyis+7
	L5T3iFpyEnvTEGEmQHXu/fa+gRIQxGWiirIB4ud60nmniHEdZA6MYCUTfDA04xXwTIIgIF7/01/k6
	9ouQ4c/Q==;
Received: from ip6-localhost ([::1]:23162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rYgP0-0082NM-VP; Sat, 10 Feb 2024 05:59:51 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:42318) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rYgOv-0082NF-HR
 for samba-technical@lists.samba.org; Sat, 10 Feb 2024 05:59:48 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d0bc402c8eso16559211fa.1
 for <samba-technical@lists.samba.org>; Fri, 09 Feb 2024 21:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707544779; x=1708149579; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wek0JZ73neh6GWKWE+h3Kw/oFlmB85kyLUmRA1c2rc4=;
 b=EN09RWrQOD7EVxes6SFYlVRRdLUdwfUs+lPOmUtaBh8v0XlHRp71nyVJEH2j3qK5YO
 cy2+hjXf0diiViSVrfO+gH8UWI/L2al+seVmICEAdwAxaqGQ0dP7uVrFDs33oqDx6B07
 AeRGROsylW4cVL473QK/9OgazDP17TZBx+uRVvi61rBoBB1Fvctkvguq11zloqyfBL44
 j0FbviM0Dy3a3oGmUNIcDkU+cYpT1aPwkoKz3co/9wpLtyYyt/Z+sTDaBQp2KAIBhPzf
 fJbT7X6QzNf8NKO2rU1bGhxj/l5cAKa6X5h9RwbCreKnqfMNhqXNmY3AsP0Tszi5giQ6
 h3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707544779; x=1708149579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wek0JZ73neh6GWKWE+h3Kw/oFlmB85kyLUmRA1c2rc4=;
 b=npnivmNVNlsm8GomP+v70VmS3Q+RwrioXKJ9axAMkktOAUaGF2NDSbOWwkeaEngToI
 MXuc/s/5g9GoWwlvwxQgBknhClC6LF+8pbPdPQC/hWNI8MwdoAv8KLDk4o4ENVTdKzW5
 KDoLVTQpIQNk4BvtTkA/y3go021qgVFODXSZByhSTNtKzxmq0mKKPzn3jyohrx5OVdUm
 +zz+MF3NzbCl9jmfi6gRLJImp3G0ag4tBEuvhsFCPLS8hbYdndd7chZXWxzpJhH6ufXh
 J3IG8TIDjQ6CR31AacyuiHKMi9GNsgrxjxoNMAs4tIlcL9JzYLLRAEuzGcZGDp3bqs6B
 f63g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqKzy8UGoY3v4zZ5vjAvsHw6k5C6jcOadx2eaqAT3VhWGT7EAUDYsTksQ19gXMjpYLsd5OmkM///WB7RRdevY0UotBM3EHuv3dWqE54xfB
X-Gm-Message-State: AOJu0YzYhyevcafGFqDtOaJLeKUblriExrs/Qp7a7vQHulFuvICd+onN
 uCPO21+N+85wcFI7+4da/XSjv5VMtCVLa+CLlRtOUppMvAGTMuckfKFygthGd6dcYrR6DDouL3C
 aUlJrwpK89yuyYm/CcS6o7jzU+mc=
X-Google-Smtp-Source: AGHT+IGUheCrBWLlcPoGm3XubVoPIaG12TmgizWAJUUFkm986wGle/8z1Qj10eQ/1UYDB1ycYIG+up5tXrPODBrikPU=
X-Received: by 2002:a2e:bc08:0:b0:2cf:57d7:6d35 with SMTP id
 b8-20020a2ebc08000000b002cf57d76d35mr1332543ljf.10.1707544778728; Fri, 09 Feb
 2024 21:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20240209131552.471765-1-meetakshisetiyaoss@gmail.com>
In-Reply-To: <20240209131552.471765-1-meetakshisetiyaoss@gmail.com>
Date: Fri, 9 Feb 2024 23:59:26 -0600
Message-ID: <CAH2r5mtdebsVFbOoQeYYL79GVXe0wn=GfdgVE1RkQrnowHOO5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] smb: client: do not defer close open handles to
 deleted files
To: meetakshisetiyaoss@gmail.com
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
 linux-kernel@vger.kernel.org, sfrench@samba.org, nspmangalore@gmail.com,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

could we make the "file_is_deleted" a boolean instead of using up more
space making it an int?

Alternatively - would it be possible to simply look at the file
attributes to see if it was marked as deleted (ie we should already be
setting ATTR_DELETE_ON_CLOSE)

On Fri, Feb 9, 2024 at 7:17=E2=80=AFAM <meetakshisetiyaoss@gmail.com> wrote=
:
>
> From: Meetakshi Setiya <msetiya@microsoft.com>
>
> When a file/dentry has been deleted before closing all its open handles,
> currently, closing them can add them to the deferred close list. This can
> lead to problems in creating file with the same name when the file is
> re-created before the deferred close completes. This issue was seen while
> reusing a client's already existing lease on a file for compound operatio=
ns
> and xfstest 591 failed because of the deferred close handle that remained
> valid even after the file was deleted and was being reused to create a fi=
le
> with the same name. The server in this case returns an error on open with
> STATUS_DELETE_PENDING. Recreating the file would fail till the deferred
> handles are closed (duration specified in closetimeo).
>
> This patch fixes the issue by flagging all open handles for the deleted
> file (file path to be precise) with FILE_DELETED at the end of the unlink
> operation. A new field cflags has been introduced in the cifsFileInfo
> structure to set the FILE_DELETED flag without interfering with the f_fla=
gs
> field. This cflags field could be useful in the future for setting more
> flags specific to cfile.
> When doing close in cifs_close for each of these handles, check the
> FILE_DELETED flag and do not defer close these handles if the correspondi=
ng
> filepath has been deleted.
>
> Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> ---
>  fs/smb/client/cifsglob.h  |  3 +++
>  fs/smb/client/cifsproto.h |  4 ++++
>  fs/smb/client/file.c      |  3 ++-
>  fs/smb/client/inode.c     |  2 ++
>  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
>  5 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index 16befff4cbb4..f6b4acdcdeb3 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -1398,6 +1398,8 @@ struct cifs_fid_locks {
>         struct list_head locks;         /* locks held by fid above */
>  };
>
> +#define FILE_DELETED 00000001
> +
>  struct cifsFileInfo {
>         /* following two lists are protected by tcon->open_file_lock */
>         struct list_head tlist; /* pointer to next fid owned by tcon */
> @@ -1413,6 +1415,7 @@ struct cifsFileInfo {
>         struct dentry *dentry;
>         struct tcon_link *tlink;
>         unsigned int f_flags;
> +       unsigned int cflags;    /* flags for this file */
>         bool invalidHandle:1;   /* file closed via session abend */
>         bool swapfile:1;
>         bool oplock_break_cancelled:1;
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index a841bf4967fa..f995b766b177 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -296,6 +296,10 @@ extern void cifs_close_all_deferred_files(struct cif=
s_tcon *cifs_tcon);
>
>  extern void cifs_close_deferred_file_under_dentry(struct cifs_tcon *cifs=
_tcon,
>                                 const char *path);
> +
> +extern void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon
> +                               *cifs_tcon, const char *path);
> +
>  extern struct TCP_Server_Info *
>  cifs_get_tcp_session(struct smb3_fs_context *ctx,
>                      struct TCP_Server_Info *primary_server);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b75282c204da..91cf4d2df4de 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fi=
d *fid, struct file *file,
>         cfile->uid =3D current_fsuid();
>         cfile->dentry =3D dget(dentry);
>         cfile->f_flags =3D file->f_flags;
> +       cfile->cflags =3D 0;
>         cfile->invalidHandle =3D false;
>         cfile->deferred_close_scheduled =3D false;
>         cfile->tlink =3D cifs_get_tlink(tlink);
> @@ -1085,7 +1086,7 @@ int cifs_close(struct inode *inode, struct file *fi=
le)
>                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =3D=3D CI=
FS_CACHE_RHW_FLG)
>                     && cinode->lease_granted &&
>                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &&
> -                   dclose) {
> +                   dclose && !(cfile->cflags & FILE_DELETED)) {
>                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &c=
inode->flags)) {
>                                 inode_set_mtime_to_ts(inode,
>                                                       inode_set_ctime_cur=
rent(inode));
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index d02f8ba29cb5..8121b5b1aa22 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -1900,6 +1900,8 @@ int cifs_unlink(struct inode *dir, struct dentry *d=
entry)
>         cifs_inode =3D CIFS_I(dir);
>         CIFS_I(dir)->time =3D 0;  /* force revalidate of dir as well */
>  unlink_out:
> +       if (rc =3D=3D 0)
> +               cifs_mark_open_handles_for_deleted_file(tcon, full_path);
>         free_dentry_path(page);
>         kfree(attrs);
>         free_xid(xid);
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index 0748d7b757b9..8e46dee1a36c 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct cifs_tc=
on *tcon, const char *path)
>         free_dentry_path(page);
>  }
>
> +/*
> + * If a dentry has been deleted, all corresponding open handles should k=
now that
> + * so that we do not defer close them.
> + */
> +void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tcon,
> +                                            const char *path)
> +{
> +       struct cifsFileInfo *cfile;
> +       void *page;
> +       const char *full_path;
> +
> +       page =3D alloc_dentry_path();
> +       spin_lock(&tcon->open_file_lock);
> +       list_for_each_entry(cfile, &tcon->openFileList, tlist) {
> +               full_path =3D build_path_from_dentry(cfile->dentry, page)=
;
> +               if (strcmp(full_path, path) =3D=3D 0)
> +                       cfile->cflags |=3D FILE_DELETED;
> +       }
> +       spin_unlock(&tcon->open_file_lock);
> +       free_dentry_path(page);
> +}
> +
>  /* parses DFS referral V3 structure
>   * caller is responsible for freeing target_nodes
>   * returns:
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

