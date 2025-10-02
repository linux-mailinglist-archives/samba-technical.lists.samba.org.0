Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB964BB26C9
	for <lists+samba-technical@lfdr.de>; Thu, 02 Oct 2025 05:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OglOXsuEiF7i6+vYy+41fucRP7/Kh76ZuAKRSo8eIQw=; b=AePpk4F0lSLZSw+8KHoSNEvxZr
	783Yoypp0Tqhj3z7riXRovNiSlM7H2LJQrtjjQbixnncDTwNudlblf9uOjnuRpLNGbmVqmi14aRH9
	eK7N33dtd51YNhiBCjxicE8w7CEVSU2Wys9+Q946eUYShtm2XKhDw5rmlT5O+OYr+KNiBZ7fqHi3+
	hzswoDswvHbcsL8uRVVYP2dZ+fQZpTDzgfpd85wsaRSwjpe8+OEGq8Wtg5NW31EgYKVka+cfGAq/Q
	sZC7UV8V7eb17g2Oqfwm8wjlBUYqcgKHlwtb/I7/Zh/VBD1XZcj/AR8IHlB+aZKcBM0jhFoaIcdDL
	d+W+Zhdw==;
Received: from ip6-localhost ([::1]:42260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v49rK-006zHJ-3I; Thu, 02 Oct 2025 03:19:58 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:59534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v49rE-006zHC-NT
 for samba-technical@lists.samba.org; Thu, 02 Oct 2025 03:19:55 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-7960d69f14bso3796566d6.2
 for <samba-technical@lists.samba.org>; Wed, 01 Oct 2025 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759375190; x=1759979990; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OglOXsuEiF7i6+vYy+41fucRP7/Kh76ZuAKRSo8eIQw=;
 b=a7MRxPyvqKxPZnSdo8c30I/4OyniOSNwqf7bad0YdfW8wqY6jAwWi3F30I9RSbd45d
 hbYJ5qrTbbobG4zf1548wKTCc2YmXoWXwai9EeqSBaV5isvjWWlUcx3eI4Tsgq9gB5bg
 8nGyUEno4HbQbjY1QwzFKp3CZHcAYscOrXqsXNO+zgvQ/qx4Q5/ucVG4Uk8RcKvGPXE3
 c15lWQ1MeMIyvVXtVUQwphpoMvqk/c018qx96yC63N8dd+ngLTjdxJ05UyxRAwORooze
 7MwmiTzs8thQpIjjlGJyvxsHPeKmN7xkHEKlqGXpHWnpHahHSqag321dnUVtcd9y3c5C
 fNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759375190; x=1759979990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OglOXsuEiF7i6+vYy+41fucRP7/Kh76ZuAKRSo8eIQw=;
 b=nGZZwhsUX2qRx0aJIPkewk7o7hb8adc1ioIo+QtssLaeq2pyfZcvhYVdDceSs4I3ha
 PCagyvqFI3BpO+KmPyBeizwnUk6ZY8TuuLDxOvxlEcSjwyEnYOSuHDdueKZhSRIIZJd0
 IH5tR5yUD19QXMd+0duFxGLNVgt0dPOwA/7TYHgScjpmCESTIqS7FfGgS551ZOJuKjkv
 Lmwx/6ZJ3pF5LHTDrYlKL68EIUVL7M2oBcZUMFv/TL9AJYl12WbxM9T9EhnmCQerKCC8
 cfDMRJ1M50DT8czjHaErB4sZUFKOfvWE0Jf/IEa10jP0RTgyE6WFlaw2Zq7u4HUTZl2J
 I5jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGGeeIQycgOPc5L8zVM3QzMPHF+6QXyzwYYyGkFWmhWzpeX19DZQyQ25tbHqDdwhzN30Zei7iQe7I2xKA6TqY=@lists.samba.org
X-Gm-Message-State: AOJu0YzJeWznlv/qsd8BQNzTPIa8s7m/Ia4DWkLkItKOSqGMZHGoO8WU
 KqihSf9SpfIJXp2U4e4FcB07+TP5ydfZ2zb8fozmWrQbY5Dw/gYfvhfJYCpvOHKEf5b3dMwoK9O
 cBQYkQqMNqGk18KBORHMKpGJtm30YvIk=
X-Gm-Gg: ASbGncvrbiVWao9MTVRmlsmsGgzK71DjpEnrdQZCFbt4jFBuw4mMXKR0VfNxWkCdC+W
 XokNVXByQUFdFKzVHMKlook/4A2ZK4kzOT1/v5VmXeSde4AJ7CZ8NGVUiXFToJ2P2oFjiWeHf0h
 MFOa8reYG7a0Ti8EHA+VwErWk1UkXT7C4/C3g6RYHG9RK+iqrEyJPK2ahBUBP2/OTirV/nXSwcL
 dR8Sldus0r7sJauXENd1ZEpK8gFMzIuqLu7aUJOrgMH0plsuf36NiPK0ypaXslgbG6YnVLD8Fkx
 dnJcsekRw8vRKBPW0Bopeko++tn/6IWLoLKmjJBtcXMPhcb0/aXJ0SBPHah10rtnVfr+rLekzFJ
 uV17aMAhE5g==
X-Google-Smtp-Source: AGHT+IH57Fk72s9H3LGBTK+2pXoFM5w1cHiCSNe9fpORipn06qi265yhxApLm6Bna2MZLP55cAugDROOr1PS64rQS9A=
X-Received: by 2002:a05:6214:528f:b0:78f:493d:15c6 with SMTP id
 6a1803df08f44-8739be1dec0mr69139036d6.3.1759375190477; Wed, 01 Oct 2025
 20:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250915151950.1017597-1-f.ebner@proxmox.com>
 <20250915151950.1017597-2-f.ebner@proxmox.com>
In-Reply-To: <20250915151950.1017597-2-f.ebner@proxmox.com>
Date: Wed, 1 Oct 2025 22:19:39 -0500
X-Gm-Features: AS18NWDPGaX3z3mO1YUySJ5IK4Ie9SMZF7A_a6-KW3yYqMPpeYqFnxmRZrWKqrs
Message-ID: <CAH2r5mu_6WYwBioQ-6iS8Z+oVYBJA0nmhkkGQoqroWXjdrBVCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] smb: client: transport: avoid reconnects triggered by
 pending task work
