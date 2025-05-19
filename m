Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1AABC2BC
	for <lists+samba-technical@lfdr.de>; Mon, 19 May 2025 17:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hSIy+2fySJSQutZI2cqUev4NxCK0aKsYVnD2VvMbVvg=; b=Lx6WFN/RNgG/Oxu5wSVj9t+KMF
	DGI2t+ibB1ENbixbzJmcsd2VPY8VYWRAfdZNQA37o/Pq/S/yIo4OVWVWJhrIFeN5KbtvrHDMQwk6F
	mge0lb36NMKCaj5ZXMrpCU+H8vID1iJfThN/UVh3zIConv7ftb7hal2mKeelCuQyJpFAafqGCpSxz
	6letWyrDy3xSK0sv3wXRapIew0NXseeIN6Kqz6LevzaEpzQHD2dPN29/OuUiCksUVs5OCPF2RjV3f
	F/8p5RiJiLCvCBSSKCV703iP69NFGr0NdpsX15uwrPRe7dcSoMa5nH3fxhYNYpz/egiwFk2W8g8fZ
	uElmtXUA==;
Received: from ip6-localhost ([::1]:59958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uH2cj-003rzK-KB; Mon, 19 May 2025 15:41:53 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:42076) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uH2ce-003rzD-Pi
 for samba-technical@lists.samba.org; Mon, 19 May 2025 15:41:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30effbfaf61so58032271fa.0
 for <samba-technical@lists.samba.org>; Mon, 19 May 2025 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747669307; x=1748274107; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSIy+2fySJSQutZI2cqUev4NxCK0aKsYVnD2VvMbVvg=;
 b=lRlhCbNVGGe3UYIt7QifV7VUd8yXj4pvfR3APysj8qRq2RPi29DKI7ZyrZiTedp6U8
 LGGb8I0lxinUCSuNMTWa5xrDaUGLcZLeWCXy4EytlD94hg1GBob/E/5ztZoXdOA81F/P
 3JCSc72obSYhWwPaOZEEP1Lt+YOsK3GbXLEdJ0OA8thB5FXRI8VcxGx6iJkW9YA+VnzT
 qsrRzm8GcyWYCZrmBQfivUdt3L1b8uiefZ4IUDGKd+DQKi2WL7twsjYSK4of6d1z7gJ8
 iRZ1fljP3X6ASRoTz2WgpDUKa3xQMC8Ilq3+N3nAuQaXkoYeHlUvUFkiyHWmmmKsd20c
 UY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747669307; x=1748274107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSIy+2fySJSQutZI2cqUev4NxCK0aKsYVnD2VvMbVvg=;
 b=PRiJ6AcJ3RidTie9mnDQPPEuW9pKET50abjk39YQKOUARvG56Wu6lqv38ntVqC3UJB
 /vFCDm253m6s6WOacvhQcBmroqIy+Qt/LYJKUHs36Q9Bf/NsicMAoQUsv6H4b7AZ+Kbt
 wwwf58DdtNKGQS4EaxWiIk9D2T+aTMW2BHMftNYXgT6qEcqhanfZpTl6u9Mow3pqTVL8
 cYH+JEppVir0f7xXoRI4DwWGMt5uEUnlMosIB7X6+lqvtHkuMk5uKINowj0AvDVK15Tr
 j4Lu1DX9RMGhGKCSJcweF4+Kg8pAwEjzNz2fc6xnuarG567FVO4yoOWLts1bpqMxYrm8
 nL0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx2S1qHCjFZCqLqrdh73qrs6AVMf7PoQy2uTgZ4O99AxQQvmJmmW6irFUsAMivI05CWk5QHQYbfP3qe2n+5OM=@lists.samba.org
X-Gm-Message-State: AOJu0Yz/h4Z5zuRtnJ5uUGG9dPeeddQ5XqbL4SFtrA+MLD1V1pu6naOF
 4TwI2ctRlwNJQfFpR7AUGiejb5alg+NzZaOwj9YSMP9HHuV8IXXTU8KEiYTR3NQv+jhsfDSIPyh
 tJYk7yZepltUzYTcptD11+nQSeztY7EQ=
