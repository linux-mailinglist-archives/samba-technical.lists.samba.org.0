Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E793978E9E
	for <lists+samba-technical@lfdr.de>; Sat, 14 Sep 2024 09:02:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6l7g0LdQah9o3EhzHA23MPWVKxJxaJ6FUilB71sXpwc=; b=GPVCbHg0LNq6zVeSda5M5Pr5yZ
	hAkPYMZ8cXI/rkxA2WytZdACUilMogfuyf9UFlVVg3HoOVZa/PCcNjGlsy7MqfLnEQYVXPYlXnMxM
	uLlMYJzy4v3citj5xFE2JSbNLsi423vhym1qRmcFiZ8dZvN3FwBIMHYXgvviPqf4agyC8FbOm4XZs
	HzBYXqDPCck12aifsJjOl8Apbbu0gsNzMwXr4aY6HaK3xk/fllCbZPz2jge/pM9oKM388/n2boUGv
	vBb55EgFz9+atURyDS6oJ/zJSndPqRtmh5sZoH8vJbSFWP2tXN4vliC1kz0FJe4J4haSorjBMr/v+
	hJWKZXKQ==;
Received: from ip6-localhost ([::1]:28636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1spMnK-000208-LM; Sat, 14 Sep 2024 07:02:10 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:49370) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1spMn8-0001zw-DW
 for samba-technical@lists.samba.org; Sat, 14 Sep 2024 07:02:01 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c42bd0386cso449510a12.2
 for <samba-technical@lists.samba.org>; Sat, 14 Sep 2024 00:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726297317; x=1726902117; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l7g0LdQah9o3EhzHA23MPWVKxJxaJ6FUilB71sXpwc=;
 b=b1F42XOK1TXxc62T14Hay2Jz72UcMfgXj+EBUDxActoBpbE+z8bllwNISpdiKy7xpz
 pv7FjC5k/5pq6AI8xcArbwAMVzrFVZkZB6vCo78Yzd8Vkp4AKt13qXCvUr1Rm/1PS4lG
 MBfJRdpmvAIV+2LYH9edIpMD5MvUwk16wuP3ctzh/ySUvKXeeA22IwvVV0GC0KmGDHyE
 qiNWzHcyZiJybKZ6dF+suQ58wgFAXEm1+VlsVtfYEsC66xdKp02OJbBQYThqsvBJK0s3
 Tlr7vJEtLdm106W22zgqzMK1WiICkkjR0HDRt9NamAYpFA/xkP/jCZKGrRe780ik6uEp
 y77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726297317; x=1726902117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l7g0LdQah9o3EhzHA23MPWVKxJxaJ6FUilB71sXpwc=;
 b=rgtqnfpUljxw1KjZd/bnbI8GXKIuAYyBq/L/BoA37AbUFKY2rVyvjU5sXVy+gjTXPO
 3vbwuBwrmgKaWA1UE4THNLpq4fLwvEvueuVPIOsMBU2XLpeK2IcAjMwcsN5jupF11+G8
 RYMIjUs+nZEURQpDNYjMrW45rHjWMOw3pEqSUhe7QS73d52/KZh4AlRMswN05g15JVTk
 osaAHKtEMpl/snOgmrvIuGBxtLgDkPrTYDvE0dSQ4tJyKQoOgroVViXIxjh+g8w3SL6a
 Gg9ZJAw306H6Pm7S9PQpS11xZXDoMQFC/rdkVpbxVybIZgwUdKLu32OmIdQ3+OongA9A
 G9qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1OliB73DVxWsJUQhtN0v08GaNeYGD0I8ESZn9lWO7uTuHooiq1iHXb1ziHKM+arcZeR/zJC0mOfQ1bBx7fHk=@lists.samba.org
X-Gm-Message-State: AOJu0Yw4PevqjbCcGry32W8zAN5IJq9UZA+aP7VIgX0IhsVAdlApo6da
 tIF1tHXgO67SfJ9DEHM/j6WMA1AMd5PENXplrC00d0nQy1yqrDR9axzgX8zUaupRbvGvsYUJXid
 O67h4EU9g8we4dxAxHWv06sfYkM4=
X-Google-Smtp-Source: AGHT+IEE2saBGygWxDJ3U4apTV+do/bn/X9SwwTbX/oYmeNrknyvfLHSqrYm9iRxqVd9NnVm1UQZGIyATM9OYsfmC5Q=
X-Received: by 2002:aa7:c483:0:b0:5c2:4bd1:30c3 with SMTP id
 4fb4d7f45d1cf-5c413e4d024mr6471304a12.27.1726297317207; Sat, 14 Sep 2024
 00:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240821065637.2294496-1-lihongbo22@huawei.com>
In-Reply-To: <20240821065637.2294496-1-lihongbo22@huawei.com>
Date: Sat, 14 Sep 2024 02:01:45 -0500
Message-ID: <CAH2r5mur8ahks54Mn6bHYQL9JkfphkioVF9AZwM7aUKgU6zu2A@mail.gmail.com>
Subject: Re: [PATCH -next] smb: use LIST_HEAD() to simplify code
To: Hongbo Li <lihongbo22@huawei.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending review/testing

