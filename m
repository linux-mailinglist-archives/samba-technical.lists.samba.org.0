Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB0C1AB30
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:31:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pfC+cCjTHct7mk1V52JruYkp2LBY0zWVMoqgwj8Mnc8=; b=LTWfU8ogj4c/zMkVBO+pDqUjC6
	aC+IR+xiPi61WvfjwQB0VfP2ua6djtEqHLeE+uJbeIrFe48ZfcQhuxeyJr7eIdwrD33zUOEfb8Mk1
	hsQKzQhrIrd5jWtY/yRWis0mk2GziKIKEEcPZvE/aZ4R89mN+UfBugFJmAYKvJedNckwDdLC0+ULv
	uA0LU9XVDonj28nRQtdPmWlwRbzTz0mf0BNI/CJPbACLINTZv02CXNTycEJyjpXc/gthjr2XPdd+J
	IAH25HNxqsx/VGnSKyx2Ld9GtcAjsXs7Vs1aD6+lkWo39QMVtTLl6g8IwJxzKVYM9bdzgl0J/U+Zk
	52aZEKGQ==;
Received: from ip6-localhost ([::1]:46134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Gb-0097kK-Eq; Wed, 29 Oct 2025 13:31:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53190) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ba-0096Cn-02
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pfC+cCjTHct7mk1V52JruYkp2LBY0zWVMoqgwj8Mnc8=; b=QeHCZq7wI0UCEYFE5glOcpZgxf
 4eL5Z8LCfiKdYyhoQgvdzLq3+4PPq02kYN0nWlk30p1Un6moWE2752dhApB8QS3d84UlIglw5wVJo
 G+aaVScbfFuZBU/nApn3ZuesRprO1IfUPta6rPXHuSuAGz3jrARbRnFzQ/RQUbrscW8qeqi1i2uV6
 peXsQv8Ayyob45GFeEAbU+rIDQQoZgQ0VdC/9p2PjCBxiGOJDph0VnQGfGFhx/g8Tr1J8BJlInp54
 Pn7tN1Jj3lhHMrc0t6nd1FguCm1+X3CWCfKMacbEUexSnMvhNnUa1HQNKLxZDt4hUQunCtSC8iqd3
 OLBP2O3N/ssJNHJh2cQ33LhvHlSRVlM++GpyTkGRE6hLcJJRQMOxRAnjpFzHiyKL79xyuhejbwNnW
 eZB5PSQT2AtV4x3aFne1Hm01Ie8pn34tWYGwQD9N4ynIOMWTCFqDUoQnfjagqFTa5a06q9pD11qCj
 nq56N2WURAI8En7WzUHrUY8e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6BX-00BbhG-1I; Wed, 29 Oct 2025 13:25:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 034/127] smb: smbdirect: define
 SMBDIRECT_RDMA_CM_[RNR_]RETRY
Date: Wed, 29 Oct 2025 14:20:12 +0100
Message-ID: <389edffd757302120f2adb5a7385eb6d50d9a204.1761742839.git.metze@samba.org>
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

These are copies of {SMBD,SMB_DIRECT}_CM_[RNR_]RETRY.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 14c5d8503fca..795ce4b976ff 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -655,4 +655,13 @@ static inline size_t smbdirect_get_buf_page_count(const void *buf, size_t size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
+/*
+ * Maximum number of retries on data transfer operations
+ */
+#define SMBDIRECT_RDMA_CM_RETRY 6
+/*
+ * No need to retry on Receiver Not Ready since SMB_DIRECT manages credits
+ */
+#define SMBDIRECT_RDMA_CM_RNR_RETRY 0
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


