Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172FB1CB2A
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vhTYWwxfvXunYn6P9l08hDA8xnCy6i8jeNv8JXYv/1U=; b=2v1ialo9qzmqODbei170FBF21K
	UcTkfGR+2Fp4YsyPM3kx34Gmh4KIFPLh/Jz5voR8t7FcGXywqcSAOojHq6arKSRukxSS1PyrhyXhM
	HRXTa85mIo+ZvjEOUd+DzRhbyMCitmC/eOZ4voinxlhqNDc9APtZ8/YPx9udCADuIV8XhvIl0Hs/h
	6OybNhS31RzlO2v8ZV1lIkQ8Ia1M0kkYdVOcea+s/M45rGT6b2M/bXwbykPpYx8GuRIjtfkKA6Bhq
	57Vhmi4tnzTdSjjd0R/1UO+k7zBIbk8Jv7AASEldBf4SwbosmjiYui0hO7sx2S00aotpAPha09GtU
	uwN71Izg==;
Received: from ip6-localhost ([::1]:64058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji7G-00ESfU-48; Wed, 06 Aug 2025 17:39:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63594) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5j-00ES5S-VR
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vhTYWwxfvXunYn6P9l08hDA8xnCy6i8jeNv8JXYv/1U=; b=I+dUxqaSfxN7PZ5VeMAH2xqFKR
 nHOW7cEH489NQxNa1lci4O/VB58HaILvRwmDH/wG2Ux+Ca0gt+OKP6soGG+7DSnxRPlsrcXRjB2nV
 sHGJbhmnQM5NqaSfVPs5UmtJLIKCZP6SbdBHa5iUyy/Z0jTQE05q/8PDUAw6k4EgbFL+S53j1n26N
 iIzJuZcSLxIISXAhuGCNY9aHBswMwBiomfkxLiVRFnsJw9D+VBNu3W1FyDFC8dLRDrcaSjI5SwQ31
 PTq7vps9Qd1MyIvH/ZFpF9k8YcJkTENUO5CIHm5eufGIrYvGSkToYF8nqmLSE2Fv49rSTHP+gg91Y
 KdJaS1Uh8ftbkMoWs/wyb1dZrMx8pvttjPkOMoLRXTp+jLFVm7ybDGwQFB3ZT3vo9flOx31UCGGJr
 bkcUGJkmSsx37L13R/GD4Pte61iMQ7sQb6Na7l8AH0noN3ivMSvsyGAH+70jcY65Eyg7D/9AmeimU
 v7tyRTP+KSDUjvF3S0irkMWM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5h-001Ot6-2F; Wed, 06 Aug 2025 17:38:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 17/18] smb: server: make use of struct smbdirect_send_io
Date: Wed,  6 Aug 2025 19:36:03 +0200
Message-ID: <ce38d423fb341d1cf86851b41dad4d18e8dae49b.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is already used by the client and will allow us
to use common helper functions soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 81 +++++++++++++++-------------------
 1 file changed, 36 insertions(+), 45 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8021225df200..a7671db57705 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -36,8 +36,6 @@
 /* SMB_DIRECT negotiation timeout in seconds */
 #define SMB_DIRECT_NEGOTIATE_TIMEOUT		120
 
