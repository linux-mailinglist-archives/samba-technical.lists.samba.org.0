Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A73FBD9C4A
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5FICGste6jToJaBBTX9BeJ88MaaNvL9+/uQnD2Xs5i0=; b=vd5DY+dgSv3n1TUSnrhzsEIgM2
	CjKZXwz+2WMELYW/J1Wv7dVOF0ecwHowDK2mh9vWKXQ1z1F9lI4jFi+jUY/5CpHdW8g+wCcs1DST9
	UaPph8Vi85ZtEKDSFBoqPE77g7Lv4wSMSjQoDEtJReG8QWr9E/GC5p1rfS7WYJ84XZ0M53b9WQJYO
	gcZkZ7ZWbzXxwfy4wY6f5d2gji6FiH+Jo5OV5YQ+DkN4izpgvrKkkjmuYI9CfTsNocYWmKj+bxqmp
	yfXx8rwlC2iz8SaZ2omX96PGIKt0HDZOyWJ2cqOGUUpBTD4F0JZXxwcLdCZufEt20ksq5QJNPkbKz
	KPK9D+fg==;
Received: from localhost ([::1]:45148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYv-004POW-9A; Wed, 16 Oct 2019 21:10:29 +0000
Received: from [13.77.154.182] (port=37532 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYf-004PMd-CQ
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:17 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 2608C20B711E; Wed, 16 Oct 2019 13:52:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2608C20B711E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259154;
 bh=5FICGste6jToJaBBTX9BeJ88MaaNvL9+/uQnD2Xs5i0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=javdQhW7M6QQqLxECCB4aG4rwSEvYr7aXdN2IxS3niWxp73wOWOhPHG8LTKnE/LFP
 sNRup78L8b7k6jN1r20mtSW9icuT+KeHIWnXVTgu/CuaGXasiELvGsQwSM9BrKCuiM
 qAeIGALM3yaduZB1I877V3w8qi/3j1eNnebendsE=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] cifs: smbd: Return -ECONNABORTED when trasnport is not in
 connected state
Date: Wed, 16 Oct 2019 13:51:54 -0700
Message-Id: <1571259116-102015-6-git-send-email-longli@linuxonhyperv.com>
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

The transport should return this error so the upper layer will reconnect.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 227ef51c0712..cf001f10d555 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -1970,7 +1970,7 @@ static int smbd_recv_buf(struct smbd_connection *info, char *buf,
 
 	if (info->transport_status != SMBD_CONNECTED) {
 		log_read(ERR, "disconnected\n");
-		return 0;
+		return -ECONNABORTED;
 	}
 
 	goto again;
-- 
2.17.1


