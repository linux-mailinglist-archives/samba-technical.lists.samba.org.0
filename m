Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A765AB34C84
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Qb2fAEaHjcANocrtDk9gR/XktuPPLROzzTlTDhEBXK8=; b=AXE81dB72J3h8QcuQgwF+EWfHG
	i03mbpuIWnzlzTxpNg+JGFj6juGzL4c6KZ+yqBrQMQmMjKj6zODBE90Uby9Mysu3ow1RzH/vyUQPL
	NaB4Yq0/x50po5RGske+Jx2THQXr7dt/A3tRZyK8DxiyT4YrBJyrCkuQdZuKqg5qnH83Xqk7NWLh8
	Mf+s16UZnGO9oidn9WwgK0Sy0HTMHhMKIsn/lYEVhjKod35cZOTHXhfW4GZlscWjaMxqXPnyjQTuO
	ooEtXzyOUvvYm/TJFyrQsuDCsZJmM4xtwP/xPCwDM2GJTumssS2qzrXQld/JfgTmKBsfYV5wUy3s2
	2eCgPFuQ==;
Received: from ip6-localhost ([::1]:62494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe6a-000NQV-MG; Mon, 25 Aug 2025 20:47:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42188) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5L-000Mvs-5o
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Qb2fAEaHjcANocrtDk9gR/XktuPPLROzzTlTDhEBXK8=; b=cs7gmX1Dcmf7HyY5gWrzqbwHzF
 +bG2fhjV9HiQgq+RmtwDDUn4sonNwymq4RGWY7T+tyu5B/z/svOH7T6ygIZuFJOa7NPeKlxj/N6As
 xlJeEg69M+66pnNZ6eqwrTUZAaOQvDYA3d/Lrq1n3t1WrlqfQ/OU1q5D+fFvI9KR3M8noUTpq7hQI
 SOPLzArWiXrKAOTTXnO66drmQ0tAnBgari7luewBIk+LFcRB89I4cDddEWF/l/iJRk7sQheuvCy24
 svba9LbmbShVR+bhUo4LNPsm7tPG0HFNW1AA6pFrWnPO2PSkoK7SYe5BekhAQYpmYSsIi0E8eoVOF
 y8gVpgSZ5vdbMDdtfH9Biz+rQoTpnLQjqG8AMHkkAlGXoQELdNGNYEU8AkLJUqGc8KRkB0YJWEmtv
 +Wo0Inasx2L2dPH94WnrHVtOj4NOMk+DqreknCdE7IRyeedKLWszRcr/IpAgtNcurDdktBzCq5UQd
 nKbab2avHYUgd7iURYQTUw25;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5I-000k7S-0c; Mon, 25 Aug 2025 20:46:32 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 028/142] smb: client: make sure smbd_disconnect_rdma_work()
 doesn't run after smbd_destroy() took over
Date: Mon, 25 Aug 2025 22:39:49 +0200
Message-ID: <3bd62ae3cf284c59c20ed7b756f8e619a93fb5dc.1756139607.git.metze@samba.org>
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

If we're already disconnecting we don't need to queue the
disconnect_work again. disable_work() turns the next queue_work()
into a no-op.

Also let smbd_destroy() cancel(and disable) queued disconnect_work and
call smbd_disconnect_rdma_work() inline.

The makes it more obvious that disconnect_work is never queued
again after smbd_destroy() called smbd_disconnect_rdma_work().

It also means we have a single place to call rdma_disconnect().

While there we better also disable all other [delayed_]work.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b9ee819aea79..eab8433a518c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -159,6 +159,18 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, disconnect_work);
+	struct smbd_connection *info =
+		container_of(sc, struct smbd_connection, socket);
+
+	/*
+	 * make sure this and other work is not queued again
+	 * but here we don't block and avoid
+	 * disable[_delayed]_work_ync()
+	 */
+	disable_work(&sc->disconnect_work);
+	disable_work(&info->post_send_credits_work);
+	disable_work(&info->mr_recovery_work);
+	disable_delayed_work(&info->idle_timer_work);
 
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
@@ -315,11 +327,13 @@ static int smbd_conn_upcall(
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
 			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+			smbd_disconnect_rdma_work(&sc->disconnect_work);
 			wake_up_all(&sc->status_wait);
 			break;
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		smbd_disconnect_rdma_work(&sc->disconnect_work);
 		wake_up_all(&sc->status_wait);
 		wake_up_all(&sc->recv_io.reassembly.wait_queue);
 		wake_up_all(&sc->send_io.credits.wait_queue);
@@ -1436,9 +1450,12 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	sc = &info->socket;
 	sp = &sc->parameters;
 
+	log_rdma_event(INFO, "cancelling and disable disconnect_work\n");
+	disable_work_sync(&sc->disconnect_work);
+
 	log_rdma_event(INFO, "destroying rdma session\n");
-	if (sc->status != SMBDIRECT_SOCKET_DISCONNECTED) {
-		rdma_disconnect(sc->rdma.cm_id);
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
+		smbd_disconnect_rdma_work(&sc->disconnect_work);
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event_interruptible(
 			sc->status_wait,
-- 
2.43.0


