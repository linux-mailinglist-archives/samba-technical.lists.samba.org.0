Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC282EB8DF
	for <lists+samba-technical@lfdr.de>; Wed,  6 Jan 2021 05:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zTK2J54FnZffWvRbx4mbZpAaWIjHl2sQ8iSg0f7XF+o=; b=LaO7kFbX+KW9KZ3WpfoOL/+5Mj
	DiTXFtyzZHpNO42MmgVqfaTLj2YKuD7wRvoWL2+CwIX3nkRgTGJBM23QlKc/phQHV9O8j9m4ErZsA
	mJYAK0Bn/C4a516lQJ1Rim2r+knC9QbYiJ/xsDeItIB+YmTQ4nSwwXPEKXvGItgtp9ztGKTEip3eX
	VByuLzDxCC+VnExwyOZki39RZG2eXcQ0LZD1KPm6V1eTFx4IlWrPLqLvIJUf14B30/3NyhDUHrbsk
	nBX/Z+8JlaczJughAcn/1EXdasEbAPsO7dOGd36ZPfbyBW8onFozz2lJRxFlVwatkG6xmBYWmzA86
	M/gtq0Nw==;
Received: from ip6-localhost ([::1]:21912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kx0Pi-004wES-CN; Wed, 06 Jan 2021 04:27:14 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39724) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kx0PW-004wEL-4C
 for samba-technical@lists.samba.org; Wed, 06 Jan 2021 04:27:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id a12so3734087lfl.6
 for <samba-technical@lists.samba.org>; Tue, 05 Jan 2021 20:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTK2J54FnZffWvRbx4mbZpAaWIjHl2sQ8iSg0f7XF+o=;
 b=Thrp8TYeerkOhatWx2pTbUQWDkB+b/OayEfDfd4RqZVjKKA8MsPe00P8b3GTFp2tLB
 UToj/RwSlhESyXzhvIf/kuXdSg21I4gUlatImkBV4t0ttr9b4LyoMi3d2tTYOeTdD1lo
 jnIzgNjI41LO5fumdhphLqlSqYQ6p3kgDlEoxWzLBlvYUUemsehtBxuJWL6u7SLdpdxZ
 Zt0fRiv6nmIiK9z6XqCWCkZsJZJgT0ihS61ca36HpGKxE0lRbyJSP5zl8SCq0BdNoj0c
 ydc6TLSVC0U4PtftTpptTf8vdz9W6JqkyM3DmBocGx+QRHY90WpB0fuvAvXRC1D3gTkP
 jqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTK2J54FnZffWvRbx4mbZpAaWIjHl2sQ8iSg0f7XF+o=;
 b=BCgHF4eJH0lQbrbdqyoA0tllVMF+OW74qADXNHoWjgUjCGZLN4H7lD6ge9085trqnZ
 p3MUBuljL84/RFNvv8gzaCcoN72gHCmsvVfYd8T/hRngG0wNWm6pVPCrb/P7lIaXkWgD
 EyBkWjuKyDXs/wiRezCuItUrg1MRTHOFQiJpA5yoElEmZSa7tb0KczjrJ4aC7xlPtX8C
 VwyyPpScKw6dsWeoQEWbHQDs0L1YgaeaM3a0FxB75PCxNFnCcbed6fQPyTMF1l5KYRwx
 PsQxP+jWY4AjvNMFR3mR5EaSsPq7tRrUOIZQ6rzfDazu9vySQoB//ze//oyHKq8a1L8w
 0xBw==
X-Gm-Message-State: AOAM530L4/quG4kmHsp7lasgAQNbrO8V4pcXQU07wbKuWeNA/j7ySNLj
 YhnK7j2cayGldnV0Is+4zHUdkhPLsws6WqDFg8k=
X-Google-Smtp-Source: ABdhPJzfvnJd83idri3vFQ6Tjs+H8EGFErJQg39O8UJZkp2i/xMks3zwAmzoVR0cjlGEXvT7Kkf+9qF8a8133eWm7eY=
X-Received: by 2002:a19:6a11:: with SMTP id u17mr1107677lfu.184.1609907220071; 
 Tue, 05 Jan 2021 20:27:00 -0800 (PST)
MIME-Version: 1.0
References: <1607591258-13865-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1607591258-13865-1-git-send-email-yejune.deng@gmail.com>
Date: Tue, 5 Jan 2021 22:26:47 -0600
Message-ID: <CAH2r5mvgjFWwEcqt8nfiU_1GJQUU7jN=eNT-t6SBEK8jke0Msg@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix msleep() is imprecise
To: Yejune Deng <yejune.deng@gmail.com>
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

This patch seems reasonable at first glance, but I was a little
concerned that we don't see many users yet of fsleep.  Has there been
pushback on converting "yield" situations from using msleep to fsleep?

