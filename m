Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E6D8490F0
	for <lists+samba-technical@lfdr.de>; Sun,  4 Feb 2024 22:58:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7CjCxiSJkm9OfsI1W1Cwfy9duny+rRipupV8xlV0TRM=; b=m4wXleJYHJOdNRavDb9kHnptkM
	QsfZQ4O9WepeFfJT+skYroTIT9D6UwwPHWw/fTBouseUrzXfu7z6Pr6ewF1B31vlI4fYe54AS20zj
	QGUJ3wVRHExNwpGPwCOUxnBuWGWV59UeRDvNL0w9zZCAUBzvtLc1g7MTzyakdiYwBASUTdyUZ8Tzh
	sQpb0CPv/W9fpD4pTb5VE5o/OvNXy8J5Ft2LMwuOkvfovs7CbiCIFaI/dSg9Bx9ZLuQ0Mi3elKMN1
	KrfzFg04Bjr0wMPEi2/wRDVAus6n/e8SeUYTgDFXFiyEKiJJp70yh2ijKNpLCYYkA+7mTTjiJ7fY0
	on75VM5w==;
Received: from ip6-localhost ([::1]:18282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rWkV1-007TWX-88; Sun, 04 Feb 2024 21:58:03 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:54532) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rWkUw-007TWQ-IR
 for samba-technical@lists.samba.org; Sun, 04 Feb 2024 21:58:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5114cd44f6aso468307e87.1
 for <samba-technical@lists.samba.org>; Sun, 04 Feb 2024 13:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707083875; x=1707688675; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7CjCxiSJkm9OfsI1W1Cwfy9duny+rRipupV8xlV0TRM=;
 b=jnXppp258IpfyeEoVuYUVBPNOsv2CTkAJ4cIDPtIuney+uOXRDxO5rc4n+6dRZd3tp
 /9rs79y7Xd6I5fSSbFS+SodsKKPzS0aOY1TueDX6empQHZvit1J8HHOfjchAes9fbg15
 gn2eL+7jBamUrfeZmdtY/NAGTGDca5GoGK2M4xDqZGQ6scQiETHZGRGZI81Lx/xpSA+f
 mKARv6M2x2tqIoiG50L7vubxSWX6EwQoB7NkFcTkVqC3742MmGba9rn6CYwNFW4eM3jp
 CGkjHZEyygijfn+ZTYFTmNhR8yLpnSxpaNct+myqLGDagWdXqn5Jag546KpabapkTeWO
 QKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707083875; x=1707688675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7CjCxiSJkm9OfsI1W1Cwfy9duny+rRipupV8xlV0TRM=;
 b=Ml0CQxL/+eW+NRymHDT+hmLzydZwGyX6nepdub8vr/jJXKIIbOc0EOpnNKGC8lJmfC
 olpt4l4HuljKx5p00eWPDFjgAz96IsJGdgfFTR63lDe0peknxvP7PXqDMOfYD1u/F+Jc
 oO7dqymPgvA1bj71UhnRZWtd2dMZNky95oCXZdZxf0eXMncdTM+3hvJRogn+M2tlIJRy
 AtWjVE16MdozKj4/k8IaAha8gbQL6cWrCRrM8vPk0yyMPSNEBaRz7kx1IYLeipKPrNlD
 IR4ZJ6KOhQNVuN2w+STCwUWPBQvxA2sEq0XPdf8s00H/rz10OgiD6q95vAqjmI3KO2nR
 hmZQ==
X-Gm-Message-State: AOJu0YxarApCcw9vW/Yh9XtjZa+WWmvmxv7+3EQPE1SNXQ1GXvkdBR5L
 BqF75xJ/H2RMSgSsSKZN3kGubk2UI8Xihc7gAVVBdP/ueSd9QShhtwRsQkzoXrUdt5Q/iBCQva1
 v4Vn6vkH/GkpLErqBvgbgU68evsw=
X-Google-Smtp-Source: AGHT+IH/0SSshHS/A5IFRd1z8dYjtlDX3mJJumoqB3JoKjAjnGtDkdVVFH4lUEH+D3YdCt9yxk35D9cBEd5f6oXMbvU=
X-Received: by 2002:ac2:4e0a:0:b0:511:48ab:2f9c with SMTP id
 e10-20020ac24e0a000000b0051148ab2f9cmr2892478lfr.42.1707083875131; Sun, 04
 Feb 2024 13:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20240202170537.409508-1-meetakshisetiyaoss@gmail.com>
