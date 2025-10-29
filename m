Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C483C1ABFF
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Edtvz7J13GK7PrKL+/9EWcNSb/xlAPA7kvQBkMU3lss=; b=Mh0Ma9Lu9XNIKoNNj9gei6emTs
	3L4pyea3qD5nVakfQQegkmapB31wk0zTRvq8OiWHEb/QaOIAZSx9+KIMNq11YtLGiVg6AqWImFucN
	+W+OzKqLCyW1UvD/5RuxHdt/c54nAX0HMVftuX863pGSUR0SroRsyemNOWwK48vLpa9Mb23DxpluS
	UD/+m0c7DzxJYz5z4QTrcTTstOdzLUHNEB8+OEYqB8POCY5F6jC6U6gce+VNlcTs435rthu0LcvZS
	aufQZoA7U7nvnp8S0zi7wdcifnVRtv4dV4HxmTuLoiqpg8POGF2mDBhXoo9DZVEt4t7d8LmygU+h5
	jDm1EUhg==;
Received: from ip6-localhost ([::1]:20752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6LY-0099TX-NA; Wed, 29 Oct 2025 13:36:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54262) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Db-0096rI-Hy
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Edtvz7J13GK7PrKL+/9EWcNSb/xlAPA7kvQBkMU3lss=; b=R6+eWqhsFVbFrHASwpEN6MtNhE
 UJBugJewB2zdreM4hT4AwKVLQu2qoDnRA3RLgfc+4aE4Obw6jy+ZACAHlfo7xQdy/CDYFlmOwPy3t
 8caecqfohdyTEOWEQhOdHtXOKysgVlmtr7lTnJu0Ro/BRGMVXahJRKJp+MejgDBhEKiinMADE54D0
 I/oMTAGCspfPESUXGVDkZHOnvM/EtwOYbrEniPC9E3KbCkwYHbzItSxl+7hbtYHHEr1ueMv2SImLM
 22XhEogwhc66aVInihh8nWliPik0eFSl5v7wvL3S8ApBlEaQJ711yMUU+e0WqLxU6PrL+9bvHHKZM
 D2k110xUOfts4aU8+J0kyZz/ucIWXlgcgf9Txz/7JRDGKNX1BicflfZElXskchUXGveHA9boEwWTL
 Ilkp+7V2iTSjtx4wCPSV4KwR8gPLuGHEgRJdRHVCWgks47U/3S3vXRjJpXHaDMDHZWvlbSh5feFKs
 7nkokXfntPQxsJe/7H7JP2fR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6DZ-00Bc2N-1j; Wed, 29 Oct 2025 13:28:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 056/127] smb: smbdirect: introduce the basic smbdirect.ko
Date: Wed, 29 Oct 2025 14:20:34 +0100
Message-ID: <3f5df0582a3553d48932d982dee36230a0ade8f5.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>,
 metze@samba.org, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
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
---
 fs/smb/Kconfig                           |  2 ++
 fs/smb/common/Makefile                   |  1 +
 fs/smb/common/smbdirect/Kconfig          |  9 +++++++++
 fs/smb/common/smbdirect/Makefile         | 15 +++++++++++++++
 fs/smb/common/smbdirect/smbdirect_main.c | 24 ++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
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
index 000000000000..251766424b6b
--- /dev/null
+++ b/fs/smb/common/smbdirect/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for smbdirect support
+#
+
+obj-$(CONFIG_SMB_COMMON_SMBDIRECT) += smbdirect.o
+
+smbdirect-y := \
+	smbdirect_connection.o	\
+	smbdirect_mr.o		\
+	smbdirect_rw.o		\
+	smbdirect_debug.o	\
+	smbdirect_connect.o	\
+	smbdirect_accept.o	\
+	smbdirect_main.o
diff --git a/fs/smb/common/smbdirect/smbdirect_main.c b/fs/smb/common/smbdirect/smbdirect_main.c
new file mode 100644
index 000000000000..c9fc1e1de0ca
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_main.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
+#include <linux/module.h>
+
+static __init int smbdirect_init_module(void)
+{
+	pr_notice("subsystem loaded\n");
+	return 0;
+}
+
+static __exit void smbdirect_exit_module(void)
+{
+	pr_notice("subsystem unloaded\n");
+}
+
+module_init(smbdirect_init_module);
+module_exit(smbdirect_exit_module);
+
+MODULE_DESCRIPTION("smbdirect subsystem");
+MODULE_LICENSE("GPL");
-- 
2.43.0


