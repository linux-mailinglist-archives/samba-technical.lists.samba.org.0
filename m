Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B634A9C6E8
	for <lists+samba-technical@lfdr.de>; Mon, 26 Aug 2019 02:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=W/51w5j8xEcYmqOnM2KI7Id/pY4RG7FnEXZK5a9W5RA=; b=f6E50EnvVvAyl7i/krsUCZoaVU
	EFvCZDZcW3hKpe1P3hlHLMJpHhBW8coC5giLe5FhHbc3lylLCUeOe/nLfSinaBNWOH+VGU67jbq8p
	9nRY4OEOPSqUV6s7ekpE40O6TZMi230LoJKKLGIum+xB/Fb09SffeaBGqT1LgMardalCD9/aHgVzw
	P7I1lPU08yM0xJKidUc+7+8zgD+p68IreGM7WMnyFNHrobX383t1cvQu+kvZzrgZ2FedFtrbFTK94
	fdHB3fgt0Tn/6G5DHJx3fTnRoqUJcBkzZjihwZUU3TSQpl5OFir1K6Pt5uj/PopWfcRq95omipNmb
	N4hzf+sA==;
Received: from localhost ([::1]:54688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i23BB-008KjH-73; Mon, 26 Aug 2019 00:48:17 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37759) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i23B6-008KjA-0D
 for samba-technical@lists.samba.org; Mon, 26 Aug 2019 00:48:14 +0000
Received: by mail-io1-xd42.google.com with SMTP id q22so33208110iog.4
 for <samba-technical@lists.samba.org>; Sun, 25 Aug 2019 17:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/51w5j8xEcYmqOnM2KI7Id/pY4RG7FnEXZK5a9W5RA=;
 b=jiglPNpgKm4E5mpddxqvqDxY+bWhiTdGIiXT9uvxVz1duakfoA0qsNe5RK29mA6Dcp
 kg+Wk9tznXQsM40KYC2TtpmG4f9oxaGSqH/PMDRfN6WLlY4IXrKLYga69MPDT1rcbU6s
 JHwnkbxQiMHJTwzPvpaBKebn9G5xjknuQunqMDbIW5TIFb6CpTWl1NKGwpA1dY92vlqE
 mGRkyznLTonRN/FzEbyM50uXHAW5ifkHfp2LHlf52/ypSZXw0P25Q62Q56Rgglfv7tgT
 Tpdp15TuTcucREXfQLHhvQtiYaW0/sNb2oZYwk4jXp6GVtG0atQ99PLhoZPfve7XCAqk
 UwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/51w5j8xEcYmqOnM2KI7Id/pY4RG7FnEXZK5a9W5RA=;
 b=es0oj2n1scEncUkuZiOlvP3zEwDP1WA79nxkGj70CEi2q03yU+wRVa8ZDrS+uRjhrj
 9kewD0w3QWp58pHZytnQNmEN7GKd6PC5pQYKew8TEyEc+kWNV38opB2GMkhXU3gWorBB
 mE2gtNBSzXtn07pmtiLLmaMC/b/b8+6w4H9zMJs86+GioL0mnmXbMwNDks5/rkeadKWK
 r4Kc+rXTxeOAbXFuY2kXv0XisO8OVBNP+OVpYprGjwWuTGdc7wKbS8X5TcceXpuWpa63
 mCGmkdQRcYlN0PNWma4CCk0xEYLZflnZwgecDd8ubJ3KF1QZCg+EG9iiceFfYP3ZAq9y
 z48A==
X-Gm-Message-State: APjAAAWuWbiIH5Z6f8JxbDAwbibUK/2xiYIQduHOOK+YWd2ckWgZ80Sd
 6Q4A9zsF9keR5abhs+0jdjXoog4w6myFiVkIcOfOMYk3
X-Google-Smtp-Source: APXvYqzXg9gVX/qKg0t2MCc7SoktEu+oMdiepBTfW0tBZwwwg2umaYojE9DZsKHbmvFwfWsBZdWs0TnBY8SLScsRhs4=
X-Received: by 2002:a02:29ca:: with SMTP id p193mr15275350jap.88.1566780488682; 
 Sun, 25 Aug 2019 17:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190823121535.76296-1-yuehaibing@huawei.com>
In-Reply-To: <20190823121535.76296-1-yuehaibing@huawei.com>
Date: Sun, 25 Aug 2019 19:47:57 -0500
Message-ID: <CAH2r5mt0T=4qw9tuvX-QO7Lh2A_gzWPhLMyou4ZJNDJgmFXEsA@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: remove set but not used variables
To: YueHaibing <yuehaibing@huawei.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Aug 23, 2019 at 6:11 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> fs/cifs/file.c: In function cifs_lock:
> fs/cifs/file.c:1696:24: warning: variable cinode set but not used [-Wunused-but-set-variable]
> fs/cifs/file.c: In function cifs_write:
> fs/cifs/file.c:1765:23: warning: variable cifs_sb set but not used [-Wunused-but-set-variable]
> fs/cifs/file.c: In function collect_uncached_read_data:
> fs/cifs/file.c:3578:20: warning: variable tcon set but not used [-Wunused-but-set-variable]
>
> 'cinode' is never used since introduced by
> commit 03776f4516bc ("CIFS: Simplify byte range locking code")
> 'cifs_sb' is not used since commit cb7e9eabb2b5 ("CIFS: Use
> multicredits for SMB 2.1/3 writes").
> 'tcon' is not used since commit d26e2903fc10 ("smb3: fix bytes_read statistics")
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/file.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index ab07ae8..f16f6d2 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1693,7 +1693,6 @@ int cifs_lock(struct file *file, int cmd, struct file_lock *flock)
>         bool posix_lck = false;
>         struct cifs_sb_info *cifs_sb;
>         struct cifs_tcon *tcon;
> -       struct cifsInodeInfo *cinode;
>         struct cifsFileInfo *cfile;
>         __u32 type;
>
> @@ -1710,7 +1709,6 @@ int cifs_lock(struct file *file, int cmd, struct file_lock *flock)
>         cifs_read_flock(flock, &type, &lock, &unlock, &wait_flag,
>                         tcon->ses->server);
>         cifs_sb = CIFS_FILE_SB(file);
> -       cinode = CIFS_I(file_inode(file));
>
>         if (cap_unix(tcon->ses) &&
>             (CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability)) &&
> @@ -1762,7 +1760,6 @@ cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
>         int rc = 0;
>         unsigned int bytes_written = 0;
>         unsigned int total_written;
> -       struct cifs_sb_info *cifs_sb;
>         struct cifs_tcon *tcon;
>         struct TCP_Server_Info *server;
>         unsigned int xid;
> @@ -1770,8 +1767,6 @@ cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
>         struct cifsInodeInfo *cifsi = CIFS_I(d_inode(dentry));
>         struct cifs_io_parms io_parms;
>
> -       cifs_sb = CIFS_SB(dentry->d_sb);
> -
>         cifs_dbg(FYI, "write %zd bytes to offset %lld of %pd\n",
>                  write_size, *offset, dentry);
>
> @@ -3575,10 +3570,8 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
>         struct cifs_readdata *rdata, *tmp;
>         struct iov_iter *to = &ctx->iter;
>         struct cifs_sb_info *cifs_sb;
> -       struct cifs_tcon *tcon;
>         int rc;
>
> -       tcon = tlink_tcon(ctx->cfile->tlink);
>         cifs_sb = CIFS_SB(ctx->cfile->dentry->d_sb);
>
>         mutex_lock(&ctx->aio_mutex);
> --
> 2.7.4
>
>


-- 
Thanks,

Steve

