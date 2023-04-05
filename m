Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E4B6D8504
	for <lists+samba-technical@lfdr.de>; Wed,  5 Apr 2023 19:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=io+3jqowGGlAADxVVVRHguq+rruQrbxOod7tsbpQt3o=; b=w7a93V24Gr5T5G105yQFkNOeyS
	dYT3SoYUgCKBi7yvFs9Dvqw25M1RymFv5sIGdx3dsYzu3YqdF+SXi2rlWWiF0q3FDHx34RbJK1iQ2
	6E3vtQDYQnUfmdQvB5WC79RydgD+/B26AF0Rfgar8z+/zQEppagTtqGneOWE9Qjh2fxi6LR1Of5e+
	nxVJa8Ovxm4YpGlexLIZvHOUmOPI0jtTtT4sLRx+8us8uLWYZxziewJwJ8oBDzDHozvCaE6SEzIb+
	RMsKoDCHXSOSSpAY7ccNPY+I7rB32dh0S+Dqzdlp6U0sLf+Au4WRmY5/R+W1c4CvI4Fd7fR9TSrKw
	kLJFYuFA==;
Received: from ip6-localhost ([::1]:40890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pk74G-009TwF-Hd; Wed, 05 Apr 2023 17:37:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42828) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pk745-009Tw2-7e
 for samba-technical@lists.samba.org; Wed, 05 Apr 2023 17:37:06 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g19so34547576lfr.9
 for <samba-technical@lists.samba.org>; Wed, 05 Apr 2023 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680716216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=io+3jqowGGlAADxVVVRHguq+rruQrbxOod7tsbpQt3o=;
 b=geRNmWWoe1Vh4jNpLy+p+ZQ87NyvywzksSKDMvC0J19WfU9cRrGQJuofOhdVR7WXAY
 4BZk8H6k1OILfymJ0RgUheRJ31XYd/TJaNhg7ZIHMDulFSuV59YZ71xmqRacdOTyy81e
 OWylE9/Q//M3aR4JTPXck1iPpKrRPlpQxBWHsXXWfljNUJB5YjhbtkKTn10F6Zrxxtrs
 KQLejFMjyDwgF1RGHNds/vK0o8aQiUfSRIW39Cq8hh8uw4t18Ne1Ddh7xUstJAQgX5YG
 tqX+KKEqLsoBUAaXkhA8PXGWr3cdoBcxX4YIolYmmdNnlbhLB3VNUTiYnZSUbLp2n4ez
 amJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680716216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=io+3jqowGGlAADxVVVRHguq+rruQrbxOod7tsbpQt3o=;
 b=FNG6UEeXCgSsEAxyJoOfOrY8lP5dExgIA2X2sLVnZBKzz4M8H8/QEmH5fAyq+PKs6P
 bGuQXSlgBfD2oGCVwFPcv0i9Od6twqUb3rVgSubr83n620YTAiR/UqtGU8EFCFK55SPs
 Gm85hxxkkMCNOnYMdUNx6acOGr+P6Qp20MR6vx29snuNMPvQRSvcOGGbmgEyE+3Jf4b0
 Hvv+98Ffs0Rd+og1GENyeXvO8ee1HPCpZ7mtJq3/tCtDXguRiLKyFjBr/XKa3iezivDK
 EefKdyXxRlYs145uFh5VFkjWvphYbV1jdTXLAvpF2c+58iza0goAYF5mlDbiS7p3CjWI
 uaZA==
X-Gm-Message-State: AAQBX9fgH3ODFA8jvBaZR56VydK84O/xLdkjCVP1ozbGEWhUEsWcvU5p
 8syvd7r0+AxIYGzy1ImxyeZr0/hLKAKv61UAy48=
X-Google-Smtp-Source: AKy350a2O9eO93p10bVJLARVQzbIgEn2r3CdtkEFAGSgP85LLIHkG28POYjsOY8rGPh+VA4Ccdw80naQnsJ2VBeo/ME=
X-Received: by 2002:a05:6512:12d4:b0:4e8:3ee1:db14 with SMTP id
 p20-20020a05651212d400b004e83ee1db14mr1783567lfg.6.1680716215745; Wed, 05 Apr
 2023 10:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230405131647.6389-1-tbecker@redhat.com>
In-Reply-To: <20230405131647.6389-1-tbecker@redhat.com>
Date: Wed, 5 Apr 2023 12:36:44 -0500
Message-ID: <CAH2r5mv93nJKNrAz=7DfYKEZrN=gUA7pXciD_Kyr8yVdFGR_Lg@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: sanitize paths in cifs_update_super_prepath.
To: Thiago Becker <tbecker@redhat.com>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Thiago Rafael Becker <trbecker@gmail.com>, linux-cifs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added to cifs-2.6.git for-next and updated the tag which says:

