Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC23C8697F
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:25:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/V2Y++67/vRfuAhYaqQHN8gk4tEmnTYEDfg0bFUPL1E=; b=j8w0/zbFbAeoIyX248Ht2lrisu
	fGVOfqHXk39uPUVP+JEfkWOHX7J63o/TnGC3JxoVzG5H/PzvY+REf0rDfX9B4Llo/EYGNFopIzkmS
	eO0EsA+2kg6qF9254EQG6eS/+hktxzcgoOHnutZiKWV5L1KVfOMTxcqe8HsRZRaOl0TdrnqMk8t7o
	+UCQvpEm5qhAA1ECxzfRXRQxE2iMyI2oXR6O77dZXm/lNkcuJ6fIEkrpgDaEKANqmvUVJWwLCkTvr
	eN1MwcVToscIacjERpey+HU2NBa35hghAsXs8TLHroCQlXtVaywovkHnJ42S1vQCu0y8Z3Bx6XZ8u
	SOQs2JYw==;
Received: from ip6-localhost ([::1]:36822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxik-00DFHJ-As; Tue, 25 Nov 2025 18:24:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27926) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgP-00DEfq-7v
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/V2Y++67/vRfuAhYaqQHN8gk4tEmnTYEDfg0bFUPL1E=; b=TfmSRY2tb8A/2HRTKvPCKI6igP
 /nLhEbMgBTKDUl00hSCW9IhXRKPxQPjy3kpziFR993W29AwMEE9SnSA883iDSHGFVU196w8iI5KUE
 I2ttkNzMaciiEfTscBPFrk20XBFRh3j7UPwx4IrEiM35UYkE1cuaeGthZO38EI5ux3+o5W2wdtDKU
 3rqrE7thbNhk+8u0Q1tmFwsgqs+9zlyZOYiy+6rf0LjhC1Csoa8bJ7NntHM/pRl5wEew8Aoh2DCzw
 bWFnZf6RDHdZeCGHiZnGSLSfSWVerA5jzzvMkbD54tkvMooi2mnrdmrNiskdvGXGJ9pSuzaUNziTW
 pXBuD9tbITPvT/f0ULLOzCjHyiMpOsQQvZUygrJ8FZqdQSEDPxv8V5zTY0jOCk4ax/4vyf2AV/tSe
 5p2suoMc0jjEFHxQfoi577Vst6BXquuDWiakudKEr+bonwvYgYTgJxE+LWwnO3oFU0SeauEHJzICm
 vfJhz6s2pHwZqe05sVu2iBJ/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdO-00Ff3I-2b; Tue, 25 Nov 2025 18:19:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 116/145] smb: server: make use of
 smbdirect_connection_recv_io_refill[_work]()
Date: Tue, 25 Nov 2025 18:56:02 +0100
Message-ID: <27c7b12d45b5c577c31e33290b2f21ef57312b26.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 53 +++++++---------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 70a819fb1187..1c509ff2a32a 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -202,7 +202,6 @@ static inline int get_buf_page_count(void *buf, int size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
-static void smb_direct_post_recv_credits(struct work_struct *work);
 static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
@@ -662,38 +661,6 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
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
@@ -1734,24 +1701,24 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 
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


