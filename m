Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EAB1DB3B
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VwQu0/D6m0UDV0CRsFb/BkiCr1jp/Q0C0jJDQue2He4=; b=Wd56gHfvhFbTmK5mMHBOuCT2fY
	9USJQkbQXvnTPGDeQK4A/R1DV9njtUVEzqdwmyjmPoS2uxBytofYV2FtE1LoLirrDrFOdd2timmSa
	NdErIV+jNY4HbpsQtydGdwN8oapVU6Nf7ThE68MTuUaBajUjme21PLTEDB5U/tP9XjjanjpSnkhbw
	bX64OiA4pSanSF/F+vn+G0KXGGJwVVAYXA4MFFizytCkPymvANSlSmesxHbPefzTTLsjGWdV17L/o
	GVRbElcJ1QcNEe6y66CzgXnkN+FJjV87SdNKLQGkWRW1vD7b8gigEKdmRsbBvkD8vBE07s3fN60x9
	8ylSCL2w==;
Received: from ip6-localhost ([::1]:25116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk34v-00EZOW-Pz; Thu, 07 Aug 2025 16:02:53 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:55345) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk34r-00EZOP-5Y
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:02:51 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-70927868edeso15779676d6.2
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754582567; x=1755187367; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwQu0/D6m0UDV0CRsFb/BkiCr1jp/Q0C0jJDQue2He4=;
 b=jhVDoA28mI0LGhZDq/74Dae/oPC0QE4x8SvbG5KDZpgAMAxagSpYd5OxYmiUaEIOph
 bN8PLSbUQQz+AFCA0UIqv9VcwtYQBqRoT3U2YEtHB+zJfVqFroGV1Hp7FNYvb6fISeq4
 GnnSwROEkvz3eKpgPZiRaos5zvLeuvdLx8gUQ9BvczPtrscqntqRI2N83xJiA6w6/DEa
 X/XIzo5URJIRjD5egeo78xjO94DvloSDwtT083LRjhPDzhD9LBtzDzxt5fzmx77LZz7D
 un0ojShpWzYIGb2VqtjfMRRIYuYAYBgEhIc4Qt4+5VnzY77VuEdSTwKdhFn5iMv5uhF8
 /nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754582567; x=1755187367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwQu0/D6m0UDV0CRsFb/BkiCr1jp/Q0C0jJDQue2He4=;
 b=Yp+w1LsG6cWOG94iB9MbndoKKxUy6a1JO5zWglJsHMXobbc1lMDD797XfW7amlqOyw
 3gnulqfVemG0H6QraVUbrmpyNFDaay62QWKDTINhIyQ43ri+rJDbEXYmVUhzaMFcYVK4
 rd8HrLhuulKb+qR68t3atpAaZoTgj9XcQsnKu1nxuw6/0VBMJxZjBuvafFnJg7e+6gL5
 nkIEVKa49a2HkiAyIAtypbX7VkYY20fyu+N7PKZBv1LFU2AU1W4ObT2k3zB8K8yitj5I
 YAI8Gi+8QatLTCkIMjG4FKGpm1I8kIaAGndiLz380yt3wLYo/xlqMJSAedt+q1vsJn+b
 +rkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4+R2yqbfIuI9MEW34SuMMIaQ3oegwCmBHJ8vQxaA8m4w7h8xU/2rhxiYM7gq/s+cF9+4S9nd9VQ2Ur0TuenY=@lists.samba.org
X-Gm-Message-State: AOJu0YxckCEP+kqnSGK88L4BHkxv8V4xVaMs7L1azuEzR4YfH97bpVAo
 R2nvYr7BbsBsnDUkQ7HWYCRyUJKQEnm/Xd9xDB4J45Z6IRmcr9ogWWinSBIZO7kO0q7IVW4nHIB
 pFAG61QP+AxTH8W89/7wRcuE40XJa4KhIWQ==
X-Gm-Gg: ASbGncvAT7w3CkaJaMySmRas3zp3lRi32CqliBPOTbovwv3SMzNRzp3X7MbvYeJ84DF
 3VsOZOEO48XKFlyWstQ3UBk8t7Sn4tCBWy6pHqJ7wUbhKaPeOTyxtQpcHiJ2IAsTyJeY+qawrjC
 sl15n5mC6OFtW7o/04P3kb7Bi6kfb3XRzWxjb1e9hoc9fLmx2FNHrPY+jam1DC81DA4JcY86gjO
 bgfME/jc+qP//GJ/uOF+UfE3YMWC5dUTxJ2LzkZ
X-Google-Smtp-Source: AGHT+IF+K0U+t1yOJyyd8NnabYBte1Vl/Rersze3x6tcq6Dn8dX1IwJe4XtuPvkzTFkOyVP3t5iNtMP46HlViETvYIo=
X-Received: by 2002:a05:6214:1bca:b0:707:51a6:184f with SMTP id
 6a1803df08f44-70979667ddfmr96617956d6.48.1754582566397; Thu, 07 Aug 2025
 09:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250805064708.332465-1-wangzhaolong@huaweicloud.com>
 <CAH2r5mssz19Qr+fmY62BnHOzwjQmWWU=wHXEVFkyTRGaWn-t0g@mail.gmail.com>
 <c980644d-0be1-4a88-890d-349b44ada024@huaweicloud.com>
 <a07e0802-da13-4ae4-b932-1560eb33129d@huaweicloud.com>
