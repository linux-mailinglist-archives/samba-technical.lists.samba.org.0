Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 797ABC865D0
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ILasSayKTvR0cSE5NAS5Zr8W921YJMVtSvZbeFPPOwM=; b=a0eoycfwslmiHIOQEsRXyW3Df8
	bFDKMe0ibjD9GH8OMAAvkVvBl3wSPsZEKuNRYEtWqTZbRHMWH7O0T0NksXx6cJ14PtGV4pn2lVAPj
	GOMmykstTlUtzLDSHWrLyxoTQ26DuAM+Kgp7PLIlceyaaFK/YdkbI42qdlH+TvFXKaQ2r3LK6gT5z
	8V8GBCkb3q+adbYK/XmbBUi77E44zRyQqVUH1hsIfYfhKXGnbYuUxbdoB+PaPa8Klnjjq1ka5YEBZ
	xmLQ6Ai2Fo+7B36fXnSyz9S28Y9XW/EmzgSgqMMbkCs8V5Q/8wTxCa8cAvLpXHk9HBRhGXH/7PT/O
	+arpb7yg==;
Received: from ip6-localhost ([::1]:21792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxJT-00D74f-QV; Tue, 25 Nov 2025 17:58:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36696) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIB-00D6kG-2k
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ILasSayKTvR0cSE5NAS5Zr8W921YJMVtSvZbeFPPOwM=; b=JIdfuU9tip9fafgsp1+yaeJpUs
 cpbSY4mO3fNhI4PbwbA4+kDO58hb31znuKJ0M0B2zKXL4Vj6kr69WXSSoOharokessZ/EfRYgl/VV
 ZcWGSxVGEo+jXvtmVRWk542g1GeWlhL3/0XXa/PjptU734yz1ogkcMCoPmn3PVzdJKyRcPLlZVx9t
 bTPMp09wyUcqMZ+ahI5nvTvbrzCTjFqZBIDhPHynkhcExueFfyFO519RkUHs7IL7sZ6ad0pCrqjG7
 /UQDvDI3pjkMfFtYob2WmoXCTNo8wiWHbTphh7+/sA+G6pB2reFRdn0u3vW63X7BK7TvMi3y/gA0t
 3jI00I7DXJzqDFQd/wUvuMgToZJRS3RNPIgHBVHYVQlHUXDRzCPWLqJWiSWJ+hFwXoQ1JfPRWbWfO
 uomtjnoe2tsErn3na8AS6+z3uL884NmX9W3b1jjwkgKuuK58FjNDMRGwmVPdPb65ojWHXWtlPul6V
 MH0UGtEkGANGu9UY0tMtO8+X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxI7-00FcZ7-0O; Tue, 25 Nov 2025 17:57:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 008/145] smb: server: include smbdirect_all_c_files.c
Date: Tue, 25 Nov 2025 18:54:14 +0100
Message-ID: <d38593de25f7ac822e0e444cdfa1a103461cd7f6.1764091285.git.metze@samba.org>
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

This is the first tiny step in order to use common functions in future.

Once we have all functions in common we'll move to an smbdirect.ko
that exports public functions instead of including the .c file.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 4e7ab8d9314f..d656dbf9f7ae 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -9,6 +9,8 @@
 
 #define SUBMOD_NAME	"smb_direct"
 
+#define SMBDIRECT_USE_INLINE_C_FILES 1
+
 #include <linux/kthread.h>
 #include <linux/list.h>
 #include <linux/mempool.h>
@@ -30,6 +32,16 @@
 #include "../common/smbdirect/smbdirect_socket.h"
 #include "transport_rdma.h"
 
+static void smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc);
+
+/*
+ * This is a temporary solution until all code
+ * is moved to smbdirect_all_c_files.c and we
+ * have an smbdirect.ko that exports the required
+ * functions.
+ */
+#include "../common/smbdirect/smbdirect_all_c_files.c"
+
 #define SMB_DIRECT_PORT_IWARP		5445
 #define SMB_DIRECT_PORT_INFINIBAND	445
 
-- 
2.43.0


