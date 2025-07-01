Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D486AF0133
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jul 2025 19:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QTazUoyxInDAJ2NwZxhqJI5YRJsIYXcAsvJl7/gp0ws=; b=3WM4y9K+TEOq7fxtR23NLJ4cQN
	VYF1Z9pY0eRjoAEazZH+voN0utNg9FwxZcO4k8WO23oWkekVmGGXNtBcao5iKRjiC7wTkh+FrxqTU
	vwEJawURZtW4TRhX+sqeLVjOBbAfOZK7EdJCYgmrBLpEZC9hVMEOJxa1cqqsFkAyO+q4Egdr6ZMkp
	UswqEfDKTWWHg/bkizNlA+teYVcRt/6l2adYp/+NQrAsW/e8FPXU4M+uHB4z1tRhBwA+0TRF8m0rf
	c4mVVptThIDFqTL/BekSF5iD+pIrXZUTlccH0y7htdtCkNNHVELNAtNafZVZTt862mwyAPjdTbgPl
	Q5x8g7gg==;
Received: from ip6-localhost ([::1]:54562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWeS8-00ABi8-G2; Tue, 01 Jul 2025 17:07:28 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:46203) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWeS3-00ABi1-On
 for samba-technical@lists.samba.org; Tue, 01 Jul 2025 17:07:26 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-70109af5f70so15041666d6.0
 for <samba-technical@lists.samba.org>; Tue, 01 Jul 2025 10:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751389642; x=1751994442; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTazUoyxInDAJ2NwZxhqJI5YRJsIYXcAsvJl7/gp0ws=;
 b=Yn1WyXki18LguTLJ7Aa26L4hh1WWqqzypexPbnQMu0fytv+WNHnAVSdBcny+8kyD5I
 1ehBfrsp0haO6bIH7MwkN9DiUsgLBVVoNHkHjMJhlTXUotuMFVQy6RWu9J24aIgVJOpK
 FPrP1580Tz8hwr9J/VtEsOM/l6hqhZWPVc2PV4/FrRDuTxwvq/QKCelLrEwQWFJPAeL/
 7Stqz0JVzHQB0e8QxKBLJO2nu3/1zi6ny3rpu8ndbeSMjOnLsz1pVqyzBEP/tLRjv1M/
 2quFKxVDnDXMeipQMKsVnSPz/AwQ96fQbBFwcqu1X/0mXEAjLguJ2wFIBygguteEx94s
 X0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751389642; x=1751994442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTazUoyxInDAJ2NwZxhqJI5YRJsIYXcAsvJl7/gp0ws=;
 b=pWs9dRZi+PNizhMc1iF+Q94yUYDw/4owROJPT7/W/xjtLZsgx6AE8rJ9pvQq/REi2R
 pWcSzY0NJXj6qBLPbPL3ncffy8j9D6wUZ4EBphogtVO6Gvr6MAADR5f5VOGTBuPcUf0o
 IpFdH8N5szyQUzYO9CRO7DWuskDdNw5RU4+0Emfg1+GEY6E0BqZHWPbnwTVviwzq7NgG
 2XINAlHgLh2zBroyS+qpFCQuMde8Q6G0Nb3n+kwK9f7NkoxiB3d6ddhoXGMm0RaDMy/u
 X3Mn++LIwdkMim6/LP+6zi0AknOAn3JkB7Z27dJb96TClSCTdObOhq970t9gENLsH2j4
 ZQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/D+iGSvR634vi4uCH/NLxFKhHQKXE+WR9d2i8wFX2pHiULpwq1iFzVEdnpkQOQi1qG/bkKuqtrucIcCAI1ro=@lists.samba.org
X-Gm-Message-State: AOJu0YwGmvY6KT46I5L0nbwg3IWuHBNjbN/6hoWoOjp3eGUN73JFj8/L
 oNPxZDMnGw0Ns9WaAgvL//rMMK8KMFY/sI23D84/BOLZColoKhhZDx5/lNzdThZk4MUM0kzxkfQ
 9WL4dEBBF5w+gOif0vB71fdBA5e8J258=
