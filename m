Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B4AC52CD
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 18:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=w/NVHqcrzUAG2B/brguXK3B4iUlzuDL9fzQbj7/gWPQ=; b=bEYQKTPy0rgdCPpJIZpi/WWsYu
	hdK16UP2bYnWB7xwMM4D4MVwaJPCuMBJ3OyMq12CjX1rJaoXQ2ezmjrpP7ON80Qb3OARger3EqNhh
	DUuHy8L4dRIBQTOxlPX0j3NQzaaywMzxAQXyNHVodXq9Q97lVr6Ar+utpIFmnCW/DtNimRw4Fwhdl
	3TU1We6sGu+H7t8P9M0sITE0rlzYQry8XI+yOz9nJ0k/sysuTXhsEzbNx/JSOgP5CFcB0SZEQTuhV
	uv6tQUrxrInap4t3Jaxe1FvzRfcj16QwHWUyMrXQptlTpAY/JZov8vi+HBAUvRxmSVyL6Hu7XHPl3
	KUr5+AvQ==;
Received: from ip6-localhost ([::1]:35882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJwwO-004HgX-Ob; Tue, 27 May 2025 16:14:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30310) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwH-004HfI-PW
 for samba-technical@lists.samba.org; Tue, 27 May 2025 16:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=w/NVHqcrzUAG2B/brguXK3B4iUlzuDL9fzQbj7/gWPQ=; b=BDDe2QTqZyyKBkwFQMUypOicl8
 pNU+zlesejKaourFLsDzf7OzhG4F+gqwy6/tkmUJKoABF6w0R2SMNH1AMGdE20hxdSgnhRBu940g/
 OchKNDOds+nJhc0awI80gxf+P2UtPXHnVDoGUfMcy22TjodcMejkygUYxomREZ3bHUnGuRm+00loV
 Y0WbEEeTMRHjL3I0KIgYokYbIR7NWxEirqtDbOQ+T/tpzziqTA/oy1alGKOUmM1pMfmPdDD3A7qxv
 6NOYAVbI9RlTkiIn74BnhcSL10KivVeexbluodPnRqEvIJ+lKz+ecTfh/TtuCbeIUVGSpl0a5Ar3H
 Ltzouc+MOHMoX0zmaoj4M8uLqM65pKXf/d7Zl2rzrrP62os4qcDrpvaDQnWPKNhpLdZ9+D7TvljgB
 c7QNTJ890Xpc6dfhEx72lzIzqKzoQbXLjpKXLgQ6ZkaPagsZvzz7aefABjQjjGuKAbEl9DXNQDOsQ
 7UkIqZ3PguJJ89bLDh6ZeYr/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwG-007Vkj-2x; Tue, 27 May 2025 16:14:04 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH 2/5] smb: client: make use of common smb_direct headers
Date: Tue, 27 May 2025 18:12:59 +0200
Message-Id: <bb4d9fc0edd73878022c30f9d84e7488fcc1844c.1748362221.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748362221.git.metze@samba.org>
References: <cover.1748362221.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 22 ++++++++++----------
 fs/smb/client/smbdirect.h | 43 ++-------------------------------------
 2 files changed, 13 insertions(+), 52 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b0b7254661e9..ec307faa94d2 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -299,7 +299,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	mempool_free(request, request->info->request_mempool);
 }
 
