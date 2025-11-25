Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 000CCC8685B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y3HD3YQrMs7qIk/rShvsdtWnSYXyMydn2CUHAPjzLWY=; b=XlYTuMBo3fSS6mXZcNIFfYD/SD
	KX2QnyUKqXZatGuKcQRxKKVlImfqwJFAYxFWSkR3Cr9xQyfvhUba4f4syxVHTr7kDXDNi/Fbe0hcG
	wCuVnEQ5+SZRtVcdrHBucKVan2AXRsxux049ykfjPTKs9KIIA078WF5/0E1lwmPUGrccSCvcxjF4b
	V4cR36+iHkbJJUY+hynxWvG692h5FRWgdsNUDctin2w47hsnu9ohCpDf/mc4EJC9yC4TUfBgv2ZeM
	uOOV9RX1McWgiIgiOfnspQsifB9E1VX5Si3VTpLN2JihxXTZSqKxSzs9sIVcVXySzWHq8G/cEshXQ
	ZHkN7BBg==;
Received: from ip6-localhost ([::1]:42870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxZ7-00DCR2-1i; Tue, 25 Nov 2025 18:15:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54980) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxU1-00DAbH-QQ
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Y3HD3YQrMs7qIk/rShvsdtWnSYXyMydn2CUHAPjzLWY=; b=wNvkPoXk0rmOytwlFQdQbFweb3
 QJMBNGZ0+u59c/sMAXGvMGP03BQZQujUIUOkeB/iSL9/rYnRjBLJpdsPwMp1P762r3FZkmaaW27Yp
 AXMeTH7bTZcFJwnO7NYYQERxCcJrPN+4uwVxIfJIOnZ2sTLa4U1RRd+2nqITDvzLqLMxKTzJxeqpd
 U7NlcbZnUver/xDweg2ld3kipVpewN11T7egyD09xF2o/PAkmBGGAMauL/zCF+k1TxcmQkGXhjVqp
 3gHf1TPqxth1NkBPrDjH7B1vr9o0XPifNvBpbOrqpRtb3LZ6cO80/k1dZywIUoaodQhbxMLp/hoHl
 zwL7caAZUashdHKVAMkppQePYV2BwdXuWgOpe8I4O2J3ehhNISPrCblltMoO1xKvj2LVd+CTwrKea
 APbnuQnBelQ/VSMJUC5dwPFSV0ONRRnrPz5u7xcA5DH1rUyRRb5/JwooK77Q8+pzgTYWDLA63p7WH
 0xmCIzbHXAFOPaHumQs7slZX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQr-00Fdlx-1l; Tue, 25 Nov 2025 18:06:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 077/145] smb: client: make use of
 smbdirect_connection_{create, destroy}_qp()
Date: Tue, 25 Nov 2025 18:55:23 +0100
Message-ID: <8b7a1c5c7e537a9ec97cf63e6c965a18650635b2.1764091285.git.metze@samba.org>
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

It's good a use common code for this and it will allow us
to share more code in the next steps.

Calling ib_drain_qp() twice is ok.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 105 +++-----------------------------------
 1 file changed, 7 insertions(+), 98 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8d5af639ae1f..04ab25899ab8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1196,10 +1196,8 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "cancelling recv_io.posted.refill_work\n");
 	disable_work_sync(&sc->recv_io.posted.refill_work);
 
-	log_rdma_event(INFO, "destroying qp\n");
+	log_rdma_event(INFO, "drain qp\n");
 	ib_drain_qp(sc->ib.qp);
-	rdma_destroy_qp(sc->rdma.cm_id);
-	sc->ib.qp = NULL;
 
 	log_rdma_event(INFO, "cancelling idle timer\n");
 	disable_delayed_work_sync(&sc->idle.timer_work);
@@ -1225,9 +1223,8 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "freeing mr list\n");
 	destroy_mr_list(sc);
 
-	ib_free_cq(sc->ib.send_cq);
-	ib_free_cq(sc->ib.recv_cq);
-	ib_dealloc_pd(sc->ib.pd);
+	log_rdma_event(INFO, "destroying qp\n");
+	smbdirect_connection_destroy_qp(sc);
 	rdma_destroy_id(sc->rdma.cm_id);
 
 	/* free mempools */
