Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 713F3B34D6A
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W13gVufGi8ypfQJlytRYBDEzzlSbJtCyOL14V687RW4=; b=M/NHCTE6iPaCboqlLSpB60j8EU
	xInZ0EylwGW/Fd+lz7l7dPC1wQIuEOn7ERiLv3zEbr90ZFcsxs+LlU0BiPuxwSs8nwYUJbsryKnfF
	6DIM1vr0dIFNZ8sB4eoYN9w2tqyC1Cwllx6T79YeDrH5Cz3J6umJnZkeU95vpOgba+/2+WrWlA6c8
	JrDZ4nFvht0YgvVrrfi2hXHNNU1hmLD019QaMoR6ek7DQRaos5u+tRtqCBsaBtDbCUmuYYZfsya65
	CBdypUg0+Bpnfc/otbuKyyym1h7rzlmeoeakgYN7hjBrNoOTkz1xqRKua14ZfD7ktrDGRDBJFL1if
	l6WihEww==;
Received: from ip6-localhost ([::1]:23018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeLt-000Tg7-UC; Mon, 25 Aug 2025 21:03:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22300) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHe-000Ry4-Ad
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W13gVufGi8ypfQJlytRYBDEzzlSbJtCyOL14V687RW4=; b=cgMb7HhlaB7sJqEDyfiz5km+cH
 eAzFNXR2SQ08G36IJlT6gu9T0O/4UJheThQ7YOM2w4xfw1KGT/rVWbKWQWJr5gD5LN71Udjpowr6X
 dFdh8cmDcIEn/Rm9nK6E+7NzI4haz4rJ8ffnS+0pRNQi2LQUgtx/a4O1UhX0dsaQp2LbShXyqpdWN
 Cz+n/CCRh91QZvLqkYwD2HMsI7A2XH/MnsOwXV4zOA/6xYAkk//ddbA6WaO5fzQhsICjS7jOBFmst
 1HOlsdRsY7RnBNr5NbW3pqqz/HTGRQt3rzs5sLHft08gmr7s88cPXhnsXYW7jRNUawwVW17rEPA7a
 v4oPi8rkt59UbZSUNOf4akU+CSsfK1sJKPHJbb79Q2DpViH9biNodbUCVUZ8KRMGq4RLY6GZpbSq+
 8CbH7M3CM3UROogI36CXxLYNEHlPvLmmXx/EBG0xVinr5o0NqdKswxT+xjCVVTIciqduu8AJOCg9V
 rDEf+H/8HEqFxa6lDMjwiLEM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHc-000mi6-0p; Mon, 25 Aug 2025 20:59:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 105/142] smb: server: make use of
 smbdirect_socket.recv_io.{posted, credits}
Date: Mon, 25 Aug 2025 22:41:06 +0200
Message-ID: <6107c1849a0490cdadebdcfd5d52a4dae8bb0b43.1756139607.git.metze@samba.org>
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

