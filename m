Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E80C1AF69
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SZVtXagOz3ED7gqVo4sbu669PH8RfkLMOLNxky9nbfc=; b=e1dBQA4styKZbp7bqtPDJ3S+wD
	4Ixk7W8qvwwKChnIlmanDkoRRF/V1ykZql0+/Z4/yPvVyBsq8IWg2JOx0Bh6iVMbe1b/JQ7odKkNV
	aHd3FfzkEa8p0+gLBkEokzwyQn9HfP54qdZzmUhjUP6hUkzsnuJW5x/RbcKPPCJg0Qz23peZNQ0/Y
	bdiwe7q03JJz8jbvtI9X7cl8/0tRoW60oI+K3UMFGdJfdVnF8RkRrcWqsQaQH95UJCD6xk+gg0LT1
	umSGddfmAvYQLqCyCdgm8MDweu91a+q2aRW9d5rGxWDMgoZzQOvlZF93TBYGfQMLNMRxb64rcjfDi
	T34ZYbvw==;
Received: from ip6-localhost ([::1]:31498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6bQ-009FLf-TB; Wed, 29 Oct 2025 13:52:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41264) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KG-00994a-8z
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SZVtXagOz3ED7gqVo4sbu669PH8RfkLMOLNxky9nbfc=; b=BIY18KY0fHykhwO7/2phkHX9D/
 AofVmDuoEyNMNzxwOhZZYNBHyStWF2GljQVUs0578s4LvwhIsF9VOAnOo8zUFfVPWsSAdIPlwFoE4
 GJj6F12JEJLg5O7CTwQJLUJ+QCGedE9D/gjS9SbLb2OaZmXyNylBQKMzMuMn02x5fQRwrczulT2nA
 KYvDsg3SQiFo/Wj7q1Z7+xTnKU0lAb2vCxxIkl+gogG1OqVifwOLmHjDqqDIHS/r162gWgPuLJVfn
 2++JjgmATWg1EuliQ8UmtU/insuxPudK+fSRvavrxEn22aqn3vV9i8yjwQxMk+5Tycr7IjNtxHFfp
 XOBtm7AwfWK695k8Ofik8in1ZckATauR3ZQ8RuAA/id9YOZCaZWEytiyzfoofwqX5d8n2BuVs9cMK
 9L5auMzOgymWg6BlEo2VKSXLFiI1Ah4ZqrWFLfRHoOVkqI5kAN0/bIRtz8aaFfj4WsYlJ3dRV0sR6
 1A+VZK3mDFQ7RYcLkx0PMobq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KE-00Bd8K-07; Wed, 29 Oct 2025 13:34:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 124/127] smb: server: make use of
 smbdirect_{socket_init_accepting, connection_wait_for_connected}()
Date: Wed, 29 Oct 2025 14:21:42 +0100
Message-ID: <78feb2f86ed877d829c23e3b2825f5337f99187d.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This means we finally only use common functions in the server.

We still use the embedded struct smbdirect_socket and are
able to access internals, but the will be removed in the
next commits as well.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 575 ++-------------------------------
 1 file changed, 30 insertions(+), 545 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e3a410d773f6..d6162b8be58b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -17,6 +17,7 @@
 #include <linux/highmem.h>
 #include <linux/scatterlist.h>
 #include <linux/string_choices.h>
+#include <linux/errname.h>
 #include <rdma/ib_verbs.h>
 #include <rdma/rdma_cm.h>
 #include <rdma/rw.h>
@@ -184,14 +185,14 @@ unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt)
 {
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
-	struct smbdirect_socket_parameters *sp;
+	const struct smbdirect_socket_parameters *sp;
 
 	if (kt->ops != &ksmbd_smb_direct_transport_ops)
 		return 0;
 
 	t = SMBD_TRANS(kt);
 	sc = &t->socket;
-	sp = &sc->parameters;
+	sp = smbdirect_socket_get_current_parameters(sc);
 
 	return sp->max_read_write_size;
 }
