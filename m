Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19DC826E4
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 21:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wSPRnudz3y3dIXEjEDIh+SELWkEkRQArVYveZr6wYBs=; b=Mxfk4mKUgR7cIWqhe/Lc0XfIH0
	jDFww+bCUaNzIAvqpadIcQ26ajkc581CN9vPB81tQ++scisezmWHTfNnmpkjHAWbc8eZzsUt7oiQL
	OQpJ9g1/eMFGwcsTvhiW0sOlgDZVgB29GH6bxQtkIKcsd0qfmS8Q79ICggT5D85waVRmW8NWi45HF
	mNmDv/ZV5fKZaaj7aXH7XyJNXv5lpFTbkyUo6WHrL9F7J5wYIMbZEyTD6EkNnEJj9/wiCQDfICRSR
	G9DihWHEE2Vag0BPzWEtBn/EE3STALQi9AutCf7J183ke8IitQxUt5R2GYD0y2GcSYyR1fQaBa/rr
	o9Ue8+qA==;
Received: from ip6-localhost ([::1]:42264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNdO3-00D1ow-UH; Mon, 24 Nov 2025 20:42:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10878) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNz-00D1op-Hp
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 20:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=wSPRnudz3y3dIXEjEDIh+SELWkEkRQArVYveZr6wYBs=; b=kOEYyeRAIajJ5Ucporq0IwTaJN
 pd4XgZpxsIFBxuo3AklW1aMhIWxcYYys5Xj9RUGzXjeNEjkU3MIMZrFkjiuCE1dwQwTEMac6jHBkq
 WmbCe9CBRjiBqENr5yvZIUuCm5yyMfwTOFJjErYE+w4oL0+C5U0Chno9A7gtD25yOqgCLgsrAEhlF
 rZic2RWnhVX5JWFkigs4qoVfrpAxR/ma8KvtVwRagMcnDNW5qPlQXvmTozWJ/BA6f6udGIKB4b3el
 An+yK/7Vs2b49rZCU4i/VuqldfwKpCUbV0gzPD9u/IFgvXMeJLVc8+6o9hSOMIjw1IZzewfkZzcnw
 udgdPV+FtKodeOKcUYOq6flHL/0lFutBeejv6tYZervmFL/TT7L7Zr2kXSV9yVHizeGuTCIKmCCm/
 bYhxVnpOvhJckaW+sGuH9djRdWkZ0qf86fv5YHgS/cQMsTmOHe1GpH4z+kGrxSHfpG6PTzSmGMffd
 3vNAx0Ao8djt4Jd7olef/I64;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNy-00FSWL-21; Mon, 24 Nov 2025 20:42:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 2/4] smb: smbdirect: introduce SMBDIRECT_CHECK_STATUS_{WARN,
 DISCONNECT}()
Date: Mon, 24 Nov 2025 21:41:45 +0100
Message-ID: <15b339454570e9b13c03d91ec7014afbfa731a97.1764016346.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764016346.git.metze@samba.org>
References: <cover.1764016346.git.metze@samba.org>
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

These will be used in various places in order to assert
the current status mostly during the connect and negotiation
phase.

As a start client and server will need to define their own
__SMBDIRECT_SOCKET_DISCONNECT(__sc) macro in order to use
SMBDIRECT_CHECK_STATUS_DISCONNECT().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
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


