Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1185066D
	for <lists+samba-technical@lfdr.de>; Sat, 10 Feb 2024 22:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sBvXTFMPi+m8sg4/bmpajrrobsY/Uf+EhZ9Y4mf58LU=; b=cGHb6RAAea2BBNzoUZFA828A2H
	L72nxs+JIoavyFeX86d98V3z2W1rNXs5Joz5YYVSPUqC2FTpfrGaxKQ2tsMUttFFI4QLYRCvqbTvs
	gm65Qyb+mXAIkUx8wd4Bw2YTEej0xp+SMf3eyonO7cKYdLx/y2M6rMMjWyALLBmgoXBuxyJvokmQF
	g0IjLWOYloIOhvryi8ZylZPs6MaXo1f9ZbYuCUIvgvpUep9zhWgzvoNxZMFsTNWrJDJSLTKsepkuz
	AuzUrw273BDOOcc/fOu83i/ubuAd6kWT9/thpys47YoYyhlL0W5jGmrV9LaPIYM+klyuuxtZ4lLfu
	NUKvahOA==;
Received: from ip6-localhost ([::1]:18378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rYuWf-0086cR-7M; Sat, 10 Feb 2024 21:04:41 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:56356) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rYuWY-0086cJ-PV
 for samba-technical@lists.samba.org; Sat, 10 Feb 2024 21:04:37 +0000
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d073b54359so28573991fa.0
 for <samba-technical@lists.samba.org>; Sat, 10 Feb 2024 13:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707599069; x=1708203869; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EhFNELz+YQTZ5C3hNk0pMxdrxk6ODdTl7lpdoS6hHwQ=;
 b=bIAW7Ao0zeATm4CsAmcINAONzmW4/kU/vQR85NFodLTxwykFPDQNJ0XR0ZiNiS/Rih
 L/5M6H15/JcZPgPBfiDOIh0pB/7Qx+wyl1XDM3r9vW9Nupxct8sN74g88d3I1URrlyWc
 LkLmhwbnvY29/54YDzKolqzlHcPXhJsMNieRrhTGBAo+bqAGRITHhRCtHNDhIpX27gXm
 u/gb87LjkOfF+G7oMzqzQGrbmjXj7L8CMPj2VmBckI6ZBGJC45TjokmT3DWM7OOzihjp
 UbVEgJiBqiT7SV7JoBkNNsQqwdaGxrqHoSIWLwDq5b5yXoTjNbkJUg2quOrSx/nQKXc7
 QhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707599069; x=1708203869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EhFNELz+YQTZ5C3hNk0pMxdrxk6ODdTl7lpdoS6hHwQ=;
 b=QGRpDhnCfBYVtM99JB1nLD1HMbj2cT6Es/LI+zSyHHpZpnfoxxkhMUI9feUYxiGx2G
 2HHRbuEw4RKW6fjFHAfhF66KGvFiwlv+EuzvIDeodaOx4BSmqi+b21rHAmwnVB2RT7mm
 71cE5z2DGX8HmrD38DAWCYf267hDyho5BdZNtsZHovMNK2R55s72xXoKvEGIveEm4ILt
 HSuaELpCsTtB8nWI2IUsYeBZjkJfQ4yhuOMH7TFbi/X0KGEPURaPpl1HNlttDbCW1yhB
 1jmLYH3lVt5xEPsYFHbREuEwCtcxrT3HTCkyAJlhCkdMqPmznKQiFK93hMRV7ySXxef6
 3OBg==
X-Gm-Message-State: AOJu0Yy3AhCVfIHdrBoPT4Vp6lAX6f8tvE5h9UIy1P22f2Rf35jGtJN6
 NZwY7Jg6THEAyxRPs+C+kZIUMjwMOpgpTvh2ws7BlifrjG2Cuh3s6cc+7JQDZhTVWuupUGQM1sg
 NJezku3QsOWwMJtGaU2xV2qWuwn8=
X-Google-Smtp-Source: AGHT+IEGajFBvRZPtBaUfe9L8TKETi5IeFSUQDoroPm0CE1S5WVbeY6LpAhi+F/zKDQdSHC8d57aZ8JGvlA/C+N8W6U=
X-Received: by 2002:a2e:9b46:0:b0:2d0:aa06:f496 with SMTP id
 o6-20020a2e9b46000000b002d0aa06f496mr1674743ljj.40.1707599068496; Sat, 10 Feb
 2024 13:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20240209131552.471765-1-meetakshisetiyaoss@gmail.com>
 <CAH2r5mtdebsVFbOoQeYYL79GVXe0wn=GfdgVE1RkQrnowHOO5Q@mail.gmail.com>
 <CANT5p=p+TYwH7yLH9+kvum0O5KjxKc9MrWtERCc7WCv_wzODQg@mail.gmail.com>
