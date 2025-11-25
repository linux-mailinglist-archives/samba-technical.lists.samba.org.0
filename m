Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0CC8562C
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 15:22:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=D/JkWB35XQsNbHhZFKGF3tXGeza4iw8+rQmW/843H1k=; b=y+mRdcYC4AR31PKHEcjB7HsXTG
	7RjxKnLqiMyGKL/Xm0+Bir1bJYUkdn+PQ1GH4Zb222yp+TvDcRs+lEU5RifgiMAqlxxrTPw9I0+it
	G6CnjUNkumj4cclczlg0BNM+snrQbqO91NtjXwALQq0/Na0q8SUaRihh2OCsQ1ohGrvCxxE1VIx68
	AkYo4wxzwqatMnggjSFU31dTftQm3ONBgm0KNzJETyaAWgYdtASeuyApWZgtS8rHjhBoTQY/ohoLI
	KeV9D9yzt9KRI9SedDSmyieMqPp4LojKVcfOYZOnnutg99B2gkKKQrgG4tsxXSIman3C3Y/KD9cWW
	FHagPXLA==;
Received: from ip6-localhost ([::1]:45018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNtvn-00D5aM-HA; Tue, 25 Nov 2025 14:22:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24268) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtvj-00D5aB-Cl
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 14:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=D/JkWB35XQsNbHhZFKGF3tXGeza4iw8+rQmW/843H1k=; b=kXEEN4tVgQ9WqwSGIvLLZ9GN/6
 tBA72E9C02zy1D27B+AaYPCPzkiGtq9OGuUltJGtG2f0hJTd3yfHct6KJh+hp0rHwgBlTC22pzjxp
 ytA2iWXRbkN4qYOnITX92nEULRPmWfq8h065H+tjogBps8FwVnjwsjHz+BBL0MYdmZgqjMepYcCOp
 3QpsMLB8tpDoQdqV78I9nopb/20NVT3fGLp5lS3iFwtx7VDO+kquMJWispWV62MDZVRhUiNg5husu
 9y0JRDdlO11czZCgIUIvMn6u4kcJHZckwDcDbyV8ic33RbyjvB8OptOggC6LbSrdya0xBNN3OQOUM
 ZL4b0DOnKetlo0pRV+JJXoWl+CuTMJqMSUfMoD9pSEurFdwjlE748sZCcBnxsDgxhkYPUfxbGy3r3
 0DPkn8gZLe0UXsxy1tqO3rfcwkfrqKaB10G5MuDqOCGPy8G8+ol4kaIZaR3if29dOIziLESy/ckSv
 /4o0vb6Ovx+9d0B44QHDaDZ9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNtvi-00FatA-1n; Tue, 25 Nov 2025 14:22:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 1/4] smb: smbdirect: introduce SMBDIRECT_DEBUG_ERR_PTR()
 helper
Date: Tue, 25 Nov 2025 15:21:51 +0100
Message-ID: <bfe7fd13d3e532a615b3d7855edf585a7c4eefc8.1764080338.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764080338.git.metze@samba.org>
References: <cover.1764080338.git.metze@samba.org>
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


