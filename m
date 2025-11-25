Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE88C867B9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=J5oGXYGs0eAm6xm/jJiiHJYp5aUPKM/74kNruPktT30=; b=W84bfuWAtCHFlr12iGKMwk9Udq
	xDIOohQrZlySiYYkN0+hcGYESVSa2Zr/YzMjbX87322i36vBxJtxWteV155pL7FGLpb2MRtQDD2GY
	ukg4zeycbiC9dOdUj7E97onf4dXNZv7xEFFu8lmeDL8B6z+LhwWIBsmHkqnsOt9OyVrlVVvQ9jmh1
	iRwH5IBHRXFc0h+W8jCqPVT95rEgSRgarw1Ao2Ttee1ULpPbEfmzSj8Z7uAvtf9jU5re9Mtg4csVW
	IoS1viodrVnAvrVMxLc67wmRimn7JjPudcCSkKfy+xANxyEIwoMJX6Mfy24Q4vDrZMniiV+Oxn4BO
	GZD7ISYQ==;
Received: from ip6-localhost ([::1]:59570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxUp-00DAme-0y; Tue, 25 Nov 2025 18:10:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59080) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMs-00D8Fd-VG
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=J5oGXYGs0eAm6xm/jJiiHJYp5aUPKM/74kNruPktT30=; b=eJXve8w2jgnwWfdSOfaqrHYZMO
 zM4axA8hrTAMzSvrn77NBODNJgWx7lfAwvR+d8oawuWxgsJT8HVYhYh4QhKaO8aPfPqo6hqMYlR0I
 hscTTrKkjCHAjXuKGL4v9CWsZ6CVp1tWtFb/OQHQkEMJ3U/IY7wa2xf3KrCfl9OIQ52q1biptlsUc
 Ak30ly80ip1waWRMk7OVFmX8Fh+y1ADdGksRpIFA/PK4kfoQfpQFmHkPz0sDvgXWgtqDAYdfjTHWo
 lmt14TlAZ3mBdycfGebNiqDi2Pe0X2KLtrOsrNGLV80+lNOy3CrzfCr2s0PIT36//BwivbWGZnY5k
 Qjl8tHsAIHWTvj8Twne49aI3aM1JRgfuLwLswPOwVS6UBq4q+Teg55RK1VmYViSN1DTD2ph6Fc0uI
 yxR7G0qgf/HFGFT/mHDiet/mJDsyHXZB6aXhRCAOjNJGPBbqx0br3M4425CNusxFWWsI5nZ03TfYx
 bCvQfM5nZssutj3gfSGk/x5P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMp-00FdOI-2Q; Tue, 25 Nov 2025 18:02:19 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 054/145] smb: smbdirect: introduce
 smbdirect_accept_connect_request()
Date: Tue, 25 Nov 2025 18:55:00 +0100
Message-ID: <194b75f904d6be43e0346e4c071e08793f7a1926.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will be used by the server to handle new connections.
All rdma processing from rdma_accept() to RDMA_CM_EVENT_ESTABLISHED
as well as the waiting for the smbdirect negotiation request
and sending the negotiation response is done async
until we reach SMBDIRECT_SOCKET_CONNECTED.

Sync behaviour will be done by the server calling
smbdirect_conection_wait_for_connected() in order
to each SMBDIRECT_SOCKET_CONNECTED or an error.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_accept.c    | 666 ++++++++++++++++++
 .../common/smbdirect/smbdirect_all_c_files.c  |   1 +
 2 files changed, 667 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_accept.c

