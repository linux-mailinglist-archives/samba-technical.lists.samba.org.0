Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA1C86A2A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xacxyOElbkk084YQP7LlX2K9VN6ZklaUrPJlYHKN/gU=; b=xAqJQmiOIkB1uwtCBTinmgDvPi
	R4r43yu0X0OhT7GX5Cv/EJakXZaYXl5DRAvwMDsileuFFK/FkFxu6fhjzoQejIaj34rg5/ws4ULJy
	UrpTWJY5npBqzhrt2YdTtgTOR/JmI2xNbgLsLNfgpDx9Fb0JZ5GxBu5tzoLkXx0wmq17EvSi0I9Uv
	AN8Rr4g7Xc94kgmpr9xKpvK5G4NILJ/qNZ4K6mUmaDQ/ZyD+j3uItOGX2/pFiyHZJWI0fF76pkTj2
	NHVeEXz3xTv2fZbYHjQc+FG/0GvK5PNZRrc/c5y0W6hGztmqibdX4FyF51lEOVr4O4YejRzlPkm65
	FuU0VdZQ==;
Received: from ip6-localhost ([::1]:28370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxpE-00DGNm-P4; Tue, 25 Nov 2025 18:31:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22052) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxn0-00DFoh-EK
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xacxyOElbkk084YQP7LlX2K9VN6ZklaUrPJlYHKN/gU=; b=De5B1WTiaO3d/52nkjOv7P7EhU
 fXMmVo+mnGg3tVlZiDnNLubEE9GwJzjUp6fa1uy0jXSyQExyBrAcTDPkeX2c977qs3EJ4QsGozyeS
 i4iLoi2lmqBT7zmSLdUH5MSMP8LBgpYgTpQzOt9jaE86A2KqNzWeyLKMMsYZSzcmlHiM16K77USPP
 c/6vTk6BmA7TunTht5P3/VTQu5WXoZqxMxBsSZo8gAIgJF8+r6YxTDwGbHOJc0JnopO9HAVK4INwx
 5mTq7FVWdQLYqVTRaPsGv93Uv5ek+TBYlL3U8u+KaSpe/7kFnHFmY+22ksfUCYQhtjIXeJDnCVbNi
 eZWWl3SMBA1LH8x4qxWAO6+E7W0Elgz/3lBz48N94lhiaNmMCDC3ho1A2Lj3dlf9sEiDjG83HDVCI
 qzVrKWV0KGVJFAJ22FSI4Z7zoNzqXX5rJ4wFYu331RbYZvkGV9XYwUHdN+dv7K+ffIxPzlRyXqhsY
 hNVIn6jBHHKAvuqGL4kKBJpd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxhp-00Ffob-1t; Tue, 25 Nov 2025 18:24:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 132/145] smb: server: only use public smbdirect functions
Date: Tue, 25 Nov 2025 18:56:18 +0100
Message-ID: <788845f6000f3cf868016625e283413c9d9df510.1764091285.git.metze@samba.org>
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

Also remove a lot of unused includes...

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/smb2pdu.c        |  1 -
 fs/smb/server/transport_rdma.c | 25 +++++++++----------------
 fs/smb/server/transport_rdma.h |  2 ++
 3 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index b638d7fb5f51..8ec0708d875f 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -23,7 +23,6 @@
 #include "asn1.h"
 #include "connection.h"
 #include "transport_ipc.h"
-#include "../common/smbdirect/smbdirect.h"
 #include "transport_rdma.h"
 #include "vfs.h"
 #include "vfs_cache.h"
diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 85aed6963c86..e7d54283ae47 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -13,31 +13,16 @@
 
 #include <linux/kthread.h>
 #include <linux/list.h>
-#include <linux/mempool.h>
-#include <linux/highmem.h>
-#include <linux/scatterlist.h>
 #include <linux/string_choices.h>
 #include <linux/errname.h>
-#include <rdma/ib_verbs.h>
-#include <rdma/rdma_cm.h>
-#include <rdma/rw.h>
 
 #include "glob.h"
 #include "connection.h"
 #include "smb_common.h"
 #include "../common/smb2status.h"
-#include "../common/smbdirect/smbdirect.h"
-#include "../common/smbdirect/smbdirect_pdu.h"
-#include "../common/smbdirect/smbdirect_socket.h"
 #include "transport_rdma.h"
+#include "../common/smbdirect/smbdirect_public.h"
 
-/*
- * This is a temporary solution until all code
- * is moved to smbdirect_all_c_files.c and we
- * have an smbdirect.ko that exports the required
- * functions.
- */
-#include "../common/smbdirect/smbdirect_all_c_files.c"
 
 #define SMB_DIRECT_PORT_IWARP		5445
 #define SMB_DIRECT_PORT_INFINIBAND	445
@@ -642,3 +627,11 @@ static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops = {
 	.rdma_write	= smb_direct_rdma_write,
 	.free_transport = smb_direct_free_transport,
 };
+
+/*
+ * This is a temporary solution until all code
+ * is moved to smbdirect_all_c_files.c and we
+ * have an smbdirect.ko that exports the required
+ * functions.
+ */
+#include "../common/smbdirect/smbdirect_all_c_files.c"
diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
index 3f93c6a9f7e4..e16f625caed2 100644
--- a/fs/smb/server/transport_rdma.h
+++ b/fs/smb/server/transport_rdma.h
@@ -27,4 +27,6 @@ static inline void init_smbd_max_io_size(unsigned int sz) { }
 static inline unsigned int get_smbd_max_read_write_size(struct ksmbd_transport *kt) { return 0; }
 #endif
 
+#include "../common/smbdirect/smbdirect.h"
+
 #endif /* __KSMBD_TRANSPORT_RDMA_H__ */
-- 
2.43.0


