Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88E84E529
	for <lists+samba-technical@lfdr.de>; Thu,  8 Feb 2024 17:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cXgQyc4QqV21RGZWHkg0afbuVd4wVESNNL3AHhWR3mg=; b=N68LRKYSxV+XVtg6MtFmJuOOxW
	h+AY0rMhgbmVCcq+UU8TcI5+VrgMGhiD5Ll+EXYYnM3Wg/UHQDgPlnMRW0/gVsM1Ojj+WRxC6tFKs
	GbtnImRjKyZqsmA4eNqRDYpGeBRE/OCaL4C3r+he75tOxVdB9rKfbKaCCs58AncU/MXxxEkv8duPj
	a2rWNh+D2oO5bC76xs0+st7pCV202MGlh55WhRdqf89xwNUakRR63CIUm6H+3SV9wSg8rPncsuPIG
	FHby9CVxD49C1Q8Hh3REUPPH6LFsOEy/dagMDvufVRLsY/h7z+Z65SEl0Gqm75VVDwz/tsQUeA9Al
	da/alBIA==;
Received: from ip6-localhost ([::1]:32572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rY7Sf-007ttC-BW; Thu, 08 Feb 2024 16:41:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:54535) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rY7Sa-007tt5-U8
 for samba-technical@lists.samba.org; Thu, 08 Feb 2024 16:41:15 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d0ce22b5f3so662471fa.1
 for <samba-technical@lists.samba.org>; Thu, 08 Feb 2024 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707410471; x=1708015271; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXgQyc4QqV21RGZWHkg0afbuVd4wVESNNL3AHhWR3mg=;
 b=a2JPfsZhiI1QtxYjEzUC5exQQ9xluGXVWG9j3nyfTnKcWbmJjFfrBUXJSfhkd822yz
 hw0vYMC/nxevbd97mVqCszu1OY02rlDjl6xaKOcc+kNwtDUL2GrDBBGdWzWt/HScBjAG
 z3ShehxcHyl3se/FriICrMf8YHMuEGx5Y30SC9QrotJou3vPWn3yG0iSWwqJGMKpfGku
 cQvI2EDmVzFscdVhEk+2pKimiaUYJlzP9HeNIueLv/0+1e6OMbSjRxhIGiEeIUkrlOvX
 b/l0HNT9Ct8LZiENzF89zKGoMYVPLDRBUUH1X5zT05BrIBuGrcq73q5ApT2KoGHTNxUP
 UF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707410471; x=1708015271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXgQyc4QqV21RGZWHkg0afbuVd4wVESNNL3AHhWR3mg=;
 b=gEL7MYk8HJ8x9Lf8XljwDyTatuFsgvgDgSzIuUogGfqJlA8b1jqRo4zh3Dg56oOg+v
 eW0UZUHU+uggrYhUITXywWFM7ExfVEGjTteYOp9tO0n88uMWIrZrhGUpm588sNRJO0ZU
 9he9/wDqmGbtiJJ1rS1XsWMDkrpJfe/E4X1yjv+UZNBUXJBbaF/tq0Me5qmYaxqFczo8
 15keHLfc2wL0EHtA8ustgty/Zj2qxD75mr37R1E88boJ13/RG3w9Sg9QV9ZvKmLtpmvr
 7Fv8SWI97CTK/Nuq599SlQY+8GvoV9vyrNBbrsSYPvyS5QlygA3t6ka1Ui6BejzH4tqH
 2Shg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3vXYQ6NtVycKUhYUHTbepIA8fUXGNj5HK1VbxJfSw/CsPVPjmANy/INoM/ixo9U1l+B885xzIPZ+jOTB4wfQNj7RR4jDonE+QM4zzTCFF
X-Gm-Message-State: AOJu0Yw9G8WxwUgri1xn9tvD8rFeQaWto2XctnjPItyHd0IPpQhlrDc0
 dwfviJ/TZokIkWA2OfADbjAHyj1TtKnlnf1DELGuqPD8R2QMN3eIKtCIB6dT6jbED4emfw/SPyW
 rNLXmqBt7cBtcNpW3Nm3j6zeA+JU=
