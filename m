Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6F1B1D26F
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 08:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3ktbyr9SzycNcU3hnEzNp337kzitNq3svuSJ+tfB4O4=; b=QBxMzCHHw7tgjSWWoHJBOVGglo
	ff1z7lMh6RVcpRKWNFkwsip47N72Y3Cd5eHhZn6KZzkiKSsfSUlPbKOVZVH0Vd3JiAYHmjx6qZSv8
	/7tpxbyogPYo8w9Q07zPLv5E/Cuuu9gWvtW5cNTsJv4aU7e7Tey/Wn/yj7C4KlGgeEoTm75xJhsFQ
	CWykPK9NdGZc/LMuz3ucTDwg8/ITQhcis5gs0/LjZ7IffGxry4USheX5V9Fn4EiMv9Ihf/O8yhzGq
	zPeYS8E/SrnQ0KwRGAEkztlDkBTexX3JhkY1rDcLQUazFBveG96fLlqHcqxJ+2e6nhtAC4wXqNH8p
	MxXpevLg==;
Received: from ip6-localhost ([::1]:38730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uju10-00EUne-Ih; Thu, 07 Aug 2025 06:22:14 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:54456) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uju0u-00EUnX-Mq
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 06:22:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6155e75a9acso1061198a12.0
 for <samba-technical@lists.samba.org>; Wed, 06 Aug 2025 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754547727; x=1755152527; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ktbyr9SzycNcU3hnEzNp337kzitNq3svuSJ+tfB4O4=;
 b=GiIJ6nQF8MUzJa7Cwa17q3itVKA/KazVxvjCPrYudbfANrukHBdP6mxvd1DstbixCx
 5Q8NzbTwlWYVeP2oLwPDrvJxI2abYOw6XBs78Pta7DEfaFZ6I0svgN0qCUvRNuA/xKz6
 w/i/iDguzBsghI8TXXha6UJCoDAL9BvYR0SUAoDprhnqErw8t3ohBZYAIZ5OiJbDTZv7
 prY6DMQLC5Yi/TPosOvGyJGaVMVrX1ayqvEaCZgoaWR8KICfu6HOHugeZxfOOU7fxKGb
 4uydD3OSYC2/s23xFyx/cKhvA1DEMoTotr0b8ur9e5e0lzqLCWyf8mX9HfOaj0ZD7VCk
 Hnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754547727; x=1755152527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ktbyr9SzycNcU3hnEzNp337kzitNq3svuSJ+tfB4O4=;
 b=grho8AgQH2GZiBybV9FnrxRrH/TURt8wXBD1VMpDq22kSC3d8aE+QT3wVmCBgcaIN4
 oHZb+mIEjrtZdGqDEy7Dw0TU2UKOAYff52jE4QThYcgBqHfYkB42zfSmr4FatO0pnqMA
 pPmuacNL/emU9ik5280BVb37OfJruON8mtiTDqlzzTa67534k2vAQ0zdCEBD8swZncVD
 VcwfKUp1uKJSRyg8iUzPhnYwqceTfwQ4olmpPoHnIgGZpFoxSGva6XMps4Z30vJr1BFS
 3VJSpErxtS0EMaWU46QW14Py6WEEbS3XZe8WED8jx4dmjmjw6fTKZa89h2ps8cWtXGzA
 +PgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMLOwSYr7idPIXpr29PuHD39KNg+GcC5sZE1xrVihlS1ikdzqP5Ryx0aAYPG4xAKq3JpCIEGx8jolH2FQycuU=@lists.samba.org
X-Gm-Message-State: AOJu0YyqeiS6ArZvgpZ9ES5aYeDmgeaywFEMF7+4kyckLDnxKO1I61+e
 a25keCBa0xoYBtfOArLoGuIBkVjuQAsSfDDKKxo11EMF5eOx9mEQNLjNrKysfvqOPjAqOb981MI
 r0pYomPXlVwMmjfR935Up+GAgBNpicXN3mw==
