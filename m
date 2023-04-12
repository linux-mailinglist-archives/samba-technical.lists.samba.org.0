Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0746DFCD0
	for <lists+samba-technical@lfdr.de>; Wed, 12 Apr 2023 19:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AKE91s3yUJelkwFOh6XiJ7M1QYHjFh51SIiRs7TFi8s=; b=Ufoc7EznGrgvrhltb9apBrPccd
	+gKoMmMJ5pNer/gINEjaHoggzs3meXxbwrOilYx2Rj+gLBjGmE2D/0LdPVHwx+9hcRIYcqJFoIUlI
	GccoOKqCQD1A5UMSN2FlLcIFplyX+4c01X01qRuoGk0nRyDhcm6KQ9aEUWCzJInXoRs45cOhXUUrf
	gcYQqy3AgZcp6K0s7Hf7WXUwC4u1wpXavHbieajnmc0UMYXYfi42Bus2dxfg3iVxgs6DqK8MrNFyo
	/j4uhdAswNnMaJGWjP1mNqDf6JIuuooGN7xY17XAAtrMSDwAHQWbw5761t9SZS3aVCFyNvSo7pr2s
	E+YrOgBg==;
Received: from ip6-localhost ([::1]:49872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmeNv-000oOW-6T; Wed, 12 Apr 2023 17:35:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmeNo-000oON-MA
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 17:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=AKE91s3yUJelkwFOh6XiJ7M1QYHjFh51SIiRs7TFi8s=; b=fqunPx/um8ToNIMPPNl60RaJCg
 YLHb8TwQwGAKeq8aZ3roFRWkr1rAOYNnyYcG51yKQFwoXXFpfGzUZkiQUWlzVBCh9jC/ztnUBtxH2
 xm2f+TkoY2xjxRR/tssjU5HcWNUBfyoYPYP37HeybnM4hjMKU1k/gCDOJB79xUS9sGYJenKhxhveF
 8D1Gnk5CJUxAlZwZan6QLKU0f1qwAWsYAMn/0ABj+7K5cBtDZYTtH+bsW1Y3IdrWRD24ZtXH+gd4t
 2Yp/WJ6pqmOdWbjU2HZhaiv3oufCoiacxrTrkhKnTPjNZfgd9NiNzJSZFCBi9VNc/0iySw+FHROVh
 yl1rgANhIHAWb2/Ks79deHSS7DUf5Eyeqb2FqxfbS0Q5M0ODZ7TbMiLqt4IaSmfz1P0yJOaG+2nCT
 U02JCXudLMg9KcNaLtcXavnJC1pPcKi16Z1V2QqbXmX9nL4r2zbkRWFTUxMTh9iqhHIrhoocatsmz
 VOP4BIHYqMpdkZvhLm22SdfC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmeNn-000lCT-8M
 for samba-technical@lists.samba.org; Wed, 12 Apr 2023 17:35:47 +0000
To: samba-technical@lists.samba.org
Subject: The strange issues happening with ad_dc_ntvfs environment
Date: Wed, 12 Apr 2023 19:35:45 +0200
Message-ID: <2142927.irdbgypaU6@magrathea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart13245307.uLZWGnKmhe"
Content-Transfer-Encoding: 7Bit
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart13245307.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

there are strange things going on with the ad_dc_ntvfs environment. You can 
see it very well with the samba.tests.samba_tool.user.ad_dc_ntvfs test now.

I've created a patch that samba-tool consistently uses LDAP and not a mix it 
with local operations.

This fixed a lot of issues. However there is a test called `test_setpassword` 
which calls 'samba-tool user syncpassword' which can't use LDAP. So I've 
passed it the configuration. However this test fails now, see attached log.

Is it possible that the samba process restarted and works on different 
databases now?
Any other ideas?


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart13245307.uLZWGnKmhe
Content-Disposition: attachment;
 filename="0001-python-tests-Consistently-use-an-ldap-connection-for.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="unicode-2-0-utf-8";
 name="0001-python-tests-Consistently-use-an-ldap-connection-for.patch"

From 2a1976e02b33b30f1e8001771e5feceb586a489e Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Thu, 6 Apr 2023 20:40:44 +0200
Subject: [PATCH] python:tests: Consistently use an ldap connection for
 operations

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 python/samba/tests/samba_tool/user.py | 377 +++++++++++++++++++++-----
 source4/selftest/tests.py             |  18 +-
 2 files changed, 318 insertions(+), 77 deletions(-)

diff --git a/python/samba/tests/samba_tool/user.py b/python/samba/tests/samba_tool/user.py
index 28fb79146fa..a4b0f33652e 100644
--- a/python/samba/tests/samba_tool/user.py
+++ b/python/samba/tests/samba_tool/user.py
@@ -65,7 +65,13 @@ class UserCmdTestCase(SambaToolCmdTest):
         # Make sure users don't exist
         for user in self.users:
             if self._find_user(user["name"]):
-                self.runsubcmd("user", "delete", user["name"])
+                self.runsubcmd("user",
+                               "delete",
+                               user["name"],
+                               "-H",
+                               "ldap://%s" % os.environ["DC_SERVER"],
+                               "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                             os.environ["DC_PASSWORD"]))
 
         # setup the 12 users and ensure they are correct
         for user in self.users:
@@ -87,7 +93,13 @@ class UserCmdTestCase(SambaToolCmdTest):
         # clean up all the left over users, just in case
         for user in self.users:
             if self._find_user(user["name"]):
-                self.runsubcmd("user", "delete", user["name"])
+                self.runsubcmd("user",
+                               "delete",
+                               user["name"],
+                               "-H",
+                               "ldap://%s" % os.environ["DC_SERVER"],
+                               "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                             os.environ["DC_PASSWORD"]))
         lp = env_loadparm()
         # second run of this test
         # the cache is still there and '--cache-ldb-initialize'
@@ -106,7 +118,13 @@ class UserCmdTestCase(SambaToolCmdTest):
 
         # try to delete all the 4 users we just added
         for user in self.users:
-            (result, out, err) = self.runsubcmd("user", "delete", user["name"])
+            (result, out, err) = self.runsubcmd("user",
+                                                "delete",
+                                                user["name"],
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err, "Can we delete users")
             found = self._find_user(user["name"])
             self.assertIsNone(found)
@@ -272,7 +290,8 @@ class UserCmdTestCase(SambaToolCmdTest):
         (result, out, err) = self.runsubcmd("user", "syncpasswords",
                                             "--cache-ldb-initialize",
                                             "--attributes=%s" % attributes,
-                                            "--decrypt-samba-gpg")
+                                            "--decrypt-samba-gpg",
+                                            os.environ['CONFIGURATION'])
         self.assertCmdSuccess(result, out, err, "Ensure syncpasswords --cache-ldb-initialize runs")
         self.assertEqual(err, "", "getpassword without url")
         cache_attrs = {
@@ -290,7 +309,10 @@ class UserCmdTestCase(SambaToolCmdTest):
             self.assertMatch(out, "%s: %s" % (a, v),
                              "syncpasswords --cache-ldb-initialize: %s: %s out[%s]" % (a, v, out))
 
-        (result, out, err) = self.runsubcmd("user", "syncpasswords", "--no-wait")
+        (result, out, err) = self.runsubcmd("user",
+                                            "syncpasswords",
+                                            "--no-wait",
+                                            os.environ['CONFIGURATION'])
         self.assertCmdSuccess(result, out, err, "Ensure syncpasswords --no-wait runs")
         self.assertEqual(err, "", "syncpasswords --no-wait")
         self.assertMatch(out, "dirsync_loop(): results 0",
@@ -308,14 +330,22 @@ class UserCmdTestCase(SambaToolCmdTest):
             virtualClearTextUTF8 = base64.b64encode(get_bytes(newpasswd)).decode('utf8')
             virtualClearTextUTF16 = base64.b64encode(get_string(newpasswd).encode('utf-16-le')).decode('utf8')
 
-            (result, out, err) = self.runsubcmd("user", "setpassword",
+            (result, out, err) = self.runsubcmd("user",
+                                                "setpassword",
                                                 user["name"],
-                                                "--newpassword=%s" % newpasswd)
+                                                "--newpassword=%s" % newpasswd,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err, "Ensure setpassword runs")
             self.assertEqual(err, "", "setpassword without url")
             self.assertMatch(out, "Changed password OK", "setpassword without url")
 
-            (result, out, err) = self.runsubcmd("user", "syncpasswords", "--no-wait")
+            (result, out, err) = self.runsubcmd("user",
+                                                "syncpasswords",
+                                                "--no-wait",
+                                                os.environ['CONFIGURATION'])
             self.assertCmdSuccess(result, out, err, "Ensure syncpasswords --no-wait runs")
             self.assertEqual(err, "", "syncpasswords --no-wait")
             self.assertMatch(out, "dirsync_loop(): results 0",
@@ -344,7 +374,8 @@ class UserCmdTestCase(SambaToolCmdTest):
             (result, out, err) = self.runsubcmd("user", "getpassword",
                                                 user["name"],
                                                 "--attributes=%s" % attributes,
-                                                "--decrypt-samba-gpg")
+                                                "--decrypt-samba-gpg",
+                                                os.environ['CONFIGURATION'])
             self.assertCmdSuccess(result, out, err, "Ensure getpassword runs")
             self.assertEqual(err, "", "getpassword without url")
             self.assertMatch(out, "Got password OK", "getpassword without url")
@@ -711,28 +742,52 @@ sAMAccountName: %s
         full_ou_dn = str(self.samdb.normalize_dn_in_domain("OU=movetest_usr"))
         self.addCleanup(self.samdb.delete, full_ou_dn, ["tree_delete:1"])
 
-        (result, out, err) = self.runsubcmd("ou", "add", full_ou_dn)
+        (result, out, err) = self.runsubcmd("ou",
+                                            "add",
+                                            full_ou_dn,
+                                            "-H",
+                                            "ldap://%s" % os.environ["DC_SERVER"],
+                                            "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                            os.environ["DC_PASSWORD"]))
         self.assertCmdSuccess(result, out, err)
         self.assertEqual(err, "", "There shouldn't be any error message")
         self.assertIn('Added ou "%s"' % full_ou_dn, out)
 
         for user in self.users:
-            (result, out, err) = self.runsubcmd(
-                "user", "move", user["name"], full_ou_dn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "move",
+                                                user["name"],
+                                                full_ou_dn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err, "Error running move")
             self.assertIn('Moved user "%s" into "%s"' %
                           (user["name"], full_ou_dn), out)
 
         # Should fail as users objects are in OU
-        (result, out, err) = self.runsubcmd("ou", "delete", full_ou_dn)
+        (result, out, err) = self.runsubcmd("ou",
+                                            "delete",
+                                            full_ou_dn,
+                                            "-H",
+                                            "ldap://%s" % os.environ["DC_SERVER"],
+                                            "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                os.environ["DC_PASSWORD"]))
         self.assertCmdFail(result)
         self.assertIn(("subtree_delete: Unable to delete a non-leaf node "
                        "(it has %d children)!") % len(self.users), err)
 
         for user in self.users:
             new_dn = "CN=Users,%s" % self.samdb.domain_dn()
-            (result, out, err) = self.runsubcmd(
-                "user", "move", user["name"], new_dn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "move",
+                                                user["name"],
+                                                new_dn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                    os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err, "Error running move")
             self.assertIn('Moved user "%s" into "%s"' %
                           (user["name"], new_dn), out)
@@ -751,7 +806,11 @@ sAMAccountName: %s
             (result, out, err) = self.runsubcmd("user", "rename", user["name"],
                                                 "--surname=%s" % new_surname,
                                                 "--initials=%s" % new_initials,
-                                                "--given-name=%s" % new_givenname)
+                                                "--given-name=%s" % new_givenname,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -769,7 +828,11 @@ sAMAccountName: %s
             (result, out, err) = self.runsubcmd("user", "rename", user["name"],
                                                 "--surname=",
                                                 "--initials=",
-                                                "--given-name=")
+                                                "--given-name=",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -781,14 +844,28 @@ sAMAccountName: %s
             self.assertEqual("%s" % found.get("cn"), user["name"])
 
             # reset changes (initials are removed)
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
                                                 "--surname=%(surname)s" % user,
-                                                "--given-name=%(given-name)s" % user)
+                                                "--given-name=%(given-name)s" %
+                                                user,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
             if old_cn:
-                (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--force-new-cn=%s" % old_cn)
+                (result, out, err) = self.runsubcmd("user",
+                                                    "rename",
+                                                    user["name"],
+                                                    "--force-new-cn=%s" %
+                                                    old_cn,
+                                                    "-H",
+                                                    "ldap://%s" % os.environ["DC_SERVER"],
+                                                    "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                  os.environ["DC_PASSWORD"]))
 
     def test_rename_cn_samaccountname(self):
         """rename and try to remove the cn and the samaccount of all users"""
@@ -798,10 +875,16 @@ sAMAccountName: %s
             new_surname = "new_surname_of_" + user["name"]
 
             # rename cn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--samaccountname=%s"
-                                                 % new_samaccountname,
-                                                "--force-new-cn=%s" % new_cn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--samaccountname=%s" %
+                                                new_samaccountname,
+                                                "--force-new-cn=%s" % new_cn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -812,8 +895,14 @@ sAMAccountName: %s
                              new_samaccountname)
 
             # changing the surname has no effect to the cn
-            (result, out, err) = self.runsubcmd("user", "rename", new_samaccountname,
-                                                "--surname=%s" % new_surname)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                new_samaccountname,
+                                                "--surname=%s" % new_surname,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
             found = self._find_user(new_samaccountname)
@@ -822,7 +911,11 @@ sAMAccountName: %s
             # trying to remove cn (throws an error)
             (result, out, err) = self.runsubcmd("user", "rename",
                                                 new_samaccountname,
-                                                "--force-new-cn=")
+                                                "--force-new-cn=",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdFail(result)
             self.assertIn('Failed to rename user', err)
             self.assertIn("delete protected attribute", err)
@@ -830,16 +923,27 @@ sAMAccountName: %s
             # trying to remove the samccountname (throws an error)
             (result, out, err) = self.runsubcmd("user", "rename",
                                                 new_samaccountname,
-                                                "--samaccountname=")
+                                                "--samaccountname=",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdFail(result)
             self.assertIn('Failed to rename user', err)
             self.assertIn('delete protected attribute', err)
 
             # reset changes (cn must be the name)
-            (result, out, err) = self.runsubcmd("user", "rename", new_samaccountname,
-                                                "--samaccountname=%(name)s"
-                                                  % user,
-                                                "--force-new-cn=%(name)s" % user)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                new_samaccountname,
+                                                "--samaccountname=%(name)s" %
+                                                user,
+                                                "--force-new-cn=%(name)s" %
+                                                user,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
     def test_rename_standard_cn(self):
@@ -851,20 +955,38 @@ sAMAccountName: %s
             new_surname = "new_surname_of_" + user["name"]
 
             # set different cn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--force-new-cn=%s" % new_cn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--force-new-cn=%s" % new_cn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
             # remove given name, initials and surname
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
                                                 "--surname=",
                                                 "--initials=",
-                                                "--given-name=")
+                                                "--given-name=",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
             # reset the CN (no given name, initials or surname --> samaccountname)
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--reset-cn")
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--reset-cn",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
 
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
@@ -874,16 +996,27 @@ sAMAccountName: %s
             self.assertEqual("%s" % found.get("cn"), user["name"])
 
             # set given name, initials and surname and set different cn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
                                                 "--force-new-cn=%s" % new_cn,
                                                 "--surname=%s" % new_surname,
                                                 "--initials=%s" % new_initials,
-                                                "--given-name=%s" % new_givenname)
+                                                "--given-name=%s" %
+                                                new_givenname,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
             # reset the CN (given name, initials or surname are given --> given name)
             (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--reset-cn")
+                                                "--reset-cn",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
 
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
@@ -898,7 +1031,12 @@ sAMAccountName: %s
                                                 "--reset-cn",
                                                 "--initials=",
                                                 "--surname=%(surname)s" % user,
-                                                "--given-name=%(given-name)s" % user)
+                                                "--given-name=%(given-name)s" %
+                                                user,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
     def test_rename_mailaddress_displayname(self):
@@ -907,11 +1045,16 @@ sAMAccountName: %s
             new_displayname = "new displayname of " + user["name"]
 
             # change mail and displayname
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--mail-address=%s"
-                                                  % new_mail,
-                                                "--display-name=%s"
-                                                  % new_displayname)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--mail-address=%s" % new_mail,
+                                                "--display-name=%s" %
+                                                new_displayname,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -921,9 +1064,15 @@ sAMAccountName: %s
             self.assertEqual("%s" % found.get("displayName"), new_displayname)
 
             # remove mail and displayname
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
                                                 "--mail-address=",
-                                                "--display-name=")
+                                                "--display-name=",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -943,16 +1092,28 @@ sAMAccountName: %s
             invalid_new_upn = "%s@invalid.suffix" + user["name"]
 
             # trying to set invalid upn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--upn=%s"
-                                                  % invalid_new_upn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--upn=%s" %
+                                                invalid_new_upn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdFail(result)
             self.assertIn('is not a valid upn', err)
 
             # set valid upn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--upn=%s"
-                                                  % valid_new_upn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--upn=%s" %
+                                                valid_new_upn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
             self.assertEqual(err, "", "Shouldn't be any error messages")
             self.assertIn('successfully', out)
@@ -961,14 +1122,26 @@ sAMAccountName: %s
             self.assertEqual("%s" % found.get("userPrincipalName"), valid_new_upn)
 
             # trying to remove upn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--upn=%s")
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--upn=%s",
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdFail(result)
             self.assertIn('is not a valid upn', err)
 
             # reset upn
-            (result, out, err) = self.runsubcmd("user", "rename", user["name"],
-                                                "--upn=%s" % old_upn)
+            (result, out, err) = self.runsubcmd("user",
+                                                "rename",
+                                                user["name"],
+                                                "--upn=%s" % old_upn,
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                              os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err)
 
     def test_getpwent(self):
@@ -1005,7 +1178,13 @@ sAMAccountName: %s
 
         # Remove user if it already exists
         if self._find_user(u[0]):
-            self.runsubcmd("user", "delete", u[0])
+            self.runsubcmd("user",
+                           "delete",
+                           u[0],
+                           "-H",
+                           "ldap://%s" % os.environ["DC_SERVER"],
+                           "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                         os.environ["DC_PASSWORD"]))
         # check if --rfc2307-from-nss sets the same values as we got from pwd.getpwuid()
         (result, out, err) = self.runsubcmd("user", "create", user["name"], user["password"],
                                             "--surname=%s" % user["surname"],
@@ -1024,7 +1203,13 @@ sAMAccountName: %s
         self.assertIn("User '%s' added successfully" % user["name"], out)
 
         self._check_posix_user(user)
-        self.runsubcmd("user", "delete", user["name"])
+        self.runsubcmd("user",
+                       "delete",
+                       user["name"],
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
 
         # Check if overriding the attributes from NSS with explicit values works
         #
@@ -1033,7 +1218,13 @@ sAMAccountName: %s
 
         # Remove user if it already exists
         if self._find_user(u[0]):
-            self.runsubcmd("user", "delete", u[0])
+            self.runsubcmd("user",
+                           "delete",
+                           u[0],
+                           "-H",
+                           "ldap://%s" % os.environ["DC_SERVER"],
+                           "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                         os.environ["DC_PASSWORD"]))
         # create a user with posix attributes from nss but override all of them with the
         # random ones just obtained
         (result, out, err) = self.runsubcmd("user", "create", user["name"], user["password"],
@@ -1057,7 +1248,13 @@ sAMAccountName: %s
         self.assertIn("User '%s' added successfully" % user["name"], out)
 
         self._check_posix_user(user)
-        self.runsubcmd("user", "delete", user["name"])
+        self.runsubcmd("user",
+                       "delete",
+                       user["name"],
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
 
     # Test: samba-tool user unlock
     # This test does not verify that the command unlocks the user, it just
@@ -1068,8 +1265,13 @@ sAMAccountName: %s
 
         # try to unlock a nonexistent user, this should fail
         nonexistentusername = "userdoesnotexist"
-        (result, out, err) = self.runsubcmd(
-            "user", "unlock", nonexistentusername)
+        (result, out, err) = self.runsubcmd("user",
+                                            "unlock",
+                                            nonexistentusername,
+                                            "-H",
+                                            "ldap://%s" % os.environ["DC_SERVER"],
+                                            "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                os.environ["DC_PASSWORD"]))
         self.assertCmdFail(result, "Ensure that unlock nonexistent user fails")
         self.assertIn("Failed to unlock user '%s'" % nonexistentusername, err)
         self.assertIn("Unable to find user", err)
@@ -1078,8 +1280,22 @@ sAMAccountName: %s
         unprivileged_username = "unprivilegedunlockuser"
         unlocktest_username = "usertounlock"
 
-        self.runsubcmd("user", "add", unprivileged_username, "Passw0rd")
-        self.runsubcmd("user", "add", unlocktest_username, "Passw0rd")
+        self.runsubcmd("user",
+                       "add",
+                       unprivileged_username,
+                       "Passw0rd",
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
+        self.runsubcmd("user",
+                       "add",
+                       unlocktest_username,
+                       "Passw0rd",
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
 
         (result, out, err) = self.runsubcmd(
             "user", "unlock", unlocktest_username,
@@ -1090,13 +1306,30 @@ sAMAccountName: %s
         self.assertIn("Failed to unlock user '%s'" % unlocktest_username, err)
         self.assertIn("LDAP error 50 LDAP_INSUFFICIENT_ACCESS_RIGHTS", err)
 
-        self.runsubcmd("user", "delete", unprivileged_username)
-        self.runsubcmd("user", "delete", unlocktest_username)
+        self.runsubcmd("user",
+                       "delete",
+                       unprivileged_username,
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
+        self.runsubcmd("user",
+                       "delete",
+                       unlocktest_username,
+                       "-H",
+                       "ldap://%s" % os.environ["DC_SERVER"],
+                       "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                     os.environ["DC_PASSWORD"]))
 
         # run unlock against test users
         for user in self.users:
-            (result, out, err) = self.runsubcmd(
-                "user", "unlock", user["name"])
+            (result, out, err) = self.runsubcmd("user",
+                                                "unlock",
+                                                user["name"],
+                                                "-H",
+                                                "ldap://%s" % os.environ["DC_SERVER"],
+                                                "-U%s%%%s" % (os.environ["DC_USERNAME"],
+                                                                    os.environ["DC_PASSWORD"]))
             self.assertCmdSuccess(result, out, err, "Error running user unlock")
             self.assertEqual(err, "", "Shouldn't be any error messages")
 
diff --git a/source4/selftest/tests.py b/source4/selftest/tests.py
index 7860e150d26..aa721eb9cb3 100755
--- a/source4/selftest/tests.py
+++ b/source4/selftest/tests.py
@@ -1113,15 +1113,23 @@ for env in ["ad_dc_ntvfs", "ad_dc"]:
 
 planpythontestsuite("ad_dc_default:local", "samba.tests.samba_tool.processes")
 
-planpythontestsuite("ad_dc_ntvfs:local", "samba.tests.samba_tool.user")
-for env in ["ad_dc_default:local", "ad_dc_no_ntlm:local"]:
-    planpythontestsuite(env, "samba.tests.samba_tool.user_wdigest")
+planpythontestsuite("ad_dc_ntvfs:local",
+                    "samba.tests.samba_tool.user",
+                    environ={
+                        "CONFIGURATION": configuration,
+                    })
 for env, nt_hash in [("ad_dc:local", True),
                      ("ad_dc_no_ntlm:local", False)]:
-    planpythontestsuite(env, "samba.tests.samba_tool.user",
-                        environ={"EXPECT_NT_HASH": int(nt_hash)})
+    planpythontestsuite(env,
+                        "samba.tests.samba_tool.user",
+                        environ={
+                            "EXPECT_NT_HASH": int(nt_hash),
+                            "CONFIGURATION": configuration,
+                        })
     planpythontestsuite(env, "samba.tests.samba_tool.user_virtualCryptSHA_userPassword")
     planpythontestsuite(env, "samba.tests.samba_tool.user_virtualCryptSHA_gpg")
+for env in ["ad_dc_default:local", "ad_dc_no_ntlm:local"]:
+    planpythontestsuite(env, "samba.tests.samba_tool.user_wdigest")
 planpythontestsuite("chgdcpass:local", "samba.tests.samba_tool.user_check_password_script")
 
 planpythontestsuite("ad_dc_default:local", "samba.tests.samba_tool.group")
-- 
2.39.2


--nextPart13245307.uLZWGnKmhe
Content-Disposition: attachment; filename="samba-tool.log"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-log; charset="unicode-2-0-utf-8"; name="samba-tool.log"

[2577(16154)/2882 at 1h59m35s, 5 errors] samba.tests.samba_tool.user(ad_dc_=
ntvfs:local)
UNEXPECTED(failure): samba.tests.samba_tool.user.samba.tests.samba_tool.use=
r.UserCmdTestCase.test_setpassword(ad_dc_ntvfs:local)
REASON: Exception: Exception: Traceback (most recent call last):
  File "/builddir/build/BUILD/samba-4.18.1/bin/python/samba/tests/samba_too=
l/user.py", line 321, in test_setpassword
    self.assertMatch(out, "sAMAccountName: %s" % (user["name"]),
  File "/builddir/build/BUILD/samba-4.18.1/bin/python/samba/tests/samba_too=
l/base.py", line 107, in assertMatch
    self.assertIn(string, base, msg)
AssertionError: 'sAMAccountName: sambatool1' not found in "Wed Apr 12 16:23=
:53 2023: pid[286758]: Using cache_ldb[/builddir/build/BUILD/samba-4.18.1/s=
t/ad_dc_ntvfs/private/user-syncpasswords-cache.ldb]\nWed Apr 12 16:23:53 20=
23: pid[286758]: currentPid: 286758\nWed Apr 12 16:23:53 2023: pid[286758]:=
 Connecting to 'ldapi:///builddir/build/BUILD/samba-4.18.1/st/ad_dc_ntvfs/p=
rivate/ldap_priv/ldapi'\nWed Apr 12 16:23:53 2023: pid[286758]: Getting cha=
nges\ndirsyncFilter: (&(objectClass=3Duser)(userAccountControl:1.2.840.1135=
56.1.4.803:=3D512)(!(sAMAccountName=3Dkrbtgt*)))\ndirsyncControls: ['dirsyn=
c:1:0:0', 'extended_dn:1:0']\nsyncCommand: None\nWed Apr 12 16:23:53 2023: =
pid[286758]: dirsync_loop(): results 15\nWed Apr 12 16:23:53 2023: pid[2867=
58]: # Dirsync[0] 30f8700f-b65b-4464-9c06-787d42e1d350 S-1-5-21-3371554520-=
2303607865-1091388633-1198\ndn: <GUID=3D30f8700f-b65b-4464-9c06-787d42e1d35=
0>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1198>;CN=3Dtestuser\\0A=
DEL:30f8700f-b65b-4464-9c06-787d42e1d350,CN=3DDeleted Objects,DC=3Dsamba,DC=
=3Dexample,DC=3Dcom\nisRecycled: TRUE\nisDeleted: TRUE\nuserAccountControl:=
 512\nsAMAccountName: testuser\nobjectGUID: 30f8700f-b65b-4464-9c06-787d42e=
1d350\ninstanceType: 4\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Password=
s[0] 30f8700f-b65b-4464-9c06-787d42e1d350 S-1-5-21-3371554520-2303607865-10=
91388633-1198\ndn: CN=3Dtestuser\\0ADEL:30f8700f-b65b-4464-9c06-787d42e1d35=
0,CN=3DDeleted Objects,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID: 30f870=
0f-b65b-4464-9c06-787d42e1d350\nsAMAccountName: testuser\nisDeleted: TRUE\n=
isRecycled: TRUE\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[1] 101=
b9628-ce2e-42ff-a9c5-60ceef4285b4 S-1-5-21-3371554520-2303607865-1091388633=
=2D1109\ndn: <GUID=3D101b9628-ce2e-42ff-a9c5-60ceef4285b4>;<SID=3DS-1-5-21-=
3371554520-2303607865-1091388633-1109>;CN=3Djane,CN=3DUsers,DC=3Dsamba,DC=
=3Dexample,DC=3Dcom\nuserPrincipalName: jane.doe@SAMBA.EXAMPLE.COM\nuserAcc=
ountControl: 512\npwdLastSet: 133257831434617060\nsAMAccountName: jane\nobj=
ectGUID: 101b9628-ce2e-42ff-a9c5-60ceef4285b4\ninstanceType: 4\n# unicodePw=
d::: REDACTED SECRET ATTRIBUTE\n# supplementalCredentials::: REDACTED SECRE=
T ATTRIBUTE\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Passwords[1] 101b96=
28-ce2e-42ff-a9c5-60ceef4285b4 S-1-5-21-3371554520-2303607865-1091388633-11=
09\ndn: CN=3Djane,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID: =
101b9628-ce2e-42ff-a9c5-60ceef4285b4\nsAMAccountName: jane\nsupplementalCre=
dentials:: AAAAACAIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgA=
CAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgA=
CAAIAAgACAAUAAEADYAxAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n=
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDJBMDAyQTAwNzgwMDAw=
MDA\n wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBMjAw=
MDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDMjAwMDAwMDAw=
MDAwMDAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBEMjAwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAwMDBEQTAwMDAwMDUzMDA0MTAwNEQwMDQy=
MDA0MTAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAw=
NkEwMDYxMDA2RTAwNjUwMDVDN0Mw\n RUU1NDBBMDdBMkIwRDhFQjIxNUY4OENEMUYwRTAwNkU2=
N0UyOTYzQzdBRDQ4REY4NUNDRTNGNUYzO\n EQ5NjNGRTcxOTlEMTM4QURDOEM1MUFDOTg5Mzgy=
MEE0MjAzMzYzMjY1M0ZGMzIzMjUwMjkyMDU4M0\n RFRjZFNTg3IAAMAQEAUAByAGkAbQBhAHIA=
eQA6AEsAZQByAGIAZQByAG8AcwAwMzAwMDAwMDAyMDA\n wMDAwMkEwMDJBMDA0QzAwMDAwMDAw=
MDAwMDAwMDAwMDAwMDAwMzAwMDAwMDA4MDAwMDAwNzYwMDAw\n MDAwMDAwMDAwMDAwMDAwMDAw=
MDEwMDAwMDAwODAwMDAwMDdFMDAwMDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwND\n EwMDREMDA1MDAw=
NEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNkEwMDYxMDA2RTAwNjUwMDAzMzYzMjY\n 1M0ZGMzIz=
MjUwMjkyMDU4M0RFRjZFNTg3EACQAAIAUABhAGMAawBhAGcAZQBzADRCMDA2NTAwNzIw\n MDYy=
MDA2NTAwNzIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA3MjAwMkQwMDRCMDA2NTAwN\n=
 zkwMDczMDAwMDAwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDczMDAwMDAwNTcwMDQ0MDA=
2OT\n AwNjcwMDY1MDA3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQByAHkAOgBXAEQAaQBnAGUAcwB=
0ADMxMDA\n wMTFEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTg2NDcyREU3NkY5OTBEQTlBQjM=
1Q0QxMjk5RDFC\n NTM1NjU2MTI4MkFGMjhBNjBDRjU4RURCRTY3QkJDQjk5NzhGODgyNDkyN0U=
5ODEwRUEzQkVCOTQ5R\n kEzNDk5RDRFMTg2NDcyREU3NkY5OTBEQTlBQjM1Q0QxMjk5RDFCNTM=
1NjU2MTI4MkFGMjhBNjBDRj\n U4RURCRTY3QkJDQjk5NzEyOEI3Mzg3OTFBNzM0RUZDNEY1NTN=
GMUJBN0JFMTkxMTg2NDcyREU3NkY\n 5OTBEQTlBQjM1Q0QxMjk5RDFCNTNGRTUxMTM2ODJDMjF=
EQUM5QTY2MjBDNEVDMzFDNjM4NEZFNTEx\n MzY4MkMyMURBQzlBNjYyMEM0RUMzMUM2Mzg0NTE=
4NzhCNkQ2QzlDOUI0M0Q2Mjg5NTQyNkJFM0M4M\n DE5MjExNjlEM0FENjI2MTUyOEJBMkZFQUQ=
3NEVDNjJEMkZFNTExMzY4MkMyMURBQzlBNjYyMEM0RU\n MzMUM2Mzg0QUI3QjI4N0Q1MzQ5ODR=
GRjhGNjI3Njg2NDg4NzkxRDE5MjExNjlEM0FENjI2MTUyOEJ\n BMkZFQUQ3NEVDNjJEMjc0QkU=
1MURDQzdBNzFFMTMxRkUyRjdBNkZDQjhDRUUwNzRCRTUxRENDN0E3\n MUUxMzFGRTJGN0E2RkN=
COENFRTA5MDdBREM2ODlCMzg5MjY2QTlCRDM2RUZDNEY4NTM1NTlGRUQ2N\n TAwNjZEQTY0MDl=
GMTAwMjAyNTQwMjRCQjI1QUU1QTEzM0ZEQkM1NzM2NDVBNjZCRUU4MzFDMDFBOD\n dEOUZFN0F=
DQzdBMEI5NzZGMEYzNzVCNjMwNEUyNzRDQUQ5MzMwNjgxQzA0QTlBRkQ5MkYwMjI3NUE\n yQjA=
yMDg3RDkzMzA2ODFDMDRBOUFGRDkyRjAyMjc1QTJCMDIwODc1NjQ4NkNEMzA4MDgwNDA3MTVE\n=
 NjBDQkM4QUM4RjdFMkZDNzFENkIyNDQzRUZBNDBENThDQzkxM0RBRERFODY3RkM3MUQ2QjI0ND=
NFR\n kE0MEQ1OENDOTEzREFEREU4NjczRUU4Q0Q0MjAwRjM5NTU0MTZFQjY5Q0I4RUE0QkJCQk=
VFODI2Nj\n U0MkNFRTIzNzUzODc2Q0MyMjZDMTFBNEYwNjQyRDJDRDQ5NUJCODZGMUZFNjJEOE=
IwM0IzODAxNTd\n CNjY3NTBGOUE5RTYzQzcxOTU3RDA4RkRGMEEyMEI4NAA=3D\nunicodePwd=
:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D\n\nWed Apr 12 16:23:53 2023: pid[286758]: #=
 Dirsync[2] 2947d84c-71dd-48be-a1a5-1ac49bad7354 S-1-5-21-3371554520-230360=
7865-1091388633-1165\ndn: <GUID=3D2947d84c-71dd-48be-a1a5-1ac49bad7354>;<SI=
D=3DS-1-5-21-3371554520-2303607865-1091388633-1165>;CN=3DdsIntId_usr_33872,=
CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nsAMAccountName: dsIntId_usr_33=
872\npwdLastSet: 0\nuserAccountControl: 546\nobjectGUID: 2947d84c-71dd-48be=
=2Da1a5-1ac49bad7354\ninstanceType: 4\n\nWed Apr 12 16:23:53 2023: pid[2867=
58]: # Passwords[2] 2947d84c-71dd-48be-a1a5-1ac49bad7354 S-1-5-21-337155452=
0-2303607865-1091388633-1165\ndn: CN=3DdsIntId_usr_33872,CN=3DUsers,DC=3Dsa=
mba,DC=3Dexample,DC=3Dcom\nobjectGUID: 2947d84c-71dd-48be-a1a5-1ac49bad7354=
\nsAMAccountName: dsIntId_usr_33872\n\nWed Apr 12 16:23:53 2023: pid[286758=
]: # Dirsync[3] d2bd4f51-b914-4a33-a598-45402a4dad5b S-1-5-21-3371554520-23=
03607865-1091388633-1195\ndn: <GUID=3Dd2bd4f51-b914-4a33-a598-45402a4dad5b>=
;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1195>;CN=3DdsIntId_usr_54=
608,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nsAMAccountName: dsIntId_us=
r_54608\npwdLastSet: 0\nuserAccountControl: 546\nobjectGUID: d2bd4f51-b914-=
4a33-a598-45402a4dad5b\ninstanceType: 4\n\nWed Apr 12 16:23:53 2023: pid[28=
6758]: # Passwords[3] d2bd4f51-b914-4a33-a598-45402a4dad5b S-1-5-21-3371554=
520-2303607865-1091388633-1195\ndn: CN=3DdsIntId_usr_54608,CN=3DUsers,DC=3D=
samba,DC=3Dexample,DC=3Dcom\nobjectGUID: d2bd4f51-b914-4a33-a598-45402a4dad=
5b\nsAMAccountName: dsIntId_usr_54608\n\nWed Apr 12 16:23:53 2023: pid[2867=
58]: # Dirsync[4] a3d2b665-9c09-4153-b971-c77f47497552 S-1-5-21-3371554520-=
2303607865-1091388633-1104\ndn: <GUID=3Da3d2b665-9c09-4153-b971-c77f4749755=
2>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1104>;CN=3Dsrv_account,=
CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nuserAccountControl: 512\npwdLa=
stSet: 133257831395601120\nuserPrincipalName: srv_account@samba.example.com=
\nsAMAccountName: srv_account\nobjectGUID: a3d2b665-9c09-4153-b971-c77f4749=
7552\ninstanceType: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE\n# supplem=
entalCredentials::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:23:53 2023: =
pid[286758]: # Passwords[4] a3d2b665-9c09-4153-b971-c77f47497552 S-1-5-21-3=
371554520-2303607865-1091388633-1104\ndn: CN=3Dsrv_account,CN=3DUsers,DC=3D=
samba,DC=3Dexample,DC=3Dcom\nobjectGUID: a3d2b665-9c09-4153-b971-c77f474975=
52\nsAMAccountName: srv_account\nsupplementalCredentials:: AAAAAFgIAAAAAAAA=
IAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAA=
IAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIAAgACAAUAAEADYA4AEBAFAA=
cgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQBzADA0=
MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM4MDAzODAwNzgwMDAwMDA\n wMDEwMDAwMDAwMDAwMDAw=
MDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBCMDAwMDAwMDAw\n MDAwMDAwMDAwMDAw=
MDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDEw=
MDAwMDAzMDAwMDAwMDgwMDAwMDBFMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n AwMDAx=
MDAwMDAwMDgwMDAwMDBFODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA\n w=
NDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzMwMDcyMDA3NjAwNUYwMDYxMDA=
2\n MzAwNjMwMDZGMDA3NTAwNkUwMDc0MDA5RTEyMjhBNENDMkNEMTdGMjQ3QTdEQkFCNUVCOTA=
4MDcyO\n TFGMTBFNjE4Rjc1QzE4RTVCMDlCMTk1NTA3NEEwRDczNUIxMUU3N0QzQUFDNDVDNUI=
zMUM1QTY1OD\n Q5QkNGMEU2OEVDNzE2RDFDODdBQTA4RTZEMUJCRjdCNzU1QiAAKAEBAFAAcgB=
pAG0AYQByAHkAOgB\n LAGUAcgBiAGUAcgBvAHMAMDMwMDAwMDAwMjAwMDAwMDM4MDAzODAwNEM=
wMDAwMDAwMDAwMDAwMDAw\n MDAwMDAwMDMwMDAwMDAwODAwMDAwMDg0MDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAxMDAwMDAwMDgwM\n DAwMDA4QzAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAwMDAwMDAwMDA1MzAwND\n EwMDREMDA0MjAwNDEwMDJFMDA0NTAwNTgwMDQxMDA=
0RDAwNTAwMDRDMDA0NTAwMkUwMDQzMDA0RjA\n wNEQwMDczMDA3MjAwNzYwMDVGMDA2MTAwNjM=
wMDYzMDA2RjAwNzUwMDZFMDA3NDAwRjBFNjhFQzcx\n NkQxQzg3QUEwOEU2RDFCQkY3Qjc1NUI=
QAJAAAgBQAGEAYwBrAGEAZwBlAHMANEIwMDY1MDA3MjAwN\n jIwMDY1MDA3MjAwNkYwMDczMDA=
yRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRDAwNEIwMDY1MDA3OT\n AwNzMwMDAwMDA0QjAwNjU=
wMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA1NzAwNDQwMDY5MDA\n 2NzAwNjUwMDczMDA=
3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcAZQBzAHQAMzEwMDAx\n MUQwMDAwMDA=
wMDAwMDAwMDAwMDAwMDAwMDAyRURFMzBCMzk2Mjc2NTcxNjYwQzdCOENFM0MxMUQyM\n TM3QUR=
CODBBODBBMzBDRjNGRUM2RTEyRjdDRTFGOTJCODZBMTlEQkUyMkEzRTJENjYzRTg0NjkxND\n g=
3MkJGNTEyRURFMzBCMzk2Mjc2NTcxNjYwQzdCOENFM0MxMUQyMTM3QURCODBBODBBMzBDRjNGRU=
M\n 2RTEyRjdDRTFGOTJCQTZFQjlBREZBMkQ3NUVCNzRENTFBRkRCRDkxNkUwMzQyRURFMzBCMz=
k2Mjc2\n NTcxNjYwQzdCOENFM0MxMUQyMUU2MzA4MTZDMEE5RkJENTc3RDVFMkI5MENGOEY0Qz=
kyRTYzMDgxN\n kMwQTlGQkQ1NzdENUUyQjkwQ0Y4RjRDOTIyNzk2REQ3MTMzRkE3MURDMDQ3Q0=
Q0RkIyNTREMzUxMj\n Y4ODE4RTIyOEI1RDQ0NEQxRDdBMkQ2REQxMTA1OTdERTYzMDgxNkMwQT=
lGQkQ1NzdENUUyQjkwQ0Y\n 4RjRDOTI3QzUxQUIzMURFNEVDM0U1MDU1QzhDMDczMTdDNDhFMj=
Y4ODE4RTIyOEI1RDQ0NEQxRDdB\n MkQ2REQxMTA1OTdENERGRTNFRTg2N0M3MEQ2MThDRTJERT=
JEMkI5QjU2RDA0REZFM0VFODY3QzcwR\n DYxOENFMkRFMkQyQjlCNTZEMEJEOUQ5REY0OUU1NT=
Y2NDg2RDQ3Nzk5RjVEMTNCRDE1MzA4NzRFOT\n JBNDNFNDg5RUVEQ0U3ODAyNUUxNUFCRTNDNz=
ZEOUY4RjcwNTZFQ0IwQzg5MjVERDkzNUIxRjE2OUZ\n ERUE2OTc0QUUxNThGQzhBREI2OUJBNj=
RDQjlCRUIxNEFBQkRBMjU0QzlENjA3M0RGQTRGQzhGQzM0\n RkU5QzE0QUFCREEyNTRDOUQ2MD=
czREZBNEZDOEZDMzRGRTlDMTU2MzQyMzA1RDJBMDQ4RkVDQUJEM\n UQ2M0ZENkY5MEIxOEJDNU=
Q0RTU0QTgzOURFRENBQzdEQURBN0NGMTlERDY4QkM1RDRFNTRBODM5RE\n VEQ0FDN0RBREE3Q0=
YxOURENkM0RjcxNjA1NTkyNjgxODc0NjA5QzcyQzE1MTkzM0YxMEMyNjc4M0Z\n EMUE5NUM3OT=
BFQjM0NTgxQ0Q2OUVDQzAxRUQ1ODU5ODQ4MkE0OENGNUFBOTA3MEYxNjI2REI1Qjcx\n QkYzMD=
=46FQ0Y3NkFGMDY3RDMyOTZCNjQyMTlGNUI1AA=3D=3D\nunicodePwd:: ZlvvbVoX31GdoQm5=
Ko2Pqw=3D=3D\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[5] 88714b6=
7-4a26-48ae-b7db-c6221e1db06c S-1-5-21-3371554520-2303607865-1091388633-110=
7\ndn: <GUID=3D88714b67-4a26-48ae-b7db-c6221e1db06c>;<SID=3DS-1-5-21-337155=
4520-2303607865-1091388633-1107>;CN=3Dalice,CN=3DUsers,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom\nuserAccountControl: 512\npwdLastSet: 133257831426785520\nuser=
PrincipalName: alice@samba.example.com\nsAMAccountName: alice\nobjectGUID: =
88714b67-4a26-48ae-b7db-c6221e1db06c\ninstanceType: 4\n# unicodePwd::: REDA=
CTED SECRET ATTRIBUTE\n# supplementalCredentials::: REDACTED SECRET ATTRIBU=
TE\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Passwords[5] 88714b67-4a26-4=
8ae-b7db-c6221e1db06c S-1-5-21-3371554520-2303607865-1091388633-1107\ndn: C=
N=3Dalice,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID: 88714b67=
=2D4a26-48ae-b7db-c6221e1db06c\nsAMAccountName: alice\nsupplementalCredenti=
als:: AAAAACgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIA=
AgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIA=
AgACAAUAAEADYAyAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdw=
BlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDJDMDAyQzAwNzgwMDAwMDA\n=
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBNDAwMDAwM=
DAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDNDAwMDAwMDAwMDAwM=
DAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBENDAwMDAwMDAwMDAwMDAwMDAwM=
DAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAwMDBEQzAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0M=
TAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNjEwM=
DZDMDA2OTAwNjMwMDY1MDBD\n RjExQzg3NDA1MTIwRjM3QjBDMjYwODlGQjdCOUZFNjg4MEU2M=
jFBOTNBRDJFOTk1QjBDMzIzNDBEM\n UIwQjVFMDlBMzU0QUJGODk4MjFBRjdEMDJGRkYwRTA1N=
jNDMjU5QzdENDQ2MTVFRUM5QjA5OUE0Qj\n E0NzRBQzZDQkQzMiAAEAEBAFAAcgBpAG0AYQByA=
HkAOgBLAGUAcgBiAGUAcgBvAHMAMDMwMDAwMDA\n wMjAwMDAwMDJDMDAyQzAwNEMwMDAwMDAwM=
DAwMDAwMDAwMDAwMDAwMDMwMDAwMDAwODAwMDAwMDc4\n MDAwMDAwMDAwMDAwMDAwMDAwMDAwM=
DAxMDAwMDAwMDgwMDAwMDA4MDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDAwMDAwMDAwMDAwM=
DAwMDAwMDAwMDA1MzAwNDEwMDREMDA0MjAwNDEwMDJFMDA0NTAwNT\n gwMDQxMDA0RDAwNTAwM=
DRDMDA0NTAwMkUwMDQzMDA0RjAwNEQwMDYxMDA2QzAwNjkwMDYzMDA2NTA\n wOUM3RDQ0NjE1R=
UVDOUIwOTlBNEIxNDc0QUM2Q0JEMzIQAJAAAgBQAGEAYwBrAGEAZwBlAHMANEIw\n MDY1MDA3M=
jAwNjIwMDY1MDA3MjAwNkYwMDczMDAyRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRDAwN\n EIwM=
DY1MDA3OTAwNzMwMDAwMDA0QjAwNjUwMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA1Nz\n=
 AwNDQwMDY5MDA2NzAwNjUwMDczMDA3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcA=
ZQB\n zAHQAMzEwMDAxMUQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAyRUQ3RUU5Q0YxRkM1OUM1=
MjE2RjMy\n RUIyREQ3OThDNDgyNDZCNkU0RUQ2Q0Q2MTE0QTZBNDM2OTJCQjhDMDBGNzI5QzZF=
QUM4QjdDOERBM\n jkxRjE4QzVEQURCMUUwQjQyRUQ3RUU5Q0YxRkM1OUM1MjE2RjMyRUIyREQ3=
OThDNDgyNDZCNkU0RU\n Q2Q0Q2MTE0QTZBNDM2OTJCQjhDMDBGRURBN0JGREZBMDU1RjdENUY0=
NkFEQUJCN0RFMjQ5ODcyRUQ\n 3RUU5Q0YxRkM1OUM1MjE2RjMyRUIyREQ3OThDNENGQzNFRjdC=
OUY5OUFERkE0MkQwRTJGRjc0ODVG\n NDEzQ0ZDM0VGN0I5Rjk5QURGQTQyRDBFMkZGNzQ4NUY0=
MTM0Q0YxRENDRDUxNjQ3OTYzMzdFOEQ0N\n zhDRTVGREZERjU1NDVFMTY4MjU3QTRFRTg5MUIx=
Njk3NUY4Q0E2RDA5Q0ZDM0VGN0I5Rjk5QURGQT\n QyRDBFMkZGNzQ4NUY0MTM4NzZGOTE0NTQ2=
NDgwMjVENzAwMkRDQ0ZBNkRCNDJBMDU1NDVFMTY4MjU\n 3QTRFRTg5MUIxNjk3NUY4Q0E2RDA5=
QTE5NjU1MzlDQkE1NDlCMENDNzU1MkM2RDkwNkVENjZBMTk2\n NTUzOUNCQTU0OUIwQ0M3NTUy=
QzZEOTA2RUQ2NjY3M0MwMEUxMTY1NEY2Q0M3NkFFRTM2NTlEMkM1Q\n zNBNTU4MzMwMERGODcw=
NjQ2NjcxNTc0RjNBREY5RUI1NDM3NUIxRDczMTNEMDZCODhEMzQyRDUwQk\n U4MEI2MzY1RkNB=
NzI0Q0E5MzIwMUU0QkI1NTAzMDgyRTVDMUEzOUU4RkEwODZFNEQ5NDQzNEZDQTZ\n FNDlCMEMw=
MjhFMjAwQ0VGQTA4NkU0RDk0NDM0RkNBNkU0OUIwQzAyOEUyMDBDRTMwREYwODEyQTVG\n Mzcw=
MEQ3Njk1MjA3MTJCMjMzRUU5MkQyMkY0OEVENjREMDg4MjY2QjkxRDVDNDVFRjAzQkEyRDIyR\n=
 jQ4RUQ2NEQwODgyNjZCOTFENUM0NUVGMDNCQUM0NzE0Qzc1MUVGM0E2NEZFOEJENjcxRTJBOEY=
0OE\n M5MzgxNTkwOURFNkY4NzVFNTdBQ0M3NTdCNjJDNjFDMzc3NzlBQTlFODZGMjEzMzMxQzc=
4NjVCREI\n xM0QzQkE1NUY1MTYwNjI2MDY4QkI2NkI0RUY2OUVCRjgwQTYzNEEyAA=3D=3D\nu=
nicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D\n\nWed Apr 12 16:23:53 2023: pid[2=
86758]: # Dirsync[6] 4e0d3589-7bf0-473f-87af-78a1a3ef358a S-1-5-21-33715545=
20-2303607865-1091388633-1105\ndn: <GUID=3D4e0d3589-7bf0-473f-87af-78a1a3ef=
358a>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1105>;CN=3Dtestdenie=
d,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nuserPrincipalName: testdenie=
d_upn@SAMBA.EXAMPLE.COM.upn\nuserAccountControl: 512\npwdLastSet: 133257831=
410465880\nsAMAccountName: testdenied\nobjectGUID: 4e0d3589-7bf0-473f-87af-=
78a1a3ef358a\ninstanceType: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE\n#=
 supplementalCredentials::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:23:5=
3 2023: pid[286758]: # Passwords[6] 4e0d3589-7bf0-473f-87af-78a1a3ef358a S-=
1-5-21-3371554520-2303607865-1091388633-1105\ndn: CN=3Dtestdenied,CN=3DUser=
s,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID: 4e0d3589-7bf0-473f-87af-78a=
1a3ef358a\nsAMAccountName: testdenied\nsupplementalCredentials:: AAAAAFAIAA=
AAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIA=
AgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIAAgACAAUAAEADYA3A=
EBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQ=
BzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM2MDAzNjAwNzgwMDAwMDA\n wMDEwMDAwMDAwMD=
AwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBRTAwMDAwMDAw\n MDAwMDAwMD=
AwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDRTAwMDAwMDAwMDAwMDAwMDAwM\n DAwMD=
AwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBERTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n =
AwMDAxMDAwMDAwMDgwMDAwMDBFNjAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1O=
DA\n wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMDY1MDA3MzAwNzQwM=
DY0MDA2\n NTAwNkUwMDY5MDA2NTAwNjQwMDk2OUQxNDQ0MTYxQjQ0QkZDOEE2NUI2ODdFMTIyM=
DE5NzUzOUE1M\n jMwOEQ1NDBDNzQwNUZDRjE5MzJEMTNBRUREN0E4MUY2RURDQTg3RDZBQkRCN=
zFBMUVBRTg3NTYxQ0\n MyRDA4QTUyQUM4RTgxNENDMTZFRjk3OEVFNkFFQkYzIAAkAQEAUAByA=
GkAbQBhAHIAeQA6AEsAZQB\n yAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwMzYwMDM2MDA0Q=
zAwMDAwMDAwMDAwMDAwMDAwMDAw\n MDAwMzAwMDAwMDA4MDAwMDAwODIwMDAwMDAwMDAwMDAwM=
DAwMDAwMDAwMDEwMDAwMDAwODAwMDAwM\n DhBMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM=
DAwMDAwMDAwMDAwMDAwMDAwMDUzMDA0MTAwNE\n QwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwM=
DREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDA\n wNzQwMDY1MDA3MzAwNzQwMDY0MDA2N=
TAwNkUwMDY5MDA2NTAwNjQwMEMyRDA4QTUyQUM4RTgxNEND\n MTZFRjk3OEVFNkFFQkYzEACQA=
AIAUABhAGMAawBhAGcAZQBzADRCMDA2NTAwNzIwMDYyMDA2NTAwN\n zIwMDZGMDA3MzAwMkQwM=
DRFMDA2NTAwNzcwMDY1MDA3MjAwMkQwMDRCMDA2NTAwNzkwMDczMDAwMD\n AwNEIwMDY1MDA3M=
jAwNjIwMDY1MDA3MjAwNkYwMDczMDAwMDAwNTcwMDQ0MDA2OTAwNjcwMDY1MDA\n 3MzAwNzQwM=
B4AwAMBAFAAcgBpAG0AYQByAHkAOgBXAEQAaQBnAGUAcwB0ADMxMDAwMTFEMDAwMDAw\n MDAwM=
DAwMDAwMDAwMDAwMDAwNTc5RjEwODQ0NkNDNUQxMzIyQUFFNDkzNzdFMTI2QzBENkVEODVEO\n =
DAxMzlFNjU1NjQ2MTZBM0IyMjJFNUY5MjI4OTIxRjdCNDQ3NzdGODg2RjMzQUZEOUZFQkJFMDJF=
NT\n c5RjEwODQ0NkNDNUQxMzIyQUFFNDkzNzdFMTI2QzBENkVEODVEODAxMzlFNjU1NjQ2MTZB=
M0IyMjJ\n FNUY5MjQ4Nzk4QzU5ODc0M0FERTZCNEM3NzE1NEZCRTI1QUI5NTc5RjEwODQ0NkND=
NUQxMzIyQUFF\n NDkzNzdFMTI2QzBFMkUyMjRCMDUwRDI5NzYzQTAzQTQ4RkYxMzU0RDIwOEUy=
RTIyNEIwNTBEMjk3N\n jNBMDNBNDhGRjEzNTREMjA4QzNBN0JDRjdCMEQ3MEZCRDBDMTE3RjFF=
Q0VBOUNBNEEwRUIwMDg4MD\n NCRTFGNDQ5NkUwMENFQURFODVEM0FEREUyRTIyNEIwNTBEMjk3=
NjNBMDNBNDhGRjEzNTREMjA4MzE\n 0N0Q0NDU0QTlBNjdEOTg3MjgyRTMyNTRDRTZGRDYwRUIw=
MDg4MDNCRTFGNDQ5NkUwMENFQURFODVE\n M0FEREZEMjZERTRGOTFFNUJGMjhGNTYxNTgxRTM3=
RDI3MTQzRkQyNkRFNEY5MUU1QkYyOEY1NjE1O\n DFFMzdEMjcxNDNDQ0JCNzY3RkMxNTlDRDlE=
NDU1QUU0NDRCMTBGMEJGRUI0NEY5OTg4NjI3NzYyQz\n E0NzE2MTNDRTUzRTAwMTI5N0RCMDFF=
NDA0NDJBRjcxNjNDNDU4OTdDMzIyM0E5RjBFNEIyMUFDN0U\n 2NUZEMzQ5REMwNzhFN0YzQUFG=
ODc1OEUyMTBDNTExOUU3OUE3NEEzRTgzQkM3MzNEMDQ1OUUyRTIx\n MEM1MTE5RTc5QTc0QTNF=
ODNCQzczM0QwNDU5RTJBQzcwMkYxREJDNkNEOUUyNUU5Q0FCNkFBQUZCR\n TE5QkM3QTA2REIy=
NjI0QTZCNjM1N0M1MTkzQjZENTJGMjE5QzdBMDZEQjI2MjRBNkI2MzU3QzUxOT\n NCNkQ1MkYy=
MTk2OUIxMjZDNTY5QzA4RkZBMkM5NTdFMzE1QjU2MjdDRUMwOEMyNTU2ODhDNjhCQjI\n 5QzdD=
MzA0OUFDMzNDREVFNDM5MDUwNDYwNTJDN0U3QjlCQTg1RURDNTFEREY1MEJEM0NGRjNCQzQ0\n =
NzFDNzU3Rjc3NjUzMDgwQUQ4NTFCRAA=3D\nunicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=
=3D\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[7] 4aefe78c-1791-46=
7f-8604-f42fe8221ddd S-1-5-21-3371554520-2303607865-1091388633-1106\ndn: <G=
UID=3D4aefe78c-1791-467f-8604-f42fe8221ddd>;<SID=3DS-1-5-21-3371554520-2303=
607865-1091388633-1106>;CN=3Dtestupnspn,CN=3DUsers,DC=3Dsamba,DC=3Dexample,=
DC=3Dcom\nuserPrincipalName: http/testupnspn.samba.example.com@SAMBA.EXAMPL=
E.COM\nuserAccountControl: 512\npwdLastSet: 133257831417392190\nsAMAccountN=
ame: testupnspn\nobjectGUID: 4aefe78c-1791-467f-8604-f42fe8221ddd\ninstance=
Type: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE\n# supplementalCredentia=
ls::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:23:53 2023: pid[286758]: #=
 Passwords[7] 4aefe78c-1791-467f-8604-f42fe8221ddd S-1-5-21-3371554520-2303=
607865-1091388633-1106\ndn: CN=3Dtestupnspn,CN=3DUsers,DC=3Dsamba,DC=3Dexam=
ple,DC=3Dcom\nobjectGUID: 4aefe78c-1791-467f-8604-f42fe8221ddd\nsAMAccountN=
ame: testupnspn\nsupplementalCredentials:: AAAAAFAIAAAAAAAAIAAgACAAIAAgACAA=
IAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAA=
IAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIAAgACAAUAAEADYA3AEBAFAAcgBpAG0AYQByAHkA=
OgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAw=
MDAwMDAwMDAwMDM2MDAzNjAwNzgwMDAwMDA\n wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEw=
MDAwMDEyMDAwMDAwMjAwMDAwMDBBRTAwMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEx=
MDAwMDAwMTAwMDAwMDBDRTAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAw=
MDgwMDAwMDBERTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAw=
MDBFNjAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAw=
NEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMDY1MDA3MzAwNzQwMDc1MDA3\n MDAwNkUwMDcz=
MDA3MDAwNkUwMEFBRDFERDhCNkJFM0YzRDY2N0I4OUM5ODg2OTg0NkUxNjU2QjBDQ\n jg2NDQ5=
REY5MTMwNzJBQkFENzQwQjU0OTcxRkJFM0FBQTk4QTVCQURFOEU4MkMxODE1OTRDMzJFNj\n Y0=
REVBOTFDNUUyNEVDNDk4M0JFMkEwNkM4NDEwRENBIAAkAQEAUAByAGkAbQBhAHIAeQA6AEsAZQB=
\n yAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwMzYwMDM2MDA0QzAwMDAwMDAwMDAwMDAwMDA=
wMDAw\n MDAwMzAwMDAwMDA4MDAwMDAwODIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDA=
wODAwMDAwM\n DhBMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDUzMDA0MTAwNE\n QwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwMDREMDA1MDAwNEMwMDQ1MDA=
yRTAwNDMwMDRGMDA0RDA\n wNzQwMDY1MDA3MzAwNzQwMDc1MDA3MDAwNkUwMDczMDA3MDAwNkU=
wMDY0REVBOTFDNUUyNEVDNDk4\n M0JFMkEwNkM4NDEwRENBEACQAAIAUABhAGMAawBhAGcAZQB=
zADRCMDA2NTAwNzIwMDYyMDA2NTAwN\n zIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA=
3MjAwMkQwMDRCMDA2NTAwNzkwMDczMDAwMD\n AwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkY=
wMDczMDAwMDAwNTcwMDQ0MDA2OTAwNjcwMDY1MDA\n 3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQB=
yAHkAOgBXAEQAaQBnAGUAcwB0ADMxMDAwMTFEMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDAwRkI=
wRUQwQzVDNDg4N0Y3RDZBMjlDQThDQjQ4NDU0OTYzM0NFMjgxM\n TM2RTBFQzAyRjUwOTZEOTY=
zREI2QkYwRDREQjc1N0JBN0I1MEExMzNBMzU5NTQ5MDExMDM3RDNBRk\n IwRUQwQzVDNDg4N0Y=
3RDZBMjlDQThDQjQ4NDU0OTYzM0NFMjgxMTM2RTBFQzAyRjUwOTZEOTYzREI\n 2QkYwREUzQjM=
xNzFGNTAxN0U5QzYzOUEwNTA0NUM3Rjg2QzZGRkIwRUQwQzVDNDg4N0Y3RDZBMjlD\n QThDQjQ=
4NDU0OTY3MUU0MjNGQjdDRUUxOUIwNDEzQUNFOUFFRjcxREQwNjcxRTQyM0ZCN0NFRTE5Q\n jA=
0MTNBQ0U5QUVGNzFERDA2Mjk4RkYzMEE5Njg0NUJEOTI5Q0MxNTVCMjY3NTI4NTJDOEFENzNDM0=
\n UyNUQ3OTI2ODA3NjU5MTdCNkZGM0JDRjcxRTQyM0ZCN0NFRTE5QjA0MTNBQ0U5QUVGNzFERD=
A2RTQ\n 3NTIyMTc2RkNCMjAwODU3NTEyNUJFMDU3MTFDNjhDOEFENzNDM0UyNUQ3OTI2ODA3Nj=
U5MTdCNkZG\n M0JDRjFENDY5MkEyQkE2RUZCMTQyQTcyQjU3MDhDNDYxOTE1MUQ0NjkyQTJCQT=
ZFRkIxNDJBNzJCN\n TcwOEM0NjE5MTVFNjhDRjBCNjFBOUMzOTkxODg4NjQyN0REQkRGNzg1NU=
RDMThBRTdDNTE5OTc3Nz\n Y5MzI3RTM1MDg1NDg3RUNGMUM2QTRCNzYyNUE5ODg5RDhGMUNEQz=
hFRjVGRTU0MEYzMkI0RjQ3RTU\n 0QzdGRDkxRTkyMEY2NDI0OTNDRkEzMzRBQjI2MkYyM0EyM0=
Q5OUUyNDhDRjMxOUU3MTI3NjY4NEFC\n MjYyRjIzQTIzRDk5RTI0OENGMzE5RTcxMjc2NjhENj=
lBMjNEN0I0RkNGRDU4OEM1NjFGQUQwNEIwR\n DhCQURDODE0MzVDQUNBQzQ3NjRFNTE3NjZCMT=
g5OTg4NDBDREM4MTQzNUNBQ0FDNDc2NEU1MTc2Nk\n IxODk5ODg0MENFRTU1NDY2MTlDMzY1OU=
Q4MEI0QjlDNTlEODlFMEVBMjVFRkFBNjBDNEZDQjJBNzN\n FMTlBQTkzRTE1QjZDMDZDRUM3QT=
gyRTY2QTU0QUE0OTRBMkNBMjNGQjMwNTlCNUQ5RkIzMzc4RDJG\n RjQwNkE5OUJCN0U0ODBDOT=
E2RDEwNAA=3D\nunicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D\n\nWed Apr 12 16:23=
:53 2023: pid[286758]: # Dirsync[8] 6ce0468d-2249-4b19-b672-7f3795bbab4d S-=
1-5-21-3371554520-2303607865-1091388633-1196\ndn: <GUID=3D6ce0468d-2249-4b1=
9-b672-7f3795bbab4d>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1196>=
;CN=3Dtestuser\\0ADEL:6ce0468d-2249-4b19-b672-7f3795bbab4d,CN=3DDeleted Obj=
ects,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nisRecycled: TRUE\nisDeleted: TRUE\nu=
serAccountControl: 512\nsAMAccountName: testuser\nobjectGUID: 6ce0468d-2249=
=2D4b19-b672-7f3795bbab4d\ninstanceType: 4\n\nWed Apr 12 16:23:53 2023: pid=
[286758]: # Passwords[8] 6ce0468d-2249-4b19-b672-7f3795bbab4d S-1-5-21-3371=
554520-2303607865-1091388633-1196\ndn: CN=3Dtestuser\\0ADEL:6ce0468d-2249-4=
b19-b672-7f3795bbab4d,CN=3DDeleted Objects,DC=3Dsamba,DC=3Dexample,DC=3Dcom=
\nobjectGUID: 6ce0468d-2249-4b19-b672-7f3795bbab4d\nsAMAccountName: testuse=
r\nisDeleted: TRUE\nisRecycled: TRUE\n\nWed Apr 12 16:23:53 2023: pid[28675=
8]: # Dirsync[9] 791dc491-c001-49e4-b06b-7353512a54bd S-1-5-21-3371554520-2=
303607865-1091388633-1103\ndn: <GUID=3D791dc491-c001-49e4-b06b-7353512a54bd=
>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1103>;CN=3Dtestallowed,C=
N=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nuserPrincipalName: testallowed =
upn@SAMBA.EXAMPLE.COM\nsAMAccountName: testallowed account\nuserAccountCont=
rol: 512\npwdLastSet: 133257831391462340\nobjectGUID: 791dc491-c001-49e4-b0=
6b-7353512a54bd\ninstanceType: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE=
\n# supplementalCredentials::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:2=
3:53 2023: pid[286758]: # Passwords[9] 791dc491-c001-49e4-b06b-7353512a54bd=
 S-1-5-21-3371554520-2303607865-1091388633-1103\ndn: CN=3Dtestallowed,CN=3D=
Users,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID: 791dc491-c001-49e4-b06b=
=2D7353512a54bd\nsAMAccountName: testallowed account\nsupplementalCredentia=
ls:: AAAAAFgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIAA=
gACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIAA=
gACAAUAAEADYA4AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwB=
lAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM4MDAzODAwNzgwMDAwMDA\n =
wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBCMDAwMDAwMD=
Aw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBEMDAwMDAwMDAwMDAwMD=
AwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBFMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAwMDBFODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MT=
AwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMD=
Y1MDA3MzAwNzQwMDYxMDA2\n QzAwNkMwMDZGMDA3NzAwNjUwMDY0MDAyNTFEQUU0ODBFRDAwOD=
A2MTE5QTVGNzNCOEU3OUZENEQ5N\n kU4OEM3OTdDMjYxMUQ0QTY2MDg2QTc3RjlCQTcwQkM3RT=
Q3QUE1RkVCQTk2MzYyODk3REM5RkEwNE\n ZENTQyOTQ5OUM4MkIzNEVEODdFNEY3M0IxQTcxQT=
M5NkM4MCAAKAEBAFAAcgBpAG0AYQByAHkAOgB\n LAGUAcgBiAGUAcgBvAHMAMDMwMDAwMDAwMj=
AwMDAwMDM4MDAzODAwNEMwMDAwMDAwMDAwMDAwMDAw\n MDAwMDAwMDMwMDAwMDAwODAwMDAwMD=
g0MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAxMDAwMDAwMDgwM\n DAwMDA4QzAwMDAwMDAwMDAwMD=
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA1MzAwND\n EwMDREMDA0MjAwNDEwMD=
JFMDA0NTAwNTgwMDQxMDA0RDAwNTAwMDRDMDA0NTAwMkUwMDQzMDA0RjA\n wNEQwMDc0MDA2NT=
AwNzMwMDc0MDA2MTAwNkMwMDZDMDA2RjAwNzcwMDY1MDA2NDAwMjk0OTlDODJC\n MzRFRDg3RT=
RGNzNCMUE3MUEzOTZDODAQAJAAAgBQAGEAYwBrAGEAZwBlAHMANEIwMDY1MDA3MjAwN\n jIwMD=
Y1MDA3MjAwNkYwMDczMDAyRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRDAwNEIwMDY1MDA3OT\n =
AwNzMwMDAwMDA0QjAwNjUwMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA1NzAwNDQwMDY5M=
DA\n 2NzAwNjUwMDczMDA3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcAZQBzAHQAM=
zEwMDAx\n MUQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDBFNEI1MzNBRjQzQ0U4MjM3OTAxMTlDM=
zcyMzU4OEE0R\n kNDMjhCMjZFN0E1QjBGNzUyQUFGNjQ3MDY4QjI5Rjk1MTc1QzZDNzhDNkY5N=
jc4MkM2OUVBMzVCOE\n IzRjNGMThFNEI1MzNBRjQzQ0U4MjM3OTAxMTlDMzcyMzU4OEE0RkNDM=
jhCMjZFN0E1QjBGNzUyQUF\n GNjQ3MDY4QjI5Rjk1NDRCQ0VDQTJBODlENEJEMTY2MzdDNzk4Q=
jMzODYzMjFFNEI1MzNBRjQzQ0U4\n MjM3OTAxMTlDMzcyMzU4OEE0RjU1NkNBMDQyMzI3RTI2R=
EZERDI0MzhGRTlBQjdCMTc4NTU2Q0EwN\n DIzMjdFMjZERkREMjQzOEZFOUFCN0IxNzgxMjg0Q=
kU1Qzk2ODU2QTgwRjAzMzE4MTdFOTYzNDhCNj\n Y1NDAzN0I3OTI4QzRGQUY5NEM1NTBCRUExR=
DhBNTRGNTU2Q0EwNDIzMjdFMjZERkREMjQzOEZFOUF\n CN0IxNzhGQjY4NkI4RTNGOUVBNjhBN=
jIyODJERTM3RkNGQzlEODY1NDAzN0I3OTI4QzRGQUY5NEM1\n NTBCRUExRDhBNTRGOTFENjJBO=
DkwMkY1REZGRUE4OTUxMUMyREY0MjZGMDg5MUQ2MkE4OTAyRjVER\n kZFQTg5NTExQzJERjQyN=
kYwOEMzMjBDOUU4NTU3RkRDNkNGQUNFRDIyQ0Y1QjRGODNEQ0E5MDMxRk\n Q5NTc4NDRBMzkwQ=
jI4M0REMjZDNDkxRkQ3NTQ3RDBEMTU3M0UyNDQ3NkVEMUNFMDFCQkNCOTYxQTQ\n 4QjY5RDFBM=
TM5NkZBMjMyMkNEOEMzRDQ3QkU0RTlGQTQyMDVFMjJDOUJCQTRBNDQ0MTFFMUUwQTY4\n MjQyO=
DJBNDIwNUUyMkM5QkJBNEE0NDQxMUUxRTBBNjgyNDI4MjIxQTE1OURGQzY3NkIxMjIzNzMxQ\n =
jhEMkIzODhDMEVDQjlFQTY3RDI3MzgyQzczMDVDRDIzQzY2NURGQkNGNDFCOUVBNjdEMjczODJD=
Nz\n MwNUNEMjNDNjY1REZCQ0Y0MTI3RTIxMUJFNjRGMjM5MzMzRUY0Qzk3N0U4MzMwOEU3QzA1=
RjNEQTI\n zOTkzMzlFQzNENzBGQ0E1RDEzREE1RkZGNEVCNUM4NTFBNTNCMDEzMzE5OUY1MDY5=
OUFERTE5QkI4\n NDJGODRBNTNEMDFGMjAyMTFGMEJFNkNGQkM5MjEzAA=3D=3D\nunicodePwd=
:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D\n\nWed Apr 12 16:23:53 2023: pid[286758]: #=
 Dirsync[10] 89c5dd97-2ff3-467c-bd3d-6e1270f93e4b S-1-5-21-3371554520-23036=
07865-1091388633-1180\ndn: <GUID=3D89c5dd97-2ff3-467c-bd3d-6e1270f93e4b>;<S=
ID=3DS-1-5-21-3371554520-2303607865-1091388633-1180>;CN=3DdsIntId_usr_9024,=
CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nsAMAccountName: dsIntId_usr_90=
24\npwdLastSet: 0\nuserAccountControl: 546\nobjectGUID: 89c5dd97-2ff3-467c-=
bd3d-6e1270f93e4b\ninstanceType: 4\n\nWed Apr 12 16:23:53 2023: pid[286758]=
: # Passwords[10] 89c5dd97-2ff3-467c-bd3d-6e1270f93e4b S-1-5-21-3371554520-=
2303607865-1091388633-1180\ndn: CN=3DdsIntId_usr_9024,CN=3DUsers,DC=3Dsamba=
,DC=3Dexample,DC=3Dcom\nobjectGUID: 89c5dd97-2ff3-467c-bd3d-6e1270f93e4b\ns=
AMAccountName: dsIntId_usr_9024\n\nWed Apr 12 16:23:53 2023: pid[286758]: #=
 Dirsync[11] 08d7fdbc-e6d0-4f42-94db-af1a35534425 S-1-5-21-3371554520-23036=
07865-1091388633-501\ndn: <GUID=3D08d7fdbc-e6d0-4f42-94db-af1a35534425>;<SI=
D=3DS-1-5-21-3371554520-2303607865-1091388633-501>;CN=3DGuest,CN=3DUsers,DC=
=3Dsamba,DC=3Dexample,DC=3Dcom\nsAMAccountName: Guest\npwdLastSet: 0\nuserA=
ccountControl: 66082\nobjectGUID: 08d7fdbc-e6d0-4f42-94db-af1a35534425\nins=
tanceType: 4\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Passwords[11] 08d7=
fdbc-e6d0-4f42-94db-af1a35534425 S-1-5-21-3371554520-2303607865-1091388633-=
501\ndn: CN=3DGuest,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobjectGUID=
: 08d7fdbc-e6d0-4f42-94db-af1a35534425\nsAMAccountName: Guest\n\nWed Apr 12=
 16:23:53 2023: pid[286758]: # Dirsync[12] df97b8fb-0ffa-4fab-9fc0-047a12c5=
e5c7 S-1-5-21-3371554520-2303607865-1091388633-1110\ndn: <GUID=3Ddf97b8fb-0=
ffa-4fab-9fc0-047a12c5e5c7>;<SID=3DS-1-5-21-3371554520-2303607865-109138863=
3-1110>;CN=3Djoe,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nuserAccountCo=
ntrol: 512\npwdLastSet: 133257831438593670\nuserPrincipalName: joe@samba.ex=
ample.com\nsAMAccountName: joe\nobjectGUID: df97b8fb-0ffa-4fab-9fc0-047a12c=
5e5c7\ninstanceType: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE\n# supple=
mentalCredentials::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:23:53 2023:=
 pid[286758]: # Passwords[12] df97b8fb-0ffa-4fab-9fc0-047a12c5e5c7 S-1-5-21=
=2D3371554520-2303607865-1091388633-1110\ndn: CN=3Djoe,CN=3DUsers,DC=3Dsamb=
a,DC=3Dexample,DC=3Dcom\nobjectGUID: df97b8fb-0ffa-4fab-9fc0-047a12c5e5c7\n=
sAMAccountName: joe\nsupplementalCredentials:: AAAAABgIAAAAAAAAIAAgACAAIAAg=
ACAAIAAgACAAIAAgACAAIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg=
ACAAIAAgACAAIAAgACAAIAAgACAAI\n AAgACAAIAAgACAAUAAEADYAwAEBAFAAcgBpAG0AYQBy=
AHkAOgBLAGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQw=
MDAwMDAwMDAwMDAwMDI4MDAyODAwNzgwMDAwMDA\n wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAw=
MDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBMDAwMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAw=
MDExMDAwMDAwMTAwMDAwMDBDMDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAw=
MDAwMDgwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgw=
MDAwMDBEODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1=
MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNkEwMDZGMDA2NTAwN0UyNzAxQTAw\n NEFFNzcy=
Q0M5MzFFNTRGRkMwNDhGNTVGNDVEQjg2QzE5N0EzRTk0NjQ4NzlEMjFDMUFCNUI5RDJCR\n EYy=
NEJGNzgwRTFGMjhEOUYwNDhEQzlFNEQ4QUE4MEUwMDY1RDQ1RjFEQjg1NDQ4OTkzQjc3NkE5Qk\=
n NERDMgAAgBAQBQAHIAaQBtAGEAcgB5ADoASwBlAHIAYgBlAHIAbwBzADAzMDAwMDAwMDIwMDA=
wMDA\n yODAwMjgwMDRDMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDAwMDAwMDgwMDAwMDA3NDA=
wMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMTAwMDAwMDA4MDAwMDAwN0MwMDAwMDAwMDAwMDAwMDA=
wMDAwMDAwMDAwM\n DAwMDAwMDAwMDAwMDAwMDAwMDAwNTMwMDQxMDA0RDAwNDIwMDQxMDAyRTA=
wNDUwMDU4MDA0MTAwNE\n QwMDUwMDA0QzAwNDUwMDJFMDA0MzAwNEYwMDREMDA2QTAwNkYwMDY=
1MDAwRTAwNjVENDVGMURCODU\n 0NDg5OTNCNzc2QTlCQ0REMxAAkAACAFAAYQBjAGsAYQBnAGU=
AcwA0QjAwNjUwMDcyMDA2MjAwNjUw\n MDcyMDA2RjAwNzMwMDJEMDA0RTAwNjUwMDc3MDA2NTA=
wNzIwMDJEMDA0QjAwNjUwMDc5MDA3MzAwM\n DAwMDRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZ=
GMDA3MzAwMDAwMDU3MDA0NDAwNjkwMDY3MDA2NT\n AwNzMwMDc0MDAeAMADAQBQAHIAaQBtAGE=
AcgB5ADoAVwBEAGkAZwBlAHMAdAAzMTAwMDExRDAwMDA\n wMDAwMDAwMDAwMDAwMDAwMDAwMDc=
2RTlCRDY5QTFEOUJEMjc0QkFBQjFEMzdEM0QxMDY5QTdDNDA0\n QTdFNzY2QUZCNjUzMTUyQ0E=
1Q0MxQTBGNzNBRjA0QjBBQTVGNzdEOEY3MDY2MzhDQkFERjNCRDlDO\n Dc2RTlCRDY5QTFEOUJ=
EMjc0QkFBQjFEMzdEM0QxMDY5QTdDNDA0QTdFNzY2QUZCNjUzMTUyQ0E1Q0\n MxQTBGNzMwMkJ=
ERjg4NDg5QzVGMjZDM0QzREMwMDhGODg4Q0NCRjc2RTlCRDY5QTFEOUJEMjc0QkF\n BQjFEMzd=
EM0QxMDY5N0FDQkNDMDdBMEVDNzY0OEE2RTA5RjVEMzNFRUI5QkI3QUNCQ0MwN0EwRUM3\n NjQ=
4QTZFMDlGNUQzM0VFQjlCQjVFQTMxNTAxQzFGMUYyNUJCMUY1MkU1REU5NjBEMUU0MkJFMjI0M\=
n 0VBNENCMDg2MEY1MDI4NTgxODkwQUVBODg3QUNCQ0MwN0EwRUM3NjQ4QTZFMDlGNUQzM0VFQj=
lCQj\n M1QzRCQTkwMzYwOUQ2NUM2NkVDOUZFMEYxRTM5NDhDMkJFMjI0M0VBNENCMDg2MEY1MD=
I4NTgxODk\n wQUVBODg5RThCODU3N0NDNkQ4RTVCMjY4REM4OTUzMzM4NzM2QTlFOEI4NTc3Q0=
M2RDhFNUIyNjhE\n Qzg5NTMzMzg3MzZBMDQ4M0NGNTJGMDFDOURDNzlBNTgxRTUzQzFDODFCNU=
NBNjA2QjNCOEU2RUMyN\n kM2REU2REQ4RjI1MzA3MkQzMTdFNEU1NEM0MDkyNzBEMEE0NTlENk=
RBMUM1QzhDNDBCQkYxQzI2Mj\n YyQTEwRUZCQkYxMTk4Nzk4OEQ2MUZDRDZCRUZBNDA0OURBN0=
ZFQzUyNTczQzIxNTRBRTM1NzQxOEJ\n FRkE0MDQ5REE3RkVDNTI1NzNDMjE1NEFFMzU3NDE4QU=
VDQjE4NDVCRjYyMDIzMjBBN0Q5NTI1OTI2\n QUQ2Nzg4NDU5MTkyRDJFMjkzMEY1MjM3REU1Qj=
RDMDc0M0E5Qzg0NTkxOTJEMkUyOTMwRjUyMzdER\n TVCNEMwNzQzQTlDOTk2QjdGMkI3NjVDRU=
EwODgxMDk4MEVDOUJERjgwNzUyQjlFN0U3NzVDMUIyRT\n U3Q0I0QzYxQTNFNUZGOTUxMzQ1ND=
Y3Q0MwMzcxRTNDOTE2RjMwRTE0NDE3NTkxQzY3Nzc2M0I5MEU\n yM0NGNzIzMjFFRjNFMTQ0Mz=
E3ODkzODkA\nunicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D\n\nWed Apr 12 16:23:5=
3 2023: pid[286758]: # Dirsync[13] fc01dbfc-ae63-4b7c-af1d-5ba580e595bd S-1=
=2D5-21-3371554520-2303607865-1091388633-1108\ndn: <GUID=3Dfc01dbfc-ae63-4b=
7c-af1d-5ba580e595bd>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-1108=
>;CN=3Dbob,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nuserAccountControl:=
 512\npwdLastSet: 133257831430630300\nuserPrincipalName: bob@samba.example.=
com\nsAMAccountName: bob\nobjectGUID: fc01dbfc-ae63-4b7c-af1d-5ba580e595bd\=
ninstanceType: 4\n# unicodePwd::: REDACTED SECRET ATTRIBUTE\n# supplemental=
Credentials::: REDACTED SECRET ATTRIBUTE\n\nWed Apr 12 16:23:53 2023: pid[2=
86758]: # Passwords[13] fc01dbfc-ae63-4b7c-af1d-5ba580e595bd S-1-5-21-33715=
54520-2303607865-1091388633-1108\ndn: CN=3Dbob,CN=3DUsers,DC=3Dsamba,DC=3De=
xample,DC=3Dcom\nobjectGUID: fc01dbfc-ae63-4b7c-af1d-5ba580e595bd\nsAMAccou=
ntName: bob\nsupplementalCredentials:: AAAAABgIAAAAAAAAIAAgACAAIAAgACAAIAAg=
ACAAIAAgACAAIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAg=
ACAAIAAgACAAIAAgACAAI\n AAgACAAIAAgACAAUAAEADYAwAEBAFAAcgBpAG0AYQByAHkAOgBL=
AGUAcgBiAGUAcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAw=
MDAwMDAwMDI4MDAyODAwNzgwMDAwMDA\n wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAw=
MDEyMDAwMDAwMjAwMDAwMDBBMDAwMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAw=
MDAwMTAwMDAwMDBDMDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgw=
MDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAwMDBE=
ODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAwNEMw=
MDQ1MDAyRTAwNDMwMDRGMDA0RDAwNjIwMDZGMDA2MjAwM0MyMzA0MERF\n MUU3RUU0NDI3NjJF=
MzdDMkNERjYzRjgxQzAyQkQ4NUFEMUM2MEJGN0RFQUVGRjQyODM2NjJFOTMxR\n jZERjM4ODQ5=
OEQwRTQ2NEM2MThDN0NGMDkzREM2NzI0OTAzMjA4MEI5ODUzNzYwMkExNDNDNjdFRD\n BFM0Mg=
AAgBAQBQAHIAaQBtAGEAcgB5ADoASwBlAHIAYgBlAHIAbwBzADAzMDAwMDAwMDIwMDAwMDA\n y=
ODAwMjgwMDRDMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDAwMDAwMDgwMDAwMDA3NDAwMDAwMDA=
w\n MDAwMDAwMDAwMDAwMDAwMTAwMDAwMDA4MDAwMDAwN0MwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMDAwM\n DAwMDAwMDAwMDAwMDAwMDAwMDAwNTMwMDQxMDA0RDAwNDIwMDQxMDAyRTAwNDUwMDU=
4MDA0MTAwNE\n QwMDUwMDA0QzAwNDUwMDJFMDA0MzAwNEYwMDREMDA2MjAwNkYwMDYyMDA3MjQ=
5MDMyMDgwQjk4NTM\n 3NjAyQTE0M0M2N0VEMEUzQxAAkAACAFAAYQBjAGsAYQBnAGUAcwA0QjA=
wNjUwMDcyMDA2MjAwNjUw\n MDcyMDA2RjAwNzMwMDJEMDA0RTAwNjUwMDc3MDA2NTAwNzIwMDJ=
EMDA0QjAwNjUwMDc5MDA3MzAwM\n DAwMDRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZGMDA3MzA=
wMDAwMDU3MDA0NDAwNjkwMDY3MDA2NT\n AwNzMwMDc0MDAeAMADAQBQAHIAaQBtAGEAcgB5ADo=
AVwBEAGkAZwBlAHMAdAAzMTAwMDExRDAwMDA\n wMDAwMDAwMDAwMDAwMDAwMDAwMEQ2NzlCOTk=
xNzY4NTFGQkU1RDkxQkQwNENCNjdFNTVEQjdBRjhF\n MDQ4MEZFRDZCM0NFQUJDREFCRDBGNkN=
=46N0I5NjYzOEVFNUVBQTg0NTlCNDhDNzQzQjREMzk4QkUzM\n UQ2NzlCOTkxNzY4NTFGQkU1R=
DkxQkQwNENCNjdFNTVEQjdBRjhFMDQ4MEZFRDZCM0NFQUJDREFCRD\n BGNkNFN0JCRUU4QUQ3Q=
UY1REQxRUFGMzkxREQ4ODZGQjc1MTIzMkQ2NzlCOTkxNzY4NTFGQkU1RDk\n xQkQwNENCNjdFN=
TVEMUEwRkEyREVGRDM2MzIzRDI3NTkyMEYxRkYzQTNBOUMxQTBGQTJERUZEMzYz\n MjNEMjc1O=
TIwRjFGRjNBM0E5QzI0REE4MDQyQ0Q1RThDNjEzN0Y1QTZCRjJEN0RFODI2MTA4MUM4M\n UQwR=
jlCOTgwMzlBNDk1QzA4OTlGM0IzRDUxQTBGQTJERUZEMzYzMjNEMjc1OTIwRjFGRjNBM0E5Qz\n=
 UzODE0OTA2MjBDNzk0QkUxQjY2NUJBMDM5OTM3M0Y0MTA4MUM4MUQwRjlCOTgwMzlBNDk1QzA4=
OTl\n GM0IzRDU2NEZCNEQ3MURDQUUxNTVFM0ZCMDRDN0VENkU4RTQ3MTY0RkI0RDcxRENBRTE1=
NUUzRkIw\n NEM3RUQ2RThFNDcxQjE0NUY1RTgzOUYwNURBRjJFODFCREQ5RTJDQ0VCRDgzNDEw=
QUE4N0REMEVCQ\n 0EyNzFBNDNDNkJDNUIyMDdDNDY0RkJCQ0ExQkQ0MTlBMkMxMDkwQUU4RDJC=
N0IyMEZGQUI4OTQ4Qz\n E2RTUxREQ4QkIyMkUyMDNDQzNGQUU3MEUwOTA2MEQ2MDc2NkYyQzRD=
QUFCNzVDMzBCNjUzMTM0MTA\n 5MDYwRDYwNzY2RjJDNENBQUI3NUMzMEI2NTMxMzQxM0Q4QzY2=
QzRBQjNBQzNDOTg5NzE5NEUzMzMw\n OEQzOEMwN0NFMEExOEE3NjUzRjQ1NDc4OTBFQTU0MzM4=
RDVCQTA3Q0UwQTE4QTc2NTNGNDU0Nzg5M\n EVBNTQzMzhENUJBNjYzN0FEQjYwMEM4NzIxQjc0=
RDgwODkxOUZBMkJGNEM1OEIwRTM0OERENEM3Qj\n VERjI5OTc0ODE2NjBFOTY0NjJFNjhBMzA1=
QUU0NDA4M0RGMzdCNTIzOEY0QzM3Q0VCMDJCQkZDODk\n 3MzgzNEU4MTNGMkI0ODM4QUE5NUZC=
QjYA\nunicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D\n\nWed Apr 12 16:23:53 2023=
: pid[286758]: # Dirsync[14] 85c452fd-f364-494f-ae80-efdb74563568 S-1-5-21-=
3371554520-2303607865-1091388633-500\ndn: <GUID=3D85c452fd-f364-494f-ae80-e=
fdb74563568>;<SID=3DS-1-5-21-3371554520-2303607865-1091388633-500>;CN=3DAdm=
inistrator,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nsAMAccountName: Adm=
inistrator\npwdLastSet: 133257831371919200\nuserAccountControl: 512\nobject=
GUID: 85c452fd-f364-494f-ae80-efdb74563568\ninstanceType: 4\n# unicodePwd::=
: REDACTED SECRET ATTRIBUTE\n# supplementalCredentials::: REDACTED SECRET A=
TTRIBUTE\n\nWed Apr 12 16:23:53 2023: pid[286758]: # Passwords[14] 85c452fd=
=2Df364-494f-ae80-efdb74563568 S-1-5-21-3371554520-2303607865-1091388633-50=
0\ndn: CN=3DAdministrator,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom\nobje=
ctGUID: 85c452fd-f364-494f-ae80-efdb74563568\nsAMAccountName: Administrator=
\nsupplementalCredentials:: AAAAAGgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACA=
AIAAg\n ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACA=
AIAAgACAAI\n AAgACAAIAAgACAAUAAEADYA6AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGU=
AcgBvAHMALQBOAG\n UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDN=
DMDAzQzAwNzgwMDAwMDA\n wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDA=
wMjAwMDAwMDBCNDAwMDAwMDAw\n MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDA=
wMDBENDAwMDAwMDAwMDAwMDAwMDAwM\n DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBFNDA=
wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMD\n AwMDAxMDAwMDAwMDgwMDAwMDBFQzAwMDAwMDU=
zMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA\n wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTA=
wNDMwMDRGMDA0RDAwNDEwMDY0MDA2RDAwNjkwMDZFMDA2\n OTAwNzMwMDc0MDA3MjAwNjEwMDc=
0MDA2RjAwNzIwMDU1QjlFRTg1RDU5MTU4NzAxQTNBMDgxODREM\n UNGOTYyRjI4NjJFQTFBNUZ=
BRUUxQTM2NzYyNjFEMTNDNzhGMUUxNTFGQURBMUQzRTM2OTY4M0Y4Mj\n U3ODU1RDU3QzJBNTU=
xQjNBRUIwNTg1QkIxMEJDRDkxRjQwQzIxMkFBMzRDIAAwAQEAUAByAGkAbQB\n hAHIAeQA6AEs=
AZQByAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwM0MwMDNDMDA0QzAwMDAwMDAw\n MDAwMDA=
wMDAwMDAwMDAwMzAwMDAwMDA4MDAwMDAwODgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwM\n DA=
wMDAwODAwMDAwMDkwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
\n AwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwMDREMDA1MDAwNEMwMDQ1MD=
AyRTA\n wNDMwMDRGMDA0RDAwNDEwMDY0MDA2RDAwNjkwMDZFMDA2OTAwNzMwMDc0MDA3MjAwNj=
EwMDc0MDA2\n RjAwNzIwMDUxQjNBRUIwNTg1QkIxMEJDRDkxRjQwQzIxMkFBMzRDEACQAAIAUA=
BhAGMAawBhAGcAZ\n QBzADRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZGMDA3MzAwMkQwMDRFMD=
A2NTAwNzcwMDY1MDA3Mj\n AwMkQwMDRCMDA2NTAwNzkwMDczMDAwMDAwNEIwMDY1MDA3MjAwNj=
IwMDY1MDA3MjAwNkYwMDczMDA\n wMDAwNTcwMDQ0MDA2OTAwNjcwMDY1MDA3MzAwNzQwMB4AwA=
MBAFAAcgBpAG0AYQByAHkAOgBXAEQA\n aQBnAGUAcwB0ADMxMDAwMTFEMDAwMDAwMDAwMDAwMD=
AwMDAwMDAwMDAwRTQ1MDlENjBEQ0Q2REZCM\n Tk5QTA2OUI1ODVFMjk3QjBFNEU4MDM3OEFEMT=
A4RUI3RDVCQjlEMDYwQzBFRUVEQTlDRDM4RkE5N0\n YwREVCRjZEQjE5MTQwOEZCMEE0Njk4RT=
Q1MDlENjBEQ0Q2REZCMTk5QTA2OUI1ODVFMjk3QjA4NjY\n 4QkRCNUIzODg4NTNGOTQ3NDkyNE=
Y0M0ZGMzBGNDQwRURCRDVFNzFFNDI4OEIzRUZGMkVBREFEMkI3\n MDEzQUUxMDg0NDI5QkE3OE=
U1MEZGMjEwMUZBREMxMDBCNTNFNUNBQTlBMjlDNTc5QTg4RTdEQzRGM\n DdENjhDNDMxNEVGMj=
c2NUQ3MTk1RUI5NTU5NTY5OUQ4OUYwNEVCOTQ0OTU0OTE3OTlBNzM0QTVBOD\n UyQUFGNzNBRD=
k3RDJGQ0NERDJDQjFDMkVEMUY4NDU2NTY5NDk5NUY2Q0Y2NzZBMkU1Q0FBOUEyOUM\n 1NzlBOD=
hFN0RDNEYwN0Q2OEM0MzE0RjhDRjBBNjhGRkJBMjA5NzIzODQwMTAwODQxMTA4NkE1RDhE\n Mz=
E1OTFGRjdERDNCMEQ3RTcwM0I5MkY1QjQzRTYwQTE3NkY4NkE5MDQzMkI3MkNGMzc4NDVBQUU1N=
\n 0U1RjdFNEVGMkQ4QzFCQjc0MEI4NjQxNERFNENCMzZDQTQ5ODhGNTQzMTRDNTlGQTc5M0RBQ=
Tg4Nk\n Y1MkZDQzAyQTZBODA5Nzc2NUQzMjEyNDNGOEIxQkYwMzRBQTI2RjRCNzg2MEVCRjM2O=
DQ3OTExMUY\n 0M0ZDMkU1RUJFM0JDRkZBNzdEQzk3REEyQUNCNDg0NTYyMEM4N0JDRTE2MEJBN=
0UxMjkxRUNDMDg3\n RUJBOEM4NUJDQ0I3ODM1RkU2MkVFOEUwNEEwQTc0MDhDQ0EzMUZFQ0Y3R=
UE0NDIyOEIyQkY1RUI4O\n TBENkIwRDg4MDc1RDM4RURGMUM3OTRGNTA4MTQ3RENDMTE1QUY0N=
DMwMDk3QzM5Q0FCRDEzQkMzM0\n IzRDMxNUJFMUVGNDY4RUFERDQyMjNCQ0IzREEwMkM5RkJGM=
UNEMTg0RDU1RUM4NzVERjk3RTEwMkM\n 1MzgzREU0NEU0OEJCMzA5MTRBN0JERDg3MjkzMjI3N=
TNCQ0Q5NkJCOUM2NTM3RUI3NTg4NzFGQ0M4\n RjBFMUI5MkU4MjRCMUEwQzI1NTYxNkFEQjM2M=
jA3OTU0OTk0OTFCQkU2OTUwNAA=3D\nunicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D\n\=
nWed Apr 12 16:23:53 2023: pid[286758]: dirsync_loop(): results 0\n" : sync=
passwords --no-wait: 'sAMAccountName': sambatool1 out[Wed Apr 12 16:23:53 2=
023: pid[286758]: Using cache_ldb[/builddir/build/BUILD/samba-4.18.1/st/ad_=
dc_ntvfs/private/user-syncpasswords-cache.ldb]
Wed Apr 12 16:23:53 2023: pid[286758]: currentPid: 286758
Wed Apr 12 16:23:53 2023: pid[286758]: Connecting to 'ldapi:///builddir/bui=
ld/BUILD/samba-4.18.1/st/ad_dc_ntvfs/private/ldap_priv/ldapi'
Wed Apr 12 16:23:53 2023: pid[286758]: Getting changes
dirsyncFilter: (&(objectClass=3Duser)(userAccountControl:1.2.840.113556.1.4=
=2E803:=3D512)(!(sAMAccountName=3Dkrbtgt*)))
dirsyncControls: ['dirsync:1:0:0', 'extended_dn:1:0']
syncCommand: None
Wed Apr 12 16:23:53 2023: pid[286758]: dirsync_loop(): results 15
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[0] 30f8700f-b65b-4464-9c06=
=2D787d42e1d350 S-1-5-21-3371554520-2303607865-1091388633-1198
dn: <GUID=3D30f8700f-b65b-4464-9c06-787d42e1d350>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1198>;CN=3Dtestuser\0ADEL:30f8700f-b65b-4464-9c06-7=
87d42e1d350,CN=3DDeleted Objects,DC=3Dsamba,DC=3Dexample,DC=3Dcom
isRecycled: TRUE
isDeleted: TRUE
userAccountControl: 512
sAMAccountName: testuser
objectGUID: 30f8700f-b65b-4464-9c06-787d42e1d350
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[0] 30f8700f-b65b-4464-9c=
06-787d42e1d350 S-1-5-21-3371554520-2303607865-1091388633-1198
dn: CN=3Dtestuser\0ADEL:30f8700f-b65b-4464-9c06-787d42e1d350,CN=3DDeleted O=
bjects,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 30f8700f-b65b-4464-9c06-787d42e1d350
sAMAccountName: testuser
isDeleted: TRUE
isRecycled: TRUE
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[1] 101b9628-ce2e-42ff-a9c5=
=2D60ceef4285b4 S-1-5-21-3371554520-2303607865-1091388633-1109
dn: <GUID=3D101b9628-ce2e-42ff-a9c5-60ceef4285b4>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1109>;CN=3Djane,CN=3DUsers,DC=3Dsamba,DC=3Dexample,=
DC=3Dcom
userPrincipalName: jane.doe@SAMBA.EXAMPLE.COM
userAccountControl: 512
pwdLastSet: 133257831434617060
sAMAccountName: jane
objectGUID: 101b9628-ce2e-42ff-a9c5-60ceef4285b4
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[1] 101b9628-ce2e-42ff-a9=
c5-60ceef4285b4 S-1-5-21-3371554520-2303607865-1091388633-1109
dn: CN=3Djane,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 101b9628-ce2e-42ff-a9c5-60ceef4285b4
sAMAccountName: jane
supplementalCredentials:: AAAAACAIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYAxAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDJBMDAyQTAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBMjAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDMjAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBEMjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBEQTAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNkEwMDYxMDA2RTAwNjUwMDVDN=
0Mw
 RUU1NDBBMDdBMkIwRDhFQjIxNUY4OENEMUYwRTAwNkU2N0UyOTYzQzdBRDQ4REY4NUNDRTNGNU=
YzO
 EQ5NjNGRTcxOTlEMTM4QURDOEM1MUFDOTg5MzgyMEE0MjAzMzYzMjY1M0ZGMzIzMjUwMjkyMDU=
4M0
 RFRjZFNTg3IAAMAQEAUAByAGkAbQBhAHIAeQA6AEsAZQByAGIAZQByAG8AcwAwMzAwMDAwMDAy=
MDA
 wMDAwMkEwMDJBMDA0QzAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMzAwMDAwMDA4MDAwMDAwNzYwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDAwODAwMDAwMDdFMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODA=
wND
 EwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNkEwMDYxMDA2RTAwNjUwMDAzMzYz=
MjY
 1M0ZGMzIzMjUwMjkyMDU4M0RFRjZFNTg3EACQAAIAUABhAGMAawBhAGcAZQBzADRCMDA2NTAwN=
zIw
 MDYyMDA2NTAwNzIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA3MjAwMkQwMDRCMDA2NT=
AwN
 zkwMDczMDAwMDAwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDczMDAwMDAwNTcwMDQ0MDA=
2OT
 AwNjcwMDY1MDA3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQByAHkAOgBXAEQAaQBnAGUAcwB0ADMx=
MDA
 wMTFEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMTg2NDcyREU3NkY5OTBEQTlBQjM1Q0QxMjk5R=
DFC
 NTM1NjU2MTI4MkFGMjhBNjBDRjU4RURCRTY3QkJDQjk5NzhGODgyNDkyN0U5ODEwRUEzQkVCOT=
Q5R
 kEzNDk5RDRFMTg2NDcyREU3NkY5OTBEQTlBQjM1Q0QxMjk5RDFCNTM1NjU2MTI4MkFGMjhBNjB=
DRj
 U4RURCRTY3QkJDQjk5NzEyOEI3Mzg3OTFBNzM0RUZDNEY1NTNGMUJBN0JFMTkxMTg2NDcyREU3=
NkY
 5OTBEQTlBQjM1Q0QxMjk5RDFCNTNGRTUxMTM2ODJDMjFEQUM5QTY2MjBDNEVDMzFDNjM4NEZFN=
TEx
 MzY4MkMyMURBQzlBNjYyMEM0RUMzMUM2Mzg0NTE4NzhCNkQ2QzlDOUI0M0Q2Mjg5NTQyNkJFM0=
M4M
 DE5MjExNjlEM0FENjI2MTUyOEJBMkZFQUQ3NEVDNjJEMkZFNTExMzY4MkMyMURBQzlBNjYyMEM=
0RU
 MzMUM2Mzg0QUI3QjI4N0Q1MzQ5ODRGRjhGNjI3Njg2NDg4NzkxRDE5MjExNjlEM0FENjI2MTUy=
OEJ
 BMkZFQUQ3NEVDNjJEMjc0QkU1MURDQzdBNzFFMTMxRkUyRjdBNkZDQjhDRUUwNzRCRTUxRENDN=
0E3
 MUUxMzFGRTJGN0E2RkNCOENFRTA5MDdBREM2ODlCMzg5MjY2QTlCRDM2RUZDNEY4NTM1NTlGRU=
Q2N
 TAwNjZEQTY0MDlGMTAwMjAyNTQwMjRCQjI1QUU1QTEzM0ZEQkM1NzM2NDVBNjZCRUU4MzFDMDF=
BOD
 dEOUZFN0FDQzdBMEI5NzZGMEYzNzVCNjMwNEUyNzRDQUQ5MzMwNjgxQzA0QTlBRkQ5MkYwMjI3=
NUE
 yQjAyMDg3RDkzMzA2ODFDMDRBOUFGRDkyRjAyMjc1QTJCMDIwODc1NjQ4NkNEMzA4MDgwNDA3M=
TVE
 NjBDQkM4QUM4RjdFMkZDNzFENkIyNDQzRUZBNDBENThDQzkxM0RBRERFODY3RkM3MUQ2QjI0ND=
NFR
 kE0MEQ1OENDOTEzREFEREU4NjczRUU4Q0Q0MjAwRjM5NTU0MTZFQjY5Q0I4RUE0QkJCQkVFODI=
2Nj
 U0MkNFRTIzNzUzODc2Q0MyMjZDMTFBNEYwNjQyRDJDRDQ5NUJCODZGMUZFNjJEOEIwM0IzODAx=
NTd
 CNjY3NTBGOUE5RTYzQzcxOTU3RDA4RkRGMEEyMEI4NAA=3D
unicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[2] 2947d84c-71dd-48be-a1a5=
=2D1ac49bad7354 S-1-5-21-3371554520-2303607865-1091388633-1165
dn: <GUID=3D2947d84c-71dd-48be-a1a5-1ac49bad7354>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1165>;CN=3DdsIntId_usr_33872,CN=3DUsers,DC=3Dsamba,=
DC=3Dexample,DC=3Dcom
sAMAccountName: dsIntId_usr_33872
pwdLastSet: 0
userAccountControl: 546
objectGUID: 2947d84c-71dd-48be-a1a5-1ac49bad7354
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[2] 2947d84c-71dd-48be-a1=
a5-1ac49bad7354 S-1-5-21-3371554520-2303607865-1091388633-1165
dn: CN=3DdsIntId_usr_33872,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 2947d84c-71dd-48be-a1a5-1ac49bad7354
sAMAccountName: dsIntId_usr_33872
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[3] d2bd4f51-b914-4a33-a598=
=2D45402a4dad5b S-1-5-21-3371554520-2303607865-1091388633-1195
dn: <GUID=3Dd2bd4f51-b914-4a33-a598-45402a4dad5b>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1195>;CN=3DdsIntId_usr_54608,CN=3DUsers,DC=3Dsamba,=
DC=3Dexample,DC=3Dcom
sAMAccountName: dsIntId_usr_54608
pwdLastSet: 0
userAccountControl: 546
objectGUID: d2bd4f51-b914-4a33-a598-45402a4dad5b
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[3] d2bd4f51-b914-4a33-a5=
98-45402a4dad5b S-1-5-21-3371554520-2303607865-1091388633-1195
dn: CN=3DdsIntId_usr_54608,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: d2bd4f51-b914-4a33-a598-45402a4dad5b
sAMAccountName: dsIntId_usr_54608
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[4] a3d2b665-9c09-4153-b971=
=2Dc77f47497552 S-1-5-21-3371554520-2303607865-1091388633-1104
dn: <GUID=3Da3d2b665-9c09-4153-b971-c77f47497552>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1104>;CN=3Dsrv_account,CN=3DUsers,DC=3Dsamba,DC=3De=
xample,DC=3Dcom
userAccountControl: 512
pwdLastSet: 133257831395601120
userPrincipalName: srv_account@samba.example.com
sAMAccountName: srv_account
objectGUID: a3d2b665-9c09-4153-b971-c77f47497552
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[4] a3d2b665-9c09-4153-b9=
71-c77f47497552 S-1-5-21-3371554520-2303607865-1091388633-1104
dn: CN=3Dsrv_account,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: a3d2b665-9c09-4153-b971-c77f47497552
sAMAccountName: srv_account
supplementalCredentials:: AAAAAFgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYA4AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM4MDAzODAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBCMDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBFMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBFODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzMwMDcyMDA3NjAwNUYwMDYxM=
DA2
 MzAwNjMwMDZGMDA3NTAwNkUwMDc0MDA5RTEyMjhBNENDMkNEMTdGMjQ3QTdEQkFCNUVCOTA4MD=
cyO
 TFGMTBFNjE4Rjc1QzE4RTVCMDlCMTk1NTA3NEEwRDczNUIxMUU3N0QzQUFDNDVDNUIzMUM1QTY=
1OD
 Q5QkNGMEU2OEVDNzE2RDFDODdBQTA4RTZEMUJCRjdCNzU1QiAAKAEBAFAAcgBpAG0AYQByAHkA=
OgB
 LAGUAcgBiAGUAcgBvAHMAMDMwMDAwMDAwMjAwMDAwMDM4MDAzODAwNEMwMDAwMDAwMDAwMDAwM=
DAw
 MDAwMDAwMDMwMDAwMDAwODAwMDAwMDg0MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAxMDAwMDAwMD=
gwM
 DAwMDA4QzAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA1MzA=
wND
 EwMDREMDA0MjAwNDEwMDJFMDA0NTAwNTgwMDQxMDA0RDAwNTAwMDRDMDA0NTAwMkUwMDQzMDA0=
RjA
 wNEQwMDczMDA3MjAwNzYwMDVGMDA2MTAwNjMwMDYzMDA2RjAwNzUwMDZFMDA3NDAwRjBFNjhFQ=
zcx
 NkQxQzg3QUEwOEU2RDFCQkY3Qjc1NUIQAJAAAgBQAGEAYwBrAGEAZwBlAHMANEIwMDY1MDA3Mj=
AwN
 jIwMDY1MDA3MjAwNkYwMDczMDAyRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRDAwNEIwMDY1MDA=
3OT
 AwNzMwMDAwMDA0QjAwNjUwMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA1NzAwNDQwMDY5=
MDA
 2NzAwNjUwMDczMDA3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcAZQBzAHQAMzEwM=
DAx
 MUQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAyRURFMzBCMzk2Mjc2NTcxNjYwQzdCOENFM0MxMU=
QyM
 TM3QURCODBBODBBMzBDRjNGRUM2RTEyRjdDRTFGOTJCODZBMTlEQkUyMkEzRTJENjYzRTg0Njk=
xND
 g3MkJGNTEyRURFMzBCMzk2Mjc2NTcxNjYwQzdCOENFM0MxMUQyMTM3QURCODBBODBBMzBDRjNG=
RUM
 2RTEyRjdDRTFGOTJCQTZFQjlBREZBMkQ3NUVCNzRENTFBRkRCRDkxNkUwMzQyRURFMzBCMzk2M=
jc2
 NTcxNjYwQzdCOENFM0MxMUQyMUU2MzA4MTZDMEE5RkJENTc3RDVFMkI5MENGOEY0QzkyRTYzMD=
gxN
 kMwQTlGQkQ1NzdENUUyQjkwQ0Y4RjRDOTIyNzk2REQ3MTMzRkE3MURDMDQ3Q0Q0RkIyNTREMzU=
xMj
 Y4ODE4RTIyOEI1RDQ0NEQxRDdBMkQ2REQxMTA1OTdERTYzMDgxNkMwQTlGQkQ1NzdENUUyQjkw=
Q0Y
 4RjRDOTI3QzUxQUIzMURFNEVDM0U1MDU1QzhDMDczMTdDNDhFMjY4ODE4RTIyOEI1RDQ0NEQxR=
DdB
 MkQ2REQxMTA1OTdENERGRTNFRTg2N0M3MEQ2MThDRTJERTJEMkI5QjU2RDA0REZFM0VFODY3Qz=
cwR
 DYxOENFMkRFMkQyQjlCNTZEMEJEOUQ5REY0OUU1NTY2NDg2RDQ3Nzk5RjVEMTNCRDE1MzA4NzR=
=46OT
 JBNDNFNDg5RUVEQ0U3ODAyNUUxNUFCRTNDNzZEOUY4RjcwNTZFQ0IwQzg5MjVERDkzNUIxRjE2=
OUZ
 ERUE2OTc0QUUxNThGQzhBREI2OUJBNjRDQjlCRUIxNEFBQkRBMjU0QzlENjA3M0RGQTRGQzhGQ=
zM0
 RkU5QzE0QUFCREEyNTRDOUQ2MDczREZBNEZDOEZDMzRGRTlDMTU2MzQyMzA1RDJBMDQ4RkVDQU=
JEM
 UQ2M0ZENkY5MEIxOEJDNUQ0RTU0QTgzOURFRENBQzdEQURBN0NGMTlERDY4QkM1RDRFNTRBODM=
5RE
 VEQ0FDN0RBREE3Q0YxOURENkM0RjcxNjA1NTkyNjgxODc0NjA5QzcyQzE1MTkzM0YxMEMyNjc4=
M0Z
 EMUE5NUM3OTBFQjM0NTgxQ0Q2OUVDQzAxRUQ1ODU5ODQ4MkE0OENGNUFBOTA3MEYxNjI2REI1Q=
jcx
 QkYzMDFFQ0Y3NkFGMDY3RDMyOTZCNjQyMTlGNUI1AA=3D=3D
unicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[5] 88714b67-4a26-48ae-b7db=
=2Dc6221e1db06c S-1-5-21-3371554520-2303607865-1091388633-1107
dn: <GUID=3D88714b67-4a26-48ae-b7db-c6221e1db06c>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1107>;CN=3Dalice,CN=3DUsers,DC=3Dsamba,DC=3Dexample=
,DC=3Dcom
userAccountControl: 512
pwdLastSet: 133257831426785520
userPrincipalName: alice@samba.example.com
sAMAccountName: alice
objectGUID: 88714b67-4a26-48ae-b7db-c6221e1db06c
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[5] 88714b67-4a26-48ae-b7=
db-c6221e1db06c S-1-5-21-3371554520-2303607865-1091388633-1107
dn: CN=3Dalice,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 88714b67-4a26-48ae-b7db-c6221e1db06c
sAMAccountName: alice
supplementalCredentials:: AAAAACgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYAyAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDJDMDAyQzAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBNDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDNDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBENDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBEQzAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNjEwMDZDMDA2OTAwNjMwMDY1M=
DBD
 RjExQzg3NDA1MTIwRjM3QjBDMjYwODlGQjdCOUZFNjg4MEU2MjFBOTNBRDJFOTk1QjBDMzIzND=
BEM
 UIwQjVFMDlBMzU0QUJGODk4MjFBRjdEMDJGRkYwRTA1NjNDMjU5QzdENDQ2MTVFRUM5QjA5OUE=
0Qj
 E0NzRBQzZDQkQzMiAAEAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMAMDMwMDAw=
MDA
 wMjAwMDAwMDJDMDAyQzAwNEMwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDMwMDAwMDAwODAwMDAwM=
Dc4
 MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAxMDAwMDAwMDgwMDAwMDA4MDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA1MzAwNDEwMDREMDA0MjAwNDEwMDJFMDA0NTA=
wNT
 gwMDQxMDA0RDAwNTAwMDRDMDA0NTAwMkUwMDQzMDA0RjAwNEQwMDYxMDA2QzAwNjkwMDYzMDA2=
NTA
 wOUM3RDQ0NjE1RUVDOUIwOTlBNEIxNDc0QUM2Q0JEMzIQAJAAAgBQAGEAYwBrAGEAZwBlAHMAN=
EIw
 MDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDczMDAyRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRD=
AwN
 EIwMDY1MDA3OTAwNzMwMDAwMDA0QjAwNjUwMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA=
1Nz
 AwNDQwMDY5MDA2NzAwNjUwMDczMDA3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcA=
ZQB
 zAHQAMzEwMDAxMUQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAyRUQ3RUU5Q0YxRkM1OUM1MjE2R=
jMy
 RUIyREQ3OThDNDgyNDZCNkU0RUQ2Q0Q2MTE0QTZBNDM2OTJCQjhDMDBGNzI5QzZFQUM4QjdDOE=
RBM
 jkxRjE4QzVEQURCMUUwQjQyRUQ3RUU5Q0YxRkM1OUM1MjE2RjMyRUIyREQ3OThDNDgyNDZCNkU=
0RU
 Q2Q0Q2MTE0QTZBNDM2OTJCQjhDMDBGRURBN0JGREZBMDU1RjdENUY0NkFEQUJCN0RFMjQ5ODcy=
RUQ
 3RUU5Q0YxRkM1OUM1MjE2RjMyRUIyREQ3OThDNENGQzNFRjdCOUY5OUFERkE0MkQwRTJGRjc0O=
DVG
 NDEzQ0ZDM0VGN0I5Rjk5QURGQTQyRDBFMkZGNzQ4NUY0MTM0Q0YxRENDRDUxNjQ3OTYzMzdFOE=
Q0N
 zhDRTVGREZERjU1NDVFMTY4MjU3QTRFRTg5MUIxNjk3NUY4Q0E2RDA5Q0ZDM0VGN0I5Rjk5QUR=
GQT
 QyRDBFMkZGNzQ4NUY0MTM4NzZGOTE0NTQ2NDgwMjVENzAwMkRDQ0ZBNkRCNDJBMDU1NDVFMTY4=
MjU
 3QTRFRTg5MUIxNjk3NUY4Q0E2RDA5QTE5NjU1MzlDQkE1NDlCMENDNzU1MkM2RDkwNkVENjZBM=
Tk2
 NTUzOUNCQTU0OUIwQ0M3NTUyQzZEOTA2RUQ2NjY3M0MwMEUxMTY1NEY2Q0M3NkFFRTM2NTlEMk=
M1Q
 zNBNTU4MzMwMERGODcwNjQ2NjcxNTc0RjNBREY5RUI1NDM3NUIxRDczMTNEMDZCODhEMzQyRDU=
wQk
 U4MEI2MzY1RkNBNzI0Q0E5MzIwMUU0QkI1NTAzMDgyRTVDMUEzOUU4RkEwODZFNEQ5NDQzNEZD=
QTZ
 FNDlCMEMwMjhFMjAwQ0VGQTA4NkU0RDk0NDM0RkNBNkU0OUIwQzAyOEUyMDBDRTMwREYwODEyQ=
TVG
 MzcwMEQ3Njk1MjA3MTJCMjMzRUU5MkQyMkY0OEVENjREMDg4MjY2QjkxRDVDNDVFRjAzQkEyRD=
IyR
 jQ4RUQ2NEQwODgyNjZCOTFENUM0NUVGMDNCQUM0NzE0Qzc1MUVGM0E2NEZFOEJENjcxRTJBOEY=
0OE
 M5MzgxNTkwOURFNkY4NzVFNTdBQ0M3NTdCNjJDNjFDMzc3NzlBQTlFODZGMjEzMzMxQzc4NjVC=
REI
 xM0QzQkE1NUY1MTYwNjI2MDY4QkI2NkI0RUY2OUVCRjgwQTYzNEEyAA=3D=3D
unicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[6] 4e0d3589-7bf0-473f-87af=
=2D78a1a3ef358a S-1-5-21-3371554520-2303607865-1091388633-1105
dn: <GUID=3D4e0d3589-7bf0-473f-87af-78a1a3ef358a>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1105>;CN=3Dtestdenied,CN=3DUsers,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom
userPrincipalName: testdenied_upn@SAMBA.EXAMPLE.COM.upn
userAccountControl: 512
pwdLastSet: 133257831410465880
sAMAccountName: testdenied
objectGUID: 4e0d3589-7bf0-473f-87af-78a1a3ef358a
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[6] 4e0d3589-7bf0-473f-87=
af-78a1a3ef358a S-1-5-21-3371554520-2303607865-1091388633-1105
dn: CN=3Dtestdenied,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 4e0d3589-7bf0-473f-87af-78a1a3ef358a
sAMAccountName: testdenied
supplementalCredentials:: AAAAAFAIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYA3AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM2MDAzNjAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBRTAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDRTAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBERTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBFNjAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMDY1MDA3MzAwNzQwMDY0M=
DA2
 NTAwNkUwMDY5MDA2NTAwNjQwMDk2OUQxNDQ0MTYxQjQ0QkZDOEE2NUI2ODdFMTIyMDE5NzUzOU=
E1M
 jMwOEQ1NDBDNzQwNUZDRjE5MzJEMTNBRUREN0E4MUY2RURDQTg3RDZBQkRCNzFBMUVBRTg3NTY=
xQ0
 MyRDA4QTUyQUM4RTgxNENDMTZFRjk3OEVFNkFFQkYzIAAkAQEAUAByAGkAbQBhAHIAeQA6AEsA=
ZQB
 yAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwMzYwMDM2MDA0QzAwMDAwMDAwMDAwMDAwMDAwM=
DAw
 MDAwMzAwMDAwMDA4MDAwMDAwODIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDAwODAwMD=
AwM
 DhBMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDUzMDA0MTA=
wNE
 QwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0=
RDA
 wNzQwMDY1MDA3MzAwNzQwMDY0MDA2NTAwNkUwMDY5MDA2NTAwNjQwMEMyRDA4QTUyQUM4RTgxN=
END
 MTZFRjk3OEVFNkFFQkYzEACQAAIAUABhAGMAawBhAGcAZQBzADRCMDA2NTAwNzIwMDYyMDA2NT=
AwN
 zIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA3MjAwMkQwMDRCMDA2NTAwNzkwMDczMDA=
wMD
 AwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDczMDAwMDAwNTcwMDQ0MDA2OTAwNjcwMDY1=
MDA
 3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQByAHkAOgBXAEQAaQBnAGUAcwB0ADMxMDAwMTFEMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDAwNTc5RjEwODQ0NkNDNUQxMzIyQUFFNDkzNzdFMTI2QzBENkVEOD=
VEO
 DAxMzlFNjU1NjQ2MTZBM0IyMjJFNUY5MjI4OTIxRjdCNDQ3NzdGODg2RjMzQUZEOUZFQkJFMDJ=
=46NT
 c5RjEwODQ0NkNDNUQxMzIyQUFFNDkzNzdFMTI2QzBENkVEODVEODAxMzlFNjU1NjQ2MTZBM0Iy=
MjJ
 FNUY5MjQ4Nzk4QzU5ODc0M0FERTZCNEM3NzE1NEZCRTI1QUI5NTc5RjEwODQ0NkNDNUQxMzIyQ=
UFF
 NDkzNzdFMTI2QzBFMkUyMjRCMDUwRDI5NzYzQTAzQTQ4RkYxMzU0RDIwOEUyRTIyNEIwNTBEMj=
k3N
 jNBMDNBNDhGRjEzNTREMjA4QzNBN0JDRjdCMEQ3MEZCRDBDMTE3RjFFQ0VBOUNBNEEwRUIwMDg=
4MD
 NCRTFGNDQ5NkUwMENFQURFODVEM0FEREUyRTIyNEIwNTBEMjk3NjNBMDNBNDhGRjEzNTREMjA4=
MzE
 0N0Q0NDU0QTlBNjdEOTg3MjgyRTMyNTRDRTZGRDYwRUIwMDg4MDNCRTFGNDQ5NkUwMENFQURFO=
DVE
 M0FEREZEMjZERTRGOTFFNUJGMjhGNTYxNTgxRTM3RDI3MTQzRkQyNkRFNEY5MUU1QkYyOEY1Nj=
E1O
 DFFMzdEMjcxNDNDQ0JCNzY3RkMxNTlDRDlENDU1QUU0NDRCMTBGMEJGRUI0NEY5OTg4NjI3NzY=
yQz
 E0NzE2MTNDRTUzRTAwMTI5N0RCMDFFNDA0NDJBRjcxNjNDNDU4OTdDMzIyM0E5RjBFNEIyMUFD=
N0U
 2NUZEMzQ5REMwNzhFN0YzQUFGODc1OEUyMTBDNTExOUU3OUE3NEEzRTgzQkM3MzNEMDQ1OUUyR=
TIx
 MEM1MTE5RTc5QTc0QTNFODNCQzczM0QwNDU5RTJBQzcwMkYxREJDNkNEOUUyNUU5Q0FCNkFBQU=
ZCR
 TE5QkM3QTA2REIyNjI0QTZCNjM1N0M1MTkzQjZENTJGMjE5QzdBMDZEQjI2MjRBNkI2MzU3QzU=
xOT
 NCNkQ1MkYyMTk2OUIxMjZDNTY5QzA4RkZBMkM5NTdFMzE1QjU2MjdDRUMwOEMyNTU2ODhDNjhC=
QjI
 5QzdDMzA0OUFDMzNDREVFNDM5MDUwNDYwNTJDN0U3QjlCQTg1RURDNTFEREY1MEJEM0NGRjNCQ=
zQ0
 NzFDNzU3Rjc3NjUzMDgwQUQ4NTFCRAA=3D
unicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[7] 4aefe78c-1791-467f-8604=
=2Df42fe8221ddd S-1-5-21-3371554520-2303607865-1091388633-1106
dn: <GUID=3D4aefe78c-1791-467f-8604-f42fe8221ddd>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1106>;CN=3Dtestupnspn,CN=3DUsers,DC=3Dsamba,DC=3Dex=
ample,DC=3Dcom
userPrincipalName: http/testupnspn.samba.example.com@SAMBA.EXAMPLE.COM
userAccountControl: 512
pwdLastSet: 133257831417392190
sAMAccountName: testupnspn
objectGUID: 4aefe78c-1791-467f-8604-f42fe8221ddd
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[7] 4aefe78c-1791-467f-86=
04-f42fe8221ddd S-1-5-21-3371554520-2303607865-1091388633-1106
dn: CN=3Dtestupnspn,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 4aefe78c-1791-467f-8604-f42fe8221ddd
sAMAccountName: testupnspn
supplementalCredentials:: AAAAAFAIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYA3AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM2MDAzNjAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBRTAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDRTAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBERTAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBFNjAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMDY1MDA3MzAwNzQwMDc1M=
DA3
 MDAwNkUwMDczMDA3MDAwNkUwMEFBRDFERDhCNkJFM0YzRDY2N0I4OUM5ODg2OTg0NkUxNjU2Qj=
BDQ
 jg2NDQ5REY5MTMwNzJBQkFENzQwQjU0OTcxRkJFM0FBQTk4QTVCQURFOEU4MkMxODE1OTRDMzJ=
=46Nj
 Y0REVBOTFDNUUyNEVDNDk4M0JFMkEwNkM4NDEwRENBIAAkAQEAUAByAGkAbQBhAHIAeQA6AEsA=
ZQB
 yAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwMzYwMDM2MDA0QzAwMDAwMDAwMDAwMDAwMDAwM=
DAw
 MDAwMzAwMDAwMDA4MDAwMDAwODIwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDAwODAwMD=
AwM
 DhBMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDUzMDA0MTA=
wNE
 QwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0=
RDA
 wNzQwMDY1MDA3MzAwNzQwMDc1MDA3MDAwNkUwMDczMDA3MDAwNkUwMDY0REVBOTFDNUUyNEVDN=
Dk4
 M0JFMkEwNkM4NDEwRENBEACQAAIAUABhAGMAawBhAGcAZQBzADRCMDA2NTAwNzIwMDYyMDA2NT=
AwN
 zIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA3MjAwMkQwMDRCMDA2NTAwNzkwMDczMDA=
wMD
 AwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDczMDAwMDAwNTcwMDQ0MDA2OTAwNjcwMDY1=
MDA
 3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQByAHkAOgBXAEQAaQBnAGUAcwB0ADMxMDAwMTFEMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDAwRkIwRUQwQzVDNDg4N0Y3RDZBMjlDQThDQjQ4NDU0OTYzM0NFMj=
gxM
 TM2RTBFQzAyRjUwOTZEOTYzREI2QkYwRDREQjc1N0JBN0I1MEExMzNBMzU5NTQ5MDExMDM3RDN=
BRk
 IwRUQwQzVDNDg4N0Y3RDZBMjlDQThDQjQ4NDU0OTYzM0NFMjgxMTM2RTBFQzAyRjUwOTZEOTYz=
REI
 2QkYwREUzQjMxNzFGNTAxN0U5QzYzOUEwNTA0NUM3Rjg2QzZGRkIwRUQwQzVDNDg4N0Y3RDZBM=
jlD
 QThDQjQ4NDU0OTY3MUU0MjNGQjdDRUUxOUIwNDEzQUNFOUFFRjcxREQwNjcxRTQyM0ZCN0NFRT=
E5Q
 jA0MTNBQ0U5QUVGNzFERDA2Mjk4RkYzMEE5Njg0NUJEOTI5Q0MxNTVCMjY3NTI4NTJDOEFENzN=
DM0
 UyNUQ3OTI2ODA3NjU5MTdCNkZGM0JDRjcxRTQyM0ZCN0NFRTE5QjA0MTNBQ0U5QUVGNzFERDA2=
RTQ
 3NTIyMTc2RkNCMjAwODU3NTEyNUJFMDU3MTFDNjhDOEFENzNDM0UyNUQ3OTI2ODA3NjU5MTdCN=
kZG
 M0JDRjFENDY5MkEyQkE2RUZCMTQyQTcyQjU3MDhDNDYxOTE1MUQ0NjkyQTJCQTZFRkIxNDJBNz=
JCN
 TcwOEM0NjE5MTVFNjhDRjBCNjFBOUMzOTkxODg4NjQyN0REQkRGNzg1NURDMThBRTdDNTE5OTc=
3Nz
 Y5MzI3RTM1MDg1NDg3RUNGMUM2QTRCNzYyNUE5ODg5RDhGMUNEQzhFRjVGRTU0MEYzMkI0RjQ3=
RTU
 0QzdGRDkxRTkyMEY2NDI0OTNDRkEzMzRBQjI2MkYyM0EyM0Q5OUUyNDhDRjMxOUU3MTI3NjY4N=
EFC
 MjYyRjIzQTIzRDk5RTI0OENGMzE5RTcxMjc2NjhENjlBMjNEN0I0RkNGRDU4OEM1NjFGQUQwNE=
IwR
 DhCQURDODE0MzVDQUNBQzQ3NjRFNTE3NjZCMTg5OTg4NDBDREM4MTQzNUNBQ0FDNDc2NEU1MTc=
2Nk
 IxODk5ODg0MENFRTU1NDY2MTlDMzY1OUQ4MEI0QjlDNTlEODlFMEVBMjVFRkFBNjBDNEZDQjJB=
NzN
 FMTlBQTkzRTE1QjZDMDZDRUM3QTgyRTY2QTU0QUE0OTRBMkNBMjNGQjMwNTlCNUQ5RkIzMzc4R=
DJG
 RjQwNkE5OUJCN0U0ODBDOTE2RDEwNAA=3D
unicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[8] 6ce0468d-2249-4b19-b672=
=2D7f3795bbab4d S-1-5-21-3371554520-2303607865-1091388633-1196
dn: <GUID=3D6ce0468d-2249-4b19-b672-7f3795bbab4d>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1196>;CN=3Dtestuser\0ADEL:6ce0468d-2249-4b19-b672-7=
f3795bbab4d,CN=3DDeleted Objects,DC=3Dsamba,DC=3Dexample,DC=3Dcom
isRecycled: TRUE
isDeleted: TRUE
userAccountControl: 512
sAMAccountName: testuser
objectGUID: 6ce0468d-2249-4b19-b672-7f3795bbab4d
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[8] 6ce0468d-2249-4b19-b6=
72-7f3795bbab4d S-1-5-21-3371554520-2303607865-1091388633-1196
dn: CN=3Dtestuser\0ADEL:6ce0468d-2249-4b19-b672-7f3795bbab4d,CN=3DDeleted O=
bjects,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 6ce0468d-2249-4b19-b672-7f3795bbab4d
sAMAccountName: testuser
isDeleted: TRUE
isRecycled: TRUE
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[9] 791dc491-c001-49e4-b06b=
=2D7353512a54bd S-1-5-21-3371554520-2303607865-1091388633-1103
dn: <GUID=3D791dc491-c001-49e4-b06b-7353512a54bd>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1103>;CN=3Dtestallowed,CN=3DUsers,DC=3Dsamba,DC=3De=
xample,DC=3Dcom
userPrincipalName: testallowed upn@SAMBA.EXAMPLE.COM
sAMAccountName: testallowed account
userAccountControl: 512
pwdLastSet: 133257831391462340
objectGUID: 791dc491-c001-49e4-b06b-7353512a54bd
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[9] 791dc491-c001-49e4-b0=
6b-7353512a54bd S-1-5-21-3371554520-2303607865-1091388633-1103
dn: CN=3Dtestallowed,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 791dc491-c001-49e4-b06b-7353512a54bd
sAMAccountName: testallowed account
supplementalCredentials:: AAAAAFgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYA4AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDM4MDAzODAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBCMDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBFMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBFODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNzQwMDY1MDA3MzAwNzQwMDYxM=
DA2
 QzAwNkMwMDZGMDA3NzAwNjUwMDY0MDAyNTFEQUU0ODBFRDAwODA2MTE5QTVGNzNCOEU3OUZENE=
Q5N
 kU4OEM3OTdDMjYxMUQ0QTY2MDg2QTc3RjlCQTcwQkM3RTQ3QUE1RkVCQTk2MzYyODk3REM5RkE=
wNE
 ZENTQyOTQ5OUM4MkIzNEVEODdFNEY3M0IxQTcxQTM5NkM4MCAAKAEBAFAAcgBpAG0AYQByAHkA=
OgB
 LAGUAcgBiAGUAcgBvAHMAMDMwMDAwMDAwMjAwMDAwMDM4MDAzODAwNEMwMDAwMDAwMDAwMDAwM=
DAw
 MDAwMDAwMDMwMDAwMDAwODAwMDAwMDg0MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAxMDAwMDAwMD=
gwM
 DAwMDA4QzAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA1MzA=
wND
 EwMDREMDA0MjAwNDEwMDJFMDA0NTAwNTgwMDQxMDA0RDAwNTAwMDRDMDA0NTAwMkUwMDQzMDA0=
RjA
 wNEQwMDc0MDA2NTAwNzMwMDc0MDA2MTAwNkMwMDZDMDA2RjAwNzcwMDY1MDA2NDAwMjk0OTlDO=
DJC
 MzRFRDg3RTRGNzNCMUE3MUEzOTZDODAQAJAAAgBQAGEAYwBrAGEAZwBlAHMANEIwMDY1MDA3Mj=
AwN
 jIwMDY1MDA3MjAwNkYwMDczMDAyRDAwNEUwMDY1MDA3NzAwNjUwMDcyMDAyRDAwNEIwMDY1MDA=
3OT
 AwNzMwMDAwMDA0QjAwNjUwMDcyMDA2MjAwNjUwMDcyMDA2RjAwNzMwMDAwMDA1NzAwNDQwMDY5=
MDA
 2NzAwNjUwMDczMDA3NDAwHgDAAwEAUAByAGkAbQBhAHIAeQA6AFcARABpAGcAZQBzAHQAMzEwM=
DAx
 MUQwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDBFNEI1MzNBRjQzQ0U4MjM3OTAxMTlDMzcyMzU4OE=
E0R
 kNDMjhCMjZFN0E1QjBGNzUyQUFGNjQ3MDY4QjI5Rjk1MTc1QzZDNzhDNkY5Njc4MkM2OUVBMzV=
COE
 IzRjNGMThFNEI1MzNBRjQzQ0U4MjM3OTAxMTlDMzcyMzU4OEE0RkNDMjhCMjZFN0E1QjBGNzUy=
QUF
 GNjQ3MDY4QjI5Rjk1NDRCQ0VDQTJBODlENEJEMTY2MzdDNzk4QjMzODYzMjFFNEI1MzNBRjQzQ=
0U4
 MjM3OTAxMTlDMzcyMzU4OEE0RjU1NkNBMDQyMzI3RTI2REZERDI0MzhGRTlBQjdCMTc4NTU2Q0=
EwN
 DIzMjdFMjZERkREMjQzOEZFOUFCN0IxNzgxMjg0QkU1Qzk2ODU2QTgwRjAzMzE4MTdFOTYzNDh=
CNj
 Y1NDAzN0I3OTI4QzRGQUY5NEM1NTBCRUExRDhBNTRGNTU2Q0EwNDIzMjdFMjZERkREMjQzOEZF=
OUF
 CN0IxNzhGQjY4NkI4RTNGOUVBNjhBNjIyODJERTM3RkNGQzlEODY1NDAzN0I3OTI4QzRGQUY5N=
EM1
 NTBCRUExRDhBNTRGOTFENjJBODkwMkY1REZGRUE4OTUxMUMyREY0MjZGMDg5MUQ2MkE4OTAyRj=
VER
 kZFQTg5NTExQzJERjQyNkYwOEMzMjBDOUU4NTU3RkRDNkNGQUNFRDIyQ0Y1QjRGODNEQ0E5MDM=
xRk
 Q5NTc4NDRBMzkwQjI4M0REMjZDNDkxRkQ3NTQ3RDBEMTU3M0UyNDQ3NkVEMUNFMDFCQkNCOTYx=
QTQ
 4QjY5RDFBMTM5NkZBMjMyMkNEOEMzRDQ3QkU0RTlGQTQyMDVFMjJDOUJCQTRBNDQ0MTFFMUUwQ=
TY4
 MjQyODJBNDIwNUUyMkM5QkJBNEE0NDQxMUUxRTBBNjgyNDI4MjIxQTE1OURGQzY3NkIxMjIzNz=
MxQ
 jhEMkIzODhDMEVDQjlFQTY3RDI3MzgyQzczMDVDRDIzQzY2NURGQkNGNDFCOUVBNjdEMjczODJ=
DNz
 MwNUNEMjNDNjY1REZCQ0Y0MTI3RTIxMUJFNjRGMjM5MzMzRUY0Qzk3N0U4MzMwOEU3QzA1RjNE=
QTI
 zOTkzMzlFQzNENzBGQ0E1RDEzREE1RkZGNEVCNUM4NTFBNTNCMDEzMzE5OUY1MDY5OUFERTE5Q=
kI4
 NDJGODRBNTNEMDFGMjAyMTFGMEJFNkNGQkM5MjEzAA=3D=3D
unicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[10] 89c5dd97-2ff3-467c-bd3=
d-6e1270f93e4b S-1-5-21-3371554520-2303607865-1091388633-1180
dn: <GUID=3D89c5dd97-2ff3-467c-bd3d-6e1270f93e4b>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1180>;CN=3DdsIntId_usr_9024,CN=3DUsers,DC=3Dsamba,D=
C=3Dexample,DC=3Dcom
sAMAccountName: dsIntId_usr_9024
pwdLastSet: 0
userAccountControl: 546
objectGUID: 89c5dd97-2ff3-467c-bd3d-6e1270f93e4b
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[10] 89c5dd97-2ff3-467c-b=
d3d-6e1270f93e4b S-1-5-21-3371554520-2303607865-1091388633-1180
dn: CN=3DdsIntId_usr_9024,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 89c5dd97-2ff3-467c-bd3d-6e1270f93e4b
sAMAccountName: dsIntId_usr_9024
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[11] 08d7fdbc-e6d0-4f42-94d=
b-af1a35534425 S-1-5-21-3371554520-2303607865-1091388633-501
dn: <GUID=3D08d7fdbc-e6d0-4f42-94db-af1a35534425>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-501>;CN=3DGuest,CN=3DUsers,DC=3Dsamba,DC=3Dexample,=
DC=3Dcom
sAMAccountName: Guest
pwdLastSet: 0
userAccountControl: 66082
objectGUID: 08d7fdbc-e6d0-4f42-94db-af1a35534425
instanceType: 4
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[11] 08d7fdbc-e6d0-4f42-9=
4db-af1a35534425 S-1-5-21-3371554520-2303607865-1091388633-501
dn: CN=3DGuest,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 08d7fdbc-e6d0-4f42-94db-af1a35534425
sAMAccountName: Guest
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[12] df97b8fb-0ffa-4fab-9fc=
0-047a12c5e5c7 S-1-5-21-3371554520-2303607865-1091388633-1110
dn: <GUID=3Ddf97b8fb-0ffa-4fab-9fc0-047a12c5e5c7>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1110>;CN=3Djoe,CN=3DUsers,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom
userAccountControl: 512
pwdLastSet: 133257831438593670
userPrincipalName: joe@samba.example.com
sAMAccountName: joe
objectGUID: df97b8fb-0ffa-4fab-9fc0-047a12c5e5c7
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[12] df97b8fb-0ffa-4fab-9=
fc0-047a12c5e5c7 S-1-5-21-3371554520-2303607865-1091388633-1110
dn: CN=3Djoe,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: df97b8fb-0ffa-4fab-9fc0-047a12c5e5c7
sAMAccountName: joe
supplementalCredentials:: AAAAABgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYAwAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDI4MDAyODAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBMDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBEODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNkEwMDZGMDA2NTAwN0UyNzAxQ=
TAw
 NEFFNzcyQ0M5MzFFNTRGRkMwNDhGNTVGNDVEQjg2QzE5N0EzRTk0NjQ4NzlEMjFDMUFCNUI5RD=
JCR
 EYyNEJGNzgwRTFGMjhEOUYwNDhEQzlFNEQ4QUE4MEUwMDY1RDQ1RjFEQjg1NDQ4OTkzQjc3NkE=
5Qk
 NERDMgAAgBAQBQAHIAaQBtAGEAcgB5ADoASwBlAHIAYgBlAHIAbwBzADAzMDAwMDAwMDIwMDAw=
MDA
 yODAwMjgwMDRDMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDAwMDAwMDgwMDAwMDA3NDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMTAwMDAwMDA4MDAwMDAwN0MwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDAwMDAwMDAwMDAwMDAwNTMwMDQxMDA0RDAwNDIwMDQxMDAyRTAwNDUwMDU4MDA0MTA=
wNE
 QwMDUwMDA0QzAwNDUwMDJFMDA0MzAwNEYwMDREMDA2QTAwNkYwMDY1MDAwRTAwNjVENDVGMURC=
ODU
 0NDg5OTNCNzc2QTlCQ0REMxAAkAACAFAAYQBjAGsAYQBnAGUAcwA0QjAwNjUwMDcyMDA2MjAwN=
jUw
 MDcyMDA2RjAwNzMwMDJEMDA0RTAwNjUwMDc3MDA2NTAwNzIwMDJEMDA0QjAwNjUwMDc5MDA3Mz=
AwM
 DAwMDRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZGMDA3MzAwMDAwMDU3MDA0NDAwNjkwMDY3MDA=
2NT
 AwNzMwMDc0MDAeAMADAQBQAHIAaQBtAGEAcgB5ADoAVwBEAGkAZwBlAHMAdAAzMTAwMDExRDAw=
MDA
 wMDAwMDAwMDAwMDAwMDAwMDAwMDc2RTlCRDY5QTFEOUJEMjc0QkFBQjFEMzdEM0QxMDY5QTdDN=
DA0
 QTdFNzY2QUZCNjUzMTUyQ0E1Q0MxQTBGNzNBRjA0QjBBQTVGNzdEOEY3MDY2MzhDQkFERjNCRD=
lDO
 Dc2RTlCRDY5QTFEOUJEMjc0QkFBQjFEMzdEM0QxMDY5QTdDNDA0QTdFNzY2QUZCNjUzMTUyQ0E=
1Q0
 MxQTBGNzMwMkJERjg4NDg5QzVGMjZDM0QzREMwMDhGODg4Q0NCRjc2RTlCRDY5QTFEOUJEMjc0=
QkF
 BQjFEMzdEM0QxMDY5N0FDQkNDMDdBMEVDNzY0OEE2RTA5RjVEMzNFRUI5QkI3QUNCQ0MwN0EwR=
UM3
 NjQ4QTZFMDlGNUQzM0VFQjlCQjVFQTMxNTAxQzFGMUYyNUJCMUY1MkU1REU5NjBEMUU0MkJFMj=
I0M
 0VBNENCMDg2MEY1MDI4NTgxODkwQUVBODg3QUNCQ0MwN0EwRUM3NjQ4QTZFMDlGNUQzM0VFQjl=
CQj
 M1QzRCQTkwMzYwOUQ2NUM2NkVDOUZFMEYxRTM5NDhDMkJFMjI0M0VBNENCMDg2MEY1MDI4NTgx=
ODk
 wQUVBODg5RThCODU3N0NDNkQ4RTVCMjY4REM4OTUzMzM4NzM2QTlFOEI4NTc3Q0M2RDhFNUIyN=
jhE
 Qzg5NTMzMzg3MzZBMDQ4M0NGNTJGMDFDOURDNzlBNTgxRTUzQzFDODFCNUNBNjA2QjNCOEU2RU=
MyN
 kM2REU2REQ4RjI1MzA3MkQzMTdFNEU1NEM0MDkyNzBEMEE0NTlENkRBMUM1QzhDNDBCQkYxQzI=
2Mj
 YyQTEwRUZCQkYxMTk4Nzk4OEQ2MUZDRDZCRUZBNDA0OURBN0ZFQzUyNTczQzIxNTRBRTM1NzQx=
OEJ
 FRkE0MDQ5REE3RkVDNTI1NzNDMjE1NEFFMzU3NDE4QUVDQjE4NDVCRjYyMDIzMjBBN0Q5NTI1O=
TI2
 QUQ2Nzg4NDU5MTkyRDJFMjkzMEY1MjM3REU1QjRDMDc0M0E5Qzg0NTkxOTJEMkUyOTMwRjUyMz=
dER
 TVCNEMwNzQzQTlDOTk2QjdGMkI3NjVDRUEwODgxMDk4MEVDOUJERjgwNzUyQjlFN0U3NzVDMUI=
yRT
 U3Q0I0QzYxQTNFNUZGOTUxMzQ1NDY3Q0MwMzcxRTNDOTE2RjMwRTE0NDE3NTkxQzY3Nzc2M0I5=
MEU
 yM0NGNzIzMjFFRjNFMTQ0MzE3ODkzODkA
unicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[13] fc01dbfc-ae63-4b7c-af1=
d-5ba580e595bd S-1-5-21-3371554520-2303607865-1091388633-1108
dn: <GUID=3Dfc01dbfc-ae63-4b7c-af1d-5ba580e595bd>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-1108>;CN=3Dbob,CN=3DUsers,DC=3Dsamba,DC=3Dexample,D=
C=3Dcom
userAccountControl: 512
pwdLastSet: 133257831430630300
userPrincipalName: bob@samba.example.com
sAMAccountName: bob
objectGUID: fc01dbfc-ae63-4b7c-af1d-5ba580e595bd
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[13] fc01dbfc-ae63-4b7c-a=
f1d-5ba580e595bd S-1-5-21-3371554520-2303607865-1091388633-1108
dn: CN=3Dbob,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: fc01dbfc-ae63-4b7c-af1d-5ba580e595bd
sAMAccountName: bob
supplementalCredentials:: AAAAABgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYAwAEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDI4MDAyODAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBBMDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBDMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBEODAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNjIwMDZGMDA2MjAwM0MyMzA0M=
ERF
 MUU3RUU0NDI3NjJFMzdDMkNERjYzRjgxQzAyQkQ4NUFEMUM2MEJGN0RFQUVGRjQyODM2NjJFOT=
MxR
 jZERjM4ODQ5OEQwRTQ2NEM2MThDN0NGMDkzREM2NzI0OTAzMjA4MEI5ODUzNzYwMkExNDNDNjd=
=46RD
 BFM0MgAAgBAQBQAHIAaQBtAGEAcgB5ADoASwBlAHIAYgBlAHIAbwBzADAzMDAwMDAwMDIwMDAw=
MDA
 yODAwMjgwMDRDMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAzMDAwMDAwMDgwMDAwMDA3NDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMTAwMDAwMDA4MDAwMDAwN0MwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDAwMDAwMDAwMDAwMDAwNTMwMDQxMDA0RDAwNDIwMDQxMDAyRTAwNDUwMDU4MDA0MTA=
wNE
 QwMDUwMDA0QzAwNDUwMDJFMDA0MzAwNEYwMDREMDA2MjAwNkYwMDYyMDA3MjQ5MDMyMDgwQjk4=
NTM
 3NjAyQTE0M0M2N0VEMEUzQxAAkAACAFAAYQBjAGsAYQBnAGUAcwA0QjAwNjUwMDcyMDA2MjAwN=
jUw
 MDcyMDA2RjAwNzMwMDJEMDA0RTAwNjUwMDc3MDA2NTAwNzIwMDJEMDA0QjAwNjUwMDc5MDA3Mz=
AwM
 DAwMDRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZGMDA3MzAwMDAwMDU3MDA0NDAwNjkwMDY3MDA=
2NT
 AwNzMwMDc0MDAeAMADAQBQAHIAaQBtAGEAcgB5ADoAVwBEAGkAZwBlAHMAdAAzMTAwMDExRDAw=
MDA
 wMDAwMDAwMDAwMDAwMDAwMDAwMEQ2NzlCOTkxNzY4NTFGQkU1RDkxQkQwNENCNjdFNTVEQjdBR=
jhF
 MDQ4MEZFRDZCM0NFQUJDREFCRDBGNkNFN0I5NjYzOEVFNUVBQTg0NTlCNDhDNzQzQjREMzk4Qk=
UzM
 UQ2NzlCOTkxNzY4NTFGQkU1RDkxQkQwNENCNjdFNTVEQjdBRjhFMDQ4MEZFRDZCM0NFQUJDREF=
CRD
 BGNkNFN0JCRUU4QUQ3QUY1REQxRUFGMzkxREQ4ODZGQjc1MTIzMkQ2NzlCOTkxNzY4NTFGQkU1=
RDk
 xQkQwNENCNjdFNTVEMUEwRkEyREVGRDM2MzIzRDI3NTkyMEYxRkYzQTNBOUMxQTBGQTJERUZEM=
zYz
 MjNEMjc1OTIwRjFGRjNBM0E5QzI0REE4MDQyQ0Q1RThDNjEzN0Y1QTZCRjJEN0RFODI2MTA4MU=
M4M
 UQwRjlCOTgwMzlBNDk1QzA4OTlGM0IzRDUxQTBGQTJERUZEMzYzMjNEMjc1OTIwRjFGRjNBM0E=
5Qz
 UzODE0OTA2MjBDNzk0QkUxQjY2NUJBMDM5OTM3M0Y0MTA4MUM4MUQwRjlCOTgwMzlBNDk1QzA4=
OTl
 GM0IzRDU2NEZCNEQ3MURDQUUxNTVFM0ZCMDRDN0VENkU4RTQ3MTY0RkI0RDcxRENBRTE1NUUzR=
kIw
 NEM3RUQ2RThFNDcxQjE0NUY1RTgzOUYwNURBRjJFODFCREQ5RTJDQ0VCRDgzNDEwQUE4N0REME=
VCQ
 0EyNzFBNDNDNkJDNUIyMDdDNDY0RkJCQ0ExQkQ0MTlBMkMxMDkwQUU4RDJCN0IyMEZGQUI4OTQ=
4Qz
 E2RTUxREQ4QkIyMkUyMDNDQzNGQUU3MEUwOTA2MEQ2MDc2NkYyQzRDQUFCNzVDMzBCNjUzMTM0=
MTA
 5MDYwRDYwNzY2RjJDNENBQUI3NUMzMEI2NTMxMzQxM0Q4QzY2QzRBQjNBQzNDOTg5NzE5NEUzM=
zMw
 OEQzOEMwN0NFMEExOEE3NjUzRjQ1NDc4OTBFQTU0MzM4RDVCQTA3Q0UwQTE4QTc2NTNGNDU0Nz=
g5M
 EVBNTQzMzhENUJBNjYzN0FEQjYwMEM4NzIxQjc0RDgwODkxOUZBMkJGNEM1OEIwRTM0OERENEM=
3Qj
 VERjI5OTc0ODE2NjBFOTY0NjJFNjhBMzA1QUU0NDA4M0RGMzdCNTIzOEY0QzM3Q0VCMDJCQkZD=
ODk
 3MzgzNEU4MTNGMkI0ODM4QUE5NUZCQjYA
unicodePwd:: 5qa4/98GbOPq0JS7eb0KJA=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: # Dirsync[14] 85c452fd-f364-494f-ae8=
0-efdb74563568 S-1-5-21-3371554520-2303607865-1091388633-500
dn: <GUID=3D85c452fd-f364-494f-ae80-efdb74563568>;<SID=3DS-1-5-21-337155452=
0-2303607865-1091388633-500>;CN=3DAdministrator,CN=3DUsers,DC=3Dsamba,DC=3D=
example,DC=3Dcom
sAMAccountName: Administrator
pwdLastSet: 133257831371919200
userAccountControl: 512
objectGUID: 85c452fd-f364-494f-ae80-efdb74563568
instanceType: 4
# unicodePwd::: REDACTED SECRET ATTRIBUTE
# supplementalCredentials::: REDACTED SECRET ATTRIBUTE
Wed Apr 12 16:23:53 2023: pid[286758]: # Passwords[14] 85c452fd-f364-494f-a=
e80-efdb74563568 S-1-5-21-3371554520-2303607865-1091388633-500
dn: CN=3DAdministrator,CN=3DUsers,DC=3Dsamba,DC=3Dexample,DC=3Dcom
objectGUID: 85c452fd-f364-494f-ae80-efdb74563568
sAMAccountName: Administrator
supplementalCredentials:: AAAAAGgIAAAAAAAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAI=
AAg
 ACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgACAAIAAgAC=
AAI
 AAgACAAIAAgACAAUAAEADYA6AEBAFAAcgBpAG0AYQByAHkAOgBLAGUAcgBiAGUAcgBvAHMALQB=
OAG
 UAdwBlAHIALQBLAGUAeQBzADA0MDAwMDAwMDQwMDAwMDAwMDAwMDAwMDNDMDAzQzAwNzgwMDAw=
MDA
 wMDEwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDEwMDAwMDEyMDAwMDAwMjAwMDAwMDBCNDAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMDEwMDAwMDExMDAwMDAwMTAwMDAwMDBENDAwMDAwMDAwMDAwMDAwMD=
AwM
 DAwMDAwMDEwMDAwMDAzMDAwMDAwMDgwMDAwMDBFNDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDE=
wMD
 AwMDAxMDAwMDAwMDgwMDAwMDBFQzAwMDAwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1=
ODA
 wNDEwMDREMDA1MDAwNEMwMDQ1MDAyRTAwNDMwMDRGMDA0RDAwNDEwMDY0MDA2RDAwNjkwMDZFM=
DA2
 OTAwNzMwMDc0MDA3MjAwNjEwMDc0MDA2RjAwNzIwMDU1QjlFRTg1RDU5MTU4NzAxQTNBMDgxOD=
REM
 UNGOTYyRjI4NjJFQTFBNUZBRUUxQTM2NzYyNjFEMTNDNzhGMUUxNTFGQURBMUQzRTM2OTY4M0Y=
4Mj
 U3ODU1RDU3QzJBNTUxQjNBRUIwNTg1QkIxMEJDRDkxRjQwQzIxMkFBMzRDIAAwAQEAUAByAGkA=
bQB
 hAHIAeQA6AEsAZQByAGIAZQByAG8AcwAwMzAwMDAwMDAyMDAwMDAwM0MwMDNDMDA0QzAwMDAwM=
DAw
 MDAwMDAwMDAwMDAwMDAwMzAwMDAwMDA4MDAwMDAwODgwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD=
EwM
 DAwMDAwODAwMDAwMDkwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDA=
wMD
 AwMDUzMDA0MTAwNEQwMDQyMDA0MTAwMkUwMDQ1MDA1ODAwNDEwMDREMDA1MDAwNEMwMDQ1MDAy=
RTA
 wNDMwMDRGMDA0RDAwNDEwMDY0MDA2RDAwNjkwMDZFMDA2OTAwNzMwMDc0MDA3MjAwNjEwMDc0M=
DA2
 RjAwNzIwMDUxQjNBRUIwNTg1QkIxMEJDRDkxRjQwQzIxMkFBMzRDEACQAAIAUABhAGMAawBhAG=
cAZ
 QBzADRCMDA2NTAwNzIwMDYyMDA2NTAwNzIwMDZGMDA3MzAwMkQwMDRFMDA2NTAwNzcwMDY1MDA=
3Mj
 AwMkQwMDRCMDA2NTAwNzkwMDczMDAwMDAwNEIwMDY1MDA3MjAwNjIwMDY1MDA3MjAwNkYwMDcz=
MDA
 wMDAwNTcwMDQ0MDA2OTAwNjcwMDY1MDA3MzAwNzQwMB4AwAMBAFAAcgBpAG0AYQByAHkAOgBXA=
EQA
 aQBnAGUAcwB0ADMxMDAwMTFEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwRTQ1MDlENjBEQ0Q2RE=
ZCM
 Tk5QTA2OUI1ODVFMjk3QjBFNEU4MDM3OEFEMTA4RUI3RDVCQjlEMDYwQzBFRUVEQTlDRDM4RkE=
5N0
 YwREVCRjZEQjE5MTQwOEZCMEE0Njk4RTQ1MDlENjBEQ0Q2REZCMTk5QTA2OUI1ODVFMjk3QjA4=
NjY
 4QkRCNUIzODg4NTNGOTQ3NDkyNEY0M0ZGMzBGNDQwRURCRDVFNzFFNDI4OEIzRUZGMkVBREFEM=
kI3
 MDEzQUUxMDg0NDI5QkE3OEU1MEZGMjEwMUZBREMxMDBCNTNFNUNBQTlBMjlDNTc5QTg4RTdEQz=
RGM
 DdENjhDNDMxNEVGMjc2NUQ3MTk1RUI5NTU5NTY5OUQ4OUYwNEVCOTQ0OTU0OTE3OTlBNzM0QTV=
BOD
 UyQUFGNzNBRDk3RDJGQ0NERDJDQjFDMkVEMUY4NDU2NTY5NDk5NUY2Q0Y2NzZBMkU1Q0FBOUEy=
OUM
 1NzlBODhFN0RDNEYwN0Q2OEM0MzE0RjhDRjBBNjhGRkJBMjA5NzIzODQwMTAwODQxMTA4NkE1R=
DhE
 MzE1OTFGRjdERDNCMEQ3RTcwM0I5MkY1QjQzRTYwQTE3NkY4NkE5MDQzMkI3MkNGMzc4NDVBQU=
U1N
 0U1RjdFNEVGMkQ4QzFCQjc0MEI4NjQxNERFNENCMzZDQTQ5ODhGNTQzMTRDNTlGQTc5M0RBQTg=
4Nk
 Y1MkZDQzAyQTZBODA5Nzc2NUQzMjEyNDNGOEIxQkYwMzRBQTI2RjRCNzg2MEVCRjM2ODQ3OTEx=
MUY
 0M0ZDMkU1RUJFM0JDRkZBNzdEQzk3REEyQUNCNDg0NTYyMEM4N0JDRTE2MEJBN0UxMjkxRUNDM=
Dg3
 RUJBOEM4NUJDQ0I3ODM1RkU2MkVFOEUwNEEwQTc0MDhDQ0EzMUZFQ0Y3RUE0NDIyOEIyQkY1RU=
I4O
 TBENkIwRDg4MDc1RDM4RURGMUM3OTRGNTA4MTQ3RENDMTE1QUY0NDMwMDk3QzM5Q0FCRDEzQkM=
zM0
 IzRDMxNUJFMUVGNDY4RUFERDQyMjNCQ0IzREEwMkM5RkJGMUNEMTg0RDU1RUM4NzVERjk3RTEw=
MkM
 1MzgzREU0NEU0OEJCMzA5MTRBN0JERDg3MjkzMjI3NTNCQ0Q5NkJCOUM2NTM3RUI3NTg4NzFGQ=
0M4
 RjBFMUI5MkU4MjRCMUEwQzI1NTYxNkFEQjM2MjA3OTU0OTk0OTFCQkU2OTUwNAA=3D
unicodePwd:: ZlvvbVoX31GdoQm5Ko2Pqw=3D=3D
Wed Apr 12 16:23:53 2023: pid[286758]: dirsync_loop(): results 0
command: CONFIGURATION=3D--configfile=3D$SMB_CONF_PATH PYTHONPATH=3D$PYTHON=
PATH python3 -m samba.subunit.run  $LOADLIST samba.tests.samba_tool.user 2>=
&1  | python3 /builddir/build/BUILD/samba-4.18.1/selftest/filter-subunit --=
fail-on-empty --prefix=3D"samba.tests.samba_tool.user." --suffix=3D"(ad_dc_=
ntvfs:local)"
expanded command: CONFIGURATION=3D--configfile=3D/builddir/build/BUILD/samb=
a-4.18.1/st/ad_dc_ntvfs/etc/smb.conf PYTHONPATH=3D/builddir/build/BUILD/sam=
ba-4.18.1/bin/python python3 -m samba.subunit.run  $LOADLIST samba.tests.sa=
mba_tool.user 2>&1  | python3 /builddir/build/BUILD/samba-4.18.1/selftest/f=
ilter-subunit --fail-on-empty --prefix=3D"samba.tests.samba_tool.user." --s=
uffix=3D"(ad_dc_ntvfs:local)"
ERROR: Testsuite[samba.tests.samba_tool.user(ad_dc_ntvfs:local)]
REASON: Exit code was 1


--nextPart13245307.uLZWGnKmhe--




