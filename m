Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8BB34CDD
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=b6QrtdE2zFPaI+c7nHpgDGlX4yspyEGgSHb0WNqTt+U=; b=fD3jZPRe5K9afXaVcwsKRtOCBh
	ECoh2g/NaUGuD9d1j0p+0lQMm8ecjv5EPMXs6nzAOUSInN5jPE/Hqx0JwaVrx8+spTt14/FZ35BkD
	ebu4z/8kvEpTu2+OECqLabe1HL6JhuWVh9fjyaQBn4Ka3ZFpyXXa5usDLTZM84sCZ+3No/a+f1Yg8
	aiomwNOY95CuLuYgMPkMdszOL0HZwgDvYud8qMGXiuDAjJVuWoLAtHAFKTrbb4k2AQdD691XVrGuh
	tqf7YxCttk5JQSKZfpqMSdHjRPyQh42wpasJF0V+BV1IIG/oWeBnDXekGfWa+N+PJwaLt1GUIpZJE
	VqAi2wOA==;
Received: from ip6-localhost ([::1]:48214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeCQ-000PmR-1p; Mon, 25 Aug 2025 20:53:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48190) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeA0-000OpW-SL
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=b6QrtdE2zFPaI+c7nHpgDGlX4yspyEGgSHb0WNqTt+U=; b=xee8lry2qqpVnMKOMxlmzHL3oF
 aQNKncKNCqidyOdgJkxwZogJPKdMBzYys2OFCIkDJsiSDHpmdvA5r+8Qs9k8uq32hfW5f/qJ+MR58
 duxdzy/mTr6n84vXQmQAHns3gcM4Yyrkc5utVRBf99h2WRy2lhNSJFE0zMPVzjSpGwWpvahjHqssH
 IeYRUExZyCjOU+bSa8nsIzTLd4AvRADoQvSgdSYSlVsMZgTbiHBxiuESxxuezvZlm4jOzPzhtzOKj
 nN01mYw8UCERZaDgC2p3M1GYxXNFK/sPJg95eSeoBEkRokAi9kfktWaXeRe/kCHIpo+urUEU7VJji
 hVylwgc0xEOpdse7SF1Yr3e4z46O5MUYWJiOzEXIQTl7vLG7/OiNCczR9dgNc8GnWPyQYQp3wysT3
 Zu8crO2leY4UXMYfEX6MHkuQE1UBLqnwhxLn1NQfSTspgxkj+ENk7JHCosr2dGz8IddggwvPYZwuB
 9jaa2Fcd8FdbEsqASu0w0nZ1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe9y-000l71-1N; Mon, 25 Aug 2025 20:51:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 057/142] smb: client: pass struct smbdirect_socket to
 {allocate, destroy}_caches_and_workqueue()
Date: Mon, 25 Aug 2025 22:40:18 +0200
Message-ID: <0fab296f447ca4cec527375430e39ccfd58ea286.1756139607.git.metze@samba.org>
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
index b23e9d8fd9c4..d7ed5534669a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1579,10 +1579,8 @@ int smbd_reconnect(struct TCP_Server_Info *server)
 	return -ENOENT;
 }
 
-static void destroy_caches_and_workqueue(struct smbd_connection *info)
+static void destroy_caches_and_workqueue(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
-
 	destroy_receive_buffers(sc);
 	destroy_workqueue(sc->workqueue);
 	mempool_destroy(sc->recv_io.mem.pool);
@@ -1592,9 +1590,8 @@ static void destroy_caches_and_workqueue(struct smbd_connection *info)
 }
 
 #define MAX_NAME_LEN	80
-static int allocate_caches_and_workqueue(struct smbd_connection *info)
+static int allocate_caches_and_workqueue(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	char name[MAX_NAME_LEN];
 	int rc;
@@ -1602,7 +1599,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	if (WARN_ON_ONCE(sp->max_recv_size < sizeof(struct smbdirect_data_transfer)))
 		return -ENOMEM;
 
-	scnprintf(name, MAX_NAME_LEN, "smbdirect_send_io_%p", info);
+	scnprintf(name, MAX_NAME_LEN, "smbdirect_send_io_%p", sc);
 	sc->send_io.mem.cache =
 		kmem_cache_create(
 			name,
@@ -1618,7 +1615,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	if (!sc->send_io.mem.pool)
 		goto out1;
 
-	scnprintf(name, MAX_NAME_LEN, "smbdirect_recv_io_%p", info);
+	scnprintf(name, MAX_NAME_LEN, "smbdirect_recv_io_%p", sc);
 
 	struct kmem_cache_args response_args = {
 		.align		= __alignof__(struct smbdirect_recv_io),
@@ -1639,7 +1636,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	if (!sc->recv_io.mem.pool)
 		goto out3;
 
-	scnprintf(name, MAX_NAME_LEN, "smbd_%p", info);
+	scnprintf(name, MAX_NAME_LEN, "smbd_%p", sc);
 	sc->workqueue = create_workqueue(name);
 	if (!sc->workqueue)
 		goto out4;
@@ -1825,7 +1822,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	log_rdma_event(INFO, "rdma_connect connected\n");
 
-	rc = allocate_caches_and_workqueue(info);
+	rc = allocate_caches_and_workqueue(sc);
 	if (rc) {
 		log_rdma_event(ERR, "cache allocation failed\n");
 		goto allocate_cache_failed;
@@ -1865,7 +1862,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 negotiation_failed:
 	disable_delayed_work_sync(&sc->idle.timer_work);
-	destroy_caches_and_workqueue(info);
+	destroy_caches_and_workqueue(sc);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
 	wait_event(sc->status_wait,
-- 
2.43.0


