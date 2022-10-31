Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A661345E
	for <lists+samba-technical@lfdr.de>; Mon, 31 Oct 2022 12:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Bo9FNLTxkJoFsREeJO4aESjuFB3VaeJBMxqEix8mKVQ=; b=vApuHwKqGNLcqueLxcQRdrZ9Ap
	RcXvbz83yooB4d0SyJl88ONJrJqJg5hPwJAHza4fDU9pEqi7pKeAEvT9oW6Mw33jbwEbrtc0agtQA
	Rh/kXm53KHpZEqMOkkGBvpJbOFObDUklXcKqEOxItlLUARXiSjUwUsbg6029FlgDqntJZH3YnOr8t
	2sRaK+2jy9zTa9LGnihMyqoe/2L0JsGGHZ+D4fhF5GRufWP5X8DMKh4ccTLHoFuOnr4opEsCBi6uU
	Wr0YC4I54+R4p86DPFIPJiUb5BlA89mYhEUGVfAxPWnKsNmmCAMhpWNfBxwxlEsFUrlVwT9t1EyiJ
	VAeZZ+xA==;
Received: from ip6-localhost ([::1]:43458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opSml-007Th4-OE; Mon, 31 Oct 2022 11:16:55 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:38592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opSmg-007Tgv-Nq
 for samba-technical@lists.samba.org; Mon, 31 Oct 2022 11:16:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id b9so1299247ljr.5
 for <samba-technical@lists.samba.org>; Mon, 31 Oct 2022 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bo9FNLTxkJoFsREeJO4aESjuFB3VaeJBMxqEix8mKVQ=;
 b=eYVXHM+uluiNK4HwJgF79tdpRWu87WUz0XpHmNM3j8hotWsUPxDz3aB4YW/GdIuUQ4
 CL9fb+QlTo9TUuo4Wna0ZvumJylHsPcffZeDQG5H32SCSP+fkp2jcWUOT4scUTbhK13E
 MrdrKY2YbouGD8P6uxyec2+5wUwM9AVtHFsCp4mSs5S2E3UqAiUv/X3eh2WqzhseaA6r
 hreaww/jGdeyUCz8nLnPecasPbCnvL3WpKkRmPB+Y+rIrt0yYiq/fWz1kSIFzFbrFi2h
 LUXTrOEMZJtSxZPrkBbf4lNk6uvNPu9FzVpdl5TuXiAEW1e0UsJF4ClEnWboSjY0QO4k
 YF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bo9FNLTxkJoFsREeJO4aESjuFB3VaeJBMxqEix8mKVQ=;
 b=6tWsL2VnBPWz9hzpAvPMf7zDipwG2n0FBAtGbj7sugipUUHbMfyZAEcA65nWqMxWUA
 WoWOSrJ2Vr9rD9mgAgIXgOJ7BQWtaZ5vkFJdE/sTMegn8obiI1JiiHJUC2nxUQhFMC4p
 ne2bu6l0eJebTzPFriH2EZ72Okr7Ydu3xIMLk7t2R5VB6vRtV+zQCk+TmFcelxMZ7ZlT
 PX5xuogjFbxypyEYOeTuhhaBaz8+AZuWhXQsBUUkatWx6AcjgNMQFMCU23MXaA3VcfXK
 NXHrn0SixXoh33k4EHom87DCqD61l0gv1615mzgkNxajHCtk/7GbLkvpBbx02ZgOx3Qo
 33gw==
X-Gm-Message-State: ACrzQf3rxYBH7zrgDgj6Blzbe6ZgWo4Wduw6SzxzncXz5AlRaltYivmb
 uO1p4pyBP8PoZ+aaosUsrIRbjZNvfrHXsqx6VOE=
X-Google-Smtp-Source: AMsMyM42kmXtCYyHaywWVxESCejo39g4w4ztxAZT8CacJMGuwfHBqY5tbLljK4R9GWm04Gj/vbyf/lJaPwv9Damp9H4=
X-Received: by 2002:a2e:b7d4:0:b0:277:5872:85b1 with SMTP id
 p20-20020a2eb7d4000000b00277587285b1mr1615733ljo.175.1667215008997; Mon, 31
 Oct 2022 04:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221027124528.2487025-1-zengheng4@huawei.com>
 <CANT5p=q50Kt+eyVaxyh891sizFSzC=eUp5P46ON-odHFRjMsEQ@mail.gmail.com>
 <46fbef33-13a3-3909-0345-628e98a5b460@huawei.com>
In-Reply-To: <46fbef33-13a3-3909-0345-628e98a5b460@huawei.com>
Date: Mon, 31 Oct 2022 16:46:36 +0530
Message-ID: <CANT5p=rCt4xdayz=xvxwJK09dQ7u+kNuoF8iaJTPbT8Vqmks6w@mail.gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, sfrench@samba.org, liwei391@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 29, 2022 at 8:25 AM Zeng Heng <zengheng4@huawei.com> wrote:
>
> Make sure `cifsd` terminated to avoid race condition, it has to call
> function like kthread_stop.
>
> Then the whole `server` struct would be released by `cifsd` and another
> UAF appears.
>
>
> On 2022/10/28 13:41, Shyam Prasad N wrote:
> > On Thu, Oct 27, 2022 at 6:19 PM Zeng Heng <zengheng4@huawei.com> wrote:
> >> `hostname` needs to be set as null-pointer after free in
> >> `cifs_put_tcp_session` function, or when `cifsd` thread attempts
> >> to resolve hostname and reconnect the host, the thread would deref
> >> the invalid pointer.
> >>
> >> Here is one of practical backtrace examples as reference:
> >>
> >> Task 477
> >> ---------------------------
> >>   do_mount
> >>    path_mount
> >>     do_new_mount
> >>      vfs_get_tree
> >>       smb3_get_tree
> >>        smb3_get_tree_common
> >>         cifs_smb3_do_mount
> >>          cifs_mount
> >>           mount_put_conns
> >>            cifs_put_tcp_session
> >>            --> kfree(server->hostname)
> >>
> >> cifsd
> >> ---------------------------
> >>   kthread
> >>    cifs_demultiplex_thread
> >>     cifs_reconnect
> >>      reconn_set_ipaddr_from_hostname
> >>      --> if (!server->hostname)
> >>      --> if (server->hostname[0] == '\0')  // !! UAF fault here
> >>
> >> CIFS: VFS: cifs_mount failed w/return code = -112
> >> mount error(112): Host is down
> >> BUG: KASAN: use-after-free in reconn_set_ipaddr_from_hostname+0x2ba/0x310
> >> Read of size 1 at addr ffff888108f35380 by task cifsd/480
> >> CPU: 2 PID: 480 Comm: cifsd Not tainted 6.1.0-rc2-00106-gf705792f89dd-dirty #25
> >> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
> >> Call Trace:
> >>   <TASK>
> >>   dump_stack_lvl+0x68/0x85
> >>   print_report+0x16c/0x4a3
> >>   kasan_report+0x95/0x190
> >>   reconn_set_ipaddr_from_hostname+0x2ba/0x310
> >>   __cifs_reconnect.part.0+0x241/0x800
> >>   cifs_reconnect+0x65f/0xb60
> >>   cifs_demultiplex_thread+0x1570/0x2570
> >>   kthread+0x2c5/0x380
> >>   ret_from_fork+0x22/0x30
> >>   </TASK>
> >> Allocated by task 477:
> >>   kasan_save_stack+0x1e/0x40
> >>   kasan_set_track+0x21/0x30
> >>   __kasan_kmalloc+0x7e/0x90
> >>   __kmalloc_node_track_caller+0x52/0x1b0
> >>   kstrdup+0x3b/0x70
> >>   cifs_get_tcp_session+0xbc/0x19b0
> >>   mount_get_conns+0xa9/0x10c0
> >>   cifs_mount+0xdf/0x1970
> >>   cifs_smb3_do_mount+0x295/0x1660
> >>   smb3_get_tree+0x352/0x5e0
> >>   vfs_get_tree+0x8e/0x2e0
> >>   path_mount+0xf8c/0x1990
> >>   do_mount+0xee/0x110
> >>   __x64_sys_mount+0x14b/0x1f0
> >>   do_syscall_64+0x3b/0x90
> >>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >> Freed by task 477:
> >>   kasan_save_stack+0x1e/0x40
> >>   kasan_set_track+0x21/0x30
> >>   kasan_save_free_info+0x2a/0x50
> >>   __kasan_slab_free+0x10a/0x190
> >>   __kmem_cache_free+0xca/0x3f0
> >>   cifs_put_tcp_session+0x30c/0x450
> >>   cifs_mount+0xf95/0x1970
> >>   cifs_smb3_do_mount+0x295/0x1660
> >>   smb3_get_tree+0x352/0x5e0
> >>   vfs_get_tree+0x8e/0x2e0
> >>   path_mount+0xf8c/0x1990
> >>   do_mount+0xee/0x110
> >>   __x64_sys_mount+0x14b/0x1f0
> >>   do_syscall_64+0x3b/0x90
> >>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >> The buggy address belongs to the object at ffff888108f35380
> >>   which belongs to the cache kmalloc-16 of size 16
> >> The buggy address is located 0 bytes inside of
> >>   16-byte region [ffff888108f35380, ffff888108f35390)
> >> The buggy address belongs to the physical page:
> >> page:00000000333f8e58 refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888108f350e0 pfn:0x108f35
> >> flags: 0x200000000000200(slab|node=0|zone=2)
> >> raw: 0200000000000200 0000000000000000 dead000000000122 ffff8881000423c0
> >> raw: ffff888108f350e0 000000008080007a 00000001ffffffff 0000000000000000
> >> page dumped because: kasan: bad access detected
> >> Memory state around the buggy address:
> >>   ffff888108f35280: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >>   ffff888108f35300: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >>> ffff888108f35380: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
> >>                     ^
> >>   ffff888108f35400: fa fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >>   ffff888108f35480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >>
> >> Fixes: 7be3248f3139 ("cifs: To match file servers, make sure the server hostname matches")
> >> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> >> Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
> >> ---
> >> changes in v4:
> >>   - correct fix tag
> >>   - add reviewed-by
> >> ---
> >>   fs/cifs/connect.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> >> index ffb291579bb9..1cc47dd3b4d6 100644
> >> --- a/fs/cifs/connect.c
> >> +++ b/fs/cifs/connect.c
> >> @@ -1584,6 +1584,7 @@ cifs_put_tcp_session(struct TCP_Server_Info *server, int from_reconnect)
> >>          server->session_key.response = NULL;
> >>          server->session_key.len = 0;
> >>          kfree(server->hostname);
> >> +       server->hostname = NULL;
> >>
> >>          task = xchg(&server->tsk, NULL);
> >>          if (task)
> >> --
> >> 2.25.1
> >>
> > Good catch. But I think there can be a better fix.
> > How about moving the lines that follow i.e. cifsd thread kill to
> > before setting tcpStatus? That way, we don't leave scope for things to
> > race.
> >

Good point. We need to ensure that.

-- 
Regards,
Shyam

