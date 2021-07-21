Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C993D12D7
	for <lists+samba-technical@lfdr.de>; Wed, 21 Jul 2021 17:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=F3I9gm9aAZlwm3tN2e4q48WIHhbPnCis2CUo7+RyF5E=; b=ebbTPSJpJjztyBCBQt0jf1ZLTP
	zTWZPTj6ErJMOV5H2eKxxdrEFodUYSjMXXpIWp3ayfyKBihXyXJfTNKupUDRExZt2G7YByj4/awo4
	rEsuMHutqZTm3IIQyMRvyFGdsoUieJOxw4OYnxElviV5cycpmrw1dUwiAuutgep87EkFFhR56rCIh
	iFEfSoqBQPx0eGo91bapFin4CmHTNm9L3FpZcUGZ/Q/CkC+kakwidpHaVXVpnSOxAQj5ne03jTNy5
	hyRQ0RG1l6fwHcrfvhk6zao6bGViHpZzs6PVDt/YU7sjjjTEcFbnSYhD86UahpruiYIVQhxAOLMbf
	h7MQOqPA==;
Received: from ip6-localhost ([::1]:39202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m6EVM-00026f-7X; Wed, 21 Jul 2021 15:51:28 +0000
Received: from mail-oln040092074107.outbound.protection.outlook.com
 ([40.92.74.107]:22919 helo=EUR04-DB3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1m6EVG-00026W-Gs
 for samba-technical@lists.samba.org; Wed, 21 Jul 2021 15:51:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx1F7ZH9zcbO5bg01ATyJVt9nxZr+QnHyjK6YsemCIsT+6C6thkMqLHR7gMzG0kDAM+y02/HKq4BbHwUg5/uZXRMOvgdCcbavEPNQ5Bi0gigUSOBKEq7Vpp4NA5qmzQYJfVzAzxv+U0LyWrQIxIXXXFIkGkzK7KNGRW7q+tdXHjhVDAxeJ8bFrVAPCcqxcRIeDlBSAnSqmZeCSQuoT/m67f/E8hwsu0k+OJqwnSRcyC044C56Ir3k1ykLAGHiisZxXbm5wls8VXOi+BPQsjvmCuusBmfzDUButzg9jXkOCMnJh9h7qxeF8lmdaIFou1a7/9e+uTr4Z8D9fOVlwOOXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3I9gm9aAZlwm3tN2e4q48WIHhbPnCis2CUo7+RyF5E=;
 b=R1HwNg1jW86siUIfaLF2oNPWqcwgz7T0uNVIMrTOMami/G5JWFlbEvAEYLouuM1xcITmYAr5i/6DVcYhBkPUt4TBQKOZbXAp51pDM3pmA5bHbTcNoEE9vZjzY4+Z+aIG6M3JTyDx7Vplk7s94WWd2No0eF7P3jlqmHAv+izUpjOyTdvU709fSp9uM5WCCW8yCrZxkb5xil+Osasj9roz80wfLeQUmZG/jzNpooXs/U9jLyHa6ymxN4nTx2E8nutrPcGA32dnUwX0JbIsulW4BlP1dWJRJu2LyqLv9MXqKz0BMeTG+fyjnmULgBRmAr6rOOdCoXT6IkJs8ZSeocO0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3I9gm9aAZlwm3tN2e4q48WIHhbPnCis2CUo7+RyF5E=;
 b=Q9ddr4Yha79xQdELUBvomEESQuywGCwoLIUgNEzcYjx46dKiyG5eoheu43lKaZX1QaQ6yxGm+pdFcicy0IdEFk61lAGNJII8R3nr1GZXlGlNepErXjiZ82yzMpI/fIrvEZvQC92F8JqL/a/DzhNyDDuL5ganjfPd+sTDvQlcGDIWfEaEjIgpadMKoA/Gwuo0LRQoPLn9BjfzrA4bevHAtPFdNSlIIBWPx9z7w4iZufKiLJvj8XWFsz9ObKeHqB5H5WMaM4O5Dzy2sa4v75VLDu7MIcZdyUHbBSXkD8Z7G3CRqOxV2kPxfhZjb3Vg3DpSPCHmZEmke+eIr+2cnJcBvw==
Received: from HE1EUR04FT033.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::47) by
 HE1EUR04HT179.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::391)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 15:51:09 +0000