In-Reply-To: <20240202170537.409508-1-meetakshisetiyaoss@gmail.com>
Date: Sun, 4 Feb 2024 15:57:43 -0600
Message-ID: <CAH2r5msEtpJGTvK2F2TY0jR9hU0e7LYJekiyV1zD7MM+i9Oxgg@mail.gmail.com>
Subject: Re: [PATCH] smb: client: do not defer close open handles to deleted
 files
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
Cc: pc@manguebit.com, nspmangalore@gmail.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, tom@talpey.com, msetiya@microsoft.com,
 bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This was puzzling because I tried some experiments with deleting files
that were deferred close and noticed that we already making sure that
they weren't deferred close in cifs_unlink by calling
cifs_close_deferred_file_under_dentry(tcon, full_path) even in
Rohith's original code from a few years ago - so I didn't see cases
where we had a file marked for delete that was deferred close.  How
did you reproduce that problem?

On Fri, Feb 2, 2024 at 11:39=E2=80=AFAM <meetakshisetiyaoss@gmail.com> wrot=
e:
>
> From: Meetakshi Setiya <msetiya@microsoft.com>
>
> When a file/dentry has been deleted before closing all its open
> handles, currently, closing them can add them to the deferred close
> list. This can lead to problems in creating file with the same name
> when the file is re-created before the deferred close completes. This
> issue was seen while reusing a client's already existing lease on a
> file for compound operations and xfstest 591 failed because of the
> deferred close handle that remained valid even after the file was
> deleted and was being reused to create a file with the same name. The
> server in this case returns an error on open with
> STATUS_DELETE_PENDING. Recreating the file would fail till the
> deferred handles are closed (duration specified in closetimeo).
>
> This patch fixes the issue by flagging all open handles for the
> deleted file (file path to be precise) with FILE_DELETED at the end
> of the unlink operation. When doing close in cifs_close for each of
> these handles, check the flag and do not defer close these handles if
> the corresponding filepath has been deleted.
>
> Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> ---
>  fs/smb/client/cifsglob.h  |  1 +
>  fs/smb/client/cifsproto.h |  4 ++++
>  fs/smb/client/file.c      |  2 +-
>  fs/smb/client/inode.c     |  2 ++
>  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
>  5 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index decf80131bbe..826da216a9e1 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -1399,6 +1399,7 @@ struct cifs_fid_locks {
>         struct list_head locks;         /* locks held by fid above */
>  };
>
> +#define FILE_DELETED   0x550
>  struct cifsFileInfo {
>         /* following two lists are protected by tcon->open_file_lock */
>         struct list_head tlist; /* pointer to next fid owned by tcon */
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index 770db9026850..67f75497db02 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -292,6 +292,10 @@ extern void cifs_close_all_deferred_files(struct cif=
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
> index b75282c204da..4c87ddbe8a5a 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -1085,7 +1085,7 @@ int cifs_close(struct inode *inode, struct file *fi=
le)
>                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =3D=3D CI=
FS_CACHE_RHW_FLG)
>                     && cinode->lease_granted &&
>                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &&
> -                   dclose) {
> +                   dclose && !(cfile->f_flags & FILE_DELETED)) {
>                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &c=
inode->flags)) {
>                                 inode_set_mtime_to_ts(inode,
>                                                       inode_set_ctime_cur=
rent(inode));
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 24489e1e238a..be5bc01319d8 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -1822,6 +1822,8 @@ int cifs_unlink(struct inode *dir, struct dentry *d=
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
> index 0748d7b757b9..ebc867bfc034 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct cifs_tc=
on *tcon, const char *path)
>         free_dentry_path(page);
>  }
>
> +/*
> + * If a dentry has been deleted, all corresponding open handles should k=
now the
> + * same, so that we do not defer close them.
> + */
> +void
> +cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tcon, const ch=
ar
> +*path)
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
> +                       cfile->f_flags |=3D FILE_DELETED;
> +       }
> +       spin_unlock(&tcon->open_file_lock);
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

