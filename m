Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A71B1CB23
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Q8m9AB0Pkg4OME4mAZ4u0V8E66Kn5RWyS7S240vCbLc=; b=S/Kp6JUGdi5DzxzE8eZaRlWQI3
	QErpln+Cr3BB6ASHtjwqy+2F4vUyGCkwe9/FMnau1/tGINE3hNTbjHuYYJmdvJJnOiY3MCD35rrll
	XCcAesyHEuYKCKG76RnVWpjynH0wxXGtQpVgoTp/hdWs9nmNWXakN8FVaVNPmW0ogQ18cuOqxcZZn
	8FmgPQVMWdRkEtV4YZoj2s4wrFp6R7xbyH7GUTZvZWW/bAodnjiV4MFLD1Xx4YDHVFUDEddCk3HtL
	ecspBSUFMbUFWcAPOYn6n2i6fMUkUS6fFv7rT4s0Agd+bq/e0eYjPkPasvbqOn6B4ueBVzSz63xQT
	Vi7OCKHg==;
Received: from ip6-localhost ([::1]:46450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji6O-00ESH4-TZ; Wed, 06 Aug 2025 17:39:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17838) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5C-00ERrX-Fd
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Q8m9AB0Pkg4OME4mAZ4u0V8E66Kn5RWyS7S240vCbLc=; b=mIuCFg+v/ACpdl3YqcxEh+U7YN
 WbtOQydqsDdao6lqhg+82pJjk2Aj9ky2oSjC1gKJle9Z0Bc+9OcBooNRSSK4cPTQ10h7Km4OHXM2G
 /2uOM7sZHv4EjGRfWW4icWeRBbQ/qBgXI6d3MLmcproSMLP4P+iFm1M+mvzkZCZy1xb6a3bwOd420
 X0VKXYfmvpxaFUvbkLOqjkcf/R7UiWOl67vaMHTwBvKUifmYiJzuiuh3MFo0LoQAwwnckYctYaqSG
 YKm0T2XTNo2UFUCh6h+kKM6jVYk9+nTCzvYxtXRuSkus5VTY0WXgULl2JfaqmAjgEdD1v68Bm0ezd
 VsBM7zLbwQVBznjJ1WSPvGd4dZoHlcy/XLE/lAf4fw4GeCSWHHF6Ew7Rih1yQPMTm5w+l4Xdb/iba
 musmOJTyQDKZUkTUnY3HoX6jBnfTtDH+RD1Z5WGRTgYCfJL7icR+/+6JpD34e/qgaYZuS6yPqsFq/
 SY1VpLk0dfZci5WwJu83uJId;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji57-001Olx-28; Wed, 06 Aug 2025 17:37:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 12/18] smb: server: make use of
 smbdirect_socket->recv_io.expected
Date: Wed,  6 Aug 2025 19:35:58 +0200
Message-ID: <6c13eb7f2e587dc44b3eb4353eade6433405b9b9.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

The expected incoming message type can be per connection.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 44 +++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d81f1694a9af..14d338a380a3 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -141,10 +141,6 @@ struct smb_direct_transport {
 #define KSMBD_TRANS(t) ((struct ksmbd_transport *)&((t)->transport))
 #define SMBD_TRANS(t)	((struct smb_direct_transport *)container_of(t, \
 				struct smb_direct_transport, transport))
-enum {
-	SMB_DIRECT_MSG_NEGOTIATE_REQ = 0,
-	SMB_DIRECT_MSG_DATA_TRANSFER
-};
 
 static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops;
 
