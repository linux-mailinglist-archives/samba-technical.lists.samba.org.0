Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EAA11796
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 12:49:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=MXSco8z2+7ohGn1NqUBW8PVJpqn9Cr50czH7kDL3DLo=; b=d7lNNJM7wqrj+TCpAuc16rWVlt
	n90FOOf2m6QLPVd49iFnVMHLWTaA2erRvQWJgPZ3bmCAIH9zhvIv1N7qZFp64/K+aazyqVEvHk+oX
	xfVprsxtoc7ILaaShApwDI+g9ZupuZTYotDmP3hbkoY0X9RpXnq5d+wTYnDSmvOevLMfb9VqtWIKN
	DQ+NDeuadKczKmyn2ayM4fd9a5Cg3e60e4VEbDiLjSCtyMpYU631Y+f3kCxebVb8g1L8aaOt/4c3I
	4h0Cel2iWZo5iUtxaswMcIJ97fkZYF3XtG5eWEYJT+MW0SXUL9q71c/B7LGY2fviufdbPK82VpszD
	6eez2ICA==;
Received: from localhost ([::1]:48440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM9Hc-0020oj-Ol; Thu, 02 May 2019 10:49:44 +0000
Received: from ozlabs.org ([203.11.71.1]:51221) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hM9HV-0020oc-VM
 for samba-technical@lists.samba.org; Thu, 02 May 2019 10:49:42 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vsTR6jYpz9s7T;
 Thu,  2 May 2019 20:49:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1556794172; bh=UaOeURJMtFENHs4U8+2XHHr9STpjLwi6IDGymiS2ur4=;
 h=Date:From:To:Subject:From;
 b=CGYrmlWNonFjZQw6ktMVely+9+QpQuM6grFyqQlGnr4WKxLE+W4kib7SnPW6kNl3B
 CLPptTDZip5A48D5nRXzFgaZ84IZH3HB6bcjuElMT8/CQ/mnlwGkv32WkCROIb0s9Z
 J+vOqClkYPGHB7099HL02Bij8T/8WZzgx7xEdc/Pgwd/H3yO2xf1n6X2aJPtW4wI2/
 vxAxAYIx6JKylfTxLgqUCr8uBwMJDZXcBrkb2GhqD0MVQ3y8WSASmsWtwyTxm7uyVh
 +DodZZ1HHWpDEymrlFOnXS7y+ZP7nOb2SFsWmvEvqqJ1TvU2RTEPiloE4nFF53bEUc
 OD9Zqd+Y8/JKw==
Date: Thu, 2 May 2019 20:49:29 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] CTDB test fixes (BZ13924)
Message-ID: <20190502204929.58b02257@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/JykkuNFDQ++yUGM.85/r/nm"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

--MP_/JykkuNFDQ++yUGM.85/r/nm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Fix some flapping tests, make debugging of autobuild failures more
likely, other minor fixes.

This depends on the previously posted patch set.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125

Please review and maybe push...

peace & happiness,
martin

--MP_/JykkuNFDQ++yUGM.85/r/nm
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=BZ13924.patch

From 96b5d33a34ae1ac8bf454b6f1f4e452aebaa353d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Tue, 30 Apr 2019 12:09:26 +1000
Subject: [PATCH 1/6] ctdb-tests: Change sanity_check_output() to internally
 use $out