X-Gm-Gg: ASbGncuVuxlJJr6RbS+b9vFkooHLP8oc+OS4rH/o0aXnThz9C7sHkHBoDkpQ6niarud
 aqE3UMbAxDzcyBm25kq+IEEme3q1NPKf5i9ZpUOsBeWPvSQ+/Jvy1+NZMNQp7pX3Hia5xolOFmm
 C9llFxvmbvDLSAbh00GfzJgwR9OoxgVsLDYQHJ7hMXoIDwxlQEegvD1TlCamFKewlqwV4ez0GUi
 DY=
X-Google-Smtp-Source: AGHT+IE9+jlljfPXM/88q+TkseTtoiDACRH3uFb0C/2thZeqgCTgo/nVIfR1NuuvdZ2+k3yXMukkoHbLoYvwhWZA0TU=
X-Received: by 2002:a05:651c:f09:b0:308:e956:66e with SMTP id
 38308e7fff4ca-3280831bac4mr30245401fa.0.1747669307054; Mon, 19 May 2025
 08:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250516091256.2756826-1-wangzhaolong1@huawei.com>
 <860a4f7600814b17e48dbabe1ae19f68@manguebit.com>
 <CAH2r5mvo1e3034LpCWUAuE0=dDBb7R0bMCmt80dGRWKMegRV+Q@mail.gmail.com>
 <c1e693c6-573f-49d4-b6cf-cc308c339f06@huawei.com>
In-Reply-To: <c1e693c6-573f-49d4-b6cf-cc308c339f06@huawei.com>
Date: Mon, 19 May 2025 10:41:33 -0500
X-Gm-Features: AX0GCFtizYdCmu5in-fWZZPBKKx3HOZU4qXQW9kORdVtzaAksj5OdLPKCCuTpXU
Message-ID: <CAH2r5mvoS8Py_M95+i0hB2iP06Uqz5JQbb13schBfdmJ6NzL3g@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] smb: client: Fix use-after-free in readdir
To: Wang Zhaolong <wangzhaolong1@huawei.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@us.ibm.com, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was able to reproduce it by running the reproducer poc much longer

[189335.643181] Key type cifs.idmap unregistered
[189335.643203] Key type cifs.spnego unregistered
[189335.649519] CIFS: VFS: kmem_cache_destroy small req cachep
[189335.656316]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[189335.656320] BUG cifs_small_rq (Tainted: G    B   W  OE      ):
Objects remaining on __kmem_cache_shutdown()
[189335.656322]
---------------------------------------------------------------------------=
--

