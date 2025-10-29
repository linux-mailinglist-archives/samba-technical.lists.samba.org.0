Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2BC1AD8E
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JATSk+bgvGL+CSvVa8Bxb8c877MK0abt5QE5+0tQH8M=; b=oTru8Va6gU1DgG3dPSreNL/v+H
	a6RMk698NfvPPJqjmMGGdjldn4rJ+w7R7tntSbh/tj7fivgftN3/Jmo9JxF93mES63GQvONHI6yJE
	aUpF2VLs1/XReAgaGhKwEXTSOchQcE/pSUtS/U8opmdGw4mpi/0mccShFyhMZrExK1bDM+hXFIRhT
	cl/KNyDgEOg6QoreQxz+H6Io9/KId8H9JOnDja8jMOkpnTsDl8X/kDIpfTcgWUAJz/p6xULFuLO1B
	4cChH/MAAUSTphjqE/ywxLHp+Y3+PRT6XyFp492Azk0Cx4BdrFjGFy7OEC69repO/is9a162fNe8O
	bDYFI9dQ==;
Received: from ip6-localhost ([::1]:46356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6S6-009Bsc-DZ; Wed, 29 Oct 2025 13:43:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GL-0097jc-Ki
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JATSk+bgvGL+CSvVa8Bxb8c877MK0abt5QE5+0tQH8M=; b=xzoI2dzM7DDUaWFxNAHpzAwDap
 t3arn+bmkHyI8lUBNBAxUqIB10RhKwKeD2eHBiFFNK34EEzYrjGFfaAkyq4LEljDRipDqxVHdDeZu
 34KlUln7RPEG3WNwkL/UMR7VoYJbvN62zx/PKs6SbmwjsUCKPEyBKXPSqzaTVNnuLPs8HtR/OHHmb
 m2zZDMTldMdbRWk3wsnFyEr/2Tn3MqQJPrySSfc3Ysv32o08X7RpZEatyuvZ6F+OWreGR8zW7ifVX
 bCTHXFPZdth1bDuREELuwFlLBsCQNdggAEvb6N7dvTovupWGH/YNSvKriSz1zr3PtXTNcr2EQdimS
 MHrvJYKLl1HBfeDIA8KDvMQ753k8NANnYYQR4KmQyEbCBytBg1n1n6z/vzJ16SzcoFhC2dAdFuMdZ
 soXNvzGq0SmYUI5cMg5Tctke/rhBCC4+ya0+b9ezHqqAVtlK0yPQLJoqlGyRq+18kIcr/Qy0WRUbn
 hUsM4s9bt9RxxssgSwsJFEU6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GD-00BcQo-09; Wed, 29 Oct 2025 13:30:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 083/127] smb: client: let smbd_post_send_iter() get
 remaining_length and return data_length
Date: Wed, 29 Oct 2025 14:21:01 +0100
Message-ID: <cf374a7847af2097543d6bf7d75fb9ea0b15fb52.1761742839.git.metze@samba.org>
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

This lets the logic be like smb_direct_post_send_data(), so
we can share common code in the next steps.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b94fa3bec5c5..34404a1d3e58 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -766,7 +766,7 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 
 static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			       struct iov_iter *iter,
-			       int *_remaining_data_length)
+			       u32 remaining_data_length)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
@@ -776,6 +776,18 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
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
@@ -820,12 +832,6 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 
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
@@ -850,7 +856,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			.local_dma_lkey	= sc->ib.pd->local_dma_lkey,
 			.direction	= DMA_TO_DEVICE,
 		};
-		size_t payload_len = umin(*_remaining_data_length,
+		size_t payload_len = umin(iov_iter_count(iter),
 					  sp->max_send_size - sizeof(*packet));
 
 		rc = smbdirect_map_sges_from_iter(iter, payload_len, &extract);
@@ -858,7 +864,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			goto err_dma;
 		data_length = rc;
 		request->num_sge = extract.num_sge;
-		*_remaining_data_length -= data_length;
+		remaining_data_length -= data_length;
 	} else {
 		data_length = 0;
 	}
@@ -879,7 +885,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	else
 		packet->data_offset = cpu_to_le32(24);
 	packet->data_length = cpu_to_le32(data_length);
-	packet->remaining_data_length = cpu_to_le32(*_remaining_data_length);
+	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
 	packet->padding = 0;
 
 	log_outgoing(INFO, "credits_requested=%d credits_granted=%d data_offset=%d data_length=%d remaining_data_length=%d\n",
@@ -897,7 +903,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 
 	rc = smbd_post_send(sc, request);
 	if (!rc)
-		return 0;
+		return data_length;
 
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
 		wake_up(&sc->send_io.pending.zero_wait_queue);
@@ -929,11 +935,10 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
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
 		smbdirect_connection_schedule_disconnect(sc, ret);
@@ -953,9 +958,11 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
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


