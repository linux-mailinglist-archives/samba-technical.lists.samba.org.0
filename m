Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C864B55A82
	for <lists+samba-technical@lfdr.de>; Sat, 13 Sep 2025 02:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+KW5G3MXY/0pVf8/DjV6yOsnsMGNgnj9XmP/64EtE3w=; b=cMeMLK3s36eZqLyU3gWXSoJrTp
	44y57C2dfxcvcnO8Sp3+jtqnD87SJ7jsKn6aw15gDRwJyCNnmVEoYQNrrom0SC9oIFVkdxxpVBxII
	B9Q1AocLED97exskCAdsGk3vW51AsMTFJ6/DVmfoZv9GVd8RvE/DrAJ1GFFfQu2Exkoh40VoxU2AD
	hU8puy+s3k9vLzlJwZ3P4Qna8atRNtxmEQ7iG3h6W4vs9FfSlXjX0pbDl4Q0mwEXHUEZW4VDbSxxu
	2/zT2o/h4RafG34+CHyxIfImNiTChHDaogtVCV0JT9zfh/bGiKfs9UGdq0PFg9HetlHjxolZZlh52
	25iRWBVA==;
Received: from ip6-localhost ([::1]:21748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uxDjc-003ftc-CW; Sat, 13 Sep 2025 00:03:20 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:58625) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uxDjX-003ftU-4r
 for samba-technical@lists.samba.org; Sat, 13 Sep 2025 00:03:18 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-7251e6b2f9eso13885416d6.1
 for <samba-technical@lists.samba.org>; Fri, 12 Sep 2025 17:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757721793; x=1758326593; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KW5G3MXY/0pVf8/DjV6yOsnsMGNgnj9XmP/64EtE3w=;
 b=NPp2uLxSfO724LrsWHMmEecRCO5M7h2DKzQF4BhgVICefmPnTwnlYom6U2b5ctol65
 N6LA5NsepJ8XsRZ3xLjHZQQnvyuOxJmNDaCXh2vgAhOMth0KCv+rc1Jglkh0UVVqf6wb
 quAKAWPURmgymtcWmGKDb8X92NXkpI2sE/LsY+LUkLLyop3QQNbwv1j3EilT1+8pVcCZ
 gJqwX+Sr4VWa5W2uKwFkBXyfy6QsS5DU1DmOs1I90BuEcjcGm8nraenUWVMGvUga4Uf4
 V8SKNgREGRuav6puwWlLFh/m8XUvByh6TMaNZehAkIrQXxsMSfhoYm/kfk4abKG28zNY
 9yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757721793; x=1758326593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KW5G3MXY/0pVf8/DjV6yOsnsMGNgnj9XmP/64EtE3w=;
 b=ZTQsP2ffVZjIL4l9Ek8/t/oD9GzLp51hlWdbNeqOHxiklRPwMskVJMi2DuTaoS/STo
 Ku+r/x8ISelDIvtK4xR1BOR39dRvoCHm3TRKVY3hT29mzqXEb2Qmt2Yi3wbvHAKqQwOf
 z/hQjlYR1gOVrlVoPC1jsRNyf2o2+Czz1aYpuFzsUxRqWs8vh4yQAc+T8Y7p/vhLuavB
 +yn1iqKgeK9/HYC/iwY+5kTJFVR9Lh1VnXQHkIi0y6iLB+TtDePz4zedlecUkmKWrg74
 0ucgQ5EGIMwmvQ4bdzyjS0rCfGWYpP4qTSBLg6yK0Y77Xmk9r+N3+qAWUd92FbfTguOr
 C2zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqkfYHkoy1UUUnR7fcNMY8OpAm0gMU0EHLq/Kbx3yFXHO4w0+zrYPrYK+2pS/606oLUv5ITWwrkjOoRuonmbE=@lists.samba.org
X-Gm-Message-State: AOJu0Yzvb2m0uL7him3VGb71c9h0krvHnM2P5GocJAg/DrSRV1T5oXR5
 53jMH5Jj3U2luliqCAbwXiMUuotto04A2xDHxtBxbeJhB4R5wEufAwqrjDvElwuDdkiPmVUjYew
 mqRdU4ChdipJsjtdws/tDaN0yF7emoSc=
X-Gm-Gg: ASbGnctEWmGzqbCGIDKQMOPNhrrQG+0+Y0aIfKdtGqSs1CaQJTnlb/BBajliZiSy9U5
 xEyaICaQrFZYAJO2TW79no/bDpraypEZ1bV6H0Jm94TW2YDFtTFXDpZ0fksVuhtsov1ySca4vcE
 WOssrTo0cJ1ly8ttIVKi4ATVfxmWIYUwsqfJ52sJhXjz5DTMhP1354USGcbvHBeGvpfZcx0vVhX
 qXHvtjiqB+MmgbThGQxAHTIudsjJeHxYG851z8RCFwhJt5d0VCmMAkOO0dwgayydIdC82p6g+Qr
 77GN7ZTPVzVw6hL/WWfs1QY5BbG0/VsJBvdaNpQQyCqjlXHv+3WmTJ8/ppX28lzy2a5h2wOCpdV
 G
