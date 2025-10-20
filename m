Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1844BBF2F61
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 20:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bKT/jLXyefae+ZUWasm33iQv809olK9DwbEhtIFD0xM=; b=4yU0zgOK49fUgdui3IPoKKnTWt
	YnFC37ChraXeI1X/m25dQzA0EOuiTJFcHVVWjSkZu56PLcmcxMFRL1upzdSI6R+LxZbCwSi1N0lb+
	zzuQu3kCCRHtR/kYAxiydEGfvJr6MHBs0YXS2+OjODWo6rFQabA+qfjYMMSjo27quAx2ZLcW7xCK1
	oQLeAJn7h1NjdZhQyvvUO11wxKksiOpoHQezWIhpKwcIxTw60hydHUxhUr8EyE6YqTMPIu4HMRE+j
	XWhcISumPWsSufmyZc2VhP3LA8pLylG1k8Psanz8rlf8/JntPFBDjWhCy+l0vTjD+NI6Z1jHYWeuC
	RvpVAVTw==;
Received: from ip6-localhost ([::1]:44906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAukw-008NXC-H5; Mon, 20 Oct 2025 18:37:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12464) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAukQ-008NN9-7u
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 18:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bKT/jLXyefae+ZUWasm33iQv809olK9DwbEhtIFD0xM=; b=IbtZdUAGxAVnYwNdxyv/EC+mtd
 BgeF6i5HaTkVV8Zl2lz0Sv/rYewXf9vJLCWCNtHcGmN65+yZyo5q1hp8SLTLksQEal/cHgf4fc+oo
 uwsx4kJQxgU1EZwFW0g7yRommnZh/7uv9ywBgGw/SevgInvRBmLuOGSP1hJhKI+1lEpNm42qGWG0a
 23YcXgF0NURM4Q2956V1FlqWF1C+CJAID1yUO7vEnxoSumkuBgln8aEtQZelXRxGflStusCVcImch
 P8UBbo6KJBK9y692yTwpXZV/PxkwadbvnyYoHhKNjoULbftsaQA1tMRKe+n67SmoDiKn/TxmC8aCv
 KyYU57fpDwmDHhdTYb+dsB/nUjyjyj/z1f2vb725MThuNH5yjZbRhOo3fqGkdRUts+Ji1bCQQqmoN
 IGnZ/CpA0r7TjAha4NTcSiNd6zsI1zE85Ic0ulyjqOG4TcXBZeTf9ZTWXIe1+etn8DOKsQt43Nomc
 QiGrAWM9QToXm+LhBOMRRJdK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAukO-00ACOx-0K; Mon, 20 Oct 2025 18:36:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 4/5] smb: server: make use of
 smbdirect_socket.send_io.lcredits.*
Date: Mon, 20 Oct 2025 20:36:01 +0200
Message-ID: <dfd0ee41de293120c45723e51feafaa021f33b64.1760984605.git.metze@samba.org>
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

This introduces logic to prevent on overflow of
the send submission queue with ib_post_send() easier.

As we first get a local credit and then a remote credit
before we mark us as pending.

From reading the git history of the linux smbdirect
implementations in client and server) it was seen
that a peer granted more credits than we requested.
I guess that only happened because of bugs in our
implementation which was active as client and server.
I guess Windows won't do that.

So the local credits make sure we only use the amount
of credits we asked for.

Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 42 ++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e7e2388c00c2..7d86553fcc7c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -219,6 +219,7 @@ static void smb_direct_disconnect_wake_up_all(struct smbdirect_socket *sc)
 	 * in order to notice the broken connection.
 	 */
 	wake_up_all(&sc->status_wait);
+	wake_up_all(&sc->send_io.lcredits.wait_queue);
 	wake_up_all(&sc->send_io.credits.wait_queue);
 	wake_up_all(&sc->send_io.pending.zero_wait_queue);
 	wake_up_all(&sc->recv_io.reassembly.wait_queue);
@@ -917,6 +918,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 {
 	struct smbdirect_send_io *sendmsg, *sibling, *next;
 	struct smbdirect_socket *sc;
+	int lcredits = 0;
 
 	sendmsg = container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
 	sc = sendmsg->socket;
@@ -931,9 +933,11 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	list_for_each_entry_safe(sibling, next, &sendmsg->sibling_list, sibling_list) {
 		list_del_init(&sibling->sibling_list);
 		smb_direct_free_sendmsg(sc, sibling);
+		lcredits += 1;
 	}
 	/* Note this frees wc->wr_cqe, but not wc */
 	smb_direct_free_sendmsg(sc, sendmsg);
+	lcredits += 1;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
 		pr_err("Send error. status='%s (%d)', opcode=%d\n",
@@ -943,6 +947,9 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 		return;
 	}
 
+	atomic_add(lcredits, &sc->send_io.lcredits.count);
+	wake_up(&sc->send_io.lcredits.wait_queue);
+
 	if (atomic_dec_and_test(&sc->send_io.pending.count))
 		wake_up(&sc->send_io.pending.zero_wait_queue);
 }
@@ -1082,6 +1089,23 @@ static int wait_for_credits(struct smbdirect_socket *sc,
 	} while (true);
 }
 
+static int wait_for_send_lcredit(struct smbdirect_socket *sc,
+				 struct smbdirect_send_batch *send_ctx)
+{
+	if (send_ctx && (atomic_read(&sc->send_io.lcredits.count) <= 1)) {
+		int ret;
+
+		ret = smb_direct_flush_send_list(sc, send_ctx, false);
+		if (ret)
+			return ret;
+	}
+
+	return wait_for_credits(sc,
+				&sc->send_io.lcredits.wait_queue,
+				&sc->send_io.lcredits.count,
+				1);
+}
+
 static int wait_for_send_credits(struct smbdirect_socket *sc,
 				 struct smbdirect_send_batch *send_ctx)
 {
@@ -1269,9 +1293,13 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	int data_length;
 	struct scatterlist sg[SMBDIRECT_SEND_IO_MAX_SGE - 1];
 
+	ret = wait_for_send_lcredit(sc, send_ctx);
+	if (ret)
+		goto lcredit_failed;
+
 	ret = wait_for_send_credits(sc, send_ctx);
 	if (ret)
-		return ret;
+		goto credit_failed;
 
 	data_length = 0;
 	for (i = 0; i < niov; i++)
@@ -1279,10 +1307,8 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 
 	ret = smb_direct_create_header(sc, data_length, remaining_data_length,
 				       &msg);
-	if (ret) {
-		atomic_inc(&sc->send_io.credits.count);
-		return ret;
-	}
+	if (ret)
+		goto header_failed;
 
 	for (i = 0; i < niov; i++) {
 		struct ib_sge *sge;
@@ -1320,7 +1346,11 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	return 0;
 err:
 	smb_direct_free_sendmsg(sc, msg);
+header_failed:
 	atomic_inc(&sc->send_io.credits.count);
+credit_failed:
+	atomic_inc(&sc->send_io.lcredits.count);
+lcredit_failed:
 	return ret;
 }
 
@@ -1897,6 +1927,8 @@ static int smb_direct_init_params(struct smbdirect_socket *sc)
 		return -EINVAL;
 	}
 
+	atomic_set(&sc->send_io.lcredits.count, sp->send_credit_target);
+
 	maxpages = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE);
 	sc->rw_io.credits.max = rdma_rw_mr_factor(sc->ib.dev,
 						  sc->rdma.cm_id->port_num,
-- 
2.43.0


