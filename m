Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 682372D97C3
	for <lists+samba-technical@lfdr.de>; Mon, 14 Dec 2020 12:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UuekPZIlBB8apOvaVN0thQDKnr9CjPtIATVlLQNcSv8=; b=318MBvZ/vukmwC+ANS41wDKFCf
	q1dUoJOzz6sPjpH+bfY1w+T0cyb0Y6vwskN2wKa/kWy9eHwE4nFete4HoDYQdeFWl/HuhIYrtzT+r
	pRnz7N7OrnaRNxCMFTWSasLmarPdgOoCP84qYAtx3nVzf8O3iBO1Kwh4aTf29R1djZnP5qd9dAVTS
	UN57f9FeexOeMDqmHe2TbmyYW72P7d5EcOzDby1Wb/Z6PsLTlIxxEwIxwHgGaUcP6PpreqGI24S7Z
	zXjWabizJMBIZ6vqWG2vu1YTbRutdLj6ttfF09sTv4c6GYql3iV3etSzy1KzVk66I3jrLeTMK4q4Y
	Y5Nz0jyQ==;
Received: from ip6-localhost ([::1]:43084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1komUo-0011Y4-RP; Mon, 14 Dec 2020 11:58:30 +0000
Received: from aserp2130.oracle.com ([141.146.126.79]:44992) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1komUj-0011Xx-6C
 for samba-technical@lists.samba.org; Mon, 14 Dec 2020 11:58:27 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBngC7194587;
 Mon, 14 Dec 2020 11:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=UuekPZIlBB8apOvaVN0thQDKnr9CjPtIATVlLQNcSv8=;
 b=g3P4f8Sa81Ivf45JnH6VLLhfb6lfhala6q9dpheZErdk1arZ0btf7pmKDXTTmfu1+jgX
 JabIN4Nhzuv+ZqvusF3c+jM0L5y7hGu4G9RnScG1zmjuibYSEi6cTlmU/rk71GHAG2sX
 9egICkRGUkZ1+BLAx9bQq9StZ1I+eqrR4qeCnDxpdaeQvmQQY4TU/lkr2vFodC1V+dLD
 HTpid23cq167cfDO0Dmq3gPtH/c83cluve8pebYv6X/V/W82AOZpTEnRBZGUzPdx/keY
 fNP7uiS1RJBwJWojIQS9FgmeKeCnYqagYINaUmGFu7MowrdcOMM4uEO47rVVLS5VJGBo Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcb4xab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 11:58:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BEBt4go191900;
 Mon, 14 Dec 2020 11:56:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35e6jpabr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 11:56:16 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BEBuCl7012797;
 Mon, 14 Dec 2020 11:56:12 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Dec 2020 03:56:11 -0800
Date: Mon, 14 Dec 2020 14:56:04 +0300
To: Steve French <sfrench@samba.org>, Shyam Prasad N <sprasad@microsoft.com>
Subject: [PATCH] cifs: Fix uninitialized variable in set_chmod_dacl()
Message-ID: <X9dS1EllbQhuX7/C@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Initialize the "nmode" variable earlier to prevent an uninitialized
variable bug when we do "size += setup_special_mode_ACE(pntace, nmode);"

Fixes: 253374f7557e ("cifs: Fix unix perm bits to cifsacl conversion for "other" bits.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifsacl.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
index d7a6d0f533bf..8410db328e5e 100644
--- a/fs/cifs/cifsacl.c
+++ b/fs/cifs/cifsacl.c
@@ -920,6 +920,13 @@ static int set_chmod_dacl(struct cifs_acl *pndacl, struct cifs_sid *pownersid,
 	__u64 deny_group_mode = 0;
 	bool sticky_set = false;
 
+	/*
+	 * We'll try to keep the mode as requested by the user.
+	 * But in cases where we cannot meaningfully convert that
+	 * into ACL, return back the updated mode, so that it is
+	 * updated in the inode.
+	 */
+	nmode = *pnmode;
 	pnndacl = (struct cifs_acl *)((char *)pndacl + sizeof(struct cifs_acl));
 
 	if (modefromsid) {
@@ -931,14 +938,6 @@ static int set_chmod_dacl(struct cifs_acl *pndacl, struct cifs_sid *pownersid,
 		goto set_size;
 	}
 
-	/*
-	 * We'll try to keep the mode as requested by the user.
-	 * But in cases where we cannot meaningfully convert that
-	 * into ACL, return back the updated mode, so that it is
-	 * updated in the inode.
-	 */
-	nmode = *pnmode;
-
 	if (!memcmp(pownersid, pgrpsid, sizeof(struct cifs_sid))) {
 		/*
 		 * Case when owner and group SIDs are the same.
-- 
2.29.2


