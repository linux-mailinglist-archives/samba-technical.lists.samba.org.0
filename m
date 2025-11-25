Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BEAC8681F
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xgRkxj8MlIApNKFGbQzthm1RA/kbsz15MGuOKSS5dII=; b=zkZrxAYLWmOjiZC07O+yh6hSpf
	k+3W1U758krc0gbCxl05OgSZ1VDf9PhTEC2zfDnxgfymjF3Mq5F8EcFapXgQMjl27/6r8MBH0fiat
	McO1PXfsPfdUKujLMZ7cgs9KHMtMbeVNllTuMnp4X67hzWsgI/d5oWtui1dYfLsYm/UeuWizfS5qU
	tBwN3zCVoOpm3koM9AXdm7BRI0eHJ3752zWpZYf74UHxB2ZnulULpztxPF1nLu+YhL9bMRbeZYGQ/
	v8BSAOmbYeJ0NU0PqlR4DI21qfT0UNiWEYWyjEm9yZOPZCyBdPIXutR0Rs2usJKeei7VPhzcgeD4z
	UA1r6REQ==;
Received: from ip6-localhost ([::1]:31984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxWa-00DBM1-RG; Tue, 25 Nov 2025 18:12:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43920) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQd-00D9Wk-0f
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xgRkxj8MlIApNKFGbQzthm1RA/kbsz15MGuOKSS5dII=; b=beUPiB3Syb19521SJpqzI8XTs8
 uu9powd+uu5EHd/8w2Vs3eZw+h96BaFCORscYvRfHB5VkfiL+HtY5riqxp5gO4MoWpN7koBnybeXL
 T1Vdjd1KfrRxvlx+pl4fsmmXnYMnI9o4cg+WJu69EBe6Wx8BqN8p2CNqqz9VfnJ6r7iFsAhPt1yqm
 2gPBNgWrMV82SfVHdViyegUaahYrsTT5W5iZ5jAe7mtb7G1sBzP5YXt1V9uEgacxXrbNnW3q3vczh
 PsMStUtAQMEkAKlVpB4CM2vam7MDaDPgezx2Bpa0xjFAqZXucf8Xwz/EJ5xcYUe+4TmZ1Ttq7Zh6h
 H9W/VhpLiizu5SoPW1LfNYhglcSVpnvaTE6ak5iQH+ckmJ+QjzdseAgAhioqPi83qovjzrws5O3r+
 JrvfWz4+UUc/do7B1YoLFLFweKAUPdF9mMJ8e67QDmVw6pFvQCv5LSWnP/YhyV7eVkWG6jhO57fE1
 4iBHcIR8HgrRTYCZpij3Ui4V;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxNa-00FdaN-2p; Tue, 25 Nov 2025 18:03:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 061/145] smb: client: make use of
 smbdirect_socket_prepare_create()
Date: Tue, 25 Nov 2025 18:55:07 +0100
Message-ID: <6efdeba34072c02767779107b9d5b6fa3c684757.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This prepares the use of functions from smbdirect_connection.c.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 320166f5d267..05ac030ab653 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1800,6 +1800,7 @@ static struct smbd_connection *_smbd_get_connection(
 	int rc;
 	struct smbd_connection *info;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct rdma_conn_param conn_param;
 	struct ib_qp_cap qp_cap;
@@ -1810,20 +1811,10 @@ static struct smbd_connection *_smbd_get_connection(
 	char wq_name[80];
 	struct workqueue_struct *workqueue;
 
-	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
-	if (!info)
-		return NULL;
-	sc = &info->socket;
-	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", sc);
-	workqueue = create_workqueue(wq_name);
-	if (!workqueue)
-		goto create_wq_failed;
-	smbdirect_socket_init(sc);
-	sc->workqueue = workqueue;
-	sp = &sc->parameters;
-
-	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
-
+	/*
+	 * Create the initial parameters
+	 */
+	sp = &init_params;
 	sp->resolve_addr_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->resolve_route_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->rdma_connect_timeout_msec = RDMA_RESOLVE_TIMEOUT;
@@ -1839,6 +1830,22 @@ static struct smbd_connection *_smbd_get_connection(
 	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
 	sp->keepalive_timeout_msec = KEEPALIVE_RECV_TIMEOUT * 1000;
 
+	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
+	if (!info)
+		return NULL;
+	sc = &info->socket;
+	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", sc);
+	workqueue = create_workqueue(wq_name);
+	if (!workqueue)
+		goto create_wq_failed;
+	smbdirect_socket_prepare_create(sc, sp, workqueue);
+	/*
+	 * from here we operate on the copy.
+	 */
+	sp = &sc->parameters;
+
+	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
+
 	rc = smbd_ia_open(sc, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
-- 
2.43.0


