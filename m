Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FAEAC101C
	for <lists+samba-technical@lfdr.de>; Thu, 22 May 2025 17:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FM9MPi3qmJbgH9KZdjipEPkY7/dvsBNFITALeCwc6SQ=; b=Dj0KeZFZjbdM5Oma3Z3qXOGk8x
	QgL/dYKCaqhEFtHRCTdNV1IgDsGAhe/r33g1/fPD8JqQ5oiI6a6d9lFv/mSIKh4qwiz8OfFI0/Gsz
	CPg0EtDlqpf1O9aMfZodFiUuQr7Uhul7n0m+gELkNNyiqUKNTchms02C4b1pW1lpBLrj5YGaGCwAu
	eYDqgxuv93jGBJ5KlXiOCtR4U32wxJ0+M8S6JSSBXglpWHEA8BuQzgnnoCsMhXki4jCt1vbYYatRP
	/d/6ubwhbp944ZK5xTso3N4Ot8lhd4koVcFqrD9p1racJygTUAAUWjXrVfi0MnU7kdAWz5H4jkapc
	arH4jIyQ==;
Received: from ip6-localhost ([::1]:39642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uI81Q-0042jh-Mk; Thu, 22 May 2025 15:39:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:44220) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uI81M-0042ja-Fj
 for samba-technical@lists.samba.org; Thu, 22 May 2025 15:39:50 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-551f00720cfso6369282e87.0
 for <samba-technical@lists.samba.org>; Thu, 22 May 2025 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747928387; x=1748533187; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FM9MPi3qmJbgH9KZdjipEPkY7/dvsBNFITALeCwc6SQ=;
 b=A7cIu4lPMGKyWC6lf63ZOLkwu/xBDiPfCsgtIrAwY1Mm3uLWRKt3hWZIeXVzc1D45D
 nfMQFPVFbKbcNurDP4Rm8QtG3b4wDR+AlwptCYEHo1R3Sb/6Y6Wj3L0nov4zBcxzz7sA
 sdMThH5JP7vsxKjbV0Nk+VjFmxZ+zexCBCjb6eKrXVSxg7vl3XF9AnZc4jsFD1KdCEWx
 78Ciu9nBbbTiatLzTH6Hi+ynVfRNZJXsTvxdHmfgOD20Nxm03psks9HTUI2pruRBohko
 aef0ZP10q86pf3hIjxgMqa74sfoOiB7LOAEjJCov42oXgMC7lEzVrhQNsBDK+REmtD6/
 8xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747928387; x=1748533187;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FM9MPi3qmJbgH9KZdjipEPkY7/dvsBNFITALeCwc6SQ=;
 b=Yx0UxwdI4r3f+UEIcW5VbRbwGTf1B2JTA6rvdcQVZP4fjIjRQMq/aAHsVJEvi4ujBx
 c47a+/F+941LZKA1ygNnbS63vRu7AvZJP91m9HJbig23rg3TF/MvRPdm1310WkhWh086
 5g/Zd1irS7iRn6MutJHF7CvjKYvlS7IjoKW/NPlDRazQ3FgalEWMTdWt1DFLaCVwnRan
 ZChtyka+iLUCMjyBlTxMxnHf6GpmQRR85/NcNIW+oX0vUIQ4oWsAkEJWMVIFj+SqwNk5
 4I7ftmeqPg6OwTDnYsrfwZuP2tXjGUFW3/4yHVecM75vtKatzw15nnGiDuz1t9CMP4bZ
 MMvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUex1dqufXQQ9+Cyb2BmyyBHGT1rSwvTjcxWNjAD4L/WVUdxyNmko483UCHwv7+gUgRSwaivKzRYo037HmUMqo=@lists.samba.org
X-Gm-Message-State: AOJu0YxuejdzKByYzdqe9awEhCnu8OlpVYndc7tDM77kN/SMGOWE8WuZ
 b6HC7LMoNunIGeg5hPTeL0Kub/i1hhkd331g4wZWp8CRcMAgxxhxP6NI2BI/mxfVhBbRYciOSpQ
 UJK0aig6rQ3YjQ23VAFMVJ6jHQ1Ye5nWjbg==
X-Gm-Gg: ASbGncs/LJbulY8kYpB/XgmnvBWEsHYb/qh9CjKlfuESNVi/Ra1zGjSTbRXw9rXjJgp
 3HVcFlJA5O2wk+9j8qmy6she+6SmL6qNP7FJrSDPT0gpfCybPMo0fbJEgALussIffrtRbkGYd3W
 z2OTlBCU1FI2LB+aN6AG6Ic6UnLwyUWUbnBvaUkYGMjijZxFDHnf36SwvsWNaG5koYHJg=
