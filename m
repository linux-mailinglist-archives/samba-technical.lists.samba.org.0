Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DFB1B840
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ajTGmmY0/GIe8VbaNEaHIfCski11ctNv2pkwy81Uirw=; b=xb7BnzJSd6aJSVGZM2A4vKV38B
	/95TmbffuCXwXSM5X00Gueg6Z0iDRCP4IP6WTyQrO5e7OIHNOE6AwadCJ/3RN/H2sQKx3Dee8Nee8
	KLy/5gRwgWDkQOuuSUt6+NZeIWY8H8Jbe7GTVKg32w5bMZqD9O6sDY4e6QqbN87Ac3hnPyTXnhvZa
	6W6axz1IxxtxhmfvWnVKqruLNE1Ip0QFaNGsq2YQB9nf1q7+zYmtESYrMGDyBuve4IG703+5agnVp
	ZOIPKq6ar4+zHWMrsS3LT6o2nuzLh1gQlEdC/yc+BSG/SGkX/8BWGNNT6E72hJAITRAqlfGNeraZF
	D5cXmuDA==;
Received: from ip6-localhost ([::1]:34640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKKn-00ENzi-SC; Tue, 05 Aug 2025 16:16:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51126) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKKX-00ENvM-TG
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ajTGmmY0/GIe8VbaNEaHIfCski11ctNv2pkwy81Uirw=; b=cX7K4SAJ7gI0iirvIn9FKRphoq
 uqV2rQLc6h+gG8fWdWqsXCdOMdDa61dUUkpieV2tlDl0di1Iy1GJ6nH3BMYf2D6E390/uwdgofWds
 woTGpsAsTd6YwgJQEs/hqkcA0gFRBlze9eB1emcbQ67thSGGswXZJu5tfqrdQqTjY0mTluFjTq5PF
 ee7qpGBLxogpXUc7Jfck16JlgcXEb27LoVKVaF7/jXAmEBo2lrGtAm9iM3xq/2blnxYuQW5raAtJK
 NLMWBLnckBA6WfM20z1eZHRwllkZeJfoU4c8utLX02MfwBAg37Vlh4vmBp08Lpt/TQpHcmlHJd7Nh
 0taCir5ElFKP4urbB/yBbvMnLYE0BZgpBYgqe82o7UB0HMdGp1mQpn1uCvcyWf9BLHHvBRXseZMFf
 8Xa5/OqpNHEz87m3z5jRvL4qZwlL2W+PCVFH2FgM2eu8ojplHMC+gm/ftCZUN1aUcVAOqWCJ4EuAF
 hKYuxTzIwgMfKvcdUDqDQ5oZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKKR-001A1m-2B; Tue, 05 Aug 2025 16:15:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 15/17] smb: server: make use of struct smbdirect_recv_io
Date: Tue,  5 Aug 2025 18:13:35 +0200
Message-ID: <31197cad3912a169cae119b4036bc724597954a1.1754409478.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
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
---
 fs/smb/server/transport_rdma.c | 61 +++++++++++++++-------------------
 1 file changed, 26 insertions(+), 35 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 14d338a380a3..26d70396b0c1 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -161,15 +161,6 @@ struct smb_direct_sendmsg {
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
@@ -212,7 +203,7 @@ smb_trans_direct_transfort(struct ksmbd_transport *t)
 }
 
 static inline void
-*smb_direct_recvmsg_payload(struct smb_direct_recvmsg *recvmsg)
+*smbdirect_recv_io_payload(struct smbdirect_recv_io *recvmsg)
 {
 	return (void *)recvmsg->packet;
 }
@@ -225,14 +216,14 @@ static inline bool is_receive_credit_post_required(int receive_credits,
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
@@ -241,7 +232,7 @@ smb_direct_recvmsg *get_free_recvmsg(struct smb_direct_transport *t)
 }
 
 static void put_recvmsg(struct smb_direct_transport *t,
-			struct smb_direct_recvmsg *recvmsg)
+			struct smbdirect_recv_io *recvmsg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 
@@ -259,7 +250,7 @@ static void put_recvmsg(struct smb_direct_transport *t,
 }
 
 static void enqueue_reassembly(struct smb_direct_transport *t,
-			       struct smb_direct_recvmsg *recvmsg,
+			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
 {
 	spin_lock(&t->reassembly_queue_lock);
@@ -276,11 +267,11 @@ static void enqueue_reassembly(struct smb_direct_transport *t,
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
@@ -380,7 +371,7 @@ static void smb_direct_free_transport(struct ksmbd_transport *kt)
 static void free_transport(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	wake_up_interruptible(&t->wait_send_credits);
 
@@ -458,9 +449,9 @@ static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
 	mempool_free(msg, t->sendmsg_mempool);
 }
 
-static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
+static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
 {
-	struct smbdirect_socket *sc = &recvmsg->transport->socket;
+	struct smbdirect_socket *sc = recvmsg->socket;
 
 	switch (sc->recv_io.expected) {
 	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
@@ -509,13 +500,13 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 
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
@@ -627,7 +618,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 }
 
 static int smb_direct_post_recv(struct smb_direct_transport *t,
-				struct smb_direct_recvmsg *recvmsg)
+				struct smbdirect_recv_io *recvmsg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
@@ -666,7 +657,7 @@ static int smb_direct_post_recv(struct smb_direct_transport *t,
 static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	struct smbdirect_data_transfer *data_transfer;
 	int to_copy, to_read, data_read, offset;
 	u32 data_length, remaining_data_length, data_offset;
@@ -703,7 +694,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		offset = st->first_entry_offset;
 		while (data_read < size) {
 			recvmsg = get_first_reassembly(st);
-			data_transfer = smb_direct_recvmsg_payload(recvmsg);
+			data_transfer = smbdirect_recv_io_payload(recvmsg);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
 				le32_to_cpu(data_transfer->remaining_data_length);
@@ -796,7 +787,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 {
 	struct smb_direct_transport *t = container_of(work,
 		struct smb_direct_transport, post_recv_credits_work.work);
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	int receive_credits, credits = 0;
 	int ret;
 
@@ -1677,7 +1668,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int ret;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
 
@@ -1806,7 +1797,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 
 static void smb_direct_destroy_pools(struct smb_direct_transport *t)
 {
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	while ((recvmsg = get_free_recvmsg(t)))
 		mempool_free(recvmsg, t->recvmsg_mempool);
@@ -1830,7 +1821,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[80];
 	int i;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 
 	snprintf(name, sizeof(name), "smb_direct_rqst_pool_%p", t);
 	t->sendmsg_cache = kmem_cache_create(name,
@@ -1846,9 +1837,9 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
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
@@ -1866,7 +1857,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 		recvmsg = mempool_alloc(t->recvmsg_mempool, KSMBD_DEFAULT_GFP);
 		if (!recvmsg)
 			goto err;
-		recvmsg->transport = t;
+		recvmsg->socket = sc;
 		recvmsg->sge.length = 0;
 		list_add(&recvmsg->list, &t->recvmsg_queue);
 	}
@@ -1971,7 +1962,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_recvmsg *recvmsg;
+	struct smbdirect_recv_io *recvmsg;
 	struct smbdirect_negotiate_req *req;
 	int ret;
 
-- 
2.43.0