Received: from PR3PR05MB7146.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0d::46) by HE1EUR04FT033.mail.protection.outlook.com
 (2a01:111:e400:7e0d::292) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 15:51:09 +0000
Received: from PR3PR05MB7146.eurprd05.prod.outlook.com
 ([fe80::207a:8416:ddd5:670a]) by PR3PR05MB7146.eurprd05.prod.outlook.com
 ([fe80::207a:8416:ddd5:670a%8]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 15:51:08 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: How to create an user with isCriticalSystemObject or/and
 showInAdvancedViewOnly
Thread-Topic: How to create an user with isCriticalSystemObject or/and
 showInAdvancedViewOnly
Thread-Index: AQHXfkdOEQ/NfWwnvEaOuWirO5thVA==
Importance: high
X-Priority: 1
Date: Wed, 21 Jul 2021 15:51:08 +0000
Message-ID: <PR3PR05MB71463F314D8B5C395CF7F559CBE39@PR3PR05MB7146.eurprd05.prod.outlook.com>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:AEB5B0C3DB4BEA4DACE7546E23346A3E7EA28826D8485B4C63E5F15B90D86A27;
 UpperCasedChecksum:23E738AC8D0F0735252FE707BDEE80D57852F53D8F3B28A1C4DAFAD734A41A40;
 SizeAsReceived:6814; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [nomqRNqYydCmBsYozYY2CIjuOhvoUoT/]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 110169c7-4073-4736-c8fa-08d94c5f5b3a
x-ms-traffictypediagnostic: HE1EUR04HT179:
x-microsoft-antispam-message-info: ME5n47cyCvFmcRNk/C/vCaPrLgK3zNF78OONcCiH/Wc35Gcwqme9Ph2mJEzOKTRvTscgN2ZKTM34ZpdOdwaFVV152DRJkk0DmarPcaHcUdm7J7Mbnp3NwMw1nAZLtZFFCakYnzl8T9PM6eAgc1lUuYIIqCsvYs7KwzsOGUK+hNEuZ8M0rX3XaL6p1kLN39a7BtvAjkzetBPV7BQOgvg9tToAKrnwiWVIGwxSwXCumDFjBTOFhLBmlOTCl+ZIl5ZXWBAPzijXCDwitkWDwhzXS3S+FVMmpVidEMHKRqfofwHwzr2trdd9jMeaoYmUgNxoIdH0n5zgLpFikkatc99dyxUvVXDzwWMruqUwEJA2g18CB8I8p7B3oglki1OylgBNMWYDb7HypZB0X2JqRCv4GhSZwxjJOfw5GIgOCBwdBNqzT/nMV4KwEeKTCTy5YHqA
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: cfn26TChgVTn4VIl9cAcC13kxNCQRrwwNcO2lnfgQDeDX0CbxF6CunbLPW4UEYAY2LnGjVHcWPJWy3mOVqexo2G9mmqyP6bz1mpymJzOUZKaSMx39zgYyaEEI3mRBnqqbxuQwj12JuEtbZREpxf/lA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT033.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 110169c7-4073-4736-c8fa-08d94c5f5b3a
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT179
X-Warn: EHLO/HELO not verified: Remote host 40.92.74.107
 (mail-oln040092074107.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-DB3-obe.outbound.protection.outlook.com
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
From: * Neustradamus * via samba-technical <samba-technical@lists.samba.org>
Reply-To: * Neustradamus * <neustradamus@hotmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello all,=0A=
=0A=
I search the solution to create an user with:=0A=
- isCriticalSystemObject=0A=
- showInAdvancedViewOnly=0A=
=0A=
Possible options are TRUE or FALSE.=0A=
=0A=
Line code:=0A=
samba-tool user create username=0A=
=0A=
Thanks in advance.=0A=
=0A=
Regards,=0A=
=0A=
Neustradamus=

