Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B061B237D
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 12:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=TCXzEZPMgmWVgoQbntxu8In8pHP9IZVHXLrSWeD2Ipo=; b=sXxuLzDsb4hwJdD4SPfe+noeaD
	6zKBP4eBBhr7/45GERzGnHh/R1VfSQenRiSfyg3nqQSUhSmW2dnCZMEZfh01dOITlASGnCAcFCqsV
	W/xoRee1dvOPIOT9TEa/2W+/YiUMXIJ/117u9od+fxqjI9+XjREPYiZiNrybobWTLKnmv2WQ/qN8E
	AgER27tGlAchBPIUnFVld+LZuEmgUfWK/QSGE9YbYSy0NB+I5vPxa84JA9KoMwr6i1qYQueaCtIvV
	ZnmGshYH/DToXX9x2Y+ZM1J5mD1sMsz9LePueMbaf2agCRm3cujpH/cdJffjFPl570zrWitdtAaZM
	KdEB1qog==;
Received: from localhost ([::1]:20538 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQph6-001MvJ-4E; Tue, 21 Apr 2020 09:59:56 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:33362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQpgk-001MvC-4M
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 09:59:51 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1588067984.52053@10/shnJZPQJveTbP9QXW/Q
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 5897111F295.A6459
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 5897111F295
 for <samba-technical@lists.samba.org>; Tue, 21 Apr 2020 11:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1587463183;
 bh=h92CtMBgQet7x5tq1srOoqSUmerg06zD/4C8Ru5xXD0=;
 h=Subject:From:To:Date:From;
 b=m/bMTPNuzFZXLCp5Qyuc+JYGLFC9qnORCQ1v0cpXLDxsWMRjLMdQ0DTstSy6qpyjI
 XcsrH/WAGsLlAXTTV2U4dxmkBa9UltfapYMyBEcg1AQrdfZHgZIrzhujRgnqaGf9/V
 5WkhH+fVOkcbGbxFEWXzlzZApMzlPQnXiGWWuHUuHuDMziAwkQ4toNMDmnYWx8agp5
 pbN6HECbcG5HnsGjifHeIt2eejMjIPhc3z7u3EOBeRH4BqnZWgJ2n5swKRLtQxhfhZ
 6tVG4lS67lWBTwBJQZl37mCaq0vsGdO6FKR2dyauG2KYHK4XIlUDSZUc6YTyDfEWkb
 hORMgcxWqmC8A==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id C95DD3AF8C
 for <samba-technical@lists.samba.org>; Tue, 21 Apr 2020 11:59:25 +0200 (CEST)
Subject: question on testing 4.12.1 on Ubuntu 20.04 Focal.. 
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 21 Apr 2020 11:59:25 +0200
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdYXw4nSb/ejsrdTQGCawYgL5atO/g==
Message-Id: <vmime.5e9ec3fd.695.3f5eadeb60ec1f4d@ms249-lin-003.rotterdam.bazuin.nl>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai guys,=20=0D=0A=A0=0D=0AI noticed the following with the first package=
s on Ubuntu 20.04..=20=0D=0ASo far i seen it installs nicely but i notice=
d the message below.=20=0D=0ACan we ignore it, i suspect this is a python=
 3.8 thingy .. but as im not a coder ...=20=0D=0AWell, anyone suggestions=
=3F=A0 :-)=20=0D=0A=A0=0D=0A=A0=0D=0ASetting up python3-samba (2:4.12.1+d=
fsg-0.1focal1) ...=0D=0A/usr/lib/python3/dist-packages/samba/emulate/traf=
fic_packets.py:339: SyntaxWarning: "is" with a literal. Did you mean "=3D=
=3D"=3F=0D=0A=A0 if (filter is None or filter is '') and scope !=3D SCOPE=
_BASE:=0D=0A=0D=0AGreetz,=20=0D=0A=A0=0D=0ALouis=0D=0A=A0=0D=0A=A0=0D=0A=0D=
=0A=A0=0D=0A
