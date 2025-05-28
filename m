Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60955AC6D6E
	for <lists+samba-technical@lfdr.de>; Wed, 28 May 2025 18:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Zfbc9Cx5WQlMkXUyt/SS7i4F7Qd0VqFig/5zb4B536o=; b=cjI7tb1AkK6JTpv3x2CRW84xc+
	Ju1LwWOH09KEEz1sYB2wdI0BTD15UnAAPS2tDU6RxvEGIY1hPXJWC2IMNpJ15q2VpyqkwYrAYsHDB
	fCMTMvZsxgHSKMnYk8mLqOMKWRBiNvPxcO03OrXMggNYBDmYOPZtEX1kr21dRS+YETIVJUekoDy4f
	EwV7GHfDFEFXYu2tVJykk0rbWB8oRLuGTDtIE7Pw4gsjAjvHdthyEo2BXZ2Qn6L6MfGeHbG9xc+rK
	yv5NxLyqyXJxNwvT/nq0l8bm+eAreKUJAWCLJyKkqu5A411SxYsMxXm8rb62b1yaNcjY/mOfmjEGh
	gei/QSzA==;
Received: from ip6-localhost ([::1]:63762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uKJFb-004MHl-OG; Wed, 28 May 2025 16:03:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13442) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJF3-004M7z-Da
 for samba-technical@lists.samba.org; Wed, 28 May 2025 16:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=Zfbc9Cx5WQlMkXUyt/SS7i4F7Qd0VqFig/5zb4B536o=; b=LUxSykM9MtTsb2Qnau3AYe41TO
 IFmQimTi6sNpykCBS9pu8Hs4D0e+wTxGA81zVuHKICVJTEnIBRvR34j1xTgOxVzcYZ6xLJ2Fv3c0Z
 Uq1Dtu23xI3UIyeNa8Z1oyAua5ivAloXCgR9AMKb1EoWfU5yFIqykqzBjhTHKXddVJPh+Gc/f8ZtS
 JDBQ1hFtxtl9EFNr7KbyQrBsNjhbPpeWAFKLFMzl4OwcNnC0rvMYNkYJA6J2EK8knQ+5f7GSut8uQ
 igZpzdGuatbkJFzqOdl0EWArI2khukuYQuDhOb7P8lMWYPVFZYUyOW2bnfxu6d7uQLcR8+Y69y942
 svMM+z6elvI3+YXztgcMy0d7UCG0riDleGlO9yaVbR/qGWrWQJV00OLmfRELLf40qofAjT7s7N8US
 TWFs+8w45NfKThGYaiGRhYMTjJLrOixnAmRWuFGFtnll+sxTPFeXfvBdNd7Ohv69f7oTbddyHAKN1
 dC15u0FuoZbjZi7n3d5578U4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uKJEz-007hNr-0D; Wed, 28 May 2025 16:02:53 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH v2 07/12] smb: smbdirect: add smbdirect_socket.h
Date: Wed, 28 May 2025 18:01:36 +0200
Message-Id: <6e3641b1c5a48b0f931e9ec526d2b39c126404ee.1748446473.git.metze@samba.org>
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

This abstracts the common smbdirect layer.

Currently with just a few things in it,
but that will change over time until everything is
in common.

Will be used in client and server in the next commits

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
 fs/smb/common/smbdirect/smbdirect_socket.h | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_socket.h

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
new file mode 100644
index 000000000000..69a55561f91a
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (c) 2025 Stefan Metzmacher
+ */
+
+#ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
+#define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
+
+enum smbdirect_socket_status {
+	SMBDIRECT_SOCKET_CREATED,
+	SMBDIRECT_SOCKET_CONNECTING,
+	SMBDIRECT_SOCKET_CONNECTED,
+	SMBDIRECT_SOCKET_NEGOTIATE_FAILED,
+	SMBDIRECT_SOCKET_DISCONNECTING,
+	SMBDIRECT_SOCKET_DISCONNECTED,
+	SMBDIRECT_SOCKET_DESTROYED
+};
+
+struct smbdirect_socket {
+	enum smbdirect_socket_status status;
+
+	/* RDMA related */
+	struct {
+		struct rdma_cm_id *cm_id;
+	} rdma;
+
+	/* IB verbs related */
+	struct {
+		struct ib_pd *pd;
+		struct ib_cq *send_cq;
+		struct ib_cq *recv_cq;
+
+		/*
+		 * shortcuts for rdma.cm_id->{qp,device};
+		 */
+		struct ib_qp *qp;
+		struct ib_device *dev;
+	} ib;
+};
+
+#endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.34.1


