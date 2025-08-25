Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C15B34CCA
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:52:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LinTH5BttFwCFem9G0PzrmJZSv58dqkniZCX+50n7UM=; b=YpMbj17aM9qXqkxOVtb2LObw6j
	nnCrjj1z5doGgtdpIqVtFLqUMRsfUtqoKyV2z2G71SQrkiOut8HzWEiL9TEiNainQ54unrNlWpRF3
	guNgLGNlIHpuPjU3TQoSrFneu2FoZtF6cNqZID7g/GDwLdTydeVCiCWqLQX6AHyPqus/NGbedNRVh
	nnwhksGCiK2Icp1nUaEEZ6we7diCXwq42/KKV+ODtojI5nRuRtXoOjeaTUeg260JNunfp1E4FZ1HL
	HXlkyX2u90B6St1ajGU1fmCwTNgKQgMo6m6A0xZAa5P/qIx4jxRvFWglQ9GkGmwIDqQ1upNfIPUlD
	5Wj7NibA==;
Received: from ip6-localhost ([::1]:62900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeB7-000PCi-GZ; Mon, 25 Aug 2025 20:52:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62370) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8l-000OKk-E6
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=LinTH5BttFwCFem9G0PzrmJZSv58dqkniZCX+50n7UM=; b=OwjJ/vleLiCd37CKljToReE3fT
 6NuY3Rqe0j3aZcQ5npGnPGBlHKBY/vTo+gXYaKQnVgr+yw2oKMCYEfgtidIMbnMcqX+PHTdyQr1Pa
 drmoJ4iwMhzA9SLmpUpn9kET5ncfgybqZ4WQWfleGcZHMEHJhCVrPqId0ekD5Gvgq/It2op/i7xPT
 sQOFWOo3MxpWu2AR4QA4dN6KRf1w6FDu94F8mc5Ygsvut4UTVsbCyWubfgCoyPI/hwxraGxmQ5FnL
 W+2vfQUrmxbXGl5HQXeeeQqPqgRGEg7kfE0rSmbPOpqWVBsN8FKuwrasrjgW3N3cDTya0H506Z1ue
 iTMxl3QJ4EpdHQV1wbQ/Apkvk54HzLFteMGlZjIVuqwx7ASSBH7wdNbhWKnWUMSZgyO9ljUYzmoSe
 TOfjYJS7TIoioRY2NhtqJVZxUF3nYx4QCjESf7c5tbyS8FghokJwRXR/kbUz8vXFkSNOBq37jyNeX
 Z/qpT/vm07o2r3ql+El9yugd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe8h-000kss-0r; Mon, 25 Aug 2025 20:50:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 050/142] smb: client: make use of smbdirect_socket.workqueue
Date: Mon, 25 Aug 2025 22:40:11 +0200
Message-ID: <bb93b3bb3be8a5fd8e986f235bc5ffdfbabda6c3.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will simplify the move to common code...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 32 ++++++++++++++++----------------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 0eb46b01da32..7a1ae4704ab0 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -213,7 +213,7 @@ static void smbd_disconnect_rdma_connection(struct smbd_connection *info)
 {
 	struct smbdirect_socket *sc = &info->socket;
 
-	queue_work(info->workqueue, &sc->disconnect_work);
+	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
 /* Upcall from RDMA CM */
@@ -537,7 +537,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 	if (atomic_read(&sc->recv_io.credits.count) <
 		sc->recv_io.credits.target - 1) {
 		log_keep_alive(INFO, "schedule send of an empty message\n");
-		queue_work(info->workqueue, &sc->idle.immediate_work);
+		queue_work(sc->workqueue, &sc->idle.immediate_work);
 	}
 }
 
