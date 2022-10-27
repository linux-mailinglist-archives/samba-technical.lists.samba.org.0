Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD360F6BC
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 14:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=BJb1Kk7GF9cOzQWU+/M02gbNTsVeaeweLROo/X/n1M4=; b=N1QzOvqTlse3YkDuUpAP7MqsJl
	nsVBBxKvGhaiHFdW0TavHhv3r7Y54VD2g8UVFWNanY0XK0XyVj8dLxsQvFEsFrthlgwyCUgHAvvb1
	hYsPAqApXjyd2k1xyCtVnu/555qbqREU7QVEXC4fldU0JOVincvPqeQ1xMFLaEp+kjGvO1E+WXDh+
	XOQKIMebIgFRhZ9neU/VkxYn/MFi7YYY+M+1NPCj6owM5mvpYkWwbugGCqVqNn6Sw746VUXWKeXYy
	T7XXEOzzn3o5d45aEDXIiUt78cvNLUpQ0fTMozzckfkGC35DyTJ+KUrHWoyZuleiBMxz8hJ52X5d4
	Yrf8NNnA==;
Received: from ip6-localhost ([::1]:21744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oo1cx-006Q0H-TY; Thu, 27 Oct 2022 12:04:51 +0000
Received: from mx.cjr.nz ([51.158.111.142]:23678) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oo1ct-006Q08-3i
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 12:04:49 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id BF77180789;
 Thu, 27 Oct 2022 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1666872284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BJb1Kk7GF9cOzQWU+/M02gbNTsVeaeweLROo/X/n1M4=;
 b=Yz46Hnt6E5EU6iZqONWTfxHOqzhnh+dZNZ+JIcNtcUgjTkq2JxRQ6OtVUBMrHLUog6YPf6
 r+0CUhcvCehlQNIKqcWEAVgXbeQ993wUxpclGWbun4sZ3Yyzl03pMr7Q5W2bmA+3d3AUm9
 oSxYmfx3ht8d37r5G12bq8Y80Fh83EoF8tEiPMoPGhxuTDqzdhkZSTT/6U/3L1ySqcp3B4
 75UBjGnYbMYw9w/tsMIn0NJkoo4fobpgMmp2KUwCulPTl01XLt7AK61kVnQ0nUWkQVFe/T
 Sk2Pcgyi0JS5T4mL+3j9ygflekLEoijFGmp3gcAW93oQezPSJtgLywUvaz1rqg==
To: Zeng Heng <zengheng4@huawei.com>, sfrench@samba.org, tom@talpey.com,
 sprasad@microsoft.com, lsahlber@redhat.com
Subject: Re: [PATCH v3] cifs: fix use-after-free caused by invalid pointer
 `hostname`
In-Reply-To: <20221027112127.2433605-1-zengheng4@huawei.com>
References: <20221027112127.2433605-1-zengheng4@huawei.com>
Date: Thu, 27 Oct 2022 09:05:50 -0300
Message-ID: <878rl1h3oh.fsf@cjr.nz>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, liwei391@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Zeng Heng <zengheng4@huawei.com> writes:

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
>>ffff888108f35380: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
>                    ^
>  ffff888108f35400: fa fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888108f35480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>
> Fixes: 28eb24ff75c5 ("cifs: Always resolve hostname before reconnecting")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  fs/cifs/connect.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

