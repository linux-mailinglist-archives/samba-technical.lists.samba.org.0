Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4C9BE4748
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 18:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8mjTbA0sX3YmEDWHnoqrAo3k445C5wGiyk40QLZEC38=; b=rF0BmbtCYavVbQG4NYIMImqReS
	JgN8Q7+5iAUE3Agg3c8tUoiaCl/lvMCRxzAfi0R42ysETBTeFIkpEuu7BLccGzW7lozwKVu/nTyf3
	au5SvNHPv2EjJ3sSjb/Xu2fDWelMZgJ2wGQs1bUFzq3jdkuQN3yoBDsWzcUXZ3AYvWx8KytI2xKh7
	DTpgkDyiveKYDj0mTF92D48dG/qQ3/sQgHBGMF23Y1SHadX7xbgoSLgAb0lcohaFXj7aW7d65+wkr
	ugO9/w2iCztu0+f1MIhDUTfSbEx046aLB6r1qcvyghatyMNVl9mfttK6lN0D+YIaYDNFIjqDy/1+g
	Ct45DwMA==;
Received: from ip6-localhost ([::1]:37042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9QVb-007zgS-Al; Thu, 16 Oct 2025 16:07:19 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:51482) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9QVW-007zgL-KA
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 16:07:17 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-791fd6bffbaso15099376d6.3
 for <samba-technical@lists.samba.org>; Thu, 16 Oct 2025 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760630833; x=1761235633; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mjTbA0sX3YmEDWHnoqrAo3k445C5wGiyk40QLZEC38=;
 b=Z6nEo2hqrWcVq89fi4NnJZ6tgAWviPY6Gz4pUY2aMwPjFR/odWtdru6kk+ipCGT5/D
 /1wiHwpfS2g3U2gak/GBCu95Yu3JqpeCii7MZO2NL7DQoptI36cVh8uioxGcC3Uxvo7Q
 3Eir0fenNkPtmpsan4Ly9xDSjNQgRGMg6EiKSqvsxKJcn9fJ8uSLlQkgeGbyhTR+tZcz
 tdDASiok75cywYpXF+OBnrIUGx1i6xhmmYeuTs0SmCiYFu5oIPF3UiI6r5kOKFbN0pkv
 u2acTFuffVT6botMQhCjEQoNVlRcbx8OlBh8r1KFdhP7+qrONNtYQjK+DINKUiXf020g
 9qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760630833; x=1761235633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mjTbA0sX3YmEDWHnoqrAo3k445C5wGiyk40QLZEC38=;
 b=GgEVS+JUM1MdGTfn9SWPfDWSSxkFNmsf9bPdDQ0Ob2AUc66RVk1ByJnJIgjSHRWSHu
 8jQWNWCW7fYexEC+oWoFzaCrLKNshPHmK/pQ1eF64suztwHdE+wD23hchMF5frRR5Rm+
 JeamODXJkodkZGANNUAkaGa9SZjijzKGu50M3TEEVnJwiRMzL6uH31EfUnXTF1crjo1V
 j76gJW6dBg7dIzFsx8Pzch/vdfMtrxJi5Zyg47/xhHnSZLJRnjqbIITQCXYB/QqO17ha
 cp8P+zxtWbtrZgKXyU3k+hR8CrwcGd6eXLrVKIrqHZTZHA2UmBtngsRHzbJYCQ1Kvz8i
 z3Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRSjrggsG1qLGVrUuMAeTKIz3TTEmkfuXNAjOwHyrrJYSPnsPPmGKM5e9fFxe3iwykg5uK42rqRCG+AYHNSug=@lists.samba.org
X-Gm-Message-State: AOJu0Yw8lCLFAb1K3S3uPWK1UrwLSjmdjP/B0wXi6ADkPQjSAf/VK0nZ
 wEtk2Thfl5i+gi9fe5GtlVhvZrCTV541GSsy0ZlECV/EG9aUOxrLtyY/paL6RkikXMsA9GSRFd8
 XBcPrFvKRZJ/oamKs0A2vgwJfP8iS5xA=
