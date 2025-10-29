Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C65C1AC65
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:38:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=stQETD4AoCdOa3jvF2qFWSZymTawxm5Y5vDZ8YAkMoI=; b=Ez1LufOWAN9P9aXV6aWEbQ6zTX
	DHcOZ0AOPHGV/QzJrfq+59JEh78IdW68D2nByLsZUst9/qzhZBFndz17fu6+331vmt8bYiOYBAcYI
	SA7OeWP3PnLLqiJcgiX84uN9TRRVI3aabaw46Wl2CwEXnJyTO5iSLIM8/5z8xD+tWd+eZAXt0N9Di
	Y9to4H9LMEuR2Qxw/E/xBdNrxzyIg/iy1bx07GMRFxOuFwm2O4fs9NRk8XTCfXVNvmtYHlOZzOGHv
	xkULSAOfIR1Zf+8hv1GFCOWh6NPm8SxkgDIJYQ1OUS7QFcGesm+Se7iALxCmw7uEvIsGOAV3gXMo9
	UNfoNQCA==;
Received: from ip6-localhost ([::1]:18376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6N2-009A0H-HL; Wed, 29 Oct 2025 13:37:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26718) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6E4-00970L-6s
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=stQETD4AoCdOa3jvF2qFWSZymTawxm5Y5vDZ8YAkMoI=; b=yCeny92Y7SjOUnio5Avwo6pRT4
 NKD/8m8jaDLuLiPE3tBrtohItJhYvAatlqifKAY8QrfMNkv3iYi+/+97TDddeIVheUAM/TafdWX0y
 WS76ZDTClnpzEGmX8ccZ+vg1SjXucy/ducn4YLwQCdp1hA1KCCmK3Mgu4YBHYjK2YkKjV2bQaiqhp
 37HgB+nslm8RzoTlIPgustWTD1VmFmOA37r6goTX9eMtTYa532IMbjoWtVKBSU5sYud9SajZdVP8i
 /gg7W3KBH440bP9a7F26Tjh9gRRQvuyF1xoPcDBNTewFKfuzatOf+TvXugLruc7KVfj3SEKRHetnO
 nYBjb0THFu81ws+rBu4KwSphj4+nvhUtlIKKpUImP+Lf/Bx1nUWbE4V+nvvS7pm5hTmyhbaz4ng/2
 rATs563Rl8sTq4P8K0S0BWRqWDGoE2UYQZwNbvna6g3qwJZJQgeHU3tROXtbD/SANQHb16H/ISsEf
 1ecXL0Lc1A3z3VwC9JZlEXup;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6E1-00Bc69-1P; Wed, 29 Oct 2025 13:28:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 061/127] smb: client: make use of
 smbdirect_connection_schedule_disconnect()
