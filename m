Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3747850571
	for <lists+samba-technical@lfdr.de>; Sat, 10 Feb 2024 17:50:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EWKZT2/oteDyi+BBd13gxQnt1+YGW4A+h11i3bzUnAc=; b=KFbnjFRDxK1idlrHzt4VBlgKZ/
	K67XtXoHavTRiS1HhwgelqGoYGoLfSFYOyoygGyaxAkM+NDtVf5bh/Z/jvD0SPo3t0p0qUfxfzExu
	wzrdA/e1SGQI6V2/UuU+u3YyDKby/F88rGFMjidKPX5meetPUaBf2pcMGgHF4oVNyOfGFjppG8rGd
	l69nBdFu8WFfMAwQtO1v16mjYvLt/GmLGjRa9wOufvJ45Do0pNr9xaWW+4ZiEAe6zCF4npKU5+qNl
	AynmIPdIrJbh+fyyJ1NQ0HyydmcTkTEiZFjAQ/gdR+loyhZRY++nbhvu9T7LqlMx5MomWJHIGaLpR
	Ph68b9EA==;
Received: from ip6-localhost ([::1]:58974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rYqYM-0084R3-FB; Sat, 10 Feb 2024 16:50:10 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:52248) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rYqYE-0084Qt-TR
 for samba-technical@lists.samba.org; Sat, 10 Feb 2024 16:50:06 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50eac018059so2537069e87.0
 for <samba-technical@lists.samba.org>; Sat, 10 Feb 2024 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707583800; x=1708188600; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWKZT2/oteDyi+BBd13gxQnt1+YGW4A+h11i3bzUnAc=;
 b=J9hqcOVHP/j7vmI93/T409NHqxyNtzpHE5rJOhpKi5c5Dx964cRzd0XCiyri7F9TR3
 NSGLR1OzPLBpmONoWePigl4/VeB/xiE5mViVBY51vue01U/qLcrBSOkNZWhNmqVYVxOZ
 Nin+i790Wq3C48uWyB4LgoLlpiIfIX9hD2z4wjkOasFHTMViTetKU/joAuGtoLSZPRhH
 GrTnlgFrumF7izMHSfxcZ5kpges/IXfgi5PEx1PahSXj8S2TANd+aQCugosWKPQ4NrqL
 MqyFhuoaNnd1imWrxWUSlZgmx48RxNCxRN70wVEWTHZ11LjqAB8vDFYjKqVheyLUm8v/
 qmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707583800; x=1708188600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWKZT2/oteDyi+BBd13gxQnt1+YGW4A+h11i3bzUnAc=;
 b=PAsqu2f5D0T5WZwZCk3GnBgjh0BTKFiOL7gV0LwysYjdJtD37U+KQFmGvEidYO2FyZ
 fzKy1cpxOBjyj08QZjl3TKkzKZAnLoFhcQRieeOfWtUWFh5N+f1hYo0pH1PAbc0MPOOb
 gIfrnZ7bk/8rAsWH8wSMy6OSqHvgEt/eEMUN0lIqF19NEL5BXlBukZNvtcYZkVnwLcXe
 nu+0uEPZzHlx2tt1bWMiRqf9lLJNHh5wTmnY7KFPEujftynGRvbUUVzoD7sDEJbswd+H
 riURqBtyHTm+P9dtcHU6SzrrnV+gryABilFW0OluPE6R/EdXsvCGfjwHtS1sOOmCeFcj
 cTmg==
X-Gm-Message-State: AOJu0YwafBPqthO9pQEJSSW2mrk29ESfPtvsjO8biON30GOuZDXA73b/
 /voDPDTBZinXQlIzkGkn28XrFNSEEC3Tqvnjmgp9FW8biRhPk+Y8/Nn5zImK2I+Sx5a/dzfAgWT
 kRP5eklouYWeaII6OEC+5yk92h30c/FDeoeg=
X-Google-Smtp-Source: AGHT+IHkhA+E1kUgb0xNkb7GX/VlVovE4kmPXlMs09LDe9DVt9TWKnEN5PDbNsr24bDkEtAAFOJ6ggT1+QgjimhCA6s=
X-Received: by 2002:a19:f007:0:b0:511:69bf:d1a6 with SMTP id
 p7-20020a19f007000000b0051169bfd1a6mr1279706lfc.40.1707583800255; Sat, 10 Feb
 2024 08:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20240209131552.471765-1-meetakshisetiyaoss@gmail.com>
 <CAH2r5mtdebsVFbOoQeYYL79GVXe0wn=GfdgVE1RkQrnowHOO5Q@mail.gmail.com>
In-Reply-To: <CAH2r5mtdebsVFbOoQeYYL79GVXe0wn=GfdgVE1RkQrnowHOO5Q@mail.gmail.com>
Date: Sat, 10 Feb 2024 22:19:48 +0530
Message-ID: <CANT5p=p+TYwH7yLH9+kvum0O5KjxKc9MrWtERCc7WCv_wzODQg@mail.gmail.com>
Subject: Re: [PATCH 1/3] smb: client: do not defer close open handles to
 deleted files
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
Cc: meetakshisetiyaoss@gmail.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, pc@manguebit.com,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Feb 10, 2024 at 11:29=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
>
> could we make the "file_is_deleted" a boolean instead of using up more
> space making it an int?

Meetakshi initially had it as a bool. I asked her to make it a bitmap,
just in case there can be other such flags that are needed in the
future.

