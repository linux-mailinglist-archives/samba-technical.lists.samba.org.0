Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ECD2DD001
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 12:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kbJZufEf+37h3Q7xTd8U457y6fbtVdHtGav3N2x+XoM=; b=zyZkbLtzreYsT4xNLESgzl26f7
	L5iL7EVehUjU7gYxfaZJ8UTdUuWKqjJQ6upgRYDmKsQvZQHXHiLMSFJpkxYUF54RsBhiw6CWFxc7N
	/23yQQBiJGph3mfWobv3EIYQodeazJrDY7HBwGETwqOoJgG2YxLlyTAgFUainpRONvcPP5bJ6hhrl
	4umOPpBVfKEGIPQ0koExc7nOcmY6+LU0gIRfxPtGXPWRdBtWxWUhT0duXl8VX86ny8jVk+s3RbtWx
	ZtudCIZOsj/uL4RrwFeIAMGSp7aFQsUBXQLHhn/Z10bBjgrTyAv5OTRyrEb0RW7Cfg7xCxQjJdnDy
	7rnTF0Wg==;
Received: from ip6-localhost ([::1]:62034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpr4l-001n52-3y; Thu, 17 Dec 2020 11:04:03 +0000
Received: from aserp2130.oracle.com ([141.146.126.79]:56538) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpr4f-001n4u-Uc
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 11:04:00 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHAxxui141614;
 Thu, 17 Dec 2020 11:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=kbJZufEf+37h3Q7xTd8U457y6fbtVdHtGav3N2x+XoM=;
 b=zYVWqJoFApz4h98yLTYLZk0w7RTBENLGrmj1Jard5MD1K0lL96rEpB1aUVuHVfywW1LH
 78Cw07DS3m1p0+ysTkUJSPXxP35pAagTcl3Ped5Ts5sH970LUngfyR7VbuTak+dKbyeu
 VSnBSXQVt39oWK2PpM/xhrC6BIf/WsSePQWci2Oatq/H/92XSJJoCU7cJ1d9PvplbjjO
 n42H7lMLjNyU9OWK1jzRqxq7enX+fH7kfrBt/nGtgXHo/Q62n4J5o35K19KJnYlUlQLl
 PMAHv0DVP9AgAUl1blDJqItNq2JVgU1m+udHf8/PC01hXMCPTi6QYz9xM4/52OVretrb cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35ckcbn0fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 11:03:43 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHB1DvF128849;
 Thu, 17 Dec 2020 11:03:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 35e6et51m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:03:43 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BHB3g70012344;
 Thu, 17 Dec 2020 11:03:42 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 03:03:41 -0800
Date: Thu, 17 Dec 2020 14:03:35 +0300
To: Steve French <sfrench@samba.org>, Samuel Cabrero <scabrero@suse.de>
Subject: [PATCH 3/3] cifs: Re-indent cifs_swn_reconnect()
Message-ID: <X9s7By4IDIcG4D+w@mwanda>
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
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This code is slightly nicer if we flip the cifs_sockaddr_equal()
around and pull all the code in one tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 64 ++++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index 91163d3cf8b7..d35f599aa00e 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -484,41 +484,43 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
 
 	/* Store the reconnect address */
 	mutex_lock(&tcon->ses->server->srv_mutex);
-	if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
-		ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
-				&tcon->ses->server->swn_dstaddr);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
-			goto unlock;
-		}
-		tcon->ses->server->use_swn_dstaddr = true;
+	if (cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr))
+		goto unlock;
 
-		/*
-		 * Unregister to stop receiving notifications for the old IP address.
-		 */
-		ret = cifs_swn_unregister(tcon);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
-					__func__, ret);
-			goto unlock;
-		}
+	ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
+				      &tcon->ses->server->swn_dstaddr);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
+		goto unlock;
+	}
+	tcon->ses->server->use_swn_dstaddr = true;
 
-		/*
-		 * And register to receive notifications for the new IP address now that we have
-		 * stored the new address.
-		 */
-		ret = cifs_swn_register(tcon);
-		if (ret < 0) {
-			cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
-					__func__, ret);
-			goto unlock;
-		}
+	/*
+	 * Unregister to stop receiving notifications for the old IP address.
+	 */
+	ret = cifs_swn_unregister(tcon);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
+			 __func__, ret);
+		goto unlock;
+	}
 
-		spin_lock(&GlobalMid_Lock);
-		if (tcon->ses->server->tcpStatus != CifsExiting)
-			tcon->ses->server->tcpStatus = CifsNeedReconnect;
-		spin_unlock(&GlobalMid_Lock);
+	/*
+	 * And register to receive notifications for the new IP address now that we have
+	 * stored the new address.
+	 */
+	ret = cifs_swn_register(tcon);
+	if (ret < 0) {
+		cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
+			 __func__, ret);
+		goto unlock;
 	}
+
+	spin_lock(&GlobalMid_Lock);
+	if (tcon->ses->server->tcpStatus != CifsExiting)
+		tcon->ses->server->tcpStatus = CifsNeedReconnect;
+	spin_unlock(&GlobalMid_Lock);
+
 unlock:
 	mutex_unlock(&tcon->ses->server->srv_mutex);
 
-- 
2.29.2


