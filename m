Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09C16671
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 17:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=d2/4ZzVEXoWgWdH8NA8DiQ9Kqp5OVBny47mh3SSRuKk=; b=TF4C0HfCZ1fjQI/0ZnFJKa/Xpx
	bfwLg73jrhYFpGrLThVT2hQrWtizQIWFPaUv2c0HMbyi3hO/UTgdj4m73EGJvhZyxpb2NeUWu5RYq
	o/lfdouNkeWMfxTalISV6oThLrHpBlca7cq3L8BxYtM84vCoCbgylX/KBtBn/Q+zISgmVVzxh4xur
	onF3wicznFegKTKnazAnj2dAuIKZKu6ygkjv5B7zNVdCcN7L40MkI1pxoQn9Q/AIlfB3I2PqO/dq6
	MMJOsOZVnYBFiYZ1FpI+KLBvbE5XK7+/WWdeQTb+CE3wD9pi9RfDVe6k+z0EaNxXPttls5jXZeIqO
	NvD/pXsQ==;
Received: from localhost ([::1]:28706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hO1px-002tw0-D5; Tue, 07 May 2019 15:16:57 +0000
Received: from mx1.chost.de ([5.175.28.52]:41740) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hO1ps-002tvt-Id
 for samba-technical@lists.samba.org; Tue, 07 May 2019 15:16:54 +0000
Received: from vm002.chost.de ([::ffff:192.168.122.102])
 by mx1.chost.de with SMTP; Tue, 07 May 2019 17:17:39 +0200
 id 000000000133ACDA.000000005CD1A193.00003808
Received: by vm002.chost.de (sSMTP sendmail emulation);
 Tue, 07 May 2019 17:17:38 +0200
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2] cifs: fix strcat buffer overflow and reduce raciness in
 smb21_set_oplock_level()
Date: Tue,  7 May 2019 17:16:40 +0200
Message-Id: <1557242200-26194-1-git-send-email-kernel@probst.it>
X-Mailer: git-send-email 2.1.4
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Christoph Probst via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christoph Probst <kernel@probst.it>
Cc: Steve French <sfrench@samba.org>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Christoph Probst <kernel@probst.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Change strcat to strncpy in the "None" case to fix a buffer overflow
when cinode->oplock is reset to 0 by another thread accessing the same
cinode. It is never valid to append "None" to any other message.

Consolidate multiple writes to cinode->oplock to reduce raciness.

Signed-off-by: Christoph Probst <kernel@probst.it>
---
 fs/cifs/smb2ops.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index c36ff0d..aa61dcf 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -2917,26 +2917,28 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
 		       unsigned int epoch, bool *purge_cache)
 {
 	char message[5] = {0};
+	unsigned int new_oplock = 0;
 
 	oplock &= 0xFF;
 	if (oplock == SMB2_OPLOCK_LEVEL_NOCHANGE)
 		return;
 
-	cinode->oplock = 0;
 	if (oplock & SMB2_LEASE_READ_CACHING_HE) {
-		cinode->oplock |= CIFS_CACHE_READ_FLG;
+		new_oplock |= CIFS_CACHE_READ_FLG;
 		strcat(message, "R");
 	}
 	if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
-		cinode->oplock |= CIFS_CACHE_HANDLE_FLG;
+		new_oplock |= CIFS_CACHE_HANDLE_FLG;
 		strcat(message, "H");
 	}
 	if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
-		cinode->oplock |= CIFS_CACHE_WRITE_FLG;
+		new_oplock |= CIFS_CACHE_WRITE_FLG;
 		strcat(message, "W");
 	}
-	if (!cinode->oplock)
-		strcat(message, "None");
+	if (!new_oplock)
+		strncpy(message, "None", sizeof(message));
+
+	cinode->oplock = new_oplock;
 	cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
 		 &cinode->vfs_inode);
 }
-- 
2.1.4


