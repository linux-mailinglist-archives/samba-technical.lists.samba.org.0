Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B314A746A8
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 07:57:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZDaleEscXobSh+K4iUMjxSGGlt9l1WNlHTxUMTzu+rQ=; b=PjBk5ApgaC3oSC8SozN7d71bVS
	HHd82+BitTFH1ugEI0SxvN/H2fFeNdXx+WHV5DBiRNWVslEP/stCLlcLdp5FuQJA0SFJmZStGPhdl
	0isZLLZ/6vmo/Cpm8ai6gidn8/YP0q40zrJqS0vFwIGa19z8YET3xep75tmLEXsVUFXf6fea9F+VJ
	E9tojxCD+xMjhoUTyNUGkG8Ryl0gHp8h5iRpPqys16l7ULaMpN1LCxx6ED/qJOR0FslbnEe5NYeiS
	TBCnbWmE3+HRcwQPyGui3k2b1/RHfJi9CzqGfQoNjteJPLqp+rijBLswkg/Gf3QMp5R3tg6hcC2eq
	FFE8gsHw==;
Received: from localhost ([::1]:48124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqWjT-000AOH-7v; Thu, 25 Jul 2019 05:56:03 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:52515 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqWjL-000AOA-FB
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 05:56:00 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45vLzk0vlYz9s8m;
 Thu, 25 Jul 2019 15:55:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1564034146; bh=h3tYkJjzJTi/8yXJAyY5jqGyfhN26wHxQ7BVJoK0Sq4=;
 h=Date:From:To:Subject:From;
 b=ME4Gd7Q9MTC4IaLvYyiirB95DNjm6q/YuAIqIMWDpjK2/e0P+OHBaUh/tSUyqAAOd
 EUU0EbMsUR4H7Dmq8q1JlrMhGq4T1sHaLQmfqCTG6FlaPt/5ufqVskFLOQWKmUt7YR
 sSoTU/h456A3v7m/ez4aT4BG+lVogPRC6yAgp4HGWGI9afZqR9cRkUcQV5r9+C5yqi
 k0YfVhNS+RnFwD8ZypJLLy9RWh6xLkPWPAX3cdUG6ffRuJPTZ4+QQgiW31yK4C/KLv
 kZInNPT3nLsDYM3xtnJdKN1+fRMtilZdxz/VGSCxIOY/pwPGIe4n3XlZk74wjgRWRc
 3YLazjk9Lwdhw==
Date: Thu, 25 Jul 2019 15:55:45 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] CTDB: Implement re-checking in mutex fcntl helper for
 recovery lock
Message-ID: <20190725155545.39c93490@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_//q7J4vFKhBD2ej3b20/zZpZ"
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_//q7J4vFKhBD2ej3b20/zZpZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

ctdb_mutex_fcntl_helper does not re-check that the file it locked still
exists and is still the same file.  Add re-checking and implement tests
for ctdb_cluster_mutex() and ctdb_mutex_fcntl_helper.  Clean up
the 01.reclock.script event script and associated tests.

CI pipeline running here:

  https://gitlab.com/samba-team/devel/samba/pipelines/72839484

Please review and maybe push...

peace & happiness,
martin

--MP_//q7J4vFKhBD2ej3b20/zZpZ
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-reclock.patch

From 82e635e4990580d1b92579dcd744a0fdda1abdb0 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 9 Jul 2019 12:42:24 +1000
Subject: [PATCH 01/15] ctdb-tests: Set LANG=C for consistency of command
 output

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/common.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ctdb/tests/scripts/common.sh b/ctdb/tests/scripts/common.sh
index 63df11242e7..ec06fa0c8db 100644
--- a/ctdb/tests/scripts/common.sh
+++ b/ctdb/tests/scripts/common.sh
@@ -2,6 +2,11 @@
 
 # Common variables and functions for all CTDB tests.
 