X-Google-Smtp-Source: AGHT+IHOm7kIvAkpFG9yG6lhRBAaFkiO8KtyNXetrkoWhx61tywJNKM2TY5MWpZF7OjS9B1baCBCZSCueVP4eI8PkzQ=
X-Received: by 2002:a2e:8a9c:0:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-32807748066mr66419341fa.18.1747928386788; Thu, 22 May 2025
 08:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250516091256.2756826-1-wangzhaolong1@huawei.com>
 <860a4f7600814b17e48dbabe1ae19f68@manguebit.com>
 <CAH2r5mvo1e3034LpCWUAuE0=dDBb7R0bMCmt80dGRWKMegRV+Q@mail.gmail.com>
 <c1e693c6-573f-49d4-b6cf-cc308c339f06@huawei.com>
 <CAH2r5mvoS8Py_M95+i0hB2iP06Uqz5JQbb13schBfdmJ6NzL3g@mail.gmail.com>
 <f03b6422-eac8-4998-b516-a3ba34070f0d@huawei.com>
In-Reply-To: <f03b6422-eac8-4998-b516-a3ba34070f0d@huawei.com>
Date: Thu, 22 May 2025 10:39:37 -0500
X-Gm-Features: AX0GCFuLlZUOi_QAH51r7kwXEoIYpuYeRtb9HtzdIl6eXq-bGWJOcyzPXCffS8o
Message-ID: <CAH2r5msPC3fE1tjkw_GA+sT-AMLmKM=R6BGLnt2pccjGXQHk6w@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since your patches both clearly fix problems, and look
non-controversial (and reviewed by multiple people).  I plan to send
them upstream today, let me know if any objections.

On Thu, May 22, 2025 at 9:00=E2=80=AFAM Wang Zhaolong <wangzhaolong1@huawei=
.com> wrote:
>
>
>
>
>
> > I was able to reproduce it by running the reproducer poc much longer
> >
> > [189335.643181] Key type cifs.idmap unregistered
> > [189335.643203] Key type cifs.spnego unregistered
> > [189335.649519] CIFS: VFS: kmem_cache_destroy small req cachep
> > [189335.656316]
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > [189335.656320] BUG cifs_small_rq (Tainted: G    B   W  OE      ):
> > Objects remaining on __kmem_cache_shutdown()
> > [189335.656322]
> > -----------------------------------------------------------------------=
------
> >
> > [189335.656324] Object 0x000000001a39cfef @offset=3D15232
> > [189335.656326] Slab 0x00000000479475fe objects=3D36 used=3D1
> > fp=3D0x0000000090941d36
> > flags=3D0x17ffffc0000240(workingset|head|node=3D0|zone=3D2|lastcpupid=
=3D0x1fffff)
> > [189335.656334] ------------[ cut here ]------------
>
> After disabling KASAN, I encountered two memory leak issues after
> running the POC for half-hour:
>
> Phenomenon 1:
>
> [ 2175.037198] ------------[ cut here ]------------
> [ 2175.038447] WARNING: CPU: 2 PID: 425 at fs/smb/client/smb2ops.c:104 sm=
b2_add_credits+0x2ac/0x6c0 [cifs]
> [ 2175.041927] Modules linked in: cifs cifs_arc4 nls_ucs2_utils cifs_md4
> [ 2175.043736] CPU: 2 UID: 0 PID: 425 Comm: cifsd Not tainted 6.15.0-rc6+=
 #241 PREEMPT(full)
> [ 2175.046082] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.1-2.fc37 04/01/2014
> [ 2175.048680] RIP: 0010:smb2_add_credits+0x2ac/0x6c0 [cifs]
> [ 2175.050432] Code: ff ff 4c 89 e7 e8 d4 8e ff ff 41 89 c5 e9 99 fe ff f=
f c7
> 43 08 02 00 00 00 45 8b 8c 24 d8 01 00 00 45 85 c9 0f 85 48 fe ff ff <0f>=
 0b 80 3d
