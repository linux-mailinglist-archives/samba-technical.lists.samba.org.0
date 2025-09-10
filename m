Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5BB524BF
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 01:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZpB8Fog8ynXB+04Vt5s2Mg7EcGOyMN/vYrOQv03eDEk=; b=QxR3lZ4o6AyjdAZRrLWG+ZxCzG
	RvWjaX28m69LoU109ZeI8jN5qsiA7+8ofvZ/hjEK9rUEUPDIztP73chpootGfSY+7RWOfU/c/47ta
	0FCJVRxMu0zfrMmP/6D0N3El22edb9wS4ZyGZu+81cp1eTOjMqBP2vpkn/LTV68/+IGyTCBESHL17
	dZyp+U3G1S0KnI3KPupRDX1IyLuaLNyomCotIcR49Vpl6Kh4rAcMVsLSPX3/Y1qkqZdfIUJAUv9Iu
	l2BtC3Ol46RkLtBW0XtduQ7spmTnVZiI0hzlD+iYcEw53YYHkKJMM9Qb+1rpGpoIaokgSJE6OVoNq
	+mVM5VdA==;
Received: from ip6-localhost ([::1]:57256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwUMN-003VCH-CW; Wed, 10 Sep 2025 23:36:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:43026) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwUMG-003VC8-T6
 for samba-technical@lists.samba.org; Wed, 10 Sep 2025 23:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 773B9446A4
 for <samba-technical@lists.samba.org>; Wed, 10 Sep 2025 23:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573BDC4CEEB
 for <samba-technical@lists.samba.org>; Wed, 10 Sep 2025 23:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757547367;
 bh=i9leR6L+WicB6x8WhQZe7wlsxarJX0GqvR0t/Hg5zDQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WUh1kPiFrL2COTHahviWy6/+8K/dw7ITJfuALg8YKZZlNIcdyaC2wC5Ui5PlNc0Xr
 7wgVVdJWr89lOWgI+abF1U3R4dITdRyr3JNrfdLDoHgyd60cngH1uxYolfv+cZQe2o
 UZyWC+tJeWE3uwtE9tW5JMjXR5uK5qfRUXS20ZxUAmBv6neX0pglAetr9COkiqq1HF
 lCvomgc2T9hO8+h7JfG+OhR5OQRRJ9zElaRa0j7gySlNttv9Dx1P8PWaE0GAoMsNCH
 wxBdPW0vgsBX0yHOb+vN5qA9e5DY7zNHA7kAyJIh7f7QSgLSREVopagGl2IKeYdcpW
 C41QLRHdWzUIg==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-627b85e4c0fso244988a12.1
 for <samba-technical@lists.samba.org>; Wed, 10 Sep 2025 16:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKRhw6wFQrrKHO++zVpdUKiZe3GqJgDng9LbrXcYPeIc3hqJjFtDcIL3d+/+MTrHLb03nVdzRgIALNlYEYESM=@lists.samba.org
X-Gm-Message-State: AOJu0YzWHRu8gtLKPOReABfM0SA16+Pe9HTg8NxHbwHLBIW4z6c2oGTj
 UV+/si08c6EhpVQt3QX1ubCcZicL7eKBJxj8ekg2OuJ67mC4/9VK9vRaxmN3QGc/8GFKYuD61wo
 1QnwHjM7OO4MAV2PJDi/Tx51vVhKLtAA=
X-Google-Smtp-Source: AGHT+IH9ABmYs11y8MjsI68VnD3LYgM2hqYpmp6tEZr0C9c02Tas4nbKcLrWKy8I09b9mbc5ZsWz4q0DNu9j8mryMng=
X-Received: by 2002:a50:99d4:0:b0:61c:1d41:41bb with SMTP id
 4fb4d7f45d1cf-62e7b7c0b71mr925044a12.16.1757547365945; Wed, 10 Sep 2025
 16:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756139607.git.metze@samba.org>
 <e6c0ddfe-8942-47a0-8277-b4176a5918e0@samba.org>
 <CAH2r5msKSbUfOVXUabNQep3s2H4kW0AMnDh0XA68Pk3_oqaHCQ@mail.gmail.com>
 <642872f4-e076-4588-b011-920479b06949@samba.org>
In-Reply-To: <642872f4-e076-4588-b011-920479b06949@samba.org>
Date: Thu, 11 Sep 2025 08:35:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8fJtjESeMiNmAACw8jGkEU_JWCQd3=9XFf_rdx6TxqUw@mail.gmail.com>
X-Gm-Features: AS18NWAb9I02lNZVlKVNYxAQYQ96tj62pHFyLDpvONfTffNv2iRnFFcHwn9iGCs
Message-ID: <CAKYAXd8fJtjESeMiNmAACw8jGkEU_JWCQd3=9XFf_rdx6TxqUw@mail.gmail.com>
Subject: Re: replace for-next-next... Re: [PATCH v4 000/142] smb:
 smbdirect/client/server: make use of common structures
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 11, 2025 at 4:05=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Steve, hi Namjae,
Hi Metze,
>
> I found "ksmbd: smbdirect: validate data_offset and data_length field of =
smb_direct_data_transfer"
> https://git.samba.org/?p=3Dksmbd.git;a=3Dcommitdiff;h=3D927f8fe05e334d016=
c598d2cc965161c2808d9ba
> in ksmbd-for-next-next.
>
> I added a Fixes and Reviewed-by tag
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3Dfa36db4=
e8d62aa9c3ba1200323d8e01e4eb88b19
> and two additional patches:
I will update it with your tags.
> ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_re=
cv_size
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3D9e88117=
4900e53dd2b17c0c0933cc4395ceb47a6
Looks good to me. I will apply it to #ksmbd-for-next-next.

