Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F83CF778
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jul 2021 12:13:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dLs1yLhMmUsAzJzwZ5YW/7k43xZhqwn/lV5ynPVKZ2k=; b=kTNJas8xppUSKih0Oe+1rFQRTM
	+eBMctZXBipAKam+5Tz7ZXfutZJBfojsXyQlqw6LlcFlw9aMSYE1Bv2WnOqYlQzFXmifLOFl5qAGI
	rTx2YhnEabxH8nsec4zx0CuoR9ynC47yffyrYyzJp1tYgczA5/fNJ4pVO9Y+tGflBz0z/0mCv1VMB
	spPORdXmSQ7NWr/P145BsRGvZ2YG89Ibj1QwmrDZU6SKeE3CUHtQVmgZXfMwPmnEvpwu2sg7iHiCe
	6UJ8nrVo+Y9imFM3gCrr3DeCti0sWuYdpdjwg2EmwrZvYtvjAExZapt1xuxDk0Bs/K4par7A8QkZt
	+rmkQdgg==;
Received: from ip6-localhost ([::1]:42048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m5mjZ-00FMlT-Tc; Tue, 20 Jul 2021 10:12:17 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:52008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5mjU-00FMlK-Tr
 for samba-technical@lists.samba.org; Tue, 20 Jul 2021 10:12:15 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1627380724.75183@4tCxOHsTVCg1Iz/TtMBfAA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: B7BD7121C23.A85D8
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id B7BD7121C23
 for <samba-technical@lists.samba.org>; Tue, 20 Jul 2021 12:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1626775923;
 bh=dLs1yLhMmUsAzJzwZ5YW/7k43xZhqwn/lV5ynPVKZ2k=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=AW6dWdyl3YdrFtS3zrYX3lqzFEUOuuEXtAhabeQKiiHhH9ClSlKmiG+KHA6O0Kabx
 YuUYy86Ni1WfKrZiCOQD9qPhHXbdOU2LEWih8+m1jh0uv+jr7HDX3ZSMis4qVdkwVt
 rxEl5hL8zR9arBhq0nr8+5WKgWjTaGNrak6SH9te+jm6rEaop7g1EwyUEiM1UKdmE0
 CJRVXaonVMDxIMOoiWVz9Vj0FuUkmdvq8UbJZPuTk0GnYLcato71yL4dFU0yQF60Sp
 xI53Xc9S4+fR5hNOciTZzdd8MuUBiatJ/ewpxVvx34+inBc0UBZHzaC1I2bWB24581
 ePynCQtDEnDMA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 549CA18C2312
 for <samba-technical@lists.samba.org>; Tue, 20 Jul 2021 12:12:06 +0200 (CEST)
Subject: Net ads info mixed outputs. 
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 20 Jul 2021 12:12:06 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d493bb10fc6d806044ed465edc0fc965bbc92df7.camel@samba.org>
References: <525075769.238567.1626685731930@mail.yahoo.com>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Add9T7Dwz1FGPoCiS+Gln93GzkTZiA==
Message-Id: <vmime.60f6a176.61e2.413263a532a9d6@ms249-lin-003.rotterdam.bazuin.nl>
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

Good afternoon everybody,=20

Before i report it as bug..=20
When you have samba setup you can run : "net ads info"
and you get something like this.

net ads info
LDAP server: 192.168.0.10
LDAP server name: server.internal.dom.tld
Realm: INTERNAL.DOM.REALM
Bind Path: dc=3DINTERNAL,dc=3DDOM,dc=3DTLD
LDAP port: 389
Server time: Sat, 17 Jul 2021 13:32:03 CEST
KDC server: 192.168.0.10
Server time offset: 0
Last machine account password change: Sat, 17 Jul 2021 10:55:08 CEST

Now, i noticed my output is a bit different.=20

LDAP server: 0.0.0.0
LDAP server name: (null)
Realm: (null)
Bind Path: (null)
LDAP port: 0
Server time: Mon, 19 Jul 2021 11:57:26 CEST
KDC server: 192.168.0.11
Server time offset: 0
Last machine account password change: Thu, 01 Jan 1970 01:00:00 CET=20

Now runnig it like this, only the DC with FSMO roles get the correct output.=20

net ads info -S dc0.internal.domain.tld

Since i have 3 dc's and my outputs change after some queries,=20
Is this "normal" =3F=20

All servers work fine without errrors, but i would have expected that=20
net ads info always shows output of the server it connects to and not only the FSMO server=3F=20

What did i miss=3F Anyone suggestion =3F


Greetz,=20

Louis


