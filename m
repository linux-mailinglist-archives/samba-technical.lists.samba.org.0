Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B8E68CE6C
	for <lists+samba-technical@lfdr.de>; Tue,  7 Feb 2023 05:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wlVffh9zWH/jnQx6JAaeCk2U5f26d/6ml8I+6W9cAIc=; b=Ov2oRxQkF8+JEQ8rh0CZha1YAC
	MVvgxOxNcfDElIH8PBIm00qYlbYCQAybYrUN2ibS0+XKZmdbWEsHVas5ddRsuDKK6KbwSofMnsLuu
	1amp0AozUKGwJ6qoiEd+TrZ6uE6btPZDO9BGhFrf9Q7syODseYjJP1GLJin4qALVeQB/89mQ1UCXi
	PYhUu2h30jFnwyRzVGhkm3cOJFhhv5KzJXdoeL4KqXeowID4SbQXt48XSXRRNO1Gx5kkODojLa/sg
	GNOj+4XlLkf4eFekn/DjuqljojG7AmP/DZs+VlBK51S7ZhM4T1tpjYYk5P/oIWZxNEXfkOGkK0STw
	mT6lpymQ==;
Received: from ip6-localhost ([::1]:18388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pPG48-0098Cs-4D; Tue, 07 Feb 2023 04:58:48 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:43751) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pPG43-0098Cj-VD
 for samba-technical@lists.samba.org; Tue, 07 Feb 2023 04:58:46 +0000
Received: by mail-lf1-x135.google.com with SMTP id f34so20746038lfv.10
 for <samba-technical@lists.samba.org>; Mon, 06 Feb 2023 20:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlVffh9zWH/jnQx6JAaeCk2U5f26d/6ml8I+6W9cAIc=;
 b=fApls+puYUkzYOIxJ52h6u7z1ujy422RrPt7SFItuPwG9IuaELkM6V/4tu407lWMXL
 aS20zAgQer77Isam8vFvIUWSXLDXY5NzBEC9CAIvi24rTvPrF4GZgFAKMssPYBOekWyF
 HqgK1tSSLNRiX6ey468GX1DqKvDue8im0rTfxeklfLK1/7eHfXnQZSxJYSTyND7RSx4h
 2VFchNdEjwe3wVCU61iU7nAvQka2t8G3y7/NKjjWPyQ+YDMeavEUFWv1sOR4mFxVR7xu
 ib8dXu5dDpc34emBtZgm++az5+gbzI9SF5Ud1b012c2vcX2FVFNl/LXmAfYV62ky0Jfg
 lDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlVffh9zWH/jnQx6JAaeCk2U5f26d/6ml8I+6W9cAIc=;
 b=gKUZmw6bwnqwV6QTvZV3bUc6JzZEPD04kiJ+ZRFa8tcLsn2r2HRUSz1EltV4aixeYa
 5qrv7uEVDbaUYk86yInR3dZew5XHIeScl/TduCMNy8Pc3s8VQN1cBUNI+stG57ZqB7eD
 /lOCnfFZlwGgjy4FZkIkGNpY4CP5Sox6tT8/ADwXzOJbE7LLiOvVMXcbcJF0EvXprcjg
 WuvswevXBj2Dk8VAgSiOtuLtzTO0ObCOXUz8EKFjxZnO2h25uy/k7Ehn0g6ZoU3kd6ug
 mPD5WUFHXt8d+LGAk48XkvBtc1TKNwgrZqQpGZ9pRc/C46Td6Eul3B7TyiXVjsdKCutX
 0Nxw==
X-Gm-Message-State: AO0yUKUu3F8XsCUUAsfMQdA/+5WtbF3QOR5bxp+orCtmxw0w/pB6ML1g
 yS66YYRlw2CoKkOHLsZWMnOfUNk4dKGiWSrecWw=
X-Google-Smtp-Source: AK7set9QPTnAr7hyeF6Z+fteoge93bBac/jt7FF6XjKRXdw3FJv2lSM/RCPX/ZVd0PXE16+ZJsO5/hykYRO5WqvdZo0=
X-Received: by 2002:ac2:5ec8:0:b0:4cb:20b3:e7f4 with SMTP id
 d8-20020ac25ec8000000b004cb20b3e7f4mr270251lfq.194.1675745921873; Mon, 06 Feb
 2023 20:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20230206011009.1126177-1-wangzhaolong1@huawei.com>
In-Reply-To: <20230206011009.1126177-1-wangzhaolong1@huawei.com>
Date: Mon, 6 Feb 2023 22:58:30 -0600
Message-ID: <CAH2r5mscPCgnxroD5sSuE8PvHvwLdN+2X=wm9Oy4+XNCsEAh6w@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix use-after-free in rdata->read_into_pages()
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
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
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

