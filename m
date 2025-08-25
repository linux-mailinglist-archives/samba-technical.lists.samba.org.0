Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B44B34C97
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wHKNpfS/FLWiLkNSzBcpV+mnjq4zZa7/mYsvpUfrZcM=; b=fdDkdHzO4fjHhucvYvVnoDNPs1
	66VuYgrpMrWOC+lUSW/M0oqXJ131khdNiz7F8jdoJ/ZlaG7KMGctnsmJjUHodyIcJ5WYov7nCa71H
	ygFRCPU+9FMC2vqKphoJRMhM45A7GRW3/r3wnNSWE7m+wIWfbWrHgsV0onOrLzKuyel6/85pL3hso
	9jow5oh9OQJlUzEDrb0EJIzI5dPC6AWQU6gPvB7gsGZN11xlzfqvqRkEGyqBfyXPd/3nQeYFKH0Jq
	ZI1YUS0LLV65S0IRGWwFMeB4eO6Rdwm2/xMnVHZdzcn1cKVBMQn/rznX+m1+KnjEBomS41qPOwurx
	0FQ7sBow==;
Received: from ip6-localhost ([::1]:27640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe7Y-000Nnj-Nx; Mon, 25 Aug 2025 20:48:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17970) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe65-000NFB-4I
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=wHKNpfS/FLWiLkNSzBcpV+mnjq4zZa7/mYsvpUfrZcM=; b=MY2+mHaItoZGWdvVr07Xzw1DjS
 S0YOz9RuHc3hz5Nc/I8RyXakoijDq2kDEnjBdRe8CcisNr6oktx+IXlUqEjubQuXXu8bl9/5Krmdy
 6REwpI0R7wOv+m49hqXIu9dXE2QZYUYJTozqbkojZuS95kw0OTVnZ25mXmes9gZ7NrAg7DgAxDZEg
 wF9RjssTYKMU1CCj9n4fnpEMfzF6q7nDL+Id0hBZrERMQ0/s9eaAFiUP2Dn1toohnCxtn1qYguwiJ
 rLS4NWANTJoNmOATshI34aPGIoxt/Wig0Q0gxp0BmDQG79QfxilhkvpqcB8WlfsUFLZw/mgR1xBwd
 7xE+y5/Azx/NDhZ9CKny9QPwKTSYeLfG6biIjLMEMCAznTI9pTMN9kaUaLMAYUCPVWQHhLkgVbpJ7
 vEnzb/tLlgDzLOzgN8tiTVscicDKGuIzb16yEs0mKsfD/EaWtuP/T6FDL+QYeSlHJ9GyAu60ileVw
 jZnRbcdwcV4BEcytDrjAEC5i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe62-000kJB-34; Mon, 25 Aug 2025 20:47:19 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 033/142] smb: client: remove info->wait_receive_queues
 handling in smbd_destroy()
Date: Mon, 25 Aug 2025 22:39:54 +0200
Message-ID: <19e7299ed26036970779103412337424986899fe.1756139607.git.metze@samba.org>
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

We already call ib_drain_qp() before, which is an sync operation
that only returns in the queues are fully drained.

ib_drain_qp() completes pending requests with IB_WC_WR_FLUSH_ERR
so we have already called put_receive_buffer().

So all smbdirect_recv_io objects are either in the
smbdirect_socket.recv_io.free.list or
smbdirect_socket.recv_io.reassembly.list.

Then we explicitly iterate smbdirect_socket.recv_io.reassembly.list
and call put_receive_buffer(), so every object is
in smbdirect_socket.recv_io.free.list.

It means info->count_receive_queue == sp->recv_credit_max was
already true and calling wait_event(info->wait_receive_queues...
is pointless.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  2 --
 fs/smb/client/smbdirect.c  | 13 -------------
 fs/smb/client/smbdirect.h  |  4 ----
 3 files changed, 19 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index b80ddacd8c8f..3717a0081847 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -481,8 +481,6 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			server->smbd_conn->receive_credit_target);
 		seq_printf(m, "\nPending send_pending: %x ",
 			atomic_read(&sc->send_io.pending.count));
-		seq_printf(m, "\nReceive buffers count_receive_queue: %x ",
-			server->smbd_conn->count_receive_queue);
 		seq_printf(m, "\nMR responder_resources: %x "
 			"max_frmr_depth: %x mr_type: %x",
 			server->smbd_conn->responder_resources,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ec3ebf6e3c88..b1ecfdbbc67d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -514,7 +514,6 @@ static void smbd_post_send_credits(struct work_struct *work)
 	struct smbdirect_socket *sc = &info->socket;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		wake_up_all(&info->wait_receive_queues);
 		return;
 	}
 
@@ -1331,7 +1330,6 @@ static struct smbdirect_recv_io *get_receive_buffer(struct smbd_connection *info
 			&sc->recv_io.free.list,
 			struct smbdirect_recv_io, list);
 		list_del(&ret->list);
-		info->count_receive_queue--;
 		info->count_get_receive_buffer++;
 	}
 	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
@@ -1361,7 +1359,6 @@ static void put_receive_buffer(
 
 	spin_lock_irqsave(&sc->recv_io.free.lock, flags);
 	list_add_tail(&response->list, &sc->recv_io.free.list);
-	info->count_receive_queue++;
 	info->count_put_receive_buffer++;
 	spin_unlock_irqrestore(&sc->recv_io.free.lock, flags);
 
@@ -1375,10 +1372,6 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	struct smbdirect_recv_io *response;
 	int i;
 
-	info->count_receive_queue = 0;
-
-	init_waitqueue_head(&info->wait_receive_queues);
-
 	for (i = 0; i < num_buf; i++) {
 		response = mempool_alloc(sc->recv_io.mem.pool, GFP_KERNEL);
 		if (!response)
@@ -1387,7 +1380,6 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 		response->socket = sc;
 		response->sge.length = 0;
 		list_add_tail(&response->list, &sc->recv_io.free.list);
-		info->count_receive_queue++;
 	}
 
 	return 0;
@@ -1398,7 +1390,6 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 				&sc->recv_io.free.list,
 				struct smbdirect_recv_io, list);
 		list_del(&response->list);
-		info->count_receive_queue--;
 
 		mempool_free(response, sc->recv_io.mem.pool);
 	}
@@ -1448,7 +1439,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 {
 	struct smbd_connection *info = server->smbd_conn;
 	struct smbdirect_socket *sc;
-	struct smbdirect_socket_parameters *sp;
 	struct smbdirect_recv_io *response;
 	unsigned long flags;
 
@@ -1457,7 +1447,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 		return;
 	}
 	sc = &info->socket;
-	sp = &sc->parameters;
 
 	log_rdma_event(INFO, "cancelling and disable disconnect_work\n");
 	disable_work_sync(&sc->disconnect_work);
@@ -1499,8 +1488,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	sc->recv_io.reassembly.data_length = 0;
 
 	log_rdma_event(INFO, "free receive buffers\n");
-	wait_event(info->wait_receive_queues,
-		info->count_receive_queue == sp->recv_credit_max);
 	destroy_receive_buffers(info);
 
 	/*
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 1c4e03491964..693876f2d836 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -84,10 +84,6 @@ struct smbd_connection {
 	/* Activity accounting */
 	wait_queue_head_t wait_post_send;
 
-	/* Receive queue */
-	int count_receive_queue;
-	wait_queue_head_t wait_receive_queues;
-
 	bool send_immediate;
 
 	struct workqueue_struct *workqueue;
-- 
2.43.0