Date: Wed, 29 Oct 2025 14:20:39 +0100
Message-ID: <720656ed2a9768b557560db9e5bd38a01a04f0ca.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This removes smbd_disconnect_rdma_connection() which is basically
the same as smbdirect_connection_schedule_disconnect().
And we pass more useful errors than -ECONNABORTED if we have them.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 91 ++++++---------------------------------
 1 file changed, 14 insertions(+), 77 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 137fad17e5a1..8b98ef1d41e1 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -213,70 +213,6 @@ do {									\
 #define log_rdma_mr(level, fmt, args...) \
 		log_rdma(level, LOG_RDMA_MR, fmt, ##args)
 
-static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
-{
-	/*
-	 * make sure other work (than disconnect_work) is
-	 * not queued again but here we don't block and avoid
-	 * disable[_delayed]_work_sync()
-	 */
-	disable_work(&sc->recv_io.posted.refill_work);
-	disable_work(&sc->mr_io.recovery_work);
-	disable_work(&sc->idle.immediate_work);
-	disable_delayed_work(&sc->idle.timer_work);
-
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
-
-	switch (sc->status) {
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
-	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
-	case SMBDIRECT_SOCKET_ERROR:
-	case SMBDIRECT_SOCKET_DISCONNECTING:
-	case SMBDIRECT_SOCKET_DISCONNECTED:
-	case SMBDIRECT_SOCKET_DESTROYED:
-		/*
-		 * Keep the current error status
-		 */
-		break;
-
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
-	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
-		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		break;
-
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
-	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
-		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		break;
-
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
-	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
-		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		break;
-
-	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
-	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
-		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-		break;
-
-	case SMBDIRECT_SOCKET_CREATED:
-	case SMBDIRECT_SOCKET_CONNECTED:
-		sc->status = SMBDIRECT_SOCKET_ERROR;
-		break;
-	}
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	smbdirect_connection_wake_up_all(sc);
-
-	queue_work(sc->workqueue, &sc->disconnect_work);
-}
-
 /* Upcall from RDMA CM */
 static int smbd_conn_upcall(
 		struct rdma_cm_id *id, struct rdma_cm_event *event)
@@ -444,7 +380,7 @@ smbd_qp_async_error_upcall(struct ib_event *event, void *context)
 	switch (event->event) {
 	case IB_EVENT_CQ_ERR:
 	case IB_EVENT_QP_FATAL:
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 		break;
 
 	default:
@@ -486,7 +422,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (wc->status != IB_WC_WR_FLUSH_ERR)
 			log_rdma_send(ERR, "wc->status=%s wc->opcode=%d\n",
 				ib_wc_status_msg(wc->status), wc->opcode);
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 		return;
 	}
 
@@ -672,7 +608,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
 		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-			smbd_disconnect_rdma_connection(sc);
+			smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 		} else {
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
 			wake_up(&sc->status_wait);
@@ -769,7 +705,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 error:
 	put_receive_buffer(sc, response);
-	smbd_disconnect_rdma_connection(sc);
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 }
 
 static struct rdma_cm_id *smbd_create_id(
@@ -984,7 +920,7 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	ib_dma_unmap_single(sc->ib.dev, request->sge[0].addr,
 		request->sge[0].length, DMA_TO_DEVICE);
 
-	smbd_disconnect_rdma_connection(sc);
+	smbdirect_connection_schedule_disconnect(sc, rc);
 
 dma_mapping_failed:
 	mempool_free(request, sc->send_io.mem.pool);
@@ -1073,7 +1009,7 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 	rc = ib_post_send(sc->ib.qp, &send_wr, NULL);
 	if (rc) {
 		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, rc);
 		rc = -EAGAIN;
 	}
 
@@ -1314,7 +1250,7 @@ static int smbd_post_recv(
 		ib_dma_unmap_single(sc->ib.dev, response->sge.addr,
 				    response->sge.length, DMA_FROM_DEVICE);
 		response->sge.length = 0;
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, rc);
 		log_rdma_recv(ERR, "ib_post_recv failed rc=%d\n", rc);
 	}
 
@@ -1525,7 +1461,7 @@ static void idle_connection_timer(struct work_struct *work)
 		log_keep_alive(ERR,
 			"error status sc->idle.keepalive=%d\n",
 			sc->idle.keepalive);
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, -ETIMEDOUT);
 		return;
 	}
 
@@ -2284,7 +2220,7 @@ static void register_mr_done(struct ib_cq *cq, struct ib_wc *wc)
 
 	if (wc->status) {
 		log_rdma_mr(ERR, "status=%d\n", wc->status);
-		smbd_disconnect_rdma_connection(sc);
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 	}
 }
 
@@ -2314,7 +2250,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 				log_rdma_mr(ERR,
 					"ib_dereg_mr failed rc=%x\n",
 					rc);
-				smbd_disconnect_rdma_connection(sc);
+				smbdirect_connection_schedule_disconnect(sc, rc);
 				continue;
 			}
 
@@ -2322,10 +2258,11 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 				sc->ib.pd, sc->mr_io.type,
 				sp->max_frmr_depth);
 			if (IS_ERR(smbdirect_mr->mr)) {
+				rc = PTR_ERR(smbdirect_mr->mr);
 				log_rdma_mr(ERR, "ib_alloc_mr failed mr_type=%x max_frmr_depth=%x\n",
 					    sc->mr_io.type,
 					    sp->max_frmr_depth);
-				smbd_disconnect_rdma_connection(sc);
+				smbdirect_connection_schedule_disconnect(sc, rc);
 				continue;
 			}
 		} else
@@ -2661,7 +2598,7 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 	if (atomic_dec_and_test(&sc->mr_io.used.count))
 		wake_up(&sc->mr_io.cleanup.wait_queue);
 
-	smbd_disconnect_rdma_connection(sc);
+	smbdirect_connection_schedule_disconnect(sc, rc);
 
 	/*
 	 * get_mr() gave us a reference
@@ -2736,7 +2673,7 @@ void smbd_deregister_mr(struct smbdirect_mr_io *mr)
 		if (rc) {
 			log_rdma_mr(ERR, "ib_post_send failed rc=%x\n", rc);
 			smbd_mr_disable_locked(mr);
-			smbd_disconnect_rdma_connection(sc);
+			smbdirect_connection_schedule_disconnect(sc, rc);
 			goto done;
 		}
 		wait_for_completion(&mr->invalidate_done);
-- 
2.43.0


