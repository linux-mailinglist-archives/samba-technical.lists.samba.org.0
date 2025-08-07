Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1292B1DB71
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W2FMu31lXhfkjmF1cCf0n3Nqab9x9FtqaM5i0c1PoA4=; b=2M8kvLKmErdyP4sK8PaWwj+H4H
	53hGCDrdo07VXj7wkPV2A1ZINTrIjsyDavBxYOpYsEqdoHKkufWeHk2/BCyvHWHVHqxU7S2YHd8tF
	qOz8jCdQFKKDGv0BL/mfi7hG45cfROTFZMH0ihRgKyTCIQfwJ3dQgEpxwt42fiwR+No8iwBSjMTRW
	My5xK/uB9i6QecFcZjVpl65md5IxdFNVCbC4pdyGb8Ngp+W+PqldAEcgsssamWeqJNwn977SxcIXV
	TQ5AjuaNdqbwxJzRPubWxtJGnMwR53ZANzdshd4xeQ4cDLZNpoEgAiYe1ABe51xwx1n8BuLY7+pR8
	mnLeY4QQ==;
Received: from ip6-localhost ([::1]:37614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3FM-00EZqK-4D; Thu, 07 Aug 2025 16:13:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12832) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3Eq-00EZjJ-Ta
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W2FMu31lXhfkjmF1cCf0n3Nqab9x9FtqaM5i0c1PoA4=; b=zbAccMAcum/hgHKAvj3C/rIMsL
 YHNIQcIwXMho1t53+1sJTLwNwZ4fwBTbE9qf29T0uC+ynTV2XwxvdlVMDpvumBjGkeRHusI1/v0os
 m7SkOBgNuLvrNYmv3ALDnr208tsfpDSzQTBLfgKwJtUYESWGlFRBP1LW2n29Ju+uQ9c74Dgfz1+cG
 0NI5D7C9dJ1jGA3J5DFRYzi+sHN5fFvYpvapbPjOuydCclxmeCodGhke/pwlezosSstrPV1wDo5F9
 Qk5nEkHMQq95QFo3VxhHm5NxmsKncqAC+RnXL4pPm532Yfp5oppE+3xqGETOSLpMMaBTGmRpCJG4x
 CRzO6kwfJW22PwfybNucxHO53JT9/+4J1KsCsX8D8Y57ni6u/Dv2sfRjrPvMNVHehR3i5eczNO1Yk
 LV6/SfSnBY14wLS0YhGWXWOVLPnCNf+DBT5arKZKMhPEtZRnZ9vJMZoGkYv/pN89iwZdBcL5vIs2T
 xuJzhwQ5kpACZB6KJs6VfuUI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3En-001cei-1Z; Thu, 07 Aug 2025 16:13:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 6/9] smb: client: use status_wait and
 SMBDIRECT_SOCKET_NEGOTIATE_RUNNING for completion
Date: Thu,  7 Aug 2025 18:12:16 +0200
Message-ID: <bcb18562bb9741fad01e011a2c2e2fc14e42bc00.1754582143.git.metze@samba.org>
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

We can use the state change from SMBDIRECT_SOCKET_NEGOTIATE_RUNNING to
SMBDIRECT_SOCKET_CONNECTED or SMBDIRECT_SOCKET_NEGOTIATE_FAILED in order
to notify the caller if the negotiation is over.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 19 ++++++++++---------
 fs/smb/client/smbdirect.h |  3 ---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index f95ecc153249..bdc4600d03e3 100644
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
-		if (!info->negotiate_done) {
+		if (!negotiate_done) {
 			sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 		} else {
 			sc->status = SMBDIRECT_SOCKET_CONNECTED;
 		}
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


