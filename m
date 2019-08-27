Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 541FD9E650
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 13:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yEhxFVIGypYEpWwhL2BtlFYIjglXC32QG6ybcE2v5Xo=; b=swQTF2PDH+pn3SWxNCV6NclWwv
	UV2fo/Nhk3HkCtMTcGEhxH25eXARaHN8A2qmBKr9A/TNXhz9QEpZS+8vYmdvQGSKlusJMRQ7pI0FC
	pAwxohPT/xO3BYAGXfHIPufNdU6FRUDoqnPrxnuAg4z5narwY2perXFmJxTG2HoM0iaoPLyeDlMU7
	XzuSvuzrreBJRvYGVH9Lkfx7qFy86+BffASIx38i/EPP4WoXIAozz+3pODluE8XDcraMSBzR3PTRo
	VuEok02r1KqA9LRTx7sy3AaCdJGzOSt3tOHtvxK2kxIp04y1rVjlL4iNuZ8zN9yEuN9H+vpVYc++Y
	HF50Al1A==;
Received: from localhost ([::1]:39514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2ZEK-008gg6-2a; Tue, 27 Aug 2019 11:01:40 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:33196) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i2ZEF-008gfz-Mt
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 11:01:38 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RAxB9n055070;
 Tue, 27 Aug 2019 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=yEhxFVIGypYEpWwhL2BtlFYIjglXC32QG6ybcE2v5Xo=;
 b=fBtzmVOmT7DEV2vCBMnIhk3byKiis6f8fWzIQ6uNGyVweGHP+VPDvYVUSHXMG9rQ6teN
 BDu94qvDZ4HHhIoOVLt7r8TTM23Z5hFDqQT9MifJQDVybb68RoRPbEHzzn3u5LEXt7qw
 xOlaygX2bIULlj4ajKOkVLEXizTxkP/JCt3kbYcPAp1Tvk3u1+CuO1VMK7CRPRK71dKp
 Cef8iBjOrvcrh1RGhD1kmczL5ZD+Tcmq86Sl9H8zvEO2aVqYY16ddhn3pBdi3sDQhybY
 7hPGzYtWriY4rCb7YDCdUervDTOpgXRQCLzwp3o6Uw5PF2+IE1JF+CyMKku+YvTcyIe8 SQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2un36a011q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 11:01:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7RAw9P9080018;
 Tue, 27 Aug 2019 10:59:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2umj2yhtgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 10:59:28 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7RAxNln022225;
 Tue, 27 Aug 2019 10:59:23 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 27 Aug 2019 03:59:23 -0700
Date: Tue, 27 Aug 2019 13:59:17 +0300
To: Steve French <sfrench@samba.org>, Ronnie Sahlberg <lsahlber@redhat.com>
Subject: [PATCH] cifs: Use kzfree() to zero out the password
Message-ID: <20190827105917.GA23038@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
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

It's safer to zero out the password so that it can never be disclosed.

Fixes: 0c219f5799c7 ("cifs: set domainName when a domain-key is used in multiuser")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/connect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index e6cc5c4b0f19..642bbb5bee3a 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3101,7 +3101,7 @@ cifs_set_cifscreds(struct smb_vol *vol, struct cifs_ses *ses)
 			rc = -ENOMEM;
 			kfree(vol->username);
 			vol->username = NULL;
-			kfree(vol->password);
+			kzfree(vol->password);
 			vol->password = NULL;
 			goto out_key_put;
 		}
-- 
2.20.1


