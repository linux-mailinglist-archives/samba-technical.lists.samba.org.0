Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B49B34CAF
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ll2EyGXJpIsL8eDVf1I7bIRzxO08DW/rRg0YiaZu8fY=; b=eJ9dotz0epR+ybH4abijZN1Ogl
	THtAK17Q3+kRiuLd21ewYVPjW9ohoFB56Z6QgKrTHp0NpkR3eKqRlx2hNqFcafrTdVmX7XyBbhVh8
	7c6LQpevJDTQCNW8b/IPmT7LVXdfvo/UPAmgXT8e2uZ6eEoXZLeuCBIZRUrn3pWP2uNDgb8NNQF/Y
	BuI3rys/+mcgHGm5qldRU8/2UrR8Ilho7tXVeGwEnBg8T1YT0ChKAttVmJpb2DnelnO7XMkc+PFkI
	eT2Y5eTTaTK0b9OIHNCFp4uXjqAIEuq1RGVyxJSzsD82Qbe293lWH+lGxP1YFoaJfjCNkpxVK2xB1
	4+kFyuLg==;
Received: from ip6-localhost ([::1]:31204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe9U-000OXY-6M; Mon, 25 Aug 2025 20:50:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7T-000Nor-5w
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ll2EyGXJpIsL8eDVf1I7bIRzxO08DW/rRg0YiaZu8fY=; b=ePEY0wXh3wELuBXaZ2g6Eu6Z33
 jn6iQghaIRBLpuSp5+yGrGkbmCsGlM/AC0W4fi1QHJSuSHWzqCqiLZR7Yh29cO96rpCfHzJkqaT1T
 502BFJcMs2a08n4GSwddHh05XwH2nuC153GPB6zDBGrhRS7Fr+V9G/ENTQr9Ssf+ucv03OfQIjJbs
 pludTC5QZX1Rl6xTugdR7bSKCydfQRH/yYXAQI6Yj762PAlansvxffWnm3QoMOMjnmQuqAcRlE5AN
 iQop0RHFgHXpxiswB4g1IYPD93gZN57UZRk2L9zQVwHJXD8FuW6hMS8k5yD2+BBxUkQHZ7/sQ5RjO
 yyllbQ0YgsoefoZKDAxSckjEzR1X6vs+HTj73u/VXpCaFjDm9XljcYUqwqwdCtyt70cI8p3y2sfUA
 sAacMKdIVe1vsWnmVObOLZ3oUmp/NEZpLy5nX/UgLYSbSP3ITmVUYXndFtLQtyKaxRhUMdUqcfT4T
 suqTdb8rNVP48xoNZulb+de1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7Q-000kcK-1h; Mon, 25 Aug 2025 20:48:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 042/142] smb: client: send empty packets via
 send_immediate_work
Date: Mon, 25 Aug 2025 22:40:03 +0200
Message-ID: <ba39beed93ac155a3911e3c401064d98942a5e2b.1756139607.git.metze@samba.org>
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

This is what the server already does and it makes
refactoring for common structures and functions much easier.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 25 +++++++++++++++++++++----
 fs/smb/client/smbdirect.h |  1 +
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ab1f5050e616..b7c5f30fa271 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -173,6 +173,7 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	disable_work(&sc->disconnect_work);
 	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&info->mr_recovery_work);
+	disable_work(&info->send_immediate_work);
 	disable_delayed_work(&info->idle_timer_work);
 
 	switch (sc->status) {
@@ -542,8 +543,8 @@ static void smbd_post_send_credits(struct work_struct *work)
 	/* Promptly send an immediate packet as defined in [MS-SMBD] 3.1.1.1 */
 	if (atomic_read(&sc->recv_io.credits.count) <
 		sc->recv_io.credits.target - 1) {
-		log_keep_alive(INFO, "send an empty message\n");
-		smbd_post_send_empty(info);
+		log_keep_alive(INFO, "schedule send of an empty message\n");
+		queue_work(info->workqueue, &info->send_immediate_work);
 	}
 }
 
@@ -1409,6 +1410,19 @@ static void destroy_receive_buffers(struct smbd_connection *info)
 		mempool_free(response, sc->recv_io.mem.pool);
 }
 
+static void send_immediate_empty_message(struct work_struct *work)
+{
+	struct smbd_connection *info =
+		container_of(work, struct smbd_connection, send_immediate_work);
+	struct smbdirect_socket *sc = &info->socket;
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return;
+
+	log_keep_alive(INFO, "send an empty message\n");
+	smbd_post_send_empty(info);
+}
+
 /* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
 static void idle_connection_timer(struct work_struct *work)
 {
@@ -1426,8 +1440,8 @@ static void idle_connection_timer(struct work_struct *work)
 		return;
 	}
 
-	log_keep_alive(INFO, "about to send an empty idle message\n");
-	smbd_post_send_empty(info);
+	log_keep_alive(INFO, "schedule send of empty idle message\n");
+	queue_work(info->workqueue, &info->send_immediate_work);
 
 	/* Setup the next idle timeout work */
 	queue_delayed_work(info->workqueue, &info->idle_timer_work,
@@ -1474,6 +1488,8 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	log_rdma_event(INFO, "cancelling idle timer\n");
 	disable_delayed_work_sync(&info->idle_timer_work);
+	log_rdma_event(INFO, "cancelling send immediate work\n");
+	disable_work_sync(&info->send_immediate_work);
 
 	/* It's not possible for upper layer to get to reassembly */
 	log_rdma_event(INFO, "drain the reassembly queue\n");
@@ -1817,6 +1833,7 @@ static struct smbd_connection *_smbd_get_connection(
 		goto allocate_cache_failed;
 	}
 
+	INIT_WORK(&info->send_immediate_work, send_immediate_empty_message);
 	INIT_DELAYED_WORK(&info->idle_timer_work, idle_connection_timer);
 	queue_delayed_work(info->workqueue, &info->idle_timer_work,
 		msecs_to_jiffies(sp->keepalive_interval_msec));
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index f5f4188ad7cd..d51ec4d01be7 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -74,6 +74,7 @@ struct smbd_connection {
 	wait_queue_head_t wait_post_send;
 
 	struct workqueue_struct *workqueue;
+	struct work_struct send_immediate_work;
 	struct delayed_work idle_timer_work;
 
 	/* for debug purposes */
-- 
2.43.0


