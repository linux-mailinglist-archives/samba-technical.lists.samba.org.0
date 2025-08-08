Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBD3B1DFE8
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 02:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YmE1LlOEUtvz+TL+UgFfQLraGuHiXFiYc9EMH4RbvsU=; b=H0uGtF3SmAL2RZrWKek1W3krRZ
	3dKG9IgKB3iC/uiOmJOVz6dlAoOXq/Xi3si6XoVgR1576DPPMGz7IDL0VJtRCR2HKAaUwVEMT9xgW
	+QWznh9rBZjAT1PL0jgEbhBEcnACXJQ75pf/clSCexzvsLJp6DatDoradj44SnQk4IjtNDoMy0O/c
	dfGhgsi87vV8ZU10G11Og/snA2ERiJRyUzUCQQxHKmqG0ChO/aOCh8fo1m6bNG0NRnr85RnO9sCoP
	pDWNpxQDzhR2DmLnzZOj1SHd/sjWtTAIbQI0XU0zW+Y9lTTDtdXijmxaoT0Rv4U5NUput3KLxeI4h
	hZDfOGjQ==;
Received: from ip6-localhost ([::1]:21470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukAhM-00EdAb-9G; Fri, 08 Aug 2025 00:11:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:42532) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukAhG-00EdAU-6O
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 00:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A28743D37
 for <samba-technical@lists.samba.org>; Fri,  8 Aug 2025 00:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7AFC4CEF4
 for <samba-technical@lists.samba.org>; Fri,  8 Aug 2025 00:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754611844;
 bh=ketsSoqu3lz98lQ1ow9AnMu7Gs0Wd6hu8sYXF0oReBs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V7jZo7bHxjveu+Mw1b0uAgSMnkQa3961y3phoW4OO8fKNXyL10lg8HF1xCfmWhDKe
 MHeTudndR793XIrc6123aMq/BY2eeWFFZJKh6NyiI+Dep3SL0unLHl4bSk3Rsg6/xP
 XKMgFdpoHjoNZDUmGFe3nBQv8BHwyoywrrl9XoLiQopUxMAR4B9504ejK6gcArxgAE
 8YuePszzEIpdAuGvtV3JaGb+6qboOTZOc0kmrIqtJ3eaKfkheYOve1+9qICAKoH6p1
 6oQXO/gzIaXyQljUFZRkbYAA4NgBNyPAvzcZl0ERPS4KNYR2bNQtbBaqSnTW9e9PiJ
 AiAUXmIbZ/4mQ==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-af9180a11bcso325096966b.0
 for <samba-technical@lists.samba.org>; Thu, 07 Aug 2025 17:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV+ozOly0YtHDn33RWePTXqkRhDCWjfF0vUCx7rAYHXTywJBlaOCoY8HKRPn1XacrHhaGEJGs0D9ckLOJQ6Arw=@lists.samba.org
X-Gm-Message-State: AOJu0Yw38tyeuptPXNuGI8ifj014HDhud3TJF/sTgAQ+Qpf44dJAurpE
 KTkwAP+6oqun8ufQIpwpcft+qBqFObln89N9Ihf+h4EdHu/Cu6pwXk5BDd0lf3K1035wPBsyYg5
 W6IzfMc1SafBvRFEDt0xGYbteKmrQkFg=
X-Google-Smtp-Source: AGHT+IHXRsA6WfhsbsqQXKhQvqfe9LHXP4DX5sUNI31sVt+L/OW0NcLxWTMOvZrtRMkBrxLFSaW3ZxZbA4ffkmNXjKo=
X-Received: by 2002:a17:907:94c1:b0:af2:5687:c088 with SMTP id
 a640c23a62f3a-af9c6fd8bcdmr61852966b.14.1754611842753; Thu, 07 Aug 2025
 17:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754501401.git.metze@samba.org>
 <098bd91b7e846cb20305a6d1b4005abf10cd5db8.1754501401.git.metze@samba.org>
 <6dd6bec0-cfac-414d-8c3b-a7ec91be657e@samba.org>
