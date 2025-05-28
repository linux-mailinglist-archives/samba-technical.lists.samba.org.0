Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0BAC6D76
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=USK5gI7c2cmSgt+o+TQjSkfl3q3Ba+/nwHKHiweUOfM=; b=yTOAWnD5APQy/3z35MpSFM3BQe
	9eoAAR++aSHN+mglWv/fZgQpO8b/ANRLZ/VVZP4yuVZlq3w9+Zpq61pi/ng7tHMMngF9mjwt/1ndi
	bYCLCsv5OXVyPCdiiL8YbjPg7TxFbVTgSL4PdMBMiNigChoXMssCDRofKu1jkNt4vIYajEEQdufwV
	Vyb+z/PGaaLZsvvlL48nZMzEalVxgccNIys4gXy449x5PJOc1unYylLTdlDps7VLp7CgsrXScQT6q
	dFCOr9NWnU8RMCbW4TfQD0S6960Tjs0MlSNReyJOF+IC8wtaDzoRnvjihGUyyws7XsPEckjS66e+w
	3L0az99w==;
Received: from ip6-localhost ([::1]:30056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJGa-004Mf2-DS; Wed, 28 May 2025 16:04:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32106) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJFp-004MQf-1H
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=USK5gI7c2cmSgt+o+TQjSkfl3q3Ba+/nwHKHiweUOfM=; b=ahQnj+gkJF3k3lV8SmR9cP4ZaA
 CW5unMlLV7FAo8ZE65GnnLDJNCn3FQ0+6CvBOYvr/CYxLR1Lh08UgWWdDxKHkTU6rPG6rxxTmalpg
 JjX90a3pzX1xq/OrxJKZxNqRwn8Q4cT3He2QVqfDUekZ5UDRUBFt2gs1dymbzWuoI0sxMnLXP5dtJ
 t2FSL6YbKmXC8hF92Ci5+RDtA2EC0VSXWuLOMoR1w2RmuFirDC1dsSqA7KTL1ELoBBifftq9pnNWN
 peuiCypOaam/P0Qeb/kVgP5FcVegOzLP387k9C+B3SNJUM078uQ31t2AXMWOd2b1hVYtY4bf+67t8
 xof3qgPNOaJrNC/dbf6yLEqmKUz1oGGDWWmkb/eI0FNO2Mfxa4vh7ejbBdahRJwGjk5m/P6D2FGlq
 B8YsOVZiYf+4JzcozHOjTmdNb2o6s29UC57bVGcycmUkGnYdhXMaOy/EsyIaSdnJ+M6GEcPjeZ1sd
 HrGrl+3JlRbjKa608y7fr9Fq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJFm-007hXG-36; Wed, 28 May 2025 16:03:43 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 12/12] smb: server: make use of common
 smbdirect_socket_parameters
Date: Wed, 28 May 2025 18:01:41 +0200
Message-Id: <cd2bf77b8d82240ce25b7325871b18a88c37b8b2.1748446473.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748446473.git.metze@samba.org>
References: <cover.1748446473.git.metze@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 85 ++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 16044d473c34..ceedf4e45c60 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -105,12 +105,6 @@ struct smb_direct_transport {
 	bool			full_packet_received;
 	wait_queue_head_t	wait_status;
 
-	int			max_send_size;
-	int			max_recv_size;
-	int			max_fragmented_send_size;
-	int			max_fragmented_recv_size;
-	int			max_rdma_rw_size;
-
 	spinlock_t		reassembly_queue_lock;
 	struct list_head	reassembly_queue;
 	int			reassembly_data_length;
@@ -121,7 +115,6 @@ struct smb_direct_transport {
 	spinlock_t		receive_credit_lock;
 	int			recv_credits;
 	int			count_avail_recvmsg;
-	int			recv_credit_max;
 	int			recv_credit_target;
 
 	spinlock_t		recvmsg_queue_lock;
@@ -130,7 +123,6 @@ struct smb_direct_transport {
 	spinlock_t		empty_recvmsg_queue_lock;
 	struct list_head	empty_recvmsg_queue;
 
-	int			send_credit_target;
 	atomic_t		send_credits;
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
@@ -655,16 +647,18 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
 				struct smb_direct_recvmsg *recvmsg)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_recv_wr wr;
 	int ret;
 
 	recvmsg->sge.addr = ib_dma_map_single(sc->ib.dev,
-					      recvmsg->packet, t->max_recv_size,
+					      recvmsg->packet,
+					      sp->max_recv_size,
 					      DMA_FROM_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, recvmsg->sge.addr);
 	if (ret)
 		return ret;
-	recvmsg->sge.length = t->max_recv_size;
+	recvmsg->sge.length = sp->max_recv_size;
 	recvmsg->sge.lkey = sc->ib.pd->local_dma_lkey;
 	recvmsg->cqe.done = recv_done;
 
@@ -1039,6 +1033,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 				    struct smb_direct_sendmsg **sendmsg_out)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_sendmsg *sendmsg;
 	struct smbdirect_data_transfer *packet;
 	int header_length;
@@ -1050,7 +1045,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 
 	/* Fill in the packet header */
 	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
-	packet->credits_requested = cpu_to_le16(t->send_credit_target);
+	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
 	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
 
 	packet->flags = 0;
@@ -1251,9 +1246,10 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 {
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int remaining_data_length;
 	int start, i, j;
-	int max_iov_size = st->max_send_size -
+	int max_iov_size = sp->max_send_size -
 			sizeof(struct smbdirect_data_transfer);
 	int ret;
 	struct kvec vec;
@@ -1383,6 +1379,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 				bool is_read)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_rdma_rw_msg *msg, *next_msg;
 	int i, ret;
 	DECLARE_COMPLETION_ONSTACK(completion);
@@ -1395,7 +1392,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -ENOTCONN;
 
-	if (buf_len > t->max_rdma_rw_size)
+	if (buf_len > sp->max_read_write_size)
 		return -EINVAL;
 
 	/* calculate needed credits */
@@ -1609,6 +1606,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 					      int failed)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_sendmsg *sendmsg;
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
@@ -1630,13 +1628,13 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 		resp->negotiated_version = SMB_DIRECT_VERSION_LE;
 		resp->reserved = 0;
 		resp->credits_requested =
