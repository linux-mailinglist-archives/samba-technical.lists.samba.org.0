Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D8B1EBF3
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3FOE+Pyo2rzl3UtdD3S7NfgESaKpOORAd3l0kBLHGzk=; b=yQZtwdCFWCCs0kQO66iY9moZwE
	1kLF9Bocl0UzjRQy38XJAzfWqmN4kov2BWMxZXDgvIrruj5uIBDi7FJQhoJhjlmlOqD7wllJ5Vle6
	cB3UgAPZUM+MtXKxTEd7jk+2O+IWx8KkS7xC8jjeTWdfKcGoO6tORsrQqnSYtKzQtaP50Ykx+s7fk
	hBzNzh0LbLKJo04+7nGzWBJAs8ZsHyfmLzH3h2zVgAHGFJ30POubwnDeDOCbIheEQsMlCtpP72WV1
	cm6zrJefoy9qa3UDPXHepTkdoGSYOhjhh42Sn29GqnoOD65yok9jBsWRXueyAmdKll2HqG2Le2IAj
	B4YNjTRw==;
Received: from ip6-localhost ([::1]:31298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP2D-00Egai-1o; Fri, 08 Aug 2025 15:29:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36680) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1g-00EgPK-2C
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3FOE+Pyo2rzl3UtdD3S7NfgESaKpOORAd3l0kBLHGzk=; b=dcAVrtMHRVzwFSRF/RWYzm/rer
 DaSVzRp/HrHg0tKfBEx7iTu0eyVlurvvHS/QxzO1M2uIC/pb3/F54GTjaEPxtZE4FL5EMkwI+xYVT
 9TGl7VGZMdaBlSRsb9noyduCJWe0toJmoUaP3uxXyXR7QPa9uYkGzXSB1oL2OsdCSEApkCHPGmJKZ
 8U6z1UFVkThd66JuarDou/OuachxZc7NIBRKtw604JYXZM926pBFfR2Y4AIef/VRkMOgU9CT9GwDZ
 I0fYhrWQdEQ6c3tn1xcziUgJmpyHFBJzGXXOX4mY95Rfsz4o2dIvNyg5zun3MXpaIeRNe/yrvcmwP
 jRFH1I9Wjod2mrHeNGB6gB//zxAuNIlgbBrwPnuMxbY5cFuSmPrwviNu/TPn+Htvr2pOA4WqHFuRS
 cU7X+WWSU26pRsSmtp0fro/xGOe6tKZ3RzW6r/W1Yesqv4YLSzYb+pAx1a5hirIMV/5GXJdw2nvu+
 wHevFZCNE9kg9TCgSp3kF+33;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1a-001pRx-12; Fri, 08 Aug 2025 15:28:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 6/9] smb: client: use status_wait and
 SMBDIRECT_SOCKET_NEGOTIATE_RUNNING for completion
Date: Fri,  8 Aug 2025 17:28:04 +0200
Message-ID: <405a24e812dff8c66258b5e5cea8810c0a9f648a.1754666549.git.metze@samba.org>
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

We can use the state change from SMBDIRECT_SOCKET_NEGOTIATE_RUNNING to
SMBDIRECT_SOCKET_CONNECTED or SMBDIRECT_SOCKET_NEGOTIATE_FAILED in order
to notify the caller if the negotiation is over.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 19 ++++++++++---------
 fs/smb/client/smbdirect.h |  3 ---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index fd26c6202f09..2057dae51e7b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -470,6 +470,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbd_connection *info =
 		container_of(sc, struct smbd_connection, socket);
 	int data_length = 0;
+	bool negotiate_done = false;
 
 	log_rdma_recv(INFO, "response=0x%p type=%d wc status=%d wc opcode %d byte_len=%d pkey_index=%u\n",
 		      response, sc->recv_io.expected, wc->status, wc->opcode,
@@ -492,16 +493,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	case SMBDIRECT_EXPECT_NEGOTIATE_REP:
 		dump_smbdirect_negotiate_resp(smbdirect_recv_io_payload(response));
 		sc->recv_io.reassembly.full_packet_received = true;
-		info->negotiate_done =
+		negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
 		put_receive_buffer(info, response);
 		WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING);
-		if (!info->negotiate_done)
+		if (!negotiate_done)
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 		else
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
 
-		complete(&info->negotiate_completion);
+		wake_up_interruptible(&info->status_wait);
 		return;
 
 	/* SMBD data transfer packet */
@@ -1124,17 +1125,17 @@ static int smbd_negotiate(struct smbd_connection *info)
 	if (rc)
 		return rc;
 
-	init_completion(&info->negotiate_completion);
-	info->negotiate_done = false;
 	rc = smbd_post_send_negotiate_req(info);
 	if (rc)
 		return rc;
 
-	rc = wait_for_completion_interruptible_timeout(
-		&info->negotiate_completion, SMBD_NEGOTIATE_TIMEOUT * HZ);
-	log_rdma_event(INFO, "wait_for_completion_timeout rc=%d\n", rc);
+	rc = wait_event_interruptible_timeout(
+		info->status_wait,
+		sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
+		secs_to_jiffies(SMBD_NEGOTIATE_TIMEOUT));
+	log_rdma_event(INFO, "wait_event_interruptible_timeout rc=%d\n", rc);
 
-	if (info->negotiate_done)
+	if (sc->status == SMBDIRECT_SOCKET_CONNECTED)
 		return 0;
 
 	if (rc == 0)
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index e45aa9ddd71d..82505df4a751 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -49,9 +49,6 @@ struct smbd_connection {
 	struct completion ri_done;
 	wait_queue_head_t status_wait;
 
-	struct completion negotiate_completion;
-	bool negotiate_done;
-
 	struct work_struct disconnect_work;
 	struct work_struct post_send_credits_work;
 
-- 
2.43.0


