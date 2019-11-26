Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C279109DA6
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 13:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EjOVBkjN4rZaIHQ5WfAoCcmKy/ByYkiMTB3fcgAM/+E=; b=dSYqBJlhwQVMmQ4+0iWKGkZuvU
	8/736juvRekzo4vKKk9Z6BsNed8xFA4VQwKGJ1qSk3tiHQkC5v0UhEPZjrXYHF6lc48hcsPJgbMQc
	dZ6PApqGWhewss+5TAkFNbox32r8oI383rXAb49W3jVXWYiycCOGik0QRhGQq8wQQoPYLESyda4Uf
	j++GKRNfIL+6Ii6X/GqN37pEPGBOZOYA4vQuFtzvvlE1Conphzny0Kg9EGr4qwJ51VarqF0zXE8b4
	4hGK8y4ePdsWD7bjuWxgu9R+nHXnDxCqidSaD9iTsskvaa3Zpz6uxJCUwg5ymsCsBCG1Kqwuqtzlz
	o3GNrkIA==;
Received: from localhost ([::1]:38328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZZit-002QIk-J7; Tue, 26 Nov 2019 12:13:39 +0000
Received: from userp2120.oracle.com ([156.151.31.85]:35014) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iZZio-002QIb-Hs
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 12:13:36 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC99jU095806;
 Tue, 26 Nov 2019 12:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=EjOVBkjN4rZaIHQ5WfAoCcmKy/ByYkiMTB3fcgAM/+E=;
 b=CCod7jih8IsA5jVmKCH/QME2JE79NMjMe44p4rpNtxaaYS3+OISQpRdXtU1BmQJOlfrk
 XYkCw4F4dHpE9mIjzkUlAGXMb2QpjV3KzvEJz+Eq5wIN+Cpx03bEICGLfu4MwK5ZszwA
 ztg13IuFT8jLVa/jRmAtfIdFlUC+FSrwIhyfak5448W9NX4cyZYVrSk2ejV6uJ9Xvm85
 DkDYdKWp1eBxGHcitz/wwYkE2XX8YBmhss68AG3U0gN/ZId4l2InzR0XN00r/KmhQbYa
 F/9O3TDPfSUUWvIB0ipFhKmrsEYCKcd+UK22Y6khNU3qzMd59a6nxz7QCG9Vc+mn0/T2 RQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wewdr6a76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:13:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8XDN050176;
 Tue, 26 Nov 2019 12:11:27 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2wgwusgp9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:11:27 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQCBM8P001701;
 Tue, 26 Nov 2019 12:11:22 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 04:11:22 -0800
Date: Tue, 26 Nov 2019 15:11:15 +0300
To: Steve French <sfrench@samba.org>, Aurelien Aptel <aaptel@suse.com>
Subject: [PATCH] CIFS: fix a white space issue in cifs_get_inode_info()
Message-ID: <20191126071650.c76un267i4v6vuoz@kili.mountain>
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
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We accidentally messed up the indenting on this if statement.

Fixes: 16c696a6c300 ("CIFS: refactor cifs_get_inode_info()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 1fec2e7d796a..8a76195e8a69 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -967,7 +967,8 @@ cifs_get_inode_info(struct inode **inode,
 		}
 	} else if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_CIFS_ACL) {
 		rc = cifs_acl_to_fattr(cifs_sb, &fattr, *inode, false,
-				       full_path, fid);		if (rc) {
+				       full_path, fid);
+		if (rc) {
 			cifs_dbg(FYI, "%s: Getting ACL failed with error: %d\n",
 				 __func__, rc);
 			goto out;
-- 
2.11.0


