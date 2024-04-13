Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9588A3E42
	for <lists+samba-technical@lfdr.de>; Sat, 13 Apr 2024 21:41:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Kz8ExtCskGD95qPQ+DwOY5bMDip2+Hr8F/NzEzVCQSY=; b=TyICZD8dQ5fis0hFF3ExauW3RL
	eZ3DpTHZhA5R8XA4mXWdHttZOk+IPfVpNJ8OaUgembYXYQvYcDLUZWE8opn9LTontt7s7oQKgSF1m
	iLtsA1c9pUUwqjtvxZ7uR75xq42rrzL1J0XyEjJrHbpDqGPToPUMwV0m/cDQU+J8pKSlfFRmBFUSI
	r0KyAz9O6KQL2bmmIfwT0AgjxL4mE7juRtQih1dobvNYjxtvnEm2eNr7Co1UPZFej3xaPWyoZYcCe
	n+FaiZOK4F+OYzqK/rhGz1hl0gMGAO2Vdts0cgAd09UF3OK6bqipd0s9Sl3K6I8sxC9z14wO+UlqI
	+dIG4mlg==;
Received: from ip6-localhost ([::1]:33968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rvjEs-004jk2-8w; Sat, 13 Apr 2024 19:40:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:46219) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rvjEl-004jju-Vd
 for samba-technical@lists.samba.org; Sat, 13 Apr 2024 19:40:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5171a529224so2437349e87.0
 for <samba-technical@lists.samba.org>; Sat, 13 Apr 2024 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713037228; x=1713642028; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AeKrn/5P5sIWsG0ZyKsoPSzWi+8cL2bbMydQ5HMAFig=;
 b=ajiJgv/lds5ZGmvVpyhZ6oEmUMckQXhekgHiPCdDAzP8MVnx8GvhUqXAA4KywaABXs
 UIFprN4l6x+dulxNoZmAGkbPVTElznDTkzydpMVLpYzhpmLP/T0D9PxIeWwc84l0hYXE
 vKbla9VaHZ9dSK9gAhd4mnFSOBZR70RdmxtiRw1XBcNzuuxt6syhXiSfrK33gpGhny6y
 r6coCWsNG6M/PUDXHjSNR2tx8I/cwT2hyl9UvYuWdtOBV8m0muge9zWetM4jok3kSPxQ
 /DNjgxybRRCFN+qa0JSPTfoL3Ebbzh5Ubms2HYfHynfyBhl1lbojabwQVljQ8h5J40fr
 PwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713037228; x=1713642028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AeKrn/5P5sIWsG0ZyKsoPSzWi+8cL2bbMydQ5HMAFig=;
 b=QBgVM7YrC8jdSSij2ZQ/TJqjwXB5qKZ2RYyg8PoXcKz/q/sYLHFB96B2YkO0/LXq6X
 Nc7r4k+zyBWLOYBEm8qXNg7PhDu/Fca967S328tH9y/q8Ue2e3wLd3lf6jGrdAmzHrb3
 L8f+GdPLoNC3FgDs+0kF5arQUE2EHtfo6W2Gl8orW0Ua1O8qB0VmHcWhEkKS6oURsWU3
 +6MGWNWMhG3LZYFKA8giHfRG9aSaNJDI8rgn2a9SN6zM5pJxQ33GV9IndvnlFUEYRZTc
 X6E9CwwYUeFyNdlHJ7umZ1EGeSXGYeyCptgWmIlQp3mA6CeZ7gQw76mLKP2gBuchw84Q
 9a5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw7+QZ9ZqZjJqJxc/oedQa/tZJ/rUU6mkfX73wW9nOqDP0PfO/m8bh3HjZAOPUX713Iu1BP3Gg9IPcmiGEY6pxWn2vVvSL66n5HVOjt4Ou
