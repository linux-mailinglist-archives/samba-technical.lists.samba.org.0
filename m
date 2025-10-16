Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD026BE1558
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 05:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KEQXE06caMZeo5HYZoW0oDsuziZc3EuBAg1B8KF+blo=; b=iIVwnESZsP/uEYiCFKK3lZwWuH
	+lcNAOc2hFF1Uw42FIfRANQfTROZvLWz1wzfJpsyWmU+TA3AwF4YHgGWGk4E+vVs5xpB3IamT8B/G
	wFgQGQUeM8gs4Ib85OK61q9sRl7zUZijZtb6BA/mwu85eEqMk8quSvfUnNG5e5ULSokncqylPsGY/
	xhama6ed51AAdUHTe5Bui8eSBWi/h//chPG/S9YD5a0BGb/2JqALIDGTyRPxc5p8yYr2WAgOeOktj
	mxwXQluMLUbXe7mi952wF3QtBguYakk4Omj76r19pEat21CcEqZPNph6ajYlqQ7827LCuqeST+VSk
	kx1ru/AQ==;
Received: from ip6-localhost ([::1]:41120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9EPf-007u90-4g; Thu, 16 Oct 2025 03:12:23 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:52535) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9EPa-007u8t-2v
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 03:12:20 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-796fe71deecso3867206d6.1
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 20:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760584336; x=1761189136; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KEQXE06caMZeo5HYZoW0oDsuziZc3EuBAg1B8KF+blo=;
 b=CDf5fWcXc1ROQsJhuLdlqbgDIJb1GgkbmhgBTB3VrIdptXrwMpxmjEFXANN9p5sZYR
 Jjhc8Ij9+cfivQvI5l/JAD5o1VCum5eot8yI8YK0p2xdviSICZ6bq6s/5maznjzSJQ9+
 dOIUZBRHEsu1A8A15ssCq77FiQaTfqbuX5tNniZmmIipeIhLKeYCXRgP8SEdyWVrhGvc
 xGCCrHxP705KQEPhCz0kvFPDx2gJeSKMPC9sx1tQmhpzX+0DE/vHjc1N0kCBa1CURDdT
 2ScVzvORwr6ghxeZM9YzyFwuZiqEoI+LvMZJJE1s402os3/NBol3ArVVGLjJ2R8kLgLA
 Qn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760584336; x=1761189136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KEQXE06caMZeo5HYZoW0oDsuziZc3EuBAg1B8KF+blo=;
 b=rx5UgayfC+AuRx2o5Gz2xAu0ySWHU9GPqNKqia/BshNGmCRfniog6D/I8VwGYOGh4K
 qsHzkdbUou7sM1nQ/RrIhQLruns1uNC0pVv9ZoTMsc1x6m41T6VjNWedBgtnQWrmdp78
 gFPrExgHcsZwYIunGKSRGyZzdVcPEalsYcjeDdEyshnkRKPXl+MRcR2+79dtfp0m2sa2
 UPDUOAvxdbPklNy5EQmRWR3b44izlF+QeX/+VncBsJl2AwzZERtRI0g80eO0OeO6+mRb
 AgN6dysH++ooU3+upYdtkYae382gquWOdyCHoGP5g7HmR703xaz8bdi0l4mPjUk9AE85
 uSgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl6+aVjNmL5gidAYf1LzIhTO9Q9J8qGDiVAH+ECmPP4X9RO1giB7M33knSrHoIqu4xiHPcAHALEDbCo0Y7HKA=@lists.samba.org
X-Gm-Message-State: AOJu0Yxx59V/JDERF5dzY8nUKNY/lXkdU6QZRFl5/v6dE2UlEWeItVWO
 59aLfZsRWpebEtLO6gqWJsC2gO7YYoGlGVusruNIOzDyZaFiOPTIKIHmGt0gTY7qscHCR3sKnt+
 vh+Kjsg90DoaWM+Czdn91pgCjuT34aNw=
