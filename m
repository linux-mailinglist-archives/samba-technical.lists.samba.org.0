Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCDC8693A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mpaj7bJbEtEpbhx6XtR3fWvXYrtu1mvvJQoxHzozDh8=; b=q2aRPHwyY749sekyQZjRTy9sG3
	XyajyjhNQZ1Z51IWiucnvGVOoRCO5Jj8N63FMj3u/vKrYUPW00Z4XqYcdOWdJ8+FuqOUDN0Y1cVs1
	uhh5FfT+01hlg33mfDmauXZ5af86mEKO0bS6xsiXDbbzTOHDaf2PdEoCyeue//+WSJvVW8212HmYe
	fOIGLRufB9GvrwAT2JzMNKWzj/sMXis/3WVCQFzX/qrM+LiExQ1KYY+0PxDzn/SteTCAz9CcSX7Mu
	nEiPlz3CNkhrdOzaSe4M3x3cDl8m36gct/4QhA6Or9SAKB5sDqPFX5qRlcqYj6oBHwIJ2gsJ0/quN
	MK77mUdA==;
Received: from ip6-localhost ([::1]:36472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxgQ-00DEcV-NZ; Tue, 25 Nov 2025 18:22:35 +0000
Received: from hr2.samba.org ([144.76.82.148]:40698) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcm-00DDhd-QU
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mpaj7bJbEtEpbhx6XtR3fWvXYrtu1mvvJQoxHzozDh8=; b=VLPXXUxFPJOe9UUAMFlB0qmqkO
 UGJ+OvUGBJEIb00yA5gP8iKK+e0x3JAzLVdGuyRN0qqCaGaMgqYjonrC2RvJJD9+L+YFoAKlJtwUk
 hyKZ/2a6Lit448QkZ8/eoXPNBg2MSdT/BWsce8xg+nvTJVyD1Qe02OobBBFpXWGtNwizzmAtdvzQp
 nIzvyZDn5JHGnis0qv7f5hB8g9ky9Se43BncEPZ/ilgsCZzfiibqtK0esCcH3LdwsjU6CVSchRrrQ
 +rhOW7ltb+bH9Gr8elLo09adU+iwe6/NXzxtX60AK45ZYh66qLtyXnYEHSZU+MiO4xFalvcMlPntl
 FIjUDk6uHaURnX+tMlAgT4Nd/v6G1zBjHUPSgGBrfua5LRDiwmR9Jtwod/bj0Bfxwz49MDqjcXvi2
 Dbue2bxUtdQI7g6hNBXcdAfkF+bt/KfcvqrLfM/Mhs91QSv5z0z9w5ad1gE/NfriPoKetwKe+p3pK
 cNvUj2EDoYqSatjAyy6bh93Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVI-00FeIb-1h; Tue, 25 Nov 2025 18:11:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 103/145] smb: server: make use of smbdirect_connection_{get,
 put}_recv_io()
Date: Tue, 25 Nov 2025 18:55:49 +0100
Message-ID: <76bb7c8f946f30ccc1fb5d74306b4b116314527b.1764091285.git.metze@samba.org>
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

These are basically copies of {get,put}_receive_buffer() in the client.
They are very similar to {get_free,put}_recvmsg() the only logical
difference is the updating of the sc->statistics.*.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 69 ++++++++--------------------------
 1 file changed, 16 insertions(+), 53 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 88c4b4bf568d..1c926e46a354 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -215,43 +215,6 @@ static inline void
 	return (void *)recvmsg->packet;
 }
 
