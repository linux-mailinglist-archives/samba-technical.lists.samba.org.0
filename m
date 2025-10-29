Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E84C1AE8A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qaGMiQf8X//0z+HQ9PmOrdSq5q4ReOkTiE7tPlYD4PU=; b=F/FR6L40M4xXqYqjN6RJxm0Oo2
	/Lpvy/2aNTFqgdgRPjDuFV40W+loFR6jvFiURYgRajVIUXWKktmtXEdD9MFLWm4u1cWm0x24YWNIS
	IOFbkFnPJ/hcY1aMZhp7qWYvobZlN8+xqXPrmsSvta0xAQBjw4r/52yYbKYl2gWbB4kDNWc/EDMcN
	zg9J9LtJN9djFuhWHRfGdNJTOmCNlO/6IZ6S2jkJWsZQcYmHWrAZBWdcD1x4YIY+PFTMh00bLLhrN
	H0tUKh/BTVJn8jwQey1TuXTCWAF6rjR6vGBfrfSoMCeuTpjlCoaj8fGHt8lyDtkDcX5mT76ol0E3p
	99AnR2Xw==;
Received: from ip6-localhost ([::1]:58922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6XQ-009Dq1-Ox; Wed, 29 Oct 2025 13:48:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51154) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ig-0098XI-Qk
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=qaGMiQf8X//0z+HQ9PmOrdSq5q4ReOkTiE7tPlYD4PU=; b=GxtaBCYun5TcQ8vKfu0TvisTtf
 zrL5Cd3Tt9Spey5Cd/A5LmqLVmN1sKQIf7sNlgx2zccBHMxsxOA/6jtLF6DqGskpAU1vk207h/bs3
 c0EmutzNWiq8MZiie8DOlmsCtcnqVwC6GZGEYPSs1MNhik/FNy9sTZFqc2kEgr63ok+e6okuMqeHk
 2HSvR0/tega7B6lEFsuJznTuI3kpq7svyfYTlzV/VL88kMLzNEgUTaXTExipTAP5VULMHwYX77Aac
 oBj+kpIfAA0qRrHUoOqpLOFl1r8X58pntJuk0YlnB9rtdtAfxRi5p1fMNQkaWNHWdqf6bq9/ODj/N
 z82lMd20lrQKM4oE5k84PGE8mHcPO4pvHspvQAr/thAbuYZAs8/I45citTgwgAsPvWX1C/Gl3wMWg
 e0/HkpzEP+587l8zK8ou8oMfa9Ucu7CPaK5V3H2BkjJK5izHr+IKcdBjwyRVxqFgrrEhZBmHMK3aF
 pVD6PKyiAkuti1yiy+hxD693;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ie-00Bcsn-0L; Wed, 29 Oct 2025 13:33:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 107/127] smb: server: make use of
 smbdirect_connection_{create, destroy}_qp()
Date: Wed, 29 Oct 2025 14:21:25 +0100
Message-ID: <81849231d13cdef37a0b6a160ac535be1cf6fd6f.1761742839.git.metze@samba.org>
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

It's good a use common code for this and it will allow us
to share more code in the next steps.

Calling ib_drain_qp() twice is ok.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 217 +--------------------------------
 1 file changed, 6 insertions(+), 211 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 526ad5c19b6e..2f55764a5f2e 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -257,6 +257,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	smbdirect_socket_set_logging(sc, NULL,
 				     smb_direct_logging_needed,
 				     smb_direct_logging_vaprintf);
