Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45832BE2F6D
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 12:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Z7lu4OkluAg5r/TW3Mu7CzS2OJfNOjhLfNgq5NBEX44=; b=50Qq4vL0jA6ApS49c9Pjxfu8oX
	2RE0VfNbCwbcS6QW/bFiTn3i4eK5XpzDcBfSQ3fQnsSB1Vtt2XfvFP4bX7c24PxqA2V1yLEw7pctd
	CcWpnDlsxdARia8yZ5jMwN5IsRCM8yNYgEP2PiDdaMWWmlX0RXZJCzWuqiyTzuLzzss4/wr1QnhIO
	8pxB3Us9JkjqzGFp1zxMLqmg1Q943YlO7ahjAY7H2eSvsC/dl1++xBS64Osg8yosDW60CrSVj8pRk
	28p1J7l9qxaG8caU9yDCHYxOjoymtTXXk9UV41F3OCNpbI+CBDo186uVET0Mw3r59+d5s2t8mo7d6
	nTsLRLsA==;
Received: from ip6-localhost ([::1]:34830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9LdZ-007w8z-FC; Thu, 16 Oct 2025 10:55:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33604) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9LdR-007w89-Ki
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 10:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Z7lu4OkluAg5r/TW3Mu7CzS2OJfNOjhLfNgq5NBEX44=; b=rWRFyw0m0XAclGeMVdGRAe8fK4
 c1qT54X1W1WN5hX31m/QXwfYMpMURhLP7Ct25d6w9vESbl3LoTWIB+J49FPp3b48iw9lr4jdK6+is
 g4ZpByMFqvbaecwNejM/hctNhxvu/KIU160ZZYc1yL9GjRMBGg+4Fb7rMeceyNy4h8e3n0bk7h5ZG
 k5htz4DNzYD3aM8AB/KRT4HWZ25VST+y7VeHgl4dQAV2S6YSAnLmahNKKI+6eXxTx+LN4jgmFxjsm
 QLKBgngPQrxnbXD38yDtMEekTukSEaM/cLfjxe+/xG17i2xO+na0HwlOTQqw2EHf92i725HTrhTlz
 qThS4x8MWsrNgkcQI/HRw3VWNsApLoaZOCHG3EzOjy9hwMIAJ7qzV7GLe6eqajY/rI0e2p/fWc7QO
 2GY0Hoy+XgB9bYxyyuVxlPYZgKM5JuPkaVqY8NDWjX12qRKOdvjMQeBU7bwb8EnpJtio2wOUB7Zog
 IzGfxfmqhkmRBAEdhh8o0t2J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9LdQ-009XGz-1f; Thu, 16 Oct 2025 10:55:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: allocate enough space for RW WRs and
 ib_drain_qp()
Date: Thu, 16 Oct 2025 12:55:00 +0200
Message-ID: <20251016105500.1235026-1-metze@samba.org>
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

Make use of rdma_rw_mr_factor() to calculate the number of rw
credits and the number of pages per RDMA RW operation.

We get the same numbers for iWarp connections, tested
with siw.ko and irdma.ko (in iWarp mode).

siw:

CIFS: max_qp_rd_atom=128, max_fast_reg_page_list_len = 256
CIFS: max_sgl_rd=0, max_sge_rd=1
CIFS: responder_resources=32 max_frmr_depth=256 mr_io.type=0
CIFS: max_send_wr 384, device reporting max_cqe 3276800 max_qp_wr 32768
ksmbd: max_fast_reg_page_list_len = 256, max_sgl_rd=0, max_sge_rd=1
ksmbd: device reporting max_cqe 3276800 max_qp_wr 32768
ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
ksmbd: New sc->rw_io.credits: max = 9, num_pages = 256, maxpages=2048
ksmbd: Info: rdma_send_wr 27 + max_send_wr 256 = 283

irdma (in iWarp mode):

CIFS: max_qp_rd_atom=127, max_fast_reg_page_list_len = 262144
CIFS: max_sgl_rd=0, max_sge_rd=13
CIFS: responder_resources=32 max_frmr_depth=2048 mr_io.type=0
CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
ksmbd: max_fast_reg_page_list_len = 262144, max_sgl_rd=0, max_sge_rd=13
ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
ksmbd: New sc->rw_io.credits: max = 9, num_pages = 256, maxpages=2048
ksmbd: rdma_send_wr 27 + max_send_wr 256 = 283

