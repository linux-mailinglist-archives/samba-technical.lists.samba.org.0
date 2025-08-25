Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 523FAB34C80
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4VVboEJOnVJv4Sk2fO/qP62/mL4LxSXQpsj5sQNisTM=; b=o5zscYAAuP63shQi6rPsT/kL9T
	+OIE+cd95HcEPQvqmTqrPhRGErPB7z1yOnDPbRwc/dTJTgzz/iIX2Xi+/1j3nVorI8oMDeTs0hyb2
	NfEVUMee+80m1DmeZ4TE9zY486mSiT3jCeks9S2kps7eMsDsEe9GttTyOwU0JK5ZhV5DC2FLOCVL+
	LnLoF33WGGRCHpFUQEcRZSba9jhmFdWjonC9Y+mGkC0utifhZpC47wXLcWmmKR/ftJPMGtQ8D0RqW
	Nagj/nq8bThEGCAll2Mg8TJvH64uqxLqhTm0CM1UBVTaiF49qY9xZvnUMywXCFUIrHbCorrchaoP9
	SqRyi4hw==;
Received: from ip6-localhost ([::1]:21598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe6B-000NGM-Tw; Mon, 25 Aug 2025 20:47:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32122) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5C-000Mrq-4Y
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4VVboEJOnVJv4Sk2fO/qP62/mL4LxSXQpsj5sQNisTM=; b=u1JexVW7nLgusc5dATTIt+qbww
 LaV5pyBmiKzhlRf+5cb4ZqRAdey0t/wM5e58XboHNjetmXikJdUW2hKvTXxL3/i86oEpMsQfRn3ZI
 ZGhiiFKr2kqFPlZ6rd7CA2ZbiXjwonGBmSGzjbw89/NFEcSLD3pH7O1OLJvcau2U/Dxj98fVxMqp1
 CV//Mx1ev0ASAUTH7h3LpAY/4C+7Zx0F7+NSGqJXHVnGYI0CthTbZuJBj6XcV7+tDcwAJCNSqe8Ix
 kEqpXGrgUE7c6qrtYa1lC2hS6/w2fcpO1n1b5Q4LxTRB6M/jV8nvwwIyu1rZvF1PerkrLMBBEhBnr
 wIL3YbPiK3b++e3lvazRq8gl8/ByWkSTptlLUU80MoANjHqBCEepIi+p/TAVEMHa+1dm8SBA1ll1a
 ElK4ml//RgNkNhjsHzhZEev6YXa9Vt7PxklW9+1S7gfjORK7IZmnmgMHXyVmDMVID4HfVcTqOFMst
 vO6u2vkwcv/vN0u9iiPIgQbA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe59-000k5i-0O; Mon, 25 Aug 2025 20:46:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 027/142] smb: client: make use of
 smbdirect_socket.send_io.credits.{count, wait_queue}
Date: Mon, 25 Aug 2025 22:39:48 +0200
Message-ID: <af50befd1a2651094a66cc1211d05c10f3e8e13d.1756139607.git.metze@samba.org>
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

This will be used by the server too and will allow to create
common helper functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c |  2 +-
 fs/smb/client/smbdirect.c  | 19 +++++++++----------
 fs/smb/client/smbdirect.h  |  3 ---
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index 7df82aa49e48..b80ddacd8c8f 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -476,7 +476,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 			sc->recv_io.reassembly.queue_length);
 		seq_printf(m, "\nCurrent Credits send_credits: %x "
 			"receive_credits: %x receive_credit_target: %x",
-			atomic_read(&server->smbd_conn->send_credits),
+			atomic_read(&sc->send_io.credits.count),
 			atomic_read(&server->smbd_conn->receive_credits),
 			server->smbd_conn->receive_credit_target);
 		seq_printf(m, "\nPending send_pending: %x ",
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index dd0e1d27e3aa..b9ee819aea79 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -322,7 +322,7 @@ static int smbd_conn_upcall(
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
 		wake_up_all(&sc->status_wait);
 		wake_up_all(&sc->recv_io.reassembly.wait_queue);
-		wake_up_all(&info->wait_send_queue);
+		wake_up_all(&sc->send_io.credits.wait_queue);
 		break;
 
 	default:
@@ -446,7 +446,7 @@ static bool process_negotiation_response(
 		log_rdma_event(ERR, "error: credits_granted==0\n");
 		return false;
 	}
-	atomic_set(&info->send_credits, le16_to_cpu(packet->credits_granted));
+	atomic_set(&sc->send_io.credits.count, le16_to_cpu(packet->credits_granted));
 
 	atomic_set(&info->receive_credits, 0);
 
@@ -606,12 +606,12 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			le16_to_cpu(data_transfer->credits_requested);
 		if (le16_to_cpu(data_transfer->credits_granted)) {
 			atomic_add(le16_to_cpu(data_transfer->credits_granted),
-				&info->send_credits);
+				&sc->send_io.credits.count);
 			/*
 			 * We have new send credits granted from remote peer
 			 * If any sender is waiting for credits, unblock it
 			 */
-			wake_up(&info->wait_send_queue);
+			wake_up(&sc->send_io.credits.wait_queue);
 		}
 
 		log_incoming(INFO, "data flags %d data_offset %d data_length %d remaining_data_length %d\n",
@@ -976,8 +976,8 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 
 wait_credit:
 	/* Wait for send credits. A SMBD packet needs one credit */
-	rc = wait_event_interruptible(info->wait_send_queue,
-		atomic_read(&info->send_credits) > 0 ||
+	rc = wait_event_interruptible(sc->send_io.credits.wait_queue,
+		atomic_read(&sc->send_io.credits.count) > 0 ||
 		sc->status != SMBDIRECT_SOCKET_CONNECTED);
 	if (rc)
 		goto err_wait_credit;
@@ -987,8 +987,8 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 		rc = -EAGAIN;
 		goto err_wait_credit;
 	}
-	if (unlikely(atomic_dec_return(&info->send_credits) < 0)) {
-		atomic_inc(&info->send_credits);
+	if (unlikely(atomic_dec_return(&sc->send_io.credits.count) < 0)) {
+		atomic_inc(&sc->send_io.credits.count);
 		goto wait_credit;
 	}
 
@@ -1117,7 +1117,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 
 err_wait_send_queue:
 	/* roll back send credits and pending */
-	atomic_inc(&info->send_credits);
+	atomic_inc(&sc->send_io.credits.count);
 
 err_wait_credit:
 	return rc;
@@ -1793,7 +1793,6 @@ static struct smbd_connection *_smbd_get_connection(
 		goto allocate_cache_failed;
 	}
 
-	init_waitqueue_head(&info->wait_send_queue);
 	INIT_DELAYED_WORK(&info->idle_timer_work, idle_connection_timer);
 	queue_delayed_work(info->workqueue, &info->idle_timer_work,
 		msecs_to_jiffies(sp->keepalive_interval_msec));
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 3dbe17e8e424..1c4e03491964 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -53,7 +53,6 @@ struct smbd_connection {
 	/* dynamic connection parameters defined in [MS-SMBD] 3.1.1.1 */
 	enum keep_alive_status keep_alive_requested;
 	int protocol;
-	atomic_t send_credits;
 	atomic_t receive_credits;
 	int receive_credit_target;
 
@@ -91,8 +90,6 @@ struct smbd_connection {
 
 	bool send_immediate;
 
-	wait_queue_head_t wait_send_queue;
-
 	struct workqueue_struct *workqueue;
 	struct delayed_work idle_timer_work;
 
-- 
2.43.0


