Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27651C86A69
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DiLwwB7Moi+57tbTzIGDnugGWGAcOC+rjlIimTIPO60=; b=Y5gz3FYQ78UUBA5+UC6i0aLLSa
	WXEiyaCp+TGhAsqE/yQJc/QnW+q85Fjthll5TKzmemmNktZCEQGW/NXgwFmRFMQxe+Lh0kgLqvlKr
	b/2fZ8y+1MYzhKSaNFD1Zb+dOe5kiJpKRAZHTBS+qJz1WzZNO/3A2L2DBk1J1VmH4FDZZrnWmBGKk
	HHSWy3bOZ+o4nJTKWl7i5XB5jy7TBuN2PLlkPD3xKXY6Ut8c6w6U4K9p4lV76w3rfXvCcfEGJUJWk
	MAORX6/hGOIm3tpXYQaieNwHOwD9BH/eWbtXGPvVZ05wjf3+3Iqd5MT4apowqWdY8Ok05BUGoEffs
	Ygg8+PXw==;
Received: from ip6-localhost ([::1]:23720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxrY-00DGwv-47; Tue, 25 Nov 2025 18:34:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45246) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfe-Ae
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=DiLwwB7Moi+57tbTzIGDnugGWGAcOC+rjlIimTIPO60=; b=kDJZ/pEV6OWGu5+SHzaszipKx6
 AaeWOBxEzfjEfENAdr5Da2SYodG1xDXTOW/+HZvDet6tTw+l9c1AN5L46Ba3ZgicAY7Dqlcw8XBQc
 1UxRGBzGaXRLiTu+41gPgkmMvlCBcoyRpxLITQfRG4W2oAuSKgrZV9fRDHsK9BiafsHtwMxwSR6rB
 zcxU4OPOaqkf5y/Wx0fGdvgyJjEXxWTFQy2HG6/RcjM+pPSJLYM4ASPc9y30f4uc9xYfMeX1go21G
 fVoD1q9clYR+8aTPxm/yIMVqPJ+arpqlA+QGvSwcUxnNAbNchDb7hNEuDTx9Kb1e5t5M+0MizT2IA
 j8w5fsOtH50xaDoLpcCpZizJ4AhZV4OdEXCO7amjVB3B2VyYj14EWwGr01pBVaJGW52grfwoLPZv9
 XvOReqqpmlxm9xPFQrPFJH9IB6sa4yvR/HvX93R/tcl67lDXVZp8bkmg4KEOCXC5itTMoFujgBCx0
 Dca8A8wRKKMn/UMsVCvq/PQ/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxi1-00Ffpy-1A; Tue, 25 Nov 2025 18:24:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 133/145] smb: server: make use of smbdirect.ko
Date: Tue, 25 Nov 2025 18:56:19 +0100
Message-ID: <9af09ceadcb7d6014d5fc63f5cf2d4984d481f9f.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This means we no longer inline the common smbdirect
.c files and use the exported functions from the
module instead.

Note the connection specific logging is still
redirect to ksmbd.ko functions via
smbdirect_socket_set_logging().

We still don't use real socket layer,
but we're very close...

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/Kconfig          |  4 ++--
 fs/smb/server/transport_rdma.c | 10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index 2775162c535c..2ab381554472 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -47,8 +47,8 @@ if SMB_SERVER
 
 config SMB_SERVER_SMBDIRECT
 	bool "Support for SMB Direct protocol"
-	depends on SMB_SERVER=m && INFINIBAND && INFINIBAND_ADDR_TRANS || SMB_SERVER=y && INFINIBAND=y && INFINIBAND_ADDR_TRANS=y
-	select SG_POOL
+	depends on SMB_SERVER && INFINIBAND && INFINIBAND_ADDR_TRANS
+	select SMB_COMMON_SMBDIRECT
 	default n
 
 	help
diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index e7d54283ae47..c261082ff9c7 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -9,8 +9,6 @@
 
 #define SUBMOD_NAME	"smb_direct"
 
-#define SMBDIRECT_USE_INLINE_C_FILES 1
-
 #include <linux/kthread.h>
 #include <linux/list.h>
 #include <linux/string_choices.h>
@@ -627,11 +625,3 @@ static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops = {
 	.rdma_write	= smb_direct_rdma_write,
 	.free_transport = smb_direct_free_transport,
 };
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


