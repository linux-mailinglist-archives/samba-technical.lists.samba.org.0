Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FCBF2F66
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 20:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iP9W7tAzZiGk2s2HuKpppSSvHyw4gXGudyHcs8/1SnI=; b=TWvl3+VJBZNWRtztB+1AsmPIjw
	Y3QmhoQJbEgdl5fgtf42OFn7kqk2DxgYTxK8MbRBWeU5AiwsC/xsS9+paTE/QR8NLjpNWN01HA8cv
	g4T3jDMYJHaydp+dME/1dNyJPZHiCIw+JkFPYeaN0SK8TpdX9gnkmgmXaft3PnCY3XBnO6+5Cd7Lm
	AcZHgqRqcQgt7TZalRD3rJJT3RbvJ/jnoDU5c4+mG09ZuoHcU5egi+pGJWOov2/rC2jGErSaVzNXx
	rwp62M0a8HXw5TtZsO4pFe/Zer0ykxGp0wy8zzgP3P1s+t8fyGIOy1FeDMkrBkqPgbgg0NEGS5xUN
	XXZzhUSw==;
Received: from ip6-localhost ([::1]:33914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAuky-008NYg-3j; Mon, 20 Oct 2025 18:37:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15996) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAuka-008NQj-1Y
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 18:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iP9W7tAzZiGk2s2HuKpppSSvHyw4gXGudyHcs8/1SnI=; b=scAfEXHIdnHTBkepUYJKotSbj7
 fSrstDEw3dop3ubgBEl3sdYl6JY4gg+CpuCLuMRiQB8Oz2DOSFmZg9juBpCCOvrlhn3/9cCVVmX+a
 LF5dSY3I/PrcTAOYG5Y4AfjTCiMF5otGyIGCBGG2eHtmCd4Cly7Kbrn9cO2Qk7F/UQvE07uZ++hql
 Efwr7swawdj7+isrvX9JoqbyaWmZOWWbWxsSDm1Qguzoru8gVZtU6Xxb0QceaP18QhK9eFPdkuOQ3
 89HjijggSrzsrD1l79liLGSaCXXi55oELxL6UR65ECpXEJkmH+aOdxN0iHENmhAa75rpT/XpaeUs0
 1PW20rJBi6mbb4oS/2G2oFqznvgmkh5TuCeps841no9bXZotyvotIKIYPJ7qT0fui6W1+cp17kT50
 9GX/C0G2Flb4PsnFj9ypoGT/cwZkdXblOohQk4uBLbrgP2g+a7UcVuJ3XBpNDggWF4TMeI3YlFqZt
 mTNW3dsOFb/MtW+4pC9Fhri9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAukX-00ACPW-1V; Mon, 20 Oct 2025 18:36:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 5/5] smb: client: make use of
 smbdirect_socket.send_io.lcredits.*
Date: Mon, 20 Oct 2025 20:36:02 +0200
Message-ID: <82258f4ad9ee9061b11c609a9e997c8900c7e2d8.1760984605.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760984605.git.metze@samba.org>
References: <cover.1760984605.git.metze@samba.org>
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

This makes the logic to prevent on overflow of
the send submission queue with ib_post_send() easier.

As we first get a local credit and then a remote credit
before we mark us as pending.

For now we'll keep the logic around smbdirect_socket.send_io.pending.*,
but that will likely change or be removed completely.

The server will get a similar logic soon, so
we'll be able to share the send code in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 67 ++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b1218ea4aa8b..85a4c55b61b8 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -172,6 +172,7 @@ static void smbd_disconnect_wake_up_all(struct smbdirect_socket *sc)
 	 * in order to notice the broken connection.
 	 */
 	wake_up_all(&sc->status_wait);
+	wake_up_all(&sc->send_io.lcredits.wait_queue);
 	wake_up_all(&sc->send_io.credits.wait_queue);
 	wake_up_all(&sc->send_io.pending.dec_wait_queue);
 	wake_up_all(&sc->send_io.pending.zero_wait_queue);
@@ -495,6 +496,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbdirect_send_io *request =
 		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
 	struct smbdirect_socket *sc = request->socket;
+	int lcredits = 0;
 
 	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%s\n",
 		request, ib_wc_status_msg(wc->status));
@@ -504,22 +506,24 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 			request->sge[i].addr,
 			request->sge[i].length,
 			DMA_TO_DEVICE);
