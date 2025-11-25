Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D3C8416A
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 09:56:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=D/JkWB35XQsNbHhZFKGF3tXGeza4iw8+rQmW/843H1k=; b=V3ZCVtYgbQ9s21FOlxJeZp7BGh
	T76SRcvrdjv61EOy2nYQ4KAyUnGC+XXBBJ/3MT9w605Cv/tNvdEg8EelTCP5KdVYq7UJmrt3ugw2R
	3UK1FW8QqI7zNoHsXJqnOHOiNRV7SebYme7Vaj3s6BpVsX5I8qNPRtpGiMZ1UqxBWvvRTLXnxcWfI
	jYgRCpz//FoQhSGQHryc2s1urzNTRKwDsOBHOaRUcUQ7yMVwZvhRpAm95FbW6PY74pPsnrRGQt8cB
	XJUD2qEMPa07yubCyU8ZFnKqTMQ8za9d28/sdMzVUw+w1Rj4mWwwZuhIxtZ4LVYUlLEiGqa8q3bRF
	TiSs1PSQ==;
Received: from ip6-localhost ([::1]:60040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNoqM-00D3y4-6X; Tue, 25 Nov 2025 08:56:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12218) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqH-00D3xj-OQ
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 08:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=D/JkWB35XQsNbHhZFKGF3tXGeza4iw8+rQmW/843H1k=; b=iqHTczwpV+p18f7Z+S9HoxPG0V
 ma7WoJ54VwZX0Exbwy4bAt1SOJ31pFeCfEmrkcjhOUMeQ752+P8ozMyU0HAFrePr3UYBZ/anY7RbE
 ZnSYpOiePJUFsOebzqL08D7n18xobjs0J/0BLFdRrh6p3AfzyixrI90Q62y5uo5oWsMYJZVEKineX
 /jGARRcswhDAlSXSvzSAq/LOmoFKECQI3IfZ6LnJmq7lCXye4UVLEWA4d+yqWRqzbcBrVpSfvOZD3
 CPy0C5CvwAmmyH+GrTQOaVtXREgpddS7mDM+Ytmnw7mM7nHjltBfnNejbSisiOMLkLYCUwIEY4tIn
 R7tWZeInV/uvVXErxGRyq9VrLDiPB8/D5hijzFF/ymWFCV5/NLIppqkBJPZST5IPitVKYK2lyMWOX
 dXCKFJH1velj246t6Lmox6mnRMbcfcYWcgGRNUn0J7H9WVYlyl/W0fPbRyguxmjPOQqp2Rxkg8Thz
 xnpPKM9DpLwbHXrUeU0mvfoW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNoqG-00FYJU-2Z; Tue, 25 Nov 2025 08:56:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 1/4] smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR()
 helper
Date: Tue, 25 Nov 2025 09:55:54 +0100
Message-ID: <d62ca3c6b59271264264e93dd3001a7c3132dd84.1764060262.git.metze@samba.org>
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
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This can be used like this:

  int err = somefunc();
  pr_warn("err=%1pe\n", SMBDIRECT_DEBUG_ERR_PTR(err));

This will be used in the following fixes in order
to be prepared to identify real world problems
more easily.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
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


