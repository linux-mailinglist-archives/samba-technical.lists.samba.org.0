Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E2C86901
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pArqqcoriRPaVWaju2RmfcFmodxCz+Rh9biu896f3fI=; b=aOSzMTehkhw9odX7wC0oaAl3/y
	GGqycjqjoLVq/Yy1X518KDlGANnluGTHFW5NWX4plwz9KnZPG9QA4tWMqtPtpuVKfYReoqpvjvt5N
	qpEUntGTym/JPpFIgiaidAkXRkzGJlaHOQHyk4hOJzt+Hyxr5h6eI2HxL5dcaW1n+tJS+LuPDXPwF
	Cd+ZhgOHb0ijSOi9QOEWY2KurWuDRm1BXlYHWuOAXa3n+N+DMa2W0yeHMMCQikbGpmDe0MjM3OTeO
	dDp8NKkQVQKOQ8irO6Q9LH9+SiKWy+n/A2Iq5xL9hEHsEZsRnF33zra4Vc29hse2zK4XQk14DdVeC
	Qr0CSscA==;
Received: from ip6-localhost ([::1]:44674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxeQ-00DE5H-Fc; Tue, 25 Nov 2025 18:20:31 +0000
Received: from hr2.samba.org ([144.76.82.148]:35254) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDdW-7k
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pArqqcoriRPaVWaju2RmfcFmodxCz+Rh9biu896f3fI=; b=TzhFT3jc2BsglN9uG96VRPkTEu
 1PwrdVYmOqwSlsdl9YM54qvXi5DztTf/CxAQladT8XLFQnBihzUV6sO7u/rFnQK7/gLTUdJssWzDL
 mwV2xT/68QC7OxSbZdQaQM6r3AkOmfAtgGm57GHwbjVY26XzzIJT5E2bF+B7Tg/vlVaWdGv7MyPNA
 bLU6KqL3rw/s7m745M3JgV+pGn0a7abt/MNV7xjB7Mz9qqxoxzVPP5/Q8N1YVpuIfDSEYI4xtCv7+
 XduGFw9jUgL1RzdWcnxGxhAfSFnjfD7bqMv0k61rXkyeTNV6JUVSYxQxU7RmSZj3xVgSLA7uKNIgK
 07tfM8FvOUT03XzUFERJu9W96E2OdFf1NXnAXN6V7QDYElteMeHH0iJCkRwqWQL2pJaIuQhz7kG+z
 Qe7qdQSrLjryExX+5pIWkzUz0FryEbNt6SDlnh+igrtxA2sTJBgqPKHd1IimEP2VD8by+KdNL8lIQ
 9Kcrq2K1Hy5ZMD/DtyvGSLjU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVB-00FeHa-1g; Tue, 25 Nov 2025 18:10:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 102/145] smb: server: make use of
 smbdirect_socket_schedule_cleanup()
Date: Tue, 25 Nov 2025 18:55:48 +0100
Message-ID: <b1e7847b46733557ca6271f7bb5344b91abf8a51.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This removes smb_direct_disconnect_rdma_connection() which is basically
the same as smbdirect_socket_schedule_cleanup().
And we pass more useful errors than -ECONNABORTED if we have them.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 97 +++++-----------------------------
 1 file changed, 13 insertions(+), 84 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e29351780b90..88c4b4bf568d 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -21,8 +21,6 @@
 #include <rdma/rdma_cm.h>
 #include <rdma/rw.h>
 
-#define __SMBDIRECT_SOCKET_DISCONNECT(__sc) smb_direct_disconnect_rdma_connection(__sc)
-
 #include "glob.h"
 #include "connection.h"
 #include "smb_common.h"
@@ -32,8 +30,6 @@
 #include "../common/smbdirect/smbdirect_socket.h"
 #include "transport_rdma.h"
 