This means that we get the different correct numbers for ROCE,
tested with rdma_rxe.ko and irdma.ko (in RoCEv2 mode).

rxe:

CIFS: max_qp_rd_atom=128, max_fast_reg_page_list_len = 512
CIFS: max_sgl_rd=0, max_sge_rd=32
CIFS: responder_resources=32 max_frmr_depth=512 mr_io.type=0
CIFS: max_send_wr 384, device reporting max_cqe 32767 max_qp_wr 1048576
ksmbd: max_fast_reg_page_list_len = 512, max_sgl_rd=0, max_sge_rd=32
ksmbd: device reporting max_cqe 32767 max_qp_wr 1048576
ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
ksmbd: New sc->rw_io.credits: max = 65, num_pages = 32, maxpages=2048
ksmbd: rdma_send_wr 65 + max_send_wr 256 = 321

irdma (in RoCEv2 mode):

CIFS: max_qp_rd_atom=127, max_fast_reg_page_list_len = 262144,
CIFS: max_sgl_rd=0, max_sge_rd=13
CIFS: responder_resources=32 max_frmr_depth=2048 mr_io.type=0
CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
ksmbd: max_fast_reg_page_list_len = 262144, max_sgl_rd=0, max_sge_rd=13
ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256,
ksmbd: New sc->rw_io.credits: max = 159, num_pages = 13, maxpages=2048
ksmbd: rdma_send_wr 159 + max_send_wr 256 = 415

And rely on rdma_rw_init_qp() to setup ib_mr_pool_init() for
RW MRs.

It seems the code was implemented before the rdma_rw_* layer
was fully established in the kernel.

While there also add additional space for ib_drain_qp().

This should make sure ib_post_send() will never fail
because the submission queue is full.

Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDMA read/write")
Fixes: 4c564f03e23b ("smb: server: make use of common smbdirect_socket")
Fixes: 177368b99243 ("smb: server: make use of common smbdirect_socket_parameters")
Fixes: 95475d8886bd ("smb: server: make use smbdirect_socket.rw_io.credits")
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 197 +++++++++++++++++++++------------
 1 file changed, 126 insertions(+), 71 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 94851ff25a02..43d812faab53 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1881,9 +1881,8 @@ static int smb_direct_init_params(struct smbdirect_socket *sc,
 				  struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
-	struct ib_device *device = sc->ib.dev;
-	int max_send_sges, max_rw_wrs, max_send_wrs;
-	unsigned int max_sge_per_wr, wrs_per_credit;
+	int max_send_sges;
+	unsigned int maxpages;
 
 	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
 	 * SMB2 response could be mapped.
@@ -1894,63 +1893,29 @@ static int smb_direct_init_params(struct smbdirect_socket *sc,
 		return -EINVAL;
 	}
 
-	/* Calculate the number of work requests for RDMA R/W.
-	 * The maximum number of pages which can be registered
-	 * with one Memory region can be transferred with one
-	 * R/W credit. And at least 4 work requests for each credit
-	 * are needed for MR registration, RDMA R/W, local & remote
-	 * MR invalidation.
-	 */
-	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(sc);
-	sc->rw_io.credits.max = DIV_ROUND_UP(sp->max_read_write_size,
-					 (sc->rw_io.credits.num_pages - 1) *
-					 PAGE_SIZE);
-
-	max_sge_per_wr = min_t(unsigned int, device->attrs.max_send_sge,
-			       device->attrs.max_sge_rd);
-	max_sge_per_wr = max_t(unsigned int, max_sge_per_wr,
-			       max_send_sges);
-	wrs_per_credit = max_t(unsigned int, 4,
-			       DIV_ROUND_UP(sc->rw_io.credits.num_pages,
-					    max_sge_per_wr) + 1);
-	max_rw_wrs = sc->rw_io.credits.max * wrs_per_credit;
-
-	max_send_wrs = sp->send_credit_target + max_rw_wrs;
-	if (max_send_wrs > device->attrs.max_cqe ||
-	    max_send_wrs > device->attrs.max_qp_wr) {
-		pr_err("consider lowering send_credit_target = %d\n",
-		       sp->send_credit_target);
-		pr_err("Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
-		       device->attrs.max_cqe, device->attrs.max_qp_wr);
-		return -EINVAL;
-	}
-
-	if (sp->recv_credit_max > device->attrs.max_cqe ||
-	    sp->recv_credit_max > device->attrs.max_qp_wr) {
-		pr_err("consider lowering receive_credit_max = %d\n",
-		       sp->recv_credit_max);
-		pr_err("Possible CQE overrun, device reporting max_cpe %d max_qp_wr %d\n",
-		       device->attrs.max_cqe, device->attrs.max_qp_wr);
-		return -EINVAL;
-	}
-
-	if (device->attrs.max_send_sge < SMBDIRECT_SEND_IO_MAX_SGE) {
-		pr_err("warning: device max_send_sge = %d too small\n",
-		       device->attrs.max_send_sge);
-		return -EINVAL;
-	}
-	if (device->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
-		pr_err("warning: device max_recv_sge = %d too small\n",
-		       device->attrs.max_recv_sge);
-		return -EINVAL;
-	}
+	maxpages = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE);
+	sc->rw_io.credits.max = rdma_rw_mr_factor(sc->ib.dev,
+						  sc->rdma.cm_id->port_num,
+						  maxpages);
+	sc->rw_io.credits.num_pages = DIV_ROUND_UP(maxpages, sc->rw_io.credits.max);
+	/* add one extra in order to handle unaligned pages */
+	sc->rw_io.credits.max += 1;
 
 	sc->recv_io.credits.target = 1;
 
 	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
 