@@ -1287,8 +1284,6 @@ static struct smbd_connection *_smbd_get_connection(
 	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct rdma_conn_param conn_param;
-	struct ib_qp_cap qp_cap;
-	struct ib_qp_init_attr qp_attr;
 	struct sockaddr_in *addr_in = (struct sockaddr_in *) dstaddr;
 	struct ib_port_immutable port_immutable;
 	__be32 ird_ord_hdr[2];
@@ -1324,6 +1319,7 @@ static struct smbd_connection *_smbd_get_connection(
 		goto create_wq_failed;
 	smbdirect_socket_prepare_create(sc, sp, workqueue);
 	smbdirect_socket_set_logging(sc, NULL, smbd_logging_needed, smbd_logging_vaprintf);
+	sc->ib.poll_ctx = IB_POLL_SOFTIRQ;
 	/*
 	 * from here we operate on the copy.
 	 */
@@ -1335,94 +1331,17 @@ static struct smbd_connection *_smbd_get_connection(
 		goto create_id_failed;
 	}
 
-	if (sp->send_credit_target > sc->ib.dev->attrs.max_cqe ||
-	    sp->send_credit_target > sc->ib.dev->attrs.max_qp_wr) {
-		log_rdma_event(ERR, "consider lowering send_credit_target = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
-			       sp->send_credit_target,
-			       sc->ib.dev->attrs.max_cqe,
-			       sc->ib.dev->attrs.max_qp_wr);
-		goto config_failed;
-	}
-
-	if (sp->recv_credit_max > sc->ib.dev->attrs.max_cqe ||
-	    sp->recv_credit_max > sc->ib.dev->attrs.max_qp_wr) {
-		log_rdma_event(ERR, "consider lowering receive_credit_max = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
-			       sp->recv_credit_max,
-			       sc->ib.dev->attrs.max_cqe,
-			       sc->ib.dev->attrs.max_qp_wr);
-		goto config_failed;
-	}
-
-	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_SEND_IO_MAX_SGE ||
-	    sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
-		log_rdma_event(ERR,
-			"device %.*s max_send_sge/max_recv_sge = %d/%d too small\n",
-			IB_DEVICE_NAME_MAX,
-			sc->ib.dev->name,
-			sc->ib.dev->attrs.max_send_sge,
-			sc->ib.dev->attrs.max_recv_sge);
-		goto config_failed;
-	}
-
 	sp->responder_resources =
 		min_t(u8, sp->responder_resources,
 		      sc->ib.dev->attrs.max_qp_rd_atom);
 	log_rdma_mr(INFO, "responder_resources=%d\n",
 		sp->responder_resources);
 
-	/*
-	 * We use allocate sp->responder_resources * 2 MRs
-	 * and each MR needs WRs for REG and INV, so
-	 * we use '* 4'.
-	 *
-	 * +1 for ib_drain_qp()
-	 */
-	memset(&qp_cap, 0, sizeof(qp_cap));
-	qp_cap.max_send_wr = sp->send_credit_target + sp->responder_resources * 4 + 1;
-	qp_cap.max_recv_wr = sp->recv_credit_max + 1;
-	qp_cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
-	qp_cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
-
-	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
-	if (IS_ERR(sc->ib.pd)) {
-		rc = PTR_ERR(sc->ib.pd);
-		sc->ib.pd = NULL;
-		log_rdma_event(ERR, "ib_alloc_pd() returned %d\n", rc);
-		goto alloc_pd_failed;
-	}
-
-	sc->ib.send_cq =
-		ib_alloc_cq_any(sc->ib.dev, sc,
-				qp_cap.max_send_wr, IB_POLL_SOFTIRQ);
-	if (IS_ERR(sc->ib.send_cq)) {
-		sc->ib.send_cq = NULL;
-		goto alloc_cq_failed;
-	}
-
-	sc->ib.recv_cq =
-		ib_alloc_cq_any(sc->ib.dev, sc,
-				qp_cap.max_recv_wr, IB_POLL_SOFTIRQ);
-	if (IS_ERR(sc->ib.recv_cq)) {
-		sc->ib.recv_cq = NULL;
-		goto alloc_cq_failed;
-	}
-
-	memset(&qp_attr, 0, sizeof(qp_attr));
-	qp_attr.event_handler = smbdirect_connection_qp_event_handler;
-	qp_attr.qp_context = sc;
-	qp_attr.cap = qp_cap;
-	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
-	qp_attr.qp_type = IB_QPT_RC;
-	qp_attr.send_cq = sc->ib.send_cq;
-	qp_attr.recv_cq = sc->ib.recv_cq;
-	qp_attr.port_num = ~0;
-
-	rc = rdma_create_qp(sc->rdma.cm_id, sc->ib.pd, &qp_attr);
+	rc = smbdirect_connection_create_qp(sc);
 	if (rc) {
-		log_rdma_event(ERR, "rdma_create_qp failed %i\n", rc);
+		log_rdma_event(ERR, "smbdirect_connection_create_qp failed %i\n", rc);
 		goto create_qp_failed;
 	}
-	sc->ib.qp = sc->rdma.cm_id->qp;
 
 	memset(&conn_param, 0, sizeof(conn_param));
 	conn_param.initiator_depth = sp->initiator_depth;
@@ -1515,19 +1434,9 @@ static struct smbd_connection *_smbd_get_connection(
 
 allocate_cache_failed:
 rdma_connect_failed:
-	rdma_destroy_qp(sc->rdma.cm_id);
+	smbdirect_connection_destroy_qp(sc);
 
 create_qp_failed:
-alloc_cq_failed:
-	if (sc->ib.send_cq)
-		ib_free_cq(sc->ib.send_cq);
-	if (sc->ib.recv_cq)
-		ib_free_cq(sc->ib.recv_cq);
-
-	ib_dealloc_pd(sc->ib.pd);
-
-alloc_pd_failed:
-config_failed:
 	rdma_destroy_id(sc->rdma.cm_id);
 
 create_id_failed:
-- 
2.43.0