-static void dump_smbd_negotiate_resp(struct smbd_negotiate_resp *resp)
+static void dump_smb_direct_negotiate_resp(struct smb_direct_negotiate_resp *resp)
 {
 	log_rdma_event(INFO, "resp message min_version %u max_version %u negotiated_version %u credits_requested %u credits_granted %u status %u max_readwrite_size %u preferred_send_size %u max_receive_size %u max_fragmented_size %u\n",
 		       resp->min_version, resp->max_version,
@@ -318,9 +318,9 @@ static bool process_negotiation_response(
 		struct smbd_response *response, int packet_length)
 {
 	struct smbd_connection *info = response->info;
-	struct smbd_negotiate_resp *packet = smbd_response_payload(response);
+	struct smb_direct_negotiate_resp *packet = smbd_response_payload(response);
 
-	if (packet_length < sizeof(struct smbd_negotiate_resp)) {
+	if (packet_length < sizeof(struct smb_direct_negotiate_resp)) {
 		log_rdma_event(ERR,
 			"error: packet_length=%d\n", packet_length);
 		return false;
@@ -448,7 +448,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 /* Called from softirq, when recv is done */
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	struct smbd_data_transfer *data_transfer;
+	struct smb_direct_data_transfer *data_transfer;
 	struct smbd_response *response =
 		container_of(wc->wr_cqe, struct smbd_response, cqe);
 	struct smbd_connection *info = response->info;
@@ -474,7 +474,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	switch (response->type) {
 	/* SMBD negotiation response */
 	case SMBD_NEGOTIATE_RESP:
-		dump_smbd_negotiate_resp(smbd_response_payload(response));
+		dump_smb_direct_negotiate_resp(smbd_response_payload(response));
 		info->full_packet_received = true;
 		info->negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
@@ -686,7 +686,7 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
 	struct ib_send_wr send_wr;
 	int rc = -ENOMEM;
 	struct smbd_request *request;
-	struct smbd_negotiate_req *packet;
+	struct smb_direct_negotiate_req *packet;
 
 	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
 	if (!request)
@@ -837,7 +837,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	int header_length;
 	int data_length;
 	struct smbd_request *request;
-	struct smbd_data_transfer *packet;
+	struct smb_direct_data_transfer *packet;
 	int new_credits = 0;
 
 wait_credit:
@@ -938,10 +938,10 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 		     le32_to_cpu(packet->remaining_data_length));
 
 	/* Map the packet to DMA */
-	header_length = sizeof(struct smbd_data_transfer);
+	header_length = sizeof(struct smb_direct_data_transfer);
 	/* If this is a packet without payload, don't send padding */
 	if (!data_length)
-		header_length = offsetof(struct smbd_data_transfer, padding);
+		header_length = offsetof(struct smb_direct_data_transfer, padding);
 
 	request->sge[0].addr = ib_dma_map_single(info->id->device,
 						 (void *)packet,
@@ -1432,7 +1432,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 		kmem_cache_create(
 			name,
 			sizeof(struct smbd_request) +
-				sizeof(struct smbd_data_transfer),
+				sizeof(struct smb_direct_data_transfer),
 			0, SLAB_HWCACHE_ALIGN, NULL);
 	if (!info->request_cache)
 		return -ENOMEM;
@@ -1735,7 +1735,7 @@ static int smbd_recv_buf(struct smbd_connection *info, char *buf,
 		unsigned int size)
 {
 	struct smbd_response *response;
-	struct smbd_data_transfer *data_transfer;
+	struct smb_direct_data_transfer *data_transfer;
 	int to_copy, to_read, data_read, offset;
 	u32 data_length, remaining_data_length, data_offset;
 	int rc;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index c08e3665150d..9c5b78a33311 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -15,6 +15,8 @@
 #include <rdma/rdma_cm.h>
 #include <linux/mempool.h>
 
+#include "../common/smb_direct/smb_direct.h"
+
 extern int rdma_readwrite_threshold;
 extern int smbd_max_frmr_depth;
 extern int smbd_keep_alive_interval;
@@ -177,47 +179,6 @@ enum smbd_message_type {
 	SMBD_TRANSFER_DATA,
 };
 
-#define SMB_DIRECT_RESPONSE_REQUESTED 0x0001
-
-/* SMBD negotiation request packet [MS-SMBD] 2.2.1 */
-struct smbd_negotiate_req {
-	__le16 min_version;
-	__le16 max_version;
-	__le16 reserved;
-	__le16 credits_requested;
-	__le32 preferred_send_size;
-	__le32 max_receive_size;
-	__le32 max_fragmented_size;
-} __packed;
-
-/* SMBD negotiation response packet [MS-SMBD] 2.2.2 */
-struct smbd_negotiate_resp {
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
-/* SMBD data transfer packet with payload [MS-SMBD] 2.2.3 */
-struct smbd_data_transfer {
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
 /* The packet fields for a registered RDMA buffer */
 struct smbd_buffer_descriptor_v1 {
 	__le64 offset;
-- 
2.34.1


