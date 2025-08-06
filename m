Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE2B1CB13
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1PPWjrYFTLsld5sE8/MKRK4qiXb1yzN770qkq1yTsYw=; b=i505bT5A4Qx9gk8//xUSkHEI8o
	LvaqjEKv8rJFsdND06uD9e4FA9Y0K56tSUb7b2jLKiXolw2xrnlTSAzbx4NMM5Deu2S3DguzdGxM3
	7j8hTETpXtRzQn9jftmOPlaDxryw5YbyKeKtcOlNKQk9roTKr9Gbwr1UkIZ3EiuxQu832htmZJvz+
	LihpF11xK7aOLaf5ownXMdykMS83aY6DlYbhu1IlNGqwSLxqJC3Qik8wYuKIBfRCyJxUVgDo1QlnX
	1kvMQnQu2iJFFnFp6NA1XTMc+lQlsv9IavnIHQdHkXYJhcZUM4u8DePR4mkTz/fqrYYFuGZWSzgZd
	dxp+dK9A==;
Received: from ip6-localhost ([::1]:56190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji5Q-00ERu5-Jq; Wed, 06 Aug 2025 17:38:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65404) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4b-00ERcQ-1A
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1PPWjrYFTLsld5sE8/MKRK4qiXb1yzN770qkq1yTsYw=; b=1IWCfcBGIvvUSUdomlz6o7HNVj
 xAK9OPM0aZeCyMWxYLgFG85R53leU6E8eaTk9emAN9CsB6tlpfn3nvZ6euw2QMNfA8x+wLF0FerOa
 NG8A48HeJp/3GYaXyW9ETLaCNjkC35QDM2zH9VdrARVkih+C4+xc0FOYU6ywvS+WdR81Kgj3DpDvk
 NjD1S+jpSTULz+qgPYYtxxHbRU+pB8gp3tu16o3CNR1kOGGj/6zBWd8oa6vj2sBDoTbfYm646IhDp
 +W0Om0YIhYrdSkjbOdGJOWuQ22uJiKY9WJz4iIy/0HmBzOuz8yBIXBjFAE4UGsf/Eq667uQSv3DPb
 yhsa+351638+QKm5nBh2v/WlNrvhWRDUHm6Td1UoNMs9zSAcGSkzDUEHDVcNfdKRZgP9o0jc9MJLR
 1A59ZtqPzZXjvSQ2Mb1qXPfbdpYxOrNeB5sNVx3512rV1bC9aZdVJ62wtSFYG/+8MOBhHVbrlH/C+
 Xwk5h2emjDoXXOdVjJLAuzf0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4V-001Obh-2l; Wed, 06 Aug 2025 17:37:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 07/18] smb: client: make use of smbdirect_socket.{send,
 recv}_io.mem.{cache, pool}
Date: Wed,  6 Aug 2025 19:35:53 +0200
Message-ID: <c7c6de9412731dc23685a22790bb551a56f8c196.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow common helper functions to be created later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 65 ++++++++++++++++++++-------------------
 fs/smb/client/smbdirect.h |  9 ------
 2 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c367efef8c7a..6c2af00be44c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -287,7 +287,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
 		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
 			wc->status, wc->opcode);
-		mempool_free(request, info->request_mempool);
+		mempool_free(request, sc->send_io.mem.pool);
 		smbd_disconnect_rdma_connection(info);
 		return;
 	}
@@ -297,7 +297,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 
 	wake_up(&info->wait_post_send);
 
-	mempool_free(request, info->request_mempool);
+	mempool_free(request, sc->send_io.mem.pool);
 }
 
 static void dump_smbdirect_negotiate_resp(struct smbdirect_negotiate_resp *resp)
@@ -692,7 +692,7 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
 	struct smbdirect_send_io *request;
 	struct smbdirect_negotiate_req *packet;
 
-	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
+	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
 	if (!request)
 		return rc;
 
@@ -751,7 +751,7 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
 	smbd_disconnect_rdma_connection(info);
 
 dma_mapping_failed:
-	mempool_free(request, info->request_mempool);
+	mempool_free(request, sc->send_io.mem.pool);
 	return rc;
 }
 
@@ -883,7 +883,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 		goto wait_send_queue;
 	}
 
-	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
+	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
 		goto err_alloc;
@@ -977,7 +977,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 					    request->sge[i].addr,
 					    request->sge[i].length,
 					    DMA_TO_DEVICE);
-	mempool_free(request, info->request_mempool);
+	mempool_free(request, sc->send_io.mem.pool);
 
 	/* roll back receive credits and credits to be offered */
 	spin_lock(&info->lock_new_credits_offered);
@@ -1235,7 +1235,7 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	init_waitqueue_head(&info->wait_receive_queues);
 
 	for (i = 0; i < num_buf; i++) {
-		response = mempool_alloc(info->response_mempool, GFP_KERNEL);
+		response = mempool_alloc(sc->recv_io.mem.pool, GFP_KERNEL);
 		if (!response)
 			goto allocate_failed;
 
@@ -1255,17 +1255,18 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 		list_del(&response->list);
 		info->count_receive_queue--;
 
-		mempool_free(response, info->response_mempool);
+		mempool_free(response, sc->recv_io.mem.pool);
 	}
 	return -ENOMEM;
 }
 
 static void destroy_receive_buffers(struct smbd_connection *info)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *response;
 
 	while ((response = get_receive_buffer(info)))