X-Gm-Gg: ASbGncvV3L2bKONG3Oh5B+r8lICk7+cXbwlRqqE6DHruotfuH8+RoiOBH2lmhNHVXhp
 /4N5iCYASD8NSZdWrQTENxX8uPViFRTUFM+OPBw9MW4K9PhtMl+qCsSp4geQeiGmSmHlIsPm1XV
 SIVZlDzb6TCp2Ws7p25ZIpPIOBpykXsdAxBscSYyaxLw==
X-Google-Smtp-Source: AGHT+IHOCEIHYgm8k1vptLe8LL1tAI0jytjNx1TpB7ZG4wg2ZutjYESoQ25ENjDT+uRfDdRVBd1/zvyP4q+gP4bjeCU=
X-Received: by 2002:a05:6214:4309:b0:6fa:d956:243b with SMTP id
 6a1803df08f44-70003c8e7ffmr346050926d6.37.1751389641585; Tue, 01 Jul 2025
 10:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250701163852.2171681-1-dhowells@redhat.com>
 <20250701163852.2171681-10-dhowells@redhat.com>
In-Reply-To: <20250701163852.2171681-10-dhowells@redhat.com>
Date: Tue, 1 Jul 2025 12:07:08 -0500
X-Gm-Features: Ac12FXwp3sKlhUbj28TBsCjjpDbuA__SF55TZQEDUJu-EBlXwc0hooXFiXTAO58
Message-ID: <CAH2r5msN59rNqDxJaBTPZQ_smsYOiMbyy4V+cMdWeuGbe9GR1Q@mail.gmail.com>
Subject: Re: [PATCH 09/13] smb: client: fix warning when reconnecting channel
To: David Howells <dhowells@redhat.com>
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
 linux-nfs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 v9fs@lists.linux.dev, samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, Shyam Prasad <nspmangalore@gmail.com>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I already have this patch in my for-next branch (which also includes
the  Reviewed-by from Shyam)

On Tue, Jul 1, 2025 at 11:44=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> From: Paulo Alcantara <pc@manguebit.org>
>
> When reconnecting a channel in smb2_reconnect_server(), a dummy tcon
> is passed down to smb2_reconnect() with ->query_interface
> uninitialized, so we can't call queue_delayed_work() on it.
>
> Fix the following warning by ensuring that we're queueing the delayed
> worker from correct tcon.
>
> WARNING: CPU: 4 PID: 1126 at kernel/workqueue.c:2498 __queue_delayed_work=
+0x1d2/0x200
> Modules linked in: cifs cifs_arc4 nls_ucs2_utils cifs_md4 [last unloaded:=
 cifs]
