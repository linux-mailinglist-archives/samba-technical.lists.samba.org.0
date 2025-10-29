Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBBC1AA5A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:25:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uGes8dHTXzJiQSLU0y/1FlzJBQ3ZsqRbyStwO7XsH2s=; b=gd6I9jF/LAcJJ+tJ9ieXFkFZ2r
	91k4WUqu7Q88n6QiqoEzp46kqhwxSpobfP1BxT8yySjvhvIA3+0BUeTLJgm+7fCtRbk7uBhKzF2E4
	muw8RFgLpJoFxez39dRtYXpRwc8S5BML81Hzsx+BOsheAeGy09O804l3xQZBA1vHHmk1YhOVQDMjo
	Cd3W5//t1nXqfjSe8CwQDTXILYgBhHhdNoC5HKBu3z7d4zoBd+ToytuqtzD52cjUJbmAUtRvtq0OF
	ikvZVhhHCVXwOSGUp2q8mETfpTsx/dEWP8JnO+Nsiy0Q+Xjp0+nS3a8oWMwUMafev4HtmHtKwZ1L4
	rWxVk1Yg==;
Received: from ip6-localhost ([::1]:52878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Ac-0095pf-Op; Wed, 29 Oct 2025 13:24:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26356) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE696-0095Ow-Ju
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uGes8dHTXzJiQSLU0y/1FlzJBQ3ZsqRbyStwO7XsH2s=; b=vx4ZydptHdzExfSCxT24axXyjt
 nJN09PQVyr9Gw4Oz0dCmz2PAOqGUc06lX7n4UPxXAtcgh2/JRgficc9e2g8Dk/iJkVmSf3Dr5LIyx
 ro72AsWcYPdRPORouU5tn9UqIZ79wIKgjKkwjmHMssjqqAGwBpqSjGtxBVU094OtwqPKxQvfS2FwD
 3e/jlrE0Tz2zSnTmoI8W9nOJ7zUf1yMwr9Yh8wwGYhVmAA+mfBFAfB872D8zcZgHvGUUTQ1uyx2q/
 gkrT/0KnzJNxbL5IjnetND0WmnJVSECQl0zqg4fVfkk+fpjtWmgKh3E7thpo2yRmiSmp3B7qnBB5P
 z7rXvcOMT5JDYXcPJqfTaLsyYiUPnHxOVsoHyFCZot2b/3t/Nf0bQwfDl7v6Anw7ck0y4WGnEle57
 O6r1JVOsTbetE67o0SUJulMCt72zVEx9el3m5wRwm3Pgzc/4vIiEZ1rC7OF/zlGJAE/sXLE+3VvKv
 d2BEoJsx0stLSB4pmYB4rbL4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE692-00BbHI-2e; Wed, 29 Oct 2025 13:23:20 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 008/127] smb: smbdirect: introduce smbdirect_connection.c
 with the first helper function
Date: Wed, 29 Oct 2025 14:19:46 +0100
Message-ID: <669569db93998de21b89bb6824518265d4967d06.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a very basic start in order to introduce smbdirect_connection.c
with common functions, which will be shared by client and server.

Over time smbdirect_connection.c will get more and more functions
which will be included in fs/smb/client/smbdirect.c and
fs/smb/server/transport_rdma.c via
fs/smb/common/smbdirect/smbdirect_all_c_files.c
in order to allow tiny steps in the direction of moving to
a few exported functions from an smbdirect.ko.
That's why __maybe_unused is added for now it will
be removed at the end of the road to common code.

Note the Copyright (C) 2017, Microsoft Corporation is added
as a lot of functions from fs/smb/client/smbdirect.c will
be moved into this file soon and I don't want to forget
about adding it.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_all_c_files.c  |  1 +
 .../common/smbdirect/smbdirect_connection.c   | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connection.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
index 610556fb7931..ba92f0813932 100644
--- a/fs/smb/common/smbdirect/smbdirect_all_c_files.c
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -15,3 +15,4 @@
 #ifndef SMBDIRECT_USE_INLINE_C_FILES
 #error SMBDIRECT_USE_INLINE_C_FILES define needed
 #endif
+#include "smbdirect_connection.c"
diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
new file mode 100644
index 000000000000..ca6508705be8
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (C) 2017, Microsoft Corporation.
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
+					    const struct smbdirect_socket_parameters *sp,
+					    struct workqueue_struct *workqueue)
+{
+	smbdirect_socket_init(sc);
+
+	/*
+	 * Make a copy of the callers parameters
+	 * from here we only work on the copy
+	 */
+	sc->parameters = *sp;
+
+	/*
+	 * Remember the callers workqueue
+	 */
+	sc->workqueue = workqueue;
+}
-- 
2.43.0


