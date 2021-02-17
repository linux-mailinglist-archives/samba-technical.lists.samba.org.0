Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9431E0C2
	for <lists+samba-technical@lfdr.de>; Wed, 17 Feb 2021 21:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=36J8v8GcH0x9Wqo2pW5kCC6+tAea+frYUujmEbPD8JY=; b=5GQyw3kq5bjBQ+PLw7r/f8ptYc
	A7G53dHo6HudXBYhJInLsDIkvUepFuFwEQeCmn3qR0UrQ2GgyoMEi7t0RX6HTXW6BnIuKnpZ8XsZa
	sWqTbOAdvxf/zPCfn9zIREUxSjruKDShb6ve5iON4piD+LjAkpSOsMA7xOYYjGQijFJ4pMyrOziVx
	WdcTgpeZkmDoKo/75+FMxMBPY21eqxRiEqwt4Xj+8+dfAV9awibl0BkrNvybBPcjG28AL6XZKvcYA
	4i40Jd5wajrNF7TYLIeoKL4UMId328QSyQCke/Q9mru+e5YS41QbDeaLzKzuayKkKm9P9NAFH6xKk
	bJbXLkzg==;
Received: from ip6-localhost ([::1]:18222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lCTjj-000U8o-4J; Wed, 17 Feb 2021 20:47:51 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:39942) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lCTjd-000U8h-6Q
 for samba-technical@lists.samba.org; Wed, 17 Feb 2021 20:47:48 +0000
Received: by mail-il1-x12b.google.com with SMTP id e7so12548824ile.7
 for <samba-technical@lists.samba.org>; Wed, 17 Feb 2021 12:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=36J8v8GcH0x9Wqo2pW5kCC6+tAea+frYUujmEbPD8JY=;
 b=EHG39DHe2zUwLnGbzMrWPQMvmSl8upXvtYlyQ9u9dlyfiiSuT2JC8ELoKzr6WpptkN
 3JIsTo8q+IfvY4bHSOuyHNyxDfACJR4+sIpfwHk5JHgzBaQcSfJcBNqbR71A53xRIodv
 3WFEbgruXKD1y2sQNNn6PYSwrU/Ldp5LpXuzKCJq1phqteLj/YC7dKiE/TMPteB3+dPI
 IYDH74sfRZpmCLblx01Ucss9/e2GFqDTHfqRURp0G04p3WEWBivyB8qWVvM92mhEdxIy
 yVKwYgIkehVQ7N/vVIcck0Yw/Vr4k+9SPgnJ+iXtfLOby+yEQrvMet2VzWRW470LuOjd
 WOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=36J8v8GcH0x9Wqo2pW5kCC6+tAea+frYUujmEbPD8JY=;
 b=shqOlu7FVYabaWQ7PjndhoH342mCkbOjcxFlAro+cJgZJfZSQzWUwXVUKDABMUG35k
 GSsPM4odUJjbGPnm7cx7lVJcF9+yBSuNkxw/TJdWhky8r39Rw3IXEJkuKmJSf66HTQOY
 JlRHNLEasmXVsRQ0yzBjAVSghU9FDloQu7IGorUaFcIKfFAKWCCoKdceDajZoZi8z3fL
 5FezD2Rae//MH3qvWlhuutkwmHcJKOVlD+lIeCvR8aD87e0S59RkzdxF3W1fQhVA6qHd
 JWEatrlrAT7jq92G7Mr5BKN0ZlXuLAzdNSytIRpzFWRyP1Vip0NP/63LebQyKV3meovT
 D5iQ==
X-Gm-Message-State: AOAM532dqo6CGNprNoyN144BrsME6R5JjxdMY0/G9+trCD9+7Um9KZ7k
 dnCNQ51m21qqACXqBXqXPFynZA/ekehGRNoP4cw=
X-Google-Smtp-Source: ABdhPJzYkAHI/b+3jQMEdQXB+iRBVamaK5rWR+tLyf4FlWaxVbdV7OF2k1+Ohh+hilknNdvyyqFx0zNjCFgMTzTsKE4=
X-Received: by 2002:a05:6e02:8ab:: with SMTP id
 a11mr736193ilt.137.1613594863093; 
 Wed, 17 Feb 2021 12:47:43 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxii=7KUKv1w32VbjkwS+Z1a0ge0gezNzpn_BiY6MFWkpA@mail.gmail.com>
 <20210217172654.22519-1-lhenriques@suse.de>
