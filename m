Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58811769
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 12:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kJSLxaxPa41rOifKX7AaPWsVeWq3iWCoOD0qciEeLdg=; b=301a6MwsmHToEyvyLv1n2zBLi8
	G4QXLO9rUKZdOw0/d3wiG2A5yYlx4tmH+FFedlIUc3DvQkKQEuZpOVVUs2zWR79KY3Cx8RIt03pwj
	xpXpcP9ak4f6SA4B+/P8xr19Fgk9gg5O+kvOQc8m3UtLYRM7TbV+AWfb31Sb/ggbf7mOcW63/3btG
	FJBof8uzoVlSvaeQuZyYW7729GJfR4UScy1vtRTGCFrvKGawO1NbyhEcb+mKPB0HN1B4Mijngc/qp
	A0poGYFg9SJBR9z3wstZFL+9QbXz9Mmpddx7UdkKzrHsdXhGkhYB90Xog+1ne2nJpvcIxfuVNosxj
	EOhUO5BQ==;
Received: from localhost ([::1]:46854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM9As-0020bI-2L; Thu, 02 May 2019 10:42:46 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:47527 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hM9Al-0020a0-Qm
 for samba-technical@lists.samba.org; Thu, 02 May 2019 10:42:43 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vsKP59PZz9s9y;
 Thu,  2 May 2019 20:42:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1556793753; bh=fthQdqdt8hry1T/nVJuI8gH8pVAqoSEKlQm4b8grZjc=;
 h=Date:From:To:Subject:From;
 b=CTu4hvVBh3QeZuJdFss8lztjcrp5nkRMUsy/duLbYj36s4trGr/9OVNa/ALKZL5Gi
 o7VeFUHcqLiKnQMahY2lJLQfhsv3qh8pUy38rjpXB3N7D1aQ7Uzrik0DIwRjet1QN7
 j8a6wPqsBYka3tUJYqpeXrVCWufYCA/6n/7ttgpQMBUR+UfsFh0usWUp7kePTh8rYJ
 y4d9mDL8FgV379HaWh9RwIlcF+4tJfWbXhkc4HpmZypkJhsw2IYP/ULD0MMM+3N5zD
 e2WjQ1ayMlKXZhxNcsyxXk116+yNb4pdzDdoDw9+P86lH9XSBnpUbZI/SvHwxXpGWM
 qkIPrXxxpkt+w==
Date: Thu, 2 May 2019 20:42:31 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-scripts: Drop script configuration variable
 CTDB_MONITOR_SWAP_USAGE
Message-ID: <20190502204231.60f35912@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/uYY6qq2J0mKoTAeAaZ71Mtb"
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

--MP_/uYY6qq2J0mKoTAeAaZ71Mtb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

CTDB's system memory monitoring in 05.system.script monitors both main
memory and swap.  Monitoring of swap is based on the idea that swap
space stacks on top of main memory, so that when a system starts
filling swap space then this is supposed to be a good sign that the
system is running out of memory.  Additionally, performance on a Linux
system tends to be destroyed by the I/O associated with a lot of
swapping to spinning disks.

However, some platforms default to creating only 4GB of swap space
even when there is 128GB of main memory.  With such a small swap to
main memory ratio, memory pressure can force swap to be nearly full
even when a significant amount of main memory is still available and
the system is performing well.  This suggests that checking swap
utilisation might be less than useful in many circumstances.

So, remove the separate swap space checking and change the memory
check to cover the total of main memory and swap space.

Test function set_mem_usage() still takes an argument for each of main
memory and swap space utilisation.  For simplicity, the same number is
now passed twice to make the intended results comprehensible.  This
could be changed later.

A couple of tests are cleaned up to no longer use hard-coded
/proc/meminfo and ps output.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125

Please review and maybe push...

peace & happiness,
martin

--MP_/uYY6qq2J0mKoTAeAaZ71Mtb
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-ctdb-scripts-Drop-script-configuration-variable-CTDB.patch

From 5a013f9e7f0dc04846c1a9dd48219ea8ad3eb7da Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 29 Mar 2019 11:19:55 +1100
Subject: [PATCH] ctdb-scripts: Drop script configuration variable
 CTDB_MONITOR_SWAP_USAGE

CTDB's system memory monitoring in 05.system.script monitors both main
memory and swap.  Monitoring of swap is based on the idea that swap
space stacks on top of main memory, so that when a system starts
filling swap space then this is supposed to be a good sign that the
system is running out of memory.  Additionally, performance on a Linux
system tends to be destroyed by the I/O associated with a lot of
swapping to spinning disks.

However, some platforms default to creating only 4GB of swap space
even when there is 128GB of main memory.  With such a small swap to
main memory ratio, memory pressure can force swap to be nearly full
even when a significant amount of main memory is still available and
the system is performing well.  This suggests that checking swap
utilisation might be less than useful in many circumstances.

So, remove the separate swap space checking and change the memory
check to cover the total of main memory and swap space.

Test function set_mem_usage() still takes an argument for each of main
memory and swap space utilisation.  For simplicity, the same number is
now passed twice to make the intended results comprehensible.  This
could be changed later.

A couple of tests are cleaned up to no longer use hard-coded
/proc/meminfo and ps output.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/config/events/legacy/05.system.script    | 17 ++--
 ctdb/doc/ctdb-script.options.5.xml            | 21 -----
 ctdb/doc/examples/config_migrate.sh           |  2 +-
 .../eventscripts/05.system.monitor.011.sh     |  3 +-
 .../eventscripts/05.system.monitor.012.sh     |  3 +-
 .../eventscripts/05.system.monitor.013.sh     | 21 -----
 .../eventscripts/05.system.monitor.014.sh     |  4 +-
 .../eventscripts/05.system.monitor.015.sh     |  4 +-
 .../eventscripts/05.system.monitor.016.sh     | 19 -----
 .../eventscripts/05.system.monitor.017.sh     | 30 +------
 .../eventscripts/05.system.monitor.018.sh     | 81 +++++--------------
 11 files changed, 35 insertions(+), 170 deletions(-)
 delete mode 100755 ctdb/tests/eventscripts/05.system.monitor.013.sh
 delete mode 100755 ctdb/tests/eventscripts/05.system.monitor.016.sh

diff --git a/ctdb/config/events/legacy/05.system.script b/ctdb/config/events/legacy/05.system.script
index e2ffeac715a..08e401a9e73 100755
--- a/ctdb/config/events/legacy/05.system.script
+++ b/ctdb/config/events/legacy/05.system.script
@@ -132,9 +132,6 @@ monitor_memory_usage ()
     if [ -z "$CTDB_MONITOR_MEMORY_USAGE" ] ; then
 	CTDB_MONITOR_MEMORY_USAGE=80
     fi
-    if [ -z "$CTDB_MONITOR_SWAP_USAGE" ] ; then
-	CTDB_MONITOR_SWAP_USAGE=25
-    fi
 
     _meminfo=$(get_proc "meminfo")
     # Intentional word splitting here
@@ -149,21 +146,19 @@ $1 == "SwapFree:"     { swapfree  = $2 }
 $1 == "SwapTotal:"    { swaptotal = $2 }
 END {
     if (memavail != 0) { memfree = memavail ; }
-    if (memtotal != 0) { print int((memtotal - memfree) / memtotal * 100) ; } else { print 0 ; }
-    if (swaptotal != 0) { print int((swaptotal - swapfree) / swaptotal * 100) ; } else { print 0 ; }
+    if (memtotal + swaptotal != 0) {
+	usedtotal = memtotal - memfree + swaptotal - swapfree
+	print int(usedtotal / (memtotal + swaptotal) * 100)
+    } else {
+	print 0
+    }
 }')
     _mem_usage="$1"
-    _swap_usage="$2"
 
     check_thresholds "System memory" \
 		     "$CTDB_MONITOR_MEMORY_USAGE" \
 		     "$_mem_usage" \
 		     dump_memory_info
-
-    check_thresholds "System swap" \
-		     "$CTDB_MONITOR_SWAP_USAGE" \
-		     "$_swap_usage" \
-		     dump_memory_info
 }
 
 
