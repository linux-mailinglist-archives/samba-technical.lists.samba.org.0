Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3C7C1AF53
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:52:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EmsEjX8nlpjgRFwyfWoxd86W/jVwuYDI840kd6MqCMg=; b=KqDALKPL8M1n45XcC8FND7MnU0
	rsNjrlNFDFOzBnONCKy4ndrl0pewgYl9vDM8tcYpjCWbDMfvB9mS3rBEIn94xWQkOBJ6yq/ZvHUtX
	YlPChFrTrD3o12EZvXrnHkFwqdkXMvYVOKZKc1ZDSbSlBGTOKPNwKoefpEXubIFysKnFefKbij+2e
	N6Nlss//PYqpnwgaw5benESJBu3vIsO0ntjUCQL9lv4Y/FVufaYmKzMswkShPNXdneMgAk1Dbl0BJ
	THklZvz/BPQe7jZLSxBRw9mOtw43DLaBh1ohgcN05vhpI+RDL0XwTFdcieH2lNLv0hTES8ORh2Fjh
	ggk0px/g==;
Received: from ip6-localhost ([::1]:23060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6b9-009FCg-IC; Wed, 29 Oct 2025 13:52:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20616) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KX-0099AR-Ax
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=EmsEjX8nlpjgRFwyfWoxd86W/jVwuYDI840kd6MqCMg=; b=Aldxi+2qr/vLdL7Q+oyvO1duIo
 6YYdjGq/zrCkQbmhypjjXhG2vqUPZzwPMkrxy2XmC+jHcVCFBVdnmVvziJxnKaCcLOp6V96Jnokyy
 oeFkY+jAkPguj9v3Tnw4e2XgbbB/nkha11V+E4f5eE9MOWXdUGOW/LVCdsl4KILgSSYgzFyBljzrG
 qHoRIZSiEhWnm8cgGMsApDFwneydK/NQn1rPpLLum4UefmI8v3QqL64e3X8AhQ7Jiqaft7QzE+iuF
 xA8oFiUmpZ7dcWHAermtU/MZwr3Ty6NSUR4zCjy/7p+jmSa9yQSa2c8BtroMiwdP44VnhTnhvOPAW
 x2NtM3VrSrLAUTdiMIco88kj/aGq0dNfD4v3qGc70C1eUGy9AdOE0dE1AW4cuvRiBaLLlEC6in0bW
 qnUmNkxxUFKrwWk74VB82+hw1C0uvtqqQ9BAe0duBXieRRVnUH6UQbdmyn5YjEO0/f3dmTxuzI512
 HlkDxSCi3AFWYcIoxhctfJkW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6KU-00BdBE-2w; Wed, 29 Oct 2025 13:35:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 127/127] smb: server: make use of smbdirect.ko
Date: Wed, 29 Oct 2025 14:21:45 +0100
Message-ID: <ca69115a279fbe0455c1b48d283072520e257d45.1761742839.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
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
---
 fs/smb/server/Kconfig          |  4 ++--
 fs/smb/server/transport_rdma.c | 10 ----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/fs/smb/server/Kconfig b/fs/smb/server/Kconfig
index 098cac98d31e..59a059ecabec 100644
--- a/fs/smb/server/Kconfig
+++ b/fs/smb/server/Kconfig
@@ -49,8 +49,8 @@ if SMB_SERVER
 
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


