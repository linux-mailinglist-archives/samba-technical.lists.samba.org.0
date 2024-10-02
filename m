Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A738D98CB5D
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2024 04:55:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HBtfLT5n5Bak6dzvoaIlQiioBlabZ6tHJXqAKEWWupA=; b=LtENgn3YtXOyTdH4BiHGeDmDwq
	ZA14DewL5iN1DvQyaFTQSWcMgifXUlHlbwSlIuYBq+/34JZwNyz5sskYbAUV0sU2/v+c5CrjnF5C2
	WYaNWPC8iS5MCa+eKceAhBDoAvGHFTuzQu45krX0kYdgs4IgR4oFdP8FohXjsHEZsS0CIUFT2ONQr
	ygTZtxzaPIFRcMUHwovA5h2COt8Qbi5ycbnBzCSMfZloG7pWGF0GK0XPL6vSUOnI9LaIzQZ2IfbOw
	6DT14AjVKUfEiIWpqefUx7jvGACvtHnJr1tw1DbRcwhs3+mveWh6xkVi6fo75wHCC59NcYrjtL6OX
	bFsaKjCw==;
Received: from ip6-localhost ([::1]:25764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svpWP-002p4d-5E; Wed, 02 Oct 2024 02:55:25 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:43206) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svpWK-002p4V-J0
 for samba-technical@lists.samba.org; Wed, 02 Oct 2024 02:55:23 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fada911953so3927371fa.0
 for <samba-technical@lists.samba.org>; Tue, 01 Oct 2024 19:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727837719; x=1728442519; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBtfLT5n5Bak6dzvoaIlQiioBlabZ6tHJXqAKEWWupA=;
 b=L7ZNa4VPy/tdkIEL9aiYqSHq9aWBT561f+bVi0ahLI4r4uXD62/OzsPA44cYzJeDf0
 1xLdo8LyHx5bfjv9jy5iu1gQ1rWsSwc1SzJE9B4uoqhqoTr8JV+cL68RgOWKtU8Y3zOg
 lkhPr9kp82oJxTDl6Z1Ht0jZZbSAQdQcVeO023TWL5+D0N6yo3cxhyVn4q4ufCchfxCn
 ua8qirkhaPex1+KbPTGjQ7f2KxJnVz8Yio3p9rPkgeA5sF3BrEhhngOIc+wE9U4SvhYQ
 zNnTZBCNj70L0AG0dikGRQhnrREELg356H2F+dk3DclDFJMorXHaPNJMzUqAPzaIIAYW
 v8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727837719; x=1728442519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBtfLT5n5Bak6dzvoaIlQiioBlabZ6tHJXqAKEWWupA=;
 b=clq+Czlz4V6lE5sUZ1NE1lPxtrnIOvGgDaWsz+C6s+h8sS+6QU3Nyo5bmtVuqaSroU
 O72gLU2Zio3ksMTNDd+xn72DQKDMn8JZElmugdrJ2J/vMwTsb8KNj18iqyopCAmzq3zL
 hUgCi6FI80Du7beLJ1Cy/9aJLZNFyX/1JOLVy974O6r29I/ao+ldrO2W8sGHuKtiE4Lx
 +psQTay4J27ntUEc+e99GgHwpy6JC/rF8smuClmfVllQmiZTN5RQLlZ4J/D8QaLwGb4G
 q+MMuDCKPwXIq3+VGk2rlqGssvCbEg/RQQQyhmglyeYyHgRKPCbIshEwh20L0XT6ULgy
 IEYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/defGvUKJWcPNLr4G+Awm3cC2b3cNu5ddu8pSiHRU51zqvQP0Z+yXHhuDPEpa73agISZ+xdkfDlhH69/PlS8=@lists.samba.org
X-Gm-Message-State: AOJu0YxctoxN2Gx7fTPQ+dzdzGg1uLpUtF+t6BZcp4b8HetA6aRUqg9g
 dh/DGmWl1JEoCn9Z8O/56a5hPvc7onKdovWH2zeFYZZQk2XejoBTvW7lWTUVv3/aqCGNUrSOjjD
 9Y62WAhXBDbhSJa5l4F2wrteM10w=
