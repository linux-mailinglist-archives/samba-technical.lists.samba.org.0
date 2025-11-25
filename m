Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAAFC86997
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=02PB0ckPBfNzrVb0UHSPqjEfp5N2bfzLjTqRlsZYImU=; b=uO5KN+k5LGt0XkKQK4wenHf3cO
	MCJ8ifqy/hveRc0t4sFEvQJBmAJzfH8hNNDXhFpowSLhZ2nlKb0gBLsHWqrYUUy2ZxOueSPR0KN3I
	5h5j2KCGjB1z9zphAV2JHmCsXzwguCSVqUH0RAsq79aUZEHt3vDUJeMmPWH397rHCtvUkjwsZ17nS
	d5ZI3O6HCF3P74D5KNLU6ht32yr5T4IRbENkqUmU3VntRXcnfpUKJsdAB4UclvPue8N4QW8N0zFc5
	8cPXWVIQrkZNLxUXr61Xcp8sYUnNLkgb8XHu1xI+UE97oCKG8zlmpVsRw757/EJcCmnaIY9L3/u1p
	zW6Q3J4A==;
Received: from ip6-localhost ([::1]:34896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxjy-00DFfF-0U; Tue, 25 Nov 2025 18:26:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63800) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgf-00DEkB-90
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=02PB0ckPBfNzrVb0UHSPqjEfp5N2bfzLjTqRlsZYImU=; b=n803GVwZ+gtPruwBSsAFUaX6cq
 uIfhr5Fy3j6NW2TIlPKxykLSgHlRp5tcqS6JjFp8czjextZei/vva0tLzchFYkboVaLZe8Nx3yaB8
 raFQUT40Oa6F173ZVv3cyZLnyYqRlc+4yakby1T2+7XngCoEOcLym+yUxxwWP0fYR4VcFgYggpTIW
 JvxR9GXTUJchH0l9oONMr8O9VSqY4xWIId35Ofq4w04L1jk+jwi7C4T6FB6fdReNkiEEriqPWYLLx
 YaObzWAEy1RFGZhChDzPUN9DGul3DcIl/PEdy8hphyQeO9WDjV4h9zb5vUxr8hcf2EAdNQrFsykdA
 3uLTDR2Jv+BvnLWSWvcL41YxQ0pxV6jvr3ReRxj+BaWswazFjQygWdZMEIgM6ow1MCwyL2Zf9Kth0
 rl5jgV/lKt5hjya2KkiGN9lJI6tsKCOElyS2FW8ZCPVgsRs6WvyXXC5kD8BRKVLqbU2EhQYcNg21A
 kmLWfdW+dHucqShLUt6BgvHO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdo-00FfHx-2W; Tue, 25 Nov 2025 18:19:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 119/145] smb: server: make use of functions from
 smbdirect_rw.c
Date: Tue, 25 Nov 2025 18:56:05 +0100
Message-ID: <08db88a35aca774f10670df485a867c1fff548a4.1764091285.git.metze@samba.org>
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

The copied code only got new names, some indentation/formatting changes,
some variable names are changed too.

They also only use struct smbdirect_socket instead of
struct smb_direct_transport.

But the logic is still the same.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 236 ++-------------------------------
 1 file changed, 11 insertions(+), 225 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 84ea45058cb5..a6afa7eefa20 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -253,6 +253,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sc->ib.poll_ctx = IB_POLL_WORKQUEUE;
 	sc->send_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	sc->recv_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
+	sc->rw_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	/*
 	 * from here we operate on the copy.
 	 */
@@ -808,23 +809,6 @@ static int wait_for_send_credits(struct smbdirect_socket *sc,
 						 1);
 }
 
-static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
-{
-	return smbdirect_socket_wait_for_credits(sc,
-						 SMBDIRECT_SOCKET_CONNECTED,
-						 -ENOTCONN,
-						 &sc->rw_io.credits.wait_queue,
-						 &sc->rw_io.credits.count,
-						 credits);
-}
-
-static int calc_rw_credits(struct smbdirect_socket *sc,
-			   char *buf, unsigned int len)
-{
-	return DIV_ROUND_UP(smbdirect_get_buf_page_count(buf, len),
-			    sc->rw_io.credits.num_pages);
-}
-
 static int smb_direct_create_header(struct smbdirect_socket *sc,
 				    int size, int remaining_data_length,
 				    struct smbdirect_send_io **sendmsg_out)