In-Reply-To: <a07e0802-da13-4ae4-b932-1560eb33129d@huaweicloud.com>
Date: Thu, 7 Aug 2025 11:02:34 -0500
X-Gm-Features: Ac12FXwKUV-u-5TqbsZUSsx8Dcq6IW6izVNh1jlCsw7YTuA85-TRG_qYWhPQqUI
Message-ID: <CAH2r5mtdCb501g=rehRRwcYnGiWOZjmKX16c+Vd1EYOsfeC3Pw@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] Fix mid_q_entry memory leaks in SMB client
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com,
 Enzo Matsumiya <ematsumiya@suse.de>, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 chengzhihao1@huawei.com, pshilov@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

presumably the first three cleanup are ok - but if objections let me know

On Thu, Aug 7, 2025 at 9:43=E2=80=AFAM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
>
> Sorry for the delayed response. I can see exactly what went wrong now.
>
> The issue is that my implementation holds a spinlock (mid_lock) while
> executing the callback, but the callback path can eventually lead to
> crypto_alg_lookup() which tries to acquire a semaphore. This violates
> the kernel's locking rules - we cannot sleep while holding a spinlock.
>
> Perhaps I should consider a more ingenious solution that can safely
> handle these cross-subsystem interactions.
>
> I'll rework the patch to fix this locking issue and send a v3. I'll
> probably need to rethink the whole locking strategy to be more aware
> of what the callbacks actually do and what they might need to sleep for.
>
> Best regards,
> Wang Zhaolong
>
>
> >
> >> The first three patches (cleanup) look fine and have added to
> >> cifs-2.6.git for-next (also added Enzo Acked-by) but the fourth patch
> >> ("smb: client: fix mid_q_entry memleak leak with per-mid locking")
> >> causes xfstest generic/001 to fail with signing enabled.  See
> >> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builde=
rs/5/builds/58/steps/34/logs/stdio
> >> and http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/bu=
ilders/5/builds/59/steps/34/logs/stdio
> >>
> >
> > I am unable to view any information in the link above. Is this informat=
ion
> > only visible to logged-in users?
> >
> >
> >>
> >> [Tue Aug 5 11:03:32 2025] run fstests generic/001 at 2025-08-05 11:03:=
32
> >> [Tue Aug 5 11:03:33 2025] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> [Tue Aug 5 11:03:33 2025] [ BUG: Invalid wait context ]
> >> [Tue Aug 5 11:03:33 2025] 6.16.0 #1 Tainted: G E
> >> [Tue Aug 5 11:03:33 2025] -----------------------------
> >> [Tue Aug 5 11:03:33 2025] cifsd/24912 is trying to lock:
> >> [Tue Aug 5 11:03:33 2025] ffffffffafc14630
> >> (crypto_alg_sem){++++}-{4:4}, at: crypto_alg_lookup+0x40/0x120
> >> [Tue Aug 5 11:03:33 2025] other info that might help us debug this:
> >> [Tue Aug 5 11:03:33 2025] context-{5:5}
> >> [Tue Aug 5 11:03:33 2025] 1 lock held by cifsd/24912:
> >> [Tue Aug 5 11:03:33 2025] #0: ff11000134c25870
> >> (&temp->mid_lock){+.+.}-{3:3}, at: mid_execute_callback+0x19/0x40
> >> [cifs]
> >> [Tue Aug 5 11:03:33 2025] stack backtrace:
> >> [Tue Aug 5 11:03:33 2025] CPU: 1 UID: 0 PID: 24912 Comm: cifsd
> >> Tainted: G E 6.16.0 #1 PREEMPT(voluntary)
> >> [Tue Aug 5 11:03:33 2025] Tainted: [E]=3DUNSIGNED_MODULE
> >> [Tue Aug 5 11:03:33 2025] Hardware name: Red Hat KVM, BIOS
> >> 1.16.3-4.el9 04/01/2014
> >> [Tue Aug 5 11:03:33 2025] Call Trace:
> >> [Tue Aug 5 11:03:33 2025] <TASK>
> >> [Tue Aug 5 11:03:33 2025] dump_stack_lvl+0x79/0xb0
> >> [Tue Aug 5 11:03:33 2025] __lock_acquire+0xace/0x21c0
> >> [Tue Aug 5 11:03:33 2025] ? check_irq_usage+0xa4/0xa80
> >> [Tue Aug 5 11:03:33 2025] lock_acquire+0x143/0x2d0
> >> [Tue Aug 5 11:03:33 2025] ? crypto_alg_lookup+0x40/0x120
> >> [Tue Aug 5 11:03:33 2025] ? check_noncircular+0x71/0x120
> >> [Tue Aug 5 11:03:33 2025] down_read+0x7c/0x2e0
> >> [Tue Aug 5 11:03:33 2025] ? crypto_alg_lookup+0x40/0x120
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_down_read+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ? lockdep_unlock+0x51/0xc0
> >> [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x11ee/0x21c0
> >> [Tue Aug 5 11:03:33 2025] crypto_alg_lookup+0x40/0x120
> >> [Tue Aug 5 11:03:33 2025] crypto_alg_mod_lookup+0x53/0x2b0
> >> [Tue Aug 5 11:03:33 2025] crypto_alloc_tfm_node+0x76/0x130
> >> [Tue Aug 5 11:03:33 2025] cifs_alloc_hash+0x44/0x130 [cifs]
> >> [Tue Aug 5 11:03:33 2025] smb3_calc_signature+0x4f0/0x7b0 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_smb3_calc_signature+0x10/0x10 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? find_held_lock+0x2b/0x80
> >> [Tue Aug 5 11:03:33 2025] ? tcp_recvmsg+0xc9/0x2d0
> >> [Tue Aug 5 11:03:33 2025] ? rcu_is_watching+0x20/0x50
> >> [Tue Aug 5 11:03:33 2025] ? trace_irq_enable.constprop.0+0xac/0xe0
> >> [Tue Aug 5 11:03:33 2025] ? tcp_recvmsg+0xc9/0x2d0
> >> [Tue Aug 5 11:03:33 2025] ? __local_bh_enable_ip+0x90/0xf0
> >> [Tue Aug 5 11:03:33 2025] ? sock_has_perm+0x97/0x1a0
> >> [Tue Aug 5 11:03:33 2025] smb2_verify_signature+0x178/0x290 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_verify_signature+0x10/0x10 [cif=
s]
> >> [Tue Aug 5 11:03:33 2025] ? look_up_lock_class+0x5d/0x140
> >> [Tue Aug 5 11:03:33 2025] smb2_check_receive+0x154/0x1c0 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_check_receive+0x10/0x10 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x3f1/0x21c0
> >> [Tue Aug 5 11:03:33 2025] ? __lock_acquire+0x3f1/0x21c0
> >> [Tue Aug 5 11:03:33 2025] smb2_writev_callback+0x1f2/0x870 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? lock_acquire+0x143/0x2d0
> >> [Tue Aug 5 11:03:33 2025] ? mid_execute_callback+0x19/0x40 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_smb2_writev_callback+0x10/0x10 [cifs=
]
> >> [Tue Aug 5 11:03:33 2025] ? do_raw_spin_lock+0x10c/0x190
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_do_raw_spin_lock+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ? _raw_spin_unlock+0x23/0x40
> >> [Tue Aug 5 11:03:33 2025] mid_execute_callback+0x33/0x40 [cifs]
> >> [Tue Aug 5 11:03:33 2025] cifs_demultiplex_thread+0xc95/0x15e0 [cifs]
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_cifs_demultiplex_thread+0x10/0x10 [c=
ifs]
> >> [Tue Aug 5 11:03:33 2025] ? find_held_lock+0x2b/0x80
> >> [Tue Aug 5 11:03:33 2025] ? __kthread_parkme+0x4b/0xd0
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_cifs_demultiplex_thread+0x10/0x10 [c=
ifs]
> >> [Tue Aug 5 11:03:33 2025] kthread+0x216/0x3e0
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ? lock_release+0xc4/0x270
> >> [Tue Aug 5 11:03:33 2025] ? rcu_is_watching+0x20/0x50
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ret_from_fork+0x23a/0x2e0
> >> [Tue Aug 5 11:03:33 2025] ? __pfx_kthread+0x10/0x10
> >> [Tue Aug 5 11:03:33 2025] ret_from_fork_asm+0x1a/0x30
> >> [Tue Aug 5 11:03:33 2025] </TASK>
> >>
> >> (it worked without the patch see e.g.
> >> http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builde=
rs/5/builds/60
> >> and http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/bu=
ilders/5/builds/56)
> >>
> >> On Tue, Aug 5, 2025 at 1:54=E2=80=AFAM Wang Zhaolong
> >> <wangzhaolong@huaweicloud.com> wrote:
> >
> >
> > It's quite strange that the lock reported in the stack trace is an inte=
rnal
> > lock of the crypto module, which only protects the internal logic of cr=
ypto.
> > Moreover, I have not yet found a path where the callback for cifs regis=
tration
> > is executed within the scope of this lock.
> >
> > ```c
> > // crypto/api.c
> > static struct crypto_alg *crypto_alg_lookup(const char *name, u32 type,
> >                          u32 mask)
> > {
> >      const u32 fips =3D CRYPTO_ALG_FIPS_INTERNAL;
> >      struct crypto_alg *alg;
> >      u32 test =3D 0;
> >
> >      if (!((type | mask) & CRYPTO_ALG_TESTED))
> >          test |=3D CRYPTO_ALG_TESTED;
> >
> >      down_read(&crypto_alg_sem);
> >      ...
> >      up_read(&crypto_alg_sem);
> >      return alg;
> > ```
> > More information is needed to confirm this issue. Could you please prov=
ide it?
> >
> > Best regards,
> > Wang Zhaolong
> >
>
>
>
>


--=20
Thanks,

Steve

