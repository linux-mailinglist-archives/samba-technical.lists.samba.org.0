Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 380998A3C2D
	for <lists+samba-technical@lfdr.de>; Sat, 13 Apr 2024 12:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pp0/G7jaP4xfrxL+Nun8zOzJR4cjAehFUaa+BSEMdpo=; b=aWTWvggf2WyPpMBwxjiS0U6GlJ
	sTFXlR680RlKILfhG+6u1ww6o5Ab5VJ+twQ5cJDypAZSnXgnoOGV6NmY8an9HOGvzMoihHmuJpWaH
	bXJOVzoG8hPH8QQ/1UgxBnhXZnq4tpB9M9puSWZRt+JVwXOGQxCSJ8A9fFWS61Akk9HuBwlBuzu3L
	suPkgFWLIX85JCcyueJ6fRUV1WET6hVwWMDurJOnWiOa1xsTqswIsFl6tBa6ZFp3Ad2H1QfnEQh8E
	zfDdlj7ugQrPxJG3Plp62lNxUAdnx3UGAs1wTHYtRCUQBB04Q3zUVa+epHMtoTyNAucsC98WfmrcX
	nAAu2A1Q==;
Received: from ip6-localhost ([::1]:53228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rvaMh-004iFR-UN; Sat, 13 Apr 2024 10:12:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:48315) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rvaMd-004iFK-KC
 for samba-technical@lists.samba.org; Sat, 13 Apr 2024 10:12:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1647767a12.0
 for <samba-technical@lists.samba.org>; Sat, 13 Apr 2024 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713003118; x=1713607918; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pp0/G7jaP4xfrxL+Nun8zOzJR4cjAehFUaa+BSEMdpo=;
 b=nEIRcT2b2Ig8hU5kjZNHX/22Zb9OotLZk8UM20Bp23GgkmvtBpGf2aAh9aArPQnOKo
 pLnxaOeVvPSpN7qNSMNFwJfR3HHeUEfikPJX2SNyunkCCEVfqXIpckwoc0rt8DBSCPKW
 Uv5TjammuHSkdcGYKTJ+eyRpTuK6u3tdorHPZLPekmy6wHSZZ6fgr+louYaNAcieoTTV
 7AVrWEevXcz+YWbqyzZzk3FisKnrFBqzSxlONBnJQOkQ0EDjdccS25xcIkI8T1rNKIef
 xaW+m8WeOqKJLbsYPrXIGxu0yNZ7etmCXq3zKqqLxqt9F14vtOV0sGY/HYKUi+VU/nYA
 mm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713003118; x=1713607918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp0/G7jaP4xfrxL+Nun8zOzJR4cjAehFUaa+BSEMdpo=;
 b=rmLW5nZGMwfv+mtgNcp+vxOpR5lTG80ExEybLYWbzxxYnI4sHFTxSGc5mgC9AkS1jU
 Nbj1URdfJeUMiv98e0murG5qirxuDtpf22olN6MXcKdmPwYlTRmme3uWzpiqPJBvcp2R
 oKnX9N2YTx1XaswfFB7GqZnN/6pv8sEygc28y8y9zz15Go8sVuNr9WCcqDmE0EuJMOiG
 YNtn38TB2fatiAdGICKHNIxTgl8qCESL1u8pxU1pu+OU974L7zQFxlrPNW3PxfIYnF1x
 ua8khq1FaL4s9a4iUtBSaT36Mzh1+xAgfKdcvezmjRvc7PjcqtfGfWtLMban6CIJDg9z
 Y6cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs3tLXWV7/J4zgH3BOY4N2NYSJWUrkV24wkeNBTVIiUyD8H29vPRxCQDEfcMmXJgrVAxanPALEhS9AgcsP/Q7QOC8y+J7Hh6UxQ+5yBjEu
X-Gm-Message-State: AOJu0YwXJgJPtFB2gZ7TCjY6mOJGp5jjQYc3Jjj/6EPQE5Mifxc9MCDZ
 Oetms+gLOpI4s0+NUKMeuQLaOSjkteYCSbNipuxtEeotugVQGzUgl+bQtPrSU9lXvrR+N4w7u1p
 Gob9kJXMrDFo/59/KRqs3B0ScVHFP8Q==
X-Google-Smtp-Source: AGHT+IHbtoFqqjXX5yyttD1d6EXR2Ucsz/XnNTkzhDCPle8jgk8iv+xWYiUcY861uOmzEGG6a/rKvF6l9YveU6MTRbc=
X-Received: by 2002:a2e:81c3:0:b0:2d4:9fbe:b5f with SMTP id
 s3-20020a2e81c3000000b002d49fbe0b5fmr2758427ljg.36.1712998947218; Sat, 13 Apr
 2024 02:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240409112758.467112-1-rickaran@axis.com>
 <20240409112758.467112-2-rickaran@axis.com>
In-Reply-To: <20240409112758.467112-2-rickaran@axis.com>
Date: Sat, 13 Apr 2024 04:02:15 -0500
Message-ID: <CAH2r5msm+xFyMPCJV7Luf6aQ04cHOhevmjJi8J-2Bf711T1ziQ@mail.gmail.com>
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

Shyam and I tried some experiments and there are two cases where the
patch breaks:
1) ChangeNotify will time out
2) Certainly byte range lock calls (they can be allowed to block) will time=
out

An obvious alternative would be to not make this change for the
commands like ChangeNotify and blocking locks but allow it for the
others.

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