X-Google-Smtp-Source: AGHT+IHssEqv0unBInb7m7EItT105TTfXc09hELEcUF1hMnepLQhaifGSa/TVocR+krv64hJQLxxX3BUS26zCCjKc0g=
X-Received: by 2002:a05:6512:230e:b0:539:933c:51c6 with SMTP id
 2adb3069b0e04-539a0176bf7mr423546e87.29.1727837718605; Tue, 01 Oct 2024
 19:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240620083729.28623-1-wangrong@uniontech.com>
 <CAH2r5msOQ=OWAgRoYG5kO7fndMWt=_7ZBET-M3mkXMfgnLCM1A@mail.gmail.com>
In-Reply-To: <CAH2r5msOQ=OWAgRoYG5kO7fndMWt=_7ZBET-M3mkXMfgnLCM1A@mail.gmail.com>
Date: Tue, 1 Oct 2024 21:55:07 -0500
Message-ID: <CAH2r5mv0fZTiczADy2Ym65unER3kQoXTSaA_Q_9Jd72YQhusbw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: use actual path when queryfs
To: wangrong <wangrong@uniontech.com>
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
 linux-kernel@vger.kernel.org, sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next tentatively but want to do some more
testing on this (and any additional review comments would be welcome)

On Tue, Oct 1, 2024 at 9:33=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> Paulo just found this potentially important fix in email (it had gotten m=
issed).
>
> The one suspicious thing about this though ... we should have some
> code paths where we would use the cached root handle for statfs
> (which is preferable to doing an open of a new handle, since it is
> already open we don't risk an error coming back on open).
>
> Any ideas whether we also need additional changes to use the cached
> root handle better in statfs (since in most cases to
> Windows we would expect to have that)?
>
>
> On Thu, Jun 20, 2024 at 3:54=E2=80=AFAM wangrong <wangrong@uniontech.com>=
 wrote:
> >
> > Due to server permission control, the client does not have access to
> > the shared root directory, but can access subdirectories normally, so
> > users usually mount the shared subdirectories directly. In this case,
> > queryfs should use the actual path instead of the root directory to
> > avoid the call returning an error (EACCES).
> >
> > Signed-off-by: wangrong <wangrong@uniontech.com>
> > ---
> >  fs/smb/client/cifsfs.c   | 13 ++++++++++++-
> >  fs/smb/client/cifsglob.h |  2 +-
> >  fs/smb/client/smb1ops.c  |  2 +-
> >  fs/smb/client/smb2ops.c  | 19 ++++++++++++-------
> >  4 files changed, 26 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> > index bb86fc064..a4d59f0f5 100644
> > --- a/fs/smb/client/cifsfs.c
> > +++ b/fs/smb/client/cifsfs.c
> > @@ -313,8 +313,17 @@ cifs_statfs(struct dentry *dentry, struct kstatfs =
*buf)
> >         struct TCP_Server_Info *server =3D tcon->ses->server;
> >         unsigned int xid;
> >         int rc =3D 0;
> > +       const char *full_path;
> > +       void *page;
> >
> >         xid =3D get_xid();
> > +       page =3D alloc_dentry_path();
> > +
> > +       full_path =3D build_path_from_dentry(dentry, page);
> > +       if (IS_ERR(full_path)) {
> > +               rc =3D PTR_ERR(full_path);
> > +               goto statfs_out;
> > +       }
> >
> >         if (le32_to_cpu(tcon->fsAttrInfo.MaxPathNameComponentLength) > =
0)
> >                 buf->f_namelen =3D
> > @@ -330,8 +339,10 @@ cifs_statfs(struct dentry *dentry, struct kstatfs =
*buf)
> >         buf->f_ffree =3D 0;       /* unlimited */
> >
> >         if (server->ops->queryfs)
> > -               rc =3D server->ops->queryfs(xid, tcon, cifs_sb, buf);
> > +               rc =3D server->ops->queryfs(xid, tcon, full_path, cifs_=
sb, buf);
> >
> > +statfs_out:
> > +       free_dentry_path(page);
> >         free_xid(xid);
> >         return rc;
> >  }
> > diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> > index 73482734a..d3118d748 100644
> > --- a/fs/smb/client/cifsglob.h
> > +++ b/fs/smb/client/cifsglob.h
> > @@ -483,7 +483,7 @@ struct smb_version_operations {
> >                         __u16 net_fid, struct cifsInodeInfo *cifs_inode=
);
> >         /* query remote filesystem */
> >         int (*queryfs)(const unsigned int, struct cifs_tcon *,
> > -                      struct cifs_sb_info *, struct kstatfs *);
> > +                      const char *, struct cifs_sb_info *, struct ksta=
tfs *);
> >         /* send mandatory brlock to the server */
> >         int (*mand_lock)(const unsigned int, struct cifsFileInfo *, __u=
64,
> >                          __u64, __u32, int, int, bool);
> > diff --git a/fs/smb/client/smb1ops.c b/fs/smb/client/smb1ops.c
> > index 212ec6f66..e3a195824 100644
> > --- a/fs/smb/client/smb1ops.c
> > +++ b/fs/smb/client/smb1ops.c
> > @@ -909,7 +909,7 @@ cifs_oplock_response(struct cifs_tcon *tcon, __u64 =
persistent_fid,
> >
> >  static int
> >  cifs_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> > -            struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> > +            const char *path, struct cifs_sb_info *cifs_sb, struct kst=
atfs *buf)
> >  {
> >         int rc =3D -EOPNOTSUPP;
> >
> > diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> > index c8e536540..bb7194386 100644
> > --- a/fs/smb/client/smb2ops.c
> > +++ b/fs/smb/client/smb2ops.c
> > @@ -2784,7 +2784,7 @@ smb2_query_info_compound(const unsigned int xid, =
struct cifs_tcon *tcon,
> >
> >  static int
> >  smb2_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> > -            struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> > +            const char *path, struct cifs_sb_info *cifs_sb, struct kst=
atfs *buf)
> >  {
> >         struct smb2_query_info_rsp *rsp;
> >         struct smb2_fs_full_size_info *info =3D NULL;
> > @@ -2793,7 +2793,7 @@ smb2_queryfs(const unsigned int xid, struct cifs_=
tcon *tcon,
> >         int rc;
> >
> >
> > -       rc =3D smb2_query_info_compound(xid, tcon, "",
> > +       rc =3D smb2_query_info_compound(xid, tcon, path,
> >                                       FILE_READ_ATTRIBUTES,
> >                                       FS_FULL_SIZE_INFORMATION,
> >                                       SMB2_O_INFO_FILESYSTEM,
> > @@ -2821,28 +2821,33 @@ smb2_queryfs(const unsigned int xid, struct cif=
s_tcon *tcon,
> >
> >  static int
> >  smb311_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> > -              struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> > +              const char *path, struct cifs_sb_info *cifs_sb, struct k=
statfs *buf)
> >  {
> >         int rc;
> > -       __le16 srch_path =3D 0; /* Null - open root of share */
> > +       __le16 *utf16_path =3D NULL;
> >         u8 oplock =3D SMB2_OPLOCK_LEVEL_NONE;
> >         struct cifs_open_parms oparms;
> >         struct cifs_fid fid;
> >
> >         if (!tcon->posix_extensions)
> > -               return smb2_queryfs(xid, tcon, cifs_sb, buf);
> > +               return smb2_queryfs(xid, tcon, path, cifs_sb, buf);
> >
> >         oparms =3D (struct cifs_open_parms) {
> >                 .tcon =3D tcon,
> > -               .path =3D "",
> > +               .path =3D path,
> >                 .desired_access =3D FILE_READ_ATTRIBUTES,
> >                 .disposition =3D FILE_OPEN,
> >                 .create_options =3D cifs_create_options(cifs_sb, 0),
> >                 .fid =3D &fid,
> >         };
> >
> > -       rc =3D SMB2_open(xid, &oparms, &srch_path, &oplock, NULL, NULL,
> > +       utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
> > +       if (utf16_path =3D=3D NULL)
> > +               return -ENOMEM;
> > +
> > +       rc =3D SMB2_open(xid, &oparms, utf16_path, &oplock, NULL, NULL,
> >                        NULL, NULL);
> > +       kfree(utf16_path);
> >         if (rc)
> >                 return rc;
> >
> > --
> > 2.20.1
> >
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

