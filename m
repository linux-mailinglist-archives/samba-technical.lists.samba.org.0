Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE14372AE0
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 15:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UkcPfOw1zL7OvDlpQg+xfIeD/O5P0yQ5Qy64lO5GzLE=; b=5GGbm2Oamza6h62Pi1bRO6MC9U
	Uf8itBxQt0SeT20JPkrdrB3rO0oxcvqrlQTrjDc0CZ8uDgg6ASbYStHnp+GpvnWGQ4C+ZcOgMybiv
	ArtTUFtduqWBDC7BgJjtuVvD6QrFZuzL53t6G91yuFY3WZ4b0+/8wtBC2vhrgEvmemOCSAE64yxBl
	P0hY8HP3uOS1Q55909Yi8i7u4sPRfVB3hncSnCQ7Bwij/ueFleXYx/BWQ/JCnaXv1I2IPBUsSrwpH
	OVv0hz+v/+0aT93/+wOUhKzlYNNuM/uwBM0RMQOCSxCLu2u9PA9g5dJPsgNRgubJbTNzVbGj4fDGV
	8ypJv8Pw==;
Received: from ip6-localhost ([::1]:55782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldv1T-00FR49-Cr; Tue, 04 May 2021 13:23:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56090) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldv1N-00FR41-Kh
 for samba-technical@lists.samba.org; Tue, 04 May 2021 13:23:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id i128so3416158wma.5
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 06:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UkcPfOw1zL7OvDlpQg+xfIeD/O5P0yQ5Qy64lO5GzLE=;
 b=XPCII7ygCpVlBB1aHHi7dBrAaN5FLXYlUwmw9fncUPCKLKfSx9crjfvejvPxvSnY2B
 c02c/GpUPnM4v/JWuqo6oOHhCTa+JgIHQ+EdLetMdrPIefIo74IoEvr2cvvj6efSZCBa
 OKEVArk8xYxaWJICqo9Tn8mgNwpPfTXC0v7GmqiY9fnF8Rjcyeyp9zb1zq+OObsu0z7U
 WqyZafWtoxPEQjpup4Qdbvi0OZbwFfQD+lZBgNLRsJIL5MKEASSum3nXn8G7GzoBxapQ
 tvyiVsT8yD5lvZ6cMS1yGszIXS+vpPhaFu+SC2Pv/F7/jbr69Wr8L7v4/g866ZHdfHdl
 tDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UkcPfOw1zL7OvDlpQg+xfIeD/O5P0yQ5Qy64lO5GzLE=;
 b=MTJGhNwJ3xrW9C/udT17XY+lZ6u4ygK8UU9juVhxtk5nUmvtYi8L7pZ+anC65j5Vjl
 0ET2q8Z7WqJ8kxJCNZLlobM/sH1w5R6D2E6bAbaiSpfSG+LIwtddqhtYbr4fiUSgOe8M
 52qUkpDPGahykXEMsxN2799bo8DNY/8WV9He09LzzEmrSznGZRhUNpsSRLBSzsNMcAAu
 dbUWP8EasAY0TdoF/fm17KnKbxZuo77/QdpVejX3PHz5DLawPf51HFWYQzHSRVobv2ow
 OdK5ch0UvKTm2b0lot6Ju8y9LKvxsAbH4D3jFMTqHDvfxkHcLKKqjgpkAaMINzMw8d9w
 v0XA==
X-Gm-Message-State: AOAM533PSir6KxJuwBIuhdfJAMvhAdYSDM1i717wiOXTGIwpb6R+MZnE
 4jNXes2I9TfOD+k3r320ag8=
X-Google-Smtp-Source: ABdhPJybyw5+qxLuhY8SjLukCL9vB80At/hiQZhhXOVq30HUvzM9xmsWN3hkfXGdJDnswRJz4fWCyw==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr3945898wmj.43.1620134605114; 
 Tue, 04 May 2021 06:23:25 -0700 (PDT)
Received: from localhost.localdomain ([197.2.237.199])
 by smtp.gmail.com with ESMTPSA id f24sm2546301wmb.32.2021.05.04.06.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:23:24 -0700 (PDT)
To: sfrench@samba.org
Subject: [PATCH-next] fs/cifs: Fix resource leak
Date: Tue,  4 May 2021 14:22:57 +0100
Message-Id: <20210504132257.23632-1-khaledromdhani216@gmail.com>
X-Mailer: git-send-email 2.17.1
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
From: Khaled ROMDHANI via samba-technical <samba-technical@lists.samba.org>
Reply-To: Khaled ROMDHANI <khaledromdhani216@gmail.com>
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Khaled ROMDHANI <khaledromdhani216@gmail.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The -EIO error return path is leaking memory allocated
to page. Fix this by invoking the free_dentry_path before
the return.

Addresses-Coverity: ("Resource leak")
Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>
---
 fs/cifs/link.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/link.c b/fs/cifs/link.c
index 1cbe7ec73728..1485c6095ba1 100644
--- a/fs/cifs/link.c
+++ b/fs/cifs/link.c
@@ -686,8 +686,10 @@ cifs_symlink(struct user_namespace *mnt_userns, struct inode *inode,
 	void *page = alloc_dentry_path();
 	struct inode *newinode = NULL;
 
-	if (unlikely(cifs_forced_shutdown(cifs_sb)))
+	if (unlikely(cifs_forced_shutdown(cifs_sb))) {
+		free_dentry_path(page);
 		return -EIO;
+	}
 
 	xid = get_xid();
 
-- 
2.17.1