In-Reply-To: <20210217172654.22519-1-lhenriques@suse.de>
Date: Wed, 17 Feb 2021 22:47:31 +0200
Message-ID: <CAOQ4uxisQicRLso-i=5jWfAQX1kxSc=Bb9BaU5Wezs=QKbuciA@mail.gmail.com>
Subject: Re: [PATCH v3] vfs: fix copy_file_range regression in cross-fs copies
To: Luis Henriques <lhenriques@suse.de>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Greg KH <gregkh@linuxfoundation.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Ian Lance Taylor <iant@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Steve French <sfrench@samba.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 ceph-devel <ceph-devel@vger.kernel.org>, Luis Lozano <llozano@chromium.org>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 17, 2021 at 7:25 PM Luis Henriques <lhenriques@suse.de> wrote:
>
> A regression has been reported by Nicolas Boichat, found while using the
> copy_file_range syscall to copy a tracefs file.  Before commit
> 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") the
> kernel would return -EXDEV to userspace when trying to copy a file across
> different filesystems.  After this commit, the syscall doesn't fail anymore
> and instead returns zero (zero bytes copied), as this file's content is
> generated on-the-fly and thus reports a size of zero.
>
> This patch restores some cross-filesystems copy restrictions that existed
> prior to commit 5dae222a5ff0 ("vfs: allow copy_file_range to copy across
> devices").  It also introduces a flag (COPY_FILE_SPLICE) that can be used
> by filesystems calling directly into the vfs copy_file_range to override
> these restrictions.  Right now, only NFS needs to set this flag.
>
> Fixes: 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
> Link: https://lore.kernel.org/linux-fsdevel/20210212044405.4120619-1-drinkcat@chromium.org/
> Link: https://lore.kernel.org/linux-fsdevel/CANMq1KDZuxir2LM5jOTm0xx+BnvW=ZmpsG47CyHFJwnw7zSX6Q@mail.gmail.com/
> Link: https://lore.kernel.org/linux-fsdevel/20210126135012.1.If45b7cdc3ff707bc1efa17f5366057d60603c45f@changeid/
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Luis Henriques <lhenriques@suse.de>
> ---
> Ok, I've tried to address all the issues and comments.  Hopefully this v3
> is a bit closer to the final fix.
>
> Changes since v2
> - do all the required checks earlier, in generic_copy_file_checks(),
>   adding new checks for ->remap_file_range
> - new COPY_FILE_SPLICE flag
> - don't remove filesystem's fallback to generic_copy_file_range()
> - updated commit changelog (and subject)
> Changes since v1 (after Amir review)
> - restored do_copy_file_range() helper
> - return -EOPNOTSUPP if fs doesn't implement CFR
> - updated commit description
>
>  fs/nfsd/vfs.c      |  3 ++-
>  fs/read_write.c    | 44 +++++++++++++++++++++++++++++++++++++++++---
>  include/linux/fs.h |  7 +++++++
>  3 files changed, 50 insertions(+), 4 deletions(-)
>
> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index 04937e51de56..14e55822c223 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -578,7 +578,8 @@ ssize_t nfsd_copy_file_range(struct file *src, u64 src_pos, struct file *dst,
>          * limit like this and pipeline multiple COPY requests.
>          */
>         count = min_t(u64, count, 1 << 22);
> -       return vfs_copy_file_range(src, src_pos, dst, dst_pos, count, 0);
> +       return vfs_copy_file_range(src, src_pos, dst, dst_pos, count,
> +                                  COPY_FILE_SPLICE);
>  }
>
>  __be32 nfsd4_vfs_fallocate(struct svc_rqst *rqstp, struct svc_fh *fhp,
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 75f764b43418..40a16003fb05 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -1410,6 +1410,33 @@ static ssize_t do_copy_file_range(struct file *file_in, loff_t pos_in,
>                                        flags);
>  }
>
> +/*
> + * This helper function checks whether copy_file_range can actually be used,
> + * depending on the source and destination filesystems being the same.
> + *
> + * In-kernel callers may set COPY_FILE_SPLICE to override these checks.
> + */
> +static int fops_copy_file_checks(struct file *file_in, struct file *file_out,
> +                                unsigned int flags)
> +{
> +       if (WARN_ON_ONCE(flags & ~COPY_FILE_SPLICE))
> +               return -EINVAL;
> +
> +       if (flags & COPY_FILE_SPLICE)
> +               return 0;
> +       /*
> +        * We got here from userspace, so forbid copies if copy_file_range isn't
> +        * implemented or if we're doing a cross-fs copy.
> +        */

Suggest:

       if (!file_in->f_op->copy_file_range) {
               if (file_in->f_op->copy_file_range !=
                   file_out->f_op->copy_file_range)
                   return -EXDEV;
       } else if (file_in->f_op->remap_file_range) {
               if (file_inode(file_in)->i_sb != file_inode(file_out)->i_sb)
                    return -EXDEV;
       } else {
                return -EOPNOTSUPP;
       }

       return 0;
}

> +
>  /*
>   * Performs necessary checks before doing a file copy
>   *
> @@ -1427,6 +1454,14 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
>         loff_t size_in;
>         int ret;
>
> +       /* Only check f_ops if we're not trying to clone */
> +       if (!file_in->f_op->remap_file_range ||
> +           (file_inode(file_in)->i_sb == file_inode(file_out)->i_sb)) {
> +               ret = fops_copy_file_checks(file_in, file_out, flags);
> +               if (ret)
> +                       return ret;
> +       }
> +

and then you don't need this special casing of clone here.

>         ret = generic_file_rw_checks(file_in, file_out);
>         if (ret)
>                 return ret;
> @@ -1474,9 +1509,6 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
>  {
>         ssize_t ret;
>
> -       if (flags != 0)
> -               return -EINVAL;
> -
>         ret = generic_copy_file_checks(file_in, pos_in, file_out, pos_out, &len,
>                                        flags);
>         if (unlikely(ret))
> @@ -1511,6 +1543,9 @@ ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
>                         ret = cloned;
>                         goto done;
>                 }
> +               ret = fops_copy_file_checks(file_in, file_out, flags);
> +               if (ret)
> +                       return ret;

and you don't need this here (right?)

and you can remove the checks for same i_sb and same copy_file_range
op that were already tested from vfs_copy_file_range().

Hope I am not missing anything.

Thanks,
Amir.

