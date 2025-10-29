Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C8C1AE4E
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cyE40zN8p+hnxqMWBmHhn8DwD3WxBsCMiG4WMRAX4CQ=; b=Bw4YciRkRBgbVegAPDUkGNuxK7
	8Dnff5CZdG3eKKGVA2OnfpH8NKefr0uR4QEUTR4oO3Ui5aME6mUXYlQzLxzF2eUsqS6Tkhf+gaGV3
	kIVfJtJaqkFqccJABCo/lbKxRj2R5hqyIzQLmsUKBgxfVb1Mf7U3KBkpJLI1Ufy1SRSZuuRjfEcBs
	9Gx4tNMBKqvhryJPOpvDqs/F0oNmYBINooH9MZ/deHxyvQclmaQoXPOOmBZYWJGCnY4RW3Sq6pQtV
	JvtcOisdZjtOEuVGw05OqwgEVF7AupjXM4KTGlhpzOO5amTfrcFSXh3tPkCIWQ8C/dD0eqkcLlL1s
	tE/9QXlQ==;
Received: from ip6-localhost ([::1]:24818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6WL-009DSg-T2; Wed, 29 Oct 2025 13:47:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59928) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IK-0098PQ-LH
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cyE40zN8p+hnxqMWBmHhn8DwD3WxBsCMiG4WMRAX4CQ=; b=hjqUeFnCOnIYm6kOpC/ThaPsRa
 +kSRmx6rRjkS4NZAwdk9QFhwct8QrWLXhv3AW5+uuYTzZhygaipyS/OTYClB5hUyxd3yhUBK7XEUG
 tHAUgeXM+esZmL2QNesJAS42Dz6jZdOcbTmAhhnZ95jyJ+Sbirzx8vd2Up53SVDkfSeywb5nEkr97
 Gu9hnJFeeLFpsaiR1aocT8qlQFvRWJ1lYLd5ohD2BTli7DluNbpM0NQ6q52Js+z2U0INuz35lkM+A
 jWQ024poDexV4i0skfrI+msft9dyHB/c9D3xn3rMa4NAK7NjSMcoXRdl40Li0RsebQs7hODZ9Rafr
 vr3f3SpGtu7FCyzspMJaZpff1LwObElg6Adf1KhWG/LL/U7wvuzhCja0zU+jf7BzwBX3Kz0OwKygq
 PcE7AffTs+dgQMD7natnGu0PMyc5j/ZmjvvyYKAVNIJ0kPxLIhNX8BoHcEq2b03udirQJRwCk0Z7m
 wYWK0qShQpQYlMw0dcJ4tSSf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IH-00BcpJ-2G; Wed, 29 Oct 2025 13:32:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 103/127] smb: server: make use of
 smbdirect_connection_{create, destroy}_mem_pools()
Date: Wed, 29 Oct 2025 14:21:21 +0100
Message-ID: <b9cf44de30ca9348998c61a540dbfdf6363080f2.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This were based on smb_direct_{create,destroy}_pools() in the server.

The main logical differences are the following:

We now don't use smbdirect_connection_get_recv_io() on cleanup,
instead it uses list_for_each_entry_safe()...

We don't generate warnings if smbdirect_recv_io payload
is copied into userspace buffers. This doesn't happen
in the server anyway.

And it uses list_add_tail() just to let me feel
better when looking at the code...

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 76 ++--------------------------------
 1 file changed, 3 insertions(+), 73 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index aff7ac3054bc..3c36c4c0580d 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -202,7 +202,6 @@ static inline int get_buf_page_count(void *buf, int size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
-static void smb_direct_destroy_pools(struct smbdirect_socket *sc);
 static void smb_direct_post_recv_credits(struct work_struct *work);
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
@@ -259,6 +258,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 				     smb_direct_logging_needed,
 				     smb_direct_logging_vaprintf);
 	sc->send_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
+	sc->recv_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	/*
 	 * from here we operate on the copy.
 	 */
@@ -351,7 +351,7 @@ static void free_transport(struct smb_direct_transport *t)
 		rdma_destroy_id(sc->rdma.cm_id);
 	}
 
-	smb_direct_destroy_pools(sc);
+	smbdirect_connection_destroy_mem_pools(sc);
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
@@ -1716,76 +1716,6 @@ static int smb_direct_init_params(struct smbdirect_socket *sc)
 	return 0;
 }
 
-static void smb_direct_destroy_pools(struct smbdirect_socket *sc)
-{
-	struct smbdirect_recv_io *recvmsg;
-
-	while ((recvmsg = smbdirect_connection_get_recv_io(sc)))
-		mempool_free(recvmsg, sc->recv_io.mem.pool);
-
-	mempool_destroy(sc->recv_io.mem.pool);
-	sc->recv_io.mem.pool = NULL;
-
-	kmem_cache_destroy(sc->recv_io.mem.cache);
-	sc->recv_io.mem.cache = NULL;
-
-	mempool_destroy(sc->send_io.mem.pool);
-	sc->send_io.mem.pool = NULL;
-
-	kmem_cache_destroy(sc->send_io.mem.cache);
-	sc->send_io.mem.cache = NULL;
-}
-
-static int smb_direct_create_pools(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	char name[80];
-	int i;
-	struct smbdirect_recv_io *recvmsg;
-
-	snprintf(name, sizeof(name), "smbdirect_send_io_pool_%p", sc);
-	sc->send_io.mem.cache = kmem_cache_create(name,
-					     sizeof(struct smbdirect_send_io) +
-					      sizeof(struct smbdirect_negotiate_resp),
-					     0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!sc->send_io.mem.cache)
-		return -ENOMEM;
-
-	sc->send_io.mem.pool = mempool_create(sp->send_credit_target,
-					    mempool_alloc_slab, mempool_free_slab,
-					    sc->send_io.mem.cache);
-	if (!sc->send_io.mem.pool)
-		goto err;
-
-	snprintf(name, sizeof(name), "smbdirect_recv_io_pool_%p", sc);
-	sc->recv_io.mem.cache = kmem_cache_create(name,
-					     sizeof(struct smbdirect_recv_io) +
-					     sp->max_recv_size,
-					     0, SLAB_HWCACHE_ALIGN, NULL);
-	if (!sc->recv_io.mem.cache)
-		goto err;
-
-	sc->recv_io.mem.pool =
-		mempool_create(sp->recv_credit_max, mempool_alloc_slab,
-			       mempool_free_slab, sc->recv_io.mem.cache);
-	if (!sc->recv_io.mem.pool)
-		goto err;
-
-	for (i = 0; i < sp->recv_credit_max; i++) {
-		recvmsg = mempool_alloc(sc->recv_io.mem.pool, KSMBD_DEFAULT_GFP);
-		if (!recvmsg)
-			goto err;
-		recvmsg->socket = sc;
-		recvmsg->sge.length = 0;
-		list_add(&recvmsg->list, &sc->recv_io.free.list);
-	}
-
-	return 0;
-err:
-	smb_direct_destroy_pools(sc);
-	return -ENOMEM;
-}
-
 static u32 smb_direct_rdma_rw_send_wrs(struct ib_device *dev, const struct ib_qp_init_attr *attr)
 {
 	/*
@@ -2083,7 +2013,7 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 		return ret;
 	}
 
-	ret = smb_direct_create_pools(sc);
+	ret = smbdirect_connection_create_mem_pools(sc);
 	if (ret) {
 		pr_err("Can't init RDMA pool: %d\n", ret);
 		return ret;
-- 
2.43.0


