Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75640AC52CF
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 18:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=BR9VLGnDam8FRTcEto4FINbN+XLC60yJOf8RM4qREm0=; b=wzQwQYzDc/DWbPXygJQpkui0ki
	WsJUoXYkrMjr4kAcDxzn7kLprGsru/CivrA2ArXkVIZolA4Mx4ZS7ldrOn2Rh1iyGDb9TDynHfxPm
	AmRpzdQQP6KSxn2W2pRBewc9UsSPDxepQfh4EJY85/pUpLKtot47FaTaHHpuFSacegvKC7KNRK5nN
	5PURGFVJsNb54xg1FGvJnvQO52IwGuRB5tpH0QEdsrQ/9y/ol8sYxtg3Kdj8vpZQP3srvfBrstgkH
	b1v9D1nXQ+dQElvkUnIrPTsbXa0Z7TCf6GHI+8Ca0HDzKoqtrWDWes0LHE4MeU7I8xfngj/cCMXFG
	rN0EoquA==;
Received: from ip6-localhost ([::1]:26798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJwwB-004HdP-IL; Tue, 27 May 2025 16:13:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35952) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJww7-004Hcy-8S
 for samba-technical@lists.samba.org; Tue, 27 May 2025 16:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=BR9VLGnDam8FRTcEto4FINbN+XLC60yJOf8RM4qREm0=; b=hhW10gz+Njgp3iBlvZksmePNm3
 Ra4ooN/T+GpoUPmbgNXdCYi63BQmNzJTST/TygU229xA/kl4+X545tN+j8EeYyG9nDcTVDjZhum4a
 WQOndHOyc+oGjo/J0e1ju5jemwVqPggWNj6XOZms1T2CGe2M5p9WcA7INnWJeSeJu2ewyG35cBYRG
 JVr+d+iMFtPLU9HgIPd2AFo/magYESnNVWSOBGdPnK2Lz7NMRdhhb8PMksgDjqRmm7KXUO9/OfzLF
 urQO0MR4xku2hU9SibWx3IXWZR81DN4FfQOUkdbogJcKrRL9u5tnsYiex90ZzMvwYJ1a8WrIbaqNO
 mR83GPSnXQ9W1FCtzku/Gnd1gHKBUytUjRDScfqMWm4hBnHA4pOcyvCGvrA+KBfKsI6dYf9ONNxH/
 XTgo+d9+GA4m+gk/Vj5VNFcNKPJZAVW/yUnQn8nlDdn88FoedHsU5lEVjGPbiKoykRSGd1jkyS1Ia
 lzjBdgMFB+6iUdZ+ebX0xT1W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJww6-007VkX-1X; Tue, 27 May 2025 16:13:54 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH 1/5] smb: common: split out smb_direct related header files
Date: Tue, 27 May 2025 18:12:58 +0200
Message-Id: <31f6e853d60ec99136f3855acb3447d36fa0fc82.1748362221.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748362221.git.metze@samba.org>
References: <cover.1748362221.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is just a start moving into a common smb_direct layer.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smb_direct/smb_direct.h     | 11 +++++
 fs/smb/common/smb_direct/smb_direct_pdu.h | 51 +++++++++++++++++++++++
 fs/smb/server/transport_rdma.h            | 43 +------------------
 3 files changed, 64 insertions(+), 41 deletions(-)
 create mode 100644 fs/smb/common/smb_direct/smb_direct.h
 create mode 100644 fs/smb/common/smb_direct/smb_direct_pdu.h

