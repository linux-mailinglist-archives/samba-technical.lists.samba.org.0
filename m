Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CD7C84167
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 09:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JBks4w2+a2ir27jAy7+dA8QHceTJmX14wJ2ZEbxuhr8=; b=dwyn/nzQDXwEe7Yu8/ZQyGlFk5
	haZObS9heZh/QkSiCPDFzBeDaOGgixClgR+W+F75EtgYe8/As6bjXWYclCeLYJfOpUPHLZ6Myp8y/
	ohVwtX60/3XMG4aOHXaUEzzhd8iOfZvUBO9fzVunLpGO+TRk3Eciq/ocl3FUegzWDeP3bBXblQU6x
	P6LU/tYeISc2JmAYj+c2b6ppQqR7o2O9l++eIZxM+/L4EpizHusLmlbQZa8JCb/fySFblDGZdLWw4
	zN01nhz4VxMdDre/7zy+oznO2Gn96/UZ89voButlLdDEVHJvZSoiKBrnrOyzCY+nTpQOhNjrcYOOi
	hwVQUPPg==;
Received: from ip6-localhost ([::1]:18954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNoqU-00D40M-IH; Tue, 25 Nov 2025 08:56:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10292) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqN-00D3zS-Fc
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 08:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JBks4w2+a2ir27jAy7+dA8QHceTJmX14wJ2ZEbxuhr8=; b=P+Af7Nft+fd0WHuCLG8VZ3jXRk
 WnEAZ2joar+vPQZTqBhLvQXUUUBMurhMN9hrRtZuCbOT+Rul7W3a/TDdmHYZ1i/8Dw1TDp+DLozDM
 UGDxiCXuvRRjWJUhLzKhCW/K+HuB31av6f4PeKToWiWzKTgf4Ic9w/+sOMbFeVrm/EATRWUw9B0Uw
 KumxSTOEe9HZXKLF4uSI9+KA8nLy21+sYxk7d3Y2h95crA3zkt6RQMTC61ynWxLwajjIdLmrPqeuc
 tZL44UUy98vzM7utG/CJUnKFAJnNdGncRH/SPHzqnGdNvGYdInefGKclp9JD/NX4F2qBfRso3Gfee
 uXEx8GJX/cLTsB1l3OkesJs3IZTpc7VQv/1VXO/uafm9j8tGuPvsR7giPBoiI+mDWj0Img3FSq872
 NUjIUYbZy0QKn2LDB3Vtb+KqYzhZJ03qeShzArejZC5wuqYvX4ul6xYDQXr3iaVhkzflSO6NHSwuu
 XfEfdFbbK1a26u/olggMCsV7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqM-00FYJi-0v; Tue, 25 Nov 2025 08:56:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 2/4] smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,
 DISCONNECT}()
Date: Tue, 25 Nov 2025 09:55:55 +0100
Message-ID: <df492536dbd5a48993ab32423be7dba8b2ad58f2.1764060262.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764060262.git.metze@samba.org>
References: <cover.1764060262.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Paulo Alcantara <pc@manguebit.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These will be used in various places in order to assert
the current status mostly during the connect and negotiation
phase. It will replace the WARN_ON_ONCE(sc->status != ...)
calls, which are very useless in order to identify the
problem that happened.

As a start client and server will need to define their own
__SMBDIRECT_SOCKET_DISCONNECT(__sc) macro in order to use
SMBDIRECT_CHECK_STATUS_DISCONNECT().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 611986827a5e..384b19177e1c 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -394,6 +394,44 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	init_waitqueue_head(&sc->mr_io.cleanup.wait_queue);
 }
 
+#define __SMBDIRECT_CHECK_STATUS_FAILED(__sc, __expected_status, __error_cmd, __unexpected_cmd) ({ \
+	bool __failed = false; \
+	if (unlikely((__sc)->first_error)) { \
+		__failed = true; \
+		__error_cmd \
+	} else if (unlikely((__sc)->status != (__expected_status))) { \
+		__failed = true; \
+		__unexpected_cmd \
+	} \
+	__failed; \
+})
+
+#define __SMBDIRECT_CHECK_STATUS_WARN(__sc, __expected_status, __unexpected_cmd) \
+	__SMBDIRECT_CHECK_STATUS_FAILED(__sc, __expected_status, \
+	, \
+	{ \
+		const struct sockaddr_storage *__src = NULL; \
+		const struct sockaddr_storage *__dst = NULL; \
+		if ((__sc)->rdma.cm_id) { \
+			__src = &(__sc)->rdma.cm_id->route.addr.src_addr; \
+			__dst = &(__sc)->rdma.cm_id->route.addr.dst_addr; \
+		} \
+		WARN_ONCE(1, \
+			"expected[%s] != %s first_error=%1pe local=%pISpsfc remote=%pISpsfc\n", \
+			smbdirect_socket_status_string(__expected_status), \
+			smbdirect_socket_status_string((__sc)->status), \
+			SMBDIRECT_DEBUG_ERR_PTR((__sc)->first_error), \
+			__src, __dst); \
+		__unexpected_cmd \
+	})
+
+#define SMBDIRECT_CHECK_STATUS_WARN(__sc, __expected_status) \
+	__SMBDIRECT_CHECK_STATUS_WARN(__sc, __expected_status, /* nothing */)
+
+#define SMBDIRECT_CHECK_STATUS_DISCONNECT(__sc, __expected_status) \
+	__SMBDIRECT_CHECK_STATUS_WARN(__sc, __expected_status, \
+		__SMBDIRECT_SOCKET_DISCONNECT(__sc);)
+
 struct smbdirect_send_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
-- 
2.43.0


