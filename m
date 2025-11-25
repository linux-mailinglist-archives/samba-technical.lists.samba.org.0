Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A12ADC8681C
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4qJv5OdAyX15EHqcuUE4I1SY1VsBTmSSmMErw4RxFwE=; b=KeK0g7L34zuNnSBwZ2CP6YsG/+
	qBZbA5wP0dXcmpuKcVvp0cF3axT30B+lZxUso1zZHiuWq6gpTPWfiFnCIbkUJoz81LQf3JznGQn4Z
	W9C0oUfwbFaC/IxFNEWJIQULmt+8Jfh8/Gt49LYtyKPiI1olYldi6PyApp3AP1ZMy1LripRwQHGM/
	7jSkXoC4R7pe+CO9Ye8FuSdIWA/c5uW6sl8CMm52slEUXnhT/+60r3XrjX9XoXwHAjwjh0HKPyJJs
	c4PAuubKkMzBWofQNG476uphMjheE0k1DZUYWjWJnHDfNgVt2avzAjVOf+nOi5CsIvQbvnjSQ8ONq
	0pz9a5Lw==;
Received: from ip6-localhost ([::1]:32310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxWM-00DBHZ-Ok; Tue, 25 Nov 2025 18:12:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63512) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQS-00D9Tm-AC
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4qJv5OdAyX15EHqcuUE4I1SY1VsBTmSSmMErw4RxFwE=; b=M4P+Z6kqqWHkVMCGfUOq6V8h1P
 MKLFQlJOBwjt0Pa4+ns+m97NqeWKoZp/2uNWpeDhcBKyLidXiQeWx/Rw6QTvTPhf88ltUR5pzyQP2
 VgPWkHK/OWrzekseXz0AV3Q5sr6yH6XyoS5X6j1adXvs7IISybkZ7IjQIWRQhmJ8KRShPrtnj4Geg
 ikpZgt/rcBrol6DV/gJXauXRD//rB1Vx0wmZjOY+thbr34FC84x7EALkyWpp9MxxceBirS4AsPzGF
 UpjrzdJCQ8f79uqD3GcR9mg5HDJ7xu0Lsx42VL1cW3ztdTqdYpGYVgsLiZD7HEQbeXx2yTeqyEglJ
 T3/MuCKPpZsSNH7/oL9nEfqRnQaYDJcsckyjkOzOTdp91LUmJOky+jEVt84mgdh/xtvjmg6Z/Xqkg
 ldrEyu0bxvOf2gq/S3kHA+pIUm7KhCnIRdadsl5ImVAVwxUsfhaUP/am83reymgSJLc9HiZU0DvUr
 mPOStqJWzztRWT5M35NB2+VW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxNU-00FdZt-1M; Tue, 25 Nov 2025 18:03:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 060/145] smb: smbdirect: introduce the basic smbdirect.ko
Date: Tue, 25 Nov 2025 18:55:06 +0100
Message-ID: <b4bca8a5c664e030d1d6680bf369a2df140f1a63.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This exports the functions needed by cifs.ko and ksmbd.ko.

It doesn't yet provide a generic socket layer, but it
is a good start to introduce that on top.
It will be much easier after Davids refactoring
using MSG_SPLICE_PAGES, will make it easier to
use the socket layer without an additional copy.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/Kconfig                               |  2 +
 fs/smb/common/Makefile                       |  1 +
 fs/smb/common/smbdirect/Kconfig              |  9 +++++
 fs/smb/common/smbdirect/Makefile             | 16 ++++++++
 fs/smb/common/smbdirect/smbdirect_internal.h |  9 +++++
 fs/smb/common/smbdirect/smbdirect_main.c     | 40 ++++++++++++++++++++
 6 files changed, 77 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/Kconfig
 create mode 100644 fs/smb/common/smbdirect/Makefile
 create mode 100644 fs/smb/common/smbdirect/smbdirect_main.c

