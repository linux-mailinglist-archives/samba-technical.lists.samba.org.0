Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F902AC6D64
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=z1fJ12rWt3TQejq1CmnFHtLiSd925QY4ykMI/MKfrjw=; b=ml7D/6C8vBqQBwVh9JNYtCfF/M
	MKAix6kuzZ7I5wr002w8pjw777OI2RAE2chKxOrpigzDkBmwQ7TP+cC0174YLzsr+Kv4H5yihv1SA
	GHSu4oNbXalvSFg0MHxM4qaWf/HubCeZ23Gq6Sm3GG3I2KjnXdzkIhGEWRJZ++frD43mHhc8mDM+q
	7jABqU+ua22hJ2WaXksJyYvoCDuUAzj9rWGrsSx/9F8cGFZodrzD+hmV1fP2rsr5HXtxXkkPQ99s8
	hfaaNKog8Acu0ijItYm5HIlLZ8EgClTVyutqLrWmXsFAPgzcY7L8u1WxoJi1JJjPfDRV5EQN00yUv
	EalZhuqg==;
Received: from ip6-localhost ([::1]:30072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJF2-004M0D-ME; Wed, 28 May 2025 16:02:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48222) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEb-004LvX-KA
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=z1fJ12rWt3TQejq1CmnFHtLiSd925QY4ykMI/MKfrjw=; b=Wp770G36lHHYEKtURZV50/XLmd
 TsVVH1Xoto5ajRXK+D5VBagex7hbxku7+ionQPovpk0bFXfrxr11i6GG7qMEtzqOLs4wKAHyM1KV4
 Xym+M2Y4ZEG3Pwcj5XlGT9JxD0jU8hzHMslTQlY23gePI7CQUv29zcWk6/huI2pMvGeEU0WbIremv
 ArvZ3+cFq4nU7KD5oSiwkHpSCX8qFfYuj2cTny6zp+l5ROJHHMmlPO1KKVF3/E3yyMW+aMGuRzxif
 Xct760EKN76r45awkQsfF7g3AnBJ9qj7T5IB7mvwkmLnPI8td/ALVh16RxhhrI76yh7XtmDbeg1i9
 ZxMwnbHo85TWPKgIFgkRHknGvcBDRUfqnlR4djImyvfNKV9ABfR2Oik9kvT1QbuTMsyyJRxQntKr5
 2itrSaEcDr8jFWa92DoCsM7mlIizGG5GpFJVXTfh9HJvzppqJYo4bvGAf26fT8BZ8l7KZ/4biVazM
 vDOfercPY5LM4GELGih3nl1d;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEZ-007hIg-03; Wed, 28 May 2025 16:02:27 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 04/12] smb: smbdirect: add smbdirect.h with public
 structures
Date: Wed, 28 May 2025 18:01:33 +0200
Message-Id: <87a6dc3d48366845b646651b80e9687dfc9c7236.1748446473.git.metze@samba.org>
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

Will be used in client and server in the next commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
CC: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect.h

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
new file mode 100644
index 000000000000..eedbdf0d0433
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (C) 2017, Microsoft Corporation.
+ *   Copyright (C) 2018, LG Electronics.
+ */
+
+#ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
+#define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
+
+/* SMB-DIRECT buffer descriptor V1 structure [MS-SMBD] 2.2.3.1 */
+struct smbdirect_buffer_descriptor_v1 {
+	__le64 offset;
+	__le32 token;
+	__le32 length;
+} __packed;
+
+#endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__ */
-- 
2.34.1


