Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 560ADB34D8A
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:05:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3G7XCdpsL1EQY/JbwmBENrACCdbV+agokUoY6nISiFU=; b=zNOIEz3kaNyEFTNxmEkYJX6GAe
	XSSrFzfB1Kj6qOz263upJl8mO2/PX9TFXTkfKX9+kvBaJNrrXgPhiaWB4XRv0S45itpzJ0+hd3G0x
	vuvfHivSbqhfjuCjqrxVbc5Aw+D70jN/SJaZe/DJIF3BLdJPfCzDfOb+p/YjRs7TeGXFZmXbnaTi8
	eU487Jpfm4s5gHc8LM/UjZtm7OxN4kYreZEkXauht9r4kSKiruZv7PehopPastyVKK9cxAfmFce5c
	QnvVw4zdO6EzN4o+FsREcm8nkABz7hH5GfvBbu9DJ8Scj8wpmKVKZcHjHBv3bokNF96mLWWWthY2C
	CgWE5IDw==;
Received: from ip6-localhost ([::1]:43498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeNv-000UbP-VD; Mon, 25 Aug 2025 21:05:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23414) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJT-000Sj8-Ml
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3G7XCdpsL1EQY/JbwmBENrACCdbV+agokUoY6nISiFU=; b=HccPsm50jyplwY8dLmFkqwzuID
 KW4gX0jlN82NtaU1hdcakTh6XGvrzOIrrRKu5orQJvD9Zh3NST1NjqJcAHRxcOlETGLE7bGDAvkUf
 iPrTQfaIwP6AypTTTHC7nTbkTDHcS52s2ElCht7PRjA/3mHbJbF+DIUwUoS/hLbgMTaDOpuM+tqe9
 eu1fzLGlqGjbmNxT3ZfofCrE6/kAsKl3+5T90WqLeRFyWqfnnss7Mlf4tcSmYNpIbDsPFkpRNTLEY
 2WGW7JB2gE9HDAgrbCf6THmAh83cddH36V2HKGHXQXxq506yki8I5gnrVl9DGH6bnXq11TF9sAfce
 uu+w3pGET4B0eSHKVS7qZMCU3A1PYD4MWgAIBr7ARAjDKJseN12yGDPgszf1CLlZF2cL9iJRduQua
 UyPcGt6nYiYHO0yjPIEkwzTzJ5VCUCoOm9cEjTgtjSaTl/HjDWUxqWI4589Vj+d/2oxEsGjhFowG/
 9sI7nNZ69fjGtfYI7VFsf7Mx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeJP-000n4J-1u; Mon, 25 Aug 2025 21:01:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 116/142] smb: server: pass struct smbdirect_socket to
 {get_free, put}_recvmsg()
Date: Mon, 25 Aug 2025 22:41:17 +0200
Message-ID: <a58799772bfbc4236359b35c4abdff1e0d37e529.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 35 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 9c2f0edab604..a998f6c04aab 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -147,9 +147,8 @@ static inline void
 }
 
 static struct
-smbdirect_recv_io *get_free_recvmsg(struct smb_direct_transport *t)
+smbdirect_recv_io *get_free_recvmsg(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg = NULL;
 
 	spin_lock(&sc->recv_io.free.lock);
@@ -163,11 +162,9 @@ smbdirect_recv_io *get_free_recvmsg(struct smb_direct_transport *t)
 	return recvmsg;
 }
 