"Buglink:" to "Link:"  (see this email thread for context
https://lore.kernel.org/all/3b036087d80b8c0e07a46a1dbaaf4ad0d018f8d5.167421=
7480.git.linux@leemhuis.info/)

On Wed, Apr 5, 2023 at 8:28=E2=80=AFAM Thiago Becker <tbecker@redhat.com> w=
rote:
>
> After a server reboot, clients are failing to move files with ENOENT.
> This is caused by DFS referrals containing multiple separators, which
> the server move call doesn't recognize.
>
> v1: Initial patch.
> v2: Move prototype to header.
>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2182472
> Fixes: a31080899d5f ("cifs: sanitize multiple delimiters in prepath")
> Actually-Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Thiago Rafael Becker <tbecker@redhat.com>
> ---
>  fs/cifs/fs_context.c | 13 +++++++------
>  fs/cifs/fs_context.h |  3 +++
>  fs/cifs/misc.c       |  2 +-
>  3 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/fs/cifs/fs_context.c b/fs/cifs/fs_context.c
> index 6d13f8207e96a..ace11a1a7c8ab 100644
> --- a/fs/cifs/fs_context.c
> +++ b/fs/cifs/fs_context.c
> @@ -441,13 +441,14 @@ int smb3_parse_opt(const char *options, const char =
*key, char **val)
>   * but there are some bugs that prevent rename from working if there are
>   * multiple delimiters.
>   *
> - * Returns a sanitized duplicate of @path. The caller is responsible for
> - * cleaning up the original.
> + * Returns a sanitized duplicate of @path. @gfp indicates the GFP_* flag=
s
> + * for kstrdup.
> + * The caller is responsible for freeing the original.
>   */
>  #define IS_DELIM(c) ((c) =3D=3D '/' || (c) =3D=3D '\\')
> -static char *sanitize_path(char *path)
> +char *cifs_sanitize_prepath(char *prepath, gfp_t gfp)
>  {
> -       char *cursor1 =3D path, *cursor2 =3D path;
> +       char *cursor1 =3D prepath, *cursor2 =3D prepath;
>
>         /* skip all prepended delimiters */
>         while (IS_DELIM(*cursor1))
> @@ -469,7 +470,7 @@ static char *sanitize_path(char *path)
>                 cursor2--;
>
>         *(cursor2) =3D '\0';
> -       return kstrdup(path, GFP_KERNEL);
> +       return kstrdup(prepath, gfp);
>  }
>
>  /*
> @@ -531,7 +532,7 @@ smb3_parse_devname(const char *devname, struct smb3_f=
s_context *ctx)
>         if (!*pos)
>                 return 0;
>
> -       ctx->prepath =3D sanitize_path(pos);
> +       ctx->prepath =3D cifs_sanitize_prepath(pos, GFP_KERNEL);
>         if (!ctx->prepath)
>                 return -ENOMEM;
>
> diff --git a/fs/cifs/fs_context.h b/fs/cifs/fs_context.h
> index 3de00e7127ec4..f4eaf85589022 100644
> --- a/fs/cifs/fs_context.h
> +++ b/fs/cifs/fs_context.h
> @@ -287,4 +287,7 @@ extern void smb3_update_mnt_flags(struct cifs_sb_info=
 *cifs_sb);
>   */
>  #define SMB3_MAX_DCLOSETIMEO (1 << 30)
>  #define SMB3_DEF_DCLOSETIMEO (1 * HZ) /* even 1 sec enough to help eg op=
en/write/close/open/read */
> +
> +extern char *cifs_sanitize_prepath(char *prepath, gfp_t gfp);
> +
>  #endif
> diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> index b44fb51968bfb..7f085ed2d866b 100644
> --- a/fs/cifs/misc.c
> +++ b/fs/cifs/misc.c
> @@ -1195,7 +1195,7 @@ int cifs_update_super_prepath(struct cifs_sb_info *=
cifs_sb, char *prefix)
>         kfree(cifs_sb->prepath);
>
>         if (prefix && *prefix) {
> -               cifs_sb->prepath =3D kstrdup(prefix, GFP_ATOMIC);
> +               cifs_sb->prepath =3D cifs_sanitize_prepath(prefix, GFP_AT=
OMIC);
>                 if (!cifs_sb->prepath)
>                         return -ENOMEM;
>
> --
> 2.39.2
>


--=20
Thanks,

Steve

