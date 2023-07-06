Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3C74A0F8
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jul 2023 17:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oBODeVbuwojKcNDean02YI8ZZtZRDm3e6bJ2J8Lxr0U=; b=GE9NNWCSMxs7+d8OTjZKK0Cl+u
	lTyIDKKcIX61v0muoEIatZRXmbBX36JFx8Rcb6G0MNZfEj+H4ajCINrrSRGBQhmHasWRYHqhkvXsP
	UKYXkW1xxARRnBicop7tRwofp0MjcOGTlgcXQHAgvTpkHQRQ5hsXJgnuFIagQ3aKkQY88nkbGYqxA
	OV6uKGssBPnyFgPVxB2i8+b0DL5H6vsYJT4ojenrGPuEKthjhAYohJ31TkEsrrJW6KxBcsMKJxrYv
	7uljZzWBDBTd/TXF5OUypFAija2ENKXRqYIf9sifkyPM/iUSD0GNrmdvf7v9EMnHPCfOwRcqJE0kg
	/smSinkQ==;
Received: from ip6-localhost ([::1]:61370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qHQuu-000cIz-Fk; Thu, 06 Jul 2023 15:29:12 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:46453) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qHQun-000cIp-Cl
 for samba-technical@lists.samba.org; Thu, 06 Jul 2023 15:29:09 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b703cbfaf5so13047441fa.1
 for <samba-technical@lists.samba.org>; Thu, 06 Jul 2023 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688657344; x=1691249344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBODeVbuwojKcNDean02YI8ZZtZRDm3e6bJ2J8Lxr0U=;
 b=IYHCv1vZDFCF/CIARfxXXPg4OFhzc7pMmcW5J4ydPupxPx6XC8PQF2+MNwm9jemhqR
 A1NnJLadw2t+wieL4mzfewENFK1bDuvjHrIaerp5qL8sOs7DSPZVvKD+RdncL228c5QA
 s6tUamFgZExNDSw2faCtd20bRHZPQD+oXqB0Z7qNHXbg0x8kk3Rb5mHx2sxgxfvnZeew
 FYfAlqtgbGIcQa59P5LPkEVxiDM4loYPpdRwX94eY8Ekna1agwF8/B6cFzGDvkcZCWJ1
 +BJQqkfe/PxrDhSCi/hMWxhbc3wYS1MGTT1WCA5ShX3sbqCTBuQzGc0h0mcQK5yArWpw
 B+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688657344; x=1691249344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBODeVbuwojKcNDean02YI8ZZtZRDm3e6bJ2J8Lxr0U=;
 b=QRpoOuDvPkpbXSjHuWMjzqoMzzgHwchawXnHDqJWkakwBICzSW3dxHgnva6kBUImSy
 CsAZWCQ0Ox8MUQH3VuY51DJVKk1eHkNTxQpSZ2C/hUgQoYpR/QuQtGwI/kjYao9liBjH
 DNpcHJdKQK+e2U3gPxLZr+c1sY/Q6xZWEwo+4ThQlMqPZKdyzP/CbQwmAVDnjbE+V7M9
 xx5UOxqnTUww4saxySA3Lc29Rb5ub/2ZoOMgFfnG0sXtotdtCeSJsnz/2SqeblaKh9An
 IkXBuQvQhBfyrRZn2JOpuZy9Cp1WgbHD4ZWQQQ/B9eKyFMlTYjmiK/fh/ApntFuV5wia
 Dbmw==
X-Gm-Message-State: ABy/qLapySQGf1/UKgxyncp2piswIR5XCfQhYZ+cS36ftOfSkn2yJPIp
 TJFEajFSDp2Qmg9oIgVglcYaIZAZ1r5vQntaSCA=
X-Google-Smtp-Source: APBJJlGy0JaoyhsfUnBmUh38vlqnXCeEGZmbHjk1W5mjihasxoCeEd9ZfPcFqvUU/c09asWw2GrojYyEkYTwZCSxiBY=
X-Received: by 2002:a2e:960e:0:b0:2b6:ebc6:1e86 with SMTP id
 v14-20020a2e960e000000b002b6ebc61e86mr1696109ljh.47.1688657343931; Thu, 06
 Jul 2023 08:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-72-jlayton@kernel.org>
In-Reply-To: <20230705190309.579783-72-jlayton@kernel.org>
Date: Thu, 6 Jul 2023 10:28:52 -0500
Message-ID: <CAH2r5mvF2TqT6pR7wp9WGHZJkf39hZyaBMBftqwi+SsGVz7RDA@mail.gmail.com>
Subject: Re: [PATCH v2 74/92] smb: convert to ctime accessor functions
To: Jeff Layton <jlayton@kernel.org>
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
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Shyam Prasad N <sprasad@microsoft.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Acked-by: Steve French <stfrench@microsoft.com>

