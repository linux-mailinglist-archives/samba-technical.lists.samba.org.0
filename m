Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5E42404
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 13:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=LHIjX5Lq6kQ0hTykqLRYSkKUeyt4A0Qw3J1BSEM51Rg=; b=5OxFlzDdgk/wy2iiIjfN7Aq159
	62NMoG4sWI2OvteIjWKMd77UxRI6KltqfPhcEyhn8QTn2+ZiwgCY23tvc38XNfaqmHDkluip4iYaw
	WmKapcd9Ou/GsqEm+X8e0NOnILmgusXQF5NYE1r+N5gF5h62xEm9neguuwFSbJ7gwaYNgNrxluxPn
	Bh5o8OjwbVxvAY3+HCVck64YnK8vNUIw6JNrztW6kK14z5A9e3X9yBw203Y1QdI72aOsqoEBxNw59
	q5i8rRWH8qF3+LGFWQqvI9sbi1/+NhpFw33XOJLL4ey8e6tQ0JGZmU7BgAwOarzYhmWNUQjgXHhFo
	s7k5hnhQ==;
Received: from localhost ([::1]:56114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb1Te-0018tH-8A; Wed, 12 Jun 2019 11:31:38 +0000
Received: from mx1.redhat.com ([209.132.183.28]:45790) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hb1TZ-0018tA-CV
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 11:31:35 +0000
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 77FCE30872D7
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 11:31:28 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1E2960BF1
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 11:31:27 +0000 (UTC)
Date: Wed, 12 Jun 2019 13:31:25 +0200
To: samba-technical@lists.samba.org
Subject: [PATCH] wafsamba: Use native waf timer
Message-ID: <20190612113125.GB8215@10.4.128.1>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 12 Jun 2019 11:31:28 +0000 (UTC)
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
From: Lukas Slebodnik via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lukas Slebodnik <lslebodn@fedoraproject.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ehlo,

it is another blocker to build samba with python 3.8

Traceback (most recent call last):
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Scripting.py", line 158, in waf_entry_point
    run_commands()
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Scripting.py", line 251, in run_commands
    ctx = run_command(cmd_name)
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Scripting.py", line 235, in run_command
    ctx.execute()
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Scripting.py", line 573, in execute
    return execute_method(self)
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Build.py", line 231, in execute
    self.execute_build()
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Build.py", line 245, in execute_build
    self.pre_build()
  File "/builddir/build/BUILD/talloc-2.1.16/third_party/waf/waflib/Build.py", line 542, in pre_build
    m(self)
  File "./buildtools/wafsamba/samba_deps.py", line 1106, in check_project_rules
    tstart = time.clock()
AttributeError: module 'time' has no attribute 'clock'
make: *** [Makefile:8: all] Error 2

PTAL

LS

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-wafsamba-Use-native-waf-timer.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 8970020e20689db9a93bfcc33e71c312d1488309 Mon Sep 17 00:00:00 2001
=46rom: Lukas Slebodnik <lslebodn@fedoraproject.org>
Date: Wed, 12 Jun 2019 12:27:04 +0200
Subject: [PATCH] wafsamba: Use native waf timer

  __main__:1: DeprecationWarning: time.clock has been deprecated in Python =
3.3
  and will be removed from Python 3.8: use time.perf_counter
  or time.process_time instead

Signed-off-by: Lukas Slebodnik <lslebodn@fedoraproject.org>
---
 buildtools/wafsamba/samba_deps.py | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/buildtools/wafsamba/samba_deps.py b/buildtools/wafsamba/samba_=
deps.py
index f8c38809bd2296288374cd66788cdd8fdb2c7538..03c37079a8c435628e058a6d00c=
0f942a06f3bd9 100644
--- a/buildtools/wafsamba/samba_deps.py
+++ b/buildtools/wafsamba/samba_deps.py
@@ -1,6 +1,6 @@
 # Samba automatic dependency handling and project rules
=20
-import os, sys, re, time
+import os, sys, re
=20
 from waflib import Build, Options, Logs, Utils, Errors
 from waflib.Logs import debug
@@ -1102,8 +1102,7 @@ def check_project_rules(bld):
     if not force_project_rules and load_samba_deps(bld, tgt_list):
         return
=20
-    global tstart
-    tstart =3D time.clock()
+    timer =3D Utils.Timer()
=20
     bld.new_rules =3D True
     Logs.info("Checking project rules ...")
@@ -1112,26 +1111,26 @@ def check_project_rules(bld):
=20
     expand_subsystem_deps(bld)
=20
-    debug("deps: expand_subsystem_deps: %f" % (time.clock() - tstart))
+    debug("deps: expand_subsystem_deps: %s" % str(timer))
=20
     replace_grouping_libraries(bld, tgt_list)
=20
-    debug("deps: replace_grouping_libraries: %f" % (time.clock() - tstart))
+    debug("deps: replace_grouping_libraries: %s" % str(timer))
=20
     build_direct_deps(bld, tgt_list)
=20
-    debug("deps: build_direct_deps: %f" % (time.clock() - tstart))
+    debug("deps: build_direct_deps: %s" % str(timer))
=20
     break_dependency_loops(bld, tgt_list)
=20
-    debug("deps: break_dependency_loops: %f" % (time.clock() - tstart))
+    debug("deps: break_dependency_loops: %s" % str(timer))
=20
     if Options.options.SHOWDEPS:
             show_dependencies(bld, Options.options.SHOWDEPS, set())
=20
     calculate_final_deps(bld, tgt_list, loops)
=20
-    debug("deps: calculate_final_deps: %f" % (time.clock() - tstart))
+    debug("deps: calculate_final_deps: %s" % str(timer))
=20
     if Options.options.SHOW_DUPLICATES:
             show_object_duplicates(bld, tgt_list)
@@ -1140,7 +1139,7 @@ def check_project_rules(bld):
     for f in [ build_dependencies, build_includes, add_init_functions ]:
         debug('deps: project rules checking %s', f)
         for t in tgt_list: f(t)
-        debug("deps: %s: %f" % (f, time.clock() - tstart))
+        debug("deps: %s: %s" % (f, str(timer)))
=20
     debug('deps: project rules stage1 completed')
=20
@@ -1148,17 +1147,17 @@ def check_project_rules(bld):
         Logs.error("Duplicate sources present - aborting")
         sys.exit(1)
=20
-    debug("deps: check_duplicate_sources: %f" % (time.clock() - tstart))
+    debug("deps: check_duplicate_sources: %s" % str(timer))
=20
     if not bld.check_group_ordering(tgt_list):
         Logs.error("Bad group ordering - aborting")
         sys.exit(1)
=20
-    debug("deps: check_group_ordering: %f" % (time.clock() - tstart))
+    debug("deps: check_group_ordering: %s" % str(timer))
=20
     show_final_deps(bld, tgt_list)
=20
-    debug("deps: show_final_deps: %f" % (time.clock() - tstart))
+    debug("deps: show_final_deps: %s" % str(timer))
=20
     debug('deps: project rules checking completed - %u targets checked',
           len(tgt_list))
@@ -1166,7 +1165,7 @@ def check_project_rules(bld):
     if not bld.is_install:
         save_samba_deps(bld, tgt_list)
=20
-    debug("deps: save_samba_deps: %f" % (time.clock() - tstart))
+    debug("deps: save_samba_deps: %s" % str(timer))
=20
     Logs.info("Project rules pass")
=20
--=20
2.22.0


--YZ5djTAD1cGYuMQK--