diff --git a/ctdb/doc/ctdb-script.options.5.xml b/ctdb/doc/ctdb-script.options.5.xml
index 9d545b5cc0d..6b2efb27ac2 100644
--- a/ctdb/doc/ctdb-script.options.5.xml
+++ b/ctdb/doc/ctdb-script.options.5.xml
@@ -964,27 +964,6 @@ CTDB_PER_IP_ROUTING_TABLE_ID_HIGH=9000
 	  </listitem>
 	</varlistentry>
 
-	<varlistentry>
-	  <term>
-	    CTDB_MONITOR_SWAP_USAGE=<parameter>SWAP-LIMITS</parameter>
-	  </term>
-	  <listitem>
-	    <para>
-	      SWAP-LIMITS takes the form
-	      <parameter>WARN_LIMIT</parameter><optional>:<parameter>UNHEALTHY_LIMIT</parameter></optional>
-	       indicating that warnings should be logged if
-	      swap usage reaches WARN_LIMIT%.  If usage reaches
-	      UNHEALTHY_LIMIT then the node should be flagged
-	      unhealthy.  Either WARN_LIMIT or UNHEALTHY_LIMIT may be
-	      left blank, meaning that check will be omitted.
-	    </para>
-	    <para>
-	      Default is 25, so warnings will be logged when swap
-	      usage reaches 25%.
-	    </para>
-	  </listitem>
-	</varlistentry>
-
       </variablelist>
     </refsect2>
 