@@ -203,6 +204,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct ksmbd_conn *conn;
+	int ret;
 
 	/*
 	 * Create the initial parameters
@@ -224,27 +226,25 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	if (!t)
 		return NULL;
 	sc = &t->socket;
-	smbdirect_socket_prepare_create(sc, sp, smb_direct_wq);
+	ret = smbdirect_socket_init_accepting(cm_id, sc);
+	if (ret)
+		goto socket_init_failed;
 	smbdirect_socket_set_logging(sc, NULL,
 				     smb_direct_logging_needed,
 				     smb_direct_logging_vaprintf);
-	sc->ib.poll_ctx = IB_POLL_WORKQUEUE;
-	sc->send_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
-	sc->recv_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
-	sc->rw_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
-	/*
-	 * from here we operate on the copy.
-	 */
-	sp = &sc->parameters;
-
-	sc->rdma.cm_id = cm_id;
-	cm_id->context = sc;
-
-	sc->ib.dev = sc->rdma.cm_id->device;
+	ret = smbdirect_socket_set_initial_parameters(sc, sp);
+	if (ret)
+		goto set_params_failed;
+	ret = smbdirect_socket_set_kernel_settings(sc, IB_POLL_WORKQUEUE, KSMBD_DEFAULT_GFP);
+	if (ret)
+		goto set_settings_failed;
+	ret = smbdirect_socket_set_custom_workqueue(sc, smb_direct_wq);
+	if (ret)
+		goto set_workqueue_failed;
 
 	conn = ksmbd_conn_alloc();
 	if (!conn)
-		goto err;
+		goto conn_alloc_failed;
 
 	down_write(&conn_list_lock);
 	hash_add(conn_list, &conn->hlist, 0);
@@ -254,7 +254,12 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	KSMBD_TRANS(t)->conn = conn;
 	KSMBD_TRANS(t)->ops = &ksmbd_smb_direct_transport_ops;
 	return t;
-err:
+
+conn_alloc_failed:
+set_workqueue_failed:
+set_settings_failed:
+set_params_failed:
+socket_init_failed:
 	kfree(t);
 	return NULL;
 }
