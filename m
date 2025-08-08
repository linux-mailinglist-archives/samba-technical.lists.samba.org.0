Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA1B1ED46
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/MX91eY4qQakookhMV/FhVk/6VZ6pWz13H+E6Fo4gjo=; b=O/pW6WmXNbNDDsnvuO/+9Ev+G0
	+Qx5+MvrThHW3lvtlbI/DiBEwHy+nq3PDeqKrBMnezImTYmfflBaiiaSoV5pUgcCQyP1yVVneIpos
	Ygy+b2cwnZWZRopUgL6C24hiUuIImXCTy8olUoAP/gNrxicjmDN4GP1/NK7oLPD4qi62S+hXL75jX
	SMaoJafYQ4tULSfLGP6P+Jot7JiGult1bnizxfM5ibk4AG5+NEzSUnsHk5hBHIlptgmQ9h2miuo5r
	SInaPIjh7wmIuEwMj3s5PydxdYf6F8yeo/HqdA6FF/b/FSx7LnFSCN4Ek1rYgFiUQvfV5dPXz9pPU
	rIcBKbiA==;
Received: from ip6-localhost ([::1]:53090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQI1-00EiGZ-DZ; Fri, 08 Aug 2025 16:49:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57716) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHN-00Ei4R-Ov
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/MX91eY4qQakookhMV/FhVk/6VZ6pWz13H+E6Fo4gjo=; b=BjAOldeIdhtTyKb9QBlqjVCwqn
 DrzJmnvjZMCx5iE1iyNHONte8/3RjkuTIhsPJet5gknKbxnRwmy7O/FIUHLhRQ7ExpKN/+P5xqLya
 SOxZX2rYUm+60U0VU8Dj4pP+FEokupRQE8Dk1ZkyuH7dPQfDUPBUtdNAHOFDR/l/bTnhbRtKVjj7p
 dGv5+/5Vf0ZKbFXA39j6JzziJ2PpJE6X8y7V9R02lNSSHE+aJcifR4yKr7s2vgXl+Qqvan71f+d1v
 kEcCGEnTGMf1Swus4B4YV/Z14GziTuEExdX0k/jPRGXkZXAIlCUugbH7QLJZQ+SxIAnAaPsxxVLQ+
 E3M4Njr506zqQFRDCLK1QRtyXg/YqbX1VQPwcS9Co5yGt4ihfPtZPqHmT56WKmcK0TaSFI9KMmoHy
 YCdtLbgKq5ArBzDkY7uVvr1YQDOCb6QmQHHJfw7lAX5vUIXneEwsVgE4Uz99QjkLmazT3DRnaEQ9j
 KshmNq8t/2LU8NEY2s2eYQbd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHL-001qU0-20; Fri, 08 Aug 2025 16:49:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 7/9] smb: client: use status_wait and
 SMBDIRECT_SOCKET_RESOLVE_{ADDR, ROUTE}_RUNNING for completion
Date: Fri,  8 Aug 2025 18:48:15 +0200
Message-ID: <5f7131c8f17c9afa482ecf8daa78da8e36025d59.1754671444.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754671444.git.metze@samba.org>
References: <cover.1754671444.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We can use the state change from
SMBDIRECT_SOCKET_RESOLVE_{ADDR,ROUTE}_RUNNING
to the next state in order to wake the caller to do the next step.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 49 ++++++++++++++++++++++-----------------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b3fc87886972..ca6aa298d577 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -214,31 +214,27 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
-		info->ri_rc = 0;
-		complete(&info->ri_done);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
-		info->ri_rc = 0;
-		complete(&info->ri_done);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		info->ri_rc = -EHOSTUNREACH;
-		complete(&info->ri_done);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		info->ri_rc = -ENETUNREACH;
-		complete(&info->ri_done);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
@@ -624,9 +620,6 @@ static struct rdma_cm_id *smbd_create_id(
 
 	*sport = htons(port);
 
-	init_completion(&info->ri_done);
-	info->ri_rc = -ETIMEDOUT;
-
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING;
 	rc = rdma_resolve_addr(id, NULL, (struct sockaddr *)dstaddr,
@@ -635,20 +628,26 @@ static struct rdma_cm_id *smbd_create_id(
 		log_rdma_event(ERR, "rdma_resolve_addr() failed %i\n", rc);
 		goto out;
 	}
-	rc = wait_for_completion_interruptible_timeout(
-		&info->ri_done, msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
+	rc = wait_event_interruptible_timeout(
+		info->status_wait,
+		sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING,
+		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
 	if (rc < 0) {
 		log_rdma_event(ERR, "rdma_resolve_addr timeout rc: %i\n", rc);
 		goto out;
 	}
-	rc = info->ri_rc;
-	if (rc) {
+	if (sc->status == SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING) {
+		rc = -ETIMEDOUT;
+		log_rdma_event(ERR, "rdma_resolve_addr() completed %i\n", rc);
+		goto out;
+	}
+	if (sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED) {
+		rc = -EHOSTUNREACH;
 		log_rdma_event(ERR, "rdma_resolve_addr() completed %i\n", rc);
 		goto out;
 	}
 
-	info->ri_rc = -ETIMEDOUT;
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING;
 	rc = rdma_resolve_route(id, RDMA_RESOLVE_TIMEOUT);
@@ -656,15 +655,22 @@ static struct rdma_cm_id *smbd_create_id(
 		log_rdma_event(ERR, "rdma_resolve_route() failed %i\n", rc);
 		goto out;
 	}
-	rc = wait_for_completion_interruptible_timeout(
-		&info->ri_done, msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
+	rc = wait_event_interruptible_timeout(
+		info->status_wait,
+		sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING,
+		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
 	if (rc < 0)  {
 		log_rdma_event(ERR, "rdma_resolve_addr timeout rc: %i\n", rc);
 		goto out;
 	}
-	rc = info->ri_rc;
-	if (rc) {
+	if (sc->status == SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING) {
+		rc = -ETIMEDOUT;
+		log_rdma_event(ERR, "rdma_resolve_route() completed %i\n", rc);
+		goto out;
+	}
+	if (sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED) {
+		rc = -ENETUNREACH;
 		log_rdma_event(ERR, "rdma_resolve_route() completed %i\n", rc);
 		goto out;
 	}
@@ -1599,6 +1605,8 @@ static struct smbd_connection *_smbd_get_connection(
 	sc = &info->socket;
 	sp = &sc->parameters;
 
+	init_waitqueue_head(&info->status_wait);
+
 	sc->status = SMBDIRECT_SOCKET_CREATED;
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
@@ -1709,7 +1717,6 @@ static struct smbd_connection *_smbd_get_connection(
 	log_rdma_event(INFO, "connecting to IP %pI4 port %d\n",
 		&addr_in->sin_addr, port);
 
-	init_waitqueue_head(&info->status_wait);
 	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
 
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 82505df4a751..62458a8fd109 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -45,8 +45,6 @@ enum keep_alive_status {
 struct smbd_connection {
 	struct smbdirect_socket socket;
 
-	int ri_rc;
-	struct completion ri_done;
 	wait_queue_head_t status_wait;
 
 	struct work_struct disconnect_work;
-- 
2.43.0


