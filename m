Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1445E6109B3
	for <lists+samba-technical@lfdr.de>; Fri, 28 Oct 2022 07:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CN6XjvDtu46q0u2KRm5mMXry24we3sE+OyWEdY5evzU=; b=wlXF+MHbsNpa0YqJhVxYEbupIC
	uxt/vP3138NaejV4AqTK9i/4wNzmyreZE7kQ10/osG9KNYhVncMeqEenDlb15ludnZakji+LC250b
	uZhV+KQJXuZzUfNmqZxM+QmUs8A7RLX0QIMlvVbtSLpFveJVMcSGbulgg6zD4vKWbwfFD4573k+dO
	AzUQQfbL0WrzJcKQiISCKjM1KGeG+V8RlFhwa/CJF2wc/33RLC0W/UuCgGIFkLoyDgPUd6j4LjiRN
	vNTTu4zj+ckgaEkIQ/JdVaodLvExF9o0AJm04D5o7WEfrP8E0XbA3IXLqNCaALlyCoMvfzzgFuawA
	6HF7V3fw==;
Received: from ip6-localhost ([::1]:51736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ooHnP-006ctC-Oq; Fri, 28 Oct 2022 05:20:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:41477) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ooHnL-006ct3-9D
 for samba-technical@lists.samba.org; Fri, 28 Oct 2022 05:20:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id f37so6483332lfv.8
 for <samba-technical@lists.samba.org>; Thu, 27 Oct 2022 22:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CN6XjvDtu46q0u2KRm5mMXry24we3sE+OyWEdY5evzU=;
 b=pyjbPtyLw+hu0QM/S/SIX/Ny0NwoIrbrnLAvgmhZ9Sc7dM6f6/I6mW96gkAIOk07pF
 DOycU/wjze4oJHt/wkl8+iED6D0vpr+xLsxW1LBhWefofMwgDEHaVz3JWyd8xLpN28Yi
 IQtM7XrA2QCgj/tbJFU7kqMrP4udtagDWum2y9VUxbEnTYZEA+jCa674prtjx9nIC0Zl
 +QgYe6B3npdujZn7nrXR9QvVcrXvwIF/iAzcVS9OuioU5AsvS1tdf+mghfURfdDK67mr
 io+YtCs4j8lQqUdplKjkWGKt5vyhoEfyaIJm5iwzO45NoGHzFOWDFyC18M40rwrXoZ1W
 YCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CN6XjvDtu46q0u2KRm5mMXry24we3sE+OyWEdY5evzU=;
 b=RnzShWofqSyRs2uLR9FTj+caoff4eD/lvAxInHsEEhLat6SLrXEhG7N3714QESj1h/
 3+XTp4PKRvzBzgfiqM/ZYwPArtBaNdfChenUadzv4p7dSZhuQZJunlgiByQ455lchYQ6
 XyL8EvuWIwpkrpDSbZ6aC9nd63HCixZGDfb3TCZHoxyA6PIFhLpzDWMpORnA5hLj7MWr
 M3T4sc7zD1ZnXpBZb/9OoKJc/1fynBC/rM8qFiDGX+9OKRjSVzF7rMHn5sF8QM6+c7wE
 YgZBvTAieZGtRjq5vty58t63Ro5JVNBSrPhbLMudUs8kNk5Qicx6u5bUOH5w/qof5UfZ
 CeOQ==
X-Gm-Message-State: ACrzQf0zkhBxUue6PLyZybQ3PYY4vV/qm0TCHNO/socfijQwOocKUr/k
 gMyVrDRoTEXhZHV8iTNwpq44pU1w3m141cRspE8=
X-Google-Smtp-Source: AMsMyM6QW7+6YgKsOE7rghTy3mNlmrpkNv+xLE4oZvFKfk7Cf8VrSXH3mueaGQBwfTwLvSWB/O/Uv3lVLK+kN7Qxl1w=
X-Received: by 2002:a05:6512:104c:b0:4a2:6cee:ae17 with SMTP id
 c12-20020a056512104c00b004a26ceeae17mr18449491lfb.417.1666934437436; Thu, 27
 Oct 2022 22:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221027124528.2487025-1-zengheng4@huawei.com>
In-Reply-To: <20221027124528.2487025-1-zengheng4@huawei.com>
Date: Fri, 28 Oct 2022 00:20:25 -0500
Message-ID: <CAH2r5mu2-jfhFBTJDf8Td7yF5e4QEJbG85wVpxyePK1q8bMjAg@mail.gmail.com>
Subject: Re: [PATCH v4] cifs: fix use-after-free caused by invalid pointer
 `hostname`
To: Zeng Heng <zengheng4@huawei.com>
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
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, sfrench@samba.org, liwei391@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6 for-next

thx

