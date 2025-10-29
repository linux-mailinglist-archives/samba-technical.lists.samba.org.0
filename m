Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E300C1AE39
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:47:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vOWnZHx5TglcuZpW1gF2v3nGaLKQzim0DMs4bZhlTGs=; b=ViUIcS9zlrlcdKsFHVOW3k9mp6
	L1Ga+KVe0JRM+TcWu8K/0Z7adDSeUK6gaOKMmXFeYowb6VW+omAIg7PNmom1Qj5bkYHX7OpKuPaXL
	LnXqWGO8mg8WLzM+i/C973GAj06v2AL0t/xLpHHKB8yJQ5/bv7AEfadCa9zmAO9kVNP12kwlnxza4
	LVokakibOHbi/3tdiXFzJGTr8F8GgouWG7X4ROc5SPGOgnjB8xec+3kLcx6EdpOkUQIABW+Y25xCF
	L7t04uztsAF2TogjC11opRXuPUyHg/13QkHl2QIi3dpX0JogHaxmHNC78GyWynY5VKihFS/fG8P63
	7US57hZw==;
Received: from ip6-localhost ([::1]:62526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Vx-009DIU-PO; Wed, 29 Oct 2025 13:47:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44616) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IA-0098Ln-38
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vOWnZHx5TglcuZpW1gF2v3nGaLKQzim0DMs4bZhlTGs=; b=1mPSgIHKBA9h6o0MnKcRQ5Pkvl
 f+lybn3PiucmkRRok4Z+AeE3kOPamA97pi6idRW0u6BDokl3Ube5RdeZdfcPvld85BnoivWc96hOf
 00doOpuQStoJZA2a6vYNvlemLu8wujLo00XcjCMsKC+00XZpOeGOk4GpGKTc5hyN7XCsR2Hs/liQi
 w02wwOxr5quSdeLPG2dlSyKAR2bmtK6gVEXVHsRw6DxY+WKY4GK+KM0+Yvyve949Nmy31Ct4zDnx7
 pkrAPIXK9vgo26Xw9EEOOz9NNFD8X1kxteXD5ndujW/htJG9LdbzSmPbYEnbEiDGhOiAfb7clYmwg
 JL2ozcyT3YrZrWaX8aRYJ1coMhoQmBwWCZrB5+qHwtnmCulFQMtsnV3OjrlH7VvmiWHy3myd1MI6h
 BB8SRBZRHiHsTodJlwwdq9XHWN5D8Mj4/QJdv3M/z3/RQwZp/+nxSoUVOlaJ5F/jwy8PXLrL4CjLo
 4HH8EZoWq0MntV83Titx4vo9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6I6-00BcmV-1x; Wed, 29 Oct 2025 13:32:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 101/127] smb: server: make use of
 smbdirect_connection_{alloc, free}_send_io()
Date: Wed, 29 Oct 2025 14:21:19 +0100
Message-ID: <a233b459321354d6586e5878104f043068b3efa1.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These are basically copies of smb_direct_{alloc,free}_sendmsg() just
a bit simpler and with the gfp_mask mask abstracted.

For now we still use KSMBD_DEFAULT_GFP, which includes
__GFP_RETRY_MAYFAIL.

The only difference is that we use ib_dma_unmap_page() for all sges,
this simplifies the logic and doesn't matter as
ib_dma_unmap_single() and ib_dma_unmap_page() both operate
on dma_addr_t and dma_unmap_single_attrs() is just an
alias for dma_unmap_page_attrs().
We already had such an inconsistency in the client
code where we use ib_dma_unmap_single(), while we mapped
using ib_dma_map_page().

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 58 +++++++---------------------------
 1 file changed, 11 insertions(+), 47 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 7181d9f62b09..50dc87660b25 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -258,6 +258,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	smbdirect_socket_set_logging(sc, NULL,
 				     smb_direct_logging_needed,
 				     smb_direct_logging_vaprintf);
+	sc->send_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	/*
 	 * from here we operate on the copy.
 	 */
@@ -354,43 +355,6 @@ static void free_transport(struct smb_direct_transport *t)
 	ksmbd_conn_free(KSMBD_TRANS(t)->conn);
 }
 
-static struct smbdirect_send_io
-*smb_direct_alloc_sendmsg(struct smbdirect_socket *sc)
-{
-	struct smbdirect_send_io *msg;
-
-	msg = mempool_alloc(sc->send_io.mem.pool, KSMBD_DEFAULT_GFP);
-	if (!msg)
-		return ERR_PTR(-ENOMEM);
-	msg->socket = sc;
-	INIT_LIST_HEAD(&msg->sibling_list);
-	msg->num_sge = 0;
-	return msg;
-}
-
-static void smb_direct_free_sendmsg(struct smbdirect_socket *sc,
-				    struct smbdirect_send_io *msg)
-{
-	int i;
-
-	/*
-	 * The list needs to be empty!
-	 * The caller should take care of it.
-	 */
-	WARN_ON_ONCE(!list_empty(&msg->sibling_list));
-
-	if (msg->num_sge > 0) {
-		ib_dma_unmap_single(sc->ib.dev,
-				    msg->sge[0].addr, msg->sge[0].length,
-				    DMA_TO_DEVICE);
-		for (i = 1; i < msg->num_sge; i++)
-			ib_dma_unmap_page(sc->ib.dev,
-					  msg->sge[i].addr, msg->sge[i].length,
-					  DMA_TO_DEVICE);
-	}
-	mempool_free(msg, sc->send_io.mem.pool);
-}
-
 static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
 {
 	struct smbdirect_socket *sc = recvmsg->socket;
@@ -780,11 +744,11 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	 */
 	list_for_each_entry_safe(sibling, next, &sendmsg->sibling_list, sibling_list) {
 		list_del_init(&sibling->sibling_list);
-		smb_direct_free_sendmsg(sc, sibling);
+		smbdirect_connection_free_send_io(sibling);
 		lcredits += 1;
 	}
 	/* Note this frees wc->wr_cqe, but not wc */
-	smb_direct_free_sendmsg(sc, sendmsg);
+	smbdirect_connection_free_send_io(sendmsg);
 	lcredits += 1;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
@@ -907,9 +871,9 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 
 		list_for_each_entry_safe(sibling, next, &last->sibling_list, sibling_list) {
 			list_del_init(&sibling->sibling_list);
-			smb_direct_free_sendmsg(sc, sibling);
+			smbdirect_connection_free_send_io(sibling);
 		}
-		smb_direct_free_sendmsg(sc, last);
+		smbdirect_connection_free_send_io(last);
 	}
 
 	return ret;
@@ -994,7 +958,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	int header_length;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(sc);
+	sendmsg = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(sendmsg))
 		return PTR_ERR(sendmsg);
 
@@ -1037,7 +1001,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
@@ -1193,7 +1157,7 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 		goto err;
 	return 0;
 err:
-	smb_direct_free_sendmsg(sc, msg);
+	smbdirect_connection_free_send_io(msg);
 header_failed:
 	atomic_inc(&sc->send_io.credits.count);
 credit_failed:
@@ -1622,7 +1586,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(sc);
+	sendmsg = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(sendmsg))
 		return -ENOMEM;
 
@@ -1658,7 +1622,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
@@ -1668,7 +1632,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 
 	ret = post_sendmsg(sc, NULL, sendmsg);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
-- 
2.43.0