@@ -890,38 +874,6 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	return 0;
 }
 
-static int get_sg_list(void *buf, int size, struct scatterlist *sg_list, int nentries)
-{
-	bool high = is_vmalloc_addr(buf);
-	struct page *page;
-	int offset, len;
-	int i = 0;
-
-	if (size <= 0 || nentries < smbdirect_get_buf_page_count(buf, size))
-		return -EINVAL;
-
-	offset = offset_in_page(buf);
-	buf -= offset;
-	while (size > 0) {
-		len = min_t(int, PAGE_SIZE - offset, size);
-		if (high)
-			page = vmalloc_to_page(buf);
-		else
-			page = kmap_to_page(buf);
-
-		if (!sg_list)
-			return -EINVAL;
-		sg_set_page(sg_list, page, len, offset);
-		sg_list = sg_next(sg_list);
-
-		buf += PAGE_SIZE;
-		size -= len;
-		offset = 0;
-		i++;
-	}
-	return i;
-}
-
 static int post_sendmsg(struct smbdirect_socket *sc,
 			struct smbdirect_send_batch *send_ctx,
 			struct smbdirect_send_io *msg)
@@ -1171,185 +1123,16 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	return ret;
 }
 
-static void smb_direct_free_rdma_rw_msg(struct smb_direct_transport *t,
-					struct smbdirect_rw_io *msg,
-					enum dma_data_direction dir)
-{
-	struct smbdirect_socket *sc = &t->socket;
-
-	rdma_rw_ctx_destroy(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
-			    msg->sgt.sgl, msg->sgt.nents, dir);
-	sg_free_table_chained(&msg->sgt, SG_CHUNK_SIZE);
-	kfree(msg);
-}
-
-static void read_write_done(struct ib_cq *cq, struct ib_wc *wc,
-			    enum dma_data_direction dir)
-{
-	struct smbdirect_rw_io *msg =
-		container_of(wc->wr_cqe, struct smbdirect_rw_io, cqe);
-	struct smbdirect_socket *sc = msg->socket;
-
-	if (wc->status != IB_WC_SUCCESS) {
-		msg->error = -EIO;
-		pr_err("read/write error. opcode = %d, status = %s(%d)\n",
-		       wc->opcode, ib_wc_status_msg(wc->status), wc->status);
-		if (wc->status != IB_WC_WR_FLUSH_ERR)
-			smbdirect_socket_schedule_cleanup(sc, msg->error);
-	}
-
-	complete(msg->completion);
-}
-
-static void read_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	read_write_done(cq, wc, DMA_FROM_DEVICE);
-}
-
-static void write_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	read_write_done(cq, wc, DMA_TO_DEVICE);
-}
-
-static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
-				void *buf, int buf_len,
-				struct smbdirect_buffer_descriptor_v1 *desc,
-				unsigned int desc_len,
-				bool is_read)
-{
-	struct smbdirect_socket *sc = &t->socket;
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smbdirect_rw_io *msg, *next_msg;
-	int i, ret;
-	DECLARE_COMPLETION_ONSTACK(completion);
-	struct ib_send_wr *first_wr;
-	LIST_HEAD(msg_list);
-	char *desc_buf;
-	int credits_needed;
-	unsigned int desc_buf_len, desc_num = 0;
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-		return -ENOTCONN;
-
-	if (buf_len > sp->max_read_write_size)
-		return -EINVAL;
-
-	/* calculate needed credits */
-	credits_needed = 0;
-	desc_buf = buf;
-	for (i = 0; i < desc_len / sizeof(*desc); i++) {
-		if (!buf_len)
-			break;
-
-		desc_buf_len = le32_to_cpu(desc[i].length);
-		if (!desc_buf_len)
-			return -EINVAL;
-
-		if (desc_buf_len > buf_len) {
-			desc_buf_len = buf_len;
-			desc[i].length = cpu_to_le32(desc_buf_len);
-			buf_len = 0;
-		}
-
-		credits_needed += calc_rw_credits(sc, desc_buf, desc_buf_len);
-		desc_buf += desc_buf_len;
-		buf_len -= desc_buf_len;
-		desc_num++;
-	}
-
-	ksmbd_debug(RDMA, "RDMA %s, len %#x, needed credits %#x\n",
-		    str_read_write(is_read), buf_len, credits_needed);
-
-	ret = wait_for_rw_credits(sc, credits_needed);
-	if (ret < 0)
-		return ret;
-
-	/* build rdma_rw_ctx for each descriptor */
-	desc_buf = buf;
-	for (i = 0; i < desc_num; i++) {
-		msg = kzalloc(struct_size(msg, sg_list, SG_CHUNK_SIZE),
-			      KSMBD_DEFAULT_GFP);
-		if (!msg) {
-			ret = -ENOMEM;
-			goto out;
-		}
-
-		desc_buf_len = le32_to_cpu(desc[i].length);
-
-		msg->socket = sc;
-		msg->cqe.done = is_read ? read_done : write_done;
-		msg->completion = &completion;
-
-		msg->sgt.sgl = &msg->sg_list[0];
-		ret = sg_alloc_table_chained(&msg->sgt,
-					     smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
-					     msg->sg_list, SG_CHUNK_SIZE);
-		if (ret) {
-			ret = -ENOMEM;
-			goto free_msg;
-		}
-
-		ret = get_sg_list(desc_buf, desc_buf_len,
-				  msg->sgt.sgl, msg->sgt.orig_nents);
-		if (ret < 0)
-			goto free_table;
-
-		ret = rdma_rw_ctx_init(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
-				       msg->sgt.sgl,
-				       smbdirect_get_buf_page_count(desc_buf, desc_buf_len),
-				       0,
-				       le64_to_cpu(desc[i].offset),
-				       le32_to_cpu(desc[i].token),
-				       is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
-		if (ret < 0) {
-			pr_err("failed to init rdma_rw_ctx: %d\n", ret);
-			goto free_table;
-		}
-
-		list_add_tail(&msg->list, &msg_list);
-		desc_buf += desc_buf_len;
-	}
-
-	/* concatenate work requests of rdma_rw_ctxs */
-	first_wr = NULL;
-	list_for_each_entry_reverse(msg, &msg_list, list) {
-		first_wr = rdma_rw_ctx_wrs(&msg->rdma_ctx, sc->ib.qp, sc->ib.qp->port,
-					   &msg->cqe, first_wr);
-	}
-
-	ret = ib_post_send(sc->ib.qp, first_wr, NULL);
-	if (ret) {
-		pr_err("failed to post send wr for RDMA R/W: %d\n", ret);
-		goto out;
-	}
-
-	msg = list_last_entry(&msg_list, struct smbdirect_rw_io, list);
-	wait_for_completion(&completion);
-	ret = msg->error;
-out:
-	list_for_each_entry_safe(msg, next_msg, &msg_list, list) {
-		list_del(&msg->list);
-		smb_direct_free_rdma_rw_msg(t, msg,
-					    is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
-	}
-	atomic_add(credits_needed, &sc->rw_io.credits.count);
-	wake_up(&sc->rw_io.credits.wait_queue);
-	return ret;
-
-free_table:
-	sg_free_table_chained(&msg->sgt, SG_CHUNK_SIZE);
-free_msg:
-	kfree(msg);
-	goto out;
-}
-
 static int smb_direct_rdma_write(struct ksmbd_transport *t,
 				 void *buf, unsigned int buflen,
 				 struct smbdirect_buffer_descriptor_v1 *desc,
 				 unsigned int desc_len)
 {
-	return smb_direct_rdma_xmit(SMBD_TRANS(t), buf, buflen,
-				    desc, desc_len, false);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
+	struct smbdirect_socket *sc = &st->socket;
+
+	return smbdirect_connection_rdma_xmit(sc, buf, buflen,
+					      desc, desc_len, false);
 }
 
 static int smb_direct_rdma_read(struct ksmbd_transport *t,
@@ -1357,8 +1140,11 @@ static int smb_direct_rdma_read(struct ksmbd_transport *t,
 				struct smbdirect_buffer_descriptor_v1 *desc,
 				unsigned int desc_len)
 {
-	return smb_direct_rdma_xmit(SMBD_TRANS(t), buf, buflen,
-				    desc, desc_len, true);
+	struct smb_direct_transport *st = SMBD_TRANS(t);
+	struct smbdirect_socket *sc = &st->socket;
+
+	return smbdirect_connection_rdma_xmit(sc, buf, buflen,
+					      desc, desc_len, true);
 }
 
 static void smb_direct_disconnect(struct ksmbd_transport *t)
-- 
2.43.0


