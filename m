Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C59B1B83B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Jqi6Y1e45gsLJdDPik+1HXyCWVmn0RUMcYgssVMzMqU=; b=fnuD5XgQ+RlL1otpNgLiEoOqfX
	cy4LFZwiv4zmWM2767qCFzX23DcIMqjrV/TD3q6M6hCkjTMYWrh5lT0YGtQ3wvnJFGIUldwuS4qdw
	sqpyy7f+X/R+Xy5zAKzsGpPeIOfRt9KnsOZWmyxjUGqaairBN6+JNvp99f+fmZil+3zY6rseziBUW
	TTdnkqjPkgE5OJL8MfvTv7sOdIKZb4uutpBez6+lax97TG7g22K9AGhlngtAhrchHeivBSz/VjJBj
	HXl4Qjjj0eVJzMpO+t8mxAyAhzNiP6DzQ5z1OUEzVCReUeCp3dAwGjDlWW+R2R7DoPwvzTuUsl9jF
	sffqktig==;
Received: from ip6-localhost ([::1]:54470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKKO-00ENo8-Fw; Tue, 05 Aug 2025 16:15:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64174) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKK8-00ENkT-EB
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Jqi6Y1e45gsLJdDPik+1HXyCWVmn0RUMcYgssVMzMqU=; b=Y+SHEBW8o9e/5khIzmSceNxU5M
 WXQFf4T57vbRic0z2f89lkDZnHo6j6ZErlelx/srTrzd2zzjcr+vlOYrSAXAWE0s2jyTrUaqtYM1K
 JXQLZMzDIWrzNkcsrPa4DofsbXnoAvW3ljByW6hi8VZx5UcOTILt5t3jaPBNipa3AU+T8pqt3x6TR
 GPxE7d5ZfiZBiZnn400iFQJ3w+CCtPgWxlyWOyuhfjVaWsBHIWY7SdYHDG9vTej4jcJXdiUEstRxj
 rauNxSgj7tewtvuMz1ZWLLpQNx+mcfMhlFzu7qU8dP1uzSNoODgTbaG50Fj3i0yLsPj6w3/KjJ0nO
 QlcznYE97J3rrOPVWv/4mH7Q0pN1fpFt+S+p0ZpxX/+q14pYfadq/nuk5d9DCb8jrzXqEv/ZxHMBs
 20jcCQxgyoSk2hJAmo8VX8Lz22i2DtjwhM8O+FV/Zq6U9J+2FxOpFNU355PcFA/wNLewNEQJAegJP
 E0crqASpBieT4JYiAUsJuzB2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKK6-0019ym-0w; Tue, 05 Aug 2025 16:15:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 13/17] smb: server: make use of common
 smbdirect_socket_parameters
Date: Tue,  5 Aug 2025 18:13:33 +0200
Message-ID: <8247d80c1f4d9fcc31075f3b2810c403f2315904.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
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
index 1c852c8601c6..d81f1694a9af 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -98,12 +98,6 @@ struct smb_direct_transport {
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
@@ -114,13 +108,11 @@ struct smb_direct_transport {
 	spinlock_t		receive_credit_lock;
 	int			recv_credits;
 	int			count_avail_recvmsg;
-	int			recv_credit_max;
 	int			recv_credit_target;
 
 	spinlock_t		recvmsg_queue_lock;
 	struct list_head	recvmsg_queue;
 
-	int			send_credit_target;
 	atomic_t		send_credits;
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
@@ -635,16 +627,18 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
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
 
@@ -1010,6 +1004,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 				    struct smb_direct_sendmsg **sendmsg_out)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_sendmsg *sendmsg;
 	struct smbdirect_data_transfer *packet;
 	int header_length;
@@ -1021,7 +1016,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 
 	/* Fill in the packet header */
 	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
-	packet->credits_requested = cpu_to_le16(t->send_credit_target);
+	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
 	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
 
 	packet->flags = 0;
@@ -1222,9 +1217,10 @@ static int smb_direct_writev(struct ksmbd_transport *t,
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
@@ -1354,6 +1350,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 				bool is_read)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_rdma_rw_msg *msg, *next_msg;
 	int i, ret;
 	DECLARE_COMPLETION_ONSTACK(completion);
@@ -1366,7 +1363,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -ENOTCONN;
 
-	if (buf_len > t->max_rdma_rw_size)
+	if (buf_len > sp->max_read_write_size)
 		return -EINVAL;
 
 	/* calculate needed credits */
@@ -1580,6 +1577,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 					      int failed)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_sendmsg *sendmsg;
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
@@ -1601,13 +1599,13 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
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
@@ -1714,6 +1712,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 				  struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_device *device = sc->ib.dev;
 	int max_send_sges, max_rw_wrs, max_send_wrs;
 	unsigned int max_sge_per_wr, wrs_per_credit;
@@ -1721,10 +1720,10 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
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
 
@@ -1735,9 +1734,9 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
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
 
@@ -1778,20 +1777,20 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
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
@@ -1821,6 +1820,8 @@ static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 
 static int smb_direct_create_pools(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[80];
 	int i;
 	struct smb_direct_recvmsg *recvmsg;
@@ -1833,7 +1834,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	if (!t->sendmsg_cache)
 		return -ENOMEM;
 
-	t->sendmsg_mempool = mempool_create(t->send_credit_target,
+	t->sendmsg_mempool = mempool_create(sp->send_credit_target,
 					    mempool_alloc_slab, mempool_free_slab,
 					    t->sendmsg_cache);
 	if (!t->sendmsg_mempool)
@@ -1842,20 +1843,20 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
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
@@ -1863,7 +1864,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 		recvmsg->sge.length = 0;
 		list_add(&recvmsg->list, &t->recvmsg_queue);
 	}
-	t->count_avail_recvmsg = t->recv_credit_max;
+	t->count_avail_recvmsg = sp->recv_credit_max;
 
 	return 0;
 err:
@@ -1875,6 +1876,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 				   struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int ret;
 	struct ib_qp_init_attr qp_attr;
 	int pages_per_rw;
@@ -1898,7 +1900,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	}
 
 	sc->ib.recv_cq = ib_alloc_cq(sc->ib.dev, t,
-				 t->recv_credit_max, 0, IB_POLL_WORKQUEUE);
+				     sp->recv_credit_max, 0, IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		pr_err("Can't create RDMA recv CQ\n");
 		ret = PTR_ERR(sc->ib.recv_cq);
@@ -1925,7 +1927,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	sc->ib.qp = sc->rdma.cm_id->qp;
 	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
 
-	pages_per_rw = DIV_ROUND_UP(t->max_rdma_rw_size, PAGE_SIZE) + 1;
+	pages_per_rw = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE) + 1;
 	if (pages_per_rw > sc->ib.dev->attrs.max_sgl_rd) {
 		ret = ib_mr_pool_init(sc->ib.qp, &sc->ib.qp->rdma_mrs,
 				      t->max_rw_credits, IB_MR_TYPE_MEM_REG,
@@ -1962,6 +1964,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smbdirect_socket *sc = &st->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smb_direct_recvmsg *recvmsg;
 	struct smbdirect_negotiate_req *req;
 	int ret;
@@ -1983,14 +1986,14 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
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
2.43.0


