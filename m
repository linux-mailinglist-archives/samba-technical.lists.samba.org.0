Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEBFC8684C
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:14:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JLXYklc2v0OJi/kXWdFh3NFjh1+CGIliGmE46ACE/xU=; b=ZAzha8GJu8eH9SkbZiL1v5zepO
	4LFht7N2k7tkZOp+o/EWSWFoZ0osTyB3FYl52B7FcDSMsbzyEfSeK0Q8fKku96LfAgVv6l2NeMe7J
	4/PT3/JLqZp9gZc51dMVK5ZY+udwLoGS+qrzniroagppnIe6ELstKhwvQ2/NkT9qPAZgo4xrYgfvO
	t5uX0NAA/K9wfQ/mAx+whZ0iLnotTnEc30ztsZ2d3ouM9o5Kk6IAa3wxHCQJsmHPVBAuuqU5FY8SD
	tahiXC9fAH1TNtva5kxHd6Y4x27hi33eFI6/gjKgP8IQn8LNiwqtRMx9VEs1LYfUlT7GREnXAWBTM
	CCZ0ocRg==;
Received: from ip6-localhost ([::1]:44580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxYQ-00DC86-2O; Tue, 25 Nov 2025 18:14:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12818) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTN-00DAOY-PM
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JLXYklc2v0OJi/kXWdFh3NFjh1+CGIliGmE46ACE/xU=; b=SKdTtxWOh07A0okDER+X/qT/2G
 wCSK6soMjtoSMKr6GxXoBd254Xi1JchGjhwiVw79DkAehGz7xsVBxCpFv05GyUeKNZTocg1bBXdqu
 ZWcAcoAZebnAVv+2qnV9Ym976+uW5wkrpZzZ5mH0t3nU7AsSijn3DfIexOtfl+/f+TV2tZAtQavev
 nYDePJ+qDjilmMjScinWOyQbI1DnzLQ9qu/ndCYmg6QJOo8GB/dgLoleEUgs6BEgG0N5Q7yST4DRi
 PwVONHd5qlXW/R+Cyp77uecaDymY6n6hRoQP8pis9VOGOqv4cO8/OuLxjvUVu9xyg1W1LVuf6SNyJ
 v2WSPr039SyM/2Sc2wcz6pjY1MoCbcQ985n0qeurm1DMWQmcbAflWENiAIebtIHmpm40f8E3wu2Tg
 Z9xhOZGnwR9FZihdZyNjfMmg9kHg2mAVAUnC2spt6XcthbXtjNBvsoizsn9NBS2VcZaZHhCMz2H6k
 rUdpUwnz+eQ3tX6btFff1AcI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxPY-00FdgV-15; Tue, 25 Nov 2025 18:05:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 071/145] smb: client: make use of
 smbdirect_connection_{alloc, free}_send_io()
Date: Tue, 25 Nov 2025 18:55:17 +0100
Message-ID: <481ffd5c56eef00261c19a9dfc588d8f1fee3a7e.1764091285.git.metze@samba.org>
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
index 11c72871981d..e1a2238d249a 100644
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
@@ -836,15 +831,13 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
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
@@ -856,7 +849,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	packet->max_fragmented_size =
 		cpu_to_le32(sp->max_fragmented_recv_size);
 
-	request->num_sge = 1;
 	request->sge[0].addr = ib_dma_map_single(
 				sc->ib.dev, (void *)packet,
 				sizeof(*packet), DMA_TO_DEVICE);
@@ -867,6 +859,7 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 
 	request->sge[0].length = sizeof(*packet);
 	request->sge[0].lkey = sc->ib.pd->local_dma_lkey;
+	request->num_sge = 1;
 
 	ib_dma_sync_single_for_device(
 		sc->ib.dev, request->sge[0].addr,
@@ -893,13 +886,11 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	/* if we reach here, post send failed */
 	log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
 	atomic_dec(&sc->send_io.pending.count);
-	ib_dma_unmap_single(sc->ib.dev, request->sge[0].addr,
-		request->sge[0].length, DMA_TO_DEVICE);
 
 	smbdirect_socket_schedule_cleanup(sc, rc);
 
 dma_mapping_failed:
-	mempool_free(request, sc->send_io.mem.pool);
+	smbdirect_connection_free_send_io(request);
 	return rc;
 }
 
@@ -997,7 +988,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			       int *_remaining_data_length)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	int i, rc;
+	int rc;
 	int header_length;
 	int data_length;
 	struct smbdirect_send_io *request;
@@ -1040,13 +1031,12 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
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
@@ -1136,13 +1126,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
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


