Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E171950AD
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 06:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=p8YGRod+AoZSOG+yxhDi9CuAIYPiAdJpgka/fXNPphE=; b=HN4EaXmyPNK3jAeATC5LL8yXw5
	rPc75I0OBHxU5G6Mqb4YBZDAMYMtD0W7ZDrv/GcCtn0ptmLozFUSgTI7RQO1Uamj12abM7e6cthO2
	x3EyuuFffCPoaWSP3GvGVDgnpH874UDUjn2IuWE9ar9KvySkKfswbf24gMYnR9sfsXMut1pn6me1t
	7z9J0Wy2K2U73dmW8Ha0k5OwkKJlQBTA+viBVShyv/S2JfV7gjN49AZZM4TW5N3khlZf6OywVgXYQ
	QjektS+g7xhBU4PiBKz3zL9EqGRlRTo/n3/iC0lbtU/auoGmm/m5Pz7OgltuQGd1qtby84QU7y3t2
	dyhcZP6Q==;
Received: from localhost ([::1]:38308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHhcS-000pXw-Hj; Fri, 27 Mar 2020 05:33:24 +0000
Received: from [13.77.154.182] (port=57256 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jHhcM-000pXp-Tx
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 05:33:21 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 4D4D220B4737; Thu, 26 Mar 2020 22:33:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4D4D220B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585287195;
 bh=p8YGRod+AoZSOG+yxhDi9CuAIYPiAdJpgka/fXNPphE=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=Pw7xdQOgpEi/d7fkjjLUDr9c3giKGLWFJXVjlaWVukxdgRRM5roPWEdwwKWq22+FU
 QwkOue/d53Gs8nZtihhHrTZmzEB0UDl7P1b0EsLiEC1vn+76G0rAKlHgrgR3/jRE27
 dqDVJgkbwrpu/fGAG6nZT93ZUIpmrhxwdtEPzQlc=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: smbd: Check and extend sender credits in interrupt
 context
Date: Thu, 26 Mar 2020 22:33:01 -0700
Message-Id: <1585287181-35333-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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

When a RDMA packet is received and server is extending send credits, we should
check and unblock senders immediately in IRQ context. Doing it in a worker
queue causes unnecessary delay and doesn't save much CPU on the receive path.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/smbdirect.c | 38 +++++++++++++++-----------------------
 fs/cifs/smbdirect.h |  1 -
 2 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index a6ae29b3c4e7..8da43a500686 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -459,25 +459,6 @@ static void smbd_post_send_credits(struct work_struct *work)
 	check_and_send_immediate(info);
 }
 
-static void smbd_recv_done_work(struct work_struct *work)
-{
-	struct smbd_connection *info =
-		container_of(work, struct smbd_connection, recv_done_work);
-
-	/*
-	 * We may have new send credits granted from remote peer
-	 * If any sender is blcoked on lack of credets, unblock it
-	 */
-	if (atomic_read(&info->send_credits))
-		wake_up_interruptible(&info->wait_send_queue);
-
-	/*
-	 * Check if we need to send something to remote peer to
-	 * grant more credits or respond to KEEP_ALIVE packet
-	 */
-	check_and_send_immediate(info);
-}
-
 /* Called from softirq, when recv is done */
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
@@ -546,8 +527,15 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		atomic_dec(&info->receive_credits);
 		info->receive_credit_target =
 			le16_to_cpu(data_transfer->credits_requested);
-		atomic_add(le16_to_cpu(data_transfer->credits_granted),
-			&info->send_credits);
+		if (le16_to_cpu(data_transfer->credits_granted)) {
+			atomic_add(le16_to_cpu(data_transfer->credits_granted),
+				&info->send_credits);
+			/*
+			 * We have new send credits granted from remote peer
+			 * If any sender is waiting for credits, unblock it
+			 */
+			wake_up_interruptible(&info->wait_send_queue);
+		}
 
 		log_incoming(INFO, "data flags %d data_offset %d "
 			"data_length %d remaining_data_length %d\n",
@@ -563,7 +551,12 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			info->keep_alive_requested = KEEP_ALIVE_PENDING;
 		}
 
-		queue_work(info->workqueue, &info->recv_done_work);
+		/*
+		 * Check if we need to send something to remote peer to
+		 * grant more credits or respond to KEEP_ALIVE packet
+		 */
+		check_and_send_immediate(info);
+
 		return;
 
 	default:
@@ -1762,7 +1755,6 @@ static struct smbd_connection *_smbd_get_connection(
 	atomic_set(&info->send_payload_pending, 0);
 
 	INIT_WORK(&info->disconnect_work, smbd_disconnect_rdma_work);
-	INIT_WORK(&info->recv_done_work, smbd_recv_done_work);
 	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
 	info->new_credits_offered = 0;
 	spin_lock_init(&info->lock_new_credits_offered);
diff --git a/fs/cifs/smbdirect.h b/fs/cifs/smbdirect.h
index 6ff880a1e186..8ede915f2b24 100644
--- a/fs/cifs/smbdirect.h
+++ b/fs/cifs/smbdirect.h
@@ -67,7 +67,6 @@ struct smbd_connection {
 	bool negotiate_done;
 
 	struct work_struct disconnect_work;
-	struct work_struct recv_done_work;
 	struct work_struct post_send_credits_work;
 
 	spinlock_t lock_new_credits_offered;
-- 
2.17.1


