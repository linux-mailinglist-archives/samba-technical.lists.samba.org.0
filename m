Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCBC86870
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:15:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=95FAC3ZGdYRpXiIz4ivOxQTDqC8aL9rXP770FloPiLg=; b=Pcc8weQ3kFF6W6oZ7xwAYDrHtX
	QO11UnOPXUfj0m0XGgQK2dLaA6qyTq5xQJ1GIOybMi33VDnTrrFY8gfn288DDqBCUjkAnJszQyXSM
	GTU+Awfd79gUIsj0JUQn/04rmQKuLTliqNKQRVFvMqxkQQKgfgy+yX63LwZMFvK+Dvs3FJy6scDjH
	yLxruivGInBVUooJ5wjHe8tclCwCVxt+i85zUq1rSYZAiQEohYssnQ9Ww5+myMl8Gg7zzJEWoyYNH
	hkIu/IFsOJNNsscdf6wGwd+Zq1u+kXDDjLCc/nOk6q5ZOUXF8q8Tp7jtf9nN+zcOgMxK2sgPzT0ec
	Yv1kZ/Yg==;
Received: from ip6-localhost ([::1]:40974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxZr-00DCgV-0B; Tue, 25 Nov 2025 18:15:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44072) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTt-00DAWl-23
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=95FAC3ZGdYRpXiIz4ivOxQTDqC8aL9rXP770FloPiLg=; b=AoU7HFSlmM36JxJEtVsiKL/HpX
 TRnIyY6+92zexRdc5C2JDpg/bEhBqFLhuUlcddJnMZo3mgmPUy9wz6oLA9zCQB2GfG+zTU1OCW55k
 s3nTZ8/nIiGRVYe4nj5WD+SFoF6Ro64YsIiKcFHl3aI4lsQ9n1CKT8iK0JEovY4zwA07N+SsgRexH
 Dkc+hrjwDzp4iF/htfl32pjXipVkdZWoV4OjphyWu++74Vr3GoIEv/E5A4M1tFlCk5fiXZFObU6qQ
 qnpKgK4jPxAQ4RIuWAZQw+rkQ7hmgUjbPmI8s/MGXsZTUQjowdv8OiY8A4XEPaeEbaRmb8mjleNOa
 flxZ/CThJrBdoK1fSk7kcNhXdNC0x1UnvURQqccdRCGlljxbRtEf5mcuudCwGYtAFQ1M2SpnnPVhJ
 V09IP7b/zUjv3cGWTMmm5Ccjzdt116Tiamrso2FnTxfukufGs5yUHYndy3b0b1LbS3Hk2JegZ//s2
 MaA1pjfyEPN9CGAUQ66ItMy6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQM-00FdjJ-3B; Tue, 25 Nov 2025 18:05:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 073/145] smb: client: make use of
 smbdirect_connection_{create, destroy}_mem_pools()
Date: Tue, 25 Nov 2025 18:55:19 +0100
Message-ID: <5605f3afaa20a1618f4716808dd3193e06bbf1be.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The main logical differences are the following:

We now don't use smbdirect_connection_get_recv_io() on cleanup,
instead it uses list_for_each_entry_safe()...

For the smbdirect_recv_io payload we expose the whole payload including
the smbdirect_data_transfer header as documentation says data_offset = 0
and data_length != 0 would be valid, while the existing client code
requires data_offset >= 24.

The smbdirect_send_io cache includes header space for
sizeof(struct smbdirect_negotiate_resp) = 32 bytes
instead of sizeof(struct smbdirect_data_transfer) = 24 bytes.
If this ever becomes a problem, we can allocate separate
space for the smbdirect_negotiate_resp in the server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 131 +-------------------------------------
 1 file changed, 3 insertions(+), 128 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 6c8844c4edce..30a0a2cb112c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -23,9 +23,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 	return &sc->parameters;
 }
 
-static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf);
-static void destroy_receive_buffers(struct smbdirect_socket *sc);
-
 static int smbd_post_recv(
 		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
@@ -1228,46 +1225,6 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 	return rc;
 }
 
-/* Preallocate all receive buffer on transport establishment */
-static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf)
-{
-	struct smbdirect_recv_io *response;
-	int i;
-
-	for (i = 0; i < num_buf; i++) {
-		response = mempool_alloc(sc->recv_io.mem.pool, GFP_KERNEL);
-		if (!response)
-			goto allocate_failed;
-
-		response->socket = sc;
-		response->sge.length = 0;
-		INIT_WORK(&response->complex_work, __smbdirect_socket_disabled_work);
-		disable_work_sync(&response->complex_work);
-		list_add_tail(&response->list, &sc->recv_io.free.list);
-	}
-
-	return 0;
-
-allocate_failed:
-	while (!list_empty(&sc->recv_io.free.list)) {
-		response = list_first_entry(
-				&sc->recv_io.free.list,
-				struct smbdirect_recv_io, list);
-		list_del(&response->list);
-
-		mempool_free(response, sc->recv_io.mem.pool);
-	}
-	return -ENOMEM;
-}
-
-static void destroy_receive_buffers(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *response;
-
-	while ((response = smbdirect_connection_get_recv_io(sc)))
-		mempool_free(response, sc->recv_io.mem.pool);
-}
-
 static void send_immediate_empty_message(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -1348,9 +1305,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	} while (response);
 	sc->recv_io.reassembly.data_length = 0;
 