On Wed, Jul 5, 2023 at 2:42=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
>
> Acked-by: Tom Talpey <tom@talpey.com>
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/smb/client/file.c    |  4 ++--
>  fs/smb/client/fscache.h |  5 +++--
>  fs/smb/client/inode.c   | 14 +++++++-------
>  fs/smb/client/smb2ops.c |  3 ++-
>  fs/smb/server/smb2pdu.c |  8 ++++----
>  5 files changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 0a5fe8d5314b..689058e1b6e6 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -1085,7 +1085,7 @@ int cifs_close(struct inode *inode, struct file *fi=
le)
>                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &&
>                     dclose) {
>                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, &c=
inode->flags)) {
> -                               inode->i_ctime =3D inode->i_mtime =3D cur=
rent_time(inode);
> +                               inode->i_mtime =3D inode_set_ctime_curren=
t(inode);
>                         }
>                         spin_lock(&cinode->deferred_lock);
>                         cifs_add_deferred_close(cfile, dclose);
> @@ -2596,7 +2596,7 @@ static int cifs_partialpagewrite(struct page *page,=
 unsigned from, unsigned to)
>                                            write_data, to - from, &offset=
);
>                 cifsFileInfo_put(open_file);
>                 /* Does mm or vfs already set times? */
> -               inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D =
current_time(inode);
> +               inode->i_atime =3D inode->i_mtime =3D inode_set_ctime_cur=
rent(inode);
>                 if ((bytes_written > 0) && (offset))
>                         rc =3D 0;
>                 else if (bytes_written < 0)
> diff --git a/fs/smb/client/fscache.h b/fs/smb/client/fscache.h
> index 173999610997..a228964bc2ce 100644
> --- a/fs/smb/client/fscache.h
> +++ b/fs/smb/client/fscache.h
> @@ -50,12 +50,13 @@ void cifs_fscache_fill_coherency(struct inode *inode,
>                                  struct cifs_fscache_inode_coherency_data=
 *cd)
