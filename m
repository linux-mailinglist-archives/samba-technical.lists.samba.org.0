Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70C13FB48
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 22:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wfcQ9021tMMuYp8SnnnjWWVgsxhlqB1io7+WMPi4zN4=; b=cYCzlOCsratylVAf+Du3Hukjol
	/ejhBsOCrsiuplZOiEf8v9THyGmo9rSriNHrXXb6wfwabBfWWVoROPTzsQrA4l5PVqYhgpPlLIZfW
	9phguYeXEaWtZ5uYJ63q/14UwGeZaM13MVQlFigUgr7MYqJOdpnHKiGOXra/pvsn/ty4e1xyC4277
	2E2dKAsGrpdXh2+jiqEyN1h17P66afQ4YWhu5iTybrllNuhodLFN8+uw+exD4DOZzniZWDI9uJ/Nk
	Erp3pgDwlJdlWL829dhpzIQKPyjM+XUhzd2jW3U20FJ441kpkn+C2JYz56aa+DryLZvLyMxSD0/RX
	CPJClhPg==;
Received: from localhost ([::1]:53130 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isCZg-003gfi-Oj; Thu, 16 Jan 2020 21:21:08 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33026) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isCZZ-003gfZ-Lu
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 21:21:06 +0000
Received: by mail-ot1-x342.google.com with SMTP id b18so20785536otp.0
 for <samba-technical@lists.samba.org>; Thu, 16 Jan 2020 13:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfcQ9021tMMuYp8SnnnjWWVgsxhlqB1io7+WMPi4zN4=;
 b=tBm1D8NKe+yw9V30l2d86RtxXEPBRMD7eTx02qcRq/No6wWiLNGd1eAXwdsm3DpMhs
 gtMMR/Car/rb0n4as/q9BlktPHWoh0JuJR4ofzRc0rqEhU54Gcs8Esg0qiuedD+bkmQr
 QujRv3FV7FexcxO3x5JilQ+gKnReATB+Fujk+oZ/xvnahQurgDtLKBgbV6LONCkVd4ig
 MGKsKJitywXo7KCAD+LY2GyUIv3BwpK25q4hKYzT0flgFZ0Jy0uGZbv12C7rb8SZcCQp
 1CfzN6C1T2survaj2Mw/9V3VffBJjjdHcGZEsJCH3aZKMD/rnsK4uETBWuwO8E8JLwdw
 LVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfcQ9021tMMuYp8SnnnjWWVgsxhlqB1io7+WMPi4zN4=;
 b=jXJkUhYXRK063Myq2bXVBKIHt6CgFZq+dVaeu8XXjg8F6NCbCyBzdmTdVpiioi78pF
 rVcO5N/wYuVbt0/fKJUFeei+DaJTM2Lnj2y844ofIqtbZBJTC9j7TfVIACjvbK+i2LLs
 ysluztoAyUYRcqxhRPg8687znb0d1tYItC0n6G9+qevvL+gygiXBT1ccJVkqvXsLaEb/
 pw+r8mWR91ntwbiSS1evdBJ/qMVK2hkSEk71kEEOEo22QA3BQebv5dLcU4uBdn6EJS9v
 bD0j0eeLWkaHWOhCORi82qfZ59PLCnrEiAO24kFV/rP81AuKxZX3372PfkWbNfBY0b1b
 df1Q==
X-Gm-Message-State: APjAAAWGF6SCxlty9BJRredmUdiGn6/vXW10Aaq8FRD5WuBuOHIbCys8
 bFEi20M19GxkGroVWnxzS7rpfmaPCeOJGVT6uO0=
X-Google-Smtp-Source: APXvYqxdRIuA3hdOTWNUJ9uiu6/84nXk+lZkHHVCoTYMuf1byhjPgZV+bAChh83j0s6r6CgKXqYnHARYCckR2Aq1iGo=
X-Received: by 2002:a9d:6544:: with SMTP id q4mr3745642otl.194.1579209658678; 
 Thu, 16 Jan 2020 13:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20191219165250.2875-1-bprotopopov@hotmail.com>
 <CAH2r5ms+7E8dSVb4NqgHyo927t8ynhCe_=M_1o3sHyqyO+pQFA@mail.gmail.com>