@@ -168,7 +164,6 @@ struct smb_direct_sendmsg {
 struct smb_direct_recvmsg {
 	struct smb_direct_transport	*transport;
 	struct list_head	list;
-	int			type;
 	struct ib_sge		sge;
 	struct ib_cqe		cqe;
 	bool			first_segment;
@@ -465,8 +460,10 @@ static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
 
 static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 {
-	switch (recvmsg->type) {
-	case SMB_DIRECT_MSG_DATA_TRANSFER: {
+	struct smbdirect_socket *sc = &recvmsg->transport->socket;
+
+	switch (sc->recv_io.expected) {
+	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
 		struct smbdirect_data_transfer *req =
 			(struct smbdirect_data_transfer *)recvmsg->packet;
 		struct smb2_hdr *hdr = (struct smb2_hdr *)(recvmsg->packet
@@ -477,9 +474,9 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 			    le16_to_cpu(req->credits_requested),
 			    req->data_length, req->remaining_data_length,
 			    hdr->ProtocolId, hdr->Command);
-		break;
+		return 0;
 	}
-	case SMB_DIRECT_MSG_NEGOTIATE_REQ: {
+	case SMBDIRECT_EXPECT_NEGOTIATE_REQ: {
 		struct smbdirect_negotiate_req *req =
 			(struct smbdirect_negotiate_req *)recvmsg->packet;
 		ksmbd_debug(RDMA,
@@ -499,12 +496,15 @@ static int smb_direct_check_recvmsg(struct smb_direct_recvmsg *recvmsg)
 					128 * 1024)
 			return -ECONNABORTED;
 
-		break;
+		return 0;
 	}
-	default:
-		return -EINVAL;
+	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
+		/* client only */
+		break;
 	}
-	return 0;
+
+	/* This is an internal error */
+	return -EINVAL;
 }
 
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
@@ -535,8 +535,8 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	ib_dma_sync_single_for_cpu(wc->qp->device, recvmsg->sge.addr,
 				   recvmsg->sge.length, DMA_FROM_DEVICE);
 
-	switch (recvmsg->type) {
-	case SMB_DIRECT_MSG_NEGOTIATE_REQ:
+	switch (sc->recv_io.expected) {
+	case SMBDIRECT_EXPECT_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smbdirect_negotiate_req)) {
 			put_recvmsg(t, recvmsg);
 			smb_direct_disconnect_rdma_connection(t);
@@ -548,7 +548,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		enqueue_reassembly(t, recvmsg, 0);
 		wake_up_interruptible(&t->wait_status);
 		return;
-	case SMB_DIRECT_MSG_DATA_TRANSFER: {
+	case SMBDIRECT_EXPECT_DATA_TRANSFER: {
 		struct smbdirect_data_transfer *data_transfer =
 			(struct smbdirect_data_transfer *)recvmsg->packet;
 		unsigned int data_length;
@@ -613,12 +613,15 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		return;
 	}
+	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
+		/* client only */
+		break;
 	}
 
 	/*
 	 * This is an internal error!
 	 */
-	WARN_ON_ONCE(recvmsg->type != SMB_DIRECT_MSG_DATA_TRANSFER);
+	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 	put_recvmsg(t, recvmsg);
 	smb_direct_disconnect_rdma_connection(t);
 }
@@ -807,7 +810,6 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 			if (!recvmsg)
 				break;
 
-			recvmsg->type = SMB_DIRECT_MSG_DATA_TRANSFER;
 			recvmsg->first_segment = false;
 
 			ret = smb_direct_post_recv(t, recvmsg);
@@ -1606,6 +1608,8 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 		resp->max_receive_size = cpu_to_le32(sp->max_recv_size);
 		resp->max_fragmented_size =
 				cpu_to_le32(sp->max_fragmented_recv_size);
+
+		sc->recv_io.expected = SMBDIRECT_EXPECT_DATA_TRANSFER;
 	}
 
 	sendmsg->sge[0].addr = ib_dma_map_single(sc->ib.dev,
@@ -1671,13 +1675,15 @@ static int smb_direct_accept_client(struct smb_direct_transport *t)
 
 static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 	struct smb_direct_recvmsg *recvmsg;
 
+	sc->recv_io.expected = SMBDIRECT_EXPECT_NEGOTIATE_REQ;
+
 	recvmsg = get_free_recvmsg(t);
 	if (!recvmsg)
 		return -ENOMEM;
-	recvmsg->type = SMB_DIRECT_MSG_NEGOTIATE_REQ;
 
 	ret = smb_direct_post_recv(t, recvmsg);
 	if (ret) {
-- 
2.43.0


