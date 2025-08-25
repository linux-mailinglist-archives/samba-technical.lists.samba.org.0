Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09262B34D56
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1G+SuiQDh9Qg+QNby5Ycgy3s5ACzLtb3Ohy88mwNxUs=; b=gucx5u0qD2X0A5nXtdXdudD+Zk
	k7bfmMCwWu+ODzac1gikK1Nw4vXITnlvNPdc+h6/NX2tIMx3e0mzWN7aoe3APfpxX5woT1JiNuYaY
	YBpqP6gtIKbwsmOiFt67itTlMrgGJsNhBigMl+vCWCyMfY/KVlOy9UxqYYhw0tsMOgnTSBDy7Q1KF
	k8nIn/7Obz8rEYLVDpf14YkAyrf2+x/q5Iv4dVyEGJ2HPbz0PBEyZqWFDht6nY7V5RruSvTXvs4gm
	YZS7435AUo6QvMyqZAYGfcKfjBb5Wm56FccEPE8nOyoK95GjJCAPhGJQBD6P8KdjFVTz5ruHNwgkd
	ZDkWy9PA==;
Received: from ip6-localhost ([::1]:23550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeKK-000T3K-OQ; Mon, 25 Aug 2025 21:02:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47586) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGN-000RR0-Ik
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1G+SuiQDh9Qg+QNby5Ycgy3s5ACzLtb3Ohy88mwNxUs=; b=p+duxvzq3zmoIBenKE3yLFm0vJ
 bdi4LXcGzPHijJqtsJB9DxKbQnbujsHPFVNxEh6sTA+YS/0zrX1JIuO4Ad3qsfhvKu60aA05Nzedo
 C+eR6RrIMbI59tQB18ix5KX+oxo6XrbTwxbzLNoX8h8jpVzg0JU4BIDBgaJa7sve8Lha2rdkT27hg
 fwKfTKw+q+k8oOm6hlwbd1zN7a/nN8vosNMazCBboxydFHbMy2s2VHwCp8QRRN0bc+G8/7aXKRTOE
 iRilUzT1b7rxaJbxififUBYVtUkLpQUrkKePvvd2cySJTuQvEsHVW8Kjim99mXkt22QQosp2lmGQQ
 mhoUiXxTsa0342rbGzlRJdv5z6lHRC5+eSHcYTfJGTkL9cIgZ02/Dz8bp6SqrXIKEI6a//+lviKpE
 04h+t4ml03jFtLNiQMrJ83MymUEeikdpcEm7wZXzRYBGivvBmsMu2RgIUYPyzobHpf5mDMx4tij9i
 P9ZswVka4GkYXFvV66nNWObJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGJ-000mRu-3C; Mon, 25 Aug 2025 20:57:56 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 097/142] smb: server: make use of
 smbdirect_socket.disconnect_work
Date: Mon, 25 Aug 2025 22:40:58 +0200
Message-ID: <b1ac53d300f4c48d108534193b15c18eafa12364.1756139607.git.metze@samba.org>
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

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f41c82598e3c..62e13112a2b6 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -111,7 +111,6 @@ struct smb_direct_transport {
 
 	struct work_struct	post_recv_credits_work;
 	struct work_struct	send_immediate_work;
-	struct work_struct	disconnect_work;
 
 	bool			legacy_iwarp;
 	u8			initiator_depth;
@@ -248,17 +247,17 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smb_direct_transpor
 
 static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 {
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, disconnect_work);
 	struct smb_direct_transport *t =
-		container_of(work, struct smb_direct_transport,
-			     disconnect_work);
-	struct smbdirect_socket *sc = &t->socket;
+		container_of(sc, struct smb_direct_transport, socket);
 
 	/*
 	 * make sure this and other work is not queued again
 	 * but here we don't block and avoid
 	 * disable[_delayed]_work_sync()
 	 */
-	disable_work(&t->disconnect_work);
+	disable_work(&sc->disconnect_work);
 	disable_work(&t->post_recv_credits_work);
 	disable_work(&t->send_immediate_work);
 
@@ -298,7 +297,9 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 static void
 smb_direct_disconnect_rdma_connection(struct smb_direct_transport *t)
 {
-	queue_work(smb_direct_wq, &t->disconnect_work);
+	struct smbdirect_socket *sc = &t->socket;
+
+	queue_work(smb_direct_wq, &sc->disconnect_work);
 }
 
 static void smb_direct_send_immediate_work(struct work_struct *work)
@@ -325,6 +326,8 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sc = &t->socket;
 	smbdirect_socket_init(sc);
 
+	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
+
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = t;
 
@@ -346,7 +349,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	INIT_WORK(&t->post_recv_credits_work,
 		  smb_direct_post_recv_credits);
 	INIT_WORK(&t->send_immediate_work, smb_direct_send_immediate_work);
-	INIT_WORK(&t->disconnect_work, smb_direct_disconnect_rdma_work);
 
 	conn = ksmbd_conn_alloc();
 	if (!conn)
@@ -370,9 +372,9 @@ static void free_transport(struct smb_direct_transport *t)
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
-	disable_work_sync(&t->disconnect_work);
+	disable_work_sync(&sc->disconnect_work);
 	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
-		smb_direct_disconnect_rdma_work(&t->disconnect_work);
+		smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 		wait_event_interruptible(sc->status_wait,
 					 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
@@ -1493,7 +1495,7 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 
 	ksmbd_debug(RDMA, "smb-direct shutdown cm_id=%p\n", sc->rdma.cm_id);
 
-	smb_direct_disconnect_rdma_work(&st->disconnect_work);
+	smb_direct_disconnect_rdma_work(&sc->disconnect_work);
 }
 
 static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
-- 
2.43.0


