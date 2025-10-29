Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC4C1AE9F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xYLqMtiJaEyl40ynYo3GXRyJ4Z/DmCJcNoPUA+BC/6A=; b=bA8qIctD4RTKlp7/G+zu6f4LA3
	fhcsp47FVZZi1bxynuP7vFmC5Xl195O1kHSQh6zgxEbw7tmhB5B0TxbrMM12eWQ4toTMTiKOvJTdC
	oIm1cVef730S3WARGXda6OAMuZWtKaHa3XR08JFgUXYzuxjcx4plPgAhqoAU0BRjM0RJBxbBkT/Lc
	wm4TRQtqe9gCxwXIW8gvay9FVfgCSoFfpDTTaVwAbpm9kK36RBwVTWZUh36SNb5JhEW1GR1JwFzOF
	aGBGi9S2bC7hSJDfbjzR2BFZAnESBeRnvkYpTkZWWVwh+ipatz6mdTyHSlnqGcF5NAX4LaQQ18vQa
	0vtjZcUg==;
Received: from ip6-localhost ([::1]:59080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Xq-009Dzw-HI; Wed, 29 Oct 2025 13:48:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28086) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Iz-0098d2-Rz
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xYLqMtiJaEyl40ynYo3GXRyJ4Z/DmCJcNoPUA+BC/6A=; b=Q1DCPJcJBYfVdB8iVm6hUA7qkj
 MgmsU3juj2kjVuXnAs5SvXHPJqV19vYeC6t+rgHFuvJVTRlo9CipZGN7dNpkidJPMrkVup+mY0Zzx
 tf5h1xChmbrrP5wAaexVla8QsG793JCo3PxNzvAITpGDjeur95LQv+6AOuYvKBX8rzqYmB6kwSH2Y
 4u5jw8vUE85z77GIpml538c+tC7zrkmyHaJ6Mnhrst157ps31DG0KH+JxsKkiML5xVr59IywCu5Ih
 13yAVDWKuqLtWGBNf/Z6LsCd3ifSE0ZkBc3SrUXpmbb+44muCKV0z1a7nJDJMjNNMysocucbqrj22
 J2mSmyfRI5kv+s+TZOqf3Ajib077UdJM5efcupW6oOTMXxZc+KICxwUuespNBSE3wVadd7flPTgew
 8n81f0QErqOqW6+WRjq6hqQ1QEuhzTSvnodGH6lGr5zjAEKfF6qgtMH7+RBoH+8NiYUxhdSz20jRh
 KjRa7gnoij6OlNzBbKQXtuVR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Iv-00BcwV-1E; Wed, 29 Oct 2025 13:33:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 110/127] smb: server: make use of
 smbdirect_connection_recv_io_refill[_work]()
Date: Wed, 29 Oct 2025 14:21:28 +0100
Message-ID: <1707f35c930189212413116b933d345418bddc5b.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is basically a copy of smb_direct_post_recv_credits(), but
there are several improvements compared to the existing function:

1. We calculate the number of missing posted buffers by getting the
   difference between recv_io.credits.target and recv_io.posted.count.

   Instead of the difference between recv_io.credits.target
   and recv_io.credits.count, because recv_io.credits.count is
   only updated once a message is send to the peer.

   It was not really a problem before, because we have
   a fixed number smbdirect_recv_io buffers, so the
   loop terminated when smbdirect_connection_get_recv_io()
   returns NULL.

   But using recv_io.posted.count makes it easier to
   understand.

2. In order to tell the peer about the newly posted buffer
   and grant the credits, we only trigger the send immediate
   when we're not granting only the last possible credit.

   This is mostly a difference relative to the servers
   smb_direct_post_recv_credits() implementation,
   which should avoid useless ping pong messages.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 53 +++++++---------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4acae8e43b76..9cc8cffcc6e9 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -202,7 +202,6 @@ static inline int get_buf_page_count(void *buf, int size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
-static void smb_direct_post_recv_credits(struct work_struct *work);
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
@@ -651,38 +650,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 	goto again;
 }
 
-static void smb_direct_post_recv_credits(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
-	struct smbdirect_recv_io *recvmsg;
-	int credits = 0;
-	int ret;
-
-	if (atomic_read(&sc->recv_io.credits.count) < sc->recv_io.credits.target) {
-		while (true) {
-			recvmsg = smbdirect_connection_get_recv_io(sc);
-			if (!recvmsg)
-				break;
-
-			recvmsg->first_segment = false;
-
-			ret = smbdirect_connection_post_recv_io(recvmsg);
-			if (ret) {
-				pr_err("Can't post recv: %d\n", ret);
-				smbdirect_connection_put_recv_io(recvmsg);
-				break;
-			}
-			credits++;
-
-			atomic_inc(&sc->recv_io.posted.count);
-		}
-	}
-
-	if (credits)
-		queue_work(sc->workqueue, &sc->idle.immediate_work);
-}
-
 static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 {
 	int new_credits;
@@ -1703,24 +1670,24 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
 	/*
 	 * We negotiated with success, so we need to refill the recv queue.
-	 * We do that with sc->idle.immediate_work still being disabled
-	 * via smbdirect_socket_init(), so that queue_work(sc->workqueue,
-	 * &sc->idle.immediate_work) in smb_direct_post_recv_credits()
-	 * is a no-op.
 	 *
 	 * The message that grants the credits to the client is
 	 * the negotiate response.
 	 */
-	INIT_WORK(&sc->recv_io.posted.refill_work, smb_direct_post_recv_credits);
-	smb_direct_post_recv_credits(&sc->recv_io.posted.refill_work);
-	if (unlikely(sc->first_error))
-		return sc->first_error;
-	INIT_WORK(&sc->idle.immediate_work, smb_direct_send_immediate_work);
+	ret = smbdirect_connection_recv_io_refill(sc);
+	if (ret < 0)
+		return ret;
+	ret = 0;
 
 respond:
 	ret = smb_direct_send_negotiate_response(sc, ret);
+	if (ret)
+		return ret;
 
-	return ret;
+	INIT_WORK(&sc->recv_io.posted.refill_work, smbdirect_connection_recv_io_refill_work);
+	INIT_WORK(&sc->idle.immediate_work, smb_direct_send_immediate_work);
+
+	return 0;
 }
 
 static int smb_direct_connect(struct smbdirect_socket *sc)
-- 
2.43.0


