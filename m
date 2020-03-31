Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDC198CD3
	for <lists+samba-technical@lfdr.de>; Tue, 31 Mar 2020 09:19:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Zh/cLcI+Ah3wcuYsIdpQ01rlvOu5+wS8MBqhfVdQiOU=; b=gNLYA/KHoKuxSByELc91dFkhnv
	BWyLrzvscpna32D4cwqXLJEUlN/q/Xckehs3nIIdXjbSewyrwd78mk9T+J0ijNrRKWTYkCnGfpEPY
	4UP2qCdMeIolPXUsdqYduA34EzF5CMDpsbXaQuow3zikLjPgCEYOXF70cKxoyOLwfHGzdx3RgbQDQ
	rqdb+s8yeuCNr5IYcLtya9iDNSzHcsarnDfMSppekGFk1k6jeFg/WQvaMnuASNR7FNyQ5aoVg2veW
	Q0NwdVGRJfsI+2633mLO2MmfuzO2yB/0A50V2wtO04bQ0Ks79+eA0MiMO2xWBqui1yJUgzsJi5G6c
	Tbl7Y8yw==;
Received: from localhost ([::1]:47956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJBAd-0014cm-Hv; Tue, 31 Mar 2020 07:18:47 +0000
Received: from [13.77.154.182] (port=60700 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jJBAL-0014cF-F3
 for samba-technical@lists.samba.org; Tue, 31 Mar 2020 07:18:32 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 74EC520B46F0; Tue, 31 Mar 2020 00:18:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 74EC520B46F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585639104;
 bh=Zh/cLcI+Ah3wcuYsIdpQ01rlvOu5+wS8MBqhfVdQiOU=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=rMSDw//jQGt+IvEV719WbBHeCl6MGjNajTHyFvacQFtTY/DT9pxa2zKdgFcSYWGZe
 n/k3RKEQjEGghDm8r4kt3bS7kywxAXjsM2h9ThIFMnHaY2GKaZRYnzf2zyXA3w3/8H
 g3Mjy6gf1Jso3yxSLm1ri6gj53hdeWhjeO1hVHCE=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: smbd: Update receive credits before sending and deal
 with credits roll back on failure before sending
Date: Tue, 31 Mar 2020 00:18:21 -0700
Message-Id: <1585639101-117035-1-git-send-email-longli@linuxonhyperv.com>
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
---
 fs/cifs/smbdirect.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index c7ef2d7ce0ef..bdae6d41748c 100644
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
@@ -840,7 +838,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
-		goto err;
+		goto err_alloc;
 	}
 
 	request->info = info;
@@ -851,6 +849,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	packet->credits_granted =
 		cpu_to_le16(manage_credits_prior_sending(info));
 	info->send_immediate = false;
+	atomic_add(packet->credits_granted, &info->receive_credits);
 
 	packet->flags = 0;
 	if (manage_keep_alive_before_sending(info))
@@ -887,7 +886,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	if (ib_dma_mapping_error(info->id->device, request->sge[0].addr)) {
 		mempool_free(request, info->request_mempool);
 		rc = -EIO;
-		goto err;
+		goto err_dma;
 	}
 
 	request->sge[0].length = header_length;
@@ -896,8 +895,17 @@ static int smbd_create_header(struct smbd_connection *info,
 	*request_out = request;
 	return 0;
 
-err:
+err_dma:
+	/* roll back receive credits */
+	spin_lock(&info->lock_new_credits_offered);
+	info->new_credits_offered += packet->credits_granted;
+	spin_unlock(&info->lock_new_credits_offered);
+	atomic_sub(packet->credits_granted, &info->receive_credits);
+
+err_alloc:
+	/* roll back send credits */
 	atomic_inc(&info->send_credits);
+
 	return rc;
 }
 
-- 
2.17.1


