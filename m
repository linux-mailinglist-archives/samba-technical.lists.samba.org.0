Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53004B1B82B
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:13:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=XnzjlbAfNqeKmctN3GuLNamhikKv25CGP3JkwP1rQxc=; b=hFnNgcaV3Ph9mWsq57VYJMyrON
	IU9AmVnPvjTCaec60IiZNMFtorqZfkFSV6dJdt2NyWzRkOVmAYanBdff2q7xvUMX4K3tGFs8JtlPE
	Lc2Zy3Rs+je2ab2I6RSq6ILtLP4C16xJLN5hiK6OlRk6v/DHEUnFCQ/SiS1SlIAYSHRTHxgra7w7r
	xFh0Bf5ovDrZrnWkWLb1yk7CotfIUvGxetAMvvhgwHIu2LNIMpHp5RE/1AEHzSWi8kv2UUDyVdtY6
	/auDO98qoLIJidjk43UPeL86N6t4Szz4t6Gtg42Ek8NjoZLUGfUxNk/2BXN/WvgspKT2ACBYWP25d
	JzycV2AQ==;
Received: from ip6-localhost ([::1]:35056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKIL-00ENVK-Bu; Tue, 05 Aug 2025 16:13:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41606) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHm-00ENIq-PR
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=XnzjlbAfNqeKmctN3GuLNamhikKv25CGP3JkwP1rQxc=; b=3+d+xdKN2RPRUQtVbcHuCsEZxl
 Uy8RfQj15M2ZvBjiGulN4tiHXd0xvJui3EOmxThMCdAzoxPWPKTemM+7aRJeJAjNU3OmfHxiFqrMC
 a+RgBdtiGefVmnv2ICV8WM5c3Agsk9o27o/UT651FsnC9vUvGetZdrDD8y+Njz4ZerSqhx8fqakmR
 vCwA8ivnJCPVR5Uhbp2uOJnWtujGZsXiUzl+GcQAE/StUdGewhGKanFuosiKLJJn9ZewOVx4XmTsw
 TI5ImHWhk8NmOdoiyaH+yZ6oFscYyJSgNyaW/qv2w8vf6oYOgbxecjXh2Ie3uJf9LL9uuJl+LaCnQ
 aAhZD0bMoyIuyxT395g4wMmAsw5ypj6YcS6+CUq/Tw5xSYuG3wQd2nCFYqPhc0ZXgLv2deQWz4Sd3
 sktgBH7HBXmpEoYt9/3fxSx5GK6M5lasTL5em7Qn7CwTmMy7MyyKgyXWSyg0iNeAQtn27UsKN2U63
 /OK4kjpmQo1lnDBxLn8nfaq2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHk-0019lW-2S; Tue, 05 Aug 2025 16:13:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 09/17] smb: client: make use of
 smbdirect_socket.recv_io.reassembly.*
Date: Tue,  5 Aug 2025 18:11:37 +0200
Message-ID: <e196444f90b850a4f86120e7e3964f4b706d61a7.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
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

This will be used by the server too and will allow us to
create common helper functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  8 ++--
 fs/smb/client/smbdirect.c  | 79 ++++++++++++++++++++------------------
 fs/smb/client/smbdirect.h  | 20 ----------
 3 files changed, 46 insertions(+), 61 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index d462fed843ee..65fe143eef81 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -414,6 +414,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 	spin_lock(&cifs_tcp_ses_lock);
 	list_for_each_entry(server, &cifs_tcp_ses_list, tcp_ses_list) {
 #ifdef CONFIG_CIFS_SMB_DIRECT
+		struct smbdirect_socket *sc;
 		struct smbdirect_socket_parameters *sp;
 #endif
 
@@ -438,7 +439,8 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			seq_printf(m, "\nSMBDirect transport not available");
 			goto skip_rdma;
 		}