All callers are currently passed $out.  Global variable $out is used
in many other places so use it here to simplify the interface and make
future changes simpler.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash     | 5 ++---
 ctdb/tests/simple/02_ctdb_tunables.sh   | 3 +--
 ctdb/tests/simple/05_ctdb_listnodes.sh  | 3 +--
 ctdb/tests/simple/09_ctdb_ping.sh       | 6 ++----
 ctdb/tests/simple/12_ctdb_getdebug.sh   | 3 +--
 ctdb/tests/simple/14_ctdb_statistics.sh | 2 +-
 ctdb/tests/simple/24_ctdb_getdbmap.sh   | 4 ++--
 ctdb/tests/simple/25_dumpmemory.sh      | 4 ++--
 ctdb/tests/simple/51_message_ring.sh    | 2 +-
 ctdb/tests/simple/52_fetch_ring.sh      | 2 +-
 ctdb/tests/simple/81_tunnel_ring.sh     | 2 +-
 11 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 6ba531a4a76..7aef0c7ee39 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -108,11 +108,10 @@ sanity_check_output ()
 {
     local min_lines="$1"
     local regexp="$2" # Should be anchored as necessary.
-    local output="$3"
 
     local ret=0
 
-    local num_lines=$(echo "$output" | wc -l)
+    local num_lines=$(echo "$out" | wc -l)
     echo "There are $num_lines lines of output"
     if [ $num_lines -lt $min_lines ] ; then
 	echo "BAD: that's less than the required number (${min_lines})"
@@ -121,7 +120,7 @@ sanity_check_output ()
 
     local status=0
     local unexpected # local doesn't pass through status of command on RHS.
-    unexpected=$(echo "$output" | egrep -v "$regexp") || status=$?
+    unexpected=$(echo "$out" | egrep -v "$regexp") || status=$?
 
     # Note that this is reversed.
     if [ $status -eq 0 ] ; then
diff --git a/ctdb/tests/simple/02_ctdb_tunables.sh b/ctdb/tests/simple/02_ctdb_tunables.sh
index 74163d9b2e6..e205da217e6 100755
--- a/ctdb/tests/simple/02_ctdb_tunables.sh
+++ b/ctdb/tests/simple/02_ctdb_tunables.sh
@@ -19,8 +19,7 @@ try_command_on_node -v 0 "$CTDB listvars"
 
 sanity_check_output \
     5 \
-    '^[[:alpha:]][[:alnum:]]+[[:space:]]*=[[:space:]]*[[:digit:]]+$' \
-    "$out"
+    '^[[:alpha:]][[:alnum:]]+[[:space:]]*=[[:space:]]*[[:digit:]]+$'
 
 echo "Verifying all variable values using \"ctdb getvar\"..."
 
diff --git a/ctdb/tests/simple/05_ctdb_listnodes.sh b/ctdb/tests/simple/05_ctdb_listnodes.sh
index 7e992c3ae5a..0adb291f758 100755
--- a/ctdb/tests/simple/05_ctdb_listnodes.sh
+++ b/ctdb/tests/simple/05_ctdb_listnodes.sh
@@ -39,8 +39,7 @@ ipv4_pat='[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'
 ipv6_pat='[[:xdigit:]]+:[[:xdigit:]:]+[[:xdigit:]]+'
 sanity_check_output \
     2 \
-    "^${ipv4_pat}|${ipv6_pat}\$" \
-    "$out"
+    "^${ipv4_pat}|${ipv6_pat}\$"
 
 out_0="$out"
 
diff --git a/ctdb/tests/simple/09_ctdb_ping.sh b/ctdb/tests/simple/09_ctdb_ping.sh
index 28552b94bfe..b911b896f99 100755
--- a/ctdb/tests/simple/09_ctdb_ping.sh
+++ b/ctdb/tests/simple/09_ctdb_ping.sh
@@ -39,8 +39,7 @@ try_command_on_node -v 0 "$CTDB ping -n 1"
 
 sanity_check_output \
     1 \
-    '^response from 1 time=-?[.0-9]+ sec[[:space:]]+\([[:digit:]]+ clients\)$' \
-    "$out"
+    '^response from 1 time=-?[.0-9]+ sec[[:space:]]+\([[:digit:]]+ clients\)$'
 
 try_command_on_node -v 0 "$CTDB shutdown -n 1"
 
@@ -50,5 +49,4 @@ try_command_on_node -v 0 "! $CTDB ping -n 1"
 
 sanity_check_output \
     1 \
-    "(: ctdb_control error: ('ctdb_control to disconnected node'|'node is disconnected')|Unable to get ping response from node 1|Node 1 is DISCONNECTED|ctdb_control for getpnn failed|: Can not access node. Node is not operational\.|Node 1 has status DISCONNECTED\|UNHEALTHY\|INACTIVE$)" \
-    "$out"
+    "(: ctdb_control error: ('ctdb_control to disconnected node'|'node is disconnected')|Unable to get ping response from node 1|Node 1 is DISCONNECTED|ctdb_control for getpnn failed|: Can not access node. Node is not operational\.|Node 1 has status DISCONNECTED\|UNHEALTHY\|INACTIVE$)"
diff --git a/ctdb/tests/simple/12_ctdb_getdebug.sh b/ctdb/tests/simple/12_ctdb_getdebug.sh
index 1189c1c710d..979392f9a1d 100755
--- a/ctdb/tests/simple/12_ctdb_getdebug.sh
+++ b/ctdb/tests/simple/12_ctdb_getdebug.sh
@@ -36,8 +36,7 @@ getdebug_onnode="$out"
 
 sanity_check_output \
     $num_nodes \
-    '^(ERROR|WARNING|NOTICE|INFO|DEBUG)$' \
-    "$out"
+    '^(ERROR|WARNING|NOTICE|INFO|DEBUG)$'
 
 cmd=""
 n=0
diff --git a/ctdb/tests/simple/14_ctdb_statistics.sh b/ctdb/tests/simple/14_ctdb_statistics.sh
index 70245ee7e9f..cda6e5f478e 100755
--- a/ctdb/tests/simple/14_ctdb_statistics.sh
+++ b/ctdb/tests/simple/14_ctdb_statistics.sh
@@ -35,4 +35,4 @@ pattern='^(CTDB version 1|Current time of statistics[[:space:]]*:.*|Statistics c
 
 try_command_on_node -v 1 "$CTDB statistics"
 
-sanity_check_output 40 "$pattern" "$out"
+sanity_check_output 40 "$pattern"
diff --git a/ctdb/tests/simple/24_ctdb_getdbmap.sh b/ctdb/tests/simple/24_ctdb_getdbmap.sh
index d8a3c604048..612fec1b49b 100755
--- a/ctdb/tests/simple/24_ctdb_getdbmap.sh
+++ b/ctdb/tests/simple/24_ctdb_getdbmap.sh
@@ -42,7 +42,7 @@ try_command_on_node -v 0 "$CTDB getdbmap"
 
 db_map_pattern='^(Number of databases:[[:digit:]]+|dbid:0x[[:xdigit:]]+ name:[^[:space:]]+ path:[^[:space:]]+)$'
 
-sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern" "$out"
+sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern"
 
 num_db_init=$(echo "$out" | sed -n -e '1s/.*://p')
 
@@ -51,7 +51,7 @@ for i in $(seq 1 5) ; do
     echo "Creating test database: $f"
     try_command_on_node 0 $CTDB attach "$f"
     try_command_on_node 0 $CTDB getdbmap
-    sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern" "$out"
+    sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern"
     num=$(echo "$out" | sed -n -e '1s/^.*://p')
     if [ $num = $(($num_db_init + $i)) ] ; then
 	echo "OK: correct number of additional databases"
diff --git a/ctdb/tests/simple/25_dumpmemory.sh b/ctdb/tests/simple/25_dumpmemory.sh
index 4f998bf8f3b..3d976c17d0f 100755
--- a/ctdb/tests/simple/25_dumpmemory.sh
+++ b/ctdb/tests/simple/25_dumpmemory.sh
@@ -31,8 +31,8 @@ cluster_is_healthy
 pat='^([[:space:]].+[[:space:]]+contains[[:space:]]+[[:digit:]]+ bytes in[[:space:]]+[[:digit:]]+ blocks \(ref [[:digit:]]+\)[[:space:]]+0x[[:xdigit:]]+|[[:space:]]+reference to: .+|full talloc report on .+ \(total[[:space:]]+[[:digit:]]+ bytes in [[:digit:]]+ blocks\))$'
 
 try_command_on_node -v 0 "$CTDB dumpmemory"
-sanity_check_output 10 "$pat" "$out"
+sanity_check_output 10 "$pat"
 
 echo
 try_command_on_node -v 0 "$CTDB rddumpmemory"
-sanity_check_output 10 "$pat" "$out"
+sanity_check_output 10 "$pat"
diff --git a/ctdb/tests/simple/51_message_ring.sh b/ctdb/tests/simple/51_message_ring.sh
index 8aa8e47fa80..f6f064e43bf 100755
--- a/ctdb/tests/simple/51_message_ring.sh
+++ b/ctdb/tests/simple/51_message_ring.sh
@@ -31,7 +31,7 @@ while read line ; do
 done <<<"$out"
 
 pat='^(Waiting for cluster|Ring\[[[:digit:]]+\]: [[:digit:]]+(\.[[:digit:]]+)? msgs/sec \(\+ve=[[:digit:]]+ -ve=[[:digit:]]+\))$'
-sanity_check_output 1 "$pat" "$out"
+sanity_check_output 1 "$pat"
 
 # $prev should look like this:
 #    Ring[1]: 10670.93 msgs/sec (+ve=53391 -ve=53373)
diff --git a/ctdb/tests/simple/52_fetch_ring.sh b/ctdb/tests/simple/52_fetch_ring.sh
index b12b2aa32f0..bdd8186c49e 100755
--- a/ctdb/tests/simple/52_fetch_ring.sh
+++ b/ctdb/tests/simple/52_fetch_ring.sh
@@ -26,7 +26,7 @@ echo "Running fetch_ring on all $num_nodes nodes."
 try_command_on_node -v -p all $CTDB_TEST_WRAPPER $VALGRIND fetch_ring -n $num_nodes
 
 pat='^(Waiting for cluster|Fetch\[[[:digit:]]+\]: [[:digit:]]+(\.[[:digit:]]+)? msgs/sec)$'
-sanity_check_output 1 "$pat" "$out"
+sanity_check_output 1 "$pat"
 
 # Get the last line of output.
 while read line ; do
diff --git a/ctdb/tests/simple/81_tunnel_ring.sh b/ctdb/tests/simple/81_tunnel_ring.sh
index 2c5091d3b9b..990039abfcb 100755
--- a/ctdb/tests/simple/81_tunnel_ring.sh
+++ b/ctdb/tests/simple/81_tunnel_ring.sh
@@ -32,7 +32,7 @@ while read line ; do
 done <<<"$out"
 
 pat='^(Waiting for cluster|pnn\[[[:digit:]]+\] [[:digit:]]+(\.[[:digit:]]+)? msgs/sec)$'
-sanity_check_output 1 "$pat" "$out"
+sanity_check_output 1 "$pat"
 
 # $prev should look like this:
 #    pnn[2] count=85400
-- 
2.20.1


From babd9afc48b2b85a02eb106bc4c2b5d270bebeec Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 28 Mar 2019 14:26:52 +1100
Subject: [PATCH 2/6] ctdb-tests: Make try_command_on_node less error-prone

This sometimes fails, apparently due to a cat process in onnode
getting EAGAIN.  The conclusion is that tests that process large
amounts of output should not depend on a sub-shell delivering that
output into a shell variable.

Change try_command_on_node() to leave all of the output in file
$outfile and just put the first 1KB into $out.  $outfile is removed
after each test completes.

Change the implementation of sanity_check_output() to use $outfile
instead of $out.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/scripts/integration.bash | 30 +++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index 7aef0c7ee39..d9afe898ad2 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -72,7 +72,20 @@ ctdb_test_init ()
 
 ########################################
 
-# Sets: $out
+# Sets: $out, $outfile
+# * The first 1KB of output is put into $out
+# * Tests should use $outfile for handling large output
+# * $outfile is removed after each test
+out=""
+outfile="${TEST_VAR_DIR}/try_command_on_node.out"
+
+outfile_cleanup ()
+{
+	rm -f "$outfile"
+}
+
+ctdb_test_exit_hook_add outfile_cleanup
+
 try_command_on_node ()
 {
     local nodespec="$1" ; shift
@@ -91,17 +104,18 @@ try_command_on_node ()
 
     local cmd="$*"
 
-    out=$(onnode -q $onnode_opts "$nodespec" "$cmd" 2>&1) || {
-
+    if ! onnode -q $onnode_opts "$nodespec" "$cmd" >"$outfile" 2>&1 ; then
 	echo "Failed to execute \"$cmd\" on node(s) \"$nodespec\""
-	echo "$out"
+	cat "$outfile"
 	return 1
-    }
+    fi
 
     if $verbose ; then
 	echo "Output of \"$cmd\":"
-	echo "$out"
+	cat "$outfile"
     fi
+
+    out=$(dd if="$outfile" bs=1k count=1 2>/dev/null)
 }
 
 sanity_check_output ()
@@ -111,7 +125,7 @@ sanity_check_output ()
 
     local ret=0
 
-    local num_lines=$(echo "$out" | wc -l)
+    local num_lines=$(wc -l <"$outfile")
     echo "There are $num_lines lines of output"
     if [ $num_lines -lt $min_lines ] ; then
 	echo "BAD: that's less than the required number (${min_lines})"
@@ -120,7 +134,7 @@ sanity_check_output ()
 
     local status=0
     local unexpected # local doesn't pass through status of command on RHS.
-    unexpected=$(echo "$out" | egrep -v "$regexp") || status=$?
+    unexpected=$(grep -Ev "$regexp" "$outfile") || status=$?
 
     # Note that this is reversed.
     if [ $status -eq 0 ] ; then
-- 
2.20.1


From 5d69fd9a478af73aa2f9fbe2f1f65a7d67b195eb Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Thu, 11 Apr 2019 20:55:20 +1000
Subject: [PATCH 3/6] ctdb-tests: Avoid bulk output in $out, prefer $outfile

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 .../tests/complex/11_ctdb_delip_removes_ip.sh | 10 ++---
 ctdb/tests/complex/18_ctdb_reloadips.sh       |  8 ++--
 ctdb/tests/complex/32_cifs_tickle.sh          |  7 ----
 ctdb/tests/complex/36_smb_reset_server.sh     | 12 +-----
 ctdb/tests/complex/37_nfs_reset_server.sh     |  4 +-
 ctdb/tests/complex/60_rogueip_releaseip.sh    |  2 +-
 ctdb/tests/complex/scripts/local.bash         |  5 +--
 ctdb/tests/scripts/integration.bash           | 40 +++++--------------
 ctdb/tests/simple/02_ctdb_tunables.sh         |  3 +-
 ctdb/tests/simple/05_ctdb_listnodes.sh        |  2 +-
 ctdb/tests/simple/08_ctdb_isnotrecmaster.sh   | 10 ++---
 ctdb/tests/simple/11_ctdb_ip.sh               | 14 ++++---
 ctdb/tests/simple/15_ctdb_statisticsreset.sh  | 21 +++++-----
 ctdb/tests/simple/19_ip_takeover_noop.sh      |  4 +-
 ctdb/tests/simple/20_delip_iface_gc.sh        | 10 ++---
 ctdb/tests/simple/21_ctdb_attach.sh           |  7 ++--
 ctdb/tests/simple/23_ctdb_moveip.sh           | 25 +++++++++++-
 ctdb/tests/simple/24_ctdb_getdbmap.sh         |  6 +--
 ..._config_check_error_on_unreachable_ctdb.sh |  6 +--
 ctdb/tests/simple/27_ctdb_detach.sh           | 21 +++++-----
 ctdb/tests/simple/35_ctdb_getreclock.sh       |  2 +-
 ctdb/tests/simple/51_message_ring.sh          | 12 +++---
 ctdb/tests/simple/52_fetch_ring.sh            | 12 +++---
 ctdb/tests/simple/53_transaction_loop.sh      |  4 +-
 .../simple/54_transaction_loop_recovery.sh    |  4 +-
 ctdb/tests/simple/55_ctdb_ptrans.sh           | 12 +++---
 .../56_replicated_transaction_recovery.sh     |  4 +-
 ctdb/tests/simple/58_ctdb_restoredb.sh        |  8 ++--
 .../simple/69_recovery_resurrect_deleted.sh   | 10 ++---
 ctdb/tests/simple/70_recoverpdbbyseqnum.sh    |  4 +-
 ctdb/tests/simple/71_ctdb_wipedb.sh           |  4 +-
 .../simple/72_update_record_persistent.sh     |  4 +-
 .../tests/simple/75_readonly_records_basic.sh | 24 +++++------
 ctdb/tests/simple/77_ctdb_db_recovery.sh      |  6 +--
 ctdb/tests/simple/79_volatile_db_traverse.sh  |  4 +-
 ctdb/tests/simple/80_ctdb_traverse.sh         |  2 +-
 ctdb/tests/simple/81_tunnel_ring.sh           | 12 +++---
 ctdb/tests/simple/90_debug_hung_script.sh     |  6 +--
 38 files changed, 161 insertions(+), 190 deletions(-)

diff --git a/ctdb/tests/complex/11_ctdb_delip_removes_ip.sh b/ctdb/tests/complex/11_ctdb_delip_removes_ip.sh
index b5c8866d67a..543472c0f22 100755
--- a/ctdb/tests/complex/11_ctdb_delip_removes_ip.sh
+++ b/ctdb/tests/complex/11_ctdb_delip_removes_ip.sh
@@ -22,8 +22,8 @@ cluster_is_healthy
 select_test_node_and_ips
 get_test_ip_mask_and_iface
 
-echo "Checking that node ${test_node} hosts ${test_ip} on interface ${iface}..."
-try_command_on_node $test_node "ip addr show dev $iface | grep -E 'inet6?[[:space:]]*${test_ip}/'"
+echo "Checking that node ${test_node} hosts ${test_ip}..."
+try_command_on_node $test_node "ip addr show to ${test_ip} | grep -q ."
 
 echo "Attempting to remove ${test_ip} from node ${test_node}."
 try_command_on_node $test_node $CTDB delip $test_ip
@@ -33,10 +33,10 @@ wait_until_ips_are_on_node '!' $test_node $test_ip
 timeout=60
 increment=5
 count=0
-echo "Waiting for ${test_ip} to disappear from ${iface}..."
+echo "Waiting for ${test_ip} to disappear from node ${test_node}..."
 while : ; do
-    try_command_on_node -v $test_node "ip addr show dev $iface"
-    if echo "$out" | grep -E 'inet6?[[:space:]]*${test_ip}/'; then
+    try_command_on_node -v $test_node "ip addr show to ${test_node}"
+    if -n "$out" ; then
 	echo "Still there..."
 	if [ $(($count * $increment)) -ge $timeout ] ; then
 	    echo "BAD: Timed out waiting..."
diff --git a/ctdb/tests/complex/18_ctdb_reloadips.sh b/ctdb/tests/complex/18_ctdb_reloadips.sh
index 2beff771874..4ba1b26a8e8 100755
--- a/ctdb/tests/complex/18_ctdb_reloadips.sh
+++ b/ctdb/tests/complex/18_ctdb_reloadips.sh
@@ -48,12 +48,12 @@ select_test_node_and_ips
 
 echo "Getting public IP information from CTDB..."
 try_command_on_node any "$CTDB ip -X -v all"
-ctdb_ip_info=$(echo "$out" | awk -F'|' 'NR > 1 { print $2, $3, $5 }')
+ctdb_ip_info=$(awk -F'|' 'NR > 1 { print $2, $3, $5 }' "$outfile")
 
 echo "Getting IP information from interfaces..."
 try_command_on_node all "ip addr show"
-ip_addr_info=$(echo "$out" | \
-    awk '$1 == "inet" { ip = $2; sub(/\/.*/, "", ip); print ip }')
+ip_addr_info=$(awk '$1 == "inet" { ip = $2; sub(/\/.*/, "", ip); print ip }' \
+		   "$outfile")
 
 prefix=""
 for b in $(seq 0 255) ; do
@@ -168,7 +168,7 @@ check_ips ()
 
     try_command_on_node $test_node "ip addr show dev ${iface}"
     local ip_addrs_file=$(mktemp)
-    echo "$out" | \
+    cat "$outfile" | \
 	sed -n -e "s@.*inet * \(${prefix//./\.}\.[0-9]*\)/.*@\1@p" | \
 	sort >"$ip_addrs_file"
 
diff --git a/ctdb/tests/complex/32_cifs_tickle.sh b/ctdb/tests/complex/32_cifs_tickle.sh
index 4f2cdadbdfc..bfe3df4e82f 100755
--- a/ctdb/tests/complex/32_cifs_tickle.sh
+++ b/ctdb/tests/complex/32_cifs_tickle.sh
@@ -61,13 +61,6 @@ echo "Source socket is $src_socket"
 # we sometimes beat the registration.
 echo "Checking if CIFS connection is tracked by CTDB on test node..."
 wait_until 10 check_tickles $test_node $test_ip $test_port $src_socket
-echo "$out"
-
-if [ "${out/SRC: ${src_socket} /}" != "$out" ] ; then
-    echo "GOOD: CIFS connection tracked OK by CTDB."
-else
-    die "BAD: Socket not tracked by CTDB."
-fi
 
 # This is almost immediate.  However, it is sent between nodes
 # asynchonously, so it is worth checking...
diff --git a/ctdb/tests/complex/36_smb_reset_server.sh b/ctdb/tests/complex/36_smb_reset_server.sh
index 0de77722fc3..870b80661aa 100755
--- a/ctdb/tests/complex/36_smb_reset_server.sh
+++ b/ctdb/tests/complex/36_smb_reset_server.sh
@@ -59,16 +59,8 @@ echo "Source socket is $src_socket"
 
 # This should happen as soon as connection is up... but unless we wait
 # we sometimes beat the registration.
-echo "Checking if CIFS connection is tracked by CTDB on test node..."
+echo "Waiting until SMB connection is tracked by CTDB on test node..."
 wait_until 10 check_tickles $test_node $test_ip $test_port $src_socket
-echo "$out"
-
-if [ "${out/SRC: ${src_socket} /}" != "$out" ] ; then
-    echo "GOOD: CIFS connection tracked OK by CTDB."
-else
-    echo "BAD: Socket not tracked by CTDB."
-    exit 1
-fi
 
 # It would be nice if ss consistently used local/peer instead of src/dst
 ss_filter="src ${test_ip}:${test_port} dst ${src_socket}"
@@ -80,7 +72,7 @@ if [ -z "$out" ] ; then
 	exit 1
 fi
 echo "GOOD: ss lists the socket:"
-echo "$out"
+cat "$outfile"
 
 echo "Disabling node $test_node"
 try_command_on_node 1 $CTDB disable -n $test_node
diff --git a/ctdb/tests/complex/37_nfs_reset_server.sh b/ctdb/tests/complex/37_nfs_reset_server.sh
index 7190af0f552..32ff9295cc6 100755
--- a/ctdb/tests/complex/37_nfs_reset_server.sh
+++ b/ctdb/tests/complex/37_nfs_reset_server.sh
@@ -60,7 +60,7 @@ echo "Source socket is $src_socket"
 echo "Wait until NFS connection is tracked by CTDB on test node ..."
 wait_until $((monitor_interval * 2)) \
 	   check_tickles $test_node $test_ip $test_port $src_socket
-echo "$out"
+cat "$outfile"
 
 # It would be nice if ss consistently used local/peer instead of src/dst
 ss_filter="src ${test_ip}:${test_port} dst ${src_socket}"
@@ -72,7 +72,7 @@ if [ -z "$out" ] ; then
 	exit 1
 fi
 echo "GOOD: ss lists the socket:"
-echo "$out"
+cat "$outfile"
 
 echo "Disabling node $test_node"
 try_command_on_node 1 $CTDB disable -n $test_node
diff --git a/ctdb/tests/complex/60_rogueip_releaseip.sh b/ctdb/tests/complex/60_rogueip_releaseip.sh
index 2fddc06f867..88e4e554c34 100755
--- a/ctdb/tests/complex/60_rogueip_releaseip.sh
+++ b/ctdb/tests/complex/60_rogueip_releaseip.sh
@@ -31,7 +31,7 @@ for i in $all_pnns ; do
 		continue
 	fi
 	try_command_on_node $i "$CTDB ip"
-	n=$(awk -v ip="$test_ip" '$1 == ip { print }' <<<"$out")
+	n=$(awk -v ip="$test_ip" '$1 == ip { print }' "$outfile")
 	if [ -n "$n" ] ; then
 		other_node="$i"
 		break
diff --git a/ctdb/tests/complex/scripts/local.bash b/ctdb/tests/complex/scripts/local.bash
index 7787de8f111..787f597edcc 100644
--- a/ctdb/tests/complex/scripts/local.bash
+++ b/ctdb/tests/complex/scripts/local.bash
@@ -67,7 +67,7 @@ check_tickles ()
     local src_socket="$4"
     try_command_on_node $node ctdb gettickles $test_ip $test_port
     # SRC: 10.0.2.45:49091   DST: 10.0.2.143:445
-    [ "${out/SRC: ${src_socket} /}" != "$out" ]
+    grep -Fq "SRC: ${src_socket} " "$outfile"
 }
 
 check_tickles_all ()