X-Gm-Gg: ASbGncu1JzmW0aUIcQzT+A8PyUrXWZiyJ06OhlX8KoL4Ql0u0W7yZWSoEdmtasW1QZl
 QD+gU26DysJ8ZsnUJKlDEQ4V9xUuwhPpIumT9iH3QyONxI2h0hKJJX2yTE8sIKCwWWDKLrQLBG8
 gc4RMYs0h47YRS2ubF/2nG2Ferg2g7ntpkLhKAtc8MXjuL2wxnU/mnUT0nV5hFfO+cyLcX8wnoa
 r4M/lIvvurAaKPR70OEE4tsZ/XzhwBvc8b+OkU1/lb2ffC5asRxTTlXTWwiI1S7yVY5ny6nqdSY
 h0/tKdy3SWYRYABKcvqhKXW8E9+ZBZyswcFwIcaD/ubS2qfkhuQNIcWS4h/VD+0GtLyzweivTFR
 GvNkqatITqF76i2M7wDPv0YXNZsDukacAg4vqtpvQ8TL4lgk7cMCb3aVC+tHKrb3AX6GHIkXfPO
 RXSKTGR6V4UQ==
X-Google-Smtp-Source: AGHT+IHfdrmpAAe+6u5rZ2hA9QAmXHRBqtz3vA5wO3r5QxEcAw1oGkWJnPytvAjLtY8qu4apA3Z/rsHBGwVHh782d9s=
X-Received: by 2002:a05:6214:2b81:b0:87c:210f:93e1 with SMTP id
 6a1803df08f44-87c210f9ca0mr3846326d6.42.1760630832537; Thu, 16 Oct 2025
 09:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251016105421.1234955-1-metze@samba.org>
In-Reply-To: <20251016105421.1234955-1-metze@samba.org>
Date: Thu, 16 Oct 2025 11:07:00 -0500
X-Gm-Features: AS18NWBDe9btg5tj1B6C2TU9Hk1MChMqixwd6KSOEpAtc-jWyDQqVNC6UHUqfuE
Message-ID: <CAH2r5mu0DAmBeW_Mgs7w2csv3PVS_X2TNcDgMSBS4TDC61G6+A@mail.gmail.com>
Subject: Re: [PATCH] smb: client: allocate enough space for MR WRs and
 ib_drain_qp()
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

applied to cifs-2.6.git for-next pending additional review and testing

