Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00240C92DFF
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 19:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iblWJYFLhEPZEekWX9bjkM9Q6W3amI2DaahGKFaHeSo=; b=w3uIdIN5VDYMnPg73hzJJ0kJSo
	EyVvqhE9d3YJPLI2IUKJidikBfjcF7F4/V7QUOp21s7EkE0CraC0MN+KBY3yyKsTi80Wh8xvFLaJ2
	o2EHaXhrr8HAS3N49aA43ONHdM7MNI7CxvtEINrrRrAP/coW6o2TY1KtkmWmCCbb3oXkMu5W5JCVI
	bcjPOdI3+xqBTKaDpHYxt+XZVTPXpO895HwpF8AFIvuI7pVgPcnKXiTgz8tNmzNEIDxZVmoQK7bBw
	MAWchIdaLc1FNm9tO6PtZdd7QEbj4ycFK0QRg0Q1AzoeNbjbMLOhu8xxskuhtxQlHbdg31r9nNX7B
	6moY9mMw==;
Received: from ip6-localhost ([::1]:29694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vP2qY-00DY7K-8v; Fri, 28 Nov 2025 18:05:30 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:54445) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vP2qT-00DY7D-DB
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 18:05:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-8824ce98111so31091686d6.0
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 10:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764353123; x=1764957923; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iblWJYFLhEPZEekWX9bjkM9Q6W3amI2DaahGKFaHeSo=;
 b=Qfbrm05iH71rx3PIIvFlD7gqVD/tsHWUdxAJAJhFNzy9m6fmjNMBWiyV/QZ6Q84uVX
 7nhW91No1atjmFRkfYtSQI1Y4XCngcc2si1reYrwfqHsRjnHX83R8alIcBf79HD4k+SL
 ue3AnMZdgRTARkjRNwZhaFgXv+lPPkDLQ+vqFOWNyzNcQs3WhJfrrOxlDU6Mg7w/DUUn
 AAyuMW4H8tdE9/3megqnNrB6gLFQ82ebICO8oCk/dykaFE/al4p3gd2RI+kAFSTqqO38
 GfTXE8MauxTMYdhPYBqhjMrG/Qc4XQ0MAWdW2ILTQzRjvV8njVIJQV35UCMm6kkEOL24
 XTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764353123; x=1764957923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iblWJYFLhEPZEekWX9bjkM9Q6W3amI2DaahGKFaHeSo=;
 b=mrPgHFm03YOfvXYJov3yc0pIC21dqzkfsXpq6ygjHoHGk0wTwRtA44pWNFu/Na0nGW
 9HdJoQhu5oYtC4hOii2EmhTQuMlnqEjo1VB1klMxfYkX8RXByJzALhCCDD1u8P5V68Nz
 TZT4TrrSAKuUcMmumGweGyjLFu1hvIs9z5IPopA4+y0Ds8brDjP1VSTN51snP8p/HAqU
 tw5G+CzpxQict3rDDiZbozlDlQmFj7X5RxglrsoHmULPR9OWHw3h5mRNJoSDFtVITP1/
 xRRy2EpLJ9A8h1y35dZ/21Gqw2X9s3APswJErqGVz7fx79VIIvZKyrxO8en3v9ddcm7F
 QW6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCU4EfuSMis6hdjbS/SZpk7uRbFvoT/xxIIWiHfS+ETGNgC/zNQiCRYemsye2gomFLi5LOt9LSb4Ra/pxQatE=@lists.samba.org
X-Gm-Message-State: AOJu0Yy+jAa+OIXdQCO4fYW4ESnopVVsF6ilBisw/AVV6IMTt+z2zx2D
 mN55F3hnbTHSyHGke7wZi+/fCDKpT3IeFRYqTd/WtIdk37afhfyrgNbp0ldIp8C+qGNQGOXU45p
 ngSxHhaO1iQIjz1Jo2GR8UtK5rz0cy78=