On Thu, Oct 27, 2022 at 7:49 AM Zeng Heng <zengheng4@huawei.com> wrote:
>
> `hostname` needs to be set as null-pointer after free in
> `cifs_put_tcp_session` function, or when `cifsd` thread attempts
> to resolve hostname and reconnect the host, the thread would deref
> the invalid pointer.
>
> Here is one of practical backtrace examples as reference:
>
> Task 477
> ---------------------------
>  do_mount
>   path_mount
>    do_new_mount
>     vfs_get_tree
>      smb3_get_tree
>       smb3_get_tree_common
>        cifs_smb3_do_mount
>         cifs_mount
>          mount_put_conns
>           cifs_put_tcp_session
>           --> kfree(server->hostname)
>
> cifsd
> ---------------------------
>  kthread
>   cifs_demultiplex_thread
>    cifs_reconnect
>     reconn_set_ipaddr_from_hostname
>     --> if (!server->hostname)
>     --> if (server->hostname[0] == '\0')  // !! UAF fault here
>
> CIFS: VFS: cifs_mount failed w/return code = -112
> mount error(112): Host is down
> BUG: KASAN: use-after-free in reconn_set_ipaddr_from_hostname+0x2ba/0x310
> Read of size 1 at addr ffff888108f35380 by task cifsd/480
> CPU: 2 PID: 480 Comm: cifsd Not tainted 6.1.0-rc2-00106-gf705792f89dd-dirty #25
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x68/0x85
>  print_report+0x16c/0x4a3
>  kasan_report+0x95/0x190
>  reconn_set_ipaddr_from_hostname+0x2ba/0x310
>  __cifs_reconnect.part.0+0x241/0x800
>  cifs_reconnect+0x65f/0xb60
>  cifs_demultiplex_thread+0x1570/0x2570
>  kthread+0x2c5/0x380
>  ret_from_fork+0x22/0x30
>  </TASK>
> Allocated by task 477:
>  kasan_save_stack+0x1e/0x40
>  kasan_set_track+0x21/0x30
>  __kasan_kmalloc+0x7e/0x90
>  __kmalloc_node_track_caller+0x52/0x1b0
>  kstrdup+0x3b/0x70
>  cifs_get_tcp_session+0xbc/0x19b0
>  mount_get_conns+0xa9/0x10c0
>  cifs_mount+0xdf/0x1970
>  cifs_smb3_do_mount+0x295/0x1660
>  smb3_get_tree+0x352/0x5e0
>  vfs_get_tree+0x8e/0x2e0
>  path_mount+0xf8c/0x1990
>  do_mount+0xee/0x110
>  __x64_sys_mount+0x14b/0x1f0
>  do_syscall_64+0x3b/0x90
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> Freed by task 477:
>  kasan_save_stack+0x1e/0x40
>  kasan_set_track+0x21/0x30
>  kasan_save_free_info+0x2a/0x50
>  __kasan_slab_free+0x10a/0x190
>  __kmem_cache_free+0xca/0x3f0
>  cifs_put_tcp_session+0x30c/0x450
>  cifs_mount+0xf95/0x1970
>  cifs_smb3_do_mount+0x295/0x1660
>  smb3_get_tree+0x352/0x5e0
>  vfs_get_tree+0x8e/0x2e0
>  path_mount+0xf8c/0x1990
>  do_mount+0xee/0x110
>  __x64_sys_mount+0x14b/0x1f0
>  do_syscall_64+0x3b/0x90
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> The buggy address belongs to the object at ffff888108f35380
>  which belongs to the cache kmalloc-16 of size 16
> The buggy address is located 0 bytes inside of
>  16-byte region [ffff888108f35380, ffff888108f35390)
> The buggy address belongs to the physical page:
> page:00000000333f8e58 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888108f350e0 pfn:0x108f35
> flags: 0x200000000000200(slab|node=0|zone=2)
> raw: 0200000000000200 0000000000000000 dead000000000122 ffff8881000423c0
> raw: ffff888108f350e0 000000008080007a 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> Memory state around the buggy address:
>  ffff888108f35280: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
>  ffff888108f35300: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >ffff888108f35380: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
>                    ^
>  ffff888108f35400: fa fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888108f35480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>
> Fixes: 7be3248f3139 ("cifs: To match file servers, make sure the server hostname matches")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
> ---
> changes in v4:
>  - correct fix tag
>  - add reviewed-by
> ---
>  fs/cifs/connect.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index ffb291579bb9..1cc47dd3b4d6 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -1584,6 +1584,7 @@ cifs_put_tcp_session(struct TCP_Server_Info *server, int from_reconnect)
>         server->session_key.response = NULL;
>         server->session_key.len = 0;
>         kfree(server->hostname);
> +       server->hostname = NULL;
>
>         task = xchg(&server->tsk, NULL);
>         if (task)
> --
> 2.25.1
>


-- 
Thanks,

Steve