-static void put_recvmsg(struct smb_direct_transport *t,
+static void put_recvmsg(struct smbdirect_socket *sc,
 			struct smbdirect_recv_io *recvmsg)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	if (likely(recvmsg->sge.length != 0)) {
 		ib_dma_unmap_single(sc->ib.dev,
 				    recvmsg->sge.addr,
@@ -399,7 +396,7 @@ static void free_transport(struct smb_direct_transport *t)
 		if (recvmsg) {
 			list_del(&recvmsg->list);
 			spin_unlock(&sc->recv_io.reassembly.lock);
-			put_recvmsg(t, recvmsg);
+			put_recvmsg(sc, recvmsg);
 		} else {
 			spin_unlock(&sc->recv_io.reassembly.lock);
 		}
@@ -514,7 +511,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	t = container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
-		put_recvmsg(t, recvmsg);
+		put_recvmsg(sc, recvmsg);
 		if (wc->status != IB_WC_WR_FLUSH_ERR) {
 			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
 			       ib_wc_status_msg(wc->status), wc->status,
@@ -542,7 +539,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	switch (sc->recv_io.expected) {
 	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
-			put_recvmsg(t, recvmsg);
+			put_recvmsg(sc, recvmsg);
 			smb_direct_disconnect_rdma_connection(t);
 			return;
 		}
@@ -560,7 +557,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		if (wc->byte_len <
 		    offsetof(struct smbdirect_data_transfer, padding)) {
-			put_recvmsg(t, recvmsg);
+			put_recvmsg(sc, recvmsg);
 			smb_direct_disconnect_rdma_connection(t);
 			return;
 		}
@@ -569,7 +566,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (data_length) {
 			if (wc->byte_len < sizeof(struct smbdirect_data_transfer) +
 			    (u64)data_length) {
-				put_recvmsg(t, recvmsg);
+				put_recvmsg(sc, recvmsg);
 				smb_direct_disconnect_rdma_connection(t);
 				return;
 			}
@@ -610,7 +607,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			enqueue_reassembly(t, recvmsg, (int)data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-			put_recvmsg(t, recvmsg);
+			put_recvmsg(sc, recvmsg);
 
 		return;
 	}
@@ -623,7 +620,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 * This is an internal error!
 	 */
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
-	put_recvmsg(t, recvmsg);
+	put_recvmsg(sc, recvmsg);
 	smb_direct_disconnect_rdma_connection(t);
 }
 
@@ -749,7 +746,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 					spin_unlock_irq(&sc->recv_io.reassembly.lock);
 				}
 				queue_removed++;
-				put_recvmsg(st, recvmsg);
+				put_recvmsg(sc, recvmsg);
 				offset = 0;
 			} else {
 				offset += to_copy;
@@ -795,7 +792,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 	if (atomic_read(&sc->recv_io.credits.count) < sc->recv_io.credits.target) {
 		while (true) {
-			recvmsg = get_free_recvmsg(t);
+			recvmsg = get_free_recvmsg(sc);
 			if (!recvmsg)
 				break;
 
@@ -804,7 +801,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 			ret = smb_direct_post_recv(t, recvmsg);
 			if (ret) {
 				pr_err("Can't post recv: %d\n", ret);
-				put_recvmsg(t, recvmsg);
+				put_recvmsg(sc, recvmsg);
 				break;
 			}
 			credits++;
@@ -1729,7 +1726,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
 
-	recvmsg = get_free_recvmsg(t);
+	recvmsg = get_free_recvmsg(sc);
 	if (!recvmsg)
 		return -ENOMEM;
 
@@ -1748,7 +1745,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 	smb_direct_post_recv_credits(&sc->recv_io.posted.refill_work);
 	return 0;
 out_err:
-	put_recvmsg(t, recvmsg);
+	put_recvmsg(sc, recvmsg);
 	return ret;
 }
 
@@ -1843,7 +1840,7 @@ static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
-	while ((recvmsg = get_free_recvmsg(t)))
+	while ((recvmsg = get_free_recvmsg(sc)))
 		mempool_free(recvmsg, sc->recv_io.mem.pool);
 
 	mempool_destroy(sc->recv_io.mem.pool);
@@ -2055,7 +2052,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	sc->recv_io.reassembly.queue_length--;
 	list_del(&recvmsg->list);
 	spin_unlock_irq(&sc->recv_io.reassembly.lock);
-	put_recvmsg(st, recvmsg);
+	put_recvmsg(sc, recvmsg);
 
 	return ret;
 }
-- 
2.43.0


