Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678FB34D5C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FF0dShBbvsjPDlcPDR6Wwlqj+ow6c7vZbr1r9B7wfFk=; b=5tMM5kGjdF4vM6WqrU0hNADmmk
	cZUlJF97NQuWARKiYjD9KwZy9TrHIfFSDBMQp7QdJ1sJuKqGvP+uMQ+t2P9IuwiYNp4o2U8dk9Xny
	CgzQOgRZbfJzDX5Bwg78ZEc+73z1k5rMOWyEfQfi7cdaQrs2c+jaZ7JKjbqCY8lN2NGDCTH/zmWY5
	35P2A5IBtxIQeRcMDFbP9e1MuFcnGm54hmtnnbw3rTwa7hMg4wrQFGgepgiSpEAgUIVfYPpDzQadN
	OYidcO7eXUkMBm8LKfbETy9HvKM990jc21UzvtaLGHvJBq6uibqZp9bU+CCOg7jUoM9u2n3lKbFG/
	XLhBAOtw==;
Received: from ip6-localhost ([::1]:28168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeKl-000TBx-El; Mon, 25 Aug 2025 21:02:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33220) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGf-000RXu-BQ
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=FF0dShBbvsjPDlcPDR6Wwlqj+ow6c7vZbr1r9B7wfFk=; b=Go6e+nOu5QIZnRXfJKxDM85LW9
 VK4BvQ1qoLDN/H9iumkbCyblUT69L1VwVDT3dwHAUR+Yv/JvK9OT7UdnGGjiwRlUEoP+WAp02x1yl
 6uWKABphY7uD6eJiyVW9ksEkNxfQ+gj1ZxhfsRyQx/kstwv7xhojkjgMtF8Lgn8rlqqO+UOCuG8HG
 dCrf8vrhr4H/aeJgmOL4vZnfrzYu8thm4NaMGh7q0AyzWz8wEYxnUl8de1w+QeGkkxBkWFFiSTH0U
 fIkBiCA1rKzUAHWiYwaQw+vB/5VaGa8Zfy5QzZigH4ILh6AoCdyKbu9r9jecIdRGE8CI0GSkdL5a4
 jX6Q4vJgXDljBZY9XZvBCrPMQ2KfW3YZPDbREwTMG5en2aEoIhZvNQORtTrs1MzS8Wziew11TT24E
 3DH97sZ4u0kpFxJjsl4WD3RwAdPm4UsEqCR2LkSQVXDYUzc0TRsnva0QLa5RbpMxyUeMRtr2r2L8Y
 PbIxrUA+MPmbWmvw1vdkPS6E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGb-000mVp-2u; Mon, 25 Aug 2025 20:58:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 099/142] smb: server: make use of
 smbdirect_socket.send_io.credits.{count, wait_queue}
Date: Mon, 25 Aug 2025 22:41:00 +0200
Message-ID: <5db92cf696d9a779f9c88acf31e94ce3644d8ff2.1756139607.git.metze@samba.org>
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

This will is used by the client already and will allow to create
common helper functions.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index fd8d3fbdfa6c..d4bc737a9882 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -96,14 +96,12 @@ struct smb_direct_transport {
 	int			recv_credits;
 	int			recv_credit_target;
 
-	atomic_t		send_credits;
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
 	int			max_rw_credits;
 	int			pages_per_rw_credit;
 	atomic_t		rw_credits;
 
-	wait_queue_head_t	wait_send_credits;
 	wait_queue_head_t	wait_rw_credits;
 
 	struct work_struct	post_recv_credits_work;
@@ -333,7 +331,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	init_waitqueue_head(&t->wait_send_credits);
 	init_waitqueue_head(&t->wait_rw_credits);
 
 	spin_lock_init(&t->receive_credit_lock);
@@ -373,7 +370,7 @@ static void free_transport(struct smb_direct_transport *t)
 					 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
-	wake_up_all(&t->wait_send_credits);
+	wake_up_all(&sc->send_io.credits.wait_queue);
 	wake_up_all(&sc->send_io.pending.wait_queue);
 
 	disable_work_sync(&t->post_recv_credits_work);
@@ -575,14 +572,14 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		t->recv_credit_target =
 				le16_to_cpu(data_transfer->credits_requested);
 		atomic_add(le16_to_cpu(data_transfer->credits_granted),
-			   &t->send_credits);
+			   &sc->send_io.credits.count);
 
 		if (le16_to_cpu(data_transfer->flags) &
 		    SMBDIRECT_FLAG_RESPONSE_REQUESTED)
 			queue_work(smb_direct_wq, &t->send_immediate_work);
 