X-Gm-Message-State: AOJu0YxA7i5Vmp/5E9x45PWv7vlWJ/vRAbCXL4z1muxIv4kAsNRVDO3D
 A96ZzeWNHe7ggvhouMkatd7/3hZsifQ0OEBZ6EyUY+akGsPFoxnSsA6pC+vlKYJqP4tyx4/+V0t
 T+X6k0DgYANJ3oOftwCfRUyWLKYA=
X-Google-Smtp-Source: AGHT+IH0GIqQn0TOw5mC+ZaJQ8GqNL2+9RSui/N7hSH0TMwP9FOZf1CqFOMcix5B4gdX8rNkf2NbRrU9ncsWDq3La4k=
X-Received: by 2002:a19:8c49:0:b0:517:87ba:aff3 with SMTP id
 i9-20020a198c49000000b0051787baaff3mr3795184lfj.43.1713037227406; Sat, 13 Apr
 2024 12:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240409112758.467112-1-rickaran@axis.com>
 <20240409112758.467112-2-rickaran@axis.com>
 <CAH2r5msm+xFyMPCJV7Luf6aQ04cHOhevmjJi8J-2Bf711T1ziQ@mail.gmail.com>
In-Reply-To: <CAH2r5msm+xFyMPCJV7Luf6aQ04cHOhevmjJi8J-2Bf711T1ziQ@mail.gmail.com>
Date: Sat, 13 Apr 2024 14:40:14 -0500
Message-ID: <CAH2r5mud2YyUAT+n4M5m+gZK3e=Y61O0LwTATw+BiB-oz+BBWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] smb: client: Fix hang in smb2_reconnect
To: Rickard Andersson <rickaran@axis.com>
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
Cc: Paulo Alcantara <pc@manguebit.com>, CIFS <linux-cifs@vger.kernel.org>,
 Shyam Prasad N <sprasad@microsoft.com>, rickard314.andersson@gmail.com,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Tom Talpey <tom@talpey.com>, kernel <kernel@axis.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Is there any way to verify if the same problem can be reproduced with
6.9-rc3 or later

On Sat, Apr 13, 2024, 4:02=E2=80=AFAM Steve French <smfrench@gmail.com> wro=
te:

