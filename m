Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27689E171
	for <lists+samba-technical@lfdr.de>; Tue,  9 Apr 2024 19:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8KKTyTIbsFc3DDsu9SnRNh0iL4iS4ZelDeybkdPPbqE=; b=Y8UbA352zWghQLwk44gseFIgki
	Nx7kmvybpcW9EYOBsyHcjxs9d2gqgXweh5E+G/c5BybVH9A5QBMolu8P4NHOUWmHy4C5FRSn5KrYg
	Wx1OwrDfCqfEVIJspE8IVNCrj5I2/8T39xQtbLguyTdQH16dQvnuoccXgLRFQj1T8JnpYUlcQMoI6
	j7/zOeq10Qf5JfenGyBD44c8soe63y6iyjS8a/AwZU8Obzv6DbZ6Xo2pwUHFPMx9JaTGuDLVtuVL0
	NNb89ivBHp+eW0gY+AmXwRoqOpwH5/XT18vctS+FeCSJ2Sn3ZZW1UcB/yCkGassfnop3A69v+Nh27
	q6VCeS7A==;
Received: from ip6-localhost ([::1]:32534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ruF8S-004QAB-HL; Tue, 09 Apr 2024 17:19:52 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:45355) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ruF8M-004QA4-Ti
 for samba-technical@lists.samba.org; Tue, 09 Apr 2024 17:19:49 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516d0161e13so6600762e87.3
 for <samba-technical@lists.samba.org>; Tue, 09 Apr 2024 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712683186; x=1713287986; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KKTyTIbsFc3DDsu9SnRNh0iL4iS4ZelDeybkdPPbqE=;
 b=BBrWwhHUGVY/KG5XqRy1I0zmLHqZjtlLRSfld/eQZobA5aE7EGRkRiGeTRxvFO7JCE
 2QkUjnL+8cDs8cZreZ5liiqWOWKY+Ag6czWnPjf4B1C+oaouF3oKVLzol/ttoPRC+6q9
 PwomvB+0xvXE0qEF7j6g5fdMg3eRm2LsVUcQzIF5+/wefGfw2+HQag5RYak0Pxm2zv++
 f2hkd6yR1ypurvj6+WmvO/yixIgIVM5jb7idzjSFBI9LWl5St1DhRyFnP7KqilDwWEPu
 SGD6DFYEGE+LIqzwPRF8QLybINNdaMgpXIuV0tQibXCsc3yN+5HeGO/VE1W671njMm/+
 iLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712683186; x=1713287986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KKTyTIbsFc3DDsu9SnRNh0iL4iS4ZelDeybkdPPbqE=;
 b=uySrgWjI+AFmxStLc7HjpjxsvGJaBaa4bHcBalRsbl/haDctO4JQrJ7kbdJzkLzT/p
 NjCKGO58bIr16KMZdC3aZSJA3Qd84xRaIYWNKPdQaknwDCZ3MRMqQJPwUD/8wDL3DVLh
 LovPk7BlRd95rElqUXi//lR6jUsC3sdyttsWpBl5S+1gy8FtZCRkThwj0/qZf0DfzGFX
 8vTPQDDoG8wA2oX8tkSrAtEu0864CHnLyOdQFUxxm4ySj7r4BzL5R30vhRc5Xo6PUUd6
 mbOP9WDRf0qoyliUpHU64ScH2bJhnUhv8xNU8+8QLCpXxTl3mg38jNfTZBl6Fqh7nSjR
 OeEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW69bywBrzBg9PL0G6fWH+/ymnucyLR9iZjsx+n1xJtQe2hRIa1r7LoQRO/bZRlepHxTN7p10PT0jj/yvp/sj/FAcf/3ln0fnBOxZMQdo91
X-Gm-Message-State: AOJu0YzIvu+/TuWnyVOM4Ozmbbh25HtTr+3m74iu83jFXM7ml4EqH/25
 U6wMnuN16eH+7xUO5YyvdCiUS8G+G/uN7+sQzo0veb6kaebI8b/CBUNgBCUmfv7srwYmM5wnSKB
 F0K0BS3gbYS0cd8Cex59VtVpr5jQ=
X-Google-Smtp-Source: AGHT+IHt8ErjIQn0O9arjDfyXAUYVqGbU2vGyiifjGUrhIpjsTlIKqBAACuFKQqa8zx36Zjqw844fK8J4vt+g0KmYVQ=
X-Received: by 2002:ac2:465e:0:b0:516:d250:86c4 with SMTP id
 s30-20020ac2465e000000b00516d25086c4mr37955lfo.59.1712683185400; Tue, 09 Apr
 2024 10:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240409112758.467112-1-rickaran@axis.com>
 <20240409112758.467112-2-rickaran@axis.com>
In-Reply-To: <20240409112758.467112-2-rickaran@axis.com>
Date: Tue, 9 Apr 2024 12:19:34 -0500
Message-ID: <CAH2r5mviWen9OGKq++d+c=eGgKgGequ=97df+agFy0gn8hK9fw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] smb: client: Fix hang in smb2_reconnect
To: Rickard Andersson <rickaran@axis.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 rickard314.andersson@gmail.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, tom@talpey.com,
 kernel@axis.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I tried this on 6.8-rc7 and current 6.9-rc3 and it didn't fail on either.

I tried (to Samba, and using the mount parms you suggested for
cifs.ko) with both "killall -s SIGSTOP smbd" and also with "killall
smbd" - but unmount worked fine in both cases.

