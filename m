Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBE9B34CDB
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:53:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TFKF4fFajYdrmh+hos6tBoUXD19ijvUBLvq5P/aeR0w=; b=5ufD7KW/ivSWPnF8Dh33/OYI0b
	I8/A1W9pmJW3ImEDFPbBxu0lQPQ8TFA7jlIaWgGg1jzhqxUxYngDtXidKzOZtZXkaYharIg4og63E
	PkkDMGmfI0BiepolaUCreD1YJkz8l7Ke6xPpTVVF442nDXkhAK5ZSnl45PNdNPe5Hrr4ZIceUCnfk
	3lgLsbvTFrNFWXi9XW4HGXqHChCJLCMx3sydHpxaU/JiZIdP/3hc5XJES8JCDg9TnQrcMXHbLdP7T
	FKiPj3Tc8iFHUf0REnmI8CCjWtyVXJWyJcDMiOofippK5xPPJh0SRB1h6aA04dl1ZxN9fKoEW+upB
	GPySrc+A==;
Received: from ip6-localhost ([::1]:22804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeCB-000PiH-Sp; Mon, 25 Aug 2025 20:53:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39040) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe9r-000Oli-Rs
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=TFKF4fFajYdrmh+hos6tBoUXD19ijvUBLvq5P/aeR0w=; b=dgpZZ/VAVvfQBG8stXN+dRwk/k
 3Cmv5Pr4KiOpNu1L4nhBZRMzGGwuB+krjxLRy+SL9Kzg/Q5QJELt/8c8y2/nyOtsuhaLBgd6YjhvZ
 R2n60yJQ1nAdOByVisElxYUSBJWBten7x5v6jgreUCsQ62HdkeSA92neVZCyYje4OhwTzVT1JoyYZ
 Zt+pEr9uyx1GmxYPjupPgSTx5Sw7SHtZ/wV+5rw2/CJCYDvftX/STAL7oIz56ZS9gN/kuY4HLX5wA
 rK3GkcUzxK0vAydaqYKxj+H5IW6qhjQW4h8gYrKqB049hH5nmow21kZuitd5NydS7oU7vHyAaWY9A
 XPpDGQaGCHM66GGSU/aFrVJlcoOqgBDV7m8QJD1CfSkgGOXaQMkcxlrBbghXvOJe7cNYHUpXZMZ0i
 SjhCnzwpNQ+CKaOiKFPbu5xRJhA5Wf2a2hQnfnfccbaisXj9IH2rZrzBZ7EJ5GsRLw+klRJJbttCc
 EgCHXFa8uo/EaSd1BXPy/fzx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe9n-000l3c-2a; Mon, 25 Aug 2025 20:51:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 056/142] smb: client: pass struct smbdirect_socket to
 {allocate, destroy}_receive_buffers()
Date: Mon, 25 Aug 2025 22:40:17 +0200
Message-ID: <52fc1266851b014a6e1418121c4ee789beb95464.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 01f4b1ee727a..b23e9d8fd9c4 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -25,8 +25,8 @@ static struct smbdirect_recv_io *get_receive_buffer(
 static void put_receive_buffer(
 		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
-static int allocate_receive_buffers(struct smbd_connection *info, int num_buf);
-static void destroy_receive_buffers(struct smbd_connection *info);
+static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf);
+static void destroy_receive_buffers(struct smbdirect_socket *sc);
 
 static void enqueue_reassembly(
 		struct smbd_connection *info,
@@ -1363,9 +1363,8 @@ static void put_receive_buffer(
 }
 
 /* Preallocate all receive buffer on transport establishment */
-static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
+static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *response;
 	int i;
 
@@ -1393,9 +1392,8 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 	return -ENOMEM;
 }
 
-static void destroy_receive_buffers(struct smbd_connection *info)
+static void destroy_receive_buffers(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_recv_io *response;
 
 	while ((response = get_receive_buffer(sc)))
@@ -1507,7 +1505,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	sc->recv_io.reassembly.data_length = 0;
 
 	log_rdma_event(INFO, "free receive buffers\n");
-	destroy_receive_buffers(info);
+	destroy_receive_buffers(sc);
 
 	/*
 	 * For performance reasons, memory registration and deregistration
@@ -1585,7 +1583,7 @@ static void destroy_caches_and_workqueue(struct smbd_connection *info)
 {
 	struct smbdirect_socket *sc = &info->socket;
 
-	destroy_receive_buffers(info);
+	destroy_receive_buffers(sc);
 	destroy_workqueue(sc->workqueue);
 	mempool_destroy(sc->recv_io.mem.pool);
 	kmem_cache_destroy(sc->recv_io.mem.cache);
@@ -1646,7 +1644,7 @@ static int allocate_caches_and_workqueue(struct smbd_connection *info)
 	if (!sc->workqueue)
 		goto out4;
 
-	rc = allocate_receive_buffers(info, sp->recv_credit_max);
+	rc = allocate_receive_buffers(sc, sp->recv_credit_max);
 	if (rc) {
 		log_rdma_event(ERR, "failed to allocate receive buffers\n");
 		goto out5;
-- 
2.43.0


