Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B351B1CB19
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dK+MiFqt5N590uxFDPWT0nZR11NnDQWgIRSkEK+GCbo=; b=fQtiz4ca69Q90b4PSUNJHRyxQJ
	g6itl6MJJ1l4mTxVhpiSgl7pORrNHmb8KQ0UGqs4Qok4NXT2SgViPl+D9RTHKAqW79sDR8wm56uBY
	7iAMktEXavmcT7rd8jY95JKOzaEIiCpvUqbfpFr85PHdVC7ZrWdf6aSba/gdS98tCpUhDGyBPrHD1
	YSrSSicwbOOGYQ3EJgEMymYbXqcI7kTJwk2UZk365zFyUtYjWWCF0YQuOWFInsatiZwwLgcUQ+3sT
	Kf2lma0RsrF9IvvNL7ra1TdFngJIk608nv7th+hYZ2cASG8XoTdFq5eELq+D3u4n3VavsXIvmpBKu
	1IsTftvQ==;
Received: from ip6-localhost ([::1]:26842 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji5f-00ERzP-KX; Wed, 06 Aug 2025 17:38:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4g-00EReV-7P
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dK+MiFqt5N590uxFDPWT0nZR11NnDQWgIRSkEK+GCbo=; b=1pPX9NREjLn/WY+AgwutruWD96
 KsUh5WXH7oqYyv2ALzoquhb65fp1DzFG6zFWLAxmNOB1G/UeEo2MLmKGILzignIolj0g8n5B58irG
 iAzKqi1CS/K7L9clfnOc4vZtIB8TpZq6IzhKKvXjTfjEp+5StDFUvSaOUJ8bzlDh1IOn5dVypfVQ1
 TRXg85L/8kD+PpJ21NBXMgXyMEwWMloIetNB8gb8MGyTkwhtjTjjBGa1AmSsSxXsJIf6BbMS2bQk1
 JU4Lka1IXNHcXA6AHNWbyFlk4pVh7MQblkd3KVH+kYiGZGieJ16Bh/Xx0ZeepqNZPsfuFt2YFvxyb
 NT28DJSlDmZqOmq9YODXqLgQi6+Gf1hbbymlccq6HdkIoG9dxnt5yu+gOdPRrlyImYDUD4oSEB5rB
 ln3UpcjTsFkeejXu2Ij+Fdwxeqo4Pnqiv7dddfodPOPg2oc4ooRYh12l0ZtDPD5kvJ6ZHE8hRhRd3
 7ksaOQ34Nz6YYztz/hmzS2tI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4d-001Odm-11; Wed, 06 Aug 2025 17:37:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 08/18] smb: server: make use of common smbdirect_pdu.h
Date: Wed,  6 Aug 2025 19:35:54 +0200
Message-ID: <098bd91b7e846cb20305a6d1b4005abf10cd5db8.1754501401.git.metze@samba.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 49 +++++++++++++++++-----------------
 fs/smb/server/transport_rdma.h | 41 ----------------------------
 2 files changed, 25 insertions(+), 65 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8d366db5f605..275199fef4e5 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -23,12 +23,13 @@
 #include "connection.h"
 #include "smb_common.h"
 #include "../common/smb2status.h"
+#include "../common/smbdirect/smbdirect_pdu.h"
 #include "transport_rdma.h"
 
 #define SMB_DIRECT_PORT_IWARP		5445
 #define SMB_DIRECT_PORT_INFINIBAND	445
 
-#define SMB_DIRECT_VERSION_LE		cpu_to_le16(0x0100)
+#define SMB_DIRECT_VERSION_LE		cpu_to_le16(SMBDIRECT_V1)
 
 /* SMB_DIRECT negotiation timeout in seconds */
 #define SMB_DIRECT_NEGOTIATE_TIMEOUT		120
