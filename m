Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12235C1AA42
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YA91a/EreQ8HCjH/Zu36rbx6hGX/lrVdAEFkJ+zAsBI=; b=pfhh666+OMDBOGK24EnugQQ2X5
	y3aW2BsB0WaQWQhuktaupSdF20q+bYCFf2u/yLltadeJPZeYBQhDW5Cuc7I7Oid+bEYbCAPdHKxNM
	WPWMy2tG6ABUbvMnCrzCkl/pbuM59ikPMd/pYwEYh8Q04TXkdcvIoHaw7VJPuxO++uME/6cQXHAHd
	86ROkzzEAtSAIedKAYcBWUjyzZlZzUU0b0AO99Svce/ljfSnhDXgu7MO2ZXscIO/durfvYex7OnPU
	Qmb5hcFbgWNtuNtPeri1KVlyffXlSHqgGb8r4ew0px/E1omUnLqwNaTuwOrTzXYfEacSqOCy1/DEw
	q+XuaHQA==;
Received: from ip6-localhost ([::1]:29268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE69s-0095ZN-8B; Wed, 29 Oct 2025 13:24:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21014) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68w-0095Ls-Dy
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=YA91a/EreQ8HCjH/Zu36rbx6hGX/lrVdAEFkJ+zAsBI=; b=tmyZbdmuUe4spyvq/q/i50GPI3
 Ta+G0noONSB8q1SyAr118mEgFD0zU1RdZsDoUWCEt6LDXp4RxJKqUdqT4H7ntXwuusWOHWxyJU/Ep
 lr0ibPouXeySF21+ETOO+pOIPRubfubT7+h6qhCAE/QjZ+o1j7evUfgCn4xsv1u4xTDWFmCFk4ZgB
 g9tVbHt4zYEw0c3RWdwP5QTXJogysBE1fqcC1VhKeRTA4aIzJB95xc5mUrWNNx3FBd7Ij76gA0VCc
 geCBq721txh/qte1xWLdFuR/lM14WgaDGL2vsX02lmEQpPvzKS1vb+F+WINxoJB9e3dL4Vibrcdtz
 itAWyeadrQsCuSTFObBQbr6ENTUs0pJE3XGSrcnXVJcFmmFLmXZbToau6NQTHyT8oBCSHj7fZTyHw
 eDT8wh1Q/12UIDj7tBs7UBfiGx4cjJkuoiN7D3aOQsg7eZHXJAUQc5+PhDzaDVKoo7k8v1nCkvkOz
 6IzXzyfUeAVGwzZyaNetgjx8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68r-00BbFt-2V; Wed, 29 Oct 2025 13:23:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 006/127] smb: client: include smbdirect_all_c_files.c
Date: Wed, 29 Oct 2025 14:19:44 +0100
Message-ID: <d8e5fd7451711f27009f7830bfea723ec0b6a552.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is the first tiny step in order to use common functions in future.
Once we have all functions in common we'll move to an smbdirect.ko
that exports public functions instead of including the .c file.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 85a4c55b61b8..5ae22c8dea81 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -4,6 +4,9 @@
  *
  *   Author(s): Long Li <longli@microsoft.com>
  */
+
+#define SMBDIRECT_USE_INLINE_C_FILES 1
+
 #include <linux/module.h>
 #include <linux/highmem.h>
 #include <linux/folio_queue.h>
@@ -142,6 +145,14 @@ module_param(smbd_logging_level, uint, 0644);
 MODULE_PARM_DESC(smbd_logging_level,
 	"Logging level for SMBD transport, 0 (default): error, 1: info");
 
+/*
+ * This is a temporary solution until all code
+ * is moved to smbdirect_all_c_files.c and we
+ * have an smbdirect.ko that exports the required
+ * functions.
+ */
+#include "../common/smbdirect/smbdirect_all_c_files.c"
+
 #define log_rdma(level, class, fmt, args...)				\
 do {									\
 	if (level <= smbd_logging_level || class & smbd_logging_class)	\
-- 
2.43.0