Do you know if this fails to ksmbd or Samba or ...?  Other ideas for
how to repro this?

On Tue, Apr 9, 2024 at 6:29=E2=80=AFAM Rickard Andersson <rickaran@axis.com=
> wrote:
>
> From: Rickard x Andersson <rickaran@axis.com>
>
> Test case:
> mount -t cifs //192.168.0.1/test y -o
>   port=3D19999,ro,vers=3D2.1,sec=3Dnone,echo_interval=3D1
> kill smbd with SIGSTOP
> umount /tmp/y
>
> Gives the following error:
>  INFO: task umount:466 blocked for more than 122 seconds.
>        Not tainted 6.8.2-axis9-devel #1
>  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
>  message.
>  task:umount state:D stack:0 pid:466 tgid:466 ppid:464 flags:0x00000004
>   __schedule from schedule+0x34/0x108
>   schedule from schedule_preempt_disabled+0x24/0x34
>   schedule_preempt_disabled from __mutex_lock.constprop.0+0x330/0x8b0
>   __mutex_lock.constprop.0 from smb2_reconnect+0x278/0x8fc [cifs]
>   smb2_reconnect [cifs] from SMB2_open_init+0x54/0x9f4 [cifs]
>   SMB2_open_init [cifs] from smb2_query_info_compound+0x1a0/0x500[cifs]
>   smb2_query_info_compound [cifs] from smb2_queryfs+0x64/0x134 [cifs]
>   smb2_queryfs [cifs] from cifs_statfs+0xc8/0x318 [cifs]
>   cifs_statfs [cifs] from statfs_by_dentry+0x60/0x84
>   statfs_by_dentry from fd_statfs+0x30/0x74
>   fd_statfs from sys_fstatfs64+0x40/0x6c
>   sys_fstatfs64 from ret_fast_syscall+0x0/0x54
>
> The umount task is blocked waiting on the session mutex. The reason it
> never gets the session mutex is because 'kworker/0:3' is holding the
> mutex and is waiting for response (see line 1209 in
> fs/smb/client/smb2pdu.c.
>
> Stack trace of 'kworker/0:3' just before calling wait_for_response:
>  CPU: 0 PID: 220 Comm: kworker/0:3 Not tainted 6.8.2-axis9-devel #1
>  Hardware name: Freescale i.MX6 SoloX (Device Tree)
>  Workqueue: cifsiod smb2_reconnect_server [cifs]
>   unwind_backtrace from show_stack+0x18/0x1c
>   show_stack from dump_stack_lvl+0x24/0x2c
>   dump_stack_lvl from compound_send_recv+0x7bc/0xac8 [cifs]
>   compound_send_recv [cifs] from cifs_send_recv+0x34/0x3c [cifs]
>   cifs_send_recv [cifs] from SMB2_negotiate+0x410/0x13dc [cifs]
>   SMB2_negotiate [cifs] from smb2_negotiate+0x4c/0x58 [cifs]
>   smb2_negotiate [cifs] from cifs_negotiate_protocol+0x9c/0x100 [cifs]
>   cifs_negotiate_protocol [cifs] from smb2_reconnect+0x418/0x8fc [cifs]
>   smb2_reconnect [cifs] from smb2_reconnect_server+0x1dc/0x514 [cifs]
>   smb2_reconnect_server [cifs] from process_one_work+0x188/0x3ec
>   process_one_work from worker_thread+0x1fc/0x430
>   worker_thread from kthread+0x110/0x130
>   kthread from ret_from_fork+0x14/0x28
>
> Change-Id: I53439ffb007c9c51d77ce40fb655a34e5ca291ec
> Signed-off-by: Rickard x Andersson <rickaran@axis.com>
> ---
>  fs/smb/client/transport.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
> index 994d70193432..96b8f8757ddc 100644
> --- a/fs/smb/client/transport.c
> +++ b/fs/smb/client/transport.c
> @@ -32,6 +32,8 @@
>  /* Max number of iovectors we can use off the stack when sending request=
s. */
>  #define CIFS_MAX_IOV_SIZE 8
>
> +#define RESPONSE_TIMEOUT_SECS 50
> +
>  void
>  cifs_wake_up_task(struct mid_q_entry *mid)
>  {
> @@ -735,13 +737,14 @@ static int allocate_mid(struct cifs_ses *ses, struc=
t smb_hdr *in_buf,
>  static int
>  wait_for_response(struct TCP_Server_Info *server, struct mid_q_entry *mi=
dQ)
>  {
> -       int error;
> +       int ret;
> +
> +       ret =3D wait_event_killable_timeout(server->response_q,
> +                                         midQ->mid_state !=3D MID_REQUES=
T_SUBMITTED &&
> +                                         midQ->mid_state !=3D MID_RESPON=
SE_RECEIVED,
> +                                         RESPONSE_TIMEOUT_SECS*HZ);
>
> -       error =3D wait_event_state(server->response_q,
> -                                midQ->mid_state !=3D MID_REQUEST_SUBMITT=
ED &&
> -                                midQ->mid_state !=3D MID_RESPONSE_RECEIV=
ED,
> -                                (TASK_KILLABLE|TASK_FREEZABLE_UNSAFE));
> -       if (error < 0)
> +       if ((ret < 0) || (ret =3D=3D 0))
>                 return -ERESTARTSYS;
>
>         return 0;
> --
> 2.30.2
>
>


--=20
Thanks,

Steve

