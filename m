Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 841FBA0823
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 19:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=kNOWOVv3XCvU2xTe0KND9I8NGTgK4WZ/M/WxNAVnHq8=; b=eWL9o9P0C7jy22pCwrrhqgu6pj
	/4u5KM5QgRRD/fhJX1rL2/fyhD4ybFJX/ksv2ndxMVHvVAJD4VKeo+rhkCct7oY9/+blv2oscT1/7
	pBqr4XCbfaadtBk1wTTfrDh7/jp8jtsB5rTfwI7/+2i/2SmX6ERp1GygkaSV8nyj7kJHNOhSEOJLO
	jU2L3ODfsc9+CMav2bkhdnLMxp5IxbIKeBg5ysjOf/Vc0YB9LagK2qrcIoJ4lzGMb7P1gmU9pSCNG
	O/bPBVBXy4zVCWDh2dZedGv9bs7e3OQh35QES+UPGZFb/Jvtdt7dh0Bhm8GMJo9prkYqtLLi020QT
	SIZHabBA==;
Received: from localhost ([::1]:28792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i31Qm-0002PT-PN; Wed, 28 Aug 2019 17:08:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i31Qi-0002PM-HG
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 17:08:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=kNOWOVv3XCvU2xTe0KND9I8NGTgK4WZ/M/WxNAVnHq8=; b=s+RVcEpgEMleMrIi8yERXFRilt
 XgEa5Q/P3G3mcX6DsGtbLURggQ6Hup5CqLmi13wTX8MZgPAzKX88wVO+HhOVX8AJf07gHMbnVxKHV
 fcFJv/CbplNiLM6UM7TQHE/o2p03uK/WuyJhmn897mJ6yTQWZsEba50AKuT/vOwulOdM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i31Qi-0000wH-4c
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 17:08:20 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] re-add pidl install
Openpgp: preference=signencrypt
Message-ID: <a4cd67f4-ae87-1ac4-7053-1946a19bf7b0@samba.org>
Date: Wed, 28 Aug 2019 19:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="4lR9zutKNRv7xArPAgyfMrtoSmZDwEgJl"
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4lR9zutKNRv7xArPAgyfMrtoSmZDwEgJl
Content-Type: multipart/mixed; boundary="QgordOpgE7gZbFUmjIlvKAHy5K6i2fdCo";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <a4cd67f4-ae87-1ac4-7053-1946a19bf7b0@samba.org>
Subject: [PATCH] re-add pidl install

--QgordOpgE7gZbFUmjIlvKAHy5K6i2fdCo
Content-Type: multipart/mixed;
 boundary="------------B697E9B21625B60635D2754E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B697E9B21625B60635D2754E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

attached a patch to re-add the pidl waf install. At least openchange,
although a dormant project atm, requires pidl to be available in the syst=
em.

https://gitlab.com/samba-team/devel/samba/pipelines/78660819

Please review & push.

Thanks,
Guenther

--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org

--------------B697E9B21625B60635D2754E
Content-Type: text/x-patch;
 name="pidl.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pidl.patch"

=46rom 838457ac4f9f3f6c1bb5936738566210a62cbdc5 Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?G=3DC3=3DBCnther=3D20Deschner?=3D <gd@samba.org>
Date: Tue, 27 Aug 2019 15:25:13 +0200
Subject: [PATCH] Revert "waf: install: Remove installation of PIDL and
 manpages."

This reverts commit e24e344d0da58013fd5fa404529fe1d25ef403bf.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14103

Guenther

Signed-off-by: Guenther Deschner <gd@samba.org>
---
 pidl/lib/wscript_build | 37 +++++++++++++++++++++++++++++++++++++
 pidl/wscript           | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 pidl/lib/wscript_build

