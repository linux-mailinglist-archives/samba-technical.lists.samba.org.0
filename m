Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F2B34D9C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jrPM3Wc5Ry5k1EV23BCqF6yWgExKcQpHfp7rquAKelg=; b=M5DjFn85RflP3NAjxajCzZhFri
	/v9HQ46EUtNqX3dT5ssJ+gwQ4WA6M1kLtdVUca0/y2bfkkh9D8lw1sH8el4XSvbCAkDBaW69jFqpK
	zqsDSjkZ85xRh+6nD1/C2WndZgI7DRTlkiUpFg3Rcf5d1dtQhbXj6Ydxik7Gj639t36h5ptKbZOlU
	VlMDdi4egjGtKHp4M9UV3lliIWqI9zCd2fh6K38DFuyikPbNY0CQRx8RZQ3YGiJyTRxO5/qfMowew
	iekDHWxZqhw9YorTHyOdk2mUCemzy2b6wcoxbAFczw3QbycSfjRQmcb+jn2ZpxTJVU26KGWluQWnV
	WCHwZicA==;
Received: from ip6-localhost ([::1]:47270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePy-000VYr-Lv; Mon, 25 Aug 2025 21:07:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61160) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLJ-000TW9-PK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=jrPM3Wc5Ry5k1EV23BCqF6yWgExKcQpHfp7rquAKelg=; b=jnK0mGbUZVR1zGNKMFErIfbVbw
 XPa1vc5sJGx3zJCBv2o2+if9pLx7cMfMNMZNPF5C37MQ7HlEgmWFFJnbT5SYVQjV+qGdOTZfLYbfb
 iExqO1VVD0s5souek6R0bCbZ2O99oQ091htAUONx2EZSfvM67O/SlMCm//Lm3UedLjXBazubPC2LN
 CWs7Vo2NTmb4VBkAPQ79jXWoJyaGh/qRh8j1Dg4rbGeSIGxZTFGhoJLLHmylTwkpoPGvu3r6zkuV/
 /yT9dAHwOroMOTJN52QHUOpDgP/QUWDnHmjmTltg0gUv3k/hqlMTgUh84AS7qcJbX5BYXAhAZny6Q
 pnSYr0RXWDiVihVdTq5Hb8zynr3IRgAxp0tjZRhCcnQX/JiAWP1PoQPfrWkuv954HGQLggmgK9sGb
 +FGT4xZZ8VkQzLAwK1EOt7dU/FqW4qHuaiXJW0ZPvY09siGrTrKos/1gJwJ2YlTWrtmRXKwepQ7Im
 5Xmc3Wq5tdtuviDaPaiyxE2J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLH-000nTO-0R; Mon, 25 Aug 2025 21:03:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 128/142] smb: server: pass struct smbdirect_socket to
 smb_direct_{alloc, free}_sendmsg()
Date: Mon, 25 Aug 2025 22:41:29 +0200
Message-ID: <23f90772ca0ee0be79a0d6b2d713872fb0031778.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4551abb7bf92..95f9552ef843 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -413,9 +413,8 @@ static void free_transport(struct smb_direct_transport *t)
 }
 
 static struct smbdirect_send_io
-*smb_direct_alloc_sendmsg(struct smb_direct_transport *t)
+*smb_direct_alloc_sendmsg(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_send_io *msg;
 
 	msg = mempool_alloc(sc->send_io.mem.pool, KSMBD_DEFAULT_GFP);
@@ -427,10 +426,9 @@ static struct smbdirect_send_io
 	return msg;
 }
 
-static void smb_direct_free_sendmsg(struct smb_direct_transport *t,
+static void smb_direct_free_sendmsg(struct smbdirect_socket *sc,
 				    struct smbdirect_send_io *msg)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int i;
 
 	if (msg->num_sge > 0) {
@@ -810,13 +808,11 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 {
 	struct smbdirect_send_io *sendmsg, *sibling;
-	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
 	struct list_head *pos, *prev, *end;
 
 	sendmsg = container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
 	sc = sendmsg->socket;
-	t = container_of(sc, struct smb_direct_transport, socket);
 
 	ksmbd_debug(RDMA, "Send completed. status='%s (%d)', opcode=%d\n",
 		    ib_wc_status_msg(wc->status), wc->status,
@@ -838,11 +834,11 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	for (pos = &sendmsg->sibling_list, prev = pos->prev, end = sendmsg->sibling_list.next;
 	     prev != end; pos = prev, prev = prev->prev) {
 		sibling = container_of(pos, struct smbdirect_send_io, sibling_list);
-		smb_direct_free_sendmsg(t, sibling);
+		smb_direct_free_sendmsg(sc, sibling);
 	}
 
 	sibling = container_of(pos, struct smbdirect_send_io, sibling_list);
-	smb_direct_free_sendmsg(t, sibling);
+	smb_direct_free_sendmsg(sc, sibling);
 }
 
 static int manage_credits_prior_sending(struct smb_direct_transport *t)
@@ -946,7 +942,7 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 		wake_up(&sc->send_io.credits.wait_queue);
 		list_for_each_entry_safe(first, last, &send_ctx->msg_list,
 					 sibling_list) {
-			smb_direct_free_sendmsg(t, first);
+			smb_direct_free_sendmsg(sc, first);
 		}
 	}
 	return ret;
@@ -1021,7 +1017,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 	int header_length;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(t);
+	sendmsg = smb_direct_alloc_sendmsg(sc);
 	if (IS_ERR(sendmsg))
 		return PTR_ERR(sendmsg);
 
@@ -1064,7 +1060,7 @@ static int smb_direct_create_header(struct smb_direct_transport *t,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(t, sendmsg);
+		smb_direct_free_sendmsg(sc, sendmsg);
 		return ret;
 	}
 
@@ -1220,7 +1216,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 		goto err;
 	return 0;
 err:
-	smb_direct_free_sendmsg(t, msg);
+	smb_direct_free_sendmsg(sc, msg);
 	atomic_inc(&sc->send_io.credits.count);
 	return ret;
 }
@@ -1597,7 +1593,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 	struct smbdirect_negotiate_resp *resp;
 	int ret;
 
-	sendmsg = smb_direct_alloc_sendmsg(t);
+	sendmsg = smb_direct_alloc_sendmsg(sc);
 	if (IS_ERR(sendmsg))
 		return -ENOMEM;
 
@@ -1633,7 +1629,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 						 DMA_TO_DEVICE);
 	ret = ib_dma_mapping_error(sc->ib.dev, sendmsg->sge[0].addr);
 	if (ret) {
-		smb_direct_free_sendmsg(t, sendmsg);
+		smb_direct_free_sendmsg(sc, sendmsg);
 		return ret;
 	}
 
@@ -1643,7 +1639,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 
 	ret = post_sendmsg(t, NULL, sendmsg);
 	if (ret) {
-		smb_direct_free_sendmsg(t, sendmsg);
+		smb_direct_free_sendmsg(sc, sendmsg);
 		return ret;
 	}
 
-- 
2.43.0