> 41 6a eb ff 00 0f 84 dc 03 00 00 0f 1f 44 00 00 f
> [ 2175.054563] RSP: 0018:ffffa9a94043fca8 EFLAGS: 00010246
> [ 2175.055716] RAX: 0000000000001ffe RBX: ffffa9a94043fcf0 RCX: 000000000=
0000000
> [ 2175.057236] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff90b80=
7432a34
> [ 2175.058760] RBP: 0000000000000000 R08: ffff90b80ce60188 R09: 000000000=
0000000
> [ 2175.060268] R10: 0000000000000000 R11: 0000000000000001 R12: ffff90b80=
7432800
> [ 2175.061730] R13: 0000000000000000 R14: 0000000000000001 R15: ffff90b80=
74329d0
> [ 2175.063210] FS:  0000000000000000(0000) GS:ffff90b8a9e84000(0000) knlG=
S:0000000000000000
> [ 2175.064422] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2175.065455] CR2: 00005643543896f8 CR3: 000000000192c000 CR4: 000000000=
00006f0
> [ 2175.066519] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [ 2175.067561] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [ 2175.068658] Call Trace:
> [ 2175.069068]  <TASK>
> [ 2175.069402]  cifs_compound_callback+0x77/0xb0 [cifs]
> [ 2175.070214]  cifs_cancelled_callback+0x12/0x40 [cifs]
> [ 2175.071058]  clean_demultiplex_info+0x206/0x420 [cifs]
> [ 2175.071935]  cifs_demultiplex_thread+0x1a6/0xcb0 [cifs]
> [ 2175.072815]  ? dl_server_update_idle_time+0x60/0xa0
> [ 2175.073579]  ? __pfx_cifs_demultiplex_thread+0x10/0x10 [cifs]
> [ 2175.074550]  kthread+0x10d/0x200
> [ 2175.075051]  ? __pfx_kthread+0x10/0x10
> [ 2175.075631]  ret_from_fork+0x34/0x50
> [ 2175.076197]  ? __pfx_kthread+0x10/0x10
> [ 2175.076683]  ret_from_fork_asm+0x1a/0x30
> [ 2175.077143]  </TASK>
> [ 2175.077398] ---[ end trace 0000000000000000 ]---
> [ 2175.077919] CIFS: rreq R=3D00000000[0] Zero in_flight
> [ 2175.285771] ------------[ cut here ]------------
>
>
> Phenomenon 2
>
> [ 2175.287049] kmem_cache_destroy cifs_request: Slab cache still has obje=
cts when called from exit_cifs+0x43/0x560 [cifs]
> [ 2175.287205] WARNING: CPU: 0 PID: 3207738 at mm/slab_common.c:525 kmem_=
cache_destroy+0xfd/0x160
> [ 2175.292071] Modules linked in: cifs(-) cifs_arc4 nls_ucs2_utils cifs_m=
d4
> [ 2175.293796] CPU: 0 UID: 0 PID: 3207738 Comm: modprobe Tainted: G      =
  W           6.15.0-rc6+ #241 PREEMPT(full)
> [ 2175.296519] Tainted: [W]=3DWARN
> [ 2175.297339] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.16.1-2.fc37 04/01/2014
> [ 2175.299559] RIP: 0010:kmem_cache_destroy+0xfd/0x160
> [ 2175.300836] Code: de 5b e9 86 bf 05 00 e8 b1 db e4 ff eb b2 48 8b 53 6=
0 48 8b
> 4c 24 08 48 c7 c6 a0 be a2 93 48 c7 c7 10 2e fb 93 e8 a3 9d da ff <0f> 0b=
 48 8b 53 68
> 48 8b 43 70 48 c7 c7 80 8a 37 94 48 89 42 8
> [ 2175.304313] RSP: 0018:ffffa9a94328beb8 EFLAGS: 00010286
> [ 2175.305261] RAX: 0000000000000000 RBX: ffff90b801c63a00 RCX: 000000000=
0000000
> [ 2175.306544] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 00000000f=
fffffff
> [ 2175.307815] RBP: 0000000000000800 R08: 0000000000004ffb R09: 00000000f=
fffefff
> [ 2175.309077] R10: 00000000ffffefff R11: ffffffff94265060 R12: 000000000=
0000000
> [ 2175.310353] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [ 2175.311632] FS:  00007fa76803b440(0000) GS:ffff90b8a9d84000(0000) knlG=
S:0000000000000000
> [ 2175.313063] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2175.314098] CR2: 0000560b6ad2e850 CR3: 000000000deac000 CR4: 000000000=
00006f0
> [ 2175.315221] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [ 2175.316137] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [ 2175.317091] Call Trace:
> [ 2175.317433]  <TASK>
> [ 2175.317734]  exit_cifs+0x43/0x560 [cifs]
> [ 2175.318316]  __x64_sys_delete_module+0x1ad/0x2a0
> [ 2175.318958]  ? fpregs_assert_state_consistent+0x25/0x50
> [ 2175.319656]  do_syscall_64+0x4b/0x110
> [ 2175.320184]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [ 2175.320856] RIP: 0033:0x7fa767927977
> [ 2175.321359] Code: 73 01 c3 48 8b 0d a9 94 0c 00 f7 d8 64 89 01 48 83 c=
8 ff c3
> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00 00 00 0f 05 <48> 3d=
 01 f0 ff
> ff 73 01 c3 48 8b 0d 79 94 0c 00 f7 d8 64 89 8
> [ 2175.323766] RSP: 002b:00007ffd9f24c6f8 EFLAGS: 00000206 ORIG_RAX: 0000=
0000000000b0
> [ 2175.324766] RAX: ffffffffffffffda RBX: 000056460f617e30 RCX: 00007fa76=
7927977
> [ 2175.325721] RDX: 0000000000000000 RSI: 0000000000000800 RDI: 000056460=
f617e98
> [ 2175.326580] RBP: 0000000000000000 R08: 1999999999999999 R09: 000000000=
0000000
> [ 2175.327329] R10: 00007fa767999ac0 R11: 0000000000000206 R12: 000000000=
0000000
> [ 2175.328086] R13: 0000000000000000 R14: 00007ffd9f24c730 R15: 00007ffd9=
f24dbe8
> [ 2175.328832]  </TASK>
> [ 2175.329090] ---[ end trace 0000000000000000 ]---
>
>
> These should be new issues. I'll get to the bottom of them as soon as I c=
an.
>
> Best regards,
> Wang Zhaolong
>


--=20
Thanks,

Steve

