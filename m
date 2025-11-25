Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C663AC8683A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eAGuAwzrn2sopTNxxvdK11I+e3HMf3Tq862eWmfdIbQ=; b=OVajYFC6gTO6zeTNd5aaq30A9S
	cwqZX5F+n/LvNxF5FCV/iQc+e+u1oMM8pUdeSi9SJ9NdVVKjQih5QwHw22AY6zYBRewB8TDIl8qu5
	8k5uDSw0p1KMHg7FLofgVPsxhQd/eJPVCBuZc/Yip4Y5DfVoijcUUHJfUJW9GXAAVoV/G79CsZ+iw
	9rheLIcAGN15QtaOyvZetVFErVPzuCfPdmlC8xZ9MUYl8dxBcfdsNegz4AB6PuwLA0kfVtbnVdC7k
	LlXAcSYhp9JWfDdKmLGp+zHrNvsotSW8nSJS4rB8cvUz2I+izsNck68XcStEf5FSWj5oJPeJbqZ7o
	rFS9b81Q==;
Received: from ip6-localhost ([::1]:19454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxXh-00DBoo-5S; Tue, 25 Nov 2025 18:13:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13918) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRO-00D9m1-W9
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eAGuAwzrn2sopTNxxvdK11I+e3HMf3Tq862eWmfdIbQ=; b=31LGh6gVTvH09I6sAz3a/V29MM
 vzkqnura9YRIQ/hMsnLGVu+c5I/RkwwCRCgsJzNjmYSqBtAK1xvxI8Q0de7DKsuZCKHW9qmpVfTfB
 dui95Wf1+AQJLsq/NMNDiwTJ+R1x9KS0+M+CArPvTAvTeAkMx4ri7daj32hAnj/KaW8DEjedYLm0U
 bQwmeQ9iuZlo3nC9X2S7SzQNjnzgIndaPXDfDq36+UnuV+WmL66+aNSIJx7O5+rDZQhDnveZBhgad
 M31yY8WKzOdFZzbiFw4bC7DiZ4GgvrFJnctOP6ACZUnsY3cGFdlvcte0zPQyJFfALn5f35s+Z3RuP
 uwcG9/Fxv7Ax/Z2wL7i78r4PrPCxPrVt8OwIf50+KPcQNPaRxxT2giVFcO/0Z78hwzzszuv3BFymO
 UPS5+J0tZ7g6Lo+4gnS8VAh9xKFdjZBrqyENbywl8h/zIqOFJiM3mF78QC+bhGih9fVTcb58ZEUIQ
 h4Xcr9jyz5or/xkDwLZt/1dp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxOE-00Fde3-1y; Tue, 25 Nov 2025 18:03:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 067/145] smb: client: make use of smbdirect_connection_{get,
 put}_recv_io()
Date: Tue, 25 Nov 2025 18:55:13 +0100
Message-ID: <d7630ff3ad4fa82df445c1c188ab55cb055f915f.1764091285.git.metze@samba.org>
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

These are basically copies of {get,put}_receive_buffer().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 78 ++++++---------------------------------
 1 file changed, 11 insertions(+), 67 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b501060d6e3c..21d08171cc85 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -23,11 +23,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 	return &sc->parameters;
 }
 
-static struct smbdirect_recv_io *get_receive_buffer(
-		struct smbdirect_socket *sc);
-static void put_receive_buffer(
-		struct smbdirect_socket *sc,
-		struct smbdirect_recv_io *response);
 static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf);
 static void destroy_receive_buffers(struct smbdirect_socket *sc);
 