In-Reply-To: <6dd6bec0-cfac-414d-8c3b-a7ec91be657e@samba.org>
Date: Fri, 8 Aug 2025 09:10:29 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8iyzSAJeAoT8YNAg9A5N1u=LgdrqkZDmiCpOM0kKAAOA@mail.gmail.com>
X-Gm-Features: Ac12FXzTL2OB_xv7HivLJbA78G0UIntV7lPJcplternwg5ekpR6snGAsIc13jtI
Message-ID: <CAKYAXd8iyzSAJeAoT8YNAg9A5N1u=LgdrqkZDmiCpOM0kKAAOA@mail.gmail.com>
Subject: Re: ksmbd common smbdirect headers for 6.17-rc1? (Re: [PATCH 08/18]
 smb: server: make use of common smbdirect_pdu.h)
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 8, 2025 at 12:47=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Namjae,
>
> maybe I'm able to get to a point where we just have this:
>
> struct smb_direct_transport {
>          struct ksmbd_transport  transport;
>
>          struct smbdirect_socket socket;
> };
>
> If I get there tomorrow evening I'm wondering if I should also post that
> patchset for inclusion into 6.17-rc1.
>
> Should I try that or would this be for 6.18 anyway?
>
> What do you think?
It seems a bit late to merge into 6.17-rc1, so I've told Steve to
merge your patches into #for-next.
I think you can work on #for-next as a base and send new patches to the lis=
t.