added Cc:stable and acked-by Paulo

merged into cifs-2.6.git for-next pending testing

On Sun, Feb 5, 2023 at 7:11 PM ZhaoLong Wang <wangzhaolong1@huawei.com> wrote:
>
> When the network status is unstable, use-after-free may occur when
> read data from the server.
>
>   BUG: KASAN: use-after-free in readpages_fill_pages+0x14c/0x7e0
>
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x38/0x4c
>    print_report+0x16f/0x4a6
>    kasan_report+0xb7/0x130
>    readpages_fill_pages+0x14c/0x7e0
>    cifs_readv_receive+0x46d/0xa40
>    cifs_demultiplex_thread+0x121c/0x1490
>    kthread+0x16b/0x1a0
>    ret_from_fork+0x2c/0x50
>    </TASK>
>
>   Allocated by task 2535:
>    kasan_save_stack+0x22/0x50
>    kasan_set_track+0x25/0x30
>    __kasan_kmalloc+0x82/0x90
>    cifs_readdata_direct_alloc+0x2c/0x110
>    cifs_readdata_alloc+0x2d/0x60
>    cifs_readahead+0x393/0xfe0
>    read_pages+0x12f/0x470
>    page_cache_ra_unbounded+0x1b1/0x240
>    filemap_get_pages+0x1c8/0x9a0
>    filemap_read+0x1c0/0x540
>    cifs_strict_readv+0x21b/0x240
>    vfs_read+0x395/0x4b0
>    ksys_read+0xb8/0x150
>    do_syscall_64+0x3f/0x90
>    entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
>   Freed by task 79:
>    kasan_save_stack+0x22/0x50
>    kasan_set_track+0x25/0x30
>    kasan_save_free_info+0x2e/0x50
>    __kasan_slab_free+0x10e/0x1a0
>    __kmem_cache_free+0x7a/0x1a0
>    cifs_readdata_release+0x49/0x60
>    process_one_work+0x46c/0x760
>    worker_thread+0x2a4/0x6f0
>    kthread+0x16b/0x1a0
>    ret_from_fork+0x2c/0x50
>
>   Last potentially related work creation:
>    kasan_save_stack+0x22/0x50
>    __kasan_record_aux_stack+0x95/0xb0
>    insert_work+0x2b/0x130
>    __queue_work+0x1fe/0x660
>    queue_work_on+0x4b/0x60
>    smb2_readv_callback+0x396/0x800
>    cifs_abort_connection+0x474/0x6a0
>    cifs_reconnect+0x5cb/0xa50
>    cifs_readv_from_socket.cold+0x22/0x6c
>    cifs_read_page_from_socket+0xc1/0x100
>    readpages_fill_pages.cold+0x2f/0x46
>    cifs_readv_receive+0x46d/0xa40
>    cifs_demultiplex_thread+0x121c/0x1490
>    kthread+0x16b/0x1a0
>    ret_from_fork+0x2c/0x50
>
> The following function calls will cause UAF of the rdata pointer.
>
> readpages_fill_pages
>  cifs_read_page_from_socket
>   cifs_readv_from_socket
>    cifs_reconnect
>     __cifs_reconnect
>      cifs_abort_connection
>       mid->callback() --> smb2_readv_callback
>        queue_work(&rdata->work)  # if the worker completes first,
>                                  # the rdata is freed
>           cifs_readv_complete
>             kref_put
>               cifs_readdata_release
>                 kfree(rdata)
>  return rdata->...               # UAF in readpages_fill_pages()
>
> Similarly, this problem also occurs in the uncache_fill_pages().
>
> Fix this by adjusts the order of condition judgment in the return
> statement.
>
> Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
> ---
>  fs/cifs/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 22dfc1f8b4f1..b8d1cbadb689 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -3889,7 +3889,7 @@ uncached_fill_pages(struct TCP_Server_Info *server,
>                 rdata->got_bytes += result;
>         }
>
> -       return rdata->got_bytes > 0 && result != -ECONNABORTED ?
> +       return result != -ECONNABORTED && rdata->got_bytes > 0 ?
>                                                 rdata->got_bytes : result;
>  }
>
> @@ -4665,7 +4665,7 @@ readpages_fill_pages(struct TCP_Server_Info *server,
>                 rdata->got_bytes += result;
>         }
>
> -       return rdata->got_bytes > 0 && result != -ECONNABORTED ?
> +       return result != -ECONNABORTED && rdata->got_bytes > 0 ?
>                                                 rdata->got_bytes : result;
>  }
>
> --
> 2.31.1
>


-- 
Thanks,

Steve

