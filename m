Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D423C98F
	for <lists+samba-technical@lfdr.de>; Wed,  5 Aug 2020 11:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gP37RsrMGaMF6BzssPUZ8VhQW8vT8S6L5/66gaCLThs=; b=26A1zjsYFC9h1lP/7Fg27kva8i
	OhwwNqQwYX8tmqYboCAxZNwIgCq2Wj540d/VDZUvY9f4CV2Gx77nLg6B7QS4AgNQOefYx2X4a0RwH
	9dXtYS8r1+wRrCvo7jpBgX3VM6Fx7HUJiOvfaW+B9apVFlW8rb1UF5eMbQ90ajTomI5ceIFdlADlH
	GHVtm0R/aAr3HGuVCAox3cyv4m8ahOVoko5Ykem9BnCI8rgJTwPgJL0x9DFt7TYu9T1nwkBAkepMb
	6mmVjk2xsD2JGoTCNB+PONVglAiiXCiv6sBQmWuqtGi2VqG5R3UkcYf3a7WBIpXdGjP9UgQHNyLd/
	AB1S4hdA==;
Received: from localhost ([::1]:19222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k3G6O-00CWOD-7k; Wed, 05 Aug 2020 09:52:52 +0000
Received: from aserp2120.oracle.com ([141.146.126.78]:35214) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k3G6H-00CWO6-MP
 for samba-technical@lists.samba.org; Wed, 05 Aug 2020 09:52:48 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0759qKUc058845;
 Wed, 5 Aug 2020 09:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=gP37RsrMGaMF6BzssPUZ8VhQW8vT8S6L5/66gaCLThs=;
 b=cGr8Cb6VWuOPVIQ5y7FcEXR83vpJFUkHr/91b/E8gbZPo+/LvuXc6fsGM+PXPSB61fgh
 MFZJPAiJQyx/27ZdKdiVUylq+/gP+4KIbS3x/CHAFG9G3e25Bn1g7l4YbKMsm9UG8+YV
 If1FeSCNgRFRaFj7enuqwe1uJYRLZUpv8qinyaP1TchNrlWPMV25WvB4msXOX48e6F5z
 DNXLy0fdcm56vQkMUmmjPHyCKyHm9rfF4mLXR0BEqvYyuNYb6BDn/MSSZcyPEfUyOOdx
 s/AAGDIRSFMNWaDNGmpxG71e2M00cz27Rm/59DmQ1jwX4g5TXy8DISKLStQGFGqKgXYn LA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 32qnd41c9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 05 Aug 2020 09:52:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0759mtDI068676;
 Wed, 5 Aug 2020 09:52:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 32pdnsv8uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Aug 2020 09:52:20 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0759qFNj018545;
 Wed, 5 Aug 2020 09:52:16 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 05 Aug 2020 02:52:14 -0700
Date: Wed, 5 Aug 2020 12:52:07 +0300
To: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@cjr.nz>
Subject: [PATCH] cifs: Fix an error pointer dereference in cifs_mount()
Message-ID: <20200805095207.GC483832@mwanda>
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
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The error handling calls kfree(full_path) so we can't let it be a NULL
pointer.  There used to be a NULL assignment here but we accidentally
deleted it.  Add it back.

Fixes: 7efd08158261 ("cifs: document and cleanup dfs mount")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/connect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 0ad1309e88d3..a275ee399dce 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -4886,6 +4886,7 @@ int cifs_mount(struct cifs_sb_info *cifs_sb, struct smb_vol *vol)
 		full_path = build_unc_path_to_root(vol, cifs_sb, !!count);
 		if (IS_ERR(full_path)) {
 			rc = PTR_ERR(full_path);
+			full_path = NULL;
 			break;
 		}
 		/* Chase referral */
-- 
2.27.0