This will make it possible to introduce common helper functions
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 65 ++++++++++++++++------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 2bbf18e0906d..02300d14bc2f 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -92,11 +92,6 @@ struct smb_direct_transport {
 
 	struct smbdirect_socket socket;
 
-	atomic_t		recv_credits;
-	u16			recv_credit_target;
-
-	atomic_t		recv_posted;
-	struct work_struct	post_recv_credits_work;
 	struct work_struct	send_immediate_work;
 
 	bool			legacy_iwarp;
@@ -180,7 +175,7 @@ static void put_recvmsg(struct smb_direct_transport *t,
 	list_add(&recvmsg->list, &sc->recv_io.free.list);
 	spin_unlock(&sc->recv_io.free.lock);
 
-	queue_work(smb_direct_wq, &t->post_recv_credits_work);
+	queue_work(smb_direct_wq, &sc->recv_io.posted.refill_work);
 }
 
 static void enqueue_reassembly(struct smb_direct_transport *t,
@@ -227,7 +222,7 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	 * disable[_delayed]_work_sync()
 	 */
 	disable_work(&sc->disconnect_work);
-	disable_work(&t->post_recv_credits_work);
+	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&t->send_immediate_work);
 
 	switch (sc->status) {
@@ -305,10 +300,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	atomic_set(&t->recv_posted, 0);
-	atomic_set(&t->recv_credits, 0);
-
-	INIT_WORK(&t->post_recv_credits_work,
+	INIT_WORK(&sc->recv_io.posted.refill_work,
 		  smb_direct_post_recv_credits);
 	INIT_WORK(&t->send_immediate_work, smb_direct_send_immediate_work);
 
@@ -344,7 +336,7 @@ static void free_transport(struct smb_direct_transport *t)
 	wake_up_all(&sc->send_io.credits.wait_queue);
 	wake_up_all(&sc->send_io.pending.wait_queue);
 
-	disable_work_sync(&t->post_recv_credits_work);
+	disable_work_sync(&sc->recv_io.posted.refill_work);
 	disable_work_sync(&t->send_immediate_work);
 
 	if (sc->ib.qp) {
@@ -537,16 +529,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 				sc->recv_io.reassembly.full_packet_received = true;
 		}
 
-		atomic_dec(&t->recv_posted);
-		atomic_dec(&t->recv_credits);
+		atomic_dec(&sc->recv_io.posted.count);
+		atomic_dec(&sc->recv_io.credits.count);
 
-		old_recv_credit_target = t->recv_credit_target;
-		t->recv_credit_target =
+		old_recv_credit_target = sc->recv_io.credits.target;
+		sc->recv_io.credits.target =
 				le16_to_cpu(data_transfer->credits_requested);
-		t->recv_credit_target =
-			min_t(u16, t->recv_credit_target, sp->recv_credit_max);
-		t->recv_credit_target =
-			max_t(u16, t->recv_credit_target, 1);
+		sc->recv_io.credits.target =
+			min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
+		sc->recv_io.credits.target =
+			max_t(u16, sc->recv_io.credits.target, 1);
 		atomic_add(le16_to_cpu(data_transfer->credits_granted),
 			   &sc->send_io.credits.count);
 
@@ -558,8 +550,8 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			wake_up(&sc->send_io.credits.wait_queue);
 
 		if (data_length) {
-			if (t->recv_credit_target > old_recv_credit_target)
-				queue_work(smb_direct_wq, &t->post_recv_credits_work);
+			if (sc->recv_io.credits.target > old_recv_credit_target)
+				queue_work(smb_direct_wq, &sc->recv_io.posted.refill_work);
 
 			enqueue_reassembly(t, recvmsg, (int)data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
@@ -739,13 +731,15 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 
 static void smb_direct_post_recv_credits(struct work_struct *work)
 {
-	struct smb_direct_transport *t = container_of(work,
-		struct smb_direct_transport, post_recv_credits_work);
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
+	struct smb_direct_transport *t =
+		container_of(sc, struct smb_direct_transport, socket);
 	struct smbdirect_recv_io *recvmsg;
 	int credits = 0;
 	int ret;
 
-	if (atomic_read(&t->recv_credits) < t->recv_credit_target) {
+	if (atomic_read(&sc->recv_io.credits.count) < sc->recv_io.credits.target) {
 		while (true) {
 			recvmsg = get_free_recvmsg(t);
 			if (!recvmsg)
@@ -761,7 +755,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 			}
 			credits++;
 
-			atomic_inc(&t->recv_posted);
+			atomic_inc(&sc->recv_io.posted.count);
 		}
 	}
 
@@ -809,20 +803,21 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 
 static int manage_credits_prior_sending(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	int new_credits;
 
-	if (atomic_read(&t->recv_credits) >= t->recv_credit_target)
+	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
 		return 0;
 
-	new_credits = atomic_read(&t->recv_posted);
+	new_credits = atomic_read(&sc->recv_io.posted.count);
 	if (new_credits == 0)
 		return 0;
 
-	new_credits -= atomic_read(&t->recv_credits);
+	new_credits -= atomic_read(&sc->recv_io.credits.count);
 	if (new_credits <= 0)
 		return 0;
 
-	atomic_add(new_credits, &t->recv_credits);
+	atomic_add(new_credits, &sc->recv_io.credits.count);
 	return new_credits;
 }
 
@@ -1666,7 +1661,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 		goto out_err;
 	}
 
-	smb_direct_post_recv_credits(&t->post_recv_credits_work);
+	smb_direct_post_recv_credits(&sc->recv_io.posted.refill_work);
 	return 0;
 out_err:
 	put_recvmsg(t, recvmsg);
@@ -1749,7 +1744,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	}
 
 	sp->recv_credit_max = smb_direct_receive_credit_max;
-	t->recv_credit_target = 1;
+	sc->recv_io.credits.target = 1;
 
 	sp->send_credit_target = smb_direct_send_credit_target;
 	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
@@ -1974,9 +1969,9 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 		le32_to_cpu(req->max_fragmented_size);
 	sp->max_fragmented_recv_size =
 		(sp->recv_credit_max * sp->max_recv_size) / 2;
-	st->recv_credit_target = le16_to_cpu(req->credits_requested);
-	st->recv_credit_target = min_t(u16, st->recv_credit_target, sp->recv_credit_max);
-	st->recv_credit_target = max_t(u16, st->recv_credit_target, 1);
+	sc->recv_io.credits.target = le16_to_cpu(req->credits_requested);
+	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target, sp->recv_credit_max);
+	sc->recv_io.credits.target = max_t(u16, sc->recv_io.credits.target, 1);
 
 	ret = smb_direct_send_negotiate_response(st, ret);
 out:
-- 
2.43.0


