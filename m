Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6DC1AF02
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:50:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Cip7zn16BoxJ/N+wC8tfrTnyb88VXJEJfOYFyFx+afc=; b=Yirw8v8CjVdbDxN6XLpHxocRiE
	kCAqnRDPvPwDIgGTxEBzF6EQfRYlOahTZ0T2+FvzLgLkxwVZ4s4zsdO1A7byjXD2VH3yyPTO09TTq
	WIvoN/mOoQfXRji/3HPoT8W804MMy6gej+9lIDDIvtYpqN+8CXAtqEbZpIr0jBe0JhARM6E4QznCV
	A4hxiJK6cNJJThcslYth80x4DPV50T+doQ/c6OC+L4aawDm61Htmz186OFH1id0oxwisGPRzTHodF
	7b7M144nD16LVfbvt7fk9fXN/AnVr8kFsZFnIEZEIYmNZe3halRZAIrZktq5XCEOZbyKH9rtBoOr3
	xz6YiRSw==;
Received: from ip6-localhost ([::1]:21300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Zf-009Ehs-RP; Wed, 29 Oct 2025 13:50:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31630) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jn-0098ux-NH
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Cip7zn16BoxJ/N+wC8tfrTnyb88VXJEJfOYFyFx+afc=; b=NlkUTEmmTWf2jQ3vgzbe05bU7J
 FKBXDcRDmGs6GcDXsDjXd+yTLU0X9DX4ext6oio1BBVEWrXSMNNr5Agpmda9j9Z8wzhyXORg06fFY
 tWBkeUBSFKKwuP529839e+SZALEZqn6nqgwYAch5mHUZ7w07auVztvREqSgvP2bFXd6ayuPkax2Ti
 odEq1N8fMbdu3J4Dp8Xp7o5+w6rdzl6pGS6oI8qfTInS6sJ5RqQb42Nxc+AuEL4WnSgtQ3Z2e841C
 xYoPIorC4G8CyFBiYtTs+F2WV0pCdSsEAlHtnKN4ah05ldWEY2iaOw3k/KBu4dW4QdPw+RVvUET16
 WLvhC9K372ecHjZHjA0nSISkxcQTL0sDEXjLcmAlfnwHk2PxapRQEV+ETnaNDUa7JoUUVB4xNZ/ly
 r5XJa7801/QXTYuh5P2hZIW3LqIS2aPGLftIh27R4AEHfaVqfH2czGncvtzdjszL+gtSv4yeI0SuV
 NWcUPPbuhF13QDLp1EcttelH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Jm-00Bd46-0M; Wed, 29 Oct 2025 13:34:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 119/127] smb: server: inline smb_direct_create_header()
 into smb_direct_post_send_data()
Date: Wed, 29 Oct 2025 14:21:37 +0100
Message-ID: <4a807b7b2b4d52014312b96bfaca313c66dd73f1.1761742839.git.metze@samba.org>
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

The point is that ib_dma_map_single() is done first, but
the 'Fill in the packet header' will be done after
smbdirect_map_sges_from_iter().

This will simplify further changes in order to
share common code with the client.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 128 +++++++++++++++------------------
 1 file changed, 57 insertions(+), 71 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 03aedfa92c88..463520e1c07c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -605,73 +605,6 @@ static int wait_for_send_credits(struct smbdirect_socket *sc,
 						     1);
 }
 
