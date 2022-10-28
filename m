Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D62610ABF
	for <lists+samba-technical@lfdr.de>; Fri, 28 Oct 2022 08:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gs4Nw3TorDT8ueT7qP3f5rmMZ2nJoqgVxN+G5n/Vf5c=; b=SqEyTiGQgpVsxqOvw4sI+T0rwl
	kIhJE5vghfj2g/ke/q0Tfb/UcG61UOAVDmm3AbXMMf4c2rvTqOI30yckg8eLo7tvC0jfJlEH7RwLQ
	TccsxOVpYqFuSYyrwE1rSqjmh+zW0OLQUJtt0DwyrllX2T/p9OG2E/9oNNW0AM6+w6K1YtlaD3rJy
	IXYeRhR0nWtiwRPQVSRbu7nLAE3YEI3zVUKfgppc/0wVQ2ie4a3GaCLpmJ6fWz5QA44xbZJ7GXNWL
	Nd1CE0YYxTEnAkoqH0zG3tuZ+omCemqQe/EmPi5LhrZ5nnZ6gN8O+OWuAPWuUGoQDPWx6Rp60Iy19
	1McOuCIQ==;
Received: from ip6-localhost ([::1]:31540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ooJEW-006eXg-Jx; Fri, 28 Oct 2022 06:52:49 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:35499) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ooJDn-006eXT-3m
 for samba-technical@lists.samba.org; Fri, 28 Oct 2022 06:52:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id r14so6807210lfm.2
 for <samba-technical@lists.samba.org>; Thu, 27 Oct 2022 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Gs4Nw3TorDT8ueT7qP3f5rmMZ2nJoqgVxN+G5n/Vf5c=;
 b=fSUOkyKVCXMtimE8+bPYbGoX8LbXu7eHsP+MX91yLr4uFG3i5d3CxLW8sMP8EIUnsy
 7z5VQ8DCcRXIqxDCzgZBaE2QGLPVeTGCSQT35j4DdJTSuZ7RZZjZssBkjBXzcPELOd8d
 YZHFzkscuDx7TfCwML6L7Q+z45N6blaktzaxuPYTuCRm2evmbwxYgnCAZXku0SDrEesL
 bJfS0r91BEqjrFQu85bY6sztV9jNRfjzMQYeLsCOlX9jYHA6RhD4SeHcjHGjf59Ff82K
 G4UrK1QLyGuFTaxS77wKxJdBZ6eW2y8QroZy1qZXSLzV0x9lKeBLJt9k3duBbYPO/cTX
 8ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gs4Nw3TorDT8ueT7qP3f5rmMZ2nJoqgVxN+G5n/Vf5c=;
 b=k9t7qyIEmgRTcD6zAgzl0CoUVdVLzhQ18UCy9ErYwCmo75xKSM5dorJ+j2Twfimrv5
 aYDVjE7nUsTyvmsgpVsj6+V+PhgvVHUa7ZCXB/2lzPEwSJMgQJC1F0G3j5DfN7NjfDNe
 pGqb4RuOh2I0W/R/IQ9rGXe01reKdrmlArG7Juzf7hUiRcuJv9PcKi4uM2GX6Zf5Cf4H
 VMa1ZEBiZQrxatIxujjCLOvNErLU4e9PLjk2ZPrtgHJrjicyxVuXvbZldyrdrQc/j52H
 IaxPFz9Ojc5UsetFpM3+5JaLCe484yngY6SXuFpJtYST3AT8tYTCZjfZ6DssqDxh5CDI
 NyBw==
X-Gm-Message-State: ACrzQf1XeYdu2RbDhwn9NMRqdh6u/nTPf876tqPoE0nUioxcElMp/sKZ
 PmymcKY3G7ReL0GueaukmAkNcXidfiHm6lBS1q8=
X-Google-Smtp-Source: AMsMyM6uaHZ7WZBI2PJSJdKl7lRWeiM+fC5b8O14doKAGYJHJStfURBic60XzGqiUt0dXrnUQABcFW0vp42fNRM0GGo=
X-Received: by 2002:ac2:5f97:0:b0:4b0:144:a243 with SMTP id
 r23-20020ac25f97000000b004b00144a243mr2143762lfe.394.1666939920919; Thu, 27
 Oct 2022 23:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221027124528.2487025-1-zengheng4@huawei.com>
 <CAH2r5mu2-jfhFBTJDf8Td7yF5e4QEJbG85wVpxyePK1q8bMjAg@mail.gmail.com>
In-Reply-To: <CAH2r5mu2-jfhFBTJDf8Td7yF5e4QEJbG85wVpxyePK1q8bMjAg@mail.gmail.com>
Date: Fri, 28 Oct 2022 12:21:49 +0530
Message-ID: <CANT5p=qBFdFB84xh=6WQtdYhAKhrXaF09Py=bn8eGgoS3jhqtA@mail.gmail.com>
Subject: Re: [PATCH v4] cifs: fix use-after-free caused by invalid pointer
 `hostname`
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, pc@cjr.nz, Zeng Heng <zengheng4@huawei.com>,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, sfrench@samba.org,
 liwei391@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 28, 2022 at 11:29 AM Steve French <smfrench@gmail.com> wrote:
