Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C2B34C96
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:48:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WY7FlQ1xdCbSs80M6oO3Fud5yDCsPp1VxliFdR5dWe0=; b=yqhvCMvOtaz2b3Bs3Hywq7+0x0
	hX7nF7XkZ42+tbW/TK1D8Unj1qojJZeIylG6dyeqzsMMYNz3bJcVcPZliNIV+kffZvBlo0aukVwkB
	qHmNZTvEtDcrFScDRPpZK31xZE42SGXQJTvJapSmeS19LsnSyKna67kBbLUIdslRkEhYL8ymvd34B
	4o3ndGVh98fYVS2wH2G1Ooimof9FTgMgvM7BD83YDDZXLy1Gy7XHHlfNCM/yExjrUWIHCAuJkqjme
	tuTfh/NKvyH8qAb0qLvgwAlG71FZe1gbhKWdiyEYZqZj8+xl5YeZTpU9/c9zPPtq4NfbUywZvEF0D
	NIXY2yYw==;
Received: from ip6-localhost ([::1]:45350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe7O-000NiU-VW; Mon, 25 Aug 2025 20:48:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55326) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5x-000NBA-If
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WY7FlQ1xdCbSs80M6oO3Fud5yDCsPp1VxliFdR5dWe0=; b=O+pzgjfoswqUXpncAB8WtuxYcK
 bImNCgOuiVCA8q408FjDRMpdgTG4rCGrnNh9bGLzPuroZzMJFjFuEczxr358Mae/06MZsWPav6/EO
 QRwIF2g8otkTJrdvwkny2qMdk90PuVs8UahdGW/6SkhU5WwsQuXyFgdQNB+AXDhUde59q6tMyt67+
 kXs9VNHNAZfSsxRQow1joB81CdCbVAOnyQTQ9ZRFcehHBXvhFlP3E0unqMyuKfkkT7d+CWfooEKIq
 kyNNLm0wCOBICjJq7otGVZBxOSO2FCx+rIOt5htH5MCykr/AEvU4/wRP4OyUfqqob8B3kE/q+0jAw
 RlBoc7jQfHtg2FdtRnqYZetqttZr/SHF5dKl4h8xnUxRD19BTQyewuzvWnAxg7OCQJBXXbL3i4xj9
 ABd5TAbwz92GmOvZMuYlURRUHp96eVn3zpZFv1Ecs0w3hdDb7DQ5RI0OyxLJHxDGMnlSUkVdWqAu9
 VXOGHjLvnOWj7tj/H8GbRWQf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5t-000kGv-2q; Mon, 25 Aug 2025 20:47:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 032/142] smb: client: make use of ib_wc_status_msg() and
 skip IB_WC_WR_FLUSH_ERR logging
Date: Mon, 25 Aug 2025 22:39:53 +0200
Message-ID: <a3fb8f061368a0f2fa6cc40b64ea8d744a0eabb0.1756139607.git.metze@samba.org>
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

There's no need to get log message for every IB_WC_WR_FLUSH_ERR
completion, but any other error should be logged at level ERR.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 40aafc606ac8..ec3ebf6e3c88 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -388,8 +388,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbd_connection *info =
 		container_of(sc, struct smbd_connection, socket);
 
-	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%d\n",
-		request, wc->status);
+	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%s\n",
+		request, ib_wc_status_msg(wc->status));
 
 	for (i = 0; i < request->num_sge; i++)
 		ib_dma_unmap_single(sc->ib.dev,
@@ -398,8 +398,9 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 			DMA_TO_DEVICE);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
-		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
-			wc->status, wc->opcode);
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			log_rdma_send(ERR, "wc->status=%s wc->opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->opcode);
 		mempool_free(request, sc->send_io.mem.pool);
 		smbd_disconnect_rdma_connection(info);
 		return;
@@ -566,13 +567,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	int data_length = 0;
 	bool negotiate_done = false;
 
-	log_rdma_recv(INFO, "response=0x%p type=%d wc status=%d wc opcode %d byte_len=%d pkey_index=%u\n",
-		      response, sc->recv_io.expected, wc->status, wc->opcode,
+	log_rdma_recv(INFO,
+		      "response=0x%p type=%d wc status=%s wc opcode %d byte_len=%d pkey_index=%u\n",
+		      response, sc->recv_io.expected,
+		      ib_wc_status_msg(wc->status), wc->opcode,
 		      wc->byte_len, wc->pkey_index);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
-		log_rdma_recv(INFO, "wc->status=%d opcode=%d\n",
-			wc->status, wc->opcode);
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			log_rdma_recv(ERR, "wc->status=%s opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->opcode);
 		goto error;
 	}
 
-- 
2.43.0