X-Google-Smtp-Source: AGHT+IGVQviI3GUKab3s7x7KIHH/QqolYWI5+Clhn+dSVA9v6GWnOzJzvX+IxR3a6HD2AZYZqI8qRD4qZn3a+JLfc0s=
X-Received: by 2002:a05:6214:29c2:b0:722:3a59:fd9c with SMTP id
 6a1803df08f44-767bc9e3085mr69038776d6.23.1757721792895; Fri, 12 Sep 2025
 17:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756139607.git.metze@samba.org>
 <e6c0ddfe-8942-47a0-8277-b4176a5918e0@samba.org>
 <CAH2r5msKSbUfOVXUabNQep3s2H4kW0AMnDh0XA68Pk3_oqaHCQ@mail.gmail.com>
 <642872f4-e076-4588-b011-920479b06949@samba.org>
 <CAKYAXd8fJtjESeMiNmAACw8jGkEU_JWCQd3=9XFf_rdx6TxqUw@mail.gmail.com>
In-Reply-To: <CAKYAXd8fJtjESeMiNmAACw8jGkEU_JWCQd3=9XFf_rdx6TxqUw@mail.gmail.com>
Date: Fri, 12 Sep 2025 19:03:01 -0500
X-Gm-Features: AS18NWCUhPcdoIClDu4V14I2QLHpssKx13x_q7WjKfy2acnhuMBRLtZrfpa7f2A
Message-ID: <CAH2r5ms8JUL+R8zDVa4L2=ydESUFjvPPLdJxHTeOWPFmwCBHQQ@mail.gmail.com>
Subject: Re: replace for-next-next... Re: [PATCH v4 000/142] smb:
 smbdirect/client/server: make use of common structures
To: Namjae Jeon <linkinjeon@kernel.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Tom Talpey <tom@talpey.com>,
 samba-technical@lists.samba.org, linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

updated cifs-2.6.git for-next with the client patch

