Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9D461468A
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 10:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0k3uL8Vfyjl3LH0bekeMiQpUrtbY/laYs/t+wh6OsNU=; b=H6R2pOVPjCtUNMLzFxUpocLrnf
	N7AJvMWbZYsoJhfp9BCCCeul1l+7ZdrbQVtAhLchfkP0AJ+VYpduwB9Efu9rSN6eLe7yHoJQ3xGUP
	+3DW+tYVHpR43jKuKOFNQ6nUZ9KvB4QaXlmdTAtDK2fixtDS3JRlu+ViG0AkHnraIGJTW52sshZJM
	pSgxn77kK2O4Q6Bhu54jgdtJqxIaonhyYHlVLLiVq89yrFXFUTIxwoCj+xV5BK8R6sVFPOZCedw7W
	DMm0TUembHXeGHUBQm2+BXtDpYc+HIvmuBYJGZIaPDrueMGnDHMVtTVIFGt1LyrYi4KJjRCyjwkr6
	s362hR4w==;
Received: from ip6-localhost ([::1]:18538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opnSr-009m0Y-Hd; Tue, 01 Nov 2022 09:21:45 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:51131) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opnSl-009m06-8i
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 09:21:42 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1DF9F401BE;
 Tue,  1 Nov 2022 12:21:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 4864E3D3;
 Tue,  1 Nov 2022 12:21:41 +0300 (MSK)
Received: (nullmailer pid 2696464 invoked by uid 1000);
 Tue, 01 Nov 2022 09:21:36 -0000
To: samba-technical@lists.samba.org
Subject: [PATCH 2/2] ndr: revert libndr.so.3 soname bump
Date: Tue,  1 Nov 2022 12:21:13 +0300
Message-Id: <20221101092113.2691975-2-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221101092113.2691975-1-mjt@tls.msk.ru>
References: <20221101092113.2691975-1-mjt@tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Andreas Schneider <asn@samba.org>,
 =?UTF-8?q?Pavel=20Filipensk=C3=BD?= <pfilipen@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

After the previous change adding compatibility symbol, revert
libndr soname bump from 2.0.0 to 3.0.0, and bump it to 2.0.1
instead. This renames whole ndr-3.0.0.sigs to ndr-2.0.1.sigs.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 librpc/ABI/{ndr-3.0.0.sigs => ndr-2.0.1.sigs} | 0
 librpc/wscript_build                          | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename librpc/ABI/{ndr-3.0.0.sigs => ndr-2.0.1.sigs} (100%)

diff --git a/librpc/ABI/ndr-3.0.0.sigs b/librpc/ABI/ndr-2.0.1.sigs
similarity index 100%
rename from librpc/ABI/ndr-3.0.0.sigs
rename to librpc/ABI/ndr-2.0.1.sigs
diff --git a/librpc/wscript_build b/librpc/wscript_build
index cf9085c0884..dbe66a23f45 100644
--- a/librpc/wscript_build
+++ b/librpc/wscript_build
@@ -654,7 +654,7 @@ bld.SAMBA_LIBRARY('ndr',
     public_deps='samba-errors talloc samba-util util_str_hex',
     public_headers='gen_ndr/misc.h gen_ndr/ndr_misc.h ndr/libndr.h:ndr.h',
     header_path= [('*gen_ndr*', 'gen_ndr')],
-    vnum='3.0.0',
+    vnum='2.0.1',
     abi_directory='ABI',
     abi_match='!ndr_table_* ndr_* GUID_* _ndr_pull_error* _ndr_push_error*',
     )
-- 
2.30.2


