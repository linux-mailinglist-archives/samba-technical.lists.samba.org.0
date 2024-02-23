Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E18861243
	for <lists+samba-technical@lfdr.de>; Fri, 23 Feb 2024 14:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rEvHv0RCDK9H2MJD01J685Bl9xsmxHc938rJVeHVDmk=; b=wTNO+kKhFHBWmefqCgNcfCr5DM
	njl1yosohYMcCW17iOWx8ccYFYQrcwTMrJy7fPpRh/2ZWS9xJ+m4iDpgeKsITPXL8+KKsxB+62KJN
	mpTT5v7rmDiUt/pwEW0oY/lodWl+6hsxXvbYSPoxYhTYydVYYX9X7Wi0Y+nUpiDFMKf8Gvv5l8+vG
	MRy+1mExNgt78lqOBPsm50XdA9X6AtBepI905v0R4dKn/LhhH69HtGUGrF8h00/ff5nfg+NOTjl+a
	CkGykZxj6z5Nt4PWymvxdzSRqF5YZiRS5ReKTlnOyl0UpAOcHR6ZxM/clcDHr1GjfgeJjNLK5XwkI
	daMPSNXg==;
Received: from ip6-localhost ([::1]:38394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rdVI1-009H2r-Oz; Fri, 23 Feb 2024 13:08:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:60455) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdVHw-009H2k-Rg
 for samba-technical@lists.samba.org; Fri, 23 Feb 2024 13:08:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512be6fda52so392649e87.0
 for <samba-technical@lists.samba.org>; Fri, 23 Feb 2024 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708693707; x=1709298507; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rEvHv0RCDK9H2MJD01J685Bl9xsmxHc938rJVeHVDmk=;
 b=evgF2F/rGZPBNgDtV6W2UVCqDUMV1iKulKCpyNp8izr2/V2eJJne//fEWEddYqvcua
 pLRQTdCZTak/7dmfkBlslJZEB0OUYawskMraN/fuZ+6lHZAxhOWAd1Sr8qzB8CO9FOxZ
 S0UUEQ4OxhQ/Ik0Ldz1e7NTIR51UEin/2bBbpxlIy7ZVVI2yGs0sK9LQZVZGvtb+p2eR
 wiC4FKBGAIlM6eM8s7kEbojNoa0f/BKLDBZn3yHOslWTZwc85lFNrtsqeQeQA+efUsZ6
 SgvRVhYXzyRbtzzLf/qymQVnergHfPdwlDrz6OeIE5kt2MtM2W4HYSTqe5DLveBmiso+
 8nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708693707; x=1709298507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rEvHv0RCDK9H2MJD01J685Bl9xsmxHc938rJVeHVDmk=;
 b=VwPawHrw1hm+sgupdiQHRAjIArTK9OI2p/PYLl+KIkpKQWZxm52RntJRc0mswnrIqu
 qclOaZlSfzJCYCx8dPu40JDDQGwiu2psi1IaZX0KP2kgf9EVJCY9LvUKtct9MgqhTGbY
 acCboVtKpIBlCz3j3SmHdLOPpSJqWkpQnkjYC2+N6TfzQNeKtKJl0TOqymF6DDKs7/X1
 52ZPKOWFnfR2I/rhMrD+DCS+ZDA3E32+stndXvzrFmOj73bR6TGezaq5sp4Bjw3t8i1D
 TQGnvqILmoMNH5nztv/9UaH64YAiO7DqVNfAxnfAjjZ4tLIm96uJNuFsgmeN+p8bx/eY
 vsiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK8/WF81tWFg8RAg83ztJQRxoLKkY0p148Bvuaj4VFl2iYa3LiAM3AgZWza2hUDGC1MRenY62ljdMPBb9fS8+zbHycm2WryrYRk5ZhgIvY
X-Gm-Message-State: AOJu0Yy3CKd/UYOymaL311pzvqsBcVoyMFtTs2B9lC343NM+HfQufqJv
 r/qla2KqqWK2RBDCCIZ1VBJ0MKBx7XEVMl5Yc30l1GTMRhfWxFPJKJZMpTh72UaV1gC3RCGi0dB
 Ydvoj34Ci9ev/9iohXMuPle2NiA0=