@@ -79,8 +79,7 @@ check_tickles_all ()
 
     try_command_on_node all ctdb gettickles $test_ip $test_port
     # SRC: 10.0.2.45:49091   DST: 10.0.2.143:445
-    local t="${src_socket//./\\.}"
-    local count=$(grep -E -c "SRC: ${t} " <<<"$out" || true)
+    local count=$(grep -Fc "SRC: ${src_socket} " "$outfile" || true)
     [ $count -eq $numnodes ]
 }
 
diff --git a/ctdb/tests/scripts/integration.bash b/ctdb/tests/scripts/integration.bash
index d9afe898ad2..ce5bd576b24 100644
--- a/ctdb/tests/scripts/integration.bash
+++ b/ctdb/tests/scripts/integration.bash
@@ -148,30 +148,7 @@ sanity_check_output ()
     return $ret
 }
 
-sanity_check_ips ()
-{
-    local ips="$1" # list of "ip node" lines
-
-    echo "Sanity checking IPs..."
-
-    local x ipp prev
-    prev=""
-    while read x ipp ; do
-	[ "$ipp" = "-1" ] && break
-	if [ -n "$prev" -a "$ipp" != "$prev" ] ; then
-	    echo "OK"
-	    return 0
-	fi
-	prev="$ipp"
-    done <<<"$ips"
-
-    echo "BAD: a node was -1 or IPs are only assigned to one node:"
-    echo "$ips"
-    echo "Are you running an old version of CTDB?"
-    return 1
-}
-
-# This returns a list of "ip node" lines in $out
+# This returns a list of "ip node" lines in $outfile
 all_ips_on_node()
 {
     local node="$1"
@@ -192,9 +169,9 @@ _select_test_node_and_ips ()
 	    test_node="$pnn"
 	fi
 	if [ "$pnn" = "$test_node" ] ; then
-            test_node_ips="${test_node_ips}${test_node_ips:+ }${ip}"
+	    test_node_ips="${test_node_ips}${test_node_ips:+ }${ip}"
 	fi
-    done <<<"$out" # bashism to avoid problem setting variable in pipeline.
+    done <"$outfile"
 
     echo "Selected node ${test_node} with IPs: ${test_node_ips}."
     test_ip="${test_node_ips%% *}"
@@ -264,7 +241,7 @@ delete_ip_from_all_nodes ()
 	    if [ "$_ip" = "$_i" ] ; then
 		_nodes="${_nodes}${_nodes:+,}${_pnn}"
 	    fi
-	done <<<"$out" # bashism
+	done <"$outfile"
     done
 
     try_command_on_node -pq "$_nodes" "$CTDB delip $_ip"
@@ -435,7 +412,7 @@ ips_are_on_node ()
 	    if $negating ; then
 		ips="${ips/${check}}"
 	    fi
-	done <<<"$out" # bashism to avoid problem setting variable in pipeline.
+	done <"$outfile"
     done
 
     ips="${ips// }" # Remove any spaces.
@@ -477,7 +454,7 @@ node_has_some_ips ()
 	if [ "$node" = "$pnn" ] ; then
 	    return 0
 	fi
-    done <<<"$out" # bashism to avoid problem setting variable in pipeline.
+    done <"$outfile"
 
     return 1
 }