+	mempool_free(request, sc->send_io.mem.pool);
+	lcredits += 1;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
 		if (wc->status != IB_WC_WR_FLUSH_ERR)
 			log_rdma_send(ERR, "wc->status=%s wc->opcode=%d\n",
 				ib_wc_status_msg(wc->status), wc->opcode);
-		mempool_free(request, sc->send_io.mem.pool);
 		smbd_disconnect_rdma_connection(sc);
 		return;
 	}
 
+	atomic_add(lcredits, &sc->send_io.lcredits.count);
+	wake_up(&sc->send_io.lcredits.wait_queue);
+
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
 		wake_up(&sc->send_io.pending.zero_wait_queue);
 
 	wake_up(&sc->send_io.pending.dec_wait_queue);
-
-	mempool_free(request, sc->send_io.mem.pool);
 }
 
 static void dump_smbdirect_negotiate_resp(struct smbdirect_negotiate_resp *resp)
@@ -567,6 +571,7 @@ static bool process_negotiation_response(
 		log_rdma_event(ERR, "error: credits_granted==0\n");
 		return false;
 	}
+	atomic_set(&sc->send_io.lcredits.count, sp->send_credit_target);
 	atomic_set(&sc->send_io.credits.count, le16_to_cpu(packet->credits_granted));
 
 	if (le32_to_cpu(packet->preferred_send_size) > sp->max_recv_size) {
@@ -1114,6 +1119,24 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	struct smbdirect_data_transfer *packet;
 	int new_credits = 0;
 
+wait_lcredit:
+	/* Wait for local send credits */
+	rc = wait_event_interruptible(sc->send_io.lcredits.wait_queue,
+		atomic_read(&sc->send_io.lcredits.count) > 0 ||
+		sc->status != SMBDIRECT_SOCKET_CONNECTED);
+	if (rc)
+		goto err_wait_lcredit;
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
+		log_outgoing(ERR, "disconnected not sending on wait_credit\n");
+		rc = -EAGAIN;
+		goto err_wait_lcredit;
+	}
+	if (unlikely(atomic_dec_return(&sc->send_io.lcredits.count) < 0)) {
+		atomic_inc(&sc->send_io.lcredits.count);
+		goto wait_lcredit;
+	}
+
 wait_credit:
 	/* Wait for send credits. A SMBD packet needs one credit */
 	rc = wait_event_interruptible(sc->send_io.credits.wait_queue,
@@ -1132,23 +1155,6 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 		goto wait_credit;
 	}
 
-wait_send_queue:
-	wait_event(sc->send_io.pending.dec_wait_queue,
-		atomic_read(&sc->send_io.pending.count) < sp->send_credit_target ||
-		sc->status != SMBDIRECT_SOCKET_CONNECTED);
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		log_outgoing(ERR, "disconnected not sending on wait_send_queue\n");
-		rc = -EAGAIN;
-		goto err_wait_send_queue;
-	}
-
-	if (unlikely(atomic_inc_return(&sc->send_io.pending.count) >
-				sp->send_credit_target)) {
-		atomic_dec(&sc->send_io.pending.count);
-		goto wait_send_queue;
-	}
-
 	request = mempool_alloc(sc->send_io.mem.pool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
@@ -1229,10 +1235,21 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 		     le32_to_cpu(packet->data_length),
 		     le32_to_cpu(packet->remaining_data_length));
 
+	/*
+	 * Now that we got a local and a remote credit
+	 * we add us as pending
+	 */
+	atomic_inc(&sc->send_io.pending.count);
+
 	rc = smbd_post_send(sc, request);
 	if (!rc)
 		return 0;
 
+	if (atomic_dec_and_test(&sc->send_io.pending.count))
+		wake_up(&sc->send_io.pending.zero_wait_queue);
+
+	wake_up(&sc->send_io.pending.dec_wait_queue);
+
 err_dma:
 	for (i = 0; i < request->num_sge; i++)
 		if (request->sge[i].addr)
@@ -1246,14 +1263,14 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	atomic_sub(new_credits, &sc->recv_io.credits.count);
 
 err_alloc:
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.zero_wait_queue);
-
-err_wait_send_queue:
-	/* roll back send credits and pending */
 	atomic_inc(&sc->send_io.credits.count);
+	wake_up(&sc->send_io.credits.wait_queue);
 
 err_wait_credit:
+	atomic_inc(&sc->send_io.lcredits.count);
+	wake_up(&sc->send_io.lcredits.wait_queue);
+
+err_wait_lcredit:
 	return rc;
 }
 
-- 
2.43.0


