Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E9372D23
	for <lists+samba-technical@lfdr.de>; Tue,  4 May 2021 17:40:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WAbDT06lmoDzuztzXgk+cC20Azgq28Piv4t2hW78+jw=; b=NDSnq4ljb5INvkYP+hgaaaUoGa
	+KnUQFMLH7qIe8ucbykHmztAcu1n2QBMY2O9A9fPqEnvTKtRajY8LPA1gDAI0GGnf044TA3GpuW9u
	h9UGJz9wGnovSKeXUny4GJvSevrUFQWjtelz9hVvKlgfgPmC9mEJw1KuEPy8a2oAKUrjRRnPeLEoo
	ePzyLAG07CpnNmKjZ0glGjM0jECShgnci9c+EI7woB6nGiorqS3EVm7poH8IfM3MnKoaWd1Z0jIDi
	rhXzRcfCWH5j0+inRrFJOh18T1jdCONfIH232pb2DIox2IPRJwr2bz9RR+TppsNHcUrdKFqcWrsDB
	O5o/YNNQ==;
Received: from ip6-localhost ([::1]:57196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ldx8k-00FRPM-H0; Tue, 04 May 2021 15:39:14 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51739) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ldx8f-00FRPF-0u
 for samba-technical@lists.samba.org; Tue, 04 May 2021 15:39:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n205so4850983wmf.1
 for <samba-technical@lists.samba.org>; Tue, 04 May 2021 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WAbDT06lmoDzuztzXgk+cC20Azgq28Piv4t2hW78+jw=;
 b=PLlDcuYBuk89gfluBkMBlgk6z09eLazYQ2YcFLzjVIBujBBLWJIfdmZkezrtRgXPM+
 NDC+gpyZYoP+4BV71tPHcB8/dTA6q1qSINm+zJhL41r1WFSANpZlBeJ5TIu66wCHQafn
 bruQ7V/LBj/5Y5XCjVEsEZEwdkRmjCXJTQx2sQ5W9aPzfxPX4hPyM/wxG9mKTSqMB2aC
 Gqwmg33WF3yti4OajFjrZnt1kYDN5H+/4fFYAYo38QNF80f7ngNUBTRucf8BVGTq56Nv
 wBuCGnRvugXR+yjJqV+0EotoEGW5rLJt75SpZZgfpRPiHY/7kQCyTwO06wQ2H2XcFwS4
 DNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WAbDT06lmoDzuztzXgk+cC20Azgq28Piv4t2hW78+jw=;
 b=mMLEoYEvEv5aGuWkbnfUzQqTOsw44qLCTo3VAOoS0F27XrGa0hbnelrxsD6enECVC2
 tHkD/rc1ohlXlzu3Gq05iKTAmWFIwiMAXLb/IAgmXJ3BRTsB/4hkJTVsbi6c4tOnH9rK
 jnU8Dy3j40N3TNwfpU5gwr5GQLihaPPWcgCtKZxAyfd1Feiw8VlLOUS6C43+gjJzi9Fj
 hDlMAtAQ5Avj72v3M4Ncm98M9fteVE0SByGhNJPFahkugz2Hm9NsI4amj7tQCs9rxIsI
 ksEBS73CQ2+i88qOMVUVMGVmr9YsreJlWWzHeu90t77RYuuK5NSL6VytfeaAELAt/aDd
 qlRA==
X-Gm-Message-State: AOAM531nRw6d4+FrUEiyu96nfAa62aihz1wLAM+zn3m4IrUwfDrKGFy+
 6cWRV4kPMz4L59O5JbU15uo=
X-Google-Smtp-Source: ABdhPJwV0LzPwoFrsjZGliyjfU3QOeIlZ/d5ErsojeSwGZjVvaEYVNfS3teJDoXg/Z40yCl5moYgXg==
X-Received: by 2002:a1c:1bca:: with SMTP id b193mr28730877wmb.28.1620142745344; 
 Tue, 04 May 2021 08:39:05 -0700 (PDT)
Received: from localhost.localdomain ([197.2.237.199])
 by smtp.gmail.com with ESMTPSA id d5sm17166845wrv.43.2021.05.04.08.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 08:39:04 -0700 (PDT)
To: sfrench@samba.org
Subject: [PATCH-V2] fs/cifs: Fix resource leak
Date: Tue,  4 May 2021 16:38:55 +0100
Message-Id: <20210504153855.26227-1-khaledromdhani216@gmail.com>
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
to page. Fix this by moving the allocation block after
the check of cifs_forced_shutdown.

Addresses-Coverity: ("Resource leak")
Fixes: 087f757b0129 ("cifs: add shutdown support")
Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>
---
V2: Add a fix tag and move the allocation to avoid its failure
in the declaration block as suggested by Dan Carpenter.
V1: Invoke the free_dentry_path before the return.
---
 fs/cifs/link.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/cifs/link.c b/fs/cifs/link.c
index 1cbe7ec73728..970fcf2adb08 100644
--- a/fs/cifs/link.c
+++ b/fs/cifs/link.c
@@ -683,12 +683,16 @@ cifs_symlink(struct user_namespace *mnt_userns, struct inode *inode,
 	struct tcon_link *tlink;
 	struct cifs_tcon *pTcon;
 	const char *full_path;
-	void *page = alloc_dentry_path();
+	void *page;
 	struct inode *newinode = NULL;
 
 	if (unlikely(cifs_forced_shutdown(cifs_sb)))
 		return -EIO;
 
+	page = alloc_dentry_path();
+	if (!page)
+		return -ENOMEM;
+
 	xid = get_xid();
 
 	tlink = cifs_sb_tlink(cifs_sb);
-- 
2.17.1


