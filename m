Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 417DA872F41
	for <lists+samba-technical@lfdr.de>; Wed,  6 Mar 2024 08:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ao/NqUHnXz0y/dqbjymF0MdeSFoyjq+6regVYQoE+cU=; b=3AtiMLmA+xgxT4u98TvE9WBysl
	ArM2QRzocrVi71uelS+SmZ2WcjGT/49zFFwKiUhf6W3nNBfAJUZ1mSILzfGuC2eDj7ZqEfl50daVO
	ToTZTArvgAifuO3IQjKWRWCELPIZejKFJqaMxd9/dUlowbL/4AGyY2qf/tvjBVe3MliKanIcPhqcX
	WQNbfEBhusfhYR74YK2qYv3RDYKbAUvc14xUZAHLmuNI3WoQXhJHpY+xNEp7B/Jme4qyym7lvVzKB
	88vXDpFpu4VXTC2B4lm4k4cKWNktmrcChHk2cln4ld3yiA1Na7N7ARvXJw86WbCxBMZJS85F9P0zy
	oOorqkqw==;
Received: from ip6-localhost ([::1]:64940 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rhlPn-00Bvrt-5J; Wed, 06 Mar 2024 07:10:11 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:56620) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rhlPH-00Bvrm-H3
 for samba-technical@lists.samba.org; Wed, 06 Mar 2024 07:09:44 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d27184197cso90731001fa.1
 for <samba-technical@lists.samba.org>; Tue, 05 Mar 2024 23:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709708978; x=1710313778; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ao/NqUHnXz0y/dqbjymF0MdeSFoyjq+6regVYQoE+cU=;
 b=bBxU7YX6NrkZtwA5LIYks15fLC+06BF7SA6VAnXGqmjyu/xVObJ0vzaJc5q3WAK0IA
 EIpiaYm+C/pIxvFHeovN2e5v6DQBalMCQCyAOyMv0Dmdj/a35IhG9/oj6enJFjcz0Dsr
 qSljB8EBZmO6q7dO09pjEAqtZGBMVoRaTI42z+ADXaG0LJOgo5MO6/oyOTgCQt4ZPOWp
 XbEXdKXr4BW9l9gWrFSNhJ42WWcPvotZKqx2xVxj1CuEkskJPKDs56mOE0Q3aIAbfzRO
 UFy26R9V8b9WicFAxof9XyprXE7ggR6ITSEg+fYwdt1rSwxYeqlUIqjgn56w8KHJz5gk
 Zjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709708978; x=1710313778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ao/NqUHnXz0y/dqbjymF0MdeSFoyjq+6regVYQoE+cU=;
 b=gwCAMn4Y9eQ3VgtgpBJV7ulA5vgLv2uzvnWYTZMB5fGMbrRVRXraOG/WM+Tako/II8
 Xi+C78andTqqVwYCKNF5PCAuPgeJtz2kGpI1Dq6Rk0yOlp8zJ5spHjgA+UdazhtzWR+m
 gvLPMDEvtehyY18tqFDSowDLm8GmuU8TAlKuGtsPWa0JEAiXmQAaVJHBIHKMABFDlFf8
 vd4I0aOswGLdp+9gguxYCEgLSUjQ1xNDIMRCqj2g7yiYojegDmbZg3b4hGwKov8mJSPC
 d48QT0WSqXHFZ8Gkn91N0eVUzsCdAY4PtvThR3X3gNq01RCMAToo5w/UyNnv1J1loAwW
 h9yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCHgeT5gs4WHbKZYHEtlJMmMHYw6g3nKPKnpm9Lxz63EirKFUEpvw4vZZ9anpaVHOgaWb/H5ZHEBYLFT/Fshy6uS0ECU7ePjOBu+p08asY
X-Gm-Message-State: AOJu0Ywu9MAiTnGlq6cYbOtxZJK1sPTHCg8CHnyniJ3L7OIoj9mIgtZz
 50wCaa6cmaaZ2ADqyB0+mhISw6j6rHAm01ALWJ5yfAUN6RRse27GSezI8m0fHILTA2swC7o7DK7
 bVNH+dwdQ8mmibKxg1jT61vte6lHCUhq9h/LXOQ==
