Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685C21B3AA
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 13:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=fMszE1TWLhwhESrbNtN4CoClUi3KCaDHWQ56qB3+le4=; b=tQpURGBkMDV3VZC4mbNE5CQAX6
	fZVZkhId5esurICo2pY+KOjYofB/SdIRJOWi08czMzm5DxcaG+UyRDgVX7gwRos3O64QOwaGIH7YL
	FcDwASdVum4vE6BwF7JWuVZW/XWDRGhxWqwlD8N64TwqWwMBfMIrr7tFQucqnDHINZrvaUjDo3ZR8
	5xBkyEDT4Tf7OVB/Uj9uBK0oJF6R9somPk8my3bNrVC9kZAsIc4SBoXA5oMpThRTsustZaPMZAQ5f
	4sJ9LwQKqRPnxBVYu95AXeUc2BjoXm6ZuRT6fyccn8RxZxx2RU9Qg4Z9cHFIU98JoQceN11ZAS/qM
	RWIsn8Dw==;
Received: from localhost ([::1]:23334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtqsb-006cnj-GI; Fri, 10 Jul 2020 11:07:45 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:34907) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtqsU-006cnc-F5
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 11:07:41 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1jtqsT-0004le-Ue; Fri, 10 Jul 2020 13:07:37 +0200
Received: by intern.sernet.de
 id 1jtqsT-00086p-R1; Fri, 10 Jul 2020 13:07:37 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>) id 1jtqsT-006eW4-OT
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 13:07:37 +0200
Date: Fri, 10 Jul 2020 13:07:37 +0200
To: samba-technical@lists.samba.org
Subject: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200710110737.GA1585556@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

can someone pleae review and push eventually?

Thanks
Björn

--6c2NcOVqGQ03X4Wi
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Revert-build-add-configure-option-to-control-vfs_sna.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 4bdbf5581656a0a288af24677ebde7fc51c7974e Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Fri, 10 Jul 2020 12:52:04 +0200
Subject: [PATCH] Revert "build: add configure option to control vfs_snapper
 build"

This reverts commit 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a.

We have a working way to disable shared modules and this commits breaks tha=
t.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14437

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 source3/wscript | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/source3/wscript b/source3/wscript
index 587708159740..219d1b3448e1 100644
--- a/source3/wscript
+++ b/source3/wscript
@@ -95,7 +95,6 @@ def options(opt):
=20
     opt.samba_add_onoff_option('glusterfs', with_name=3D"enable", without_=
name=3D"disable", default=3DTrue)
     opt.samba_add_onoff_option('cephfs', with_name=3D"enable", without_nam=
e=3D"disable", default=3DTrue)
-    opt.samba_add_onoff_option('snapper', with_name=3D"enable", without_na=
me=3D"disable", default=3DTrue)
=20
     opt.add_option('--enable-vxfs',
                   help=3D("enable support for VxFS (default=3Dno)"),
@@ -1770,16 +1769,11 @@ main() {
     if Options.options.enable_vxfs:
         conf.DEFINE('HAVE_VXFS', '1')
=20
-    if Options.options.with_snapper:
-        if conf.CHECK_CFG(package=3D'dbus-1', args=3D'--cflags --libs',
+    if conf.CHECK_CFG(package=3D'dbus-1', args=3D'--cflags --libs',
                       msg=3D'Checking for dbus', uselib_store=3D"DBUS-1"):
-            if (conf.CHECK_HEADERS('dbus/dbus.h', lib=3D'dbus-1')
+        if (conf.CHECK_HEADERS('dbus/dbus.h', lib=3D'dbus-1')
                                       and conf.CHECK_LIB('dbus-1', shlib=
=3DTrue)):
-                conf.DEFINE('HAVE_DBUS', '1')
-        else:
-            conf.fatal("vfs_snapper is enabled but prerequisite DBUS libra=
ries "
-                       "or headers not found. Use --disable-snapper to dis=
able "
-                       "vfs_snapper support.");
+            conf.DEFINE('HAVE_DBUS', '1')
=20
     if conf.CHECK_CFG(package=3D'liburing', args=3D'--cflags --libs',
                       msg=3D'Checking for liburing package', uselib_store=
=3D"URING"):
--=20
2.25.1


--6c2NcOVqGQ03X4Wi--