On Wed, Sep 10, 2025 at 6:36=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Thu, Sep 11, 2025 at 4:05=E2=80=AFAM Stefan Metzmacher <metze@samba.or=
g> wrote:
> >
> > Hi Steve, hi Namjae,
> Hi Metze,
> >
> > I found "ksmbd: smbdirect: validate data_offset and data_length field o=
f smb_direct_data_transfer"
> > https://git.samba.org/?p=3Dksmbd.git;a=3Dcommitdiff;h=3D927f8fe05e334d0=
16c598d2cc965161c2808d9ba
> > in ksmbd-for-next-next.
> >
> > I added a Fixes and Reviewed-by tag
> > https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3Dfa36d=
b4e8d62aa9c3ba1200323d8e01e4eb88b19
> > and two additional patches:
> I will update it with your tags.
> > ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_=
recv_size
> > https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3D9e881=
174900e53dd2b17c0c0933cc4395ceb47a6
> Looks good to me. I will apply it to #ksmbd-for-next-next.
>
> > smb: client: let recv_done verify data_offset, data_length and remainin=
g_data_length
> > https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dcommitdiff;h=3D174fa=
eea9ee496b724206d405b74db8b05729f11
> Looks good to me. Reviewed-by: Namjae Jeon <linkinjeon@kernel.org> for
> this client patch.
>
> Thanks!
> >
> > I think these should go into 6.17.
> >
> > As there as conflicts with for-next-next I rebased it again
> > and made sure each commit compiles and the result still passes
> > the tests I made last time.
> >
> > The result can be found under
> > git fetch https://git.samba.org/metze/linux/wip.git for-6.18/fs-smb-202=
50910-v6
> > https://git.samba.org/?p=3Dmetze/linux/wip.git;a=3Dshortlog;h=3Drefs/he=
ads/for-6.18/fs-smb-20250910-v6
> >
> > Please have a look and replace for-next-next again...
> > The diff against the current for-next-next (e2e99af785ee91ce20c6d583e39=
6660494db77a2)
> > and for-6.18/fs-smb-20250910-v6 (1fb2a52741e836f54a4691cbd74d9d70d736e5=
06) follows below.
> >
> > Thanks!
> > metze
> >
> >   fs/smb/client/smbdirect.c                  | 19 ++++++++++++++++++-
> >   fs/smb/common/smbdirect/smbdirect_socket.h |  2 +-
> >   fs/smb/server/transport_rdma.c             | 25 +++++++++++++++++----=
----
> >   3 files changed, 36 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> > index 322334097e30..6215a6e91c67 100644
> > --- a/fs/smb/client/smbdirect.c
> > +++ b/fs/smb/client/smbdirect.c
> > @@ -548,7 +548,9 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
> >         struct smbdirect_socket *sc =3D response->socket;
> >         struct smbdirect_socket_parameters *sp =3D &sc->parameters;
> >         u16 old_recv_credit_target;
> > -       int data_length =3D 0;
> > +       u32 data_offset =3D 0;
> > +       u32 data_length =3D 0;
> > +       u32 remaining_data_length =3D 0;
> >         bool negotiate_done =3D false;
> >
> >         log_rdma_recv(INFO,
> > @@ -600,7 +602,22 @@ static void recv_done(struct ib_cq *cq, struct ib_=
wc *wc)
> >         /* SMBD data transfer packet */
> >         case SMBDIRECT_EXPECT_DATA_TRANSFER:
> >                 data_transfer =3D smbdirect_recv_io_payload(response);
> > +
> > +               if (wc->byte_len <
> > +                   offsetof(struct smbdirect_data_transfer, padding))
> > +                       goto error;
> > +
> > +               remaining_data_length =3D le32_to_cpu(data_transfer->re=
maining_data_length);
> > +               data_offset =3D le32_to_cpu(data_transfer->data_offset)=
;
> >                 data_length =3D le32_to_cpu(data_transfer->data_length)=
;
> > +               if (wc->byte_len < data_offset ||
> > +                   wc->byte_len < (u64)data_offset + data_length)
> > +                       goto error;
> > +
> > +               if (remaining_data_length > sp->max_fragmented_recv_siz=
e ||
> > +                   data_length > sp->max_fragmented_recv_size ||
> > +                   (u64)remaining_data_length + (u64)data_length > (u6=
4)sp->max_fragmented_recv_size)
> > +                       goto error;
> >
> >                 if (data_length) {
> >                         if (sc->recv_io.reassembly.full_packet_received=
)
> > diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common=
/smbdirect/smbdirect_socket.h
> > index 8542de12002a..91eb02fb1600 100644
> > --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> > +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> > @@ -63,7 +63,7 @@ const char *smbdirect_socket_status_string(enum smbdi=
rect_socket_status status)
> >         case SMBDIRECT_SOCKET_DISCONNECTING:
> >                 return "DISCONNECTING";
> >         case SMBDIRECT_SOCKET_DISCONNECTED:
> > -               return "DISCONNECTED,";
> > +               return "DISCONNECTED";
> >         case SMBDIRECT_SOCKET_DESTROYED:
> >                 return "DESTROYED";
> >         }
> > diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_r=
dma.c
> > index 33d2f5bdb827..e371d8f4c80b 100644
> > --- a/fs/smb/server/transport_rdma.c
> > +++ b/fs/smb/server/transport_rdma.c
> > @@ -538,7 +538,7 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
> >         case SMBDIRECT_EXPECT_DATA_TRANSFER: {
> >                 struct smbdirect_data_transfer *data_transfer =3D
> >                         (struct smbdirect_data_transfer *)recvmsg->pack=
et;
> > -               unsigned int data_length;
> > +               u32 remaining_data_length, data_offset, data_length;
> >                 u16 old_recv_credit_target;
> >
> >                 if (wc->byte_len <
> > @@ -548,15 +548,24 @@ static void recv_done(struct ib_cq *cq, struct ib=
_wc *wc)
> >                         return;
> >                 }
> >
> > +               remaining_data_length =3D le32_to_cpu(data_transfer->re=
maining_data_length);
> >                 data_length =3D le32_to_cpu(data_transfer->data_length)=
;
> > -               if (data_length) {
> > -                       if (wc->byte_len < sizeof(struct smbdirect_data=
_transfer) +
> > -                           (u64)data_length) {
> > -                               put_recvmsg(sc, recvmsg);
> > -                               smb_direct_disconnect_rdma_connection(s=
c);
> > -                               return;
> > -                       }
> > +               data_offset =3D le32_to_cpu(data_transfer->data_offset)=
;
> > +               if (wc->byte_len < data_offset ||
> > +                   wc->byte_len < (u64)data_offset + data_length) {
> > +                       put_recvmsg(sc, recvmsg);
> > +                       smb_direct_disconnect_rdma_connection(sc);
> > +                       return;
> > +               }
> > +               if (remaining_data_length > sp->max_fragmented_recv_siz=
e ||
> > +                   data_length > sp->max_fragmented_recv_size ||
> > +                   (u64)remaining_data_length + (u64)data_length > (u6=
4)sp->max_fragmented_recv_size) {
> > +                       put_recvmsg(sc, recvmsg);
> > +                       smb_direct_disconnect_rdma_connection(sc);
> > +                       return;
> > +               }
> >
> > +               if (data_length) {
> >                         if (sc->recv_io.reassembly.full_packet_received=
)
> >                                 recvmsg->first_segment =3D true;
> >
> >
> >
> >



--=20
Thanks,

Steve

