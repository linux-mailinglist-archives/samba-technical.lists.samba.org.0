Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE3B1F554
	for <lists+samba-technical@lfdr.de>; Sat,  9 Aug 2025 18:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=toQHbXCNTiEZWoOE8dg9aMLFQgLW0LEQwkuXfilt0uo=; b=FuFitYWpgFRyIaj1Of4CX2w5uG
	WgAc5t7RWdNej4rxf3061Xp3hLE3+8X0B7rK+WUGmLv6FVgo4shhUKXjehvoOLk2m+AIsm4CoDyMP
	ulIBU5AFx2BIHxyzMx+1unIvUpL3Fh7lL23QL/mKegSPt4lXArE/TUVght+AsKXy1YXQzlhtMxKKO
	O9dD2f7HkJM2lSyzdPv3Ku87pFmmgvRE6yzgFq1Jf2ckcfsNUZ2VaGfbSkNyxcRbLxAD2GMvoD/qO
	ie34WwvjOGHA/gO4l0Kb1efaXb/Vc4IxxmZl59rntG5IUOAEtbUPjZE4hy0JmzYU7XuNcply9LOLJ
	K3HRfJNQ==;
Received: from ip6-localhost ([::1]:49568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uklyf-00EnGs-El; Sat, 09 Aug 2025 15:59:25 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:46462) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uklya-00EnGl-QM
 for samba-technical@lists.samba.org; Sat, 09 Aug 2025 15:59:23 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-70748a0e13dso23639496d6.1
 for <samba-technical@lists.samba.org>; Sat, 09 Aug 2025 08:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754755158; x=1755359958; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toQHbXCNTiEZWoOE8dg9aMLFQgLW0LEQwkuXfilt0uo=;
 b=JpkvCugKixg4mtBblZqRjdY1yXCjJx2RFH8spkOua6EdJimM8Ug0raNFYA0gLSkrsv
 8/HaPsF1gD7m7I9xYZu4kLKhywMos0QXIT0Yju+jTvfSFKTf1Auocp2x1sKcjKBlIC5+
 ZYl1kEjh9p0/o7Q/wlmBYwTjW5QaVcEUvU1Kjw9jhlYL0MycDFCOEyNVXX+ymiuxKZWr
 qIG+JTaX6NyyQR/ZhINGH0rWIuf55L/vjHrlyhACexR4IwbZbtMhxmkDUhf795XgbcKc
 RJKcPyaFKFcJUPkZcosGns3lxPN4LlnnAdg1aZkwna4J4xUoZKHYuF2rHNo5LVgd2TJU
 06Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754755158; x=1755359958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=toQHbXCNTiEZWoOE8dg9aMLFQgLW0LEQwkuXfilt0uo=;
 b=AddWSC8qmAp3wxQRpyQ71t5Yzb5K5J7Y6ybYPqAqR8HqqxK/ka2Ksvodrlce4CXXXF
 ljD+qfv62KJjLP3A5W9yIajNWP8VYATiAPUfkJa7izfSHl9pCsX9w5ICUGMfDUmIOoKd
 XufY1Ekewj2cnmbF0eeVAAISgbFqH3W7ADFFWcYy/X/4PujNOItj1tE529vQUqDFk5KE
 fxoxRpbfCZzmuB70W/KBd34aYREiJYgoDwZHrLWv3KvLr22qxnststuI1iWN5kGigYMm
 kNzzkStPn+ML1goXwxP9YdFUxJQDfTFxwlz6c9g2TRxLuQtHJyhYKX0utmXpBd60Aokq
 HMXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtk9dfb+GZVObAPtDaIuS92be29Owi/4jsGbOooIDx1TmzIdkCZ2t2aN+uLWE5qQVoOTUBhcAT9Mwz1/jqKQA=@lists.samba.org
X-Gm-Message-State: AOJu0YzUBPOf7xrYWJMcXmxApewVUPssh/xs5nPunRvyp3kXaJNPncUc
 WCefwM4lUH2g7yOb04orVKwOV5nVujiwVFvht1E9W/gubj9J/OgYiKGTwU0weWXbgAfNHZgHC1Y
 IGvL86jlZD8xKG1M4WO7OJd5628tJFYg=
