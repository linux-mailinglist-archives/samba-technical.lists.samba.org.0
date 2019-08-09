Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BA48712F
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2019 07:00:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=dXNHRmvB/22Hxgiwm4OjuTW/ZkUIzlyRuDqPMk8x2to=; b=MXnAVG7dSPins218qfryzlzN3F
	jNEL3DV+jnBTu9i7igBX45DAP1DQ6wkC1QAi2qoXAifNCisTFTZ6/DPE1Tt/4fMr2ZzsyWvM4xX/z
	dLj88fn3OX2EzZyoVkRG/GLDkTy71zQXOxPYMo+3lquhJeX6I+qxAm5vnDapPSccnlcrOcI4mnHIK
	4cLeLBvraqZA4Fagk+xN8OtEoNu3ZcXgn1bHTl13T5qbHv+LXuTOaPp4006Xv9s1Vy/OmZ303iVYv
	lIFICobz8hbG508RWhTMaot+5VGNfZA40DF+D33MI/4HBAlh6NPaPt98exoDbfR9MvyaRUNsAOndi
	MU/OnAug==;
Received: from localhost ([::1]:40634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvwzo-005JCu-OK; Fri, 09 Aug 2019 04:59:20 +0000
Received: from vic-mtaout2.csiro.au ([2405:b000:b00:220::64:38]:9325) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hvwzg-005JCn-Ob
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 04:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=csiro.au; i=@csiro.au; q=dns/txt; s=dkim;
 t=1565326752; x=1596862752;
 h=from:to:subject:date:message-id:mime-version;
 bh=wci/1l80hSXSl7NclzJE11IaZN0mcx12VedmnHBhJBc=;
 b=SKl9IkfryDMuVhgIt/HrEFWxyNbcmTmqEPRESsmzT6UBiN266zxPqmo6
 BQwFfH6G6d0Oy7MUNz+dBx64nlxlIyAgS8W9dpWMeene4+Ef48/YnkkNz
 Kl9QBP7oJN4RCQ52ATxZOJutvfeSqIMVOnLorN560GYn4ZBXU1C3GgjxX Y=;
IronPort-SDR: H9Uxw0C3HlbplWtrEwjl0SK/KcHWOYSmZkmXWkPJXs5K/PKN0ibXgOYKcoKxPvQHm6AQ5SVK/S
 NMk9w7jqSNJQ==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3AiroYOxOv6+fr+wsn+uYl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEu6o/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
 =?us-ascii?q?oZkYMTlg0kDtSCDBjeJeT2bip8J8RPTEds5X2TOlNUAsG4bkCB6nA=3D?=
Received: from exch1-mel.nexus.csiro.au ([IPv6:2405:b000:302:71::85:121])
 by vic-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
 09 Aug 2019 14:43:10 +1000
Received: from exch3-mel.nexus.csiro.au (2405:b000:302:71::85:123) by
 exch1-mel.nexus.csiro.au (2405:b000:302:71::85:121) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 9 Aug 2019 14:43:09 +1000
Received: from exedge2.csiro.au (150.229.64.34) by exch3-mel.nexus.csiro.au
 (138.194.85.123) with Microsoft SMTP Server (TLS) id 15.0.1395.4 via Frontend
 Transport; Fri, 9 Aug 2019 14:43:10 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.52)
 by exedge2.csiro.au (150.229.64.34) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 9 Aug 2019 14:43:02 +1000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E447Dlrwu7i7Eg1FVIZBLUZLlVhKrfuK1ua03FXiK/+Vp6hUjzeoRYYteADmpUk48W7mDf8pVZ3geHcPIrYlTm3uSnISfWVdAUWZppz/+xL0vp7pfEqACnR82XLEOrxZhzoe49TzaZ6hB/pepzFcDWB2+QXbfjz9JHXesWYa/ik8fWBv2R1LzB3XFM6JeXenTqLE0k7k3x1ril+wT80cqlV4PPFHTPvqtvm3rp3cxqPz/UhwJwRqlE61Ttpmf5FMEwSOhzZiXwYEKD1+VQqTS2y0XakQyuXws31thjhnJFP7o/T3yrdEz01EW9XCiagbvKb1FZlY3pR1gBdNCk1CEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXNHRmvB/22Hxgiwm4OjuTW/ZkUIzlyRuDqPMk8x2to=;
 b=h5TuQ5WMTKR9FW7Eq2oe26XMT6MHZU/02Y2buoyzo/swOMT6EVT1Kiy/UUixXc1KXd5a9P9kMvf3jxp3b67iNdgeiYmkuiHvZOj6L22vJ9XphjkSWAqFDjoIg9WUPGOvG3z6+eqcvWzJoy1QhIC7VgGBh5bPEYC6ZkaB0ffCxoo9ruElXldAtDmYcBZG3OoDusfbwRiJ+Orp00QmHjLt4ZkqBC/3UjqR4GAGX2+Db7QNTgynlSoC00ZNBPd/okvozQ9MOFbuY/08zMWOdEuFzjhJW36v4Ca3/qp8suLwGtle65mCLvH6z6+QjgceSClwEuTIdclDgm2lcZrl8TzrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=csiro.au;dmarc=pass action=none header.from=csiro.au;dkim=pass
 header.d=csiro.au;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=CSIROAU.onmicrosoft.com; s=selector2-CSIROAU-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXNHRmvB/22Hxgiwm4OjuTW/ZkUIzlyRuDqPMk8x2to=;
 b=y7DQMjEeZX+R1YOs0EE94OYhLrHtBDoNECfkZx/CuMTORruol26GWepsmE30Ec+piieqjzZylbj93zB5JVnl8uMC1FB/DvvmgjLjlx8nunDtLLPcytqbdtYZklyMGeklIbY1ckC4BNXS88RaNLbQMd1jjmv2y7XMYy2cLNZhj+8=
