Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C100AC1AA49
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KsTARGwLsAdlA1pYu9e58MzCnXSPrmngIasktyeDZ+s=; b=L/Io9VNjXticWqomsYJHTmxUOx
	CEJP+UEKVLP09a1hh5szeE1Sdc7K7nBN2UGqWC7+gYqJbp4Ed0Po2tBjyT1xllHy4Kh0fzL/inRC8
	O7oqX5HpbQXztCOWOBo4QEAgtxq7id+rPBM426SiBERqCYdoUeIsNlfEFSE0FrcCXc5IQafscj3KW
	97crR5pTNouUSgQL8JzSmkWjLpbMZHxcwhIj3kjR5t9Ze7vXhqPdnVYDPlfdC7PsQfQx9Jm+39BDC
	Zkx7Oatdwwz0LZh+AsTS6oxf3RcfWUQ4nNS+eoaVc04Af+2gROxt8hzHXrOa1TnMwb0eXz3YZVvbI
	7p1C441A==;
Received: from ip6-localhost ([::1]:49392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6A7-0095fK-Vm; Wed, 29 Oct 2025 13:24:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE691-0095N6-DT
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=KsTARGwLsAdlA1pYu9e58MzCnXSPrmngIasktyeDZ+s=; b=n0UZK/NSwW25ptTuOo5winbXjv
 GveR2HzEU3KA6A6XwP6IBZUVDUz/RMbvbI/jKtCp7hlj9Gc4mtMXubrDKc63MeLHw8d1JbcyYhMqY
 7m3QXpohjPAswssvq6CqBjWvXR/vzC6s4/xSsitDlufbqUca2fCKW/gMmGOzSlUt1UCCcbiN1w35j
 wWdVWFj9L0yA1RBivkfNqyRcBq9QHmvW1agFi/9l/O+HauKQk59dg3MLJqfj+4rwxSXXKB/CEx7vd
 Jt1FEo4aoQH18RJrWexGOWhjFxXWDcJqiGf9xl7qFb1wX6HSiIDr4ZFuw49ApHH39UT1rEQnqngx/
 NOOEIhSElOudCYA+5Y6qt/dj/KnXa7WqBUz2uKpy78SPET/oZThnPHSCgKwltKI6jX29bNsNQCJCl
 cGRftdiZ0yzt+FYvG0EFveytU1NI5zEmTLxBMoTLD5j6grXGi0fEoekI4km0NT9IQnKFiRHcgQ0/0
 5P8prsF1ZzqgHCJOGfDjEAn3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68x-00BbH6-11; Wed, 29 Oct 2025 13:23:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 007/127] smb: server: include smbdirect_all_c_files.c
Date: Wed, 29 Oct 2025 14:19:45 +0100
Message-ID: <58151622e48824d4efc56ca93292dd1962045a04.1761742839.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 5d3b48e77012..9bf023b797ad 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -9,6 +9,8 @@
 
 #define SUBMOD_NAME	"smb_direct"
 
+#define SMBDIRECT_USE_INLINE_C_FILES 1
+
 #include <linux/kthread.h>
 #include <linux/list.h>
 #include <linux/mempool.h>
@@ -28,6 +30,14 @@
 #include "../common/smbdirect/smbdirect_socket.h"
 #include "transport_rdma.h"
 
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