X-Google-Smtp-Source: AGHT+IHEFhbaMjen9gSSeeq/fufxuTZqBXLekfs/XCh+Ncjc6V0xCelJzbZ3eaaVz6od+T7+5BEO58TXpRd6HQuXCeA=
X-Received: by 2002:a05:6512:3b24:b0:512:e00b:9120 with SMTP id
 f36-20020a0565123b2400b00512e00b9120mr1725997lfv.32.1708693707164; Fri, 23
 Feb 2024 05:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20240209131552.471765-1-meetakshisetiyaoss@gmail.com>
 <CAH2r5mtdebsVFbOoQeYYL79GVXe0wn=GfdgVE1RkQrnowHOO5Q@mail.gmail.com>
 <CANT5p=p+TYwH7yLH9+kvum0O5KjxKc9MrWtERCc7WCv_wzODQg@mail.gmail.com>
 <CAH2r5mumpNgm62mSFQmtMANm-njH1VJsv4ZT50Cww9dTCed3XQ@mail.gmail.com>
 <CAFTVevU94O1NEJ1XzrUSDoC7b4=W=wciqRWX8LoB1X1=AUNZfA@mail.gmail.com>
In-Reply-To: <CAFTVevU94O1NEJ1XzrUSDoC7b4=W=wciqRWX8LoB1X1=AUNZfA@mail.gmail.com>
Date: Fri, 23 Feb 2024 18:38:15 +0530
Message-ID: <CANT5p=r4U8R=bYv=iB1OO+cwCpKxt7jqbutviWHB5yp5NC0j4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] smb: client: do not defer close open handles to
 deleted files
To: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Steve French <smfrench@gmail.com>, Meetakshi Setiya <msetiya@microsoft.com>,
 Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 21, 2024 at 10:14=E2=80=AFAM Meetakshi Setiya
<meetakshisetiyaoss@gmail.com> wrote:
>
> PFA the follow up patch that uses a boolean field status_file_deleted
> instead of a bitmap to mark open handles for files that have been deleted=
.
> Additionally, if SMB2 query info response is received with the DeletePend=
ing
> flag set to true for a client, mark the corresponding open file handles
> in this case too.
>
> Thanks
> Meetakshi
>
> On Sun, Feb 11, 2024 at 2:34=E2=80=AFAM Steve French <smfrench@gmail.com>=
 wrote:
> >
> > I lean toward using the existing attr field since it presumably could b=
e set remotely and best to be safe and consistent and also uses less space
> >
> > ATTR_DELETE_ON_CLOSE
> >
> > On Sat, Feb 10, 2024, 11:50 Shyam Prasad N <nspmangalore@gmail.com> wro=
te:
> >>
> >> On Sat, Feb 10, 2024 at 11:29=E2=80=AFAM Steve French <smfrench@gmail.=
com> wrote:
> >> >
> >> > could we make the "file_is_deleted" a boolean instead of using up mo=
re
> >> > space making it an int?
> >>
> >> Meetakshi initially had it as a bool. I asked her to make it a bitmap,
> >> just in case there can be other such flags that are needed in the
> >> future.
> >>
> >> >
> >> > Alternatively - would it be possible to simply look at the file
> >> > attributes to see if it was marked as deleted (ie we should already =
be
> >> > setting ATTR_DELETE_ON_CLOSE)
> >>
> >> It does not look like we use this attr anywhere today. (Am I missing s=
omething?)
> >> Also, it looks like a flag that SMB uses in requests and responses.
> >> I feel that it's better to keep a different flag for this purpose.
> >>
> >> >
> >> > On Fri, Feb 9, 2024 at 7:17=E2=80=AFAM <meetakshisetiyaoss@gmail.com=
> wrote:
> >> > >
> >> > > From: Meetakshi Setiya <msetiya@microsoft.com>
> >> > >
> >> > > When a file/dentry has been deleted before closing all its open ha=
ndles,
> >> > > currently, closing them can add them to the deferred close list. T=
his can
> >> > > lead to problems in creating file with the same name when the file=
 is
