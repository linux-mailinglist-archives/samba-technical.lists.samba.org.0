Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E5C8695B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:24:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=71f4sc2EsWZieJfYMQuL2WkXoEDx+KuNUMuN4Uwu6ss=; b=JcWw/ftERcXi4jNwQ7yNksy7jM
	lwJT+KyWbxzqvboDtuY/hwpwZyozs18ByST4T6Ln5PN5FWU2ECDF7whs6KLH2Uls0tKEfWd+sht7C
	+DG+44pbiSAWigXhTICo+FPkgSS+2Z85DI9Ym7R/AEVTrRuLpzrkMb/f6rDGZ5FGXSPGv+tvMpy+n
	kj8Bcm2LbL0OtDtdGs9Jwzy7DX4j6/l4vkypuXk6iRKMpS6kFIY9j+ZaZnHJltoqm9vslQIrGKdQD
	67LM+RATyLkjJNC9itv/IqO6jGcVKCYNIkm/MX3ogsWVLQQbn8GXWllsS/IVvgmhaBgikKZ7tcp81
	kclHQZLA==;
Received: from ip6-localhost ([::1]:48756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxhg-00DExa-Le; Tue, 25 Nov 2025 18:23:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32578) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxfq-00DEXQ-OH
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=71f4sc2EsWZieJfYMQuL2WkXoEDx+KuNUMuN4Uwu6ss=; b=LnsqwIBEHuSeadLNik0st4r9+4
 ON7EkzU7ujSi4ROMmPNM9oqlxCVnnImle4MgSAtyJzEpjIagfbl5v2vEbUYiLO3gtvMBm4iAX+4tD
 aHai/j0GIxtkW3fxkV6cnlbeB8z6hmGxohA05oX1yoBtQu/RBRflg+52z9QBbdaOSuWEEaicG8gBe
 GZQ0c6TtqT45qncpqgDJ/OjO2espIucqZNI5H8bBez1g/egi4juW0ypCtIXL5Ab0YJFP8fr3cG6m1
 QuQ4OUJb97YO0gANfHUX9vEK+jqjv5y/ZAZqEZ4O9DmNqovY2oVgfoNo9CijNZnsu0+SS5TwKLt9c
 DtVA1rcWbKdvLYS7q1ey4ROmScAFgD7bkaEBRlECFHNXjD2VonCvI0dTBUIn9tJcH4rLJ8Y0YDpMa
 AU1yMfoOF7gaz9rtSHYeoFXdD89Xmss1QHnoJNd9TTmjmPza0KiQ2tHY0XbJZKE/jaGJQlWJf5/Ds
 vHvlY/3bx0jfQqEwfIyrHsyv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxWK-00FeUe-0r; Tue, 25 Nov 2025 18:12:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 110/145] smb: server: make use of
 smbdirect_map_sges_from_iter()
Date: Tue, 25 Nov 2025 18:55:56 +0100
Message-ID: <4806bdb8079a17cb3388837296128a1639de4c15.1764091285.git.metze@samba.org>
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
index 6cbd81406e94..c8839d73a7a1 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1016,18 +1016,6 @@ static int get_sg_list(void *buf, int size, struct scatterlist *sg_list, int nen
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
@@ -1071,10 +1059,9 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
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
@@ -1093,34 +1080,27 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
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


