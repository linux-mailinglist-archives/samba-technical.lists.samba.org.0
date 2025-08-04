Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE92B1A0EA
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2AfOgfm+5DEpiimicaqLy6hJIKmn3TMWbQ1JNi3c/4A=; b=rJhaTV+QhjHr2/o65dNtkm9slS
	QzAGsv2WgO+95Vf9Wk8F9OUv6ynrwE+q5cwiM2tchlQpbRxx3aiTzOxrIs6o/emLrO9a0uxoIFoSU
	ShicUEA+T5Kl4+Pw/PzSMq8dqgMBGhOcHBDdRVAiZG/Iayk3HTKXBfJi693WJnyzzz6sGPABqeg1b
	3F/7CerHGN31IHmGI1FTARuXLV7lrYYl2Vu0wVfSYdDiyEYhrYrwz5Z/twRsOmqjjEeRzYGdp9FKQ
	BvmVlDpf2nk5m2/MAEc7eFg7ayszMMc8iANi8AEf7/l+tYssMfOkFu8A3uCm+ngtgeStOEof3RLQI
	jGBDNPHA==;
Received: from ip6-localhost ([::1]:64150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu2e-00EHfj-2x; Mon, 04 Aug 2025 12:11:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21490) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2W-00EHf7-Cn
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2AfOgfm+5DEpiimicaqLy6hJIKmn3TMWbQ1JNi3c/4A=; b=bXFUXg1uVJOmGpSQL5zfgJjM7J
 bu3pUqgJIKJ5vHa9A6KTvReIWzaEaFaYxsdR5RcSCQPn41Os5E7vmbADzcUh7/ivb3l15p7HyzaIf
 Q6XGE7qujycR8UlRzJM0u6+A7VcxZdOiDiOqHtsDBIAKCVt8wtCr6QzBGeZHnfkYrp/pGlUMTusef
 zGc5MqRRuc51oOBcHiQjloTb/CA+KzDRWRdPPFZU9iw/1UaS2gIHl9HQb8783nHZjFEe8f5If6NWO
 b3xOPVmXQIPepriskC1u4qx9uAiFTSQp7uSwFUhKNumsISOqV5+KU1/3aHakW/0tO332HYA5osY8f
 k1pX6A2pbC6ToGzTBrz/XZtUO+SEp259w21AzVpVZfc7an3dHsm1fE+a/tmr0Hmc+OtnwGQD3szTd
 rTPgjJCUSp1HDemkWmYTc3jbURpHJsgZUvOAiJp4ZoBqtKm4kaYj88Gucy09MzFA8fgs++mqBGAaM
 4ih8EgJXv+ydY0eQeCcFCaEh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2V-000vuF-2H; Mon, 04 Aug 2025 12:11:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/5] smb: client: remove separate empty_packet_queue
Date: Mon,  4 Aug 2025 14:10:13 +0200
Message-ID: <5224ccec9a6da059b38e6bc317ab9ea720de0b91.1754308712.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754308712.git.metze@samba.org>
References: <cover.1754308712.git.metze@samba.org>
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

There's no need to maintain two lists, we can just
have a single list of receive buffers, which are free to use.

It just added unneeded complexity and resulted in
ib_dma_unmap_single() not being called from recv_done()
for empty keepalive packets.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  6 ++--
 fs/smb/client/smbdirect.c  | 62 +++-----------------------------------
 fs/smb/client/smbdirect.h  |  4 ---
 3 files changed, 7 insertions(+), 65 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index f1cea365b6f1..ca7c2265c25f 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -481,10 +481,8 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			server->smbd_conn->receive_credit_target);
 		seq_printf(m, "\nPending send_pending: %x ",
 			atomic_read(&server->smbd_conn->send_pending));
