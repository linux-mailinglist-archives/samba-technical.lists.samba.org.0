Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B218C1ACAD
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7ubsP+SWHfRC2bI9lCg3c2d7FSEDuWknQuvsHJZhbFw=; b=kv/tPfHxETOj0LDd970zjaoo1Q
	/EnegNnZkk3hiyFooV4WImkhkF39pluR3rjuO/3eFBBdOWtvssIKEw2p74Bo1JxK4EX6kjPXT8dtS
	tgyW2kV8rsJYE8xmrjIqKpNL7Z8vyBpDOh7JmkuVor69cGvKP6TZoMlLUuYCku+TWQp+M5B5zsdbT
	UEcuQMTRRpegU30EiNpxsg6W1BB+abivwbLRb12HTun3vunc4G2yjMGnx/ZGzAEZUEES/1IQ8qw2z
	Gtdru4bTasgS1rmL+h6PyFqKSM8Cm07e6UG1F/tYpWbf0e63ARADArmO63fxyliaEX4OJOVSCNDgn
	1st1pQ3A==;
Received: from ip6-localhost ([::1]:28252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6OW-009AXy-SL; Wed, 29 Oct 2025 13:39:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58754) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EY-0097A7-Gg
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=7ubsP+SWHfRC2bI9lCg3c2d7FSEDuWknQuvsHJZhbFw=; b=ifo0Z/lyfZ5cYUSR+bhvzRW5Mt
 TIFTdzfTLP+mDTXF8Qb4k6JrfIfaYXgszHLg3/ufDKwnjDLAf3gNry1si9crQfdYSNkoAuKEDwjEj
 tG6vUHSNluBdMdITwncluY5n0n5Ngf6OVkmbBoKrb9KwqYUydzOfrNeDUOzTCSbf/dLQ9ihCeD0sA
 t+Obw16a04tPIjwVfHgRIRU6Lr9n/Ae8f3LzMvYsvKN0R9YezJy6gePAmHvkcpRIA7wnEQB9pyTGI
 FhBmHS7ZkTcwY900Ho/0EdsACv1RnJ/Ed4eSpWlLJEsQuAZmhPo5trzb+/C/GoGAjXDOiO3c8dQNE
 BzHlkSjbqGiqe/mIu8UpYjFLOatGEo4iy8lbYSjAiytBos3GXIsMKgNxeM4YkuB8a9909K7Hszves
 cpl6UXp2YWly9XLZZeAG0Xy0VyJu4+xLr6i+iPqH5V+16lSLcWW7tuUxxLI+1DC8O61NVFXjjbkH/
 iA12d1Wl1Qp94CXpM2M5wv9L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EU-00BcB5-0H; Wed, 29 Oct 2025 13:28:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 066/127] smb: client: make use of
 smbdirect_connection_{alloc, free}_send_io()
Date: Wed, 29 Oct 2025 14:20:44 +0100
Message-ID: <d9892df7ea6e7f2ebcbb2ab92863ca087d510a77.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This simplifies the code and allows us to share more code in common
with the server.

The only difference is that we use ib_dma_unmap_page() for all sges,
this simplifies the logic and doesn't matter as
ib_dma_unmap_single() and ib_dma_unmap_page() both operate
on dma_addr_t and dma_unmap_single_attrs() is just an
alias for dma_unmap_page_attrs().

We already had such an inconsistency before
as we called ib_dma_unmap_single(), while we mapped
using ib_dma_map_page() in smb_set_sge().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 42 ++++++++++++---------------------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ab8ce4c46bd6..1eed0686a34d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -390,7 +390,6 @@ static inline void *smbdirect_recv_io_payload(struct smbdirect_recv_io *response
 /* Called when a RDMA send is done */
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-	int i;
 	struct smbdirect_send_io *request =
 		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
 	struct smbdirect_socket *sc = request->socket;
@@ -399,12 +398,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%s\n",
 		request, ib_wc_status_msg(wc->status));
 
-	for (i = 0; i < request->num_sge; i++)
-		ib_dma_unmap_single(sc->ib.dev,
-			request->sge[i].addr,
-			request->sge[i].length,
-			DMA_TO_DEVICE);
-	mempool_free(request, sc->send_io.mem.pool);
+	/* Note this frees wc->wr_cqe, but not wc */
+	smbdirect_connection_free_send_io(request);
 	lcredits += 1;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
@@ -835,15 +830,13 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct ib_send_wr send_wr;
-	int rc = -ENOMEM;
+	int rc;
 	struct smbdirect_send_io *request;
 	struct smbdirect_negotiate_req *packet;
 
-	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
-	if (!request)
-		return rc;
-
-	request->socket = sc;
+	request = smbdirect_connection_alloc_send_io(sc);
+	if (IS_ERR(request))
+		return PTR_ERR(request);
 
 	packet = smbdirect_send_io_payload(request);
 	packet->min_version = cpu_to_le16(SMBDIRECT_V1);
@@ -855,7 +848,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	packet->max_fragmented_size =
 		cpu_to_le32(sp->max_fragmented_recv_size);
 
-	request->num_sge = 1;
 	request->sge[0].addr = ib_dma_map_single(
 				sc->ib.dev, (void *)packet,
 				sizeof(*packet), DMA_TO_DEVICE);
@@ -866,6 +858,7 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 
 	request->sge[0].length = sizeof(*packet);
 	request->sge[0].lkey = sc->ib.pd->local_dma_lkey;
+	request->num_sge = 1;
 
 	ib_dma_sync_single_for_device(
 		sc->ib.dev, request->sge[0].addr,
@@ -892,13 +885,11 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	/* if we reach here, post send failed */
 	log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
 	atomic_dec(&sc->send_io.pending.count);
-	ib_dma_unmap_single(sc->ib.dev, request->sge[0].addr,
-		request->sge[0].length, DMA_TO_DEVICE);
 
 	smbdirect_connection_schedule_disconnect(sc, rc);
 
 dma_mapping_failed:
-	mempool_free(request, sc->send_io.mem.pool);
+	smbdirect_connection_free_send_io(request);
 	return rc;
 }
 
@@ -996,7 +987,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			       int *_remaining_data_length)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	int i, rc;
+	int rc;
 	int header_length;
 	int data_length;
 	struct smbdirect_send_io *request;
@@ -1039,13 +1030,12 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 		goto wait_credit;
 	}
 
-	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
-	if (!request) {
-		rc = -ENOMEM;
+	request = smbdirect_connection_alloc_send_io(sc);
+	if (IS_ERR(request)) {
+		rc = PTR_ERR(request);
 		goto err_alloc;
 	}
 
-	request->socket = sc;
 	memset(request->sge, 0, sizeof(request->sge));
 
 	/* Map the packet to DMA */
@@ -1135,13 +1125,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 
 err_dma:
-	for (i = 0; i < request->num_sge; i++)
-		if (request->sge[i].addr)
-			ib_dma_unmap_single(sc->ib.dev,
-					    request->sge[i].addr,
-					    request->sge[i].length,
-					    DMA_TO_DEVICE);
-	mempool_free(request, sc->send_io.mem.pool);
+	smbdirect_connection_free_send_io(request);
 
 	/* roll back the granted receive credits */
 	atomic_sub(new_credits, &sc->recv_io.credits.count);
-- 
2.43.0


