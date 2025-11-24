Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70744C826E1
	for <lists+samba-technical@lfdr.de>; Mon, 24 Nov 2025 21:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WsY6RKPrC3cMsQYr2AyxREi+VSSiGojNgEpbR+NstlQ=; b=Ca3v9ij7pJxfO86hhyja12tjzU
	qam/6tpEaS9J3HXV7Tcj8wNnjGO2PRn3aYP09tq0tOzDmD71Sv+6FuoPQvEEkqgUowhiheTE5DXMA
	o5dG0rJ8nnWPGtOq+AvtBSZqhMf/ONNxp/1HA+jgIAmsVSgTn3kxlk8NRDibpQZO0/yjrxu83Jymb
	ZP1UTBqDalu4VZziV1KYVCm+jrDqi3yMnmJaEsAbTPbM/PP/OfF+lXhSKAhqLm8JNWdUj4LZ+8O1Y
	a3y7vJ6xE8ohocnHaAmEPdJTumAAxfGt4WHWI+8y3uIKVDSzgqbQDYjIO96l+3xRDC1QedECnA9md
	lKJwj5Lw==;
Received: from ip6-localhost ([::1]:42258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNdNy-00D1oO-Sg; Mon, 24 Nov 2025 20:42:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10872) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNu-00D1nz-Ru
 for samba-technical@lists.samba.org; Mon, 24 Nov 2025 20:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WsY6RKPrC3cMsQYr2AyxREi+VSSiGojNgEpbR+NstlQ=; b=UiMk7sLjP5ZQAUJHvUbIn8H7GY
 YprLoOz2Bbz0AT2QCC9gAGagJtlVqMgAru387GvgoM0IOJ7xUO+ICiLbrrNtYFu4EJ7FpYPjVrfda
 Zw8D5kkc9S9OnCPfO4w4YuSG4I3/7DmwXlmoXAnFQrI09hSyPltsrxBDzdZY+9rnPNyEANX82u9/F
 22RZ7rgv+vlXUCVQiuxAZPx8omhH+O5NBlerrmqdhDxPbuEL90ZFTPGbvE9uBFBnX06GDE+MNKf/R
 jatQmxn43YeggjF22WtOcGJ/ANoWBHBrcvvpg7UvN+L0cuscf9dT57MQaW5jNgJ1rZBcFy7UVIbqQ
 G6LHZwAAI04o3J2BOwphap2fvV+GAATaAmXC87xrWzPdy2OnVgw+gYYwJcGhl66c0Jd3K7rCVphQ1
 gblrNLykbo026GOLiQNh6AJQbtddnX/Hxv8c+Ty/aFILbK3c6TXW2m4/fhgcBNPsK7yzi+ew/tuCf
 DnRx8pbkGLuMJlPbHl0zy76t;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNdNt-00FSW6-0Z; Mon, 24 Nov 2025 20:42:05 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 1/4] smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR() helper
Date: Mon, 24 Nov 2025 21:41:44 +0100
Message-ID: <ec95c47122e0376afec06c63ffc6d238afb9b3b5.1764016346.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
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