@@ -273,189 +278,6 @@ static void free_transport(struct smb_direct_transport *t)
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
-static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
-{
-	struct smbdirect_socket *sc = recvmsg->socket;
-
-	switch (sc->recv_io.expected) {
-	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
-		struct smbdirect_data_transfer *req =
-			(struct smbdirect_data_transfer *)recvmsg->packet;
-		struct smb2_hdr *hdr = (struct smb2_hdr *)(recvmsg->packet
-				+ le32_to_cpu(req->data_offset));
-		ksmbd_debug(RDMA,
-			    "CreditGranted: %u, CreditRequested: %u, DataLength: %u, RemainingDataLength: %u, SMB: %x, Command: %u\n",
-			    le16_to_cpu(req->credits_granted),
-			    le16_to_cpu(req->credits_requested),
-			    req->data_length, req->remaining_data_length,
-			    hdr->ProtocolId, hdr->Command);
-		return 0;
-	}
-	case SMBDIRECT_EXPECT_NEGOTIATE_REQ: {
-		struct smbdirect_negotiate_req *req =
-			(struct smbdirect_negotiate_req *)recvmsg->packet;
-		ksmbd_debug(RDMA,
-			    "MinVersion: %u, MaxVersion: %u, CreditRequested: %u, MaxSendSize: %u, MaxRecvSize: %u, MaxFragmentedSize: %u\n",
-			    le16_to_cpu(req->min_version),
-			    le16_to_cpu(req->max_version),
-			    le16_to_cpu(req->credits_requested),
-			    le32_to_cpu(req->preferred_send_size),
-			    le32_to_cpu(req->max_receive_size),
-			    le32_to_cpu(req->max_fragmented_size));
-		if (le16_to_cpu(req->min_version) > 0x0100 ||
-		    le16_to_cpu(req->max_version) < 0x0100)
-			return -EOPNOTSUPP;
-		if (le16_to_cpu(req->credits_requested) <= 0 ||
-		    le32_to_cpu(req->max_receive_size) <= 128 ||
-		    le32_to_cpu(req->max_fragmented_size) <=
-					128 * 1024)
-			return -ECONNABORTED;
-
-		return 0;
-	}
-	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
-		/* client only */
-		break;
-	}
-
-	/* This is an internal error */
-	return -EINVAL;
-}
-
-static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	struct smbdirect_recv_io *recvmsg;
-	struct smbdirect_socket *sc;
-	struct smbdirect_socket_parameters *sp;
-
-	recvmsg = container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
-	sc = recvmsg->socket;
-	sp = &sc->parameters;
-
-	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
-		smbdirect_connection_put_recv_io(recvmsg);
-		if (wc->status != IB_WC_WR_FLUSH_ERR) {
-			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
-			       ib_wc_status_msg(wc->status), wc->status,
-			       wc->opcode);
-			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-		}
-		return;
-	}
-
-	ksmbd_debug(RDMA, "Recv completed. status='%s (%d)', opcode=%d\n",
-		    ib_wc_status_msg(wc->status), wc->status,
-		    wc->opcode);
-
-	ib_dma_sync_single_for_cpu(wc->qp->device, recvmsg->sge.addr,
-				   recvmsg->sge.length, DMA_FROM_DEVICE);
-
-	/*
-	 * Reset timer to the keepalive interval in
-	 * order to trigger our next keepalive message.
-	 */
-	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
-	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-			 msecs_to_jiffies(sp->keepalive_interval_msec));
-
-	switch (sc->recv_io.expected) {
-	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
-		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
-			smbdirect_connection_put_recv_io(recvmsg);
-			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-			return;
-		}
-		sc->recv_io.reassembly.full_packet_received = true;
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
-		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
-		smbdirect_connection_reassembly_append_recv_io(sc, recvmsg, 0);
-		wake_up(&sc->status_wait);
-		return;
-	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
-		struct smbdirect_data_transfer *data_transfer =
-			(struct smbdirect_data_transfer *)recvmsg->packet;
-		u32 remaining_data_length, data_offset, data_length;
-		u16 old_recv_credit_target;
-
-		if (wc->byte_len <
-		    offsetof(struct smbdirect_data_transfer, padding)) {
-			smbdirect_connection_put_recv_io(recvmsg);
-			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-			return;
-		}
-
-		remaining_data_length = le32_to_cpu(data_transfer->remaining_data_length);
-		data_length = le32_to_cpu(data_transfer->data_length);
-		data_offset = le32_to_cpu(data_transfer->data_offset);
-		if (wc->byte_len < data_offset ||
-		    wc->byte_len < (u64)data_offset + data_length) {
-			smbdirect_connection_put_recv_io(recvmsg);
-			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-			return;
-		}
-		if (remaining_data_length > sp->max_fragmented_recv_size ||
-		    data_length > sp->max_fragmented_recv_size ||
-		    (u64)remaining_data_length + (u64)data_length >
-		    (u64)sp->max_fragmented_recv_size) {
-			smbdirect_connection_put_recv_io(recvmsg);
-			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-			return;
-		}
-
-		if (data_length) {
-			if (sc->recv_io.reassembly.full_packet_received)
-				recvmsg->first_segment = true;
-
-			if (le32_to_cpu(data_transfer->remaining_data_length))
-				sc->recv_io.reassembly.full_packet_received = false;
-			else
-				sc->recv_io.reassembly.full_packet_received = true;
-		}
-
-		atomic_dec(&sc->recv_io.posted.count);
-		atomic_dec(&sc->recv_io.credits.count);
-
-		old_recv_credit_target = sc->recv_io.credits.target;
-		sc->recv_io.credits.target =
-				le16_to_cpu(data_transfer->credits_requested);
-		sc->recv_io.credits.target =
-			min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
-		sc->recv_io.credits.target =
-			max_t(u16, sc->recv_io.credits.target, 1);
-		atomic_add(le16_to_cpu(data_transfer->credits_granted),
-			   &sc->send_io.credits.count);
-
-		if (le16_to_cpu(data_transfer->flags) &
-		    SMBDIRECT_FLAG_RESPONSE_REQUESTED)
-			queue_work(sc->workqueue, &sc->idle.immediate_work);
-
-		if (atomic_read(&sc->send_io.credits.count) > 0)
-			wake_up(&sc->send_io.credits.wait_queue);
-
-		if (data_length) {
-			if (sc->recv_io.credits.target > old_recv_credit_target)
-				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
-
-			smbdirect_connection_reassembly_append_recv_io(sc, recvmsg, data_length);
-			wake_up(&sc->recv_io.reassembly.wait_queue);
-		} else
-			smbdirect_connection_put_recv_io(recvmsg);
-
-		return;
-	}
-	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
-		/* client only */
-		break;
-	}
-
-	/*
-	 * This is an internal error!
-	 */
-	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
-	smbdirect_connection_put_recv_io(recvmsg);
-	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-}
-
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
@@ -531,344 +353,24 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 
 	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
 