+	sc->ib.poll_ctx = IB_POLL_WORKQUEUE;
 	sc->send_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	sc->recv_io.mem.gfp_mask = KSMBD_DEFAULT_GFP;
 	/*
@@ -318,11 +319,8 @@ static void free_transport(struct smb_direct_transport *t)
 	if (sc->rdma.cm_id)
 		rdma_lock_handler(sc->rdma.cm_id);
 
-	if (sc->ib.qp) {
+	if (sc->ib.qp)
 		ib_drain_qp(sc->ib.qp);
-		sc->ib.qp = NULL;
-		rdma_destroy_qp(sc->rdma.cm_id);
-	}
 
 	ksmbd_debug(RDMA, "drain the reassembly queue\n");
 	do {
@@ -340,12 +338,7 @@ static void free_transport(struct smb_direct_transport *t)
 	} while (recvmsg);
 	sc->recv_io.reassembly.data_length = 0;
 
-	if (sc->ib.send_cq)
-		ib_free_cq(sc->ib.send_cq);
-	if (sc->ib.recv_cq)
-		ib_free_cq(sc->ib.recv_cq);
-	if (sc->ib.pd)
-		ib_dealloc_pd(sc->ib.pd);
+	smbdirect_connection_destroy_qp(sc);
 	if (sc->rdma.cm_id) {
 		rdma_unlock_handler(sc->rdma.cm_id);
 		rdma_destroy_id(sc->rdma.cm_id);
@@ -1679,206 +1672,6 @@ static int smb_direct_init_params(struct smbdirect_socket *sc)
 	return 0;
 }
 
-static u32 smb_direct_rdma_rw_send_wrs(struct ib_device *dev, const struct ib_qp_init_attr *attr)
-{
-	/*
-	 * This could be split out of rdma_rw_init_qp()
-	 * and be a helper function next to rdma_rw_mr_factor()
-	 *
-	 * We can't check unlikely(rdma_rw_force_mr) here,
-	 * but that is most likely 0 anyway.
-	 */
-	u32 factor;
-
-	WARN_ON_ONCE(attr->port_num == 0);
-
-	/*
-	 * Each context needs at least one RDMA READ or WRITE WR.
-	 *
-	 * For some hardware we might need more, eventually we should ask the
-	 * HCA driver for a multiplier here.
-	 */
-	factor = 1;
-
-	/*
-	 * If the device needs MRs to perform RDMA READ or WRITE operations,
-	 * we'll need two additional MRs for the registrations and the
-	 * invalidation.
-	 */
-	if (rdma_protocol_iwarp(dev, attr->port_num) || dev->attrs.max_sgl_rd)
-		factor += 2;	/* inv + reg */
-
-	return factor * attr->cap.max_rdma_ctxs;
-}
-
-static int smb_direct_create_qpair(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	int ret;
-	struct ib_qp_cap qp_cap;
-	struct ib_qp_init_attr qp_attr;
-	u32 max_send_wr;
-	u32 rdma_send_wr;
-
-	/*
-	 * Note that {rdma,ib}_create_qp() will call
-	 * rdma_rw_init_qp() if cap->max_rdma_ctxs is not 0.
-	 * It will adjust cap->max_send_wr to the required
-	 * number of additional WRs for the RDMA RW operations.
-	 * It will cap cap->max_send_wr to the device limit.
-	 *
-	 * +1 for ib_drain_qp
-	 */
-	qp_cap.max_send_wr = sp->send_credit_target + 1;
-	qp_cap.max_recv_wr = sp->recv_credit_max + 1;
-	qp_cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
-	qp_cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
-	qp_cap.max_inline_data = 0;
-	qp_cap.max_rdma_ctxs = sc->rw_io.credits.max;
-
-	/*
-	 * Find out the number of max_send_wr
-	 * after rdma_rw_init_qp() adjusted it.
-	 *
-	 * We only do it on a temporary variable,
-	 * as rdma_create_qp() will trigger
-	 * rdma_rw_init_qp() again.
-	 */
-	memset(&qp_attr, 0, sizeof(qp_attr));
-	qp_attr.cap = qp_cap;
-	qp_attr.port_num = sc->rdma.cm_id->port_num;
-	rdma_send_wr = smb_direct_rdma_rw_send_wrs(sc->ib.dev, &qp_attr);
-	max_send_wr = qp_cap.max_send_wr + rdma_send_wr;
-
-	if (qp_cap.max_send_wr > sc->ib.dev->attrs.max_cqe ||
-	    qp_cap.max_send_wr > sc->ib.dev->attrs.max_qp_wr) {
-		pr_err("Possible CQE overrun: max_send_wr %d\n",
-		       qp_cap.max_send_wr);
-		pr_err("device %.*s reporting max_cqe %d max_qp_wr %d\n",
-		       IB_DEVICE_NAME_MAX,
-		       sc->ib.dev->name,
-		       sc->ib.dev->attrs.max_cqe,
-		       sc->ib.dev->attrs.max_qp_wr);
-		pr_err("consider lowering send_credit_target = %d\n",
-		       sp->send_credit_target);
-		return -EINVAL;
-	}
-
-	if (qp_cap.max_rdma_ctxs &&
-	    (max_send_wr >= sc->ib.dev->attrs.max_cqe ||
-	     max_send_wr >= sc->ib.dev->attrs.max_qp_wr)) {
-		pr_err("Possible CQE overrun: rdma_send_wr %d + max_send_wr %d = %d\n",
-		       rdma_send_wr, qp_cap.max_send_wr, max_send_wr);
-		pr_err("device %.*s reporting max_cqe %d max_qp_wr %d\n",
-		       IB_DEVICE_NAME_MAX,
-		       sc->ib.dev->name,
-		       sc->ib.dev->attrs.max_cqe,
-		       sc->ib.dev->attrs.max_qp_wr);
-		pr_err("consider lowering send_credit_target = %d, max_rdma_ctxs = %d\n",
-		       sp->send_credit_target, qp_cap.max_rdma_ctxs);
-		return -EINVAL;
-	}
-
-	if (qp_cap.max_recv_wr > sc->ib.dev->attrs.max_cqe ||
-	    qp_cap.max_recv_wr > sc->ib.dev->attrs.max_qp_wr) {
-		pr_err("Possible CQE overrun: max_recv_wr %d\n",
-		       qp_cap.max_recv_wr);
-		pr_err("device %.*s reporting max_cqe %d max_qp_wr %d\n",
-		       IB_DEVICE_NAME_MAX,
-		       sc->ib.dev->name,
-		       sc->ib.dev->attrs.max_cqe,
-		       sc->ib.dev->attrs.max_qp_wr);
-		pr_err("consider lowering receive_credit_max = %d\n",
-		       sp->recv_credit_max);
-		return -EINVAL;
-	}
-
-	if (qp_cap.max_send_sge > sc->ib.dev->attrs.max_send_sge ||
-	    qp_cap.max_recv_sge > sc->ib.dev->attrs.max_recv_sge) {
-		pr_err("device %.*s max_send_sge/max_recv_sge = %d/%d too small\n",
-		       IB_DEVICE_NAME_MAX,
-		       sc->ib.dev->name,
-		       sc->ib.dev->attrs.max_send_sge,
-		       sc->ib.dev->attrs.max_recv_sge);
-		return -EINVAL;
-	}
-
-	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
-	if (IS_ERR(sc->ib.pd)) {
-		pr_err("Can't create RDMA PD\n");
-		ret = PTR_ERR(sc->ib.pd);
-		sc->ib.pd = NULL;
-		return ret;
-	}
-
-	sc->ib.send_cq = ib_alloc_cq_any(sc->ib.dev, sc,
-					 max_send_wr,
-					 IB_POLL_WORKQUEUE);
-	if (IS_ERR(sc->ib.send_cq)) {
-		pr_err("Can't create RDMA send CQ\n");
-		ret = PTR_ERR(sc->ib.send_cq);
-		sc->ib.send_cq = NULL;
-		goto err;
-	}
-
-	sc->ib.recv_cq = ib_alloc_cq_any(sc->ib.dev, sc,
-					 qp_cap.max_recv_wr,
-					 IB_POLL_WORKQUEUE);
-	if (IS_ERR(sc->ib.recv_cq)) {
-		pr_err("Can't create RDMA recv CQ\n");
-		ret = PTR_ERR(sc->ib.recv_cq);
-		sc->ib.recv_cq = NULL;
-		goto err;
-	}
-
-	/*
-	 * We reset completely here!
-	 * As the above use was just temporary
-	 * to calc max_send_wr and rdma_send_wr.
-	 *
-	 * rdma_create_qp() will trigger rdma_rw_init_qp()
-	 * again if max_rdma_ctxs is not 0.
-	 */
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
-	ret = rdma_create_qp(sc->rdma.cm_id, sc->ib.pd, &qp_attr);
-	if (ret) {
-		pr_err("Can't create RDMA QP: %d\n", ret);
-		goto err;
-	}
-
-	sc->ib.qp = sc->rdma.cm_id->qp;
-	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
-
-	return 0;
-err:
-	if (sc->ib.qp) {
-		sc->ib.qp = NULL;
-		rdma_destroy_qp(sc->rdma.cm_id);
-	}
-	if (sc->ib.recv_cq) {
-		ib_destroy_cq(sc->ib.recv_cq);
-		sc->ib.recv_cq = NULL;
-	}
-	if (sc->ib.send_cq) {
-		ib_destroy_cq(sc->ib.send_cq);
-		sc->ib.send_cq = NULL;
-	}
-	if (sc->ib.pd) {
-		ib_dealloc_pd(sc->ib.pd);
-		sc->ib.pd = NULL;
-	}
-	return ret;
-}
-
 static int smb_direct_prepare(struct ksmbd_transport *t)
 {
 	struct smb_direct_transport *st = SMBD_TRANS(t);
@@ -1970,6 +1763,8 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 {
 	int ret;
 
+	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
+
 	ret = smb_direct_init_params(sc);
 	if (ret) {
 		pr_err("Can't configure RDMA parameters\n");
@@ -1982,7 +1777,7 @@ static int smb_direct_connect(struct smbdirect_socket *sc)
 		return ret;
 	}
 
-	ret = smb_direct_create_qpair(sc);
+	ret = smbdirect_connection_create_qp(sc);
 	if (ret) {
 		pr_err("Can't accept RDMA client: %d\n", ret);
 		return ret;
-- 
2.43.0


