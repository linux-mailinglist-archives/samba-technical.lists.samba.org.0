Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C3B1EBE8
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Qm57wk1qEdpcrVDBfLhRBpoucjNgZxf0N/Dk21wNWRQ=; b=EsBs6o72EdrgIMrf3aRhHDp0eb
	+ODtTQapYVKiziyJBDaVmrZyx4Xbuv9nGOjZLO0pXMC7W1q9Elf4BtazkN+0mkkvm7fSkmCvnBCsW
	2l2q+LY9PmpZ3hDfJSUddUz6xdNef1P46v9/PH+mQVpVdd7YTbSnPdd5oeXC2X3Pd+LWTmP1+sfku
	34je2rYPxPzQlw94t5RSqpLwfBgeyaW2PAwHT4kxWQWchg8i9c6I4vHmzMeYapczt1AR5AGA4fNuL
	KcPbZ6+dQsprvW2lmDUiLv9MmojJKsxz6tmMRmE6wD15kTjS5nQLFLMpzPf1e2KEh9wfIZKhNMP8e
	CoU1cwzw==;
Received: from ip6-localhost ([::1]:58104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP1F-00EgEF-3v; Fri, 08 Aug 2025 15:28:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24904) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1A-00EgE8-Ge
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Qm57wk1qEdpcrVDBfLhRBpoucjNgZxf0N/Dk21wNWRQ=; b=Ijxx6Zs3tenEwJ4SjWUoCUWVKy
 w30jUdi9jNVz14eWYcAm3LV731wEocHqMX2s1uRhOTHfeQiAMNxPNux6DWvHVrbphw8TauplygGYg
 fiOZ2KNvwn4br+s8ar8KSkNjplobRR1f5qhtevMmW8f8t8PSqSIE7i2ynvzD0KHZ+7ZSRbbUlIw//
 lAI66XYdSjvAjPewP/7S522EtZUV6bAYyAdVbmotQ7uryDpp7jKvtrQOVAq7M8BcPQRfjBidZvYkA
 f1QmCzTJTRGN5IXHmOjDNsIxPFn6xqBcsym85Li/oD/9bBViZ398bzpwsGt0gIP6+eazdTJJmgIyP
 JTsC6YlCOiskauyoOm7k85Eh+mOPBwgc1ztEpyfnA3vv2SLD+EOFcxdGtDGqzlUD0AO2TYJn4QbpP
 QUwhiNbrgmMz8jXBBTEaabGSftlrL5hX8KpMWz43IHwDd47f2dDJ8UzfnARm4mi/D7yCg9agmsU9S
 x8gyw2ExFTSWwKAVJOVV4P/g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP19-001pOA-2R; Fri, 08 Aug 2025 15:28:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 2/9] smb: client: improve logging in smbd_conn_upcall()
Date: Fri,  8 Aug 2025 17:28:00 +0200
Message-ID: <f021968e46575778d53d5f18a169c2e1d99a6405.1754666549.git.metze@samba.org>
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