diff --git a/pidl/lib/wscript_build b/pidl/lib/wscript_build
new file mode 100644
index 00000000000..54b3170c4e2
--- /dev/null
+++ b/pidl/lib/wscript_build
@@ -0,0 +1,37 @@
+#!/usr/bin/env python
+
+# install the pidl modules
+bld.INSTALL_FILES(bld.env.PERL_LIB_INSTALL_DIR,
+                  '''
+                  Parse/Pidl.pm
+                  Parse/Pidl/Samba4.pm
+                  Parse/Pidl/CUtil.pm
+                  Parse/Pidl/Expr.pm
+                  Parse/Pidl/Wireshark/Conformance.pm
+                  Parse/Pidl/Wireshark/NDR.pm
+                  Parse/Pidl/ODL.pm
+                  Parse/Pidl/Dump.pm
+                  Parse/Pidl/Util.pm
+                  Parse/Pidl/Samba4/Header.pm
+                  Parse/Pidl/Samba4/COM/Header.pm
+                  Parse/Pidl/Samba4/COM/Proxy.pm
+                  Parse/Pidl/Samba4/COM/Stub.pm
+                  Parse/Pidl/Samba4/TDR.pm
+                  Parse/Pidl/Samba4/NDR/Server.pm
+                  Parse/Pidl/Samba4/NDR/Client.pm
+                  Parse/Pidl/Samba4/NDR/Parser.pm
+                  Parse/Pidl/Samba4/Python.pm
+                  Parse/Pidl/Samba4/Template.pm
+                  Parse/Pidl/IDL.pm
+                  Parse/Pidl/Typelist.pm
+                  Parse/Pidl/Samba3/ClientNDR.pm
+                  Parse/Pidl/Samba3/ServerNDR.pm
+                  Parse/Pidl/Compat.pm
+                  Parse/Pidl/NDR.pm
+                  ''',
+                  flat=3DFalse)
+
+if not bld.CONFIG_SET('USING_SYSTEM_PARSE_YAPP_DRIVER'):
+    bld.INSTALL_FILES(bld.env.PERL_LIB_INSTALL_DIR,
+                      'Parse/Yapp/Driver.pm',
+                      flat=3DFalse)
diff --git a/pidl/wscript b/pidl/wscript
index 01b71bd8b27..a2a15d36851 100644
--- a/pidl/wscript
+++ b/pidl/wscript
@@ -32,11 +32,49 @@ def configure(conf):
     # Check if perl(Parse::Yapp::Driver) is available.
     check_system_perl_module(conf, "Parse::Yapp::Driver", 1.05)
=20
+    # we need a recent version of MakeMaker to get the right man page na=
mes
+    if conf.CHECK_PERL_MANPAGE():
+        conf.env.PERLMAN1EXT =3D conf.CHECK_PERL_MANPAGE(section=3D'1')
+        conf.env.PERLMAN3EXT =3D conf.CHECK_PERL_MANPAGE(section=3D'3')
+        conf.DEFINE('HAVE_PERL_MAKEMAKER', 1)
+
     # yapp is used for building the parser
     conf.find_program('yapp', var=3D'YAPP')
     conf.find_program('pod2man', var=3D'POD2MAN')
=20
 def build(bld):
+    bld.INSTALL_FILES('${BINDIR}', 'pidl', chmod=3DMODE_755, perl_fixup=3D=
True)
+
+    bld.RECURSE('lib')
+
+    if not bld.CONFIG_SET('HAVE_PERL_MAKEMAKER'):
+        return
+
+    pidl_manpages =3D {
+        'pidl': 'man1/pidl.${PERLMAN1EXT}',
+        'lib/Parse/Pidl/NDR.pm': 'man3/Parse::Pidl::NDR.${PERLMAN3EXT}',=

+        'lib/Parse/Pidl/Wireshark/Conformance.pm': 'man3/Parse::Pidl::Wi=
reshark::Conformance.${PERLMAN3EXT}',
+        'lib/Parse/Pidl/Dump.pm': 'man3/Parse::Pidl::Dump.${PERLMAN3EXT}=
',
+        'lib/Parse/Pidl/Util.pm': 'man3/Parse::Pidl::Util.${PERLMAN3EXT}=
',
+        'lib/Parse/Pidl/Wireshark/NDR.pm': 'man3/Parse::Pidl::Wireshark:=
:NDR.${PERLMAN3EXT}'
+    }
+
+    for k in pidl_manpages.keys():
+        pidl_manpages[k] =3D bld.EXPAND_VARIABLES(pidl_manpages[k])
+
+    # use perl to build the manpages
+    bld.env.pidl_srcdir =3D os.path.join(bld.srcnode.abspath(), 'pidl')
+
+    bld.SET_BUILD_GROUP('final')
+    if 'POD2MAN' in bld.env and bld.env['POD2MAN'] !=3D '':
+        for src in pidl_manpages.keys():
+            manpage =3D pidl_manpages[src]
+            section =3D manpage.rsplit( ".", 1)[1]
+            bld(rule=3D'${POD2MAN} -c "Samba Documentation" -s %s ${SRC}=
 ${TGT}' % section,
+                shell=3DTrue,
+                source=3Dsrc,
+                install_path=3Dos.path.dirname(bld.EXPAND_VARIABLES('${M=
ANDIR}/'+manpage)),
+                target=3Dos.path.basename(manpage))
=20
     # we want to prefer the git version of the parsers if we can.
     # Only if the source has changed do we want to re-run yapp
--=20
2.21.0


--------------B697E9B21625B60635D2754E--

--QgordOpgE7gZbFUmjIlvKAHy5K6i2fdCo--

--4lR9zutKNRv7xArPAgyfMrtoSmZDwEgJl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXWa0+AAKCRBI6TdojuEW
iJymAJ4jWiYvhBTJmSZR4mEmnbaHmF4Q6ACeIxzz1iYUFfzF0BLg1c78SO406K8=
=ZIly
-----END PGP SIGNATURE-----

--4lR9zutKNRv7xArPAgyfMrtoSmZDwEgJl--

