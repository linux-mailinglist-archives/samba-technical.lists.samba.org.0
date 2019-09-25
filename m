Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 693EBBD5F0
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 02:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ejQpTbA0Grs9F3qUlXdE88zmRGQpxe4W08YIfqNpkwk=; b=GA9/R+G9XYh9Q4zcOyZi+fMh+f
	FuPzeSQAr0Fuwk+KlMJvv+8y187JFtlxn9T00uWyFcnrjx7ggLs1z5b79hCmUVfznjrYIAy+o/Ier
	cSPhVFCtdZdUVfJ/ALWx67vIGov8eiPWDrPPNuKm/1hJufkKVe9lhFrFu7EcOml3Sj4ETy9eZAyzm
	6k5lbPXIYwfIVccQ0YX5cuazNP8t7NpklZm/TiRalTIyc+v9GEwhiFp53vJk9DvtWrxCOi0CuQwB6
	0FkARZBK0BcKtrRaUO3zAHAXTR6v1WyB4vRsAH8GpbylAsW0O7XM+0Z939gDfbSp/+bV1Cs+1erxf
	LOP9OBIw==;
Received: from localhost ([::1]:38890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCvcI-008Ls1-V6; Wed, 25 Sep 2019 00:57:15 +0000
Received: from mx1.redhat.com ([209.132.183.28]:52838) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iCvcD-008Lru-LT
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 00:57:12 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01CB618C8914
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 00:37:45 +0000 (UTC)
Received: from ovpn-116-115.phx2.redhat.com (ovpn-116-115.phx2.redhat.com
 [10.3.116.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D40175D9DC
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 00:37:44 +0000 (UTC)
Message-ID: <2aa99e06bac234dd24ad6e2e50762977c0bf51d0.camel@redhat.com>
Subject: [PATCH 1/2] s3:tests: Add smbspool_argv_wrapper
To: samba-technical@lists.samba.org
Date: Tue, 24 Sep 2019 17:37:44 -0700
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 25 Sep 2019 00:37:45 +0000 (UTC)
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
From: Bryan Mason via samba-technical <samba-technical@lists.samba.org>
Reply-To: bmason@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This patch, along with the next one, is intended to catch problems
like https://bugzilla.samba.org/show_bug.cgi?id=14128 where CUPS puts
a sanitized Device URI in argv[0].  This patch creates a utility to
pass the Device URI in argv[0]; the next patch actually uses this
utility to perform the test.

Please review and comment.  Thanks.

[PATCH 1/2] s3:tests: Add smbspool_argv_wrapper

Before calling a backend like smbspool, CUPS will set argv[0] to the
Device URI.  smbspool_argv_wrapper can be used in testing to emulate
CUPS-like behavior by setting argv[0] to the device URI before
exec()ing smbspool.

Signed-off-by: Bryan Mason <bmason@redhat.com>
---
 source3/script/tests/smbspool_argv_wrapper.c | 68 ++++++++++++++++++++
 source3/wscript_build                        |  4 ++
 2 files changed, 72 insertions(+)
 create mode 100644 source3/script/tests/smbspool_argv_wrapper.c

diff --git a/source3/script/tests/smbspool_argv_wrapper.c
b/source3/script/tests/smbspool_argv_wrapper.c
new file mode 100644
index 00000000000..f4a1d0c762b
--- /dev/null
+++ b/source3/script/tests/smbspool_argv_wrapper.c
@@ -0,0 +1,68 @@
+/*
+   Wrapper for smbspool to test Device URI in argv[0]
+
+   Copyright (C) Bryan Mason 2019
+
+   This program is free software; you can redistribute it and/or
modify
+   it under the terms of the GNU General Public License as published
by
+   the Free Software Foundation; either version 3 of the License, or
+   (at your option) any later version.
+
+   This program is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+   GNU General Public License for more details.
+
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see <
http://www.gnu.org/licenses/>;;.
+*/
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <errno.h>
+
+/*
+ * Before calling a backend like smbspool, CUPS will set argv[0] to
+ * the Device URI.  This program wraps a program like smbspool and
+ * sets argv[0] to the device URI before exec()ing the acutal backend
+ * program.
+ */
+
+int
+main(int argc,
+     char *argv[],
+     char *envp[])
+{
+	char **new_argv;
+	char *exec_path;
+	int a;
+/*
+ * Expected parameters:
+ *
+ * smbspool_argv_wrapper smbspool uri job user title copies opts
file(s)
+ * argv[0]	       1	2   3   4    5     6      7    8
+ *
+ */
+	/* Allocate memory for the new arguments (exit on failure). */
+	new_argv = calloc(argc, sizeof(char *));
+	if (new_argv == 0) {
+		exit(ENOMEM);
+	}
+
+	/* Save the path to the smbspool executable */
+	exec_path = argv[1];
+
+	/*
+	 * Shift the rest of the args so smbspool is called with:
+	 *
+	 * uri     job user title copies opts file(s)
+	 * argv[0] 1   2    3     4      5    6
+	 */
+
+	for ( a = 2; a < argc-1; a++ ) {
+		new_argv[a-2] = argv[a];
+	}
+
+	/* Execute smbspool with new arguments */
+	execve(exec_path, new_argv, envp);
+}
diff --git a/source3/wscript_build b/source3/wscript_build
index 6707b4bb146..fb58b85b4db 100644
--- a/source3/wscript_build
+++ b/source3/wscript_build
@@ -1144,6 +1144,10 @@ bld.SAMBA3_BINARY('smbspool_krb5_wrapper',
                  install_path='${LIBEXECDIR}/samba',
                  enabled=bld.CONFIG_SET('HAVE_CUPS'))
 
+bld.SAMBA3_BINARY('smbspool_argv_wrapper',
+		  source='script/tests/smbspool_argv_wrapper.c',
+		  install=False)
+
 bld.SAMBA3_BINARY('locktest2',
                  source='torture/locktest2.c',
                  deps='''
-- 
2.18.1



