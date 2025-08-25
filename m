Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B7AB34D2B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1rVpPpc5vCLrOypQU51Q9vEEJcRgwRnJejcMWDl2WV4=; b=Q1LjlucRuk9bBcLJ9x0ZmCZu0w
	7SuldNZCFBDZYGCjTZzcOhpAJdgtjEc2WcR0LCMl7nbvXYTKJesB5+fT97f5Jz5MAfGVs7M4dThqD
	F5i1l2m1Pr4HoCnAfkqKFBW7xH9z60jhyL/4ylbQ1rF8++3aD4R2X4S4NExJWaJb9UrKcte+L03JH
	VsaeS61ejKFQgzdCETqXsJ7FYVBb/xRJEGCFceWefy5R38pF3hs1TM4p+TDk3d8S/RTv5cQ9VwwFP
	gBd0drRQS5WqIAzkVlTqFh9qt1bldWLQyBxr/DUchRshyA5xBdS3iRZ7QYOJBZu4QQeH7xG1afRBS
	FHdXqFNg==;
Received: from ip6-localhost ([::1]:46530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeIF-000S8u-CJ; Mon, 25 Aug 2025 20:59:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54844) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeEi-000Qls-IX
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1rVpPpc5vCLrOypQU51Q9vEEJcRgwRnJejcMWDl2WV4=; b=q8pfGUpsPto3Uxfn1+CqckEjir
 F1+lMzY/jITzGl390tTFP7AXQ6WJu0utyDngWL6Nil+K+LTBjTNGed/czVVZI3CLN7zA++oM7HjQn
 a7ifrh+AbeiYlnI2JneZXw4NGCR89yDp5PvvxPsSj3GOHHYMufLYw4XhuPSLO2MFnKsvp695dh4ta
 9clwcX9meIvQfye+KOGz1mzzi8UAhD3eNerNP/iJtkvCBkyNj1zLa/DyvJjFhsN5BVit01cSAknaR
 FMEnQQQQLFH8q+E21vXuMWaYO7BcuFjBwoTNBJL2w4rgXYIK87oWzsdI94J2g12DlidY54QiDLrf1
 +RFm2ZbB0zNvejtS0PkfFrVmOTJr6qzTabcwjGdSjJUGTOz3+q5RfxEwMktafDOWP1HuSN+xLH8Gc
 1838l5nsbMTOCrDJ6jCS5zmUu4dCBJA8HrhC87QYyhbbXHpa30/mjH+zKKG3gXJwnXABWr+Gx9nFP
 kicK7mv/lwiZswev9RPl7lEE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeEe-000m4p-2k; Mon, 25 Aug 2025 20:56:13 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 086/142] smb: server: make use of smbdirect_socket.{send,
 recv}_io.mem.{cache, pool}
Date: Mon, 25 Aug 2025 22:40:47 +0200
Message-ID: <5a28d89e75732756437e4736f6a91769c7f76860.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow common helper functions to be created later.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 50 ++++++++++++++++------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 57e1140d488e..c20052093b36 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -109,11 +109,6 @@ struct smb_direct_transport {
 	wait_queue_head_t	wait_send_credits;
 	wait_queue_head_t	wait_rw_credits;
 
-	mempool_t		*sendmsg_mempool;
-	struct kmem_cache	*sendmsg_cache;
-	mempool_t		*recvmsg_mempool;
-	struct kmem_cache	*recvmsg_cache;
-
 	wait_queue_head_t	wait_send_pending;
 	atomic_t		send_pending;
 
@@ -412,7 +407,7 @@ static struct smbdirect_send_io
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_send_io *msg;
 
-	msg = mempool_alloc(t->sendmsg_mempool, KSMBD_DEFAULT_GFP);
+	msg = mempool_alloc(sc->send_io.mem.pool, KSMBD_DEFAULT_GFP);
 	if (!msg)
 		return ERR_PTR(-ENOMEM);
 	msg->socket = sc;
@@ -436,7 +431,7 @@ static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
 					  msg->sge[i].addr, msg->sge[i].length,
 					  DMA_TO_DEVICE);
 	}
