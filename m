Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFAC86A2D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:32:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=M8dYDbyAnHfLE0JXYVdJ0/vZXY26sgCDSIM3DDaVyT8=; b=YGzgHxv2AyR6KG9TQla7ThMu8r
	Bt/LnLtDf3fVaICsKIcH7XtN4CqRYcAb7kNsL4yJ+uEbMtxFooMzYpmVhFg1aCdpLvTtgGEkVc4Ey
	+U9OvfpRBUuCiZpOliPbOBaJMeJkPK9dMJ/HxNQMLfaECpzhiGvCmjjt1qwPZaVoQenQN2LT/spLZ
	un+gNSiQag7ug4IllzQBa+UcSvuFX97uPrP3koJ2huqnE98oDPMT7tsZlAqd9J9Uo+iW6BCF9txWG
	O0dZvajD22CXedMuzVyh+Mj77jbRNAuWKgOGucb058xGuS8N9GyspiA6fJnUXVmEv4DHVEbEXx9Lg
	KyDsr1JQ==;
Received: from ip6-localhost ([::1]:60230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxpW-00DGSz-Lt; Tue, 25 Nov 2025 18:31:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22038) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmv-00DFoL-B7
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=M8dYDbyAnHfLE0JXYVdJ0/vZXY26sgCDSIM3DDaVyT8=; b=ux+5mlvUxU/Co1Kv/iOs3vruev
 StJYdcc7XZqtd33T28Vm87htsoMshiiqHX8da7vGTZSdmiQoohlS48JQ2gAEMVlDt+OvVX/+YG9cZ
 TnCCmpQV8aD8XezkFgAWrS1Su6m1cUnalln+RpI2Q3tJQsCMKt9YyxFn+2ItMkd3lCApsTM1fp9Cw
 MaArYhf7OxAKCf/1RziGxiQtM6czHfKL07vSm5oIG/ru1WKBT7dZHGU00+Y+I/kzEkfhqQe2W7R9n
 9k7PaKCyvRTqXf5wbi5B+h+rIOY85iortTX7WVWeB9R7UpqS04hQ+J3LvGQXaZ5zy8k/zhhSjokD9
 EikkUGsz3aDFe8AFPuzaNAt/RCsjmqefdzpuyi5mh0iGPWrHCkfe1eMIukVignzuewVw8i20mw/BB
 VZTQlZpvtBxvaBY796iq/W+AfKT67bbQlzvR73uIqe1tjwBuVjtDA00S/Q1GWUZWmDilnN0ojDWBb
 zpIsC2LdzLGYPVR5V/uLy9IY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgl-00Ffao-30; Tue, 25 Nov 2025 18:22:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 124/145] smb: server: move iov_iter_kvec() out of
 smb_direct_post_send_data()
Date: Tue, 25 Nov 2025 18:56:10 +0100
Message-ID: <d903d7e8ed945a630ae2ac9fc9aeddcab5ca6f24.1764091285.git.metze@samba.org>
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

This will allow us to make the code more generic in order
to move it to common with the client.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 38 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8062759efc9e..8cd40fdef375 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -198,8 +198,8 @@ unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt)
 
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
-				     struct kvec *iov, int niov,
-				     int remaining_data_length);
+				     struct iov_iter *iter,
+				     size_t *remaining_data_length);
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
@@ -209,7 +209,7 @@ static void smb_direct_send_immediate_work(struct work_struct *work)
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return;
 
-	smb_direct_post_send_data(sc, NULL, NULL, 0, 0);
+	smb_direct_post_send_data(sc, NULL, NULL, NULL);
 }
 
 static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
@@ -727,12 +727,13 @@ static int post_sendmsg(struct smbdirect_socket *sc,
 
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
-				     struct kvec *iov, int niov,
-				     int remaining_data_length)
+				     struct iov_iter *iter,
+				     size_t *_remaining_data_length)
 {
-	int i, ret;
 	struct smbdirect_send_io *msg;
-	int data_length;
+	u32 remaining_data_length = 0;
+	u32 data_length = 0;
+	int ret;
 
 	ret = wait_for_send_lcredit(sc, send_ctx);
 	if (ret)
@@ -742,16 +743,20 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	if (ret)
 		goto credit_failed;
 
-	data_length = 0;
-	for (i = 0; i < niov; i++)
-		data_length += iov[i].iov_len;
+	if (iter)
+		data_length = iov_iter_count(iter);
+
+	if (_remaining_data_length) {
+		*_remaining_data_length -= data_length;
+		remaining_data_length = *_remaining_data_length;
+	}
 
 	ret = smb_direct_create_header(sc, data_length, remaining_data_length,
 				       &msg);
 	if (ret)
 		goto header_failed;
 
-	if (data_length) {
+	if (iter) {
 		struct smbdirect_map_sges extract = {
 			.num_sge	= msg->num_sge,
 			.max_sge	= ARRAY_SIZE(msg->sge),
@@ -760,11 +765,8 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
 			.direction	= DMA_TO_DEVICE,
 		};
-		struct iov_iter iter;
-
-		iov_iter_kvec(&iter, ITER_SOURCE, iov, niov, data_length);
 
-		ret = smbdirect_map_sges_from_iter(&iter, data_length, &extract);
+		ret = smbdirect_map_sges_from_iter(iter, data_length, &extract);
 		if (ret < 0)
 			goto err;
 		if (WARN_ON_ONCE(ret != data_length)) {
@@ -824,6 +826,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 		size_t possible_vecs;
 		size_t bytes = 0;
 		size_t nvecs = 0;
+		struct iov_iter iter;
 
 		/*
 		 * For the last message remaining_data_length should be
@@ -904,11 +907,10 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			}
 		}
 
-		remaining_data_length -= bytes;
+		iov_iter_kvec(&iter, ITER_SOURCE, vecs, nvecs, bytes);
 
 		ret = smb_direct_post_send_data(sc, &send_ctx,
-						vecs, nvecs,
-						remaining_data_length);
+						&iter, &remaining_data_length);
 		if (unlikely(ret)) {
 			error = ret;
 			goto done;
-- 
2.43.0


