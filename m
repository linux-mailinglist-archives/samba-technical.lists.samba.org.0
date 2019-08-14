Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C458C9FA
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 05:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=pNEuUwJtc90M+QOqbCBeatCFtonEGSzoIJn/pryspzo=; b=ON3byzMthqQHBHE/x4ojnJT6ak
	tKw/3k3TFJxALiCChYkYaM4o7beNOkM9Z/4wve88l/CZZrZXnRj7yXdesCte4SPNwOr5wJyJwUbS1
	Gk24xhYBH25Ggi39Q7GOAxxx54JYpXZ+AN3bjihrdMgyCzwPbvV/P1weDSDvmLaKxOCz1Cejh1KIb
	fGwpVT/yX9y7cHZzaQ4/zt5yMGRLrdl3wr+VSt83lJi0fc/4S5T0ucsqD8Q9eZSOZi656n0L2YPgs
	9QCKPhr6oXc8V+tXoBr+SpyP9066ecHNX+4txD6dkN+yzNFK16hG/M1hWxnv44nu3ziublOB0pCUr
	CBdbNOjw==;
Received: from localhost ([::1]:38272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxkR8-006Dts-HN; Wed, 14 Aug 2019 03:58:58 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59931 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxkR2-006Dtl-T2
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 03:58:56 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467bRT6NkXz9sML;
 Wed, 14 Aug 2019 13:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565755126; bh=PsaUAePS0y1vPjDc5sjd3fkeVonMPlRo5Hvo55i9jZM=;
 h=Date:From:To:Subject:From;
 b=HxXzSUVr+GP2352q3kX6/pNtb/eaUoYytSdRis4zfBoGJTw+AYl4IWlfkf/N17F5t
 Eg7mb44l8HDqh+t2SQFPqDZ221+X6+3Uydc7Prol9/nUiYs3nkD106MqYzj2VRW0Be
 pY8stIMT0WKKxU0uJj1O36uNS3qctTDw57iHqJxF2X9Kragsw8KIZ3u2omczP9wY5c
 pnoxiRvD7waHEZTqrDVFjg/4Y3mC48nCqT8z37FpHu7ZvEtP+baTqHRdhHfJuneYTd
 ONUx7Q+UYW8UwgWjlLWQLKiGR9xz3HDldqRg+CVa27qLgvu6OG7SGFmw9x1Zju20E0
 eVx7C6rypJO0A==
Date: Wed, 14 Aug 2019 13:58:44 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] run_tests.sh improvements and other test clean-ups
Message-ID: <20190814135844.3d7e556d@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/wOsPlHbCbAlmNELYijhGCdf"
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

--MP_/wOsPlHbCbAlmNELYijhGCdf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Highlights:

* Cleans up ctdb/tests/run_tests.sh and some other test scripts/includes

* Adds a ShellCheck test

* Adds a -I option for run_tests.sh to iterate over the given test(s)

* Drops the summary from run_tests.sh when run with -e

  This is particularly useful in autobuild where the summary makes it
  take longer to scroll back to see the failure.

Included in this pipeline:

  https://gitlab.com/samba-team/devel/samba/pipelines/76265339

Please review and maybe push...peace & happiness,
martin

--MP_/wOsPlHbCbAlmNELYijhGCdf
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-run-tests.patch

From 11da71a67ea85d210962aaf3c6707930804510bc Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:09:34 +1000
Subject: [PATCH 01/16] ctdb-tests: Avoid shellcheck warning SC2086

SC2086 Double quote to prevent globbing and word splitting

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index a9c68464883..087eae4257b 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -26,7 +26,7 @@ EOF
 # Print a message and exit.
 die ()
 {
-    echo "$1" >&2 ; exit ${2:-1}
+    echo "$1" >&2 ; exit "${2:-1}"
 }
 
 ######################################################################
@@ -106,11 +106,11 @@ ctdb_test_end ()
     local interp="SKIPPED"
     local statstr=" (reason $*)"
     if [ -n "$status" ] ; then
