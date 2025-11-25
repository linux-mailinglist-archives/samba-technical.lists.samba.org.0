Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3059AC86B20
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ghht5wrUIFsWjZl0MqxftkB15/dyfPbflN3Wt3owW2I=; b=i98ntiJ/t+TceFAHPKL5th+AYg
	cor/O15TXFyDskRrjRStFPo8lLXjyTGycLD8SkJ5n1jAXvGnZIotdLOdpZZxkJHpa3byn8JvitC9N
	PlxBJwfMQCso47NeXO856jXsSPPZuTKb4GPOQHvrH5+cpb7y4N00aev/g2NkKKV1QcOqdAlV5B5rX
	a3JFyYMs/FA83VuYm6DNcchNm1B646LU5Sry7fBYYdnIf+reMP33xDRUqWf/wWJNU2WaDImgRnRGy
	ZmVQhm/y/1ebJTyDBFRQoYbyEKUVCXh6VZP4RYR4UTaqJpQZATqXher/VIq3L21rq54ij9J+00fx9
	0UvgkrAQ==;
Received: from ip6-localhost ([::1]:45692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNy30-00DIEc-Fi; Tue, 25 Nov 2025 18:45:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33114) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNy2t-00DIEF-3X
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ghht5wrUIFsWjZl0MqxftkB15/dyfPbflN3Wt3owW2I=; b=q53zH27zWGswLUUS/cIoZvyrb6
 LGcEHuckrwUG2R+IKEz7UleY7Hkhx5C6JLjS1w9su6p/KYL000MP3X16z04IxKsR62WKX+f3FgUny
 dIidVLEgJwA+TMM8bxlydrLn0RYd859JvAaPO4bEzVpBk962aPzYXJSHk+6bt2Zy8x9Jl7GUsFpYK
 wTkOUCpCOl1xhqZEcBLbMkzirXoSyuzUcWbe16wzQKrgdEQAGKkj+WnpIEHVq/VPuoBWE7n59CM0M
 o88NJL6HQ0HCqUNCCkk1yPlIUbW2J29w1RYMv9uzR+ZfStp+o06o0JgeqH0z2Tv7RYyWXtyfde9eR
 Oujp+SBzzfw4lDHsHMQmJUIn3YmUAbxCy2Z60Q7AYplxNszVG+AMbW61xOkwrY6lUpHs6APWJW6qA
 k9l2cLiuPGRGKF1Rm6jmnZp2EgM9Q6NyD8pBa/JfUx7gdgdwvuRN/nXXoIcvaT+MwB/x7Zl/zuegY
 KpTmShG4GYMnjekcefhZaY0D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxWA-00FeSy-0W; Tue, 25 Nov 2025 18:11:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 109/145] smb: server: make use of
 smbdirect_connection_{create, destroy}_mem_pools()
Date: Tue, 25 Nov 2025 18:55:55 +0100
Message-ID: <acb080c1751c2ce3ec6b2e2006dadc7e38f82382.1764091285.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 78 ++--------------------------------
 1 file changed, 3 insertions(+), 75 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 3b324b42d009..6cbd81406e94 100644
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
 
@@ -1747,78 +1747,6 @@ static int smb_direct_init_params(struct smbdirect_socket *sc)
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
-		INIT_WORK(&recvmsg->complex_work, __smbdirect_socket_disabled_work);
-		disable_work_sync(&recvmsg->complex_work);
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
@@ -2116,7 +2044,7 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 		return ret;
 	}
 
-	ret = smb_direct_create_pools(sc);
+	ret = smbdirect_connection_create_mem_pools(sc);
 	if (ret) {
 		pr_err("Can't init RDMA pool: %d\n", ret);
 		return ret;
-- 
2.43.0