-static struct
-smbdirect_recv_io *get_free_recvmsg(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *recvmsg = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
-	if (!list_empty(&sc->recv_io.free.list)) {
-		recvmsg = list_first_entry(&sc->recv_io.free.list,
-					   struct smbdirect_recv_io,
-					   list);
-		list_del(&recvmsg->list);
-	}
-	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
-	return recvmsg;
-}
-
-static void put_recvmsg(struct smbdirect_socket *sc,
-			struct smbdirect_recv_io *recvmsg)
-{
-	unsigned long flags;
-
-	if (likely(recvmsg->sge.length != 0)) {
-		ib_dma_unmap_single(sc->ib.dev,
-				    recvmsg->sge.addr,
-				    recvmsg->sge.length,
-				    DMA_FROM_DEVICE);
-		recvmsg->sge.length = 0;
-	}
-
-	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
-	list_add(&recvmsg->list, &sc->recv_io.free.list);
-	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
-
-	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
-}
-
 static void enqueue_reassembly(struct smbdirect_socket *sc,
 			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
@@ -424,7 +387,7 @@ static void free_transport(struct smb_direct_transport *t)
 		if (recvmsg) {
 			list_del(&recvmsg->list);
 			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 		} else {
 			spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 		}
@@ -543,7 +506,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	sp = &sc->parameters;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
-		put_recvmsg(sc, recvmsg);
+		smbdirect_connection_put_recv_io(recvmsg);
 		if (wc->status != IB_WC_WR_FLUSH_ERR) {
 			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
 			       ib_wc_status_msg(wc->status), wc->status,
@@ -571,7 +534,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	switch (sc->recv_io.expected) {
 	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
@@ -584,7 +547,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (!sc->first_error && sc->status == SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING)
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
 		if (SMBDIRECT_CHECK_STATUS_WARN(sc, SMBDIRECT_SOCKET_NEGOTIATE_NEEDED)) {
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
@@ -600,7 +563,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		if (wc->byte_len <
 		    offsetof(struct smbdirect_data_transfer, padding)) {
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
@@ -610,7 +573,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		data_offset = le32_to_cpu(data_transfer->data_offset);
 		if (wc->byte_len < data_offset ||
 		    wc->byte_len < (u64)data_offset + data_length) {
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
@@ -618,7 +581,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		    data_length > sp->max_fragmented_recv_size ||
 		    (u64)remaining_data_length + (u64)data_length >
 		    (u64)sp->max_fragmented_recv_size) {
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 			smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 			return;
 		}
@@ -660,7 +623,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			enqueue_reassembly(sc, recvmsg, (int)data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-			put_recvmsg(sc, recvmsg);
+			smbdirect_connection_put_recv_io(recvmsg);
 
 		return;
 	}
@@ -673,7 +636,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 * This is an internal error!
 	 */
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
-	put_recvmsg(sc, recvmsg);
+	smbdirect_connection_put_recv_io(recvmsg);
 	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
 }
 
@@ -799,7 +762,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 					spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
 				}
 				queue_removed++;
-				put_recvmsg(sc, recvmsg);
+				smbdirect_connection_put_recv_io(recvmsg);
 				offset = 0;
 			} else {
 				offset += to_copy;
@@ -843,7 +806,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 	if (atomic_read(&sc->recv_io.credits.count) < sc->recv_io.credits.target) {
 		while (true) {
-			recvmsg = get_free_recvmsg(sc);
+			recvmsg = smbdirect_connection_get_recv_io(sc);
 			if (!recvmsg)
 				break;
 
@@ -852,7 +815,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 			ret = smb_direct_post_recv(sc, recvmsg);
 			if (ret) {
 				pr_err("Can't post recv: %d\n", ret);
-				put_recvmsg(sc, recvmsg);
+				smbdirect_connection_put_recv_io(recvmsg);
 				break;
 			}
 			credits++;
@@ -1853,7 +1816,7 @@ static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
 
-	recvmsg = get_free_recvmsg(sc);
+	recvmsg = smbdirect_connection_get_recv_io(sc);
 	if (!recvmsg)
 		return -ENOMEM;
 
@@ -1879,7 +1842,7 @@ static int smb_direct_prepare_negotiation(struct smbdirect_socket *sc)
 	 * will unmap it exactly once.
 	 */
 	if (!recv_posted)
-		put_recvmsg(sc, recvmsg);
+		smbdirect_connection_put_recv_io(recvmsg);
 	return ret;
 }
 
@@ -1919,7 +1882,7 @@ static void smb_direct_destroy_pools(struct smbdirect_socket *sc)
 {
 	struct smbdirect_recv_io *recvmsg;
 
-	while ((recvmsg = get_free_recvmsg(sc)))
+	while ((recvmsg = smbdirect_connection_get_recv_io(sc)))
 		mempool_free(recvmsg, sc->recv_io.mem.pool);
 
 	mempool_destroy(sc->recv_io.mem.pool);
@@ -2244,7 +2207,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	sc->recv_io.reassembly.queue_length--;
 	list_del(&recvmsg->list);
 	spin_unlock_irqrestore(&sc->recv_io.reassembly.lock, flags);
-	put_recvmsg(sc, recvmsg);
+	smbdirect_connection_put_recv_io(recvmsg);
 
 	if (ret == -ECONNABORTED)
 		return ret;
-- 
2.43.0


