Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CA58CBA
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 23:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=klw9LCkjpemj95jdT4K9l+IYGNX6Ya8uasoBni9ryEE=; b=Z9edotYz1HWkxLBgz0nmk4tMMw
	pWRdkHdJTS6rfNl2YK/1fFR1WWlWCbEwEglTeurNBO1p2pmd7GD4Kbm3kQuBaFeJ12CxJmto8XSBt
	6PAb6q+sjqGXGkMiHmeJmiNazcgERdASML7qJTn90utxCy2rnrYxK/vOi59eB85R7l5g7sj0IR9LG
	szaH9jywBdPIKgbQ6zniopxST+kb1RgA/hAqCzveEEn0Trs1oYL+tfGTOpsS7DGI0fBgbx6TAKhOw
	gTjRdvp9FiNZM8z9MS/oB3uQQmncsLGRYeiVJ8Kf+9XRrr/j0yd9zYaIQFcMm1YTD/VGqX5DT01x/
	2HyS6u4A==;
Received: from localhost ([::1]:52252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgbht-002EWj-Mn; Thu, 27 Jun 2019 21:13:25 +0000
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:26276) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hgbho-002EWc-Pl
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 21:13:23 +0000
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RLAHLx014973; Thu, 27 Jun 2019 14:13:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=proofpoint20171006;
 bh=zqcyB5NfeYBQ8gNgqtrzeckIqkch58sQePJOjEbRRmY=;
 b=IdVUUmuPchIP6l0/R0doBRwxwNprn7Hbz6/2UJW2cDRtCzmz/gi6BWxy+PYb1qKfmIdx
 HJDWOunFbiSrf7qxn1u0F1oV7PntJ3zYV5tuXUwTacTvsV8HSznPNRrf4zvO6Xp+X68p
 9fFPqPJ4XoB4F6EtRjM6plHyyIm9N8gCRHAlB2pKgBB8A1OWngXxJiB5yb4JDcj5nQ+L
 1fbDmdyoRpNqKNmJ3RKJ4ja+l13jj44vyKwe3A4eCmPTyiPAn46q/z4Tt/Uha8bX0Sod
 AWecghjcOEdXVTI2cVG3FrxF2kaMIfmzRc7w7piFTiNzbTSJjQy3vgILupMgz8q8nBXh 0w== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2052.outbound.protection.outlook.com [104.47.33.52])
 by mx0b-002c1b01.pphosted.com with ESMTP id 2tcs3jscqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 14:13:17 -0700
Received: from MW2PR02MB3722.namprd02.prod.outlook.com (52.132.177.31) by
 MW2PR02MB3706.namprd02.prod.outlook.com (52.132.177.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 21:13:15 +0000
Received: from MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::e038:6048:16a2:cc6b]) by MW2PR02MB3722.namprd02.prod.outlook.com
 ([fe80::e038:6048:16a2:cc6b%3]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 21:13:14 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Topic: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Thread-Index: AQHVDe0Ppb3GodJEUkiYbq337KQOmKZ5bIyA//+OswCAAJ2SAIAAvqcAgDREjgD//41ngIACE7UA//+L7gA=
Date: Thu, 27 Jun 2019 21:13:14 +0000
Message-ID: <EF712692-3206-443F-9AA7-0216BB89E3A6@nutanix.com>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
 <20190524024232.GA14980@jeremy-acer>
 <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
 <20190626201546.GA3263@jeremy-ThinkPad-X1>
 <F7CF28D7-2446-470A-8694-1E1E3FBF03B4@nutanix.com>
 <20190627210840.GA24489@jeremy-ThinkPad-X1>
In-Reply-To: <20190627210840.GA24489@jeremy-ThinkPad-X1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.19.0.190512
x-originating-ip: [192.146.154.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08411c24-4f76-49af-617b-08d6fb4444ca
x-ms-traffictypediagnostic: MW2PR02MB3706:
x-ms-exchange-purlcount: 2
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HiU6XHCNNwVdf0BnGAaTql7KWPnxn20Aebk5orqn9Fd5dGW/2CE3+2CYwbotWQBQ7xYj7+CNIoj59jQutw4HGn7R+eJnu/6m103cUGRmyvBvRPwRAVwDUPi5qwXn3QoKPUiP2HEOomBP9uqxF/3jJyF3m5fv/hgwsdaTXPD0a1gVtDTLIPKiMC8zxxohmMk/qWqimIHvko75ftW6ikHwV7FoG0isdD+amxgFw+hsFFjgO3+8EQYfTNRS6+iDaugR3+AZMIb2Rv4YDgJEZgDtmsvrvcgmdT1+4jTk0W4buCEWfxNbRk9v/JONPdtl/aEygSeDsdYNClmD8ZG9Z1KNPdQ7VXlz9JUG5ngxiFsJqNZXkxZ77r8BGUIuKF361+QjZaElzGXDGQiv3KrmHo6baSmsPogwP1e+TR3dAFjzsEE=
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08411c24-4f76-49af-617b-08d6fb4444ca
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shyam.rathi@nutanix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3706
X-Proofpoint-Spam-Reason: safe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Shyam Rathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Rathi <shyam.rathi@nutanix.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmsgeW91IEplcmVteS4gSSB0aGluayBiYWNrLXBvcnRpbmcgaXMgbm90IG5lY2Vzc2FyeSBh
cyBpdCBpcyBhIHZlcnkgY29ybmVyIGNhc2UsIHVubGVzcyBpdCBpcyByZXBvcnRlZCBpbiBmaWVs
ZC4NCg0KDQpSZWdhcmRzLA0KLVNoeWFtDQoNCkZyb206IEplcmVteSBBbGxpc29uIDxqcmFAc2Ft
YmEub3JnPg0KUmVwbHktVG86IEplcmVteSBBbGxpc29uIDxqcmFAc2FtYmEub3JnPg0KRGF0ZTog
VGh1cnNkYXksIEp1bmUgMjcsIDIwMTkgYXQgMjowOCBQTQ0KVG86IFNoeWFtIFJhdGhpIDxzaHlh
bS5yYXRoaUBudXRhbml4LmNvbT4NCkNjOiAic2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9y
ZyIgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+DQpTdWJqZWN0OiBSZTogW1BBVENI
XSBzMzpub3RpZnlkOiBIYW5kbGUgc2lndXAgaW4gbm90aWZ5ZCB0byByZXBhcnNlIHNtYi5jb25m
DQoNCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA4OjI1OjM5UE0gKzAwMDAsIFNoeWFtIFJhdGhp
IHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQpUaGFuayB5b3UgSmVyZW15Lg0KDQpJdCdzIG5v
dyBpbiBtYXN0ZXIuIExvZyBhIGJ1ZyBpZiB5b3UgbmVlZCBpdCBiYWNrLXBvcnRlZCAhDQoNClRo
YW5rcyBmb3IgdGhlIGhlbHAuDQoNCkplcmVteS4NCg0K