[189335.656324] Object 0x000000001a39cfef @offset=3D15232
[189335.656326] Slab 0x00000000479475fe objects=3D36 used=3D1
fp=3D0x0000000090941d36
flags=3D0x17ffffc0000240(workingset|head|node=3D0|zone=3D2|lastcpupid=3D0x1=
fffff)
[189335.656334] ------------[ cut here ]------------
[189335.656335] WARNING: CPU: 1 PID: 84118 at mm/slub.c:1135
__slab_err+0x1d/0x30
....
[189335.656512]  [last unloaded: cifs(OE)]
[189335.656516] CPU: 1 UID: 0 PID: 84118 Comm: rmmod Tainted: G    B
W  OE       6.15.0-061500rc4-generic #202504272253 PREEMPT(voluntary)
[189335.656520] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [O]=3DOOT_MODULE,
[E]=3DUNSIGNED_MODULE
[189335.656521] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[189335.656522] RIP: 0010:__slab_err+0x1d/0x30
[189335.656525] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44
00 00 55 48 89 e5 e8 72 ff ff ff be 01 00 00 00 bf 05 00 00 00 e8 33
b2 1c 00 <0f> 0b 5d 31 f6 31 ff c3 cc cc cc cc 0f 1f 80 00 00 00 00 90
90 90
[189335.656527] RSP: 0018:ffffcf3041b33a18 EFLAGS: 00010046
[189335.656529] RAX: 0000000000000000 RBX: ffffcf3041b33a60 RCX:
0000000000000000
[189335.656530] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[189335.656531] RBP: ffffcf3041b33a18 R08: 0000000000000000 R09:
0000000000000000
[189335.656533] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff8c1b49eb7600
[189335.656534] R13: ffff8c1b4ccd9580 R14: dead000000000122 R15:
ffff8c1b4ccd9580
[189335.656535] FS:  00007d912677e080(0000) GS:ffff8c2312b1b000(0000)
knlGS:0000000000000000
[189335.656537] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[189335.656538] CR2: 000061c8bedf4778 CR3: 00000003f2b4a001 CR4:
00000000003726f0
[189335.656540] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[189335.656541] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[189335.656542] Call Trace:
[189335.656543]  <TASK>
[189335.656546]  free_partial.cold+0x137/0x191
[189335.656550]  __kmem_cache_shutdown+0x46/0xa0
[189335.656553]  kmem_cache_destroy+0x3e/0x1c0
[189335.656558]  cifs_destroy_request_bufs+0x5c/0x70 [cifs]
[189335.656618]  exit_cifs+0x3a/0xef0 [cifs]
[189335.656666]  __do_sys_delete_module.isra.0+0x19d/0x2e0
[189335.656671]  __x64_sys_delete_module+0x12/0x20
[189335.656674]  x64_sys_call+0x1765/0x2320
[189335.656677]  do_syscall_64+0x7e/0x210
[189335.656679]  ? __fput+0x1a2/0x2d0
[189335.656681]  ? kmem_cache_free+0x408/0x470
[189335.656684]  ? __fput+0x1a2/0x2d0
[189335.656686]  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
[189335.656689]  ? syscall_exit_to_user_mode+0x38/0x1d0
[189335.656692]  ? do_syscall_64+0x8a/0x210
[189335.656695]  ? do_read_fault+0xfb/0x230
[189335.656698]  ? do_fault+0x15d/0x220
[189335.656699]  ? handle_pte_fault+0x140/0x210
[189335.656702]  ? __handle_mm_fault+0x3cd/0x790
[189335.656705]  ? __count_memcg_events+0xd3/0x1a0
[189335.656708]  ? count_memcg_events.constprop.0+0x2a/0x50
[189335.656710]  ? handle_mm_fault+0x1ca/0x2e0
[189335.656713]  ? do_user_addr_fault+0x2f8/0x830
[189335.656716]  ? arch_exit_to_user_mode_prepare.isra.0+0x22/0xd0
[189335.656719]  ? irqentry_exit_to_user_mode+0x2d/0x1d0
[189335.656722]  ? irqentry_exit+0x43/0x50
[189335.656724]  ? exc_page_fault+0x96/0x1e0
[189335.656727]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[189335.656729] RIP: 0033:0x7d9125f2ac9b
[189335.656731] Code: 73 01 c3 48 8b 0d 7d 81 0d 00 f7 d8 64 89 01 48
83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 b0 00 00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4d 81 0d 00 f7 d8 64 89
01 48
[189335.656732] RSP: 002b:00007ffe9b9656f8 EFLAGS: 00000206 ORIG_RAX:
00000000000000b0
[189335.656735] RAX: ffffffffffffffda RBX: 00005eb63e457720 RCX:
00007d9125f2ac9b
[189335.656736] RDX: 0000000000000000 RSI: 0000000000000800 RDI:
00005eb63e457788
[189335.656737] RBP: 00007ffe9b965720 R08: 1999999999999999 R09:
0000000000000000
[189335.656738] R10: 00007d9125fb1fc0 R11: 0000000000000206 R12:
0000000000000000
[189335.656740] R13: 00007ffe9b965970 R14: 00005eb63e457720 R15:
0000000000000000
[189335.656743]  </TASK>
[189335.656744] ---[ end trace 0000000000000000 ]---
[189335.656803] ------------[ cut here ]------------
[189335.656804] kmem_cache_destroy cifs_small_rq: Slab cache still has
objects when called from cifs_destroy_request_bufs+0x5c/0x70 [cifs]
[189335.656861] WARNING: CPU: 1 PID: 84118 at mm/slab_common.c:525
kmem_cache_destroy+0x152/0x1c0

....

On Sun, May 18, 2025 at 9:56=E2=80=AFPM Wang Zhaolong <wangzhaolong1@huawei=
.com> wrote:
>
>
>
>
>
> > Merged into cifs-2.6.git for-next
> >
> > I was only able to reproduce the rmmod problem once though (without
> > the patch) so been tricky to test.  What server were you testing
> > against (I tried current Samba and ksmbd)?
> >
>
> I initialized the Samba server using the `samba` package provided by the
> Debian Trixie distribution.
>
> Best regards,
> Wang Zhaolong



--=20
Thanks,

Steve