diff --git a/fs/smb/common/smb_direct/smb_direct.h b/fs/smb/common/smb_direct/smb_direct.h
new file mode 100644
index 000000000000..c745c37a3fea
--- /dev/null
+++ b/fs/smb/common/smb_direct/smb_direct.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (C) 2025, Stefan Metzmacher <metze@samba.org>
+ */
+
+#ifndef __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_H__
+#define __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_H__
+
+#include "smb_direct_pdu.h"
+
+#endif /* __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_H__ */
diff --git a/fs/smb/common/smb_direct/smb_direct_pdu.h b/fs/smb/common/smb_direct/smb_direct_pdu.h
new file mode 100644
index 000000000000..ab73cd8f807a
--- /dev/null
+++ b/fs/smb/common/smb_direct/smb_direct_pdu.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (C) 2017, Microsoft Corporation.
+ *   Copyright (C) 2018, LG Electronics.
+ */
+
+#ifndef __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_PDU_H__
+#define __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_PDU_H__
+
+/* SMB DIRECT negotiation request packet [MS-SMBD] 2.2.1 */
+struct smb_direct_negotiate_req {
+	__le16 min_version;
+	__le16 max_version;
+	__le16 reserved;
+	__le16 credits_requested;
+	__le32 preferred_send_size;
+	__le32 max_receive_size;
+	__le32 max_fragmented_size;
+} __packed;
+
+/* SMB DIRECT negotiation response packet [MS-SMBD] 2.2.2 */
+struct smb_direct_negotiate_resp {
+	__le16 min_version;
+	__le16 max_version;
+	__le16 negotiated_version;
+	__le16 reserved;
+	__le16 credits_requested;
+	__le16 credits_granted;
+	__le32 status;
+	__le32 max_readwrite_size;
+	__le32 preferred_send_size;
+	__le32 max_receive_size;
+	__le32 max_fragmented_size;
+} __packed;
+
+#define SMB_DIRECT_RESPONSE_REQUESTED 0x0001
+
+/* SMB DIRECT data transfer packet with payload [MS-SMBD] 2.2.3 */
+struct smb_direct_data_transfer {
+	__le16 credits_requested;
+	__le16 credits_granted;
+	__le16 flags;
+	__le16 reserved;
+	__le32 remaining_data_length;
+	__le32 data_offset;
+	__le32 data_length;
+	__le32 padding;
+	__u8 buffer[];
+} __packed;
+
+#endif /* __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_PDU_H__ */
diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
index 77aee4e5c9dc..71909b6d8021 100644
--- a/fs/smb/server/transport_rdma.h
+++ b/fs/smb/server/transport_rdma.h
@@ -7,51 +7,12 @@
 #ifndef __KSMBD_TRANSPORT_RDMA_H__
 #define __KSMBD_TRANSPORT_RDMA_H__
 
+#include "../common/smb_direct/smb_direct.h"
+
 #define SMBD_DEFAULT_IOSIZE (8 * 1024 * 1024)
 #define SMBD_MIN_IOSIZE (512 * 1024)
 #define SMBD_MAX_IOSIZE (16 * 1024 * 1024)
 
-/* SMB DIRECT negotiation request packet [MS-SMBD] 2.2.1 */
-struct smb_direct_negotiate_req {
-	__le16 min_version;
-	__le16 max_version;
-	__le16 reserved;
-	__le16 credits_requested;
-	__le32 preferred_send_size;
-	__le32 max_receive_size;
-	__le32 max_fragmented_size;
-} __packed;
-
-/* SMB DIRECT negotiation response packet [MS-SMBD] 2.2.2 */
-struct smb_direct_negotiate_resp {
-	__le16 min_version;
-	__le16 max_version;
-	__le16 negotiated_version;
-	__le16 reserved;
-	__le16 credits_requested;
-	__le16 credits_granted;
-	__le32 status;
-	__le32 max_readwrite_size;
-	__le32 preferred_send_size;
-	__le32 max_receive_size;
-	__le32 max_fragmented_size;
-} __packed;
-
-#define SMB_DIRECT_RESPONSE_REQUESTED 0x0001
-
-/* SMB DIRECT data transfer packet with payload [MS-SMBD] 2.2.3 */
-struct smb_direct_data_transfer {
-	__le16 credits_requested;
-	__le16 credits_granted;
-	__le16 flags;
-	__le16 reserved;
-	__le32 remaining_data_length;
-	__le32 data_offset;
-	__le32 data_length;
-	__le32 padding;
-	__u8 buffer[];
-} __packed;
-
 #ifdef CONFIG_SMB_SERVER_SMBDIRECT
 int ksmbd_rdma_init(void);
 void ksmbd_rdma_destroy(void);
-- 
2.34.1


