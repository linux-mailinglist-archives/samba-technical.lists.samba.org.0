Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E54F07A5
	for <lists+samba-technical@lfdr.de>; Sun,  3 Apr 2022 06:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=z5VBAdHImvj9SznOTB0zeoWG4tIOMoMNOvUby1YI8iY=; b=aci1G4lepupGQxMRV7+elLl6mk
	d/Rvb6WojG98cXWAuSA4i7FGPmyclTlNcDPMy4RQobRltVKmUP620D03a4WZYENd0NI6/CK5v4Wq9
	fPZ9CFB93PZMdpT1+//laUVdljcnBMX+H8JcOVTt+SlPdrt6NSXqTvmtqRvOPDyUn81+V7dIUaDeh
	v6ugpAnCNrOtKYTnjuyaOPv8M8Sh/4tppvgW6YIIoK2+Z+exifJYIZV5QxgF5tXqd8XSoj1CHdNzL
	BXIDViwyQLk0auoKHsbQcVnQkUZ4rM+4WUyIfYO+a74nyrioz0wmDZzwGRb4VaFbYUuUDBLZ14/5N
	QEXrq3gA==;
Received: from ip6-localhost ([::1]:23952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nasEb-009eI3-9I; Sun, 03 Apr 2022 04:53:05 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42717) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nasES-009eHu-4I
 for samba-technical@lists.samba.org; Sun, 03 Apr 2022 04:52:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id DDF0340124
 for <samba-technical@lists.samba.org>; Sun,  3 Apr 2022 07:52:50 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 7036930C;
 Sun,  3 Apr 2022 07:49:05 +0300 (MSK)
Received: (nullmailer pid 1824869 invoked by uid 1000);
 Sun, 03 Apr 2022 04:52:50 -0000
To: samba-technical@lists.samba.org
Subject: tons of uselib_local warnings in waf
Date: Sun,  3 Apr 2022 07:52:29 +0300
Message-Id: <20220403045229.1824798-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

when doing samba configure/build with waf verbosity
level >= 1 (to see what it is doing), there's a *ton*
(about 2000) of warnings like this:

  compat: "uselib_local" is deprecated, replace by "use"

apparently this comes from buildtools/wafsamba/samba_deps.py
(and samba_conftests.py), - that's where uselib_local
is used  (the warning itself is apparently in
buildtools/wafsamba/samba_waf18.py).

I tried to dig there, but weren't able to figure out how
it all works.  The following change does eliminate the
warning, but I'm not sure the resulting thing actually
does what it is supposed to do.  For one, there's no
function like "apply_use()" in samba_waf18.py which does
something similar to "apply_uselib_local()", - I don't
see where this "use" attribute is processed.

What would be the right fix for this?

Also, where to look for some basic docs about waf
internals?

Thank you!

/mjt

diff --git a/buildtools/wafsamba/samba_conftests.py b/buildtools/wafsamba/samba_conftests.py
index ef632ba9033..59b1258c7de 100644
--- a/buildtools/wafsamba/samba_conftests.py
+++ b/buildtools/wafsamba/samba_conftests.py
@@ -315,7 +315,7 @@ def CHECK_LIBRARY_SUPPORT(conf, rpath=False, version_script=False, msg=None):
     o = bld(features='c cprogram',
             source='main.c',
             target='prog1',
-            uselib_local='lib1')
+            use='lib1')
 
     if rpath:
         o.rpath=os.path.join(bdir, 'default/libdir')
diff --git a/buildtools/wafsamba/samba_deps.py b/buildtools/wafsamba/samba_deps.py
index 9c922f7e036..cf59827f7ba 100644
--- a/buildtools/wafsamba/samba_deps.py
+++ b/buildtools/wafsamba/samba_deps.py
@@ -79,7 +79,7 @@ def build_dependencies(self):
 
     if self.samba_type in ['LIBRARY', 'PLUGIN', 'BINARY', 'PYTHON']:
         self.uselib        = list(self.final_syslibs)
-        self.uselib_local  = list(self.final_libs)
+        self.use  = list(self.final_libs)
         self.add_objects   = list(self.final_objects)
 
         # extra link flags from pkg_config
@@ -98,8 +98,8 @@ def build_dependencies(self):
             for f in self.env.undefined_ignore_ldflags:
                 self.ldflags.append(f)
 
-        debug('deps: computed dependencies for target %s: uselib=%s uselib_local=%s add_objects=%s',
-              self.sname, self.uselib, self.uselib_local, self.add_objects)
+        debug('deps: computed dependencies for target %s: uselib=%s use=%s add_objects=%s',
+              self.sname, self.uselib, self.use, self.add_objects)
 
     if self.samba_type in ['SUBSYSTEM', 'BUILTIN']:
         # this is needed for the cflags of libs that come from pkg_config
@@ -331,7 +331,7 @@ def check_group_ordering(bld, tgt_list):
 
     ret = True
     for t in tgt_list:
-        tdeps = getattr(t, 'add_objects', []) + getattr(t, 'uselib_local', [])
+        tdeps = getattr(t, 'add_objects', []) + getattr(t, 'use', [])
         for d in tdeps:
             t2 = bld.get_tgen_by_name(d)
             if t2 is None:
@@ -355,8 +355,8 @@ def show_final_deps(bld, tgt_list):
     for t in tgt_list:
         if not targets[t.sname] in ['LIBRARY', 'PLUGIN', 'BINARY', 'PYTHON', 'SUBSYSTEM', 'BUILTIN']:
             continue
-        debug('deps: final dependencies for target %s: uselib=%s uselib_local=%s add_objects=%s',
-              t.sname, t.uselib, getattr(t, 'uselib_local', []), getattr(t, 'add_objects', []))
+        debug('deps: final dependencies for target %s: uselib=%s use=%s add_objects=%s',
+              t.sname, t.uselib, getattr(t, 'use', []), getattr(t, 'add_objects', []))
 
 
 def add_samba_attributes(bld, tgt_list):
@@ -1038,7 +1038,7 @@ savedeps_version = 3
 savedeps_inputs  = ['samba_deps', 'samba_includes', 'local_include', 'local_include_first', 'samba_cflags',
                     'source', 'grouping_library', 'samba_ldflags', 'allow_undefined_symbols',
                     'use_global_deps', 'global_include' ]
-savedeps_outputs = ['uselib', 'uselib_local', 'add_objects', 'includes',
+savedeps_outputs = ['uselib', 'use', 'add_objects', 'includes',
                     'cflags', 'ldflags', 'samba_deps_extended', 'final_libs']
 savedeps_outenv  = ['INC_PATHS']
 savedeps_envvars = ['NONSHARED_BINARIES', 'GLOBAL_DEPENDENCIES', 'EXTRA_CFLAGS', 'EXTRA_LDFLAGS', 'EXTRA_INCLUDES' ]