> Shyam and I tried some experiments and there are two cases where the
> patch breaks:
> 1) ChangeNotify will time out
> 2) Certainly byte range lock calls (they can be allowed to block) will
> timeout
>
> An obvious alternative would be to not make this change for the
> commands like ChangeNotify and blocking locks but allow it for the
> others.
>
> On Tue, Apr 9, 2024 at 6:29=E2=80=AFAM Rickard Andersson <rickaran@axis.c=
om>
> wrote:
> >
> > From: Rickard x Andersson <rickaran@axis.com>
> >
> > Test case:
> > mount -t cifs //192.168.0.1/test y -o
> >   port=3D19999,ro,vers=3D2.1,sec=3Dnone,echo_interval=3D1
> > kill smbd with SIGSTOP
> > umount /tmp/y
> >
> > Gives the following error:
> >  INFO: task umount:466 blocked for more than 122 seconds.
> >        Not tainted 6.8.2-axis9-devel #1
> >  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
> >  message.
> >  task:umount state:D stack:0 pid:466 tgid:466 ppid:464 flags:0x00000004
> >   __schedule from schedule+0x34/0x108
> >   schedule from schedule_preempt_disabled+0x24/0x34
> >   schedule_preempt_disabled from __mutex_lock.constprop.0+0x330/0x8b0
> >   __mutex_lock.constprop.0 from smb2_reconnect+0x278/0x8fc [cifs]
> >   smb2_reconnect [cifs] from SMB2_open_init+0x54/0x9f4 [cifs]
> >   SMB2_open_init [cifs] from smb2_query_info_compound+0x1a0/0x500[cifs]
> >   smb2_query_info_compound [cifs] from smb2_queryfs+0x64/0x134 [cifs]
> >   smb2_queryfs [cifs] from cifs_statfs+0xc8/0x318 [cifs]
> >   cifs_statfs [cifs] from statfs_by_dentry+0x60/0x84
> >   statfs_by_dentry from fd_statfs+0x30/0x74
> >   fd_statfs from sys_fstatfs64+0x40/0x6c
> >   sys_fstatfs64 from ret_fast_syscall+0x0/0x54
> >
> > The umount task is blocked waiting on the session mutex. The reason it
> > never gets the session mutex is because 'kworker/0:3' is holding the
> > mutex and is waiting for response (see line 1209 in
> > fs/smb/client/smb2pdu.c.
> >
> > Stack trace of 'kworker/0:3' just before calling wait_for_response:
> >  CPU: 0 PID: 220 Comm: kworker/0:3 Not tainted 6.8.2-axis9-devel #1
> >  Hardware name: Freescale i.MX6 SoloX (Device Tree)
> >  Workqueue: cifsiod smb2_reconnect_server [cifs]
> >   unwind_backtrace from show_stack+0x18/0x1c
> >   show_stack from dump_stack_lvl+0x24/0x2c
> >   dump_stack_lvl from compound_send_recv+0x7bc/0xac8 [cifs]
> >   compound_send_recv [cifs] from cifs_send_recv+0x34/0x3c [cifs]
> >   cifs_send_recv [cifs] from SMB2_negotiate+0x410/0x13dc [cifs]
> >   SMB2_negotiate [cifs] from smb2_negotiate+0x4c/0x58 [cifs]
> >   smb2_negotiate [cifs] from cifs_negotiate_protocol+0x9c/0x100 [cifs]
> >   cifs_negotiate_protocol [cifs] from smb2_reconnect+0x418/0x8fc [cifs]
> >   smb2_reconnect [cifs] from smb2_reconnect_server+0x1dc/0x514 [cifs]
> >   smb2_reconnect_server [cifs] from process_one_work+0x188/0x3ec
> >   process_one_work from worker_thread+0x1fc/0x430
> >   worker_thread from kthread+0x110/0x130
> >   kthread from ret_from_fork+0x14/0x28
> >
> > Change-Id: I53439ffb007c9c51d77ce40fb655a34e5ca291ec
> > Signed-off-by: Rickard x Andersson <rickaran@axis.com>
> > ---
> >  fs/smb/client/transport.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
> > index 994d70193432..96b8f8757ddc 100644
> > --- a/fs/smb/client/transport.c
> > +++ b/fs/smb/client/transport.c
> > @@ -32,6 +32,8 @@
> >  /* Max number of iovectors we can use off the stack when sending
> requests. */
> >  #define CIFS_MAX_IOV_SIZE 8
> >
> > +#define RESPONSE_TIMEOUT_SECS 50
> > +
> >  void
> >  cifs_wake_up_task(struct mid_q_entry *mid)
> >  {
> > @@ -735,13 +737,14 @@ static int allocate_mid(struct cifs_ses *ses,
> struct smb_hdr *in_buf,
> >  static int
> >  wait_for_response(struct TCP_Server_Info *server, struct mid_q_entry
> *midQ)
> >  {
> > -       int error;
> > +       int ret;
> > +
> > +       ret =3D wait_event_killable_timeout(server->response_q,
> > +                                         midQ->mid_state !=3D
> MID_REQUEST_SUBMITTED &&
> > +                                         midQ->mid_state !=3D
> MID_RESPONSE_RECEIVED,
> > +                                         RESPONSE_TIMEOUT_SECS*HZ);
> >
> > -       error =3D wait_event_state(server->response_q,
> > -                                midQ->mid_state !=3D
> MID_REQUEST_SUBMITTED &&
> > -                                midQ->mid_state !=3D
> MID_RESPONSE_RECEIVED,
> > -                                (TASK_KILLABLE|TASK_FREEZABLE_UNSAFE))=
;
> > -       if (error < 0)
> > +       if ((ret < 0) || (ret =3D=3D 0))
> >                 return -ERESTARTSYS;
> >
> >         return 0;
> > --
> > 2.30.2
> >
> >
>
>
> --
> Thanks,
>
> Steve
>
