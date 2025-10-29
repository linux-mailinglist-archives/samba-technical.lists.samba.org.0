Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B3C1AE43
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=z0JBSaWnuPcTZdACIylAQIM6L+wVBx7XIl/YggoemYQ=; b=RyIyG7o1BiSxVfygKgPCSB+oY+
	S61fepeMOxHRCaURRRgSHx65gvd+Z4Gc1cwHIdDfJp+1PVF81bulfWrlgO4mdETdEz3a1hk/E8REA
	MhNBTzl+kuSwtpXcnk6ZraIkkkAtvAFZcD0UMkmKgHIvByCGLCOoUHfqrrNxua3jNCw6X+z1b5ULP
	30OTWKrILSJvzO8kjqyxq9eMQII4+huVLpkuIMj1QP6OsUbW4YSWOoy+nmFaqbdANEa36rj9HKqZX
	XwERBy6kkb0pbhRMgnynUMYPjapKPLacRx9Yv8JnG4UNx6BYl/aLUSDbsbhBqXwYKGgj7Oj/vMVTb
	6bDSJlXA==;
Received: from ip6-localhost ([::1]:36452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6WE-009DMl-Dj; Wed, 29 Oct 2025 13:47:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IF-0098Nw-7J
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=z0JBSaWnuPcTZdACIylAQIM6L+wVBx7XIl/YggoemYQ=; b=Fs8UNaCZ57EySCM/8LSkLiHvOU
 mVrhHz9E4sduqe0CgHK0T4zbdsZaKHkBam1GNX/JKWmK/sKRLLhWjmynMQsoD78K8h4BZxhsw02fx
 8/gYB1c27vofPtSIO7XHEdeJZ8s38I5EF8qllJJoSumVRxIlhLfTyMYd93ru0AibwDW9r9Jxmkpk3
 6h0jBPOlyOXlQ+p/xekxadaeMiKPUAr6Bt1Dns81qqMXtkUv3DB2qVbcOkBXWUZW9+yZJHbwms1SM
 jSUYbjDl6631RGttxzIH8Kbn3aesJ80+/A0nQw8tuJGOLeAoEiubwQ3TzkHrAqwu5K4I+2/dHIs34
 mJrLuqyIu/wVzMNDVFT5RwnHLgyrCtIN9zQ+vqImMXRxFsw2wjbtHXStu/cdFIeBMu2oy9wS/Nx0w
 P2eY4gV0UfoMwDT9imiDWVJGeoHdu1biVxDQfN9Yu2GGUqsFXlJO1Ldjk2WAvZrhQ+GEUw4rNpPtz
 dH36ebZxRFqickVpfO0a8G4r;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6IC-00Bco0-0f; Wed, 29 Oct 2025 13:32:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 102/127] smb: server: make use of
 smbdirect_connection_send_io_done()
Date: Wed, 29 Oct 2025 14:21:20 +0100
Message-ID: <54dc31facd4cecaf68eec1df2e1e92054e6c1113.1761742839.git.metze@samba.org>
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

This also wakes up send_io.pending.dec_wait_queue, which
is currently always empty in the server, but that might
change in future. And we also don't spam the logs on IB_WC_WR_FLUSH_ERR.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 42 +---------------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 50dc87660b25..aff7ac3054bc 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -726,46 +726,6 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 		queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
-static void send_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	struct smbdirect_send_io *sendmsg, *sibling, *next;
-	struct smbdirect_socket *sc;
-	int lcredits = 0;
-
-	sendmsg = container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
-	sc = sendmsg->socket;
-
-	ksmbd_debug(RDMA, "Send completed. status='%s (%d)', opcode=%d\n",
-		    ib_wc_status_msg(wc->status), wc->status,
-		    wc->opcode);
-
-	/*
-	 * Free possible siblings and then the main send_io
-	 */
-	list_for_each_entry_safe(sibling, next, &sendmsg->sibling_list, sibling_list) {
-		list_del_init(&sibling->sibling_list);
-		smbdirect_connection_free_send_io(sibling);
-		lcredits += 1;
-	}
-	/* Note this frees wc->wr_cqe, but not wc */
-	smbdirect_connection_free_send_io(sendmsg);
-	lcredits += 1;
-
-	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
-		pr_err("Send error. status='%s (%d)', opcode=%d\n",
-		       ib_wc_status_msg(wc->status), wc->status,
-		       wc->opcode);
-		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-		return;
-	}
-
-	atomic_add(lcredits, &sc->send_io.lcredits.count);
-	wake_up(&sc->send_io.lcredits.wait_queue);
-
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.zero_wait_queue);
-}
-
 static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 {
 	int new_credits;
@@ -1068,7 +1028,7 @@ static int post_sendmsg(struct smbdirect_socket *sc,
 					      msg->sge[i].addr, msg->sge[i].length,
 					      DMA_TO_DEVICE);
 
-	msg->cqe.done = send_done;
+	msg->cqe.done = smbdirect_connection_send_io_done;
 	msg->wr.opcode = IB_WR_SEND;
 	msg->wr.sg_list = &msg->sge[0];
 	msg->wr.num_sge = msg->num_sge;
-- 
2.43.0