@@ -614,7 +591,8 @@ wait_for_monitor_event ()
 	return 1
     }
 
-    local ctdb_scriptstatus_original="$out"
+    mv "$outfile" "${outfile}.orig"
+
     wait_until 120 _ctdb_scriptstatus_changed
 }
 
@@ -625,7 +603,7 @@ _ctdb_scriptstatus_changed ()
 	return 1
     }
 
-    [ "$out" != "$ctdb_scriptstatus_original" ]
+    ! diff "$outfile" "${outfile}.orig" >/dev/null
 }
 
 #######################################
diff --git a/ctdb/tests/simple/02_ctdb_tunables.sh b/ctdb/tests/simple/02_ctdb_tunables.sh
index e205da217e6..2e7a08b6f6f 100755
--- a/ctdb/tests/simple/02_ctdb_tunables.sh
+++ b/ctdb/tests/simple/02_ctdb_tunables.sh
@@ -23,7 +23,6 @@ sanity_check_output \
 
 echo "Verifying all variable values using \"ctdb getvar\"..."
 
-echo "$out" |
 while read var x val ; do
     try_command_on_node 0 "$CTDB getvar $var"
 
@@ -33,7 +32,7 @@ while read var x val ; do
 	echo "MISMATCH on $var: $val != $val2"
 	exit 1
     fi
-done
+done <"$outfile"
 
 echo "GOOD: all tunables match"
 
diff --git a/ctdb/tests/simple/05_ctdb_listnodes.sh b/ctdb/tests/simple/05_ctdb_listnodes.sh
index 0adb291f758..722c9d2a035 100755
--- a/ctdb/tests/simple/05_ctdb_listnodes.sh
+++ b/ctdb/tests/simple/05_ctdb_listnodes.sh
@@ -32,7 +32,7 @@ cluster_is_healthy
 
 try_command_on_node -v 0 "$CTDB listnodes"
 
-num_nodes=$(echo "$out" | wc -l)
+num_nodes=$(wc -l <"$outfile")
 
 # Each line should look like an IP address.
 ipv4_pat='[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+'
diff --git a/ctdb/tests/simple/08_ctdb_isnotrecmaster.sh b/ctdb/tests/simple/08_ctdb_isnotrecmaster.sh
index 12c8164b223..68e22879ba3 100755
--- a/ctdb/tests/simple/08_ctdb_isnotrecmaster.sh
+++ b/ctdb/tests/simple/08_ctdb_isnotrecmaster.sh
@@ -33,13 +33,11 @@ set -e
 cluster_is_healthy
 
 cmd="$CTDB isnotrecmaster || true"
-try_command_on_node all "$cmd"
-echo "Output of \"$cmd\":"
-echo "$out"
+try_command_on_node -v all "$cmd"
 
-num_all_lines=$(echo "$out" |  wc -l)
-num_rm_lines=$(echo "$out" | fgrep -c 'this node is the recmaster') || true
-num_not_rm_lines=$(echo "$out" | fgrep -c 'this node is not the recmaster') || true
+num_all_lines=$(wc -l <"$outfile")
+num_rm_lines=$(grep -Fc 'this node is the recmaster' "$outfile") || true
+num_not_rm_lines=$(grep -Fc 'this node is not the recmaster' "$outfile") || true
 
 if [ $num_rm_lines -eq 1 ] ; then
     echo "OK, there is only 1 recmaster"
diff --git a/ctdb/tests/simple/11_ctdb_ip.sh b/ctdb/tests/simple/11_ctdb_ip.sh
index 4b11729a1e1..d9fdd28f775 100755
--- a/ctdb/tests/simple/11_ctdb_ip.sh
+++ b/ctdb/tests/simple/11_ctdb_ip.sh
@@ -33,18 +33,20 @@ cluster_is_healthy
 
 echo "Getting list of public IPs..."
 try_command_on_node -v 1 "$CTDB ip all | tail -n +2"
-ips=$(echo "$out" | sed \
+ips=$(sed \
 	-e 's@ node\[@ @' \
-	-e 's@\].*$@@')
-machineout=$(echo "$out" | sed -r \
+	-e 's@\].*$@@' \
+	"$outfile")
+machineout=$(sed -r \
 	-e 's@^| |$@\|@g' \
 	-e 's@[[:alpha:]]+\[@@g' \
-	-e 's@\]@@g')
+	-e 's@\]@@g' \
+	"$outfile")
 
 if [ -z "$TEST_LOCAL_DAEMONS" ]; then
 	while read ip pnn ; do
-		try_command_on_node $pnn "ip addr show"
-		if [ "${out/inet* ${ip}\/}" != "$out" ] ; then
+		try_command_on_node $pnn "ip addr show to ${ip}"
+		if [ -n "$out" ] ; then
 			echo "GOOD: node $pnn appears to have $ip assigned"
 		else
 			die "BAD: node $pnn does not appear to have $ip assigned"
diff --git a/ctdb/tests/simple/15_ctdb_statisticsreset.sh b/ctdb/tests/simple/15_ctdb_statisticsreset.sh
index 8843a4dd9f7..1dce7b39965 100755
--- a/ctdb/tests/simple/15_ctdb_statisticsreset.sh
+++ b/ctdb/tests/simple/15_ctdb_statisticsreset.sh
@@ -37,10 +37,11 @@ num_nodes="$out"
 
 get_stat ()
 {
-    local label="$1"
-    local out="$2"
+	local label="$1"
 
-    echo "$out" | sed -rn -e "s@^[[:space:]]+${label}[[:space:]]+([[:digit:]])@\1@p" | head -1
+	cat "$outfile" |
+	sed -rn -e "s@^[[:space:]]+${label}[[:space:]]+([[:digit:]])@\1@p" |
+	head -1
 }
 
 check_reduced ()
@@ -59,20 +60,20 @@ check_reduced ()
 n=0
 while [ $n -lt $num_nodes ] ; do
     echo "Getting initial statistics for node ${n}..."
-    
+
     try_command_on_node -v $n $CTDB statistics
 
-    before_req_control=$(get_stat "req_control" "$out")
-    before_reply_control=$(get_stat "reply_control" "$out")
-    before_node_packets_recv=$(get_stat "node_packets_recv" "$out")
+    before_req_control=$(get_stat "req_control")
+    before_reply_control=$(get_stat "reply_control")
+    before_node_packets_recv=$(get_stat "node_packets_recv")
 
     try_command_on_node $n $CTDB statisticsreset
 
     try_command_on_node -v $n $CTDB statistics
 
-    after_req_control=$(get_stat "req_control" "$out")
-    after_reply_control=$(get_stat "reply_control" "$out")
-    after_node_packets_recv=$(get_stat "node_packets_recv" "$out")
+    after_req_control=$(get_stat "req_control")
+    after_reply_control=$(get_stat "reply_control")
+    after_node_packets_recv=$(get_stat "node_packets_recv")
 
     check_reduced "req_control" "$before_req_control" "$after_req_control"
     check_reduced "reply_control" "$before_reply_control" "$after_reply_control"
diff --git a/ctdb/tests/simple/19_ip_takeover_noop.sh b/ctdb/tests/simple/19_ip_takeover_noop.sh
index 8aedb339d94..93caf668c0b 100755
--- a/ctdb/tests/simple/19_ip_takeover_noop.sh
+++ b/ctdb/tests/simple/19_ip_takeover_noop.sh
@@ -34,9 +34,7 @@ while read ip pnn ; do
 	if [ "$pnn" != "-1" ] ; then
 		die "BAD: IP address ${ip} is assigned to node ${pnn}"
 	fi
-done <<EOF
-$out
-EOF
+done <"$outfile"
 
 echo "GOOD: All IP addresses are unassigned"
 
diff --git a/ctdb/tests/simple/20_delip_iface_gc.sh b/ctdb/tests/simple/20_delip_iface_gc.sh
index 6cc39580c5e..2756f64ceb1 100755
--- a/ctdb/tests/simple/20_delip_iface_gc.sh
+++ b/ctdb/tests/simple/20_delip_iface_gc.sh
@@ -19,14 +19,14 @@ select_test_node_and_ips
 
 # Find interfaces on test node
 try_command_on_node $test_node "$CTDB ifaces -X"
-ifaces=$(awk -F'|' 'NR > 1 { print $2 }' <<<"$out")
+ifaces=$(awk -F'|' 'NR > 1 { print $2 }' "$outfile")
 echo "Node ${test_node} has interfaces: ${ifaces}"
 
 # Delete all IPs on each interface...  deleting IPs from one interface
 # can cause other interfaces to disappear, so we need to be careful...
 for i in $ifaces ; do
     try_command_on_node $test_node "$CTDB ifaces -X"