In-Reply-To: <CANT5p=p+TYwH7yLH9+kvum0O5KjxKc9MrWtERCc7WCv_wzODQg@mail.gmail.com>
Date: Sat, 10 Feb 2024 16:04:15 -0500
Message-ID: <CAH2r5mumpNgm62mSFQmtMANm-njH1VJsv4ZT50Cww9dTCed3XQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] smb: client: do not defer close open handles to
 deleted files
To: Shyam Prasad N <nspmangalore@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>, Meetakshi Setiya <msetiya@microsoft.com>,
 Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I lean toward using the existing attr field since it presumably could be
set remotely and best to be safe and consistent and also uses less space

ATTR_DELETE_ON_CLOSE

On Sat, Feb 10, 2024, 11:50 Shyam Prasad N <nspmangalore@gmail.com> wrote:

> On Sat, Feb 10, 2024 at 11:29=E2=80=AFAM Steve French <smfrench@gmail.com=
> wrote:
> >
> > could we make the "file_is_deleted" a boolean instead of using up more
> > space making it an int?
>
> Meetakshi initially had it as a bool. I asked her to make it a bitmap,
> just in case there can be other such flags that are needed in the
> future.
>
> >
> > Alternatively - would it be possible to simply look at the file
> > attributes to see if it was marked as deleted (ie we should already be
> > setting ATTR_DELETE_ON_CLOSE)
>
> It does not look like we use this attr anywhere today. (Am I missing
> something?)
> Also, it looks like a flag that SMB uses in requests and responses.
> I feel that it's better to keep a different flag for this purpose.
>
> >
> > On Fri, Feb 9, 2024 at 7:17=E2=80=AFAM <meetakshisetiyaoss@gmail.com> w=
rote:
> > >
> > > From: Meetakshi Setiya <msetiya@microsoft.com>
> > >
> > > When a file/dentry has been deleted before closing all its open
> handles,
> > > currently, closing them can add them to the deferred close list. This
> can
> > > lead to problems in creating file with the same name when the file is
> > > re-created before the deferred close completes. This issue was seen
> while
> > > reusing a client's already existing lease on a file for compound
> operations
> > > and xfstest 591 failed because of the deferred close handle that
> remained
> > > valid even after the file was deleted and was being reused to create =
a
> file
> > > with the same name. The server in this case returns an error on open
> with
> > > STATUS_DELETE_PENDING. Recreating the file would fail till the deferr=
ed
> > > handles are closed (duration specified in closetimeo).
> > >
> > > This patch fixes the issue by flagging all open handles for the delet=
ed
> > > file (file path to be precise) with FILE_DELETED at the end of the
> unlink
> > > operation. A new field cflags has been introduced in the cifsFileInfo
> > > structure to set the FILE_DELETED flag without interfering with the
> f_flags
> > > field. This cflags field could be useful in the future for setting mo=
re
> > > flags specific to cfile.
> > > When doing close in cifs_close for each of these handles, check the
> > > FILE_DELETED flag and do not defer close these handles if the
> corresponding
> > > filepath has been deleted.
> > >
> > > Signed-off-by: Meetakshi Setiya <msetiya@microsoft.com>
> > > ---
> > >  fs/smb/client/cifsglob.h  |  3 +++
> > >  fs/smb/client/cifsproto.h |  4 ++++
> > >  fs/smb/client/file.c      |  3 ++-
> > >  fs/smb/client/inode.c     |  2 ++
> > >  fs/smb/client/misc.c      | 22 ++++++++++++++++++++++
> > >  5 files changed, 33 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> > > index 16befff4cbb4..f6b4acdcdeb3 100644
> > > --- a/fs/smb/client/cifsglob.h
> > > +++ b/fs/smb/client/cifsglob.h
> > > @@ -1398,6 +1398,8 @@ struct cifs_fid_locks {
> > >         struct list_head locks;         /* locks held by fid above */
> > >  };
> > >
> > > +#define FILE_DELETED 00000001
> > > +
> > >  struct cifsFileInfo {
> > >         /* following two lists are protected by tcon->open_file_lock =
*/
> > >         struct list_head tlist; /* pointer to next fid owned by tcon =
*/
> > > @@ -1413,6 +1415,7 @@ struct cifsFileInfo {
> > >         struct dentry *dentry;
> > >         struct tcon_link *tlink;
> > >         unsigned int f_flags;
> > > +       unsigned int cflags;    /* flags for this file */
> > >         bool invalidHandle:1;   /* file closed via session abend */
> > >         bool swapfile:1;
> > >         bool oplock_break_cancelled:1;
> > > diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> > > index a841bf4967fa..f995b766b177 100644
> > > --- a/fs/smb/client/cifsproto.h
> > > +++ b/fs/smb/client/cifsproto.h
> > > @@ -296,6 +296,10 @@ extern void cifs_close_all_deferred_files(struct
> cifs_tcon *cifs_tcon);
> > >
> > >  extern void cifs_close_deferred_file_under_dentry(struct cifs_tcon
> *cifs_tcon,
> > >                                 const char *path);
> > > +
> > > +extern void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon
> > > +                               *cifs_tcon, const char *path);
> > > +
> > >  extern struct TCP_Server_Info *
> > >  cifs_get_tcp_session(struct smb3_fs_context *ctx,
> > >                      struct TCP_Server_Info *primary_server);
> > > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > > index b75282c204da..91cf4d2df4de 100644
> > > --- a/fs/smb/client/file.c
> > > +++ b/fs/smb/client/file.c
> > > @@ -483,6 +483,7 @@ struct cifsFileInfo *cifs_new_fileinfo(struct
> cifs_fid *fid, struct file *file,
> > >         cfile->uid =3D current_fsuid();
> > >         cfile->dentry =3D dget(dentry);
> > >         cfile->f_flags =3D file->f_flags;
> > > +       cfile->cflags =3D 0;
> > >         cfile->invalidHandle =3D false;
> > >         cfile->deferred_close_scheduled =3D false;
> > >         cfile->tlink =3D cifs_get_tlink(tlink);
> > > @@ -1085,7 +1086,7 @@ int cifs_close(struct inode *inode, struct file
> *file)
> > >                 if ((cifs_sb->ctx->closetimeo && cinode->oplock =3D=
=3D
> CIFS_CACHE_RHW_FLG)
> > >                     && cinode->lease_granted &&
> > >                     !test_bit(CIFS_INO_CLOSE_ON_LOCK, &cinode->flags)
> &&
> > > -                   dclose) {
> > > +                   dclose && !(cfile->cflags & FILE_DELETED)) {
> > >                         if (test_and_clear_bit(CIFS_INO_MODIFIED_ATTR=
,
> &cinode->flags)) {
> > >                                 inode_set_mtime_to_ts(inode,
> > >
>  inode_set_ctime_current(inode));
> > > diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> > > index d02f8ba29cb5..8121b5b1aa22 100644
> > > --- a/fs/smb/client/inode.c
> > > +++ b/fs/smb/client/inode.c
> > > @@ -1900,6 +1900,8 @@ int cifs_unlink(struct inode *dir, struct dentr=
y
> *dentry)
> > >         cifs_inode =3D CIFS_I(dir);
> > >         CIFS_I(dir)->time =3D 0;  /* force revalidate of dir as well =
*/
> > >  unlink_out:
> > > +       if (rc =3D=3D 0)
> > > +               cifs_mark_open_handles_for_deleted_file(tcon,
> full_path);
> > >         free_dentry_path(page);
> > >         kfree(attrs);
> > >         free_xid(xid);
> > > diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> > > index 0748d7b757b9..8e46dee1a36c 100644
> > > --- a/fs/smb/client/misc.c
> > > +++ b/fs/smb/client/misc.c
> > > @@ -853,6 +853,28 @@ cifs_close_deferred_file_under_dentry(struct
> cifs_tcon *tcon, const char *path)
> > >         free_dentry_path(page);
> > >  }
> > >
> > > +/*
> > > + * If a dentry has been deleted, all corresponding open handles
> should know that
> > > + * so that we do not defer close them.
> > > + */
> > > +void cifs_mark_open_handles_for_deleted_file(struct cifs_tcon *tcon,
> > > +                                            const char *path)
> > > +{
> > > +       struct cifsFileInfo *cfile;
> > > +       void *page;
> > > +       const char *full_path;
> > > +
> > > +       page =3D alloc_dentry_path();
> > > +       spin_lock(&tcon->open_file_lock);
> > > +       list_for_each_entry(cfile, &tcon->openFileList, tlist) {
> > > +               full_path =3D build_path_from_dentry(cfile->dentry,
> page);
> > > +               if (strcmp(full_path, path) =3D=3D 0)
> > > +                       cfile->cflags |=3D FILE_DELETED;
> > > +       }
> > > +       spin_unlock(&tcon->open_file_lock);
> > > +       free_dentry_path(page);
> > > +}
> > > +
> > >  /* parses DFS referral V3 structure
> > >   * caller is responsible for freeing target_nodes
> > >   * returns:
> > > --
> > > 2.39.2
> > >
> > >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Regards,
> Shyam
>
