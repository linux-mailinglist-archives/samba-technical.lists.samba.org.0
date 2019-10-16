Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F328D9C4B
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2YV6IZfNKusYy95VZq7usZ04z/v2U6/1CdgSHm4EGRA=; b=VDm9dGlivXSmrQVrEGdjRjpIGH
	iz2wzRCDWaOiIoRAD9ue7eSd7Ld4xsZLK044VHin/I2dGK1fCIIV52Ukm+h6jrZpsxxIiK0r8uNU0
	McOvSQckPf7OgE0YhyvsR2uDuOsHcBaE+Cw+wiblB3EvpNE8aQQPl/GnfginDc8kuGiu54jb4b2g1
	Tg5DmQ8zIJUPh/0UaeJtUmpT1UXuso5EjfM1Y4ahVUo1QVTmlBh2FX303H7qdWzTf7tnLN4BlXU+m
	R/7vOVCVzN+TJg0Q7rwtJdd4nvWuCB0gmNA722Vs3rEp12V7AhOsJE+OaJjz819iYKZWwgOlcHaVI
	6k2b+row==;
Received: from localhost ([::1]:45506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYz-004PRw-QI; Wed, 16 Oct 2019 21:10:33 +0000
Received: from [13.77.154.182] (port=37598 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYm-004PMz-01
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:23 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id C7ECA20B9C00; Wed, 16 Oct 2019 13:52:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C7ECA20B9C00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259157;
 bh=2YV6IZfNKusYy95VZq7usZ04z/v2U6/1CdgSHm4EGRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=cXyWJwAm4Uz6OgM2sXS10Ye6hGGR5w1eyiWIeT7rPwwJTHzVwJG+qd4mNC+7Ud814
 KzJ6gC07S6vp4Bm/+W4jkfkbX8m95r9vceBKzhTWb/I/onq8y3up8TsogJjoPX+EJ8
 wU57KV1RgWTeVHlGlAA1k1ohjhopp93xy3wAqTf0=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] cifs: smbd: Only queue work for error recovery on memory
 registration
Date: Wed, 16 Oct 2019 13:51:55 -0700
Message-Id: <1571259116-102015-7-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
References: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
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
Cc: longli@linuxonhyperv.com, stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

It's not necessary to queue invalidated memory registration to work queue, as
all we need to do is to unmap the SG and make it usable again. This can save
CPU cycles in normal data paths as memory registration errors are rare and
normally only happens during reconnection.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/smbdirect.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index cf001f10d555..c00629a41d81 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2269,12 +2269,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
 	int rc;
 
 	list_for_each_entry(smbdirect_mr, &info->mr_list, list) {
-		if (smbdirect_mr->state == MR_INVALIDATED)
-			ib_dma_unmap_sg(
-				info->id->device, smbdirect_mr->sgl,
-				smbdirect_mr->sgl_count,
-				smbdirect_mr->dir);
-		else if (smbdirect_mr->state == MR_ERROR) {
+		if (smbdirect_mr->state == MR_ERROR) {
 
 			/* recover this MR entry */
 			rc = ib_dereg_mr(smbdirect_mr->mr);
@@ -2602,11 +2597,20 @@ int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
 		 */
 		smbdirect_mr->state = MR_INVALIDATED;
 
-	/*
-	 * Schedule the work to do MR recovery for future I/Os
-	 * MR recovery is slow and we don't want it to block the current I/O
-	 */
-	queue_work(info->workqueue, &info->mr_recovery_work);
+	if (smbdirect_mr->state == MR_INVALIDATED) {
+		ib_dma_unmap_sg(
+			info->id->device, smbdirect_mr->sgl,
+			smbdirect_mr->sgl_count,
+			smbdirect_mr->dir);
+		smbdirect_mr->state = MR_READY;
+		if (atomic_inc_return(&info->mr_ready_count) == 1)
+			wake_up_interruptible(&info->wait_mr);
+	} else
+		/*
+		 * Schedule the work to do MR recovery for future I/Os
+		 * MR recovery is slow and we don't want it to block the
+		 * current I/O */
+		queue_work(info->workqueue, &info->mr_recovery_work);
 
 done:
 	if (atomic_dec_and_test(&info->mr_used_count))
-- 
2.17.1