@@ -531,7 +526,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 	if (sc->recv_io.credits.target >
 		atomic_read(&sc->recv_io.credits.count)) {
 		while (true) {
-			response = get_receive_buffer(sc);
+			response = smbdirect_connection_get_recv_io(sc);
 			if (!response)
 				break;
 
@@ -540,7 +535,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 			if (rc) {
 				log_rdma_recv(ERR,
 					"post_recv failed rc=%d\n", rc);
-				put_receive_buffer(sc, response);
+				smbdirect_connection_put_recv_io(response);
 				break;
 			}
 
@@ -604,7 +599,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		sc->recv_io.reassembly.full_packet_received = true;
 		negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
-		put_receive_buffer(sc, response);
+		smbdirect_connection_put_recv_io(response);
 		if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_RUNNING))
 			negotiate_done = false;
 		if (!negotiate_done) {
@@ -690,7 +685,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			enqueue_reassembly(sc, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-			put_receive_buffer(sc, response);
+			smbdirect_connection_put_recv_io(response);
 
 		return;
 
@@ -705,7 +700,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	log_rdma_recv(ERR, "unexpected response type=%d\n", sc->recv_io.expected);
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 error:
-	put_receive_buffer(sc, response);
+	smbdirect_connection_put_recv_io(response);
 	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 }
 
@@ -1263,7 +1258,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
-	struct smbdirect_recv_io *response = get_receive_buffer(sc);
+	struct smbdirect_recv_io *response = smbdirect_connection_get_recv_io(sc);
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
@@ -1274,7 +1269,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
 	if (rc) {
-		put_receive_buffer(sc, response);
+		smbdirect_connection_put_recv_io(response);
 		return rc;
 	}
 
@@ -1350,57 +1345,6 @@ static struct smbdirect_recv_io *_get_first_reassembly(struct smbdirect_socket *
 	return ret;
 }
 
-/*
- * Get a receive buffer
- * For each remote send, we need to post a receive. The receive buffers are
- * pre-allocated in advance.
- * return value: the receive buffer, NULL if none is available
- */
-static struct smbdirect_recv_io *get_receive_buffer(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *ret = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
-	if (!list_empty(&sc->recv_io.free.list)) {
-		ret = list_first_entry(
-			&sc->recv_io.free.list,
-			struct smbdirect_recv_io, list);
-		list_del(&ret->list);
-		sc->statistics.get_receive_buffer++;
-	}
-	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
-
-	return ret;
-}
-
-/*
- * Return a receive buffer
- * Upon returning of a receive buffer, we can post new receive and extend
- * more receive credits to remote peer. This is done immediately after a
- * receive buffer is returned.
- */
-static void put_receive_buffer(
-	struct smbdirect_socket *sc, struct smbdirect_recv_io *response)
-{
-	unsigned long flags;
-
-	if (likely(response->sge.length != 0)) {
-		ib_dma_unmap_single(sc->ib.dev,
-				    response->sge.addr,
-				    response->sge.length,
-				    DMA_FROM_DEVICE);
-		response->sge.length = 0;
-	}
-
-	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
-	list_add_tail(&response->list, &sc->recv_io.free.list);
-	sc->statistics.put_receive_buffer++;
-	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
-
-	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
-}
-
 /* Preallocate all receive buffer on transport establishment */
 static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf)
 {
@@ -1437,7 +1381,7 @@ static void destroy_receive_buffers(struct smbdirect_socket *sc)
 {
 	struct smbdirect_recv_io *response;
 
-	while ((response = get_receive_buffer(sc)))
+	while ((response = smbdirect_connection_get_recv_io(sc)))
 		mempool_free(response, sc->recv_io.mem.pool);
 }
 
@@ -1543,7 +1487,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 			list_del(&response->list);
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
-			put_receive_buffer(sc, response);
+			smbdirect_connection_put_recv_io(response);
 		} else
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
@@ -2082,9 +2026,9 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 				}
 				queue_removed++;
 				sc->statistics.dequeue_reassembly_queue++;
-				put_receive_buffer(sc, response);
+				smbdirect_connection_put_recv_io(response);
 				offset = 0;
-				log_read(INFO, "put_receive_buffer offset=0\n");
+				log_read(INFO, "smbdirect_connection_put_recv_io offset=0\n");
 			} else
 				offset += to_copy;
 
-- 
2.43.0


