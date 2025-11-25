Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85EC868E3
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:19:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nmLIKRmmnqhEMW8pMCuhxdGnwliWReb148uT2yO/Pzw=; b=TStoDVY7Bl5/vHNWNMPPRHGGtw
	V4MXoUbGO7q0VYb6vVJsGMQEro4Gr29SQtiIWopmNpio07G/ed8cdgWcRJnCMbgeXgEeW/gQL8bE/
	NCvPnKZ/SIleVFpcN+18lzVPGF2ndQPsRX4Lo3HGyhKw4ta1K5WZMUPFWkIS48/iQiWZOE+KF29w/
	zWsQp+D7qlnKihlKLPoIz17I+zOXdJoE8br5/RHlM0G4Ky/51nl7Wi972ZI+MypoK/mNaJ03JiiCY
	zaPpWwfD7ZEVEyAd2rwg5LIS4pyrIdjJ4hbP4dDGRqHQe8GDznanBD2QS0/1YRF9fnW8oR9e9ZEE8
	HZBWvHwg==;
Received: from ip6-localhost ([::1]:64372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxd6-00DDjw-7E; Tue, 25 Nov 2025 18:19:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61372) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAlB-AX
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nmLIKRmmnqhEMW8pMCuhxdGnwliWReb148uT2yO/Pzw=; b=JZbUl74Fe10zSahcY/7RQy9RG4
 4IhT73Ug13cfANKeeylmBHYjxQMeyHB9VcnBX80PoGBslLQfbBpbAKpWAycUK+A3CJCtYS9jLDeNS
 Tyc6ya3piealMCGdPEgqjFrquk+y2DJ8AAwOi9H8KWxPAQna39unA5ftXTPg7Q7ZD2hJo53dYsIJy
 Lgyn9qa1fKW+CuN3cncQIGV4vTcePsfghLwxO2j8c+of5eismWPDSVZ/8/VJDNqexVqYaUNnlIJYm
 gHmsFZCVkaG3ZLA5TucirvBaN6ADu6rhuEbPM6urrTmV5l/BeQZ8gqfC4Jo58Ax/Ug69M29bvE+VD
 E7H3A6NjIkJQvrUUnWInYm2h1P0TumJ25xZDY7QYqfDvLSC1YdgtQU4TYXk7UxB+VvU1KeCQwUeD4
 X2HLckSmFq9oFDnA3B0EZ5q3GrMerLgnHiDBT6cCAMn6h8BFspli60ffvfaGK8UCXqc7eEAZ3sq9d
 c5KaNIhMtzt9FLTYsOO7D5TT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTH-00Fe40-1N; Tue, 25 Nov 2025 18:09:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 090/145] smb: client: make use of
 smbdirect_connection_send_{single_iter, immediate_work}()
Date: Tue, 25 Nov 2025 18:55:36 +0100
Message-ID: <ee3431afc545f9d5c2e526d61cb60d2d07380114.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

With this the low level send functions are in common,
we'll have to do some more changes in generic smb code
in order to use smbdirect_connection_send_iter() instead
of looping around smbdirect_connection_send_single_iter().

David's cleanups will allow us to use
smbdirect_connection_send_iter().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 253 +++-----------------------------------
 1 file changed, 15 insertions(+), 238 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 1f7b31cb15af..18b71f58e387 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -729,223 +729,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	return rc;
 }
 