+
+# Commands on different platforms may quote or sort things differently
+# without this
+export LANG=C
+
 # Print a message and exit.
 die ()
 {
-- 
2.20.1


From 4adfd7ed749bf366c6ca7211510c3f64fa6d49b9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 5 Jul 2019 13:13:16 +1000
Subject: [PATCH 02/15] ctdb-mutex: Update to use modern debug macro

One of these had a missing space, so this implicitly fixes it.  It
also drops the need to unnecessarily include common.h, which comes
with some dependency baggage.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_cluster_mutex.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/ctdb/server/ctdb_cluster_mutex.c b/ctdb/server/ctdb_cluster_mutex.c
index 719b5c14f7a..08784c0340c 100644
--- a/ctdb/server/ctdb_cluster_mutex.c
+++ b/ctdb/server/ctdb_cluster_mutex.c
@@ -33,7 +33,6 @@
 
 #include "ctdb_private.h"
 #include "common/common.h"
-#include "common/logging.h"
 
 #include "ctdb_cluster_mutex.h"
 
@@ -234,7 +233,7 @@ ctdb_cluster_mutex(TALLOC_CTX *mem_ctx,
 
 	h = talloc(mem_ctx, struct ctdb_cluster_mutex_handle);
 	if (h == NULL) {
-		DEBUG(DEBUG_ERR, (__location__ " out of memory\n"));
+		DBG_ERR("out of memory\n");
 		return NULL;
 	}
 
@@ -246,7 +245,7 @@ ctdb_cluster_mutex(TALLOC_CTX *mem_ctx,
 	ret = pipe(h->fd);
 	if (ret != 0) {
 		talloc_free(h);
-		DEBUG(DEBUG_ERR, (__location__ " Failed to open pipe\n"));
+		DBG_ERR("Failed to open pipe\n");
 		return NULL;
 	}
 	set_close_on_exec(h->fd[0]);
@@ -302,7 +301,7 @@ ctdb_cluster_mutex(TALLOC_CTX *mem_ctx,
 		execv(args[0], args);
 
 		/* Only happens on error */
-		DEBUG(DEBUG_ERR, (__location__ "execv() failed\n"));
+		DBG_ERR("execv() failed\n");
 		_exit(1);
 	}
 
@@ -313,7 +312,7 @@ ctdb_cluster_mutex(TALLOC_CTX *mem_ctx,
 		DBG_WARNING("Failed to unblock SIGTERM (%d)\n", errno);
 	}
 
-	DEBUG(DEBUG_DEBUG, (__location__ " Created PIPE FD:%d\n", h->fd[0]));
+	DBG_DEBUG("Created PIPE FD:%d\n", h->fd[0]);
 	set_close_on_exec(h->fd[0]);
 
 	close(h->fd[1]);
-- 
2.20.1


From 084ebc0b4af2a198c57054a053bda66ec8f1fe2b Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 17 Jul 2019 13:31:27 +1000
Subject: [PATCH 03/15] ctdb-mutex: Drop unneeded assignment

clang warns:

  ctdb/server/ctdb_mutex_fcntl_helper.c:61:3: warning: Value stored to 'fd' is never read

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_mutex_fcntl_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ctdb/server/ctdb_mutex_fcntl_helper.c b/ctdb/server/ctdb_mutex_fcntl_helper.c
index 7b66c78cd8e..166d9c2760e 100644
--- a/ctdb/server/ctdb_mutex_fcntl_helper.c
+++ b/ctdb/server/ctdb_mutex_fcntl_helper.c
@@ -50,7 +50,6 @@ static char fcntl_lock(const char *file, int *outfd)
 	if (fcntl(fd, F_SETLK, &lock) != 0) {
 		int saved_errno = errno;
 		close(fd);
-		fd = -1;
 		if (saved_errno == EACCES ||
 		    saved_errno == EAGAIN) {
 			/* Lock contention, fail silently */
-- 
2.20.1


From 4c702da73aaf392a6a6aad29dea2900bfd17a4f6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 19 Jul 2019 11:14:43 +1000
Subject: [PATCH 04/15] ctdb-mutex: Drop dependency on ctdb_set_helper

This makes the code more explicit and makes testing easier due to less
dependencies.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_cluster_mutex.c | 57 ++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/ctdb/server/ctdb_cluster_mutex.c b/ctdb/server/ctdb_cluster_mutex.c
index 08784c0340c..2fbe301420e 100644
--- a/ctdb/server/ctdb_cluster_mutex.c
+++ b/ctdb/server/ctdb_cluster_mutex.c
@@ -21,6 +21,7 @@
 
 #include "replace.h"
 #include "system/network.h"
+#include "system/filesys.h"
 
 #include <tevent.h>
 
@@ -32,7 +33,6 @@
 #include "lib/util/blocking.h"
 
 #include "ctdb_private.h"
-#include "common/common.h"
 
 #include "ctdb_cluster_mutex.h"
 
@@ -121,21 +121,56 @@ static bool cluster_mutex_helper_args_file(TALLOC_CTX *mem_ctx,
 					   const char *argstring,
 					   char ***argv)
 {
-	bool ok;
+	struct stat st;
+	size_t size = sizeof(cluster_mutex_helper);
+	const char *t;
 	char **args = NULL;
+	int ret;
+
+	if (cluster_mutex_helper[0] != '\0') {
+		goto helper_done;
+	}
 
-	ok = ctdb_set_helper("cluster mutex helper",
-			     cluster_mutex_helper,
-			     sizeof(cluster_mutex_helper),
-			     "CTDB_CLUSTER_MUTEX_HELPER",
-			     CTDB_HELPER_BINDIR,
-			     "ctdb_mutex_fcntl_helper");
-	if (! ok) {
-		DBG_ERR("ctdb exiting with error: "
-			"Unable to set cluster mutex helper\n");
+	t = getenv("CTDB_CLUSTER_MUTEX_HELPER");
+	if (t != NULL) {
+		size_t len;
+
+		len = strlcpy(cluster_mutex_helper, t, size);
+		if (len >= size) {
+			DBG_ERR("error: CTDB_CLUSTER_MUTEX_HELPER too long\n");
+			exit(1);
+		}
+	} else {
+		ret = snprintf(cluster_mutex_helper,
+			       size,
+			       "%s/%s",
+			       CTDB_HELPER_BINDIR,
+			       "ctdb_mutex_fcntl_helper");
+		if (ret < 0 || (size_t)ret >= size) {
+			D_ERR("Unable to set cluster mutex helper - "
+			      "path too long\n");
+			exit(1);
+		}
+	}
+
+	ret = stat(cluster_mutex_helper, &st);
+	if (ret != 0) {
+		D_ERR("Unable to set cluster mutex helper \"%s\" - %s\n",
+		      cluster_mutex_helper,
+		      strerror(errno));
 		exit(1);
 	}
 
+	if ((st.st_mode & S_IXUSR) == 0) {
+		D_ERR("Unable to set cluster_mutex helper \"%s\" - "
+		      "not executable\n",
+		      cluster_mutex_helper);
+		exit(1);
+	}
+
+	D_NOTICE("Set cluster mutex helper to \"%s\"\n", cluster_mutex_helper);
+
+helper_done:
 
 	/* Array includes default helper, file and NULL */
 	args = talloc_array(mem_ctx, char *, 3);
-- 
2.20.1


From 656bc1b3654155e9945af84d4ad6d60a4450317e Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 4 Jul 2019 21:52:00 +1000
Subject: [PATCH 05/15] ctdb-tests: Add cluster mutex tests

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/cunit/cluster_mutex_001.sh |  58 +++
 ctdb/tests/cunit/cluster_mutex_002.sh |  60 +++
 ctdb/tests/cunit/cluster_mutex_003.sh |  67 ++++
 ctdb/tests/src/cluster_mutex_test.c   | 551 ++++++++++++++++++++++++++
 ctdb/wscript                          |   5 +
 5 files changed, 741 insertions(+)
 create mode 100755 ctdb/tests/cunit/cluster_mutex_001.sh
 create mode 100755 ctdb/tests/cunit/cluster_mutex_002.sh
 create mode 100755 ctdb/tests/cunit/cluster_mutex_003.sh
 create mode 100644 ctdb/tests/src/cluster_mutex_test.c

diff --git a/ctdb/tests/cunit/cluster_mutex_001.sh b/ctdb/tests/cunit/cluster_mutex_001.sh
new file mode 100755
index 00000000000..81671da8f48
--- /dev/null
+++ b/ctdb/tests/cunit/cluster_mutex_001.sh
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+# This tests the fcntl helper, configured via a lock file
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+t="${CTDB_SCRIPTS_HELPER_BINDIR}/ctdb_mutex_fcntl_helper"
+export CTDB_CLUSTER_MUTEX_HELPER="$t"
+
+lockfile="${TEST_VAR_DIR}/cluster_mutex.lockfile"
+trap 'rm -f ${lockfile}' 0
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock "$lockfile"
+
+ok <<EOF
+LOCK
+CONTENTION
+NOLOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-lock-unlock "$lockfile"
+
+ok <<EOF
+LOCK
+UNLOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock-lock-unlock "$lockfile"
+
+ok <<EOF
+CANCEL
+NOLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-check "$lockfile"
+
+ok <<EOF
+CANCEL
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-unlock "$lockfile"
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-wait-unlock "$lockfile"
+
+ok <<EOF
+LOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-ppid-gone-lock-unlock "$lockfile"
diff --git a/ctdb/tests/cunit/cluster_mutex_002.sh b/ctdb/tests/cunit/cluster_mutex_002.sh
new file mode 100755
index 00000000000..8e0b4103fc6
--- /dev/null
+++ b/ctdb/tests/cunit/cluster_mutex_002.sh
@@ -0,0 +1,60 @@
+#!/bin/sh
+
+# This tests the fcntl helper, externally configured via !
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+export CTDB_CLUSTER_MUTEX_HELPER="/bin/false"
+
+lockfile="${TEST_VAR_DIR}/cluster_mutex.lockfile"
+trap 'rm ${lockfile}' 0
+
+t="${CTDB_SCRIPTS_HELPER_BINDIR}/ctdb_mutex_fcntl_helper"
+helper="!${t} ${lockfile}"
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock "$helper"
+
+ok <<EOF
+LOCK
+CONTENTION
+NOLOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-lock-unlock "$helper"
+
+ok <<EOF
+LOCK
+UNLOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock-lock-unlock "$helper"
+
+ok <<EOF
+CANCEL
+NOLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-check "$helper"
+
+ok <<EOF
+CANCEL
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-unlock "$helper"
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-wait-unlock "$helper"
+
+ok <<EOF
+LOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-ppid-gone-lock-unlock "$helper"
diff --git a/ctdb/tests/cunit/cluster_mutex_003.sh b/ctdb/tests/cunit/cluster_mutex_003.sh
new file mode 100755
index 00000000000..19298b65335
--- /dev/null
+++ b/ctdb/tests/cunit/cluster_mutex_003.sh
@@ -0,0 +1,67 @@
+#!/bin/sh
+
+# This tests a helper, externally configured via !
+
+# By default this is the fcntl helper, so this is a subset of test 002.
+# However, other helps can be tested by setting CTDB_TEST_MUTEX_HELPER.
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+export CTDB_CLUSTER_MUTEX_HELPER="/bin/false"
+
+lockfile="${TEST_VAR_DIR}/cluster_mutex.lockfile"
+trap 'rm ${lockfile}' 0
+
+if [ -n "$CTDB_TEST_MUTEX_HELPER" ] ; then
+	helper="$CTDB_TEST_MUTEX_HELPER"
+else
+	t="${CTDB_SCRIPTS_HELPER_BINDIR}/ctdb_mutex_fcntl_helper"
+	helper="!${t} ${lockfile}"
+fi
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock "$helper"
+
+ok <<EOF
+LOCK
+CONTENTION
+NOLOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-lock-unlock "$helper"
+
+ok <<EOF
+LOCK
+UNLOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-unlock-lock-unlock "$helper"
+
+ok <<EOF
+CANCEL
+NOLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-check "$helper"
+
+ok <<EOF
+CANCEL
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-cancel-unlock "$helper"
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-wait-unlock "$helper"
+
+ok <<EOF
+LOCK
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-ppid-gone-lock-unlock "$helper"
diff --git a/ctdb/tests/src/cluster_mutex_test.c b/ctdb/tests/src/cluster_mutex_test.c
new file mode 100644
index 00000000000..21a6d2e7690
--- /dev/null
+++ b/ctdb/tests/src/cluster_mutex_test.c
@@ -0,0 +1,551 @@
+/*
+   CTDB cluster mutex test
+
+   Copyright (C) Martin Schwenke  2019
+
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License as published by
+   the Free Software Foundation; either version 3 of the License, or
+   (at your option) any later version.
+
+   This program is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+   GNU General Public License for more details.
+
+   You should have received a copy of the GNU General Public License
+   along with this program; if not, see <http://www.gnu.org/licenses/>.
+*/
+
+#include "replace.h"
+#include "system/network.h"
+#include "system/wait.h"
+
+#include <assert.h>
+
+#include <talloc.h>
+#include <tevent.h>
+
+/*
+ * ctdb_cluster_mutex.c is included below.  This requires a few hacks...
+ */
+
+/* Avoid inclusion of ctdb_private.h */
+#define _CTDB_PRIVATE_H
+
+/* Fake ctdb_context */
+struct ctdb_context {
+	struct tevent_context *ev;
+};
+
+/*
+ * ctdb_fork() and ctdb_kill() are used in ctdb_cluster_mutex.c for
+ * safer tracking of PIDs.  Fake them here to avoid dragging in the
+ * world.
+ */
+
+static pid_t ctdb_fork(struct ctdb_context *ctdb)
+{
+	return fork();
+}
+
+static int ctdb_kill(struct ctdb_context *ctdb, pid_t pid, int signum)
+{
+	return kill(pid, signum);
+}
+
+#include "server/ctdb_cluster_mutex.c"
+
+/*
+ * Mutex testing support
+ */
+
+struct mutex_handle {
+	bool done;
+	bool locked;
+	struct ctdb_cluster_mutex_handle *h;
+};
+
+struct do_lock_context {
+	struct mutex_handle *mh;
+	struct ctdb_context *ctdb;
+};
+
+static void do_lock_handler(char status, double latency, void *private_data)
+{
+	struct do_lock_context *dl = talloc_get_type_abort(
+		private_data, struct do_lock_context);
+	struct mutex_handle *mh;
+
+	assert(dl->mh != NULL);
+	mh = dl->mh;
+
+	mh->locked = (status == '0') ;
+
+	/*
+	 * If unsuccessful then ensure the process has exited and that
+	 * the file descriptor event handler has been cancelled
+	 */
+	if (! mh->locked) {
+		TALLOC_FREE(mh->h);
+	}
+
+	switch (status) {
+	case '0':
+		printf("LOCK\n");
+		break;
+
+	case '1':
+		printf("CONTENTION\n");
+		break;
+
+	case '2':
+		printf("TIMEOUT\n");
+		break;
+
+	default:
+		printf("ERROR\n");
+	}
+
+	fflush(stdout);
+	mh->done = true;
+}
+
+static void do_lock_lost_handler(void *private_data)
+{
+	struct do_lock_context *dl = talloc_get_type_abort(
+		private_data, struct do_lock_context);
+
+	printf("LOST\n");
+	fflush(stdout);
+	TALLOC_FREE(dl->mh);
+}
+
+static void do_lock_take(struct do_lock_context *dl,
+			 const char *mutex_string)
+{
+	struct ctdb_cluster_mutex_handle *h;
+
+	dl->mh = talloc_zero(dl, struct mutex_handle);
+	assert(dl->mh != NULL);
+
+	h = ctdb_cluster_mutex(dl->mh,
+			       dl->ctdb,
+			       mutex_string,
+			       120,
+			       do_lock_handler,
+			       dl,
+			       do_lock_lost_handler,
+			       dl);
+	assert(h != NULL);
+
+	dl->mh->h = h;
+}
+
+static void do_lock_wait_done(struct do_lock_context *dl)
+{
+	assert(dl->mh != NULL);
+
+	while (! dl->mh->done) {
+		tevent_loop_once(dl->ctdb->ev);
+	}
+}
+
+static void do_lock_check(struct do_lock_context *dl)
+{
+	assert(dl->mh != NULL);
+
+	if (! dl->mh->locked) {
+		printf("NOLOCK\n");
+		fflush(stdout);
+		TALLOC_FREE(dl->mh);
+	}
+}
+
+static void do_lock(struct do_lock_context *dl,
+		    const char *mutex_string)
+{
+	do_lock_take(dl, mutex_string);
+
+	do_lock_wait_done(dl);
+
+	do_lock_check(dl);
+}
+
+static void do_unlock(struct do_lock_context *dl)
+{
+	if (dl->mh == NULL) {
+		return;
+	}
+
+	if (! dl->mh->done) {
+		/*
+		 * Taking of lock still in progress.  Free the cluster
+		 * mutex handle to release it but leave the lock
+		 * handle in place to allow taking of the lock to
+		 * fail.
+		 */
+		printf("CANCEL\n");
+		fflush(stdout);
+		TALLOC_FREE(dl->mh->h);
+		dl->mh->done = true;
+		dl->mh->locked = false;
+		return;
+	}
+
+	printf("UNLOCK\n");
+	fflush(stdout);
+	TALLOC_FREE(dl->mh);
+}
+
+static void wait_handler(struct tevent_context *ev,
+			 struct tevent_timer *te,
+			 struct timeval t,
+			 void *private_data)
+{
+	bool *done = (bool *)private_data;
+
+	*done = true;
+}
+
+static void do_lock_wait_time(struct do_lock_context *dl,
+			      unsigned long wait_time)
+{
+	struct tevent_timer *tt;
+	bool done = false;
+
+	tt = tevent_add_timer(dl->ctdb->ev,
+			      dl,
+			      tevent_timeval_current_ofs(wait_time, 0),
+			      wait_handler,
+			      &done);
+	assert(tt != NULL);
+
+	while (! done) {
+		tevent_loop_once(dl->ctdb->ev);
+	}
+}
+
+/*
+ * Testcases
+ */
+
+static void test_lock_unlock(TALLOC_CTX *mem_ctx,
+			     struct ctdb_context *ctdb,
+			     const char *mutex_string)
+{
+	struct do_lock_context *dl;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl);
+	assert(dl->mh == NULL);
+}
+
+static void test_lock_lock_unlock(TALLOC_CTX *mem_ctx,
+				  struct ctdb_context *ctdb,
+				  const char *mutex_string)
+{
+	struct do_lock_context *dl1;
+	struct do_lock_context *dl2;
+
+	dl1 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl1 != NULL);
+	dl1->ctdb = ctdb;
+
+	dl2 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl2 != NULL);
+	dl2->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl1, mutex_string);
+	assert(dl1->mh != NULL);
+
+	/* CONTENTION */
+	do_lock(dl2, mutex_string);
+	assert(dl2->mh == NULL);
+
+	/* UNLOCK */
+	do_unlock(dl1);
+	assert(dl1->mh == NULL);
+}
+
+static void test_lock_unlock_lock_unlock(TALLOC_CTX *mem_ctx,
+					 struct ctdb_context *ctdb,
+					 const char *mutex_string)
+{
+	struct do_lock_context *dl1;
+	struct do_lock_context *dl2;
+
+	dl1 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl1 != NULL);
+	dl1->ctdb = ctdb;
+
+	dl2 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl2 != NULL);
+	dl2->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl1, mutex_string);
+	assert(dl1->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl1);
+	assert(dl1->mh == NULL);
+
+	/* LOCK */
+	do_lock(dl2, mutex_string);
+	assert(dl2->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl2);
+	assert(dl2->mh == NULL);
+}
+
+static void test_lock_cancel_check(TALLOC_CTX *mem_ctx,
+				   struct ctdb_context *ctdb,
+				   const char *mutex_string)
+{
+	struct do_lock_context *dl;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	do_lock_take(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	/* CANCEL */
+	do_unlock(dl);
+	assert(dl->mh != NULL);
+
+	do_lock_wait_done(dl);
+
+	/* NOLOCK */
+	do_lock_check(dl);
+	assert(dl->mh == NULL);
+}
+
+static void test_lock_cancel_unlock(TALLOC_CTX *mem_ctx,
+				    struct ctdb_context *ctdb,
+				    const char *mutex_string)
+{
+	struct do_lock_context *dl;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	do_lock_take(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	/* CANCEL */
+	do_unlock(dl);
+	assert(dl->mh != NULL);
+
+	do_lock_wait_done(dl);
+
+	/* UNLOCK */
+	do_unlock(dl);
+	assert(dl->mh == NULL);
+}
+
+static void test_lock_wait_unlock(TALLOC_CTX *mem_ctx,
+				  struct ctdb_context *ctdb,
+				  const char *mutex_string)
+{
+	struct do_lock_context *dl;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	/* Wait for twice as long as the PPID timeout */
+	do_lock_wait_time(dl, 2 * 5);
+	assert(dl->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl);
+	assert(dl->mh == NULL);
+}
+
+static void fd_done_handler(struct tevent_context *ev,
+			    struct tevent_fd *fde,
+			    uint16_t flags,
+			    void *private_data)
+{
+	bool *done = (bool *)private_data;
+
+	*done = true;
+}
+
+static void test_lock_ppid_gone_lock_unlock(TALLOC_CTX *mem_ctx,
+					    struct ctdb_context *ctdb,
+					    const char *mutex_string)
+{
+	struct do_lock_context *dl;
+	struct tevent_fd *fde;
+	int pipefd[2];
+	int ret;
+	pid_t pid, pid2;
+	ssize_t nread;
+	bool done;
+
+	/*
+	 * Do this in the parent - debugging aborts of the child is
+	 * trickier
+	 */
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	ret = pipe(pipefd);
+	assert(ret == 0);
+
+	pid = fork();
+	assert(pid != -1);
+
+	if (pid == 0) {
+		ssize_t nwritten;
+
+		close(pipefd[0]);
+
+		/* LOCK */
+		do_lock(dl, mutex_string);
+		assert(dl->mh != NULL);
+
+		/*
+		 * Note that we never see corresponding LOST.  That
+		 * would come from this process, but it is killed
+		 * below.
+		 */
+
+		nwritten = write(pipefd[1], &ret, sizeof(ret));
+		assert(nwritten == sizeof(ret));
+
+		sleep(999);
+		exit(1);
+	}
+
+	close(pipefd[1]);
+
+	nread = read(pipefd[0], &ret, sizeof(ret));
+	assert(nread == sizeof(ret));
+	assert(ret == 0);
+
+	/*
+	 * pipefd[1] is leaked into the helper, so there will be an
+	 * event generated when the helper exits
+	 */
+	done = false;
+	fde = tevent_add_fd(ctdb->ev,
+			    ctdb,
+			    pipefd[0],
+			    TEVENT_FD_READ,
+			    fd_done_handler,
+			    &done);
+	assert(fde != NULL);
+
+	ret = kill(pid, SIGKILL);
+	assert(ret == 0);
+	pid2 = waitpid(pid, &ret, 0);
+	assert(pid2 == pid);
+
+	while (! done) {
+		tevent_loop_once(ctdb->ev);
+	}
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl);
+	assert(dl->mh == NULL);
+}
+
+/*
+ * Main
+ */
+
+static const char *prog;
+
+static void usage(void)
+{
+	fprintf(stderr, "usage: %s <test> <mutex-string>\n", prog);
+	exit(1);
+}
+
+static void alarm_handler(int sig)
+{
+	abort();
+}
+
+int main(int argc, const char *argv[])
+{
+	TALLOC_CTX *mem_ctx;
+	struct ctdb_context *ctdb;
+	const char *mutex_string;
+	const char *test;
+	struct sigaction sa = { .sa_handler = NULL, };
+	int ret;
+
+	prog = argv[0];
+
+	if (argc != 3) {
+		usage();
+	}
+
+	mem_ctx = talloc_new(NULL);
+	assert(mem_ctx != NULL);
+
+	ctdb = talloc_zero(mem_ctx, struct ctdb_context);
+	assert(ctdb != NULL);
+
+	ctdb->ev = tevent_context_init(ctdb);
+	assert(ctdb->ev != NULL);
+
+	/* Add a 60s timeout for the whole test */
+	sa.sa_handler = alarm_handler;
+	sigemptyset(&sa.sa_mask);
+	ret = sigaction(SIGALRM, &sa, NULL);
+	assert(ret == 0);
+	alarm(60);
+
+	test = argv[1];
+	mutex_string = argv[2];
+
+	if (strcmp(test, "lock-unlock") == 0) {
+		test_lock_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-lock-unlock") == 0) {
+		test_lock_lock_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-unlock-lock-unlock") == 0) {
+		test_lock_unlock_lock_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-cancel-check") == 0) {
+		test_lock_cancel_check(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-cancel-unlock") == 0) {
+		test_lock_cancel_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-wait-unlock") == 0) {
+		test_lock_wait_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-ppid-gone-lock-unlock") == 0) {
+		test_lock_ppid_gone_lock_unlock(mem_ctx, ctdb, mutex_string);
+	} else {
+		fprintf(stderr, "Unknown test\n");
+		exit(1);
+	}
+
+	talloc_free(mem_ctx);
+
+	return 0;
+}
diff --git a/ctdb/wscript b/ctdb/wscript
index 51a09fdc63d..ec6389189ad 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -1032,6 +1032,11 @@ def build(bld):
                              LIBASYNC_REQ popt''',
                      install_path='${CTDB_TEST_LIBEXECDIR}')
 
+    bld.SAMBA_BINARY('cluster_mutex_test',
+                     source='tests/src/cluster_mutex_test.c',
+                     deps='samba-util talloc tevent',
+                     install_path='${CTDB_TEST_LIBEXECDIR}')
+
     if bld.env.HAVE_INFINIBAND:
         bld.SAMBA_BINARY('ibwrapper_test',
                          source='ib/ibwrapper_test.c',
-- 
2.20.1


From dc8a9e726d8be9f8a3d96f0112f4936f7b370aba Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 8 Jul 2019 20:51:11 +1000
Subject: [PATCH 06/15] ctdb-tests: Add test to confirm need for cluster mutex
 lock file rechecking

Remove the lock and a second locker can take the it.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/cunit/cluster_mutex_002.sh |  9 +++++
 ctdb/tests/src/cluster_mutex_test.c   | 53 ++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/ctdb/tests/cunit/cluster_mutex_002.sh b/ctdb/tests/cunit/cluster_mutex_002.sh
index 8e0b4103fc6..fea6cfe2b93 100755
--- a/ctdb/tests/cunit/cluster_mutex_002.sh
+++ b/ctdb/tests/cunit/cluster_mutex_002.sh
@@ -58,3 +58,12 @@ LOCK
 UNLOCK
 EOF
 unit_test cluster_mutex_test lock-ppid-gone-lock-unlock "$helper"
+
+ok <<EOF
+LOCK
+LOCK
+UNLOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-file-removed-no-recheck \
+	  "$helper" "$lockfile"
diff --git a/ctdb/tests/src/cluster_mutex_test.c b/ctdb/tests/src/cluster_mutex_test.c
index 21a6d2e7690..fa7e1e03415 100644
--- a/ctdb/tests/src/cluster_mutex_test.c
+++ b/ctdb/tests/src/cluster_mutex_test.c
@@ -475,6 +475,43 @@ static void test_lock_ppid_gone_lock_unlock(TALLOC_CTX *mem_ctx,
 	assert(dl->mh == NULL);
 }
 
+static void test_lock_file_removed_no_recheck(TALLOC_CTX *mem_ctx,
+					      struct ctdb_context *ctdb,
+					      const char *mutex_string,
+					      const char *lock_file)
+{
+	struct do_lock_context *dl1;
+	struct do_lock_context *dl2;
+	int ret;
+
+	dl1 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl1 != NULL);
+	dl1->ctdb = ctdb;
+
+	dl2 = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl2 != NULL);
+	dl2->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl1, mutex_string);
+	assert(dl1->mh != NULL);
+
+	ret = unlink(lock_file);
+	assert(ret == 0);
+
+	/* LOCK */
+	do_lock(dl2, mutex_string);
+	assert(dl2->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl2);
+	assert(dl2->mh == NULL);
+
+	/* UNLOCK */
+	do_unlock(dl1);
+	assert(dl1->mh == NULL);
+}
+
 /*
  * Main
  */
@@ -483,7 +520,7 @@ static const char *prog;
 
 static void usage(void)
 {
-	fprintf(stderr, "usage: %s <test> <mutex-string>\n", prog);
+	fprintf(stderr, "usage: %s <test> <mutex-string> [<arg>...]\n", prog);
 	exit(1);
 }
 
@@ -500,10 +537,11 @@ int main(int argc, const char *argv[])
 	const char *test;
 	struct sigaction sa = { .sa_handler = NULL, };
 	int ret;
+	const char *lock_file;
 
 	prog = argv[0];
 
-	if (argc != 3) {
+	if (argc < 3) {
 		usage();
 	}
 
@@ -540,6 +578,17 @@ int main(int argc, const char *argv[])
 		test_lock_wait_unlock(mem_ctx, ctdb, mutex_string);
 	} else if (strcmp(test, "lock-ppid-gone-lock-unlock") == 0) {
 		test_lock_ppid_gone_lock_unlock(mem_ctx, ctdb, mutex_string);
+	} else if (strcmp(test, "lock-file-removed-no-recheck") == 0) {
+		if (argc != 4) {
+			usage();
+		}
+
+		lock_file = argv[3];
+
+		test_lock_file_removed_no_recheck(mem_ctx,
+						  ctdb,
+						  mutex_string,
+						  lock_file);
 	} else {
 		fprintf(stderr, "Unknown test\n");
 		exit(1);
-- 
2.20.1


From 8b1e9976fd882772b0f6e6b916261295e86ba884 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 5 Jul 2019 15:39:23 +1000
Subject: [PATCH 07/15] ctdb-mutex: Exit immediately if the lock isn't taken

There is no need to wait until the parent kills the helper.  The
parent will get the initial response, indicating contention or
similar, and will then get a separate event indicating that the pipe
is gone.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_mutex_fcntl_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ctdb/server/ctdb_mutex_fcntl_helper.c b/ctdb/server/ctdb_mutex_fcntl_helper.c
index 166d9c2760e..44505047167 100644
--- a/ctdb/server/ctdb_mutex_fcntl_helper.c
+++ b/ctdb/server/ctdb_mutex_fcntl_helper.c
@@ -101,6 +101,10 @@ int main(int argc, char *argv[])
 	result = fcntl_lock(file, &fd);
 	sys_write(STDOUT_FILENO, &result, 1);
 
+	if (result != '0') {
+		return 0;
+	}
+
 	ctdb_wait_for_process_to_exit(ppid);
 
 	if (fd != -1) {
-- 
2.20.1


From 706c28a0c1908fba8a365dfdf57d1268cb7d95d6 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 27 Jun 2019 13:45:01 +1000
Subject: [PATCH 08/15] ctdb-mutex: Change parent checking to use an
 asynchronous computation

Put the checking for the process being immediately re-parented into
the computation too.  This will be very rare and doing it
consistently makes testing saner.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_mutex_fcntl_helper.c | 125 +++++++++++++++++++++++---
 ctdb/tests/cunit/cluster_mutex_001.sh |   1 +
 ctdb/tests/cunit/cluster_mutex_002.sh |   1 +
 ctdb/tests/cunit/cluster_mutex_003.sh |   1 +
 ctdb/wscript                          |   4 +-
 5 files changed, 119 insertions(+), 13 deletions(-)

diff --git a/ctdb/server/ctdb_mutex_fcntl_helper.c b/ctdb/server/ctdb_mutex_fcntl_helper.c
index 44505047167..85095c64c71 100644
--- a/ctdb/server/ctdb_mutex_fcntl_helper.c
+++ b/ctdb/server/ctdb_mutex_fcntl_helper.c
@@ -3,6 +3,10 @@
 
    Copyright (C) Martin Schwenke 2015
 
+   wait_for_parent() code from ctdb_lock_helper.c:
+
+   Copyright (C) Amitay Isaacs  2013
+
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
@@ -21,7 +25,10 @@
 #include "system/filesys.h"
 #include "system/network.h"
 
+#include <tevent.h>
+
 #include "lib/util/sys_rw.h"
+#include "lib/util/tevent_unix.h"
 
 /* protocol.h is just needed for ctdb_sock_addr, which is used in system.h */
 #include "protocol/protocol.h"
@@ -68,12 +75,97 @@ static char fcntl_lock(const char *file, int *outfd)
 	return '0';
 }
 
+/*
+ * Wait and see if the parent exits
+ */
+
+struct wait_for_parent_state {
+	struct tevent_context *ev;
+	pid_t ppid;
+};
+
+static void wait_for_parent_check(struct tevent_req *subreq);
+
+static struct tevent_req *wait_for_parent_send(TALLOC_CTX *mem_ctx,
+					       struct tevent_context *ev,
+					       pid_t ppid)
+{
+	struct tevent_req *req, *subreq;
+	struct wait_for_parent_state *state;
+
+	req = tevent_req_create(mem_ctx, &state, struct wait_for_parent_state);
+	if (req == NULL) {
+		return NULL;
+	}
+
+	state->ev = ev;
+	state->ppid = ppid;
+
+	if (ppid == 1) {
+		fprintf(stderr, "parent == 1\n");
+		tevent_req_done(req);
+		return tevent_req_post(req, ev);
+	}
+
+	subreq = tevent_wakeup_send(state, ev,
+				    tevent_timeval_current_ofs(5,0));
+	if (tevent_req_nomem(subreq, req)) {
+		return tevent_req_post(req, ev);
+	}
+	tevent_req_set_callback(subreq, wait_for_parent_check, req);
+
+	return req;
+}
+
+static void wait_for_parent_check(struct tevent_req *subreq)
+{
+	struct tevent_req *req = tevent_req_callback_data(
+		subreq, struct tevent_req);
+	struct wait_for_parent_state *state = tevent_req_data(
+		req, struct wait_for_parent_state);
+	bool status;
+
+	status = tevent_wakeup_recv(subreq);
+	TALLOC_FREE(subreq);
+	if (! status) {
+		/* Ignore error */
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"tevent_wakeup_recv() failed\n");
+	}
+
+	if (kill(state->ppid, 0) == -1 && errno == ESRCH) {
+		fprintf(stderr, "parent gone\n");
+		tevent_req_done(req);
+		return;
+	}
+
+	subreq = tevent_wakeup_send(state, state->ev,
+				    tevent_timeval_current_ofs(5,0));
+	if (tevent_req_nomem(subreq, req)) {
+		return;
+	}
+	tevent_req_set_callback(subreq, wait_for_parent_check, req);
+}
+
+static bool wait_for_parent_recv(struct tevent_req *req)
+{
+	if (tevent_req_is_unix_error(req, NULL)) {
+		return false;
+	}
+
+	return true;
+}
+
 int main(int argc, char *argv[])
 {
+	struct tevent_context *ev;
 	char result;
 	int ppid;
 	const char *file = NULL;
 	int fd = -1;
+	struct tevent_req *req;
+	bool status;
 
 	progname = argv[0];
 
@@ -82,20 +174,14 @@ int main(int argc, char *argv[])
 		exit(1);
 	}
 
-	ppid = getppid();
-
-	if (ppid == 1) {
-		/* The original parent is gone and the process has
-		 * been reparented to init.  This can happen if the
-		 * helper is started just as the parent is killed
-		 * during shutdown.  The error message doesn't need to
-		 * be stellar, since there won't be anything around to
-		 * capture and log it...
-		 */
-		fprintf(stderr, "%s: PPID == 1\n", progname);
+	ev = tevent_context_init(NULL);
+	if (ev == NULL) {
+		fprintf(stderr, "locking: tevent_context_init() failed\n");
 		exit(1);
 	}
 
+	ppid = getppid();
+
 	file = argv[1];
 
 	result = fcntl_lock(file, &fd);
@@ -105,7 +191,22 @@ int main(int argc, char *argv[])
 		return 0;
 	}
 
-	ctdb_wait_for_process_to_exit(ppid);
+	req = wait_for_parent_send(ev, ev, ppid);
+	if (req == NULL) {
+		fprintf(stderr,
+			"%s: wait_for_parent_send() failed\n",
+			progname);
+		exit(1);
+	}
+
+	tevent_req_poll(req, ev);
+
+	status = wait_for_parent_recv(req);
+	if (! status) {
+		fprintf(stderr,
+			"%s: wait_for_parent_recv() failed\n",
+			progname);
+	}
 
 	if (fd != -1) {
 		close(fd);
diff --git a/ctdb/tests/cunit/cluster_mutex_001.sh b/ctdb/tests/cunit/cluster_mutex_001.sh
index 81671da8f48..feb78f3efa8 100755
--- a/ctdb/tests/cunit/cluster_mutex_001.sh
+++ b/ctdb/tests/cunit/cluster_mutex_001.sh
@@ -52,6 +52,7 @@ unit_test cluster_mutex_test lock-wait-unlock "$lockfile"
 
 ok <<EOF
 LOCK
+parent gone
 LOCK
 UNLOCK
 EOF
diff --git a/ctdb/tests/cunit/cluster_mutex_002.sh b/ctdb/tests/cunit/cluster_mutex_002.sh
index fea6cfe2b93..6cc92d0b2a3 100755
--- a/ctdb/tests/cunit/cluster_mutex_002.sh
+++ b/ctdb/tests/cunit/cluster_mutex_002.sh
@@ -54,6 +54,7 @@ unit_test cluster_mutex_test lock-wait-unlock "$helper"
 
 ok <<EOF
 LOCK
+parent gone
 LOCK
 UNLOCK
 EOF
diff --git a/ctdb/tests/cunit/cluster_mutex_003.sh b/ctdb/tests/cunit/cluster_mutex_003.sh
index 19298b65335..5f351d9e9e1 100755
--- a/ctdb/tests/cunit/cluster_mutex_003.sh
+++ b/ctdb/tests/cunit/cluster_mutex_003.sh
@@ -61,6 +61,7 @@ unit_test cluster_mutex_test lock-wait-unlock "$helper"
 
 ok <<EOF
 LOCK
+parent gone
 LOCK
 UNLOCK
 EOF
diff --git a/ctdb/wscript b/ctdb/wscript
index ec6389189ad..3b8fea45e74 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -625,7 +625,9 @@ def build(bld):
 
     bld.SAMBA_BINARY('ctdb_mutex_fcntl_helper',
                      source='server/ctdb_mutex_fcntl_helper.c',
-                     deps='sys_rw ctdb-system',
+                     deps='''sys_rw ctdb-system tevent-util
+                             talloc tevent
+                          ''',
                      includes='include',
                      install_path='${CTDB_HELPER_BINDIR}')
 
-- 
2.20.1


From 0c6f578f21d769bb48a536d36b68c81047e5a043 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 27 Jun 2019 14:13:50 +1000
Subject: [PATCH 09/15] ctdb-mutex: Add an intermediate asynchronous
 computation for waiting

This will allow more conditions to be waited on via additional
sub-requests.  At the moment this just completes when the parent wait
completes.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_mutex_fcntl_helper.c | 65 +++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/ctdb/server/ctdb_mutex_fcntl_helper.c b/ctdb/server/ctdb_mutex_fcntl_helper.c
index 85095c64c71..bfd78565c6a 100644
--- a/ctdb/server/ctdb_mutex_fcntl_helper.c
+++ b/ctdb/server/ctdb_mutex_fcntl_helper.c
@@ -157,6 +157,63 @@ static bool wait_for_parent_recv(struct tevent_req *req)
 	return true;
 }
 
+/*
+ * Wait for a reason to exit, indicating that the lock is lost
+ */
+
+struct wait_for_exit_state {
+};
+
+static void wait_for_exit_parent_done(struct tevent_req *subreq);
+
+static struct tevent_req *wait_for_exit_send(TALLOC_CTX *mem_ctx,
+					     struct tevent_context *ev,
+					     pid_t ppid)
+{
+	struct tevent_req *req, *subreq;
+	struct wait_for_exit_state *state;
+
+	req = tevent_req_create(mem_ctx, &state, struct wait_for_exit_state);
+	if (req == NULL) {
+		return NULL;
+	}
+
+	subreq = wait_for_parent_send(state, ev, ppid);
+	if (tevent_req_nomem(subreq, req)) {
+		return tevent_req_post(req, ev);
+	}
+	tevent_req_set_callback(subreq, wait_for_exit_parent_done, req);
+
+	return req;
+}
+
+static void wait_for_exit_parent_done(struct tevent_req *subreq)
+{
+	struct tevent_req *req = tevent_req_callback_data(
+		subreq, struct tevent_req);
+	bool status;
+
+	status = wait_for_parent_recv(subreq);
+	TALLOC_FREE(subreq);
+	if (! status) {
+		/* Ignore error */
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"wait_for_parent_recv() failed\n");
+	}
+
+	tevent_req_done(req);
+}
+
+static bool wait_for_exit_recv(struct tevent_req *req)
+{
+	if (tevent_req_is_unix_error(req, NULL)) {
+		return false;
+	}
+
+	return true;
+}
+
 int main(int argc, char *argv[])
 {
 	struct tevent_context *ev;
@@ -191,20 +248,20 @@ int main(int argc, char *argv[])
 		return 0;
 	}
 
-	req = wait_for_parent_send(ev, ev, ppid);
+	req = wait_for_exit_send(ev, ev, ppid);
 	if (req == NULL) {
 		fprintf(stderr,
-			"%s: wait_for_parent_send() failed\n",
+			"%s: wait_for_exit_send() failed\n",
 			progname);
 		exit(1);
 	}
 
 	tevent_req_poll(req, ev);
 
-	status = wait_for_parent_recv(req);
+	status = wait_for_exit_recv(req);
 	if (! status) {
 		fprintf(stderr,
-			"%s: wait_for_parent_recv() failed\n",
+			"%s: wait_for_exit_recv() failed\n",
 			progname);
 	}
 
-- 
2.20.1


From bce2664e6f6d2b13d2baceddda2819dcc8b7a078 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 27 Jun 2019 16:14:26 +1000
Subject: [PATCH 10/15] ctdb-mutex: Add support for exiting if the lock file
 disappears

If the lock file is inaccessible or the inode number changes then the
lock is lost, so exit.  This allows the recovery daemon to trigger an
election.  The ensuing recovery will re-take the lock.

By default the lock file is checked every 60 seconds.  A lot can
happen in 60 seconds but being more aggressive and accessing the lock
too often could result in a performance issue for the cluster
filesystem.

An new optional 2nd argument is added, which is the lock file re-check
time in seconds.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_mutex_fcntl_helper.c | 175 +++++++++++++++++++++++++-
 ctdb/tests/cunit/cluster_mutex_002.sh |   2 +-
 2 files changed, 172 insertions(+), 5 deletions(-)

diff --git a/ctdb/server/ctdb_mutex_fcntl_helper.c b/ctdb/server/ctdb_mutex_fcntl_helper.c
index bfd78565c6a..461571ea257 100644
--- a/ctdb/server/ctdb_mutex_fcntl_helper.c
+++ b/ctdb/server/ctdb_mutex_fcntl_helper.c
@@ -29,6 +29,7 @@
 
 #include "lib/util/sys_rw.h"
 #include "lib/util/tevent_unix.h"
+#include "lib/util/util.h"
 
 /* protocol.h is just needed for ctdb_sock_addr, which is used in system.h */
 #include "protocol/protocol.h"
@@ -157,6 +158,118 @@ static bool wait_for_parent_recv(struct tevent_req *req)
 	return true;
 }
 
+/*
+ * Wait and check for lost lock - file removed or replaced
+ */
+
+struct wait_for_lost_state {
+	struct tevent_context *ev;
+	const char *lock_file;
+	ino_t inode;
+	unsigned long recheck_time;
+};
+
+static void wait_for_lost_check(struct tevent_req *subreq);
+
+static struct tevent_req *wait_for_lost_send(TALLOC_CTX *mem_ctx,
+					     struct tevent_context *ev,
+					     const char *lock_file,
+					     int fd,
+					     unsigned long recheck_time)
+{
+	struct tevent_req *req, *subreq;
+	struct wait_for_lost_state *state;
+	struct stat sb;
+	int ret;
+
+	req = tevent_req_create(mem_ctx, &state, struct wait_for_lost_state);
+	if (req == NULL) {
+		return NULL;
+	}
+
+	state->ev = ev;
+	state->lock_file = lock_file;
+	state->recheck_time = recheck_time;
+
+	ret = fstat(fd, &sb);
+	if (ret != 0) {
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"fstat() failed on lock file (%s) - lock lost\n",
+			strerror(errno));
+		tevent_req_done(req);
+		return tevent_req_post(req, ev);
+	}
+	state->inode = sb.st_ino;
+
+	subreq = tevent_wakeup_send(
+			state,
+			ev,
+			tevent_timeval_current_ofs(state->recheck_time, 0));
+	if (tevent_req_nomem(subreq, req)) {
+		return tevent_req_post(req, ev);
+	}
+	tevent_req_set_callback(subreq, wait_for_lost_check, req);
+
+	return req;
+}
+
+static void wait_for_lost_check(struct tevent_req *subreq)
+{
+	struct tevent_req *req = tevent_req_callback_data(
+		subreq, struct tevent_req);
+	struct wait_for_lost_state *state = tevent_req_data(
+		req, struct wait_for_lost_state);
+	bool status;
+	struct stat sb;
+	int ret;
+
+	status = tevent_wakeup_recv(subreq);
+	TALLOC_FREE(subreq);
+	if (! status) {
+		/* Ignore error */
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"tevent_wakeup_recv() failed\n");
+	}
+
+	ret = stat(state->lock_file, &sb);
+	if (ret != 0) {
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"stat() failed on lock file (%s) - lock lost\n",
+			strerror(errno));
+		tevent_req_done(req);
+		return;
+	}
+
+	if (sb.st_ino != state->inode) {
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"inode changed - lock lost\n");
+		tevent_req_done(req);
+		return;
+	}
+
+	subreq = tevent_wakeup_send(
+			state,
+			state->ev,
+			tevent_timeval_current_ofs(state->recheck_time, 0));
+	if (tevent_req_nomem(subreq, req)) {
+		return;
+	}
+	tevent_req_set_callback(subreq, wait_for_lost_check, req);
+}
+
+static bool wait_for_lost_recv(struct tevent_req *req)
+{
+	if (tevent_req_is_unix_error(req, NULL)) {
+		return false;
+	}
+
+	return true;
+}
+
 /*
  * Wait for a reason to exit, indicating that the lock is lost
  */
@@ -165,10 +278,14 @@ struct wait_for_exit_state {
 };
 
 static void wait_for_exit_parent_done(struct tevent_req *subreq);
+static void wait_for_exit_lost_done(struct tevent_req *subreq);
 
 static struct tevent_req *wait_for_exit_send(TALLOC_CTX *mem_ctx,
 					     struct tevent_context *ev,
-					     pid_t ppid)
+					     pid_t ppid,
+					     const char *lock_file,
+					     int fd,
+					     unsigned long recheck_time)
 {
 	struct tevent_req *req, *subreq;
 	struct wait_for_exit_state *state;
@@ -184,6 +301,18 @@ static struct tevent_req *wait_for_exit_send(TALLOC_CTX *mem_ctx,
 	}
 	tevent_req_set_callback(subreq, wait_for_exit_parent_done, req);
 
+	if (recheck_time > 0) {
+		subreq = wait_for_lost_send(state,
+					    ev,
+					    lock_file,
+					    fd,
+					    recheck_time);
+		if (tevent_req_nomem(subreq, req)) {
+			return tevent_req_post(req, ev);
+		}
+		tevent_req_set_callback(subreq, wait_for_exit_lost_done, req);
+	}
+
 	return req;
 }
 
@@ -205,6 +334,24 @@ static void wait_for_exit_parent_done(struct tevent_req *subreq)
 	tevent_req_done(req);
 }
 
+static void wait_for_exit_lost_done(struct tevent_req *subreq)
+{
+	struct tevent_req *req = tevent_req_callback_data(
+		subreq, struct tevent_req);
+	bool status;
+
+	status = wait_for_lost_recv(subreq);
+	TALLOC_FREE(subreq);
+	if (! status) {
+		/* Ignore error */
+		fprintf(stderr,
+			"ctdb_mutex_fcntl_helper: "
+			"wait_for_lost_recv() failed\n");
+	}
+
+	tevent_req_done(req);
+}
+
 static bool wait_for_exit_recv(struct tevent_req *req)
 {
 	if (tevent_req_is_unix_error(req, NULL)) {
@@ -214,20 +361,27 @@ static bool wait_for_exit_recv(struct tevent_req *req)
 	return true;
 }
 
+static void usage(void)
+{
+	fprintf(stderr, "Usage: %s <file> [recheck_time]\n", progname);
+}
+
 int main(int argc, char *argv[])
 {
 	struct tevent_context *ev;
 	char result;
 	int ppid;
 	const char *file = NULL;
+	unsigned long recheck_time;
+	int ret;
 	int fd = -1;
 	struct tevent_req *req;
 	bool status;
 
 	progname = argv[0];
 
-	if (argc != 2) {
-		fprintf(stderr, "Usage: %s <file>\n", progname);
+	if (argc < 2 || argc > 3) {
+		usage();
 		exit(1);
 	}
 
@@ -241,6 +395,19 @@ int main(int argc, char *argv[])
 
 	file = argv[1];
 
+	recheck_time = 60;
+	if (argc == 3) {
+		recheck_time = smb_strtoul(argv[2],
+					   NULL,
+					   10,
+					   &ret,
+					   SMB_STR_STANDARD);
+		if (ret != 0) {
+			usage();
+			exit(1);
+		}
+	}
+
 	result = fcntl_lock(file, &fd);
 	sys_write(STDOUT_FILENO, &result, 1);
 
@@ -248,7 +415,7 @@ int main(int argc, char *argv[])
 		return 0;
 	}
 
-	req = wait_for_exit_send(ev, ev, ppid);
+	req = wait_for_exit_send(ev, ev, ppid, file, fd, recheck_time);
 	if (req == NULL) {
 		fprintf(stderr,
 			"%s: wait_for_exit_send() failed\n",
diff --git a/ctdb/tests/cunit/cluster_mutex_002.sh b/ctdb/tests/cunit/cluster_mutex_002.sh
index 6cc92d0b2a3..1fe585d87c7 100755
--- a/ctdb/tests/cunit/cluster_mutex_002.sh
+++ b/ctdb/tests/cunit/cluster_mutex_002.sh
@@ -67,4 +67,4 @@ UNLOCK
 UNLOCK
 EOF
 unit_test cluster_mutex_test lock-file-removed-no-recheck \
-	  "$helper" "$lockfile"
+	  "$helper 0" "$lockfile"
-- 
2.20.1


From 17cbe5fe9f53b2723d7a2ee87cebc2eaeb826306 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 19 Jul 2019 13:41:30 +1000
Subject: [PATCH 11/15] ctdb-tests: Add tests for cluster mutex lost handling

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/cunit/cluster_mutex_002.sh |  21 +++++
 ctdb/tests/src/cluster_mutex_test.c   | 125 ++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)

diff --git a/ctdb/tests/cunit/cluster_mutex_002.sh b/ctdb/tests/cunit/cluster_mutex_002.sh
index 1fe585d87c7..9f33c112baa 100755
--- a/ctdb/tests/cunit/cluster_mutex_002.sh
+++ b/ctdb/tests/cunit/cluster_mutex_002.sh
@@ -68,3 +68,24 @@ UNLOCK
 EOF
 unit_test cluster_mutex_test lock-file-removed-no-recheck \
 	  "$helper 0" "$lockfile"
+
+ok <<EOF
+LOCK
+UNLOCK
+EOF
+unit_test cluster_mutex_test lock-file-wait-recheck-unlock \
+	  "$helper 5" 10
+
+ok <<EOF
+LOCK
+ctdb_mutex_fcntl_helper: stat() failed on lock file (No such file or directory) - lock lost
+LOST
+EOF
+unit_test cluster_mutex_test lock-file-removed "$helper 5" "$lockfile"
+
+ok <<EOF
+LOCK
+ctdb_mutex_fcntl_helper: inode changed - lock lost
+LOST
+EOF
+unit_test cluster_mutex_test lock-file-changed "$helper 10" "$lockfile"
diff --git a/ctdb/tests/src/cluster_mutex_test.c b/ctdb/tests/src/cluster_mutex_test.c
index fa7e1e03415..3bf653a3b00 100644
--- a/ctdb/tests/src/cluster_mutex_test.c
+++ b/ctdb/tests/src/cluster_mutex_test.c
@@ -26,6 +26,8 @@
 #include <talloc.h>
 #include <tevent.h>
 
+#include "lib/util/util.h"
+
 /*
  * ctdb_cluster_mutex.c is included below.  This requires a few hacks...
  */
@@ -512,6 +514,88 @@ static void test_lock_file_removed_no_recheck(TALLOC_CTX *mem_ctx,
 	assert(dl1->mh == NULL);
 }
 
+static void test_lock_file_wait_recheck_unlock(TALLOC_CTX *mem_ctx,
+					       struct ctdb_context *ctdb,
+					       const char *mutex_string,
+					       unsigned long wait_time)
+{
+	struct do_lock_context *dl;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	do_lock_wait_time(dl, wait_time);
+	assert(dl->mh != NULL);
+
+	/* UNLOCK */
+	do_unlock(dl);
+	assert(dl->mh == NULL);
+}
+
+static void test_lock_file_removed(TALLOC_CTX *mem_ctx,
+				   struct ctdb_context *ctdb,
+				   const char *mutex_string,
+				   const char *lock_file)
+{
+	struct do_lock_context *dl;
+	int ret;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	ret = unlink(lock_file);
+	assert(ret == 0);
+
+	while (dl->mh != NULL) {
+		/* LOST */
+		tevent_loop_once(ctdb->ev);
+	}
+}
+
+static void test_lock_file_changed(TALLOC_CTX *mem_ctx,
+				   struct ctdb_context *ctdb,
+				   const char *mutex_string,
+				   const char *lock_file)
+{
+	struct do_lock_context *dl;
+	char *t;
+	int fd;
+	int ret;
+
+	dl = talloc_zero(mem_ctx, struct do_lock_context);
+	assert(dl != NULL);
+	dl->ctdb = ctdb;
+
+	/* LOCK */
+	do_lock(dl, mutex_string);
+	assert(dl->mh != NULL);
+
+	t = talloc_asprintf(ctdb, "%s.new", lock_file);
+	assert(t != NULL);
+
+	fd = open(t, O_RDWR|O_CREAT, 0600);
+	assert(fd != -1);
+	close(fd);
+
+	ret = rename(t, lock_file);
+	assert(ret == 0);
+
+	while (dl->mh != NULL) {
+		/* LOST */
+		tevent_loop_once(ctdb->ev);
+	}
+}
+
 /*
  * Main
  */
@@ -538,6 +622,7 @@ int main(int argc, const char *argv[])
 	struct sigaction sa = { .sa_handler = NULL, };
 	int ret;
 	const char *lock_file;
+	unsigned int wait_time;
 
 	prog = argv[0];
 
@@ -589,6 +674,46 @@ int main(int argc, const char *argv[])
 						  ctdb,
 						  mutex_string,
 						  lock_file);
+	} else if (strcmp(test, "lock-file-wait-recheck-unlock") == 0) {
+		if (argc != 4) {
+			usage();
+		}
+
+		wait_time = smb_strtoul(argv[3],
+					NULL,
+					10,
+					&ret,
+					SMB_STR_STANDARD);
+		if (ret != 0) {
+			usage();
+		}
+
+		test_lock_file_wait_recheck_unlock(mem_ctx,
+						   ctdb,
+						   mutex_string,
+						   wait_time);
+	} else if (strcmp(test, "lock-file-removed") == 0) {
+		if (argc != 4) {
+			usage();
+		}
+
+		lock_file = argv[3];
+
+		test_lock_file_removed(mem_ctx,
+				       ctdb,
+				       mutex_string,
+				       lock_file);
+	} else if (strcmp(test, "lock-file-changed") == 0) {
+		if (argc != 4) {
+			usage();
+		}
+
+		lock_file = argv[3];
+
+		test_lock_file_changed(mem_ctx,
+				       ctdb,
+				       mutex_string,
+				       lock_file);
 	} else {
 		fprintf(stderr, "Unknown test\n");
 		exit(1);
-- 
2.20.1


From aa41b971b95091a9eaaafe9a3827b6998813d972 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 8 Jul 2019 16:17:27 +1000
Subject: [PATCH 12/15] ctdb-tests: Fix 01.reclock.script tests for non-default
 lock

These tests currently do not do what is expected.  They test the
default case.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/eventscripts/01.reclock.monitor.001.sh |  4 +---
 ctdb/tests/eventscripts/01.reclock.monitor.002.sh |  4 +---
 ctdb/tests/eventscripts/scripts/01.reclock.sh     | 11 +++++++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.001.sh b/ctdb/tests/eventscripts/01.reclock.monitor.001.sh
index 2922f5d0220..c495a47960e 100755
--- a/ctdb/tests/eventscripts/01.reclock.monitor.001.sh
+++ b/ctdb/tests/eventscripts/01.reclock.monitor.001.sh
@@ -4,9 +4,7 @@
 
 define_test "unset, check no-op"
 
-setup
-
-CTDB_RECOVERY_LOCK=""
+setup ""
 
 ok_null
 simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.002.sh b/ctdb/tests/eventscripts/01.reclock.monitor.002.sh
index d82aecf5b92..7d0dcbf0d19 100755
--- a/ctdb/tests/eventscripts/01.reclock.monitor.002.sh
+++ b/ctdb/tests/eventscripts/01.reclock.monitor.002.sh
@@ -4,9 +4,7 @@
 
 define_test "set to helper, check no-op"
 
-setup
-
-CTDB_RECOVERY_LOCK="!/some/recover/lock/helper foo"
+setup "!/some/recover/lock/helper foo"
 
 ok_null
 simple_test
diff --git a/ctdb/tests/eventscripts/scripts/01.reclock.sh b/ctdb/tests/eventscripts/scripts/01.reclock.sh
index a7094317a11..7916d7fc668 100644
--- a/ctdb/tests/eventscripts/scripts/01.reclock.sh
+++ b/ctdb/tests/eventscripts/scripts/01.reclock.sh
@@ -9,12 +9,19 @@ cleanup_reclock ()
 
 setup ()
 {
-	CTDB_RECOVERY_LOCK="${EVENTSCRIPTS_TESTS_VAR_DIR}/rec.lock"
+	if [ $# -eq 1 ] ; then
+		reclock="$1"
+	else
+		reclock="${EVENTSCRIPTS_TESTS_VAR_DIR}/reclock_subdir/rec.lock"
+	fi
+	CTDB_RECOVERY_LOCK="$reclock"
 
-	cat >>"${CTDB_BASE}/ctdb.conf" <<EOF
+	if [ -n "$CTDB_RECOVERY_LOCK" ] ; then
+		cat >>"${CTDB_BASE}/ctdb.conf" <<EOF
 [cluster]
 	recovery lock = $CTDB_RECOVERY_LOCK
 EOF
+	fi
 
 	test_cleanup cleanup_reclock
 }
-- 
2.20.1


From f8a3266bea3698c98296e39cffd9bb9148145e23 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 8 Jul 2019 16:37:41 +1000
Subject: [PATCH 13/15] ctdb-tests: Add some 01.reclock.script init event tests

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 .../tests/eventscripts/01.reclock.init.001.sh | 10 +++++++
 .../tests/eventscripts/01.reclock.init.002.sh | 10 +++++++
 .../tests/eventscripts/01.reclock.init.003.sh | 30 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100755 ctdb/tests/eventscripts/01.reclock.init.001.sh
 create mode 100755 ctdb/tests/eventscripts/01.reclock.init.002.sh
 create mode 100755 ctdb/tests/eventscripts/01.reclock.init.003.sh

diff --git a/ctdb/tests/eventscripts/01.reclock.init.001.sh b/ctdb/tests/eventscripts/01.reclock.init.001.sh
new file mode 100755
index 00000000000..c495a47960e
--- /dev/null
+++ b/ctdb/tests/eventscripts/01.reclock.init.001.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+define_test "unset, check no-op"
+
+setup ""
+
+ok_null
+simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.init.002.sh b/ctdb/tests/eventscripts/01.reclock.init.002.sh
new file mode 100755
index 00000000000..1bd409ca96c
--- /dev/null
+++ b/ctdb/tests/eventscripts/01.reclock.init.002.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+define_test "set to use helper, check no-op"
+
+setup "!/bin/false"
+
+ok_null
+simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.init.003.sh b/ctdb/tests/eventscripts/01.reclock.init.003.sh
new file mode 100755
index 00000000000..85f1f3c6f80
--- /dev/null
+++ b/ctdb/tests/eventscripts/01.reclock.init.003.sh
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+define_test "set to default lock file, directory is created"
+
+setup
+
+dir=$(dirname "$CTDB_RECOVERY_LOCK")
+
+# Ensure directory doesn't exist before
+required_result 1 ""
+unit_test test -d "$dir"
+
+# FreeBSD mkdir -v just prints the filename.  Filter the rest of the
+# message from other platforms, including any exotic quotes around the
+# filename.
+result_filter ()
+{
+	sed \
+		-e 's|^\(mkdir: created directory \)[[:punct:]]||' \
+		-e 's|[[:punct:]]$||'
+}
+
+ok "$dir"
+simple_test
+
+# Ensure directory exists after
+ok_null
+unit_test test -d "$dir"
-- 
2.20.1


From e919851cf8ee5f726e24777e5798ec585c146bf4 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 8 Jul 2019 13:30:06 +1000
Subject: [PATCH 14/15] ctdb-scripts: Drop monitoring of recovery lock

The fcntl helper now does a more meaningful check.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/config/events/legacy/01.reclock.script   | 28 -------------------
 .../eventscripts/01.reclock.monitor.001.sh    | 10 -------
 .../eventscripts/01.reclock.monitor.002.sh    | 10 -------
 .../eventscripts/01.reclock.monitor.003.sh    | 10 -------
 .../eventscripts/01.reclock.monitor.004.sh    | 18 ------------
 .../eventscripts/01.reclock.monitor.005.sh    | 28 -------------------
 ctdb/tests/eventscripts/scripts/01.reclock.sh | 11 --------
 7 files changed, 115 deletions(-)
 delete mode 100755 ctdb/tests/eventscripts/01.reclock.monitor.001.sh
 delete mode 100755 ctdb/tests/eventscripts/01.reclock.monitor.002.sh
 delete mode 100755 ctdb/tests/eventscripts/01.reclock.monitor.003.sh
 delete mode 100755 ctdb/tests/eventscripts/01.reclock.monitor.004.sh
 delete mode 100755 ctdb/tests/eventscripts/01.reclock.monitor.005.sh

diff --git a/ctdb/config/events/legacy/01.reclock.script b/ctdb/config/events/legacy/01.reclock.script
index e14d8c22f48..2f4ed355e5e 100755
--- a/ctdb/config/events/legacy/01.reclock.script
+++ b/ctdb/config/events/legacy/01.reclock.script
@@ -36,39 +36,11 @@ esac
 
 case "$1" in
 init)
-	ctdb_counter_init
-
 	if [ -n "$CTDB_RECOVERY_LOCK" ] ; then
 	    d=$(dirname "$CTDB_RECOVERY_LOCK")
 	    mkdir -vp "$d"
 	fi
 	;;
-
-monitor)
-	# Early exit if not using a reclock file
-	[ -n "$CTDB_RECOVERY_LOCK" ] || exit 0
-
-	# Try to stat the reclock file as a background process so that
-	# we don't block in case the cluster filesystem is unavailable
-	(
-	    if stat "$CTDB_RECOVERY_LOCK" ; then
-		# We could stat the file, reset the counter
-		ctdb_counter_init
-	    fi
-	) >/dev/null 2>&1 &
-
-	ctdb_counter_incr
-	num_fails=$(ctdb_counter_get)
-	if [ "$num_fails" -ge 200 ] ; then
-	    echo "Reclock file \"$CTDB_RECOVERY_LOCK\" can not be accessed. Shutting down."
-	    df
-	    sleep 1
-	    $CTDB shutdown
-	    exit 1
-	elif [ "$num_fails" -ge 4 ] ; then
-		die "ERROR: ${num_fails} consecutive failures checking reclock"
-	fi
-	;;
 esac
 
 exit 0
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.001.sh b/ctdb/tests/eventscripts/01.reclock.monitor.001.sh
deleted file mode 100755
index c495a47960e..00000000000
--- a/ctdb/tests/eventscripts/01.reclock.monitor.001.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "unset, check no-op"
-
-setup ""
-
-ok_null
-simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.002.sh b/ctdb/tests/eventscripts/01.reclock.monitor.002.sh
deleted file mode 100755
index 7d0dcbf0d19..00000000000
--- a/ctdb/tests/eventscripts/01.reclock.monitor.002.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "set to helper, check no-op"
-
-setup "!/some/recover/lock/helper foo"
-
-ok_null
-simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.003.sh b/ctdb/tests/eventscripts/01.reclock.monitor.003.sh
deleted file mode 100755
index 3e28ebbae7d..00000000000
--- a/ctdb/tests/eventscripts/01.reclock.monitor.003.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "set, exists"
-
-setup
-
-ok_null
-simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.004.sh b/ctdb/tests/eventscripts/01.reclock.monitor.004.sh
deleted file mode 100755
index 965f2466b16..00000000000
--- a/ctdb/tests/eventscripts/01.reclock.monitor.004.sh
+++ /dev/null
@@ -1,18 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "set, doesn't exist, 4 times"
-
-setup
-rm -f "$CTDB_RECOVERY_LOCK"
-
-ok_null
-simple_test
-simple_test
-simple_test
-
-required_result 1 <<EOF
-ERROR: 4 consecutive failures checking reclock
-EOF
-simple_test
diff --git a/ctdb/tests/eventscripts/01.reclock.monitor.005.sh b/ctdb/tests/eventscripts/01.reclock.monitor.005.sh
deleted file mode 100755
index 1590520469d..00000000000
--- a/ctdb/tests/eventscripts/01.reclock.monitor.005.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "set, doesn't exist, 4 times"
-
-setup
-rm -f "$CTDB_RECOVERY_LOCK"
-
-ok_null
-for i in $(seq 1 3) ; do
-	simple_test
-done
-
-for i in $(seq 4 199) ; do
-	required_result 1 <<EOF
-ERROR: ${i} consecutive failures checking reclock
-EOF
-	simple_test
-done
-
-required_result 1 <<EOF
-Reclock file "${CTDB_RECOVERY_LOCK}" can not be accessed. Shutting down.
-Filesystem             1024-blocks      Used Available Capacity Mounted on
-/dev/sda1                               1000000     100000     900000         10% /
-CTDB says BYE!
-EOF
-simple_test
diff --git a/ctdb/tests/eventscripts/scripts/01.reclock.sh b/ctdb/tests/eventscripts/scripts/01.reclock.sh
index 7916d7fc668..25c845f667b 100644
--- a/ctdb/tests/eventscripts/scripts/01.reclock.sh
+++ b/ctdb/tests/eventscripts/scripts/01.reclock.sh
@@ -1,12 +1,3 @@
-cleanup_reclock ()
-{
-	_pattern="${script_dir}/${script}"
-	while pgrep -f "$_pattern" >/dev/null ; do
-		echo "Waiting for backgrounded ${script} to exit..."
-		(FAKE_SLEEP_REALLY=yes sleep 1)
-	done
-}
-
 setup ()
 {
 	if [ $# -eq 1 ] ; then
@@ -22,6 +13,4 @@ setup ()
 	recovery lock = $CTDB_RECOVERY_LOCK
 EOF
 	fi
-
-	test_cleanup cleanup_reclock
 }
-- 
2.20.1


From fc1e92ea5189fe833157177c1e18a5c3697fb9f8 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 8 Jul 2019 16:35:57 +1000
Subject: [PATCH 15/15] ctdb-scripts: Simplify 01.reclock.script

The "init" event is only run once so don't bother caching the
configured value of the recovery lock.  Add some extra error checking.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/config/events/legacy/01.reclock.script | 56 ++++++++-------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/ctdb/config/events/legacy/01.reclock.script b/ctdb/config/events/legacy/01.reclock.script
index 2f4ed355e5e..29822e1d48c 100755
--- a/ctdb/config/events/legacy/01.reclock.script
+++ b/ctdb/config/events/legacy/01.reclock.script
@@ -4,43 +4,29 @@
 [ -n "$CTDB_BASE" ] || \
     CTDB_BASE=$(d=$(dirname "$0") ; cd -P "$d" ; dirname "$PWD")
 
-. "${CTDB_BASE}/functions"
-
-load_script_options
-
-ctdb_setup_state_dir "service" "reclock"
-
-ctdb_get_reclock_option ()
-{
-	_reclock_opt_file="${CTDB_SCRIPT_VARDIR}/recovery_lock.cache"
-
-	if [ -f "$_reclock_opt_file" ] ; then
-		. "$_reclock_opt_file"
-		return
-	fi
-
-	ctdb_translate_option "cluster" \
-			      "recovery lock" \
-			      "CTDB_RECOVERY_LOCK" >"$_reclock_opt_file"
-
-	. "$_reclock_opt_file"
-}
-
-ctdb_get_reclock_option
-
-# If CTDB_RECOVERY_LOCK specifies a helper then exit because this
-# script can't do anything useful.
-case "$CTDB_RECOVERY_LOCK" in
-!*) exit 0 ;;
-esac
-
 case "$1" in
 init)
-	if [ -n "$CTDB_RECOVERY_LOCK" ] ; then
-	    d=$(dirname "$CTDB_RECOVERY_LOCK")
-	    mkdir -vp "$d"
+	recovery_lock=$("${CTDB_HELPER_BINDIR}/ctdb-config" \
+				get cluster "recovery lock")
+	# xshellcheck disable=SC2181
+	# Above is already complicated enough without embedding into "if"
+	case $? in
+	0) : ;;
+	2) exit 0 ;; # ENOENT: not configured
+	*) die "Unexpected error getting recovery lock configuration"
+	esac
+
+	if [ -z "$recovery_lock" ] ; then
+		exit 0
 	fi
+
+	# If a helper is specified then exit because this script can't
+	# do anything useful
+	case "$recovery_lock" in
+	!*) exit 0 ;;
+	esac
+
+	d=$(dirname "$recovery_lock")
+	mkdir -vp "$d"
 	;;
 esac
-
-exit 0
-- 
2.20.1


--MP_//q7J4vFKhBD2ej3b20/zZpZ--

