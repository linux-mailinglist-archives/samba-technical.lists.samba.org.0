Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018E36808F
	for <lists+samba-technical@lfdr.de>; Thu, 22 Apr 2021 14:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OzMy18OyQdU2LEozrkq6S/pD6Qtg1pcbzSg8pYubSKI=; b=rr8nENP9qgnOmSFTCFWtt9UzSo
	LSbNgQQeb4MbQza2nas8Lsa7acvgb11LrS4T5C62NCEECJk0pJyzy2bvmqMBosbrsYuYyLpeXdip/
	QsgOwPJh+mDqWLpNI6BF1Mu+9UGOLP4JUe3ueDM/wUgtW1jeisUpT+MUABk3YPuEw0Y0lT6UGRz1J
	XPnCZ5hqUYq+dmR+A8zLPMQu6sy1t9CyeJQNfpu1PuHP+h+9Iir1FG42xbyOH83DQxRBNCLHdw38r
	tjvvuHHYevEpWMVfU0XAPtMC4/EFOJaUH80L3/uf2sxW/wDByIiNvY8TAmZd1zeH2QHNGM2w4Srij
	FgWT5QiQ==;
Received: from ip6-localhost ([::1]:61914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZYXp-00C4rR-Pv; Thu, 22 Apr 2021 12:34:57 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:40294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZYXk-00C4rK-Mo
 for samba-technical@lists.samba.org; Thu, 22 Apr 2021 12:34:54 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1619698191.14315@ZAXMdKKndohNxXVgMiVwEQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 61CB211F153.A64B1
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 61CB211F153
 for <samba-technical@lists.samba.org>; Thu, 22 Apr 2021 14:09:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619093390;
 bh=OzMy18OyQdU2LEozrkq6S/pD6Qtg1pcbzSg8pYubSKI=;
 h=Subject:From:To:Date:From;
 b=dbAwIiwBT45t28nl+3UhUO2QKWNNjO93F7huyCxQQlXb/Tq4ymEbrclUVlrbF7TOI
 cHNlAUeQw+v1v5I2onLulVjQg/5OFiAlrsOzxSKeC1PETz8JkAJeRiwt4OYII/z+VK
 5A+k71GBNDo2q+t8ZUk8jOPI10udoKrJdzNew/K8MgDdrAkJ3zPPIQ0kGZkMjU0N34
 KQjQCtDQgiieRkxDNfw8NnYKgNZ+g5he10I/+E9k3dmBnAg9gT8F9q9HeLVWr+PHlb
 apa9aiwgfrk+QeDvBTeGBSyPuEd9MPRJ13d5TWUpnv6OBJK8A4oMkUtz8Y4ez/3bq1
 LxUns8/0SUbVQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 2DABA18C2475
 for <samba-technical@lists.samba.org>; Thu, 22 Apr 2021 14:09:54 +0200 (CEST)
Subject: ctdb/utils/etcd/ctdb_etcd_lock python => python3
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 22 Apr 2021 14:09:54 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc3cGcNdC7zXnJFScyuC1esy3LJUQ==
Message-Id: <vmime.60816792.20dc.4140e8fec807bb2@ms249-lin-003.rotterdam.bazuin.nl>
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

Hai,=20

Latest samba build failed on ctdb.=20
I dont know if its really needed but all python references are used with /usr/bin/env python3.=20

Just to besure im not breaking something in ctdb here.=20
Can someone confirm this=3F=20

My fix.

--- a/ctdb/utils/etcd/ctdb_etcd_lock
+++ b/ctdb/utils/etcd/ctdb_etcd_lock
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3


Greetz,=20

Louis


