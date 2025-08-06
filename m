Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE1B1CD14
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 22:09:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J0NsfejOBCPj7fEMocq9Brx1pj66mrF83zI2fkkvvzc=; b=Bao3jsXM8BYhij9sfe8OqdVrkm
	1kIMm5xMA6V/ETl9XDZvhp0kxREqua09y35BCKeL2bIxa/cc9Tk7ZeB4GANtzti9Dj8UD6eaTeda0
	1VtTHW6yUiQrN1HH60nNKXjJTsURbIpF6SYAW6FSFOdrsEU3jJYt58NBFdm65H/RKdUBneN+oIoyu
	u+WbJ/j+pDVrJaeWq81oaTrqmDMJ2fXYHue4L7qPnzTc33fINHQVTwn4kP0IGKI2d//948UUvjjmd
	IpcLF06aNJXos0/bYyEkt4vfLOYw46Kfqja4dfoi6TQQ8PTgTXQDVXDxKs3+JbcOCbP64Q3Kta3l2
	jSUooXgg==;
Received: from ip6-localhost ([::1]:48902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujkS1-00ETbU-30; Wed, 06 Aug 2025 20:09:29 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:52578) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujkRw-00ETbN-HK
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 20:09:27 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-7074710a809so3448776d6.1
 for <samba-technical@lists.samba.org>; Wed, 06 Aug 2025 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754510963; x=1755115763; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0NsfejOBCPj7fEMocq9Brx1pj66mrF83zI2fkkvvzc=;
 b=Nv7h2qD612Gvb2ccAFRdz6a/ES10qcvyL5nBUkFRCraJW4491dvXxRQ+r1PcYlc+lk
 ZZj0vrHkpfbH4SITA6uc/hy0bxNJ9uRHKALuPhoWSSb1Mgb71w19y9KuY/JR9i0zdIYg
 osyNKDJX/ev+zYN4G2xLJcyEOpm5/EUTemWULWJf9n8ixIxLsJYhRRS5Q3X0w9HQHvoi
 C8iHsuAhhvbW8EMyfMLZcpixrPC6n+RZz3fgmvmyiBluF2uZicVwdeTTTJquLTuTRgDH
 hLXQrHt+IobQlFz+dm5RFtWC/zXSHPzHNGNnuLM9W9cWd+GW4yZi1xqZjvDRtK6zMzV8
 9Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754510963; x=1755115763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0NsfejOBCPj7fEMocq9Brx1pj66mrF83zI2fkkvvzc=;
 b=jBoTzv6IpwJ00QmBFE5TKU88dLk8jR6buWl+NnqROlQbU2HHjQWCSKypJPgJwOQoEh
 vMFze332Wn9quYmdHTI2JyDpnxI6RWbJ2Zadalrfh2HxEpLztVCB0oTYPAKZDbFeOtCc
 3UpjXdjupp8zkPDsc2Y4zkcN42mA9QOaj2c8vFE7cFykI1CbSHaDNarYOdSNBvjfVhiQ
 XXVi6IwAqr0a8jT0jtPEmCVf6AE6I7Lq4I81ztphdwQ7B+lMxSd8LliKq2gduGe1m3n4
 A0OUch6GU1Y0HRvqX2NQY/NZ5IkclP9vNj/TmTdktMGW5s5DDYb9X2nl300cUZSpGtUZ
 ffKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCwi8aXexOYFn5vzNNvFuTjw4jMkE2EfuKQA7EZrNUQmvnuGJosDUXk7GkZuCaE8NmOOzThOiMs2mojaTuQ9A=@lists.samba.org
X-Gm-Message-State: AOJu0YxYLn0QFabI8lSOnNs916mpZa8p01WegMfzH9pxx6N3Nt1xmQ4d
 oYXuUThE167qHBOcHl5FGH32hlTZq7W41Dni9aephiMWxIogs8m8+08bxlXd9rLbJ5hG2KOAErX
 bngUrpceOFrI7kK/V7Upi0NTFoKBSmbw=
X-Gm-Gg: ASbGnct9DGsMmyzRAcfFrOMtE35VJUxvxEucUSe5aYfylUeeQ7Hju4Ncy2OqhR+rec7
 M8toDvuyGTkOsZnvVLjrsAgLl1oFRZT7LLjcwRn17QjUZn09XCO8IU9phj9bVQl7LTG6qAXsAOJ
 YNeEdOpBw1kGHKW5HMWXGlSE7boXRXeSdgX1cfzcOR9bO2Ra5/2m6xi0NJvwkfHtD/UHOb+QHCm
 KFvu3+4bucz9Rdf/kA1cssk1bwmDRg/r4imDhnG
X-Google-Smtp-Source: AGHT+IHEfWCf9FgFlsU3iye3qm8Ip4wtA2MK5FUn4GvujbXpbuIjRI1HJBF//AzMmN63soHvgm+K+PUPuxeqeoXaFwU=
X-Received: by 2002:a05:6214:f0b:b0:707:5495:abe6 with SMTP id
 6a1803df08f44-709795203b7mr67212486d6.12.1754510962490; Wed, 06 Aug 2025
 13:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250806132211.94686-2-ysk@kzalloc.com>
In-Reply-To: <20250806132211.94686-2-ysk@kzalloc.com>
Date: Wed, 6 Aug 2025 15:09:10 -0500
X-Gm-Features: Ac12FXxPL5hoUGXqzan50qLzGpk3hra2GhpaxIMwaBNUwL-jJ1H6j-8cugQNT3c
Message-ID: <CAH2r5mt97q_jtjtAT0DVDySU0jnk9=KeTDYha-KgOip_CAT_iw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix null-ptr-deref by static initializing global
 lock
