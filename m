Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C042C1AA39
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0EgTWRMvRBH08xV90+7doxf8PSfYEWvDqLinvlYkZgk=; b=zvODedSGCg4laBLz6P6vFiUqTr
	315XAOpkQDTU65qoPymQ/FBqmdB0zbnjL7AZVO9X50RR6PsXsBQAcZlTN7UsKmBjeaQeDDW+zTcNp
	mZ6ociu6SO09D+Sr9K8hlKENAEgnL8BNtybgZiGBr9Zu1HwUpa/bzgvFvfnMQXa6MsaZDv40fIcyc
	ZAL/rP2nvpvvCp01glj29Jvn6sXBYLsbzSZ0DOjTn2WETaY5N61awTvgkN5OgE4d3TrfUA20chHR+
	ZvYNiZUjp2RQ8EforS29M5ub2c3R4ltilDeL9uO9I2LYzMELhdj4wrzrignM9r4coCZViS7ZY/TCu
	uY+TcTGA==;
Received: from ip6-localhost ([::1]:56928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE69W-0095PW-JD; Wed, 29 Oct 2025 13:23:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58926) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68i-0095G8-83
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=0EgTWRMvRBH08xV90+7doxf8PSfYEWvDqLinvlYkZgk=; b=EqU00/4g4Zjh3Wv9UaitotMQuZ
 3rfiwnT4FHnUsgFmbiCGoQLHb2uDNwdlkawSTqHWWn3ryo4vlLJ9YycMk95xwTs1Qd8a1G1oewyaW
 A49cwnT9ge329QFMKjLfmMuSqvgoe5K9QqQqTSnDLCgAy6kdzHyDW9LEJLo3TIBKlgKr/3zq9RiX1
 vUgVnLLp1RwgQeBAsm84O9BB3a+sJtTyGCScBLJogIUw9pXvWNHdFYoAt7CI2qiMNWT2qaEDxuKOQ
 8bAn0xZOpzUz6YVifxXxXI+1AqxSxtbQKugB1IMsDyRU5AIlo7mkkb0VX8/nZIgyLu1K+DY4DS2Af
 nKQbJFPT6rUDQUbI96yrFd3LftZ77EeXaUjUKkGrpDoeR4M4+ykxSB0v1uE6mT1GymTi02xZjNJJJ
 PHP9ihgRRE2IbYTxOx7PXHBE5hUpabaozEwQW1DCXj27OdjBCNK0N2JdPGzbiyQSxVrqZKYPhIRom
 1KR/urkSwLDigBYcODvgHyxN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68g-00BbF9-2F; Wed, 29 Oct 2025 13:22:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 004/127] smb: smbdirect: introduce smbdirect_all_c_files.c
Date: Wed, 29 Oct 2025 14:19:42 +0100
Message-ID: <a4b06a87a19e511ac63be351633b900a4941d1f6.1761742839.git.metze@samba.org>
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

This is a very basic start in order to introduce
common functions, which will be shared by client and server.

As a start smbdirect_all_c_files.c will be included in
fs/smb/client/smbdirect.c and fs/smb/server/transport_rdma.c
in order to allow tiny steps in the direction of moving to
a few exported functions from an smbdirect.ko.

Step by step this will include individual c files
with the real functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_all_c_files.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_all_c_files.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
new file mode 100644
index 000000000000..610556fb7931
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+/*
+ * This is a temporary solution in order
+ * to include the common smbdirect functions
+ * into .c files in order to make a transformation
+ * in tiny bisectable steps possible.
+ *
+ * It will be replaced by a smbdirect.ko with
+ * exported public functions at the end.
+ */
+#ifndef SMBDIRECT_USE_INLINE_C_FILES
+#error SMBDIRECT_USE_INLINE_C_FILES define needed
+#endif
-- 
2.43.0


