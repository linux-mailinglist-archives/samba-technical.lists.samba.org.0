Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE7B34DB1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=INpyoO1XRtHhAGbRjzKhBmvbqkkvKbL05lSDGf1ltDc=; b=JJLervKGEFTe7NVIXIZPH9O4C/
	7yGlCP2bS7RGIv4klqV/jPROc+1mzzkQ2voRbvU7CrVl/ckidmRn6zoqC7Af/EOO2UP5llWQdAXcb
	TlBzpifPX8MB/loa4A3WWXGGlER17h8OmOCf7SxKiSO8EZY2NKB/paP7mTP83A8Ui0elbSHAJzU/e
	rMXWf7buDIVRbKTVZXWTMVGFrJshhuMylIdkMAy7t1We0jWDr9GESY+33Bd5RuIMCcOOoU++ZvYWK
	GjC03kWtetKc2ddDS+ktf8LYEwgXdktZga6RiaRdIolhD14lZFiBEwk89dOBGaFP2Wa8mGwIkvoL6
	EwAfGT+Q==;
Received: from ip6-localhost ([::1]:39068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeS6-000Wca-71; Mon, 25 Aug 2025 21:10:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40014) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNY-000UU6-Em
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=INpyoO1XRtHhAGbRjzKhBmvbqkkvKbL05lSDGf1ltDc=; b=JT69m0fIqEkneWXAsUyVMf7gQb
 Y0uj4soQ1aqlNeuFTUdoHWKG2QXq+mM+bLHez+Qwf3acsnDjDls7ZHuOW7tLhH3Zt2C9hHlLs/J4Z
 RV/fiWEVeFE2Ewsw1TOw2l7dN4uEw9Vn1xYMHG7VcgY+RCoQUs99gWqPREaFMJi09mwNFcrKr0+ST
 R++KEOTv71p+UWppYWJZzrwUwn4t7oQIdf+/99zBwv4DZs8K1Q5vPLGYW3hUhUt/52DmbWUuWHObn
 H7YCklFcirwVRUbUozdQx3kfpOJ6XBkwhK1tF3pxmx+L3IGjPQ5QTVpoXKecD4wopLgxSAC8uy7C5
 s79cXfCT3WOnWXrOS2YaJNx+DZk3ojy+jhh2FR/6VhZ0Hljg7qcVApzA9DFlq+2c9MNcEAFkMPYqK
 nxxTH/h7frFkOKuhAXlNpflucl2nVvT6edzLXB1FIgaOjYm7b3P053aPq8bAovRrc41rVm3Q2BVHl
 ZJ29nZtfVKRiwGC3Ny8GPhYL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNU-000nu8-0n; Mon, 25 Aug 2025 21:05:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 141/142] smb: server: pass struct smbdirect_socket to
 {enqueue, get_first}_reassembly()
Date: Mon, 25 Aug 2025 22:41:42 +0200
Message-ID: <ff4241fbe87c8715798fb5c90b3eaebb3cab551d.1756139608.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 7f7c31326226..4c9d33ee67b5 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -180,12 +180,10 @@ static void put_recvmsg(struct smbdirect_socket *sc,
 	queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 }
 
-static void enqueue_reassembly(struct smb_direct_transport *t,
+static void enqueue_reassembly(struct smbdirect_socket *sc,
 			       struct smbdirect_recv_io *recvmsg,
 			       int data_length)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	spin_lock(&sc->recv_io.reassembly.lock);
 	list_add_tail(&recvmsg->list, &sc->recv_io.reassembly.list);
 	sc->recv_io.reassembly.queue_length++;
@@ -200,10 +198,8 @@ static void enqueue_reassembly(struct smb_direct_transport *t,
 	spin_unlock(&sc->recv_io.reassembly.lock);
 }
 
-static struct smbdirect_recv_io *get_first_reassembly(struct smb_direct_transport *t)
+static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	if (!list_empty(&sc->recv_io.reassembly.list))
 		return list_first_entry(&sc->recv_io.reassembly.list,
 				struct smbdirect_recv_io, list);
@@ -386,7 +382,7 @@ static void free_transport(struct smb_direct_transport *t)
 	ksmbd_debug(RDMA, "drain the reassembly queue\n");
 	do {
 		spin_lock(&sc->recv_io.reassembly.lock);
-		recvmsg = get_first_reassembly(t);
+		recvmsg = get_first_reassembly(sc);
 		if (recvmsg) {
 			list_del(&recvmsg->list);
 			spin_unlock(&sc->recv_io.reassembly.lock);
@@ -493,14 +489,12 @@ static int smb_direct_check_recvmsg(struct smbdirect_recv_io *recvmsg)
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
 	struct smbdirect_recv_io *recvmsg;
-	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
 	struct smbdirect_socket_parameters *sp;
 
 	recvmsg = container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
 	sc = recvmsg->socket;
 	sp = &sc->parameters;
-	t = container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
 		put_recvmsg(sc, recvmsg);
@@ -538,7 +532,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		sc->recv_io.reassembly.full_packet_received = true;
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
-		enqueue_reassembly(t, recvmsg, 0);
+		enqueue_reassembly(sc, recvmsg, 0);
 		wake_up(&sc->status_wait);
 		return;
 	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
@@ -596,7 +590,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (sc->recv_io.credits.target > old_recv_credit_target)
 				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
-			enqueue_reassembly(t, recvmsg, (int)data_length);
+			enqueue_reassembly(sc, recvmsg, (int)data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
 			put_recvmsg(sc, recvmsg);
@@ -691,7 +685,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		to_read = size;
 		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
-			recvmsg = get_first_reassembly(st);
+			recvmsg = get_first_reassembly(sc);
 			data_transfer = smbdirect_recv_io_payload(recvmsg);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
@@ -1986,7 +1980,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
-	recvmsg = get_first_reassembly(st);
+	recvmsg = get_first_reassembly(sc);
 	if (!recvmsg)
 		return -ECONNABORTED;
 
-- 
2.43.0