X-Gm-Gg: ASbGncuSeZDAK6IkEaIYZFgO7j47z+yOf7Sc7RqgAqzODhrtok3iI2NgXM8HOk4+OTC
 d7ZOK6go9PVJPVRt8u2WVkchlucFxPDCTGA2A3kM3z/Ipk2aTqVZNBSKlIaqQmqzcfYQ8Ub/BMo
 dYPGKqPXUQQsmCNVK2l7BfM3fLdH/nMxOSSbIh84k+uPYoCjPjshPO4uqnqcZMaDLH3og3m4+md
 QE6t0m0WySX6OZN64lhNMxNG8N4xNYWrHG4OA4eRQ==
X-Google-Smtp-Source: AGHT+IFyws0o2qLIQEDmrJkHJX34Op7e1GirxxwBJaULalYsiQkHt58eX0VDrlS2TSwgUYK1jCw9dlANfrJ6puhKfFM=
X-Received: by 2002:a05:6214:2422:b0:707:5bc5:861a with SMTP id
 6a1803df08f44-7099a1feb5emr90556276d6.17.1754755158437; Sat, 09 Aug 2025
 08:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754671444.git.metze@samba.org>
 <499154755d3d2d29d7092daffd16b01bc657974c.1754671444.git.metze@samba.org>
In-Reply-To: <499154755d3d2d29d7092daffd16b01bc657974c.1754671444.git.metze@samba.org>
Date: Sat, 9 Aug 2025 10:59:07 -0500
X-Gm-Features: Ac12FXztLCR12Ctp1I6OFS3pgsOP9hxBcdxKVOVApE8ZXoxBhqsCzy4x-LH8swk
Message-ID: <CAH2r5msY2bkoCyR4RK=NVzSp=gVhU9ujvDV-fR2-zkkSTnBBUQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] smb: client/smbdirect: replace
 SMBDIRECT_SOCKET_CONNECTING with more detailed states
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged patches 5 to 9 into cifs-2.6.git for-next (the others are
already upstream) pending more review and testing.

Let me know if updated versions of those 5 patches, or other
RDMA/smbdirect ones that belong in for-next

