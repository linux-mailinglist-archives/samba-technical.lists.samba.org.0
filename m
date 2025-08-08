Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248EB1ED48
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:50:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4U9yVf7xCG+R85tXYmz34DCnjBOg8a8T4oiGQkIjSmo=; b=h7+piiEmlaDAx2xyxiPaNgVYex
	wRs4zvFBc/VhTLo7qAwudqjNPs7sScQDn+tU4eo47RER7suUVGNc+IL299qtOlR6pIpniQqPcyg/2
	7pZCzY9YlmESZ1eWHvOStFplZCHdyHCOI5hMTTf1SGTJgaC5to0fYlDtBMiAffRPN/LkvgvnEMxCo
	NwgwBlaESNpep2DW3IsLby3zT6o4UNYjFPYByyPOd1KxKI77u7xtu2BfoeTi822qXiBMxQB7GSxEF
	qGb1YK6jeo/g1epbLufAdPkCH+Po6KOdalt0MFCzekoQcJxxaZt4Qdjrtw58+ePAPBN3lZIdQ8k88
	/aQaYAmQ==;
Received: from ip6-localhost ([::1]:31566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQIV-00EiWM-23; Fri, 08 Aug 2025 16:50:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56516) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHd-00EiAk-Jx
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4U9yVf7xCG+R85tXYmz34DCnjBOg8a8T4oiGQkIjSmo=; b=vtpoPwFBrQxyRLLaKRR7ygfiGs
 LsuGcMnMz0s3OiFWasEFM61xSQc8PGg/G2fMgf1E2AWUcwIyPRRGaotuwKa3IZWtvB1dQhlW9i9BP
 nc4l+hVkxyw2aqrRX1Eal9xylFJW/Lm+/v6nhz6mg9xEGZ0pze/UcfdB9xjqwhpcun7rjmwgZ6OCv
 9cLR8GBqLHZQp8bEOm+J7jFbJkhEe8MFkbuqNdHFO8ALaeGLWDeIg4NoCufzfoe90QJCOdppP4TAb
 ntLktUeg8jap+vMr8SKos/S96n4iEG9yvhtBtH8eNrqqG08jgWvWESBr2lyS1Ww+aJumkByzWAnqi
 U5UflG9Vd1mAPbEAxYMzA1iQPQz3VkMqtSXAeZmedEzLaOiOuD17bOfm9rJRB91fs8HU2luVMjDMm
 pP0pjvEhfAlCznHelR0zm0kRiRkTVT1+dzT7V3d1CrnP8gYwGEq/XunCHSXITnrUYjFdJL+J1Nrgs
 1BtgR62DcAxO/GUHLKh66ChL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHa-001qWI-1H; Fri, 08 Aug 2025 16:49:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 9/9] smb: client: make use of smbdirect_socket.status_wait
Date: Fri,  8 Aug 2025 18:48:17 +0200
Message-ID: <f11c9dcd074d5806e1feb76393d93c7800172f88.1754671444.git.metze@samba.org>
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

This will allow us to have common helper functions soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 32 ++++++++++++++++----------------
 fs/smb/client/smbdirect.h |  2 --
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ca6aa298d577..fe7e138704fc 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -214,34 +214,34 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_RESOLVED:
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
 		log_rdma_event(INFO, "connected event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_NEEDED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_CONNECT_ERROR:
@@ -250,7 +250,7 @@ static int smbd_conn_upcall(
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING);
 		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -259,12 +259,12 @@ static int smbd_conn_upcall(
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
 			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-			wake_up(&info->status_wait);
+			wake_up(&sc->status_wait);
 			break;
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		wake_up_interruptible_all(&info->wait_send_queue);
 		break;
@@ -525,7 +525,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		else
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
 
-		wake_up_interruptible(&info->status_wait);
+		wake_up_interruptible(&sc->status_wait);
 		return;
 
 	/* SMBD data transfer packet */
@@ -629,7 +629,7 @@ static struct rdma_cm_id *smbd_create_id(
 		goto out;
 	}
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
@@ -656,7 +656,7 @@ static struct rdma_cm_id *smbd_create_id(
 		goto out;
 	}
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 	/* e.g. if interrupted returns -ERESTARTSYS */
@@ -1163,7 +1163,7 @@ static int smbd_negotiate(struct smbd_connection *info)
 		return rc;
 
 	rc = wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
 		secs_to_jiffies(SMBD_NEGOTIATE_TIMEOUT));
 	log_rdma_event(INFO, "wait_event_interruptible_timeout rc=%d\n", rc);
@@ -1390,7 +1390,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 		rdma_disconnect(sc->rdma.cm_id);
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event_interruptible(
-			info->status_wait,
+			sc->status_wait,
 			sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
@@ -1605,7 +1605,7 @@ static struct smbd_connection *_smbd_get_connection(
 	sc = &info->socket;
 	sp = &sc->parameters;
 
-	init_waitqueue_head(&info->status_wait);
+	init_waitqueue_head(&sc->status_wait);
 
 	sc->status = SMBDIRECT_SOCKET_CREATED;
 	rc = smbd_ia_open(info, dstaddr, port);
@@ -1728,7 +1728,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	wait_event_interruptible_timeout(
-		info->status_wait,
+		sc->status_wait,
 		sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 
@@ -1785,7 +1785,7 @@ static struct smbd_connection *_smbd_get_connection(
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
-	wait_event(info->status_wait,
+	wait_event(sc->status_wait,
 		sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
 allocate_cache_failed:
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 62458a8fd109..79ab43b7ac19 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -45,8 +45,6 @@ enum keep_alive_status {
 struct smbd_connection {
 	struct smbdirect_socket socket;
 
-	wait_queue_head_t status_wait;
-
 	struct work_struct disconnect_work;
 	struct work_struct post_send_credits_work;
 
-- 
2.43.0


