Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF1B1DB74
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:13:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nDZ/dOPOCqxselI2W5RWvIQ0f+BlpTrCdngrjh2WBpw=; b=TeuIZz2p0sX3L/vcTs+hN1INc0
	GPPqzjAGWzEpfQnR5+JiOf46ffd0bHC5XnM4C8wsAXp2swX+W1Rk6IIEKHNAO+DIo9+Z6Pi5AE0+3
	PYRyIoTbEvbS//ONAmn35cp5y4LtBYHDFfDvSdwyVJ6PofjAXuDC1RY2CoBfTp9ujQV96uNiSQrfk
	CkzJ4nJzTJd8Zzr9x2oZnSn26Zk+7n2uFuFevMm5IyW6SjjfLIH8vgIy8MfUXi0wii17fetlQgVlf
	+/GlJeDdUh85FakPNI/YHJErLAcz5Y7wDsujvfGWXCOqcw9DHcjfcHdQsLgpTvRRefh8XLcY5dZRj
	kEvW1cmQ==;
Received: from ip6-localhost ([::1]:22824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3FS-00EZwb-NN; Thu, 07 Aug 2025 16:13:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27826) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3Ez-00EZmf-7Y
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nDZ/dOPOCqxselI2W5RWvIQ0f+BlpTrCdngrjh2WBpw=; b=qUxXtuWwvgMyCgdVHa688HKT5N
 4zIz6DAF7vByxAB7r3PCw5Ft4dOqJzhydGlySHeXtSW6/+5jSiFmy6K+asU63k8Hkb9iamN0q6qUw
 ic4fRL7AnIYFRKZVkGFTlVx97B5vmox2Zt3g7ILbOpArFfq5g1n47zWrIKxMxSlVycYZsj0WXPwkt
 7SQgTwbzKs5j0LA4YuXVW+TRdf7+PKqiqsV456ys1LLbl/yE3kbTDOOl+vAQqey2t50IwG/NsG5/R
 svqNBG0R2rqE5QdWWgR7vVzxgfWkuK4uK2NdzfLH23eV8yXJrtq7ZXpn0XF6LOQ0mOj72ziquiTEJ
 fDB9yt625UkWnXh+JNlU08VyMV/HpvHHY1qAVwZlUPMfaDFIBJgTCMgwzVsI+puBgfqiAEF5ZtDKp
 8l2mYy0YOpwvIO2vea5O+P8ECLKWP73wjxcL24OstajrdEMtSpsCwF42DpXALdRJxIPRkwzzc5pFB
 osdihfMNqnMmiA/4VvBm7YrB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3Ev-001cgF-2R; Thu, 07 Aug 2025 16:13:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 7/9] smb: client: use status_wait and
 SMBDIRECT_SOCKET_RESOLVE_{ADDR, ROUTE}_RUNNING for completion
Date: Thu,  7 Aug 2025 18:12:17 +0200
Message-ID: <1eda7d5a034b442ecf1c9e4c2c24852331f82a71.1754582143.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754582143.git.metze@samba.org>
References: <cover.1754582143.git.metze@samba.org>
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

We can use the state change from SMBDIRECT_SOCKET_RESOLVE_{ADDR,ROUTE}_RUNNING
to the next state in order to wake the caller to do the next step.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 46 ++++++++++++++++++++++-----------------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index bdc4600d03e3..ab5b7ae04032 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -187,31 +187,27 @@ static int smbd_conn_upcall(
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
@@ -597,9 +593,6 @@ static struct rdma_cm_id *smbd_create_id(
 
 	*sport = htons(port);
 
-	init_completion(&info->ri_done);
-	info->ri_rc = -ETIMEDOUT;
-
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED);
 	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING;
 	rc = rdma_resolve_addr(id, NULL, (struct sockaddr *)dstaddr,
@@ -608,20 +601,26 @@ static struct rdma_cm_id *smbd_create_id(
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
@@ -629,15 +628,22 @@ static struct rdma_cm_id *smbd_create_id(
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


