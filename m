Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071FAC6D74
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yqWWjNjEpYpvpW8hXOje6nlrrm13I3oF1ciseBbhLF8=; b=aUWxLBMN0svIkOiF9yIx/Iyvr6
	PO9fylNCIVovaIXsM5dJGUSqa9OwbjbmXf/RlT2Z7BTUO+kRRaKUEkjsMnJMrS3o/A9xgc8KVvZ2q
	kgAWAAmaAMSbGKpdDeBnR95CcDZUmmHVqLqovjXuSOMCuphowoeJHZ2J9R692A3KOlAclnfVt5iFv
	U5Xtp1w8IBOPCqmegtQKr4C10dk+FYaY3h5tFFWjZPkmgzww53f+v6PLlLZtaoKvhUUWnvwtcFWB/
	Dwd2bxLNphaZgZnh2cx12sgqX+nFitmdPp4l8gP+cTVSJV/Kq2g50xBpJoZON+fSYKW4zWV7wa3tg
	WRlieByw==;
Received: from ip6-localhost ([::1]:35890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJGE-004MWS-5s; Wed, 28 May 2025 16:04:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25962) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJFQ-004MH4-U0
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=yqWWjNjEpYpvpW8hXOje6nlrrm13I3oF1ciseBbhLF8=; b=EL5V/+01PzzLsb8DWabVOIWdCC
 CrhToi9d2bgnDcnmrel3l7sZNUK5uUV0F6tZ5MZbnRlJfp/Jj6PL42evVGuowxYphvbrJlgBRT2R3
 IxFrRBik08YrZKgSmuedSiF9soUZqixxSuijc44kIpgh5h94mlFWCYEcoMFAhcmIduA3vbp+iiQuK
 SaA5LOxYmOvi2ZfPNmCOwQcPdgaQisN8Y46LY1bJ8YZekvdQts9Eur2+8pAIaJkwDrnJBuj42Q3/2
 NOWAtDEsecHgMhYg2WxrebpMnzTU6dfSd+CsyaBSodoZEOztYpWpwHPmcO+KaAvluUTpofXk09c4p
 LcNBtbfdHvhcTLhxjBgHnwvjYKzhlpEKa7FoXITdqPmJrEtpprZKtfnienlR97WyDr1m+76Dmt4L0
 0GW4eWFEXPcG871LAywM4hqNVXnl4Sx/wB/hPkqhs9CdslypVvAyX5NCDKaCWOZd53Gbx1wKvuBe2
 cBEgE0O4VcT74DcWErgrUmWl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJFO-007hTa-0P; Wed, 28 May 2025 16:03:18 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 10/12] smb: smbdirect: introduce smbdirect_socket_parameters
Date: Wed, 28 May 2025 18:01:39 +0200
Message-Id: <63d3c5da0420fe002e738bd40d1ed2f3f7a7b3ad.1748446473.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748446473.git.metze@samba.org>
References: <cover.1748446473.git.metze@samba.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is the next step in the direction of a common smbdirect layer.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.h                  |  1 +
 fs/smb/common/smbdirect/smbdirect.h        | 20 ++++++++++++++++++++
 fs/smb/common/smbdirect/smbdirect_socket.h |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 904c4e5b9e5c..3d325d73364a 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -15,6 +15,7 @@
 #include <rdma/rdma_cm.h>
 #include <linux/mempool.h>
 
+#include "../common/smbdirect/smbdirect.h"
 #include "../common/smbdirect/smbdirect_socket.h"
 
 extern int rdma_readwrite_threshold;
diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index eedbdf0d0433..b9a385344ff3 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -14,4 +14,24 @@ struct smbdirect_buffer_descriptor_v1 {
 	__le32 length;
 } __packed;
 
+/*
+ * Connection parameters mostly from [MS-SMBD] 3.1.1.1
+ *
+ * These are setup and negotiated at the beginning of a
+ * connection and remain constant unless explicitly changed.
+ *
+ * Some values are important for the upper layer.
+ */
+struct smbdirect_socket_parameters {
+	__u16 recv_credit_max;
+	__u16 send_credit_target;
+	__u32 max_send_size;
+	__u32 max_fragmented_send_size;
+	__u32 max_recv_size;
+	__u32 max_fragmented_recv_size;
+	__u32 max_read_write_size;
+	__u32 keepalive_interval_msec;
+	__u32 keepalive_timeout_msec;
+} __packed;
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__ */
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 69a55561f91a..e5b15cc44a7b 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -36,6 +36,8 @@ struct smbdirect_socket {
 		struct ib_qp *qp;
 		struct ib_device *dev;
 	} ib;
+
+	struct smbdirect_socket_parameters parameters;
 };
 
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.34.1


