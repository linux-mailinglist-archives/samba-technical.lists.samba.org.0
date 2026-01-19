Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99AD3B4AF
	for <lists+samba-technical@lfdr.de>; Mon, 19 Jan 2026 18:43:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NUYE8j9yPl0jpoX8En9kaNRoyvBQraT/1ExWrInBEV8=; b=YvyeKX7UOvykcAodmT+be4RgOs
	4V9h4lhrdfKgwfCY4jN/C5DCsiYfuONxdHktpZa1HBG1ZOvs9SvbzTtzUIEjfVYqDfShjB0E4h92w
	pDVTzdfnSdQ2DKrVic2PYzNcy8BtkZz/mpR4gWdZ6ATSXCbGHvS8pQT6uj95Bxh4dY5TABJTqCeb0
	RmyC4AG3AGbr+BSXegFckwrmAuGHvF1mjTY7VFii3rEl2fyU84lLBtu2IrtUf9NK9tY6yHog0wHwM
	qpypy1ndVcPj/K+Utw6dFg7/5A9g1/AlglDkZ/eSdbObfd2RHs/LjTJSXIFO4jcfnfKJSRjWo+bJl
	mA7EZ0Yg==;
Received: from ip6-localhost ([::1]:18172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vhtHm-000eoC-3b; Mon, 19 Jan 2026 17:43:30 +0000
Received: from hr2.samba.org ([144.76.82.148]:49612) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhtHi-000eo5-1W
 for samba-technical@lists.samba.org; Mon, 19 Jan 2026 17:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NUYE8j9yPl0jpoX8En9kaNRoyvBQraT/1ExWrInBEV8=; b=v+tblFMXFoo8ZP1mWNKhSQlwI4
 xlo09JgZSMAmhc2U23dr35MwY0mphmXoIUzQyDUHIlM4eM5/24cZV0iWSpQGskI31ZvszXOn9swLe
 K0shFNgcckXvkrqPhaP89waNGy7YQlIMhsQxQbtpoA8Wpc6aPuNlb959eiTRRAefOYdN3HFGRr3yC
 hqROS9oFe735LmAWaltv9Hmu1mhzJtzbZYppHCBLpUFMqXEHH78i1JzVpU1DYhFxFYj/LWvkO9Rpt
 LEAHQdY75xOTgPvC1++DyaKqAIVLT/lZkLZTvP5JtqOhASoONWJDS/N6V2ncjbqDDNtmJG+d4uzEv
 z8uQXqLEi0DPMjvBB8HWCAaAtag4MtQbtn3hEVifArI4E25sZxfCwqHG34Zgx0skXJ5uMXtqAvBsd
 SQuLLKWbvPlGYKo0xnWKgPDUwDC9gzFtl3EFDsKMRmvCzaQ4cpGiSUZUce6CrpJFQieLmuLDamEZz
 siG5ZeSZiPePhfSIONiSOj3n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhtHX-00000001BGD-3FSN; Mon, 19 Jan 2026 17:43:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: fix comment for
 ksmbd_vfs_kern_path_start_removing()
Date: Mon, 19 Jan 2026 18:43:10 +0100
Message-ID: <20260119174310.437091-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>, Christian Brauner <brauner@kernel.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 NeilBrown <neil@brown.name>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This was found by sparse...

Fixes: 1ead2213dd7d ("smb/server: use end_removing_noperm for for target of smb2_create_link()")
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: NeilBrown <neil@brown.name>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/vfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/server/vfs.c b/fs/smb/server/vfs.c
index f891344bd76b..b8e648b8300f 100644
--- a/fs/smb/server/vfs.c
+++ b/fs/smb/server/vfs.c
@@ -1227,7 +1227,7 @@ int ksmbd_vfs_kern_path(struct ksmbd_work *work, char *filepath,
 }
 
 /**
- * ksmbd_vfs_kern_path_start_remove() - lookup a file and get path info prior to removal
+ * ksmbd_vfs_kern_path_start_removing() - lookup a file and get path info prior to removal
  * @work:		work
  * @filepath:		file path that is relative to share
  * @flags:		lookup flags
-- 
2.43.0


