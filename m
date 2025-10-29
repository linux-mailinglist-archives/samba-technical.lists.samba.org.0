Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE68C1ABF6
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xddiNsVP0l/3dpsY9CGYMxWPxb2FY1Kj0kHY0ylVM3s=; b=5A8oAnUCx/RwdlEOw5iiLcXRnV
	DT7jqCgYAX0mnknKuaebq4vkpQ7qjBSiJUZbPrb3Lewvh0IHUbbzMxu4IXrWp2B5ZbWNA3HRWiYG1
	GWzNyw5Dsr6FQY4aaPXrmzSgYFwSi1jYKK75TKxgzchMzL3tF5xB2Ng+3Mrf1zR7YoPFenzU481o6
	E91R7YPepqaLJW8tJJwVRnEncohztT6nkziFl/mC5HI48UlWG87Tl4oPsq5nblAnQ3QTI7j3VZggc
	UJW+bk+nDcVF3A7V1G4kYYdSURlDavtFpL0JVhW9cQHPh3SdsVxBjmdGX11RWGf4gs+5be54N8h3o
	XzqS9lDQ==;
Received: from ip6-localhost ([::1]:63766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6L7-0099KH-4C; Wed, 29 Oct 2025 13:35:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47084) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6D2-0096fo-W4
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xddiNsVP0l/3dpsY9CGYMxWPxb2FY1Kj0kHY0ylVM3s=; b=dLOOsCwym8H8jdkX7CvQiNvb6O
 X2VpOuNPt/0ER42rhs6JXAo2z3kx2tcMN8sZVQmSXcW4mOneE52jJ0fQGw2DFRYyBI78N5py3Ojgb
 y0NvvZ1r6fCNZnNVm0Op/K1bhJKdg6qgsUuDyr5my878Pf7CbFanAPnoneZi/R8/R3rrGmkG9sbMJ
 BHG6J4AHehemBCY3aP0GKO7ezJ0/AUCPMk0aDCg3twnCH6/C9DKox3vgXp6gXl3DYKgfsK92Qo8Mt
 z2nroVqhQVXISeJ6Rs2YwC/grNwgHclr29ULxnzq4fXQFrwIAOASi1sTd9XIIa1Cr0jqwBYxu1H96
 HwahoWCjg/JG0H8okeYOBCOftq+SFnTqdSbmH1MGz0Lx3NSLWwt3o391iWxxO5cZ8uW0budiHwQQA
 pQZgn2jfUyOxCiw4GNiNcWdW1QsXgyOc+5YuxihCwfTKjYkCoPithWKLa8T78yMoYcgbVDV0zM2lR
 oSD9R+TNYuUwZmdNRMJl9hwT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6D0-00BbwC-2Y; Wed, 29 Oct 2025 13:27:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 050/127] smb: smbdirect: introduce
 smbdirect_connect[_sync]()
Date: Wed, 29 Oct 2025 14:20:28 +0100
Message-ID: <8faad8040491eb5c164ee63b137ac7545fa170d4.1761742839.git.metze@samba.org>
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

This implements a fully async connect logic over
all rdma related operations: rdma_resolve_addr,
rdma_resolve_route and rdma_connect_locked
until we reach RDMA_CM_EVENT_ESTABLISHED,
followed by the smbdirect negotiation request/response
handling until we reach SMBDIRECT_SOCKET_CONNECTED.

smbdirect_connect_sync() is just a useful wrapper
around the async logic calling smbdirect_connect()
followed by smbdirect_connection_wait_for_connected(),
which only waits for SMBDIRECT_SOCKET_CONNECTED or
an error.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_all_c_files.c  |   1 +
 fs/smb/common/smbdirect/smbdirect_connect.c   | 796 ++++++++++++++++++
 2 files changed, 797 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connect.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
index 6d4cd41ebe10..257cf0cf92d0 100644
--- a/fs/smb/common/smbdirect/smbdirect_all_c_files.c
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -19,3 +19,4 @@
 #include "smbdirect_mr.c"
 #include "smbdirect_rw.c"
 #include "smbdirect_debug.c"