X-Google-Smtp-Source: AGHT+IEG6/2Uae+FIWY8AXFLdzEo77r9eAOikawO8s4/Yp57o1zDl12a9H2lKvmAjH4yyEnF6ywgjMs3jfO7TCbFkQs=
X-Received: by 2002:a2e:b1c2:0:b0:2d0:a154:f38a with SMTP id
 e2-20020a2eb1c2000000b002d0a154f38amr6575566lja.47.1707410471146; Thu, 08 Feb
 2024 08:41:11 -0800 (PST)
MIME-Version: 1.0
References: <20240202170537.409508-1-meetakshisetiyaoss@gmail.com>
 <CAH2r5msEtpJGTvK2F2TY0jR9hU0e7LYJekiyV1zD7MM+i9Oxgg@mail.gmail.com>
In-Reply-To: <CAH2r5msEtpJGTvK2F2TY0jR9hU0e7LYJekiyV1zD7MM+i9Oxgg@mail.gmail.com>
Date: Thu, 8 Feb 2024 22:10:59 +0530
Message-ID: <CANT5p=p8BxhPANdU=YsJiXg_s=j8COG3-VgPK0MopFeMzDUfhA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: do not defer close open handles to deleted
 files
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
Cc: meetakshisetiyaoss@gmail.com, pc@manguebit.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, tom@talpey.com, msetiya@microsoft.com,
 bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 5, 2024 at 3:27=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> This was puzzling because I tried some experiments with deleting files
> that were deferred close and noticed that we already making sure that
> they weren't deferred close in cifs_unlink by calling
> cifs_close_deferred_file_under_dentry(tcon, full_path) even in
> Rohith's original code from a few years ago - so I didn't see cases
> where we had a file marked for delete that was deferred close.  How
> did you reproduce that problem?
>
The issue here is that other bugs are hiding this bug.
When Meetakshi fixed the missing lease key bug for deletes/renames/set
size, the tests started breaking.
But the bug definitely exists.

