Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B63B1A113
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SFLgUMBf1hiAo2gf7RNmfyuWsj1ARBDGs0tVDNJOzYs=; b=preGHMBhZO4gQIZdZEVzkPTvza
	ZYtTKG+khzBiFt2AE7AaKXXisC1tXnOSouJLx1uURiBpUrIAFGOIpksMRum3QouK3Yv72E38qHAFf
	mhSGvao+8MgVIc+5BXTa0fZ2sVQqrIDmxVnkxQms2bgz2ZEK7OwBWCjf0cKDWIZvKg0jbbbK4G08k
	a6ic5pfh4B337EDvpWf8nH9psK8m7rxGvC/lNIuzJqSkWy2XIND++ZiVCkhS4XrlLcyC/2k1ybu13
	Tr08Z+0N5g2HpfdoQ6yUnFvri1I6X8uPJl21xaCu/9pGObpBFXNLZQBr14h5fYYKd0GqMHBOAoPUh
	TwGd3mAw==;
Received: from ip6-localhost ([::1]:30070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu7c-00EIJ9-MD; Mon, 04 Aug 2025 12:16:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34772) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7N-00EIDw-Mr
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SFLgUMBf1hiAo2gf7RNmfyuWsj1ARBDGs0tVDNJOzYs=; b=qsZmCVoHwBTKivYCJDa9vqGNwr
 vlpmyibaPED/iawDDaqKSqy/6iZ1xdIye5kGZj3Rrz3R2Jdvs5kpd/h0yCiD6D5lutjdhZJrSIzpw
 p7dtBGpil55fvw8ygdo5dwCYYnNuj0d+YkQD9bftlLudT7+w/flGqmJGgPfRqpUKwXmAubgXRGRbB
 5MaMi1cIgHzASRa74cyOsXVy2RSJx63+gaQ+j/B1EyoZ3Z7Iw6lHPOEtcOYVblTBzQAr31VXulCM0
 H5GmeAW0AAKZ19viZ4+BWrCYFm7+DA5MKTTSkkFplRxG2PNv8L8YGN6TYM0poJYPP4P40lH+4+jrD
 2TIPCZwOwtcAa+qxw9ygOYFYwYFhcWRs0laln+tG//3hOcyOMMuaU/ZOOxc6E2b74Euwph4jCNMiD
 +nF3/9roYruInnSTXckesIZXOrW6AqLQ9kG2mQE61gzgeil6e76jYyPtjj72MrjyHoVSoTz1fQSgq
 +VrfScWHyTVl/Dfig1MQ7Tn5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu7M-000wFX-0U; Mon, 04 Aug 2025 12:16:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 3/4] smb: server: let recv_done() consitently call
 put_recvmsg/smb_direct_disconnect_rdma_connection
Date: Mon,  4 Aug 2025 14:15:52 +0200
Message-ID: <f9afb0a41c387f325423623b578edc51958fe98e.1754309565.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754309565.git.metze@samba.org>
References: <cover.1754309565.git.metze@samba.org>
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

We should call put_recvmsg() before smb_direct_disconnect_rdma_connection()
in order to call it before waking up the callers.

In all error cases we should call smb_direct_disconnect_rdma_connection()
in order to avoid stale connections.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index fac82e60ff80..cd8a92fe372b 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -521,13 +521,13 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	t = recvmsg->transport;
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
+		put_recvmsg(t, recvmsg);
 		if (wc->status != IB_WC_WR_FLUSH_ERR) {
 			pr_err("Recv error. status='%s (%d)' opcode=%d\n",
 			       ib_wc_status_msg(wc->status), wc->status,
 			       wc->opcode);
 			smb_direct_disconnect_rdma_connection(t);
 		}
-		put_recvmsg(t, recvmsg);
 		return;
 	}
 
@@ -542,6 +542,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	case SMB_DIRECT_MSG_NEGOTIATE_REQ:
 		if (wc->byte_len < sizeof(struct smb_direct_negotiate_req)) {
 			put_recvmsg(t, recvmsg);
+			smb_direct_disconnect_rdma_connection(t);
 			return;
 		}
 		t->negotiation_requested = true;
@@ -549,7 +550,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		t->status = SMB_DIRECT_CS_CONNECTED;
 		enqueue_reassembly(t, recvmsg, 0);
 		wake_up_interruptible(&t->wait_status);
-		break;
+		return;
 	case SMB_DIRECT_MSG_DATA_TRANSFER: {
 		struct smb_direct_data_transfer *data_transfer =
 			(struct smb_direct_data_transfer *)recvmsg->packet;
@@ -559,6 +560,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (wc->byte_len <
 		    offsetof(struct smb_direct_data_transfer, padding)) {
 			put_recvmsg(t, recvmsg);
+			smb_direct_disconnect_rdma_connection(t);
 			return;
 		}
 
@@ -567,6 +569,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (wc->byte_len < sizeof(struct smb_direct_data_transfer) +
 			    (u64)data_length) {
 				put_recvmsg(t, recvmsg);
+				smb_direct_disconnect_rdma_connection(t);
 				return;
 			}
 
@@ -609,11 +612,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		if (is_receive_credit_post_required(receive_credits, avail_recvmsg_count))
 			mod_delayed_work(smb_direct_wq,
 					 &t->post_recv_credits_work, 0);
-		break;
+		return;
 	}
-	default:
-		break;
 	}
+
+	/*
+	 * This is an internal error!
+	 */
+	WARN_ON_ONCE(recvmsg->type != SMB_DIRECT_MSG_DATA_TRANSFER);
+	put_recvmsg(t, recvmsg);
+	smb_direct_disconnect_rdma_connection(t);
 }
 
 static int smb_direct_post_recv(struct smb_direct_transport *t,
-- 
2.43.0