-				cpu_to_le16(t->send_credit_target);
+				cpu_to_le16(sp->send_credit_target);
 		resp->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
-		resp->max_readwrite_size = cpu_to_le32(t->max_rdma_rw_size);
-		resp->preferred_send_size = cpu_to_le32(t->max_send_size);
-		resp->max_receive_size = cpu_to_le32(t->max_recv_size);
+		resp->max_readwrite_size = cpu_to_le32(sp->max_read_write_size);
+		resp->preferred_send_size = cpu_to_le32(sp->max_send_size);
+		resp->max_receive_size = cpu_to_le32(sp->max_recv_size);
 		resp->max_fragmented_size =
-				cpu_to_le32(t->max_fragmented_recv_size);
+				cpu_to_le32(sp->max_fragmented_recv_size);
 	}
 
 	sendmsg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
@@ -1743,6 +1741,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 				  struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_device *device = sc->ib.dev;
 	int max_send_sges, max_rw_wrs, max_send_wrs;
 	unsigned int max_sge_per_wr, wrs_per_credit;
@@ -1750,10 +1749,10 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
 	 * SMB2 response could be mapped.
 	 */
-	t->max_send_size = smb_direct_max_send_size;
-	max_send_sges = DIV_ROUND_UP(t->max_send_size, PAGE_SIZE) + 3;
+	sp->max_send_size = smb_direct_max_send_size;
+	max_send_sges = DIV_ROUND_UP(sp->max_send_size, PAGE_SIZE) + 3;
 	if (max_send_sges > SMB_DIRECT_MAX_SEND_SGES) {
-		pr_err("max_send_size %d is too large\n", t->max_send_size);
+		pr_err("max_send_size %d is too large\n", sp->max_send_size);
 		return -EINVAL;
 	}
 
@@ -1764,9 +1763,9 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	 * are needed for MR registration, RDMA R/W, local & remote
 	 * MR invalidation.
 	 */
-	t->max_rdma_rw_size = smb_direct_max_read_write_size;
+	sp->max_read_write_size = smb_direct_max_read_write_size;
 	t->pages_per_rw_credit = smb_direct_get_max_fr_pages(t);
