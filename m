Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C1C865BB
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:58:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PUNrA2/WBdaoAW+QvA5c29shDZNDZY61L0vkRUkT/Zc=; b=O44nnizh5ZUV9yb1oV/TOx+2yG
	ToxcXO56CaUzstH66NJF3mtS4sY1G0bTNbNgAltucu9rjvIC8u0ilf1lYQJQe+YWMByJTLFJkXwHA
	9duID5Ic2V2rl85xh9Cp50yoGTgpTXAxEPXFUobOKdfL69c4y7vAKVkTYyeGV9caBjX0FEb56IXGQ
	jda7LiKIXPbvFb2M8UkvOsz1H7xVwevxPrGQ2tJZRrs1096aa/gG/mkGUjEuUseN5fK1y4SkrdB1Q
	Ek276CusHtRiyK1Zh1ZCf+32IaOWLniIK/9g8X4x26fR6k+GasS0Sl289XnaHWyHEx53N/myFuYMK
	DkwbGzsw==;
Received: from ip6-localhost ([::1]:24728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxJ2-00D6vc-3h; Tue, 25 Nov 2025 17:58:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43644) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxI1-00D6gp-Ti
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=PUNrA2/WBdaoAW+QvA5c29shDZNDZY61L0vkRUkT/Zc=; b=AvQB1sV93ew2ocehWu1Dywo08I
 YJ4MJBMaSQyUVxALDK7ILubHdrYTrHGvyVkLgsg6Jv+5hEt2WO+rObkghmJDkpCfQ8rDS8cA44jfJ
 rbtHO98qlrtBWvbLU9UhBvbWDVuf9Zukf07q8dAXUC3NIwmhao3CNB7t9jfzSmMY98xJIJfYn4Eqa
 am2LMb9Z3EPsPDw0It7rZia0nfIAOtsOfAoaqhzslx4KT4ycyo3U91DoRj5uuSwo7F4pxEWuqiOax
 3ur3dwYmi7c+hXtclYjdHh1mK93Db75gtsCdG5gMP6bY7B6m01/sB8Xblacj3Mn+CAuDi/KSsh1L3
 R+M4J7qoeo9YGSEz5gp2AmFyz1M9AALNLSiakPGrXsuO+QFpMSqomClN8mUS9adYeNZzv2dQMY/xP
 t+IKZ6qjWlMc/1GTKkoy7VGnoFOahQFUvLpwghsaacIImLS6VhNlX7UjA1vWxk0oJbb4NVGj/8hOD
 i1QVejaAjaLMNaDmUu7DwRsQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHv-00FcVf-0h; Tue, 25 Nov 2025 17:57:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 006/145] smb: smbdirect: introduce smbdirect_internal.h
Date: Tue, 25 Nov 2025 18:54:12 +0100
Message-ID: <3bf83ddcecd56c6c25d42f67b2c3365287aa53ae.1764091285.git.metze@samba.org>
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

This will be included by individual .c files as first
header.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
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