-	mempool_free(msg, t->sendmsg_mempool);
+	mempool_free(msg, sc->send_io.mem.pool);
 }
 
 static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
@@ -1789,22 +1784,23 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 
 static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
 	while ((recvmsg = get_free_recvmsg(t)))
-		mempool_free(recvmsg, t->recvmsg_mempool);
+		mempool_free(recvmsg, sc->recv_io.mem.pool);
 
-	mempool_destroy(t->recvmsg_mempool);
-	t->recvmsg_mempool = NULL;
+	mempool_destroy(sc->recv_io.mem.pool);
+	sc->recv_io.mem.pool = NULL;
 
-	kmem_cache_destroy(t->recvmsg_cache);
-	t->recvmsg_cache = NULL;
+	kmem_cache_destroy(sc->recv_io.mem.cache);
+	sc->recv_io.mem.cache = NULL;
 
-	mempool_destroy(t->sendmsg_mempool);
-	t->sendmsg_mempool = NULL;
+	mempool_destroy(sc->send_io.mem.pool);
+	sc->send_io.mem.pool = NULL;
 
-	kmem_cache_destroy(t->sendmsg_cache);
-	t->sendmsg_cache = NULL;
+	kmem_cache_destroy(sc->send_io.mem.cache);
+	sc->send_io.mem.cache = NULL;
 }
 
 static int smb_direct_create_pools(struct smb_direct_transport *t)
@@ -1816,35 +1812,35 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	struct smbdirect_recv_io *recvmsg;
 
 	snprintf(name, sizeof(name), "smbdirect_send_io_pool_%p", t);
-	t->sendmsg_cache = kmem_cache_create(name,
+	sc->send_io.mem.cache = kmem_cache_create(name,
 					     sizeof(struct smbdirect_send_io) +
 					      sizeof(struct smbdirect_negotiate_resp),
 					     0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!t->sendmsg_cache)
+	if (!sc->send_io.mem.cache)
 		return -ENOMEM;
 
-	t->sendmsg_mempool = mempool_create(sp->send_credit_target,
+	sc->send_io.mem.pool = mempool_create(sp->send_credit_target,
 					    mempool_alloc_slab, mempool_free_slab,
-					    t->sendmsg_cache);
-	if (!t->sendmsg_mempool)
+					    sc->send_io.mem.cache);
+	if (!sc->send_io.mem.pool)
 		goto err;
 
 	snprintf(name, sizeof(name), "smbdirect_recv_io_pool_%p", t);
-	t->recvmsg_cache = kmem_cache_create(name,
+	sc->recv_io.mem.cache = kmem_cache_create(name,
 					     sizeof(struct smbdirect_recv_io) +
 					     sp->max_recv_size,
 					     0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!t->recvmsg_cache)
+	if (!sc->recv_io.mem.cache)
 		goto err;
 
-	t->recvmsg_mempool =
+	sc->recv_io.mem.pool =
 		mempool_create(sp->recv_credit_max, mempool_alloc_slab,
-			       mempool_free_slab, t->recvmsg_cache);
-	if (!t->recvmsg_mempool)
+			       mempool_free_slab, sc->recv_io.mem.cache);
+	if (!sc->recv_io.mem.pool)
 		goto err;
 
 	for (i = 0; i < sp->recv_credit_max; i++) {
-		recvmsg = mempool_alloc(t->recvmsg_mempool, KSMBD_DEFAULT_GFP);
+		recvmsg = mempool_alloc(sc->recv_io.mem.pool, KSMBD_DEFAULT_GFP);
 		if (!recvmsg)
 			goto err;
 		recvmsg->socket = sc;
-- 
2.43.0