-static void smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc);
-
 /*
  * This is a temporary solution until all code
  * is moved to smbdirect_all_c_files.c and we
@@ -285,73 +281,6 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *s
 		return NULL;
 }
 
-static void
-smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
-{
-	if (sc->first_error == 0)
-		sc->first_error = -ECONNABORTED;
-
-	/*
-	 * make sure other work (than disconnect_work) is
-	 * not queued again but here we don't block and avoid
-	 * disable[_delayed]_work_sync()
-	 */
-	disable_work(&sc->recv_io.posted.refill_work);
-	disable_work(&sc->idle.immediate_work);
-	disable_delayed_work(&sc->idle.timer_work);
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
-		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		break;
-
-	case SMBDIRECT_SOCKET_CONNECTED:
-		sc->status = SMBDIRECT_SOCKET_ERROR;
-		break;
-	}
-
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	smbdirect_socket_wake_up_all(sc);
-
-	queue_work(sc->workqueue, &sc->disconnect_work);
-}
-
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -370,7 +299,7 @@ static void smb_direct_idle_connection_timer(struct work_struct *work)
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 
 	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
-		smb_direct_disconnect_rdma_connection(sc);
+		smbdirect_socket_schedule_cleanup(sc, -ETIMEDOUT);
 		return;
 	}
 
@@ -619,7 +548,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
 			       ib_wc_status_msg(wc->status), wc->status,
 			       wc->opcode);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 		}
 		return;
 	}
@@ -643,7 +572,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
 		sc->recv_io.reassembly.full_packet_received = true;
@@ -656,7 +585,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_NEEDED)) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
@@ -672,7 +601,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (wc->byte_len <
 		    offsetof(struct smbdirect_data_transfer, padding)) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
 
@@ -682,7 +611,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (wc->byte_len < data_offset ||
 		    wc->byte_len < (u64)data_offset + data_length) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
 		if (remaining_data_length > sp->max_fragmented_recv_size ||
@@ -690,7 +619,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		    (u64)remaining_data_length + (u64)data_length >
 		    (u64)sp->max_fragmented_recv_size) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
 
@@ -745,7 +674,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 */
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 	put_recvmsg(sc, recvmsg);
-	smb_direct_disconnect_rdma_connection(sc);
+	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 }
 
 static int smb_direct_post_recv(struct smbdirect_socket *sc,
@@ -778,7 +707,7 @@ static int smb_direct_post_recv(struct smbdirect_socket *sc,
 				    recvmsg->sge.addr, recvmsg->sge.length,
 				    DMA_FROM_DEVICE);
 		recvmsg->sge.length = 0;
-		smb_direct_disconnect_rdma_connection(sc);
+		smbdirect_socket_schedule_cleanup(sc, ret);
 		return ret;
 	}
 	return ret;
@@ -965,7 +894,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		pr_err("Send error. status='%s (%d)', opcode=%d\n",
 		       ib_wc_status_msg(wc->status), wc->status,
 		       wc->opcode);
-		smb_direct_disconnect_rdma_connection(sc);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 		return;
 	}
 
@@ -1021,7 +950,7 @@ static int smb_direct_post_send(struct smbdirect_socket *sc,
 	ret = ib_post_send(sc->ib.qp, wr, NULL);
 	if (ret) {
 		pr_err("failed to post send: %d\n", ret);
-		smb_direct_disconnect_rdma_connection(sc);
+		smbdirect_socket_schedule_cleanup(sc, ret);
 	}
 	return ret;
 }
@@ -1548,7 +1477,7 @@ static void read_write_done(struct ib_cq *cq, struct ib_wc *wc,
 		pr_err("read/write error. opcode = %d, status = %s(%d)\n",
 		       wc->opcode, ib_wc_status_msg(wc->status), wc->status);
 		if (wc->status != IB_WC_WR_FLUSH_ERR)
-			smb_direct_disconnect_rdma_connection(sc);
+			smbdirect_socket_schedule_cleanup(sc, msg->error);
 	}
 
 	complete(msg->completion);
@@ -1792,7 +1721,7 @@ static void smb_direct_qpair_handler(struct ib_event *event, void *context)
 	switch (event->event) {
 	case IB_EVENT_CQ_ERR:
 	case IB_EVENT_QP_FATAL:
-		smb_direct_disconnect_rdma_connection(sc);
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 		break;
 	default:
 		break;
-- 
2.43.0


