Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553A19CBCC
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 22:42:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T7M811vVoO8LHYy+OccoE+fza63+weNdKO1rucXW+T4=; b=ws9lEQ185Tc87KPebR9gqHq0gx
	mKmWjh5m6PRGGMoSfuyK0gQi6WbfOhJe1nU7wBz9+av8j/WIKwAvX0t1oqc7uU/6/IXh8srAS6Ewi
	pUSAVPlcEq8lqB5ez51/DNIF7CzC0K3mIQL+NOXzgcc73K0C0YQW7JVhBB0ADHpC0QnGsB2wEJDaa
	p9uJXAdCuju9ohK3ejT7/zwT15jmqo4Im9rqwqIzlNGFzBYEf3oKav0+RL6IsXWvXQdN2N7Ux5Ye9
	4ovBodMKUIoGYOaQRcXpDzFXDy+uJUEku/HksyONkpMrQuxyejOzNoNYd275uKS1pwDjgopD0A5YF
	OaKZ3TVg==;
Received: from localhost ([::1]:33348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jK6fO-0039BE-B4; Thu, 02 Apr 2020 20:42:22 +0000
Received: from [13.77.154.182] (port=53292 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jK6fJ-0039B7-4X
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 20:42:19 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 04F1620B46F0; Thu,  2 Apr 2020 13:42:10 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 04F1620B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585860130;
 bh=T7M811vVoO8LHYy+OccoE+fza63+weNdKO1rucXW+T4=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=F3CHGz/rYb1cNT869Csn98lvD2yLrx7hJ8tKWAjWcZtzOy8+NhsYkI52KR413hW/Q
 MLYPu5KzCG6P/hwB+UFpdVxVXYTLtsvrqb8zKZNYuW2Jl1PAL7TyKWGSvB03RcKpsv
 peb8i9FKM1vutcerJsv4Y6rJzGKVNJvFpcOPqGoc=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [Patch v2] cifs: smbd: Update receive credits before sending and deal
 with credits roll back on failure before sending
Date: Thu,  2 Apr 2020 13:42:06 -0700
Message-Id: <1585860126-72170-1-git-send-email-longli@linuxonhyperv.com>
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

Recevie credits should be updated before sending the packet, not
before a work is scheduled. Also, the value needs roll back if
something fails and cannot send.

Signed-off-by: Long Li <longli@microsoft.com>
Reported-by: kbuild test robot <lkp@intel.com>
---

change in v2: fixed sparse errors reported by kbuild test robot

 fs/cifs/smbdirect.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index c7ef2d7ce0ef..fa52bf3e0236 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -450,8 +450,6 @@ static void smbd_post_send_credits(struct work_struct *work)
 	info->new_credits_offered += ret;
 	spin_unlock(&info->lock_new_credits_offered);
 
-	atomic_add(ret, &info->receive_credits);
-
 	/* Check if we can post new receive and grant credits to peer */
 	check_and_send_immediate(info);
 }
@@ -822,6 +820,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	struct smbd_request *request;
 	struct smbd_data_transfer *packet;
 	int header_length;
+	int new_credits;
 	int rc;
 
 	/* Wait for send credits. A SMBD packet needs one credit */
@@ -840,7 +839,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
-		goto err;
+		goto err_alloc;
 	}
 
 	request->info = info;
@@ -848,8 +847,11 @@ static int smbd_create_header(struct smbd_connection *info,
 	/* Fill in the packet header */
 	packet = smbd_request_payload(request);
 	packet->credits_requested = cpu_to_le16(info->send_credit_target);
-	packet->credits_granted =
-		cpu_to_le16(manage_credits_prior_sending(info));
+
+	new_credits = manage_credits_prior_sending(info);
+	atomic_add(new_credits, &info->receive_credits);
+	packet->credits_granted = cpu_to_le16(new_credits);
+
 	info->send_immediate = false;
 
 	packet->flags = 0;
@@ -887,7 +889,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	if (ib_dma_mapping_error(info->id->device, request->sge[0].addr)) {
 		mempool_free(request, info->request_mempool);
 		rc = -EIO;
-		goto err;
+		goto err_dma;
 	}
 
 	request->sge[0].length = header_length;
@@ -896,8 +898,17 @@ static int smbd_create_header(struct smbd_connection *info,
 	*request_out = request;
 	return 0;
 
-err:
+err_dma:
+	/* roll back receive credits */
+	spin_lock(&info->lock_new_credits_offered);
+	info->new_credits_offered += new_credits;
+	spin_unlock(&info->lock_new_credits_offered);
+	atomic_sub(new_credits, &info->receive_credits);
+
+err_alloc:
+	/* roll back send credits */
 	atomic_inc(&info->send_credits);
+
 	return rc;
 }
 
-- 
2.17.1