diff --git a/ctdb/doc/examples/config_migrate.sh b/ctdb/doc/examples/config_migrate.sh
index 8479aeb39f3..e0d01e77057 100755
--- a/ctdb/doc/examples/config_migrate.sh
+++ b/ctdb/doc/examples/config_migrate.sh
@@ -209,6 +209,7 @@ CTDB_NOTIFY_SCRIPT
 CTDB_PUBLIC_INTERFACE
 CTDB_MAX_PERSISTENT_CHECK_ERRORS
 CTDB_SHUTDOWN_TIMEOUT
+CTDB_MONITOR_SWAP_USAGE
 EOF
 }
 
@@ -262,7 +263,6 @@ CTDB_MAX_CORRUPT_DB_BACKUPS
 # 05.system
 CTDB_MONITOR_FILESYSTEM_USAGE
 CTDB_MONITOR_MEMORY_USAGE
-CTDB_MONITOR_SWAP_USAGE
 # debug_hung_scripts.sh
 CTDB_DEBUG_HUNG_SCRIPT_STACKPAT
 EOF
diff --git a/ctdb/tests/eventscripts/05.system.monitor.011.sh b/ctdb/tests/eventscripts/05.system.monitor.011.sh
index a7d2e99c2b7..6cd1dabbb37 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.011.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.011.sh
@@ -2,13 +2,12 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Memory check, bad situation, default checks enabled"
+define_test "Memory check (default), warning situation"
 
 setup
 
 set_mem_usage 100 100
 ok <<EOF
 WARNING: System memory utilization 100% >= threshold 80%
-WARNING: System swap utilization 100% >= threshold 25%
 EOF
 simple_test
diff --git a/ctdb/tests/eventscripts/05.system.monitor.012.sh b/ctdb/tests/eventscripts/05.system.monitor.012.sh
index bc517081e42..9e840564f49 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.012.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.012.sh
@@ -2,13 +2,12 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Memory check, good situation, all memory checks enabled"
+define_test "Memory check (custom, both), good situation"
 
 setup
 
 setup_script_options <<EOF
 CTDB_MONITOR_MEMORY_USAGE="80:90"
-CTDB_MONITOR_SWAP_USAGE="1:50"
 EOF
 
 ok_null
diff --git a/ctdb/tests/eventscripts/05.system.monitor.013.sh b/ctdb/tests/eventscripts/05.system.monitor.013.sh
deleted file mode 100755
index f4ea7ded6d0..00000000000
--- a/ctdb/tests/eventscripts/05.system.monitor.013.sh
+++ /dev/null
@@ -1,21 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "Memory check, bad situation, custom swap critical"
-
-setup
-
-setup_script_options <<EOF
-CTDB_MONITOR_SWAP_USAGE=":50"
-EOF
-
-set_mem_usage 100 90
-required_result 1 <<EOF
-WARNING: System memory utilization 100% >= threshold 80%
-ERROR: System swap utilization 90% >= threshold 50%
-$FAKE_PROC_MEMINFO
-$(ps foobar)
-EOF
-
-simple_test
diff --git a/ctdb/tests/eventscripts/05.system.monitor.014.sh b/ctdb/tests/eventscripts/05.system.monitor.014.sh
index 1b6d2155272..9e2b21c9822 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.014.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.014.sh
@@ -2,7 +2,7 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Memory check, bad memory situation, custom memory warning"
+define_test "Memory check (custom, warning only), warning situation"
 
 setup
 
@@ -10,7 +10,7 @@ setup_script_options <<EOF
 CTDB_MONITOR_MEMORY_USAGE="85:"
 EOF
 