X-Gm-Gg: ASbGncukAh/vQ56N7dLSQKr+u5Z04hyhkKBSzGp8RPUB8PclJpteKM/xQA8W9MEL64e
 MfurGHl7cppI3KWy9nWNPKaldfdldSKCyQKg5dZU5V3vd3a3VW3UJMezh6JQrJFqkqNuQVVs8wm
 aBamJg48aXIHSAMAi97BWP5ywvhQG6cy+u08ozo3acneXX/KRGcnx3bKSGh0E2FCbS/dShA+I02
 9oLiw9IYmXfAtwNAejGwEcRoIXgjnO4zYU+sAjbUC8oc7btsalN+9Egul3vqW6Mq5p5r+KLfbG6
 uNR+35R5/oMr+BoaIp03o5S69Tn5lgUUe+S5hMicZk7ltBnI6T+LSkgqOu9LkYNjjtZxTof1x/G
 /A6xUkm6dI3W6mn43mFMZMBVD87Xc9ieLbv+1wvtQc4u3O8YU7NxvPz5UJUoetdWcUcdkikX3VR
 uiDhOuDQNMaQ==
X-Google-Smtp-Source: AGHT+IE1Egk3uc3On6b4xc1ND9PrzzxRokT93SiD1K9Uv0/6fiwr2g2EEThmeYRQQbQDPchakpISv4fwGrnqvfQYWhw=
X-Received: by 2002:a05:6214:1d2a:b0:882:3759:9155 with SMTP id
 6a1803df08f44-8847c498cf0mr450397956d6.21.1764353123376; Fri, 28 Nov 2025
 10:05:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764080338.git.metze@samba.org>
 <CAKYAXd_HKKBKx_B7+Z+b_jt+rHazuMkskYYPAp6BROPuy0uBfA@mail.gmail.com>
 <CAKYAXd8Nb6Ay1-J0GeDUCzRDWWYtRtcU-2FZ1LrX9p8soKpaKQ@mail.gmail.com>
 <bd2237e6-86e7-40c8-8635-8ba6c0573cbe@samba.org>
 <CAKYAXd8QhE_=zoK3pLqd0M-8Zw8M0auTw-P5yoqe6DioGXtsaQ@mail.gmail.com>
 <CAH2r5mv0BLnF9+ori1ZfoaYfBLXcscjuFkkAjggSY+aroKDRiw@mail.gmail.com>
 <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
In-Reply-To: <b1f6271b-3c2a-493a-a404-7cdacd791acb@samba.org>
Date: Fri, 28 Nov 2025 12:05:12 -0600
X-Gm-Features: AWmQ_bnv0tt_gwaQVQbva_bkjq_YH42RpQb9CN4otFXd_HrZJipFfRJtfKPBZ2w
Message-ID: <CAH2r5msgoZ2aeDfvP-Np=RM-twJ0K6EhQb0xkh=iM=u015KiMg@mail.gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, Tom Talpey <tom@talpey.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

i only see changes in two of the patches (see below) - will update
ksmbd-for-next to include the version from your branch
(for-6.19/fs-smb-20251128-v5).  Does that match what you saw?

smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel/6-11-27-25$ diff
0004-smb-server-relax-WARN_ON_ONCE-SMBDIRECT_SOCKET_-chec.patch
~/metze/wip/197/0039-smb-server-relax-WARN_ON_ONCE-SMBDIRECT_SOCKET_-chec.p=
atch
1c1
< From 225825bffc9602e34e26199f1c635ee59c5de2e4 Mon Sep 17 00:00:00 2001
---
> From 0ee0418c34b31975ffe76d8d6d93ebbe9600c532 Mon Sep 17 00:00:00 2001
3,4c3,4
< Date: Tue, 25 Nov 2025 09:55:56 +0100
< Subject: [PATCH 4/6] smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
---
> Date: Tue, 25 Nov 2025 15:21:53 +0100
> Subject: [PATCH 039/197] smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET=
_*)
168,169c168,169
<  fs/smb/server/transport_rdma.c | 39 +++++++++++++++++++++++++++-------
<  1 file changed, 31 insertions(+), 8 deletions(-)
---
>  fs/smb/server/transport_rdma.c | 40 +++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 8 deletions(-)
172c172
< index e2be9a496154..2d360fd08f5f 100644
---
> index e2be9a496154..4e7ab8d9314f 100644
175c175,184
< @@ -231,6 +231,9 @@ static void
smb_direct_disconnect_rdma_work(struct work_struct *work)
---
> @@ -19,6 +19,8 @@
>  #include <rdma/rdma_cm.h>
>  #include <rdma/rw.h>
>
> +#define __SMBDIRECT_SOCKET_DISCONNECT(__sc) smb_direct_disconnect_rdma_c=
onnection(__sc)
> +
>  #include "glob.h"
>  #include "connection.h"
>  #include "smb_common.h"
> @@ -231,6 +233,9 @@ static void smb_direct_disconnect_rdma_work(struct wo=
rk_struct *work)
185c194
< @@ -241,9 +244,6 @@ static void
smb_direct_disconnect_rdma_work(struct work_struct *work)
---
> @@ -241,9 +246,6 @@ static void smb_direct_disconnect_rdma_work(struct wo=
rk_struct *work)
195,199c204
< @@ -284,9 +284,13 @@ static void
smb_direct_disconnect_rdma_work(struct work_struct *work)
<  smb_direct_disconnect_wake_up_all(sc);
<  }
<
< +#define __SMBDIRECT_SOCKET_DISCONNECT(__sc)
smb_direct_disconnect_rdma_connection(__sc)
---
> @@ -287,6 +289,9 @@ static void smb_direct_disconnect_rdma_work(struct wo=
rk_struct *work)
209c214
< @@ -296,9 +300,6 @@ smb_direct_disconnect_rdma_connection(struct
smbdirect_socket *sc)
---
> @@ -296,9 +301,6 @@ smb_direct_disconnect_rdma_connection(struct smbdirec=
t_socket *sc)
219c224
< @@ -639,7 +640,18 @@ static void recv_done(struct ib_cq *cq, struct ib_wc=
 *wc)
---
> @@ -639,7 +641,18 @@ static void recv_done(struct ib_cq *cq, struct ib_wc=
 *wc)
239c244
< @@ -1725,7 +1737,18 @@ static int smb_direct_cm_handler(struct
rdma_cm_id *cm_id,
---
> @@ -1725,7 +1738,18 @@ static int smb_direct_cm_handler(struct rdma_cm_id=
 *cm_id,
smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel/6-11-27-25$ diff
0005-smb-client-relax-WARN_ON_ONCE-SMBDIRECT_SOCKET_-chec.patch
~/metze/wip/197/0040-smb-client-relax-WARN_ON_ONCE-SMBDIRECT_SOCKET_-chec.p=
atch
1c1
< From 76e8c8c28af17cf66e79beea48278dd5b5ed5d52 Mon Sep 17 00:00:00 2001
---
> From 1e5535ff36f83e8cd664fc6d9d318b482a0ff9d8 Mon Sep 17 00:00:00 2001
3,4c3,4
< Date: Tue, 25 Nov 2025 09:55:57 +0100
< Subject: [PATCH 5/6] smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
---
> Date: Tue, 25 Nov 2025 15:21:54 +0100
> Subject: [PATCH 040/197] smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET=
_*)
46c46
< index c6c428c2e08d..9ee8d1048284 100644
---
> index c6c428c2e08d..788a0670c4a8 100644
49c49,57
< @@ -186,6 +186,9 @@ static void smbd_disconnect_rdma_work(struct
work_struct *work)
---
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/highmem.h>
>  #include <linux/folio_queue.h>
> +#define __SMBDIRECT_SOCKET_DISCONNECT(__sc) smbd_disconnect_rdma_connect=
ion(__sc)
>  #include "../common/smbdirect/smbdirect_pdu.h"
>  #include "smbdirect.h"
>  #include "cifs_debug.h"
> @@ -186,6 +187,9 @@ static void smbd_disconnect_rdma_work(struct work_str=
uct *work)
59c67
< @@ -197,9 +200,6 @@ static void smbd_disconnect_rdma_work(struct
work_struct *work)
---
> @@ -197,9 +201,6 @@ static void smbd_disconnect_rdma_work(struct work_str=
uct *work)
69,71c77
< @@ -240,8 +240,12 @@ static void smbd_disconnect_rdma_work(struct
work_struct *work)
<  smbd_disconnect_wake_up_all(sc);
<  }
---
> @@ -242,6 +243,9 @@ static void smbd_disconnect_rdma_work(struct work_str=
uct *work)
73d78
< +#define __SMBDIRECT_SOCKET_DISCONNECT(__sc)
smbd_disconnect_rdma_connection(__sc)