>
> merged into cifs-2.6 for-next
>
> thx
>
> On Thu, Oct 27, 2022 at 7:49 AM Zeng Heng <zengheng4@huawei.com> wrote:
> >
> > `hostname` needs to be set as null-pointer after free in
> > `cifs_put_tcp_session` function, or when `cifsd` thread attempts
> > to resolve hostname and reconnect the host, the thread would deref
> > the invalid pointer.
> >
> > Here is one of practical backtrace examples as reference:
> >
> > Task 477
> > ---------------------------
> >  do_mount
> >   path_mount
> >    do_new_mount
> >     vfs_get_tree
> >      smb3_get_tree
> >       smb3_get_tree_common
> >        cifs_smb3_do_mount
> >         cifs_mount
> >          mount_put_conns
> >           cifs_put_tcp_session
> >           --> kfree(server->hostname)
> >
> > cifsd
> > ---------------------------
> >  kthread
> >   cifs_demultiplex_thread
> >    cifs_reconnect
> >     reconn_set_ipaddr_from_hostname
> >     --> if (!server->hostname)
> >     --> if (server->hostname[0] == '\0')  // !! UAF fault here
> >
> > CIFS: VFS: cifs_mount failed w/return code = -112
> > mount error(112): Host is down
> > BUG: KASAN: use-after-free in reconn_set_ipaddr_from_hostname+0x2ba/0x310
> > Read of size 1 at addr ffff888108f35380 by task cifsd/480
> > CPU: 2 PID: 480 Comm: cifsd Not tainted 6.1.0-rc2-00106-gf705792f89dd-dirty #25
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0x68/0x85
> >  print_report+0x16c/0x4a3
> >  kasan_report+0x95/0x190
> >  reconn_set_ipaddr_from_hostname+0x2ba/0x310
> >  __cifs_reconnect.part.0+0x241/0x800
> >  cifs_reconnect+0x65f/0xb60
> >  cifs_demultiplex_thread+0x1570/0x2570
> >  kthread+0x2c5/0x380
> >  ret_from_fork+0x22/0x30
> >  </TASK>
> > Allocated by task 477:
> >  kasan_save_stack+0x1e/0x40
> >  kasan_set_track+0x21/0x30
> >  __kasan_kmalloc+0x7e/0x90
> >  __kmalloc_node_track_caller+0x52/0x1b0
> >  kstrdup+0x3b/0x70
> >  cifs_get_tcp_session+0xbc/0x19b0
> >  mount_get_conns+0xa9/0x10c0
> >  cifs_mount+0xdf/0x1970
> >  cifs_smb3_do_mount+0x295/0x1660
> >  smb3_get_tree+0x352/0x5e0
> >  vfs_get_tree+0x8e/0x2e0
> >  path_mount+0xf8c/0x1990
> >  do_mount+0xee/0x110
> >  __x64_sys_mount+0x14b/0x1f0
> >  do_syscall_64+0x3b/0x90
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > Freed by task 477:
> >  kasan_save_stack+0x1e/0x40
> >  kasan_set_track+0x21/0x30
> >  kasan_save_free_info+0x2a/0x50
> >  __kasan_slab_free+0x10a/0x190
> >  __kmem_cache_free+0xca/0x3f0
> >  cifs_put_tcp_session+0x30c/0x450
> >  cifs_mount+0xf95/0x1970
> >  cifs_smb3_do_mount+0x295/0x1660
> >  smb3_get_tree+0x352/0x5e0
> >  vfs_get_tree+0x8e/0x2e0
> >  path_mount+0xf8c/0x1990
> >  do_mount+0xee/0x110
> >  __x64_sys_mount+0x14b/0x1f0
> >  do_syscall_64+0x3b/0x90
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > The buggy address belongs to the object at ffff888108f35380
> >  which belongs to the cache kmalloc-16 of size 16
> > The buggy address is located 0 bytes inside of
> >  16-byte region [ffff888108f35380, ffff888108f35390)
> > The buggy address belongs to the physical page:
> > page:00000000333f8e58 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888108f350e0 pfn:0x108f35
> > flags: 0x200000000000200(slab|node=0|zone=2)
> > raw: 0200000000000200 0000000000000000 dead000000000122 ffff8881000423c0
> > raw: ffff888108f350e0 000000008080007a 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> > Memory state around the buggy address:
> >  ffff888108f35280: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >  ffff888108f35300: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> > >ffff888108f35380: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >                    ^
> >  ffff888108f35400: fa fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >  ffff888108f35480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >
> > Fixes: 7be3248f3139 ("cifs: To match file servers, make sure the server hostname matches")
> > Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> > Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
> > ---
> > changes in v4:
> >  - correct fix tag
> >  - add reviewed-by
> > ---
> >  fs/cifs/connect.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> > index ffb291579bb9..1cc47dd3b4d6 100644
> > --- a/fs/cifs/connect.c
> > +++ b/fs/cifs/connect.c
> > @@ -1584,6 +1584,7 @@ cifs_put_tcp_session(struct TCP_Server_Info *server, int from_reconnect)
> >         server->session_key.response = NULL;
> >         server->session_key.len = 0;
> >         kfree(server->hostname);
> > +       server->hostname = NULL;
> >
> >         task = xchg(&server->tsk, NULL);
> >         if (task)
> > --
> > 2.25.1
> >
>
>
> --
> Thanks,
>
> Steve

What I mean is something like this:
https://github.com/sprasad-microsoft/smb3-kernel-client/commit/07abfbeb01d3cb8d55d76c1937bd4cde46063e5d.patch

-- 
Regards,
Shyam

