Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EED7DC865C7
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=P7kzmXaq12CXSjZa+JFSudhNmy60aVOYfnD9qzkh1tU=; b=eEE1EjRhrbFjSDgTACEKSdSmdx
	9ZmrsbF3Q8yO9F0vUiLpTBTWzHMbabZ9h0ePV/XnMoDs9wmE/3kVd/1zLhGza+kfBRfzAB3gsaYMy
	5GFo4Aoy9MHNZEoscMMZx6RkCIeUIlnjZkqYi9xsfqROgzKxksUNm+bu9ffbM8vsP8X4z3WZBTJqE
	g48f9IWBl9SyPjjIIFj9WLudUl4sW+li8sbheXChq4YN0W1If99dDohamaZEP6ucmOrAcSV/UGCdS
	5lXP1pJsyUGWB0Oagahj3UKOHnP8w+rIbozXeUeuAwm1RhW8qAauK3RSqYfW51b3gGMXbca8KYLWG
	cNnYvYAA==;
Received: from ip6-localhost ([::1]:31990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxJB-00D70t-Ru; Tue, 25 Nov 2025 17:58:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43648) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxI5-00D6hm-TS
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=P7kzmXaq12CXSjZa+JFSudhNmy60aVOYfnD9qzkh1tU=; b=Iu2vHYx0W2sxtAY9JD3KGqNNiN
 v9h9MwtkaF+2Rs6NZ7t+48M3aZ610NAyVYWOxBbsveEvHkntT0tbP5IJ2Z7CgFnRBgfEPsgd7710j
 S50U2Oy+LoylrzJ35gpIYJvOswgr86fXyuveAIhaJausJvMnV4D6x0xntM2zVzpTwBz1JNCIrGh2B
 Wt1vyzhyV+8bqcnKxAQEidfxn6dG71ypcGyX4jcwanFXgvg1vykXugz0A1OSTigYV4m97jAAV/LNx
 n2ua+Jp21axPCGzAT7hwdDsUuZ6WHjTtXWVgxuPD6pE47DUMestfatednTt/2F01rZe/ZPTSjKXxJ
 Nu2mwt/PUhGZOf4DTRcwS/XzV3rHEKAjnKClh72QQZzsMW+7uy0AWeM6QwFjXKrl5+P5PD2KH/1Fb
 O10HonMre/KCcPiag6WrR9oclc0g+iznoQDc4JVNlUwEdHhDphgBVxvx+47jkX8TwEnjq0hH4Etff
 OikUUq7aqfRqhghsfwdSK5b4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxI1-00FcXN-0F; Tue, 25 Nov 2025 17:57:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 007/145] smb: client: include smbdirect_all_c_files.c
Date: Tue, 25 Nov 2025 18:54:13 +0100
Message-ID: <5b396cbc0f0cc1f0c01a7ae56009f974899f016c.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is the first tiny step in order to use common functions in future.
Once we have all functions in common we'll move to an smbdirect.ko
that exports public functions instead of including the .c file.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 788a0670c4a8..320166f5d267 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -4,6 +4,9 @@
  *
  *   Author(s): Long Li <longli@microsoft.com>
  */
+
+#define SMBDIRECT_USE_INLINE_C_FILES 1
+
 #include <linux/module.h>
 #include <linux/highmem.h>
 #include <linux/folio_queue.h>
@@ -143,6 +146,16 @@ module_param(smbd_logging_level, uint, 0644);
 MODULE_PARM_DESC(smbd_logging_level,
 	"Logging level for SMBD transport, 0 (default): error, 1: info");
 
+static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc);
+
+/*
+ * This is a temporary solution until all code
+ * is moved to smbdirect_all_c_files.c and we
+ * have an smbdirect.ko that exports the required
+ * functions.
+ */
+#include "../common/smbdirect/smbdirect_all_c_files.c"
+
 #define log_rdma(level, class, fmt, args...)				\
 do {									\
 	if (level <= smbd_logging_level || class & smbd_logging_class)	\
-- 
2.43.0


