Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CA98067
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2019 18:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=apmBza1D/jgq8ysrAYJLKFCh2KTiNJiS02F85HTZxwM=; b=GW9W2DOul1SxyxiYsUIdA8CNNu
	fCuQQXMa/G9PHjw2/Dzwhz16LwhvrnM6wgJLrgH5qGlmhMVwq9QjpIOtELy3yM0rcbOhB+sdpdeJN
	K867lKvW8F5KY4YDG7YXq9/4gC2gbuBHfNOmSw6VbazsCIPUGht1zLmwE70EbhBVBDn4hbeaIl3F5
	hyxpoo71wngAgLPf/eJfLLqaOebqOV/ojHWac8Ato+9qTQOKUVgrGvWQVm7cLd7b7SOuJv7k8MZcP
	OclyQZiRPMlcYp5S9YiLAS4tN40Mu0TPUGKuIt4zlmtaKPylD+ErwXygeAPy6CMtxox9NKQFLFBam
	0K49ifCg==;
Received: from localhost ([::1]:42922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i0TfF-007RQf-8r; Wed, 21 Aug 2019 16:40:49 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i0Tf8-007RQ8-6R
 for samba-technical@lists.samba.org; Wed, 21 Aug 2019 16:40:45 +0000
Received: by mail-pg1-x544.google.com with SMTP id w10so1614201pgj.7
 for <samba-technical@lists.samba.org>; Wed, 21 Aug 2019 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=apmBza1D/jgq8ysrAYJLKFCh2KTiNJiS02F85HTZxwM=;
 b=MGM+I4cVFJCHEZ3U9SQoxWMpfs5tfCg2ijgNS8TzK9IKDpoS7c63wFR1+BPJ8zxw2Y
 uwbj8cMdLVUwQAtAqj6UmdXXhLVnRLGPWgMtn0l8SaVmn7RKECeqknEMSoqOerbh2mKz
 yKGnZZaQOCWRnOLFYrW85l0xhctwqSgiAquO5s5z7mJHO+fPvd9BPDjGdpGg95qmuRT9
 TBB9056F17W+8OcJds43/dy1hEVfU8X4qd8nzULm+abvqfDbKZWQBMJwEeeF/+gePg2d
 SfiwedOR4z2D+dcyYSawFQ6wVBIox2DVeqMte4TRnK0ov+WsZg6rp2mx47MtmbIt9TAG
 8AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apmBza1D/jgq8ysrAYJLKFCh2KTiNJiS02F85HTZxwM=;
 b=tiJMl37CbghubcISvYIRUJunFAKU//b+9MTkO/GUL+aM+6us7ydnOrX9Mk8dxFyxFc
 0rHxrD28axF/ZlPLUsmFPJsjMSE349lBhqtI+L/IHzZMizk7w43R+X1TOW7QId5O4HBI
 L3EKPPgCTKoyj2MW+spLYxOF6y/WfqVF8Q0P0biIC2c/kQ+vTvuMWch6cCHxL1NGGCCL
 Eq3k1WVGvfo5c0FO6aHeaRSpwtfdZw1uOWHLMqgERA33ceFmVJX3lNpCV1qS5zC+VvzO
 pHKIKhL2pIK2xOcq4JvnhAbhd+61NxTnxRrVKaCmcrbBTXChhUhghavPxG1y7RgsEn76
 ROeQ==
X-Gm-Message-State: APjAAAXbxfhtfrNXpcq+s6cSP7P+2PXi8nyK8Erh6EJjVlKibwWSgKOZ
 gTGoE8S6bFKKV+rWqi+d4KyupOqgqJl4u7fshIsFdF2Y
X-Google-Smtp-Source: APXvYqySFNV7Fiio1XWiDQwaqpb6e509tE0QUHo6kTe+WUBLdA3o1pY/qTnJRfbmVkPpvjdkUcQtRwI1933ObaswpKQ=
X-Received: by 2002:a63:7245:: with SMTP id c5mr30322787pgn.11.1566405639720; 
 Wed, 21 Aug 2019 09:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <1566309647-67393-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1566309647-67393-1-git-send-email-zhengbin13@huawei.com>
Date: Wed, 21 Aug 2019 11:40:28 -0500
Message-ID: <CAH2r5mvx7y7B-LsgFY-MSJ1B2OM-87zaVYrQDO3VToey-VjcUw@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove unused variable
To: zhengbin <zhengbin13@huawei.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>, yi.zhang@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Aug 20, 2019 at 8:54 AM zhengbin <zhengbin13@huawei.com> wrote:
>
> In smb3_punch_hole, variable cifsi set but not used, remove it.
> In cifs_lock, variable netfid set but not used, remove it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  fs/cifs/file.c    | 2 --
>  fs/cifs/smb2ops.c | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 9709069..ab07ae8 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1695,7 +1695,6 @@ int cifs_lock(struct file *file, int cmd, struct file_lock *flock)
>         struct cifs_tcon *tcon;
>         struct cifsInodeInfo *cinode;
>         struct cifsFileInfo *cfile;
> -       __u16 netfid;
>         __u32 type;
>
>         rc = -EACCES;
> @@ -1711,7 +1710,6 @@ int cifs_lock(struct file *file, int cmd, struct file_lock *flock)
>         cifs_read_flock(flock, &type, &lock, &unlock, &wait_flag,
>                         tcon->ses->server);
>         cifs_sb = CIFS_FILE_SB(file);
> -       netfid = cfile->fid.netfid;
>         cinode = CIFS_I(file_inode(file));
>
>         if (cap_unix(tcon->ses) &&
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 64a5864..f5bbd1d 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -2939,7 +2939,6 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
>                             loff_t offset, loff_t len)
>  {
>         struct inode *inode;
> -       struct cifsInodeInfo *cifsi;
>         struct cifsFileInfo *cfile = file->private_data;
>         struct file_zero_data_information fsctl_buf;
>         long rc;
> @@ -2949,7 +2948,6 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
>         xid = get_xid();
>
>         inode = d_inode(cfile->dentry);
> -       cifsi = CIFS_I(inode);
>
>         /* Need to make file sparse, if not already, before freeing range. */
>         /* Consider adding equivalent for compressed since it could also work */
> --
> 2.7.4
>


-- 
Thanks,

Steve

