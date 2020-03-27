Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E519504A
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 06:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=c3ND34NUf+2yNKP0PiQr6f2Y1vNjYTmfNJSufeGHUkk=; b=GEWUGjJ1g0VHtt4K0J/1aliSap
	A1B8MKDlpXIdvUF5qDIT95fw6MuN9okgQfKjMx4XgbZO5lwBdOSfcQuGJ4C6UfD4afWU9jbXw+t8w
	gFKbgc5Cw6CTwdCCHle+XZZ9k438KMENTI51sPqaUmsg1gTojrs/8a157Q8iZJuDxs3AYuGYKzzYB
	XHVuwuPYBiJxfHu2Mm94b9soC31+sVHSueYoeLnt+ykgY/eKLPUcv0JemNyVUFo3gVYBLGOsxbvgw
	zhCzVetnaCi93MRxuwgJKB09baji1zjGfNcrq5JpMWdkq+FEW/lbjLL/syVdXUyU6ASTRuaoXE8qg
	CZm2v6+A==;
Received: from localhost ([::1]:37552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHhFT-000pQn-DL; Fri, 27 Mar 2020 05:09:39 +0000
Received: from [13.77.154.182] (port=48796 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jHhFO-000pQg-UH
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 05:09:36 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 0036620B4737; Thu, 26 Mar 2020 22:09:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0036620B4737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585285771;
 bh=c3ND34NUf+2yNKP0PiQr6f2Y1vNjYTmfNJSufeGHUkk=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=Gu6UK1MwiV52MPvi83ulp5crmQnPiywd4Naebw200vg6IU7k/iYLICIMuzpfAVIuU
 X1wVDMTfVtmeW7J4MGvAZ8RXvl3gC5csrtEh4EMVrAbValW82HTktq/O9y5Ip6FpBB
 NwdJ9VH9j6EdyeP6KHkH8A/GJMMl4v9xn2Jb5578=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: Allocate encryption header through kmalloc
Date: Thu, 26 Mar 2020 22:09:20 -0700
Message-Id: <1585285760-31731-1-git-send-email-longli@linuxonhyperv.com>
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

When encryption is used, smb2_transform_hdr is defined on the stack and is
passed to the transport. This doesn't work with RDMA as the buffer needs to
be DMA'ed.

Fix it by using kmalloc.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/transport.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index cb3ee916f527..c97570eb2c18 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -466,7 +466,7 @@ smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	      struct smb_rqst *rqst, int flags)
 {
 	struct kvec iov;
-	struct smb2_transform_hdr tr_hdr;
+	struct smb2_transform_hdr *tr_hdr;
 	struct smb_rqst cur_rqst[MAX_COMPOUND];
 	int rc;
 
@@ -476,28 +476,34 @@ smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	if (num_rqst > MAX_COMPOUND - 1)
 		return -ENOMEM;
 
-	memset(&cur_rqst[0], 0, sizeof(cur_rqst));
-	memset(&iov, 0, sizeof(iov));
-	memset(&tr_hdr, 0, sizeof(tr_hdr));
-
-	iov.iov_base = &tr_hdr;
-	iov.iov_len = sizeof(tr_hdr);
-	cur_rqst[0].rq_iov = &iov;
-	cur_rqst[0].rq_nvec = 1;
-
 	if (!server->ops->init_transform_rq) {
 		cifs_server_dbg(VFS, "Encryption requested but transform "
 				"callback is missing\n");
 		return -EIO;
 	}
 
+	tr_hdr = kmalloc(sizeof(*tr_hdr), GFP_NOFS);
+	if (!tr_hdr)
+		return -ENOMEM;
+
+	memset(&cur_rqst[0], 0, sizeof(cur_rqst));
+	memset(&iov, 0, sizeof(iov));
+	memset(tr_hdr, 0, sizeof(*tr_hdr));
+
+	iov.iov_base = tr_hdr;
+	iov.iov_len = sizeof(*tr_hdr);
+	cur_rqst[0].rq_iov = &iov;
+	cur_rqst[0].rq_nvec = 1;
+
 	rc = server->ops->init_transform_rq(server, num_rqst + 1,
 					    &cur_rqst[0], rqst);
 	if (rc)
-		return rc;
+		goto out;
 
 	rc = __smb_send_rqst(server, num_rqst + 1, &cur_rqst[0]);
 	smb3_free_compound_rqst(num_rqst, &cur_rqst[1]);
+out:
+	kfree(tr_hdr);
 	return rc;
 }
 
-- 
2.17.1


