Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D061D82006
	for <lists+samba-technical@lfdr.de>; Mon,  5 Aug 2019 17:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XHpw2oQkx6o9ZJzeTvhQN2TgySYlg6YcUjeaHya9xnQ=; b=bvRtB+3sqWfcYpl7/5JwB0MBYq
	HDugpR5Xtr5j85RUd6Gkz+KWKzbTj6ON/AiiR+X/g4HTNOyimcG2XuMckjzWIN9/5CzV6UeeRZqmx
	ewbbHAM9LYSDNtIvlrLeeiLZfJFWMhp/NXTmpTZHUUJciaZpiVbPA4YLM7iKbHfVsJlR+Pav9ToVU
	Ha4/hNSUcz+12JW8+YAnGgfQIsiNggiZwvGarI4f85yoVRzFPIlU8Z7n6cZUc5khtj92p92aCcA/w
	AKvJ9LG+4C4t6sro3pBj8Q8rIrHADfcg9TwwG8xp69Vdv2/me67TgxhcoJkEV2z1plv25mUy/MHSS
	HIsIfadw==;
Received: from localhost ([::1]:56288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1huepC-004Iw5-Bd; Mon, 05 Aug 2019 15:23:02 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:52139) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1huep8-004Ivy-7O
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 15:23:00 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1huep7-0008L1-OV; Mon, 05 Aug 2019 17:22:57 +0200
Received: by intern.sernet.de
 id 1huep7-0006dK-Iy; Mon, 05 Aug 2019 17:22:57 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1huep7-00074X-EQ
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 17:22:57 +0200
Date: Mon, 5 Aug 2019 17:22:57 +0200
To: samba-technical@lists.samba.org
Subject: [PATCH] doc: improve vfs objects parameter description
Message-ID: <20190805152257.GA27074@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
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


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

review and push appreciated for this ...

Cheers
Björn

--fdj2RfSjLxBAspz7
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-doc-improve-vfs-objects-parameter-description.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 1489e24c085b54838bc3afea8fea5052e4547ff7 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Mon, 5 Aug 2019 17:16:32 +0200
Subject: [PATCH] doc: improve vfs objects parameter description

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 docs-xml/smbdotconf/vfs/vfsobjects.xml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs-xml/smbdotconf/vfs/vfsobjects.xml b/docs-xml/smbdotconf/v=
fs/vfsobjects.xml
index 05903baf1c6d..f8f33b55f565 100644
--- a/docs-xml/smbdotconf/vfs/vfsobjects.xml
+++ b/docs-xml/smbdotconf/vfs/vfsobjects.xml
@@ -7,8 +7,9 @@
 	<para>This parameter specifies the backend names which=20
 	are used for Samba VFS I/O operations.  By default, normal=20
 	disk I/O operations are used but these can be overloaded=20
-	with one or more VFS objects. </para>
-</description>
+	with one or more VFS objects. Be aware that the definition of this
+	parameter will overwrite a possible previous definition of the
+	vfs objects parameter.</para> </description>
=20
 <value type=3D"default"/>
 <value type=3D"example">extd_audit recycle</value>
--=20
2.17.1


--fdj2RfSjLxBAspz7--