-	smbdirect_connection_disconnect_work(&sc->disconnect_work);
-}
-
-static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
-				 struct rdma_cm_event *event)
-{
-	struct smbdirect_socket *sc = cm_id->context;
-
-	ksmbd_debug(RDMA, "RDMA CM event. cm_id=%p event=%s (%d)\n",
-		    cm_id, rdma_event_msg(event->event), event->event);
-
-	switch (event->event) {
-	case RDMA_CM_EVENT_ESTABLISHED: {
-		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
-		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
-		wake_up(&sc->status_wait);
-		break;
-	}
-	case RDMA_CM_EVENT_DEVICE_REMOVAL:
-	case RDMA_CM_EVENT_DISCONNECTED: {
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smbdirect_connection_disconnect_work(&sc->disconnect_work);
-		if (sc->ib.qp)
-			ib_drain_qp(sc->ib.qp);
-		break;
-	}
-	case RDMA_CM_EVENT_CONNECT_ERROR: {
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		smbdirect_connection_disconnect_work(&sc->disconnect_work);
-		break;
-	}
-	default:
-		pr_err("Unexpected RDMA CM event. cm_id=%p, event=%s (%d)\n",
-		       cm_id, rdma_event_msg(event->event),
-		       event->event);
-		break;
-	}
-	return 0;
-}
-
-static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
-					      int failed)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smbdirect_send_io *sendmsg;
-	struct smbdirect_negotiate_resp *resp;
-	int ret;
-
-	sendmsg = smbdirect_connection_alloc_send_io(sc);
-	if (IS_ERR(sendmsg))
-		return -ENOMEM;
-
-	resp = (struct smbdirect_negotiate_resp *)sendmsg->packet;
-	if (failed) {
-		memset(resp, 0, sizeof(*resp));
-		resp->min_version = SMB_DIRECT_VERSION_LE;
-		resp->max_version = SMB_DIRECT_VERSION_LE;
-		resp->status = STATUS_NOT_SUPPORTED;
-
-		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-	} else {
-		resp->status = STATUS_SUCCESS;
-		resp->min_version = SMB_DIRECT_VERSION_LE;
-		resp->max_version = SMB_DIRECT_VERSION_LE;
-		resp->negotiated_version = SMB_DIRECT_VERSION_LE;
-		resp->reserved = 0;
-		resp->credits_requested =
-				cpu_to_le16(sp->send_credit_target);
-		resp->credits_granted = cpu_to_le16(smbdirect_connection_grant_recv_credits(sc));
-		resp->max_readwrite_size = cpu_to_le32(sp->max_read_write_size);
-		resp->preferred_send_size = cpu_to_le32(sp->max_send_size);
-		resp->max_receive_size = cpu_to_le32(sp->max_recv_size);
-		resp->max_fragmented_size =
-				cpu_to_le32(sp->max_fragmented_recv_size);
-
-		sc->recv_io.expected = SMBDIRECT_EXPECT_DATA_TRANSFER;
-		sc->status = SMBDIRECT_SOCKET_CONNECTED;
-	}
-
-	sendmsg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
-						 (void *)resp, sizeof(*resp),
-						 DMA_TO_DEVICE);
-	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
-	if (ret) {
-		smbdirect_connection_free_send_io(sendmsg);
-		return ret;
-	}
-
-	sendmsg->num_sge = 1;
-	sendmsg->sge[0].length = sizeof(*resp);
-	sendmsg->sge[0].lkey = sc->ib.pd->local_dma_lkey;
-
-	ret = smbdirect_connection_post_send_io(sc, NULL, sendmsg);
-	if (ret) {
-		smbdirect_connection_free_send_io(sendmsg);
-		return ret;
-	}
-
-	wait_event(sc->send_io.pending.zero_wait_queue,
-		   atomic_read(&sc->send_io.pending.count) == 0 ||
-		   sc->status != SMBDIRECT_SOCKET_CONNECTED);
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-		return -ENOTCONN;
-
-	return 0;
-}
-
-static int smb_direct_accept_client(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct rdma_conn_param conn_param;
-	__be32 ird_ord_hdr[2];
-	int ret;
-
-	/*
-	 * smb_direct_handle_connect_request()
-	 * already negotiated sp->initiator_depth
-	 * and sp->responder_resources
-	 */
-	memset(&conn_param, 0, sizeof(conn_param));
-	conn_param.initiator_depth = sp->initiator_depth;
-	conn_param.responder_resources = sp->responder_resources;
-
-	if (sc->rdma.legacy_iwarp) {
-		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
-		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
-		conn_param.private_data = ird_ord_hdr;
-		conn_param.private_data_len = sizeof(ird_ord_hdr);
-	} else {
-		conn_param.private_data = NULL;
-		conn_param.private_data_len = 0;
-	}
-	conn_param.retry_count = SMB_DIRECT_CM_RETRY;
-	conn_param.rnr_retry_count = SMB_DIRECT_CM_RNR_RETRY;
-	conn_param.flow_control = 0;
-
-	/*
-	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
-	 * so that the timer will cause a disconnect.
-	 */
-	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-			 msecs_to_jiffies(sp->negotiate_timeout_msec));
-
-	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
-	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
-	ret = rdma_accept(sc->rdma.cm_id, &conn_param);
-	if (ret) {
-		pr_err("error at rdma_accept: %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *recvmsg;
-	int ret;
-
-	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
-	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
-
-	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
-
-	recvmsg = smbdirect_connection_get_recv_io(sc);
-	if (!recvmsg)
-		return -ENOMEM;
-
-	ret = smbdirect_connection_post_recv_io(recvmsg);
-	if (ret) {
-		pr_err("Can't post recv: %d\n", ret);
-		goto out_err;
-	}
-
-	ret = smb_direct_accept_client(sc);
-	if (ret) {
-		pr_err("Can't accept client\n");
-		goto out_err;
-	}
-
-	return 0;
-out_err:
-	smbdirect_connection_put_recv_io(recvmsg);
-	return ret;
-}
-
-static int smb_direct_init_params(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	int max_send_sges;
-	unsigned int maxpages;
-
-	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
-	 * SMB2 response could be mapped.
-	 */
-	max_send_sges = DIV_ROUND_UP(sp->max_send_size, PAGE_SIZE) + 3;
-	if (max_send_sges > SMBDIRECT_SEND_IO_MAX_SGE) {
-		pr_err("max_send_size %d is too large\n", sp->max_send_size);
-		return -EINVAL;
-	}
-
-	atomic_set(&sc->send_io.lcredits.count, sp->send_credit_target);
-
-	maxpages = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE);
-	sc->rw_io.credits.max = rdma_rw_mr_factor(sc->ib.dev,
-						  sc->rdma.cm_id->port_num,
-						  maxpages);
-	sc->rw_io.credits.num_pages = DIV_ROUND_UP(maxpages, sc->rw_io.credits.max);
-	/* add one extra in order to handle unaligned pages */
-	sc->rw_io.credits.max += 1;
-
-	sc->recv_io.credits.target = 1;
-
-	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
-
-	return 0;
+	smbdirect_socket_shutdown(sc);
 }
 
 static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smbdirect_recv_io *recvmsg;
