Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A31B34D90
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=t126UvUMb0uSxTm6j6MSqxQAhqlaP1rWFg+qzX8D9xI=; b=oHF89UjQqBgHHGl8NNVNu8Kt3F
	p19VAvuRMMM3hQJfr9tb9pt7Of0/dvEHhpxyFzL5CpVfU6Pm3FF83htvVCRu9hOsAteH7a8ZxseGn
	5nTROHxO9w5YnWS+ocVw8QPX16SifhzLlPyvQVtRVTuPrOAyKGAm3u2o+jAKHsHTdHyrtj7fxWZHm
	5H7sK9Wm4sNXTA2JXOIvJbODwdPO+YIN/hkyEblUYx7IZ/FmYHoM9U+p4l7RvLisF5UDo0VEyIY7V
	5bgx+sIB3rAl0NTiO00dqpfh1RZg5Jj+d/c5GdVYcu4AHbl/yU6p7axoFn0eOPw2n6qRr8hadB09k
	2Cp72KdA==;
Received: from ip6-localhost ([::1]:61108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeOg-000Uvi-9n; Mon, 25 Aug 2025 21:06:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeK6-000Szc-8f
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=t126UvUMb0uSxTm6j6MSqxQAhqlaP1rWFg+qzX8D9xI=; b=Zg6/CMrlUBtv6bqC+XqRx0vg17
 I6pQi0GdS6BFPeeyEshHt04klBMiaznfZdVkIX1AEP4OGxtB7/Z2fZwgFrXfV2vYiGV8lkbPD90qC
 tAFXbn7HRRQG6MNtg0KvaH+yJfiMxtWrP/Z5XoxOPM+6XuDf2nIIEzZ1Y1ti79jt6y+r6GuTnua4u
 nKY65Q7ok+Hx381OEohb270NJnI7igFJOYu3iddmSOYw7jAG2/SxIATXAHnLny6JuFa3KeJ2vyXYB
 wCDn2j1VA5fZ8CtPzcyk55XR5tsCJ7S1oVi2bFTXBV+tjSSt7brrw+z1TBA4u4kxa5TkCCvXvd8Ks
 jd3yaFY0i9xMHOsHimYhlbkUClJ8V8rQwTxdFcLHjb5WcKicyC2cB4euvUSQ5tP83fhJjb8X+x1Tg
 7J4te6g9HjIfjRZby9aBeqV8lvI5U527bgW3UUmwp3WL5zNNlCO2KtgMP3p1ycu1HewNva3GboZ1/
 /BnipM2905jklgaGfwa5PaqZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeK3-000nD3-2A; Mon, 25 Aug 2025 21:01:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 120/142] smb: server: pass struct smbdirect_socket to
 smb_direct_disconnect_rdma_connection()
Date: Mon, 25 Aug 2025 22:41:21 +0200
Message-ID: <3c0b869d25c9ddb3c5367622b08559dde7aae7d5.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 64af3e3b373a..8b6de0a6bf9d 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -260,10 +260,8 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 }
 
 static void
-smb_direct_disconnect_rdma_connection(struct smb_direct_transport *t)
+smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
@@ -285,11 +283,9 @@ static void smb_direct_idle_connection_timer(struct work_struct *work)
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, idle.timer_work.work);
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_transport *t =
-		container_of(sc, struct smb_direct_transport, socket);
 
 	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
-		smb_direct_disconnect_rdma_connection(t);
+		smb_direct_disconnect_rdma_connection(sc);
 		return;
 	}
 
@@ -516,7 +512,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
 			       ib_wc_status_msg(wc->status), wc->status,
 			       wc->opcode);
-			smb_direct_disconnect_rdma_connection(t);
+			smb_direct_disconnect_rdma_connection(sc);
 		}
 		return;
 	}
@@ -540,7 +536,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(t);
+			smb_direct_disconnect_rdma_connection(sc);
 			return;
 		}
 		sc->recv_io.reassembly.full_packet_received = true;
@@ -558,7 +554,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (wc->byte_len <
 		    offsetof(struct smbdirect_data_transfer, padding)) {
 			put_recvmsg(sc, recvmsg);
-			smb_direct_disconnect_rdma_connection(t);
+			smb_direct_disconnect_rdma_connection(sc);
 			return;
 		}
 
@@ -567,7 +563,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (wc->byte_len < sizeof(struct smbdirect_data_transfer) +
 			    (u64)data_length) {
 				put_recvmsg(sc, recvmsg);
-				smb_direct_disconnect_rdma_connection(t);
+				smb_direct_disconnect_rdma_connection(sc);
 				return;
 			}
 
@@ -621,7 +617,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 */
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 	put_recvmsg(sc, recvmsg);
-	smb_direct_disconnect_rdma_connection(t);
+	smb_direct_disconnect_rdma_connection(sc);
 }
 
 static int smb_direct_post_recv(struct smb_direct_transport *t,
@@ -655,7 +651,7 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
 				    recvmsg->sge.addr, recvmsg->sge.length,
 				    DMA_FROM_DEVICE);
 		recvmsg->sge.length = 0;
-		smb_direct_disconnect_rdma_connection(t);
+		smb_direct_disconnect_rdma_connection(sc);
 		return ret;
 	}
 	return ret;
@@ -833,7 +829,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		pr_err("Send error. status='%s (%d)', opcode=%d\n",
 		       ib_wc_status_msg(wc->status), wc->status,
 		       wc->opcode);
-		smb_direct_disconnect_rdma_connection(t);
+		smb_direct_disconnect_rdma_connection(sc);
 	}
 
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
@@ -902,7 +898,7 @@ static int smb_direct_post_send(struct smb_direct_transport *t,
 		pr_err("failed to post send: %d\n", ret);
 		if (atomic_dec_and_test(&sc->send_io.pending.count))
 			wake_up(&sc->send_io.pending.wait_queue);
-		smb_direct_disconnect_rdma_connection(t);
+		smb_direct_disconnect_rdma_connection(sc);
 	}
 	return ret;
 }
@@ -1346,15 +1342,13 @@ static void read_write_done(struct ib_cq *cq, struct ib_wc *wc,
 	struct smbdirect_rw_io *msg =
 		container_of(wc->wr_cqe, struct smbdirect_rw_io, cqe);
 	struct smbdirect_socket *sc = msg->socket;
-	struct smb_direct_transport *t =
-		container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS) {
 		msg->error = -EIO;
 		pr_err("read/write error. opcode = %d, status = %s(%d)\n",
 		       wc->opcode, ib_wc_status_msg(wc->status), wc->status);
 		if (wc->status != IB_WC_WR_FLUSH_ERR)
-			smb_direct_disconnect_rdma_connection(t);
+			smb_direct_disconnect_rdma_connection(sc);
 	}
 
 	complete(msg->completion);
@@ -1592,7 +1586,7 @@ static void smb_direct_qpair_handler(struct ib_event *event, void *context)
 	switch (event->event) {
 	case IB_EVENT_CQ_ERR:
 	case IB_EVENT_QP_FATAL:
-		smb_direct_disconnect_rdma_connection(t);
+		smb_direct_disconnect_rdma_connection(sc);
 		break;
 	default:
 		break;
-- 
2.43.0