-/* Post the send request */
-static int smbd_post_send(struct smbdirect_socket *sc,
-		struct smbdirect_send_io *request)
-{
-	int rc, i;
-
-	for (i = 0; i < request->num_sge; i++) {
-		log_rdma_send(INFO,
-			"rdma_request sge[%d] addr=0x%llx length=%u\n",
-			i, request->sge[i].addr, request->sge[i].length);
-		ib_dma_sync_single_for_device(
-			sc->ib.dev,
-			request->sge[i].addr,
-			request->sge[i].length,
-			DMA_TO_DEVICE);
-	}
-
-	request->cqe.done = smbdirect_connection_send_io_done;
-
-	request->wr.next = NULL;
-	request->wr.wr_cqe = &request->cqe;
-	request->wr.sg_list = request->sge;
-	request->wr.num_sge = request->num_sge;
-	request->wr.opcode = IB_WR_SEND;
-	request->wr.send_flags = IB_SEND_SIGNALED;
-
-	rc = ib_post_send(sc->ib.qp, &request->wr, NULL);
-	if (rc) {
-		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
-		smbdirect_socket_schedule_cleanup(sc, rc);
-		rc = -EAGAIN;
-	}
-
-	return rc;
-}
-
-static int smbd_post_send_iter(struct smbdirect_socket *sc,
-			       struct iov_iter *iter,
-			       u32 remaining_data_length)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	int rc;
-	int header_length;
-	int data_length;
-	struct smbdirect_send_io *request;
-	struct smbdirect_data_transfer *packet;
-	u16 new_credits = 0;
-
-	if (iter) {
-		header_length = sizeof(struct smbdirect_data_transfer);
-		if (WARN_ON_ONCE(remaining_data_length == 0 ||
-				 iov_iter_count(iter) > remaining_data_length))
-			return -EINVAL;
-	} else {
-		/* If this is a packet without payload, don't send padding */
-		header_length = offsetof(struct smbdirect_data_transfer, padding);
-		if (WARN_ON_ONCE(remaining_data_length))
-			return -EINVAL;
-	}
-
-wait_lcredit:
-	/* Wait for local send credits */
-	rc = wait_event_interruptible(sc->send_io.lcredits.wait_queue,
-		atomic_read(&sc->send_io.lcredits.count) > 0 ||
-		sc->status != SMBDIRECT_SOCKET_CONNECTED);
-	if (rc)
-		goto err_wait_lcredit;
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		log_outgoing(ERR, "disconnected not sending on wait_credit\n");
-		rc = -EAGAIN;
-		goto err_wait_lcredit;
-	}
-	if (unlikely(atomic_dec_return(&sc->send_io.lcredits.count) < 0)) {
-		atomic_inc(&sc->send_io.lcredits.count);
-		goto wait_lcredit;
-	}
-
-wait_credit:
-	/* Wait for send credits. A SMBD packet needs one credit */
-	rc = wait_event_interruptible(sc->send_io.credits.wait_queue,
-		atomic_read(&sc->send_io.credits.count) > 0 ||
-		sc->status != SMBDIRECT_SOCKET_CONNECTED);
-	if (rc)
-		goto err_wait_credit;
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		log_outgoing(ERR, "disconnected not sending on wait_credit\n");
-		rc = -EAGAIN;
-		goto err_wait_credit;
-	}
-	if (unlikely(atomic_dec_return(&sc->send_io.credits.count) < 0)) {
-		atomic_inc(&sc->send_io.credits.count);
-		goto wait_credit;
-	}
-
-	request = smbdirect_connection_alloc_send_io(sc);
-	if (IS_ERR(request)) {
-		rc = PTR_ERR(request);
-		goto err_alloc;
-	}
-
-	memset(request->sge, 0, sizeof(request->sge));
-
-	packet = smbdirect_send_io_payload(request);
-	request->sge[0].addr = ib_dma_map_single(sc->ib.dev,
-						 (void *)packet,
-						 header_length,
-						 DMA_TO_DEVICE);
-	if (ib_dma_mapping_error(sc->ib.dev, request->sge[0].addr)) {
-		rc = -EIO;
-		goto err_dma;
-	}
-
-	request->sge[0].length = header_length;
-	request->sge[0].lkey = sc->ib.pd->local_dma_lkey;
-	request->num_sge = 1;
-
-	/* Fill in the data payload to find out how much data we can add */
-	if (iter) {
-		struct smbdirect_map_sges extract = {
-			.num_sge	= request->num_sge,
-			.max_sge	= ARRAY_SIZE(request->sge),
-			.sge		= request->sge,
-			.device		= sc->ib.dev,
-			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
-			.direction	= DMA_TO_DEVICE,
-		};
-		size_t payload_len = umin(iov_iter_count(iter),
-					  sp->max_send_size - sizeof(*packet));
-
-		rc = smbdirect_map_sges_from_iter(iter, payload_len, &extract);
-		if (rc < 0)
-			goto err_dma;
-		data_length = rc;
-		request->num_sge = extract.num_sge;
-		remaining_data_length -= data_length;
-	} else {
-		data_length = 0;
-	}
-
-	/* Fill in the packet header */
-	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
-
-	new_credits = smbdirect_connection_grant_recv_credits(sc);
-	packet->credits_granted = cpu_to_le16(new_credits);
-
-	packet->flags = 0;
-	if (smbdirect_connection_request_keep_alive(sc))
-		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
-
-	packet->reserved = 0;
-	if (!data_length)
-		packet->data_offset = 0;
-	else
-		packet->data_offset = cpu_to_le32(24);
-	packet->data_length = cpu_to_le32(data_length);
-	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
-	packet->padding = 0;
-
-	log_outgoing(INFO, "credits_requested=%d credits_granted=%d data_offset=%d data_length=%d remaining_data_length=%d\n",
-		     le16_to_cpu(packet->credits_requested),
-		     le16_to_cpu(packet->credits_granted),
-		     le32_to_cpu(packet->data_offset),
-		     le32_to_cpu(packet->data_length),
-		     le32_to_cpu(packet->remaining_data_length));
-
-	/*
-	 * Now that we got a local and a remote credit
-	 * we add us as pending
-	 */
-	atomic_inc(&sc->send_io.pending.count);
-
-	rc = smbd_post_send(sc, request);
-	if (!rc)
-		return data_length;
-
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.zero_wait_queue);
-
-	wake_up(&sc->send_io.pending.dec_wait_queue);
-
-err_dma:
-	smbdirect_connection_free_send_io(request);
-
-	/* roll back the granted receive credits */
-	atomic_sub(new_credits, &sc->recv_io.credits.count);
-
-err_alloc:
-	atomic_inc(&sc->send_io.credits.count);
-	wake_up(&sc->send_io.credits.wait_queue);
-
-err_wait_credit:
-	atomic_inc(&sc->send_io.lcredits.count);
-	wake_up(&sc->send_io.lcredits.wait_queue);
-
-err_wait_lcredit:
-	return rc;
-}
-
-/*
- * Send an empty message
- * Empty message is used to extend credits to peer to for keep live
- * while there is no upper layer payload to send at the time
- */
-static void smbd_post_send_empty(struct smbdirect_socket *sc)
-{
-	int ret;
-
-	sc->statistics.send_empty++;
-	ret = smbd_post_send_iter(sc, NULL, 0);
-	if (ret < 0) {
-		log_rdma_send(ERR, "smbd_post_send_iter failed ret=%d\n", ret);
-		smbdirect_socket_schedule_cleanup(sc, ret);
-	}
-}
-
 static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 				    struct iov_iter *iter,
 				    u32 remaining_data_length)
