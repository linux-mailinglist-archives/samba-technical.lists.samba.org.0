Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCB54B716
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 13:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=i3MQuJI26p2TmvfiEiIeFAsYYvM6GGnDdye0a47cg8g=; b=wNrx4Yz4aqQC6xte3hXmIw6En4
	X3YVgxZKHi5Th9Jw44Y8JGi47oGJXXoPcACDI6zMtIpsZdnWHSSth/iDtd2K6mkEUiWcnV7bIGc8h
	YG3MvVkRFA/cAcAagQs75CRsE+MEhWUZp0nA84TeyO4jIURZJr1SjWiMKTumZ09n12YlmnJgDzt7Z
	PWJRW4ZqaTrwMENai9p3t8Yj8GpEvM7HfVEIPMS7HLFiWTOPIBDocP0TMXryJl4BzqsK2UnoozDcr
	OBsAZ4gNPDYcBZceP/jX09SiNELInc4eWqYuMGWiImXhseNtnlIDj1d+ydjWJGNSSjEsYPIQBQdrP
	RwPO90IA==;
Received: from localhost ([::1]:49696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdYoK-000L48-3a; Wed, 19 Jun 2019 11:31:28 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:45177) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdYoF-000L40-KU
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 11:31:26 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1hdYoE-0005pi-5C; Wed, 19 Jun 2019 13:31:22 +0200
Received: by intern.sernet.de
 id 1hdYoE-0005AQ-1E; Wed, 19 Jun 2019 13:31:22 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1hdYoD-0002QE-Te
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 13:31:21 +0200
Date: Wed, 19 Jun 2019 13:31:21 +0200
To: samba-technical@lists.samba.org
Subject: Re: RFC: deprecate allocation roundup size
Message-ID: <20190619113121.GA9207@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
References: <20190618144358.GA6800@sernet.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <20190618144358.GA6800@sernet.de>
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


--hHWLQfXTYDoKhP50
Content-Type: multipart/mixed; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-18 at 16:43 +0200 Bj=F6rn JACKE via samba-technical sent off:
> As this performance trick is not needed for modern SMB clients any more, =
it
> might also be be better idea to just reset the value of "allocation round=
up
> size" to 4k again, deprecate the option and remove it with one of the next
> releases completely to behave more windows standard conforming and to jus=
t cut
> off this source of irritation.

thanks for your feedback on this.

Attached is a small patch set, which changes the default to 0 now, documents
that and finally deprecates the parameter.

Review and push welcome :-)

Thanks
Bj=F6rn

--MGYHOYXEY6WxJCY8
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="allocation-roundup-size-away.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 553781e020bc02fbd770f45c6b2fe232b112d1d8 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bj@sernet.de>
Date: Wed, 19 Jun 2019 13:04:55 +0200
Subject: [PATCH 1/3] param: change default of "allocation roundup size" to 0

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 lib/param/loadparm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/param/loadparm.c b/lib/param/loadparm.c
index e03c1556d7e0..b2982dec6107 100644
--- a/lib/param/loadparm.c
+++ b/lib/param/loadparm.c
@@ -2889,7 +2889,7 @@ struct loadparm_context *loadparm_init(TALLOC_CTX *me=
m_ctx)
=20
 	lpcfg_do_global_parameter(lp_ctx, "show add printer wizard", "yes");
=20
-	lpcfg_do_global_parameter(lp_ctx, "allocation roundup size", "1048576");
+	lpcfg_do_global_parameter(lp_ctx, "allocation roundup size", "0");
=20
 	lpcfg_do_global_parameter(lp_ctx, "ldap page size", "1000");
=20
--=20
2.17.1


=46rom 9aa693f65d09be2f6e870da539ca18a8ba48f9c1 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bj@sernet.de>
Date: Wed, 19 Jun 2019 13:15:54 +0200
Subject: [PATCH 2/3] docs-xml: improve documentation and new default of
 "allocation roundup size"

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 .../smbdotconf/tuning/allocationroundupsize.xml    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs-xml/smbdotconf/tuning/allocationroundupsize.xml b/docs-xm=
l/smbdotconf/tuning/allocationroundupsize.xml
index eaea467bc390..aabbba32655a 100644
--- a/docs-xml/smbdotconf/tuning/allocationroundupsize.xml
+++ b/docs-xml/smbdotconf/tuning/allocationroundupsize.xml
@@ -4,17 +4,21 @@
                  xmlns:samba=3D"http://www.samba.org/samba/DTD/samba-doc">
 <description>
     <para>This parameter allows an administrator to tune the=20
-    allocation size reported to Windows clients.  The default=20
-    size of 1Mb generally results in improved Windows client
-    performance.   However, rounding the allocation size may cause
+    allocation size reported to Windows clients. This is only
+    useful for old SMB1 clients because modern SMB dialects
+    eliminated that bottleneck and have better performance by
+    default.  Using this parameter may cause
     difficulties for some applications, e.g. MS Visual Studio.
     If the MS Visual Studio compiler starts to crash with an
     internal error, set this parameter to zero for this share.
+    Settings this parameter to a large value can also cause
+    small files to allocate more space on the disk than
+    needed.
     </para>
=20
     <para>The integer parameter specifies the roundup size in bytes.</para>
 </description>
=20
-<value type=3D"default">1048576</value>
-<value type=3D"example">0<comment>(to disable roundups)</comment></value>
+<value type=3D"default">0</value>
+<value type=3D"example">1048576<comment>(to set it to the former default o=
f 1 MiB)</comment></value>
 </samba:parameter>
--=20
2.17.1


=46rom 533090c97320223706b253147e1d621f08af25a0 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bj@sernet.de>
Date: Wed, 19 Jun 2019 13:20:34 +0200
Subject: [PATCH 3/3] docs-xml: deprecate allocation roundup size parameter

---
 docs-xml/smbdotconf/tuning/allocationroundupsize.xml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs-xml/smbdotconf/tuning/allocationroundupsize.xml b/docs-xm=
l/smbdotconf/tuning/allocationroundupsize.xml
index aabbba32655a..08aa621fcc53 100644
--- a/docs-xml/smbdotconf/tuning/allocationroundupsize.xml
+++ b/docs-xml/smbdotconf/tuning/allocationroundupsize.xml
@@ -1,6 +1,7 @@
 <samba:parameter name=3D"allocation roundup size"
                  context=3D"S"
                  type=3D"bytes"
+                 deprecated=3D"1"
                  xmlns:samba=3D"http://www.samba.org/samba/DTD/samba-doc">
 <description>
     <para>This parameter allows an administrator to tune the=20
@@ -15,6 +16,9 @@
     small files to allocate more space on the disk than
     needed.
     </para>
+    <para>This parameter is deprecated and will be removed in
+    one of the next Samba releases.
+    </para>
=20
     <para>The integer parameter specifies the roundup size in bytes.</para>
 </description>
--=20
2.17.1


--MGYHOYXEY6WxJCY8--

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXQodBwAKCRAxQwafzsNC
Pw9pAP9EkS43Us6l4066DYH7xU3nh/s46mIrSVGXvCXXxNZ/mQEA4Rsrlx7GewQQ
XZk84oV+5/JesVF46LxxRsChb77EKgU=
=fPef
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--