-static int smb_direct_create_header(struct smbdirect_socket *sc,
-				    int size, int remaining_data_length,
-				    struct smbdirect_send_io **sendmsg_out)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct smbdirect_send_io *sendmsg;
-	struct smbdirect_data_transfer *packet;
-	u16 new_credits = 0;
-	int header_length;
-	int ret;
-
-	sendmsg = smbdirect_connection_alloc_send_io(sc);
-	if (IS_ERR(sendmsg))
-		return PTR_ERR(sendmsg);
-
-	/* Fill in the packet header */
-	packet = (struct smbdirect_data_transfer *)sendmsg->packet;
-	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
-	new_credits = smbdirect_connection_grant_recv_credits(sc);
-	packet->credits_granted = cpu_to_le16(new_credits);
-
-	packet->flags = 0;
-	if (smbdirect_connection_request_keep_alive(sc))
-		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
-
-	packet->reserved = 0;
-	if (!size)
-		packet->data_offset = 0;
-	else
-		packet->data_offset = cpu_to_le32(24);
-	packet->data_length = cpu_to_le32(size);
-	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
-	packet->padding = 0;
-
-	ksmbd_debug(RDMA,
-		    "credits_requested=%d credits_granted=%d data_offset=%d data_length=%d remaining_data_length=%d\n",
-		    le16_to_cpu(packet->credits_requested),
-		    le16_to_cpu(packet->credits_granted),
-		    le32_to_cpu(packet->data_offset),
-		    le32_to_cpu(packet->data_length),
-		    le32_to_cpu(packet->remaining_data_length));
-
-	/* Map the packet to DMA */
-	header_length = sizeof(struct smbdirect_data_transfer);
-	/* If this is a packet without payload, don't send padding */
-	if (!size)
-		header_length =
-			offsetof(struct smbdirect_data_transfer, padding);
-
-	sendmsg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
-						 (void *)packet,
-						 header_length,
-						 DMA_TO_DEVICE);
-	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
-	if (ret) {
-		smbdirect_connection_free_send_io(sendmsg);
-		return ret;
-	}
-
-	sendmsg->num_sge = 1;
-	sendmsg->sge[0].length = header_length;
-	sendmsg->sge[0].lkey = sc->ib.pd->local_dma_lkey;
-
-	*sendmsg_out = sendmsg;
-	return 0;
-}
-
 static int post_sendmsg(struct smbdirect_socket *sc,
 			struct smbdirect_send_batch *send_ctx,
 			struct smbdirect_send_io *msg)
@@ -715,11 +648,22 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct iov_iter *iter,
 				     size_t *_remaining_data_length)
 {
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbdirect_send_io *msg;
+	struct smbdirect_data_transfer *packet;
+	size_t header_length;
+	u16 new_credits = 0;
 	u32 remaining_data_length = 0;
 	u32 data_length = 0;
 	int ret;
 
+	if (iter) {
+		header_length = sizeof(struct smbdirect_data_transfer);
+	} else {
+		/* If this is a packet without payload, don't send padding */
+		header_length = offsetof(struct smbdirect_data_transfer, padding);
+	}
+
 	ret = wait_for_send_lcredit(sc, send_ctx);
 	if (ret)
 		goto lcredit_failed;
@@ -736,10 +680,24 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 		remaining_data_length = *_remaining_data_length;
 	}
 
-	ret = smb_direct_create_header(sc, data_length, remaining_data_length,
-				       &msg);
+	msg = smbdirect_connection_alloc_send_io(sc);
+	if (IS_ERR(msg)) {
+		ret = PTR_ERR(msg);
+		goto alloc_failed;
+	}
+
+	/* Map the packet to DMA */
+	msg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
+					     msg->packet,
+					     header_length,
+					     DMA_TO_DEVICE);
+	ret = ib_dma_mapping_error(sc->ib.dev, msg->sge[0].addr);
 	if (ret)
-		goto header_failed;
+		goto err;
+
+	msg->sge[0].length = header_length;
+	msg->sge[0].lkey = sc->ib.pd->local_dma_lkey;
+	msg->num_sge = 1;
 
 	if (iter) {
 		struct smbdirect_map_sges extract = {
@@ -761,13 +719,41 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 		msg->num_sge = extract.num_sge;
 	}
 
+	/* Fill in the packet header */
+	packet = (struct smbdirect_data_transfer *)msg->packet;
+	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
+	new_credits = smbdirect_connection_grant_recv_credits(sc);
+	packet->credits_granted = cpu_to_le16(new_credits);
+
+	packet->flags = 0;
+	if (smbdirect_connection_request_keep_alive(sc))
+		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
+
+	packet->reserved = 0;
+	if (!data_length)
+		packet->data_offset = 0;
+	else
+		packet->data_offset = cpu_to_le32(24);
+	packet->data_length = cpu_to_le32(data_length);
+	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
+	packet->padding = 0;
+
+	ksmbd_debug(RDMA,
+		    "credits_req=%u credits_granted=%u flags=0x%x ofs=%u len=%u remaining=%u\n",
+		    le16_to_cpu(packet->credits_requested),
+		    le16_to_cpu(packet->credits_granted),
+		    le16_to_cpu(packet->flags),
+		    le32_to_cpu(packet->data_offset),
+		    le32_to_cpu(packet->data_length),
+		    le32_to_cpu(packet->remaining_data_length));
+
 	ret = post_sendmsg(sc, send_ctx, msg);
 	if (ret)
 		goto err;
 	return 0;
 err:
 	smbdirect_connection_free_send_io(msg);
-header_failed:
+alloc_failed:
 	atomic_inc(&sc->send_io.credits.count);
 credit_failed:
 	atomic_inc(&sc->send_io.lcredits.count);
-- 
2.43.0