-	t->max_rw_credits = DIV_ROUND_UP(t->max_rdma_rw_size,
+	t->max_rw_credits = DIV_ROUND_UP(sp->max_read_write_size,
 					 (t->pages_per_rw_credit - 1) *
 					 PAGE_SIZE);
 
@@ -1807,20 +1806,20 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	t->recv_credits = 0;
 	t->count_avail_recvmsg = 0;
 
-	t->recv_credit_max = smb_direct_receive_credit_max;
+	sp->recv_credit_max = smb_direct_receive_credit_max;
 	t->recv_credit_target = 10;
 	t->new_recv_credits = 0;
 
-	t->send_credit_target = smb_direct_send_credit_target;
+	sp->send_credit_target = smb_direct_send_credit_target;
 	atomic_set(&t->send_credits, 0);
 	atomic_set(&t->rw_credits, t->max_rw_credits);
 
-	t->max_send_size = smb_direct_max_send_size;
-	t->max_recv_size = smb_direct_max_receive_size;
-	t->max_fragmented_recv_size = smb_direct_max_fragmented_recv_size;
+	sp->max_send_size = smb_direct_max_send_size;
+	sp->max_recv_size = smb_direct_max_receive_size;
+	sp->max_fragmented_recv_size = smb_direct_max_fragmented_recv_size;
 
 	cap->max_send_wr = max_send_wrs;
-	cap->max_recv_wr = t->recv_credit_max;
+	cap->max_recv_wr = sp->recv_credit_max;
 	cap->max_send_sge = max_sge_per_wr;
 	cap->max_recv_sge = SMB_DIRECT_MAX_RECV_SGES;
 	cap->max_inline_data = 0;
@@ -1852,6 +1851,8 @@ static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 
 static int smb_direct_create_pools(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[80];
 	int i;
 	struct smb_direct_recvmsg *recvmsg;
@@ -1864,7 +1865,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	if (!t->sendmsg_cache)
 		return -ENOMEM;
 
-	t->sendmsg_mempool = mempool_create(t->send_credit_target,
+	t->sendmsg_mempool = mempool_create(sp->send_credit_target,
 					    mempool_alloc_slab, mempool_free_slab,
 					    t->sendmsg_cache);
 	if (!t->sendmsg_mempool)
@@ -1873,27 +1874,27 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	snprintf(name, sizeof(name), "smb_direct_resp_%p", t);
 	t->recvmsg_cache = kmem_cache_create(name,
 					     sizeof(struct smb_direct_recvmsg) +
-					      t->max_recv_size,
+					     sp->max_recv_size,
 					     0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!t->recvmsg_cache)
 		goto err;
 
 	t->recvmsg_mempool =
-		mempool_create(t->recv_credit_max, mempool_alloc_slab,
+		mempool_create(sp->recv_credit_max, mempool_alloc_slab,
 			       mempool_free_slab, t->recvmsg_cache);
 	if (!t->recvmsg_mempool)
 		goto err;
 
 	INIT_LIST_HEAD(&t->recvmsg_queue);
 
-	for (i = 0; i < t->recv_credit_max; i++) {
+	for (i = 0; i < sp->recv_credit_max; i++) {
 		recvmsg = mempool_alloc(t->recvmsg_mempool, KSMBD_DEFAULT_GFP);
 		if (!recvmsg)
 			goto err;
 		recvmsg->transport = t;
 		list_add(&recvmsg->list, &t->recvmsg_queue);
 	}
-	t->count_avail_recvmsg = t->recv_credit_max;
+	t->count_avail_recvmsg = sp->recv_credit_max;
 
 	return 0;
 err:
@@ -1905,6 +1906,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 				   struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int ret;
 	struct ib_qp_init_attr qp_attr;
 	int pages_per_rw;
@@ -1928,7 +1930,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	}
 
 	sc->ib.recv_cq = ib_alloc_cq(sc->ib.dev, t,
-				 t->recv_credit_max, 0, IB_POLL_WORKQUEUE);
+				     sp->recv_credit_max, 0, IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		pr_err("Can't create RDMA recv CQ\n");
 		ret = PTR_ERR(sc->ib.recv_cq);
@@ -1955,7 +1957,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	sc->ib.qp = sc->rdma.cm_id->qp;
 	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
 
-	pages_per_rw = DIV_ROUND_UP(t->max_rdma_rw_size, PAGE_SIZE) + 1;
+	pages_per_rw = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE) + 1;
 	if (pages_per_rw > sc->ib.dev->attrs.max_sgl_rd) {
 		ret = ib_mr_pool_init(sc->ib.qp, &sc->ib.qp->rdma_mrs,
 				      t->max_rw_credits, IB_MR_TYPE_MEM_REG,
@@ -1992,6 +1994,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_recvmsg *recvmsg;
 	struct smbdirect_negotiate_req *req;
 	int ret;
@@ -2013,14 +2016,14 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 		goto out;
 
 	req = (struct smbdirect_negotiate_req *)recvmsg->packet;
-	st->max_recv_size = min_t(int, st->max_recv_size,
+	sp->max_recv_size = min_t(int, sp->max_recv_size,
 				  le32_to_cpu(req->preferred_send_size));
-	st->max_send_size = min_t(int, st->max_send_size,
+	sp->max_send_size = min_t(int, sp->max_send_size,
 				  le32_to_cpu(req->max_receive_size));
-	st->max_fragmented_send_size =
+	sp->max_fragmented_send_size =
 		le32_to_cpu(req->max_fragmented_size);
-	st->max_fragmented_recv_size =
-		(st->recv_credit_max * st->max_recv_size) / 2;
+	sp->max_fragmented_recv_size =
+		(sp->recv_credit_max * sp->max_recv_size) / 2;
 
 	ret = smb_direct_send_negotiate_response(st, ret);
 out:
-- 
2.34.1


