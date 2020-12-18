Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AF2DE8AC
	for <lists+samba-technical@lfdr.de>; Fri, 18 Dec 2020 19:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hdZYhfYJfGoDMDSenDh3dl/qSDDSt8Bfc0WyEJEKhF0=; b=aU1InJBIlG+KWgP/LG5t4jA4oT
	zhdrcCOnAr2ePyutf4eYjLesfOsbviAj5VSd3iYZzs7SyeykVtrjq0srb0tgofvU9yJZz2WM+AwC/
	VtbJScQuzTsIrFOp8PHSaBCiDlecPC53A1o2uLSXthb8kjMg3d+KZL6IDrehL7sQoYysEKEKhXNRS
	b9WWXsOuT+COtAtMiJieAMC0bJ6zyJAKWwQF0SaYuDMZVApsn5a23OjtGhhxkBsUulAynBXATOzKE
	dWA48jgPPSnDTdAMzGsjGarQzzb4stbccqUlUjyvbMNMwIZbb0L7wUYa1GVLaxspwzrK1mi6/nqCI
	XRNkcXFg==;
Received: from ip6-localhost ([::1]:38920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kqK5v-001zUg-Ic; Fri, 18 Dec 2020 18:03:11 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:45886) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kqK5q-001zUZ-MU
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 18:03:09 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id k78so2658066ybf.12
 for <samba-technical@lists.samba.org>; Fri, 18 Dec 2020 10:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdZYhfYJfGoDMDSenDh3dl/qSDDSt8Bfc0WyEJEKhF0=;
 b=JaFfHYJw/nEOPkMDF92ey2Gyab38sfVMNiM5LE5nxPspaEsViT+qcXSvGcYfS/lHZR
 5hkLQFqn4Sw/DC4ktXle7WylDmcS2PMR6zuKVisK/LbZj4TwKuMQYJt4xcBMGchScvnW
 Uy8XDD2Xuw1N/xKJFiXPM6wI5S+qwWOksv8URVcZkdrqSIOW3cGto1+sYGtvvCBDFqC7
 UHQlCzaocz3a/JeMrhBwR7aKkuYcWptX0FaoQmSi8NT1l6kTbOiktlxA6J+3sNpYVqvs
 QTBq4Jik+HrBWuANN0JEeWtv4wp00o+cZcV+ApMeT9sSdacpS+IyZSVNLmyYYTmf3HU4
 9EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdZYhfYJfGoDMDSenDh3dl/qSDDSt8Bfc0WyEJEKhF0=;
 b=QEANeRrgvv/EzZNHre9rSXe/Lu3MkuavNEDYQiq20IWAwv7futqAEPgvLSHYjzaSNB
 ie0fyFtsGAnBW3dLS/jvNHj4fvb0hZ8UPA6KNqI9qy9sA9tXqXV7fg1XqGKqWt0k1De4
 57SsiqZrbd7ygNW966r5oeutO28MBDO0hdZVxlTFTZpJWdVc9IoxVgG9TzHI31YAvFmF
 +mlac0E1ylcgBtt5GTE866Jp5nnkGbIgeKYWjQYAqRnaNZuaZXjfdlCsOoVxbKBAKBQt
 NODWi74FKFiFXFVrUUUMXXXIjtKCsLIqE112GruYjkO6yZroYt9A8XtLrt0SFym+XYlq
 JvhA==
X-Gm-Message-State: AOAM532zjSrr4BpStq/oKGw2QGs3R494HjH/NXwfmB8eZGBbxOGVRqDq
 A4bB8mTsQFcjw7zNi3kfk2OY+hmpmtTNA3J8nFg=
X-Google-Smtp-Source: ABdhPJzz3SMzAl+sNokZVwQtwOxk6N01hrx1uuqgZcBjhz6jimBmb1TOZxdX9bwC9AgqCVAX1Ca7VlfeA2ed6EERMlk=
X-Received: by 2002:a25:69d1:: with SMTP id e200mr7328969ybc.3.1608314571107; 
 Fri, 18 Dec 2020 10:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <20201217205808.14756-1-pboris@amazon.com>
In-Reply-To: <20201217205808.14756-1-pboris@amazon.com>
Date: Fri, 18 Dec 2020 23:32:41 +0530
Message-ID: <CANT5p=oMDGHSMOCgOrz6S9tuB3BmbL4mLqsC4vqSPod8pWsTaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add SMB 2 support for getting and setting SACLs
To: Boris Protopopov <pboris@amazon.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Steven French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samjonas@amazon.com, samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Minor comments inline...