On Thu, Oct 16, 2025 at 5:54=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> The IB_WR_REG_MR and IB_WR_LOCAL_INV operations for smbdirect_mr_io
> structures should never fail because the submission or completion queues
> are too small. So we allocate more send_wr depending on the (local) max
> number of MRs.
>
> While there also add additional space for ib_drain_qp().
>
> This should make sure ib_post_send() will never fail
> because the submission queue is full.
>
> Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
> Fixes: cc55f65dd352 ("smb: client: make use of common smbdirect_socket_pa=
rameters")
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  fs/smb/client/smbdirect.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 49e2df3ad1f0..068e1069eca5 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -1767,6 +1767,7 @@ static struct smbd_connection *_smbd_get_connection=
(
>         struct smbdirect_socket *sc;
>         struct smbdirect_socket_parameters *sp;
>         struct rdma_conn_param conn_param;
> +       struct ib_qp_cap qp_cap;
>         struct ib_qp_init_attr qp_attr;
>         struct sockaddr_in *addr_in =3D (struct sockaddr_in *) dstaddr;
>         struct ib_port_immutable port_immutable;
> @@ -1838,6 +1839,25 @@ static struct smbd_connection *_smbd_get_connectio=
n(
>                 goto config_failed;
>         }
>
> +       sp->responder_resources =3D
> +               min_t(u8, sp->responder_resources,
> +                     sc->ib.dev->attrs.max_qp_rd_atom);
> +       log_rdma_mr(INFO, "responder_resources=3D%d\n",
> +               sp->responder_resources);
> +
> +       /*
> +        * We use allocate sp->responder_resources * 2 MRs
> +        * and each MR needs WRs for REG and INV, so
> +        * we use '* 4'.
> +        *
> +        * +1 fot ib_drain_qp()
> +        */
> +       memset(&qp_cap, 0, sizeof(qp_cap));
> +       qp_cap.max_send_wr =3D sp->send_credit_target + sp->responder_res=
ources * 4 + 1;
> +       qp_cap.max_recv_wr =3D sp->recv_credit_max + 1;
> +       qp_cap.max_send_sge =3D SMBDIRECT_SEND_IO_MAX_SGE;
> +       qp_cap.max_recv_sge =3D SMBDIRECT_RECV_IO_MAX_SGE;
> +
>         sc->ib.pd =3D ib_alloc_pd(sc->ib.dev, 0);
>         if (IS_ERR(sc->ib.pd)) {
>                 rc =3D PTR_ERR(sc->ib.pd);
> @@ -1848,7 +1868,7 @@ static struct smbd_connection *_smbd_get_connection=
(
>
>         sc->ib.send_cq =3D
>                 ib_alloc_cq_any(sc->ib.dev, sc,
> -                               sp->send_credit_target, IB_POLL_SOFTIRQ);
> +                               qp_cap.max_send_wr, IB_POLL_SOFTIRQ);
>         if (IS_ERR(sc->ib.send_cq)) {
>                 sc->ib.send_cq =3D NULL;
>                 goto alloc_cq_failed;
> @@ -1856,7 +1876,7 @@ static struct smbd_connection *_smbd_get_connection=
(
>
>         sc->ib.recv_cq =3D
>                 ib_alloc_cq_any(sc->ib.dev, sc,
> -                               sp->recv_credit_max, IB_POLL_SOFTIRQ);
> +                               qp_cap.max_recv_wr, IB_POLL_SOFTIRQ);
>         if (IS_ERR(sc->ib.recv_cq)) {
>                 sc->ib.recv_cq =3D NULL;
>                 goto alloc_cq_failed;
> @@ -1865,11 +1885,7 @@ static struct smbd_connection *_smbd_get_connectio=
n(
>         memset(&qp_attr, 0, sizeof(qp_attr));
>         qp_attr.event_handler =3D smbd_qp_async_error_upcall;
>         qp_attr.qp_context =3D sc;
> -       qp_attr.cap.max_send_wr =3D sp->send_credit_target;
> -       qp_attr.cap.max_recv_wr =3D sp->recv_credit_max;
> -       qp_attr.cap.max_send_sge =3D SMBDIRECT_SEND_IO_MAX_SGE;
> -       qp_attr.cap.max_recv_sge =3D SMBDIRECT_RECV_IO_MAX_SGE;
> -       qp_attr.cap.max_inline_data =3D 0;
> +       qp_attr.cap =3D qp_cap;
>         qp_attr.sq_sig_type =3D IB_SIGNAL_REQ_WR;
>         qp_attr.qp_type =3D IB_QPT_RC;
>         qp_attr.send_cq =3D sc->ib.send_cq;
> @@ -1883,12 +1899,6 @@ static struct smbd_connection *_smbd_get_connectio=
n(
>         }
>         sc->ib.qp =3D sc->rdma.cm_id->qp;
>
> -       sp->responder_resources =3D
> -               min_t(u8, sp->responder_resources,
> -                     sc->ib.dev->attrs.max_qp_rd_atom);
> -       log_rdma_mr(INFO, "responder_resources=3D%d\n",
> -               sp->responder_resources);
> -
>         memset(&conn_param, 0, sizeof(conn_param));
>         conn_param.initiator_depth =3D sp->initiator_depth;
>         conn_param.responder_resources =3D sp->responder_resources;
> --
> 2.43.0
>


--=20
Thanks,

Steve