On Thu, Dec 10, 2020 at 3:09 AM Yejune Deng <yejune.deng@gmail.com> wrote:
>
> See Documentation/timers/timers-howto.rst, msleep() is not
> for (1ms - 20ms), There is a more advanced API is used.
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
> ---
>  fs/cifs/cifsfs.c    |  4 ++--
>  fs/cifs/connect.c   | 14 +++++++-------
>  fs/cifs/file.c      |  6 +++---
>  fs/cifs/smbdirect.c |  2 +-
>  4 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index 472cb77..d35ce52 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -664,10 +664,10 @@ static void cifs_umount_begin(struct super_block *sb)
>                 cifs_dbg(FYI, "wake up tasks now - umount begin not complete\n");
>                 wake_up_all(&tcon->ses->server->request_q);
>                 wake_up_all(&tcon->ses->server->response_q);
> -               msleep(1); /* yield */
> +               fsleep(1000); /* yield */
>                 /* we have to kick the requests once more */
>                 wake_up_all(&tcon->ses->server->response_q);
> -               msleep(1);
> +               fsleep(1000);
>         }
>
>         return;
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 44f9cce..62a9c64 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -538,7 +538,7 @@ static inline int reconn_setup_dfs_targets(struct cifs_sb_info *cifs_sb,
>                 if (rc) {
>                         cifs_dbg(FYI, "reconnect error %d\n", rc);
>                         mutex_unlock(&server->srv_mutex);
> -                       msleep(3000);
> +                       ssleep(3);
>                 } else {
>                         atomic_inc(&tcpSesReconnectCount);
>                         set_credits(server, 1);
> @@ -621,7 +621,7 @@ static inline int reconn_setup_dfs_targets(struct cifs_sb_info *cifs_sb,
>                 server->bigbuf = (char *)cifs_buf_get();
>                 if (!server->bigbuf) {
>                         cifs_server_dbg(VFS, "No memory for large SMB response\n");
> -                       msleep(3000);
> +                       ssleep(3);
>                         /* retry will check if exiting */
>                         return false;
>                 }
> @@ -634,7 +634,7 @@ static inline int reconn_setup_dfs_targets(struct cifs_sb_info *cifs_sb,
>                 server->smallbuf = (char *)cifs_small_buf_get();
>                 if (!server->smallbuf) {
>                         cifs_server_dbg(VFS, "No memory for SMB response\n");
> -                       msleep(1000);
> +                       ssleep(1);
>                         /* retry will check if exiting */
>                         return false;
>                 }
> @@ -729,7 +729,7 @@ static inline int reconn_setup_dfs_targets(struct cifs_sb_info *cifs_sb,
>                          * to clear and app threads to set tcpStatus
>                          * CifsNeedReconnect if server hung.
>                          */
> -                       usleep_range(1000, 2000);
> +                       fsleep(1000);
>                         length = 0;
>                         continue;
>                 }
> @@ -790,7 +790,7 @@ static inline int reconn_setup_dfs_targets(struct cifs_sb_info *cifs_sb,
>                  */
>                 cifs_dbg(FYI, "RFC 1002 negative session response\n");
>                 /* give server a second to clean up */
> -               msleep(1000);
> +               ssleep(1);
>                 /*
>                  * Always try 445 first on reconnect since we get NACK
>                  * on some if we ever connected to port 139 (the NACK
> @@ -944,7 +944,7 @@ static void clean_demultiplex_info(struct TCP_Server_Info *server)
>                  * response and going ahead and killing cifsd.
>                  */
>                 cifs_dbg(FYI, "Wait for exit from demultiplex thread\n");
> -               msleep(46000);
> +               ssleep(46);
>                 /*
>                  * If threads still have not exited they are probably never
>                  * coming home not much else we can do but free the memory.
> @@ -3655,7 +3655,7 @@ static void rfc1002mangle(char *target, char *source, unsigned int length)
>                  * significant slowing down on mount
>                  * for everyone else
>                  */
> -               usleep_range(1000, 2000);
> +               fsleep(1000);
>         }
>         /*
>          * else the negprot may still work without this
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index be46fab..75538a8 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -283,7 +283,7 @@ int cifs_posix_open(char *full_path, struct inode **pinode,
>  cifs_down_write(struct rw_semaphore *sem)
>  {
>         while (!down_write_trylock(sem))
> -               msleep(10);
> +               fsleep(10000);
>  }
>
>  static void cifsFileInfo_put_work(struct work_struct *work);
> @@ -2828,7 +2828,7 @@ size_t get_numpages(const size_t wsize, const size_t len, size_t *cur_len)
>
>                         if (wsize < wdata->bytes) {
>                                 add_credits_and_wake_if(server, &credits, 0);
> -                               msleep(1000);
> +                               ssleep(1);
>                         }
>                 } while (wsize < wdata->bytes);
>                 wdata->credits = credits;
> @@ -3563,7 +3563,7 @@ static int cifs_resend_rdata(struct cifs_readdata *rdata,
>
>                         if (rsize < rdata->bytes) {
>                                 add_credits_and_wake_if(server, &credits, 0);
> -                               msleep(1000);
> +                               ssleep(1);
>                         }
>                 } while (rsize < rdata->bytes);
>                 rdata->credits = credits;
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index b029ed3..84f97f8 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -1372,7 +1372,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
>         wake_up_interruptible_all(&info->wait_mr);
>         while (atomic_read(&info->mr_used_count)) {
>                 mutex_unlock(&server->srv_mutex);
> -               msleep(1000);
> +               ssleep(1);
>                 mutex_lock(&server->srv_mutex);
>         }
>         destroy_mr_list(info);
> --
> 1.9.1
>


-- 
Thanks,

Steve

