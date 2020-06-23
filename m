Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E698E2047B4
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 04:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pLo7gchx9uy0+a5P9DquuZjdVgSTVwIN3Dzn9qGMlxY=; b=QBPL3TRrZOYqMCMyULUbQMdSmR
	o3vZzcu/cpBsfcKbyP2u7qexpj/fpimpcqxWL/NhwvZw8j+yWyvm+yNKVgGzGrftg0EuZRz426hhn
	uKZMCktPSAtK+tGSXBfjvVSvjmzz95tSyE3WYtoqejL0qthyTEkwS3lTtsPvsmkrrGpGFygjZQw4U
	7+LgoKs3rqNQZAkKkXb0oYcBmx9eJSYXuyGqcNNCsQQPGkUo7ZOo9UW38Oj6ifucHdbnLQFZKRfp8
	G50+wQjvgpeVW87LGolh7UUlnUYoKT9Bp/ubG0IqgazlCya8FJP2VQysAwojZQIkTFkEZkNWIAhGp
	7ziMCiqQ==;
Received: from localhost ([::1]:35764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnZ5U-001vUc-7B; Tue, 23 Jun 2020 02:55:04 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:46036) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnZ5N-001vUS-1i
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 02:55:00 +0000
Received: by mail-io1-xd42.google.com with SMTP id y5so21870911iob.12
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLo7gchx9uy0+a5P9DquuZjdVgSTVwIN3Dzn9qGMlxY=;
 b=ly1X2cTvaDTEUUJmJhGudIkTr5p+dZrFdkzsAHMj/jrazF5j8xSvzBPeY3MyXJagJK
 A61UlgYvRlKWAeekzW2fOLRQ0HOHQaHp12VbFtBj9ARZ6OeScF8nTISDc97KoXOtn96N
 7QyXSUp+5Tc3hwE0eJOeOgXNiu3BS5xyW1FNQwuJ7PIgNXEL5VE2LQsP6fPlQ7lTQdYd
 cc1oDAeeGo5ALeJtx89QZwjy5r6a6DYoqRQ2ZZT5U/erUqEBxDZNteF2sLmpQpkpqMIL
 cm7yF3ksLSj0mD8cTiIMj2NbcJ/jVA5QK4f477dlSH1UypOy/mY+KpG4HttFLoqo7vS3
 RsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLo7gchx9uy0+a5P9DquuZjdVgSTVwIN3Dzn9qGMlxY=;
 b=Cc20Nh7VVIMeC3SvOSQXNwL6W5xVL2Z0ivvvGdsoUsDX0z65x6ZzwgKrimzY8oW/x4
 7B91r6p2OnrU21VxapkuLHeGjMRa/xfzYl5khq6ED5gaLJUGqiA+n7GAEeyc7+38Gniw
 EEDjWEODBQXvYqwF+j3LVSgbdPcFzez67Pf+LxTBYySvlUNgFPsgqrbm45k2lk0l+Y4m
 /ZKJv/kwSG5esyuiE4Y6UT3j2h3gGa/NFUnZl5f3uThM3NL1SEyhfonGZJ1CYO5+VjvY
 y8HZqSkHy/l/+2Sbbl+MKc7dMraFzDV/EhSPdbjHSv2ktZdXQifuE/Y1cmlWedUAx6K1
 RC+A==
X-Gm-Message-State: AOAM5304xy8fahMNsP+f9VWbwRv7402nQJsZFJffN8+HsYDskld68OlN
 /+5caYpMP/+1TRHfYMtN/ZMODSj1+JaVGNqrMwI=
X-Google-Smtp-Source: ABdhPJxd6ZcyM7v27UFp2+/GMCtkK7xhxplQPVhmHDeBI0G7pb9s5wbMPnmhmQyXOOEsi+s/Ubcx6O6fntScwDwNgK0=
X-Received: by 2002:a5d:9052:: with SMTP id v18mr22811700ioq.116.1592880895107; 
 Mon, 22 Jun 2020 19:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093019.1535800-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20200622093019.1535800-1-zhangxiaoxu5@huawei.com>
Date: Tue, 23 Jun 2020 12:54:43 +1000
Message-ID: <CAN05THSHJWZbHbR2PYLTmN8-LGVQf3ONrKK2UDZX9U_o0DNLzg@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix double add page to memcg when cifs_readpages
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Acked-by: Ronnie Sahlberg <lsahlber@redhat.com>

Nice find!
So the small change in semantics in 3fea5a499d57 was that intended or
could this also affect other filesystems that would need a similar fix
as cifs ?

