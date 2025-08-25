Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B80B34CA5
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uad7l+iLLaR0+CGoyI7eJ2vgNTCv4TZJu8oLnT9f8/c=; b=dEDNRPsl4v0QPw99Nn9zJzE2WN
	sf5wwWqgHjsKwQ5QE60ibgTnLdR0JxzmHLPvEcmXeSJcEaNBdB8tqCVJfyBbce+dj2r2uZYeua2P8
	IVlzMeSRGQoWmBL+PZYZ6uqJkjjA+TufYgfeCdJj9wXceSle3ifTYXODkajmwws5nxmPhwhoJwEhw
	NAGtwdT5vQEyWY6C18kJ6v+lKzRxAZjYgRcDjsxC/rsWEO5HwJ+Yrdc9vJYZMW1p/s0vOPk//QVwL
	d1lHgBNiuI6PvJj8lVZjia9ictR4TKSeFuSqKIXqfxjW08wpQ39N/MoQveyMgCf24614J79Yph9/0
	j46bQ3VA==;
Received: from ip6-localhost ([::1]:54444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe8W-000OCR-Bm; Mon, 25 Aug 2025 20:49:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19326) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6s-000NaB-EK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uad7l+iLLaR0+CGoyI7eJ2vgNTCv4TZJu8oLnT9f8/c=; b=CqQkxELyyfzIvakxAbbhuA5zTR
 GM2x3UId+9hywgd7ZmVJMVq8oDidm9by2YIRzQLLA6QHSKgy5LKIg4kjz+8IbaIaTD8YRVc/nndX/
 MBG/Jw64bb+5BME9qxWxyBmhpYZc5M7FJxuWkYclmxmPhBb2uZ8DuSsGOftYf/a8WO22NbFhdPfby
 bhS038eWmxxy/Pu8pR8Muq9okvrPhabpkpZX7x6/pk0Bw2GqsNl1MRA9eduzR4O2z7LYFN7peW4SR
 hu5J78QqvOPTbDQWBD8olsKtMma4IuXo26pxiT4cW1ixmeB7DIOWK6RcV8gGLeTY1QFzLviuLOYHw
 l6MEdMDH0GFrC0ZuQ0h6Cyg/mY1GkZ3AtpqmSKcVknprPNdcKavZPz6jyJQIOF93C5w3JeDKjlWr4
 lYbp2+XihXv4P04K4fiHQgPIm1MGXZddpEgl34JNAs2AviKoTJWhsFs5EmDcS/ZZZwcAcb5K2cwTR
 0atkLMrhoyJlP9nnrYgCc6Rs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6q-000kTZ-1b; Mon, 25 Aug 2025 20:48:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 038/142] smb: client: fill smbdirect_socket_parameters at
 the beginning and use the values from there
Date: Mon, 25 Aug 2025 22:39:59 +0200
Message-ID: <92fd044cebdd5b24d3824110fee3cfeafeefd8cc.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is what we should do and it also simplifies the following changes.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a65c3a841985..a1ca18dbb758 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1672,37 +1672,37 @@ static struct smbd_connection *_smbd_get_connection(
 
 	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
 
+	sp->recv_credit_max = smbd_receive_credit_max;
+	sp->send_credit_target = smbd_send_credit_target;
+	sp->max_send_size = smbd_max_send_size;
+	sp->max_fragmented_recv_size = smbd_max_fragmented_recv_size;
+	sp->max_recv_size = smbd_max_receive_size;
+	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
+
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
 		goto create_id_failed;
 	}
 
-	if (smbd_send_credit_target > sc->ib.dev->attrs.max_cqe ||
-	    smbd_send_credit_target > sc->ib.dev->attrs.max_qp_wr) {
+	if (sp->send_credit_target > sc->ib.dev->attrs.max_cqe ||
+	    sp->send_credit_target > sc->ib.dev->attrs.max_qp_wr) {
 		log_rdma_event(ERR, "consider lowering send_credit_target = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
-			       smbd_send_credit_target,
+			       sp->send_credit_target,
 			       sc->ib.dev->attrs.max_cqe,
 			       sc->ib.dev->attrs.max_qp_wr);
 		goto config_failed;
 	}
 
-	if (smbd_receive_credit_max > sc->ib.dev->attrs.max_cqe ||
-	    smbd_receive_credit_max > sc->ib.dev->attrs.max_qp_wr) {
+	if (sp->recv_credit_max > sc->ib.dev->attrs.max_cqe ||
+	    sp->recv_credit_max > sc->ib.dev->attrs.max_qp_wr) {
 		log_rdma_event(ERR, "consider lowering receive_credit_max = %d. Possible CQE overrun, device reporting max_cqe %d max_qp_wr %d\n",
-			       smbd_receive_credit_max,
+			       sp->recv_credit_max,
 			       sc->ib.dev->attrs.max_cqe,
 			       sc->ib.dev->attrs.max_qp_wr);
 		goto config_failed;
 	}
 
-	sp->recv_credit_max = smbd_receive_credit_max;
-	sp->send_credit_target = smbd_send_credit_target;
-	sp->max_send_size = smbd_max_send_size;
-	sp->max_fragmented_recv_size = smbd_max_fragmented_recv_size;
-	sp->max_recv_size = smbd_max_receive_size;
-	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
-
 	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_SEND_IO_MAX_SGE ||
 	    sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
 		log_rdma_event(ERR,
-- 
2.43.0