diff --git a/fs/smb/Kconfig b/fs/smb/Kconfig
index ef425789fa6a..065c0aa130e7 100644
--- a/fs/smb/Kconfig
+++ b/fs/smb/Kconfig
@@ -9,3 +9,5 @@ config SMBFS
 	tristate
 	default y if CIFS=y || SMB_SERVER=y
 	default m if CIFS=m || SMB_SERVER=m
+
+source "fs/smb/common/smbdirect/Kconfig"
diff --git a/fs/smb/common/Makefile b/fs/smb/common/Makefile
index 9e0730a385fb..e6ee65c31b5d 100644
--- a/fs/smb/common/Makefile
+++ b/fs/smb/common/Makefile
@@ -4,3 +4,4 @@
 #
 
 obj-$(CONFIG_SMBFS) += cifs_md4.o
+obj-$(CONFIG_SMB_COMMON_SMBDIRECT) += smbdirect/
diff --git a/fs/smb/common/smbdirect/Kconfig b/fs/smb/common/smbdirect/Kconfig
new file mode 100644
index 000000000000..d8d8cde23860
--- /dev/null
+++ b/fs/smb/common/smbdirect/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# smbdirect configuration
+
+config SMB_COMMON_SMBDIRECT
+	def_tristate n
+	depends on INFINIBAND && INFINIBAND_ADDR_TRANS
+	depends on m || INFINIBAND != m
+	select SG_POOL
diff --git a/fs/smb/common/smbdirect/Makefile b/fs/smb/common/smbdirect/Makefile
new file mode 100644
index 000000000000..bae6281fdd39
--- /dev/null
+++ b/fs/smb/common/smbdirect/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for smbdirect support
+#
+
+obj-$(CONFIG_SMB_COMMON_SMBDIRECT) += smbdirect.o
+
+smbdirect-y := \
+	smbdirect_socket.o	\
+	smbdirect_connection.o	\
+	smbdirect_mr.o		\
+	smbdirect_rw.o		\
+	smbdirect_debug.o	\
+	smbdirect_connect.o	\
+	smbdirect_accept.o	\
+	smbdirect_main.o
diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index a2018670749f..eecc8f6b197b 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -14,6 +14,15 @@
 #include "smbdirect.h"
 #include "smbdirect_pdu.h"
 #include "smbdirect_public.h"
+
+#include <linux/mutex.h>
+
+struct smbdirect_module_state {
+	struct mutex mutex;
+};
+
+extern struct smbdirect_module_state smbdirect_globals;
+
 #include "smbdirect_socket.h"
 
 #ifdef SMBDIRECT_USE_INLINE_C_FILES
diff --git a/fs/smb/common/smbdirect/smbdirect_main.c b/fs/smb/common/smbdirect/smbdirect_main.c
new file mode 100644
index 000000000000..c61ae8d7f4f0
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_main.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
+#include <linux/module.h>
+
+struct smbdirect_module_state smbdirect_globals = {
+	.mutex = __MUTEX_INITIALIZER(smbdirect_globals.mutex),
+};
+
+static __init int smbdirect_module_init(void)
+{
+	pr_notice("subsystem loading...\n");
+	mutex_lock(&smbdirect_globals.mutex);
+
+	/* TODO... */
+
+	mutex_unlock(&smbdirect_globals.mutex);
+	pr_notice("subsystem loaded\n");
+	return 0;
+}
+
+static __exit void smbdirect_module_exit(void)
+{
+	pr_notice("subsystem unloading...\n");
+	mutex_lock(&smbdirect_globals.mutex);
+
+	/* TODO... */
+
+	mutex_unlock(&smbdirect_globals.mutex);
+	pr_notice("subsystem unloaded\n");
+}
+
+module_init(smbdirect_module_init);
+module_exit(smbdirect_module_exit);
+
+MODULE_DESCRIPTION("smbdirect subsystem");
+MODULE_LICENSE("GPL");
-- 
2.43.0


