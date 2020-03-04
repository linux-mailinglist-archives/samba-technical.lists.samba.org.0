Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C681789C3
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 05:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gLwvJPGMZ2BjpmK91zhF7u8Xm/EJ1mbPNDQ8ODoi8Us=; b=5zno0Zi28TpltTrHvqiVgkiZfv
	Ej41y8SRp80iKIzI2V1r04gnxLXKTgmgRIhrCwlwFtE9ZDzzA4A4I03cJH9qIqFTBYkPKgmcYdQJN
	X6jmGfXh7orz/9yvePnh3oaAywPjkWBqSOPY/aMomF26TH1T0ztlUInt46HBGzfdCXsmynvDOgPWI
	XMA96Wov9bhTaWfjod6ZwZXzfwkHTjetg/ADpjCIj9FccnE/7M5I7wRGaplczRsu+vWvigaorFlb8
	LmjpUP8E11IUyi16dre40craaNrEmJVChWnazWvBINn2T1AK88BZKUWsCm2Z1KLfrcsuAqz/NWGPA
	OeR+DY4w==;
Received: from localhost ([::1]:64258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9M2t-00ErcT-Ic; Wed, 04 Mar 2020 04:54:11 +0000
Received: from mail-dm6nam12on2072d.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::72d]:34107
 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9M2n-00ErcL-Hq
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 04:54:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGikyKV+KF00vWLH5qXjYT5gYGFG2YGrZ6WRyxZY7nr9/U4LUDDUfrkgs0vPid92JAsV8KUENjrO+Lt5NdTCw3DyyU//ecRvMRG+9fKswggOpaX4qlns50xhcUBaRTaWfEFIp4zTjlcnYGf1lDdxQCHBr9o3wVtUw260/+CMEdOrHBB1bhPOxzYiUC5geahtI0xV030vo85njbRrFN9GRo54smXkoDsTf/Ymcc7flRBcwk1BKANt8gfM9DfuZJxepo6qTFxWYHTMO+FZ5Cmsunbrk65QCGAMD7wP+j124MZ3ig1FsoZhdQNBIwGBIoZtunpIeoyfmLxS7hWXA0JW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AX6YkDAIAs6HSq3Y5xUQrplKbktZwD21vnkAOBYIo58=;
 b=F4JEC0PYUoWkBp2CZQ/t4PJpM684NSA7Zse7Ohz8mCeRFX+jiXWjtK4Ajkuzv4kudOHnGao5n89x53GH8SbYmZlTdvFIPfjcx74oeegVlBCtrRWmayN26TPkRI01Frps6SdatesOduNb0mfnGKhuCxZCbh2lOvGorTOeihFG3P+LPCkdK7ChgyE2JHOSIwvq3p40RVJycO+oeZ1tBLTC21sMT3qbDPfi0Gww/cWH6DZvSDVviYmLGGv/6p3osCBbM9fHKURT3PNX5e9MOBwXdtCaqUAyeaBzgkDhaomrvsmU/fz0N8D+n8S22H8XkxKJ4ThLAGbv08/cRu15mGCMuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oregonstate.edu; dmarc=pass action=none
 header.from=oregonstate.edu; dkim=pass header.d=oregonstate.edu; arc=none
