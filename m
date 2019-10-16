Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE5D9C4F
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sUUcSC83PEh9XnoXq1c/QwoVpW+DLqUxNnS3yQphdiE=; b=QSDI2tqi+76C0Ug+s4D7Qbc7Fy
	wVyEP3yPP5l/rGBtaqJYHYAEZ0HH/rwNDoBgxxSSmHfijocHgGg7Xhzjvv2stu7IhPYfXcH3ehU55
	lxZOQuCa0dkLFBZiMttG0atUvSzQCOBD+IXj9KN3QQ4udle6YY2l/+M6oh5jcES7qpBiBapK+VFdy
	pFuZgis3het1MmjM88u5JQL9vxJVNDffAqHv3ILUkMyCVK9k74jnVuqkn9l42ksP/9GwVRNqvZpPC
	MoVasOx8ruwjn2x2Fv3GnCVIh+NnLULk5boipBr95AjhNP1quo5GEvJzARBCal0Cyq1VDzcvtwZ1A
	JsZwGgXQ==;
Received: from localhost ([::1]:45574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqZ1-004PSh-7p; Wed, 16 Oct 2019 21:10:35 +0000
Received: from [13.77.154.182] (port=37602 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYm-004PN0-G0
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:25 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id CA92920B711B; Wed, 16 Oct 2019 13:52:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CA92920B711B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259139;
 bh=sUUcSC83PEh9XnoXq1c/QwoVpW+DLqUxNnS3yQphdiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=olaFMTd7pK7xQmBODB3EmL9Qy8tc7oqsQdmNfteF01rhgWyf9gYTi4A8wzO+L/FEm
 xlbRnr7e/fhRJJtgfFH6dwA4yzAlUKt5plWDvpkpJsL8UkB+wtPz67jziIYaWSX7Df
 MSKG35MU3dTlpzjXE0zbdvY7jYfDTx4z+cFJfT8Y=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] cifs: smbd: Invalidate and deregister memory registration
 on re-send
Date: Wed, 16 Oct 2019 13:51:51 -0700
Message-Id: <1571259116-102015-3-git-send-email-longli@linuxonhyperv.com>
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

On re-send, there might be a reconnect and all prevoius memory registrations
need to be invalidated and deregistered.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/file.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 4b95700c507c..3c4e01e56798 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -2747,9 +2747,17 @@ cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 		if (!rc) {
 			if (wdata->cfile->invalidHandle)
 				rc = -EAGAIN;
-			else
+			else {
+#ifdef CONFIG_CIFS_SMB_DIRECT
+				if (wdata->mr) {
+					wdata->mr->need_invalidate = true;
+					smbd_deregister_mr(wdata->mr);
+					wdata->mr = NULL;
+				}
+#endif
 				rc = server->ops->async_writev(wdata,
 					cifs_uncached_writedata_release);
+			}
 		}
 
 		/* If the write was successfully sent, we are done */
@@ -3472,7 +3480,14 @@ static int cifs_resend_rdata(struct cifs_readdata *rdata,
 		if (!rc) {
 			if (rdata->cfile->invalidHandle)
 				rc = -EAGAIN;
-			else
+			else {
+#ifdef CONFIG_CIFS_SMB_DIRECT
+				if (rdata->mr) {
+					rdata->mr->need_invalidate = true;
+					smbd_deregister_mr(rdata->mr);
+					rdata->mr = NULL;
+				}
+#endif
 				rc = server->ops->async_readv(rdata);
 		}
 
-- 
2.17.1


