Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B4C1AE5A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QwQXgNapX9ca/6/adGL3E0qWvfYpdKxJw8a1c/f5+xA=; b=g9AnR77L+jwSSeQXIiwaTKe3yR
	FpTfzdWbOWVABc7s8Bp5eGKwq6A0PvVhukPhWCtWNStxkLp2OkyjJpXe6+AsjQtAJ95dfAIvwHxed
	+oYWSWuWcIyMFu3axfFJFexlsO55CPC2C5+ew+MNcyDty0npSYG72zPV8gI46eZR1fO8ZVJnrOkKx
	eoal41A+e/JjhD+QaRTzbz1Yhe+Zq915bzobOCPnLRjiULGXomNgovIhIBoaiClo0LVmNnTHvbI5N
	SQdv4qLkBdXN+Agxw+KPms38dwFy+/19+17GBOwXKRRpLYtrpBjNw4P5Q1GTvej20+rCkEAc6Vp3C
	QckM0Ujw==;
Received: from ip6-localhost ([::1]:24830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6WZ-009DVj-SZ; Wed, 29 Oct 2025 13:47:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59934) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IQ-0098RJ-Mp
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QwQXgNapX9ca/6/adGL3E0qWvfYpdKxJw8a1c/f5+xA=; b=VhoeLfFrhEr+cfx82GifbnVRSh
 uRJ41EnWpjxVPL3r9eLPvjtqYbkYMoUDqDQrNBO9HFi8AoVAU2L0pIAf2B0WEUsM/ECAn/hLqWrrC
 1ep5rQoHf+fuDbtBIqzaYUBwBwITv3vY6JP3EmZkD6AKBL6D8e3JJ5++/X1+/2FtjrUvCCw5yWf1q
 UBGznN9xgr7sTdMLv8XxLFRMU3PYtnRz0nwSoMD+UvSfFw0dfx2Gml25L+ZpWAOvIna/FWRcb7ksJ
 NgXcIkoZeQ1SRJP9qCmTX2GvaSCWLfkdxkdrbtX7hV3Rk1IH2+sh43+8biyIQ221KxFTQDTjrQ1xX
 B6o10SXIFQT5XTil23OGXg5128yJbW82x4xhAOl+d/Oi2gluxcxn6Nr+aW1DBeC9CgXLZFKo3HxZ/
 Rg7f+RRFvcpQhlwkqByE0f/s4M5Y7sUpUDcus4Vnpy2lZcWBk3xg3icQaLCFM449EvjwHoCVr8A2Q
 YOO7FHPB9zt7OU1utvoTN+KW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IN-00Bcqb-1O; Wed, 29 Oct 2025 13:32:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 104/127] smb: server: make use of
 smbdirect_map_sges_from_iter()
Date: Wed, 29 Oct 2025 14:21:22 +0100
Message-ID: <11d1c5a951ffbb6bf27f8c2d1acc8ee199c91c02.1761742839.git.metze@samba.org>
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

It will make it easier to move stuff into common code when
both client and server use smbdirect_map_sges_from_iter().

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 58 +++++++++++-----------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 3c36c4c0580d..4e2de2664e31 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1005,18 +1005,6 @@ static int get_sg_list(void *buf, int size, struct scatterlist *sg_list, int nen
 	return i;
 }
 
-static int get_mapped_sg_list(struct ib_device *device, void *buf, int size,
-			      struct scatterlist *sg_list, int nentries,
-			      enum dma_data_direction dir)
-{
-	int npages;
-
-	npages = get_sg_list(buf, size, sg_list, nentries);
-	if (npages < 0)
-		return -EINVAL;
-	return ib_dma_map_sg(device, sg_list, npages, dir);
-}
-
 static int post_sendmsg(struct smbdirect_socket *sc,
 			struct smbdirect_send_batch *send_ctx,
 			struct smbdirect_send_io *msg)
@@ -1060,10 +1048,9 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length)
 {
-	int i, j, ret;
+	int i, ret;
 	struct smbdirect_send_io *msg;
 	int data_length;
-	struct scatterlist sg[SMBDIRECT_SEND_IO_MAX_SGE - 1];
 
 	ret = wait_for_send_lcredit(sc, send_ctx);
 	if (ret)
@@ -1082,34 +1069,27 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	if (ret)
 		goto header_failed;
 
-	for (i = 0; i < niov; i++) {
-		struct ib_sge *sge;
-		int sg_cnt;
-
-		sg_init_table(sg, SMBDIRECT_SEND_IO_MAX_SGE - 1);
-		sg_cnt = get_mapped_sg_list(sc->ib.dev,
-					    iov[i].iov_base, iov[i].iov_len,
-					    sg, SMBDIRECT_SEND_IO_MAX_SGE - 1,
-					    DMA_TO_DEVICE);
-		if (sg_cnt <= 0) {
-			pr_err("failed to map buffer\n");
-			ret = -ENOMEM;
+	if (data_length) {
+		struct smbdirect_map_sges extract = {
+			.num_sge	= msg->num_sge,
+			.max_sge	= ARRAY_SIZE(msg->sge),
+			.sge		= msg->sge,
+			.device		= sc->ib.dev,
+			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
+			.direction	= DMA_TO_DEVICE,
+		};
+		struct iov_iter iter;
+
+		iov_iter_kvec(&iter, ITER_SOURCE, iov, niov, data_length);
+
+		ret = smbdirect_map_sges_from_iter(&iter, data_length, &extract);
+		if (ret < 0)
 			goto err;
-		} else if (sg_cnt + msg->num_sge > SMBDIRECT_SEND_IO_MAX_SGE) {
-			pr_err("buffer not fitted into sges\n");
-			ret = -E2BIG;
-			ib_dma_unmap_sg(sc->ib.dev, sg, sg_cnt,
-					DMA_TO_DEVICE);
+		if (WARN_ON_ONCE(ret != data_length)) {
+			ret = -EIO;
 			goto err;
 		}
-
-		for (j = 0; j < sg_cnt; j++) {
-			sge = &msg->sge[msg->num_sge];
-			sge->addr = sg_dma_address(&sg[j]);
-			sge->length = sg_dma_len(&sg[j]);
-			sge->lkey  = sc->ib.pd->local_dma_lkey;
-			msg->num_sge++;
-		}
+		msg->num_sge = extract.num_sge;
 	}
 
 	ret = post_sendmsg(sc, send_ctx, msg);
-- 
2.43.0


