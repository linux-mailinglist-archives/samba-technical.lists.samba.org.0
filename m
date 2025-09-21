Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41764B8E75A
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QAgou3ftDUWmD4kZL5Jx3dhyC0z8+wfb9pgA7mCZHWs=; b=4I/wX1ivb2Z84zdJGmOFzl8xqW
	3lp6EnJVBNFsVSnXJkewigDb/OI8DwUh98WL/rHQrWTai8bX1/pO+PEanENfzhmX0XZUt7XrHMBwL
	LRPmqt77QnRe5YJo8YpuevehQ5flB5ZBHDDxrH0pO8c2AFg1ZG7nZWZBGKX/py2k7SkbzYYDhvAo/
	3Tnf4vTkoiHJgcr/aksaQ3VCyavZa6DtJ2LXUYdhm1FlBsRgOH8cROkHB6BtWFfiEXwHpssTgNd1O
	EJg6z/GvdeVb80c2OG2jf5+AZaJa4DS5gtk8J64vXA8XQ5muC1wJG6sLxtOFG3ht2t1AIBsVm1mMN
	QsAg5HeA==;
Received: from ip6-localhost ([::1]:28490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RuG-004TZP-Bf; Sun, 21 Sep 2025 21:47:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38010) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RtJ-004TJe-DS
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QAgou3ftDUWmD4kZL5Jx3dhyC0z8+wfb9pgA7mCZHWs=; b=wy9KfWizES3S7+2U/xZzbTON4p
 HKQDp9XdFURvFJsewXPhOYEMRPrcw64M1IxYfqwUXZgZzbl35J4hCUZoqZKzwNHln0IqK/AWWkp2X
 9dqMa+NccS/vK0xlSjt8+PU8JCYjSEcWg91D3REYWdBciwrg+O7/Y/aMOZ1OhsGIfUZl8sz9Yyb8O
 tNPL5/XlzetX/G4uuMb0dv5oMwMLjEKmQUk0Jg+e3JipQksrrOHtkI0h/GLmQ0ulDsXxtW9bonT84
 pcVKjjfxwhTj0pR9n9M427lezZMJw4J2eYGV9l+3bkrLlnDCf+Z7m+7own04SN93UjFZuamHWhMVE
 HAVoe3LaW4nHFx5MXoRkYRaCtEvlBReXR+etayWa5L7+hBOgnoiXU/EmrzbainUCyPLJwGlxODe0t
 FgMagYO1IdQyCr5y+Px8dcH/2MJK6VhLz/G5qeFe84qZKKcHEb5QZgBF/mPGVvPMJUw62fkrW+Bt8
 Wo+H2/Rr/sKVmSco5/0CWtG2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RtD-005GWZ-1e; Sun, 21 Sep 2025 21:46:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 09/18] smb: client: allocate smbdirect workqueue at the
 beginning of _smbd_get_connection()
Date: Sun, 21 Sep 2025 23:44:56 +0200
Message-ID: <05f221d13c02e1b6a9aa5a116f9d704ae9f74591.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will simplify further changes when moving to common code.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5bc316248058..e6012523e422 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1703,10 +1703,9 @@ int smbd_reconnect(struct TCP_Server_Info *server)
 	return -ENOENT;
 }
 
-static void destroy_caches_and_workqueue(struct smbdirect_socket *sc)
+static void destroy_caches(struct smbdirect_socket *sc)
 {
 	destroy_receive_buffers(sc);
-	destroy_workqueue(sc->workqueue);
 	mempool_destroy(sc->recv_io.mem.pool);
 	kmem_cache_destroy(sc->recv_io.mem.cache);
 	mempool_destroy(sc->send_io.mem.pool);
@@ -1714,7 +1713,7 @@ static void destroy_caches_and_workqueue(struct smbdirect_socket *sc)
 }
 
 #define MAX_NAME_LEN	80
-static int allocate_caches_and_workqueue(struct smbdirect_socket *sc)
+static int allocate_caches(struct smbdirect_socket *sc)
 {
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[MAX_NAME_LEN];
@@ -1760,21 +1759,14 @@ static int allocate_caches_and_workqueue(struct smbdirect_socket *sc)
 	if (!sc->recv_io.mem.pool)
 		goto out3;
 
-	scnprintf(name, MAX_NAME_LEN, "smbd_%p", sc);
-	sc->workqueue = create_workqueue(name);
-	if (!sc->workqueue)
-		goto out4;
-
 	rc = allocate_receive_buffers(sc, sp->recv_credit_max);
 	if (rc) {
 		log_rdma_event(ERR, "failed to allocate receive buffers\n");
-		goto out5;
+		goto out4;
 	}
 
 	return 0;
 
-out5:
-	destroy_workqueue(sc->workqueue);
 out4:
 	mempool_destroy(sc->recv_io.mem.pool);
 out3:
@@ -1799,12 +1791,19 @@ static struct smbd_connection *_smbd_get_connection(
 	struct sockaddr_in *addr_in = (struct sockaddr_in *) dstaddr;
 	struct ib_port_immutable port_immutable;
 	__be32 ird_ord_hdr[2];
+	char wq_name[80];
+	struct workqueue_struct *workqueue;
 
 	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
 	if (!info)
 		return NULL;
 	sc = &info->socket;
+	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", sc);
+	workqueue = create_workqueue(wq_name);
+	if (!workqueue)
+		goto create_wq_failed;
 	smbdirect_socket_init(sc);
+	sc->workqueue = workqueue;
 	sp = &sc->parameters;
 
 	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
@@ -1946,7 +1945,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	log_rdma_event(INFO, "rdma_connect connected\n");
 
-	rc = allocate_caches_and_workqueue(sc);
+	rc = allocate_caches(sc);
 	if (rc) {
 		log_rdma_event(ERR, "cache allocation failed\n");
 		goto allocate_cache_failed;
@@ -1986,7 +1985,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 negotiation_failed:
 	disable_delayed_work_sync(&sc->idle.timer_work);
-	destroy_caches_and_workqueue(sc);
+	destroy_caches(sc);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
 	wait_event(sc->status_wait,
@@ -2008,6 +2007,8 @@ static struct smbd_connection *_smbd_get_connection(
 	rdma_destroy_id(sc->rdma.cm_id);
 
 create_id_failed:
+	destroy_workqueue(sc->workqueue);
+create_wq_failed:
 	kfree(info);
 	return NULL;
 }
-- 
2.43.0