-set_mem_usage 90 10
+set_mem_usage 90 90
 ok <<EOF
 WARNING: System memory utilization 90% >= threshold 85%
 EOF
diff --git a/ctdb/tests/eventscripts/05.system.monitor.015.sh b/ctdb/tests/eventscripts/05.system.monitor.015.sh
index 3f1fe9bfc46..0091c429ac1 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.015.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.015.sh
@@ -2,7 +2,7 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Memory check, bad situation, custom memory critical"
+define_test "Memory check (custom, error only), error situation"
 
 setup
 
@@ -10,7 +10,7 @@ setup_script_options <<EOF
 CTDB_MONITOR_MEMORY_USAGE=":85"
 EOF
 
-set_mem_usage 90 0
+set_mem_usage 90 90
 required_result 1 <<EOF
 ERROR: System memory utilization 90% >= threshold 85%
 $FAKE_PROC_MEMINFO
diff --git a/ctdb/tests/eventscripts/05.system.monitor.016.sh b/ctdb/tests/eventscripts/05.system.monitor.016.sh
deleted file mode 100755
index 459b8ba76b4..00000000000
--- a/ctdb/tests/eventscripts/05.system.monitor.016.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-
-. "${TEST_SCRIPTS_DIR}/unit.sh"
-
-define_test "Memory check, bad situation, both memory checks, causes warning"
-
-setup
-
-setup_script_options <<EOF
-CTDB_MONITOR_MEMORY_USAGE="80:90"
-CTDB_MONITOR_SWAP_USAGE=""
-EOF
-
-set_mem_usage 87 0
-ok <<EOF
-WARNING: System memory utilization 87% >= threshold 80%
-EOF
-
-simple_test
diff --git a/ctdb/tests/eventscripts/05.system.monitor.017.sh b/ctdb/tests/eventscripts/05.system.monitor.017.sh
index 7f7480aed93..8eef4afc85d 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.017.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.017.sh
@@ -2,7 +2,7 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Memory check, bad situation, both custom memory checks, causes unhealthy"
+define_test "Memory check (custom, both), error situation"
 
 setup
 
@@ -10,33 +10,11 @@ setup_script_options <<EOF
 CTDB_MONITOR_MEMORY_USAGE="70:80"
 EOF
 
-set_mem_usage 87 0
+set_mem_usage 87 87
 required_result 1 <<EOF
 ERROR: System memory utilization 87% >= threshold 80%
-MemTotal:        3940712 kB
-MemFree:          225268 kB
-Buffers:          146120 kB
-Cached:          140904 kB
-SwapCached:        56016 kB
-Active:          2422104 kB
-Inactive:        1019928 kB
-Active(anon):    1917580 kB
-Inactive(anon):   523080 kB
-Active(file):     504524 kB
-Inactive(file):   496848 kB
-Unevictable:        4844 kB
-Mlocked:            4844 kB
-SwapTotal:       5857276 kB
-SwapFree:        5857276 kB
-...
-USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
-root         2  0.0  0.0      0     0 ?        S    Aug28   0:00 [kthreadd]
-root         3  0.0  0.0      0     0 ?        S    Aug28   0:43  \_ [ksoftirqd/0]
-...
-root         1  0.0  0.0   2976   624 ?        Ss   Aug28   0:07 init [2]
-root       495  0.0  0.0   3888  1640 ?        Ss   Aug28   0:00 udevd --daemon
-...
-[MORE FAKE ps OUTPUT]
+$FAKE_PROC_MEMINFO
+$(ps foobar)
 EOF
 
 simple_test
diff --git a/ctdb/tests/eventscripts/05.system.monitor.018.sh b/ctdb/tests/eventscripts/05.system.monitor.018.sh
index 37578d8bbed..cd9305f8826 100755
--- a/ctdb/tests/eventscripts/05.system.monitor.018.sh
+++ b/ctdb/tests/eventscripts/05.system.monitor.018.sh
@@ -2,126 +2,81 @@
 
 . "${TEST_SCRIPTS_DIR}/unit.sh"
 
-define_test "Check throttling of warnings"
+define_test "Memory check (custom, both), check throttling of warnings"
 
 setup
 
 setup_script_options <<EOF
 CTDB_MONITOR_MEMORY_USAGE="70:80"
-CTDB_MONITOR_SWAP_USAGE=""
 EOF
 
 # Below threshold, nothing logged
-set_mem_usage 67 0
+set_mem_usage 67 67
 ok_null
 simple_test
 
