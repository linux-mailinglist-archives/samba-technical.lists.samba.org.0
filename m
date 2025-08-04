Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62429B1A0EB
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=to7ZLsOwz04pZ3TzBcfuBH6LG/57UBcjbzWF3eZFcFg=; b=kiVnrm7yEMjJuAIygbWXpFmYez
	qwDYrX65Mkk21ritq7W4lR/YO9lX0qPrTJy30lvU/De0C7sDWE3+D3MT4DiZc0EuEdwyLEiJSbM8U
	7RBuE2W+LLl19XlkoRZQPCSd5ubVeg+TQj2dNlCU6Y30TB79asHAzyRN3GY23JIesfU90O64pkuFF
	bFKMqIcf0zxVIAUlTI7gEE94Db9Mj+uUMYGnYhB7mfP6L8P4iX0pC4uU7TIPued1lpViROEyYrDMZ
	4l7so2KNoJ9r6p6QXX47gNM4+hzFpkp+Hp2rXEok+5xdSr6/Vh/itWw8uqc8NDQNCX2C5/KNeyDd7
	BVE/8Duw==;
Received: from ip6-localhost ([::1]:27142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu2S-00EHdO-4k; Mon, 04 Aug 2025 12:11:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27494) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2N-00EHdH-4g
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=to7ZLsOwz04pZ3TzBcfuBH6LG/57UBcjbzWF3eZFcFg=; b=F1tk5pWEWxuoCvJ+tNUMm7htWX
 Mloe3ECE7svfVkqKitfl5rBkGwBGP5L+feLCYuy8bhDr7gXzYrOqkJVfyOHdldnFIhAE9C/dPGox3
 1UTSMhNR/QWvsicAxZwoBZ5FhceyhRQKSiZ+Gim+Jy61r4HE/sDLCFi5a34n8oEs2+/j+mfkrUk51
 0/pHs5cH8mO9dX3Q0jWxPu5S6o+TzyvVm1WNcom6lBt7Q/00QABmYBVgKkmVqThwCuWVZ9QkwATcc
 os7ke9CfVbZsHanx2gGGL96ijb8RCVWB5ZJLyY/Y1mVzRmzvlaFrH9WmKKXP7gy0lYYnWp9H+a/Md
 2j0uxGfe9YfGEPHq2q3s5g34nwNkw62dgxlhzSt+mQA5giNgPPDULUVMg6mCLa72H9NkSotMIQAIb
 KQx3gB7ZpLHvFL6R3YW52O/wXdqscRpMxDF2/iah8WL3R2Ip5TFEwa3H+SmXPYsce8o/STRXW0KYR
 C8ynqkM3QRYA9lvPUQ/hmrM3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2M-000vts-13; Mon, 04 Aug 2025 12:11:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 1/5] smb: client: let send_done() cleanup before calling
 smbd_disconnect_rdma_connection()
Date: Mon,  4 Aug 2025 14:10:12 +0200
Message-ID: <0b80cf1a140280ca75ac21d5577a141e433d35f7.1754308712.git.metze@samba.org>
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

We should call ib_dma_unmap_single() and mempool_free() before calling
smbd_disconnect_rdma_connection().

And smbd_disconnect_rdma_connection() needs to be the last function to
call as all other state might already be gone after it returns.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 754e94a0e07f..b6c369088479 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -281,18 +281,20 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	log_rdma_send(INFO, "smbd_request 0x%p completed wc->status=%d\n",
 		request, wc->status);
 
-	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
-		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
-			wc->status, wc->opcode);
-		smbd_disconnect_rdma_connection(request->info);
-	}
-
 	for (i = 0; i < request->num_sge; i++)
 		ib_dma_unmap_single(sc->ib.dev,
 			request->sge[i].addr,
 			request->sge[i].length,
 			DMA_TO_DEVICE);
 
+	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
+		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
+			wc->status, wc->opcode);
+		mempool_free(request, request->info->request_mempool);
+		smbd_disconnect_rdma_connection(request->info);
+		return;
+	}
+
 	if (atomic_dec_and_test(&request->info->send_pending))
 		wake_up(&request->info->wait_send_pending);
 
-- 
2.43.0


