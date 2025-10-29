Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FBC1AC96
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3GRMQzqPED2TUKbgwtiPX5lwV4uGy6u4Gjr2nPPJ8wk=; b=gCVh4/bRRpXUEVUyoi5x7zE0vb
	6reR3yTTjw5EdrGgxw1fjtJCOBy6b8cl0ssIW5h8NZ1ZhdtxWBwqEvOd6MhlAgtwJ2P//YNB1S+3U
	J8+Rm85bd5zwB6SGUBMX/d6LsC9BGCgZgt91MxSJPQUvsDm8rKKPOmjsgWb2XyEdSgCRKY8J5F2tj
	JrtapXJR6oC7hq6jXI/UQnTUKcT1Nwfvopptq8u9+poO9RG2BGwXDu8pDdbTS8ONl5jbdWKPQY7jX
	POqZpSekizvd3ETxeDfV5fKZWFuPERDLQ3FwQ/rBZ8rQUzAxKdGFDNZ8KSEOcxKB9yzmm1NSPRekk
	UFk3bXRw==;
Received: from ip6-localhost ([::1]:24760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6OH-009ATt-27; Wed, 29 Oct 2025 13:39:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18004) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ee-0097C5-5C
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3GRMQzqPED2TUKbgwtiPX5lwV4uGy6u4Gjr2nPPJ8wk=; b=SWptCPkRcnZt19BC0y5hFZuR4E
 9gXpPFCPmwpgLnkw31Ux76b1N3/o4dBd31EvuJibMXG2psM1VeNGuHlLW6GY2vBUZAnyDFmMl0Tii
 gciS4Lrl8JgqT3GKosXD8qKuyzmXbFa3f6dw45sVETB2o4CYdXPz5XL8ySXNQmddrcSsQeiaEsiM7
 kPQs5TGcezDUTz4zCRy1Ahda3gOmzGp961fgWwcGG9Roh+RFjqTPjVZQHLui8c97MD28a4x0ZEIHn
 /hHT0d0Ww3NDSepfDWyeEYacFAcZcTSGedReF/y0Njv6LAeAtIyjc8ELpwXtTQks/N7olo7vdsXJ4
 xHfE7FBv8SYMNmqammEfNkKt0reDY/RCQGGxpPG02WM1yzJNnLKwUUJEvymUXKbteyu3eqoYBWWKs
 jtZ8Qqr3vdDfwX6ElvrIcRp2snhy57aywSNKkPLH0YmNCi9AcZuXF2w5NGCrpDY1F+3zvPPysCvA4
 OdYzeMON8bqJM1hJKfSzTtH4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Eb-00BcC1-1k; Wed, 29 Oct 2025 13:29:05 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 067/127] smb: client: make use of
 smbdirect_connection_send_io_done()
Date: Wed, 29 Oct 2025 14:20:45 +0100
Message-ID: <93518a8f18698c563bd4c24af6c77130464b0e08.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This handles freeing of siblings too, which is used on
the client yet, but that might follow later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 1eed0686a34d..ba6f88e8f33c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -387,38 +387,6 @@ static inline void *smbdirect_recv_io_payload(struct smbdirect_recv_io *response
 	return (void *)response->packet;
 }
 
-/* Called when a RDMA send is done */
-static void send_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	struct smbdirect_send_io *request =
-		container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
-	struct smbdirect_socket *sc = request->socket;
-	int lcredits = 0;
-
-	log_rdma_send(INFO, "smbdirect_send_io 0x%p completed wc->status=%s\n",
-		request, ib_wc_status_msg(wc->status));
-
-	/* Note this frees wc->wr_cqe, but not wc */
-	smbdirect_connection_free_send_io(request);
-	lcredits += 1;
-
-	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
-		if (wc->status != IB_WC_WR_FLUSH_ERR)
-			log_rdma_send(ERR, "wc->status=%s wc->opcode=%d\n",
-				ib_wc_status_msg(wc->status), wc->opcode);
-		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-		return;
-	}
-
-	atomic_add(lcredits, &sc->send_io.lcredits.count);
-	wake_up(&sc->send_io.lcredits.wait_queue);
-
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.zero_wait_queue);
-
-	wake_up(&sc->send_io.pending.dec_wait_queue);
-}
-
 static void dump_smbdirect_negotiate_resp(struct smbdirect_negotiate_resp *resp)
 {
 	log_rdma_event(INFO, "resp message min_version %u max_version %u negotiated_version %u credits_requested %u credits_granted %u status %u max_readwrite_size %u preferred_send_size %u max_receive_size %u max_fragmented_size %u\n",
@@ -864,7 +832,7 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 		sc->ib.dev, request->sge[0].addr,
 		request->sge[0].length, DMA_TO_DEVICE);
 
-	request->cqe.done = send_done;
+	request->cqe.done = smbdirect_connection_send_io_done;
 
 	send_wr.next = NULL;
 	send_wr.wr_cqe = &request->cqe;
@@ -963,7 +931,7 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 			DMA_TO_DEVICE);
 	}
 
-	request->cqe.done = send_done;
+	request->cqe.done = smbdirect_connection_send_io_done;
 
 	send_wr.next = NULL;
 	send_wr.wr_cqe = &request->cqe;
-- 
2.43.0


