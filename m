Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE8098CB49
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2024 04:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RbGTpMQuJ5BfTFEroRt3BJM4+qdJ7VcgSP8FvNCXjGk=; b=T60eNw8iGXPS6+VJhORsPhdCNW
	5bIHzoVhb723DvVmKnonH8fx2CgSY34gvw9lhdiVvPsYpOM0zcCincEpyW4ourJbtIs+iDoYi3NIg
	ncKpEJ0YDXhp4t74qBOTDUDJdPBa/gl5d4RD6tZV3CoxxE3QoM3l8IkejNrcBNSFmP3r72uIhelNx
	OlyunLy3TVSkmlBYd2I1IFq7lpr630XVbCkvf574BrYls0Le4yGt7ifZxidpOZJHnFGpkkSCZwBe8
	lroJa+jIF6mOLOpK/HjcYQdYwFQXJaLpyr9t1cXYbGqqRJCNMShQ1CZzoDpUGFoIOzCca2dpRCq4i
	Ybvob4FA==;
Received: from ip6-localhost ([::1]:51034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1svpBR-002oyE-LU; Wed, 02 Oct 2024 02:33:45 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:52345) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1svpBL-002oy5-Rg
 for samba-technical@lists.samba.org; Wed, 02 Oct 2024 02:33:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5399041167cso4900017e87.0
 for <samba-technical@lists.samba.org>; Tue, 01 Oct 2024 19:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727836417; x=1728441217; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RbGTpMQuJ5BfTFEroRt3BJM4+qdJ7VcgSP8FvNCXjGk=;
 b=feUY9OP1nGDXNXylHWrcVDNBSlu9xzy8RpnUT/aILWVLjHQ8InHiEd9UATCGpbvFGu
 9bfp15+QbiUWj/8ijr9tg38MqJNhjU+6/m9ocFFuHJLsITyRQX3GoSWSU+X8iwwpsRbZ
 LbN3EQ4c/d1zH3+AZlZkkgIwdZQl/ytk+cAl9FSXz9Za33aznY1mArs3Lh+ov6Bjn3L3
 m9PvAhXPJDEDJNBFKJD/j0E6xYn1VuslxxhI2XcHwgwUbXMnB7I2SKiLuDOsP+8+PakJ
 DKqunQZUCWAhbQnoe1WqQQPIRs3kMXE8x0g82oqRO7hIB82kzosC+YnRX0Ru3mYVklgF
 tP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727836417; x=1728441217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RbGTpMQuJ5BfTFEroRt3BJM4+qdJ7VcgSP8FvNCXjGk=;
 b=VLc+PfPKFn8W/7uv2yhGOptH5r6kilgCykasTEyDE23kkzG3dz1/SD8uKlzLH9M9BU
 Kl+bkS/q3UAISEdJlIgjnM0FhdNjB9qo1EZ7AnMUJ/GE1Y+qy2JlIALWu3fWczB4QC90
 bnrt04qrLxeGEnguFAu9pQiEaLNWPlwaifC4tgCEdToOCd9278Gg2/UTWrMlpSQWFkff
 b3gZsPkwCriDzN/kIa7UVqAIAYTYesYPvm9q2eAwhq1qSfN0wHgOzMaI0yd/bXJx1tc/
 MOhiQ/BsQWpOiabYtPL3bPcM6gMgAsNyjOEMzwxe0umYeO8g+cFcydO6+evoYmRbmaR3
 2iQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdyUpnSb7VO+Appq3gjYh33ZZnpsNz/S09Peuyion+lo+yJaYmhIckSy2W77m75ej0rpQU9ed6M940H1DMj74=@lists.samba.org
X-Gm-Message-State: AOJu0YzuY7H2/WXkmgjlxPCpwY7DRzf0egyWkNsf64pD+etefe1bFsZL
 zaY3+VS+1cDtpNhGCAhf+AZSdaJfDkjOrrN8S6wElP9sfqSY1PNmLnHBmKn5MOb2k1AX1RpljpK
 TnuMbAlZHL44eYscyM3+ALMKN/YY=
X-Google-Smtp-Source: AGHT+IH3LoHtLB/YbfwZ+NoHPNRII1hWUdgKW0GkEUV/PegH3ScpacnSB6h1VPh+4EXg00/A4EikmSwqZ6TRpYKFx20=
X-Received: by 2002:a05:6512:12c8:b0:52c:d628:c77c with SMTP id
 2adb3069b0e04-539a0793c4emr1064906e87.43.1727836416184; Tue, 01 Oct 2024
 19:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240620083729.28623-1-wangrong@uniontech.com>
In-Reply-To: <20240620083729.28623-1-wangrong@uniontech.com>
Date: Tue, 1 Oct 2024 21:33:24 -0500
Message-ID: <CAH2r5msOQ=OWAgRoYG5kO7fndMWt=_7ZBET-M3mkXMfgnLCM1A@mail.gmail.com>
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

Paulo just found this potentially important fix in email (it had gotten mis=
sed).