-#define SMB_DIRECT_MAX_SEND_SGES		6
-
 /*
  * Default maximum number of RDMA read/write outstanding on this connection
  * This value is possibly decreased during QP creation on hardware limit
@@ -139,16 +137,6 @@ struct smb_direct_send_ctx {
 	unsigned int		remote_key;
 };
 
-struct smb_direct_sendmsg {
-	struct smb_direct_transport	*transport;
-	struct ib_send_wr	wr;
-	struct list_head	list;
-	int			num_sge;
-	struct ib_sge		sge[SMB_DIRECT_MAX_SEND_SGES];
-	struct ib_cqe		cqe;
-	u8			packet[];
-};
-
 struct smb_direct_rdma_rw_msg {
 	struct smb_direct_transport	*t;
 	struct ib_cqe		cqe;
@@ -411,22 +399,23 @@ static void free_transport(struct smb_direct_transport *t)
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
-static struct smb_direct_sendmsg
+static struct smbdirect_send_io
 *smb_direct_alloc_sendmsg(struct smb_direct_transport *t)
 {
-	struct smb_direct_sendmsg *msg;
+	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_send_io *msg;
 
 	msg = mempool_alloc(t->sendmsg_mempool, KSMBD_DEFAULT_GFP);
 	if (!msg)
 		return ERR_PTR(-ENOMEM);
-	msg->transport = t;
-	INIT_LIST_HEAD(&msg->list);
+	msg->socket = sc;
+	INIT_LIST_HEAD(&msg->sibling_list);
 	msg->num_sge = 0;
 	return msg;
 }
 
 static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
-				    struct smb_direct_sendmsg *msg)
+				    struct smbdirect_send_io *msg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int i;
@@ -822,12 +811,14 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	struct smb_direct_sendmsg *sendmsg, *sibling;
+	struct smbdirect_send_io *sendmsg, *sibling;
 	struct smb_direct_transport *t;
+	struct smbdirect_socket *sc;
 	struct list_head *pos, *prev, *end;
 
-	sendmsg = container_of(wc->wr_cqe, struct smb_direct_sendmsg, cqe);
-	t = sendmsg->transport;
+	sendmsg = container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
+	sc = sendmsg->socket;
+	t = container_of(sc, struct smb_direct_transport, socket);
 
 	ksmbd_debug(RDMA, "Send completed. status='%s (%d)', opcode=%d\n",
 		    ib_wc_status_msg(wc->status), wc->status,
@@ -846,13 +837,13 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	/* iterate and free the list of messages in reverse. the list's head
 	 * is invalid.
 	 */
-	for (pos = &sendmsg->list, prev = pos->prev, end = sendmsg->list.next;
+	for (pos = &sendmsg->sibling_list, prev = pos->prev, end = sendmsg->sibling_list.next;
 	     prev != end; pos = prev, prev = prev->prev) {
-		sibling = container_of(pos, struct smb_direct_sendmsg, list);
+		sibling = container_of(pos, struct smbdirect_send_io, sibling_list);
 		smb_direct_free_sendmsg(t, sibling);
 	}
 
-	sibling = container_of(pos, struct smb_direct_sendmsg, list);
+	sibling = container_of(pos, struct smbdirect_send_io, sibling_list);
 	smb_direct_free_sendmsg(t, sibling);
 }
 
@@ -900,18 +891,18 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 				      struct smb_direct_send_ctx *send_ctx,
 				      bool is_last)
 {
-	struct smb_direct_sendmsg *first, *last;
+	struct smbdirect_send_io *first, *last;
 	int ret;
 
 	if (list_empty(&send_ctx->msg_list))
 		return 0;
 
 	first = list_first_entry(&send_ctx->msg_list,
-				 struct smb_direct_sendmsg,
-				 list);
+				 struct smbdirect_send_io,
+				 sibling_list);
 	last = list_last_entry(&send_ctx->msg_list,
-			       struct smb_direct_sendmsg,
-			       list);
+			       struct smbdirect_send_io,
+			       sibling_list);
 
 	last->wr.send_flags = IB_SEND_SIGNALED;
 	last->wr.wr_cqe = &last->cqe;
@@ -929,7 +920,7 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 		atomic_add(send_ctx->wr_cnt, &t->send_credits);
 		wake_up(&t->wait_send_credits);
 		list_for_each_entry_safe(first, last, &send_ctx->msg_list,
-					 list) {
+					 sibling_list) {
 			smb_direct_free_sendmsg(t, first);
 		}
 	}
@@ -988,11 +979,11 @@ static int calc_rw_credits(struct smb_direct_transport *t,
 
 static int smb_direct_create_header(struct smb_direct_transport *t,
 				    int size, int remaining_data_length,
-				    struct smb_direct_sendmsg **sendmsg_out)
+				    struct smbdirect_send_io **sendmsg_out)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_sendmsg *sendmsg;
+	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_data_transfer *packet;
 	int header_length;
 	int ret;
