Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E4D9C4C
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kg9qGUDQcR5JB1IHvCLmx3ZDZ+TrLbgdykBbU9w7tdY=; b=nzGhkvVnb+rdciOUHHaLxCnoj8
	BU4c6jZPBfsTiloPAukQRUXcw37m+JctOtKFvzqIc4dqzT+2VpRPhGeIAH4aQmWbeN5wnJZWWUnAz
	p8QCFLJIyVArnQ/weWFg76zHoFasxpuJa1QDdibBXvNmGfhhrqFIPPFs6yX/8yK6LMNwpo0RreOTT
	FIVexGAUs5Zcjxqtewsxsujm6hlwcEx4EG4zUDDS9VRsucb00r2fT7TgeQQLfAzb82fOd2T80TqbP
	EbYj+HexPWAUh8N9Y5W9LBejENbNh/pzgID9WrWu6R7WrO3wx76OtYhSSzvkU/t7dmIaG6MCuLc74
	B0IC4RKA==;
Received: from localhost ([::1]:45092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYu-004PNu-EE; Wed, 16 Oct 2019 21:10:28 +0000
Received: from [13.77.154.182] (port=37540 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYf-004PMf-CR
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:17 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 162A520B711D; Wed, 16 Oct 2019 13:52:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 162A520B711D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259150;
 bh=kg9qGUDQcR5JB1IHvCLmx3ZDZ+TrLbgdykBbU9w7tdY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=DmTeNs6KJM8TsNqZY3tBn7BUSFj/UBSqLPISDnWJGYtDxqW+exlE5EvnzcesfLF1S
 8FVov1VK7Yp0J0X/M4Yjd4mAvT3+rjcTndBR61APY+nBtbPsG1JZRv0peEjbLGyplh
 zRrfZYHLaedXJuhSKBn/qFmPE0Dz5EAyZlm2FB28=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] cifs: smbd: Add messages on RDMA session destroy and
 reconnection
Date: Wed, 16 Oct 2019 13:51:53 -0700
Message-Id: <1571259116-102015-5-git-send-email-longli@linuxonhyperv.com>
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

Log these activities to help production support.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/smbdirect.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index d41a9345f90d..227ef51c0712 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -1476,6 +1476,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	info->transport_status = SMBD_DESTROYED;
 
 	destroy_workqueue(info->workqueue);
+	log_rdma_event(INFO,  "rdma session destroyed\n");
 	kfree(info);
 }
 
@@ -1505,8 +1506,9 @@ int smbd_reconnect(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "creating rdma session\n");
 	server->smbd_conn = smbd_get_connection(
 		server, (struct sockaddr *) &server->dstaddr);
-	log_rdma_event(INFO, "created rdma session info=%p\n",
-		server->smbd_conn);
+
+	if (server->smbd_conn)
+		cifs_dbg(VFS, "RDMA transport re-established\n");
 
 	return server->smbd_conn ? 0 : -ENOENT;
 }
-- 
2.17.1