On Fri, Aug 8, 2025 at 11:49=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> The process of reaching a functional connection regresented by
> SMBDIRECT_SOCKET_CONNECTED, is more complex than using a single
> SMBDIRECT_SOCKET_CONNECTING state.
>
> This will allow us to remove a lot of special variables and
> completions in the following commits.
>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/smb/client/smbdirect.c                  | 73 ++++++++++++++++++++--
>  fs/smb/common/smbdirect/smbdirect_socket.h | 14 ++++-
>  2 files changed, 79 insertions(+), 8 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index c628e91c328b..1337d35a22f9 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -161,9 +161,36 @@ static void smbd_disconnect_rdma_work(struct work_st=
ruct *work)
>                 container_of(work, struct smbd_connection, disconnect_wor=
k);
>         struct smbdirect_socket *sc =3D &info->socket;
>
> -       if (sc->status =3D=3D SMBDIRECT_SOCKET_CONNECTED) {
> +       switch (sc->status) {
> +       case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
> +       case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
> +       case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
> +       case SMBDIRECT_SOCKET_CONNECTED:
>                 sc->status =3D SMBDIRECT_SOCKET_DISCONNECTING;
>                 rdma_disconnect(sc->rdma.cm_id);
> +               break;
> +
> +       case SMBDIRECT_SOCKET_CREATED:
> +       case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
> +       case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
> +       case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
> +       case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
> +       case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
> +       case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
> +       case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
> +       case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
> +       case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
> +               /*
> +                * rdma_connect() never reached
> +                * RDMA_CM_EVENT_ESTABLISHED
> +                */
> +               sc->status =3D SMBDIRECT_SOCKET_DISCONNECTED;
> +               break;
> +
> +       case SMBDIRECT_SOCKET_DISCONNECTING:
> +       case SMBDIRECT_SOCKET_DISCONNECTED:
> +       case SMBDIRECT_SOCKET_DESTROYED:
> +               break;
>         }
>  }
>
> @@ -185,26 +212,39 @@ static int smbd_conn_upcall(
>
>         switch (event->event) {
>         case RDMA_CM_EVENT_ADDR_RESOLVED:
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ADD=
R_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
> +               info->ri_rc =3D 0;
> +               complete(&info->ri_done);
> +               break;
> +
>         case RDMA_CM_EVENT_ROUTE_RESOLVED:
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ROU=
TE_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
>                 info->ri_rc =3D 0;
>                 complete(&info->ri_done);
>                 break;
>
>         case RDMA_CM_EVENT_ADDR_ERROR:
>                 log_rdma_event(ERR, "connecting failed event=3D%s\n", eve=
nt_name);
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ADD=
R_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
>                 info->ri_rc =3D -EHOSTUNREACH;
>                 complete(&info->ri_done);
>                 break;
>
>         case RDMA_CM_EVENT_ROUTE_ERROR:
>                 log_rdma_event(ERR, "connecting failed event=3D%s\n", eve=
nt_name);
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ROU=
TE_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
>                 info->ri_rc =3D -ENETUNREACH;
>                 complete(&info->ri_done);
>                 break;
>
>         case RDMA_CM_EVENT_ESTABLISHED:
>                 log_rdma_event(INFO, "connected event=3D%s\n", event_name=
);
> -               sc->status =3D SMBDIRECT_SOCKET_CONNECTED;
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RDMA_CONNEC=
T_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
>                 wake_up_interruptible(&info->status_wait);
>                 break;
>
> @@ -212,7 +252,8 @@ static int smbd_conn_upcall(
>         case RDMA_CM_EVENT_UNREACHABLE:
>         case RDMA_CM_EVENT_REJECTED:
>                 log_rdma_event(ERR, "connecting failed event=3D%s\n", eve=
nt_name);
> -               sc->status =3D SMBDIRECT_SOCKET_DISCONNECTED;
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RDMA_CONNEC=
T_RUNNING);
> +               sc->status =3D SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
>                 wake_up_interruptible(&info->status_wait);
>                 break;
>
> @@ -481,6 +522,12 @@ static void recv_done(struct ib_cq *cq, struct ib_wc=
 *wc)
>                 info->negotiate_done =3D
>                         process_negotiation_response(response, wc->byte_l=
en);
>                 put_receive_buffer(info, response);
> +               WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_NEGOTIATE_R=
UNNING);
> +               if (!info->negotiate_done)
> +                       sc->status =3D SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
> +               else
> +                       sc->status =3D SMBDIRECT_SOCKET_CONNECTED;
> +
>                 complete(&info->negotiate_completion);
>                 return;
>
> @@ -556,6 +603,7 @@ static struct rdma_cm_id *smbd_create_id(
>                 struct smbd_connection *info,
>                 struct sockaddr *dstaddr, int port)
>  {
> +       struct smbdirect_socket *sc =3D &info->socket;
>         struct rdma_cm_id *id;
>         int rc;
>         __be16 *sport;
> @@ -578,6 +626,8 @@ static struct rdma_cm_id *smbd_create_id(
>         init_completion(&info->ri_done);
>         info->ri_rc =3D -ETIMEDOUT;
>
> +       WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED=
);
> +       sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING;
>         rc =3D rdma_resolve_addr(id, NULL, (struct sockaddr *)dstaddr,
>                 RDMA_RESOLVE_TIMEOUT);
>         if (rc) {
> @@ -598,6 +648,8 @@ static struct rdma_cm_id *smbd_create_id(
>         }
>
>         info->ri_rc =3D -ETIMEDOUT;
> +       WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDE=
D);
> +       sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING;
>         rc =3D rdma_resolve_route(id, RDMA_RESOLVE_TIMEOUT);
>         if (rc) {
>                 log_rdma_event(ERR, "rdma_resolve_route() failed %i\n", r=
c);
> @@ -644,6 +696,9 @@ static int smbd_ia_open(
>         struct smbdirect_socket *sc =3D &info->socket;
>         int rc;
>
> +       WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_CREATED);
> +       sc->status =3D SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED;
> +
>         sc->rdma.cm_id =3D smbd_create_id(info, dstaddr, port);
>         if (IS_ERR(sc->rdma.cm_id)) {
>                 rc =3D PTR_ERR(sc->rdma.cm_id);
> @@ -1085,6 +1140,9 @@ static int smbd_negotiate(struct smbd_connection *i=
nfo)
>         int rc;
>         struct smbdirect_recv_io *response =3D get_receive_buffer(info);
>
> +       WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
> +       sc->status =3D SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
> +
>         sc->recv_io.expected =3D SMBDIRECT_EXPECT_NEGOTIATE_REP;
>         rc =3D smbd_post_recv(info, response);
>         log_rdma_event(INFO, "smbd_post_recv rc=3D%d iov.addr=3D0x%llx io=
v.length=3D%u iov.lkey=3D0x%x\n",
> @@ -1540,7 +1598,7 @@ static struct smbd_connection *_smbd_get_connection=
(
>         sc =3D &info->socket;
>         sp =3D &sc->parameters;
>
> -       sc->status =3D SMBDIRECT_SOCKET_CONNECTING;
> +       sc->status =3D SMBDIRECT_SOCKET_CREATED;
>         rc =3D smbd_ia_open(info, dstaddr, port);
>         if (rc) {
>                 log_rdma_event(INFO, "smbd_ia_open rc=3D%d\n", rc);
> @@ -1652,6 +1710,9 @@ static struct smbd_connection *_smbd_get_connection=
(
>
>         init_waitqueue_head(&info->status_wait);
>         init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
> +
> +       WARN_ON_ONCE(sc->status !=3D SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED=
);
> +       sc->status =3D SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
>         rc =3D rdma_connect(sc->rdma.cm_id, &conn_param);
>         if (rc) {
>                 log_rdma_event(ERR, "rdma_connect() failed with %i\n", rc=
);
> @@ -1660,10 +1721,10 @@ static struct smbd_connection *_smbd_get_connecti=
on(
>
>         wait_event_interruptible_timeout(
>                 info->status_wait,
> -               sc->status !=3D SMBDIRECT_SOCKET_CONNECTING,
> +               sc->status !=3D SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
>                 msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
>
> -       if (sc->status !=3D SMBDIRECT_SOCKET_CONNECTED) {
> +       if (sc->status !=3D SMBDIRECT_SOCKET_NEGOTIATE_NEEDED) {
>                 log_rdma_event(ERR, "rdma_connect failed port=3D%d\n", po=
rt);
>                 goto rdma_connect_failed;
>         }
> diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/s=
mbdirect/smbdirect_socket.h
> index 3c4a8d627aa3..f43eabdd413d 100644
> --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> @@ -8,9 +8,19 @@
>
>  enum smbdirect_socket_status {
>         SMBDIRECT_SOCKET_CREATED,
> -       SMBDIRECT_SOCKET_CONNECTING,
> -       SMBDIRECT_SOCKET_CONNECTED,
> +       SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED,
> +       SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING,
> +       SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED,
> +       SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED,
> +       SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING,
> +       SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED,
> +       SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED,
> +       SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
> +       SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED,
> +       SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
> +       SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
>         SMBDIRECT_SOCKET_NEGOTIATE_FAILED,
> +       SMBDIRECT_SOCKET_CONNECTED,
>         SMBDIRECT_SOCKET_DISCONNECTING,
>         SMBDIRECT_SOCKET_DISCONNECTED,
>         SMBDIRECT_SOCKET_DESTROYED
> --
> 2.43.0
>


--=20
Thanks,

Steve

