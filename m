Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C69717374C
	for <lists+samba-technical@lfdr.de>; Fri, 28 Feb 2020 13:37:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Md77iGEJECs0uv7NwYHGnJZebiY3k62ZD2KtUhej4C4=; b=DM6+r3bqD2SIGHx+kjFiu/zRmI
	mFCPOAFLqa8Vi/AWLLtSaC84OiLieYTXRiuFKpSe/05VXOdkVfKjVbaKMnY6rF/1uUgwoDvLzvYZT
	upSR1cEv6GaRoraBv1l7fKEs/l3/sn8jDH1OaNWRBmAERuYsmLnxZ2763KCSJtLf6DTarccqsX9ok
	OELDiOO2Kjn1AuUTcSKC3NHqljjg4Uy9c3g/qCXczj5owmqV3HbnBEL5df1+m7sSB+MqfQiqkHuFH
	UfGFdH40LGzSFc98iHcBk2kLNzrjRi+cBhJg550BJfplLyqejKZimxHOlab71PlM7FRQ6Fxv/KA8D
	cCxS6Zvg==;
Received: from localhost ([::1]:59068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7esg-00CGlp-Ox; Fri, 28 Feb 2020 12:36:38 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:37952) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j7esb-00CGli-9A
 for samba-technical@lists.samba.org; Fri, 28 Feb 2020 12:36:35 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01S9HVPT161260;
 Fri, 28 Feb 2020 09:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Md77iGEJECs0uv7NwYHGnJZebiY3k62ZD2KtUhej4C4=;
 b=ELt4awYNLre8W+7v4E1Uxfn6T23ghRJzUuj/zerKe0DpoZzI14XcheQSs0GTdvj/PJJ5
 FUyDQtwAc1dALrjdqGz7XaQPZ/boD6x+szGTFZ+LrHbTjFUK/nfl+U/ggX3er+XxrxPM
 ZE01NPCB8dAAAe4NkdpmGoHVT20dTst8p1yw6/oSxqnNvtGUgoPjAEGVIcWtBIcSs2Up
 UjK+UWqdcvmKMiUUySf3tck9CEr09KIG3WBWvVIo8I8crLHO8e446+cbJRMiHWxoZPVt
 1zUPcU3PbCno4xM8WS21jJmFVjCq9sx4t/R/i0tGDJDXVwiqEoBgKRW8WzR9GL0mSqgE QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ydcsnsn4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 09:23:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01S9MD1n038422;
 Fri, 28 Feb 2020 09:23:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2ydj4q8bwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 09:23:09 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01S9N61s015008;
 Fri, 28 Feb 2020 09:23:06 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 28 Feb 2020 01:23:05 -0800
Date: Fri, 28 Feb 2020 12:22:59 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH] cifs: potential unintitliazed error code in cifs_getattr()
Message-ID: <20200228092043.xoqau6ez7qxnpwc4@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
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
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Smatch complains that "rc" could be uninitialized.

    fs/cifs/inode.c:2206 cifs_getattr() error: uninitialized symbol 'rc'.

Changing it to "return 0;" improves readability as well.

Fixes: cc1baf98c8f6 ("cifs: do not ignore the SYNC flags in getattr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 6543465595f6..e6d66977a81d 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -2203,7 +2203,7 @@ int cifs_getattr(const struct path *path, struct kstat *stat,
 		if (!(cifs_sb->mnt_cifs_flags & CIFS_MOUNT_OVERR_GID))
 			stat->gid = current_fsgid();
 	}
-	return rc;
+	return 0;
 }
 
 int cifs_fiemap(struct inode *inode, struct fiemap_extent_info *fei, u64 start,
-- 
2.11.0