-set_mem_usage 71 0
+set_mem_usage 71 71
 ok "WARNING: System memory utilization 71% >= threshold 70%"
 simple_test
 
 # 2nd time at same level, nothing logged
-set_mem_usage 71 0
+set_mem_usage 71 71
 ok_null
 simple_test
 
-set_mem_usage 73 0
+set_mem_usage 73 73
 ok "WARNING: System memory utilization 73% >= threshold 70%"
 simple_test
 
 # 2nd time at same level, nothing logged
-set_mem_usage 73 0
+set_mem_usage 73 73
 ok_null
 simple_test
 
-set_mem_usage 79 0
+set_mem_usage 79 79
 ok "WARNING: System memory utilization 79% >= threshold 70%"
 simple_test
 
-set_mem_usage 80 0
+set_mem_usage 80 80
 required_result 1 <<EOF
 ERROR: System memory utilization 80% >= threshold 80%
-MemTotal:        3940712 kB
-MemFree:          225268 kB
-Buffers:          146120 kB
-Cached:          416754 kB
-SwapCached:        56016 kB
-Active:          2422104 kB
-Inactive:        1019928 kB
-Active(anon):    1917580 kB
-Inactive(anon):   523080 kB
-Active(file):     504524 kB
-Inactive(file):   496848 kB
-Unevictable:        4844 kB
-Mlocked:            4844 kB
-SwapTotal:       5857276 kB
-SwapFree:        5857276 kB
-...
-USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
-root         2  0.0  0.0      0     0 ?        S    Aug28   0:00 [kthreadd]
-root         3  0.0  0.0      0     0 ?        S    Aug28   0:43  \_ [ksoftirqd/0]
-...
-root         1  0.0  0.0   2976   624 ?        Ss   Aug28   0:07 init [2]
-root       495  0.0  0.0   3888  1640 ?        Ss   Aug28   0:00 udevd --daemon
-...
-[MORE FAKE ps OUTPUT]
+$FAKE_PROC_MEMINFO
+$(ps foobar)
 EOF
 simple_test
 
 # Fall back into warning at same level as last warning... should log
-set_mem_usage 79 0
+set_mem_usage 79 79
 ok "WARNING: System memory utilization 79% >= threshold 70%"
 simple_test
 
 # Below threshold, notice
-set_mem_usage 69 0
+set_mem_usage 69 69
 ok <<EOF
 NOTICE: System memory utilization 69% < threshold 70%
 EOF
 simple_test
 
 # Further reduction, nothing logged
-set_mem_usage 68 0
+set_mem_usage 68 68
 ok_null
 simple_test
 
 # Back up into warning at same level as last warning... should log
-set_mem_usage 79 0
+set_mem_usage 79 79
 ok "WARNING: System memory utilization 79% >= threshold 70%"
 simple_test
 
 # Back up above critical threshold... unhealthy
-set_mem_usage 81 0
+set_mem_usage 81 81
 required_result 1 <<EOF
 ERROR: System memory utilization 81% >= threshold 80%
-MemTotal:        3940712 kB
-MemFree:          225268 kB
-Buffers:          146120 kB
-Cached:          377347 kB
-SwapCached:        56016 kB
-Active:          2422104 kB
-Inactive:        1019928 kB
-Active(anon):    1917580 kB
-Inactive(anon):   523080 kB
-Active(file):     504524 kB
-Inactive(file):   496848 kB
-Unevictable:        4844 kB
-Mlocked:            4844 kB
-SwapTotal:       5857276 kB
-SwapFree:        5857276 kB
-...
-USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
-root         2  0.0  0.0      0     0 ?        S    Aug28   0:00 [kthreadd]
-root         3  0.0  0.0      0     0 ?        S    Aug28   0:43  \_ [ksoftirqd/0]
-...
-root         1  0.0  0.0   2976   624 ?        Ss   Aug28   0:07 init [2]
-root       495  0.0  0.0   3888  1640 ?        Ss   Aug28   0:00 udevd --daemon
-...
-[MORE FAKE ps OUTPUT]
+$FAKE_PROC_MEMINFO
+$(ps foobar)
 EOF
 simple_test
 
 # Straight back down to a good level... notice
-set_mem_usage 65 0
+set_mem_usage 65 65
 ok "NOTICE: System memory utilization 65% < threshold 70%"
 simple_test
-- 
2.20.1


--MP_/uYY6qq2J0mKoTAeAaZ71Mtb--

