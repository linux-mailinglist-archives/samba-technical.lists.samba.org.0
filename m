Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83B1982EF
	for <lists+samba-technical@lfdr.de>; Mon, 30 Mar 2020 20:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3A8nHOeNNyvnaGJ32GUyPnGoaPMyPU6d72iLAZUEgFI=; b=amxhRLXHK6Eoc79IEIs891qdjs
	DeMZ7hOHphwbgqG7Hn+4gzoTQKYwrMk0t9fp38zLo+WSN20rS0yvKm7FbQID770q7PfpOTP4O95yE
	dHRu3QqLTaCCq22UAhgg5Xo9/A84dolixV6U4McB5q2hZY0S6kJAgdOa/LZ8oXTJJtjfB1tcDl1DA
	OAIkzqZOoOp58WDHAuIP4/w2IX0s/6gzWVqCBEK9R5VN8Fk4uc3T1TFQVQBsFPUuthIo4qcrkB201
	gFMKRDsoHv9OsPz623bHwgdDgPni+5ADkQFVKe5myppduRY+b6R5ZabG9Nb64Tc/nRbB1LSgiolMP
	+FqnsoAQ==;
Received: from localhost ([::1]:40454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIyls-0012Zf-0B; Mon, 30 Mar 2020 18:04:24 +0000
Received: from [13.77.154.182] (port=33198 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jIyll-0012ZW-9T
 for samba-technical@lists.samba.org; Mon, 30 Mar 2020 18:04:19 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 20EAA20B4749; Mon, 30 Mar 2020 11:04:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 20EAA20B4749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585591453;
 bh=3A8nHOeNNyvnaGJ32GUyPnGoaPMyPU6d72iLAZUEgFI=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=UX9BcTcdrhgKbed/UShEQjq96RBxyEhIoRibK/aC5/G7FW28xjye+wH3ACCs1MCSi
 cBGbuQoUhW4ZDF8jRP61x/UpcQM9te27LC9F1zoMXfXVXhaTCINkIF8OxJUuKmFRyW
 jjoN5vZsoVFe6gM/8aWFHimoFnnuXvRHS58fAVLg=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cifs: smbd: Merge code to track pending packets
Date: Mon, 30 Mar 2020 11:04:06 -0700
Message-Id: <1585591447-11741-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

As an optimization, SMBD tries to track two types of packets: packets with
payload and without payload. There is no obvious benefit or performance gain
to separately track two types of packets.

Just treat them as pending packets and merge the tracking code.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/cifs_debug.c |  6 ++----
 fs/cifs/smbdirect.c  | 40 ++++++++++------------------------------
 fs/cifs/smbdirect.h  |  5 -----
 3 files changed, 12 insertions(+), 39 deletions(-)

diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
index 276e4b5ea8e0..916567d770f5 100644
--- a/fs/cifs/cifs_debug.c
+++ b/fs/cifs/cifs_debug.c
@@ -323,10 +323,8 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			atomic_read(&server->smbd_conn->send_credits),
 			atomic_read(&server->smbd_conn->receive_credits),
 			server->smbd_conn->receive_credit_target);
-		seq_printf(m, "\nPending send_pending: %x "
-			"send_payload_pending: %x",
-			atomic_read(&server->smbd_conn->send_pending),
-			atomic_read(&server->smbd_conn->send_payload_pending));
+		seq_printf(m, "\nPending send_pending: %x ",
+			atomic_read(&server->smbd_conn->send_pending));
 		seq_printf(m, "\nReceive buffers count_receive_queue: %x "
 			"count_empty_packet_queue: %x",
 			server->smbd_conn->count_receive_queue,
diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 8da43a500686..79d8dcbd0034 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -284,13 +284,9 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 			request->sge[i].length,
 			DMA_TO_DEVICE);
 
-	if (request->has_payload) {
-		if (atomic_dec_and_test(&request->info->send_payload_pending))
-			wake_up(&request->info->wait_send_payload_pending);
-	} else {
-		if (atomic_dec_and_test(&request->info->send_pending))
-			wake_up(&request->info->wait_send_pending);
-	}
+	if (atomic_dec_and_test(&request->info->send_pending))
+		wake_up(&request->info->wait_send_pending);
+
 
 	mempool_free(request, request->info->request_mempool);
 }