-	cap->max_send_wr = max_send_wrs;
-	cap->max_recv_wr = sp->recv_credit_max;
+	/*
+	 * Note that {rdma,ib}_create_qp() will call
+	 * rdma_rw_init_qp() if cap->max_rdma_ctxs is not 0.
+	 * It will adjust cap->max_send_wr to the required
+	 * number of additional WRs for the RDMA RW operations.
+	 * It will cap cap->max_send_wr to the device limit.
+	 *
+	 * +1 for ib_drain_qp
+	 */
+	cap->max_send_wr = sp->send_credit_target + 1;
+	cap->max_recv_wr = sp->recv_credit_max + 1;
 	cap->max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
 	cap->max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
 	cap->max_inline_data = 0;
@@ -2028,13 +1993,108 @@ static int smb_direct_create_pools(struct smbdirect_socket *sc)
 	return -ENOMEM;
 }
 
+static u32 smbdirect_rdma_rw_send_wrs(struct ib_device *dev, struct ib_qp_init_attr *attr)
+{
+	/*
+	 * This could be split out of rdma_rw_init_qp()
+	 * and be a helper function next to rdma_rw_mr_factor()
+	 *
+	 * We can't check unlikely(rdma_rw_force_mr) here,
+	 * but that is most likely 0 anyway.
+	 */
+	u32 factor;
+
+	WARN_ON_ONCE(attr->port_num == 0);
+
+	/*
+	 * Each context needs at least one RDMA READ or WRITE WR.
+	 *
+	 * For some hardware we might need more, eventually we should ask the
+	 * HCA driver for a multiplier here.
+	 */
+	factor = 1;
+
+	/*
+	 * If the device needs MRs to perform RDMA READ or WRITE operations,
+	 * we'll need two additional MRs for the registrations and the
+	 * invalidation.
+	 */
+	if (rdma_protocol_iwarp(dev, attr->port_num) || dev->attrs.max_sgl_rd)
+		factor += 2;	/* inv + reg */
+
+	return factor * attr->cap.max_rdma_ctxs;
+}
+
 static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 				   struct ib_qp_cap *cap)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int ret;
 	struct ib_qp_init_attr qp_attr;
