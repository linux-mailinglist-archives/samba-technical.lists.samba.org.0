Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665FBE2F67
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 12:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=X2g54oWNDBGNparQs8hvoIBkeSqBxvx1vQ+f3Th9eE4=; b=FY2wkUcrpx957M2357or+H3R/X
	SNXza/ZzDhF5RLFmgodwnppFDaEr8KcJlhEym3DWlbLmVYdm3XCB2vsCsrn3rmirz2Zl5akb0TigH
	jKlsuZTGIpm6jOiEjaEXutIFhFVSPkAWTq4fd1AzAmJaORtPcuYeD5efg3U8Z+FsafR2SJOxaVLp9
	4OyjRF1nQCoHOpdJ/OvoRFoyc5gKqitp/lCwz6RlvcWOXbymdW8IvZNNeHCoJrUsK7+SeBKul8g2m
	S7GcT1YKdcdggXpCyw/a9oj9T6gWSkjfgdpYHNTA2hlNFfDx1fBlWJJFJ10uz2NXQBw9AP7VHxyq8
	mDtwSUHg==;
Received: from ip6-localhost ([::1]:37774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9Lct-007w4K-Ka; Thu, 16 Oct 2025 10:54:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59900) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9Lco-007w4D-Qz
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 10:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=X2g54oWNDBGNparQs8hvoIBkeSqBxvx1vQ+f3Th9eE4=; b=eAPErlHiUPIit2WaJf0sJaoFDK
 BCbu1H4hpIhdZLeU22w/RJStYOGAjB1tYpdgMJTu0e/R1eibByEmfzsZgQqFd7knN1GSwP7VJFUWG
 hofn/KgxsTZWgDrt8N7giIfCO9tA0taK98WRCpBjGWJ+vjfVTCmYQA0fz3WWspXOKRMmJcYaDG3us
 HkV7bLXiGGkh4mJltBhYb4AxQG9617Jg4DW4ATv4+9Icb7fo3VIfvL+8ourgxGrqRbBR7kmqMaWGF
 zvOnCbXTkS0RGv8qumSCZQv45AcO0S1C/hhP7+T7rwumWaKOzhLVjYA08IKi0lFOWLEqQEKyPgw+y
 D4PvGsvOhLgBPemJ893TML7kx0HT31A+zws5QtQ3LAuhYDSN2yEtAqDl0k+o3HVXV5fMqdNghz8Fo
 qS6T5MgjB0tQURiFgtLgAVUIdeUFlT4Nok5cgEMi/F2Ty0ewaiaC9I4hLrvrUTs+Jq4lchyZz7uXZ
 sSIWhBzm61VjspgmR7Tm3q3/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9Lcn-009XFT-1K; Thu, 16 Oct 2025 10:54:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: allocate enough space for MR WRs and
 ib_drain_qp()
Date: Thu, 16 Oct 2025 12:54:21 +0200
Message-ID: <20251016105421.1234955-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

The IB_WR_REG_MR and IB_WR_LOCAL_INV operations for smbdirect_mr_io
structures should never fail because the submission or completion queues
are too small. So we allocate more send_wr depending on the (local) max
number of MRs.

While there also add additional space for ib_drain_qp().

This should make sure ib_post_send() will never fail
because the submission queue is full.

Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Fixes: cc55f65dd352 ("smb: client: make use of common smbdirect_socket_parameters")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 49e2df3ad1f0..068e1069eca5 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1767,6 +1767,7 @@ static struct smbd_connection *_smbd_get_connection(
 	struct smbdirect_socket *sc;
 	struct smbdirect_socket_parameters *sp;
 	struct rdma_conn_param conn_param;
+	struct ib_qp_cap qp_cap;
 	struct ib_qp_init_attr qp_attr;
 	struct sockaddr_in *addr_in = (struct sockaddr_in *) dstaddr;
 	struct ib_port_immutable port_immutable;
@@ -1838,6 +1839,25 @@ static struct smbd_connection *_smbd_get_connection(
 		goto config_failed;
 	}
 
+	sp->responder_resources =
+		min_t(u8, sp->responder_resources,
+		      sc->ib.dev->attrs.max_qp_rd_atom);
+	log_rdma_mr(INFO, "responder_resources=%d\n",
+		sp->responder_resources);
+
+	/*
+	 * We use allocate sp->responder_resources * 2 MRs
+	 * and each MR needs WRs for REG and INV, so
+	 * we use '* 4'.
+	 *
+	 * +1 fot ib_drain_qp()
+	 */
+	memset(&qp_cap, 0, sizeof(qp_cap));
+	qp_cap.max_send_wr = sp->send_credit_target + sp->responder_resources * 4 + 1;
+	qp_cap.max_recv_wr = sp->recv_credit_max + 1;
+	qp_cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
+	qp_cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
+
 	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
 	if (IS_ERR(sc->ib.pd)) {
 		rc = PTR_ERR(sc->ib.pd);
@@ -1848,7 +1868,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	sc->ib.send_cq =
 		ib_alloc_cq_any(sc->ib.dev, sc,
-				sp->send_credit_target, IB_POLL_SOFTIRQ);
+				qp_cap.max_send_wr, IB_POLL_SOFTIRQ);
 	if (IS_ERR(sc->ib.send_cq)) {
 		sc->ib.send_cq = NULL;
 		goto alloc_cq_failed;
@@ -1856,7 +1876,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	sc->ib.recv_cq =
 		ib_alloc_cq_any(sc->ib.dev, sc,
-				sp->recv_credit_max, IB_POLL_SOFTIRQ);
+				qp_cap.max_recv_wr, IB_POLL_SOFTIRQ);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		sc->ib.recv_cq = NULL;
 		goto alloc_cq_failed;
@@ -1865,11 +1885,7 @@ static struct smbd_connection *_smbd_get_connection(
 	memset(&qp_attr, 0, sizeof(qp_attr));
 	qp_attr.event_handler = smbd_qp_async_error_upcall;
 	qp_attr.qp_context = sc;
-	qp_attr.cap.max_send_wr = sp->send_credit_target;
-	qp_attr.cap.max_recv_wr = sp->recv_credit_max;
-	qp_attr.cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
-	qp_attr.cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
-	qp_attr.cap.max_inline_data = 0;
+	qp_attr.cap = qp_cap;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
 	qp_attr.qp_type = IB_QPT_RC;
 	qp_attr.send_cq = sc->ib.send_cq;
@@ -1883,12 +1899,6 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 	sc->ib.qp = sc->rdma.cm_id->qp;
 
-	sp->responder_resources =
-		min_t(u8, sp->responder_resources,
-		      sc->ib.dev->attrs.max_qp_rd_atom);
-	log_rdma_mr(INFO, "responder_resources=%d\n",
-		sp->responder_resources);
-
 	memset(&conn_param, 0, sizeof(conn_param));
 	conn_param.initiator_depth = sp->initiator_depth;
 	conn_param.responder_resources = sp->responder_resources;
-- 
2.43.0