> CPU: 4 UID: 0 PID: 1126 Comm: kworker/4:0 Not tainted 6.16.0-rc3 #5 PREEM=
PT(voluntary)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-4.fc42 04=
/01/2014
> Workqueue: cifsiod smb2_reconnect_server [cifs]
> RIP: 0010:__queue_delayed_work+0x1d2/0x200
> Code: 41 5e 41 5f e9 7f ee ff ff 90 0f 0b 90 e9 5d ff ff ff bf 02 00
> 00 00 e8 6c f3 07 00 89 c3 eb bd 90 0f 0b 90 e9 57 f> 0b 90 e9 65 fe
> ff ff 90 0f 0b 90 e9 72 fe ff ff 90 0f 0b 90 e9
> RSP: 0018:ffffc900014afad8 EFLAGS: 00010003
> RAX: 0000000000000000 RBX: ffff888124d99988 RCX: ffffffff81399cc1
> RDX: dffffc0000000000 RSI: ffff888114326e00 RDI: ffff888124d999f0
> RBP: 000000000000ea60 R08: 0000000000000001 R09: ffffed10249b3331
> R10: ffff888124d9998f R11: 0000000000000004 R12: 0000000000000040
> R13: ffff888114326e00 R14: ffff888124d999d8 R15: ffff888114939020
> FS:  0000000000000000(0000) GS:ffff88829f7fe000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffe7a2b4038 CR3: 0000000120a6f000 CR4: 0000000000750ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  queue_delayed_work_on+0xb4/0xc0
>  smb2_reconnect+0xb22/0xf50 [cifs]
>  smb2_reconnect_server+0x413/0xd40 [cifs]
>  ? __pfx_smb2_reconnect_server+0x10/0x10 [cifs]
>  ? local_clock_noinstr+0xd/0xd0
>  ? local_clock+0x15/0x30
>  ? lock_release+0x29b/0x390
>  process_one_work+0x4c5/0xa10
>  ? __pfx_process_one_work+0x10/0x10
>  ? __list_add_valid_or_report+0x37/0x120
>  worker_thread+0x2f1/0x5a0
>  ? __kthread_parkme+0xde/0x100
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0x1fe/0x380
>  ? kthread+0x10f/0x380
>  ? __pfx_kthread+0x10/0x10
>  ? local_clock_noinstr+0xd/0xd0
>  ? ret_from_fork+0x1b/0x1f0
>  ? local_clock+0x15/0x30
>  ? lock_release+0x29b/0x390
>  ? rcu_is_watching+0x20/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x15b/0x1f0
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> irq event stamp: 1116206
> hardirqs last  enabled at (1116205): [<ffffffff8143af42>] __up_console_se=
m+0x52/0x60
> hardirqs last disabled at (1116206): [<ffffffff81399f0e>] queue_delayed_w=
ork_on+0x6e/0xc0
> softirqs last  enabled at (1116138): [<ffffffffc04562fd>] __smb_send_rqst=
+0x42d/0x950 [cifs]
> softirqs last disabled at (1116136): [<ffffffff823d35e1>] release_sock+0x=
21/0xf0
>
> Cc: linux-cifs@vger.kernel.org
> Reported-by: David Howells <dhowells@redhat.com>
> Fixes: 42ca547b13a2 ("cifs: do not disable interface polling on failure")
> Reviewed-by: David Howells <dhowells@redhat.com>
> Tested-by: David Howells <dhowells@redhat.com>
> Signed-off-by: Paulo Alcantara (Red Hat) <pc@manguebit.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Tested-by: Steve French <sfrench@samba.org>
> ---
>  fs/smb/client/cifsglob.h |  1 +
>  fs/smb/client/smb2pdu.c  | 10 ++++------
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index 318a8405d475..fdd95e5100cd 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -1303,6 +1303,7 @@ struct cifs_tcon {
>         bool use_persistent:1; /* use persistent instead of durable handl=
es */
>         bool no_lease:1;    /* Do not request leases on files or director=
ies */
>         bool use_witness:1; /* use witness protocol */
> +       bool dummy:1; /* dummy tcon used for reconnecting channels */
>         __le32 capabilities;
>         __u32 share_flags;
>         __u32 maximal_access;
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index 084ee66e73fd..572cfc42dda8 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -424,9 +424,9 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon =
*tcon,
>                 free_xid(xid);
>                 ses->flags &=3D ~CIFS_SES_FLAGS_PENDING_QUERY_INTERFACES;
>
> -               /* regardless of rc value, setup polling */
> -               queue_delayed_work(cifsiod_wq, &tcon->query_interfaces,
> -                                  (SMB_INTERFACE_POLL_INTERVAL * HZ));
> +               if (!tcon->ipc && !tcon->dummy)
> +                       queue_delayed_work(cifsiod_wq, &tcon->query_inter=
faces,
> +                                          (SMB_INTERFACE_POLL_INTERVAL *=
 HZ));
>
>                 mutex_unlock(&ses->session_mutex);
>
> @@ -4229,10 +4229,8 @@ void smb2_reconnect_server(struct work_struct *wor=
k)
>                 }
>                 goto done;
>         }
> -
>         tcon->status =3D TID_GOOD;
> -       tcon->retry =3D false;
> -       tcon->need_reconnect =3D false;
> +       tcon->dummy =3D true;
>
>         /* now reconnect sessions for necessary channels */
>         list_for_each_entry_safe(ses, ses2, &tmp_ses_list, rlist) {
>
>


--=20
Thanks,

Steve

