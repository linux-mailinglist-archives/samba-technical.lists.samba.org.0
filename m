Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE02B8E71E
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WLxyOl5j/c8NCJ8mJdA4JT68+6H8fxh8I+yKIFPCgw4=; b=hGwzEggm9goO38zEROkd3TlQz8
	/2oKxaqXiJAjJd1X+Q7rZb47Uht3BWBOoB70h8N/iOiVYfx8IEhHbXTmfrozZb0xb75dhj2HKFZ9c
	Q7U72/5MQ/jta/o7uhOWOZVlW4t/qagsi9dctBl637PHBi3VFAamGqLGI41pq/KeLdSCXcNThbQCh
	mnlBvjeBRmWtBqAG8OGGEnA8Lusjo6o9xY0jAWj5c7r2W02ALS922LsAd3lWQaRliPEQ0wWXIUoxf
	zbFaj3d8J5vAb0s6VVSrdxOUbsudqd65c+G1waf97sUIuACiYNGEUk3v6dB59F4Mgbzc63khAv64F
	YBLAcMPA==;
Received: from ip6-localhost ([::1]:52086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rt1-004T6Z-OH; Sun, 21 Sep 2025 21:46:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18490) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rsb-004T3a-6J
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WLxyOl5j/c8NCJ8mJdA4JT68+6H8fxh8I+yKIFPCgw4=; b=u/PNzepISAhA6XzAJqxyebzUVA
 30GdARbuogVoirVcSmLVAGqC7u9Vs9edwGWjzlD/Z5HLcV/87/dOLBxFW9qljrykGMTVbccc/sung
 amVrh+ljWeZkT35QVaVAxrI+oiKAGFuIvGyUhxWA7sjBfRq3QxV1uaB9eH9+/7nUPePwEK6Wpfj74
 R0ZgOrBJSvBJzLQtY9WT7/gKVQ7BARjHIHyt/y6RqQhX7KGcCpBlLWio2Ti5gWXbn7S/UTkch/Zo+
 dxaqayVduxze1MgbbOosoqZeZ16aojttxx/xvS/AfJ+8cUBSDs4yCjLRJS4GR7CgY0jSdi4GlTur8
 qfkwiqpHwhJIvVl5D4hmeoTXkSHqRcBdtGSWJxs6EnauSxdRN48Svb9syxcveDC+Sc5K7jrXODv0D
 7BmYTleK13LlIRLBwmvtqYHP4RAzQ9U1Bf9TQ+0KqUg89ncbaNjrB/mFmhi6gCh8/en5YYuHKF+GC
 Wazcl/gHB8rg4xFybPq3eVZ9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsY-005GMs-2e; Sun, 21 Sep 2025 21:45:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 04/18] smb: client: let smbd_disconnect_rdma_connection() set
 SMBDIRECT_SOCKET_ERROR...
Date: Sun, 21 Sep 2025 23:44:51 +0200
Message-ID: <336b5baaf425b2eacf3001d4157ef04ca4622392.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

smbd_disconnect_rdma_connection() should turn the status into
an error state instead of leaving it as is until
smbd_disconnect_rdma_work() is running.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 7e0d2ecaa37e..38934e330096 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -217,6 +217,46 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_ERROR:
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		/*
+		 * Keep the current error status
+		 */
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_CONNECTED:
+		sc->status = SMBDIRECT_SOCKET_ERROR;
+		break;
+	}
+
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
-- 
2.43.0


