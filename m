Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 219B21360C9
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jan 2020 20:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0gkJ1wnhwsbLBidpLWzC0gqEsOEqRPxrWzwmo/jij60=; b=XISiR3UVvnro96DNvOimcDtld3
	uS+7TP427x1evMwAIGZE854RutGt0o5xrt+vBTq/bvGf3LEfXLjzXryHyDTSBEvpzNtdkj0vRAZfp
	igsaGbwYIVF+mgk4B9EJnhV6wuQ6p+QTsUZNPacKrdzbmWWj9yXAgKJAUXLDm0viVhD6uEspMQSM8
	JzogHpYr739cubiZTdzDjrZAdz9hT/r3vaED+iZBF9mA/I3U5Ib5FCoRnuz7tl6umC0lEU38fdECW
	GOOjnthw0TNK3afFdMlNDH8OaU33IZdwdcaph3HScPL2pjKpL5bOzilwF/UHvGbWt9lcKbpmazS17
	vzjAxKbQ==;
Received: from localhost ([::1]:53292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipdCa-002rx1-7z; Thu, 09 Jan 2020 19:10:40 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37208) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipdCW-002rwU-8M
 for samba-technical@lists.samba.org; Thu, 09 Jan 2020 19:10:38 +0000
Received: by mail-io1-xd42.google.com with SMTP id k24so8356495ioc.4
 for <samba-technical@lists.samba.org>; Thu, 09 Jan 2020 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0gkJ1wnhwsbLBidpLWzC0gqEsOEqRPxrWzwmo/jij60=;
 b=SbNoT3sPqXIeCVvOK3tZBEJiF6JBMsS0SnfuogHqNmzVWmNsbJpcRU/1mthcVl/Pea
 zY1P5sbNK+8rDyfyjn+ufLBPJ6dyj9K8FyqNc8bwC7uvUBADoiYT03LhMsv3KTgrKMQh
 mB/8JIY7vZAjcsxzRRm9ALS0iTmLvvLeSsrupCVcdJRD59Mf4OzaVz6Gv1q9rIvDVkq8
 SdQGQbOot9xgroTT27UJMWgZlrUZ1vxhLaCNKX6gcE7mQPYRscqP5mR/xzLIeu5NB2di
 K/4ZN/lW/knGPW/oo4DfNFynlpL9BlGHiYfvdf5TKfb9mQec1NtF+BvnyNyNCfv+QEPn
 YOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0gkJ1wnhwsbLBidpLWzC0gqEsOEqRPxrWzwmo/jij60=;
 b=BKzH+DKPx2xsBamYDDHL1lsXlqi+AUg3AFjBvJAWGgmAwNnNoL3GL6MQm8qpaQE/S1
 AICYAO2Sqd2U8HU5bS2hJ+fYVZt2ZDexEviYZzzTv8+FU8Lo56I560LUmdeQSn9SbFMT
 jnhS//a78kZ06jc/imq7b5cdS7rwBP8wbhtDi5Rsd8MYX63DgGsYBKHgXmxNvIzX+bw4
 KRM+MCAHF/vvXWstiD2s9B4Su28tWEu7gq00f8pjQdETxrnLsLxuk51ZBV3US+lHdHJJ
 XP8UQ3gtfSRpKfcZRi2emCj6X+TZwimX/ysWl2k8/hfkf6ZJSxf+But9E6L5VqyHrCpT
 A5GA==
X-Gm-Message-State: APjAAAUycZxmaouJCwpYaJK1cS2KmvyzIS1kuv/Ma0gLmCU0vq5mIk1u
 0ix6AdjkPC6+kOR2+M26jXiYCAq2zJZbC3cpGC8=
X-Google-Smtp-Source: APXvYqw+BQZHUlgOmb6/E/rHDgfC3YhyI7dXQnzqMh5qh83xos4Eecke/yUUi15M16/RdkL76ez5tzRPdcKn9jNJONw=
X-Received: by 2002:a6b:c413:: with SMTP id y19mr8836903ioa.272.1578597033913; 
 Thu, 09 Jan 2020 11:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20191219165250.2875-1-bprotopopov@hotmail.com>
In-Reply-To: <20191219165250.2875-1-bprotopopov@hotmail.com>
Date: Thu, 9 Jan 2020 13:10:23 -0600
Message-ID: <CAH2r5mu0Jd=MACMn6_KPvNWoAPVu+V_3FOnoEZxDWoy0x2qEzA@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner info, dos attributes, and
 create time
To: Boris Protopopov <boris.v.protopopov@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

One loosely related question ...

Your patch adds the ability to set creation time (birth time) which
can be useful for backup/restore cases, but doesn't address the other
hole in Linux (the inability to restore a files ctime).

In Linux the ability to set timestamps seems quite limited (utimes
only allows setting mtime and atime).

Since setting all 4 timestamps is allowed over SMB3 (and all older
dialects as well), should we extend this to allow setting ctime not
just creation time over SMB3/CIFS mounts?

