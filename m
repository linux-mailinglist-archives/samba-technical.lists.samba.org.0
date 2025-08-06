Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D796B1CB29
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aaVgtGb2um16ZxY0EEo6WznoDPRZvQvo+VAFjeRVgKQ=; b=G0ZOYao9WmUK1I2lVE5fWQYBED
	YKNFvrRPI6eOP3e4FBxxt9FDOGEu5Dgbf+HES7dSVfroHLGuDvUTZMzlX/8Sxoz3CrCsbBP4a+uuY
	XNlBzO3q4k0T1l8qIeLmDG6+FsZ1BhwH2Db/RJ0UuCjdZte2ijfQmhnZX/CmVYmI2LrasCEz4pVpl
	GWT7cw1/pgC/DXjpHGLbR+c5MytQF2hPIAZlO4HtAyxLie6eggeo5Y4dPO6jnQifqEXOrM6k6kgXT
	UGLB0ffD8LoQ3p1IxV0xlx0DgVrjnEqu1LLYWSNbFV1UIwp+tODTOAzcZDp7jgy/qB3NIPQBv6Shv
	IZI/vY/w==;
Received: from ip6-localhost ([::1]:46196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji77-00ESab-PZ; Wed, 06 Aug 2025 17:39:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32944) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5Y-00ES1H-9J
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=aaVgtGb2um16ZxY0EEo6WznoDPRZvQvo+VAFjeRVgKQ=; b=cyOezjHzT3g3BcdaLbLpwHhpr6
 PXhCmCMs7c++O3zbRtwXoAxxV8qkCvK/ENbU35uQtbCxolcpbujl4wNjVaDCLYDXD55HWGrjpB0J7
 /9nzUBlPWJiuFPdlfzdquVIbhY92o+6SzL07vvvExPKRSP1ebKwoAmgmCROk6pkUno+tXrgpJxx/s
 4vYy61hbYG4DbrvlkAjLuuODo3sHXsggQA3FkyxU5Ei1ycVMkTFCeFwYcFTP6PU/WVtEER7czuCSl
 LY36Gz30KcZ6z2wGFIYbmZqgvhPtbYwahai5VY+LUpnPfTOHFo70ptqubXSpxI6wSLN/tM6DpAMgs
 AWsxnoCbuF26jZbd+uUNRKYBJHgnYv9uWKtipU46kkyl42CuGiifDqWVoL1Pu3Ttslu3NbJxsKuep
 JFDctyUmsOiS4QwBpTcRPLVdmgWb0UZanG4MbQlqv+CjSQiriu0H//EGRYytu/LUGPT3t483OSQcB
 LaT9FncwySebSLUFcI3U1C1b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5U-001OpS-0m; Wed, 06 Aug 2025 17:38:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 15/18] smb: server: make use of
 smbdirect_socket.recv_io.reassembly.*
Date: Wed,  6 Aug 2025 19:36:01 +0200
Message-ID: <ba4a6310663b710cf222370620cad34dff96e242.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

