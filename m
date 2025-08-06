Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6FEB1BE3F
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 03:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Rr6NuTeg7dw2/kHUIC6O4P1nbotXNaEjStftoUWMav4=; b=qe+3u4FFzVlrWfDcPNhJ3qYDG/
	/r9yyCqtyawveq1WK5XbjM/ATTEp8rXkrOIq85FW9K5cS170rNDuWbc33gRIv1uMFIZQhdD0I7llJ
	GpRZ1gFXr2ppnf0HX2vtSHQX1Gpfcd9mlrmaXIdcyD3ngQSqp8U3lISuok8Z7R4D4kU/f5uRxtV0b
	3SF5xDQythMRDOm/ffPusaQr8iU9Kk2Dk3GRJq0sbXfv/9e2gzYs5mS4pyPF6l67VkJkRnrW15KV1
	NQm1pVqNebYlV19Ldwaz9GV9DDtddFMJl8Ap4pmekoeodM5IxbkTXCoeb3ELgUFbc/9OaQDW4DM8N
	rbNVxJAA==;
Received: from ip6-localhost ([::1]:59618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujSrb-00EP65-5Q; Wed, 06 Aug 2025 01:22:43 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:49474) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujSrV-00EP5y-WE
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 01:22:41 +0000
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-4b07275e0a4so30139821cf.3
 for <samba-technical@lists.samba.org>; Tue, 05 Aug 2025 18:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754443356; x=1755048156; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zco5tyUck3BGVt/oKi3ee27TlAHHUHY7O+i0qmj2cCs=;
 b=WT8tXMVD2pHZV2W9xELqLcHGEapOH+7f6JjojOztTEcT4H3OMVvauSKWyv27Sqtuxy
 ns1EClmNPDSjUTZwxpnYMR8uLzmgVIpN8YEFYGdqjWAFI5k+Wbe+yvXcbk5xAAt26kru
 6IolrqpppyUbI52NEfeBX6KHIrNe5Cy9O3jfQSGhZnDFPbGNMM3dv3/uyJj6GnyUF53N
 71pjaQ9Dk79/WoFlsLVpvxiwHE2e7QMdCI+juBwPoSahBnoSI0/PcOXwAk2cnY8L3GBb
 V8B2oq/jQOY8iYzwhEIejf2wAsUJ/oXvHCAKiP80wuWwpbB43rkKlzkkNnHSpgvPj2yh
 7pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754443356; x=1755048156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zco5tyUck3BGVt/oKi3ee27TlAHHUHY7O+i0qmj2cCs=;
 b=kGMEkV2yGYt52ZHwM1Vg3dHMfFf8M2rr69CbrHU9BWpld5MLOhjxBCjcEZSTHZjQ5R
 fBOGciIsukGIuyhvmlYLSuXUoHW0229dq+l8gskG9wtDQqV0InlTsAiiFzRa/NlvQ0e5
 N0FAIo0N1cwi43x2rFhkJXidOhHQMZ7e7K9VC3gltqwJeF2CdKorUm7dsV2/3jlfpTeU
 pdUnaU1rm73JRZXmP68qwl6yKsnqt0p8xU975OVqTCgVAW9SRFXkwgW5ejA3vd8DTGsk
 mlv4EwHkvUebkiMO2NeRpODlxvZT74QM6Ipt+u4wFaD/GJFpm6oLVjsriAbz7ayBeWkC
 Z7NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsT3FbYk1PUPovOd2ff2otH60TPNjqqHIHt8fOwRr7ZCVlrOv1gZ4TbCI7fIE3QPsKFxzR04DWO2VZYDTLPsM=@lists.samba.org
X-Gm-Message-State: AOJu0YzgBxHvjQ7/avH8dO4yP8bGkytAVyE6CrmrUU3aD35Lda9ZSwAY
 nESDPovWYdJnOiwzki9cCPhpEoenDmkXsLjnx34es7XJ5pt0YzO7n6cviCH7YQZWwmaMLzXfmvz
 RfKCmdMr59KKBGw7dd+d4ibSDKG1sARg=
X-Gm-Gg: ASbGncuMCz2SPgq5pbnUCydDI8AKoS/xQBYBIXsRicmI/CRMJPeXHjZKtQU0Yn+VLgU
 cJjQCu0jLNqN8OwkDOHHcmeOy/qqSpn7sl+hknEITusmK+BpkAGJ5r8wh9xzpe4OGA1zyQWxvxk
 Qosgf34Axl2Dwju1T6dOgZ+DiTNl3NrRqdiyAURXeH2v5COYm6VkKOBfCjChmHcQLgmQYZ0QlCy
 BwAp5Ak+iyY/GUk69gQO72r8do15AmXZf994Vri
