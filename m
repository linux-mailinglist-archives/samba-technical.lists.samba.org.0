Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 917EFC8692E
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0wgMsb0RAB2Q/CnjjrlgO4v1nvOhOQ4fJSL8cO/soh0=; b=CVIYuL5gcyyJ6q6NXri8y4LAyn
	691cRI5KxPlJL85mkUmokZXh3A/h6P1Y2cyVqEw9EjQbRLOg0j8MWKqYqmYbOYGNVt5tayKqIR8rQ
	rbIJnIQri6JP6CuCwi4OMVQhl2jxsMunde9N2iEcFoJD0bd9iJIj59D54Non7f/JLlGSnADT0nJZy
	fVZHsvm1bpDqen/W1Axp4sRHh/Pny2Btu+n/KshyJZR1w7UrFTTo4v1wC8kUsmUsqkhoS1MKbQGHj
	ezE8qYfhNWNnjMFXE5AZQsnAQsLW8c9vvTN1hNvTXS5nZMZn0+Jew1Y97Zv3tD+Yex1sGuy3U1OpZ
	WBek22Aw==;
Received: from ip6-localhost ([::1]:26952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxg8-00DEXb-2C; Tue, 25 Nov 2025 18:22:17 +0000
Received: from hr2.samba.org ([144.76.82.148]:35260) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDdY-81
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=0wgMsb0RAB2Q/CnjjrlgO4v1nvOhOQ4fJSL8cO/soh0=; b=upfj7eqZCc4t/PStj8nFVwpqCX
 7gJmgJ4ciVZE3pHDtNlM7gUpFZVLQcxm3jrdJzOu0nRU6kGLTLimVA/E9ktb4I0Fu9OXDKwGtp5yo
 nLF3SXWKTLzX+lFMCVf8KxZ/uXMhyKdAGuaOdNAZKUIZ7I7bJDyd9LKc+JqJh2fcf1NDLCEL/jxpr
 8IL0aq/2r/WBKeRvscs4GJS5Dr1yN/J8rGLO0+DwW2TVbH0U3rZ9QaCvOqpaPcv7mpTS3JvWPG8Tg
 M+wCrNllmwtrFG+yPBEwip0jQcjCgOhdWnUNT/qAjhzc7l9oSjBP331ANYrf8dud0F/vccpclKGT7
 BeZpi+1SuafWKewF+epQO2nscdkwEZItYBkRaesyBB62h7+NdZc9nhyOrePyGSUz4B1km95z7zsnn
 7RCcdvDS8oTSxTiVKfOiAUhiczGTpI5qiEwdbjmfgoPQgx37n6B5tUtuejTkNhbwk+EIPEu8BnPPv
 ts1aFBN10j5wDSnWTqCo3EM3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVn-00FePs-33; Tue, 25 Nov 2025 18:11:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 107/145] smb: server: make use of
 smbdirect_connection_{alloc, free}_send_io()
Date: Tue, 25 Nov 2025 18:55:53 +0100
Message-ID: <11777518600b8ac7823b2a272323be8d54188635.1764091285.git.metze@samba.org>
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
index 37c7f9524c6c..92ea33be0005 100644
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
@@ -791,11 +755,11 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
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
@@ -918,9 +882,9 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 
 		list_for_each_entry_safe(sibling, next, &last->sibling_list, sibling_list) {
 			list_del_init(&sibling->sibling_list);
-			smb_direct_free_sendmsg(sc, sibling);
+			smbdirect_connection_free_send_io(sibling);
 		}
-		smb_direct_free_sendmsg(sc, last);
+		smbdirect_connection_free_send_io(last);
 	}
 
 	return ret;
@@ -1005,7 +969,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 	int header_length;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(sc);
+	sendmsg = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(sendmsg))
 		return PTR_ERR(sendmsg);
 
@@ -1048,7 +1012,7 @@ static int smb_direct_create_header(struct smbdirect_socket *sc,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
@@ -1204,7 +1168,7 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 		goto err;
 	return 0;
 err:
-	smb_direct_free_sendmsg(sc, msg);
+	smbdirect_connection_free_send_io(msg);
 header_failed:
 	atomic_inc(&sc->send_io.credits.count);
 credit_failed:
@@ -1644,7 +1608,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(sc);
+	sendmsg = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(sendmsg))
 		return -ENOMEM;
 
@@ -1680,7 +1644,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
@@ -1690,7 +1654,7 @@ static int smb_direct_send_negotiate_response(struct smbdirect_socket *sc,
 
 	ret = post_sendmsg(sc, NULL, sendmsg);
 	if (ret) {
-		smb_direct_free_sendmsg(sc, sendmsg);
+		smbdirect_connection_free_send_io(sendmsg);
 		return ret;
 	}
 
-- 
2.43.0


