Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B74BEAC6D5C
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=N0h/3pLVEke8r15CZcuBdoGauKbz3Rij7+uIytPOFG0=; b=CwElPb/j6ECbroe13cIyhx0F9X
	g4fWRfHGxjbSop1hGjcE7E5qRVvX8P5iUBQ7PLDwmaNNo/qr1tSp5BGyxtP1AVDXXJ0AsPZLLZIms
	U7mTq2pPw5Kir2uNvz+nNeLVQI7sYBoNfx9xMmFK48hVaEL0ljVLGrTIShKuaIUQbZlKl+ljlfCTb
	8ifg9cOrgkCZwqdJb60X2638QUhyVxBW/rSNI0ty7r/gYkHT4lP4ul3Vtpt6VKFQnlDUu0oF2TH5D
	8v3cZRvLNREelY68wFddwP3280KGBB+sMvJPfJ3BrgGxRgCrtKCoe/va0vd585uVL5a7Bike/JZrn
	ikFOmH4g==;
Received: from ip6-localhost ([::1]:46594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJEE-004Lp4-HG; Wed, 28 May 2025 16:02:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29744) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJE9-004Loe-O9
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=N0h/3pLVEke8r15CZcuBdoGauKbz3Rij7+uIytPOFG0=; b=erD8bbbU+6dMyuTZzx8vUaBBA8
 k8gwQpttGJNqjVFwpZ47IDgncgSi7uCWDk/vNB+QlhgnYD6vcm3UbyeOxh/cJh23/MqUizdSrr0mX
 4E/cUPoOAzKFPVnBHykKZw6hbUmMPucVJLB6Qa2wNkIpholoDcGqJpr0OmQEwGBO1O/faz7WAxmm2
 0xjQeOlU75VHfE0AfR70bt3IkeszpGYzmQ4ZG+NA5lMUwLjlOOQbjTwAjKpo3dj3eOKiDh0LWkR4a
 PeLI9x0MegbRfCVYdMgGSnQOnllHgiscg/MfCuCCdjO/ZY5ezIFMDiAjfHuIpbXIb5sIPWaBHphwA
 OJ2WkRJAyXWonKwXmhOMtleUUoiHo2rAup4dHcb0flPKknrdgZFM5yml313Lb625cOVKxzJRbf8kM
 Xr355ml7ig9rIJUwY1bbiNqZGxOv8M/Wj9S3QRKnNXm7+qGWyiX1+g9AP0GKBBHxZBwkWRMUe3rur
 ZbZn8zBUCuo1uCeMJ4aBE3j2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJE9-007hGw-0E; Wed, 28 May 2025 16:02:01 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with protocol
 definitions
Date: Wed, 28 May 2025 18:01:30 +0200
Message-Id: <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
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

This is just a start moving into a common smbdirect layer.

It will be used in the next commits...

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
 fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h

diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/smbdirect/smbdirect_pdu.h
new file mode 100644
index 000000000000..ae9fdb05ce23
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (c) 2017 Stefan Metzmacher
+ */
+
+#ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__
+#define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__
+
+#define SMBDIRECT_V1 0x0100
+
+/* SMBD negotiation request packet [MS-SMBD] 2.2.1 */
+struct smbdirect_negotiate_req {
+	__le16 min_version;
+	__le16 max_version;
+	__le16 reserved;
+	__le16 credits_requested;
+	__le32 preferred_send_size;
+	__le32 max_receive_size;
+	__le32 max_fragmented_size;
+} __packed;
+
+/* SMBD negotiation response packet [MS-SMBD] 2.2.2 */
+struct smbdirect_negotiate_resp {
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
+#define SMBDIRECT_DATA_MIN_HDR_SIZE 0x14
+#define SMBDIRECT_DATA_OFFSET       0x18
+
+#define SMBDIRECT_FLAG_RESPONSE_REQUESTED 0x0001
+
+/* SMBD data transfer packet with payload [MS-SMBD] 2.2.3 */
+struct smbdirect_data_transfer {
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
+#endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_PDU_H__ */
-- 
2.34.1


