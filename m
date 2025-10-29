Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7359FC1AF1A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aQXu48+uAFB+m8QSjCtLYXJdv6UJUQ7He1KhTqpBIFA=; b=BhtmXEgVowP8L8lPupSIxP1UiT
	4eTiXN4srWCyhgmeh3vNI4JJFatQjJ/jOU60DKlCQrjiWw40ZnG6AMh0JjMaM4ArtEzPILTBbQdmv
	F62LzJ22IfQY23vBYcIKD285Qwktefn7Ov7cMs9jyXgjRyJuvfs5Xu1zSRE0sf/jtIOVv1x3HTyL0
	V+hiAWt1MZIe87PThthbUih0S1ILruPcxuazSC+6b8GGHyCjTyQcmI3Yp+katykbIVvKlJ/i21jlL
	SnR4zMyoigIcXb0IQvcMYodwxd1mpbPqmpgmEs/VBLOiPLGeqXTdHKFfPB0rMAGb+GCcnkrwJH2Se
	K6VmyZ3w==;
Received: from ip6-localhost ([::1]:27186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Zu-009EmR-0k; Wed, 29 Oct 2025 13:51:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31638) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ju-0098xc-O7
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=aQXu48+uAFB+m8QSjCtLYXJdv6UJUQ7He1KhTqpBIFA=; b=IFV5XgIrhP36I9zYe9y5Ru6co+
 0IrCvUApg4x5Cy9eOmVHVFB3Jdkd5iP1pN4lXMuh/baXRk+MbEKJZTSPF63DYRTAwDRbRMmxIWj4X
 bG0K38SgZEcGnT2iJ1+oi50YRD+WPjF1AK+RdU3reS2T2SSgCdllMWfto/Nl0RdccJZYzcjllRc1U
 dwAdNEjFrFMie2PoyaaWdN0sR2OR34zyb+NhvMFrFa+wp4wd09HsCDyXEa394R8ml8xjlBKw0Vup3
 yFTNj5RCw5Xb3GSGrx+6KGFHQP/dodDGjqnZRidJcd5WAk6HeYtRr2Lh3veEoVKNn58/j6WFV3NeH
 7jwd8rnxIHvY74iy56d5ZjRO+nIKgEWQ4qu35Za6gzo65eEPEr67HAwhbJir+GOOZTQ/WHhitIEGg
 qPR6lvzHb/A0H/n7SbKLhBKei8Komc3rrUx8EEqObOSStwBIv1MKIQ7AUiXtPx7904jh5cBPYoGE+
 Z5MXzkciyQdUPE5QXLV/VRNR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jr-00Bd59-2D; Wed, 29 Oct 2025 13:34:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 120/127] smb: server: let smbdirect_map_sges_from_iter()
 truncate the message boundary
Date: Wed, 29 Oct 2025 14:21:38 +0100
Message-ID: <552f8053a987f856896e8659bb384999d87dde74.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

smbdirect_map_sges_from_iter() already handles the case that only
a limited number of sges are available. Its return value
is data_length and the remaining bytes in the iter are
remaining_data_length.

This is now much easier and will allow us to share
more code with the client soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 151 +++++++--------------------------
 1 file changed, 31 insertions(+), 120 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 463520e1c07c..d888b5396cd6 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -199,7 +199,7 @@ unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt)
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct iov_iter *iter,
-				     size_t *remaining_data_length);
+				     u32 remaining_data_length);
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
@@ -209,7 +209,7 @@ static void smb_direct_send_immediate_work(struct work_struct *work)
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return;
 
-	smb_direct_post_send_data(sc, NULL, NULL, NULL);
+	smb_direct_post_send_data(sc, NULL, NULL, 0);
 }
 
 static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
@@ -646,22 +646,26 @@ static int post_sendmsg(struct smbdirect_socket *sc,
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct iov_iter *iter,
-				     size_t *_remaining_data_length)
+				     u32 remaining_data_length)
 {
 	const struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *msg;
 	struct smbdirect_data_transfer *packet;
 	size_t header_length;
 	u16 new_credits = 0;
-	u32 remaining_data_length = 0;
 	u32 data_length = 0;
 	int ret;
 
 	if (iter) {
 		header_length = sizeof(struct smbdirect_data_transfer);
+		if (WARN_ON_ONCE(remaining_data_length == 0 ||
+				 iov_iter_count(iter) > remaining_data_length))
+			return -EINVAL;
 	} else {
 		/* If this is a packet without payload, don't send padding */
 		header_length = offsetof(struct smbdirect_data_transfer, padding);
+		if (WARN_ON_ONCE(remaining_data_length))
+			return -EINVAL;
 	}
 
 	ret = wait_for_send_lcredit(sc, send_ctx);
@@ -672,14 +676,6 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	if (ret)
 		goto credit_failed;
 
-	if (iter)
-		data_length = iov_iter_count(iter);
-
-	if (_remaining_data_length) {
-		*_remaining_data_length -= data_length;
-		remaining_data_length = *_remaining_data_length;
-	}
-
 	msg = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(msg)) {
 		ret = PTR_ERR(msg);
@@ -708,14 +704,14 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
 			.direction	= DMA_TO_DEVICE,
 		};
+		size_t payload_len = umin(iov_iter_count(iter),
+					  sp->max_send_size - sizeof(*packet));
 
-		ret = smbdirect_map_sges_from_iter(iter, data_length, &extract);
+		ret = smbdirect_map_sges_from_iter(iter, payload_len, &extract);
 		if (ret < 0)
 			goto err;
