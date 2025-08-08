Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A4B1EBED
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3MlWgIdLEQfQmaxyqfnyRmrKZkH2WPRIvD5K3EFHb5Y=; b=jK/RFMMnk/4OVyby+f0ATKzmqd
	SIwhp5IJh9wIAuSIB/MCGsE0dj7D5mmr3upc86Sm9qM82fDsJSPYf1rTrF4WSML6vNte0+O5oEav9
	sTYZv0b8kmiSxRaD6LefGRk58jAIz6nvRYaKgFk/DFVIzsb52HsIYx2HGG83GkzDfOup7NaljwdHn
	28ei/fb5UD/nLF0TflM6ktgFOaWcfCsR+TP7QbcIvLZO7X1NjZynbV7j7+19WFnbkSCZTqtMRopPk
	nz/RIY6hivhgM0sgFRKIZOtsD/leevnENqG+WfJZBZX2Ep1BWNKrWUSgWFKgvp69gcPaHi51OJAAB
	R+iDojYQ==;
Received: from ip6-localhost ([::1]:40112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP1u-00EgNZ-Nd; Fri, 08 Aug 2025 15:29:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49040) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1O-00EgIW-5o
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3MlWgIdLEQfQmaxyqfnyRmrKZkH2WPRIvD5K3EFHb5Y=; b=kEvcEByhldjL5AnUneT0WrWyGc
 ub6O01KmXMH/g6F4Eke4P+8jZZESoosFFNatwKR3zGv3mbB/NAGKhe/KMZzF+6ZT9XVoHIj/HgbnA
 pJ+F6fip178TfpGubfdUS7fvHtigeTl64t/fT1Xel5cMfzZpLGXRdK8kt9Us3ZB3Irn68+MYO9JTA
 QLF12LnXheiQAz4iHa/x50eQnRO+T0vRyfD8r+RoRrF9Tq5I8ih4QEU9zhFQ51kyaQgjZf37p6YOh
 9hPpdBl7+Pdx/PEnMs4h1WOeHTiCRBBVq7CMQWQ84Gv3eZoFcLF+bA2jiwHWslH4NyPWdSZHFsE0t
 XhyQJnstVOy6okvrt8SEKssSlKIioyuzEXojD5sBvAKw7YbIiuDIKvfbTlMxyF1d5E/FD8AtlXPMI
 U/cyUrmgUxXBoyKIeFOZkmnrI4gVn2EtRh4w9UxBlxPPAxcBi+iTENgWauDzljaHtVIx26YVsn2Oa
 MaCamaemQ6KcK7HHxOkLoQq2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1N-001pOZ-0C; Fri, 08 Aug 2025 15:28:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 4/9] smb: client: only use a single wait_queue to monitor
 smbdirect connection status
Date: Fri,  8 Aug 2025 17:28:02 +0200
Message-ID: <711f9a2237ab79808e619f0c5310cb0cdcbe0957.1754666549.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754666549.git.metze@samba.org>
References: <cover.1754666549.git.metze@samba.org>
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

There's no need for separate conn_wait and disconn_wait queues.

This will simplify the move to common code, the server code
already a single wait_queue for this.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 17 ++++++++---------
 fs/smb/client/smbdirect.h |  3 +--
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index c819cc6dcc4f..c628e91c328b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -205,7 +205,7 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_ESTABLISHED:
 		log_rdma_event(INFO, "connected event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
-		wake_up_interruptible(&info->conn_wait);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_CONNECT_ERROR:
@@ -213,7 +213,7 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_REJECTED:
 		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_interruptible(&info->conn_wait);
+		wake_up_interruptible(&info->status_wait);
 		break;
 
 	case RDMA_CM_EVENT_DEVICE_REMOVAL:
@@ -222,12 +222,12 @@ static int smbd_conn_upcall(
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
 			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-			wake_up(&info->conn_wait);
+			wake_up(&info->status_wait);
 			break;
 		}
 
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
-		wake_up_interruptible(&info->disconn_wait);
+		wake_up_interruptible(&info->status_wait);
 		wake_up_interruptible(&sc->recv_io.reassembly.wait_queue);
 		wake_up_interruptible_all(&info->wait_send_queue);
 		break;
@@ -1325,7 +1325,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 		rdma_disconnect(sc->rdma.cm_id);
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
 		wait_event_interruptible(
-			info->disconn_wait,
+			info->status_wait,
 			sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
@@ -1650,8 +1650,7 @@ static struct smbd_connection *_smbd_get_connection(
 	log_rdma_event(INFO, "connecting to IP %pI4 port %d\n",
 		&addr_in->sin_addr, port);
 
-	init_waitqueue_head(&info->conn_wait);
-	init_waitqueue_head(&info->disconn_wait);
+	init_waitqueue_head(&info->status_wait);
 	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
 	rc = rdma_connect(sc->rdma.cm_id, &conn_param);
 	if (rc) {
@@ -1660,7 +1659,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	wait_event_interruptible_timeout(
-		info->conn_wait,
+		info->status_wait,
 		sc->status != SMBDIRECT_SOCKET_CONNECTING,
 		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 
@@ -1717,7 +1716,7 @@ static struct smbd_connection *_smbd_get_connection(
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
-	wait_event(info->conn_wait,
+	wait_event(info->status_wait,
 		sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 
 allocate_cache_failed:
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 0d4d45428c85..e45aa9ddd71d 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -47,8 +47,7 @@ struct smbd_connection {
 
 	int ri_rc;
 	struct completion ri_done;
-	wait_queue_head_t conn_wait;
-	wait_queue_head_t disconn_wait;
+	wait_queue_head_t status_wait;
 
 	struct completion negotiate_completion;
 	bool negotiate_done;
-- 
2.43.0


