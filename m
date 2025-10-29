Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40AC1AA3F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0+3y7RdTjGih8EkiQLzLp/DBbv+XviHIHTvFfoaUu3Q=; b=qkEftjwZnqtXxwjReQvs0Y4tNW
	IPC/6oOwRM5Lp3BiTSy2Xk0VhT9MoDd5sdGcQESWQwEnLVGzZJG205zmL/JrTgukqc8K14FSzvCus
	PEvny0Vo7dVURBToHf2DruaQyCJqzfA8NeN+0S+nmandaVt1bmyjtf9RhmIUNxH/phLK+/Fv75v89
	Pm3tvL/pYwtpdkJzeXzoZrMgqPeGfeCbvDd6ug1DKp5egCdBf/n3qA4EZv1ysBBBrUa65xjIT3gII
	8X3tprWtrW2KfMgrmNF2Z5SmtfF+wJ1IoA4v0yw3BYON45HLtJpLzxNt9YBhdvk1hRjkXjhOhpnaX
	9uzrPQfg==;
Received: from ip6-localhost ([::1]:29266 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE69c-0095Wv-Mq; Wed, 29 Oct 2025 13:23:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21004) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68o-0095J1-Ta
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=0+3y7RdTjGih8EkiQLzLp/DBbv+XviHIHTvFfoaUu3Q=; b=sbOVsNFYTXw6qudRAGZYHpJZFH
 74OUjXmbIhgTSa0mr7ENZkGFcAhLXZ/e0xqSvQF7Y8uOEqJMRKLqN9T8mgC6N3RPn9j2CGZriw99y
 cAUZtzOLYQ72MigSFSgxPqRZ81lIdo66lKkiwupxuBFe4YBq5rYXVXL2Iy5D8A94uuEsbvMlziK6A
 y30nCJb68Yl4WmO241UpQpMFtZRJO033FTyDZgVmd15vWqvfTSCZ4U1S/Z3f5OSthqviFqmy55i7v
 DuXHaaqgOozsOA/SPEOmvfwS0UWsZ9blOLYeGr4xk06r/jcFJuRWnE+Ig7kculEEMnU+DelSHbZOi
 W9/UWCG57ZPsqhMg8myyLy+uSTQCNslNhlsgLrpIfM4W2RfMrh8PG/AAuFnIpXEriHTVAP1PKj9PV
 JFOKqDqO0dZ5EUgX9qgVf7DpysGBQaXmVFtp5CyKYXrS7uRrE2P79p4w14P4aF/UXF+7S6VYY5ZlC
 D3Bymcro0AKrLpmCXikbf6qM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68m-00BbFL-0p; Wed, 29 Oct 2025 13:23:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 005/127] smb: smbdirect: introduce smbdirect_internal.h
Date: Wed, 29 Oct 2025 14:19:43 +0100
Message-ID: <d4dc3baa7bdde32e283883469be10cc2b1d6eb0f.1761742839.git.metze@samba.org>
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

This will be included by individual .c files as first
header.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_internal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_internal.h

diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
new file mode 100644
index 000000000000..0727b9fee879
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#ifndef __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__
+#define __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__
+
+#include <linux/errname.h>
+#include "smbdirect.h"
+#include "smbdirect_pdu.h"
+#include "smbdirect_socket.h"
+
+#endif /* __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__ */
-- 
2.43.0


