Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D44249F
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 13:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=G6Cbn34Rkkvn1R4JacxGck3GnVM4cWDQ4HYh1FT9plo=; b=5YEi6YW3iR19t11vN/4DwDISxg
	CzRXY1MVrFG6x6D93/Vf8Fx2qf9i8i8+SFModU0+TwZBa8mSJIovD6IVwzda9B7OQdh2WFdJDLpbB
	uZvMdWSOLzxFPsdggrSOTPrBimnAI9BEtw58LCDGa8nPvx48E18YV+3MYb9GNG2fDNsnR4yNlvIVq
	qB+FLs839FhYoe47uIhbuaSPFa52GNLLMBWkOnq3cgzhqudP9JXLn7DFXJiI4iWsalv82yOAy2H8A
	gCD/b+nflWITP9wcEwaTaE6EAOCA0cltw1luHffaZjvKCJzyrsmYdcXc4Ke41wSHOiBGTfsVwVmxB
	UpUF/9rA==;
Received: from localhost ([::1]:57664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb1iQ-00196E-5E; Wed, 12 Jun 2019 11:46:54 +0000
Received: from mx1.redhat.com ([209.132.183.28]:47904) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hb1iM-001967-9J
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 11:46:52 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 67C38B2DC5
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 11:46:46 +0000 (UTC)
Received: from 10.4.128.1 (unknown [10.40.3.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA6E6196A3
 for <samba-technical@lists.samba.org>; Wed, 12 Jun 2019 11:46:45 +0000 (UTC)
Date: Wed, 12 Jun 2019 13:46:43 +0200
To: samba-technical@lists.samba.org
Subject: [PATCH] wafsamba: Fix few SyntaxWarnings caused by regular expressions
Message-ID: <20190612114643.GC8215@10.4.128.1>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 12 Jun 2019 11:46:46 +0000 (UTC)
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


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ehlo,

these warnings ere logged by default with python3.8.
There are still some warnings in waf itself. But it should be
firstly fixed in upstrem waf.

./buildtools/wafsamba/samba_utils.py:258: SyntaxWarning: invalid escape sequence \$
  lst = re.split('(\$\{\w+\})', string)
./buildtools/wafsamba/samba_utils.py:261: SyntaxWarning: invalid escape sequence \$
  if re.match('\$\{\w+\}', v):
./buildtools/wafsamba/samba_cross.py:80: SyntaxWarning: invalid escape sequence \(
  m = re.match('\(\s*(-?\d+)\s*,\s*\"(.*)\"\s*\)', ans)
./buildtools/wafsamba/samba_conftests.py:400: SyntaxWarning: invalid escape sequence \s
  m = re.search('MAN%sEXT\s+=\s+(\w+)' % section, man)
./buildtools/wafsamba/samba_abi.py:24: SyntaxWarning: invalid escape sequence \$
  sig = re.sub('^\$[0-9]+\s=\s\{(.+)\}$', r'\1', sig)
./buildtools/wafsamba/samba_abi.py:25: SyntaxWarning: invalid escape sequence \$
  sig = re.sub('^\$[0-9]+\s=\s\{(.+)\}(\s0x[0-9a-f]+\s<\w+>)+$', r'\1', sig)
./buildtools/wafsamba/samba_abi.py:26: SyntaxWarning: invalid escape sequence \$
  sig = re.sub('^\$[0-9]+\s=\s(0x[0-9a-f]+)\s?(<\w+>)?$', r'\1', sig)
./buildtools/wafsamba/samba_abi.py:33: SyntaxWarning: invalid escape sequence \*
  m = m.replace('*', '\*')
./buildtools/wafsamba/samba_abi.py:44: SyntaxWarning: invalid escape sequence \s
  sig = re.sub(',\s\.\.\.', '', sig)
./buildtools/wafsamba/samba_headers.py:22: SyntaxWarning: invalid escape sequence \s
  re_header = re.compile('^\s*#\s*include[ \t]*"([^"]+)"', re.I | re.M)
./buildtools/wafsamba/symbols.py:122: SyntaxWarning: invalid escape sequence \[
  re_sharedlib = re.compile(b'Shared library: \[(.*)\]')
./buildtools/wafsamba/symbols.py:124: SyntaxWarning: invalid escape sequence \[
  re_rpath     = re.compile(b'Library (rpath|runpath): \[(.*)\]')
./buildtools/wafsamba/pkgconfig.py:12: SyntaxWarning: invalid escape sequence \w
  a = re.split('(@\w+@)', s)
./buildtools/wafsamba/pkgconfig.py:17: SyntaxWarning: invalid escape sequence \w
  if re.match('@\w+@', v):
./buildtools/wafsamba/configure_file.py:16: SyntaxWarning: invalid escape sequence \w
  a = re.split('(@\w+@)', s)
./buildtools/wafsamba/configure_file.py:19: SyntaxWarning: invalid escape sequence \w
  if re.match('@\w+@', v):

PTAL

LS

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-wafsamba-Fix-few-SyntaxWarnings-caused-by-regular-ex.patch"
Content-Transfer-Encoding: quoted-printable

=46rom e6ac1da43e96f7729bf53b90cc8e1c69dd50df20 Mon Sep 17 00:00:00 2001
=46rom: Lukas Slebodnik <lslebodn@fedoraproject.org>
Date: Wed, 12 Jun 2019 13:38:17 +0200
Subject: [PATCH] wafsamba: Fix few SyntaxWarnings caused by regular
 expressions

=2E/buildtools/wafsamba/samba_utils.py:258: SyntaxWarning: invalid escape s=
equence \$
  lst =3D re.split('(\$\{\w+\})', string)
=2E/buildtools/wafsamba/samba_utils.py:261: SyntaxWarning: invalid escape s=
equence \$
  if re.match('\$\{\w+\}', v):
=2E/buildtools/wafsamba/samba_cross.py:80: SyntaxWarning: invalid escape se=
quence \(
  m =3D re.match('\(\s*(-?\d+)\s*,\s*\"(.*)\"\s*\)', ans)
=2E/buildtools/wafsamba/samba_conftests.py:400: SyntaxWarning: invalid esca=
pe sequence \s
  m =3D re.search('MAN%sEXT\s+=3D\s+(\w+)' % section, man)
=2E/buildtools/wafsamba/samba_abi.py:24: SyntaxWarning: invalid escape sequ=
ence \$
  sig =3D re.sub('^\$[0-9]+\s=3D\s\{(.+)\}$', r'\1', sig)
=2E/buildtools/wafsamba/samba_abi.py:25: SyntaxWarning: invalid escape sequ=
ence \$
  sig =3D re.sub('^\$[0-9]+\s=3D\s\{(.+)\}(\s0x[0-9a-f]+\s<\w+>)+$', r'\1',=
 sig)
=2E/buildtools/wafsamba/samba_abi.py:26: SyntaxWarning: invalid escape sequ=
ence \$
  sig =3D re.sub('^\$[0-9]+\s=3D\s(0x[0-9a-f]+)\s?(<\w+>)?$', r'\1', sig)
=2E/buildtools/wafsamba/samba_abi.py:33: SyntaxWarning: invalid escape sequ=
ence \*
  m =3D m.replace('*', '\*')
=2E/buildtools/wafsamba/samba_abi.py:44: SyntaxWarning: invalid escape sequ=
ence \s
  sig =3D re.sub(',\s\.\.\.', '', sig)
=2E/buildtools/wafsamba/samba_headers.py:22: SyntaxWarning: invalid escape =
sequence \s
  re_header =3D re.compile('^\s*#\s*include[ \t]*"([^"]+)"', re.I | re.M)
=2E/buildtools/wafsamba/symbols.py:122: SyntaxWarning: invalid escape seque=
nce \[
  re_sharedlib =3D re.compile(b'Shared library: \[(.*)\]')
=2E/buildtools/wafsamba/symbols.py:124: SyntaxWarning: invalid escape seque=
nce \[
  re_rpath     =3D re.compile(b'Library (rpath|runpath): \[(.*)\]')
=2E/buildtools/wafsamba/pkgconfig.py:12: SyntaxWarning: invalid escape sequ=
ence \w
  a =3D re.split('(@\w+@)', s)
=2E/buildtools/wafsamba/pkgconfig.py:17: SyntaxWarning: invalid escape sequ=
ence \w
  if re.match('@\w+@', v):
=2E/buildtools/wafsamba/configure_file.py:16: SyntaxWarning: invalid escape=
 sequence \w
  a =3D re.split('(@\w+@)', s)
=2E/buildtools/wafsamba/configure_file.py:19: SyntaxWarning: invalid escape=
 sequence \w
  if re.match('@\w+@', v):

Signed-off-by: Lukas Slebodnik <lslebodn@fedoraproject.org>
---
 buildtools/wafsamba/configure_file.py  |  4 ++--
 buildtools/wafsamba/pkgconfig.py       |  4 ++--
 buildtools/wafsamba/samba_abi.py       | 12 ++++++------
 buildtools/wafsamba/samba_conftests.py |  2 +-
 buildtools/wafsamba/samba_cross.py     |  2 +-
 buildtools/wafsamba/samba_headers.py   |  2 +-
 buildtools/wafsamba/samba_utils.py     |  4 ++--
 buildtools/wafsamba/symbols.py         |  4 ++--
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/buildtools/wafsamba/configure_file.py b/buildtools/wafsamba/co=
nfigure_file.py
index 6ad43546249fba7b4c0a037035e8574e7a9d2753..98a58a4604513e3633317e73299=
c1c9280c250d2 100644
--- a/buildtools/wafsamba/configure_file.py
+++ b/buildtools/wafsamba/configure_file.py
@@ -13,10 +13,10 @@ def subst_at_vars(task):
     s =3D task.inputs[0].read()
=20
     # split on the vars
-    a =3D re.split('(@\w+@)', s)
+    a =3D re.split(r'(@\w+@)', s)
     out =3D []
     for v in a:
-        if re.match('@\w+@', v):
+        if re.match(r'@\w+@', v):
             vname =3D v[1:-1]
             if not vname in task.env and vname.upper() in task.env:
                 vname =3D vname.upper()
diff --git a/buildtools/wafsamba/pkgconfig.py b/buildtools/wafsamba/pkgconf=
ig.py
index b83d5f382a58352bb3318b594aa2b45fc02d87d5..b77bd618c8903789c7ba9e64a69=
72a4e080f1821 100644
--- a/buildtools/wafsamba/pkgconfig.py
+++ b/buildtools/wafsamba/pkgconfig.py
@@ -9,12 +9,12 @@ def subst_at_vars(task):
=20
     s =3D task.inputs[0].read()
     # split on the vars
-    a =3D re.split('(@\w+@)', s)
+    a =3D re.split(r'(@\w+@)', s)
     out =3D []
     done_var =3D {}
     back_sub =3D [ ('PREFIX', '${prefix}'), ('EXEC_PREFIX', '${exec_prefix=
}')]
     for v in a:
-        if re.match('@\w+@', v):
+        if re.match(r'@\w+@', v):
             vname =3D v[1:-1]
             if not vname in task.env and vname.upper() in task.env:
                 vname =3D vname.upper()
diff --git a/buildtools/wafsamba/samba_abi.py b/buildtools/wafsamba/samba_a=
bi.py
index 5e7686da3d68b1ebcd842b8a319a5997fa9cf600..761667fcfe1f3937be22c8261b4=
5dcb3979ae4cd 100644
--- a/buildtools/wafsamba/samba_abi.py
+++ b/buildtools/wafsamba/samba_abi.py
@@ -21,16 +21,16 @@ version_key =3D lambda x: list(map(int, x.split(".")))
 def normalise_signature(sig):
     '''normalise a signature from gdb'''
     sig =3D sig.strip()
-    sig =3D re.sub('^\$[0-9]+\s=3D\s\{(.+)\}$', r'\1', sig)
-    sig =3D re.sub('^\$[0-9]+\s=3D\s\{(.+)\}(\s0x[0-9a-f]+\s<\w+>)+$', r'\=
1', sig)
-    sig =3D re.sub('^\$[0-9]+\s=3D\s(0x[0-9a-f]+)\s?(<\w+>)?$', r'\1', sig)
-    sig =3D re.sub('0x[0-9a-f]+', '0xXXXX', sig)
+    sig =3D re.sub(r'^\$[0-9]+\s=3D\s\{(.+)\}$', r'\1', sig)
+    sig =3D re.sub(r'^\$[0-9]+\s=3D\s\{(.+)\}(\s0x[0-9a-f]+\s<\w+>)+$', r'=
\1', sig)
+    sig =3D re.sub(r'^\$[0-9]+\s=3D\s(0x[0-9a-f]+)\s?(<\w+>)?$', r'\1', si=
g)
+    sig =3D re.sub(r'0x[0-9a-f]+', '0xXXXX', sig)
     sig =3D re.sub('", <incomplete sequence (\\\\[a-z0-9]+)>', r'\1"', sig)
=20
     for t in abi_type_maps:
         # we need to cope with non-word characters in mapped types
         m =3D t
-        m =3D m.replace('*', '\*')
+        m =3D m.replace('*', r'\*')
         if m[-1].isalnum() or m[-1] =3D=3D '_':
             m +=3D '\\b'
         if m[0].isalnum() or m[0] =3D=3D '_':
@@ -41,7 +41,7 @@ def normalise_signature(sig):
=20
 def normalise_varargs(sig):
     '''cope with older versions of gdb'''
-    sig =3D re.sub(',\s\.\.\.', '', sig)
+    sig =3D re.sub(r',\s\.\.\.', '', sig)
     return sig
=20
=20
diff --git a/buildtools/wafsamba/samba_conftests.py b/buildtools/wafsamba/s=
amba_conftests.py
index ef632ba903369e4211991f17a3b204bcd96c3a2f..63e50567860ff890b00b0ce6c76=
07c917b7329d1 100644
--- a/buildtools/wafsamba/samba_conftests.py
+++ b/buildtools/wafsamba/samba_conftests.py
@@ -397,7 +397,7 @@ WriteMakefile(
=20
     if section:
         man =3D Utils.readf(os.path.join(bdir,'Makefile'))
-        m =3D re.search('MAN%sEXT\s+=3D\s+(\w+)' % section, man)
+        m =3D re.search(r'MAN%sEXT\s+=3D\s+(\w+)' % section, man)
         if not m:
             conf.end_msg('not found', color=3D'YELLOW')
             return
diff --git a/buildtools/wafsamba/samba_cross.py b/buildtools/wafsamba/samba=
_cross.py
index 8863c2c53e7d7dd9317c9233f0085ffd0eea6b2f..34793902fba884cf2d8358bf431=
5dc98027266b6 100644
--- a/buildtools/wafsamba/samba_cross.py
+++ b/buildtools/wafsamba/samba_cross.py
@@ -77,7 +77,7 @@ def cross_answer(ca_file, msg):
                 f.close()
                 return (0, ans.strip("'"))
             else:
-                m =3D re.match('\(\s*(-?\d+)\s*,\s*\"(.*)\"\s*\)', ans)
+                m =3D re.match(r'\(\s*(-?\d+)\s*,\s*\"(.*)\"\s*\)', ans)
                 if m:
                     f.close()
                     return (int(m.group(1)), m.group(2))
diff --git a/buildtools/wafsamba/samba_headers.py b/buildtools/wafsamba/sam=
ba_headers.py
index a268c011c5d8e406e0d763554c55668cfb5388bc..c8bee19010978a04460b0637fcc=
8fd484a699ea8 100644
--- a/buildtools/wafsamba/samba_headers.py
+++ b/buildtools/wafsamba/samba_headers.py
@@ -19,7 +19,7 @@ def header_install_path(header, header_path):
     return ''
=20
=20
-re_header =3D re.compile('^\s*#\s*include[ \t]*"([^"]+)"', re.I | re.M)
+re_header =3D re.compile(r'^\s*#\s*include[ \t]*"([^"]+)"', re.I | re.M)
=20
 # a dictionary mapping source header paths to public header paths
 header_map =3D {}
diff --git a/buildtools/wafsamba/samba_utils.py b/buildtools/wafsamba/samba=
_utils.py
index ad97de1859ba24c4afd5106b4f9694b0dc855643..75c9794ec40f327ef8ccf9aa33f=
afd6ed6181e3b 100644
--- a/buildtools/wafsamba/samba_utils.py
+++ b/buildtools/wafsamba/samba_utils.py
@@ -255,10 +255,10 @@ def TO_LIST(str, delimiter=3DNone):
=20
 def subst_vars_error(string, env):
     '''substitute vars, throw an error if a variable is not defined'''
-    lst =3D re.split('(\$\{\w+\})', string)
+    lst =3D re.split(r'(\$\{\w+\})', string)
     out =3D []
     for v in lst:
-        if re.match('\$\{\w+\}', v):
+        if re.match(r'\$\{\w+\}', v):
             vname =3D v[2:-1]
             if not vname in env:
                 raise KeyError("Failed to find variable %s in %s in env %s=
 <%s>" % (vname, string, env.__class__, str(env)))
diff --git a/buildtools/wafsamba/symbols.py b/buildtools/wafsamba/symbols.py
index 3eca3d46bd71cf0780b3c8e36a26b96bd3aa3b83..73e8ca8ce53ef5d956ac58e14a2=
403dd49f01109 100644
--- a/buildtools/wafsamba/symbols.py
+++ b/buildtools/wafsamba/symbols.py
@@ -119,9 +119,9 @@ def find_ldd_path(bld, libname, binary):
=20
=20
 # some regular expressions for parsing readelf output
-re_sharedlib =3D re.compile(b'Shared library: \[(.*)\]')
+re_sharedlib =3D re.compile(r'Shared library: \[(.*)\]')
 # output from readelf could be `Library rpath` or `Libray runpath`
-re_rpath     =3D re.compile(b'Library (rpath|runpath): \[(.*)\]')
+re_rpath     =3D re.compile(r'Library (rpath|runpath): \[(.*)\]')
=20
 def get_libs(bld, binname):
     '''find the list of linked libraries for any binary or library
--=20
2.22.0


--O5XBE6gyVG5Rl6Rj--