On Thu, Dec 19, 2019 at 10:53 AM Boris Protopopov
<boris.v.protopopov@gmail.com> wrote:
>
> Add extended attribute "system.cifs_ntsd" (and alias "system.smb3_ntsd")
> to allow for setting owner and DACL in the security descriptor. This is in
> addition to the existing "system.cifs_acl" and "system.smb3_acl" attributes
> that allow for setting DACL only. Add support for setting creation time and
> dos attributes using set_file_info() calls to complement the existing
> support for getting these attributes via query_path_info() calls.
>
> Signed-off-by: Boris Protopopov <bprotopopov@hotmail.com>
> ---
>  fs/cifs/xattr.c | 128 +++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 117 insertions(+), 11 deletions(-)
>
> diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
> index 9076150758d8..c41856e6fa22 100644
> --- a/fs/cifs/xattr.c
> +++ b/fs/cifs/xattr.c
> @@ -32,7 +32,8 @@
>  #include "cifs_unicode.h"
>
>  #define MAX_EA_VALUE_SIZE CIFSMaxBufSize
> -#define CIFS_XATTR_CIFS_ACL "system.cifs_acl"
> +#define CIFS_XATTR_CIFS_ACL "system.cifs_acl" /* DACL only */
> +#define CIFS_XATTR_CIFS_NTSD "system.cifs_ntsd" /* owner plus DACL */
>  #define CIFS_XATTR_ATTRIB "cifs.dosattrib"  /* full name: user.cifs.dosattrib */
>  #define CIFS_XATTR_CREATETIME "cifs.creationtime"  /* user.cifs.creationtime */
>  /*
> @@ -40,12 +41,62 @@
>   * confusing users and using the 20+ year old term 'cifs' when it is no longer
>   * secure, replaced by SMB2 (then even more highly secure SMB3) many years ago
>   */
> -#define SMB3_XATTR_CIFS_ACL "system.smb3_acl"
> +#define SMB3_XATTR_CIFS_ACL "system.smb3_acl" /* DACL only */
> +#define SMB3_XATTR_CIFS_NTSD "system.smb3_ntsd" /* owner plus DACL */
>  #define SMB3_XATTR_ATTRIB "smb3.dosattrib"  /* full name: user.smb3.dosattrib */
>  #define SMB3_XATTR_CREATETIME "smb3.creationtime"  /* user.smb3.creationtime */
>  /* BB need to add server (Samba e.g) support for security and trusted prefix */
>
> -enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT };
> +enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT,
> +       XATTR_CIFS_NTSD };
> +
> +static int cifs_attrib_set(unsigned int xid, struct cifs_tcon *pTcon,
> +                          struct inode *inode, char *full_path,
> +                          const void *value, size_t size)
> +{
> +       ssize_t rc = -EOPNOTSUPP;
> +       __u32 *pattrib = (__u32 *)value;
> +       __u32 attrib;
> +       FILE_BASIC_INFO info_buf;
> +
> +       if ((value == NULL) || (size != sizeof(__u32)))
> +               return -ERANGE;
> +
> +       memset(&info_buf, 0, sizeof(info_buf));
> +       info_buf.Attributes = attrib = cpu_to_le32(*pattrib);
> +
> +       if (pTcon->ses->server->ops->set_file_info)
> +               rc = pTcon->ses->server->ops->set_file_info(inode, full_path,
> +                               &info_buf, xid);
> +       if (rc == 0)
> +               CIFS_I(inode)->cifsAttrs = attrib;
> +
> +       return rc;
> +}
> +
> +static int cifs_creation_time_set(unsigned int xid, struct cifs_tcon *pTcon,
> +                                 struct inode *inode, char *full_path,
> +                                 const void *value, size_t size)
> +{
> +       ssize_t rc = -EOPNOTSUPP;
> +       __u64 *pcreation_time = (__u64 *)value;
> +       __u64 creation_time;
> +       FILE_BASIC_INFO info_buf;
> +
> +       if ((value == NULL) || (size != sizeof(__u64)))
> +               return -ERANGE;
> +
> +       memset(&info_buf, 0, sizeof(info_buf));
> +       info_buf.CreationTime = creation_time = cpu_to_le64(*pcreation_time);
> +
> +       if (pTcon->ses->server->ops->set_file_info)
> +               rc = pTcon->ses->server->ops->set_file_info(inode, full_path,
> +                               &info_buf, xid);
> +       if (rc == 0)
> +               CIFS_I(inode)->createtime = creation_time;
> +
> +       return rc;
> +}
>
>  static int cifs_xattr_set(const struct xattr_handler *handler,
>                           struct dentry *dentry, struct inode *inode,
> @@ -86,6 +137,23 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>
>         switch (handler->flags) {
>         case XATTR_USER:
> +               cifs_dbg(FYI, "%s:setting user xattr %s\n", __func__, name);
> +               if ((strcmp(name, CIFS_XATTR_ATTRIB) == 0) ||
> +                   (strcmp(name, SMB3_XATTR_ATTRIB) == 0)) {
> +                       rc = cifs_attrib_set(xid, pTcon, inode, full_path,
> +                                       value, size);
> +                       if (rc == 0) /* force revalidate of the inode */
> +                               CIFS_I(inode)->time = 0;
> +                       break;
> +               } else if ((strcmp(name, CIFS_XATTR_CREATETIME) == 0) ||
> +                          (strcmp(name, SMB3_XATTR_CREATETIME) == 0)) {
> +                       rc = cifs_creation_time_set(xid, pTcon, inode,
> +                                       full_path, value, size);
> +                       if (rc == 0) /* force revalidate of the inode */
> +                               CIFS_I(inode)->time = 0;
> +                       break;
> +               }
> +
>                 if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_XATTR)
>                         goto out;
>
> @@ -95,7 +163,8 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>                                 cifs_sb->local_nls, cifs_sb);
>                 break;
>
> -       case XATTR_CIFS_ACL: {
> +       case XATTR_CIFS_ACL:
> +       case XATTR_CIFS_NTSD: {
>                 struct cifs_ntsd *pacl;
>
>                 if (!value)
> @@ -106,12 +175,25 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
>                 } else {
>                         memcpy(pacl, value, size);
>                         if (value &&
> -                           pTcon->ses->server->ops->set_acl)
> -                               rc = pTcon->ses->server->ops->set_acl(pacl,
> -                                               size, inode,
> -                                               full_path, CIFS_ACL_DACL);
> -                       else
> +                           pTcon->ses->server->ops->set_acl) {
> +                               rc = 0;
> +                               if (handler->flags == XATTR_CIFS_NTSD) {
> +                                       /* set owner and DACL */
> +                                       rc = pTcon->ses->server->ops->set_acl(
> +                                                       pacl, size, inode,
> +                                                       full_path,
> +                                                       CIFS_ACL_OWNER);
> +                               }
> +                               if (rc == 0) {
> +                                       /* set DACL */
> +                                       rc = pTcon->ses->server->ops->set_acl(
> +                                                       pacl, size, inode,
> +                                                       full_path,
> +                                                       CIFS_ACL_DACL);
> +                               }
> +                       } else {
>                                 rc = -EOPNOTSUPP;
> +                       }
>                         if (rc == 0) /* force revalidate of the inode */
>                                 CIFS_I(inode)->time = 0;
>                         kfree(pacl);
> @@ -179,7 +261,7 @@ static int cifs_creation_time_get(struct dentry *dentry, struct inode *inode,
>                                   void *value, size_t size)
>  {
>         ssize_t rc;
> -       __u64 * pcreatetime;
> +       __u64 *pcreatetime;
>
>         rc = cifs_revalidate_dentry_attr(dentry);
>         if (rc)
> @@ -244,7 +326,9 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
>                                 full_path, name, value, size, cifs_sb);
>                 break;
>
> -       case XATTR_CIFS_ACL: {
> +       case XATTR_CIFS_ACL:
> +       case XATTR_CIFS_NTSD: {
> +               /* the whole ntsd is fetched regardless */
>                 u32 acllen;
>                 struct cifs_ntsd *pacl;
>
> @@ -382,6 +466,26 @@ static const struct xattr_handler smb3_acl_xattr_handler = {
>         .set = cifs_xattr_set,
>  };
>
> +static const struct xattr_handler cifs_cifs_ntsd_xattr_handler = {
> +       .name = CIFS_XATTR_CIFS_NTSD,
> +       .flags = XATTR_CIFS_NTSD,
> +       .get = cifs_xattr_get,
> +       .set = cifs_xattr_set,
> +};
> +
> +/*
> + * Although this is just an alias for the above, need to move away from
> + * confusing users and using the 20 year old term 'cifs' when it is no
> + * longer secure and was replaced by SMB2/SMB3 a long time ago, and
> + * SMB3 and later are highly secure.
> + */
> +static const struct xattr_handler smb3_ntsd_xattr_handler = {
> +       .name = SMB3_XATTR_CIFS_NTSD,
> +       .flags = XATTR_CIFS_NTSD,
> +       .get = cifs_xattr_get,
> +       .set = cifs_xattr_set,
> +};
> +
>  static const struct xattr_handler cifs_posix_acl_access_xattr_handler = {
>         .name = XATTR_NAME_POSIX_ACL_ACCESS,
>         .flags = XATTR_ACL_ACCESS,
> @@ -401,6 +505,8 @@ const struct xattr_handler *cifs_xattr_handlers[] = {
>         &cifs_os2_xattr_handler,
>         &cifs_cifs_acl_xattr_handler,
>         &smb3_acl_xattr_handler, /* alias for above since avoiding "cifs" */
> +       &cifs_cifs_ntsd_xattr_handler,
> +       &smb3_ntsd_xattr_handler, /* alias for above since avoiding "cifs" */
>         &cifs_posix_acl_access_xattr_handler,
>         &cifs_posix_acl_default_xattr_handler,
>         NULL
> --
> 2.14.5
>


-- 
Thanks,

Steve

