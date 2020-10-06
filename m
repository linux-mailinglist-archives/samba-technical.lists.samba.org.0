Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD92853B4
	for <lists+samba-technical@lfdr.de>; Tue,  6 Oct 2020 23:12:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SjETiQZxycjeDGl2j7XUBIO+TxC6akj5NxlT4+jjYHU=; b=U4Wb7JF0Xn1a1eem+UzqrQB4Nk
	/1SduP5bCzPNwSYK4nZKIOD+bOH+y+ZY5fztZSixZ87YM/SJjD2ug9CfXikI+S5d2+7tddbiHPq6z
	bDQNbb37+fq1qDyJ5lu8uKnIbONGJEL+R4gpJtB5XADUIvSVfMWkGBE7dHF868kc1Xe9u+jpUxk7n
	NEFP2mWyhJaE6eBajoYwlEXAN7ok6c96y49x7D+Ngy2wVqJXBgXKvcTa6Hx7/kn+OxCj8sH8Dtq1s
	gJQqLG/RJ+9dVAP+qSUF3/SZUZWQpXuqcsc7A7dE7PqO5nZYxom33eBmdtrZyWwHa7KPc+RRbf262
	CTPmXl8w==;
Received: from ip6-localhost ([::1]:24060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kPuFd-00B2Ty-Et; Tue, 06 Oct 2020 21:12:01 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:37741) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kPuFZ-00B2Tr-6t
 for samba-technical@lists.samba.org; Tue, 06 Oct 2020 21:11:59 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1kPuFY-0005Ce-7v; Tue, 06 Oct 2020 23:11:56 +0200
Received: by intern.sernet.de
 id 1kPuFY-0001DU-2V; Tue, 06 Oct 2020 23:11:56 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>) id 1kPuFP-002v8G-5Y
 for samba-technical@lists.samba.org; Tue, 06 Oct 2020 23:11:47 +0200
Date: Tue, 6 Oct 2020 23:11:47 +0200
To: samba-technical@lists.samba.org
Subject: PATCH: fix doc of spoolss:architecture
Message-ID: <20201006211147.GA696217@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="d6Gm4EdcadzBjdND"
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


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

can someone review and push, please?

Thanks
Björn

--d6Gm4EdcadzBjdND
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-docs-fix-default-value-of-spoolss-architecture.patch"
Content-Transfer-Encoding: quoted-printable

=46rom ef34f5270260549aeaa039d809fbc5e329faa0db Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Tue, 6 Oct 2020 23:05:24 +0200
Subject: [PATCH] docs: fix default value of spoolss:architecture

"Windows x64" is the default here since a couple of years already.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14522

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 docs-xml/smbdotconf/printing/spoolssarchitecture.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs-xml/smbdotconf/printing/spoolssarchitecture.xml b/docs-xm=
l/smbdotconf/printing/spoolssarchitecture.xml
index 1eccf9f58cfd..dae739056638 100644
--- a/docs-xml/smbdotconf/printing/spoolssarchitecture.xml
+++ b/docs-xml/smbdotconf/printing/spoolssarchitecture.xml
@@ -8,6 +8,6 @@
 	architecture. Samba's spoolss print server architecture can be changed us=
ing
 	this parameter.</para>
 </description>
-<value type=3D"default">Windows NT x86</value>
-<value type=3D"example">Windows x64</value>
+<value type=3D"default">Windows x64</value>
+<value type=3D"example">Windows NT x86</value>
 </samba:parameter>
--=20
2.25.1


--d6Gm4EdcadzBjdND--