-	log_rdma_event(INFO, "free receive buffers\n");
-	destroy_receive_buffers(sc);
-
 	log_rdma_event(INFO, "freeing mr list\n");
 	destroy_mr_list(sc);
 
@@ -1360,11 +1314,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	rdma_destroy_id(sc->rdma.cm_id);
 
 	/* free mempools */
-	mempool_destroy(sc->send_io.mem.pool);
-	kmem_cache_destroy(sc->send_io.mem.cache);
-
-	mempool_destroy(sc->recv_io.mem.pool);
-	kmem_cache_destroy(sc->recv_io.mem.cache);
+	smbdirect_connection_destroy_mem_pools(sc);
 
 	sc->status = SMBDIRECT_SOCKET_DESTROYED;
 
@@ -1410,81 +1360,6 @@ int smbd_reconnect(struct TCP_Server_Info *server)
 	return -ENOENT;
 }
 
-static void destroy_caches(struct smbdirect_socket *sc)
-{
-	destroy_receive_buffers(sc);
-	mempool_destroy(sc->recv_io.mem.pool);
-	kmem_cache_destroy(sc->recv_io.mem.cache);
-	mempool_destroy(sc->send_io.mem.pool);
-	kmem_cache_destroy(sc->send_io.mem.cache);
-}
-
-#define MAX_NAME_LEN	80
-static int allocate_caches(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	char name[MAX_NAME_LEN];
-	int rc;
-
-	if (WARN_ON_ONCE(sp->max_recv_size < sizeof(struct smbdirect_data_transfer)))
-		return -ENOMEM;
-
-	scnprintf(name, MAX_NAME_LEN, "smbdirect_send_io_%p", sc);
-	sc->send_io.mem.cache =
-		kmem_cache_create(
-			name,
-			sizeof(struct smbdirect_send_io) +
-				sizeof(struct smbdirect_data_transfer),
-			0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!sc->send_io.mem.cache)
-		return -ENOMEM;
-
-	sc->send_io.mem.pool =
-		mempool_create(sp->send_credit_target, mempool_alloc_slab,
-			mempool_free_slab, sc->send_io.mem.cache);
-	if (!sc->send_io.mem.pool)
-		goto out1;
-
-	scnprintf(name, MAX_NAME_LEN, "smbdirect_recv_io_%p", sc);
-
-	struct kmem_cache_args response_args = {
-		.align		= __alignof__(struct smbdirect_recv_io),
-		.useroffset	= (offsetof(struct smbdirect_recv_io, packet) +
-				   sizeof(struct smbdirect_data_transfer)),
-		.usersize	= sp->max_recv_size - sizeof(struct smbdirect_data_transfer),
-	};
-	sc->recv_io.mem.cache =
-		kmem_cache_create(name,
-				  sizeof(struct smbdirect_recv_io) + sp->max_recv_size,
-				  &response_args, SLAB_HWCACHE_ALIGN);
-	if (!sc->recv_io.mem.cache)
-		goto out2;
-
-	sc->recv_io.mem.pool =
-		mempool_create(sp->recv_credit_max, mempool_alloc_slab,
-		       mempool_free_slab, sc->recv_io.mem.cache);
-	if (!sc->recv_io.mem.pool)
-		goto out3;
-
-	rc = allocate_receive_buffers(sc, sp->recv_credit_max);
-	if (rc) {
-		log_rdma_event(ERR, "failed to allocate receive buffers\n");
-		goto out4;
-	}
-
-	return 0;
-
-out4:
-	mempool_destroy(sc->recv_io.mem.pool);
-out3:
-	kmem_cache_destroy(sc->recv_io.mem.cache);
-out2:
-	mempool_destroy(sc->send_io.mem.pool);
-out1:
-	kmem_cache_destroy(sc->send_io.mem.cache);
-	return -ENOMEM;
-}
-
 /* Create a SMBD connection, called by upper layer */
 static struct smbd_connection *_smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr, int port)
@@ -1676,7 +1551,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	log_rdma_event(INFO, "rdma_connect connected\n");
 
-	rc = allocate_caches(sc);
+	rc = smbdirect_connection_create_mem_pools(sc);
 	if (rc) {
 		log_rdma_event(ERR, "cache allocation failed\n");
 		goto allocate_cache_failed;
@@ -1715,7 +1590,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 negotiation_failed:
 	disable_delayed_work_sync(&sc->idle.timer_work);
-	destroy_caches(sc);
+	smbdirect_connection_destroy_mem_pools(sc);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
 	wait_event(sc->status_wait,
-- 
2.43.0