-		mempool_free(response, info->response_mempool);
+		mempool_free(response, sc->recv_io.mem.pool);
 }
 
 /* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
@@ -1377,11 +1378,11 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	rdma_destroy_id(sc->rdma.cm_id);
 
 	/* free mempools */
-	mempool_destroy(info->request_mempool);
-	kmem_cache_destroy(info->request_cache);
+	mempool_destroy(sc->send_io.mem.pool);
+	kmem_cache_destroy(sc->send_io.mem.cache);
 
-	mempool_destroy(info->response_mempool);
-	kmem_cache_destroy(info->response_cache);
+	mempool_destroy(sc->recv_io.mem.pool);
+	kmem_cache_destroy(sc->recv_io.mem.cache);
 
 	sc->status = SMBDIRECT_SOCKET_DESTROYED;
 
@@ -1429,12 +1430,14 @@ int smbd_reconnect(struct TCP_Server_Info *server)
 
 static void destroy_caches_and_workqueue(struct smbd_connection *info)
 {
+	struct smbdirect_socket *sc = &info->socket;
+
 	destroy_receive_buffers(info);
 	destroy_workqueue(info->workqueue);
-	mempool_destroy(info->response_mempool);
-	kmem_cache_destroy(info->response_cache);
-	mempool_destroy(info->request_mempool);
-	kmem_cache_destroy(info->request_cache);
+	mempool_destroy(sc->recv_io.mem.pool);
+	kmem_cache_destroy(sc->recv_io.mem.cache);
+	mempool_destroy(sc->send_io.mem.pool);
+	kmem_cache_destroy(sc->send_io.mem.cache);
 }
 
 #define MAX_NAME_LEN	80
@@ -1449,19 +1452,19 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 		return -ENOMEM;
 
 	scnprintf(name, MAX_NAME_LEN, "smbdirect_send_io_%p", info);
-	info->request_cache =
+	sc->send_io.mem.cache =
 		kmem_cache_create(
 			name,
 			sizeof(struct smbdirect_send_io) +
 				sizeof(struct smbdirect_data_transfer),
 			0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!info->request_cache)
+	if (!sc->send_io.mem.cache)
 		return -ENOMEM;
 
-	info->request_mempool =
+	sc->send_io.mem.pool =
 		mempool_create(sp->send_credit_target, mempool_alloc_slab,
-			mempool_free_slab, info->request_cache);
-	if (!info->request_mempool)
+			mempool_free_slab, sc->send_io.mem.cache);
+	if (!sc->send_io.mem.pool)
 		goto out1;
 
 	scnprintf(name, MAX_NAME_LEN, "smbdirect_recv_io_%p", info);
@@ -1472,17 +1475,17 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 				   sizeof(struct smbdirect_data_transfer)),
 		.usersize	= sp->max_recv_size - sizeof(struct smbdirect_data_transfer),
 	};
-	info->response_cache =
+	sc->recv_io.mem.cache =
 		kmem_cache_create(name,
 				  sizeof(struct smbdirect_recv_io) + sp->max_recv_size,
 				  &response_args, SLAB_HWCACHE_ALIGN);
-	if (!info->response_cache)
+	if (!sc->recv_io.mem.cache)
 		goto out2;
 
-	info->response_mempool =
+	sc->recv_io.mem.pool =
 		mempool_create(sp->recv_credit_max, mempool_alloc_slab,
-		       mempool_free_slab, info->response_cache);
-	if (!info->response_mempool)
+		       mempool_free_slab, sc->recv_io.mem.cache);
+	if (!sc->recv_io.mem.pool)
 		goto out3;
 
 	scnprintf(name, MAX_NAME_LEN, "smbd_%p", info);
@@ -1501,13 +1504,13 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 out5:
 	destroy_workqueue(info->workqueue);
 out4:
-	mempool_destroy(info->response_mempool);
+	mempool_destroy(sc->recv_io.mem.pool);
 out3:
-	kmem_cache_destroy(info->response_cache);
+	kmem_cache_destroy(sc->recv_io.mem.cache);
 out2:
-	mempool_destroy(info->request_mempool);
+	mempool_destroy(sc->send_io.mem.pool);
 out1:
-	kmem_cache_destroy(info->request_cache);
+	kmem_cache_destroy(sc->send_io.mem.cache);
 	return -ENOMEM;
 }
 
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index a8380bccf623..0d4d45428c85 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -105,15 +105,6 @@ struct smbd_connection {
 	struct workqueue_struct *workqueue;
 	struct delayed_work idle_timer_work;
 
-	/* Memory pool for preallocating buffers */
-	/* request pool for RDMA send */
-	struct kmem_cache *request_cache;
-	mempool_t *request_mempool;
-
-	/* response pool for RDMA receive */
-	struct kmem_cache *response_cache;
-	mempool_t *response_mempool;
-
 	/* for debug purposes */
 	unsigned int count_get_receive_buffer;
 	unsigned int count_put_receive_buffer;
-- 
2.43.0