>
> Alternatively - would it be possible to simply look at the file
> attributes to see if it was marked as deleted (ie we should already be
> setting ATTR_DELETE_ON_CLOSE)

It does not look like we use this attr anywhere today. (Am I missing someth=
ing?)
Also, it looks like a flag that SMB uses in requests and responses.
I feel that it's better to keep a different flag for this purpose.

>
> On Fri, Feb 9, 2024 at 7:17=E2=80=AFAM <meetakshisetiyaoss@gmail.com> wro=
te:
> >
> > From: Meetakshi Setiya <msetiya@microsoft.com>
> >
> > When a file/dentry has been deleted before closing all its open handles=
,
> > currently, closing them can add them to the deferred close list. This c=
an
> > lead to problems in creating file with the same name when the file is
> > re-created before the deferred close completes. This issue was seen whi=
le
> > reusing a client's already existing lease on a file for compound operat=
ions
> > and xfstest 591 failed because of the deferred close handle that remain=
ed
> > valid even after the file was deleted and was being reused to create a =
file
> > with the same name. The server in this case returns an error on open wi=
th
> > STATUS_DELETE_PENDING. Recreating the file would fail till the deferred
> > handles are closed (duration specified in closetimeo).
> >
> > This patch fixes the issue by flagging all open handles for the deleted
> > file (file path to be precise) with FILE_DELETED at the end of the unli=
nk
> > operation. A new field cflags has been introduced in the cifsFileInfo
> > structure to set the FILE_DELETED flag without interfering with the f_f=
lags
> > field. This cflags field could be useful in the future for setting more
> > flags specific to cfile.
> > When doing close in cifs_close for each of these handles, check the
> > FILE_DELETED flag and do not defer close these handles if the correspon=
ding
> > filepath has been deleted.
> >
> > Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> > ---
> >  fs/smb/client/cifsglob.h  |  3 +++
> >  fs/smb/client/cifsproto.h |  4 ++++
> >  fs/smb/client/file.c      |  3 ++-
> >  fs/smb/client/inode.c     |  2 ++
> >  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
> >  5 files changed, 33 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> > index 16befff4cbb4..f6b4acdcdeb3 100644
> > --- a/fs/smb/client/cifsglob.h
> > +++ b/fs/smb/client/cifsglob.h
> > @@ -1398,6 +1398,8 @@ struct cifs_fid_locks {
> >         struct list_head locks;         /* locks held by fid above */
> >  };
> >
> > +#define FILE_DELETED 00000001
> > +
> >  struct cifsFileInfo {
> >         /* following two lists are protected by tcon->open_file_lock */
> >         struct list_head tlist; /* pointer to next fid owned by tcon */
> > @@ -1413,6 +1415,7 @@ struct cifsFileInfo {
> >         struct dentry *dentry;
> >         struct tcon_link *tlink;
> >         unsigned int f_flags;
> > +       unsigned int cflags;    /* flags for this file */
> >         bool invalidHandle:1;   /* file closed via session abend */
> >         bool swapfile:1;
> >         bool oplock_break_cancelled:1;
> > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > index a841bf4967fa..f995b766b177 100644
> > --- a/fs/smb/client/cifsproto.h
> > +++ b/fs/smb/client/cifsproto.h
> > @@ -296,6 +296,10 @@ extern void cifs_close_all_deferred_files(struct c=
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
> > index b75282c204da..91cf4d2df4de 100644
> > --- a/fs/smb/client/file.c
> > +++ b/fs/smb/client/file.c
> > @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct cifs_=
fid *fid, struct file *file,
> >         cfile->uid =3D current_fsuid();
> >         cfile->dentry =3D dget(dentry);
> >         cfile->f_flags =3D file->f_flags;
> > +       cfile->cflags =3D 0;
> >         cfile->invalidHandle =3D false;
> >         cfile->deferred_close_scheduled =3D false;
> >         cfile->tlink =3D cifs_get_tlink(tlink);
> > @@ -1085,7 +1086,7 @@ int cifs_close(struct inode *inode, struct file *=
file)
> >                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =3D=3D =
CIFS_CACHE_RHW_FLG)
> >                     && cinode->lease_granted &&
> >                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags) &=
&
> > -                   dclose) {
> > +                   dclose && !(cfile->cflags & FILE_DELETED)) {
> >                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR, =
&cinode->flags)) {
> >                                 inode_set_mtime_to_ts(inode,
> >                                                       inode_set_ctime_c=
urrent(inode));
> > diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> > index d02f8ba29cb5..8121b5b1aa22 100644
> > --- a/fs/smb/client/inode.c
> > +++ b/fs/smb/client/inode.c
> > @@ -1900,6 +1900,8 @@ int cifs_unlink(struct inode *dir, struct dentry =
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
> > index 0748d7b757b9..8e46dee1a36c 100644
> > --- a/fs/smb/client/misc.c
> > +++ b/fs/smb/client/misc.c
> > @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct cifs_=
tcon *tcon, const char *path)
> >         free_dentry_path(page);
> >  }
> >
> > +/*
> > + * If a dentry has been deleted, all corresponding open handles should=
 know that
> > + * so that we do not defer close them.
> > + */
> > +void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tcon,
> > +                                            const char *path)
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
> > +                       cfile->cflags |=3D FILE_DELETED;
> > +       }
> > +       spin_unlock(&tcon->open_file_lock);
> > +       free_dentry_path(page);
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



--=20
Regards,
Shyam

