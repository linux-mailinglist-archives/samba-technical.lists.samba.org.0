Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5836C1ADD3
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DEbGESjpA1z5Ya4Y/8qCyqVGQIZoCeEOfi+Sciqa0rA=; b=AUannwp5+K2LYDfZdmI/tiUOuG
	rdjoM2xNqoa1tBs93nC8UesI5HlI8d4v1cAB/aIzCja2Omg/OmXyj12GfrV1Hp8G8AOYtDkoEUvhz
	CqpZJM217gY8ZC0NPtiB171TUmhlmJR8ir3nbX2RCQbMJMNhZ2whETMQkmkFx69VNCFS9fjvRe6y2
	/aS0SEo1mXxr/r0P6feRkcrAR3LWNOmLKlsBiMgMKMqm+Gu+1RbV05b77gH9W1VNuCQpBiuoiUJmw
	BWOWfJvKkOl1dXvrvY1Ybclz81NUCig2KTiLL/FygGL74DtDU8HNOsEyqC1ArsuhLjTeDnye3MBsA
	rQUUJ8RA==;
Received: from ip6-localhost ([::1]:38702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Tx-009Cb8-VC; Wed, 29 Oct 2025 13:44:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36126) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6H6-0097yr-D7
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=DEbGESjpA1z5Ya4Y/8qCyqVGQIZoCeEOfi+Sciqa0rA=; b=DhDXI96RiJasI6yOQkOJ1X2k+P
 nFuDJO/eAU4cFuS2K0FXwgzW8toeaMwY875wHF85SoLfo3GwLlpFrxpPgCxWd/x6rLMjl92FomrWw
 Kq317cqW8WdLYWjcmV4WngeIevbtU/JnII1ht0NBqexRYdiETaUGZWlcTLD1vGoWWJZ96OgIXPBKx
 ALNpT+QJVZW/3PvlTrVy9y2l0TiyIfRcb+gDssoEk9ADRk6s1q9hdk+aXB+/mag8hGeUAf28LI/T3
 78Rh9rz9YMXKDBINePDDaT5dG0qWwvicXVdCOmHtkAIXAI8MlKv260hgE3xJhj6Saoc8IMkb/iB+a
 3mk0ewkC6mUNy1fNLPzswCFBcEofADIslQw8LsVTEERJSCzKQJkRDb6F/S2G4qJEchTh7gHDDZN+u
 n7jquT/HxmnkNA6n0/YxZWapev0UBbMsxjaqSDveD8hNyJ8wEL3jk4LgRbme+eLw8TLMX8FinPehD
 W0sUJezfafFctg6SYoWrwd4a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6H4-00Bcbz-1m; Wed, 29 Oct 2025 13:31:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 091/127] smb: client: make use of smbdirect.ko
Date: Wed, 29 Oct 2025 14:21:09 +0100
Message-ID: <8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
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