> >> > > re-created before the deferred close completes. This issue was see=
n while
> >> > > reusing a client's already existing lease on a file for compound o=
perations
> >> > > and xfstest 591 failed because of the deferred close handle that r=
emained
> >> > > valid even after the file was deleted and was being reused to crea=
te a file
> >> > > with the same name. The server in this case returns an error on op=
en with
> >> > > STATUS_DELETE_PENDING. Recreating the file would fail till the def=
erred
> >> > > handles are closed (duration specified in closetimeo).
> >> > >
> >> > > This patch fixes the issue by flagging all open handles for the de=
leted
> >> > > file (file path to be precise) with FILE_DELETED at the end of the=
 unlink
> >> > > operation. A new field cflags has been introduced in the cifsFileI=
nfo
> >> > > structure to set the FILE_DELETED flag without interfering with th=
e f_flags
> >> > > field. This cflags field could be useful in the future for setting=
 more
> >> > > flags specific to cfile.
> >> > > When doing close in cifs_close for each of these handles, check th=
e
> >> > > FILE_DELETED flag and do not defer close these handles if the corr=
esponding
> >> > > filepath has been deleted.
> >> > >
> >> > > Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> >> > > ---
> >> > >  fs/smb/client/cifsglob.h  |  3 +++
> >> > >  fs/smb/client/cifsproto.h |  4 ++++
> >> > >  fs/smb/client/file.c      |  3 ++-
> >> > >  fs/smb/client/inode.c     |  2 ++
> >> > >  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
> >> > >  5 files changed, 33 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> >> > > index 16befff4cbb4..f6b4acdcdeb3 100644
> >> > > --- a/fs/smb/client/cifsglob.h
> >> > > +++ b/fs/smb/client/cifsglob.h
> >> > > @@ -1398,6 +1398,8 @@ struct cifs_fid_locks {
> >> > >         struct list_head locks;         /* locks held by fid above=
 */
> >> > >  };
> >> > >
> >> > > +#define FILE_DELETED 00000001
> >> > > +
> >> > >  struct cifsFileInfo {
> >> > >         /* following two lists are protected by tcon->open_file_lo=
ck */
> >> > >         struct list_head tlist; /* pointer to next fid owned by tc=
on */
> >> > > @@ -1413,6 +1415,7 @@ struct cifsFileInfo {
> >> > >         struct dentry *dentry;
> >> > >         struct tcon_link *tlink;
> >> > >         unsigned int f_flags;
> >> > > +       unsigned int cflags;    /* flags for this file */
> >> > >         bool invalidHandle:1;   /* file closed via session abend *=
/
> >> > >         bool swapfile:1;
> >> > >         bool oplock_break_cancelled:1;
> >> > > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> >> > > index a841bf4967fa..f995b766b177 100644
> >> > > --- a/fs/smb/client/cifsproto.h
> >> > > +++ b/fs/smb/client/cifsproto.h
> >> > > @@ -296,6 +296,10 @@ extern void cifs_close_all_deferred_files(str=
uct cifs_tcon *cifs_tcon);
> >> > >
> >> > >  extern void cifs_close_deferred_file_under_dentry(struct cifs_tco=
n *cifs_tcon,
> >> > >                                 const char *path);
> >> > > +
> >> > > +extern void cifs_mark_open_handles_for_deleted_file(struct cifs_t=
con
> >> > > +                               *cifs_tcon, const char *path);
> >> > > +
> >> > >  extern struct TCP_Server_Info *
> >> > >  cifs_get_tcp_session(struct smb3_fs_context *ctx,
> >> > >                      struct TCP_Server_Info *primary_server);
> >> > > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> >> > > index b75282c204da..91cf4d2df4de 100644
> >> > > --- a/fs/smb/client/file.c
> >> > > +++ b/fs/smb/client/file.c
> >> > > @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct =
cifs_fid *fid, struct file *file,
> >> > >         cfile->uid =3D current_fsuid();
> >> > >         cfile->dentry =3D dget(dentry);
> >> > >         cfile->f_flags =3D file->f_flags;
> >> > > +       cfile->cflags =3D 0;
> >> > >         cfile->invalidHandle =3D false;
> >> > >         cfile->deferred_close_scheduled =3D false;
> >> > >         cfile->tlink =3D cifs_get_tlink(tlink);
> >> > > @@ -1085,7 +1086,7 @@ int cifs_close(struct inode *inode, struct f=
ile *file)
> >> > >                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =
=3D=3D CIFS_CACHE_RHW_FLG)
> >> > >                     && cinode->lease_granted &&
> >> > >                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->fla=
gs) &&
> >> > > -                   dclose) {
> >> > > +                   dclose && !(cfile->cflags & FILE_DELETED)) {
> >> > >                         if (test_and_clear_bit(CIFS_INO_MODIFIED_A=
TTR, &cinode->flags)) {
> >> > >                                 inode_set_mtime_to_ts(inode,
> >> > >                                                       inode_set_ct=
ime_current(inode));
> >> > > diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> >> > > index d02f8ba29cb5..8121b5b1aa22 100644
> >> > > --- a/fs/smb/client/inode.c
> >> > > +++ b/fs/smb/client/inode.c
> >> > > @@ -1900,6 +1900,8 @@ int cifs_unlink(struct inode *dir, struct de=
ntry *dentry)
> >> > >         cifs_inode =3D CIFS_I(dir);
> >> > >         CIFS_I(dir)->time =3D 0;  /* force revalidate of dir as we=
ll */
> >> > >  unlink_out:
> >> > > +       if (rc =3D=3D 0)
> >> > > +               cifs_mark_open_handles_for_deleted_file(tcon, full=
_path);
> >> > >         free_dentry_path(page);
> >> > >         kfree(attrs);
> >> > >         free_xid(xid);
> >> > > diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> >> > > index 0748d7b757b9..8e46dee1a36c 100644
> >> > > --- a/fs/smb/client/misc.c
> >> > > +++ b/fs/smb/client/misc.c
> >> > > @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct =
cifs_tcon *tcon, const char *path)
> >> > >         free_dentry_path(page);
> >> > >  }
> >> > >
> >> > > +/*
> >> > > + * If a dentry has been deleted, all corresponding open handles s=
hould know that
> >> > > + * so that we do not defer close them.
> >> > > + */
> >> > > +void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tc=
on,
> >> > > +                                            const char *path)
> >> > > +{
> >> > > +       struct cifsFileInfo *cfile;
> >> > > +       void *page;
> >> > > +       const char *full_path;
> >> > > +
> >> > > +       page =3D alloc_dentry_path();
> >> > > +       spin_lock(&tcon->open_file_lock);
> >> > > +       list_for_each_entry(cfile, &tcon->openFileList, tlist) {

Is there a reason why we need to iterate over tcon->openFileList here?
There may be a large number of open files in the tcon.
Why not iterate over cinode->openFileList? That will be a much smaller
list and should cover all the open files that you need. Right?

> >> > > +               full_path =3D build_path_from_dentry(cfile->dentry=
, page);
> >> > > +               if (strcmp(full_path, path) =3D=3D 0)
> >> > > +                       cfile->cflags |=3D FILE_DELETED;
> >> > > +       }
> >> > > +       spin_unlock(&tcon->open_file_lock);
> >> > > +       free_dentry_path(page);
> >> > > +}
> >> > > +
> >> > >  /* parses DFS referral V3 structure
> >> > >   * caller is responsible for freeing target_nodes
> >> > >   * returns:
> >> > > --
> >> > > 2.39.2
> >> > >
> >> > >
> >> >
> >> >
> >> > --
> >> > Thanks,
> >> >
> >> > Steve
> >>
> >>
> >>
> >> --
> >> Regards,
> >> Shyam



--=20
Regards,
Shyam

