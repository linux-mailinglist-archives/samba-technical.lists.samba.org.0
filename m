Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD254B34CD8
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rNsxA/+ZnE5gU5HwcUHdfIlOSa2NcDwDEHdeh9qGfxY=; b=xh2Askd2EYUIG6Galzf5uNg6/P
	MyI3WElcchs5muauPPL3VemhF+yIQGJ2TET74VIHXTmAzKAcyW9a0WRAU+7fXE4kB6yP6cbr8cY5h
	h5QnKw9+eSo0PDJ6y4CckggsmD98c4PPuUC9yWlp2I7Q50AUnLurOzk8vmL7w/RzJtdlxCBjGbnmW
	8MHOanugMpWKdG1nQMdzPCa8yic31uBdkkUfPSEjdBqSzAnzC/C7vFAOcDh28e5CbAeFEhx2zNVJP
	XT0QxGVUEzreLSMxqPhYtZua+TvjcCjpttesszpmJbkBx6nbpPFrzNBOmXMB3yY3Rm4bpqPQ2jmeW
	8ZsF0J8A==;
Received: from ip6-localhost ([::1]:44938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeC3-000Peu-D0; Mon, 25 Aug 2025 20:53:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32046) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe9e-000Oh1-Mr
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rNsxA/+ZnE5gU5HwcUHdfIlOSa2NcDwDEHdeh9qGfxY=; b=nt6bvWlcFvoFaiIpddZsG6g52r
 g5EYfbbPi5ubKoW2igPZLI0NkqsUofkN/7c8CAqtuDPGIa1c+w21RoryKJyFUKGg9L3Ce86jR6oho
 M7PGu4EXxslgUwSj7O7m1bO0dHwyB/x4icJIgjem5d8xJ4rKzcUmYq2ZvJrzz/y+fh6UUJV/jyadJ
 FDzxtRbyVps/+Ss5ElXdc8UUfOZxs2S70MT2GgTo77F+U1QDwqEdRdMMOK8DyK4jmLYSN1FGIy3NQ
 i+Jk/gh+eheok2nWCbvV5xxdtM/wminIixArktEqEc3ox3f6WjPHoqkr9EnkaI62RAco27UILvRTf
 hqGOQin/Zq+bllKXoqWf0CNzKy4mLgOhVtg583+iABjmVgG/3Py+Hhh5EfafqD7oIBWwaIE9o8mNF
 MzypkthcpYlzc72ItcL5cNQ0cqiQnSEiH2h+4v/K0lS6R8pb3nGddRApyb8MWSydrNheYE+fvDtJ0
 rZAUGB+o8BaaIUs9PfOwqEBo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe9Z-000l0j-1X; Mon, 25 Aug 2025 20:50:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 055/142] smb: client: pass struct smbdirect_socket to {get,
 put}_receive_buffer()
Date: Mon, 25 Aug 2025 22:40:16 +0200
Message-ID: <03408674aa466dae2c1c5806a766c2d8b4144bdb.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 205fd57272fa..01f4b1ee727a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -21,9 +21,9 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 }
 
 static struct smbdirect_recv_io *get_receive_buffer(
-		struct smbd_connection *info);
+		struct smbdirect_socket *sc);
 static void put_receive_buffer(
-		struct smbd_connection *info,
+		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
 static int allocate_receive_buffers(struct smbd_connection *info, int num_buf);
 static void destroy_receive_buffers(struct smbd_connection *info);
@@ -519,7 +519,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 	if (sc->recv_io.credits.target >
 		atomic_read(&sc->recv_io.credits.count)) {
 		while (true) {
-			response = get_receive_buffer(info);
+			response = get_receive_buffer(sc);
 			if (!response)
 				break;
 
@@ -528,7 +528,7 @@ static void smbd_post_send_credits(struct work_struct *work)
 			if (rc) {
 				log_rdma_recv(ERR,
 					"post_recv failed rc=%d\n", rc);
-				put_receive_buffer(info, response);
+				put_receive_buffer(sc, response);
 				break;
 			}
 
@@ -592,7 +592,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		sc->recv_io.reassembly.full_packet_received = true;
 		negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
-		put_receive_buffer(info, response);
+		put_receive_buffer(sc, response);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
 		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
@@ -662,7 +662,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			enqueue_reassembly(info, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
-			put_receive_buffer(info, response);
+			put_receive_buffer(sc, response);
 
 		return;
 
@@ -677,7 +677,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	log_rdma_recv(ERR, "unexpected response type=%d\n", sc->recv_io.expected);
 	WARN_ON_ONCE(sc->recv_io.expected != SMBDIRECT_EXPECT_DATA_TRANSFER);
 error:
-	put_receive_buffer(info, response);
+	put_receive_buffer(sc, response);
 	smbd_disconnect_rdma_connection(info);
 }
 
@@ -1225,7 +1225,7 @@ static int smbd_negotiate(struct smbd_connection *info)
 	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
-	struct smbdirect_recv_io *response = get_receive_buffer(info);
+	struct smbdirect_recv_io *response = get_receive_buffer(sc);
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_RUNNING;
@@ -1317,9 +1317,8 @@ static struct smbdirect_recv_io *_get_first_reassembly(struct smbd_connection *i
  * pre-allocated in advance.
  * return value: the receive buffer, NULL if none is available
  */
-static struct smbdirect_recv_io *get_receive_buffer(struct smbd_connection *info)
+static struct smbdirect_recv_io *get_receive_buffer(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *ret = NULL;
 	unsigned long flags;
 
@@ -1343,9 +1342,8 @@ static struct smbdirect_recv_io *get_receive_buffer(struct smbd_connection *info
  * receive buffer is returned.
  */
 static void put_receive_buffer(
-	struct smbd_connection *info, struct smbdirect_recv_io *response)
+	struct smbdirect_socket *sc, struct smbdirect_recv_io *response)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	unsigned long flags;
 
 	if (likely(response->sge.length != 0)) {
@@ -1400,7 +1398,7 @@ static void destroy_receive_buffers(struct smbd_connection *info)
 	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *response;
 
-	while ((response = get_receive_buffer(info)))
+	while ((response = get_receive_buffer(sc)))
 		mempool_free(response, sc->recv_io.mem.pool);
 }
 
@@ -1501,7 +1499,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 			list_del(&response->list);
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
-			put_receive_buffer(info, response);
+			put_receive_buffer(sc, response);
 		} else
 			spin_unlock_irqrestore(
 				&sc->recv_io.reassembly.lock, flags);
@@ -2028,7 +2026,7 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 				}
 				queue_removed++;
 				sc->statistics.dequeue_reassembly_queue++;
-				put_receive_buffer(info, response);
+				put_receive_buffer(sc, response);
 				offset = 0;
 				log_read(INFO, "put_receive_buffer offset=0\n");
 			} else
-- 
2.43.0