-	struct smbdirect_negotiate_req *req;
-	unsigned long flags;
 	int ret;
 
-	/*
-	 * We are waiting to pass the following states:
-	 *
-	 * SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED
-	 * SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING
-	 * SMBDIRECT_SOCKET_NEGOTIATE_NEEDED
-	 *
-	 * To finally get to SMBDIRECT_SOCKET_NEGOTIATE_RUNNING
-	 * in order to continue below.
-	 *
-	 * Everything else is unexpected and an error.
-	 */
-	ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
-	ret = wait_event_interruptible_timeout(sc->status_wait,
-					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED &&
-					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING &&
-					sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
-					msecs_to_jiffies(sp->negotiate_timeout_msec));
-	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
-		return ret < 0 ? ret : -ETIMEDOUT;
-
-	recvmsg = smbdirect_connection_reassembly_first_recv_io(sc);
-	if (!recvmsg)
-		return -ECONNABORTED;
-
-	ret = smb_direct_check_recvmsg(recvmsg);
-	if (ret)
-		goto put;
-
-	req = (struct smbdirect_negotiate_req *)recvmsg->packet;
-	sp->max_recv_size = min_t(int, sp->max_recv_size,
-				  le32_to_cpu(req->preferred_send_size));
-	sp->max_send_size = min_t(int, sp->max_send_size,
-				  le32_to_cpu(req->max_receive_size));
-	sp->max_fragmented_send_size =
-		le32_to_cpu(req->max_fragmented_size);
-	sp->max_fragmented_recv_size =
-		(sp->recv_credit_max * sp->max_recv_size) / 2;
-	sc->recv_io.credits.target = le16_to_cpu(req->credits_requested);
-	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
-	sc->recv_io.credits.target = max_t(u16, sc->recv_io.credits.target, 1);
-
-put:
-	spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-	sc->recv_io.reassembly.queue_length--;
-	list_del(&recvmsg->list);
-	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-	smbdirect_connection_put_recv_io(recvmsg);
-
-	if (ret == -ECONNABORTED)
-		return ret;
-
-	if (ret)
-		goto respond;
-
-	/*
-	 * We negotiated with success, so we need to refill the recv queue.
-	 *
-	 * The message that grants the credits to the client is
-	 * the negotiate response.
-	 */
-	ret = smbdirect_connection_recv_io_refill(sc);
-	if (ret < 0)
-		return ret;
-	ret = 0;
-
-respond:
-	ret = smb_direct_send_negotiate_response(sc, ret);
-	if (ret)
-		return ret;
-
-	INIT_WORK(&sc->recv_io.posted.refill_work, smbdirect_connection_recv_io_refill_work);
-	INIT_WORK(&sc->idle.immediate_work, smbdirect_connection_send_immediate_work);
-
-	return 0;
-}
-
-static int smb_direct_connect(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *recv_io;
-	int ret;
-
-	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
-
-	ret = smb_direct_init_params(sc);
+	ksmbd_debug(RDMA, "SMB_DIRECT Waiting for connection\n");
+	ret = smbdirect_connection_wait_for_connected(sc);
 	if (ret) {
-		pr_err("Can't configure RDMA parameters\n");
+		ksmbd_debug(RDMA, "SMB_DIRECT connection failed %d => %s\n",
+			    ret, errname(ret));
 		return ret;
 	}
 
-	ret = smbdirect_connection_create_mem_pools(sc);
-	if (ret) {
-		pr_err("Can't init RDMA pool: %d\n", ret);
-		return ret;
-	}
-
-	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
-		recv_io->cqe.done = recv_done;
-
-	ret = smbdirect_connection_create_qp(sc);
-	if (ret) {
-		pr_err("Can't accept RDMA client: %d\n", ret);
-		return ret;
-	}
-
-	ret = smb_direct_prepare_negotiation(sc);
-	if (ret) {
-		pr_err("Can't negotiate: %d\n", ret);
-		return ret;
-	}
+	ksmbd_debug(RDMA, "SMB_DIRECT connection ready\n");
 	return 0;
 }
 
@@ -877,10 +379,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 {
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
-	struct smbdirect_socket_parameters *sp;
 	struct task_struct *handler;
-	u8 peer_initiator_depth;
-	u8 peer_responder_resources;
 	int ret;
 
 	if (!smbdirect_frwr_is_supported(&new_cm_id->device->attrs)) {
@@ -894,22 +393,8 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 	if (!t)
 		return -ENOMEM;
 	sc = &t->socket;
-	sp = &sc->parameters;
-
-	/*
-	 * First set what the we as server are able to support
-	 */
-	sp->initiator_depth = min_t(u8, sp->initiator_depth,
-				    sc->ib.dev->attrs.max_qp_rd_atom);
-
-	peer_initiator_depth = event->param.conn.initiator_depth;
-	peer_responder_resources = event->param.conn.responder_resources;
-	smbdirect_connection_negotiate_rdma_resources(sc,
-						      peer_initiator_depth,
-						      peer_responder_resources,
-						      &event->param.conn);
 
-	ret = smb_direct_connect(sc);
+	ret = smbdirect_accept_connect_request(sc, &event->param.conn);
 	if (ret)
 		goto out_err;
 
-- 
2.43.0