On Fri, Nov 28, 2025 at 4:17=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Am 28.11.25 um 05:53 schrieb Steve French:
> > On Thu, Nov 27, 2025 at 9:19=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> >
> >> On Fri, Nov 28, 2025 at 12:54=E2=80=AFAM Stefan Metzmacher <metze@samb=
a.org>
> >> wrote:
> >>>
> >>> Am 26.11.25 um 02:07 schrieb Namjae Jeon:
> >>>> On Wed, Nov 26, 2025 at 8:50=E2=80=AFAM Namjae Jeon <linkinjeon@kern=
el.org>
> >> wrote:
> >>>>>
> >>>>> On Tue, Nov 25, 2025 at 11:22=E2=80=AFPM Stefan Metzmacher <metze@s=
amba.org>
> >> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> here are some small cleanups for a problem Nanjae reported,
> >>>>>> where two WARN_ON_ONCE(sc->status !=3D ...) checks where triggered
> >>>>>> by a Windows 11 client.
> >>>>>>
> >>>>>> The patches should relax the checks if an error happened before,
> >>>>>> they are intended for 6.18 final, as far as I can see the
> >>>>>> problem was introduced during the 6.18 cycle only.
> >>>>>>
> >>>>>> Given that v1 of this patchset produced a very useful WARN_ONCE()
> >>>>>> message, I'd really propose to keep this for 6.18, also for the
> >>>>>> client where the actual problem may not exists, but if they
> >>>>>> exist, it will be useful to have the more useful messages
> >>>>>> in 6.16 final.
> >>>> Anyway, Applied this patch-set to #ksmbd-for-next-next.
> >>>> Please check the below issue.
> >>>
> >>> Steve, can you move this into ksmbd-for-next?
> >> Steve, There are more patches in ksmbd-for-next-next.
> >> Please apply the following 6 patches in #ksmbd-for-next-next to
> >> #ksmbd-for-next.
> >>
> >> 3858665313f1 (HEAD -> ksmbd-for-next-next, origin/ksmbd-for-next-next)
> >> ksmbd: ipc: fix use-after-free in ipc_msg_send_request
> >> b9c7d4fe6e93 smb: client: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >> checks in recv_done() and smbd_conn_upcall()
> >> 6c5ceb636d08 smb: server: relax WARN_ON_ONCE(SMBDIRECT_SOCKET_*)
> >> checks in recv_done() and smb_direct_cm_handler()
> >> d02a328304e5 smb: smbdirect: introduce
> >> SMBDIRECT_CHECK_STATUS_{WARN,DISCONNECT}()
> >> 340255e842d5 smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helpe=
r
> >> 01cba263d1bd ksmbd: vfs: fix race on m_flags in vfs_cache
>
> It seems these are the v2 patches, please use v3,
> the difference is that the __SMBDIRECT_SOCKET_DISCONNECT
> defines are moved up in order to let the patches on top work
> with out modifications. I noticed the difference while
> doing a rebase on ksmbd-for-next and get conflicts.
>
> Thanks!
> metze
>


--=20
Thanks,

Steve