To: Fiona Ebner <f.ebner@proxmox.com>
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
Cc: David Howells <dhowells@redhat.com>, linux-cifs@vger.kernel.org,
 sprasad@microsoft.com, pc@manguebit.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, tom@talpey.com, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have tentatively merged these two into cifs-2.6.git for-next pending
testing, but additional review/testing would be helpful.


On Mon, Sep 15, 2025 at 10:23=E2=80=AFAM Fiona Ebner <f.ebner@proxmox.com> =
wrote:
>
> When io_uring is used in the same task as CIFS, there might be
> unnecessary reconnects, causing issues in user-space applications
> like QEMU with a log like:
>
> > CIFS: VFS: \\10.10.100.81 Error -512 sending data on socket to server
>
> Certain io_uring completions might be added to task_work with
> notify_method being TWA_SIGNAL and thus TIF_NOTIFY_SIGNAL is set for
> the task.
>
> In __smb_send_rqst(), signals are masked before calling
> smb_send_kvec(), but the masking does not apply to TIF_NOTIFY_SIGNAL.
>
> If sk_stream_wait_memory() is reached via sock_sendmsg() while
> TIF_NOTIFY_SIGNAL is set, signal_pending(current) will evaluate to
> true there, and -EINTR will be propagated all the way from
> sk_stream_wait_memory() to sock_sendmsg() in smb_send_kvec().
> Afterwards, __smb_send_rqst() will see that not everything was written
> and reconnect.
>
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>  fs/smb/client/transport.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
> index a61ba7f3fb86..940e90107134 100644
> --- a/fs/smb/client/transport.c
> +++ b/fs/smb/client/transport.c
> @@ -22,6 +22,7 @@
>  #include <linux/mempool.h>
>  #include <linux/sched/signal.h>
>  #include <linux/task_io_accounting_ops.h>
> +#include <linux/task_work.h>
>  #include "cifspdu.h"
>  #include "cifsglob.h"
>  #include "cifsproto.h"
> @@ -173,9 +174,16 @@ smb_send_kvec(struct TCP_Server_Info *server, struct=
 msghdr *smb_msg,
>                  * send a packet.  In most cases if we fail to send
>                  * after the retries we will kill the socket and
>                  * reconnect which may clear the network problem.
> +                *
> +                * Even if regular signals are masked, EINTR might be
> +                * propagated from sk_stream_wait_memory() to here when
> +                * TIF_NOTIFY_SIGNAL is used for task work. For example,
> +                * certain io_uring completions will use that. Treat
> +                * having EINTR with pending task work the same as EAGAIN
> +                * to avoid unnecessary reconnects.
>                  */
>                 rc =3D sock_sendmsg(ssocket, smb_msg);
> -               if (rc =3D=3D -EAGAIN) {
> +               if (rc =3D=3D -EAGAIN || unlikely(rc =3D=3D -EINTR && tas=
k_work_pending(current))) {
>                         retries++;
>                         if (retries >=3D 14 ||
>                             (!server->noblocksnd && (retries > 2))) {
> --
> 2.47.2
>
>
>


--=20
Thanks,

Steve

