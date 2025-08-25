Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FBB34CDF
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ObE/uXWu142QwpSq/YLaFomoshUhKZCHOqgm3rPJDQU=; b=Wavd0yWWshzKYSxQIKZqNYfv0n
	v5WATmdoCLLTUIw/hhh1nzCaw8ImACLJFYIA4RE/IP8MWD0EUSbzrkogq8C6LU0FGKWnqn0zXwA/Z
	H12l2ZAi8XjzhB+ZOSUhbpP8NqFtHB1ahgfT6U2HOdzjxUN2nXwBglVF/2/5xCCfcVVBgfX/495jl
	EtYDN0tWMTpDHFZ1xGwScbQ8T0AN6/iri98mNI063xOjy4XilJlIQ6Ju9tgoXcY9lWcpIJnDx1US0
	h6ngO08aP+2e+sGTmZTaRYTbHwYJyIOLUGo0FnEgEV7YomNr1DZj9lzLAZSoxmmaxo44ad1gQLCTj
	SthUWk8g==;
Received: from ip6-localhost ([::1]:37720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeCe-000PsR-QI; Mon, 25 Aug 2025 20:54:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeA9-000Osm-8m
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ObE/uXWu142QwpSq/YLaFomoshUhKZCHOqgm3rPJDQU=; b=X5RiTVGG+KNBWAyvRYw/Do5YBU
 qeD+ICypVj4fWtOOXebfoQVjZPn3y8i035ME3kgKOkxwAbu/U1z7/SFal0FzIQBbXimwqZ0m3zpPE
 JnQV61inYGRUiMkjeSEfAoq7dYKFKocSt/kJbtvTnQwhmt4bw36/31isA5ib+Kvjn3VQbFV2abt3Z
 Bl2/5HjcmwkbY9fR4P9iGu/Emx2Qd3d8TQn0go1vzligNP2RfGAuIzAz+kwvRQLZrL5NlYWDWTO8m
 n9j/3TJ7BJTdROeZhc1W69z9JwUsoRl3ifHNp378sqPFu7gsKlGSLJTEvROLLGzL/B95f+5ltr358
 mo7MR14avyqxsO+BNmykdcELgnJyWsx8BgY/DMqNT1lpZvj3gX5CWc48bBGJaFtGCUR2LFwAUYKOo
 QK1XCwOdmh2kx6PZL/FhKF6Xez32dhYnzYJl3f0uzwz/jWR8b03q96vpFtU+Dl7mz52UBKo++C3fl
 MCIG0T43FT7n6oFwUb+eEwer;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeA7-000lAN-0i; Mon, 25 Aug 2025 20:51:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 058/142] smb: client: pass struct smbdirect_socket to
 {enqueue, _get_first}_reassembly()
Date: Mon, 25 Aug 2025 22:40:19 +0200
Message-ID: <64139a3dd2c20b6083ddbbe03e17dbbe8d974870.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index d7ed5534669a..0f68c35bef2a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -29,10 +29,10 @@ static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf);
 static void destroy_receive_buffers(struct smbdirect_socket *sc);
 
 static void enqueue_reassembly(
-		struct smbd_connection *info,
+		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response, int data_length);
 static struct smbdirect_recv_io *_get_first_reassembly(
-		struct smbd_connection *info);
+		struct smbdirect_socket *sc);
 
 static int smbd_post_recv(
 		struct smbd_connection *info,
@@ -659,7 +659,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			if (sc->recv_io.credits.target > old_recv_credit_target)
 				queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
 
-			enqueue_reassembly(info, response, data_length);
+			enqueue_reassembly(sc, response, data_length);
 			wake_up(&sc->recv_io.reassembly.wait_queue);
 		} else
 			put_receive_buffer(sc, response);
@@ -1272,12 +1272,10 @@ static int smbd_negotiate(struct smbd_connection *info)
  * data_length: the size of payload in this packet
  */
 static void enqueue_reassembly(
-	struct smbd_connection *info,
+	struct smbdirect_socket *sc,
 	struct smbdirect_recv_io *response,
 	int data_length)
 {
-	struct smbdirect_socket *sc = &info->socket;
-
 	spin_lock(&sc->recv_io.reassembly.lock);
 	list_add_tail(&response->list, &sc->recv_io.reassembly.list);
 	sc->recv_io.reassembly.queue_length++;
@@ -1298,9 +1296,8 @@ static void enqueue_reassembly(
  * Caller is responsible for locking
  * return value: the first entry if any, NULL if queue is empty
  */
-static struct smbdirect_recv_io *_get_first_reassembly(struct smbd_connection *info)
+static struct smbdirect_recv_io *_get_first_reassembly(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *ret = NULL;
 
 	if (!list_empty(&sc->recv_io.reassembly.list)) {
@@ -1492,7 +1489,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "drain the reassembly queue\n");
 	do {
 		spin_lock_irqsave(&sc->recv_io.reassembly.lock, flags);
-		response = _get_first_reassembly(info);
+		response = _get_first_reassembly(sc);
 		if (response) {
 			list_del(&response->list);
 			spin_unlock_irqrestore(
@@ -1968,7 +1965,7 @@ int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 		to_read = size;
 		offset = sc->recv_io.reassembly.first_entry_offset;
 		while (data_read < size) {
-			response = _get_first_reassembly(info);
+			response = _get_first_reassembly(sc);
 			data_transfer = smbdirect_recv_io_payload(response);
 			data_length = le32_to_cpu(data_transfer->data_length);
 			remaining_data_length =
-- 
2.43.0