Received: from ME2PR01MB2900.ausprd01.prod.outlook.com (52.134.205.14) by
 ME2PR01MB4596.ausprd01.prod.outlook.com (20.178.183.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 04:43:09 +0000
Received: from ME2PR01MB2900.ausprd01.prod.outlook.com
 ([fe80::7884:c852:6c16:e31f]) by ME2PR01MB2900.ausprd01.prod.outlook.com
 ([fe80::7884:c852:6c16:e31f%7]) with mapi id 15.20.2136.022; Fri, 9 Aug 2019
 04:43:09 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: [PATCH] net ads dns register does not delete old AAAA records
Thread-Topic: [PATCH] net ads dns register does not delete old AAAA records
Thread-Index: AdVObOuu1ffaRF3ASHi3GHfnc3R9CA==
Date: Fri, 9 Aug 2019 04:43:09 +0000
Message-ID: <ME2PR01MB29008336F5FD21911D8841488ED60@ME2PR01MB2900.ausprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Martin.Sheppard@csiro.au; 
x-originating-ip: [2405:b000:402:2::19:101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 211ef1dd-17e2-4716-4c51-08d71c8413f6
x-ms-traffictypediagnostic: ME2PR01MB4596:
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8inNat4m0sElkW5e1b+ncz9XfK2xI6zFHfPohufICW2EH9o3WzIvW0GGu70ilxZo8tRk9FZ1r7eSBp8WftpMXG2sIApoogxhzGZBPyqy9b0erCL1jTsaQs1nXkxa6VTDfcwSxLzGJpwRxwtF0O9lUsV/x/or3B+yI+ckuWfPHlzopPnuS4Sp1WxKdUVKJQ0ovHpeBJao8xVmyjpABNRrszlgluhwN95tO1cdxAwtGLzk88bjuJ//QK04NA0Zd0CheAcFz4C+GAOLnS0M9YlhrE0SgL++v12m+Y6CBpNILiZUdmhQtPpp+46VrUe4S52KCYYtBUaEMAmUpZhay26T995VO7lgp41kyQp8zcxCG7l0ge18OotxSirxXvQPWvdx2qg5YPTjchWR/AJfL3/cpYLs5NaoQ2gcB2l+gXI3/QE=
Content-Type: multipart/mixed;
 boundary="_002_ME2PR01MB29008336F5FD21911D8841488ED60ME2PR01MB2900ausp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 211ef1dd-17e2-4716-4c51-08d71c8413f6
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: she315@csiro.au
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB4596
X-OriginatorOrg: csiro.au
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
From: "Sheppard, Martin \(IM&T,
 Waite Campus\) via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Sheppard, Martin \(IM&T, Waite Campus\)" <Martin.Sheppard@csiro.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_ME2PR01MB29008336F5FD21911D8841488ED60ME2PR01MB2900ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Net ads dns register has a bug where it will delete all the existing A reco=
rds before registering new A and AAAA records in dynamic DNS, but it doesn'=
t delete existing AAAA records. Therefore, the IPv6 addresses for a machine=
 can build up and old ones may never be cleaned up.

Windows will send a Dynamic DNS Update packet that looks like:
- Ensure No CNAME Records exist for the name (abort update if they do)
- Delete any existing A Records
- Delete any existing AAAA Records
- Add list of current A Records
- Add list of current AAAA Records

Samba sends the same packet, except it is missing the "Delete any existing =
AAAA Records" command in the packet.=20

The attached patch adds the extra command into the packet and allows old IP=
v6 addresses to be removed just like IPv4 addresses are already. I have bui=
lt and tested the patch and it has the desired effect on the resulting DNS =
entries in a Windows domain.=20

Regards,

Martin.



--_002_ME2PR01MB29008336F5FD21911D8841488ED60ME2PR01MB2900ausp_
Content-Type: application/octet-stream; name="dyndns-AAAA-delete.patch"
Content-Description: dyndns-AAAA-delete.patch
Content-Disposition: attachment; filename="dyndns-AAAA-delete.patch";
	size=666; creation-date="Fri, 09 Aug 2019 03:52:33 GMT";
	modification-date="Fri, 09 Aug 2019 03:52:33 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2xpYi9hZGRucy9kbnNyZWNvcmQuYyBiL2xpYi9hZGRucy9kbnNyZWNvcmQu
YwppbmRleCAwZDE0OTM3Mzk5Ny4uYTYyMjFhZDczNzIgMTAwNjQ0Ci0tLSBhL2xpYi9hZGRucy9k
bnNyZWNvcmQuYworKysgYi9saWIvYWRkbnMvZG5zcmVjb3JkLmMKQEAgLTQ0MCw2ICs0NDAsMTcg
QEAgRE5TX0VSUk9SIGRuc19jcmVhdGVfdXBkYXRlX3JlcXVlc3QoVEFMTE9DX0NUWCAqbWVtX2N0
eCwKIAllcnIgPSBkbnNfYWRkX3JyZWMocmVxLCByZWMsICZyZXEtPm51bV91cGRhdGVzLCAmcmVx
LT51cGRhdGVzKTsKIAlpZiAoIUVSUl9ETlNfSVNfT0soZXJyKSkgZ290byBlcnJvcjsKIAorCS8q
CisJICogRGVsZXRlIGFueSBleGlzdGluZyBBQUFBIHJlY29yZHMKKwkgKi8KKworCWVyciA9IGRu
c19jcmVhdGVfZGVsZXRlX3JlY29yZChyZXEsIGhvc3RuYW1lLCBRVFlQRV9BQUFBLCBETlNfQ0xB
U1NfQU5ZLAorCQkJCSAgICAgICAmcmVjKTsKKwlpZiAoIUVSUl9ETlNfSVNfT0soZXJyKSkgZ290
byBlcnJvcjsKKworCWVyciA9IGRuc19hZGRfcnJlYyhyZXEsIHJlYywgJnJlcS0+bnVtX3VwZGF0
ZXMsICZyZXEtPnVwZGF0ZXMpOworCWlmICghRVJSX0ROU19JU19PSyhlcnIpKSBnb3RvIGVycm9y
OworCiAJLyoKIAkgKiAuLiBhbmQgYWRkIG91ciBJUHMKIAkgKi8K

--_002_ME2PR01MB29008336F5FD21911D8841488ED60ME2PR01MB2900ausp_--