+#include "smbdirect_connect.c"
diff --git a/fs/smb/common/smbdirect/smbdirect_connect.c b/fs/smb/common/smbdirect/smbdirect_connect.c
new file mode 100644
index 000000000000..458566c99d2e
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_connect.c
@@ -0,0 +1,796 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2012,2016,2017,2025 Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
+
+static int smbdirect_connect_setup_connection(struct smbdirect_socket *sc);
+static int smbdirect_connect_resolve_addr(struct smbdirect_socket *sc,
+					  const struct sockaddr *src,
+					  const struct sockaddr *dst);
+static int smbdirect_connect_rdma_event_handler(struct rdma_cm_id *id,
+						struct rdma_cm_event *event);
+static int smbdirect_connect_negotiate_start(struct smbdirect_socket *sc);
+static void smbdirect_connect_negotiate_send_done(struct ib_cq *cq, struct ib_wc *wc);
+static void smbdirect_connect_negotiate_recv_done(struct ib_cq *cq, struct ib_wc *wc);
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static int smbdirect_connect(struct smbdirect_socket *sc,
+			     const struct sockaddr *dst)
+{
+	const struct sockaddr *src = NULL;
+	union {
+		struct sockaddr sa;
+		struct sockaddr_storage ss;
+	} src_addr = {
+		.sa = {
+			.sa_family = AF_UNSPEC,
+		},
+	};
+	int ret;
+
+	if (sc->first_error)
+		return -ENOTCONN;
+
+	if (sc->status != SMBDIRECT_SOCKET_CREATED)
+		return -EALREADY;
+
+	if (WARN_ON_ONCE(!sc->rdma.cm_id))
+		return -EINVAL;
+
+	src_addr.ss = sc->rdma.cm_id->route.addr.src_addr;
+	if (src_addr.sa.sa_family != AF_UNSPEC)
+		src = &src_addr.sa;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"connect: src: %pISpsfc dst: %pISpsfc\n",
+		src, dst);
+
+	ret = smbdirect_connect_setup_connection(sc);
+	if (ret)
+		return ret;
+
+	ret = smbdirect_connect_resolve_addr(sc, src, dst);
+	if (ret)
+		return ret;
+
+	/*
+	 * The rest happens async via smbdirect_connect_rdma_event_handler()
+	 * the caller will decide to wait or not.
+	 */
+	return 0;
+}
+
+static int smbdirect_connect_setup_connection(struct smbdirect_socket *sc)
+{
+	int ret;
+
+	ret = rdma_set_afonly(sc->rdma.cm_id, 1);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"rdma_set_afonly() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	rdma_lock_handler(sc->rdma.cm_id);
+	sc->rdma.cm_id->event_handler = smbdirect_connect_rdma_event_handler;
+	rdma_unlock_handler(sc->rdma.cm_id);
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED;
+
+	return 0;
+}
+
+static int smbdirect_connect_resolve_addr(struct smbdirect_socket *sc,
+					  const struct sockaddr *src,
+					  const struct sockaddr *dst)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct sockaddr *src_addr = NULL;
+	struct sockaddr *dst_addr = NULL;
+	int ret;
+
+	src_addr = (struct sockaddr *)src;
+	if (src_addr && src_addr->sa_family == AF_UNSPEC)
+		src_addr = NULL;
+	dst_addr = (struct sockaddr *)dst;
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING;
+	sc->rdma.expected_event = RDMA_CM_EVENT_ADDR_RESOLVED;
+	ret = rdma_resolve_addr(sc->rdma.cm_id, src_addr, dst_addr,
+				sp->resolve_addr_timeout_msec);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"rdma_resolve_addr() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int smbdirect_connect_resolve_route(struct smbdirect_socket *sc)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	int ret;
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING;
+	sc->rdma.expected_event = RDMA_CM_EVENT_ROUTE_RESOLVED;
+	ret = rdma_resolve_route(sc->rdma.cm_id, sp->resolve_route_timeout_msec);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"rdma_resolve_route() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int smbdirect_connect_rdma_connect(struct smbdirect_socket *sc)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct rdma_conn_param conn_param;
+	__be32 ird_ord_hdr[2];
+	int ret;
+
+	sc->ib.dev = sc->rdma.cm_id->device;
+
+	if (!smbdirect_frwr_is_supported(&sc->ib.dev->attrs)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"Fast Registration Work Requests (FRWR) is not supported device %.*s\n",
+			IB_DEVICE_NAME_MAX,
+			sc->ib.dev->name);
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"Device capability flags = %llx max_fast_reg_page_list_len = %u\n",
+			sc->ib.dev->attrs.device_cap_flags,
+			sc->ib.dev->attrs.max_fast_reg_page_list_len);
+		return -EPROTONOSUPPORT;
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"rdma connect: device: %.*s local: %pISpsfc remote: %pISpsfc\n",
+		IB_DEVICE_NAME_MAX,
+		sc->ib.dev->name,
+		&sc->rdma.cm_id->route.addr.src_addr,
+		&sc->rdma.cm_id->route.addr.dst_addr);
+
+	sp->max_frmr_depth = min_t(u32, sp->max_frmr_depth,
+				   sc->ib.dev->attrs.max_fast_reg_page_list_len);
+	sc->mr_io.type = IB_MR_TYPE_MEM_REG;
+	if (sc->ib.dev->attrs.kernel_cap_flags & IBK_SG_GAPS_REG)
+		sc->mr_io.type = IB_MR_TYPE_SG_GAPS;
+
+	sp->responder_resources = min_t(u8, sp->responder_resources,
+					sc->ib.dev->attrs.max_qp_rd_atom);
+	smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_INFO,
+		"responder_resources=%d\n",
+		sp->responder_resources);
+
+	ret = smbdirect_connection_create_qp(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_create_qp() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	memset(&conn_param, 0, sizeof(conn_param));
+	conn_param.initiator_depth = sp->initiator_depth;
+	conn_param.responder_resources = sp->responder_resources;
+
+	/* Need to send IRD/ORD in private data for iWARP */
+	if (rdma_protocol_iwarp(sc->ib.dev, sc->rdma.cm_id->port_num)) {
+		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
+		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
+		conn_param.private_data = ird_ord_hdr;
+		conn_param.private_data_len = sizeof(ird_ord_hdr);
+	} else {
+		conn_param.private_data = NULL;
+		conn_param.private_data_len = 0;
+	}
+
+	conn_param.retry_count = SMBDIRECT_RDMA_CM_RETRY;
+	conn_param.rnr_retry_count = SMBDIRECT_RDMA_CM_RNR_RETRY;
+	conn_param.flow_control = 0;
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING;
+	sc->rdma.expected_event = RDMA_CM_EVENT_ESTABLISHED;
+	ret = rdma_connect_locked(sc->rdma.cm_id, &conn_param);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"rdma_connect_locked() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	/*
+	 * start with the rdma connect timeout and SMBDIRECT_KEEPALIVE_PENDING
+	 * so that the timer will cause a disconnect.
+	 */
+	INIT_DELAYED_WORK(&sc->idle.timer_work, smbdirect_connection_idle_timer_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->rdma_connect_timeout_msec));
+
+	return 0;
+}
+
+static int smbdirect_connect_rdma_event_handler(struct rdma_cm_id *id,
+						struct rdma_cm_event *event)
+{
+	struct smbdirect_socket *sc = id->context;
+	u8 peer_initiator_depth;
+	u8 peer_responder_resources;
+	int ret;
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
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
+	cancel_delayed_work_sync(&sc->idle.timer_work);
+
+	if (event->status || event->event != sc->rdma.expected_event) {
+		ret = -ECONNABORTED;
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
+		smbdirect_connection_schedule_disconnect(sc, ret);
+		return 0;
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"%s (first_error=%1pe) event=%s\n",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		rdma_event_msg(event->event));
+
+	switch (event->event) {
+	case RDMA_CM_EVENT_ADDR_RESOLVED:
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
+
+		ret = smbdirect_connect_resolve_route(sc);
+		if (ret)
+			smbdirect_connection_schedule_disconnect(sc, ret);
+		return 0;
+
+	case RDMA_CM_EVENT_ROUTE_RESOLVED:
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
+
+		ret = smbdirect_connect_rdma_connect(sc);
+		if (ret)
+			smbdirect_connection_schedule_disconnect(sc, ret);
+		return 0;
+
+	case RDMA_CM_EVENT_ESTABLISHED:
+		smbdirect_connection_rdma_established(sc);
+
+		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
+
+		/*
+		 * Here we work around an inconsistency between
+		 * iWarp and other devices (at least rxe and irdma using RoCEv2)
+		 */
+		if (rdma_protocol_iwarp(id->device, id->port_num)) {
+			/*
+			 * iWarp devices report the peer's values
+			 * with the perspective of the peer here.
+			 * Tested with siw and irdma (in iwarp mode)
+			 * We need to change to our perspective here,
+			 * so we need to switch the values.
+			 */
+			peer_initiator_depth = event->param.conn.responder_resources;
+			peer_responder_resources = event->param.conn.initiator_depth;
+		} else {
+			/*
+			 * Non iWarp devices report the peer's values
+			 * already changed to our perspective here.
+			 * Tested with rxe and irdma (in roce mode).
+			 */
+			peer_initiator_depth = event->param.conn.initiator_depth;
+			peer_responder_resources = event->param.conn.responder_resources;
+		}
+		smbdirect_connection_negotiate_rdma_resources(sc,
+							      peer_initiator_depth,
+							      peer_responder_resources,
+							      &event->param.conn);
+
+		ret = smbdirect_connect_negotiate_start(sc);
+		if (ret)
+			smbdirect_connection_schedule_disconnect(sc, ret);
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
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+	return 0;
+}
+
+static int smbdirect_connect_negotiate_start(struct smbdirect_socket *sc)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_recv_io *recv_io = NULL;
+	struct smbdirect_send_io *send_io = NULL;
+	struct smbdirect_negotiate_req *nreq = NULL;
+	struct ib_send_wr send_wr;
+	int ret;
+
+	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
+	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
+
+	ret = smbdirect_connection_create_mem_pools(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_create_mem_pools() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto create_mem_pools_failed;
+	}
+
+	/*
+	 * Initialize the local credits to post
+	 * IB_WR_SEND[_WITH_INV].
+	 */
+	atomic_set(&sc->send_io.lcredits.count, sp->send_credit_target);
+
+	recv_io = smbdirect_connection_get_recv_io(sc);
+	if (WARN_ON_ONCE(!recv_io)) {
+		ret = -EINVAL;
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_get_recv_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto get_recv_io_failed;
+	}
+	recv_io->cqe.done = smbdirect_connect_negotiate_recv_done;
+
+	send_io = smbdirect_connection_alloc_send_io(sc);
+	if (IS_ERR(send_io)) {
+		ret = PTR_ERR(send_io);
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_alloc_send_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto alloc_send_io_failed;
+	}
+	send_io->cqe.done = smbdirect_connect_negotiate_send_done;
+
+	nreq = (struct smbdirect_negotiate_req *)send_io->packet;
+	nreq->min_version = cpu_to_le16(SMBDIRECT_V1);
+	nreq->max_version = cpu_to_le16(SMBDIRECT_V1);
+	nreq->reserved = 0;
+	nreq->credits_requested = cpu_to_le16(sp->send_credit_target);
+	nreq->preferred_send_size = cpu_to_le32(sp->max_send_size);
+	nreq->max_receive_size = cpu_to_le32(sp->max_recv_size);
+	nreq->max_fragmented_size = cpu_to_le32(sp->max_fragmented_recv_size);
+
+	smbdirect_log_negotiate(sc, SMBDIRECT_LOG_INFO,
+		"ReqOut: %s%x, %s%x, %s%u, %s%u, %s%u, %s%u\n",
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
+	send_io->sge[0].addr = ib_dma_map_single(sc->ib.dev,
+						 nreq,
+						 sizeof(*nreq),
+						 DMA_TO_DEVICE);
+	ret = ib_dma_mapping_error(sc->ib.dev, send_io->sge[0].addr);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"ib_dma_mapping_error() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto dma_mapping_failed;
+	}
+
+	send_io->sge[0].length = sizeof(*nreq);
+	send_io->sge[0].lkey = sc->ib.pd->local_dma_lkey;
+	send_io->num_sge = 1;
+
+	ib_dma_sync_single_for_device(sc->ib.dev,
+				      send_io->sge[0].addr,
+				      send_io->sge[0].length,
+				      DMA_TO_DEVICE);
+
+	smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_INFO,
+		"sge addr=0x%llx length=%u lkey=0x%x\n",
+		send_io->sge[0].addr,
+		send_io->sge[0].length,
+		send_io->sge[0].lkey);
+
+	/*
+	 * Now post the recv_io buffer in order to get
+	 * the negotiate response
+	 */
+	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
+	ret = smbdirect_connection_post_recv_io(recv_io);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_post_recv_io() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto post_recv_io_failed;
+	}
+
+	send_wr.next = NULL;
+	send_wr.wr_cqe = &send_io->cqe;
+	send_wr.sg_list = send_io->sge;
+	send_wr.num_sge = send_io->num_sge;
+	send_wr.opcode = IB_WR_SEND;
+	send_wr.send_flags = IB_SEND_SIGNALED;
+
+	ret = smbdirect_connection_post_send_wr(sc, &send_wr);
+	if (ret) {
+		/* if we reach here, post send failed */
+		smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_post_send_wr() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto post_send_wr_failed;
+	}
+
+	/*
+	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
+	 * so that the timer will cause a disconnect.
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->negotiate_timeout_msec));
+
+	return 0;
+
+post_send_wr_failed:
+	/*
+	 * ib_dma_unmap_single is called in
+	 * smbdirect_connection_free_send_io()
+	 */
+	smbdirect_connection_free_send_io(send_io);
+	/*
+	 * recv_io is given to the rdma layer,
+	 * we should not put it even on error
+	 * nor call smbdirect_connection_destroy_mem_pools()
+	 * it will be cleaned up during disconnect.
+	 */
+	return ret;
+
+post_recv_io_failed:
+	/*
+	 * ib_dma_unmap_single is called in
+	 * smbdirect_connection_free_send_io()
+	 */
+dma_mapping_failed:
+	smbdirect_connection_free_send_io(send_io);
+
+alloc_send_io_failed:
+	smbdirect_connection_put_recv_io(recv_io);
+
+get_recv_io_failed:
+	smbdirect_connection_destroy_mem_pools(sc);
+
+create_mem_pools_failed:
+	return ret;
+}
+
+static void smbdirect_connect_negotiate_send_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_send_io *send_io =
+		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
+	struct smbdirect_socket *sc = send_io->socket;
+
+	smbdirect_log_rdma_send(sc, SMBDIRECT_LOG_INFO,
+		"smbdirect_send_io completed. status='%s (%d)', opcode=%d\n",
+		ib_wc_status_msg(wc->status), wc->status, wc->opcode);
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
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+		return;
+	}
+}
+
+static void smbdirect_connect_negotiate_recv_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_recv_io *recv_io =
+		container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
+	struct smbdirect_socket *sc = recv_io->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_negotiate_resp *nrep;
+	u16 negotiated_version;
+	u16 credits_requested;
+	u16 credits_granted;
+	u32 status;
+	u32 max_readwrite_size;
+	u32 preferred_send_size;
+	u32 max_receive_size;
+	u32 max_fragmented_size;
+	int posted;
+	int ret;
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
+	 * Reset timer to the keepalive interval in
+	 * order to trigger our next keepalive message.
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->keepalive_interval_msec));
+
+	ib_dma_sync_single_for_cpu(wc->qp->device,
+				   recv_io->sge.addr,
+				   recv_io->sge.length,
+				   DMA_FROM_DEVICE);
+
+	if (wc->byte_len < sizeof(*nrep)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"wc->byte_len=%u < %zu\n",
+			wc->byte_len, sizeof(*nrep));
+		goto error;
+	}
+
+	nrep = (struct smbdirect_negotiate_resp *)recv_io->packet;
+	negotiated_version = le16_to_cpu(nrep->negotiated_version);
+	credits_requested = le16_to_cpu(nrep->credits_requested);
+	credits_granted = le16_to_cpu(nrep->credits_granted);
+	status = le32_to_cpu(nrep->status);
+	max_readwrite_size = le32_to_cpu(nrep->max_readwrite_size);
+	preferred_send_size = le32_to_cpu(nrep->preferred_send_size);
+	max_receive_size = le32_to_cpu(nrep->max_receive_size);
+	max_fragmented_size = le32_to_cpu(nrep->max_fragmented_size);
+
+	smbdirect_log_negotiate(sc, SMBDIRECT_LOG_INFO,
+		"RepIn: %s%x, %s%x, %s%x, %s%u, %s%u, %s%x, %s%u, %s%u, %s%u, %s%u\n",
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
+	if (negotiated_version != SMBDIRECT_V1) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: negotiated_version=0x%x\n",
+			negotiated_version);
+		goto error;
+	}
+
+	if (max_receive_size < SMBDIRECT_MIN_RECEIVE_SIZE) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: max_receive_size=%u < %u\n",
+			max_receive_size,
+			SMBDIRECT_MIN_RECEIVE_SIZE);
+		goto error;
+	}
+
+	if (max_fragmented_size < SMBDIRECT_MIN_FRAGMENTED_SIZE) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: max_fragmented_size=%u < %u\n",
+			max_fragmented_size,
+			SMBDIRECT_MIN_FRAGMENTED_SIZE);
+		goto error;
+	}
+
+	if (credits_granted == 0) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: credits_granted == 0\n");
+		goto error;
+	}
+
+	if (credits_requested == 0) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: credits_requested == 0\n");
+		goto error;
+	}
+
+	if (preferred_send_size > sp->max_recv_size) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: preferred_send_size=%u < max_recv_size=%u\n",
+			preferred_send_size,
+			sp->max_recv_size);
+		goto error;
+	}
+
+	if (status != 0) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: status=0x%x != 0x0\n",
+			status);
+		goto error;
+	}
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
+	 * At least the value of SMBDIRECT_MIN_RECEIVE_SIZE is used.
+	 */
+	sp->max_recv_size = min_t(u32, sp->max_recv_size, preferred_send_size);
+	sp->max_recv_size = max_t(u32, sp->max_recv_size, SMBDIRECT_MIN_RECEIVE_SIZE);
+
+	/*
+	 * Note nrep->max_receive_size was already checked against
+	 * SMBDIRECT_MIN_RECEIVE_SIZE above.
+	 */
+	sp->max_send_size = min_t(u32, sp->max_send_size, max_receive_size);
+
+	/*
+	 * Make sure the resulting max_frmr_depth is at least 1,
+	 * which means max_read_write_size needs to be at least PAGE_SIZE.
+	 */
+	sp->max_read_write_size = min_t(u32, sp->max_frmr_depth * PAGE_SIZE,
+					max_readwrite_size);
+	if (sp->max_read_write_size < PAGE_SIZE) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: max_readwrite_size=%u < PAGE_SIZE(%lu)\n",
+			max_readwrite_size,
+			PAGE_SIZE);
+		goto error;
+	}
+	sp->max_frmr_depth = sp->max_read_write_size / PAGE_SIZE;
+
+	/*
+	 * Note nrep->credits_granted was already checked against 0 above.
+	 */
+	atomic_set(&sc->send_io.credits.count, credits_granted);
+
+	/*
+	 * Note nrep->max_fragmented_size was already checked against
+	 * SMBDIRECT_MIN_FRAGMENTED_SIZE above.
+	 */
+	sp->max_fragmented_send_size = max_fragmented_size;
+
+	/*
+	 * Give recv_io back to the recv_io.free.list,
+	 * so that the refill can also post it.
+	 */
+	smbdirect_connection_put_recv_io(recv_io);
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
+	ret = smbdirect_connection_create_mr_list(sc);
+	if (ret) {
+		smbdirect_log_rdma_mr(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_create_mr_list() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto error;
+	}
+
+	/*
+	 * We should at least post 1 smbdirect_recv_io!
+	 */
+	posted = smbdirect_connection_recv_io_refill(sc);
+	if (posted < 1) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_recv_io_refill() failed %1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		goto error;
+	}
+
+	/*
+	 * smbdirect_connection_negotiation_done()
+	 * will setup all required things and wake up
+	 * the waiter.
+	 */
+	smbdirect_connection_negotiation_done(sc);
+
+	return;
+
+error:
+	/*
+	 * recv_io.posted.refill_work is still disabled,
+	 * so smbdirect_connection_put_recv_io() won't
+	 * start it.
+	 */
+	if (recv_io)
+		smbdirect_connection_put_recv_io(recv_io);
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+}
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static int smbdirect_connect_sync(struct smbdirect_socket *sc,
+				  const struct sockaddr *dst)
+{
+	int ret;
+
+	ret = smbdirect_connect(sc, dst);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connect(%pISpsfc) failed %1pe\n",
+			dst, SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = smbdirect_connection_wait_for_connected(sc);
+	if (ret) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"wait for smbdirect_connect(%pISpsfc) failed %1pe\n",
+			dst, SMBDIRECT_DEBUG_ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.43.0


