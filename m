Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB0B34D62
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F2i2yVJ3JEEb2w+H6DOrBgIaraY/eUuM4fBPMj+Xg6k=; b=nAitAo+T1A5ykWYUEFrOUn7NjA
	gH8Zw+Mr4y5BGO3dZO+qXQnhtmos+dvGFi/EsX3eguCNAZqtYlaVDXPx3CH62cuVh/U/95WuW1Mww
	CvigytnIs99c2nNf+7DtCrXGVtEGHEpKXIfNwzSilsOynHFPERxV1mW9eq4sfJUP8Rh6LMAFHG0CW
	jrDPgm3t/FLvM/bJjWsvFmK2mj89lkhme93RTAdj9YjpLkBGYh5Mscg9Wvw+WZW6h37g0iVkvBhlB
	ViaPg11nnFACeZb2J2uZ3piFGoqoBDgI5iI2EgUunLzhKVSHL6unrTpYJpMaVr4znJnqoKzxrNlyI
	nqNxdr6w==;
Received: from ip6-localhost ([::1]:19196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeLE-000TS1-Sw; Mon, 25 Aug 2025 21:03:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16956) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeH6-000Rjl-8g
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=F2i2yVJ3JEEb2w+H6DOrBgIaraY/eUuM4fBPMj+Xg6k=; b=xHFDneBjf8E2MS45biAWFKplVG
 8jSCUJthwEOg+TA2uQgJODRGXsvxNupcMCYfQRbO5XgzJYNJsRaM/qc/JQxaoIVQdomeA7xjE/3ZC
 ykx19Nwnz9nNuakjG/AGC2qc7CIWwqlUDJnEppla/hfe8nHnQ6stJkJnPaFRgVZ3LQ2aRuL0Y/CnS
 abrZqAtfQsu1NDyD45pFhgPHpobOu7ZvJxJ1x1GTYUl1P0aEPSX3lexzT5Rn6yVFc8lQ5h1kEC/EN
 sZ43UaT6VACPh0xwIQYLoGDK4ijCA/+6xFYnDSKaJdvgZHieDTT35hixM4XRKUnJYwNMsbG1zUXXq
 TeDsg9NtF2axNGT/CchMe3AJSEHSZF31OcNU1foumLmvbKZ7lIkAR3sE4OVy4szFL192hucKWeyvN
 Iyfau9eUhAP9ImgNpCAEoBwyo3cziTh1exU2wUUEX+N+4TfevlhepgLJ9aDL+ShaYFkxpk3uSCkhb
 bBQIOPRQRaRq0Lw1K9y/a4t+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeH4-000mbM-0p; Mon, 25 Aug 2025 20:58:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 102/142] smb: server: make use of struct smbdirect_rw_io
Date: Mon, 25 Aug 2025 22:41:03 +0200
Message-ID: <3e213cf04939f452690ac1dc65d8a2685e8fd127.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow us to create functions in the common
smbdirect code to be used by the server in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 37 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f04a3d1d0395..3a0244943dc7 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -113,17 +113,6 @@ struct smb_direct_transport {
 
 static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops;
 
-struct smb_direct_rdma_rw_msg {
-	struct smb_direct_transport	*t;
-	struct ib_cqe		cqe;
-	int			status;
-	struct completion	*completion;
-	struct list_head	list;
-	struct rdma_rw_ctx	rw_ctx;
-	struct sg_table		sgt;
-	struct scatterlist	sg_list[];
-};
-
 void init_smbd_max_io_size(unsigned int sz)
 {
 	sz = clamp_val(sz, SMBD_MIN_IOSIZE, SMBD_MAX_IOSIZE);
@@ -1275,12 +1264,12 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 }
 
 static void smb_direct_free_rdma_rw_msg(struct smb_direct_transport *t,
-					struct smb_direct_rdma_rw_msg *msg,
+					struct smbdirect_rw_io *msg,
 					enum dma_data_direction dir)
 {
 	struct smbdirect_socket *sc = &t->socket;
 
-	rdma_rw_ctx_destroy(&msg->rw_ctx, sc->ib.qp, sc->ib.qp->port,
+	rdma_rw_ctx_destroy(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
 			    msg->sgt.sgl, msg->sgt.nents, dir);
 	sg_free_table_chained(&msg->sgt, SG_CHUNK_SIZE);
 	kfree(msg);
@@ -1289,12 +1278,14 @@ static void smb_direct_free_rdma_rw_msg(struct smb_direct_transport *t,
 static void read_write_done(struct ib_cq *cq, struct ib_wc *wc,
 			    enum dma_data_direction dir)
 {
-	struct smb_direct_rdma_rw_msg *msg = container_of(wc->wr_cqe,
-							  struct smb_direct_rdma_rw_msg, cqe);
-	struct smb_direct_transport *t = msg->t;
+	struct smbdirect_rw_io *msg =
+		container_of(wc->wr_cqe, struct smbdirect_rw_io, cqe);
+	struct smbdirect_socket *sc = msg->socket;
+	struct smb_direct_transport *t =
+		container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS) {
-		msg->status = -EIO;
+		msg->error = -EIO;
 		pr_err("read/write error. opcode = %d, status = %s(%d)\n",
 		       wc->opcode, ib_wc_status_msg(wc->status), wc->status);
 		if (wc->status != IB_WC_WR_FLUSH_ERR)
@@ -1322,7 +1313,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 {
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smb_direct_rdma_rw_msg *msg, *next_msg;
+	struct smbdirect_rw_io *msg, *next_msg;
 	int i, ret;
 	DECLARE_COMPLETION_ONSTACK(completion);
 	struct ib_send_wr *first_wr;
@@ -1379,7 +1370,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 
 		desc_buf_len = le32_to_cpu(desc[i].length);
 
-		msg->t = t;
+		msg->socket = sc;
 		msg->cqe.done = is_read ? read_done : write_done;
 		msg->completion = &completion;
 
@@ -1401,7 +1392,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 			goto out;
 		}
 
-		ret = rdma_rw_ctx_init(&msg->rw_ctx, sc->ib.qp, sc->ib.qp->port,
+		ret = rdma_rw_ctx_init(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
 				       msg->sgt.sgl,
 				       get_buf_page_count(desc_buf, desc_buf_len),
 				       0,
@@ -1422,7 +1413,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 	/* concatenate work requests of rdma_rw_ctxs */
 	first_wr = NULL;
 	list_for_each_entry_reverse(msg, &msg_list, list) {
-		first_wr = rdma_rw_ctx_wrs(&msg->rw_ctx, sc->ib.qp, sc->ib.qp->port,
+		first_wr = rdma_rw_ctx_wrs(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
 					   &msg->cqe, first_wr);
 	}
 
@@ -1432,9 +1423,9 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 		goto out;
 	}
 
-	msg = list_last_entry(&msg_list, struct smb_direct_rdma_rw_msg, list);
+	msg = list_last_entry(&msg_list, struct smbdirect_rw_io, list);
 	wait_for_completion(&completion);
-	ret = msg->status;
+	ret = msg->error;
 out:
 	list_for_each_entry_safe(msg, next_msg, &msg_list, list) {
 		list_del(&msg->list);
-- 
2.43.0