-	int pages_per_rw;
+	u32 max_send_wr;
+	u32 rdma_send_wr;
+
+	/*
+	 * Find out the number of max_send_wr
+	 * after rdma_rw_init_qp() adjusted it.
+	 *
+	 * We only do it on a temporary variable,
+	 * as rdma_create_qp() will trigger
+	 * rdma_rw_init_qp() again.
+	 */
+	memset(&qp_attr, 0, sizeof(qp_attr));
+	qp_attr.cap = *cap;
+	qp_attr.port_num = sc->rdma.cm_id->port_num;
+	rdma_send_wr = smbdirect_rdma_rw_send_wrs(sc->ib.dev, &qp_attr);
+	max_send_wr = qp_attr.cap.max_send_wr + rdma_send_wr;
+
+	if (cap->max_send_wr > sc->ib.dev->attrs.max_cqe ||
+	    cap->max_send_wr > sc->ib.dev->attrs.max_qp_wr) {
+		pr_err("Possible CQE overrun: max_send_wr %d, "
+		       "device reporting max_cqe %d max_qp_wr %d\n",
+		       cap->max_send_wr,
+		       sc->ib.dev->attrs.max_cqe,
+		       sc->ib.dev->attrs.max_qp_wr);
+		pr_err("consider lowering send_credit_target = %d\n",
+		       sp->send_credit_target);
+		return -EINVAL;
+	}
+
+	if (cap->max_rdma_ctxs &&
+	    (max_send_wr >= sc->ib.dev->attrs.max_cqe ||
+	     max_send_wr >= sc->ib.dev->attrs.max_qp_wr)) {
+		pr_err("Possible CQE overrun: rdma_send_wr %d + max_send_wr %d = %d, "
+		       "device reporting max_cqe %d max_qp_wr %d\n",
+		       rdma_send_wr, cap->max_send_wr, max_send_wr,
+		       sc->ib.dev->attrs.max_cqe,
+		       sc->ib.dev->attrs.max_qp_wr);
+		pr_err("consider lowering send_credit_target = %d, max_rdma_ctxs = %d\n",
+		       sp->send_credit_target, cap->max_rdma_ctxs);
+		return -EINVAL;
+	}
+
+	if (cap->max_recv_wr > sc->ib.dev->attrs.max_cqe ||
+	    cap->max_recv_wr > sc->ib.dev->attrs.max_qp_wr) {
+		pr_err("Possible CQE overrun: max_recv_wr %d, "
+		       "device reporting max_cpe %d max_qp_wr %d\n",
+		       cap->max_recv_wr,
+		       sc->ib.dev->attrs.max_cqe,
+		       sc->ib.dev->attrs.max_qp_wr);
+		pr_err("consider lowering receive_credit_max = %d\n",
+		       sp->recv_credit_max);
+		return -EINVAL;
+	}
+
+	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_SEND_IO_MAX_SGE) {
+		pr_err("warning: device max_send_sge = %d too small\n",
+		       sc->ib.dev->attrs.max_send_sge);
+		return -EINVAL;
+	}
+	if (sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
+		pr_err("warning: device max_recv_sge = %d too small\n",
+		       sc->ib.dev->attrs.max_recv_sge);
+		return -EINVAL;
+	}
 
 	sc->ib.pd = ib_alloc_pd(sc->ib.dev, 0);
 	if (IS_ERR(sc->ib.pd)) {
@@ -2045,8 +2105,7 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 	}
 
 	sc->ib.send_cq = ib_alloc_cq_any(sc->ib.dev, sc,
-					 sp->send_credit_target +
-					 cap->max_rdma_ctxs,
+					 max_send_wr,
 					 IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.send_cq)) {
 		pr_err("Can't create RDMA send CQ\n");
@@ -2056,7 +2115,7 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 	}
 
 	sc->ib.recv_cq = ib_alloc_cq_any(sc->ib.dev, sc,
-					 sp->recv_credit_max,
+					 cap->max_recv_wr,
 					 IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		pr_err("Can't create RDMA recv CQ\n");
@@ -2065,6 +2124,14 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 		goto err;
 	}
 
+	/*
+	 * We reset completely here!
+	 * As the above use was just temporary
+	 * to calc max_send_wr and rdma_send_wr.
+	 *
+	 * rdma_create_qp() will trigger rdma_rw_init_qp()
+	 * again if max_rdma_ctxs is not 0.
+	 */
 	memset(&qp_attr, 0, sizeof(qp_attr));
 	qp_attr.event_handler = smb_direct_qpair_handler;
 	qp_attr.qp_context = sc;
@@ -2084,18 +2151,6 @@ static int smb_direct_create_qpair(struct smbdirect_socket *sc,
 	sc->ib.qp = sc->rdma.cm_id->qp;
 	sc->rdma.cm_id->event_handler = smb_direct_cm_handler;
 
-	pages_per_rw = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE) + 1;
-	if (pages_per_rw > sc->ib.dev->attrs.max_sgl_rd) {
-		ret = ib_mr_pool_init(sc->ib.qp, &sc->ib.qp->rdma_mrs,
-				      sc->rw_io.credits.max, IB_MR_TYPE_MEM_REG,
-				      sc->rw_io.credits.num_pages, 0);
-		if (ret) {
-			pr_err("failed to init mr pool count %zu pages %zu\n",
-			       sc->rw_io.credits.max, sc->rw_io.credits.num_pages);
-			goto err;
-		}
-	}
-
 	return 0;
 err:
 	if (sc->ib.qp) {
-- 
2.43.0