X-Google-Smtp-Source: AGHT+IHEXGZGzM810gptGkkjCkQG6oalmgYTpxBuR9tExjJMf3LON51g7QyuOvfN3tMBE7e75vN8ehUOaY5/mnhRqbY=
X-Received: by 2002:a2e:86c8:0:b0:2d2:e784:abc2 with SMTP id
 n8-20020a2e86c8000000b002d2e784abc2mr2836590ljj.33.1709708977667; Tue, 05 Mar
 2024 23:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20240306034353.190039-1-meetakshisetiyaoss@gmail.com>
 <20240306034353.190039-2-meetakshisetiyaoss@gmail.com>
In-Reply-To: <20240306034353.190039-2-meetakshisetiyaoss@gmail.com>
Date: Wed, 6 Mar 2024 01:09:25 -0600
Message-ID: <CAH2r5mtt0aBrWCK3QgkHv7HHv0wpRHeOVM=5aXr=E5MFsmfFfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] smb: client: do not defer close open handles to
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

Merged the three patches into cifs-2.6.git pending testing but I had
to rebase this one.  I also had to rebase one of Paulo's patches "smb:
client: move most of reparse point handling code to common file"

If you see anything wrong with the minor rebase let me know.

On Tue, Mar 5, 2024 at 9:44=E2=80=AFPM <meetakshisetiyaoss@gmail.com> wrote=
:
>
> From: Meetakshi Setiya <msetiya@microsoft.com>
>
> When a file/dentry has been deleted before closing all its open
> handles, currently, closing them can add them to the deferred
> close list. This can lead to problems in creating file with the
> same name when the file is re-created before the deferred close
> completes. This issue was seen while reusing a client's already
> existing lease on a file for compound operations and xfstest 591
> failed because of the deferred close handle that remained valid
> even after the file was deleted and was being reused to create a
> file with the same name. The server in this case returns an error
> on open with STATUS_DELETE_PENDING. Recreating the file would
> fail till the deferred handles are closed (duration specified in
> closetimeo).
>
> This patch fixes the issue by flagging all open handles for the
> deleted file (file path to be precise) by setting
> status_file_deleted to true in the cifsFileInfo structure. As per
> the information classes specified in MS-FSCC, SMB2 query info
> response from the server has a DeletePending field, set to true
> to indicate that deletion has been requested on that file. If
> this is the case, flag the open handles for this file too.
>
> When doing close in cifs_close for each of these handles, check the
> value of this boolean field and do not defer close these handles
> if the corresponding filepath has been deleted.
>
> Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> ---
>  fs/smb/client/cifsglob.h  |  1 +
>  fs/smb/client/cifsproto.h |  4 ++++
>  fs/smb/client/file.c      |  3 ++-
>  fs/smb/client/inode.c     | 28 +++++++++++++++++++++++++---
>  fs/smb/client/misc.c      | 34 ++++++++++++++++++++++++++++++++++
>  fs/smb/client/smb2inode.c |  9 ++++++++-
>  6 files changed, 74 insertions(+), 5 deletions(-)
>
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index 50f7e47c2229..a88c8328b29c 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -1417,6 +1417,7 @@ struct cifsFileInfo {
>         bool invalidHandle:1;   /* file closed via session abend */
>         bool swapfile:1;
>         bool oplock_break_cancelled:1;
> +       bool status_file_deleted:1; /* file has been deleted */
>         unsigned int oplock_epoch; /* epoch from the lease break */
>         __u32 oplock_level; /* oplock/lease level from the lease break */
>         int count;
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index ef98c840791f..1f46e0db6e92 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -296,6 +296,10 @@ extern void cifs_close_all_deferred_files(struct cif=
s_tcon *cifs_tcon);
>
>  extern void cifs_close_deferred_file_under_dentry(struct cifs_tcon *cifs=
_tcon,
>                                 const char *path);
> +
> +extern void cifs_mark_open_handles_for_deleted_file(struct inode *inode,
> +                               const char *path);
> +
>  extern struct TCP_Server_Info *
>  cifs_get_tcp_session(struct smb3_fs_context *ctx,
>                      struct TCP_Server_Info *primary_server);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index b75282c204da..46951f403d31 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct cifs_fi=
d *fid, struct file *file,
>         cfile->uid =3D current_fsuid();
>         cfile->dentry =3D dget(dentry);
>         cfile->f_flags =3D file->f_flags;
> +       cfile->status_file_deleted =3D false;
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
> +                   dclose && !(cfile->status_file_deleted)) {
>                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &c=
inode->flags)) {
>                                 inode_set_mtime_to_ts(inode,
>                                                       inode_set_ctime_cur=
rent(inode));
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 3073eac989ea..3242e3b74386 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -893,6 +893,9 @@ cifs_get_file_info(struct file *filp)
>         struct cifsFileInfo *cfile =3D filp->private_data;
>         struct cifs_tcon *tcon =3D tlink_tcon(cfile->tlink);
>         struct TCP_Server_Info *server =3D tcon->ses->server;
> +       struct dentry *dentry =3D filp->f_path.dentry;
> +       void *page =3D alloc_dentry_path();
> +       const unsigned char *path;
>
>         if (!server->ops->query_file_info)
>                 return -ENOSYS;
> @@ -907,7 +910,14 @@ cifs_get_file_info(struct file *filp)
>                         data.symlink =3D true;
>                         data.reparse.tag =3D IO_REPARSE_TAG_SYMLINK;
>                 }
> +               path =3D build_path_from_dentry(dentry, page);
> +               if (IS_ERR(path)) {
> +                       free_dentry_path(page);
> +                       return PTR_ERR(path);
> +               }
>                 cifs_open_info_to_fattr(&fattr, &data, inode->i_sb);
> +               if (fattr.cf_flags & CIFS_FATTR_DELETE_PENDING)
> +                       cifs_mark_open_handles_for_deleted_file(inode, pa=
th);
>                 break;
>         case -EREMOTE:
>                 cifs_create_junction_fattr(&fattr, inode->i_sb);
> @@ -937,6 +947,7 @@ cifs_get_file_info(struct file *filp)
>         rc =3D cifs_fattr_to_inode(inode, &fattr);
>  cgfi_exit:
>         cifs_free_open_info(&data);
> +       free_dentry_path(page);
>         free_xid(xid);
>         return rc;
>  }
> @@ -1075,6 +1086,7 @@ static int reparse_info_to_fattr(struct cifs_open_i=
nfo_data *data,
>         struct kvec rsp_iov, *iov =3D NULL;
>         int rsp_buftype =3D CIFS_NO_BUFFER;
>         u32 tag =3D data->reparse.tag;
> +       struct inode *inode =3D NULL;
>         int rc =3D 0;
>
>         if (!tag && server->ops->query_reparse_point) {
> @@ -1114,8 +1126,12 @@ static int reparse_info_to_fattr(struct cifs_open_=
info_data *data,
>
>         if (tcon->posix_extensions)
>                 smb311_posix_info_to_fattr(fattr, data, sb);
> -       else
> +       else {
>                 cifs_open_info_to_fattr(fattr, data, sb);
> +               inode =3D cifs_iget(sb, fattr);
> +               if (inode && fattr->cf_flags & CIFS_FATTR_DELETE_PENDING)
> +                       cifs_mark_open_handles_for_deleted_file(inode, fu=
ll_path);
> +       }
>  out:
>         fattr->cf_cifstag =3D data->reparse.tag;
>         free_rsp_buf(rsp_buftype, rsp_iov.iov_base);
> @@ -1170,6 +1186,8 @@ static int cifs_get_fattr(struct cifs_open_info_dat=
a *data,
>                                                    full_path, fattr);
>                 } else {
>                         cifs_open_info_to_fattr(fattr, data, sb);
> +                       if (fattr->cf_flags & CIFS_FATTR_DELETE_PENDING)
> +                               cifs_mark_open_handles_for_deleted_file(*=
inode, full_path);
>                 }
>                 break;
>         case -EREMOTE:
> @@ -1850,16 +1868,20 @@ int cifs_unlink(struct inode *dir, struct dentry =
*dentry)
>
>  psx_del_no_retry:
>         if (!rc) {
> -               if (inode)
> +               if (inode) {
> +                       cifs_mark_open_handles_for_deleted_file(inode, fu=
ll_path);
>                         cifs_drop_nlink(inode);
> +               }
>         } else if (rc =3D=3D -ENOENT) {
>                 d_drop(dentry);
>         } else if (rc =3D=3D -EBUSY) {
>                 if (server->ops->rename_pending_delete) {
>                         rc =3D server->ops->rename_pending_delete(full_pa=
th,
>                                                                 dentry, x=
id);
> -                       if (rc =3D=3D 0)
> +                       if (rc =3D=3D 0) {
> +                               cifs_mark_open_handles_for_deleted_file(i=
node, full_path);
>                                 cifs_drop_nlink(inode);
> +                       }
>                 }
>         } else if ((rc =3D=3D -EACCES) && (dosattr =3D=3D 0) && inode) {
>                 attrs =3D kzalloc(sizeof(*attrs), GFP_KERNEL);
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index 0748d7b757b9..9428a0db7718 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -853,6 +853,40 @@ cifs_close_deferred_file_under_dentry(struct cifs_tc=
on *tcon, const char *path)
>         free_dentry_path(page);
>  }
>
> +/*
> + * If a dentry has been deleted, all corresponding open handles should k=
now that
> + * so that we do not defer close them.
> + */
> +void cifs_mark_open_handles_for_deleted_file(struct inode *inode,
> +                                            const char *path)
> +{
> +       struct cifsFileInfo *cfile;
> +       void *page;
> +       const char *full_path;
> +       struct cifsInodeInfo *cinode =3D CIFS_I(inode);
> +
> +       page =3D alloc_dentry_path();
> +       spin_lock(&cinode->open_file_lock);
> +
> +       /*
> +        * note: we need to construct path from dentry and compare only i=
f the
> +        * inode has any hardlinks. When number of hardlinks is 1, we can=
 just
> +        * mark all open handles since they are going to be from the same=
 file.
> +        */
> +       if (inode->i_nlink > 1) {
> +               list_for_each_entry(cfile, &cinode->openFileList, flist) =
{
> +                       full_path =3D build_path_from_dentry(cfile->dentr=
y, page);
> +                       if (!IS_ERR(full_path) && strcmp(full_path, path)=
 =3D=3D 0)
> +                               cfile->status_file_deleted =3D true;
> +               }
> +       } else {
> +               list_for_each_entry(cfile, &cinode->openFileList, flist)
> +                       cfile->status_file_deleted =3D true;
> +       }
> +       spin_unlock(&cinode->open_file_lock);
> +       free_dentry_path(page);
> +}
> +
>  /* parses DFS referral V3 structure
>   * caller is responsible for freeing target_nodes
>   * returns:
> diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
> index 69f3442c5b96..429d83d31280 100644
> --- a/fs/smb/client/smb2inode.c
> +++ b/fs/smb/client/smb2inode.c
> @@ -561,8 +561,15 @@ static int smb2_compound_op(const unsigned int xid, =
struct cifs_tcon *tcon,
>                 case SMB2_OP_DELETE:
>                         if (rc)
>                                 trace_smb3_delete_err(xid,  ses->Suid, tc=
on->tid, rc);
> -                       else
> +                       else {
> +                               /*
> +                                * If dentry (hence, inode) is NULL, leas=
e break is going to
> +                                * take care of degrading leases on handl=
es for deleted files.
> +                                */
> +                               if (inode)
> +                                       cifs_mark_open_handles_for_delete=
d_file(inode, full_path);
>                                 trace_smb3_delete_done(xid, ses->Suid, tc=
on->tid);
> +                       }
>                         break;
>                 case SMB2_OP_MKDIR:
>                         if (rc)
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