Thanks.
> metze
>
> Am 06.08.25 um 19:35 schrieb Stefan Metzmacher via samba-technical:
> > Cc: Steve French <smfrench@gmail.com>
> > Cc: Tom Talpey <tom@talpey.com>
> > Cc: Long Li <longli@microsoft.com>
> > Cc: Namjae Jeon <linkinjeon@kernel.org>
> > Cc: Hyunchul Lee <hyc.lee@gmail.com>
> > Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
> > Cc: linux-cifs@vger.kernel.org
> > Cc: samba-technical@lists.samba.org
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >   fs/smb/server/transport_rdma.c | 49 +++++++++++++++++----------------=
-
> >   fs/smb/server/transport_rdma.h | 41 ----------------------------
> >   2 files changed, 25 insertions(+), 65 deletions(-)
> >
> > diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_r=
dma.c
> > index 8d366db5f605..275199fef4e5 100644
> > --- a/fs/smb/server/transport_rdma.c
> > +++ b/fs/smb/server/transport_rdma.c
> > @@ -23,12 +23,13 @@
> >   #include "connection.h"
> >   #include "smb_common.h"
> >   #include "../common/smb2status.h"
> > +#include "../common/smbdirect/smbdirect_pdu.h"
> >   #include "transport_rdma.h"
> >
> >   #define SMB_DIRECT_PORT_IWARP               5445
> >   #define SMB_DIRECT_PORT_INFINIBAND  445
> >
> > -#define SMB_DIRECT_VERSION_LE                cpu_to_le16(0x0100)
> > +#define SMB_DIRECT_VERSION_LE                cpu_to_le16(SMBDIRECT_V1)
> >
> >   /* SMB_DIRECT negotiation timeout in seconds */
> >   #define SMB_DIRECT_NEGOTIATE_TIMEOUT                120
> > @@ -472,8 +473,8 @@ static int smb_direct_check_recvmsg(struct smb_dire=
ct_recvmsg *recvmsg)
> >   {
> >       switch (recvmsg->type) {
> >       case SMB_DIRECT_MSG_DATA_TRANSFER: {
> > -             struct smb_direct_data_transfer *req =3D
> > -                     (struct smb_direct_data_transfer *)recvmsg->packe=
t;
> > +             struct smbdirect_data_transfer *req =3D
> > +                     (struct smbdirect_data_transfer *)recvmsg->packet=
;
> >               struct smb2_hdr *hdr =3D (struct smb2_hdr *)(recvmsg->pac=
ket
> >                               + le32_to_cpu(req->data_offset));
> >               ksmbd_debug(RDMA,
> > @@ -485,8 +486,8 @@ static int smb_direct_check_recvmsg(struct smb_dire=
ct_recvmsg *recvmsg)
> >               break;
> >       }
> >       case SMB_DIRECT_MSG_NEGOTIATE_REQ: {
> > -             struct smb_direct_negotiate_req *req =3D
> > -                     (struct smb_direct_negotiate_req *)recvmsg->packe=
t;
> > +             struct smbdirect_negotiate_req *req =3D
> > +                     (struct smbdirect_negotiate_req *)recvmsg->packet=
;
> >               ksmbd_debug(RDMA,
> >                           "MinVersion: %u, MaxVersion: %u, CreditReques=
ted: %u, MaxSendSize: %u, MaxRecvSize: %u, MaxFragmentedSize: %u\n",
> >                           le16_to_cpu(req->min_version),
> > @@ -540,7 +541,7 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
> >
> >       switch (recvmsg->type) {
> >       case SMB_DIRECT_MSG_NEGOTIATE_REQ:
> > -             if (wc->byte_len < sizeof(struct smb_direct_negotiate_req=
)) {
> > +             if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)=
) {
> >                       put_recvmsg(t, recvmsg);
> >                       smb_direct_disconnect_rdma_connection(t);
> >                       return;
> > @@ -552,13 +553,13 @@ static void recv_done(struct ib_cq *cq, struct ib=
_wc *wc)
> >               wake_up_interruptible(&t->wait_status);
> >               return;
> >       case SMB_DIRECT_MSG_DATA_TRANSFER: {
> > -             struct smb_direct_data_transfer *data_transfer =3D
> > -                     (struct smb_direct_data_transfer *)recvmsg->packe=
t;
> > +             struct smbdirect_data_transfer *data_transfer =3D
> > +                     (struct smbdirect_data_transfer *)recvmsg->packet=
;
> >               unsigned int data_length;
> >               int avail_recvmsg_count, receive_credits;
> >
> >               if (wc->byte_len <
> > -                 offsetof(struct smb_direct_data_transfer, padding)) {
> > +                 offsetof(struct smbdirect_data_transfer, padding)) {
> >                       put_recvmsg(t, recvmsg);
> >                       smb_direct_disconnect_rdma_connection(t);
> >                       return;
> > @@ -566,7 +567,7 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
> >
> >               data_length =3D le32_to_cpu(data_transfer->data_length);
> >               if (data_length) {
> > -                     if (wc->byte_len < sizeof(struct smb_direct_data_=
transfer) +
> > +                     if (wc->byte_len < sizeof(struct smbdirect_data_t=
ransfer) +
> >                           (u64)data_length) {
> >                               put_recvmsg(t, recvmsg);
> >                               smb_direct_disconnect_rdma_connection(t);
> > @@ -598,7 +599,7 @@ static void recv_done(struct ib_cq *cq, struct ib_w=
c *wc)
> >                          &t->send_credits);
> >
> >               if (le16_to_cpu(data_transfer->flags) &
> > -                 SMB_DIRECT_RESPONSE_REQUESTED)
> > +                 SMBDIRECT_FLAG_RESPONSE_REQUESTED)
> >                       queue_work(smb_direct_wq, &t->send_immediate_work=
);
> >
> >               if (atomic_read(&t->send_credits) > 0)
> > @@ -664,7 +665,7 @@ static int smb_direct_read(struct ksmbd_transport *=
t, char *buf,
> >                          unsigned int size, int unused)
> >   {
> >       struct smb_direct_recvmsg *recvmsg;
> > -     struct smb_direct_data_transfer *data_transfer;
> > +     struct smbdirect_data_transfer *data_transfer;
> >       int to_copy, to_read, data_read, offset;
> >       u32 data_length, remaining_data_length, data_offset;
> >       int rc;
> > @@ -1001,7 +1002,7 @@ static int smb_direct_create_header(struct smb_di=
rect_transport *t,
> >                                   struct smb_direct_sendmsg **sendmsg_o=
ut)
> >   {
> >       struct smb_direct_sendmsg *sendmsg;
> > -     struct smb_direct_data_transfer *packet;
> > +     struct smbdirect_data_transfer *packet;
> >       int header_length;
> >       int ret;
> >
> > @@ -1010,7 +1011,7 @@ static int smb_direct_create_header(struct smb_di=
rect_transport *t,
> >               return PTR_ERR(sendmsg);
> >
> >       /* Fill in the packet header */
> > -     packet =3D (struct smb_direct_data_transfer *)sendmsg->packet;
> > +     packet =3D (struct smbdirect_data_transfer *)sendmsg->packet;
> >       packet->credits_requested =3D cpu_to_le16(t->send_credit_target);
> >       packet->credits_granted =3D cpu_to_le16(manage_credits_prior_send=
ing(t));
> >
> > @@ -1033,11 +1034,11 @@ static int smb_direct_create_header(struct smb_=
direct_transport *t,
> >                   le32_to_cpu(packet->remaining_data_length));
> >
> >       /* Map the packet to DMA */
> > -     header_length =3D sizeof(struct smb_direct_data_transfer);
> > +     header_length =3D sizeof(struct smbdirect_data_transfer);
> >       /* If this is a packet without payload, don't send padding */
> >       if (!size)
> >               header_length =3D
> > -                     offsetof(struct smb_direct_data_transfer, padding=
);
> > +                     offsetof(struct smbdirect_data_transfer, padding)=
;
> >
> >       sendmsg->sge[0].addr =3D ib_dma_map_single(t->cm_id->device,
> >                                                (void *)packet,
> > @@ -1212,7 +1213,7 @@ static int smb_direct_writev(struct ksmbd_transpo=
rt *t,
> >       int remaining_data_length;
> >       int start, i, j;
> >       int max_iov_size =3D st->max_send_size -
> > -                     sizeof(struct smb_direct_data_transfer);
> > +                     sizeof(struct smbdirect_data_transfer);
> >       int ret;
> >       struct kvec vec;
> >       struct smb_direct_send_ctx send_ctx;
> > @@ -1560,18 +1561,18 @@ static int smb_direct_send_negotiate_response(s=
truct smb_direct_transport *t,
> >                                             int failed)
> >   {
> >       struct smb_direct_sendmsg *sendmsg;
> > -     struct smb_direct_negotiate_resp *resp;
> > +     struct smbdirect_negotiate_resp *resp;
> >       int ret;
> >
> >       sendmsg =3D smb_direct_alloc_sendmsg(t);
> >       if (IS_ERR(sendmsg))
> >               return -ENOMEM;
> >
> > -     resp =3D (struct smb_direct_negotiate_resp *)sendmsg->packet;
> > +     resp =3D (struct smbdirect_negotiate_resp *)sendmsg->packet;
> >       if (failed) {
> >               memset(resp, 0, sizeof(*resp));
> > -             resp->min_version =3D cpu_to_le16(0x0100);
> > -             resp->max_version =3D cpu_to_le16(0x0100);
> > +             resp->min_version =3D SMB_DIRECT_VERSION_LE;
> > +             resp->max_version =3D SMB_DIRECT_VERSION_LE;
> >               resp->status =3D STATUS_NOT_SUPPORTED;
> >       } else {
> >               resp->status =3D STATUS_SUCCESS;
> > @@ -1803,7 +1804,7 @@ static int smb_direct_create_pools(struct smb_dir=
ect_transport *t)
> >       snprintf(name, sizeof(name), "smb_direct_rqst_pool_%p", t);
> >       t->sendmsg_cache =3D kmem_cache_create(name,
> >                                            sizeof(struct smb_direct_sen=
dmsg) +
> > -                                           sizeof(struct smb_direct_ne=
gotiate_resp),
> > +                                           sizeof(struct smbdirect_neg=
otiate_resp),
> >                                            0, SLAB_HWCACHE_ALIGN, NULL)=
;
> >       if (!t->sendmsg_cache)
> >               return -ENOMEM;
> > @@ -1936,7 +1937,7 @@ static int smb_direct_prepare(struct ksmbd_transp=
ort *t)
> >   {
> >       struct smb_direct_transport *st =3D smb_trans_direct_transfort(t)=
;
> >       struct smb_direct_recvmsg *recvmsg;
> > -     struct smb_direct_negotiate_req *req;
> > +     struct smbdirect_negotiate_req *req;
> >       int ret;
> >
> >       ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
> > @@ -1955,7 +1956,7 @@ static int smb_direct_prepare(struct ksmbd_transp=
ort *t)
> >       if (ret =3D=3D -ECONNABORTED)
> >               goto out;
> >
> > -     req =3D (struct smb_direct_negotiate_req *)recvmsg->packet;
> > +     req =3D (struct smbdirect_negotiate_req *)recvmsg->packet;
> >       st->max_recv_size =3D min_t(int, st->max_recv_size,
> >                                 le32_to_cpu(req->preferred_send_size));
> >       st->max_send_size =3D min_t(int, st->max_send_size,
> > diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_r=
dma.h
> > index 77aee4e5c9dc..0fb692c40e21 100644
> > --- a/fs/smb/server/transport_rdma.h
> > +++ b/fs/smb/server/transport_rdma.h
> > @@ -11,47 +11,6 @@
> >   #define SMBD_MIN_IOSIZE (512 * 1024)
> >   #define SMBD_MAX_IOSIZE (16 * 1024 * 1024)
> >
> > -/* SMB DIRECT negotiation request packet [MS-SMBD] 2.2.1 */
> > -struct smb_direct_negotiate_req {
> > -     __le16 min_version;
> > -     __le16 max_version;
> > -     __le16 reserved;
> > -     __le16 credits_requested;
> > -     __le32 preferred_send_size;
> > -     __le32 max_receive_size;
> > -     __le32 max_fragmented_size;
> > -} __packed;
> > -
> > -/* SMB DIRECT negotiation response packet [MS-SMBD] 2.2.2 */
> > -struct smb_direct_negotiate_resp {
> > -     __le16 min_version;
> > -     __le16 max_version;
> > -     __le16 negotiated_version;
> > -     __le16 reserved;
> > -     __le16 credits_requested;
> > -     __le16 credits_granted;
> > -     __le32 status;
> > -     __le32 max_readwrite_size;
> > -     __le32 preferred_send_size;
> > -     __le32 max_receive_size;
> > -     __le32 max_fragmented_size;
> > -} __packed;
> > -
> > -#define SMB_DIRECT_RESPONSE_REQUESTED 0x0001
> > -
> > -/* SMB DIRECT data transfer packet with payload [MS-SMBD] 2.2.3 */
> > -struct smb_direct_data_transfer {
> > -     __le16 credits_requested;
> > -     __le16 credits_granted;
> > -     __le16 flags;
> > -     __le16 reserved;
> > -     __le32 remaining_data_length;
> > -     __le32 data_offset;
> > -     __le32 data_length;
> > -     __le32 padding;
> > -     __u8 buffer[];
> > -} __packed;
> > -
> >   #ifdef CONFIG_SMB_SERVER_SMBDIRECT
> >   int ksmbd_rdma_init(void);
> >   void ksmbd_rdma_destroy(void);
>

