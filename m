Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 676C4B34D1A
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xKZa72PlZCp4v+2A1/oQGKIwR8lQdzoB1vIlvma6bIs=; b=ie5hpAh86K9xI0Bj46lRbTN+NA
	tvfcx87zh4U4zzlSCp9V5gvoCzZDyeavSEp8GJrHgEThjuXGbRIMpd6Suz2CKXk1kt36wKGFayHx3
	7eeoVHEwDkZ+6eMhp/NKeX8OpIF1y5Ci7mdmX0P9QOagg0lZm7MwNsqFum772OOIMkwj3tygsT2zo
	Lm+Kj7Fuh6xxBNuBVb6HdJijlV5K1rxUQDCG0kKklOBEtUxqBC4R4md4LzOJY7w55kGDmaLXuWkwi
	cea+23No9J98aLvgMp6zvcMTvvJXxsFCEfimp3GK+xRF2Wx43RwqfjcveO+C+8pykbT0ZrFaTz1V2
	QAkqU/0g==;
Received: from ip6-localhost ([::1]:61944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeHG-000RkX-Tm; Mon, 25 Aug 2025 20:58:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32772) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeDp-000QQN-Er
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xKZa72PlZCp4v+2A1/oQGKIwR8lQdzoB1vIlvma6bIs=; b=CMF/4Bq7+uy5Jy6w9tBvKz2Eht
 gSaR2qufuuDB8snCWG0YM6tzSuCKhO6A/4Sp8J3H0E5emjmvlKjQM47hrskTl9NBub7GVL6cjiyN2
 N0TBw1y9KIjLHgz6nwdoLpGCnAJ0jefLkRAZ9q51dXHBdfpwjwS9FgtgbP/urpNPIWrnmh9w6OXtu
 UJh7+RCXdLLD9OLvDZleVbjDNZireIPmcgGADHzlWfv8Tlq9lfHGiN16zvJheNxyAUIuFRpkn2gKH
 ji0Wz+ATd5z1t50sYQ6fXTfHrW4HRux632kjGB1hU3uH8OEAJGyMTW6Vs8W2DEwBiC6KYUq5mh8Dl
 7b7TMCjg+Uzmnj7a9dHYF6FaPCp+LiGS56vJrIxCmXW3s6ool6IwLZ4fh1ORBowBy91aa0wy7aEiN
 0+UYR1UZ7c0vnsakoUfpAVMpHXnF7qbj4IghpOpm8czS0oPQ652Qf5jVGA+PxPYQ2WX5e15qTt2vf
 4txYigMNt8rkH2qsejiiMkyt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeDj-000lvV-1t; Mon, 25 Aug 2025 20:55:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 081/142] smb: server: make use of struct smbdirect_recv_io
Date: Mon, 25 Aug 2025 22:40:42 +0200
Message-ID: <661bc075874374711a55b18b103ac7015a7ac103.1756139607.git.metze@samba.org>
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

This will allow us to move helper functions into common code soon
as the client already uses smbdirect_recv_io.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 61 +++++++++++++++-------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 2cf6941a643d..edc7968d46fc 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -165,15 +165,6 @@ struct smb_direct_sendmsg {
 	u8			packet[];
 };
 
-struct smb_direct_recvmsg {
-	struct smb_direct_transport	*transport;
-	struct list_head	list;
-	struct ib_sge		sge;
-	struct ib_cqe		cqe;
-	bool			first_segment;
-	u8			packet[];
-};
-
 struct smb_direct_rdma_rw_msg {
 	struct smb_direct_transport	*t;
 	struct ib_cqe		cqe;
@@ -216,7 +207,7 @@ smb_trans_direct_transfort(struct ksmbd_transport *t)
 }
 
 static inline void
-*smb_direct_recvmsg_payload(struct smb_direct_recvmsg *recvmsg)
+*smbdirect_recv_io_payload(struct smbdirect_recv_io *recvmsg)
 {
 	return (void *)recvmsg->packet;
 }
@@ -229,14 +220,14 @@ static inline bool is_receive_credit_post_required(int receive_credits,
 }
 
 static struct