-    info=$(awk -F'|' -v iface="$i" '$2 == iface { print $0 }' <<<"$out")
+    info=$(awk -F'|' -v iface="$i" '$2 == iface { print $0 }' "$outfile")
 
     if [ -z "$info" ] ; then
 	echo "Interface ${i} missing... assuming already deleted!"
@@ -38,7 +38,7 @@ for i in $ifaces ; do
 
     try_command_on_node $test_node "$CTDB ip -v -X | tail -n +2"
     awk -F'|' -v i="$i" \
-	'$6 == i { print $2 }' <<<"$out" |
+	'$6 == i { print $2 }' "$outfile" |
     while read ip ; do
 	echo "  $ip"
 	try_command_on_node $test_node "$CTDB delip $ip"
@@ -46,8 +46,8 @@ for i in $ifaces ; do
     try_command_on_node $test_node "$CTDB ipreallocate"
 
     try_command_on_node $test_node "$CTDB ifaces -X"
-    info=$(awk -F'|' -v iface="$i" '$2 == iface { print $0 }' <<<"$out")
-    
+    info=$(awk -F'|' -v iface="$i" '$2 == iface { print $0 }' "$outfile")
+
     if [ -z "$info" ] ; then
 	echo "GOOD: Interface ${i} has been garbage collected"
     else
diff --git a/ctdb/tests/simple/21_ctdb_attach.sh b/ctdb/tests/simple/21_ctdb_attach.sh
index 88f91e69acd..7965ced6052 100755
--- a/ctdb/tests/simple/21_ctdb_attach.sh
+++ b/ctdb/tests/simple/21_ctdb_attach.sh
@@ -36,9 +36,8 @@ cluster_is_healthy
 
 ######################################################################
 
-try_command_on_node 0 "$CTDB listnodes -X"
-listnodes_output="$out"
-numnodes=$(wc -l <<<"$listnodes_output")
+try_command_on_node 0 "$CTDB listnodes -X | wc -l"
+numnodes="$out"
 lastnode=$(( numnodes - 1 ))
 
 ######################################################################
@@ -55,7 +54,7 @@ check_db ()
 	echo "$out"
 	exit 1
     else
-	local flags=$(awk '{print $4}' <<<"$out") || true
+	local flags=$(awk '{print $4}' "$outfile") || true
 	if [ "$flags" = "$flag" ]; then
 	    echo "GOOD: database $db is attached on node $node with flag $flag"
 	else
diff --git a/ctdb/tests/simple/23_ctdb_moveip.sh b/ctdb/tests/simple/23_ctdb_moveip.sh
index 4220d1268e4..699ccc3d2ee 100755
--- a/ctdb/tests/simple/23_ctdb_moveip.sh
+++ b/ctdb/tests/simple/23_ctdb_moveip.sh
@@ -23,7 +23,28 @@ cluster_is_healthy
 
 select_test_node_and_ips
 
-sanity_check_ips "$out"
+sanity_check_ips ()
+{
+    echo "Sanity checking IPs..."
+
+    local x ipp prev
+    prev=""
+    while read x ipp ; do
+	[ "$ipp" = "-1" ] && break
+	if [ -n "$prev" -a "$ipp" != "$prev" ] ; then
+	    echo "OK"
+	    return 0
+	fi
+	prev="$ipp"
+    done <"$outfile"
+
+    echo "BAD: a node was -1 or IPs are only assigned to one node:"
+    cat "$outfile"
+    echo "Are you running an old version of CTDB?"
+    return 1
+}
+
+sanity_check_ips
 
 # Find a target node - it must be willing to host $test_ip
 try_command_on_node any "$CTDB listnodes | wc -l"
@@ -37,7 +58,7 @@ for i in $(seq 0 $(($num_nodes - 1)) ) ; do
 	    to_node="$i"
 	    break 2
 	fi
-    done <<<"$out"
+    done <"$outfile"
 done
 
 if [ -z "$to_node" ] ; then
diff --git a/ctdb/tests/simple/24_ctdb_getdbmap.sh b/ctdb/tests/simple/24_ctdb_getdbmap.sh
index 612fec1b49b..32d6d26a4ff 100755
--- a/ctdb/tests/simple/24_ctdb_getdbmap.sh
+++ b/ctdb/tests/simple/24_ctdb_getdbmap.sh
@@ -44,7 +44,7 @@ db_map_pattern='^(Number of databases:[[:digit:]]+|dbid:0x[[:xdigit:]]+ name:[^[
 
 sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern"
 
-num_db_init=$(echo "$out" | sed -n -e '1s/.*://p')
+num_db_init=$(sed -n -e '1s/.*://p' "$outfile")
 
 for i in $(seq 1 5) ; do
     f=$(make_temp_db_filename)
@@ -52,14 +52,14 @@ for i in $(seq 1 5) ; do
     try_command_on_node 0 $CTDB attach "$f"
     try_command_on_node 0 $CTDB getdbmap
     sanity_check_output $(($num_db_init + 1)) "$dbmap_pattern"
-    num=$(echo "$out" | sed -n -e '1s/^.*://p')
+    num=$(sed -n -e '1s/^.*://p' "$outfile")
     if [ $num = $(($num_db_init + $i)) ] ; then
 	echo "OK: correct number of additional databases"
     else
 	echo "BAD: no additional database"
 	exit 1
     fi
-    if [ "${out/name:${f} /}" != "$out" ] ; then
+    if awk '{print $2}' "$outfile" | grep -Fqx "name:$f" ; then
 	echo "OK: getdbmap knows about \"$f\""
     else
 	echo "BAD: getdbmap does not know about \"$f\""
diff --git a/ctdb/tests/simple/26_ctdb_config_check_error_on_unreachable_ctdb.sh b/ctdb/tests/simple/26_ctdb_config_check_error_on_unreachable_ctdb.sh
index f356c820260..d7c0c0f9100 100755
--- a/ctdb/tests/simple/26_ctdb_config_check_error_on_unreachable_ctdb.sh
+++ b/ctdb/tests/simple/26_ctdb_config_check_error_on_unreachable_ctdb.sh
@@ -42,8 +42,8 @@ cluster_is_healthy
 
 test_node=1
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 echo "There are $num_nodes nodes."
 
 echo "Shutting down node ${test_node}..."
@@ -58,7 +58,7 @@ pat="ctdb_control error: 'ctdb_control to disconnected node'|ctdb_control error:
 for i in ip disable enable "ban 0" unban listvars ; do
     try_command_on_node -v 0 ! $CTDB $i -n $test_node
 
-    if egrep -q "$pat" <<<"$out" ; then
+    if egrep -q "$pat" "$outfile" ; then
 	echo "OK: \"ctdb ${i}\" fails with expected \"disconnected node\" message"
     else
 	echo "BAD: \"ctdb ${i}\" does not fail with expected \"disconnected node\" message"
diff --git a/ctdb/tests/simple/27_ctdb_detach.sh b/ctdb/tests/simple/27_ctdb_detach.sh
index e8ca2382e88..f7f7a7e8c40 100755
--- a/ctdb/tests/simple/27_ctdb_detach.sh
+++ b/ctdb/tests/simple/27_ctdb_detach.sh
@@ -32,9 +32,8 @@ cluster_is_healthy
 
 ######################################################################
 
-try_command_on_node 0 "$CTDB listnodes -X"
-listnodes_output="$out"
-numnodes=$(wc -l <<<"$listnodes_output")
+try_command_on_node 0 "$CTDB listnodes -X | wc -l"
+numnodes="$out"
 
 ######################################################################
 
@@ -43,12 +42,12 @@ check_db ()
 {
     db="$1"
     try_command_on_node all $CTDB getdbmap
-    local num_db=$(grep -cF "$db" <<<"$out") || true
+    local num_db=$(grep -cF "$db" "$outfile") || true
     if [ $num_db -eq $numnodes ]; then
 	echo "GOOD: database $db is attached on all nodes"
     else
 	echo "BAD: database $db is not attached on all nodes"
-	echo "$out"
+	cat "$outfile"
 	exit 1
     fi
 }
@@ -58,12 +57,12 @@ check_no_db ()
 {
     db="$1"
     try_command_on_node all $CTDB getdbmap
-    local num_db=$(grep -cF "$db" <<<"$out") || true
+    local num_db=$(grep -cF "$db" "$outfile") || true
     if [ $num_db -eq 0 ]; then
 	echo "GOOD: database $db is not attached any more"
     else
 	echo "BAD: database $db is still attached"
-	echo "$out"
+	cat "$outfile"
 	exit 1
     fi
 }
@@ -134,12 +133,12 @@ echo
 echo "Write a key to database"
 try_command_on_node 0 $CTDB writekey $testdb1 foo bar
 try_command_on_node 0 $CTDB catdb $testdb1
-num_keys=$(echo "$out" | sed -n -e 's/Dumped \([0-9]*\) records/\1/p') || true
+num_keys=$(sed -n -e 's/Dumped \([0-9]*\) records/\1/p' "$outfile") || true
 if [ -n "$num_keys" -a $num_keys -eq 1 ]; then
     echo "GOOD: Key added to database"
 else
     echo "BAD: Key did not get added to database"
-    echo "$out"
+    cat "$outfile"
     exit 1
 fi
 
@@ -158,11 +157,11 @@ check_db "$testdb1"
 echo
 echo "Check if the database is empty"
 try_command_on_node 0 $CTDB catdb $testdb1
-num_keys=$(echo "$out" | sed -n -e 's/Dumped \([0-9]*\) records/\1/p') || true
+num_keys=$(sed -n -e 's/Dumped \([0-9]*\) records/\1/p' "$outfile") || true
 if [ -n "$num_keys" -a $num_keys -eq 0 ]; then
     echo "GOOD: Database $testdb1 is empty"
 else
     echo "BAD: Database $testdb1 is not empty"
-    echo "$out"
+    cat "$outfile"
     exit 1
 fi