X-Google-Smtp-Source: AGHT+IENoLdt645Po9MYQ29jPv/XvMJFeUHnPew/0VeuyNlio+Kq7jZQJCrYWlrCCeaPk6hRptmL+pD+s/Sf4OccWLM=
X-Received: by 2002:a05:622a:2618:b0:4b0:77e4:bd with SMTP id
 d75a77b69052e-4b091619b5fmr14460421cf.57.1754443355826; Tue, 05 Aug 2025
 18:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250805064708.332465-1-wangzhaolong@huaweicloud.com>
 <CAH2r5mssz19Qr+fmY62BnHOzwjQmWWU=wHXEVFkyTRGaWn-t0g@mail.gmail.com>
 <c980644d-0be1-4a88-890d-349b44ada024@huaweicloud.com>
In-Reply-To: <c980644d-0be1-4a88-890d-349b44ada024@huaweicloud.com>
Date: Tue, 5 Aug 2025 20:22:23 -0500
X-Gm-Features: Ac12FXwQNsxTefxEoCYx4gfglZMs0hL39KYLF_gtFCMrMoa7vGLo7kRzfMK5RJg
Message-ID: <CAH2r5mt2p6V_=BGGVeVMNmFWvaJ+sxodFxjr_ZDsDkXqtA9nGg@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] Fix mid_q_entry memory leaks in SMB client
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: CIFS <linux-cifs@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>,
 Enzo Matsumiya <ematsumiya@suse.de>, yangerkun <yangerkun@huawei.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, chengzhihao1@huawei.com,
 Pavel Shilovskiy <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Those links are visible to anyone but the server which hosts it will
sometimes auto shutdown depending on load in the region so is sometimes
down for a few hours

Thanks,

Steve

On Tue, Aug 5, 2025, 7:55=E2=80=AFPM Wang Zhaolong <wangzhaolong@huaweiclou=
d.com>
wrote:

