Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 148FBB1DB64
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sI3eL0Rtx4HNu2EQ1ZC18nllq7Jk3jVNNHRdn65ROhI=; b=thG8JZHlbepaHZ6X0UrnrxFH4G
	vEYpgR9XHhoc6X/hcH/TBiS3SEt+rwrfuxqD7iqfQF4ZAImONKxp4KninvPM94LK1VvZuV3X6VkjY
	DGbXQGLtMQX9TjhXog+Hgq1dq3MG0JiiQButqg7yEss8PO/jfmtIcFDKzAu9MpubMhLTPf11JftVr
	w+hlm3f765dLcWZPHUoYsaVAoqEjS+9c46ZAwzK9kiqwegZv0zbwjT7wk4OsXT9fomfWKI9lY43r+
	vTrvh9MHb8QxeeD42fPnOY48NYBCEa2TUk+dfmeYfe+0qrdN17vw8ABRxUCD/HimQeXFYf6mYZXnp
	HRJA2VwA==;
Received: from ip6-localhost ([::1]:33312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3ER-00EZWJ-Gh; Thu, 07 Aug 2025 16:12:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58874) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3EL-00EZUz-IZ
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sI3eL0Rtx4HNu2EQ1ZC18nllq7Jk3jVNNHRdn65ROhI=; b=BKtJX2AQjNTuNG9RNW9/YrF57W
 SzXDorhDndsnQv2ne9zdD2aNuCIIt7uQZGCp4VZqOlZUJVd+387yZnqyr3hslABthSG52LTFHCAHx
 GNlq/RpBFqtU1PAnW6y+e2kzmkhXNiM140YB5j8gWEN+JpK/kgU0R4kgXCzmXLBrCMwjmcVMwDAcL
 eGoSLCNmgQwhaqG0fid8ZfBKRa2tt3x2h+FIrsWRZgOu2n9IngbkcapzDmfSNE5ZykAdYxw968Zep
 TXpZbjEBWNTgaMU/3ay7yWJxjnARiuSNxdpGuWFI6vXO4uWp0hhtzZOQG9niE58HUu1+3R45zR/yE
 YtlHLJENOpspGg5CUwHGFV5O7wAqNHOS92/wrET5yHkzogO+vUcSkxYazVNOOzOFA/T66IWFlam0b
 knfj5mgJRVKZPIfVRd///0Zjupj0edfzCfhEMiMWGyZB0m+CefnH1sfbn/x9R9TezhPhEaecMnDUO
 CbIaZmxC41EfqTpUUgKFNI4E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3EK-001cZO-2i; Thu, 07 Aug 2025 16:12:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/9] smb: client: improve logging in smbd_conn_upcall()
Date: Thu,  7 Aug 2025 18:12:12 +0200
Message-ID: <23d24b1a252380f0af4bed416b7af48e86e3fbc9.1754582143.git.metze@samba.org>
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

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 181349eda7a3..8ed4ab6f1d3a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -178,9 +178,10 @@ static int smbd_conn_upcall(
 {
 	struct smbd_connection *info = id->context;
 	struct smbdirect_socket *sc = &info->socket;
+	const char *event_name = rdma_event_msg(event->event);
 
-	log_rdma_event(INFO, "event=%d status=%d\n",
-		event->event, event->status);
+	log_rdma_event(INFO, "event=%s status=%d\n",
+		event_name, event->status);
 
 	switch (event->event) {
 	case RDMA_CM_EVENT_ADDR_RESOLVED:
@@ -190,17 +191,19 @@ static int smbd_conn_upcall(
 		break;
 
 	case RDMA_CM_EVENT_ADDR_ERROR:
+		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		info->ri_rc = -EHOSTUNREACH;
 		complete(&info->ri_done);
 		break;
 
 	case RDMA_CM_EVENT_ROUTE_ERROR:
+		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		info->ri_rc = -ENETUNREACH;
 		complete(&info->ri_done);
 		break;
 
 	case RDMA_CM_EVENT_ESTABLISHED:
-		log_rdma_event(INFO, "connected event=%d\n", event->event);
+		log_rdma_event(INFO, "connected event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_CONNECTED;
 		wake_up_interruptible(&info->conn_wait);
 		break;
@@ -208,7 +211,7 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_CONNECT_ERROR:
 	case RDMA_CM_EVENT_UNREACHABLE:
 	case RDMA_CM_EVENT_REJECTED:
-		log_rdma_event(INFO, "connecting failed event=%d\n", event->event);
+		log_rdma_event(ERR, "connecting failed event=%s\n", event_name);
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		wake_up_interruptible(&info->conn_wait);
 		break;
@@ -217,6 +220,7 @@ static int smbd_conn_upcall(
 	case RDMA_CM_EVENT_DISCONNECTED:
 		/* This happens when we fail the negotiation */
 		if (sc->status == SMBDIRECT_SOCKET_NEGOTIATE_FAILED) {
+			log_rdma_event(ERR, "event=%s during negotiation\n", event_name);
 			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 			wake_up(&info->conn_wait);
 			break;
@@ -229,6 +233,8 @@ static int smbd_conn_upcall(
 		break;
 
 	default:
+		log_rdma_event(ERR, "unexpected event=%s status=%d\n",
+			       event_name, event->status);
 		break;
 	}
 
-- 
2.43.0