> smb: client: let recv_done verify data_offset, data_length and remaining_=
data_length
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3D174faee=
a9ee496b724206d405b74db8b05729f11
Looks good to me. Reviewed-by: Namjae Jeon <linkinjeon@kernel.org> for
this client patch.

Thanks!
>
> I think these should go into 6.17.
>
> As there as conflicts with for-next-next I rebased it again
> and made sure each commit compiles and the result still passes
> the tests I made last time.
>
> The result can be found under
> git fetch https://git.samba.org/metze/linux/wip.git for-6.18/fs-smb-20250=
910-v6
> https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dshortlog;h=3Drefs/head=
s/for-6.18/fs-smb-20250910-v6
>
> Please have a look and replace for-next-next again...
> The diff against the current for-next-next (e2e99af785ee91ce20c6d583e3966=
60494db77a2)
> and for-6.18/fs-smb-20250910-v6 (1fb2a52741e836f54a4691cbd74d9d70d736e506=
) follows below.
>
> Thanks!
> metze
>
>   fs/smb/client/smbdirect.c                  | 19 ++++++++++++++++++-
>   fs/smb/common/smbdirect/smbdirect_socket.h |  2 +-
>   fs/smb/server/transport_rdma.c             | 25 +++++++++++++++++------=
--
>   3 files changed, 36 insertions(+), 10 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 322334097e30..6215a6e91c67 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -548,7 +548,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc =
*wc)
>         struct smbdirect_socket *sc =3D response->socket;
>         struct smbdirect_socket_parameters *sp =3D &sc->parameters;
>         u16 old_recv_credit_target;
> -       int data_length =3D 0;
> +       u32 data_offset =3D 0;
> +       u32 data_length =3D 0;
> +       u32 remaining_data_length =3D 0;
>         bool negotiate_done =3D false;
>
>         log_rdma_recv(INFO,
> @@ -600,7 +602,22 @@ static void recv_done(struct ib_cq *cq, struct ib_wc=
 *wc)
>         /* SMBD data transfer packet */
>         case SMBDIRECT_EXPECT_DATA_TRANSFER:
>                 data_transfer =3D smbdirect_recv_io_payload(response);
> +
> +               if (wc->byte_len <
> +                   offsetof(struct smbdirect_data_transfer, padding))
> +                       goto error;
> +
> +               remaining_data_length =3D le32_to_cpu(data_transfer->rema=
ining_data_length);
> +               data_offset =3D le32_to_cpu(data_transfer->data_offset);
>                 data_length =3D le32_to_cpu(data_transfer->data_length);
> +               if (wc->byte_len < data_offset ||
> +                   wc->byte_len < (u64)data_offset + data_length)
> +                       goto error;
> +
> +               if (remaining_data_length > sp->max_fragmented_recv_size =
||
> +                   data_length > sp->max_fragmented_recv_size ||
> +                   (u64)remaining_data_length + (u64)data_length > (u64)=
sp->max_fragmented_recv_size)
> +                       goto error;
>
>                 if (data_length) {
>                         if (sc->recv_io.reassembly.full_packet_received)
> diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/s=
mbdirect/smbdirect_socket.h
> index 8542de12002a..91eb02fb1600 100644
> --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> @@ -63,7 +63,7 @@ const char *smbdirect_socket_status_string(enum smbdire=
ct_socket_status status)
>         case SMBDIRECT_SOCKET_DISCONNECTING:
>                 return "DISCONNECTING";
>         case SMBDIRECT_SOCKET_DISCONNECTED:
> -               return "DISCONNECTED,";
> +               return "DISCONNECTED";
>         case SMBDIRECT_SOCKET_DESTROYED:
>                 return "DESTROYED";
>         }
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdm=
a.c
> index 33d2f5bdb827..e371d8f4c80b 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -538,7 +538,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc =
*wc)
>         case SMBDIRECT_EXPECT_DATA_TRANSFER: {
>                 struct smbdirect_data_transfer *data_transfer =3D
>                         (struct smbdirect_data_transfer *)recvmsg->packet=
;
> -               unsigned int data_length;
> +               u32 remaining_data_length, data_offset, data_length;
>                 u16 old_recv_credit_target;
>
>                 if (wc->byte_len <
> @@ -548,15 +548,24 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
>                         return;
>                 }
>
> +               remaining_data_length =3D le32_to_cpu(data_transfer->rema=
ining_data_length);
>                 data_length =3D le32_to_cpu(data_transfer->data_length);
> -               if (data_length) {
> -                       if (wc->byte_len < sizeof(struct smbdirect_data_t=
ransfer) +
> -                           (u64)data_length) {
> -                               put_recvmsg(sc, recvmsg);
> -                               smb_direct_disconnect_rdma_connection(sc)=
;
> -                               return;
> -                       }
> +               data_offset =3D le32_to_cpu(data_transfer->data_offset);
> +               if (wc->byte_len < data_offset ||
> +                   wc->byte_len < (u64)data_offset + data_length) {
> +                       put_recvmsg(sc, recvmsg);
> +                       smb_direct_disconnect_rdma_connection(sc);
> +                       return;
> +               }
> +               if (remaining_data_length > sp->max_fragmented_recv_size =
||
> +                   data_length > sp->max_fragmented_recv_size ||
> +                   (u64)remaining_data_length + (u64)data_length > (u64)=
sp->max_fragmented_recv_size) {
> +                       put_recvmsg(sc, recvmsg);
> +                       smb_direct_disconnect_rdma_connection(sc);
> +                       return;
> +               }
>
> +               if (data_length) {
>                         if (sc->recv_io.reassembly.full_packet_received)
>                                 recvmsg->first_segment =3D true;
>
>
>
>