diff --git a/ctdb/tests/simple/35_ctdb_getreclock.sh b/ctdb/tests/simple/35_ctdb_getreclock.sh
index 0a2f3d5b92e..8cedd34045b 100755
--- a/ctdb/tests/simple/35_ctdb_getreclock.sh
+++ b/ctdb/tests/simple/35_ctdb_getreclock.sh
@@ -25,7 +25,7 @@ if [ -z "$out" ] ; then
     exit 0
 fi
 
-n=$(echo "$out" | sort -u | wc -l)
+n=$(sort -u "$outfile" | wc -l)
 if [ "$n" = 1 ] ; then
 	echo "GOOD: All nodes have the same recovery lock setting"
 else
diff --git a/ctdb/tests/simple/51_message_ring.sh b/ctdb/tests/simple/51_message_ring.sh
index f6f064e43bf..6f90c8fd5bb 100755
--- a/ctdb/tests/simple/51_message_ring.sh
+++ b/ctdb/tests/simple/51_message_ring.sh
@@ -19,23 +19,21 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 echo "Running message_ring on all $num_nodes nodes."
 try_command_on_node -v -p all $CTDB_TEST_WRAPPER $VALGRIND message_ring -n $num_nodes
 
 # Get the last line of output.
-while read line ; do
-    prev=$line
-done <<<"$out"
+last=$(tail -n 1 "$outfile")
 
 pat='^(Waiting for cluster|Ring\[[[:digit:]]+\]: [[:digit:]]+(\.[[:digit:]]+)? msgs/sec \(\+ve=[[:digit:]]+ -ve=[[:digit:]]+\))$'
 sanity_check_output 1 "$pat"
 
-# $prev should look like this:
+# $last should look like this:
 #    Ring[1]: 10670.93 msgs/sec (+ve=53391 -ve=53373)
-stuff="${prev##Ring\[*\]: }"
+stuff="${last##Ring\[*\]: }"
 mps="${stuff% msgs/sec*}"
 
 if [ ${mps%.*} -ge 10 ] ; then
diff --git a/ctdb/tests/simple/52_fetch_ring.sh b/ctdb/tests/simple/52_fetch_ring.sh
index bdd8186c49e..05632024cb5 100755
--- a/ctdb/tests/simple/52_fetch_ring.sh
+++ b/ctdb/tests/simple/52_fetch_ring.sh
@@ -19,8 +19,8 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 echo "Running fetch_ring on all $num_nodes nodes."
 try_command_on_node -v -p all $CTDB_TEST_WRAPPER $VALGRIND fetch_ring -n $num_nodes
@@ -29,13 +29,11 @@ pat='^(Waiting for cluster|Fetch\[[[:digit:]]+\]: [[:digit:]]+(\.[[:digit:]]+)?
 sanity_check_output 1 "$pat"
 
 # Get the last line of output.
-while read line ; do
-    prev=$line
-done <<<"$out"
+last=$(tail -n 1 "$outfile")
 
-# $prev should look like this:
+# $last should look like this:
 #    Fetch[1]: 10670.93 msgs/sec
-stuff="${prev##*Fetch\[*\]: }"
+stuff="${last##*Fetch\[*\]: }"
 mps="${stuff% msgs/sec*}"
 
 if [ ${mps%.*} -ge 10 ] ; then
diff --git a/ctdb/tests/simple/53_transaction_loop.sh b/ctdb/tests/simple/53_transaction_loop.sh
index 2102e401384..d47761216ce 100755
--- a/ctdb/tests/simple/53_transaction_loop.sh
+++ b/ctdb/tests/simple/53_transaction_loop.sh
@@ -24,8 +24,8 @@ TESTDB="persistent_trans.tdb"
 try_command_on_node 0 "$CTDB attach $TESTDB persistent"
 try_command_on_node 0 "$CTDB wipedb $TESTDB"
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 if [ -z "$CTDB_TEST_TIMELIMIT" ] ; then
     CTDB_TEST_TIMELIMIT=30
diff --git a/ctdb/tests/simple/54_transaction_loop_recovery.sh b/ctdb/tests/simple/54_transaction_loop_recovery.sh
index 61ac29ca178..7beacb9c913 100755
--- a/ctdb/tests/simple/54_transaction_loop_recovery.sh
+++ b/ctdb/tests/simple/54_transaction_loop_recovery.sh
@@ -43,8 +43,8 @@ TESTDB="persistent_trans.tdb"
 try_command_on_node 0 "$CTDB attach $TESTDB persistent"
 try_command_on_node 0 "$CTDB wipedb $TESTDB"
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 if [ -z "$CTDB_TEST_TIMELIMIT" ] ; then
     CTDB_TEST_TIMELIMIT=30
diff --git a/ctdb/tests/simple/55_ctdb_ptrans.sh b/ctdb/tests/simple/55_ctdb_ptrans.sh
index e7db3aea456..72b18348398 100755
--- a/ctdb/tests/simple/55_ctdb_ptrans.sh
+++ b/ctdb/tests/simple/55_ctdb_ptrans.sh
@@ -51,11 +51,11 @@ echo "$items" | try_command_on_node -i 0 $CTDB ptrans "$TESTDB"
 
 try_command_on_node 0 $CTDB catdb "$TESTDB"
 
-n=$(echo "$out" | grep -c '^key.*= "key.*"' || true)
+n=$(grep -c '^key.*= "key.*"' "$outfile" || true)
 
 if [ $n -ne 3 ] ; then
     echo "BAD: expected 3 keys in..."
-    echo "$out"
+    cat "$outfile"
     exit 1
 else
     echo "GOOD: 3 records were inserted"
@@ -75,11 +75,11 @@ echo "$items" | try_command_on_node -i 0 $CTDB ptrans "$TESTDB"
 
 try_command_on_node 0 $CTDB catdb "$TESTDB"
 
-n=$(echo "$out" | grep -c '^key.*= "key.*"' || true)
+n=$(grep -c '^key.*= "key.*"' "$outfile" || true)
 
 if [ $n -ne 3 ] ; then
     echo "BAD: expected 3 keys in..."
-    echo "$out"
+    cat "$outfile"
     exit 1
 else
     echo "GOOD: 3 records found"
@@ -116,11 +116,11 @@ echo "$items" | try_command_on_node -i 0 $CTDB ptrans "$TESTDB"
 
 try_command_on_node 0 $CTDB catdb "$TESTDB"
 
-n=$(echo "$out" | grep -c '^key.*= "key.*"' || true)
+n=$(grep -c '^key.*= "key.*"' "$outfile" || true)
 
 if [ $n -ne 0 ] ; then
     echo "BAD: expected 0 keys in..."
-    echo "$out"
+    cat "$outfile"
     exit 1
 else
     echo "GOOD: 0 records found"
diff --git a/ctdb/tests/simple/56_replicated_transaction_recovery.sh b/ctdb/tests/simple/56_replicated_transaction_recovery.sh
index f09ed550c82..4d5c1297fa9 100755
--- a/ctdb/tests/simple/56_replicated_transaction_recovery.sh
+++ b/ctdb/tests/simple/56_replicated_transaction_recovery.sh
@@ -44,8 +44,8 @@ TESTDB="replicated_trans.tdb"
 try_command_on_node 0 "$CTDB attach $TESTDB replicated"
 try_command_on_node 0 "$CTDB wipedb $TESTDB"
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 if [ -z "$CTDB_TEST_TIMELIMIT" ] ; then
     CTDB_TEST_TIMELIMIT=30
diff --git a/ctdb/tests/simple/58_ctdb_restoredb.sh b/ctdb/tests/simple/58_ctdb_restoredb.sh
index eacbdfc5465..579233e0e80 100755
--- a/ctdb/tests/simple/58_ctdb_restoredb.sh
+++ b/ctdb/tests/simple/58_ctdb_restoredb.sh
@@ -36,10 +36,10 @@ set -e
 cluster_is_healthy
 
 try_command_on_node 0 $CTDB status
-generation=$(echo "$out" | sed -n -e 's/^Generation:\([0-9]*\)/\1/p')
+generation=$(sed -n -e 's/^Generation:\([0-9]*\)/\1/p' "$outfile")
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 # 2.
 test_db="restoredb_test.tdb"
@@ -105,7 +105,7 @@ fi
 wait_until_ready
 
 try_command_on_node 0 $CTDB status
-new_generation=$(echo "$out" | sed -n -e 's/^Generation:\([0-9]*\)/\1/p')
+new_generation=$(sed -n -e 's/^Generation:\([0-9]*\)/\1/p' "$outfile")
 
 echo "Old generation = $generation"
 echo "New generation = $new_generation"
diff --git a/ctdb/tests/simple/69_recovery_resurrect_deleted.sh b/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
index 2c8fc12edef..8126c49b83c 100755
--- a/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
+++ b/ctdb/tests/simple/69_recovery_resurrect_deleted.sh
@@ -20,9 +20,9 @@ testdb="rec_test.tdb"
 echo "Getting list of nodes..."
 try_command_on_node -v any "onnode -pq all ctdb pnn | grep '^[0-9][0-9]*$'"
 
-first=$(echo "$out" | sed -n -e '1p')
-second=$(echo "$out" | sed -n -e '2p')
-notfirst=$(echo "$out" | tail -n +2)
+first=$(sed -n -e '1p' "$outfile")
+second=$(sed -n -e '2p' "$outfile")
+notfirst=$(tail -n +2 "$outfile")
 
 echo "Create/wipe test database ${testdb}"
 try_command_on_node $first $CTDB attach "$testdb"
@@ -46,7 +46,7 @@ database_has_zero_records ()
 	local n
 	for n in $notfirst ; do
 		try_command_on_node $n $CTDB cattdb "$testdb"
-		if echo "$out" | grep -q '^key(' ; then
+		if grep -q '^key(' "$outfile" ; then
 			return 1
 		fi
 	done
@@ -74,7 +74,7 @@ wait_until_node_has_status $first notstopped
 echo "Get database contents"
 try_command_on_node -v $first $CTDB catdb "$testdb"
 
-if echo "$out" | grep -q '^key(' ; then
+if grep -q '^key(' "$outfile" ; then
 	echo "BAD: Deleted record has been resurrected"
 	exit 1
 fi
