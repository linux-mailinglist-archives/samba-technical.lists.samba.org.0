Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3075FB1ED3B
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Qm57wk1qEdpcrVDBfLhRBpoucjNgZxf0N/Dk21wNWRQ=; b=0MpnRTlrDh7EBYteP5vl1XHAQC
	786QnSz4ipkMMWdyqPcX18CpjdKSK28VBtA2vF4zQFYuxD3qN9gYFmspGoRRY5SHyRwZw7sAiPrlZ
	3hNxVjKcxUma6BU+nJZRHrdq/UBcMK8hPeUV8V7eepQ4K5Uh7gpbiFUPzEzTHQM4+d+WN4UM4R7eE
	erXysmXqOpO5dK3n8DS+IBwpbMvd/cUpKPjARryqr3PDAHyF0WVyZDlVyQ+IdjSTvtGtZPJFyo2uh
	NuohIEeh9I5ORjIyy8jQle9TvUJ498evofsA4is3wc/K+48Ea5k2wlwUvycbf3l5IHyAwGvPGjd6p
	VVyPD5og==;
Received: from ip6-localhost ([::1]:58616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQGw-00EhsA-O1; Fri, 08 Aug 2025 16:48:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20644) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGo-00EhqF-E9
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Qm57wk1qEdpcrVDBfLhRBpoucjNgZxf0N/Dk21wNWRQ=; b=Vyeh3dVjV3KkwVC2q3YnHAJR94
 v5FAi/AltCFbiYmaBochqFwSRuH6ftXrFzf+A0fft2tEZwIAXd95vRzDxbm/AHi++/2lhMw10vfs/
 NAgJDVNDcS36RbYTCp535lNWPGVgH0Cnb/QdmBe69Odda80sbw860sUikg43jvuGfC9cU/ZD2HvRE
 bP7oDUaqf1WmLanXeFQpNDjV3RFoItdveqXDOCyxiePIHce19UWkJpeuF7MmK174f7GcQvCfFM+/Z
 i8iNhW93MIIrnvOHt0n1Zuknxad9Ws/7JAw7mMY0RU3zG3APe5yHcG1op7hto7jrdTAssK+d7hSPw
 UhsPwWK+MvVUEj9khBNFo+a0+QNOpr9mZAAO+qNWqmgP1MzD8Z7H0OwRGeq//8ys0VsG6MKO57HCB
 e1zIN4eq92UwWMGGkZBHxqpYs2tziNfc9cKejNJ860DfJuY1Il2uw1uSDIsxgFM2qljfXPWaBPNTP
 RT/BlNGDzq6grT3va0evS6vh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGm-001qMz-2j; Fri, 08 Aug 2025 16:48:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 2/9] smb: client: improve logging in smbd_conn_upcall()
Date: Fri,  8 Aug 2025 18:48:10 +0200
Message-ID: <4260099ac5a1b2feeda4b98743b5bbe51d28ec89.1754671444.git.metze@samba.org>
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

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
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