On Fri, Dec 18, 2020 at 2:30 AM Boris Protopopov <pboris@amazon.com> wrote:
>
> Fix passing of the additional security info via version
> operations. Force new open when getting SACL and avoid
> reuse of files that were previously open without
> sufficient privileges to access SACLs.
>
> Signed-off-by: Boris Protopopov <pboris@amazon.com>
> ---
>
> After further testing, I found that the security info was not being
> passed correctly to opts->get_acl and opts->get_acl_by_fid(). Also,
> it turned out that files open for read were being used to fetch
> SACL without proper privileges. This patch fixes these issues, and
> is meant to be squashed (comments dropped) with the earlier patch.
>
> fs/cifs/cifsacl.c | 10 +++++-----
>  fs/cifs/smb2ops.c |  4 ++--
>  fs/cifs/smb2pdu.c |  4 +++-
>  fs/cifs/xattr.c   | 10 ++++------
>  4 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index 353394d9ada8..6baa121952ce 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -1245,7 +1245,7 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
>         int rc = 0;
>         struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
>         struct smb_version_operations *ops;
> -       const u32 unused = 0;
> +       const u32 info = 0;
>
>         cifs_dbg(NOISY, "converting ACL to mode for %s\n", path);
>
> @@ -1255,9 +1255,9 @@ cifs_acl_to_fattr(struct cifs_sb_info *cifs_sb, struct cifs_fattr *fattr,
>         ops = tlink_tcon(tlink)->ses->server->ops;
>
>         if (pfid && (ops->get_acl_by_fid))
> -               pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen, unused);
> +               pntsd = ops->get_acl_by_fid(cifs_sb, pfid, &acllen, info);
>         else if (ops->get_acl)
> -               pntsd = ops->get_acl(cifs_sb, inode, path, &acllen, unused);
> +               pntsd = ops->get_acl(cifs_sb, inode, path, &acllen, info);
>         else {
>                 cifs_put_tlink(tlink);
>                 return -EOPNOTSUPP;
> @@ -1295,7 +1295,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
>         struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
>         struct smb_version_operations *ops;
>         bool mode_from_sid, id_from_sid;
> -       const u32 unused = 0;
> +       const u32 info = 0;
>
>         if (IS_ERR(tlink))
>                 return PTR_ERR(tlink);
> @@ -1311,7 +1311,7 @@ id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 nmode,
>                 return -EOPNOTSUPP;
>         }
>
> -       pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, unused);
> +       pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, info);
>         if (IS_ERR(pntsd)) {
>                 rc = PTR_ERR(pntsd);
>                 cifs_dbg(VFS, "%s: error %d getting sec desc\n", __func__, rc);
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index d28a29728fb1..f5e198860c16 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -3315,9 +3315,9 @@ get_smb2_acl(struct cifs_sb_info *cifs_sb,
>         struct cifs_ntsd *pntsd = NULL;
>         struct cifsFileInfo *open_file = NULL;
>
> -       if (inode)
> +       if (inode && !(info & SACL_SECINFO))
>                 open_file = find_readable_file(CIFS_I(inode), true);
> -       if (!open_file)
> +       if (!open_file || (info & SACL_SECINFO))
>                 return get_smb2_acl_by_path(cifs_sb, path, pacllen, info);
>
>         pntsd = get_smb2_acl_by_fid(cifs_sb, &open_file->fid, pacllen, info);
Why not have an if (info & SACL_SECINFO) return
get_smb2_acl_by_path... right at the beginning?
Looks cleaner that way IMO.

> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 0aeb63694306..b207e1eb6803 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -3472,8 +3472,10 @@ SMB311_posix_query_info(const unsigned int xid, struct cifs_tcon *tcon,
>  int
>  SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
>                u64 persistent_fid, u64 volatile_fid,
> -              void **data, u32 *plen, u32 additional_info)
> +              void **data, u32 *plen, u32 extra_info)
>  {
> +       __u32 additional_info = OWNER_SECINFO | GROUP_SECINFO | DACL_SECINFO |
> +                               extra_info;
I still prefer having these flags set by the caller. That way, the
caller has the flexibility to query only the subset needed.

>         *plen = 0;
>
>         return query_info(xid, tcon, persistent_fid, volatile_fid,
> diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
> index 9318a2acf4ee..6b658a1172ef 100644
> --- a/fs/cifs/xattr.c
> +++ b/fs/cifs/xattr.c
> @@ -340,21 +340,19 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>                  * fetch owner, DACL, and SACL if asked for full descriptor,
>                  * fetch owner and DACL otherwise
>                  */
> -               u32 acllen, additional_info = 0;
> +               u32 acllen, extra_info;
>                 struct cifs_ntsd *pacl;
>
>                 if (pTcon->ses->server->ops->get_acl == NULL)
>                         goto out; /* rc already EOPNOTSUPP */
>
>                 if (handler->flags == XATTR_CIFS_NTSD_FULL) {
> -                       additional_info = OWNER_SECINFO | GROUP_SECINFO |
> -                               DACL_SECINFO | SACL_SECINFO;
> +                       extra_info = SACL_SECINFO;
>                 } else {
> -                       additional_info = OWNER_SECINFO | GROUP_SECINFO |
> -                               DACL_SECINFO;
> +                       extra_info = 0;
>                 }
>                 pacl = pTcon->ses->server->ops->get_acl(cifs_sb,
> -                               inode, full_path, &acllen, additional_info);
> +                               inode, full_path, &acllen, extra_info);
>                 if (IS_ERR(pacl)) {
>                         rc = PTR_ERR(pacl);
>                         cifs_dbg(VFS, "%s: error %zd getting sec desc\n",
> --
> 2.18.4
>


-- 
-Shyam

