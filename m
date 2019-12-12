Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A211D9C1
	for <lists+samba-technical@lfdr.de>; Fri, 13 Dec 2019 00:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=BgxGVkNI1LYxGYUbk7l/QERJWCFR9BDjDdTdY8TfJHk=; b=pEMvo/wT+ns7CWjSmu+0x2t2AY
	ntatKLfYmEOoMcdesuqYsDhVNFbUdAf2UQOfLh/ehPdvUEE9qOM6+UGyDGnbIVmh7tEpLlKEERW1b
	xf4wkgm42hPxIGkcT0Cji3tMkKxfEayxhU/IExEYpsjCnsI4DbplLqHOt/DkOxaf7FVwwxF2dfgV8
	Fad0CRCNmglwkt1zsYIgT8Y1KKlll85nItQ00CJ5yrXtj/99QDBToevKFI5fhNm17EpXCv2TanUwe
	HvEeW/zNfbsY+1lmSZIiaAoIteqLWJSGZ/zbcwzl9RCqTEXs6Y58N7VjCfyUhKBbAigOdDnFefqde
	UkEu+QnA==;
Received: from localhost ([::1]:27908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ifXRa-0075KM-Nk; Thu, 12 Dec 2019 23:00:26 +0000
Received: from mail-mw2nam10on2065.outbound.protection.outlook.com
 ([40.107.94.65]:34560 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ifXRV-0075KF-Ms
 for samba-technical@lists.samba.org; Thu, 12 Dec 2019 23:00:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6hp0Zu9cA9fhmvZKVvGOsWp5hCLeWzDarGXlsyNyccFGctlaw0bdTJFLZufLEacClsN3lu5dGjl7hAi+hxPpNeLmoOHJ8WX4sPMuOpa1pDJiPCjYitEej+OmiQr+jAiV2hcG79WvXH85J+Flr47v8SchIcPTd3dGv12X1/USHeuhOiQFGceUefLQcHj3Paz22zhtdcMlFewAzE4b+tax2PcriiTUHTti1ys/n1JBchKQxZhoIdBM/oFueK1gpTqp1lnCT97pEsEzWlFW3tGR6Wuv4Eo2g43ppk0NR1UK5KiZT1eNd+TeuTnvKITvuvU4cVOOb+c129e6S/JOkcu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7yB3yGRngiTO8wPUJXs3H2t2dorp+ZH8QL9YjiZRZU=;
 b=Tghud8RPJ/QxdbfZUDOGAoJ0bEgm0dz+40aCIEIGZGD+Wh1c8b45lUr779zZ0BeIq4F+xt9aMfKcxREuwmRzg/oaZY+WX/BTidhEWWPv57R/ZJv0sbl+lC2uYuBVv//MmKF+X7ic9Ew4Ygkb0EIFIVgGFOVahDpnYlDvr2z9WKQilf2OnaUYFcnNV0VBhBmZ1PDIqUckz1pb0b5SiTOjUnjx/LCJ3dCFkVLMj+0DGuH7fLqgn1xIp6L1tStcUpB3v5Ph3rVADQe4WG58t7TcOJzhn+yNntCsPkB/avItHk4L8ilPmZPcP/8plkXAaNJ95x+rA4UrIOWCX8WaJL6sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fixity.net; dmarc=pass action=none header.from=fixity.net;
 dkim=pass header.d=fixity.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fixity.onmicrosoft.com; s=selector2-fixity-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7yB3yGRngiTO8wPUJXs3H2t2dorp+ZH8QL9YjiZRZU=;
 b=JcH0miCLrV+I3JMp0WdKzuAQPhE+EcVRzcjkIUl+ssD/m5h46DbHRh/Ki9Ozflhha+qZQH0IomUdddxFnFFxZE+FmGb34vhsOGgoiqkAHU5c5sbYHdQSniSNekTF+UZ+CqVvkYU6Ynga21tvGDfFn1BmXSQcvhT5HW1uV2iQc9Y=
Received: from BYAPR08MB4872.namprd08.prod.outlook.com (20.176.254.17) by
 BYAPR08MB5479.namprd08.prod.outlook.com (20.178.50.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Thu, 12 Dec 2019 22:26:06 +0000
Received: from BYAPR08MB4872.namprd08.prod.outlook.com
 ([fe80::96b:f210:c239:ea5c]) by BYAPR08MB4872.namprd08.prod.outlook.com
 ([fe80::96b:f210:c239:ea5c%5]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:26:06 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: parse_dos_attribute_blob() inconsistent file_id through
 make_file_id_from_itime()
Thread-Topic: parse_dos_attribute_blob() inconsistent file_id through
 make_file_id_from_itime()
Thread-Index: AdWxNaYnq/Wm1GDZS1WYB4slT1gMNA==
Date: Thu, 12 Dec 2019 22:26:06 +0000
Message-ID: <BYAPR08MB4872E120915FF5A02939D29CC8550@BYAPR08MB4872.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ganchev@fixity.net; 
x-originating-ip: [76.126.95.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93ccf027-bdd4-4cf0-5fe1-08d77f5247aa
x-ms-traffictypediagnostic: BYAPR08MB5479:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Gg7PpVBbLTX8YAIIes39OWWnHVHydWeaMRtmGLbuAlSW3BPwqxjXTF5t7Jty7FuR2PQUzc268OwWlbA1u++wZhUt3yuwu0xET81edF4CqSGSm7yTimKAVaqvv1ziXCu2CisWfyvUQvlugxb7hQZG7LG1z37W56gqdOkEo7peJZgMzafrQ8TII5O3SV0A6E6cpeo+etNM3sFxr8ApJxH8RkpJZl7kBQbj3z7fTvHcN3579KhhLJOpjNgZ2dG4c+nq/tLt1nYbcktB/APsmimNzrW9QFrCUw/Mx6+A7kVJppasMHglTtYQ3a3IFjO7nvaxIUa1pcd8CMbdD15SkwQ92oPDOlzHyptqmrZXr1SyCw5USiSTF956L5HKf28laM0kjiRUGq3Alb2ACaPxkeVoVU46qn8UopcWVeFg07ULlLmaAbTaWP252rqtriDE/ycX
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fixity.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ccf027-bdd4-4cf0-5fe1-08d77f5247aa
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 13356338-6079-49fe-a1ed-7b1546e29bff
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76W12T8z5qD8Stgy9uxS8EiMF4Y74D0uqgdG+gOHv0cXLiIu/SIezHK0mULPjEPpT03RAeWENnZDTJs7aarDXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5479
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.65
 (mail-mw2nam10on2065.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="us-ascii"
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
From: Krasimir Ganchev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Krasimir Ganchev <ganchev@fixity.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Guys,

I have recently experienced some strange behavior while browsing folders wi=
th clients that respect SMB fileid e.g. most recent Windows 10, Windows 201=
9 Server, MacOS Catalina. On folders with multiple image files, on Windows =
there would be repeated thumbnails among files and on MacOS thumbnails for =
certain files would not be showed at all. This behavior could not be reprod=
uced with older version of the mentioned OSes without fileid support in the=
 SMB implementation.

Tracking down the issue I noticed that copying files with multiple threads =
will often produce the same change timestamp for different batches of files=
 even though we have granularity information from the underlying file syste=
m (e.g. we have proper nsec information).

This is an issue because parse_dos_attribute_blob() is presented the same f=
ileid for different files through make_file_id_from_itime(). The same metho=
d of getting fileid is also used in open_file_ntcreate().

Looking at make_file_id_from_itime() I noticed that when ST_EX_IFLAG_CALCUL=
ATED_ITIME flag is unset this will return a fileid based of the invented ti=
me only which in the aforementioned case is producing the same fileid for f=
iles that have the same change timestamp in the underlying fs.

Based on MS-SMB specification fileid must be unique for a file on a given o=
bject store and must persist for the lifetime of the file. It also should n=
ot be changed when a file is renamed.

I am about to open a bug report and I would like to suggest a patch, but fo=
r the sakes of implementing the patch in a proper way I would like to ask i=
f there is a particular reason why fileid is based only on itime in make_fi=
le_id_from_itime() when ST_EX_IFLAG_CALCULATED_ITIME is unset?


Best,
Krasimir



