Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78229B34D72
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nOW0lQkolZ9ttiBZo3H3jq1hdd72asDVQvtMra/Zgqw=; b=sxwHzuBRGE3ccQfgndI4tbcBf/
	Gy0gLsFzXdgXegn8XynG4fqV2x6zfXLXCpTMAx3PywZ1UHmBm0/HEb/wjus4qLqROtevVIdY3lnuM
	dtj3MajfptZOJxxyHClMA4Kg/ujWHsJEVKTEQfufHBA40KKpc3DlJM6SsOV+dkU9u1kYed4SpPSGq
	BQskq1EZbk3KYgTVJntMQrK/XodYbeYxb6wRPzi+m+Fx5tt6e+JMAW+jyZdlzeLnIjoeFNmzxLEva
	cRmhhEBuPYBHTSx7FWNLRibhhEQDt+LC/1Ptg/Jq7Ig2vLPs9avyblq9gswqVPmDVbb+KsEX68qEf
	azC06YjQ==;
Received: from ip6-localhost ([::1]:43862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeMd-000U1R-J6; Mon, 25 Aug 2025 21:04:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41620) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIG-000SDb-6o
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nOW0lQkolZ9ttiBZo3H3jq1hdd72asDVQvtMra/Zgqw=; b=m6nTAUBMsnJIzG2GdI2mtf60lD
 voBsSQp4HQWXWTCJQBVArHdcVcffUr4jeovIOmQnNiUDjAwmcx+nlGqdjA3N7121adUNLZ0h0v82G
 wXvpr/bY2BH8aCiDxY5BDYEAb9n+sbpcZFSI/kERvjEP3TpawVsOZSFqIGA/hWVaaIP93oq0JLMwp
 HYWDOVS509F5OcGBqob9yC6s+P6dxmZeFgx/9Gf29XG8atwNkefC8v6ruvlUzYX0qDvN2QrL+o/sK
 721J2UKu/ICV3yVt1fcpSU0wEGMBnarXD1JFGft2Ubr6ugrRYf5G1Y5P0RLEJwGtkFwxpWIeuOnUW
 hJYaNbIWDL+0yZ0mv8OwG6zJEMabpzGe79IbZF0MGADW5SjeFqOhG156qO6ngr0YtbWORLVSjXReh
 ri/7Aq8JBXO3w54+jgRrJnWhNqBqZCv8/dO1whOgLx9qqx3J9iNA2CzwFLzP1ACmTrgrEAoGkwaTw
 eFnaHsKsZ/9BAX4OGCt1fykM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeID-000mpc-1E; Mon, 25 Aug 2025 20:59:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 109/142] smb: server: fill smbdirect_socket_parameters at
 the beginning and use the values from there
Date: Mon, 25 Aug 2025 22:41:10 +0200
Message-ID: <033ac1f719517e335fade90b7c6bc476ce259651.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This is what we should do and it also simplifies the following changes.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index b65215b4dd76..dfafb4f2218e 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -287,6 +287,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 {
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters *sp;
 	struct ksmbd_conn *conn;
 
 	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
@@ -294,9 +295,17 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 		return NULL;
 	sc = &t->socket;
 	smbdirect_socket_init(sc);
+	sp = &sc->parameters;
 
 	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
 
+	sp->recv_credit_max = smb_direct_receive_credit_max;
+	sp->send_credit_target = smb_direct_send_credit_target;
+	sp->max_send_size = smb_direct_max_send_size;
+	sp->max_fragmented_recv_size = smb_direct_max_fragmented_recv_size;
+	sp->max_recv_size = smb_direct_max_receive_size;
+	sp->max_read_write_size = smb_direct_max_read_write_size;
+
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = t;
 
@@ -1694,7 +1703,6 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
 	 * SMB2 response could be mapped.
 	 */
-	sp->max_send_size = smb_direct_max_send_size;
 	max_send_sges = DIV_ROUND_UP(sp->max_send_size, PAGE_SIZE) + 3;
 	if (max_send_sges > SMBDIRECT_SEND_IO_MAX_SGE) {
 		pr_err("max_send_size %d is too large\n", sp->max_send_size);
@@ -1708,7 +1716,6 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	 * are needed for MR registration, RDMA R/W, local & remote
 	 * MR invalidation.
 	 */
-	sp->max_read_write_size = smb_direct_max_read_write_size;
 	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(t);
 	sc->rw_io.credits.max = DIV_ROUND_UP(sp->max_read_write_size,
 					 (sc->rw_io.credits.num_pages - 1) *
@@ -1723,20 +1730,20 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 					    max_sge_per_wr) + 1);
 	max_rw_wrs = sc->rw_io.credits.max * wrs_per_credit;
 
-	max_send_wrs = smb_direct_send_credit_target + max_rw_wrs;
+	max_send_wrs = sp->send_credit_target + max_rw_wrs;
 	if (max_send_wrs > device->attrs.max_cqe ||
 	    max_send_wrs > device->attrs.max_qp_wr) {
 		pr_err("consider lowering send_credit_target = %d\n",
-		       smb_direct_send_credit_target);
+		       sp->send_credit_target);
 		pr_err("Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
 		       device->attrs.max_cqe, device->attrs.max_qp_wr);
 		return -EINVAL;
 	}
 
-	if (smb_direct_receive_credit_max > device->attrs.max_cqe ||
-	    smb_direct_receive_credit_max > device->attrs.max_qp_wr) {
+	if (sp->recv_credit_max > device->attrs.max_cqe ||
+	    sp->recv_credit_max > device->attrs.max_qp_wr) {
 		pr_err("consider lowering receive_credit_max = %d\n",
-		       smb_direct_receive_credit_max);
+		       sp->recv_credit_max);
 		pr_err("Possible CQE overrun, device reporting max_cpe %d max_qp_wr %d\n",
 		       device->attrs.max_cqe, device->attrs.max_qp_wr);
 		return -EINVAL;
@@ -1748,16 +1755,10 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 		return -EINVAL;
 	}
 
-	sp->recv_credit_max = smb_direct_receive_credit_max;
 	sc->recv_io.credits.target = 1;
 
-	sp->send_credit_target = smb_direct_send_credit_target;
 	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
 
-	sp->max_send_size = smb_direct_max_send_size;
-	sp->max_recv_size = smb_direct_max_receive_size;
-	sp->max_fragmented_recv_size = smb_direct_max_fragmented_recv_size;
-
 	cap->max_send_wr = max_send_wrs;
 	cap->max_recv_wr = sp->recv_credit_max;
 	cap->max_send_sge = max_sge_per_wr;
@@ -1857,7 +1858,7 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	}
 
 	sc->ib.send_cq = ib_alloc_cq(sc->ib.dev, t,
-				 smb_direct_send_credit_target + cap->max_rdma_ctxs,
+				 sp->send_credit_target + cap->max_rdma_ctxs,
 				 0, IB_POLL_WORKQUEUE);
 	if (IS_ERR(sc->ib.send_cq)) {
 		pr_err("Can't create RDMA send CQ\n");
-- 
2.43.0