In-Reply-To: <CAH2r5ms+7E8dSVb4NqgHyo927t8ynhCe_=M_1o3sHyqyO+pQFA@mail.gmail.com>
Date: Thu, 16 Jan 2020 16:20:47 -0500
Message-ID: <CAHhKpQ5jekFZMnnGpZnm23fJdzx6=JDSZrHvJDe_-2LkqsYVBg@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner info, dos attributes, and
 create time
To: Steve French <smfrench@gmail.com>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Boris Protopopov <bprotopopov@hotmail.com>, sblbir@amazon.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

OK, Steve, I will look into it.

On Wed, Jan 15, 2020 at 4:18 PM Steve French <smfrench@gmail.com> wrote:
>
> lightly updated the description and merged into cifs-2.6.git for-next
>
> Boris,
> Might be helpful to add a small test (e.g. in the xfstest cifs subdir)
> for this, Ronnie had added a few small ones for automated testing that
> we use in the buildbot that are cifs specific and it is useful to
> reduce the chance of future regressions
>
> On Thu, Dec 19, 2019 at 10:53 AM Boris Protopopov
> <boris.v.protopopov@gmail.com> wrote:
> >
> > Add extended attribute "system.cifs_ntsd" (and alias "system.smb3_ntsd")
> > to allow for setting owner and DACL in the security descriptor. This is in
> > addition to the existing "system.cifs_acl" and "system.smb3_acl" attributes
> > that allow for setting DACL only. Add support for setting creation time and
> > dos attributes using set_file_info() calls to complement the existing
> > support for getting these attributes via query_path_info() calls.
> >
> > Signed-off-by: Boris Protopopov <bprotopopov@hotmail.com>
> > ---
> >  fs/cifs/xattr.c | 128 +++++++++++++++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 117 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/cifs/xattr.c b/fs/cifs/xattr.c
> > index 9076150758d8..c41856e6fa22 100644
> > --- a/fs/cifs/xattr.c
> > +++ b/fs/cifs/xattr.c
> > @@ -32,7 +32,8 @@
> >  #include "cifs_unicode.h"
> >
> >  #define MAX_EA_VALUE_SIZE CIFSMaxBufSize
> > -#define CIFS_XATTR_CIFS_ACL "system.cifs_acl"
> > +#define CIFS_XATTR_CIFS_ACL "system.cifs_acl" /* DACL only */
> > +#define CIFS_XATTR_CIFS_NTSD "system.cifs_ntsd" /* owner plus DACL */
> >  #define CIFS_XATTR_ATTRIB "cifs.dosattrib"  /* full name: user.cifs.dosattrib */
> >  #define CIFS_XATTR_CREATETIME "cifs.creationtime"  /* user.cifs.creationtime */
> >  /*
> > @@ -40,12 +41,62 @@
> >   * confusing users and using the 20+ year old term 'cifs' when it is no longer
> >   * secure, replaced by SMB2 (then even more highly secure SMB3) many years ago
> >   */
> > -#define SMB3_XATTR_CIFS_ACL "system.smb3_acl"
> > +#define SMB3_XATTR_CIFS_ACL "system.smb3_acl" /* DACL only */
> > +#define SMB3_XATTR_CIFS_NTSD "system.smb3_ntsd" /* owner plus DACL */
> >  #define SMB3_XATTR_ATTRIB "smb3.dosattrib"  /* full name: user.smb3.dosattrib */
> >  #define SMB3_XATTR_CREATETIME "smb3.creationtime"  /* user.smb3.creationtime */
> >  /* BB need to add server (Samba e.g) support for security and trusted prefix */
> >
> > -enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT };
> > +enum { XATTR_USER, XATTR_CIFS_ACL, XATTR_ACL_ACCESS, XATTR_ACL_DEFAULT,
> > +       XATTR_CIFS_NTSD };
> > +
> > +static int cifs_attrib_set(unsigned int xid, struct cifs_tcon *pTcon,
> > +                          struct inode *inode, char *full_path,
> > +                          const void *value, size_t size)
> > +{
> > +       ssize_t rc = -EOPNOTSUPP;
> > +       __u32 *pattrib = (__u32 *)value;
> > +       __u32 attrib;
> > +       FILE_BASIC_INFO info_buf;
> > +
> > +       if ((value == NULL) || (size != sizeof(__u32)))
> > +               return -ERANGE;
> > +
> > +       memset(&info_buf, 0, sizeof(info_buf));
> > +       info_buf.Attributes = attrib = cpu_to_le32(*pattrib);
> > +
> > +       if (pTcon->ses->server->ops->set_file_info)
> > +               rc = pTcon->ses->server->ops->set_file_info(inode, full_path,
> > +                               &info_buf, xid);
> > +       if (rc == 0)
> > +               CIFS_I(inode)->cifsAttrs = attrib;
> > +
> > +       return rc;
> > +}
> > +
> > +static int cifs_creation_time_set(unsigned int xid, struct cifs_tcon *pTcon,
> > +                                 struct inode *inode, char *full_path,
> > +                                 const void *value, size_t size)
> > +{
> > +       ssize_t rc = -EOPNOTSUPP;
> > +       __u64 *pcreation_time = (__u64 *)value;
> > +       __u64 creation_time;
> > +       FILE_BASIC_INFO info_buf;
> > +
> > +       if ((value == NULL) || (size != sizeof(__u64)))
> > +               return -ERANGE;
> > +
> > +       memset(&info_buf, 0, sizeof(info_buf));
> > +       info_buf.CreationTime = creation_time = cpu_to_le64(*pcreation_time);
> > +
> > +       if (pTcon->ses->server->ops->set_file_info)
> > +               rc = pTcon->ses->server->ops->set_file_info(inode, full_path,
> > +                               &info_buf, xid);
> > +       if (rc == 0)
> > +               CIFS_I(inode)->createtime = creation_time;
> > +
> > +       return rc;
> > +}
> >
> >  static int cifs_xattr_set(const struct xattr_handler *handler,
> >                           struct dentry *dentry, struct inode *inode,
> > @@ -86,6 +137,23 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
> >
> >         switch (handler->flags) {
> >         case XATTR_USER:
> > +               cifs_dbg(FYI, "%s:setting user xattr %s\n", __func__, name);
> > +               if ((strcmp(name, CIFS_XATTR_ATTRIB) == 0) ||
> > +                   (strcmp(name, SMB3_XATTR_ATTRIB) == 0)) {
> > +                       rc = cifs_attrib_set(xid, pTcon, inode, full_path,
> > +                                       value, size);
> > +                       if (rc == 0) /* force revalidate of the inode */
> > +                               CIFS_I(inode)->time = 0;
> > +                       break;
> > +               } else if ((strcmp(name, CIFS_XATTR_CREATETIME) == 0) ||
> > +                          (strcmp(name, SMB3_XATTR_CREATETIME) == 0)) {
> > +                       rc = cifs_creation_time_set(xid, pTcon, inode,
> > +                                       full_path, value, size);
> > +                       if (rc == 0) /* force revalidate of the inode */
> > +                               CIFS_I(inode)->time = 0;
> > +                       break;
> > +               }
> > +
> >                 if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_XATTR)
> >                         goto out;
> >
> > @@ -95,7 +163,8 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
> >                                 cifs_sb->local_nls, cifs_sb);
> >                 break;
> >
> > -       case XATTR_CIFS_ACL: {
> > +       case XATTR_CIFS_ACL:
> > +       case XATTR_CIFS_NTSD: {
> >                 struct cifs_ntsd *pacl;
> >
> >                 if (!value)
> > @@ -106,12 +175,25 @@ static int cifs_xattr_set(const struct xattr_handler *handler,
> >                 } else {
> >                         memcpy(pacl, value, size);
> >                         if (value &&
> > -                           pTcon->ses->server->ops->set_acl)
> > -                               rc = pTcon->ses->server->ops->set_acl(pacl,
> > -                                               size, inode,
> > -                                               full_path, CIFS_ACL_DACL);
> > -                       else
> > +                           pTcon->ses->server->ops->set_acl) {
> > +                               rc = 0;
> > +                               if (handler->flags == XATTR_CIFS_NTSD) {
> > +                                       /* set owner and DACL */
> > +                                       rc = pTcon->ses->server->ops->set_acl(
> > +                                                       pacl, size, inode,
> > +                                                       full_path,
> > +                                                       CIFS_ACL_OWNER);
> > +                               }
> > +                               if (rc == 0) {
> > +                                       /* set DACL */
> > +                                       rc = pTcon->ses->server->ops->set_acl(
> > +                                                       pacl, size, inode,
> > +                                                       full_path,
> > +                                                       CIFS_ACL_DACL);
> > +                               }
> > +                       } else {
> >                                 rc = -EOPNOTSUPP;
> > +                       }
> >                         if (rc == 0) /* force revalidate of the inode */
> >                                 CIFS_I(inode)->time = 0;
> >                         kfree(pacl);
> > @@ -179,7 +261,7 @@ static int cifs_creation_time_get(struct dentry *dentry, struct inode *inode,
> >                                   void *value, size_t size)
> >  {
> >         ssize_t rc;
> > -       __u64 * pcreatetime;
> > +       __u64 *pcreatetime;
> >
> >         rc = cifs_revalidate_dentry_attr(dentry);
> >         if (rc)
> > @@ -244,7 +326,9 @@ static int cifs_xattr_get(const struct xattr_handler *handler,
> >                                 full_path, name, value, size, cifs_sb);
> >                 break;
> >
> > -       case XATTR_CIFS_ACL: {
> > +       case XATTR_CIFS_ACL:
> > +       case XATTR_CIFS_NTSD: {
> > +               /* the whole ntsd is fetched regardless */
> >                 u32 acllen;
> >                 struct cifs_ntsd *pacl;
> >
> > @@ -382,6 +466,26 @@ static const struct xattr_handler smb3_acl_xattr_handler = {
> >         .set = cifs_xattr_set,
> >  };
> >
> > +static const struct xattr_handler cifs_cifs_ntsd_xattr_handler = {
> > +       .name = CIFS_XATTR_CIFS_NTSD,
> > +       .flags = XATTR_CIFS_NTSD,
> > +       .get = cifs_xattr_get,
> > +       .set = cifs_xattr_set,
> > +};
> > +
> > +/*
> > + * Although this is just an alias for the above, need to move away from
> > + * confusing users and using the 20 year old term 'cifs' when it is no
> > + * longer secure and was replaced by SMB2/SMB3 a long time ago, and
> > + * SMB3 and later are highly secure.
> > + */
> > +static const struct xattr_handler smb3_ntsd_xattr_handler = {
> > +       .name = SMB3_XATTR_CIFS_NTSD,
> > +       .flags = XATTR_CIFS_NTSD,
> > +       .get = cifs_xattr_get,
> > +       .set = cifs_xattr_set,
> > +};
> > +
> >  static const struct xattr_handler cifs_posix_acl_access_xattr_handler = {
> >         .name = XATTR_NAME_POSIX_ACL_ACCESS,
> >         .flags = XATTR_ACL_ACCESS,
> > @@ -401,6 +505,8 @@ const struct xattr_handler *cifs_xattr_handlers[] = {
> >         &cifs_os2_xattr_handler,
> >         &cifs_cifs_acl_xattr_handler,
> >         &smb3_acl_xattr_handler, /* alias for above since avoiding "cifs" */
> > +       &cifs_cifs_ntsd_xattr_handler,
> > +       &smb3_ntsd_xattr_handler, /* alias for above since avoiding "cifs" */
> >         &cifs_posix_acl_access_xattr_handler,
> >         &cifs_posix_acl_default_xattr_handler,
> >         NULL
> > --
> > 2.14.5
> >
>
>
> --
> Thanks,
>
> Steve