diff --git a/ctdb/tests/simple/70_recoverpdbbyseqnum.sh b/ctdb/tests/simple/70_recoverpdbbyseqnum.sh
index 1722288b562..84e0ec15c43 100755
--- a/ctdb/tests/simple/70_recoverpdbbyseqnum.sh
+++ b/ctdb/tests/simple/70_recoverpdbbyseqnum.sh
@@ -35,8 +35,8 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 add_record_per_node ()
 {
diff --git a/ctdb/tests/simple/71_ctdb_wipedb.sh b/ctdb/tests/simple/71_ctdb_wipedb.sh
index 6fae93b0a43..9305339d1e3 100755
--- a/ctdb/tests/simple/71_ctdb_wipedb.sh
+++ b/ctdb/tests/simple/71_ctdb_wipedb.sh
@@ -32,8 +32,8 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 # 2.
 test_db="persistent_test.tdb"
diff --git a/ctdb/tests/simple/72_update_record_persistent.sh b/ctdb/tests/simple/72_update_record_persistent.sh
index 4ab69d81b61..90b5ee06151 100755
--- a/ctdb/tests/simple/72_update_record_persistent.sh
+++ b/ctdb/tests/simple/72_update_record_persistent.sh
@@ -34,8 +34,8 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 test_db="persistent_test.tdb"
 
diff --git a/ctdb/tests/simple/75_readonly_records_basic.sh b/ctdb/tests/simple/75_readonly_records_basic.sh
index c5662f571c6..a83b4d31530 100755
--- a/ctdb/tests/simple/75_readonly_records_basic.sh
+++ b/ctdb/tests/simple/75_readonly_records_basic.sh
@@ -49,12 +49,12 @@ check_no_readonly ()
 {
     try_command_on_node all $CTDB cattdb $testdb
     local ro_flags="RO_HAVE_READONLY|RO_HAVE_DELEGATIONS"
-    local numreadonly=$(grep -c -E "$ro_flags" <<<"$out") || true
+    local numreadonly=$(grep -c -E "$ro_flags" "$outfile") || true
     if [ $numreadonly -eq 0 ] ; then
 	echo "GOOD: no read-only delegations"
     else
 	echo "BAD: there are read-only delegations"
-	echo "$out"
+	cat "$outfile"
 	exit 1
     fi
 }
@@ -72,36 +72,36 @@ check_readonly ()
     local count
 
     try_command_on_node $dmaster $CTDB cattdb $testdb
-    count=$(grep -c -E "RO_HAVE_DELEGATIONS" <<<"$out") || true
+    count=$(grep -c -E "RO_HAVE_DELEGATIONS" "$outfile") || true
     if [ $count -eq 1 ] ; then
 	echo "GOOD: dmaster ${dmaster} has read-only delegations"
     else
 	echo "BAD: dmaster ${dmaster} has no read-only delegations"
-	echo "$out"
+	cat "$outfile"
 	exit 1
     fi
-    count=$(grep -c -E "RO_HAVE_READONLY" <<<"$out") || true
+    count=$(grep -c -E "RO_HAVE_READONLY" "$outfile") || true
     if [ $count -ne 0 ] ; then
 	echo "BAD: dmaster ${dmaster} has a read-only copy"
-	echo "$out"
+	cat "$outfile"
 	exit 1
     fi
 
     local o
     for o in $others ; do
 	try_command_on_node $o $CTDB cattdb $testdb
-	count=$(grep -c -E "RO_HAVE_READONLY" <<<"$out") || true
+	count=$(grep -c -E "RO_HAVE_READONLY" "$outfile") || true
 	if [ $count -eq 1 ] ; then
 	    echo "GOOD: node ${o} has a read-only copy"
 	else
 	    echo "BAD: node ${o} has no read-only copy"
-	    echo "$out"
+	    cat "$outfile"
 	    exit 1
 	fi
-	count=$(grep -c -E "RO_HAVE_DELEGATIONS" <<<"$out") || true
+	count=$(grep -c -E "RO_HAVE_DELEGATIONS" "$outfile") || true
 	if [ $count -ne 0 ] ; then
 	    echo "BAD: other node ${o} has read-only delegations"
-	    echo "$out"
+	    cat "$outfile"
 	    exit 1
 	fi
     done
@@ -111,7 +111,7 @@ check_readonly ()
 
 echo "Get list of nodes..."
 try_command_on_node any $CTDB -X listnodes
-all_nodes=$(awk -F'|' '{print $2}' <<<"$out")
+all_nodes=$(awk -F'|' '{print $2}' "$outfile")
 
 ######################################################################
 
@@ -138,7 +138,7 @@ try_command_on_node all $CTDB setdbreadonly $testdb
 
 # Database should be tagged as READONLY
 try_command_on_node 0 $CTDB getdbmap
-db_details=$(awk -v db="$testdb" '$2 == foo="name:" db { print }' <<<"$out")
+db_details=$(awk -v db="$testdb" '$2 == foo="name:" db { print }' "$outfile")
 if grep -q "READONLY" <<<"$db_details" ; then
     echo "GOOD: read-only record support is enabled"
 else
diff --git a/ctdb/tests/simple/77_ctdb_db_recovery.sh b/ctdb/tests/simple/77_ctdb_db_recovery.sh
index b2703eedbc4..a8bc2d95ef6 100755
--- a/ctdb/tests/simple/77_ctdb_db_recovery.sh
+++ b/ctdb/tests/simple/77_ctdb_db_recovery.sh
@@ -93,7 +93,7 @@ try_command_on_node $recmaster $CTDB writekey $TESTDB test1 value1
 # Fetch a record   key=test1
 echo "read key(test1)"
 try_command_on_node $recmaster $CTDB readkey $TESTDB test1
-echo "$out"
+cat "$outfile"
 
 # Do a recovery
 echo "force recovery"
@@ -108,7 +108,7 @@ try_command_on_node $recmaster $CTDB writekey $TESTDB test1 value2
 # Fetch a record   key=test1
 echo "read key(test1)"
 try_command_on_node $recmaster $CTDB readkey $TESTDB test1
-echo "$out"
+cat "$outfile"
 
 # Do a recovery
 echo "force recovery"
@@ -119,7 +119,7 @@ wait_until_node_has_status $recmaster recovered
 # Verify record   key=test1
 echo "read key(test1)"
 try_command_on_node $recmaster $CTDB readkey $TESTDB test1
-echo "$out"
+cat "$outfile"
 if [ "$out" = "Data: size:6 ptr:[value2]" ]; then
 	echo "GOOD: Recovery did not corrupt database"
 else
diff --git a/ctdb/tests/simple/79_volatile_db_traverse.sh b/ctdb/tests/simple/79_volatile_db_traverse.sh
index b98be4d23f9..af7e962f579 100755
--- a/ctdb/tests/simple/79_volatile_db_traverse.sh
+++ b/ctdb/tests/simple/79_volatile_db_traverse.sh
@@ -75,7 +75,7 @@ try_command_on_node 1 $CTDB writekey "$TESTDB" "foo" "bar1"
 echo "do traverse on node 0"
 try_command_on_node -v 0 $CTDB catdb "$TESTDB"
 
-num=$(echo "$out" | sed -n -e 's|^Dumped \(.*\) records$|\1|p')
+num=$(sed -n -e 's|^Dumped \(.*\) records$|\1|p' "$outfile")
 if [ "$num" = 1 ] ; then
 	echo "OK: There was 1 record"
 else
@@ -83,7 +83,7 @@ else
 	exit 1
 fi
 
-if echo "$out" | grep -q "^data(4) = \"bar1\"\$" ; then
+if grep -q "^data(4) = \"bar1\"\$" "$outfile" ; then
 	echo "OK: Data from node 1 was returned"
 else
 	echo "BAD: Data from node 1 was not returned"
diff --git a/ctdb/tests/simple/80_ctdb_traverse.sh b/ctdb/tests/simple/80_ctdb_traverse.sh
index 544d8932cd9..d28f9c2814e 100755
--- a/ctdb/tests/simple/80_ctdb_traverse.sh
+++ b/ctdb/tests/simple/80_ctdb_traverse.sh
@@ -58,7 +58,7 @@ done
 echo "Start a traverse and collect records"
 try_command_on_node 0 $CTDB catdb $TESTDB
 
-num_read=$(echo "$out" | tail -n 1 | cut -d\  -f2)
+num_read=$(tail -n 1 "$outfile" | cut -d\  -f2)
 if [ $num_read -eq $num_records ]; then
 	echo "GOOD: All $num_records records retrieved"
 	status=0
diff --git a/ctdb/tests/simple/81_tunnel_ring.sh b/ctdb/tests/simple/81_tunnel_ring.sh
index 990039abfcb..c78c4209ea6 100755
--- a/ctdb/tests/simple/81_tunnel_ring.sh
+++ b/ctdb/tests/simple/81_tunnel_ring.sh
@@ -19,24 +19,22 @@ set -e
 
 cluster_is_healthy
 
-try_command_on_node 0 "$CTDB listnodes"
-num_nodes=$(echo "$out" | wc -l)
+try_command_on_node 0 "$CTDB listnodes | wc -l"
+num_nodes="$out"
 
 echo "Running tunnel_test on all $num_nodes nodes."
 try_command_on_node -v -p all $CTDB_TEST_WRAPPER $VALGRIND \
 	tunnel_test -t 30 -n $num_nodes
 
 # Get the last line of output.
-while read line ; do
-    prev=$line
-done <<<"$out"
+last=$(tail -n 1 "$outfile")
 
 pat='^(Waiting for cluster|pnn\[[[:digit:]]+\] [[:digit:]]+(\.[[:digit:]]+)? msgs/sec)$'
 sanity_check_output 1 "$pat"
 
-# $prev should look like this:
+# $last should look like this:
 #    pnn[2] count=85400
-stuff="${prev##pnn\[*\] }"
+stuff="${last##pnn\[*\] }"
 mps="${stuff% msgs/sec}"
 
 if [ ${mps%.*} -ge 10 ] ; then
diff --git a/ctdb/tests/simple/90_debug_hung_script.sh b/ctdb/tests/simple/90_debug_hung_script.sh
index 9e2072c98b6..e8cdefec734 100755
--- a/ctdb/tests/simple/90_debug_hung_script.sh
+++ b/ctdb/tests/simple/90_debug_hung_script.sh
@@ -54,11 +54,9 @@ wait_for_monitor_event $test_node
 
 echo "Waiting for debugging output to appear..."
 # Use test -s because the file is created above using mktemp
-wait_until 60 onnode $test_node test -s "$debug_output"
+wait_until 60 test -s "$debug_output"
 
 echo "Checking output of hung script debugging..."
-try_command_on_node -v $test_node cat "$debug_output"
-hung_script_output="$out"
 
 # Can we actually read kernel stacks
 if try_command_on_node $test_node "cat /proc/$$/stack >/dev/null 2>&1" ; then
@@ -72,7 +70,7 @@ fi
 
 while IFS="" read pattern ; do
     [ -n "$pattern" ] || continue
-    if grep -- "^${pattern}\$" <<<"$hung_script_output" >/dev/null ; then
+    if grep -q -- "^${pattern}\$" "$debug_output" ; then
 	printf 'GOOD: output contains "%s"\n' "$pattern"
     else
 	printf 'BAD: output does not contain "%s"\n' "$pattern"
-- 
2.20.1


From 7388944c7df18a51a4e9c97152fafbd07f928e3c Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Sat, 27 Apr 2019 14:54:09 +1000
Subject: [PATCH 4/6] ctdb-tests: Wait to allow database attach/detach to take
 effect

Sometimes the detach test fails:

  Check detaching single test database detach_test1.tdb
  BAD: database detach_test1.tdb is still attached
  Number of databases:4
  dbid:0x5ae995ee name:detach_test4.tdb path:tests/var/simple/node.0/db/volatile/detach_test4.tdb.0
  dbid:0xd84cc13c name:detach_test3.tdb path:tests/var/simple/node.0/db/volatile/detach_test3.tdb.0
  dbid:0x8e8e8cef name:detach_test2.tdb path:tests/var/simple/node.0/db/volatile/detach_test2.tdb.0
  dbid:0xc62491f4 name:detach_test1.tdb path:tests/var/simple/node.0/db/volatile/detach_test1.tdb.0
  Number of databases:3
  dbid:0x5ae995ee name:detach_test4.tdb path:tests/var/simple/node.1/db/volatile/detach_test4.tdb.1
  dbid:0xd84cc13c name:detach_test3.tdb path:tests/var/simple/node.1/db/volatile/detach_test3.tdb.1
  dbid:0x8e8e8cef name:detach_test2.tdb path:tests/var/simple/node.1/db/volatile/detach_test2.tdb.1
  Number of databases:4
  dbid:0x5ae995ee name:detach_test4.tdb path:tests/var/simple/node.2/db/volatile/detach_test4.tdb.2
  dbid:0xd84cc13c name:detach_test3.tdb path:tests/var/simple/node.2/db/volatile/detach_test3.tdb.2
  dbid:0x8e8e8cef name:detach_test2.tdb path:tests/var/simple/node.2/db/volatile/detach_test2.tdb.2
  dbid:0xc62491f4 name:detach_test1.tdb path:tests/var/simple/node.2/db/volatile/detach_test1.tdb.2
  *** TEST COMPLETED (RC=1) AT 2019-04-27 03:35:40, CLEANING UP...

When issued from a client, the detach control re-broadcasts itself
asynchronously to all nodes and then returns success.  The controls to
some nodes to do the actual detach may still be in flight when success
is returned to the client.  Therefore, the test should wait for a few
seconds to allow the asynchronous controls to complete.

The same is true for the attach control, so workaround the problem in
the attach test too.

An alternative is to make the attach and detach controls synchronous
by avoiding the broadcast and waiting for the results of the
individual controls sent to the nodes.  However, a simple
implementation would involve adding new nested event loops.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/simple/21_ctdb_attach.sh | 44 ++++++++++++++--------
 ctdb/tests/simple/27_ctdb_detach.sh | 58 +++++++++++++++++++----------
 2 files changed, 66 insertions(+), 36 deletions(-)

diff --git a/ctdb/tests/simple/21_ctdb_attach.sh b/ctdb/tests/simple/21_ctdb_attach.sh
index 7965ced6052..b9ae9481d91 100755
--- a/ctdb/tests/simple/21_ctdb_attach.sh
+++ b/ctdb/tests/simple/21_ctdb_attach.sh
@@ -42,27 +42,39 @@ lastnode=$(( numnodes - 1 ))
 
 ######################################################################
 
-# Confirm that the database is attached
+# Confirm that the database is attached with appropriate flags
+check_db_once ()
+{
+	local pnn="$1"
+	local db="$2"
+
+	try_command_on_node "$pnn" $CTDB getdbmap
+	if grep -qF "name:${db}" "$outfile" >/dev/null ; then
+		return 0
+	else
+		return 1
+	fi
+}
+
 check_db ()
 {
-    pnn="$1"
-    db="$2"
-    flag="$3"
-    try_command_on_node $pnn "$CTDB getdbmap | grep $db"
-    if [ -z "$out" ] ; then
-	echo "BAD: database $db is not attached on node $node"
-	echo "$out"
-	exit 1
-    else
-	local flags=$(awk '{print $4}' "$outfile") || true
+	local pnn="$1"
+	local db="$2"
+	local flag="$3"
+
+	local flags
+
+	echo "Waiting until database ${db} is attached on node ${pnn}"
+	wait_until 10 check_db_once "$pnn" "$db"
+
+	flags=$(awk -v db="$db" '$2 == "name:" db {print $4}' "$outfile")
 	if [ "$flags" = "$flag" ]; then
-	    echo "GOOD: database $db is attached on node $node with flag $flag"
+		echo "GOOD: db ${db} attached on node ${pnn} with flag $flag"
 	else
-	    echo "BAD: database $db is attached on node $node with wrong flag"
-	    echo "$out"
-	    exit 1
+		echo "BAD: db ${db} attached on node ${pnn} with wrong flag"
+		cat "$outfile"
+		exit 1
 	fi
-    fi
 }
 
 ######################################################################
diff --git a/ctdb/tests/simple/27_ctdb_detach.sh b/ctdb/tests/simple/27_ctdb_detach.sh
index f7f7a7e8c40..5d1e12328c6 100755
--- a/ctdb/tests/simple/27_ctdb_detach.sh
+++ b/ctdb/tests/simple/27_ctdb_detach.sh
@@ -38,33 +38,51 @@ numnodes="$out"
 ######################################################################
 
 # Confirm that the database is attached
+check_db_once ()
+{
+	local db="$1"
+
+	local num_db
+
+	try_command_on_node all "$CTDB getdbmap"
+	num_db=$(grep -cF "name:${db}" "$outfile") || true
+	if [ "$num_db" -eq "$numnodes" ]; then
+		return 0
+	else
+		return 1
+	fi
+}
+
 check_db ()
 {
-    db="$1"
-    try_command_on_node all $CTDB getdbmap
-    local num_db=$(grep -cF "$db" "$outfile") || true
-    if [ $num_db -eq $numnodes ]; then
-	echo "GOOD: database $db is attached on all nodes"
-    else
-	echo "BAD: database $db is not attached on all nodes"
-	cat "$outfile"
-	exit 1
-    fi
+	local db="$1"
+
+	echo "Waiting until database ${db} is attached on all nodes"
+	wait_until 10 check_db_once "$db"
 }
 
 # Confirm that no nodes have databases attached
+check_no_db_once ()
+{
+	local db="$1"
+
+	local num_db
+
+	try_command_on_node all "$CTDB getdbmap"
+	num_db=$(grep -cF "name:${db}" "$outfile") || true
+	if [ "$num_db" -eq 0 ]; then
+		return 0
+	else
+		return 1
+	fi
+}
+
 check_no_db ()
 {
-    db="$1"
-    try_command_on_node all $CTDB getdbmap
-    local num_db=$(grep -cF "$db" "$outfile") || true
-    if [ $num_db -eq 0 ]; then
-	echo "GOOD: database $db is not attached any more"
-    else
-	echo "BAD: database $db is still attached"
-	cat "$outfile"
-	exit 1
-    fi
+	local db="$1"
+
+	echo "Waiting until database ${db} is detached on all nodes"
+	wait_until 10 check_no_db_once "$db"
 }
 
 ######################################################################
-- 
2.20.1


From c8f065a1f368c61a21c6a082bbca5bfa9adca4f8 Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 1 May 2019 15:10:28 +1000
Subject: [PATCH 5/6] ctdb-tests: Fix usage message

Since commit 0e9ead8f28fced3ebfa888786a1dc5bb59e734a3 daemons have
been shut down after each test, so this option no longer has anything
to do with killing daemons.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/tests/run_tests.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index f5be01a8d66..a9c68464883 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -7,7 +7,7 @@ Usage: $0 [OPTIONS] [TESTS]
 Options:
   -A		Use "cat -A" to print test output (only some tests)
   -c		Run integration tests on a cluster
-  -C		Clean up - kill daemons and remove TEST_VAR_DIR when done
+  -C		Remove TEST_VAR_DIR when done
   -d		Print descriptions of tests instead of filenames (dodgy!)
   -D		Show diff between failed/expected test output (some tests only)
   -e		Exit on the first test failure
-- 
2.20.1


From aa46428ad7d948a514df7b54ec26bec4797bba7a Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Wed, 1 May 2019 15:17:14 +1000
Subject: [PATCH 6/6] ctdb-tests: Don't clean up test var directory in autotest
 target

If the directory is always cleaned up then it is not possible to look
at daemon logs to debug test failures.

This target is only really used by autobuild.py, which (optionally)
cleans up the parent directory anyway.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13924

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/wscript | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ctdb/wscript b/ctdb/wscript
index 4f2fcbf69c9..eccc5e76f48 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -1135,7 +1135,7 @@ def test(ctx):
 
 def autotest(ctx):
     env = samba_utils.LOAD_ENVIRONMENT()
-    cmd = 'tests/run_tests.sh -e -S %s -C' % env.SOCKET_WRAPPER_SO_PATH
+    cmd = 'tests/run_tests.sh -e -S %s' % env.SOCKET_WRAPPER_SO_PATH
     ret = samba_utils.RUN_COMMAND(cmd)
     if ret != 0:
         print('autotest exited with exit status %d' % ret)
-- 
2.20.1


--MP_/JykkuNFDQ++yUGM.85/r/nm--

