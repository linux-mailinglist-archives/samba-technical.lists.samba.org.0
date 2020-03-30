Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 080821982EE
	for <lists+samba-technical@lfdr.de>; Mon, 30 Mar 2020 20:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=f6uuZ8AQmEmQPNxvCDcaE9ajAQMzpT8US7URBUmbX+0=; b=S0/fG9gbb05Hpvgl/25Zd0SiY5
	LQ/BL1KDkn07MUM5eJKeQecPLwdBvVP4Sij3zBZsS9bcx5WrKf3/VYbPmUFq4nMEv7jj8W707m5IX
	mODlOyrbEj1pgAQi6sT0vrJNmR2TUnXkWvFQJyJ3tZ2P4sIf2+bgI2xtR8PKGpubgPfnuJwRXqmYW
	Oe92M+iifU1MWxe1lKj9orkZgKLwRQooSKnw0kdUVYT4mAHFpkJ5n8wGlM/w3IISzMoQcOSnwPuyv
	Z4jgBKwuCVT1QrTr5ZapU5cs1h96hpiEi6JdQiUdht1idqHn0CJSA6TUQr0RhV+S4/O5CThbq74eL
	+hAgwqzA==;
Received: from localhost ([::1]:40488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIylu-0012a5-N3; Mon, 30 Mar 2020 18:04:26 +0000
Received: from [13.77.154.182] (port=33234 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jIylp-0012ZY-9X
 for samba-technical@lists.samba.org; Mon, 30 Mar 2020 18:04:23 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 6B38020B46F0; Mon, 30 Mar 2020 11:04:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B38020B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585591457;
 bh=f6uuZ8AQmEmQPNxvCDcaE9ajAQMzpT8US7URBUmbX+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=OJ2fuHRDWI1KPvCxE2Rjw286mDUXEhZI+eImjVbM2bUtOENhxgueC+bFCcAF3CaVC
 5HjEOZo7M5UdrYfaxfntwnfeeQTekV4fLCxlMFWxKLaqx1JSB2d6pLS1udk5QncUSi
 QBNr6NXbXfer42QDESpKDpRZgx4CXIfiJ0mxn6fc=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] cifs: smbd: Check send queue size before posting a send
Date: Mon, 30 Mar 2020 11:04:07 -0700
Message-Id: <1585591447-11741-2-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585591447-11741-1-git-send-email-longli@linuxonhyperv.com>
References: <1585591447-11741-1-git-send-email-longli@linuxonhyperv.com>
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

Sometimes the remote peer may return more send credits than the send queue
depth. If all the send credits are used to post senasd, we may overflow the
send queue.

Fix this by checking the send queue size before posting a send.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/smbdirect.c | 11 ++++++++++-
 fs/cifs/smbdirect.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 79d8dcbd0034..c7ef2d7ce0ef 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -287,6 +287,7 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	if (atomic_dec_and_test(&request->info->send_pending))
 		wake_up(&request->info->wait_send_pending);
 
+	wake_up(&request->info->wait_post_send);
 
 	mempool_free(request, request->info->request_mempool);
 }
@@ -939,7 +940,14 @@ static int smbd_post_send(struct smbd_connection *info,
 	send_wr.opcode = IB_WR_SEND;
 	send_wr.send_flags = IB_SEND_SIGNALED;
 
-	atomic_inc(&info->send_pending);
+wait_sq:
+	wait_event(info->wait_post_send,
+		atomic_read(&info->send_pending) < info->send_credit_target);
+	if (unlikely(atomic_inc_return(&info->send_pending) >
+				info->send_credit_target)) {
+		atomic_dec(&info->send_pending);
+		goto wait_sq;
+	}
 
 	rc = ib_post_send(info->id->qp, &send_wr, NULL);
 	if (rc) {
@@ -1733,6 +1741,7 @@ static struct smbd_connection *_smbd_get_connection(
 	init_waitqueue_head(&info->wait_send_pending);
 	atomic_set(&info->send_pending, 0);
 
+	init_waitqueue_head(&info->wait_post_send);
 
 	INIT_WORK(&info->disconnect_work, smbd_disconnect_rdma_work);
 	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
diff --git a/fs/cifs/smbdirect.h b/fs/cifs/smbdirect.h
index f70c7119a456..07c8f5638c39 100644
--- a/fs/cifs/smbdirect.h
+++ b/fs/cifs/smbdirect.h
@@ -114,6 +114,7 @@ struct smbd_connection {
 	/* Activity accoutning */
 	atomic_t send_pending;
 	wait_queue_head_t wait_send_pending;
+	wait_queue_head_t wait_post_send;
 
 	/* Receive queue */
 	struct list_head receive_queue;
-- 
2.17.1