-	if [ $status -eq 0 ] ; then
+	if [ "$status" -eq 0 ] ; then
 	    interp="PASSED"
 	    statstr=""
 	    echo "ALL OK: $*"
-	elif [ $status -eq 124 ] ; then
+	elif [ "$status" -eq 124 ] ; then
 	    interp="TIMEOUT"
 	    statstr=" (status $status)"
 	else
@@ -137,7 +137,7 @@ ctdb_test_run ()
 
     local status=0
     if [ -x "$1" ] ; then
-	    timeout $TEST_TIMEOUT "$@" || status=$?
+	    timeout "$TEST_TIMEOUT" "$@" || status=$?
     else
 	    echo "TEST IS NOT EXECUTABLE"
 	    status=1
@@ -202,7 +202,7 @@ run_one_test ()
 	    t="*FAILED*"
 	fi
 	if $with_desc ; then
-	    desc=$(tail -n +4 $tf | head -n 1)
+	    desc=$(tail -n +4 "$tf" | head -n 1)
 	    f="$desc"
 	fi
 	echo "$t $f" >>"$sf"
@@ -300,7 +300,8 @@ for f in "${tests[@]}" ; do
 
     if [ $status -eq 127 ] ; then
 	# Find the the top-level tests directory
-	tests_dir=$(dirname $(cd $TEST_SCRIPTS_DIR; echo $PWD))
+	d=$(cd "$TEST_SCRIPTS_DIR"; echo "$PWD")
+	tests_dir=$(dirname "$d")
 	# Strip off current directory from beginning, if there, just
 	# to make paths more friendly.
 	tests_dir=${tests_dir#$PWD/}
-- 
2.20.1


From 276ed6260a57a1c41fc51d2c72a43deb89922791 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:12:23 +1000
Subject: [PATCH 02/16] ctdb-tests: Avoid shellcheck warning SC2164

SC2164 Use 'cd ... || exit' or 'cd ... || return' in case cd fails

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 087eae4257b..5d2d3ff560b 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -300,7 +300,10 @@ for f in "${tests[@]}" ; do
 
     if [ $status -eq 127 ] ; then
 	# Find the the top-level tests directory
-	d=$(cd "$TEST_SCRIPTS_DIR"; echo "$PWD")
+	d=$(cd "$TEST_SCRIPTS_DIR" && echo "$PWD")
+	if [ -z "$d" ] ; then
+	    die "Unable to find TEST_SCRIPTS_DIR=\"${TEST_SCRIPTS_DIR}\""
+	fi
 	tests_dir=$(dirname "$d")
 	# Strip off current directory from beginning, if there, just
 	# to make paths more friendly.
-- 
2.20.1


From 5329b41a31e60fcf1363ce46dbee58af381ec820 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:14:22 +1000
Subject: [PATCH 03/16] ctdb-tests: Avoid shellcheck warning SC2004

SC2004 $/${} is unnecessary on arithmetic variables

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 5d2d3ff560b..710bea40e8f 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -119,7 +119,7 @@ ctdb_test_end ()
 	fi
     fi
 
-    testduration=$(($(date +%s)-$teststarttime))
+    testduration=$(($(date +%s) - teststarttime))
 
     echo "=========================================================================="
     echo "TEST ${interp}: ${name}${statstr} (duration: ${testduration}s)"
@@ -185,14 +185,14 @@ run_one_test ()
 {
     local f="$1"
 
-    tests_total=$(($tests_total + 1))
+    tests_total=$((tests_total + 1))
 
     ctdb_test_run "$f" | tee "$tf" | show_progress
     status=$?
     if [ $status -eq 0 ] ; then
-	tests_passed=$(($tests_passed + 1))
+	tests_passed=$((tests_passed + 1))
     else
-	tests_failed=$(($tests_failed + 1))
+	tests_failed=$((tests_failed + 1))
     fi
     if $with_summary ; then
 	local t
-- 
2.20.1


From 88f494efdb2a058332c364c9cfdc172dcd4cbe38 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:18:08 +1000
Subject: [PATCH 04/16] ctdb-tests: Avoid shellcheck warning SC2155

SC2155 Declare and assign separately to avoid masking return values

The wscript changes require an identical change in local_daemons.sh.

While touching the lines in wscript, escape the backslashes to make
them literal backslashes.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/local_daemons.sh | 5 +++--
 ctdb/tests/run_tests.sh     | 5 +++--
 ctdb/wscript                | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/ctdb/tests/local_daemons.sh b/ctdb/tests/local_daemons.sh
index d9bbc5dfbea..aecf78590b3 100755
--- a/ctdb/tests/local_daemons.sh
+++ b/ctdb/tests/local_daemons.sh
@@ -5,8 +5,9 @@ set -u
 export CTDB_TEST_MODE="yes"
 
 # Following 2 lines may be modified by installation script
-export CTDB_TESTS_ARE_INSTALLED=false
-export CTDB_TEST_DIR=$(dirname "$0")
+CTDB_TESTS_ARE_INSTALLED=false
+CTDB_TEST_DIR=$(dirname "$0")
+export CTDB_TESTS_ARE_INSTALLED CTDB_TEST_DIR
 
 export TEST_SCRIPTS_DIR="${CTDB_TEST_DIR}/scripts"
 
diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 710bea40e8f..22235655e5b 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -236,8 +236,9 @@ find_and_run_one_test ()
 export CTDB_TEST_MODE="yes"
 
 # Following 2 lines may be modified by installation script
-export CTDB_TESTS_ARE_INSTALLED=false
-export CTDB_TEST_DIR=$(dirname "$0")
+CTDB_TESTS_ARE_INSTALLED=false
+CTDB_TEST_DIR=$(dirname "$0")
+export CTDB_TESTS_ARE_INSTALLED CTDB_TEST_DIR
 
 if [ -z "$TEST_VAR_DIR" ] ; then
     if $CTDB_TESTS_ARE_INSTALLED ; then
diff --git a/ctdb/wscript b/ctdb/wscript
index 573a8f0e643..03e29e133d8 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -1108,9 +1108,9 @@ def build(bld):
                       'script_install_paths.sh',
                       destname='script_install_paths.sh', chmod=MODE_644)
 
-    sed_expr1 = 's@^\(export %s\)=.*@\\1=%s@' % (
+    sed_expr1 = 's@^\\(%s\\)=.*@\\1=%s@' % (
                     'CTDB_TEST_DIR', bld.env.CTDB_TEST_DATADIR)
-    sed_expr2 = 's@^\(export CTDB_TESTS_ARE_INSTALLED\)=false@\\1=true@'
+    sed_expr2 = 's@^\\(CTDB_TESTS_ARE_INSTALLED\\)=false@\\\\1=true@'
     bld.SAMBA_GENERATOR('ctdb-test-runner',
                         source='tests/run_tests.sh',
                         target='ctdb_run_tests.sh',
-- 
2.20.1


From 158197ef5117929e6537b2da3d51596c019a9d34 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:19:13 +1000
Subject: [PATCH 05/16] ctdb-tests: Avoid shellcheck warning SC2188

SC2188 This redirection doesn't have a command...

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 22235655e5b..73523628c79 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -169,7 +169,7 @@ if ! which mktemp >/dev/null 2>&1 ; then
 	    if $dir ; then
 		mkdir "$t"
 	    else
-		>"$t"
+		: >"$t"
 	    fi
 	)
 	echo "$t"
-- 
2.20.1


From 09f6c18d70deac6ea19161ccc3da9b4d4b6e69c5 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:21:16 +1000
Subject: [PATCH 06/16] ctdb-tests: Avoid shellcheck warning SC2230

SC2230 which is non-standard...

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 73523628c79..faaac10ad61 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -155,7 +155,7 @@ tests_passed=0
 tests_failed=0
 summary=""
 
-if ! which mktemp >/dev/null 2>&1 ; then
+if ! type mktemp >/dev/null 2>&1 ; then
     # Not perfect, but it will do...
     mktemp ()
     {
-- 
2.20.1


From f52d807a0dcc8adf43732e5a20213a6f2a3cb581 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:22:36 +1000
Subject: [PATCH 07/16] ctdb-tests: Avoid shellcheck warning SC2034

SC2034 summary appears unused. Verify use (or export if used externally)

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/local_daemons.sh | 1 +
 ctdb/tests/run_tests.sh     | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/local_daemons.sh b/ctdb/tests/local_daemons.sh
index aecf78590b3..4934783ff9a 100755
--- a/ctdb/tests/local_daemons.sh
+++ b/ctdb/tests/local_daemons.sh
@@ -18,6 +18,7 @@ export TEST_SCRIPTS_DIR="${CTDB_TEST_DIR}/scripts"
 # to be correctly set so setup_ctdb_base() finds the etc-ctdb/
 # subdirectory and the test event script is correctly installed, so
 # fix it.
+# shellcheck disable=SC2034
 TEST_SUBDIR="$CTDB_TEST_DIR"
 
 if ! $CTDB_TESTS_ARE_INSTALLED ; then
diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index faaac10ad61..e0e399ca9fa 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -153,7 +153,6 @@ ctdb_test_run ()
 tests_total=0
 tests_passed=0
 tests_failed=0
-summary=""
 
 if ! type mktemp >/dev/null 2>&1 ; then
     # Not perfect, but it will do...
-- 
2.20.1


From 143f7b1c493918f4776c831b406730748d09ddd9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 10:28:52 +1000
Subject: [PATCH 08/16] ctdb-tests: Avoid shellcheck warning SC2045

SC2045 Iterating over ls output is fragile. Use globs.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index e0e399ca9fa..27f9b1d1878 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -217,7 +217,11 @@ find_and_run_one_test ()
 
     if [ -d "$f" ] ; then
 	local i
-	for i in $(ls "${f%/}/"*".sh" 2>/dev/null) ; do
+	for i in "${f%/}/"*".sh" ; do
+	    # Only happens if test removed (unlikely) or empty directory
+	    if [ ! -f "$i" ] ; then
+		break
+	    fi
 	    run_one_test "$i"
 	    if $exit_on_fail && [ $status -ne 0 ] ; then
 		break
-- 
2.20.1


From e26d71f1524641b00ad854029885bebef922d6be Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 12 Aug 2019 22:10:41 +1000
Subject: [PATCH 09/16] ctdb-tests: Simplify test_wrap script

Given other improvements, this is now needlessly complex.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/test_wrap | 18 ++++--------------
 ctdb/wscript                 | 12 ++++--------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/ctdb/tests/scripts/test_wrap b/ctdb/tests/scripts/test_wrap
index 3db3180ae98..d9a6d09e202 100755
--- a/ctdb/tests/scripts/test_wrap
+++ b/ctdb/tests/scripts/test_wrap
@@ -1,20 +1,10 @@
 #!/bin/bash
 
-# Execute the given command.  The intention is that it is a function
-# from "${TEST_SCRIPTS_DIR}/integration.bash".
+# Execute the given command.  The intention is that it is either
+# * a function from "${TEST_SCRIPTS_DIR}/integration.bash"; or
+# * a test helper binary
 
-PATH="$(dirname $0):${PATH}"
-
-TEST_SCRIPTS_DIR=$(dirname $0)
-
-# We need the test binaries (i.e. tests/bin/) to be in $PATH.  If they
-# aren't already in $PATH then we know that tests/bin/ sits alongside
-# tests/scripts/.
-f="fetch_ring"
-if [ ! $(which $f >/dev/null 2>&1) ] ; then
-    d=$(dirname "$TEST_SCRIPTS_DIR")/bin
-    [ -x "$d/$f" ] && PATH="$d:$PATH"
-fi
+TEST_SCRIPTS_DIR=$(dirname "$0")
 
 . "${TEST_SCRIPTS_DIR}/integration.bash"
 
diff --git a/ctdb/wscript b/ctdb/wscript
index 03e29e133d8..45207d5548a 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -1091,14 +1091,10 @@ def build(bld):
                           os.path.join('tests/scripts', t),
                           destname=os.path.join('scripts', t))
 
-    sed_expr = 's@^TEST_SCRIPTS_DIR=.*@&\\nexport TEST_BIN_DIR=\"%s\"@' % (
-               bld.env.CTDB_TEST_LIBEXECDIR)
-    bld.SAMBA_GENERATOR('ctdb-test-wrap',
-                        source='tests/scripts/test_wrap',
-                        target='test_wrap',
-                        rule='sed -e "%s" ${SRC} > ${TGT}' % sed_expr)
-    bld.INSTALL_FILES(bld.env.CTDB_TEST_DATADIR+"/scripts", 'test_wrap',
-                      destname='test_wrap', chmod=MODE_755)
+    bld.INSTALL_FILES(bld.env.CTDB_TEST_DATADIR,
+                      'tests/scripts/test_wrap',
+                      destname='scripts/test_wrap',
+                      chmod=MODE_755)
 
     bld.SAMBA_GENERATOR('ctdb-test-script-install-paths',
                         source='tests/scripts/script_install_paths.sh',
-- 
2.20.1


From 9c782bcd43778068170b5eb4480eb3cf4fcbd1bb Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 13 Aug 2019 10:53:48 +1000
Subject: [PATCH 10/16] ctdb-tests: Rename CTDB_SCRIPTS_TESTS_BINDIR to
 CTDB_SCRIPTS_TESTS_LIBEXEC_DIR

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/common.sh               | 4 ++--
 ctdb/tests/scripts/script_install_paths.sh | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ctdb/tests/scripts/common.sh b/ctdb/tests/scripts/common.sh
index ec06fa0c8db..519219ca982 100644
--- a/ctdb/tests/scripts/common.sh
+++ b/ctdb/tests/scripts/common.sh
@@ -25,8 +25,8 @@ if [ -d "$CTDB_SCRIPTS_TOOLS_BIN_DIR" ] ; then
 	PATH="${CTDB_SCRIPTS_TOOLS_BIN_DIR}:${PATH}"
 fi
 
-if [ -d "$CTDB_SCRIPTS_TESTS_BINDIR" ] ; then
-	PATH="${CTDB_SCRIPTS_TESTS_BINDIR}:${PATH}"
+if [ -d "$CTDB_SCRIPTS_TESTS_LIBEXEC_DIR" ] ; then
+	PATH="${CTDB_SCRIPTS_TESTS_LIBEXEC_DIR}:${PATH}"
 fi
 
 # Wait until either timeout expires or command succeeds.  The command
diff --git a/ctdb/tests/scripts/script_install_paths.sh b/ctdb/tests/scripts/script_install_paths.sh
index d67d3fba19f..c837cccd004 100644
--- a/ctdb/tests/scripts/script_install_paths.sh
+++ b/ctdb/tests/scripts/script_install_paths.sh
@@ -19,7 +19,7 @@ if ! $CTDB_TESTS_ARE_INSTALLED ; then
 	CTDB_SCRIPTS_TOOLS_HELPER_DIR="${ctdb_dir}/tools"
 	CTDB_SCRIPTS_HELPER_BINDIR="${top_dir}/bin"
 	CTDB_SCRIPTS_DATA_DIR="${ctdb_dir}/config"
-	CTDB_SCRIPTS_TESTS_BINDIR="${top_dir}/bin"
+	CTDB_SCRIPTS_TESTS_LIBEXEC_DIR="${top_dir}/bin"
 else
 	# Installed
 	CTDB_SCRIPTS_BASE="/usr/local/etc/ctdb"
@@ -29,7 +29,7 @@ else
 	CTDB_SCRIPTS_TOOLS_HELPER_DIR="/usr/local/libexec/ctdb"
 	CTDB_SCRIPTS_HELPER_BINDIR="/usr/local/libexec/ctdb"
 	CTDB_SCRIPTS_DATA_DIR="/usr/local/share/ctdb"
-	CTDB_SCRIPTS_TESTS_BINDIR="/usr/local/libexec/ctdb/tests"
+	CTDB_SCRIPTS_TESTS_LIBEXEC_DIR="/usr/local/libexec/ctdb/tests"
 fi
 
 export CTDB_SCRIPTS_BASE \
@@ -40,4 +40,4 @@ export CTDB_SCRIPTS_BASE \
        CTDB_SCRIPTS_TOOLS_HELPER_DIR \
        CTDB_SCRIPTS_HELPER_BINDIR \
        CTDB_SCRIPTS_DATA_DIR \
-       CTDB_SCRIPTS_TESTS_BINDIR
+       CTDB_SCRIPTS_TESTS_LIBEXEC_DIR
-- 
2.20.1


From 2b341f43c559e2d49bff47a12e89b599be9028b9 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 13 Aug 2019 10:57:47 +1000
Subject: [PATCH 11/16] ctdb-tests: New variable CTDB_SCRIPTS_TESTS_BIN_DIR

This can be used to find ctdb_run_tests and ctdb_local_daemons.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/script_install_paths.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ctdb/tests/scripts/script_install_paths.sh b/ctdb/tests/scripts/script_install_paths.sh
index c837cccd004..2bd8542e4b7 100644
--- a/ctdb/tests/scripts/script_install_paths.sh
+++ b/ctdb/tests/scripts/script_install_paths.sh
@@ -20,6 +20,7 @@ if ! $CTDB_TESTS_ARE_INSTALLED ; then
 	CTDB_SCRIPTS_HELPER_BINDIR="${top_dir}/bin"
 	CTDB_SCRIPTS_DATA_DIR="${ctdb_dir}/config"
 	CTDB_SCRIPTS_TESTS_LIBEXEC_DIR="${top_dir}/bin"
+	CTDB_SCRIPTS_TESTS_BIN_DIR="$CTDB_TEST_DIR"
 else
 	# Installed
 	CTDB_SCRIPTS_BASE="/usr/local/etc/ctdb"
@@ -30,6 +31,7 @@ else
 	CTDB_SCRIPTS_HELPER_BINDIR="/usr/local/libexec/ctdb"
 	CTDB_SCRIPTS_DATA_DIR="/usr/local/share/ctdb"
 	CTDB_SCRIPTS_TESTS_LIBEXEC_DIR="/usr/local/libexec/ctdb/tests"
+	CTDB_SCRIPTS_TESTS_BIN_DIR="/usr/local/bin"
 fi
 
 export CTDB_SCRIPTS_BASE \
@@ -40,4 +42,5 @@ export CTDB_SCRIPTS_BASE \
        CTDB_SCRIPTS_TOOLS_HELPER_DIR \
        CTDB_SCRIPTS_HELPER_BINDIR \
        CTDB_SCRIPTS_DATA_DIR \
-       CTDB_SCRIPTS_TESTS_LIBEXEC_DIR
+       CTDB_SCRIPTS_TESTS_LIBEXEC_DIR \
+       CTDB_SCRIPTS_TESTS_BIN_DIR
-- 
2.20.1


From 6fa5a687368efb10722b16040314f0e03aedf542 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 12 Aug 2019 15:13:47 +1000
Subject: [PATCH 12/16] ctdb-tests: Add shellcheck test for some test scripts
 and includes

These files now pass, so we might as well keep them in good shape.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/shellcheck/tests.sh | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100755 ctdb/tests/shellcheck/tests.sh

diff --git a/ctdb/tests/shellcheck/tests.sh b/ctdb/tests/shellcheck/tests.sh
new file mode 100755
index 00000000000..c5a25aaf81a
--- /dev/null
+++ b/ctdb/tests/shellcheck/tests.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+. "${TEST_SCRIPTS_DIR}/unit.sh"
+
+define_test "tests"
+
+if "$CTDB_TESTS_ARE_INSTALLED" ; then
+	run_tests="${CTDB_SCRIPTS_TESTS_BIN_DIR}/ctdb_run_tests"
+	local_daemons="${CTDB_SCRIPTS_TESTS_BIN_DIR}/ctdb_local_daemons"
+else
+	run_tests="${CTDB_TEST_DIR}/run_tests.sh"
+	local_daemons="${CTDB_TEST_DIR}/local_daemons.sh"
+fi
+
+# Scripts
+shellcheck_test \
+		"$run_tests" \
+		"$local_daemons" \
+		"${TEST_SCRIPTS_DIR}/test_wrap"
+
+# Includes
+shellcheck_test -s sh \
+	"${TEST_SCRIPTS_DIR}/common.sh" \
+	"${TEST_SCRIPTS_DIR}/script_install_paths.sh"
-- 
2.20.1


From e4ad7cc909fbe2530aec2e4366eada7270feda91 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 11:19:30 +1000
Subject: [PATCH 13/16] ctdb-tests: Factor out main test loop into run_tests()

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 57 ++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 27f9b1d1878..12e87b6c1b5 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -236,6 +236,37 @@ find_and_run_one_test ()
     fi
 }
 
+run_tests ()
+{
+	local tests=("$@")
+
+	for f in "${tests[@]}" ; do
+		find_and_run_one_test "$f"
+
+		if [ $status -eq 127 ] ; then
+			# Find the the top-level tests directory
+			d=$(cd "$TEST_SCRIPTS_DIR" && echo "$PWD")
+			if [ -z "$d" ] ; then
+				local t="$TEST_SCRIPTS_DIR"
+				die "Unable to find TEST_SCRIPTS_DIR=\"${t}\""
+			fi
+			tests_dir=$(dirname "$d")
+			# Strip off current directory from beginning,
+			# if there, just to make paths more friendly.
+			tests_dir="${tests_dir#${PWD}/}"
+			find_and_run_one_test "$f" "$tests_dir"
+		fi
+
+		if [ $status -eq 127 ] ; then
+			die "test \"$f\" is not recognised"
+		fi
+
+		if $exit_on_fail && [ $status -ne 0 ] ; then
+			return $status
+		fi
+	done
+}
+
 export CTDB_TEST_MODE="yes"
 
 # Following 2 lines may be modified by installation script
@@ -299,30 +330,8 @@ for f ; do
 	fi
 done
 
-for f in "${tests[@]}" ; do
-    find_and_run_one_test "$f"
-
-    if [ $status -eq 127 ] ; then
-	# Find the the top-level tests directory
-	d=$(cd "$TEST_SCRIPTS_DIR" && echo "$PWD")
-	if [ -z "$d" ] ; then
-	    die "Unable to find TEST_SCRIPTS_DIR=\"${TEST_SCRIPTS_DIR}\""
-	fi
-	tests_dir=$(dirname "$d")
-	# Strip off current directory from beginning, if there, just
-	# to make paths more friendly.
-	tests_dir=${tests_dir#$PWD/}
-	find_and_run_one_test "$f" "$tests_dir"
-    fi
-
-    if [ $status -eq 127 ] ; then
-	    die "test \"$f\" is not recognised"
-    fi
-
-    if $exit_on_fail && [ $status -ne 0 ] ; then
-	    break
-    fi
-done
+run_tests "${tests[@]}"
+status=$?
 
 rm -f "$tf"
 
-- 
2.20.1


From b213e3c1ab5e63046fd64b1040afcf56db2858ec Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 11:48:13 +1000
Subject: [PATCH 14/16] ctdb-tests: Add -I <count> option for iterating tests

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 12e87b6c1b5..c31bd6e9a9f 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -12,6 +12,7 @@ Options:
   -D		Show diff between failed/expected test output (some tests only)
   -e		Exit on the first test failure
   -H		No headers - for running single test with other wrapper
+  -I <count>    Iterate tests <count> times, exiting on failure (implies -e, -N)
   -N		Don't print summary of tests results after running all tests
   -q		Quiet - don't show tests being run (hint: use with -s)
   -S <lib>      Use socket wrapper library <lib> for local integration tests
@@ -35,6 +36,7 @@ with_summary=true
 with_desc=false
 quiet=false
 exit_on_fail=false
+max_iterations=1
 no_header=false
 
 export TEST_VERBOSE=false
@@ -48,7 +50,7 @@ export TEST_CLEANUP=false
 export TEST_TIMEOUT=3600
 export TEST_SOCKET_WRAPPER_SO_PATH=""
 
-while getopts "AcCdDehHNqS:T:vV:xX?" opt ; do
+while getopts "AcCdDehHI:NqS:T:vV:xX?" opt ; do
 	case "$opt" in
 	A) TEST_CAT_RESULTS_OPTS="-A" ;;
 	c) TEST_LOCAL_DAEMONS="" ;;
@@ -57,6 +59,7 @@ while getopts "AcCdDehHNqS:T:vV:xX?" opt ; do
 	D) TEST_DIFF_RESULTS=true ;;
 	e) exit_on_fail=true ;;
 	H) no_header=true ;;