@@ -1095,7 +1086,7 @@ static int get_mapped_sg_list(struct ib_device *device, void *buf, int size,
 
 static int post_sendmsg(struct smb_direct_transport *t,
 			struct smb_direct_send_ctx *send_ctx,
-			struct smb_direct_sendmsg *msg)
+			struct smbdirect_send_io *msg)
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int i;
@@ -1115,14 +1106,14 @@ static int post_sendmsg(struct smb_direct_transport *t,
 		msg->wr.wr_cqe = NULL;
 		msg->wr.send_flags = 0;
 		if (!list_empty(&send_ctx->msg_list)) {
-			struct smb_direct_sendmsg *last;
+			struct smbdirect_send_io *last;
 
 			last = list_last_entry(&send_ctx->msg_list,
-					       struct smb_direct_sendmsg,
-					       list);
+					       struct smbdirect_send_io,
+					       sibling_list);
 			last->wr.next = &msg->wr;
 		}
-		list_add_tail(&msg->list, &send_ctx->msg_list);
+		list_add_tail(&msg->sibling_list, &send_ctx->msg_list);
 		send_ctx->wr_cnt++;
 		return 0;
 	}
@@ -1139,9 +1130,9 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 {
 	struct smbdirect_socket *sc = &t->socket;
 	int i, j, ret;
-	struct smb_direct_sendmsg *msg;
+	struct smbdirect_send_io *msg;
 	int data_length;
-	struct scatterlist sg[SMB_DIRECT_MAX_SEND_SGES - 1];
+	struct scatterlist sg[SMBDIRECT_SEND_IO_MAX_SGE - 1];
 
 	ret = wait_for_send_credits(t, send_ctx);
 	if (ret)
@@ -1162,16 +1153,16 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 		struct ib_sge *sge;
 		int sg_cnt;
 
-		sg_init_table(sg, SMB_DIRECT_MAX_SEND_SGES - 1);
+		sg_init_table(sg, SMBDIRECT_SEND_IO_MAX_SGE - 1);
 		sg_cnt = get_mapped_sg_list(sc->ib.dev,
 					    iov[i].iov_base, iov[i].iov_len,
-					    sg, SMB_DIRECT_MAX_SEND_SGES - 1,
+					    sg, SMBDIRECT_SEND_IO_MAX_SGE - 1,
 					    DMA_TO_DEVICE);
 		if (sg_cnt <= 0) {
 			pr_err("failed to map buffer\n");
 			ret = -ENOMEM;
 			goto err;
-		} else if (sg_cnt + msg->num_sge > SMB_DIRECT_MAX_SEND_SGES) {
+		} else if (sg_cnt + msg->num_sge > SMBDIRECT_SEND_IO_MAX_SGE) {
 			pr_err("buffer not fitted into sges\n");
 			ret = -E2BIG;
 			ib_dma_unmap_sg(sc->ib.dev, sg, sg_cnt,
@@ -1565,7 +1556,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 {
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_sendmsg *sendmsg;
+	struct smbdirect_send_io *sendmsg;
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
 
@@ -1713,7 +1704,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	 */
 	sp->max_send_size = smb_direct_max_send_size;
 	max_send_sges = DIV_ROUND_UP(sp->max_send_size, PAGE_SIZE) + 3;
-	if (max_send_sges > SMB_DIRECT_MAX_SEND_SGES) {
+	if (max_send_sges > SMBDIRECT_SEND_IO_MAX_SGE) {
 		pr_err("max_send_size %d is too large\n", sp->max_send_size);
 		return -EINVAL;
 	}
@@ -1817,9 +1808,9 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	int i;
 	struct smbdirect_recv_io *recvmsg;
 
-	snprintf(name, sizeof(name), "smb_direct_rqst_pool_%p", t);
+	snprintf(name, sizeof(name), "smbdirect_send_io_pool_%p", t);
 	t->sendmsg_cache = kmem_cache_create(name,
-					     sizeof(struct smb_direct_sendmsg) +
+					     sizeof(struct smbdirect_send_io) +
 					      sizeof(struct smbdirect_negotiate_resp),
 					     0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!t->sendmsg_cache)
-- 
2.43.0