On Wed, Aug 21, 2024 at 1:49=E2=80=AFAM Hongbo Li <lihongbo22@huawei.com> w=
rote:
>
> list_head can be initialized automatically with LIST_HEAD()
> instead of calling INIT_LIST_HEAD(). No functional impact.
>
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  fs/smb/client/connect.c  | 3 +--
>  fs/smb/client/file.c     | 7 ++-----
>  fs/smb/client/misc.c     | 9 +++------
>  fs/smb/client/smb2file.c | 4 +---
>  4 files changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index d2307162a2de..72092b53e889 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -997,11 +997,10 @@ clean_demultiplex_info(struct TCP_Server_Info *serv=
er)
>         }
>
>         if (!list_empty(&server->pending_mid_q)) {
> -               struct list_head dispose_list;
>                 struct mid_q_entry *mid_entry;
>                 struct list_head *tmp, *tmp2;
> +               LIST_HEAD(dispose_list);
>
> -               INIT_LIST_HEAD(&dispose_list);
>                 spin_lock(&server->mid_lock);
>                 list_for_each_safe(tmp, tmp2, &server->pending_mid_q) {
>                         mid_entry =3D list_entry(tmp, struct mid_q_entry,=
 qhead);
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 1fc66bcf49eb..a5e6c7b63230 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -1406,7 +1406,7 @@ void
>  cifs_reopen_persistent_handles(struct cifs_tcon *tcon)
>  {
>         struct cifsFileInfo *open_file, *tmp;
> -       struct list_head tmp_list;
> +       LIST_HEAD(tmp_list);
>
>         if (!tcon->use_persistent || !tcon->need_reopen_files)
>                 return;
> @@ -1414,7 +1414,6 @@ cifs_reopen_persistent_handles(struct cifs_tcon *tc=
on)
>         tcon->need_reopen_files =3D false;
>
>         cifs_dbg(FYI, "Reopen persistent handles\n");
> -       INIT_LIST_HEAD(&tmp_list);
>
>         /* list all files open on tree connection, reopen resilient handl=
es  */
>         spin_lock(&tcon->open_file_lock);
> @@ -2097,9 +2096,7 @@ cifs_unlock_range(struct cifsFileInfo *cfile, struc=
t file_lock *flock,
>         struct cifsInodeInfo *cinode =3D CIFS_I(d_inode(cfile->dentry));
>         struct cifsLockInfo *li, *tmp;
>         __u64 length =3D cifs_flock_len(flock);
> -       struct list_head tmp_llist;
> -
> -       INIT_LIST_HEAD(&tmp_llist);
> +       LIST_HEAD(tmp_llist);
>
>         /*
>          * Accessing maxBuf is racy with cifs_reconnect - need to store v=
alue
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index c6f11e6f9eb9..dab526191b07 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -751,12 +751,11 @@ cifs_close_deferred_file(struct cifsInodeInfo *cifs=
_inode)
>  {
>         struct cifsFileInfo *cfile =3D NULL;
>         struct file_list *tmp_list, *tmp_next_list;
> -       struct list_head file_head;
> +       LIST_HEAD(file_head);
>
>         if (cifs_inode =3D=3D NULL)
>                 return;
>
> -       INIT_LIST_HEAD(&file_head);
>         spin_lock(&cifs_inode->open_file_lock);
>         list_for_each_entry(cfile, &cifs_inode->openFileList, flist) {
>                 if (delayed_work_pending(&cfile->deferred)) {
> @@ -787,9 +786,8 @@ cifs_close_all_deferred_files(struct cifs_tcon *tcon)
>  {
>         struct cifsFileInfo *cfile;
>         struct file_list *tmp_list, *tmp_next_list;
> -       struct list_head file_head;
> +       LIST_HEAD(file_head);
>
> -       INIT_LIST_HEAD(&file_head);
>         spin_lock(&tcon->open_file_lock);
>         list_for_each_entry(cfile, &tcon->openFileList, tlist) {
>                 if (delayed_work_pending(&cfile->deferred)) {
> @@ -819,11 +817,10 @@ cifs_close_deferred_file_under_dentry(struct cifs_t=
con *tcon, const char *path)
>  {
>         struct cifsFileInfo *cfile;
>         struct file_list *tmp_list, *tmp_next_list;
> -       struct list_head file_head;
>         void *page;
>         const char *full_path;
> +       LIST_HEAD(file_head);
>
> -       INIT_LIST_HEAD(&file_head);
>         page =3D alloc_dentry_path();
>         spin_lock(&tcon->open_file_lock);
>         list_for_each_entry(cfile, &tcon->openFileList, tlist) {
> diff --git a/fs/smb/client/smb2file.c b/fs/smb/client/smb2file.c
> index c23478ab1cf8..bc2b838eab6f 100644
> --- a/fs/smb/client/smb2file.c
> +++ b/fs/smb/client/smb2file.c
> @@ -196,9 +196,7 @@ smb2_unlock_range(struct cifsFileInfo *cfile, struct =
file_lock *flock,
>         struct cifsInodeInfo *cinode =3D CIFS_I(d_inode(cfile->dentry));
>         struct cifsLockInfo *li, *tmp;
>         __u64 length =3D 1 + flock->fl_end - flock->fl_start;
> -       struct list_head tmp_llist;
> -
> -       INIT_LIST_HEAD(&tmp_llist);
> +       LIST_HEAD(tmp_llist);
>
>         /*
>          * Accessing maxBuf is racy with cifs_reconnect - need to store v=
alue
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

