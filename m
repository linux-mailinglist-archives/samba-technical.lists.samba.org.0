Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6124C1AD22
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+hM/sxpj38gsUiEeGPnkyOdMsaYtPf4EJqmi+YW7ekg=; b=Wgj+v4jrYptw7ZEVcX6uDIpPOm
	DJDXIorrKnWYz3vuZpArCxNXF/er4Q60NW3/j1CK5zs8cqOJfLcnSGoNvra+Qn1g8NbAmPAu2mAS2
	MvP1JHFvmi+dDplp7pQXj7+VLLvZN0dmzbP7r5+5oyPJd9HM9VojrSsCzG20YfWbVq4VTZ3jqfkJN
	baAnhYGCfwXgMNXlh9rWumB3gFEAku9glM/HiCxkC9g4aG878njFw5DNN1ev62As0CzRH0ecFr8xw
	E5EeaSPbMUwqr40FH0YhIu0w8xyrO1SKOr+qUj/lTMXegs7djyOUYh3whxMCUUV/IWq4USuyrwfB0
	w4JR/rVQ==;
Received: from ip6-localhost ([::1]:35814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6QD-009B81-FG; Wed, 29 Oct 2025 13:41:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36636) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FH-0097P4-RW
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+hM/sxpj38gsUiEeGPnkyOdMsaYtPf4EJqmi+YW7ekg=; b=pv5Hh79GhV8BdP7Pl1HafO/awU
 0drbef6HicSWZfSmA4s6iHDoL1l9i4sj86JbP0Xf1EGJzpRMx0g1FR7dclN4H0RI6qXHWS/d5QHMD
 qwczIs6WWygw9HjvZpTP5SIt7GJ4mPOCvQwHYTleVZyiNW4i5wn6EaRog9ixavWxI3tQ+jO5sGTeC
 PvRjyBeI8Nr/vuQlQibKRx4NEgIl4eiXowmqgdPDvoyaWkCRElj5TeCyF7+KMrJc37SYHBLewD8Ee
 8zrtBPtTOsF4/eCYiH4u+NYMvFBderEsyQHgJ/coadsTO6A49saWZryYtaaaYWgPkeQlbbv6Pxydm
 YaSiL85Pk0E6GBa348kkCASAQ/Ab/VyAsUg3umy14Z9c/fQmIgF9YPikvW5msjno5DYerdLt8tX41
 F+Tt8iBWMBDydaBa2W5g991M7xVUj5j94qCF/YaB8Agntld+jFudq9ZoW6kktOkQ8dbY8qprdDXhP
 ZCOdqiR2cGDTcVirvqkfKLCT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FF-00BcIL-0i; Wed, 29 Oct 2025 13:29:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 074/127] smb: client: make use of
 smbdirect_connection_post_recv_io()
Date: Wed, 29 Oct 2025 14:20:52 +0100
Message-ID: <26a2cb57eababef21fdfdce0bfa20f8a449a5c58.1761742839.git.metze@samba.org>
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
index 60582394ba29..9dfee81396c7 100644
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
@@ -1058,44 +1054,6 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
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
-		smbdirect_connection_schedule_disconnect(sc, rc);
-		log_rdma_recv(ERR, "ib_post_recv failed rc=%d\n", rc);
-	}
-
-	return rc;
-}
-
 /* Perform SMBD negotiate according to [MS-SMBD] 3.1.5.2 */
 static int smbd_negotiate(struct smbdirect_socket *sc)
 {
@@ -1107,7 +1065,7 @@ static int smbd_negotiate(struct smbdirect_socket *sc)
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
 
 	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REP;
-	rc = smbd_post_recv(sc, response);
+	rc = smbdirect_connection_post_recv_io(response);
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
-- 
2.43.0