Received: from BYAPR11MB3782.namprd11.prod.outlook.com (2603:10b6:a03:fd::32)
 by BYAPR11MB3846.namprd11.prod.outlook.com (2603:10b6:a03:f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Wed, 4 Mar
 2020 02:19:53 +0000
Received: from BYAPR11MB3782.namprd11.prod.outlook.com
 ([fe80::50f8:84b3:699:1f0a]) by BYAPR11MB3782.namprd11.prod.outlook.com
 ([fe80::50f8:84b3:699:1f0a%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 02:19:53 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Subject: Re: Python 3.6 for Samba 4.13 in Sep 2020?
Thread-Topic: Python 3.6 for Samba 4.13 in Sep 2020?
Thread-Index: AQHV8cPrjldwcwyRUEWq0C2KJ4nFI6g3sk/G
Date: Wed, 4 Mar 2020 02:19:52 +0000
Message-ID: <BYAPR11MB378209425F94DF58453AE96CD1E50@BYAPR11MB3782.namprd11.prod.outlook.com>
References: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
In-Reply-To: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=morgan@oregonstate.edu; 
x-originating-ip: [128.193.8.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 121f39b7-e888-4100-5190-08d7bfe28635
x-ms-traffictypediagnostic: BYAPR11MB3846:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CZv59e7xyFAk15mANrwM+UkFnZIIm1GNgyOWdq/VuQCO/BL3VBI984FXU4VT/4JCa4qhzjuW4L6Z+qlU1dJCsJt6DAOUQEbrM8Oy2A1NUwncYxqYC+LlcgcLFEY5dEx03mZ8SINak9KIC16QGq0aZ6uMba9aVB6seiHwA0WYinh1ul2pMVW0T7RSk8YuQWkhZ3xZOnxLjhUHtsipemAix2vzXUXuqXlGBisCG21XQxHIEOkSVSYo0LeINJva1BsfYDQ/Q6zmR85cVHXFK8FhwRNQDBaMtTnJpc+U8QFNytvJFW6j3fvCVNGQUx6EyinZWg94IWjf2thsLHC59vF5/PJUIMhrz8GIc0TXk5/hpfOICbVRpArCIKE/p5Mmp/ZAfQfH2xZwbIK+4iLm3qqCF1lKKdobr4EHm4lP0NMnvcG4zqBfpQQSXu8dp+YCEX9Y81oW6hdnDgbA9Gg+29kP8lSlCr+1zSlfpQDcuklwkkAVJrXrDLVrwOKXQVy2dR/g0np2aJntcSHV3J7theMa8g==
x-ms-exchange-antispam-messagedata: a6j2Vj8JwLKpvNk73CCrE0R1tRI2IKoyChKcpb1hXMCRZRCpWOCOs7QJ610KAx3WDv/sdj643YLuYyKBgiAIsdw3BDLmfZqRerCFZFm4aj6DMGy1cZXkvTDf3nNhXbAGow8BR+U8mNKowDORHOehiQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oregonstate.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 121f39b7-e888-4100-5190-08d7bfe28635
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce6d05e1-3c5e-4d62-87a8-4c4a2713c113
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmUIAgxO7EewoSmw2uQBm/o32mj6UDx47rQ0JFWb446YJyQ+UXaJlqBoMmcO3UedGgm4p/Bv4uZclr4hc80Fsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3846
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe59::72d
 (mail-dm6nam12on2072d.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
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
From: "Morgan,
 Andrew Jason via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Morgan, Andrew Jason" <morgan@oregonstate.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SG93IGxvbmcgY2FuIHdlIGV4cGVjdCB0byByZWNlaXZlIHN1cHBvcnQgZm9yIFNhbWJhIHY0LjEy
ICh0aGUgdmVyc2lvbiB0aGF0IHdpbGwgd29yayBvbiBEZWJpYW4gOSk/ICBXaWxsIHRoYXQgc3Vw
cG9ydCBhbGlnbiB3aXRoIHRoZSBzdXBwb3J0IHRpbWVmcmFtZSBmb3IgRGViaWFuIDksIGV0Yz8N
Cg0KV2UgdGVuZCB0byBsYWcgYmVoaW5kIG9uIHVwZ3JhZGluZyBvdXIgT1MgdmVyc2lvbnMgYmVj
YXVzZSBpdCdzIGEgYml0IHBhaW5mdWwgb24gYSBsYXJnZSBmaWxlIHNlcnZlci4gIEkga25vdyB0
aGF0J3Mgbm90IGEgZ3JlYXQgcmVhc29uLCBidXQgaXQncyBuaWNlIHRvIHN0YXkgb24gYSBzdXBw
b3J0ZWQgcGxhdGZvcm0gYXMgbG9uZyBhcyBwb3NzaWJsZS4gIPCfmYINCg0KVGhhbmtzLA0KQW5k
eSBNb3JnYW4NCklkZW50aXR5ICYgQWNjZXNzIE1hbmFnZW1lbnQNCk9yZWdvbiBTdGF0ZSBVbml2
ZXJzaXR5DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBzYW1iYS10
ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbC1ib3VuY2VzQGxpc3RzLnNhbWJhLm9yZz4gb24gYmVo
YWxmIG9mIEFuZHJldyBCYXJ0bGV0dCB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmlj
YWxAbGlzdHMuc2FtYmEub3JnPg0KU2VudDogVHVlc2RheSwgTWFyY2ggMywgMjAyMCA1OjI1IFBN
DQpUbzogVXBzdHJlYW0gU2FtYmEgVGVjaG5pY2FsIE1haWxpbmcgbGlzdCA8c2FtYmEtdGVjaG5p
Y2FsQGxpc3RzLnNhbWJhLm9yZz4NClN1YmplY3Q6IFB5dGhvbiAzLjYgZm9yIFNhbWJhIDQuMTMg
aW4gU2VwIDIwMjA/DQoNCkcnRGF5LA0KDQpJIHdvbmRlcmVkIGlmIHdlIGNvdWxkIHNldCBvdXIg
bWluaW11bSBweXRob24gdmVyc2lvbiBhdCBQeXRob24gMy42IGZvcg0KU2FtYmEgNC4xMz8NCg0K
SXQgaGFzIHVzZWZ1bCBuZXcgZmVhdHVyZXMgbGlrZSBQRVAgNDk4OiBGb3JtYXR0ZWQgc3RyaW5n
IGxpdGVyYWxzDQoNCmh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMvd2hhdHNuZXcvMy42Lmh0bWwj
d2hhdHNuZXczNi1wZXA0OTgNCg0KTW9yZSBwYXJ0aWN1bGFybHksIHJlY2VudCB0ZXN0cyBzaG93
ZWQgdGhhdCB0aGUgb25seSB0d28gcGxhdGZvcm1zDQp3aXRob3V0IGl0IGFyZSBVYnVudHUgMTYu
MDQgKFhlbmlhbCkgYW5kIERlYmlhbiA5IChTdHJlYWNoKS4NCg0KRGViaWFuIDEwIGhhcyBiZWVu
IHJlbGVhc2VkIGZvciA2IG1vbnRocyBub3csIGFuZCB3aWxsIGhhdmUgYmVlbiBvdXQNCmZvciBt
b3JlIHRoYW4gYSB5ZWFyIGJ5IHRoZSB0aW1lIHdlIHJlbGVhc2UgU2FtYmEgNC4xMywgYW5kIGxp
a2V3aXNlDQp0aGVyZSB3aWxsIGJlIGEgbmV3IFVidW50dSBMVFMgMjAuMDQuDQoNClRoaXMgY2Ft
ZSB1cCBiZWNhdXNlIGEgc21hbGwgaGVscGVyIHNjcmlwdCBmYWlsZWQgdG8gcGFyc2Ugd2hlbiB3
ZQ0KZXh0ZW5kZWQgdGhlIHNhbWJhLW8zIHRlc3RzICh3aGljaCBydW4gb24gZWFjaCBob3N0KSB0
byBpbmNsdWRlIHRoZQ0KbG9jYWwgIm5vbmUiIHRlc3RzDQpodHRwczovL2dpdGxhYi5jb20vc2Ft
YmEtdGVhbS9zYW1iYS8tL21lcmdlX3JlcXVlc3RzLzkzOA0KDQpJIHJlYWxpc2UgaXQgd291bGQg
YmUgJ3NpbXBsZXInIHRvIGp1c3QgY2hhbmdlIHRoYXQgc2NyaXB0LCBidXQgSQ0Kd2FudGVkIHRv
IHJhaXNlIHRoZSBicm9hZGVyIHF1ZXN0aW9uIGluIHRoZSBob3BlIHRoYXQgd2UgY291bGQgc3Rl
YWRpbHkNCmluY3JlYXNlIHRoYXQgbWluaW11bSB2ZXJzaW9uLg0KDQpTZWUgaHR0cHM6Ly9naXRs
YWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvLS9tZXJnZV9yZXF1ZXN0cy8xMTkzDQoNClRoYW5rcyEN
Cg0KQW5kcmV3IEJhcnRsZXR0DQotLQ0KQW5kcmV3IEJhcnRsZXR0DQpodHRwczovL3NhbWJhLm9y
Zy9+YWJhcnRsZXQvDQpBdXRoZW50aWNhdGlvbiBEZXZlbG9wZXIsIFNhbWJhIFRlYW0gICAgICAg
ICBodHRwczovL3NhbWJhLm9yZw0KU2FtYmEgRGV2ZWxvcG1lbnQgYW5kIFN1cHBvcnQsIENhdGFs
eXN0IElUIC0gRXhwZXJ0IE9wZW4gU291cmNlDQpTb2x1dGlvbnMNCmh0dHBzOi8vY2F0YWx5c3Qu
bmV0Lm56L3NlcnZpY2VzL3NhbWJhDQoNCg0KDQoNCg0KDQoNCg==