@@ -749,7 +745,6 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
 		request->sge[0].addr,
 		request->sge[0].length, request->sge[0].lkey);
 
-	request->has_payload = false;
 	atomic_inc(&info->send_pending);
 	rc = ib_post_send(info->id->qp, &send_wr, NULL);
 	if (!rc)
@@ -919,7 +914,7 @@ static void smbd_destroy_header(struct smbd_connection *info,
 
 /* Post the send request */
 static int smbd_post_send(struct smbd_connection *info,
-		struct smbd_request *request, bool has_payload)
+		struct smbd_request *request)
 {
 	struct ib_send_wr send_wr;
 	int rc, i;
@@ -944,24 +939,13 @@ static int smbd_post_send(struct smbd_connection *info,
 	send_wr.opcode = IB_WR_SEND;
 	send_wr.send_flags = IB_SEND_SIGNALED;
 
-	if (has_payload) {
-		request->has_payload = true;
-		atomic_inc(&info->send_payload_pending);
-	} else {
-		request->has_payload = false;
-		atomic_inc(&info->send_pending);
-	}
+	atomic_inc(&info->send_pending);
 
 	rc = ib_post_send(info->id->qp, &send_wr, NULL);
 	if (rc) {
 		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
-		if (has_payload) {
-			if (atomic_dec_and_test(&info->send_payload_pending))
-				wake_up(&info->wait_send_payload_pending);
-		} else {
-			if (atomic_dec_and_test(&info->send_pending))
-				wake_up(&info->wait_send_pending);
-		}
+		if (atomic_dec_and_test(&info->send_pending))
+			wake_up(&info->wait_send_pending);
 		smbd_disconnect_rdma_connection(info);
 		rc = -EAGAIN;
 	} else
@@ -1001,7 +985,7 @@ static int smbd_post_send_sgl(struct smbd_connection *info,
 		request->num_sge++;
 	}
 
-	rc = smbd_post_send(info, request, data_length);
+	rc = smbd_post_send(info, request);
 	if (!rc)
 		return 0;
 
@@ -1413,8 +1397,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "wait for all send posted to IB to finish\n");
 	wait_event(info->wait_send_pending,
 		atomic_read(&info->send_pending) == 0);
-	wait_event(info->wait_send_payload_pending,
-		atomic_read(&info->send_payload_pending) == 0);
 
 	/* It's not posssible for upper layer to get to reassembly */
 	log_rdma_event(INFO, "drain the reassembly queue\n");
@@ -1751,8 +1733,6 @@ static struct smbd_connection *_smbd_get_connection(
 	init_waitqueue_head(&info->wait_send_pending);
 	atomic_set(&info->send_pending, 0);
 
-	init_waitqueue_head(&info->wait_send_payload_pending);
-	atomic_set(&info->send_payload_pending, 0);
 
 	INIT_WORK(&info->disconnect_work, smbd_disconnect_rdma_work);
 	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
@@ -2226,8 +2206,8 @@ int smbd_send(struct TCP_Server_Info *server,
 	 * that means all the I/Os have been out and we are good to return
 	 */
 
-	wait_event(info->wait_send_payload_pending,
-		atomic_read(&info->send_payload_pending) == 0);
+	wait_event(info->wait_send_pending,
+		atomic_read(&info->send_pending) == 0);
 
 	return rc;
 }
diff --git a/fs/cifs/smbdirect.h b/fs/cifs/smbdirect.h
index 8ede915f2b24..f70c7119a456 100644
--- a/fs/cifs/smbdirect.h
+++ b/fs/cifs/smbdirect.h
@@ -114,8 +114,6 @@ struct smbd_connection {
 	/* Activity accoutning */
 	atomic_t send_pending;
 	wait_queue_head_t wait_send_pending;
-	atomic_t send_payload_pending;
-	wait_queue_head_t wait_send_payload_pending;
 
 	/* Receive queue */
 	struct list_head receive_queue;
@@ -234,9 +232,6 @@ struct smbd_request {
 	struct smbd_connection *info;
 	struct ib_cqe cqe;
 
-	/* true if this request carries upper layer payload */
-	bool has_payload;
-
 	/* the SGE entries for this packet */
 	struct ib_sge sge[SMBDIRECT_MAX_SGE];
 	int num_sge;
-- 
2.17.1


