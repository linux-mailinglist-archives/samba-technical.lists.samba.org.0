Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC35CB34D7D
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=m1kpG5jICFaLmwXJmoXoQrUImdOg79xUIH9cZYLhL9k=; b=Bp37CsPqE6qNJZJjRGd3ZDpZU+
	L6/uIHAoF6s3Go32jmoDTYaM4W07qFHEQDm3cLQusof6cPSHQddCGXGX/K5mkn6V5UYFSVJ2Ynsj+
	ohtzfqw01cXQS+QuulFgDvFUVMk91yxlpJYmnEe5QIXPdCBszCbg7rgbjwSsZCYzsLU5S5rx5SDCo
	lZygvcNaZdH/6a1MwgYTdYk3FaUufiqpxvhG3kCkXL7nmMBJ3g5RhEqU2IOYb7shCiFdUpGOQ/yqx
	nQ3kUrcbdTuPO8mKTU76ZGqy7qWxmtjpbcbTEX1e32hW3vbtrTVLDCucMMHPDnQScDAq1nn8ed4b/
	6lkicaEw==;
Received: from ip6-localhost ([::1]:27904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeNN-000UKz-Nh; Mon, 25 Aug 2025 21:05:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32548) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIx-000SWT-Lh
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=m1kpG5jICFaLmwXJmoXoQrUImdOg79xUIH9cZYLhL9k=; b=S0xWiyltjofDz7BUl2GeP3xtsg
 +ayxzzr6ce8UWbuy4lrulPDLE03ZeADNdTyEah4Vp6Wn5smRhPs5zQyvKtysIlg9Slut5T7zDFcNp
 v/667v84Sk3dTUb407Je5Fv9sumhodtLnITiFHA4YiYSUa8/7R9FTHTF2QIULXCLkK/1Jn91E/VwJ
 +tzNJGrsALBix77RSQMAFFEy5fYCYGTXrbd81zUvBxZswDO27JDn66zJeHpx7w8PrhMrNPZh457Hr
 WTMPbqUiqNKbXq0UX2wlM2z8G6nDZwTGi90crQpWUIEKOn5/HXQkPSJSWCD3p/eCozjcJleFSHYly
 dZzyNlWLlnth+Bdz/pyzaWbPXe6VYxWX+J/EbzCjyo+7d07y21iW1NuU5tIPYU4UmS6F9EkdQHSAb
 Ago3UTEeXrVfrrASKnWLntidqFgzeby4LtRW5Cpt4Q3yGmEVI/B+/WaOy/dgMlca6k6sR0tAZ1N8i
 s6qVgOTsIrD/8bREFAGZ/ESA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIs-000mwU-2e; Mon, 25 Aug 2025 21:00:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 113/142] smb: server: make use of
 smbdirect_socket.idle.immediate_work
Date: Mon, 25 Aug 2025 22:41:14 +0200
Message-ID: <4acacacc787c646db495f57633ceafd9963981dd.1756139607.git.metze@samba.org>
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

With this commit the server only uses struct smbdirect_socket!

It doesn't use the idle timer yet, but it will be added soon,
from there we'll be ready split common functions.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8e1df4eb39d6..cca8e37a10ec 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -91,8 +91,6 @@ struct smb_direct_transport {
 	struct ksmbd_transport	transport;
 
 	struct smbdirect_socket socket;
-
-	struct work_struct	send_immediate_work;
 };
 
 #define KSMBD_TRANS(t) (&(t)->transport)
@@ -214,8 +212,6 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, disconnect_work);
-	struct smb_direct_transport *t =
-		container_of(sc, struct smb_direct_transport, socket);
 
 	/*
 	 * make sure this and other work is not queued again
@@ -224,7 +220,7 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	 */
 	disable_work(&sc->disconnect_work);
 	disable_work(&sc->recv_io.posted.refill_work);
-	disable_work(&t->send_immediate_work);
+	disable_work(&sc->idle.immediate_work);
 
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
@@ -269,9 +265,10 @@ smb_direct_disconnect_rdma_connection(struct smb_direct_transport *t)
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
 {
-	struct smb_direct_transport *t = container_of(work,
-			struct smb_direct_transport, send_immediate_work);
-	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, idle.immediate_work);
+	struct smb_direct_transport *t =
+		container_of(sc, struct smb_direct_transport, socket);
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return;
@@ -312,7 +309,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	INIT_WORK(&sc->recv_io.posted.refill_work,
 		  smb_direct_post_recv_credits);
-	INIT_WORK(&t->send_immediate_work, smb_direct_send_immediate_work);
+	INIT_WORK(&sc->idle.immediate_work, smb_direct_send_immediate_work);
 
 	conn = ksmbd_conn_alloc();
 	if (!conn)
@@ -347,7 +344,7 @@ static void free_transport(struct smb_direct_transport *t)
 	wake_up_all(&sc->send_io.pending.wait_queue);
 
 	disable_work_sync(&sc->recv_io.posted.refill_work);
-	disable_work_sync(&t->send_immediate_work);
+	disable_work_sync(&sc->idle.immediate_work);
 
 	if (sc->ib.qp) {
 		ib_drain_qp(sc->ib.qp);
@@ -554,7 +551,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 
 		if (le16_to_cpu(data_transfer->flags) &
 		    SMBDIRECT_FLAG_RESPONSE_REQUESTED)
-			queue_work(smb_direct_wq, &t->send_immediate_work);
+			queue_work(smb_direct_wq, &sc->idle.immediate_work);
 
 		if (atomic_read(&sc->send_io.credits.count) > 0)
 			wake_up(&sc->send_io.credits.wait_queue);
@@ -770,7 +767,7 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 	}
 
 	if (credits)
-		queue_work(smb_direct_wq, &t->send_immediate_work);
+		queue_work(smb_direct_wq, &sc->idle.immediate_work);
 }
 
 static void send_done(struct ib_cq *cq, struct ib_wc *wc)
-- 
2.43.0