The one suspicious thing about this though ... we should have some
code paths where we would use the cached root handle for statfs
(which is preferable to doing an open of a new handle, since it is
already open we don't risk an error coming back on open).

Any ideas whether we also need additional changes to use the cached
root handle better in statfs (since in most cases to
Windows we would expect to have that)?


On Thu, Jun 20, 2024 at 3:54=E2=80=AFAM wangrong <wangrong@uniontech.com> w=
rote:
>
> Due to server permission control, the client does not have access to
> the shared root directory, but can access subdirectories normally, so
> users usually mount the shared subdirectories directly. In this case,
> queryfs should use the actual path instead of the root directory to
> avoid the call returning an error (EACCES).
>
> Signed-off-by: wangrong <wangrong@uniontech.com>
> ---
>  fs/smb/client/cifsfs.c   | 13 ++++++++++++-
>  fs/smb/client/cifsglob.h |  2 +-
>  fs/smb/client/smb1ops.c  |  2 +-
>  fs/smb/client/smb2ops.c  | 19 ++++++++++++-------
>  4 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index bb86fc064..a4d59f0f5 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -313,8 +313,17 @@ cifs_statfs(struct dentry *dentry, struct kstatfs *b=
uf)
>         struct TCP_Server_Info *server =3D tcon->ses->server;
>         unsigned int xid;
>         int rc =3D 0;
> +       const char *full_path;
> +       void *page;
>
>         xid =3D get_xid();
> +       page =3D alloc_dentry_path();
> +
> +       full_path =3D build_path_from_dentry(dentry, page);
> +       if (IS_ERR(full_path)) {
> +               rc =3D PTR_ERR(full_path);
> +               goto statfs_out;
> +       }
>
>         if (le32_to_cpu(tcon->fsAttrInfo.MaxPathNameComponentLength) > 0)
>                 buf->f_namelen =3D
> @@ -330,8 +339,10 @@ cifs_statfs(struct dentry *dentry, struct kstatfs *b=
uf)
>         buf->f_ffree =3D 0;       /* unlimited */
>
>         if (server->ops->queryfs)
> -               rc =3D server->ops->queryfs(xid, tcon, cifs_sb, buf);
> +               rc =3D server->ops->queryfs(xid, tcon, full_path, cifs_sb=
, buf);
>
> +statfs_out:
> +       free_dentry_path(page);
>         free_xid(xid);
>         return rc;
>  }
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index 73482734a..d3118d748 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -483,7 +483,7 @@ struct smb_version_operations {
>                         __u16 net_fid, struct cifsInodeInfo *cifs_inode);
>         /* query remote filesystem */
>         int (*queryfs)(const unsigned int, struct cifs_tcon *,
> -                      struct cifs_sb_info *, struct kstatfs *);
> +                      const char *, struct cifs_sb_info *, struct kstatf=
s *);
>         /* send mandatory brlock to the server */
>         int (*mand_lock)(const unsigned int, struct cifsFileInfo *, __u64=
,
>                          __u64, __u32, int, int, bool);
> diff --git a/fs/smb/client/smb1ops.c b/fs/smb/client/smb1ops.c
> index 212ec6f66..e3a195824 100644
> --- a/fs/smb/client/smb1ops.c
> +++ b/fs/smb/client/smb1ops.c
> @@ -909,7 +909,7 @@ cifs_oplock_response(struct cifs_tcon *tcon, __u64 pe=
rsistent_fid,
>
>  static int
>  cifs_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> -            struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> +            const char *path, struct cifs_sb_info *cifs_sb, struct kstat=
fs *buf)
>  {
>         int rc =3D -EOPNOTSUPP;
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index c8e536540..bb7194386 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -2784,7 +2784,7 @@ smb2_query_info_compound(const unsigned int xid, st=
ruct cifs_tcon *tcon,
>
>  static int
>  smb2_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> -            struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> +            const char *path, struct cifs_sb_info *cifs_sb, struct kstat=
fs *buf)
>  {
>         struct smb2_query_info_rsp *rsp;
>         struct smb2_fs_full_size_info *info =3D NULL;
> @@ -2793,7 +2793,7 @@ smb2_queryfs(const unsigned int xid, struct cifs_tc=
on *tcon,
>         int rc;
>
>
> -       rc =3D smb2_query_info_compound(xid, tcon, "",
> +       rc =3D smb2_query_info_compound(xid, tcon, path,
>                                       FILE_READ_ATTRIBUTES,
>                                       FS_FULL_SIZE_INFORMATION,
>                                       SMB2_O_INFO_FILESYSTEM,
> @@ -2821,28 +2821,33 @@ smb2_queryfs(const unsigned int xid, struct cifs_=
tcon *tcon,
>
>  static int
>  smb311_queryfs(const unsigned int xid, struct cifs_tcon *tcon,
> -              struct cifs_sb_info *cifs_sb, struct kstatfs *buf)
> +              const char *path, struct cifs_sb_info *cifs_sb, struct kst=
atfs *buf)
>  {
>         int rc;
> -       __le16 srch_path =3D 0; /* Null - open root of share */
> +       __le16 *utf16_path =3D NULL;
>         u8 oplock =3D SMB2_OPLOCK_LEVEL_NONE;
>         struct cifs_open_parms oparms;
>         struct cifs_fid fid;
>
>         if (!tcon->posix_extensions)
> -               return smb2_queryfs(xid, tcon, cifs_sb, buf);
> +               return smb2_queryfs(xid, tcon, path, cifs_sb, buf);
>
>         oparms =3D (struct cifs_open_parms) {
>                 .tcon =3D tcon,
> -               .path =3D "",
> +               .path =3D path,
>                 .desired_access =3D FILE_READ_ATTRIBUTES,
>                 .disposition =3D FILE_OPEN,
>                 .create_options =3D cifs_create_options(cifs_sb, 0),
>                 .fid =3D &fid,
>         };
>
> -       rc =3D SMB2_open(xid, &oparms, &srch_path, &oplock, NULL, NULL,
> +       utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
> +       if (utf16_path =3D=3D NULL)
> +               return -ENOMEM;
> +
> +       rc =3D SMB2_open(xid, &oparms, utf16_path, &oplock, NULL, NULL,
>                        NULL, NULL);
> +       kfree(utf16_path);
>         if (rc)
>                 return rc;
>
> --
> 2.20.1
>
>


--=20
Thanks,

Steve

