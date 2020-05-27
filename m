Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B11E4E69
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 21:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=iTr7AeQ1q4zMCrBuunXECJksBwMghwpVbyR37oOagrk=; b=iJZGDcoaQ/oMIH+G0J5JtWlKQz
	JhzVDzz4/xaV0WoBEEuNKlyTCvnhu7Get/C4BZSuHh9sx/9d0H8za5aUwQrnpWwiza/BdFbTy97RV
	Ydg9BgdvOy807a07y8tCBZGOq7LbpIOFdQRBhmn2atRWrOg/R5Q1/MgiC7nNHC5rx5ohNKJiuPlp4
	6kGSP6p+jbhQUFavh9wM5v/TPRL/S9ccxIH9mK17ejjciprWJ3HGuaIB/mU6rFtu9yOXRFp+6ASbM
	F+LL/STsMhvb92DBbcb7qvbEB1x3Zc9bu8t1fJ3y1j3Rl3z1WNWGAzpmDtaQz1vo7b/DvcHvlssSP
	FVeugLzw==;
Received: from localhost ([::1]:64968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je1wy-0065IV-B9; Wed, 27 May 2020 19:42:52 +0000
Received: from mail-bn7nam10on2076.outbound.protection.outlook.com
 ([40.107.92.76]:7248 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1je1ws-0065IO-Qf
 for samba-technical@lists.samba.org; Wed, 27 May 2020 19:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYpWpP3g/n7+3TJL163FxwkfArTIyZV+e7jdkcWoZiA=;
 b=YghMxJsr4AYThWWhtooZQjv0R7tMFEp7caPL1eMJsDR17cWrtMWiIARA1ahk/EEN2dSgi2viGcoXQQEkRs6Eu0iBmNH688tILgfOuB9wPa551pCUpiA2/4lnKVuUvRMVakVsRBz93etl9q7Gex48Kfn2jxlStnCeagkzbVd6+4Q=
Received: from MWHPR19CA0058.namprd19.prod.outlook.com (2603:10b6:300:94::20)
 by DM5PR1101MB2108.namprd11.prod.outlook.com (2603:10b6:4:53::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Wed, 27 May
 2020 19:42:32 +0000
Received: from CO1NAM03FT054.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::8) by MWHPR19CA0058.outlook.office365.com
 (2603:10b6:300:94::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Wed, 27 May 2020 19:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; lists.samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;lists.samba.org;
 dmarc=pass action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 CO1NAM03FT054.mail.protection.outlook.com (10.152.81.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 19:42:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Wed, 27 May 2020 19:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjnaLPI+KZLHEjUdYEgpftrNTkQ6KP4a/1rFphEx6Q+Z57Rss3AF1EdoDJiOesSlw9Dw3tT+i3eZ1CTLNeTQzFhTmoWZtv2b+IpDvWp32Yj1r5juvWKnI6Omz3Qir3W6TJc/3/AG4qshYye+cNI1RWc72dCt9ZrFDvQ0U+YFockXf/TsekMJ2EHVQSbptDSX+mxFMVErTqv1Uf9inzTVpDIFMV/B5najYyX1QMjgRbHhr4jnC6q6o9aYYFp8Ptry8VGd6asr2FeMflEnA5QO7auaD75S+0+jQbXeIvw5SIWajLLdHofGxPlXIEA6tftC4Y6obcc+b/VK+xMmesYNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYpWpP3g/n7+3TJL163FxwkfArTIyZV+e7jdkcWoZiA=;
 b=BFUmunRxGjv51Iswf9yo7D9XPdKtpRIPszdJOzup1XMZsmf4TVy9MegVCgheOZPY9Pfsr4CT4/izBm2TQrrN2VEpcXv4Zr8QD2kfgf9GUiuJEQ9Tjox9yN6cOVD+Bs9LrmmbKjF5ForkSgjtXLpWlIEHTzm9+lMM6Y/ZoVGm6YN7dvHa5J3WWMF/dfHsSZCHFWr0wphDxTThB2mSzF7iJaLwPgpzN6JC8dLzhX781npGfcvuEiLv6ZjK6O3mny15hM7Uf81tXHrTHPu7OitfCMjAzCg7/pOiSdfozhZ3nr0vzWg4KEO1Lq2N2ZwMId7d7quXfIfKUu9Wy232WtWyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYpWpP3g/n7+3TJL163FxwkfArTIyZV+e7jdkcWoZiA=;
 b=YghMxJsr4AYThWWhtooZQjv0R7tMFEp7caPL1eMJsDR17cWrtMWiIARA1ahk/EEN2dSgi2viGcoXQQEkRs6Eu0iBmNH688tILgfOuB9wPa551pCUpiA2/4lnKVuUvRMVakVsRBz93etl9q7Gex48Kfn2jxlStnCeagkzbVd6+4Q=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB4011.namprd11.prod.outlook.com (2603:10b6:5:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Wed, 27 May
 2020 19:42:28 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a%8]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 19:42:27 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Samba user quota implementation question
Thread-Topic: Samba user quota implementation question
Thread-Index: AQHWNF7zbmQ9XIiNp0+V9JbVx3GYtg==
Date: Wed, 27 May 2020 19:42:27 +0000
Message-ID: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.37.20051002
Authentication-Results-Original: lists.samba.org; dkim=none (message not
 signed) header.d=none;lists.samba.org; dmarc=none action=none
 header.from=storagecraft.com;
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba3d092b-897b-49eb-9059-08d802761886
x-ms-traffictypediagnostic: DM6PR11MB4011:|DM5PR1101MB2108:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8AErnziagm0c4JCtkTq4IxkCdBP9vPv/QCylQQclVMTaOmassmpEVFzQinPAtPnCYZY2Ki0pEcCGXb48BLpyZPjPyX93zBudyLSit1Eg8ByIQEL454yEdrYTe/3YmAe2pogWu/qQa/+mAwTxZmJX0xnlxDeGMjpM9aDzaObLCfpvAOK1kN6VZ+O7IfOvhgjGotAITuyLvzmGxkBkVrIS7ADFSrTjWWhk7/GV4VUEKMqGNuk99MWOQeZ3zOKq0H6jRDFvT+YMTfNoOMww1qvxDOudvO4SC1EGMFRs4hf4TvWdLWviTWTerB1n7+JoKceabxsFBwfhogmk628ROdxi6uuWO4Ffd6WKGvoIaV3hydwx+bvtCvUVStEGBtAEge4nqEq7UL3qSEytB8Uww8rADg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(6486002)(86362001)(186003)(76116006)(8676002)(8936002)(15650500001)(6506007)(44832011)(64756008)(5660300002)(33656002)(36756003)(66556008)(66446008)(66476007)(91956017)(2906002)(66946007)(26005)(316002)(478600001)(6512007)(166002)(9686003)(966005)(83380400001)(6916009)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wihJMfZSIINdKfxkeJFIoAwFiJL1oc/kngI+rql6UnSmiaXig2poFiUz0blovkRLC1M7XKSuXx1Ao7r32kqUf4DYombT+976HDsRCYPX0W7HUAIVWLseqN2iFDO1qJTKdBV5j2sJWiDBuwie74ftA3Zr6hZ3kxwLb07iFDIZOmdz18bTHxRh+fLd2fHP7vChsmWDIbMP0vdoYYyp/T6K+0kdHqAdRfYArHThqk1DtR9Z9US5wunF7TIs3pNaxpzXXbS+X3pK3SY3EbP2z90y1X3AsAbjeM8F9ZwfDxPzq5YwB2zjEESlJX2BFuKoP/ZvSe5SCsToHuuaktpiqhk33Le/HppxHOc0Jf5nwJrTmGNDupBEztISZSFpy6V7xEzVho+kg5L3COdEkdou3yA/zbmQfis/AbrUhlBYSrRTBUVbQH1iGPrRicN3h+lITRLO/69YQOvqNZpah4lZgbPmeu9sN/2Fcb2RCzJ7EaFWRlBxoXFew4ArdSpCO1ReO23g
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4011
X-CodeTwo-MessageID: 0092eb2c-a730-4c88-a243-9ad85d36b3eb.20200527194229@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT054.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1709c877-4b4e-41d0-0deb-08d802761683
X-Microsoft-Antispam-Message-Info: 2IHUXY25KxGl9gtd8jK1vU0IRzlYgppCul07q+l9hM7wcxOUIOzert4Bskl3eEOt5WqQuRbpoFIlb58/8fDQpu3zZ8CoXvPOvbeoPRpOBY4EGjHeUHpueEiBUcfXglYUWBpmiczF+gDHYyYkR75gaSNb6gKRAwwW6tq7T6RCZ27aCE4FUTmDQtgWlBZNThs8U9RcGHm8q/i2YOcdJscYbFuEOVndcp4X4xll8xRR/e7MTG7Zih1CYPOkt/+LVvCONpyK99D8A77CsFOanb4Kxe+cLt5OPy6/RUQvhqcIiyB814LKHZw/1aERe/CGAp+oh6Rlq4lU/lCODoqxuX9mygBSsFwvsdDlWy1+SV4B4MOxR2Pk8JTdH1e175DMK1COspjCkPhpj5BtCj0i8rWXbC54c23pmGfQMoU28nQW72wXlrbULGEMgwMyWSh8l9q48VQUrqFLalCYARHBAEvVWKECC76ZwrB6361lGQOeL7k=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3d092b-897b-49eb-9059-08d802761886
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2108
X-Warn: EHLO/HELO not verified: Remote host 40.107.92.76
 (mail-bn7nam10on2076.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
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
From: Krishna Harathi via samba-technical <samba-technical@lists.samba.org>
Reply-To: Krishna Harathi <krishna.harathi@storagecraft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

T3VyIE9uZVhhZmUgRlMgIHN1cHBvcnRzIHNoYXJlL2ZzIGxldmVsIHF1b3RhIHVzaW5nIHNtYi5j
b25mIOKAnHNldCBxdW90YSBjb21tYW5k4oCdIGFuZCDigJxnZXQgcXVvdGEgY29tbWFuZOKAnS4N
Cg0KV2UgYXJlIGN1cnJlbnRseSBleHRlbmRpbmcgc3VwcG9ydCB0byB1c2VyLWxldmVsIHF1b3Rh
cyB1c2luZyB0aGUgc2FtZSBpbnRlcmZhY2UsIHdoZW4gU2FtYmEgc21iZCBpcyBhbiBBRCBEQyBt
ZW1iZXIuDQoNClNldHRpbmcgdXNlciBxdW90YSBmcm9tIGEgd2luZG93cyBjbGllbnQgaXMgd29y
a2luZyBhcyBleHBlY3RlZC4gQnV0IG9uY2UgcXVvdGEgaXMgc2V0LCBub25lIG9mIHRoZSB1c2Vy
cyBhcmUgbGlzdGVkIGluIHRoZSBxdW90YeKAmXMgcG9wLXVwIHdpbmRvdywgc28gY2Fubm90IGRl
bGV0ZSBvciBtb2RpZnkgcXVvdGEgcHJvcGVydGllcy4gTW9yZW92ZXIsIGNyZWF0aW5nIGEgbmV3
IHF1b3RhIGVudHJ5IGZvciB0aGUgc2FtZSB1c2VyIGlzIGdlbmVyYXRpbmcgYSDigJxxdW90YSBl
bnRyeSBhbHJlYWR5IGV4aXN0cyBmb3IgdGhpcyB1c2Vy4oCdIGVycm9yLg0KDQpCeSB0cmFjaW5n
IGdldC9zZXQgcmVxdWVzdHMgdG8gb3VyIGZpbGUgc2VydmVyLCBJIHNlZSB0aGF0IG91ciBGUyBz
ZXJ2ZXIgaXMgcmVjZWl2aW5nIGEgZ2V0IHJlcXVlc3QgZm9yIFNhbWJhIGZvciBldmVyeSB1c2Vy
IGVudHJ5IGluIHRoZSBsb2NhbCBwYXNzd29yZCBmaWxlLCBidXQgbm9uZSBmb3IgdGhlIFVJRCBv
ZiB0aGUgREMgbWVtYmVyIHVzZXIuIEJ1dCBJIGRvIHNlZSBhIGRlZmF1bHQgcXVvdGEgZ2V0IHJl
cXVlc3QgZm9yIHRoZSBncm91cCBHSUQuDQoNClRoZSBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQg
dGhlIGdldC9zZXQgY29tbWFuZCBpbnRlcmZhY2UgZG9lcyBub3Qgb2J2aW91c2x5IHN1cHBvcnQg
YSDigJxsaXN04oCdIHVzZXIgcXVvdGEgYXBpIHRvIHRoZSBob3N0aW5nIEZTLg0KDQpRdWVzdGlv
bnMgb24gdGhpcyDigJMgIFdlIGNhbiBwb3N0IGFuZCBtYW5hZ2UgdXNlciBlbnRyeSAoaG9zdC1s
b2NhbCB1aWQvZ2lkKSBjb3JyZXNwb25kaW5nIHRvIHRoZSBEQyB1c2VyIHNpZC9naWQgd2hlbmV2
ZXIgYSDigJxzZXQgdXNlciBxdW90YeKAnSBpcyByZWNlaXZlZC4gSSBkaWQgdmVyaWZ5IHRoYXQg
d2hlbiBhbiBlbnRyeSBpcyBtYWRlIG1hbnVhbGx5LCB3aW5kb3dzIHVzZXIgcXVvdGEgd29ya2Zs
b3cgYmVoYXZlcyBhcyBleHBlY3RlZC4gSXMgdGhlIHByb2JsZW0gYXNzdW1wdGlvbiBjb3JyZWN0
IGFuZCBpcyB0aGlzIGEgd2F5IHRvIGltcGxlbWVudD8gSXMgdGhlcmUgYSBiZXR0ZXIgd2F5LCBn
aXZlbiB0aGUgY29uc3RyYWludHM/DQoNCldlIGFyZSB1c2luZyBTYW1iYSA0LjcuMTEgcGF0Y2hl
ZCB3aXRoIGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzU1MyNj
MTcgZml4IGZvciA0LjcuDQoNCkFueSBoZWxwIGlzIHRoaXMgaXNzdWUgaXMgbXVjaCBhcHByZWNp
YXRlZCBpbiBhZHZhbmNlLg0KDQpSZWdhcmRzLg0KS3Jpc2huYSBIYXJhdGhpDQo=
