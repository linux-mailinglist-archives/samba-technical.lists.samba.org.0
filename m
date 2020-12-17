Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D32DD004
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 12:04:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xRC4jVpHdxLQkf9px8Ti9VtraTS7I2ccryuXWmBV4hI=; b=zCoTMpADPblAlAw/oGt4BX6dHk
	LyyofZ4ZbtETkK6R/xfX7vW12eMLs6bvhVVdFlg1cUBujf3gXL4ETaPVUI1lzTsFDmuFipl7WBB1o
	RUQyT+BM+MW7DFT0v2LZ9jzDgUADi1VSvVjwTBFe63v2bUbj8WAzVUMYAlixiE79Gj3+ZwmdJX1hX
	WSyW6qIMBlTKz+T3a7eA1I7Z5DmmJaeHo+QRjWqXDEY0K8YXDQ3pUsUx7ghdywg4s6awVIXG0r3b9
	ocUP5mCRZQqtungWOWfJWmG0NVaGZGyuDCZrV4ZvKpw5U9wfFfvlCKGkfwXm6nWP1aKRp+Gb8JUoP
	6VuFI2LQ==;
Received: from ip6-localhost ([::1]:62736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpr5T-001nAr-P6; Thu, 17 Dec 2020 11:04:47 +0000
Received: from aserp2130.oracle.com ([141.146.126.79]:57262) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpr5O-001nAi-0b
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 11:04:44 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHAxjR4141451;
 Thu, 17 Dec 2020 11:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=xRC4jVpHdxLQkf9px8Ti9VtraTS7I2ccryuXWmBV4hI=;
 b=Q7KZBjLSWNaOJ/eIA8D/iEn0ds94UUcc0rK0QW2ZDl1fdVl6lQ39lZ22pDu6V8sxwRwW
 yJVKARUBnaF+kEMtSyvoqWll6N0xvRmdZHrqsHApcEYycvqnXM047cLro3FbZKpC8P4W
 XNANQ47uHXrpKXEE9/xWSafsOJhZdAL4Zht0TdGACPP+6t3Xq40Dww+wj3Qpt5uP5uln
 8UO/Xu4dI8aV+eTN8rI19p22AMCzIlAFBxcQLhJkyVdSDGuYor5VIgJHQOFMw/ppHZMp
 EX5fLdfdQGg80MoW1/uBtq3mcOX/XNAdvPNsHrzRNDfbZlQ2bW2qDMmE8vAOussd89Ix 4w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35ckcbn0jk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 11:04:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHB1Flo096292;
 Thu, 17 Dec 2020 11:02:36 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35g3redt8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:02:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BHB2ZE4011866;
 Thu, 17 Dec 2020 11:02:35 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 03:02:35 -0800
Date: Thu, 17 Dec 2020 14:02:29 +0300
To: Steve French <sfrench@samba.org>, Samuel Cabrero <scabrero@suse.de>
Subject: [PATCH 2/2] cifs: Unlock on errors in cifs_swn_reconnect()
Message-ID: <X9s6xZZISL/SRoZm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9s6nGDLt4xreaYN@mwanda>
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
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There are three error paths which need to unlock before returning.

Fixes: 121d947d4fe1 ("cifs: Handle witness client move notification")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index b2ef082d6438..91163d3cf8b7 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -480,16 +480,16 @@ static int cifs_swn_store_swn_addr(const struct sockaddr_storage *new,
 
 static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *addr)
 {
+	int ret = 0;
+
 	/* Store the reconnect address */
 	mutex_lock(&tcon->ses->server->srv_mutex);
 	if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
-		int ret;
-
 		ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
 				&tcon->ses->server->swn_dstaddr);
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
-			return ret;
+			goto unlock;
 		}
 		tcon->ses->server->use_swn_dstaddr = true;
 
@@ -500,7 +500,7 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
 					__func__, ret);
-			return ret;
+			goto unlock;
 		}
 
 		/*
@@ -511,7 +511,7 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 		if (ret < 0) {
 			cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
 					__func__, ret);
-			return ret;
+			goto unlock;
 		}
 
 		spin_lock(&GlobalMid_Lock);
@@ -519,9 +519,10 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 			tcon->ses->server->tcpStatus = CifsNeedReconnect;
 		spin_unlock(&GlobalMid_Lock);
 	}
+unlock:
 	mutex_unlock(&tcon->ses->server->srv_mutex);
 
-	return 0;
+	return ret;
 }
 
 static int cifs_swn_client_move(struct cifs_swn_reg *swnreg, struct sockaddr_storage *addr)
-- 
2.29.2