X-Gm-Gg: ASbGncu/MH3WEDGhDnZEOcxphS+USmQQ9JyZicv11BCTgJbOglmrCOneO/hRsqleELe
 xVJWkHmpHfiNZGM2J3kuy8Ot6AjYabMmrxls9grLnVrUyDh2s2m+7mVjLD6xlGAPFpaeL/z0e5f
 zXCxUkvyDr1CZCRuC+hBr/pHCV9KGtYyTBxxpkdUIdQchPn6gyPA5+jyfwzKTiwpEitWrqlI4e+
 9ZhqA==
X-Google-Smtp-Source: AGHT+IGtyMCANSoiLMOF/IIteuE7iwefk4ZGp11or1k1vGqtVJL/BQwhSDgSaVpXdy8jhiEdCUzZxU9t5Mg5Ti4BG0s=
X-Received: by 2002:a05:6402:5106:b0:615:80eb:76ba with SMTP id
 4fb4d7f45d1cf-61796141a85mr4669366a12.17.1754547727161; Wed, 06 Aug 2025
 23:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250806132211.94686-2-ysk@kzalloc.com>
 <CAH2r5mt97q_jtjtAT0DVDySU0jnk9=KeTDYha-KgOip_CAT_iw@mail.gmail.com>
In-Reply-To: <CAH2r5mt97q_jtjtAT0DVDySU0jnk9=KeTDYha-KgOip_CAT_iw@mail.gmail.com>
Date: Thu, 7 Aug 2025 11:51:55 +0530
X-Gm-Features: Ac12FXwD7pQ3n-0mANzi1TD_ZDrU4JcAARE48kDt7Tfj-YuFN3HIKcB-7hMpqHE
Message-ID: <CANT5p=qiuF0=PZaN9eCzrps=azamWjkh9U19zu2B5dRADUrP1g@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix null-ptr-deref by static initializing global
 lock
