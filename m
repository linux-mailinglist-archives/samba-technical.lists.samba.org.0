Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAEEC8688B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Wcm+DkST9X8Z5uIvlrOrjlhwuuIMAlhtD+9a0FDATLs=; b=2G0HrgsdGL1HO4o4ST31pEj1FB
	zGboGOm3RiULrjeJ5sp6NvWv2pdiLAkGFaYx3pSyVnQ1o4gfLUNmwklNWnu66eXWmFR00Ljz1Xoig
	o21F6gzvEdkwHpM/UlIC1QbNKq76GufcE3WjsFlvFBodIIpM/TpB0g7ugR3V1ooeRv8eMzPoF/L5u
	6fhG34gH37ItATUOc+D+bTuJWF03/P0NZzrZDgUTN/3vyvtKrcSB90a17RYVDAo7HW2/tYpfYwnfO
	00Zce0Af5dwD2dSBjsqBn0K6zKR/6zKnZvdmmhDYrbBR+jfJOVY7u1SqZQO2OglyRlhB6FEYvqpDm
	AuaxTsew==;
Received: from ip6-localhost ([::1]:25440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxah-00DCxj-P4; Tue, 25 Nov 2025 18:16:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55004) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxU5-00DAcD-V8
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Wcm+DkST9X8Z5uIvlrOrjlhwuuIMAlhtD+9a0FDATLs=; b=qAQwZOtvDpHYJGCLSkyM34Lb8W
 rlhGMbM5gXlriakEsuUCsyQ/5aIyPdFrk7uXuuGeDuvAg2z4IUMfB926bFBrAsDtnLN5mU+mcIOY5
 kDz68GWm3QqcrQ6nG+0OZFMHeO+/iVTBTcucQNv4RuypF/snz/tM8Hk/y7bf0BY3rxOXeHz86W8oL
 PdeCj3ojhdm8JXfAWFNX9jcKoGC7yWLbq1c9+ZZ85BQa6nwZ8koHI2HiswDBh1ObHYjAOSRY/y5tC
 Mm460swcObsaq4paHBP2R71QhRQ9dwR6a/f0tdvXRS00BQGoapqilunl7kODJWhFY+TFlQ4EIS5gN
 D7Ynj4Ts1PNjoMN7EpLuCDLVLm3dyyuarDpTz0Kgr47bvZFBaeBEVu57d2Pyn+QhsmsQhz+Z2M3UM
 w2U+uY4cEHrzwKi+hA9YDnzzby5aZ8mXFmPOU7MQsrvpIiLCZMDW3ueniFbMMalidds43McPC7gdn
 8qaJzJHvvilUOiLQifNufDvn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxR5-00Fdne-38; Tue, 25 Nov 2025 18:06:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 079/145] smb: client: make use of
 smbdirect_connection_post_recv_io()
Date: Tue, 25 Nov 2025 18:55:25 +0100
Message-ID: <2af6681839e633530321ee980fbba5220c58bd7e.1764091285.git.metze@samba.org>
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

The only difference is that smbdirect_connection_post_recv_io()
returns early if the connection is already broken.

And that the error code from ib_dma_mapping_error() (currently only -ENOMEM
is possible) is returned instead of -EIO.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 46 ++-------------------------------------
 1 file changed, 2 insertions(+), 44 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 9e3557476b4c..ee753f6dffd8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -23,10 +23,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 	return &sc->parameters;
 }
 
-static int smbd_post_recv(
-		struct smbdirect_socket *sc,
-		struct smbdirect_recv_io *response);
-
 static int smbd_post_send_empty(struct smbdirect_socket *sc);
 
 static void destroy_mr_list(struct smbdirect_socket *sc);
@@ -403,7 +399,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 				break;
 
 			response->first_segment = false;
-			rc = smbd_post_recv(sc, response);
+			rc = smbdirect_connection_post_recv_io(response);
 			if (rc) {
 				log_rdma_recv(ERR,
 					"post_recv failed rc=%d\n", rc);
@@ -1059,44 +1055,6 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 	return rc;
 }
 
-/*
- * Post a receive request to the transport
- * The remote peer can only send data when a receive request is posted
- * The interaction is controlled by send/receive credit system
- */
-static int smbd_post_recv(
-		struct smbdirect_socket *sc, struct smbdirect_recv_io *response)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct ib_recv_wr recv_wr;
-	int rc = -EIO;
-
-	response->sge.addr = ib_dma_map_single(
-				sc->ib.dev, response->packet,
-				sp->max_recv_size, DMA_FROM_DEVICE);
-	if (ib_dma_mapping_error(sc->ib.dev, response->sge.addr))
-		return rc;
-
-	response->sge.length = sp->max_recv_size;
-	response->sge.lkey = sc->ib.pd->local_dma_lkey;
-
-	recv_wr.wr_cqe = &response->cqe;
-	recv_wr.next = NULL;
-	recv_wr.sg_list = &response->sge;
-	recv_wr.num_sge = 1;
-
-	rc = ib_post_recv(sc->ib.qp, &recv_wr, NULL);
-	if (rc) {
-		ib_dma_unmap_single(sc->ib.dev, response->sge.addr,
-				    response->sge.length, DMA_FROM_DEVICE);
-		response->sge.length = 0;
-		smbdirect_socket_schedule_cleanup(sc, rc);
-		log_rdma_recv(ERR, "ib_post_recv failed rc=%d\n", rc);
-	}
-
-	return rc;
-}
-
 /* Perform SMBD negotiate according to [MS-SMBD] 3.1.5.2 */
 static int smbd_negotiate(struct smbdirect_socket *sc)
 {
@@ -1108,7 +1066,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
-	rc = smbd_post_recv(sc, response);
+	rc = smbdirect_connection_post_recv_io(response);
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
-- 
2.43.0


