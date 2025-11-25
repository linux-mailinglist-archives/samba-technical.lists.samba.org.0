Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56224C86575
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bqIVzD/mSlrQC1NzWaIrNP6ys7jUNsLCqnfxEag7+w8=; b=T8JJdYgnyXei86L98T9HOfW05t
	nF7T0byoVUPEnGo3cGpe22PvrOyO1IfK9Q1Wl9OHzgbHP5llvroPYQT+rNLK9TElKHMGW2UTP+umq
	MeQwTF+8y+zO0T+f6XBfG0d5qDhkGt2+Lv26ZMWcVDkXQ62wMzOiPAcb4A7805jRtLsqN+qcxDwcC
	yzi5Or0DQmxWZw/3M7WCuznVkDLtfLrG/Z2Jw7WE1XX6UmqwIBY1KRmn/zIiA4pTLXSI7HtFRFVLF
	Q0FuidWWM0a7T6uannjmrj3fcubpC8hiQTMySF0ydzCW9Nl7rQq/XnRbElHhjUT2R8TqSvH2YFv5R
	z+JYGPmw==;
Received: from ip6-localhost ([::1]:59850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxHr-00D6at-Gh; Tue, 25 Nov 2025 17:57:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32506) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHf-00D6Yr-MI
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bqIVzD/mSlrQC1NzWaIrNP6ys7jUNsLCqnfxEag7+w8=; b=Uo2coMEPNxAzspYE7V3YIWYZ64
 b5wwJ9J57AYowMTqlzS36/VV1iXFOUIE37ZoVqUyeXIFO6pxBokfjAQU+ejH8a8I6snshynxbobAU
 qJNhQbrTnI+Etug+CAeZeZtGcKaeyl04VNM6PktUXUPEOuI7YIbRStggoUdLTukDmxytqw6KzNkqh
 svhEM8auSugsQPxuDln2+kLt+nxT9x9QpxPHwulKN3zGKGTefQ3hlDxI5qAS5gFg4FSFXlMSM6MNK
 hqHzl/sMEdlhduUk5dtWTONt5gghZ+3qMzZxUedLaAUGE8m8EiF5SXLwO1D/zW1v+eMYGKyuUhdwW
 piEIbDW8cTkJzKD1RTVveZbg/l2tTwkDUnmo4vndNlRBVZKzLyAZrblK6xynROHPeXLKkY5ckkmGr
 KO1vy5YPqrvhyPWPHq9d7S51wgFDCY6B2LwLbY01quIw1feVU/BnebOxp3lAmrsIEL+32EEZ/jBDF
 6G8o+hlotuDI/+lbxUdfHmfM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHd-00FcTV-1S; Tue, 25 Nov 2025 17:56:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 003/145] smb: smbdirect: add some logging to
 SMBDIRECT_CHECK_STATUS_{WARN, DISCONNECT}()
Date: Tue, 25 Nov 2025 18:54:09 +0100
Message-ID: <9e4f4ecefa69ad9979bb4bb5547aaacd3ddb2260.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This should make it easier to analyze any possible problems.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index f449fcd30235..cf8a16d3d895 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -535,7 +535,6 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 #define __SMBDIRECT_CHECK_STATUS_WARN(__sc, __expected_status, __unexpected_cmd) \
 	__SMBDIRECT_CHECK_STATUS_FAILED(__sc, __expected_status, \
-	, \
 	{ \
 		const struct sockaddr_storage *__src = NULL; \
 		const struct sockaddr_storage *__dst = NULL; \
@@ -543,6 +542,26 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 			__src = &(__sc)->rdma.cm_id->route.addr.src_addr; \
 			__dst = &(__sc)->rdma.cm_id->route.addr.dst_addr; \
 		} \
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO, \
+			"expected[%s] != %s first_error=%1pe local=%pISpsfc remote=%pISpsfc\n", \
+			smbdirect_socket_status_string(__expected_status), \
+			smbdirect_socket_status_string((__sc)->status), \
+			SMBDIRECT_DEBUG_ERR_PTR((__sc)->first_error), \
+			__src, __dst); \
+	}, \
+	{ \
+		const struct sockaddr_storage *__src = NULL; \
+		const struct sockaddr_storage *__dst = NULL; \
+		if ((__sc)->rdma.cm_id) { \
+			__src = &(__sc)->rdma.cm_id->route.addr.src_addr; \
+			__dst = &(__sc)->rdma.cm_id->route.addr.dst_addr; \
+		} \
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR, \
+			"expected[%s] != %s first_error=%1pe local=%pISpsfc remote=%pISpsfc\n", \
+			smbdirect_socket_status_string(__expected_status), \
+			smbdirect_socket_status_string((__sc)->status), \
+			SMBDIRECT_DEBUG_ERR_PTR((__sc)->first_error), \
+			__src, __dst); \
 		WARN_ONCE(1, \
 			"expected[%s] != %s first_error=%1pe local=%pISpsfc remote=%pISpsfc\n", \
 			smbdirect_socket_status_string(__expected_status), \
-- 
2.43.0