>  {
>         struct cifsInodeInfo *cifsi =3D CIFS_I(inode);
> +       struct timespec64 ctime =3D inode_get_ctime(inode);
>
>         memset(cd, 0, sizeof(*cd));
>         cd->last_write_time_sec   =3D cpu_to_le64(cifsi->netfs.inode.i_mt=
ime.tv_sec);
>         cd->last_write_time_nsec  =3D cpu_to_le32(cifsi->netfs.inode.i_mt=
ime.tv_nsec);
> -       cd->last_change_time_sec  =3D cpu_to_le64(cifsi->netfs.inode.i_ct=
ime.tv_sec);
> -       cd->last_change_time_nsec =3D cpu_to_le32(cifsi->netfs.inode.i_ct=
ime.tv_nsec);
> +       cd->last_change_time_sec  =3D cpu_to_le64(ctime.tv_sec);
> +       cd->last_change_time_nsec  =3D cpu_to_le64(ctime.tv_nsec);
>  }
>
>
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index c3eeae07e139..218f03dd3f52 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -172,7 +172,7 @@ cifs_fattr_to_inode(struct inode *inode, struct cifs_=
fattr *fattr)
>         else
>                 inode->i_atime =3D fattr->cf_atime;
>         inode->i_mtime =3D fattr->cf_mtime;
> -       inode->i_ctime =3D fattr->cf_ctime;
> +       inode_set_ctime_to_ts(inode, fattr->cf_ctime);
>         inode->i_rdev =3D fattr->cf_rdev;
>         cifs_nlink_fattr_to_inode(inode, fattr);
>         inode->i_uid =3D fattr->cf_uid;
> @@ -1744,9 +1744,9 @@ int cifs_unlink(struct inode *dir, struct dentry *d=
entry)
>                 cifs_inode =3D CIFS_I(inode);
>                 cifs_inode->time =3D 0;   /* will force revalidate to get=
 info
>                                            when needed */
> -               inode->i_ctime =3D current_time(inode);
> +               inode_set_ctime_current(inode);
>         }
> -       dir->i_ctime =3D dir->i_mtime =3D current_time(dir);
> +       dir->i_mtime =3D inode_set_ctime_current(dir);
>         cifs_inode =3D CIFS_I(dir);
>         CIFS_I(dir)->time =3D 0;  /* force revalidate of dir as well */
>  unlink_out:
> @@ -2060,8 +2060,8 @@ int cifs_rmdir(struct inode *inode, struct dentry *=
direntry)
>          */
>         cifsInode->time =3D 0;
>
> -       d_inode(direntry)->i_ctime =3D inode->i_ctime =3D inode->i_mtime =
=3D
> -               current_time(inode);
> +       inode_set_ctime_current(d_inode(direntry));
> +       inode->i_mtime =3D inode_set_ctime_current(inode);
>
>  rmdir_exit:
>         free_dentry_path(page);
> @@ -2267,8 +2267,8 @@ cifs_rename2(struct mnt_idmap *idmap, struct inode =
*source_dir,
>         /* force revalidate to go get info when needed */
>         CIFS_I(source_dir)->time =3D CIFS_I(target_dir)->time =3D 0;
>
> -       source_dir->i_ctime =3D source_dir->i_mtime =3D target_dir->i_cti=
me =3D
> -               target_dir->i_mtime =3D current_time(source_dir);
> +       source_dir->i_mtime =3D target_dir->i_mtime =3D inode_set_ctime_t=
o_ts(source_dir,
> +                                                                        =
 inode_set_ctime_current(target_dir));
>
>  cifs_rename_exit:
>         kfree(info_buf_source);
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 87abce010974..3cc3c4a71e32 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -1396,7 +1396,8 @@ smb2_close_getattr(const unsigned int xid, struct c=
ifs_tcon *tcon,
>         if (file_inf.LastWriteTime)
>                 inode->i_mtime =3D cifs_NTtimeToUnix(file_inf.LastWriteTi=
me);
>         if (file_inf.ChangeTime)
> -               inode->i_ctime =3D cifs_NTtimeToUnix(file_inf.ChangeTime)=
;
> +               inode_set_ctime_to_ts(inode,
> +                                     cifs_NTtimeToUnix(file_inf.ChangeTi=
me));
>         if (file_inf.LastAccessTime)
>                 inode->i_atime =3D cifs_NTtimeToUnix(file_inf.LastAccessT=
ime);
>
> diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
> index cf8822103f50..f9099831c8ff 100644
> --- a/fs/smb/server/smb2pdu.c
> +++ b/fs/smb/server/smb2pdu.c
> @@ -4779,7 +4779,7 @@ static int find_file_posix_info(struct smb2_query_i=
nfo_rsp *rsp,
>         file_info->LastAccessTime =3D cpu_to_le64(time);
>         time =3D ksmbd_UnixTimeToNT(inode->i_mtime);
>         file_info->LastWriteTime =3D cpu_to_le64(time);
> -       time =3D ksmbd_UnixTimeToNT(inode->i_ctime);
> +       time =3D ksmbd_UnixTimeToNT(inode_get_ctime(inode));
>         file_info->ChangeTime =3D cpu_to_le64(time);
>         file_info->DosAttributes =3D fp->f_ci->m_fattr;
>         file_info->Inode =3D cpu_to_le64(inode->i_ino);
> @@ -5422,7 +5422,7 @@ int smb2_close(struct ksmbd_work *work)
>                 rsp->LastAccessTime =3D cpu_to_le64(time);
>                 time =3D ksmbd_UnixTimeToNT(inode->i_mtime);
>                 rsp->LastWriteTime =3D cpu_to_le64(time);
> -               time =3D ksmbd_UnixTimeToNT(inode->i_ctime);
> +               time =3D ksmbd_UnixTimeToNT(inode_get_ctime(inode));
>                 rsp->ChangeTime =3D cpu_to_le64(time);
>                 ksmbd_fd_put(work, fp);
>         } else {
> @@ -5644,7 +5644,7 @@ static int set_file_basic_info(struct ksmbd_file *f=
p,
>         if (file_info->ChangeTime)
>                 attrs.ia_ctime =3D ksmbd_NTtimeToUnix(file_info->ChangeTi=
me);
>         else
> -               attrs.ia_ctime =3D inode->i_ctime;
> +               attrs.ia_ctime =3D inode_get_ctime(inode);
>
>         if (file_info->LastWriteTime) {
>                 attrs.ia_mtime =3D ksmbd_NTtimeToUnix(file_info->LastWrit=
eTime);
> @@ -5689,7 +5689,7 @@ static int set_file_basic_info(struct ksmbd_file *f=
p,
>                         return -EACCES;
>
>                 inode_lock(inode);
> -               inode->i_ctime =3D attrs.ia_ctime;
> +               inode_set_ctime_to_ts(inode, attrs.ia_ctime);
>                 attrs.ia_valid &=3D ~ATTR_CTIME;
>                 rc =3D notify_change(idmap, dentry, &attrs, NULL);
>                 inode_unlock(inode);
> --
> 2.41.0
>


--=20
Thanks,

Steve

