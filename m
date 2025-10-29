Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30DC1AC7A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=c+2TCKs9knHpgaM2psNwVfAyJqiz46ksPKV802Vkb3s=; b=GtEek5KHnkLKU1YRBu6G7AeZr2
	ai9zXa4CsbXxRYmDm9CglkLXbAzkl96cUA9vXX4RZvC5To/1lsipfeHYZsQIDlpUW4FHI118pHctZ
	BgtMnD3UCdYqSL+n/ddreoVz0YbT7x0r7qPAsoKwvgCueSCVcgT6+AhrHiNv4g03qZVtVx4/ShXpn
	E2dMU4DJ+Nsjs7yAOEr+LFX7PR5R2tOHGB5z8KH9p75GlvG4YVGf4OfU/yozIpoBsNhVRFUhg+OE3
	GgUrIDTj5vIvLNgffq2A5JuP8nvVKzkNYqpmEDbeHyStgOaSYWlLzfcC6SuwkvX/dQFevdwjlQrMv
	gYHn060w==;
Received: from ip6-localhost ([::1]:64542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6NW-009AAd-7G; Wed, 29 Oct 2025 13:38:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32642) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EA-00972r-Vo
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=c+2TCKs9knHpgaM2psNwVfAyJqiz46ksPKV802Vkb3s=; b=OwRkhuaTN4eycB3eH0IQqsziHY
 qm1OaUftTK0xhP82X8K7MvzmXB82CPl4Kd3zz6jLSng/wl1NthV/P41cmT/piyvYPDjrJ2GFoMUKn
 s9rUG0zRK7w1AkAWb6wp6D/8dXJCC1rKtGfqiYssJhR6b+EpOFSHv+H0Lt57OL0XyO51ElMhBNXp4
 gDtKORi3EkZVHB4Xpdv8t5447V+VhyIP5OsAL2DBm8mQ2SEeRvsyIiJfUrluW2zmx34T6S2p9K1Ql
 7hmASlbqaIslDXmEgVSZXog6IFNqI9VUMwHlD1aur/EKoft8IJ4O/DBen5x4IWLTfkc9DZCkolkDq
 3Igl0cTOz0UWI/lhyqik9eJ4YdW7t7CgG+jN9IXUyFshF2Dr3D5ulZv8125rnox4QbQJlCXvH6MDw
 rJo+BvJbIQUvedfVU4fDOKzyR6P7xqZwHXMRV1IJdhI3DACK+wSPQlJvb739mNNhNXpLCUVGd2ap8
 dortAGMqod3U7n2elUUPTwh6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6E7-00Bc6w-0S; Wed, 29 Oct 2025 13:28:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 062/127] smb: client: make use of smbdirect_connection_{get,
 put}_recv_io()
Date: Wed, 29 Oct 2025 14:20:40 +0100
Message-ID: <179854e6c2f24988416983186f5e748494c91826.1761742839.git.metze@samba.org>
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
index 8b98ef1d41e1..d76b25fc80f1 100644
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
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
 		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
@@ -689,7 +684,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			enqueue_reassembly(sc, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-			put_receive_buffer(sc, response);
+			smbdirect_connection_put_recv_io(response);
 
 		return;
 
@@ -704,7 +699,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	log_rdma_recv(ERR, "unexpected response type=%d\n", sc->recv_io.expected);
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 error:
-	put_receive_buffer(sc, response);
+	smbdirect_connection_put_recv_io(response);
 	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
 }
 
@@ -1262,7 +1257,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
-	struct smbdirect_recv_io *response = get_receive_buffer(sc);
+	struct smbdirect_recv_io *response = smbdirect_connection_get_recv_io(sc);
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
@@ -1273,7 +1268,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
 	if (rc) {
-		put_receive_buffer(sc, response);
+		smbdirect_connection_put_recv_io(response);
 		return rc;
 	}
 
@@ -1349,57 +1344,6 @@ static struct smbdirect_recv_io *_get_first_reassembly(struct smbdirect_socket *
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
@@ -1434,7 +1378,7 @@ static void destroy_receive_buffers(struct smbdirect_socket *sc)
 {
 	struct smbdirect_recv_io *response;
 
-	while ((response = get_receive_buffer(sc)))
+	while ((response = smbdirect_connection_get_recv_io(sc)))
 		mempool_free(response, sc->recv_io.mem.pool);
 }
 
@@ -1540,7 +1484,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 			list_del(&response->list);
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
-			put_receive_buffer(sc, response);
+			smbdirect_connection_put_recv_io(response);
 		} else
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
@@ -2079,9 +2023,9 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
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


