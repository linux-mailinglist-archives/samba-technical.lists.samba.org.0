Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E894CC868AA
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:18:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hCzrbunfKU4uKGzOleIczLEq+X7+G3nLyd+iUCZCIhU=; b=MtltU+x6iJF6JVhSeFh4/147PP
	GKIfe47hI9PuOCHgmqrG7+UfOAhG7RTrtvTjgQaEKxj6dFxwe0JDjI6VXgRIS1Xjn4u4PHz5GVWOM
	kftR4SNXqPDeujNoCibuxnmfomFDACJF87hAYPCDpmeeNsniRmo+KNdXon3XJOg/+y0toCWR9ohMc
	B0jvU/e7rDF60wjRnVcpEsIW4FSULrjjkA9N319DW7+rL8vEvMZq8xOKPW6GC1XF4o/YOM96jve06
	6M3gi3NDRHoXHP2gkFw7Iv7d6EiRniURxshQSbrORVQe8hdsImkHSL5O4A3pz/BIXLnA7d7gNUMyN
	c9J1porw==;
Received: from ip6-localhost ([::1]:53214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxcH-00DDVK-A0; Tue, 25 Nov 2025 18:18:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61378) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAlC-5Y
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hCzrbunfKU4uKGzOleIczLEq+X7+G3nLyd+iUCZCIhU=; b=UQxew6JKVMXKdrccFAk4TryFw7
 w3/oI88WFxKwlAs5ijh5ec1kz01aq2hAznGqEmwjtd/JINyBl8JKanDWWCtIMq/xUQ53qfCOImR4P
 LkYhumFRbkgq6DolYVyfgyVGnWy3OSaVSkh03Q+AasUEHaDr8DvzTpSPuKMwdvIFw2oy5OU485HvH
 /NWIPqCFTPrDBdg5NTcozg1TysDmbuIh9LWf8zimTgDKFTdfRmkEWFJjsaBZXknEchymbYatXh89e
 n0bVO0YI+tyXm8tUYAh9zzaa8RAo8kCHRrgj6QkqZ5A3+ImG4BfFFB2AcyFdVNPixXcxgp7pf3r3y
 7/lSHi+LdLL7KvhCw9DpEcGljnZ3KWRdMmET263BnzC0ApFaLDszgHM/tMbnu4EBLIPyi5u2g67Oj
 eu7POQkjI4j9XsTXXR8kNNQ+is2xvvVxJwFHDR9ktMLJYe09XtdPBVbGHOKQdjOnwsusjDIWf82p4
 kAzIPlwgUV0iijLdOeBg28iS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxSV-00Fe1u-0b; Tue, 25 Nov 2025 18:08:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 088/145] smb: client: let smbd_post_send_iter() get
 remaining_length and return data_length
Date: Tue, 25 Nov 2025 18:55:34 +0100
Message-ID: <d976b20508971a51b1ab0dd479f20ad4b124c9d6.1764091285.git.metze@samba.org>
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

This lets the logic be like smb_direct_post_send_data(), so
we can share common code in the next steps.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index bc8c3e3f705f..a924d1aa4a27 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -767,7 +767,7 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 
 static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			       struct iov_iter *iter,
-			       int *_remaining_data_length)
+			       u32 remaining_data_length)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
@@ -777,6 +777,18 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	struct smbdirect_data_transfer *packet;
 	u16 new_credits = 0;
 
+	if (iter) {
+		header_length = sizeof(struct smbdirect_data_transfer);
+		if (WARN_ON_ONCE(remaining_data_length == 0 ||
+				 iov_iter_count(iter) > remaining_data_length))
+			return -EINVAL;
+	} else {
+		/* If this is a packet without payload, don't send padding */
+		header_length = offsetof(struct smbdirect_data_transfer, padding);
+		if (WARN_ON_ONCE(remaining_data_length))
+			return -EINVAL;
+	}
+
 wait_lcredit:
 	/* Wait for local send credits */
 	rc = wait_event_interruptible(sc->send_io.lcredits.wait_queue,
@@ -821,12 +833,6 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 
 	memset(request->sge, 0, sizeof(request->sge));
 
-	/* Map the packet to DMA */
-	header_length = sizeof(struct smbdirect_data_transfer);
-	/* If this is a packet without payload, don't send padding */
-	if (!iter)
-		header_length = offsetof(struct smbdirect_data_transfer, padding);
-
 	packet = smbdirect_send_io_payload(request);
 	request->sge[0].addr = ib_dma_map_single(sc->ib.dev,
 						 (void *)packet,
@@ -851,7 +857,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
 			.direction	= DMA_TO_DEVICE,
 		};
-		size_t payload_len = umin(*_remaining_data_length,
+		size_t payload_len = umin(iov_iter_count(iter),
 					  sp->max_send_size - sizeof(*packet));
 
 		rc = smbdirect_map_sges_from_iter(iter, payload_len, &extract);
@@ -859,7 +865,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			goto err_dma;
 		data_length = rc;
 		request->num_sge = extract.num_sge;
-		*_remaining_data_length -= data_length;
+		remaining_data_length -= data_length;
 	} else {
 		data_length = 0;
 	}
@@ -880,7 +886,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	else
 		packet->data_offset = cpu_to_le32(24);
 	packet->data_length = cpu_to_le32(data_length);
-	packet->remaining_data_length = cpu_to_le32(*_remaining_data_length);
+	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
 	packet->padding = 0;
 
 	log_outgoing(INFO, "credits_requested=%d credits_granted=%d data_offset=%d data_length=%d remaining_data_length=%d\n",
@@ -898,7 +904,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 
 	rc = smbd_post_send(sc, request);
 	if (!rc)
-		return 0;
+		return data_length;
 
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
 		wake_up(&sc->send_io.pending.zero_wait_queue);
@@ -930,11 +936,10 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
  */
 static void smbd_post_send_empty(struct smbdirect_socket *sc)
 {
-	int remaining_data_length = 0;
 	int ret;
 
 	sc->statistics.send_empty++;
-	ret = smbd_post_send_iter(sc, NULL, &remaining_data_length);
+	ret = smbd_post_send_iter(sc, NULL, 0);
 	if (ret < 0) {
 		log_rdma_send(ERR, "smbd_post_send_iter failed ret=%d\n", ret);
 		smbdirect_socket_schedule_cleanup(sc, ret);
@@ -954,9 +959,11 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 	 */
 
 	while (iov_iter_count(iter) > 0) {
-		rc = smbd_post_send_iter(sc, iter, _remaining_data_length);
+		rc = smbd_post_send_iter(sc, iter, *_remaining_data_length);
 		if (rc < 0)
 			break;
+		*_remaining_data_length -= rc;
+		rc = 0;
 	}
 
 	return rc;
-- 
2.43.0