To: Steve French <smfrench@gmail.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Yunseong Kim <ysk@kzalloc.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 7, 2025 at 1:44=E2=80=AFAM Steve French <smfrench@gmail.com> wr=
ote:
>
> merged into cifs-2.6.git for-next
>
> On Wed, Aug 6, 2025 at 8:23=E2=80=AFAM Yunseong Kim <ysk@kzalloc.com> wro=
te:
> >
> > A kernel panic can be triggered by reading /proc/fs/cifs/debug_dirs.
> > The crash is a null-ptr-deref inside spin_lock(), caused by the use of =
the
> > uninitialized global spinlock cifs_tcp_ses_lock.
> >
> > init_cifs()
> >  =E2=94=94=E2=94=80=E2=94=80 cifs_proc_init()
> >       =E2=94=94=E2=94=80=E2=94=80 // User can access /proc/fs/cifs/debu=
g_dirs here
> >            =E2=94=94=E2=94=80=E2=94=80 cifs_debug_dirs_proc_show()
> >                 =E2=94=94=E2=94=80=E2=94=80 spin_lock(&cifs_tcp_ses_loc=
k); // Uninitialized!
> >
> > KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> > Mem abort info:
> > ESR =3D 0x0000000096000005
> > EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > SET =3D 0, FnV =3D 0
> > EA =3D 0, S1PTW =3D 0
> > FSC =3D 0x05: level 1 translation fault
> > Data abort info:
> > ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
> > CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> > GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
> > [dfff800000000000] address between user and kernel address ranges
> > Internal error: Oops: 0000000096000005 [#1] SMP
> > Modules linked in:
> > CPU: 3 UID: 0 PID: 16435 Comm: stress-ng-procf Not tainted 6.16.0-10385=
-g79f14b5d84c6 #37 PREEMPT
> > Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8ubuntu1 06/11/20=
25
> > pstate: 23400005 (nzCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> > pc : do_raw_spin_lock+0x84/0x2cc
> > lr : _raw_spin_lock+0x24/0x34
> > sp : ffff8000966477e0
> > x29: ffff800096647860 x28: ffff800096647b88 x27: ffff0001c0c22070
> > x26: ffff0003eb2b60c8 x25: ffff0001c0c22018 x24: dfff800000000000
> > x23: ffff0000f624e000 x22: ffff0003eb2b6020 x21: ffff0000f624e768
> > x20: 0000000000000004 x19: 0000000000000000 x18: 0000000000000000
> > x17: 0000000000000000 x16: ffff8000804b9600 x15: ffff700012cc8f04
> > x14: 1ffff00012cc8f04 x13: 0000000000000004 x12: ffffffffffffffff
> > x11: 1ffff00012cc8f00 x10: ffff80008d9af0d2 x9 : f3f3f304f1f1f1f1
> > x8 : 0000000000000000 x7 : 7365733c203e6469 x6 : 20656572743c2023
> > x5 : ffff0000e0ce0044 x4 : ffff80008a4deb6e x3 : ffff8000804b9718
> > x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
> > Call trace:
> > do_raw_spin_lock+0x84/0x2cc (P)
> > _raw_spin_lock+0x24/0x34
> > cifs_debug_dirs_proc_show+0x1ac/0x4c0
> > seq_read_iter+0x3b0/0xc28
> > proc_reg_read_iter+0x178/0x2a8
> > vfs_read+0x5f8/0x88c
> > ksys_read+0x120/0x210
> > __arm64_sys_read+0x7c/0x90
> > invoke_syscall+0x98/0x2b8
> > el0_svc_common+0x130/0x23c
> > do_el0_svc+0x48/0x58
> > el0_svc+0x40/0x140
> > el0t_64_sync_handler+0x84/0x12c
> > el0t_64_sync+0x1ac/0x1b0
> > Code: aa0003f3 f9000feb f2fe7e69 f8386969 (38f86908)
> > ---[ end trace 0000000000000000 ]---
> >
> > The root cause is an initialization order problem. The lock is declared
> > as a global variable and intended to be initialized during module start=
up.
> > However, the procfs entry that uses this lock can be accessed by usersp=
ace
> > before the spin_lock_init() call has run. This creates a race window wh=
ere
> > reading the proc file will attempt to use the lock before it is
> > initialized, leading to the crash.
> >
> > For a global lock with a static lifetime, the correct and robust approa=
ch
> > is to use compile-time initialization.
> >
> > Fixes: 844e5c0eb176 ("smb3 client: add way to show directory leases for=
 improved debugging")
> > Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
> > ---
> >  fs/smb/client/cifsfs.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> > index 31930b7266db..3bd85ab2deb1 100644
> > --- a/fs/smb/client/cifsfs.c
> > +++ b/fs/smb/client/cifsfs.c
> > @@ -77,7 +77,7 @@ unsigned int global_secflags =3D CIFSSEC_DEF;
> >  unsigned int GlobalCurrentXid; /* protected by GlobalMid_Lock */
> >  unsigned int GlobalTotalActiveXid; /* prot by GlobalMid_Lock */
> >  unsigned int GlobalMaxActiveXid;       /* prot by GlobalMid_Lock */
> > -spinlock_t GlobalMid_Lock; /* protects above & list operations on midQ=
 entries */
> > +DEFINE_SPINLOCK(GlobalMid_Lock); /* protects above & list operations o=
n midQ entries */
> >
> >  /*
> >   *  Global counters, updated atomically
> > @@ -97,7 +97,7 @@ atomic_t total_buf_alloc_count;
> >  atomic_t total_small_buf_alloc_count;
> >  #endif/* STATS2 */
> >  struct list_head       cifs_tcp_ses_list;
> > -spinlock_t             cifs_tcp_ses_lock;
> > +DEFINE_SPINLOCK(cifs_tcp_ses_lock);
> >  static const struct super_operations cifs_super_ops;
> >  unsigned int CIFSMaxBufSize =3D CIFS_MAX_MSGSIZE;
> >  module_param(CIFSMaxBufSize, uint, 0444);
> > @@ -1863,8 +1863,6 @@ init_cifs(void)
> >         GlobalCurrentXid =3D 0;
> >         GlobalTotalActiveXid =3D 0;
> >         GlobalMaxActiveXid =3D 0;
> > -       spin_lock_init(&cifs_tcp_ses_lock);
> > -       spin_lock_init(&GlobalMid_Lock);
> >
> >         cifs_lock_secret =3D get_random_u32();
> >
> > --
> > 2.50.0
> >
> >
>
>
> --
> Thanks,
>
> Steve
>

Good catch.
But the problem is that cifs_proc_init gets called very early on in init_ci=
fs.
That call should be moved to just before (or possibly after)
registering the filesystem.

--=20
Regards,
Shyam