diff --git a/fs/smb/common/smbdirect/smbdirect_accept.c b/fs/smb/common/smbdirect/smbdirect_accept.c
new file mode 100644
index 000000000000..db829e82fde4
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_accept.c
@@ -0,0 +1,666 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (C) 2017, Microsoft Corporation.
+ *   Copyright (C) 2018, LG Electronics.
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
+
+static int smbdirect_accept_rdma_event_handler(struct rdma_cm_id *id,
+					       struct rdma_cm_event *event);
+static int smbdirect_accept_init_params(struct smbdirect_socket *sc);
+static void smbdirect_accept_negotiate_recv_done(struct ib_cq *cq, struct ib_wc *wc);
+static void smbdirect_accept_negotiate_send_done(struct ib_cq *cq, struct ib_wc *wc);
+
+__maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_accept_connect_request(struct smbdirect_socket *sc,
+					    const struct rdma_conn_param *param)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_recv_io *recv_io;
+	u8 peer_initiator_depth;
+	u8 peer_responder_resources;
+	struct rdma_conn_param conn_param;
+	__be32 ird_ord_hdr[2];
+	int ret;
+
+	if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_CREATED))
+		return -EINVAL;
+
+	/*
+	 * First set what the we as server are able to support
+	 */
+	sp->initiator_depth = min_t(u8, sp->initiator_depth,
+				    sc->ib.dev->attrs.max_qp_rd_atom);
+
+	peer_initiator_depth = param->initiator_depth;
+	peer_responder_resources = param->responder_resources;
+	smbdirect_connection_negotiate_rdma_resources(sc,
+						      peer_initiator_depth,
+						      peer_responder_resources,
+						      param);
+
+	ret = smbdirect_accept_init_params(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_accept_init_params() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto init_params_failed;
+	}
+
+	ret = smbdirect_connection_create_qp(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_create_qp() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto create_qp_failed;
+	}
+
+	ret = smbdirect_connection_create_mem_pools(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_create_mem_pools() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto create_mem_failed;
+	}
+
+	recv_io = smbdirect_connection_get_recv_io(sc);
+	if (WARN_ON_ONCE(!recv_io)) {
+		ret = -EINVAL;
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_get_recv_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto get_recv_io_failed;
+	}
+	recv_io->cqe.done = smbdirect_accept_negotiate_recv_done;
+
+	/*
+	 * Now post the recv_io buffer in order to get
+	 * the negotiate request
+	 */
+	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
+	ret = smbdirect_connection_post_recv_io(recv_io);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_post_recv_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto post_recv_io_failed;
+	}
+	/*
+	 * From here recv_io is known to the RDMA QP and needs ib_drain_qp and
+	 * smbdirect_accept_negotiate_recv_done to cleanup...
+	 */
+	recv_io = NULL;
+
+	/* already checked with SMBDIRECT_CHECK_STATUS_WARN above */
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
+
+	/*
+	 * We already negotiated sp->initiator_depth
+	 * and sp->responder_resources above.
+	 */
+	memset(&conn_param, 0, sizeof(conn_param));
+	conn_param.initiator_depth = sp->initiator_depth;
+	conn_param.responder_resources = sp->responder_resources;
+
+	if (sc->rdma.legacy_iwarp) {
+		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
+		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
+		conn_param.private_data = ird_ord_hdr;
+		conn_param.private_data_len = sizeof(ird_ord_hdr);
+	} else {
+		conn_param.private_data = NULL;
+		conn_param.private_data_len = 0;
+	}
+	conn_param.retry_count = SMBDIRECT_RDMA_CM_RETRY;
+	conn_param.rnr_retry_count = SMBDIRECT_RDMA_CM_RNR_RETRY;
+	conn_param.flow_control = 0;
+
+	/* explicitly set above */
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
+	sc->rdma.expected_event = RDMA_CM_EVENT_ESTABLISHED;
+	sc->rdma.cm_id->event_handler = smbdirect_accept_rdma_event_handler;
+	ret = rdma_accept(sc->rdma.cm_id, &conn_param);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"rdma_accept() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto rdma_accept_failed;
+	}
+
+	/*
+	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
+	 * so that the timer will cause a disconnect.
+	 */
+	INIT_DELAYED_WORK(&sc->idle.timer_work, smbdirect_connection_idle_timer_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->negotiate_timeout_msec));
+
+	return 0;
+
+rdma_accept_failed:
+	/*
+	 * smbdirect_connection_destroy_qp() calls ib_drain_qp(),
+	 * so that smbdirect_accept_negotiate_recv_done() will
+	 * call smbdirect_connection_put_recv_io()
+	 */
+post_recv_io_failed:
+	if (recv_io)
+		smbdirect_connection_put_recv_io(recv_io);
+get_recv_io_failed:
+	smbdirect_connection_destroy_mem_pools(sc);
+create_mem_failed:
+	smbdirect_connection_destroy_qp(sc);
+create_qp_failed:
+init_params_failed:
+	return ret;
+}
+
+static int smbdirect_accept_init_params(struct smbdirect_socket *sc)
+{
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+	int max_send_sges;
+	unsigned int maxpages;
+
+	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
+	 * SMB2 response could be mapped.
+	 */
+	max_send_sges = DIV_ROUND_UP(sp->max_send_size, PAGE_SIZE) + 3;
+	if (max_send_sges > SMBDIRECT_SEND_IO_MAX_SGE) {
+		pr_err("max_send_size %d is too large\n", sp->max_send_size);
+		return -EINVAL;
+	}
+
+	/*
+	 * Initialize the local credits to post
+	 * IB_WR_SEND[_WITH_INV].
+	 */
+	atomic_set(&sc->send_io.lcredits.count, sp->send_credit_target);
+
+	maxpages = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE);
+	sc->rw_io.credits.max = rdma_rw_mr_factor(sc->ib.dev,
+						  sc->rdma.cm_id->port_num,
+						  maxpages);
+	sc->rw_io.credits.num_pages = DIV_ROUND_UP(maxpages, sc->rw_io.credits.max);
+	/* add one extra in order to handle unaligned pages */
+	sc->rw_io.credits.max += 1;
+
+	sc->recv_io.credits.target = 1;
+
+	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
+
+	return 0;
+}
+
+static void smbdirect_accept_negotiate_recv_work(struct work_struct *work);
+
+static void smbdirect_accept_negotiate_recv_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_recv_io *recv_io =
+		container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
+	struct smbdirect_socket *sc = recv_io->socket;
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+
+	if (unlikely(wc->status != IB_WC_SUCCESS || WARN_ON_ONCE(wc->opcode != IB_WC_RECV))) {
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
+				"wc->status=%s (%d) wc->opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+		goto error;
+	}
+
+	smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_INFO,
+		"smbdirect_recv_io completed. status='%s (%d)', opcode=%d\n",
+		ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+
+	/*
+	 * Some drivers (at least mlx5_ib) might post a
+	 * recv completion before RDMA_CM_EVENT_ESTABLISHED,
+	 * we need to adjust our expectation in that case.
+	 */
+	if (!sc->first_error && sc->status == SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING)
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
+	if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_NEEDED))
+		goto error;
+	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
+
+	/*
+	 * Reset timer to the keepalive interval in
+	 * order to trigger our next keepalive message.
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->keepalive_interval_msec));
+
+	ib_dma_sync_single_for_cpu(sc->ib.dev,
+				   recv_io->sge.addr,
+				   recv_io->sge.length,
+				   DMA_FROM_DEVICE);
+
+	if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"wc->byte_len=%u < %zu\n",
+			wc->byte_len, sizeof(struct smbdirect_negotiate_req));
+		goto error;
+	}
+
+	/*
+	 * We continue via the workqueue as we may have
+	 * complex work that might sleep.
+	 *
+	 * The work should already/still be disabled,
+	 * but smbdirect_connection_put_recv_io() disables
+	 * it again.
+	 *
+	 * Note that smbdirect_connection_put_recv_io()
+	 * only moved recv_io into the free list, but
+	 * we didn't call smbdirect_connection_recv_io_refill()
+	 * yet, so it won't be reused, but the cleanup code
+	 * on disconnect is able to find it, disables
+	 * recv_io->complex_work again.
+	 */
+	smbdirect_connection_put_recv_io(recv_io);
+	INIT_WORK(&recv_io->complex_work, smbdirect_accept_negotiate_recv_work);
+	queue_work(sc->workqueue, &recv_io->complex_work);
+	return;
+
+error:
+	/*
+	 * recv_io.posted.refill_work is still disabled,
+	 * so smbdirect_connection_put_recv_io() won't
+	 * start it.
+	 */
+	smbdirect_connection_put_recv_io(recv_io);
+	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+}
+
+static void smbdirect_accept_negotiate_recv_work(struct work_struct *work)
+{
+	struct smbdirect_recv_io *recv_io =
+		container_of(work, struct smbdirect_recv_io, complex_work);
+	struct smbdirect_socket *sc = recv_io->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_negotiate_req *nreq;
+	u16 min_version;
+	u16 max_version;
+	u16 credits_requested;
+	u32 preferred_send_size;
+	u32 max_receive_size;
+	u32 max_fragmented_size;
+	struct smbdirect_send_io *send_io = NULL;
+	struct smbdirect_negotiate_resp *nrep;
+	u32 ntstatus;
+	int posted;
+	int ret;
+
+	/*
+	 * make sure we won't start again...
+	 */
+	disable_work(work);
+
+	/*
+	 * Note recv_io is already part of the free list,
+	 * as smbdirect_accept_negotiate_recv_done() called
+	 * smbdirect_connection_put_recv_io(), but
+	 * it won't be reused before we call
+	 * smbdirect_connection_recv_io_refill() below.
+	 */
+
+	if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_NEGOTIATE_RUNNING))
+		return;
+
+	nreq = (struct smbdirect_negotiate_req *)recv_io->packet;
+	min_version = le16_to_cpu(nreq->min_version);
+	max_version = le16_to_cpu(nreq->max_version);
+	credits_requested = le16_to_cpu(nreq->credits_requested);
+	preferred_send_size = le32_to_cpu(nreq->preferred_send_size);
+	max_receive_size = le32_to_cpu(nreq->max_receive_size);
+	max_fragmented_size = le32_to_cpu(nreq->max_fragmented_size);
+
+	smbdirect_log_negotiate(sc, SMBDIRECT_LOG_INFO,
+		"ReqIn: %s%x, %s%x, %s%u, %s%u, %s%u, %s%u\n",
+		"MinVersion=0x",
+		le16_to_cpu(nreq->min_version),
+		"MaxVersion=0x",
+		le16_to_cpu(nreq->max_version),
+		"CreditsRequested=",
+		le16_to_cpu(nreq->credits_requested),
+		"PreferredSendSize=",
+		le32_to_cpu(nreq->preferred_send_size),
+		"MaxRecvSize=",
+		le32_to_cpu(nreq->max_receive_size),
+		"MaxFragmentedSize=",
+		le32_to_cpu(nreq->max_fragmented_size));
+
+	if (!(min_version <= SMBDIRECT_V1 && max_version >= SMBDIRECT_V1)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: min_version=0x%x max_version=0x%x\n",
+			min_version, max_version);
+		ntstatus = 0xC00000bb; /* NT_STATUS_NOT_SUPPORTED */
+		goto not_supported;
+	}
+
+	if (credits_requested == 0) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: credits_requested == 0\n");
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	if (max_receive_size < SMBDIRECT_MIN_RECEIVE_SIZE) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: max_receive_size=%u < %u\n",
+			max_receive_size,
+			SMBDIRECT_MIN_RECEIVE_SIZE);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	if (max_fragmented_size < SMBDIRECT_MIN_FRAGMENTED_SIZE) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: max_fragmented_size=%u < %u\n",
+			max_fragmented_size,
+			SMBDIRECT_MIN_FRAGMENTED_SIZE);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	/*
+	 * At least the value of SMBDIRECT_MIN_RECEIVE_SIZE is used.
+	 */
+	sp->max_recv_size = min_t(u32, sp->max_recv_size, preferred_send_size);
+	sp->max_recv_size = max_t(u32, sp->max_recv_size, SMBDIRECT_MIN_RECEIVE_SIZE);
+
+	/*
+	 * We take the value from the peer, which is checked to be higher than 0,
+	 * but we limit it to the max value we support in order to have
+	 * the main logic simpler.
+	 */
+	sc->recv_io.credits.target = credits_requested;
+	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target,
+					   sp->recv_credit_max);
+
+	/*
+	 * Note nreq->max_receive_size was already checked against
+	 * SMBDIRECT_MIN_RECEIVE_SIZE above.
+	 */
+	sp->max_send_size = min_t(u32, sp->max_send_size, max_receive_size);
+
+	/*
+	 * Note nreq->max_fragmented_size was already checked against
+	 * SMBDIRECT_MIN_FRAGMENTED_SIZE above.
+	 */
+	sp->max_fragmented_send_size = max_fragmented_size;
+
+	/*
+	 * Prepare for receiving data_transfer messages
+	 */
+	sc->recv_io.reassembly.full_packet_received = true;
+	sc->recv_io.expected = SMBDIRECT_EXPECT_DATA_TRANSFER;
+	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
+		recv_io->cqe.done = smbdirect_connection_recv_io_done;
+	recv_io = NULL;
+
+	/*
+	 * We should at least post 1 smbdirect_recv_io!
+	 */
+	posted = smbdirect_connection_recv_io_refill(sc);
+	if (posted < 1) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_recv_io_refill() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(posted));
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	/*
+	 * The response will grant credits for all posted
+	 * smbdirect_recv_io messages.
+	 */
+	atomic_set(&sc->recv_io.credits.count, posted);
+
+	ntstatus = 0; /* NT_STATUS_OK */
+
+not_supported:
+	send_io = smbdirect_connection_alloc_send_io(sc);
+	if (IS_ERR(send_io)) {
+		ret = PTR_ERR(send_io);
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_alloc_send_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		smbdirect_socket_schedule_cleanup(sc, ret);
+		return;
+	}
+	send_io->cqe.done = smbdirect_accept_negotiate_send_done;
+
+	nrep = (struct smbdirect_negotiate_resp *)send_io->packet;
+	nrep->min_version = cpu_to_le16(SMBDIRECT_V1);
+	nrep->max_version = cpu_to_le16(SMBDIRECT_V1);
+	if (ntstatus == 0) {
+		nrep->negotiated_version = cpu_to_le16(SMBDIRECT_V1);
+		nrep->reserved = 0;
+		nrep->credits_requested = cpu_to_le16(sp->send_credit_target);
+		nrep->credits_granted = cpu_to_le16(posted);
+		nrep->status = cpu_to_le32(ntstatus);
+		nrep->max_readwrite_size = cpu_to_le32(sp->max_read_write_size);
+		nrep->preferred_send_size = cpu_to_le32(sp->max_send_size);
+		nrep->max_receive_size = cpu_to_le32(sp->max_recv_size);
+		nrep->max_fragmented_size = cpu_to_le32(sp->max_fragmented_recv_size);
+	} else {
+		nrep->negotiated_version = 0;
+		nrep->reserved = 0;
+		nrep->credits_requested = 0;
+		nrep->credits_granted = 0;
+		nrep->status = cpu_to_le32(ntstatus);
+		nrep->max_readwrite_size = 0;
+		nrep->preferred_send_size = 0;
+		nrep->max_receive_size = 0;
+		nrep->max_fragmented_size = 0;
+	}
+
+	smbdirect_log_negotiate(sc, SMBDIRECT_LOG_INFO,
+		"RepOut: %s%x, %s%x, %s%x, %s%u, %s%u, %s%x, %s%u, %s%u, %s%u, %s%u\n",
+		"MinVersion=0x",
+		le16_to_cpu(nrep->min_version),
+		"MaxVersion=0x",
+		le16_to_cpu(nrep->max_version),
+		"NegotiatedVersion=0x",
+		le16_to_cpu(nrep->negotiated_version),
+		"CreditsRequested=",
+		le16_to_cpu(nrep->credits_requested),
+		"CreditsGranted=",
+		le16_to_cpu(nrep->credits_granted),
+		"Status=0x",
+		le32_to_cpu(nrep->status),
+		"MaxReadWriteSize=",
+		le32_to_cpu(nrep->max_readwrite_size),
+		"PreferredSendSize=",
+		le32_to_cpu(nrep->preferred_send_size),
+		"MaxRecvSize=",
+		le32_to_cpu(nrep->max_receive_size),
+		"MaxFragmentedSize=",
+		le32_to_cpu(nrep->max_fragmented_size));
+
+	send_io->sge[0].addr = ib_dma_map_single(sc->ib.dev,
+						 nrep,
+						 sizeof(*nrep),
+						 DMA_TO_DEVICE);
+	ret = ib_dma_mapping_error(sc->ib.dev, send_io->sge[0].addr);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"ib_dma_mapping_error() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		smbdirect_connection_free_send_io(send_io);
+		smbdirect_socket_schedule_cleanup(sc, ret);
+		return;
+	}
+
+	send_io->sge[0].length = sizeof(*nrep);
+	send_io->sge[0].lkey = sc->ib.pd->local_dma_lkey;
+	send_io->num_sge = 1;
+
+	ib_dma_sync_single_for_device(sc->ib.dev,
+				      send_io->sge[0].addr,
+				      send_io->sge[0].length,
+				      DMA_TO_DEVICE);
+
+	send_io->wr.next = NULL;
+	send_io->wr.wr_cqe = &send_io->cqe;
+	send_io->wr.sg_list = send_io->sge;
+	send_io->wr.num_sge = send_io->num_sge;
+	send_io->wr.opcode = IB_WR_SEND;
+	send_io->wr.send_flags = IB_SEND_SIGNALED;
+
+	ret = smbdirect_connection_post_send_wr(sc, &send_io->wr);
+	if (ret) {
+		/* if we reach here, post send failed */
+		smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_post_send_wr() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		/*
+		 * Note smbdirect_connection_free_send_io()
+		 * does ib_dma_unmap_page()
+		 */
+		smbdirect_connection_free_send_io(send_io);
+		smbdirect_socket_schedule_cleanup(sc, ret);
+		return;
+	}
+
+	/*
+	 * smbdirect_accept_negotiate_send_done
+	 * will do all remaining work...
+	 */
+}
+
+static void smbdirect_accept_negotiate_send_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_send_io *send_io =
+		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
+	struct smbdirect_socket *sc = send_io->socket;
+	struct smbdirect_negotiate_resp *nrep;
+	u32 ntstatus;
+
+	smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_INFO,
+		"smbdirect_send_io completed. status='%s (%d)', opcode=%d\n",
+		ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+
+	nrep = (struct smbdirect_negotiate_resp *)send_io->packet;
+	ntstatus = le32_to_cpu(nrep->status);
+
+	/* Note this frees wc->wr_cqe, but not wc */
+	smbdirect_connection_free_send_io(send_io);
+	atomic_dec(&sc->send_io.pending.count);
+
+	if (unlikely(wc->status != IB_WC_SUCCESS || WARN_ON_ONCE(wc->opcode != IB_WC_SEND))) {
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_ERR,
+				"wc->status=%s (%d) wc->opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		return;
+	}
+
+	/*
+	 * If we send a smbdirect_negotiate_resp without NT_STATUS_OK (0)
+	 * we need to disconnect now.
+	 *
+	 * Otherwise smbdirect_connection_negotiation_done()
+	 * will setup all required things and wake up
+	 * the waiter.
+	 */
+	if (ntstatus)
+		smbdirect_socket_schedule_cleanup(sc, -EOPNOTSUPP);
+	else
+		smbdirect_connection_negotiation_done(sc);
+}
+
+static int smbdirect_accept_rdma_event_handler(struct rdma_cm_id *id,
+					       struct rdma_cm_event *event)
+{
+	struct smbdirect_socket *sc = id->context;
+
+	/*
+	 * cma_cm_event_handler() has
+	 * lockdep_assert_held(&id_priv->handler_mutex);
+	 *
+	 * Mutexes are not allowed in interrupts,
+	 * and we rely on not being in an interrupt here,
+	 * as we might sleep.
+	 *
+	 * We didn't timeout so we cancel our idle timer,
+	 * it will be scheduled again if needed.
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	if (event->status || event->event != sc->rdma.expected_event) {
+		int ret = -ECONNABORTED;
+
+		if (event->event == RDMA_CM_EVENT_REJECTED)
+			ret = -ECONNREFUSED;
+		if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL)
+			ret = -ENETDOWN;
+		if (IS_ERR(SMBDIRECT_DEBUG_ERR_PTR(event->status)))
+			ret = event->status;
+
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"%s (first_error=%1pe, expected=%s) => event=%s status=%d => ret=%1pe\n",
+			smbdirect_socket_status_string(sc->status),
+			SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+			rdma_event_msg(sc->rdma.expected_event),
+			rdma_event_msg(event->event),
+			event->status,
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+
+		smbdirect_socket_schedule_cleanup(sc, ret);
+		return 0;
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"%s (first_error=%1pe) event=%s\n",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		rdma_event_msg(event->event));
+
+	if (sc->first_error)
+		return 0;
+
+	switch (event->event) {
+	case RDMA_CM_EVENT_ESTABLISHED:
+		smbdirect_connection_rdma_established(sc);
+
+		/*
+		 * Some drivers (at least mlx5_ib) might post a
+		 * recv completion before RDMA_CM_EVENT_ESTABLISHED,
+		 * we need to adjust our expectation in that case.
+		 *
+		 * As we already started the negotiation, we just
+		 * ignore RDMA_CM_EVENT_ESTABLISHED here.
+		 */
+		if (sc->status > SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING)
+			return 0;
+
+		if (SMBDIRECT_CHECK_STATUS_DISCONNECT(sc, SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING))
+			return 0;
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
+
+		/*
+		 * wait for smbdirect_accept_negotiate_recv_done()
+		 * to get the negotiate request.
+		 */
+		return 0;
+
+	default:
+		break;
+	}
+
+	/*
+	 * This is an internal error
+	 */
+	WARN_ON_ONCE(sc->rdma.expected_event != RDMA_CM_EVENT_ESTABLISHED);
+	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+	return 0;
+}
diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
index 5df7da692df3..40e2ceb9a4a4 100644
--- a/fs/smb/common/smbdirect/smbdirect_all_c_files.c
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -21,3 +21,4 @@
 #include "smbdirect_rw.c"
 #include "smbdirect_debug.c"
 #include "smbdirect_connect.c"
+#include "smbdirect_accept.c"
-- 
2.43.0


