Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D1532246
	for <lists+samba-technical@lfdr.de>; Tue, 24 May 2022 06:46:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3ji4sol5sENBEUR3FRJaaPGspSAIjqZFEyUSpEFLQDI=; b=Bbp7HFy4l8rUN+IpyTe7THJkUc
	yXxHea7GvxEbHuhxqbZIurWky2wEbKVGJtA+NSBxG5uSyypIGgvXA+D5M3zMcWxpmeTALik1P0lJj
	/PyWdh7eFeiBpWywDJKhYSD52DuqN28MYgSk1zZhQbaeBVqSVCes/izyMgbW1K2/E8N1hZQ+yD8BI
	06OcZ2c/qaJaxLtuVxON/q62P3Eq17HqfYHuoea8Bwv+W7XPcfHoK94QW9zm2pQrYhHiM7fztKzhM
	jBFkLgpoQHkuB2PTdDH2dbjT+cl8ozrIrNnCdVwd0op5mbtVyfylQ4JfbWDK/Um2pZ22pmkBr2vt+
	mnA094kg==;
Received: from ip6-localhost ([::1]:54184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ntMPw-002Xyt-0e; Tue, 24 May 2022 04:45:12 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:36818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ntMPl-002Xyg-Oa
 for samba-technical@lists.samba.org; Tue, 24 May 2022 04:45:06 +0000
Received: by mail-qk1-x72b.google.com with SMTP id l82so9617285qke.3
 for <samba-technical@lists.samba.org>; Mon, 23 May 2022 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ji4sol5sENBEUR3FRJaaPGspSAIjqZFEyUSpEFLQDI=;
 b=hYQ0c6yYUcVfmu71erT+6VDvx5G5eYcf4JX8bivgxAcVRq5T3YZxHLiHp7WVwTBBKX
 2cOVjoP55GH4W2zie2kWBOVkgG9jKEKwEHZKlBMLHQoU3Yc8QfBpCdlzyGoKWq6exl2z
 CXs+AIZOVs51bvpDx4A3SsKyoRq8+ZebiCv1qR8S+d2mqUxAJ/h6mxa3tZBaewM+RluK
 1wzAbw2iLe8Oy3Zk36z2kqKEuVS4oPAbyUAezph7jfU7+2GCbslF5ktHoXqlE7+7ecDQ
 5aw2ZDoJlyjN0AESyO2s/eOFveXNANFGXQV6JyxvQmmQbEnlvdWqWNb53GgzP2Uj38Kk
 pnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ji4sol5sENBEUR3FRJaaPGspSAIjqZFEyUSpEFLQDI=;
 b=MYNCBrhBBmZVSVxGYC9ec1mlKHC9JlS6mVZjJwwtKX1koZZgjSNLhigKahJjkQxilb
 FDfUUYzKoN+WwvkkExMS77KgBv9ITb8SrjwCjcUa/uIAphaX7KdQnLhw9uLl4VTGOJFn
 pAZwsQPezH/gTkjb7julWL0GfHHSmAyRu3qlzMeFL84M7huMKoCPGfSlkrcw6m5ZLl1a
 0bcr4QoXShZ88Z5Iq6wFD+0lFpfyjgcNVNqKGwzjM1IqW77YK5l64avBpUNZU18znZrm
 xuAt/oEXSN1lahAjzicqyfSATSzvJB75ZDrebZBe/84PsVrPszeFzxXwYs+t9/JpzYL+
 CoHA==
X-Gm-Message-State: AOAM53054q2SkaZYC+9IZ2PrIz+4P7iLr0cyMdm/ItupY1HyBQGpTLcm
 Qnj4RPsCQHR6kOUTfJ804Csv4ZXvW739hVlJzxM=
X-Google-Smtp-Source: ABdhPJyrMD7rEPjUOmV37i177VE1l/2iEx6x8NhX1oEETIuR1mmo3FjJT7Pvls+DCaJgQuyMwtU5RxBp/cx5GfJd574=
X-Received: by 2002:a37:8846:0:b0:6a0:f6f1:a015 with SMTP id
 k67-20020a378846000000b006a0f6f1a015mr16143176qkd.386.1653367492354; Mon, 23
 May 2022 21:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220520212746.95075-1-fred@cloudflare.com>
In-Reply-To: <20220520212746.95075-1-fred@cloudflare.com>
Date: Tue, 24 May 2022 07:44:41 +0300
Message-ID: <CAOQ4uxhOZu06xOHbwWszkvprjMVj4ZYbQMpdig0R1WH-4zZGCA@mail.gmail.com>
Subject: Re: [PATCH] cred: Propagate security_prepare_creds() error code
To: Frederick Lawler <fred@cloudflare.com>
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
Cc: linux-aio@kvack.org, Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, selinux@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, kernel-team@cloudflare.com,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 overlayfs <linux-unionfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 LSM List <linux-security-module@vger.kernel.org>, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 21, 2022 at 2:17 PM Frederick Lawler <fred@cloudflare.com> wrote:
>
> While experimenting with the security_prepare_creds() LSM hook, we
> noticed that our EPERM error code was not propagated up the callstack.
> Instead ENOMEM is always returned.  As a result, some tools may send a
> confusing error message to the user:
>
> $ unshare -rU
> unshare: unshare failed: Cannot allocate memory
>
> A user would think that the system didn't have enough memory, when
> instead the action was denied.
>
> This problem occurs because prepare_creds() and prepare_kernel_cred()
> return NULL when security_prepare_creds() returns an error code. Later,
> functions calling prepare_creds() and prepare_kernel_cred() return
> ENOMEM because they assume that a NULL meant there was no memory
> allocated.
>
> Fix this by propagating an error code from security_prepare_creds() up
> the callstack.
>
> Signed-off-by: Frederick Lawler <fred@cloudflare.com>
> ---
[...]
> @@ -1173,7 +1173,7 @@ struct file *filp_open(const char *filename, int flags, umode_t mode)
>  {
>         struct filename *name = getname_kernel(filename);
>         struct file *file = ERR_CAST(name);
> -
> +

stray whitespace

>         if (!IS_ERR(name)) {
>                 file = file_open_name(name, flags, mode);
>                 putname(name);
> diff --git a/fs/overlayfs/dir.c b/fs/overlayfs/dir.c
> index f18490813170..905eb8f69d64 100644
> --- a/fs/overlayfs/dir.c
> +++ b/fs/overlayfs/dir.c
> @@ -589,28 +589,32 @@ static int ovl_create_or_link(struct dentry *dentry, struct inode *inode,
>                         goto out_revert_creds;
>         }
>
> -       err = -ENOMEM;
>         override_cred = prepare_creds();
> -       if (override_cred) {
> -               override_cred->fsuid = inode->i_uid;
> -               override_cred->fsgid = inode->i_gid;
> -               if (!attr->hardlink) {
> -                       err = security_dentry_create_files_as(dentry,
> -                                       attr->mode, &dentry->d_name, old_cred,
> -                                       override_cred);
> -                       if (err) {
> -                               put_cred(override_cred);
> -                               goto out_revert_creds;
> -                       }
> -               }
> -               put_cred(override_creds(override_cred));
> -               put_cred(override_cred);
> +       if (IS_ERR(override_cred)) {
> +               err = PTR_ERR(override_cred);
> +               goto out_revert_creds;
> +       }
>
> -               if (!ovl_dentry_is_whiteout(dentry))
> -                       err = ovl_create_upper(dentry, inode, attr);
> -               else
> -                       err = ovl_create_over_whiteout(dentry, inode, attr);
> +       override_cred->fsuid = inode->i_uid;
> +       override_cred->fsgid = inode->i_gid;
> +       if (!attr->hardlink) {
> +               err = security_dentry_create_files_as(dentry, attr->mode,
> +                                                     &dentry->d_name,
> +                                                     old_cred,
> +                                                     override_cred);
> +               if (err) {
> +                       put_cred(override_cred);
> +                       goto out_revert_creds;
> +               }
>         }
> +       put_cred(override_creds(override_cred));
> +       put_cred(override_cred);
> +
> +       if (!ovl_dentry_is_whiteout(dentry))
> +               err = ovl_create_upper(dentry, inode, attr);
> +       else
> +               err = ovl_create_over_whiteout(dentry, inode, attr);
> +

It does not look like reducing the nesting level was really needed for
your change. Was it? It is impossible to review a logic change
with this much code churn.
Please stick to the changes you declared you are doing
and leave code style out of it.

>  out_revert_creds:
>         revert_creds(old_cred);
>         return err;
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 001cdbb8f015..b29b62670e10 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -1984,10 +1984,11 @@ static int ovl_fill_super(struct super_block *sb, void *data, int silent)
>         if (!ofs)
>                 goto out;
>
> -       err = -ENOMEM;
>         ofs->creator_cred = cred = prepare_creds();
> -       if (!cred)
> +       if (IS_ERR(ofs->creator_cred)) {
> +               err = PTR_ERR(ofs->creator_cred);
>                 goto out_err;
> +       }
>

A non NULL must not be assigned to ofs->creator_cred
use the cred local var for that check, otherwise things will
go badly in ovl_free_fs().

Thanks,
Amir.