-		sp = &server->smbd_conn->socket.parameters;
+		sc = &server->smbd_conn->socket;
+		sp = &sc->parameters;
 
 		seq_printf(m, "\nSMBDirect (in hex) protocol version: %x "
 			"transport status: %x",
@@ -472,8 +474,8 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			server->smbd_conn->count_reassembly_queue,
 			server->smbd_conn->count_enqueue_reassembly_queue,
 			server->smbd_conn->count_dequeue_reassembly_queue,
-			server->smbd_conn->reassembly_data_length,
-			server->smbd_conn->reassembly_queue_length);
+			sc->recv_io.reassembly.data_length,
+			sc->recv_io.reassembly.queue_length);
 		seq_printf(m, "\nCurrent Credits send_credits: %x "
 			"receive_credits: %x receive_credit_target: %x",
 			atomic_read(&server->smbd_conn->send_credits),
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 2f225635e869..73ad04ceedae 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -224,7 +224,7 @@ static int smbd_conn_upcall(
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		wake_up_interruptible(&info->disconn_wait);
-		wake_up_interruptible(&info->wait_reassembly_queue);
+		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		wake_up_interruptible_all(&info->wait_send_queue);
 		break;
 
@@ -470,7 +470,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	/* SMBD negotiation response */
 	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
 		dump_smbdirect_negotiate_resp(smbdirect_recv_io_payload(response));
-		info->full_packet_received = true;
+		sc->recv_io.reassembly.full_packet_received = true;
 		info->negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
 		put_receive_buffer(info, response);
@@ -483,13 +483,13 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		data_length = le32_to_cpu(data_transfer->data_length);
 
 		if (data_length) {
-			if (info->full_packet_received)
+			if (sc->recv_io.reassembly.full_packet_received)
 				response->first_segment = true;
 
 			if (le32_to_cpu(data_transfer->remaining_data_length))
-				info->full_packet_received = false;
+				sc->recv_io.reassembly.full_packet_received = false;
 			else
-				info->full_packet_received = true;
+				sc->recv_io.reassembly.full_packet_received = true;
 		}
 
 		atomic_dec(&info->receive_credits);
@@ -524,7 +524,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		 */
 		if (data_length) {
 			enqueue_reassembly(info, response, data_length);
-			wake_up_interruptible(&info->wait_reassembly_queue);
+			wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		} else
 			put_receive_buffer(info, response);
 
@@ -1124,9 +1124,11 @@ static void enqueue_reassembly(
 	struct smbdirect_recv_io *response,
 	int data_length)
 {
-	spin_lock(&info->reassembly_queue_lock);
-	list_add_tail(&response->list, &info->reassembly_queue);
-	info->reassembly_queue_length++;
+	struct smbdirect_socket *sc = &info->socket;
+
+	spin_lock(&sc->recv_io.reassembly.lock);
+	list_add_tail(&response->list, &sc->recv_io.reassembly.list);
+	sc->recv_io.reassembly.queue_length++;
 	/*
 	 * Make sure reassembly_data_length is updated after list and
 	 * reassembly_queue_length are updated. On the dequeue side
@@ -1134,8 +1136,8 @@ static void enqueue_reassembly(
 	 * if reassembly_queue_length and list is up to date
 	 */
 	virt_wmb();
-	info->reassembly_data_length += data_length;
-	spin_unlock(&info->reassembly_queue_lock);
+	sc->recv_io.reassembly.data_length += data_length;
+	spin_unlock(&sc->recv_io.reassembly.lock);
 	info->count_reassembly_queue++;
 	info->count_enqueue_reassembly_queue++;
 }
@@ -1147,11 +1149,12 @@ static void enqueue_reassembly(
  */
 static struct smbdirect_recv_io *_get_first_reassembly(struct smbd_connection *info)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *ret = NULL;
 
-	if (!list_empty(&info->reassembly_queue)) {
+	if (!list_empty(&sc->recv_io.reassembly.list)) {
 		ret = list_first_entry(
-			&info->reassembly_queue,
+			&sc->recv_io.reassembly.list,
 			struct smbdirect_recv_io, list);
 	}
 	return ret;
@@ -1219,10 +1222,10 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	struct smbdirect_recv_io *response;
 	int i;
 
-	INIT_LIST_HEAD(&info->reassembly_queue);
-	spin_lock_init(&info->reassembly_queue_lock);
-	info->reassembly_data_length = 0;
-	info->reassembly_queue_length = 0;
+	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
+	spin_lock_init(&sc->recv_io.reassembly.lock);
+	sc->recv_io.reassembly.data_length = 0;
+	sc->recv_io.reassembly.queue_length = 0;
 
 	INIT_LIST_HEAD(&sc->recv_io.free.list);
 	spin_lock_init(&sc->recv_io.free.lock);
@@ -1333,18 +1336,18 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	/* It's not possible for upper layer to get to reassembly */
 	log_rdma_event(INFO, "drain the reassembly queue\n");
 	do {
-		spin_lock_irqsave(&info->reassembly_queue_lock, flags);
+		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
 		response = _get_first_reassembly(info);
 		if (response) {
 			list_del(&response->list);
 			spin_unlock_irqrestore(
-				&info->reassembly_queue_lock, flags);
+				&sc->recv_io.reassembly.lock, flags);
 			put_receive_buffer(info, response);
 		} else
 			spin_unlock_irqrestore(
-				&info->reassembly_queue_lock, flags);
+				&sc->recv_io.reassembly.lock, flags);
 	} while (response);
-	info->reassembly_data_length = 0;
+	sc->recv_io.reassembly.data_length = 0;
 
 	log_rdma_event(INFO, "free receive buffers\n");
 	wait_event(info->wait_receive_queues,
@@ -1639,7 +1642,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	init_waitqueue_head(&info->conn_wait);
 	init_waitqueue_head(&info->disconn_wait);
-	init_waitqueue_head(&info->wait_reassembly_queue);
+	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
 	rc = rdma_connect(sc->rdma.cm_id, &conn_param);
 	if (rc) {
 		log_rdma_event(ERR, "rdma_connect() failed with %i\n", rc);
@@ -1776,9 +1779,9 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 	 * the only one reading from the front of the queue. The transport
 	 * may add more entries to the back of the queue at the same time
 	 */
-	log_read(INFO, "size=%zd info->reassembly_data_length=%d\n", size,
-		info->reassembly_data_length);
-	if (info->reassembly_data_length >= size) {
+	log_read(INFO, "size=%zd sc->recv_io.reassembly.data_length=%d\n", size,
+		sc->recv_io.reassembly.data_length);
+	if (sc->recv_io.reassembly.data_length >= size) {
 		int queue_length;
 		int queue_removed = 0;
 
@@ -1790,10 +1793,10 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 		 * updated in SOFTIRQ as more data is received
 		 */
 		virt_rmb();
-		queue_length = info->reassembly_queue_length;
+		queue_length = sc->recv_io.reassembly.queue_length;
 		data_read = 0;
 		to_read = size;
-		offset = info->first_entry_offset;
+		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
 			response = _get_first_reassembly(info);
 			data_transfer = smbdirect_recv_io_payload(response);
@@ -1841,10 +1844,10 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 					list_del(&response->list);
 				else {
 					spin_lock_irq(
-						&info->reassembly_queue_lock);
+						&sc->recv_io.reassembly.lock);
 					list_del(&response->list);
 					spin_unlock_irq(
-						&info->reassembly_queue_lock);
+						&sc->recv_io.reassembly.lock);
 				}
 				queue_removed++;
 				info->count_reassembly_queue--;
@@ -1863,23 +1866,23 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 				 to_read, data_read, offset);
 		}
 
-		spin_lock_irq(&info->reassembly_queue_lock);
-		info->reassembly_data_length -= data_read;
-		info->reassembly_queue_length -= queue_removed;
-		spin_unlock_irq(&info->reassembly_queue_lock);
+		spin_lock_irq(&sc->recv_io.reassembly.lock);
+		sc->recv_io.reassembly.data_length -= data_read;
+		sc->recv_io.reassembly.queue_length -= queue_removed;
+		spin_unlock_irq(&sc->recv_io.reassembly.lock);
 
-		info->first_entry_offset = offset;
+		sc->recv_io.reassembly.first_entry_offset = offset;
 		log_read(INFO, "returning to thread data_read=%d reassembly_data_length=%d first_entry_offset=%d\n",
-			 data_read, info->reassembly_data_length,
-			 info->first_entry_offset);
+			 data_read, sc->recv_io.reassembly.data_length,
+			 sc->recv_io.reassembly.first_entry_offset);
 read_rfc1002_done:
 		return data_read;
 	}
 
 	log_read(INFO, "wait_event on more data\n");
 	rc = wait_event_interruptible(
-		info->wait_reassembly_queue,
-		info->reassembly_data_length >= size ||
+		sc->recv_io.reassembly.wait_queue,
+		sc->recv_io.reassembly.data_length >= size ||
 			sc->status != SMBDIRECT_SOCKET_CONNECTED);
 	/* Don't return any data if interrupted */
 	if (rc)
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 3381e01f5b83..9df434f6bb8c 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -108,30 +108,10 @@ struct smbd_connection {
 	int count_receive_queue;
 	wait_queue_head_t wait_receive_queues;
 
-	/* Reassembly queue */
-	struct list_head reassembly_queue;
-	spinlock_t reassembly_queue_lock;
-	wait_queue_head_t wait_reassembly_queue;
-
-	/* total data length of reassembly queue */
-	int reassembly_data_length;
-	int reassembly_queue_length;
-	/* the offset to first buffer in reassembly queue */
-	int first_entry_offset;
-
 	bool send_immediate;
 
 	wait_queue_head_t wait_send_queue;
 
-	/*
-	 * Indicate if we have received a full packet on the connection
-	 * This is used to identify the first SMBD packet of a assembled
-	 * payload (SMB packet) in reassembly queue so we can return a
-	 * RFC1002 length to upper layer to indicate the length of the SMB
-	 * packet received
-	 */
-	bool full_packet_received;
-
 	struct workqueue_struct *workqueue;
 	struct delayed_work idle_timer_work;
 
-- 
2.43.0