-		if (atomic_read(&t->send_credits) > 0)
-			wake_up(&t->wait_send_credits);
+		if (atomic_read(&sc->send_io.credits.count) > 0)
+			wake_up(&sc->send_io.credits.wait_queue);
 
 		if (data_length) {
 			if (t->recv_credit_target > old_recv_credit_target)
@@ -888,6 +885,7 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 				      struct smb_direct_send_ctx *send_ctx,
 				      bool is_last)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_send_io *first, *last;
 	int ret;
 
@@ -914,8 +912,8 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 					 send_ctx->need_invalidate_rkey,
 					 send_ctx->remote_key);
 	} else {
-		atomic_add(send_ctx->wr_cnt, &t->send_credits);
-		wake_up(&t->wait_send_credits);
+		atomic_add(send_ctx->wr_cnt, &sc->send_io.credits.count);
+		wake_up(&sc->send_io.credits.wait_queue);
 		list_for_each_entry_safe(first, last, &send_ctx->msg_list,
 					 sibling_list) {
 			smb_direct_free_sendmsg(t, first);
@@ -950,16 +948,17 @@ static int wait_for_credits(struct smb_direct_transport *t,
 static int wait_for_send_credits(struct smb_direct_transport *t,
 				 struct smb_direct_send_ctx *send_ctx)
 {
+	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 
 	if (send_ctx &&
-	    (send_ctx->wr_cnt >= 16 || atomic_read(&t->send_credits) <= 1)) {
+	    (send_ctx->wr_cnt >= 16 || atomic_read(&sc->send_io.credits.count) <= 1)) {
 		ret = smb_direct_flush_send_list(t, send_ctx, false);
 		if (ret)
 			return ret;
 	}
 
-	return wait_for_credits(t, &t->wait_send_credits, &t->send_credits, 1);
+	return wait_for_credits(t, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
 }
 
 static int wait_for_rw_credits(struct smb_direct_transport *t, int credits)
@@ -1142,7 +1141,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 	ret = smb_direct_create_header(t, data_length, remaining_data_length,
 				       &msg);
 	if (ret) {
-		atomic_inc(&t->send_credits);
+		atomic_inc(&sc->send_io.credits.count);
 		return ret;
 	}
 
@@ -1182,7 +1181,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 	return 0;
 err:
 	smb_direct_free_sendmsg(t, msg);
-	atomic_inc(&t->send_credits);
+	atomic_inc(&sc->send_io.credits.count);
 	return ret;
 }
 
@@ -1516,7 +1515,7 @@ static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 		wake_up_all(&sc->status_wait);
 		wake_up_all(&sc->recv_io.reassembly.wait_queue);
-		wake_up_all(&t->wait_send_credits);
+		wake_up_all(&sc->send_io.credits.wait_queue);
 		break;
 	}
 	case RDMA_CM_EVENT_CONNECT_ERROR: {
@@ -1774,7 +1773,6 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	t->new_recv_credits = 0;
 
 	sp->send_credit_target = smb_direct_send_credit_target;
-	atomic_set(&t->send_credits, 0);
 	atomic_set(&t->rw_credits, t->max_rw_credits);
 
 	sp->max_send_size = smb_direct_max_send_size;
-- 
2.43.0


