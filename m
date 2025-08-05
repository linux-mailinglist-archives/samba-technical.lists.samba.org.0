Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B91B1B81C
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8GwEC7hRFHKsviZ32lm5plSOJQJSPboCtc2hziEAOsM=; b=rOCezFDBmQYclF2vXJZAbL42vn
	09bCZaCRObbe8XIv2a+SbAoK65LAhryJzYK5j7CIOHrcMIRS2kueExebObClPVQj3cnZc0sva7GzC
	Ga77AiMwVrwJiaofff/EZgLTIbuz0B/qz5oR1TjWJ9V6NQCEIewuKsnwtdRVJDAApaNcMFlqoqFC6
	kiB+NNwFm02lin7xdI+63sKJFt9wKdB8+dGa356y2aaGLTI31sbW4DvAhwKIgn8wKx4q7L0/DHc+Z
	cnRYPmyQo/WsXk8RwoaodUDrVzAdmeiotFcg4cDcOJueg0ZAR2R5VNkNTrc+wIVv9IyJNBwzIv0Bu
	5//ZBB/w==;
Received: from ip6-localhost ([::1]:58918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKH7-00EN0L-58; Tue, 05 Aug 2025 16:12:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53566) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGv-00EMxC-9k
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8GwEC7hRFHKsviZ32lm5plSOJQJSPboCtc2hziEAOsM=; b=njWtkBLpdfrt2zUecw/WNGVo43
 zfK+ZKS0GmyxZgdIEmRjEHTyNz5+XejRz3fyIfPHzGmNfdvt76a0ULsDx4BHapgHltEIFHnclJVVq
 4WOKRCoL7iCgG2FkEQ+ZNKXhCPFWbmNmcVHa+/vjPL/2Krb7bTQ4sdpiv8zqR/sNnzWXn1X6kj0+5
 Mt4ONpvH02LE5Ma94DD3Nem9DkFo9r1CwtlQH+pTJ+yAcLuXLGlHwTr0ZQ3nBVKJyf5hVi+Sak34P
 p1hd6Np+lU2/v0/Xyb+nJMDhi8g7NUA4TG2J2TLWi10TZ/1P+JX9FUf4cl4rws8bEVhWZIQja5YLU
 aCUBdL2Cx9GwbBlMS6dQpc5SByfLwDfn8+ejn2fnu4t7FSAlH0M00BsWgkCI6EjRqFl441ntEssLM
 VKI/tIGGKVRVzus3DusHNZ1IJCRTGgBJMGFIjqix2x8FjhRLWSUZo5XYbTxwN/EE+JyevaHZVJV8u
 YV05nze3TItzZoFKsNQpU/Hr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKGt-0019a4-0k; Tue, 05 Aug 2025 16:12:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 03/17] smb: client: make use of
 smbdirect_socket->recv_io.expected
Date: Tue,  5 Aug 2025 18:11:31 +0200
Message-ID: <62e9aec0798c3161fb91d78e988a9bdcfedf70a7.1754409478.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The expected incoming message type can be per connection.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 22 ++++++++++++++--------
 fs/smb/client/smbdirect.h |  7 -------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 58321e483a1a..db3ca03ac90d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -383,6 +383,7 @@ static bool process_negotiation_response(
 			info->max_frmr_depth * PAGE_SIZE);
 	info->max_frmr_depth = sp->max_read_write_size / PAGE_SIZE;
 
+	sc->recv_io.expected = SMBDIRECT_EXPECT_DATA_TRANSFER;
 	return true;
 }
 
@@ -408,7 +409,6 @@ static void smbd_post_send_credits(struct work_struct *work)
 			if (!response)
 				break;
 
-			response->type = SMBD_TRANSFER_DATA;
 			response->first_segment = false;
 			rc = smbd_post_recv(info, response);
 			if (rc) {
@@ -445,10 +445,11 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbd_response *response =
 		container_of(wc->wr_cqe, struct smbd_response, cqe);
 	struct smbd_connection *info = response->info;
+	struct smbdirect_socket *sc = &info->socket;
 	int data_length = 0;
 
 	log_rdma_recv(INFO, "response=0x%p type=%d wc status=%d wc opcode %d byte_len=%d pkey_index=%u\n",
-		      response, response->type, wc->status, wc->opcode,
+		      response, sc->recv_io.expected, wc->status, wc->opcode,
 		      wc->byte_len, wc->pkey_index);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
@@ -463,9 +464,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		response->sge.length,
 		DMA_FROM_DEVICE);
 
-	switch (response->type) {
+	switch (sc->recv_io.expected) {
 	/* SMBD negotiation response */
-	case SMBD_NEGOTIATE_RESP:
+	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
 		dump_smbdirect_negotiate_resp(smbd_response_payload(response));
 		info->full_packet_received = true;
 		info->negotiate_done =
@@ -475,7 +476,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		return;
 
 	/* SMBD data transfer packet */
-	case SMBD_TRANSFER_DATA:
+	case SMBDIRECT_EXPECT_DATA_TRANSFER:
 		data_transfer = smbd_response_payload(response);
 		data_length = le32_to_cpu(data_transfer->data_length);
 
@@ -526,13 +527,17 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			put_receive_buffer(info, response);
 
 		return;
+
+	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
+		/* Only server... */
+		break;
 	}
 
 	/*
 	 * This is an internal error!
 	 */
-	log_rdma_recv(ERR, "unexpected response type=%d\n", response->type);
-	WARN_ON_ONCE(response->type != SMBD_TRANSFER_DATA);
+	log_rdma_recv(ERR, "unexpected response type=%d\n", sc->recv_io.expected);
+	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 error:
 	put_receive_buffer(info, response);
 	smbd_disconnect_rdma_connection(info);
@@ -1067,10 +1072,11 @@ static int smbd_post_recv(
 /* Perform SMBD negotiate according to [MS-SMBD] 3.1.5.2 */
 static int smbd_negotiate(struct smbd_connection *info)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	int rc;
 	struct smbd_response *response = get_receive_buffer(info);
 
-	response->type = SMBD_NEGOTIATE_RESP;
+	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
 	rc = smbd_post_recv(info, response);
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
 		       rc, response->sge.addr,
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index a2026c542989..dbb138900973 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -156,11 +156,6 @@ struct smbd_connection {
 	unsigned int count_send_empty;
 };
 
-enum smbd_message_type {
-	SMBD_NEGOTIATE_RESP,
-	SMBD_TRANSFER_DATA,
-};
-
 /* Maximum number of SGEs used by smbdirect.c in any send work request */
 #define SMBDIRECT_MAX_SEND_SGE	6
 
@@ -186,8 +181,6 @@ struct smbd_response {
 	struct ib_cqe cqe;
 	struct ib_sge sge;
 
-	enum smbd_message_type type;
-
 	/* Link to receive queue or reassembly queue */
 	struct list_head list;
 
-- 
2.43.0