>
>
>
>
> > The first three patches (cleanup) look fine and have added to
> > cifs-2.6.git for-next (also added Enzo Acked-by) but the fourth patch
> > ("smb: client: fix mid_q_entry memleak leak with per-mid locking")
> > causes xfstest generic/001 to fail with signing enabled.  See
> >
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
5/builds/58/steps/34/logs/stdio
> > and
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
5/builds/59/steps/34/logs/stdio
> >
>
> I am unable to view any information in the link above. Is this informatio=
n
> only visible to logged-in users?
>
>
> >
> > [Tue Aug 5 11:03:32 2025] run fstests generic/001 at 2025-08-05 11:03:3=
2
> > [Tue Aug 5 11:03:33 2025] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [Tue Aug 5 11:03:33 2025] [ BUG: Invalid wait context ]
> > [Tue Aug 5 11:03:33 2025] 6.16.0 #1 Tainted: G E
> > [Tue Aug 5 11:03:33 2025] -----------------------------
> > [Tue Aug 5 11:03:33 2025] cifsd/24912 is trying to lock:
> > [Tue Aug 5 11:03:33 2025] ffffffffafc14630
> > (crypto_alg_sem){++++}-{4:4}, at: crypto_alg_lookup+0x40/0x120
> > [Tue Aug 5 11:03:33 2025] other info that might help us debug this:
> > [Tue Aug 5 11:03:33 2025] context-{5:5}
> > [Tue Aug 5 11:03:33 2025] 1 lock held by cifsd/24912:
> > [Tue Aug 5 11:03:33 2025] #0: ff11000134c25870
> > (&temp->mid_lock){+.+.}-{3:3}, at: mid_execute_callback+0x19/0x40
> > [cifs]
> > [Tue Aug 5 11:03:33 2025] stack backtrace:
> > [Tue Aug 5 11:03:33 2025] CPU: 1 UID: 0 PID: 24912 Comm: cifsd
> > Tainted: G E 6.16.0 #1 PREEMPT(voluntary)
> > [Tue Aug 5 11:03:33 2025] Tainted: [E]=3DUNSIGNED_MODULE
> > [Tue Aug 5 11:03:33 2025] Hardware name: Red Hat KVM, BIOS
> > 1.16.3-4.el9 04/01/2014
> > [Tue Aug 5 11:03:33 2025] Call Trace:
> > [Tue Aug 5 11:03:33 2025] <TASK>
> > [Tue Aug 5 11:03:33 2025] dump_stack_lvl+0x79/0xb0
> > [Tue Aug 5 11:03:33 2025] __lock_acquire+0xace/0x21c0
> > [Tue Aug 5 11:03:33 2025] ? check_irq_usage+0xa4/0xa80
> > [Tue Aug 5 11:03:33 2025] lock_acquire+0x143/0x2d0
> > [Tue Aug 5 11:03:33 2025] ? crypto_alg_lookup+0x40/0x120
> > [Tue Aug 5 11:03:33 2025] ? check_noncircular+0x71/0x120
> > [Tue Aug 5 11:03:33 2025] down_read+0x7c/0x2e0
> > [Tue Aug 5 11:03:33 2025] ? crypto_alg_lookup+0x40/0x120
> > [Tue Aug 5 11:03:33 2025] ? __pfx_down_read+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ? lockdep_unlock+0x51/0xc0
> > [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x11ee/0x21c0
> > [Tue Aug 5 11:03:33 2025] crypto_alg_lookup+0x40/0x120
> > [Tue Aug 5 11:03:33 2025] crypto_alg_mod_lookup+0x53/0x2b0
> > [Tue Aug 5 11:03:33 2025] crypto_alloc_tfm_node+0x76/0x130
> > [Tue Aug 5 11:03:33 2025] cifs_alloc_hash+0x44/0x130 [cifs]
> > [Tue Aug 5 11:03:33 2025] smb3_calc_signature+0x4f0/0x7b0 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __pfx_smb3_calc_signature+0x10/0x10 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? find_held_lock+0x2b/0x80
> > [Tue Aug 5 11:03:33 2025] ? tcp_recvmsg+0xc9/0x2d0
> > [Tue Aug 5 11:03:33 2025] ? rcu_is_watching+0x20/0x50
> > [Tue Aug 5 11:03:33 2025] ? trace_irq_enable.constprop.0+0xac/0xe0
> > [Tue Aug 5 11:03:33 2025] ? tcp_recvmsg+0xc9/0x2d0
> > [Tue Aug 5 11:03:33 2025] ? __local_bh_enable_ip+0x90/0xf0
> > [Tue Aug 5 11:03:33 2025] ? sock_has_perm+0x97/0x1a0
> > [Tue Aug 5 11:03:33 2025] smb2_verify_signature+0x178/0x290 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_verify_signature+0x10/0x10 [cifs=
]
> > [Tue Aug 5 11:03:33 2025] ? look_up_lock_class+0x5d/0x140
> > [Tue Aug 5 11:03:33 2025] smb2_check_receive+0x154/0x1c0 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_check_receive+0x10/0x10 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x3f1/0x21c0
> > [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x3f1/0x21c0
> > [Tue Aug 5 11:03:33 2025] smb2_writev_callback+0x1f2/0x870 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? lock_acquire+0x143/0x2d0
> > [Tue Aug 5 11:03:33 2025] ? mid_execute_callback+0x19/0x40 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_writev_callback+0x10/0x10 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? do_raw_spin_lock+0x10c/0x190
> > [Tue Aug 5 11:03:33 2025] ? __pfx_do_raw_spin_lock+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ? _raw_spin_unlock+0x23/0x40
> > [Tue Aug 5 11:03:33 2025] mid_execute_callback+0x33/0x40 [cifs]
> > [Tue Aug 5 11:03:33 2025] cifs_demultiplex_thread+0xc95/0x15e0 [cifs]
> > [Tue Aug 5 11:03:33 2025] ? __pfx_cifs_demultiplex_thread+0x10/0x10
> [cifs]
> > [Tue Aug 5 11:03:33 2025] ? find_held_lock+0x2b/0x80
> > [Tue Aug 5 11:03:33 2025] ? __kthread_parkme+0x4b/0xd0
> > [Tue Aug 5 11:03:33 2025] ? __pfx_cifs_demultiplex_thread+0x10/0x10
> [cifs]
> > [Tue Aug 5 11:03:33 2025] kthread+0x216/0x3e0
> > [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ? lock_release+0xc4/0x270
> > [Tue Aug 5 11:03:33 2025] ? rcu_is_watching+0x20/0x50
> > [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ret_from_fork+0x23a/0x2e0
> > [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> > [Tue Aug 5 11:03:33 2025] ret_from_fork_asm+0x1a/0x30
> > [Tue Aug 5 11:03:33 2025] </TASK>
> >
> > (it worked without the patch see e.g.
> >
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
5/builds/60
> > and
> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/=
5/builds/56
> )
> >
> > On Tue, Aug 5, 2025 at 1:54=E2=80=AFAM Wang Zhaolong
> > <wangzhaolong@huaweicloud.com> wrote:
>
>
> It's quite strange that the lock reported in the stack trace is an intern=
al
> lock of the crypto module, which only protects the internal logic of
> crypto.
> Moreover, I have not yet found a path where the callback for cifs
> registration
> is executed within the scope of this lock.
>
> ```c
> // crypto/api.c
> static struct crypto_alg *crypto_alg_lookup(const char *name, u32 type,
>                                             u32 mask)
> {
>         const u32 fips =3D CRYPTO_ALG_FIPS_INTERNAL;
>         struct crypto_alg *alg;
>         u32 test =3D 0;
>
>         if (!((type | mask) & CRYPTO_ALG_TESTED))
>                 test |=3D CRYPTO_ALG_TESTED;
>
>         down_read(&crypto_alg_sem);
>         ...
>         up_read(&crypto_alg_sem);
>         return alg;
> ```
> More information is needed to confirm this issue. Could you please provid=
e
> it?
>
> Best regards,
> Wang Zhaolong
>
>