@@ -579,7 +579,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	 * order to trigger our next keepalive message.
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
-	mod_delayed_work(info->workqueue, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->keepalive_interval_msec));
 
 	switch (sc->recv_io.expected) {
@@ -645,7 +645,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (le16_to_cpu(data_transfer->flags) &
 				SMBDIRECT_FLAG_RESPONSE_REQUESTED) {
 			log_keep_alive(INFO, "schedule send of immediate response\n");
-			queue_work(info->workqueue, &sc->idle.immediate_work);
+			queue_work(sc->workqueue, &sc->idle.immediate_work);
 		}
 
 		/*
@@ -654,7 +654,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		 */
 		if (data_length) {
 			if (sc->recv_io.credits.target > old_recv_credit_target)
-				queue_work(info->workqueue, &sc->recv_io.posted.refill_work);
+				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
 			enqueue_reassembly(info, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
@@ -953,7 +953,7 @@ static int manage_keep_alive_before_sending(struct smbd_connection *info)
 		 * Now use the keepalive timeout (instead of keepalive interval)
 		 * in order to wait for a response
 		 */
-		mod_delayed_work(info->workqueue, &sc->idle.timer_work,
+		mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 				 msecs_to_jiffies(sp->keepalive_timeout_msec));
 		return 1;
 	}
@@ -1357,7 +1357,7 @@ static void put_receive_buffer(
 	sc->statistics.put_receive_buffer++;
 	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 
-	queue_work(info->workqueue, &sc->recv_io.posted.refill_work);
+	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
 
 /* Preallocate all receive buffer on transport establishment */
@@ -1439,10 +1439,10 @@ static void idle_connection_timer(struct work_struct *work)
 	 * in order to wait for a response
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(info->workqueue, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->keepalive_timeout_msec));
 	log_keep_alive(INFO, "schedule send of empty idle message\n");
-	queue_work(info->workqueue, &sc->idle.immediate_work);
+	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
 /*
@@ -1537,7 +1537,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	sc->status = SMBDIRECT_SOCKET_DESTROYED;
 
-	destroy_workqueue(info->workqueue);
+	destroy_workqueue(sc->workqueue);
 	log_rdma_event(INFO,  "rdma session destroyed\n");
 	kfree(info);
 	server->smbd_conn = NULL;
@@ -1584,7 +1584,7 @@ static void destroy_caches_and_workqueue(struct smbd_connection *info)
 	struct smbdirect_socket *sc = &info->socket;
 
 	destroy_receive_buffers(info);
-	destroy_workqueue(info->workqueue);
+	destroy_workqueue(sc->workqueue);
 	mempool_destroy(sc->recv_io.mem.pool);
 	kmem_cache_destroy(sc->recv_io.mem.cache);
 	mempool_destroy(sc->send_io.mem.pool);
@@ -1640,8 +1640,8 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 		goto out3;
 
 	scnprintf(name, MAX_NAME_LEN, "smbd_%p", info);
-	info->workqueue = create_workqueue(name);
-	if (!info->workqueue)
+	sc->workqueue = create_workqueue(name);
+	if (!sc->workqueue)
 		goto out4;
 
 	rc = allocate_receive_buffers(info, sp->recv_credit_max);
@@ -1653,7 +1653,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	return 0;
 
 out5:
-	destroy_workqueue(info->workqueue);
+	destroy_workqueue(sc->workqueue);
 out4:
 	mempool_destroy(sc->recv_io.mem.pool);
 out3:
@@ -1837,7 +1837,7 @@ static struct smbd_connection *_smbd_get_connection(
 	 * so that the timer will cause a disconnect.
 	 */
 	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(info->workqueue, &sc->idle.timer_work,
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->negotiate_timeout_msec));
 
 	INIT_WORK(&sc->recv_io.posted.refill_work, smbd_post_send_credits);
@@ -2541,7 +2541,7 @@ int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
 		 * Schedule the work to do MR recovery for future I/Os MR
 		 * recovery is slow and don't want it to block current I/O
 		 */
-		queue_work(info->workqueue, &info->mr_recovery_work);
+		queue_work(sc->workqueue, &info->mr_recovery_work);
 
 done:
 	if (atomic_dec_and_test(&info->mr_used_count))
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 4eec2ac4ba80..455618e676f5 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -53,8 +53,6 @@ struct smbd_connection {
 	struct work_struct mr_recovery_work;
 	/* Used by transport to wait until all MRs are returned */
 	wait_queue_head_t wait_for_mr_cleanup;
-
-	struct workqueue_struct *workqueue;
 };
 
 /* Create a SMBDirect session */
-- 
2.43.0


