Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D803B0361
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jun 2021 13:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jF1rOE1ka1kjLVoEdkzZOcOYF8W6bwDXtgL5Olaot4A=; b=A22ov5XyD0FmWbHUwKAhbXzUeO
	dQnFL/ZW0V/gldg84mxIDgU0ShFvQbdg7gCdIFceGyrKT5cz2YMcZRr9AtDawAv1NIyXjThK2HK/0
	c1ea374d+RXeq4t1GctSPJYAEfcGQzMv58miyHu4Zjx03r92RFyjfsinLKnQ3Nzx87voqoS2krKX0
	bPgp1pAV5tmLXePPRQXWWVK6y0rG451iu2UyQiLTisET3XPD6FmAXFr2tGd1j4M+O6daMaOOrFt6i
	JQ6+47HOuXSXp2ZMd5C/YTxNxy1SLQUdFDmXYTAwDm2RLED4NuP0HRFj8rMPFMf/TklcYWhXI5H1x
	cs9pzY+Q==;
Received: from ip6-localhost ([::1]:28084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lveyb-007Z66-Fc; Tue, 22 Jun 2021 11:53:57 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54356) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lveyV-007Z5w-Sl
 for samba-technical@lists.samba.org; Tue, 22 Jun 2021 11:53:54 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MArN7T006540; Tue, 22 Jun 2021 11:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=jF1rOE1ka1kjLVoEdkzZOcOYF8W6bwDXtgL5Olaot4A=;
 b=CUJBlrdEOpr0QUI5FpUmcryvghlsP/FDWSNPhKBvmAQiPkCz6WLr0jzTxZ+LkiKkOmtq
 4q8w+KHYsiy12T/CKezt7O0eKFwINRcvG1kcQBQQcNBxxKwDRVj1lNFf5XQT8xR5MpII
 4xhjRk/U6uEERIrWRr43kAE16kF+XSJHsg/DrkhZ9ItYBtsRlNGWs6+pHggy4dOwHBpR
 fDhxRQgRLHDBk3uqTwOex3JzS6xkClFMsl6ei1BrtDWkjeOzsK3Qgwd6XsAiblXm+WDs
 N+WBjzGlE7Bn2qQn4mPYlns+butVyf8JZsychjIMzow66AKIdr1D9IAbXB/sQInQzXu6 qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39as86tjv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:00:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MAxqpD128765;
 Tue, 22 Jun 2021 11:00:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 399tbsddus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:00:09 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MB071i130710;
 Tue, 22 Jun 2021 11:00:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 399tbsddrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 11:00:07 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0121.oracle.com (8.14.4/8.14.4) with ESMTP id 15MB03Ze028573;
 Tue, 22 Jun 2021 11:00:03 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Jun 2021 04:00:02 -0700
Date: Tue, 22 Jun 2021 13:59:55 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH] cifs: fix NULL dereference in smb2_check_message()
Message-ID: <YNHCq6N9bAODxvnp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: BUXnIuDvwyeI93WAyjRGSm8xWtyvsCAH
X-Proofpoint-GUID: BUXnIuDvwyeI93WAyjRGSm8xWtyvsCAH
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
 Baokun Li <libaokun1@huawei.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This code sets "ses" to NULL which will lead to a NULL dereference on
the second iteration through the loop.

Fixes: 85346c17e425 ("cifs: convert list_for_each to entry variant in smb2misc.c")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/smb2misc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
index c6bb2ea1983b..668f77108831 100644
--- a/fs/cifs/smb2misc.c
+++ b/fs/cifs/smb2misc.c
@@ -158,11 +158,10 @@ smb2_check_message(char *buf, unsigned int len, struct TCP_Server_Info *srvr)
 		list_for_each_entry(ses, &srvr->smb_ses_list, smb_ses_list) {
 			if (ses->Suid == thdr->SessionId)
 				break;
-
-			ses = NULL;
 		}
 		spin_unlock(&cifs_tcp_ses_lock);
-		if (ses == NULL) {
+		if (list_entry_is_head(ses, &srvr->smb_ses_list,
+				       smb_ses_list)) {
 			cifs_dbg(VFS, "no decryption - session id not found\n");
 			return 1;
 		}
-- 
2.30.2


