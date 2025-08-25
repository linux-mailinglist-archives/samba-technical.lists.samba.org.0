Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F270DB34C52
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=e2QtsBQivXyb9VR8yXdGyIyFQL8dQvU+87VcXRmP61Y=; b=5hrRvIj7Hy8jmjqckP7NIBxyJI
	oWMaeZvCUE7KtR0Pl90tLuXn06S+kYQWP6HhUxO/q4BmJF7+IxArRYeQYjBSfhxFRqDNUJVf4mdDb
	EIFLZIRnjTeJeES9hJCiH5Dzjw1pTz2UuOErBBiKPf+J6kEYlvH3hnlcIxU510IRArz3uxmCGjPCT
	bUQvGLaHlSZOgPybD7qDZ9Ozs5GhojTDmrJ3Vi3JEMcjwsuLuTLgTX5tILdKzNobsspRY0brFIU8x
	1ITIJho6nYYT/6+pwXbohx8cITd/PshzWjiru9OqruGLZVk4g8UIhhJEnpgUEKhp5N05/8jsz7QUP
	v6Y0OiaQ==;
Received: from ip6-localhost ([::1]:53538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe2p-000LpO-9K; Mon, 25 Aug 2025 20:43:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43304) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2J-000Lh5-WA
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=e2QtsBQivXyb9VR8yXdGyIyFQL8dQvU+87VcXRmP61Y=; b=PeBuhJ/av4P8/IJYyJGt8gzly5
 t43WO25ZoInx7TmofVXm/qf/w3KyabiF+5DWsqO8Qb3fO5MRbAMjENDpigIL11SaNX54iHwGf8dL/
 58qIY5/6OY3/mIMhdBJW8lIX/IWQywhxLiIsX9awTw8OJ2UK61nC+olpuRSKx+6f8FUIoq1QCKUYP
 Bsf6cLhm5Mfz27vjm1ATI8v0IfQ3fsvK6WFZZU6SydIU+o8U5GpJOA2Dihfhn5ik1qpiTqrpgMRWM
 NFqJ/4d+0lLd4BvIwxS2NZVInf/8WrUO59BpxcsGelME8fW6T3bjDBaSssACVbJs3hFG8mNdQletE
 /roYX2eZl2SEvniUyUK7AyLlg/d1ek86TOI+4hiaHdzTqJpPk/OCw1tk/6/01tKvMOYoTs7MnYuiX
 bTA/HFaBHV1FVHp03b0LABZu/7zDzqxmUagoIyVlPX2GsDaiQM0sJAGYjiDv5xMDjqj7P753BLRyH
 5IhM0+OQDlvH4lyWK5VZAt53;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2A-000jSq-0U; Mon, 25 Aug 2025 20:43:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 008/142] smb: smbdirect: introduce struct smbdirect_rw_io
Date: Mon, 25 Aug 2025 22:39:29 +0200
Message-ID: <b1cff4d04be83c9ac89f97612ade9e1c39f12272.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will be used by the server in order to manage
RDMA reads and writes.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 001193799e16..ff7b9f20b1ac 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -6,6 +6,8 @@
 #ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
 #define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
 
+#include <rdma/rw.h>
+
 enum smbdirect_socket_status {
 	SMBDIRECT_SOCKET_CREATED,
 	SMBDIRECT_SOCKET_CONNECTING,
@@ -240,4 +242,18 @@ struct smbdirect_recv_io {
 	u8 packet[];
 };
 
+struct smbdirect_rw_io {
+	struct smbdirect_socket *socket;
+	struct ib_cqe cqe;
+
+	struct list_head list;
+
+	int error;
+	struct completion *completion;
+
+	struct rdma_rw_ctx rdma_ctx;
+	struct sg_table sgt;
+	struct scatterlist sg_list[];
+};
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


