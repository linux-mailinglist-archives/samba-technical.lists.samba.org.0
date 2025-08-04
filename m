Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F7B1A0EF
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iIftbjQoYLTTZiWwDWtcmyqSWAYPNz8FLhXJFTOEmfI=; b=oZxeA39cNC2usZOZqzVjMwbpLU
	eeiDVMED4XHNYQlqeWnJSEAiNlJmP6J40Jr1rzJlxYw6FNjF7jBIBa/pg+PjfHDf3s0DAzCEOtUg0
	+lAkkj+JPR1Kw+Ml5RkrHS0EGAXkt3i6E/Dfbd+18g1lGWfB4ptf6Gv/VEn7WZtuGm1QVYdpAlBmS
	5ETpaxN6XKL5gx2JlesUuDkbjBwdil7QMM+alRXG5p5eiCYpkauMN9MIM9j/etsYVnc+nOzngAyg1
	RHYaPizTDtobKiuOiRVRpWcmJHunEdljgxAf9nzEXuqmU9pYp3NyMy6izH/GYKzeAMExUjseVOtvZ
	T5fUDO7g==;
Received: from ip6-localhost ([::1]:37502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu33-00EHmd-35; Mon, 04 Aug 2025 12:12:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17254) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2g-00EHi6-HG
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iIftbjQoYLTTZiWwDWtcmyqSWAYPNz8FLhXJFTOEmfI=; b=GxGS5hJtgKg6xkxQOpWJSnGp97
 A8vVcQYhjh8iMrmRFvizsjE74oVXCUHCCTVRWW8rkMpkl4Nmr5LvMH2iQ84uCbW84ixg5ber4zDf6
 DH9GXcbrdlHzyrhSOo43gvm+BwWDYmdr0p1siE7UfeyQapCJtdkdvvJqpDwv2/cY1JzZfv8ZGwUIr
 Eg0JQaL2W8H4fZmdPITkwW6VYa2asv9RZ6HvFVUg3QrNDEnf9xoVfKQ4uuDk6p2j2qdsmFHLlVgC+
 9DOM+L3nCzRFSkPiGZjeLPmOcb//3NEIdiBQMNJW8l8DoYxJCxRrCnT5LXItKpdaqNOSwWOBh14l1
 7dca562tNVK/t4DPuQn/NIYkZbbtn5VXHdoVW26MlhdGayyXHTQhwb3l1m/9iAGzCUcivYDsKT6Yq
 p30UQl19eZVLUFUMe1zfc249HsEFSIQj9/WAPOdsCVC5c2ODTXOKEQhUC7tcl/YQJnBz5jyOTiCMf
 HZ3yb44MLRIt7BcxsFvBZ+in;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2e-000vvB-1o; Mon, 04 Aug 2025 12:11:49 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 3/5] smb: client: make sure we call ib_dma_unmap_single() only
 if we called ib_dma_map_single already
Date: Mon,  4 Aug 2025 14:10:14 +0200
Message-ID: <04f3ed65f8f1a04d231c7dad2f25624dbc6bc48b.1754308712.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754308712.git.metze@samba.org>
References: <cover.1754308712.git.metze@samba.org>
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

In case of failures either ib_dma_map_single() might not be called yet
or ib_dma_unmap_single() was already called.

We should make sure put_receive_buffer() only calls
ib_dma_unmap_single() if needed.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b18e2bc6c8ed..a32ebb4d48a2 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1057,6 +1057,7 @@ static int smbd_post_recv(
 	if (rc) {
 		ib_dma_unmap_single(sc->ib.dev, response->sge.addr,
 				    response->sge.length, DMA_FROM_DEVICE);
+		response->sge.length = 0;
 		smbd_disconnect_rdma_connection(info);
 		log_rdma_recv(ERR, "ib_post_recv failed rc=%d\n", rc);
 	}
@@ -1186,8 +1187,13 @@ static void put_receive_buffer(
 	struct smbdirect_socket *sc = &info->socket;
 	unsigned long flags;
 
-	ib_dma_unmap_single(sc->ib.dev, response->sge.addr,
-		response->sge.length, DMA_FROM_DEVICE);
+	if (likely(response->sge.length != 0)) {
+		ib_dma_unmap_single(sc->ib.dev,
+				    response->sge.addr,
+				    response->sge.length,
+				    DMA_FROM_DEVICE);
+		response->sge.length = 0;
+	}
 
 	spin_lock_irqsave(&info->receive_queue_lock, flags);
 	list_add_tail(&response->list, &info->receive_queue);
@@ -1221,6 +1227,7 @@ static int allocate_receive_buffers(struct smbd_connection *info, int num_buf)
 			goto allocate_failed;
 
 		response->info = info;
+		response->sge.length = 0;
 		list_add_tail(&response->list, &info->receive_queue);
 		info->count_receive_queue++;
 	}
-- 
2.43.0


