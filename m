Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F3C868FE
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SozUG8RVCw91a4tDTcgWghO0msxJrN1STXZDFr8G8RM=; b=Mv72k7up6bFVaVozY7AJAwy+u5
	KFPKW1yfe+cOPDAbYwxfHBzDyilHM9Q+q0o3qmR2+AClFsFigcf+Asv/8+1SdDJQURHWDXuj0wfRa
	Kt541GyiQoBs/j4aLq5rpnD5K3KLBH4gcRxMqneCQVV95a22Uai1S1u5rBR+bqji5GWfmAbMbcbbG
	Dn/Fy6R0wJN7eOo5lf2uAEqhSo2FsLvruYzUuqz8R3j5AoKC7KLcW1W42qAVOv5CT/EODzbJTzm36
	6hjaUsh8NIXFieQvKNOlrdMOKxPAyEWB2Q0z5jFAaXsH/DKu9BEzMJMJkwbti8j7GdVnGGD3SOV88
	qqnzJemQ==;
Received: from ip6-localhost ([::1]:57480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxeE-00DE2J-5J; Tue, 25 Nov 2025 18:20:19 +0000
Received: from hr2.samba.org ([144.76.82.148]:35264) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDdZ-8r
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=SozUG8RVCw91a4tDTcgWghO0msxJrN1STXZDFr8G8RM=; b=qTdvazbdqqOIvXnfVSbuf7QdI2
 TipWrlkeRZgXNDj9vRLGc2U8rcDxVLWJqODd9tybXbzWbgt3B0P5K3aR6nZ/SmByDkQ9hxreojssP
 Z8BoeDiAziXjE12P9PThi+PEU8uiJ38yi+TH+KDLoL/VGKyT+d2aRCSpIhoq2JnjbKnE4nzziniv+
 uH3T/jO6plj9WKs9Kz1YSeNnYomSVTM+3DtTU2vichhMtjV67VZsAGGy38D/LnvZngnlo8QB7FSkA
 g6S3CW+a3q5+1viiLEmgps+JbRk1+ZYFtl2UFlS/y/HfbAR4whW2ajcux6Kgm07a4v+26HDKSlf8B
 QyWAy8M4e59A8fOj19cKRlDzr8Iu3ke/LOpItKOSdbSGj/502D1qzHkdYPTpldsVL6Q4aCSgFseUE
 dYCv4Rpvr60Xp1GL/waRlrg06HKTIBBDXy0uYZlKKK3OWuiLUvVLTQHDbE86A3TxjIu7fiozrLAwm
 sKtDoNx3rjMcej/myOLEY6j/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUW-00FeCl-2R; Tue, 25 Nov 2025 18:10:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 096/145] smb: client: make use of smbdirect.ko
Date: Tue, 25 Nov 2025 18:55:42 +0100
Message-ID: <f6916a46690649d0d6e1f03762d6cba8ce13986d.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This means we no longer inline the common smbdirect
.c files and use the exported functions from the
module instead.

Note the connection specific logging is still
redirect to cifs.ko functions via
smbdirect_socket_set_logging().

We still don't use real socket layer,
but we're very close...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/Kconfig     |  3 ++-
 fs/smb/client/smbdirect.c | 10 ----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/fs/smb/client/Kconfig b/fs/smb/client/Kconfig
index 17bd368574e9..72f47669da0c 100644
--- a/fs/smb/client/Kconfig
+++ b/fs/smb/client/Kconfig
@@ -181,7 +181,8 @@ if CIFS
 
 config CIFS_SMB_DIRECT
 	bool "SMB Direct support"
-	depends on CIFS=m && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=y && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
+	depends on CIFS && INFINIBAND && INFINIBAND_ADDR_TRANS
+	select SMB_COMMON_SMBDIRECT
 	help
 	  Enables SMB Direct support for SMB 3.0, 3.02 and 3.1.1.
 	  SMB Direct allows transferring SMB packets over RDMA. If unsure,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 91ed47ff8f2b..0c3a4b6aa03f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -5,8 +5,6 @@
  *   Author(s): Long Li <longli@microsoft.com>
  */
 
-#define SMBDIRECT_USE_INLINE_C_FILES 1
-
 #include <linux/errname.h>
 #include "smbdirect.h"
 #include "cifs_debug.h"
@@ -527,11 +525,3 @@ void smbd_debug_proc_show(struct TCP_Server_Info *server, struct seq_file *m)
 						    server->rdma_readwrite_threshold,
 						    m);
 }
-
-/*
- * This is a temporary solution until all code
- * is moved to smbdirect_all_c_files.c and we
- * have an smbdirect.ko that exports the required
- * functions.
- */
-#include "../common/smbdirect/smbdirect_all_c_files.c"
-- 
2.43.0