On Mon, Jun 22, 2020 at 7:29 PM Zhang Xiaoxu <zhangxiaoxu5@huawei.com> wrote:
>
> When xfstests generic/451, there is an BUG at mm/memcontrol.c:
>   page:ffffea000560f2c0 refcount:2 mapcount:0 mapping:000000008544e0ea
>        index:0xf
>   mapping->aops:cifs_addr_ops dentry name:"tst-aio-dio-cycle-write.451"
>   flags: 0x2fffff80000001(locked)
>   raw: 002fffff80000001 ffffc90002023c50 ffffea0005280088 ffff88815cda0210
>   raw: 000000000000000f 0000000000000000 00000002ffffffff ffff88817287d000
>   page dumped because: VM_BUG_ON_PAGE(page->mem_cgroup)
>   page->mem_cgroup:ffff88817287d000
>   ------------[ cut here ]------------
>   kernel BUG at mm/memcontrol.c:2659!
>   invalid opcode: 0000 [#1] SMP
>   CPU: 2 PID: 2038 Comm: xfs_io Not tainted 5.8.0-rc1 #44
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190727_
>     073836-buildvm-ppc64le-16.ppc.4
>   RIP: 0010:commit_charge+0x35/0x50
>   Code: 0d 48 83 05 54 b2 02 05 01 48 89 77 38 c3 48 c7
>         c6 78 4a ea ba 48 83 05 38 b2 02 05 01 e8 63 0d9
>   RSP: 0018:ffffc90002023a50 EFLAGS: 00010202
>   RAX: 0000000000000000 RBX: ffff88817287d000 RCX: 0000000000000000
>   RDX: 0000000000000000 RSI: ffff88817ac97ea0 RDI: ffff88817ac97ea0
>   RBP: ffffea000560f2c0 R08: 0000000000000203 R09: 0000000000000005
>   R10: 0000000000000030 R11: ffffc900020237a8 R12: 0000000000000000
>   R13: 0000000000000001 R14: 0000000000000001 R15: ffff88815a1272c0
>   FS:  00007f5071ab0800(0000) GS:ffff88817ac80000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 000055efcd5ca000 CR3: 000000015d312000 CR4: 00000000000006e0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   Call Trace:
>    mem_cgroup_charge+0x166/0x4f0
>    __add_to_page_cache_locked+0x4a9/0x710
>    add_to_page_cache_locked+0x15/0x20
>    cifs_readpages+0x217/0x1270
>    read_pages+0x29a/0x670
>    page_cache_readahead_unbounded+0x24f/0x390
>    __do_page_cache_readahead+0x3f/0x60
>    ondemand_readahead+0x1f1/0x470
>    page_cache_async_readahead+0x14c/0x170
>    generic_file_buffered_read+0x5df/0x1100
>    generic_file_read_iter+0x10c/0x1d0
>    cifs_strict_readv+0x139/0x170
>    new_sync_read+0x164/0x250
>    __vfs_read+0x39/0x60
>    vfs_read+0xb5/0x1e0
>    ksys_pread64+0x85/0xf0
>    __x64_sys_pread64+0x22/0x30
>    do_syscall_64+0x69/0x150
>    entry_SYSCALL_64_after_hwframe+0x44/0xa9
>   RIP: 0033:0x7f5071fcb1af
>   Code: Bad RIP value.
>   RSP: 002b:00007ffde2cdb8e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000011
>   RAX: ffffffffffffffda RBX: 00007ffde2cdb990 RCX: 00007f5071fcb1af
>   RDX: 0000000000001000 RSI: 000055efcd5ca000 RDI: 0000000000000003
>   RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
>   R10: 0000000000001000 R11: 0000000000000293 R12: 0000000000000001
>   R13: 000000000009f000 R14: 0000000000000000 R15: 0000000000001000
>   Modules linked in:
>   ---[ end trace 725fa14a3e1af65c ]---
>
> Since commit 3fea5a499d57 ("mm: memcontrol: convert page cache to a new
> mem_cgroup_charge() API") not cancel the page charge, the pages maybe
> double add to pagecache:
> thread1                       | thread2
> cifs_readpages
> readpages_get_pages
>  add_to_page_cache_locked(head,index=n)=0
>                               | readpages_get_pages
>                               | add_to_page_cache_locked(head,index=n+1)=0
>  add_to_page_cache_locked(head, index=n+1)=-EEXIST
>  then, will next loop with list head page's
>  index=n+1 and the page->mapping not NULL
> readpages_get_pages
> add_to_page_cache_locked(head, index=n+1)
>  commit_charge
>   VM_BUG_ON_PAGE
>
> So, we should not do the next loop when any page add to page cache
> failed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> ---
>  fs/cifs/file.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 4fe757cfc360..9b0f8f33f832 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -4336,7 +4336,8 @@ readpages_get_pages(struct address_space *mapping, struct list_head *page_list,
>                         break;
>
>                 __SetPageLocked(page);
> -               if (add_to_page_cache_locked(page, mapping, page->index, gfp)) {
> +               rc = add_to_page_cache_locked(page, mapping, page->index, gfp);
> +               if (rc) {
>                         __ClearPageLocked(page);
>                         break;
>                 }
> @@ -4352,6 +4353,7 @@ static int cifs_readpages(struct file *file, struct address_space *mapping,
>         struct list_head *page_list, unsigned num_pages)
>  {
>         int rc;
> +       int err = 0;
>         struct list_head tmplist;
>         struct cifsFileInfo *open_file = file->private_data;
>         struct cifs_sb_info *cifs_sb = CIFS_FILE_SB(file);
> @@ -4396,7 +4398,7 @@ static int cifs_readpages(struct file *file, struct address_space *mapping,
>          * the order of declining indexes. When we put the pages in
>          * the rdata->pages, then we want them in increasing order.
>          */
> -       while (!list_empty(page_list)) {
> +       while (!list_empty(page_list) && !err) {
>                 unsigned int i, nr_pages, bytes, rsize;
>                 loff_t offset;
>                 struct page *page, *tpage;
> @@ -4429,9 +4431,10 @@ static int cifs_readpages(struct file *file, struct address_space *mapping,
>                         return 0;
>                 }
>
> -               rc = readpages_get_pages(mapping, page_list, rsize, &tmplist,
> +               nr_pages = 0;
> +               err = readpages_get_pages(mapping, page_list, rsize, &tmplist,
>                                          &nr_pages, &offset, &bytes);
> -               if (rc) {
> +               if (!nr_pages) {
>                         add_credits_and_wake_if(server, credits, 0);
>                         break;
>                 }
> --
> 2.25.4
>