-		if (WARN_ON_ONCE(ret != data_length)) {
-			ret = -EIO;
-			goto err;
-		}
+		data_length = ret;
+		remaining_data_length -= data_length;
 		msg->num_sge = extract.num_sge;
 	}
 
@@ -768,13 +764,9 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	struct smb_direct_transport *st = SMBD_TRANS(t);
 	struct smbdirect_socket *sc = &st->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	size_t remaining_data_length;
-	size_t iov_idx;
-	size_t iov_ofs;
-	size_t max_iov_size = sp->max_send_size -
-			sizeof(struct smbdirect_data_transfer);
 	int ret;
 	struct smbdirect_send_batch send_ctx;
+	struct iov_iter iter;
 	int error = 0;
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
@@ -783,112 +775,31 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	//FIXME: skip RFC1002 header..
 	if (WARN_ON_ONCE(niovs <= 1 || iov[0].iov_len != 4))
 		return -EINVAL;
-	buflen -= 4;
-	iov_idx = 1;
-	iov_ofs = 0;
-
-	remaining_data_length = buflen;
-	ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=%u\n", buflen);
-
-	smb_direct_send_ctx_init(&send_ctx, need_invalidate, remote_key);
-	while (remaining_data_length) {
-		struct kvec vecs[SMBDIRECT_SEND_IO_MAX_SGE - 1]; /* minus smbdirect hdr */
-		size_t possible_bytes = max_iov_size;
-		size_t possible_vecs;
-		size_t bytes = 0;
-		size_t nvecs = 0;
-		struct iov_iter iter;
-
-		/*
-		 * For the last message remaining_data_length should be
-		 * have been 0 already!
-		 */
-		if (WARN_ON_ONCE(iov_idx >= niovs)) {
-			error = -EINVAL;
-			goto done;
-		}
+	iov_iter_kvec(&iter, ITER_SOURCE, iov, niovs, buflen);
+	iov_iter_advance(&iter, 4);
 
-		/*
-		 * We have 2 factors which limit the arguments we pass
-		 * to smb_direct_post_send_data():
-		 *
-		 * 1. The number of supported sges for the send,
-		 *    while one is reserved for the smbdirect header.
-		 *    And we currently need one SGE per page.
-		 * 2. The number of negotiated payload bytes per send.
-		 */
-		possible_vecs = min_t(size_t, ARRAY_SIZE(vecs), niovs - iov_idx);
-
-		while (iov_idx < niovs && possible_vecs && possible_bytes) {
-			struct kvec *v = &vecs[nvecs];
-			int page_count;
-
-			v->iov_base = ((u8 *)iov[iov_idx].iov_base) + iov_ofs;
-			v->iov_len = min_t(size_t,
-					   iov[iov_idx].iov_len - iov_ofs,
-					   possible_bytes);
-			page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
-			if (page_count > possible_vecs) {
-				/*
-				 * If the number of pages in the buffer
-				 * is to much (because we currently require
-				 * one SGE per page), we need to limit the
-				 * length.
-				 *
-				 * We know possible_vecs is at least 1,
-				 * so we always keep the first page.
-				 *
-				 * We need to calculate the number extra
-				 * pages (epages) we can also keep.
-				 *
-				 * We calculate the number of bytes in the
-				 * first page (fplen), this should never be
-				 * larger than v->iov_len because page_count is
-				 * at least 2, but adding a limitation feels
-				 * better.
-				 *
-				 * Then we calculate the number of bytes (elen)
-				 * we can keep for the extra pages.
-				 */
-				size_t epages = possible_vecs - 1;
-				size_t fpofs = offset_in_page(v->iov_base);
-				size_t fplen = min_t(size_t, PAGE_SIZE - fpofs, v->iov_len);
-				size_t elen = min_t(size_t, v->iov_len - fplen, epages*PAGE_SIZE);
-
-				v->iov_len = fplen + elen;
-				page_count = smbdirect_get_buf_page_count(v->iov_base, v->iov_len);
-				if (WARN_ON_ONCE(page_count > possible_vecs)) {
-					/*
-					 * Something went wrong in the above
-					 * logic...
-					 */
-					error = -EINVAL;
-					goto done;
-				}
-			}
-			possible_vecs -= page_count;
-			nvecs += 1;
-			possible_bytes -= v->iov_len;
-			bytes += v->iov_len;
-
-			iov_ofs += v->iov_len;
-			if (iov_ofs >= iov[iov_idx].iov_len) {
-				iov_idx += 1;
-				iov_ofs = 0;
-			}
-		}
+	/*
+	 * The size must fit into the negotiated
+	 * fragmented send size.
+	 */
+	if (iov_iter_count(&iter) > sp->max_fragmented_send_size)
+		return -EMSGSIZE;
 
-		iov_iter_kvec(&iter, ITER_SOURCE, vecs, nvecs, bytes);
+	ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=%zu\n",
+		    iov_iter_count(&iter));
 
-		ret = smb_direct_post_send_data(sc, &send_ctx,
-						&iter, &remaining_data_length);
+	smb_direct_send_ctx_init(&send_ctx, need_invalidate, remote_key);
+	while (iov_iter_count(&iter)) {
+		ret = smb_direct_post_send_data(sc,
+						&send_ctx,
+						&iter,
+						iov_iter_count(&iter));
 		if (unlikely(ret)) {
 			error = ret;
-			goto done;
+			break;
 		}
 	}
 
-done:
 	ret = smb_direct_flush_send_list(sc, &send_ctx, true);
 	if (unlikely(!ret && error))
 		ret = error;
-- 
2.43.0