-		seq_printf(m, "\nReceive buffers count_receive_queue: %x "
-			"count_empty_packet_queue: %x",
-			server->smbd_conn->count_receive_queue,
-			server->smbd_conn->count_empty_packet_queue);
+		seq_printf(m, "\nReceive buffers count_receive_queue: %x ",
+			server->smbd_conn->count_receive_queue);
 		seq_printf(m, "\nMR responder_resources: %x "
 			"max_frmr_depth: %x mr_type: %x",
 			server->smbd_conn->responder_resources,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b6c369088479..b18e2bc6c8ed 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -13,8 +13,6 @@
 #include "cifsproto.h"
 #include "smb2proto.h"
 
-static struct smbd_response *get_empty_queue_buffer(
-		struct smbd_connection *info);
 static struct smbd_response *get_receive_buffer(
 		struct smbd_connection *info);
 static void put_receive_buffer(
@@ -23,8 +21,6 @@ static void put_receive_buffer(
 static int allocate_receive_buffers(struct smbd_connection *info, int num_buf);
 static void destroy_receive_buffers(struct smbd_connection *info);
 
-static void put_empty_packet(
-		struct smbd_connection *info, struct smbd_response *response);
 static void enqueue_reassembly(
 		struct smbd_connection *info,
 		struct smbd_response *response, int data_length);
@@ -393,7 +389,6 @@ static bool process_negotiation_response(
 static void smbd_post_send_credits(struct work_struct *work)
 {
 	int ret = 0;
-	int use_receive_queue = 1;
 	int rc;
 	struct smbd_response *response;
 	struct smbd_connection *info =
@@ -409,18 +404,9 @@ static void smbd_post_send_credits(struct work_struct *work)
 	if (info->receive_credit_target >
 		atomic_read(&info->receive_credits)) {
 		while (true) {
-			if (use_receive_queue)
-				response = get_receive_buffer(info);
-			else
-				response = get_empty_queue_buffer(info);
-			if (!response) {
-				/* now switch to empty packet queue */
-				if (use_receive_queue) {
-					use_receive_queue = 0;
-					continue;
-				} else
-					break;
-			}
+			response = get_receive_buffer(info);
+			if (!response)
+				break;
 
 			response->type = SMBD_TRANSFER_DATA;
 			response->first_segment = false;
@@ -511,7 +497,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 				response,
 				data_length);
 		} else
-			put_empty_packet(info, response);
+			put_receive_buffer(info, response);
 
 		if (data_length)
 			wake_up_interruptible(&info->wait_reassembly_queue);
@@ -1115,17 +1101,6 @@ static int smbd_negotiate(struct smbd_connection *info)
 	return rc;
 }
 
-static void put_empty_packet(
-		struct smbd_connection *info, struct smbd_response *response)
-{
-	spin_lock(&info->empty_packet_queue_lock);
-	list_add_tail(&response->list, &info->empty_packet_queue);
-	info->count_empty_packet_queue++;
-	spin_unlock(&info->empty_packet_queue_lock);
-
-	queue_work(info->workqueue, &info->post_send_credits_work);
-}
-
 /*
  * Implement Connection.FragmentReassemblyBuffer defined in [MS-SMBD] 3.1.1.1
  * This is a queue for reassembling upper layer payload and present to upper
@@ -1174,25 +1149,6 @@ static struct smbd_response *_get_first_reassembly(struct smbd_connection *info)
 	return ret;
 }
 
-static struct smbd_response *get_empty_queue_buffer(
-		struct smbd_connection *info)
-{
-	struct smbd_response *ret = NULL;
-	unsigned long flags;
-
-	spin_lock_irqsave(&info->empty_packet_queue_lock, flags);
-	if (!list_empty(&info->empty_packet_queue)) {
-		ret = list_first_entry(
-			&info->empty_packet_queue,
-			struct smbd_response, list);
-		list_del(&ret->list);
-		info->count_empty_packet_queue--;
-	}
-	spin_unlock_irqrestore(&info->empty_packet_queue_lock, flags);
-
-	return ret;
-}
-
 /*
  * Get a receive buffer
  * For each remote send, we need to post a receive. The receive buffers are
@@ -1257,10 +1213,6 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	spin_lock_init(&info->receive_queue_lock);
 	info->count_receive_queue = 0;
 
-	INIT_LIST_HEAD(&info->empty_packet_queue);
-	spin_lock_init(&info->empty_packet_queue_lock);
-	info->count_empty_packet_queue = 0;
-
 	init_waitqueue_head(&info->wait_receive_queues);
 
 	for (i = 0; i < num_buf; i++) {
@@ -1294,9 +1246,6 @@ static void destroy_receive_buffers(struct smbd_connection *info)
 
 	while ((response = get_receive_buffer(info)))
 		mempool_free(response, info->response_mempool);
-
-	while ((response = get_empty_queue_buffer(info)))
-		mempool_free(response, info->response_mempool);
 }
 
 /* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
@@ -1383,8 +1332,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	log_rdma_event(INFO, "free receive buffers\n");
 	wait_event(info->wait_receive_queues,
-		info->count_receive_queue + info->count_empty_packet_queue
-			== sp->recv_credit_max);
+		info->count_receive_queue == sp->recv_credit_max);
 	destroy_receive_buffers(info);
 
 	/*
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 75b3f491c3ad..ea04ce8a9763 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -110,10 +110,6 @@ struct smbd_connection {
 	int count_receive_queue;
 	spinlock_t receive_queue_lock;
 
-	struct list_head empty_packet_queue;
-	int count_empty_packet_queue;
-	spinlock_t empty_packet_queue_lock;
-
 	wait_queue_head_t wait_receive_queues;
 
 	/* Reassembly queue */
-- 
2.43.0