+	I) max_iterations="$OPTARG" ; exit_on_fail=true ; with_summary=false ;;
 	N) with_summary=false ;;
 	q) quiet=true ;;
 	S) TEST_SOCKET_WRAPPER_SO_PATH="$OPTARG" ;;
@@ -330,8 +333,26 @@ for f ; do
 	fi
 done
 
-run_tests "${tests[@]}"
-status=$?
+iterations=0
+# Special case: -I 0 means iterate forever (until failure)
+while [ "$max_iterations" -eq 0 ] || [ $iterations -lt "$max_iterations" ] ; do
+	iterations=$((iterations + 1))
+
+	if [ "$max_iterations" -ne 1 ] ; then
+		echo
+		echo "##################################################"
+		echo "ITERATION ${iterations}"
+		echo "##################################################"
+		echo
+	fi
+
+	run_tests "${tests[@]}"
+	status=$?
+
+	if [ $status -ne 0 ] ; then
+		break
+	fi
+done
 
 rm -f "$tf"
 
-- 
2.20.1


From 5436b2e446c11af39c43d26769be5946b4af07bd Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 11:50:21 +1000
Subject: [PATCH 15/16] ctdb-tests: Drop mention of non-existent -s option

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index c31bd6e9a9f..0caec8f7c04 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -14,7 +14,7 @@ Options:
   -H		No headers - for running single test with other wrapper
   -I <count>    Iterate tests <count> times, exiting on failure (implies -e, -N)
   -N		Don't print summary of tests results after running all tests
-  -q		Quiet - don't show tests being run (hint: use with -s)
+  -q		Quiet - don't show tests being run (still displays summary)
   -S <lib>      Use socket wrapper library <lib> for local integration tests
   -v		Verbose - print test output for non-failures (only some tests)
   -V <dir>	Use <dir> as TEST_VAR_DIR
-- 
2.20.1


From dc3229417dc63f30aed9e3b967c1300d2fc8d80c Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Mon, 5 Aug 2019 11:52:16 +1000
Subject: [PATCH 16/16] ctdb-tests: Don't print summary on failure if -e option
 is specified

If there is a failure it will always be the last test run.  Don't
obscure this by following it with a summary.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index 0caec8f7c04..2f692c1b90b 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -357,10 +357,12 @@ done
 rm -f "$tf"
 
 if $with_summary ; then
-    echo
-    cat "$sf"
-    echo
-    echo "${tests_passed}/${tests_total} tests passed"
+	if [ $status -eq 0 ] || ! $exit_on_fail ; then
+		echo
+		cat "$sf"
+		echo
+		echo "${tests_passed}/${tests_total} tests passed"
+	fi
 fi
 
 rm -f "$sf"
-- 
2.20.1


--MP_/wOsPlHbCbAlmNELYijhGCdf--

