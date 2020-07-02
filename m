Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E5921290B
	for <lists+samba-technical@lfdr.de>; Thu,  2 Jul 2020 18:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8Kfuc5CARnznbS/qlVEzSK3r70q6/7pjU8+G3Y0ONZI=; b=oNaG9as/FTpT4/CEUflo2U6/zy
	H28F8r6fFtGldoKQuy2kMWb8niIQCZw2mJkeXmDeNMVOCwOOPG9HXwpcpoUJS5gG7J0bFzN9uD690
	MhOMjhac8jYoCt96IIFNyrVtsJPruEAhj3h+31YWczJnoKtNY3MrMvOSt2tv4/x96RqFioY0w9fcs
	UhtaGmGCAU4sdM6mNK8Aqh1RYZgrOMzqu6Xt2/+D5aP/uhl28HBAtNKucObpEES71vvyChmU0AJpp
	nT0Cjr5mY+rhK5Kbe6NzFmIbJQ77BAnmvQ1KV+HkvCHhH8uScXzZ8ypY576/+aGl3A9IGzqbzUcM0
	S98ghYlg==;
Received: from localhost ([::1]:56564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jr1lo-0057AG-Nq; Thu, 02 Jul 2020 16:09:04 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jr1li-0057A9-1J
 for samba-technical@lists.samba.org; Thu, 02 Jul 2020 16:09:00 +0000
Received: by mail-ed1-x543.google.com with SMTP id dm19so18293070edb.13
 for <samba-technical@lists.samba.org>; Thu, 02 Jul 2020 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Kfuc5CARnznbS/qlVEzSK3r70q6/7pjU8+G3Y0ONZI=;
 b=ZYCgLK9qiGagOawdqT3P3TYcEgNthQX8uAwqYFVMVmhWg4mEBJcJcfKopH1dxnFCZG
 d06E7zXNUBwOlwmjbZJlzAHFAr4h7440/Na31kpFSlzojkZCQG5q92KcXyBVc0MZgB4w
 Hp6Cy8oBy3wYmwaBlXQ/Ij84Bf6swq+s4cxM9Z87KrrhWpgFfHqLByP3fpkuoac/2dyM
 R+FgZQ/14l38ozg7gzJj02rfIErZMvdmqeOGEbuvqyD2C7aXi1FZkt8kWNptfgWzKt8t
 BVm2N7Mu1QZkfD6NN05GifskD6BlfGDJD0rWKI2V+/6mixyLm/w8rsPFnbg1/TqnLPG9
 fRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Kfuc5CARnznbS/qlVEzSK3r70q6/7pjU8+G3Y0ONZI=;
 b=Ix2Htxeqn4C/tv41CdQBCmGjOsiQHSWgI1sdLc4BSSG+mKkLOPiXDmBX8ketx6q2gl
 oHIlR4+V+mYWMcPZJtNNUb6TzdrWSi8qenPGjNB/ieiKcB5cTF6TZ1E5GdPSZCz61thA
 p0M7qg8ID0yXmUPB9epyT/eIxPp4XB4Ps7bGg3pS7zufwHotWfThUMwHZVVMXdjkvwBF
 JJyf4qR+gHl4CgiCjs+OeWh/2921xx3b5NPI/EY6uyWZpD91VsXExm/c94Is26VL0ns/
 0DE04UCSiTDYIy4SNit6OviTI/rz3cS5rYsaaXkt8bvlabWwdbTBGaGHDe8eG9Ni8Pd9
 jEqw==
X-Gm-Message-State: AOAM531xlkrEhwDaD+TcViuMcBTheiIy9wN8zNsllGFQoom4oC1OEfZ7
 HAr3WgXU1Li5JCXrsWlTDy0UKEuGk53AkvP9IQ==
X-Google-Smtp-Source: ABdhPJy0waChbv7GcIB7p+vu56ctYGZl91rMkT00jMJlYf9qe5Yl7H0hV7JxcPSfML8h0lgVzwXZWnf2is39PO0vCDU=
X-Received: by 2002:a50:cbcd:: with SMTP id l13mr19086813edi.384.1593706137348; 
 Thu, 02 Jul 2020 09:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200702012202.2700645-1-sashal@kernel.org>
 <20200702012202.2700645-37-sashal@kernel.org>
In-Reply-To: <20200702012202.2700645-37-sashal@kernel.org>
Date: Thu, 2 Jul 2020 09:08:45 -0700
Message-ID: <CAKywueRGSriwuMGtG53i3Bm_ek_k1LMAK0fojf9++7=ar+6u8Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.7 37/53] cifs: Fix double add page to memcg when
 cifs_readpages
To: Sasha Levin <sashal@kernel.org>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stable <stable@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Hulk Robot <hulkci@huawei.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=81=D1=80, 1 =D0=B8=D1=8E=D0=BB. 2020 =D0=B3. =D0=B2 18:35, Sasha Levin =
<sashal@kernel.org>:
>
> From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
>
> [ Upstream commit 95a3d8f3af9b0d63b43f221b630beaab9739d13a ]
>
> When xfstests generic/451, there is an BUG at mm/memcontrol.c:
>   page:ffffea000560f2c0 refcount:2 mapcount:0 mapping:000000008544e0ea
>        index:0xf
>   mapping->aops:cifs_addr_ops dentry name:"tst-aio-dio-cycle-write.451"
>   flags: 0x2fffff80000001(locked)
>   raw: 002fffff80000001 ffffc90002023c50 ffffea0005280088 ffff88815cda021=
0
>   raw: 000000000000000f 0000000000000000 00000002ffffffff ffff88817287d00=
0
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
>   FS:  00007f5071ab0800(0000) GS:ffff88817ac80000(0000) knlGS:00000000000=
00000
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
>  add_to_page_cache_locked(head,index=3Dn)=3D0
>                               | readpages_get_pages
>                               | add_to_page_cache_locked(head,index=3Dn+1=
)=3D0
>  add_to_page_cache_locked(head, index=3Dn+1)=3D-EEXIST
>  then, will next loop with list head page's
>  index=3Dn+1 and the page->mapping not NULL
> readpages_get_pages
> add_to_page_cache_locked(head, index=3Dn+1)
>  commit_charge
>   VM_BUG_ON_PAGE
>
> So, we should not do the next loop when any page add to page cache
> failed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> Acked-by: Ronnie Sahlberg <lsahlber@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Hi Sasha,

The patch description mentions the commit 3fea5a499d57 that changed
the behavior and was introduced in v5.8-rc1. I noticed that you are
targeting this patch for 4.9, 4.14, 4.19, 5.4 and 5.7 stable branches.
Are you going to backport the commit 3fea5a499d57 as well?

--
Best regards,
Pavel Shilovsky