@@ -472,8 +473,8 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 {
 	switch (recvmsg->type) {
 	case SMB_DIRECT_MSG_DATA_TRANSFER: {
-		struct smb_direct_data_transfer *req =
-			(struct smb_direct_data_transfer *)recvmsg->packet;
+		struct smbdirect_data_transfer *req =
+			(struct smbdirect_data_transfer *)recvmsg->packet;
 		struct smb2_hdr *hdr = (struct smb2_hdr *)(recvmsg->packet
 				+ le32_to_cpu(req->data_offset));
 		ksmbd_debug(RDMA,
@@ -485,8 +486,8 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 		break;
 	}
 	case SMB_DIRECT_MSG_NEGOTIATE_REQ: {
-		struct smb_direct_negotiate_req *req =
-			(struct smb_direct_negotiate_req *)recvmsg->packet;
+		struct smbdirect_negotiate_req *req =
+			(struct smbdirect_negotiate_req *)recvmsg->packet;
 		ksmbd_debug(RDMA,
 			    "MinVersion: %u, MaxVersion: %u, CreditRequested: %u, MaxSendSize: %u, MaxRecvSize: %u, MaxFragmentedSize: %u\n",
 			    le16_to_cpu(req->min_version),
@@ -540,7 +541,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 	switch (recvmsg->type) {
 	case SMB_DIRECT_MSG_NEGOTIATE_REQ:
-		if (wc->byte_len < sizeof(struct smb_direct_negotiate_req)) {
+		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
 			put_recvmsg(t, recvmsg);
 			smb_direct_disconnect_rdma_connection(t);
 			return;
@@ -552,13 +553,13 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		wake_up_interruptible(&t->wait_status);
 		return;
 	case SMB_DIRECT_MSG_DATA_TRANSFER: {
-		struct smb_direct_data_transfer *data_transfer =
-			(struct smb_direct_data_transfer *)recvmsg->packet;
+		struct smbdirect_data_transfer *data_transfer =
+			(struct smbdirect_data_transfer *)recvmsg->packet;
 		unsigned int data_length;
 		int avail_recvmsg_count, receive_credits;
 
 		if (wc->byte_len <
-		    offsetof(struct smb_direct_data_transfer, padding)) {
+		    offsetof(struct smbdirect_data_transfer, padding)) {
 			put_recvmsg(t, recvmsg);
 			smb_direct_disconnect_rdma_connection(t);
 			return;
@@ -566,7 +567,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		data_length = le32_to_cpu(data_transfer->data_length);
 		if (data_length) {
-			if (wc->byte_len < sizeof(struct smb_direct_data_transfer) +
+			if (wc->byte_len < sizeof(struct smbdirect_data_transfer) +
 			    (u64)data_length) {
 				put_recvmsg(t, recvmsg);
 				smb_direct_disconnect_rdma_connection(t);
@@ -598,7 +599,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			   &t->send_credits);
 
 		if (le16_to_cpu(data_transfer->flags) &
-		    SMB_DIRECT_RESPONSE_REQUESTED)
+		    SMBDIRECT_FLAG_RESPONSE_REQUESTED)
 			queue_work(smb_direct_wq, &t->send_immediate_work);
 
 		if (atomic_read(&t->send_credits) > 0)
@@ -664,7 +665,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 			   unsigned int size, int unused)
 {
 	struct smb_direct_recvmsg *recvmsg;
-	struct smb_direct_data_transfer *data_transfer;
+	struct smbdirect_data_transfer *data_transfer;
 	int to_copy, to_read, data_read, offset;
 	u32 data_length, remaining_data_length, data_offset;
 	int rc;
@@ -1001,7 +1002,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 				    struct smb_direct_sendmsg **sendmsg_out)
 {
 	struct smb_direct_sendmsg *sendmsg;
-	struct smb_direct_data_transfer *packet;
+	struct smbdirect_data_transfer *packet;
 	int header_length;
 	int ret;
 
@@ -1010,7 +1011,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 		return PTR_ERR(sendmsg);
 
 	/* Fill in the packet header */
-	packet = (struct smb_direct_data_transfer *)sendmsg->packet;
+	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
 	packet->credits_requested = cpu_to_le16(t->send_credit_target);
 	packet->credits_granted = cpu_to_le16(manage_credits_prior_sending(t));
 
@@ -1033,11 +1034,11 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 		    le32_to_cpu(packet->remaining_data_length));
 
 	/* Map the packet to DMA */
-	header_length = sizeof(struct smb_direct_data_transfer);
+	header_length = sizeof(struct smbdirect_data_transfer);
 	/* If this is a packet without payload, don't send padding */
 	if (!size)
 		header_length =
-			offsetof(struct smb_direct_data_transfer, padding);
+			offsetof(struct smbdirect_data_transfer, padding);
 
 	sendmsg->sge[0].addr = ib_dma_map_single(t->cm_id->device,
 						 (void *)packet,
@@ -1212,7 +1213,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	int remaining_data_length;
 	int start, i, j;
 	int max_iov_size = st->max_send_size -
-			sizeof(struct smb_direct_data_transfer);
+			sizeof(struct smbdirect_data_transfer);
 	int ret;
 	struct kvec vec;
 	struct smb_direct_send_ctx send_ctx;
@@ -1560,18 +1561,18 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 					      int failed)
 {
 	struct smb_direct_sendmsg *sendmsg;
-	struct smb_direct_negotiate_resp *resp;
+	struct smbdirect_negotiate_resp *resp;
 	int ret;
 
 	sendmsg = smb_direct_alloc_sendmsg(t);
 	if (IS_ERR(sendmsg))
 		return -ENOMEM;
 
-	resp = (struct smb_direct_negotiate_resp *)sendmsg->packet;
+	resp = (struct smbdirect_negotiate_resp *)sendmsg->packet;
 	if (failed) {
 		memset(resp, 0, sizeof(*resp));
-		resp->min_version = cpu_to_le16(0x0100);
-		resp->max_version = cpu_to_le16(0x0100);
+		resp->min_version = SMB_DIRECT_VERSION_LE;
+		resp->max_version = SMB_DIRECT_VERSION_LE;
 		resp->status = STATUS_NOT_SUPPORTED;
 	} else {
 		resp->status = STATUS_SUCCESS;
@@ -1803,7 +1804,7 @@ static int smb_direct_create_pools(struct smb_direct_transport *t)
 	snprintf(name, sizeof(name), "smb_direct_rqst_pool_%p", t);
 	t->sendmsg_cache = kmem_cache_create(name,
 					     sizeof(struct smb_direct_sendmsg) +
-					      sizeof(struct smb_direct_negotiate_resp),
+					      sizeof(struct smbdirect_negotiate_resp),
 					     0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!t->sendmsg_cache)
 		return -ENOMEM;
@@ -1936,7 +1937,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = smb_trans_direct_transfort(t);
 	struct smb_direct_recvmsg *recvmsg;
-	struct smb_direct_negotiate_req *req;
+	struct smbdirect_negotiate_req *req;
 	int ret;
 
 	ksmbd_debug(RDMA, "Waiting for SMB_DIRECT negotiate request\n");
@@ -1955,7 +1956,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	if (ret == -ECONNABORTED)
 		goto out;
 
-	req = (struct smb_direct_negotiate_req *)recvmsg->packet;
+	req = (struct smbdirect_negotiate_req *)recvmsg->packet;
 	st->max_recv_size = min_t(int, st->max_recv_size,
 				  le32_to_cpu(req->preferred_send_size));
 	st->max_send_size = min_t(int, st->max_send_size,
diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
index 77aee4e5c9dc..0fb692c40e21 100644
--- a/fs/smb/server/transport_rdma.h
+++ b/fs/smb/server/transport_rdma.h
@@ -11,47 +11,6 @@
 #define SMBD_MIN_IOSIZE (512 * 1024)
 #define SMBD_MAX_IOSIZE (16 * 1024 * 1024)
 
-/* SMB DIRECT negotiation request packet [MS-SMBD] 2.2.1 */
-struct smb_direct_negotiate_req {
-	__le16 min_version;
-	__le16 max_version;
-	__le16 reserved;
-	__le16 credits_requested;
-	__le32 preferred_send_size;
-	__le32 max_receive_size;
-	__le32 max_fragmented_size;
-} __packed;
-
-/* SMB DIRECT negotiation response packet [MS-SMBD] 2.2.2 */
-struct smb_direct_negotiate_resp {
-	__le16 min_version;
-	__le16 max_version;
-	__le16 negotiated_version;
-	__le16 reserved;
-	__le16 credits_requested;
-	__le16 credits_granted;
-	__le32 status;
-	__le32 max_readwrite_size;
-	__le32 preferred_send_size;
-	__le32 max_receive_size;
-	__le32 max_fragmented_size;
-} __packed;
-
-#define SMB_DIRECT_RESPONSE_REQUESTED 0x0001
-
-/* SMB DIRECT data transfer packet with payload [MS-SMBD] 2.2.3 */
-struct smb_direct_data_transfer {
-	__le16 credits_requested;
-	__le16 credits_granted;
-	__le16 flags;
-	__le16 reserved;
-	__le32 remaining_data_length;
-	__le32 data_offset;
-	__le32 data_length;
-	__le32 padding;
-	__u8 buffer[];
-} __packed;
-
 #ifdef CONFIG_SMB_SERVER_SMBDIRECT
 int ksmbd_rdma_init(void);
 void ksmbd_rdma_destroy(void);
-- 
2.43.0


