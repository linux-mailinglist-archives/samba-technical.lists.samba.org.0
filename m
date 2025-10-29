Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A60C1AA16
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bHPRqpShbMsgYVZpmuIAVAaARgUCetwqD9ByYTtkEyo=; b=WUXQuM/gc9DPvQOcJpYI3q0Qxy
	glCZWnYcAWEakypJo9211JKRH1bo5JJxTzncouucnhfaJro/p0rWrP9Wx4krg76DEZgWzPwQZ2g0O
	1vSm6IJQOKKLScXWuI6prEb02JAKDY6DXnk5gGGwFiXVejY5EDpqAngkvxFem/EpGtO2uO0c1Jjh3
	tMw0YhlHnSrGNcdJaichhrzpF8FiH4VkBPr07go+tR2fSCXqUi2kwKRNLZwLQyVp7SPTJbUJd9ZHt
	fyBAqq5cfvaOLKa+rW0SO/KuUhRNnfjchMd1L9AC5VQ4miDMSZz0YXBtwGMEAze3zMPTqR4A9PNWu
	pYM6ouPg==;
Received: from ip6-localhost ([::1]:26430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE68a-0095DV-FO; Wed, 29 Oct 2025 13:22:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43640) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68V-0095DO-1Q
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bHPRqpShbMsgYVZpmuIAVAaARgUCetwqD9ByYTtkEyo=; b=Ko41oHq8KxJHbmsHLcm3/sQRsR
 oXdiXUH5eoUwBrk2rmz35gKDO0MmNoJRjWGoau9TfpIzZk5VWiL4yWfWgvzNvQSajuC0Uae9Z1y6q
 mKOmrs9QrIucIBV3g4VSc5WsyurrFV2szWPQ1+SuJSAKxufBbmI9lCF5Yih3l9eIiHffPgQ4orDJi
 k6lui/QMcIIU2fyjA5EtYdLQWf3pgU9aoANYKcIwsge6gaflFWsQ5R3G/B6kxvhD1Hz5yzDxNuLub
 sQNSLHlKOkD6WUKZHELVWP/u5CV81ny8xmWBivUwk6on7+0QHv/fUZwlXYqMqDf2+gWMnT1OxQha8
 U0DY0aX7vGQnES9F8GkfqJEf7X/TLFxToj4SdX7mTS+qH7Hr4nQC8OStNWPCW+0O7eEyCWVBCcAWC
 zxMBc+Q+9PBdfa3NqZnuOv988qoBRSAngrQZQR8NCGV4HoXzEK1lGGNIKfprR4JDLxlU/217CZJsu
 vJtDDkGHNb2KnCQMMx94h8SV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68U-00BbEi-0V; Wed, 29 Oct 2025 13:22:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 002/127] smb: smbdirect: introduce
 SMBDIRECT_DEBUG_ERR_PTR() helper
Date: Wed, 29 Oct 2025 14:19:40 +0100
Message-ID: <e3a67cdeb67f13bb80d5b04d1809fd3fd68fd9bb.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This can be used like this:

  int err = somefunc();
  pr_warn("err=%1pe\n", SMBDIRECT_DEBUG_ERR_PTR(err));

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index ee5a90d691c8..611986827a5e 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -74,6 +74,19 @@ const char *smbdirect_socket_status_string(enum smbdirect_socket_status status)
 	return "<unknown>";
 }
 
+/*
+ * This can be used with %1pe to print errors as strings or '0'
+ * And it avoids warnings like: warn: passing zero to 'ERR_PTR'
+ * from smatch -p=kernel --pedantic
+ */
+static __always_inline
+const void * __must_check SMBDIRECT_DEBUG_ERR_PTR(long error)
+{
+	if (error == 0)
+		return NULL;
+	return ERR_PTR(error);
+}
+
 enum smbdirect_keepalive_status {
 	SMBDIRECT_KEEPALIVE_NONE,
 	SMBDIRECT_KEEPALIVE_PENDING,
-- 
2.43.0