@@ -953,7 +736,7 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 	int bytes = 0;
 
 	/*
-	 * smbd_post_send_iter() respects the
+	 * smbdirect_connection_send_single_iter() respects the
 	 * negotiated max_send_size, so we need to
 	 * loop until the full iter is posted
 	 */
@@ -961,7 +744,11 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 	while (iov_iter_count(iter) > 0) {
 		int rc;
 
-		rc = smbd_post_send_iter(sc, iter, remaining_data_length);
+		rc = smbdirect_connection_send_single_iter(sc,
+							   NULL, /* batch */
+							   iter,
+							   0, /* flags */
+							   remaining_data_length);
 		if (rc < 0)
 			return rc;
 		remaining_data_length -= rc;
@@ -1014,18 +801,6 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 	return rc;
 }
 
-static void send_immediate_empty_message(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, idle.immediate_work);
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-		return;
-
-	log_keep_alive(INFO, "send an empty message\n");
-	smbd_post_send_empty(sc);
-}
-
 /*
  * Destroy the transport and related RDMA and memory resources
  * Need to go through all the pending counters and make sure on one is using
@@ -1208,7 +983,7 @@ static struct smbd_connection *_smbd_get_connection(
 	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
 		recv_io->cqe.done = recv_done;
 
-	INIT_WORK(&sc->idle.immediate_work, send_immediate_empty_message);
+	INIT_WORK(&sc->idle.immediate_work, smbdirect_connection_send_immediate_work);
 	/*
 	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
 	 * so that the timer will cause a disconnect.
@@ -1326,6 +1101,7 @@ int smbd_send(struct TCP_Server_Info *server,
 	struct iov_iter iter;
 	unsigned int remaining_data_length, klen;
 	int rc, i, rqst_idx;
+	int error = 0;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return -EAGAIN;
@@ -1393,14 +1169,15 @@ int smbd_send(struct TCP_Server_Info *server,
 	 * that means all the I/Os have been out and we are good to return
 	 */
 
-	wait_event(sc->send_io.pending.zero_wait_queue,
-		atomic_read(&sc->send_io.pending.count) == 0 ||
-		sc->status != SMBDIRECT_SOCKET_CONNECTED);
+	error = rc;
+	rc = smbdirect_connection_send_wait_zero_pending(sc);
+	if (unlikely(rc && !error))
+		error = -EAGAIN;
 
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED && rc == 0)
-		rc = -EAGAIN;
+	if (unlikely(error))
+		return error;
 
-	return rc;
+	return 0;
 }
 
 /*
-- 
2.43.0