This is also used by the client and will allow us to introduce
common helper functions soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 90 ++++++++++++++++------------------
 1 file changed, 43 insertions(+), 47 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index aebd29242a2b..7fcd80c329d7 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -95,16 +95,8 @@ struct smb_direct_transport {
 
 	struct smbdirect_socket socket;
 
-	bool			full_packet_received;
 	wait_queue_head_t	wait_status;
 
-	spinlock_t		reassembly_queue_lock;
-	struct list_head	reassembly_queue;
-	int			reassembly_data_length;
-	int			reassembly_queue_length;
-	int			first_entry_offset;
-	wait_queue_head_t	wait_reassembly_queue;
-
 	spinlock_t		receive_credit_lock;
 	int			recv_credits;
 	int			count_avail_recvmsg;
@@ -251,9 +243,11 @@ static void enqueue_reassembly(struct smb_direct_transport *t,
 			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
 {
-	spin_lock(&t->reassembly_queue_lock);
-	list_add_tail(&recvmsg->list, &t->reassembly_queue);
-	t->reassembly_queue_length++;
+	struct smbdirect_socket *sc = &t->socket;
+
+	spin_lock(&sc->recv_io.reassembly.lock);
+	list_add_tail(&recvmsg->list, &sc->recv_io.reassembly.list);
+	sc->recv_io.reassembly.queue_length++;
 	/*
 	 * Make sure reassembly_data_length is updated after list and
 	 * reassembly_queue_length are updated. On the dequeue side
@@ -261,14 +255,16 @@ static void enqueue_reassembly(struct smb_direct_transport *t,
 	 * if reassembly_queue_length and list is up to date
 	 */
 	virt_wmb();
-	t->reassembly_data_length += data_length;
-	spin_unlock(&t->reassembly_queue_lock);
+	sc->recv_io.reassembly.data_length += data_length;
+	spin_unlock(&sc->recv_io.reassembly.lock);
 }
 
 static struct smbdirect_recv_io *get_first_reassembly(struct smb_direct_transport *t)
 {
-	if (!list_empty(&t->reassembly_queue))
-		return list_first_entry(&t->reassembly_queue,
+	struct smbdirect_socket *sc = &t->socket;
+
+	if (!list_empty(&sc->recv_io.reassembly.list))
+		return list_first_entry(&sc->recv_io.reassembly.list,
 				struct smbdirect_recv_io, list);
 	else
 		return NULL;
@@ -330,11 +326,11 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sc->status = SMBDIRECT_SOCKET_CREATED;
 	init_waitqueue_head(&t->wait_status);
 
-	spin_lock_init(&t->reassembly_queue_lock);
-	INIT_LIST_HEAD(&t->reassembly_queue);
-	t->reassembly_data_length = 0;
-	t->reassembly_queue_length = 0;
-	init_waitqueue_head(&t->wait_reassembly_queue);
+	spin_lock_init(&sc->recv_io.reassembly.lock);
+	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
+	sc->recv_io.reassembly.data_length = 0;
+	sc->recv_io.reassembly.queue_length = 0;
+	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
 	init_waitqueue_head(&t->wait_send_credits);
 	init_waitqueue_head(&t->wait_rw_credits);
 
@@ -391,17 +387,17 @@ static void free_transport(struct smb_direct_transport *t)
 
 	ksmbd_debug(RDMA, "drain the reassembly queue\n");
 	do {
-		spin_lock(&t->reassembly_queue_lock);
+		spin_lock(&sc->recv_io.reassembly.lock);
 		recvmsg = get_first_reassembly(t);
 		if (recvmsg) {
 			list_del(&recvmsg->list);
-			spin_unlock(&t->reassembly_queue_lock);
+			spin_unlock(&sc->recv_io.reassembly.lock);
 			put_recvmsg(t, recvmsg);
 		} else {
-			spin_unlock(&t->reassembly_queue_lock);
+			spin_unlock(&sc->recv_io.reassembly.lock);
 		}
 	} while (recvmsg);
-	t->reassembly_data_length = 0;
+	sc->recv_io.reassembly.data_length = 0;
 
 	if (sc->ib.send_cq)
 		ib_free_cq(sc->ib.send_cq);
@@ -533,7 +529,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			return;
 		}
 		t->negotiation_requested = true;
-		t->full_packet_received = true;
+		sc->recv_io.reassembly.full_packet_received = true;
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
 		enqueue_reassembly(t, recvmsg, 0);
 		wake_up_interruptible(&t->wait_status);
@@ -560,13 +556,13 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 				return;
 			}
 
-			if (t->full_packet_received)
+			if (sc->recv_io.reassembly.full_packet_received)
 				recvmsg->first_segment = true;
 
 			if (le32_to_cpu(data_transfer->remaining_data_length))
-				t->full_packet_received = false;
+				sc->recv_io.reassembly.full_packet_received = false;
 			else
-				t->full_packet_received = true;
+				sc->recv_io.reassembly.full_packet_received = true;
 
 			spin_lock(&t->receive_credit_lock);
 			receive_credits = --(t->recv_credits);
@@ -597,7 +593,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		if (data_length) {
 			enqueue_reassembly(t, recvmsg, (int)data_length);
-			wake_up_interruptible(&t->wait_reassembly_queue);
+			wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		} else
 			put_recvmsg(t, recvmsg);
 
@@ -675,7 +671,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	 * the only one reading from the front of the queue. The transport
 	 * may add more entries to the back of the queue at the same time
 	 */
-	if (st->reassembly_data_length >= size) {
+	if (sc->recv_io.reassembly.data_length >= size) {
 		int queue_length;
 		int queue_removed = 0;
 
@@ -687,10 +683,10 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		 * updated in SOFTIRQ as more data is received
 		 */
 		virt_rmb();
-		queue_length = st->reassembly_queue_length;
+		queue_length = sc->recv_io.reassembly.queue_length;
 		data_read = 0;
 		to_read = size;
-		offset = st->first_entry_offset;
+		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
 			recvmsg = get_first_reassembly(st);
 			data_transfer = smbdirect_recv_io_payload(recvmsg);
@@ -733,9 +729,9 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 				if (queue_length) {
 					list_del(&recvmsg->list);
 				} else {
-					spin_lock_irq(&st->reassembly_queue_lock);
+					spin_lock_irq(&sc->recv_io.reassembly.lock);
 					list_del(&recvmsg->list);
-					spin_unlock_irq(&st->reassembly_queue_lock);
+					spin_unlock_irq(&sc->recv_io.reassembly.lock);
 				}
 				queue_removed++;
 				put_recvmsg(st, recvmsg);
@@ -748,10 +744,10 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			data_read += to_copy;
 		}
 
-		spin_lock_irq(&st->reassembly_queue_lock);
-		st->reassembly_data_length -= data_read;
-		st->reassembly_queue_length -= queue_removed;
-		spin_unlock_irq(&st->reassembly_queue_lock);
+		spin_lock_irq(&sc->recv_io.reassembly.lock);
+		sc->recv_io.reassembly.data_length -= data_read;
+		sc->recv_io.reassembly.queue_length -= queue_removed;
+		spin_unlock_irq(&sc->recv_io.reassembly.lock);
 
 		spin_lock(&st->receive_credit_lock);
 		st->count_avail_recvmsg += queue_removed;
@@ -763,18 +759,18 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			spin_unlock(&st->receive_credit_lock);
 		}
 
-		st->first_entry_offset = offset;
+		sc->recv_io.reassembly.first_entry_offset = offset;
 		ksmbd_debug(RDMA,
 			    "returning to thread data_read=%d reassembly_data_length=%d first_entry_offset=%d\n",
-			    data_read, st->reassembly_data_length,
-			    st->first_entry_offset);
+			    data_read, sc->recv_io.reassembly.data_length,
+			    sc->recv_io.reassembly.first_entry_offset);
 read_rfc1002_done:
 		return data_read;
 	}
 
 	ksmbd_debug(RDMA, "wait_event on more data\n");
-	rc = wait_event_interruptible(st->wait_reassembly_queue,
-				      st->reassembly_data_length >= size ||
+	rc = wait_event_interruptible(sc->recv_io.reassembly.wait_queue,
+				      sc->recv_io.reassembly.data_length >= size ||
 				       sc->status != SMBDIRECT_SOCKET_CONNECTED);
 	if (rc)
 		return -EINTR;
@@ -1529,7 +1525,7 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		wake_up_interruptible(&t->wait_status);
-		wake_up_interruptible(&t->wait_reassembly_queue);
+		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		wake_up(&t->wait_send_credits);
 		break;
 	}
@@ -1991,10 +1987,10 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 	ret = smb_direct_send_negotiate_response(st, ret);
 out:
-	spin_lock_irq(&st->reassembly_queue_lock);
-	st->reassembly_queue_length--;
+	spin_lock_irq(&sc->recv_io.reassembly.lock);
+	sc->recv_io.reassembly.queue_length--;
 	list_del(&recvmsg->list);
-	spin_unlock_irq(&st->reassembly_queue_lock);
+	spin_unlock_irq(&sc->recv_io.reassembly.lock);
 	put_recvmsg(st, recvmsg);
 
 	return ret;
-- 
2.43.0