-smb_direct_recvmsg *get_free_recvmsg(struct smb_direct_transport *t)
+smbdirect_recv_io *get_free_recvmsg(struct smb_direct_transport *t)
 {
-	struct smb_direct_recvmsg *recvmsg = NULL;
+	struct smbdirect_recv_io *recvmsg = NULL;
 
 	spin_lock(&t->recvmsg_queue_lock);
 	if (!list_empty(&t->recvmsg_queue)) {
 		recvmsg = list_first_entry(&t->recvmsg_queue,
-					   struct smb_direct_recvmsg,
+					   struct smbdirect_recv_io,
 					   list);
 		list_del(&recvmsg->list);
 	}
@@ -245,7 +236,7 @@ smb_direct_recvmsg *get_free_recvmsg(struct smb_direct_transport *t)
 }
 
 static void put_recvmsg(struct smb_direct_transport *t,
-			struct smb_direct_recvmsg *recvmsg)
+			struct smbdirect_recv_io *recvmsg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 
@@ -263,7 +254,7 @@ static void put_recvmsg(struct smb_direct_transport *t,
 }
 
 static void enqueue_reassembly(struct smb_direct_transport *t,
-			       struct smb_direct_recvmsg *recvmsg,
+			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
 {
 	spin_lock(&t->reassembly_queue_lock);
@@ -280,11 +271,11 @@ static void enqueue_reassembly(struct smb_direct_transport *t,
 	spin_unlock(&t->reassembly_queue_lock);
 }
 
-static struct smb_direct_recvmsg *get_first_reassembly(struct smb_direct_transport *t)
+static struct smbdirect_recv_io *get_first_reassembly(struct smb_direct_transport *t)
 {
 	if (!list_empty(&t->reassembly_queue))
 		return list_first_entry(&t->reassembly_queue,
-				struct smb_direct_recvmsg, list);
+				struct smbdirect_recv_io, list);
 	else
 		return NULL;
 }
@@ -387,7 +378,7 @@ static void smb_direct_free_transport(struct ksmbd_transport *kt)
 static void free_transport(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	wake_up_interruptible(&t->wait_send_credits);
 
@@ -465,9 +456,9 @@ static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
 	mempool_free(msg, t->sendmsg_mempool);
 }
 
-static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
+static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
 {
-	struct smbdirect_socket *sc = &recvmsg->transport->socket;
+	struct smbdirect_socket *sc = recvmsg->socket;
 
 	switch (sc->recv_io.expected) {
 	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
@@ -516,13 +507,13 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
 
-	recvmsg = container_of(wc->wr_cqe, struct smb_direct_recvmsg, cqe);
-	t = recvmsg->transport;
-	sc = &t->socket;
+	recvmsg = container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
+	sc = recvmsg->socket;
+	t = container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
 		put_recvmsg(t, recvmsg);
@@ -634,7 +625,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 }
 
 static int smb_direct_post_recv(struct smb_direct_transport *t,
-				struct smb_direct_recvmsg *recvmsg)
+				struct smbdirect_recv_io *recvmsg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
@@ -673,7 +664,7 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	struct smbdirect_data_transfer *data_transfer;
 	int to_copy, to_read, data_read, offset;
 	u32 data_length, remaining_data_length, data_offset;
@@ -710,7 +701,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		offset = st->first_entry_offset;
 		while (data_read < size) {
 			recvmsg = get_first_reassembly(st);
-			data_transfer = smb_direct_recvmsg_payload(recvmsg);
+			data_transfer = smbdirect_recv_io_payload(recvmsg);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
 				le32_to_cpu(data_transfer->remaining_data_length);
@@ -803,7 +794,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 {
 	struct smb_direct_transport *t = container_of(work,
 		struct smb_direct_transport, post_recv_credits_work.work);
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	int receive_credits, credits = 0;
 	int ret;
 
@@ -1684,7 +1675,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int ret;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
 
@@ -1813,7 +1804,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 
 static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 {
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	while ((recvmsg = get_free_recvmsg(t)))
 		mempool_free(recvmsg, t->recvmsg_mempool);
@@ -1837,7 +1828,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[80];
 	int i;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	snprintf(name, sizeof(name), "smb_direct_rqst_pool_%p", t);
 	t->sendmsg_cache = kmem_cache_create(name,
@@ -1853,9 +1844,9 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	if (!t->sendmsg_mempool)
 		goto err;
 
-	snprintf(name, sizeof(name), "smb_direct_resp_%p", t);
+	snprintf(name, sizeof(name), "smbdirect_recv_io_pool_%p", t);
 	t->recvmsg_cache = kmem_cache_create(name,
-					     sizeof(struct smb_direct_recvmsg) +
+					     sizeof(struct smbdirect_recv_io) +
 					     sp->max_recv_size,
 					     0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!t->recvmsg_cache)
@@ -1873,7 +1864,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 		recvmsg = mempool_alloc(t->recvmsg_mempool, KSMBD_DEFAULT_GFP);
 		if (!recvmsg)
 			goto err;
-		recvmsg->transport = t;
+		recvmsg->socket = sc;
 		recvmsg->sge.length = 0;
 		list_add(&recvmsg->list, &t->recvmsg_queue);
 	}
@@ -1978,7 +1969,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	struct smbdirect_negotiate_req *req;
 	int ret;
 
-- 
2.43.0


