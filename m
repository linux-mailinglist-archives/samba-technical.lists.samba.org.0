Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A1C87856
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 00:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=V7NeOAuwxxtGr95ei3Ihd1doyyRJkDQrVtn2KtZ55sM=; b=cDw58s4QD3tu5vViTadFfZ8n+0
	ZDbVSwWbSPuKXjTykT+Yr2qpCPI9RTLT4OlvAeTXkHpBB6KNv1ZUwSvnYyn6POf+6Kpf53PvnGFba
	UafTShvUSN9/CwDYHVQvuRPjka7M1YBagacmG1vpvbtW9bKOqtFyPi0aL3KDcdsTETzqwS4FLd/0i
	0Q8F33D2brBBdfokMR+42dZPcZweejJQKvfzes9Kdmdvt5g5Iu/Xa0lP9cMafsmEwF3MzOUpfQjUO
	gqb5D4Mh6XOBaQpUnnxjAAWDJcSm0nWHRn8Yd4AqFWsikyqghm1itSzyD1+XM8sW7zb4C+PBmWctL
	ynQM9DJQ==;
Received: from ip6-localhost ([::1]:37662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vO2ni-00DKLw-1u; Tue, 25 Nov 2025 23:50:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:60472) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vO2nc-00DKLg-5G
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 23:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46C4660121
 for <samba-technical@lists.samba.org>; Tue, 25 Nov 2025 23:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF115C19421
 for <samba-technical@lists.samba.org>; Tue, 25 Nov 2025 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764114616;
 bh=GX0zS8yFKKUA74p/E5iY1dLwzo6U23ycY15DSqD8Y8s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NrBABbpgKm3uaf+5zk5yedMvZf5fe6pUeMQS2o3nUlDjNhRw7x5kY5iipy9/JD6Ta
 DXKN6b27MVyzno7IEru8zHgfLoAM5+7XmHslLQIm20xjmYjD34YDX2bvBoEJxR1fp3
 h4qgO2N0n2uKkadyGpnrFaE3UnI2LnVVD62jxqSbmyz2J0I00Zsa03yM76ByTqsmRt
 1iX8S2cyf1YGCl80QANoluCKQpI6l37r5+FrRs4bj4tINThYBnlaUmBMWVHKv4GHe4
 n3gDHRGlmUWdU4PjpVO/9iHS40Uf5vtN+cnafeD9anFM54S7eSHUWalGt2FGBXpo6v
 tENtIOcf7xKfg==
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64080ccf749so9542432a12.2
 for <samba-technical@lists.samba.org>; Tue, 25 Nov 2025 15:50:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlnshAUUZGGAlxpCcbOcuSRcUxW9MGOwzh3Hu4EKTeTi1Bsa/M+iI0gV6SfhGQE/3B22jyph7fdIVcgmag0H8=@lists.samba.org
X-Gm-Message-State: AOJu0YzA7WFW9Br3AocXcPld/BhXsE3Ay8phWoU9ID/VRLBZW6YWAY3W
 5JO5sYZ951QJgT9OYZF4njsRqj3VeD9afn8eWuyhS5jvTBCZ3/NOG+T5xKpC+a08kfI2+aqupIq
 oKKJmQl9nRswSXEjTwDyd9DE1INj8Y+o=
X-Google-Smtp-Source: AGHT+IEceXWiE+qu3Cng5/TzNRNwtaP1qD56ZRdr8ZNTUzgSUnc6nIYNwy/lyOVTfNaarFJ095CIJvnnXmr5TOevKAY=
X-Received: by 2002:a05:6402:50ca:b0:641:3492:723d with SMTP id
 4fb4d7f45d1cf-64555b99b3amr16169695a12.11.1764114614477; Tue, 25 Nov 2025
 15:50:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
In-Reply-To: <cover.1764080338.git.metze@samba.org>
Date: Wed, 26 Nov 2025 08:50:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkKH09Q3KyrboAo3Oolfz1cOSS2TN_FlIqIx-cEwAjBN9KjT38y4emzjo0
Message-ID: <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] smb: smbdirect/client/server: relax
 WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks
To: Stefan Metzmacher <metze@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> Hi,
>
> here are some small cleanups for a problem Nanjae reported,
> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> by a Windows 11 client.
>
> The patches should relax the checks if an error happened before,
> they are intended for 6.18 final, as far as I can see the
> problem was introduced during the 6.18 cycle only.
>
> Given that v1 of this patchset produced a very useful WARN_ONCE()
> message, I'd really propose to keep this for 6.18, also for the
> client where the actual problem may not exists, but if they
> exist, it will be useful to have the more useful messages
> in 6.16 final.
First, the warning message has been improved. Thanks.
However, when copying a 6-7GB file on a Windows client, the following
error occurs. These error messages did not occur when testing with the
older ksmbd rdma(https://github.com/namjaejeon/ksmbd).

[  424.088714] ksmbd: smb_direct: disconnected
[  424.088729] ksmbd: sock_read failed: -107
[  424.088881] ksmbd: Failed to send message: -107
[  424.088908] ksmbd: Failed to send message: -107
[  424.088922] ksmbd: Failed to send message: -107
[  424.088980] ksmbd: Failed to send message: -107
[  424.089044] ksmbd: Failed to send message: -107
[  424.089058] ksmbd: Failed to send message: -107
[  424.089062] ksmbd: Failed to send message: -107
[  424.089068] ksmbd: Failed to send message: -107
[  424.089078] ksmbd: Failed to send message: -107
[  424.089085] ksmbd: Failed to send message: -107
[  424.089104] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', op=
code=3D0
[  424.089111] ksmbd: Failed to send message: -107
[  424.089140] ksmbd: Failed to send message: -107
[  424.089160] ksmbd: Failed to send message: -107
[  424.090146] ksmbd: Failed to send message: -107
[  424.090160] ksmbd: Failed to send message: -107
[  424.090180] ksmbd: Failed to send message: -107
[  424.090188] ksmbd: Failed to send message: -107
[  424.090200] ksmbd: Failed to send message: -107
[  424.090228] ksmbd: Failed to send message: -107
[  424.090245] ksmbd: Failed to send message: -107
[  424.090261] ksmbd: Failed to send message: -107
[  424.090274] ksmbd: Failed to send message: -107
[  424.090317] ksmbd: Failed to send message: -107
[  424.090323] ksmbd: Failed to send message: -107
[  432.648368] ksmbd: smb_direct: disconnected
[  432.648383] ksmbd: sock_read failed: -107
[  432.648800] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', op=
code=3D0
[  432.649835] ksmbd: Failed to send message: -107
[  432.649870] ksmbd: Failed to send message: -107
[  432.649883] ksmbd: Failed to send message: -107
[  432.649894] ksmbd: Failed to send message: -107
[  432.649913] ksmbd: Failed to send message: -107
[  432.649966] ksmbd: Failed to send message: -107
[  432.650023] ksmbd: Failed to send message: -107
[  432.650077] ksmbd: Failed to send message: -107
[  432.650138] ksmbd: Failed to send message: -107
[  432.650151] ksmbd: Failed to send message: -107
[  432.650173] ksmbd: Failed to send message: -107
[  432.650182] ksmbd: Failed to send message: -107
[  432.650196] ksmbd: Failed to send message: -107
[  432.650205] ksmbd: Failed to send message: -107
[  432.650219] ksmbd: Failed to send message: -107
[  432.650229] ksmbd: Failed to send message: -107
[  432.650238] ksmbd: Failed to send message: -107
[  432.650256] ksmbd: Failed to send message: -107
[  432.650270] ksmbd: Failed to send message: -107
[  450.254342] ksmbd: Failed to send message: -107
[  450.254644] ksmbd: Failed to send message: -107
[  450.254672] ksmbd: Failed to send message: -107
[  450.254688] ksmbd: Failed to send message: -107
[  450.254825] ksmbd: Failed to send message: -107
[  450.254859] ksmbd: smb_direct: disconnected
[  450.254866] ksmbd: sock_read failed: -107
[  450.255282] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', op=
code=3D0
[  450.255342] ksmbd: smb_direct: Send error. status=3D'WR flushed (5)', op=
code=3D0

>
> Thanks!
> metze
>
> v3: move __SMBDIRECT_SOCKET_DISCONNECT() defines before including
>     smbdirect headers in order to avoid problems with the follow
>     up changes for 6.19
>
> v2: adjust for the case where the recv completion arrives before
>     RDMA_CM_EVENT_ESTABLISHED and improve commit messages
>
> Stefan Metzmacher (4):
>   smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
>   smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
>   smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
>     recv_done() and smb_direct_cm_handler()
>   smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*) checks in
>     recv_done() and smbd_conn_upcall()
>
>  fs/smb/client/smbdirect.c                  | 28 ++++++------
>  fs/smb/common/smbdirect/smbdirect_socket.h | 51 ++++++++++++++++++++++
>  fs/smb/server/transport_rdma.c             | 40 +++++++++++++----
>  3 files changed, 98 insertions(+), 21 deletions(-)
>
> --
> 2.43.0
>

