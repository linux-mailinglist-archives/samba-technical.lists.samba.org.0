Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCA419A418
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 06:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T/m0cU/ovq63UEysw2DA0YMO0lHz/8HNpjFSpcuwBgc=; b=12TMUHGo4SXsXB9p2Rc/bx4mqi
	DS36Moou0AqVl0tY2Fp/FXdPcT0Nn3w+12PAnV5o9tgTHfNojI+lDntWd0Zs54tIXik8sjJgNe4Yt
	NvwsGmEW63i552Ngq1X4rcXBEMCwcmo7WD2s498B0WeQnhyjs5e1uXymNTWO8TcUWvtN0QWOR/m9s
	tNakzV89AoQmRg4JBC8bL5GwUpU/0Hv9TsvtA7z/JXrjqYNf42r0EeFfiopELuDZpv7SFPpTMZ9oh
	Eszs7c4dkfIOGYsEVg9NgLuwxxL89D/BAYHS8IZd63SVkDJ16AdLVCk+5n1KeyBRIdgr7/Ed0qK/w
	DRJUgYZQ==;
Received: from localhost ([::1]:59934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJUXY-002wbn-4N; Wed, 01 Apr 2020 03:59:44 +0000
Received: from [13.77.154.182] (port=51084 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jJUXS-002wbF-Nr
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 03:59:41 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id EC35520B46F0; Tue, 31 Mar 2020 20:59:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC35520B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585713573;
 bh=T/m0cU/ovq63UEysw2DA0YMO0lHz/8HNpjFSpcuwBgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=JrWlu3gM2P4UUw+gd2HLm1FKUaYfQl1A/n0anMMSSkV4LG6U4wueIZyH2W3raYSf1
 ESQMWLx9c1n8K0c6wa4UQRWBvaCWoMF0ZAVzqguktvtc+IRzCqfBGaZp3C5+n5rtfS
 p5cTzj8W5uwGVnC/UFf4QgPPiVWohSgkmGBC1dPI=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] cifs: smbd: Do not schedule work to send immediate packet
 on every receive
Date: Tue, 31 Mar 2020 20:59:23 -0700
Message-Id: <1585713563-4635-2-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585713563-4635-1-git-send-email-longli@linuxonhyperv.com>
References: <1585713563-4635-1-git-send-email-longli@linuxonhyperv.com>
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

Immediate packets should only be sent to peer when there are new
receive credits made available. New credits show up on freeing
receive buffer, not on receiving data.

Fix this by avoid unnenecessary work schedules.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/smbdirect.c | 61 ++++++++-------------------------------------
 fs/cifs/smbdirect.h |  1 -
 2 files changed, 10 insertions(+), 52 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index b961260a6336..6d94bc6525b7 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -380,27 +380,6 @@ static bool process_negotiation_response(
 	return true;
 }
 
-/*
- * Check and schedule to send an immediate packet
- * This is used to extend credtis to remote peer to keep the transport busy
- */
-static void check_and_send_immediate(struct smbd_connection *info)
-{
-	if (info->transport_status != SMBD_CONNECTED)
-		return;
-
-	info->send_immediate = true;
-
-	/*
-	 * Promptly send a packet if our peer is running low on receive
-	 * credits
-	 */
-	if (atomic_read(&info->receive_credits) <
-		info->receive_credit_target - 1)
-		queue_delayed_work(
-			info->workqueue, &info->send_immediate_work, 0);
-}
-
 static void smbd_post_send_credits(struct work_struct *work)
 {
 	int ret = 0;
@@ -450,8 +429,16 @@ static void smbd_post_send_credits(struct work_struct *work)
 	info->new_credits_offered += ret;
 	spin_unlock(&info->lock_new_credits_offered);
 
-	/* Check if we can post new receive and grant credits to peer */
-	check_and_send_immediate(info);
+	/* Promptly send an immediate packet as defined in [MS-SMBD] 3.1.1.1 */
+	info->send_immediate = true;
+	if (atomic_read(&info->receive_credits) <
+		info->receive_credit_target - 1) {
+		if (info->keep_alive_requested == KEEP_ALIVE_PENDING ||
+		    info->send_immediate) {
+			log_keep_alive(INFO, "send an empty message\n");
+			smbd_post_send_empty(info);
+		}
+	}
 }
 
 /* Called from softirq, when recv is done */
@@ -546,12 +533,6 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			info->keep_alive_requested = KEEP_ALIVE_PENDING;
 		}
 
-		/*
-		 * Check if we need to send something to remote peer to
-		 * grant more credits or respond to KEEP_ALIVE packet
-		 */
-		check_and_send_immediate(info);
-
 		return;
 
 	default:
@@ -1292,25 +1273,6 @@ static void destroy_receive_buffers(struct smbd_connection *info)
 		mempool_free(response, info->response_mempool);
 }
 
-/*
- * Check and send an immediate or keep alive packet
- * The condition to send those packets are defined in [MS-SMBD] 3.1.1.1
- * Connection.KeepaliveRequested and Connection.SendImmediate
- * The idea is to extend credits to server as soon as it becomes available
- */
-static void send_immediate_work(struct work_struct *work)
-{
-	struct smbd_connection *info = container_of(
-					work, struct smbd_connection,
-					send_immediate_work.work);
-
-	if (info->keep_alive_requested == KEEP_ALIVE_PENDING ||
-	    info->send_immediate) {
-		log_keep_alive(INFO, "send an empty message\n");
-		smbd_post_send_empty(info);
-	}
-}
-
 /* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
 static void idle_connection_timer(struct work_struct *work)
 {
@@ -1365,8 +1327,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	log_rdma_event(INFO, "cancelling idle timer\n");
 	cancel_delayed_work_sync(&info->idle_timer_work);
-	log_rdma_event(INFO, "cancelling send immediate work\n");
-	cancel_delayed_work_sync(&info->send_immediate_work);
 
 	log_rdma_event(INFO, "wait for all send posted to IB to finish\n");
 	wait_event(info->wait_send_pending,
@@ -1700,7 +1660,6 @@ static struct smbd_connection *_smbd_get_connection(
 
 	init_waitqueue_head(&info->wait_send_queue);
 	INIT_DELAYED_WORK(&info->idle_timer_work, idle_connection_timer);
-	INIT_DELAYED_WORK(&info->send_immediate_work, send_immediate_work);
 	queue_delayed_work(info->workqueue, &info->idle_timer_work,
 		info->keep_alive_interval*HZ);
 
diff --git a/fs/cifs/smbdirect.h b/fs/cifs/smbdirect.h
index 07c8f5638c39..a87fca82a796 100644
--- a/fs/cifs/smbdirect.h
+++ b/fs/cifs/smbdirect.h
@@ -153,7 +153,6 @@ struct smbd_connection {
 
 	struct workqueue_struct *workqueue;
 	struct delayed_work idle_timer_work;
-	struct delayed_work send_immediate_work;
 
 	/* Memory pool for preallocating buffers */
 	/* request pool for RDMA send */
-- 
2.17.1


