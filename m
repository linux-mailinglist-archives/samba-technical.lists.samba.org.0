Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D510AB34C72
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=v+Lya7NIpF+8E0GuwpzCf9CsxPYx2ccrTfVnonl25UA=; b=qIrXlmB7TLJ67nsK9izHXTfyhK
	tLyzogf27fbPIlhOHdXEKi25FXdoz3TPbbYBAOfl6JUYYWww37U58AYs+QE7+E/GOhoJnMWN5IPnu
	obiRd0v9/Rqqto+XKJvF81xxPtojRBU2L/XgKA2D0MF6KhJQXHN5Kvr+R2z9WE8OJtJQKi1oflBCE
	v1xZkzkJcmxJz9R59nLvpPWIkm+7sV+tVmQ2rVWyCVc7yVD+Bq4NLzQHRlnsrK8+WnH6e49YGazFU
	af19L73s7A7QYVSzi6nbwgjdJvuYZ/TG5Bj18yA1Hk1Dxn7Lq6WInE4yHiQTftetiQ1GSPj/rxOoC
	qWZ5qrmw==;
Received: from ip6-localhost ([::1]:43030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe59-000Mkt-R8; Mon, 25 Aug 2025 20:46:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe44-000MPM-Vy
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=v+Lya7NIpF+8E0GuwpzCf9CsxPYx2ccrTfVnonl25UA=; b=GNZUeuzC2/kBeUz9PmSwwxkEm8
 2Nyob0tuyqINq/fPHFoiVP8o1vl3TspEMkB2LYiozyjh86WyZ+5Pprp+VW8ysJaTHDyWsQCLO3tut
 0wKbPbLAyi6Pdan5JAlm2c/R0QXOAE9D00w/6n4S0+6Jyb2KVfyVr/9yj/46Y84Q5aWplwvLwOY9R
 SVJU9Zssfvc0EZfWXuiDcgXq4HyVL0lzV/WBV4ghurIdyEQ3gfhOsB11A8W/3eLCJxgpx1UOBcPbJ
 j4AgPzxiSS8YDD42IpnJsRTCJPEyGAVqG8xW23OQ3GZomsyfG0s9zCPqjiS3Kutb/Y9gr0zI1SeVq
 wIzkoVany3vYp0RXSXcisvmUbi/i1YK3Wk9qqDVxMHCE8ikfwxXIOtdkvC/qXNg4Cp/2lNCqUUe+Q
 K3JKBkM8tIVQtilTo/1p/xL/TIBGLH/nNB2ZXXIrbJBdynn9SS3DoOJ8VETxb7t5JJgJcGzHA1lK/
 mnxffWZC2xokc1Qphq6JBXJX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3z-000jqg-0k; Mon, 25 Aug 2025 20:45:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 020/142] smb: client: use status_wait and
 SMBDIRECT_SOCKET_NEGOTIATE_RUNNING for completion
Date: Mon, 25 Aug 2025 22:39:41 +0200
Message-ID: <b2b7c222dc0f4ca8d100a36669eb994415dbf0ae.1756139607.git.metze@samba.org>
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
index cfc5e17bc055..c94b7d4f2dc2 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -552,6 +552,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbd_connection *info =
 		container_of(sc, struct smbd_connection, socket);
 	int data_length = 0;
+	bool negotiate_done = false;
 
 	log_rdma_recv(INFO, "response=0x%p type=%d wc status=%d wc opcode %d byte_len=%d pkey_index=%u\n",
 		      response, sc->recv_io.expected, wc->status, wc->opcode,
@@ -574,16 +575,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
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
@@ -1206,17 +1207,17 @@ static int smbd_negotiate(struct smbd_connection *info)
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
index 4ca9b2b2c57f..c9b0c6b61e7e 100644
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


