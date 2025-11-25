Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F128C86855
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mrEmNSi61tqKa8cGV5xxsIC9zqbONXr7PvMRMMgcgd8=; b=awgWEDUPEuBo6FCHUQoce1fozP
	0lz9pZezA8Yl6WVAAecUat3d+DhPtbJmo7KBlas8dFkk24JEx/jczspyOxdEtlp8DJ9h6OA3y8sRI
	lvZ14z7OPeqFTQXOVp9f19gqyfoRndAH8I+20Z6+oHGql6CuKyaeWwu0wiUI4+lgChK9QMIvIGKU7
	RQqpQJAevFrKnmOxvhZ9K9j+FcBthnUNtmmfCyatvD+HkofQu+e11DttQ01OB2+z3t5AyDT9ifuT8
	gN131fmi1JBRurmIXDX4InqKVsr8fk8GgmnoGPKPzl46k4OTnJH38P4Ty6ufF+/lHaYJQ59zeVGeR
	T/yl4RxA==;
Received: from ip6-localhost ([::1]:20802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxYv-00DCMk-3h; Tue, 25 Nov 2025 18:14:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44080) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTt-00DAWm-1w
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mrEmNSi61tqKa8cGV5xxsIC9zqbONXr7PvMRMMgcgd8=; b=FzZ/KaxWZpugFFQtWwbmUX5Dtw
 wLdePV+IQzjGqXIc/CZh84BOk0aCqhzgpuOBi7tcKaiHnF1Y67weXBlJzu4ebPypJLEOdkqkdhpWc
 O7NypZhH5VBXFN2Osj//nL6tSM8drX1z6tHxWgosjKHlDCUNYpftKWaB5L/sf7m4A8JK+WHJf4SVX
 laSPKee7+d19OzLX51bbxzHUvyQnNoDdRF8kpyLZ2sKe59Glvj+dOv71pwjbGra/p/d8U7ylE0c9m
 uObLjTYH6lfEDtTJ5TsB81llN10+jzsOWhqDMDPfkEf0uVwiyUh9w+2q8qdczruXG8Zm1BRO2S0Bt
 1x5Psmso8AaUi38hLodv8wFXnDW70CMrI5AWDMhsVpfrbfsU4RXjAqIDQnmVrOEOANWnfZlkTGdGl
 X1YWN+YDBY62Lx7ry0lb5zA/9Q49n2BzrGWYEI3Gp+Zl8a9TprYw8xSwwjIjU3H6Qh8TWfKCqexMe
 eeGl6JyfH+rmQmbjnLJks2O6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQE-00FdhY-1y; Tue, 25 Nov 2025 18:05:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 072/145] smb: client: make use of
 smbdirect_connection_send_io_done()
Date: Tue, 25 Nov 2025 18:55:18 +0100
Message-ID: <bbd53c94fe680e96119c15bd67f4989259ec870c.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
index e1a2238d249a..6c8844c4edce 100644
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
-		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
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
@@ -865,7 +833,7 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 		sc->ib.dev, request->sge[0].addr,
 		request->sge[0].length, DMA_TO_DEVICE);
 
-	request->cqe.done = send_done;
+	request->cqe.done = smbdirect_connection_send_io_done;
 
 	send_wr.next = NULL;
 	send_wr.wr_cqe = &request->cqe;
@@ -964,7 +932,7 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 			DMA_TO_DEVICE);
 	}
 
-	request->cqe.done = send_done;
+	request->cqe.done = smbdirect_connection_send_io_done;
 
 	send_wr.next = NULL;
 	send_wr.wr_cqe = &request->cqe;
-- 
2.43.0