> On Fri, Feb 2, 2024 at 11:39=E2=80=AFAM <meetakshisetiyaoss@gmail.com> wr=
ote:
> >
> > From: Meetakshi Setiya <msetiya@microsoft.com>
> >
> > When a file/dentry has been deleted before closing all its open
> > handles, currently, closing them can add them to the deferred close
> > list. This can lead to problems in creating file with the same name
> > when the file is re-created before the deferred close completes. This
> > issue was seen while reusing a client's already existing lease on a
> > file for compound operations and xfstest 591 failed because of the
> > deferred close handle that remained valid even after the file was
> > deleted and was being reused to create a file with the same name. The
> > server in this case returns an error on open with
> > STATUS_DELETE_PENDING. Recreating the file would fail till the
> > deferred handles are closed (duration specified in closetimeo).
> >
> > This patch fixes the issue by flagging all open handles for the
> > deleted file (file path to be precise) with FILE_DELETED at the end
> > of the unlink operation. When doing close in cifs_close for each of
> > these handles, check the flag and do not defer close these handles if
> > the corresponding filepath has been deleted.
> >
> > Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> > ---
> >  fs/smb/client/cifsglob.h  |  1 +
> >  fs/smb/client/cifsproto.h |  4 ++++
> >  fs/smb/client/file.c      |  2 +-
> >  fs/smb/client/inode.c     |  2 ++
> >  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
> >  5 files changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> > index decf80131bbe..826da216a9e1 100644
> > --- a/fs/smb/client/cifsglob.h
> > +++ b/fs/smb/client/cifsglob.h
> > @@ -1399,6 +1399,7 @@ struct cifs_fid_locks {
> >         struct list_head locks;         /* locks held by fid above */
> >  };
> >
> > +#define FILE_DELETED   0x550
> >  struct cifsFileInfo {
> >         /* following two lists are protected by tcon->open_file_lock */
> >         struct list_head tlist; /* pointer to next fid owned by tcon */
> > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > index 770db9026850..67f75497db02 100644
> > --- a/fs/smb/client/cifsproto.h
> > +++ b/fs/smb/client/cifsproto.h
> > @@ -292,6 +292,10 @@ extern void cifs_close_all_deferred_files(struct c=
ifs_tcon *cifs_tcon);
> >
> >  extern void cifs_close_deferred_file_under_dentry(struct cifs_tcon *ci=
fs_tcon,
> >                                 const char *path);
> > +
> > +extern void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon
> > +                               *cifs_tcon, const char *path);
> > +
> >  extern struct TCP_Server_Info *
> >  cifs_get_tcp_session(struct smb3_fs_context *ctx,
> >                      struct TCP_Server_Info *primary_server);
> > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > index b75282c204da..4c87ddbe8a5a 100644
> > --- a/fs/smb/client/file.c
> > +++ b/fs/smb/client/file.c
> > @@ -1085,7 +1085,7 @@ int cifs_close(struct inode *inode, struct file *=
file)
> >                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =3D=3D =
CIFS_CACHE_RHW_FLG)
> >                     && cinode->lease_granted &&
> >                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &=
&
> > -                   dclose) {
> > +                   dclose && !(cfile->f_flags & FILE_DELETED)) {
> >                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, =
&cinode->flags)) {
> >                                 inode_set_mtime_to_ts(inode,
> >                                                       inode_set_ctime_c=
urrent(inode));
> > diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> > index 24489e1e238a..be5bc01319d8 100644
> > --- a/fs/smb/client/inode.c
> > +++ b/fs/smb/client/inode.c
> > @@ -1822,6 +1822,8 @@ int cifs_unlink(struct inode *dir, struct dentry =
*dentry)
> >         cifs_inode =3D CIFS_I(dir);
> >         CIFS_I(dir)->time =3D 0;  /* force revalidate of dir as well */
> >  unlink_out:
> > +       if (rc =3D=3D 0)
> > +               cifs_mark_open_handles_for_deleted_file(tcon, full_path=
);
> >         free_dentry_path(page);
> >         kfree(attrs);
> >         free_xid(xid);
> > diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> > index 0748d7b757b9..ebc867bfc034 100644
> > --- a/fs/smb/client/misc.c
> > +++ b/fs/smb/client/misc.c
> > @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct cifs_=
tcon *tcon, const char *path)
> >         free_dentry_path(page);
> >  }
> >
> > +/*
> > + * If a dentry has been deleted, all corresponding open handles should=
 know the
> > + * same, so that we do not defer close them.
> > + */
> > +void
> > +cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tcon, const =
char
> > +*path)
> > +{
> > +       struct cifsFileInfo *cfile;
> > +       void *page;
> > +       const char *full_path;
> > +
> > +       page =3D alloc_dentry_path();
> > +       spin_lock(&tcon->open_file_lock);
> > +       list_for_each_entry(cfile, &tcon->openFileList, tlist) {
> > +               full_path =3D build_path_from_dentry(cfile->dentry, pag=
e);
> > +               if (strcmp(full_path, path) =3D=3D 0)
> > +                       cfile->f_flags |=3D FILE_DELETED;
> > +       }
> > +       spin_unlock(&tcon->open_file_lock);
> > +}
> > +
> >  /* parses DFS referral V3 structure
> >   * caller is responsible for freeing target_nodes
> >   * returns:
> > --
> > 2.39.2
> >
> >
>
>
> --
> Thanks,
>
> Steve

Hi Meetakshi,

Please fix the issue that Steve indicated in our call.
i.e. use new "flags" field for cfile, rather than f_flags. And use a
power of 2 value for FILE_DELETED.
Other than that, it looks good to me.

--=20
Regards,
Shyam