X-Gm-Gg: ASbGncvCmt81dG8d3rWSdNhVfGEGTJR/I4K+Km+K4YklEzNTDgCFU5GLNtmgoOC4whq
 +PL4yXO2LsXipWJXh/6FLPwfgpCL6MTRGV7BhYqEyMgdrqJd6OQSfqKGi+3tn6yNXC2lsEyeWuV
 XuOSX4kjtU8m3XXrQrIjBVoO3GSef+dA1rcLxj90yOQ9hWgrjYdjoFcEBZ1ci36nLmDJrUztAZr
 vr4nPlQDtsveswtwWqtf0kxxdREIMFRjTlzx1zyBDhkePfHcGZpvrW5Y+qOx0VVtCFzmZA4nxYo
 tCITyqgQPZ7/bdfjqhX4Q+oyqrmHiaoO1kTMNGOpHPCuU4XHfaM0x3evE/wlwedTPPxKv1VX5Tt
 LaNuVtHFrik6j4QhkP3F2pg0lEQcBPEY8ycLV4mFmACalc4qwKpfOa6ekaE9EkRPkZ411Mxk/wh
 Ulck+ta3aIgg==
X-Google-Smtp-Source: AGHT+IGAmXUQRmwsgVDvQbYvXojEsX7CJBtDld+dU6Sg9MvBtBJilFj4HbmhNlkERWRbsuIYDiCI/jX/pZLNTYS90MU=
X-Received: by 2002:ad4:5f89:0:b0:87c:b8f:f4f7 with SMTP id
 6a1803df08f44-87c0b8ff74amr32437746d6.29.1760584335852; Wed, 15 Oct 2025
 20:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <aPBeBxTQLeyFl4mx@chcpu18>
In-Reply-To: <aPBeBxTQLeyFl4mx@chcpu18>
Date: Wed, 15 Oct 2025 22:12:03 -0500
X-Gm-Features: AS18NWAEyWCeaVPeoVcoBEQpSJ9u0N2hnfc_WhSXLkxKfJqq1sbEBlBaJtOWFjY
Message-ID: <CAH2r5mtNVsFcMsW+=jdw4=hc4rssca-0fWMg4uhipBbuHnQ9GQ@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: Fix refcount leak for cifs_sb_tlink
To: Shuhao Fu <sfual@cse.ust.hk>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Markus Elfring <Markus.Elfring@web.de>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

updated the patch in cifs-2.6.git for-next

On Wed, Oct 15, 2025 at 9:53=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> called after successful calls to `cifs_sb_tlink()`. Three calls fail to
> update refcount accordingly, leading to possible resource leaks.
>
> Fixes: 8ceb98437946 ("CIFS: Move rename to ops struct")
> Fixes: 2f1afe25997f ("cifs: Use smb 2 - 3 and cifsacl mount options getac=
l functions")
> Fixes: 366ed846df60 ("cifs: Use smb 2 - 3 and cifsacl mount options setac=
l function")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
> Change in v2:
> 1. improved patch wording
> 2. nicer goto label naming
>
> Link to v1: https://lore.kernel.org/linux-cifs/aOzRF9JB9VkBKapw@osx.local=
/
> ---
>  fs/smb/client/inode.c   | 6 ++++--
>  fs/smb/client/smb2ops.c | 8 ++++----
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
> index 239dd84a3..098a79b7a 100644
> --- a/fs/smb/client/inode.c
> +++ b/fs/smb/client/inode.c
> @@ -2431,8 +2431,10 @@ cifs_do_rename(const unsigned int xid, struct dent=
ry *from_dentry,
>         tcon =3D tlink_tcon(tlink);
>         server =3D tcon->ses->server;
>
> -       if (!server->ops->rename)
> -               return -ENOSYS;
> +       if (!server->ops->rename) {
> +               rc =3D -ENOSYS;
> +               goto do_rename_exit;
> +       }
>
>         /* try path-based rename first */
>         rc =3D server->ops->rename(xid, tcon, from_dentry,
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c392cf59..00b3f769e 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3212,8 +3212,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return ERR_PTR(rc);
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3245,6 +3244,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>
> @@ -3285,8 +3285,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return rc;
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3307,6 +3306,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>         return rc;
> --
> 2.39.5 (Apple Git-154)
>
>


--=20
Thanks,

Steve