To: Yunseong Kim <ysk@kzalloc.com>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Aug 6, 2025 at 8:23=E2=80=AFAM Yunseong Kim <ysk@kzalloc.com> wrote=
:
>
> A kernel panic can be triggered by reading /proc/fs/cifs/debug_dirs.
> The crash is a null-ptr-deref inside spin_lock(), caused by the use of th=
e
> uninitialized global spinlock cifs_tcp_ses_lock.
>
> init_cifs()
>  =E2=94=94=E2=94=80=E2=94=80 cifs_proc_init()
>       =E2=94=94=E2=94=80=E2=94=80 // User can access /proc/fs/cifs/debug_=
dirs here
>            =E2=94=94=E2=94=80=E2=94=80 cifs_debug_dirs_proc_show()
>                 =E2=94=94=E2=94=80=E2=94=80 spin_lock(&cifs_tcp_ses_lock)=
; // Uninitialized!
>
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> Mem abort info:
> ESR =3D 0x0000000096000005
> EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> SET =3D 0, FnV =3D 0
> EA =3D 0, S1PTW =3D 0
> FSC =3D 0x05: level 1 translation fault
> Data abort info:
> ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> [dfff800000000000] address between user and kernel address ranges
> Internal error: Oops: 0000000096000005 [#1] SMP
> Modules linked in:
> CPU: 3 UID: 0 PID: 16435 Comm: stress-ng-procf Not tainted 6.16.0-10385-g=
79f14b5d84c6 #37 PREEMPT
> Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8ubuntu1 06/11/2025
> pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : do_raw_spin_lock+0x84/0x2cc
> lr : _raw_spin_lock+0x24/0x34
> sp : ffff8000966477e0
> x29: ffff800096647860 x28: ffff800096647b88 x27: ffff0001c0c22070
> x26: ffff0003eb2b60c8 x25: ffff0001c0c22018 x24: dfff800000000000
> x23: ffff0000f624e000 x22: ffff0003eb2b6020 x21: ffff0000f624e768
> x20: 0000000000000004 x19: 0000000000000000 x18: 0000000000000000
> x17: 0000000000000000 x16: ffff8000804b9600 x15: ffff700012cc8f04
> x14: 1ffff00012cc8f04 x13: 0000000000000004 x12: ffffffffffffffff
> x11: 1ffff00012cc8f00 x10: ffff80008d9af0d2 x9 : f3f3f304f1f1f1f1
> x8 : 0000000000000000 x7 : 7365733c203e6469 x6 : 20656572743c2023
> x5 : ffff0000e0ce0044 x4 : ffff80008a4deb6e x3 : ffff8000804b9718
> x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
> do_raw_spin_lock+0x84/0x2cc (P)
> _raw_spin_lock+0x24/0x34
> cifs_debug_dirs_proc_show+0x1ac/0x4c0
> seq_read_iter+0x3b0/0xc28
> proc_reg_read_iter+0x178/0x2a8
> vfs_read+0x5f8/0x88c
> ksys_read+0x120/0x210
> __arm64_sys_read+0x7c/0x90
> invoke_syscall+0x98/0x2b8
> el0_svc_common+0x130/0x23c
> do_el0_svc+0x48/0x58
> el0_svc+0x40/0x140
> el0t_64_sync_handler+0x84/0x12c
> el0t_64_sync+0x1ac/0x1b0
> Code: aa0003f3 f9000feb f2fe7e69 f8386969 (38f86908)
> ---[ end trace 0000000000000000 ]---
>
> The root cause is an initialization order problem. The lock is declared
> as a global variable and intended to be initialized during module startup=
.
> However, the procfs entry that uses this lock can be accessed by userspac=
e
> before the spin_lock_init() call has run. This creates a race window wher=
e
> reading the proc file will attempt to use the lock before it is
> initialized, leading to the crash.
>
> For a global lock with a static lifetime, the correct and robust approach
> is to use compile-time initialization.
>
> Fixes: 844e5c0eb176 ("smb3 client: add way to show directory leases for i=
mproved debugging")
> Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> ---
>  fs/smb/client/cifsfs.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 31930b7266db..3bd85ab2deb1 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -77,7 +77,7 @@ unsigned int global_secflags =3D CIFSSEC_DEF;
>  unsigned int GlobalCurrentXid; /* protected by GlobalMid_Lock */
>  unsigned int GlobalTotalActiveXid; /* prot by GlobalMid_Lock */
>  unsigned int GlobalMaxActiveXid;       /* prot by GlobalMid_Lock */
> -spinlock_t GlobalMid_Lock; /* protects above & list operations on midQ e=
ntries */
> +DEFINE_SPINLOCK(GlobalMid_Lock); /* protects above & list operations on =
midQ entries */
>
>  /*
>   *  Global counters, updated atomically
> @@ -97,7 +97,7 @@ atomic_t total_buf_alloc_count;
>  atomic_t total_small_buf_alloc_count;
>  #endif/* STATS2 */
>  struct list_head       cifs_tcp_ses_list;
> -spinlock_t             cifs_tcp_ses_lock;
> +DEFINE_SPINLOCK(cifs_tcp_ses_lock);
>  static const struct super_operations cifs_super_ops;
>  unsigned int CIFSMaxBufSize =3D CIFS_MAX_MSGSIZE;
>  module_param(CIFSMaxBufSize, uint, 0444);
> @@ -1863,8 +1863,6 @@ init_cifs(void)
>         GlobalCurrentXid =3D 0;
>         GlobalTotalActiveXid =3D 0;
>         GlobalMaxActiveXid =3D 0;
> -       spin_lock_init(&cifs_tcp_ses_lock);
> -       spin_lock_init(&GlobalMid_Lock);
>
>         cifs_lock_secret =3D get_random_u32();
>
> --
> 2.50.0
>
>


--=20
Thanks,

Steve

