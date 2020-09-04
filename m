Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D448D25CED2
	for <lists+samba-technical@lfdr.de>; Fri,  4 Sep 2020 02:37:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=h7hgQHQfKLSuvIR8gBLcU73HesjpH2oxjLs7Ji5aHZ0=; b=bB1a5dfCkpx9UFhlpCFM7YiwEy
	wOEQbnYhfpejx8YY6gASbF5G9jY0R/rFgPcixkeCAgHCz2Ekvj8eq4OPEKYvpduTFgkSTNivvjxh8
	HrKTR9QsBxy6qIgfMpOJxw0CnIDWTVJRNpMzASQdiCF4T+6NPuUyepV1w1FOc9I1iqAzsS/SQJ0qx
	VL58CWR2sbLW+GNQ8UO+XLo5jfTzr5aoG+skuxdDE9WA/Q4y1y0+e5iN0edXSludb8Wa6xddFFLRr
	hRUPLOHrRDnN/ijQfNV4+AZtKFGuU6+JseZ5XKsYPtQt8MXTceZBAiDxN0uHc8eqdfQHPIBuAprjW
	ymfkQPoA==;
Received: from localhost ([::1]:54672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDzig-003t2u-So; Fri, 04 Sep 2020 00:36:46 +0000
Received: from mail-bl2nam02on0608.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::608]:54593
 helo=NAM02-BL2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kDzia-003t2m-H5
 for samba-technical@lists.samba.org; Fri, 04 Sep 2020 00:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7hgQHQfKLSuvIR8gBLcU73HesjpH2oxjLs7Ji5aHZ0=;
 b=elRMhNZcRguhUbz/lmeqdNeEw28FeYljsuEWAnlu1y0fIIxC8NN9MwQvBO6A3i3NTbCNOsdBjVAavSd360J8t/VQCyh6J8Jjie2YjsKOZiM0se3c4DmTqmPb7gLzEiq4MAEOHGDVb+92rXICizl+Tf4Ko+Hm+VmIzjKQ6U1Nw6Q=
Received: from DM5PR13CA0032.namprd13.prod.outlook.com (2603:10b6:3:7b::18) by
 MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15; Fri, 4 Sep 2020 00:36:08 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::88) by DM5PR13CA0032.outlook.office365.com
 (2603:10b6:3:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7 via Frontend
 Transport; Fri, 4 Sep 2020 00:36:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; talpey.com; dkim=pass
 (signature was verified) header.d=storagecraft.com;talpey.com; dmarc=pass
 action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 4 Sep 2020 00:36:08 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.54) by
 us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Fri, 04 Sep 2020 00:36:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRO0aUYxE/f6SMVT3Ud4xnxH+T+wgAC9OfIwARVP5gMsco0E2tY/DYulAWHzUkph3NXEgZw1i7Q0txkjs1tBld3JPtA0w7Lh+4fpUcpFLPmJWMJjfQ16SpKtc5tMczD4YPDP7dRB3ZvtzbakatIa+M4wWo7SWLzdJwaar/x+eEytJswjQwMOQvPCogpKNCPHBa+qQjnm4mJbMn8wudpXxNF+tZTX3kjKNLZ7Kj1s/NlxQSoFBc27yElClzGl81BScsD/4RebVDOiOPSFzRkezX2GrHxanIhXHInNaGezZ93l7tGVsA7Gax7KCpUqL3DsIMXJVjwuPhr9me5E8Bi0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7hgQHQfKLSuvIR8gBLcU73HesjpH2oxjLs7Ji5aHZ0=;
 b=kiJ/jn84REq4YYAq48kflK5Jc4Vs8iKyH2XpKGGrW/PwqhEe05liI+1I2r+wUgye5Esf+r9t3y98Fi37M28jg+Cuvhy7z7+RTq9W36mT5nUwZrkc2GMvAKxKHLFF9qLiuQ+BZsp32KfN0jM6BWTJDz5r4McJjCv1dElxPI6NZQ0EeZlgoBRd19Cxey8axylnk2gIFipusHV679kODVJcolQzEF+r2qeVzeS52vUlhqSkM3vAFflnze4P90JJYSbFwMTYLekCm0lVogQ7DwJ7wEDhCpCieDq8zNsTFKewC6FU/BXNXg3j30lyTMdluaz7DZn1mhBKvMYt1W+CW/4EUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7hgQHQfKLSuvIR8gBLcU73HesjpH2oxjLs7Ji5aHZ0=;
 b=elRMhNZcRguhUbz/lmeqdNeEw28FeYljsuEWAnlu1y0fIIxC8NN9MwQvBO6A3i3NTbCNOsdBjVAavSd360J8t/VQCyh6J8Jjie2YjsKOZiM0se3c4DmTqmPb7gLzEiq4MAEOHGDVb+92rXICizl+Tf4Ko+Hm+VmIzjKQ6U1Nw6Q=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB3273.namprd11.prod.outlook.com (2603:10b6:5:56::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Fri, 4 Sep
 2020 00:36:06 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28%5]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 00:36:06 +0000
To: Tom Talpey <tom@talpey.com>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: Directory Leasing feature in Samba smbd
Thread-Topic: Directory Leasing feature in Samba smbd
Thread-Index: AQHWekiX55qIzeduzE+xPMVqwawon6lKqR0AgAmjkQCAAXsbAIAAErgAgAANpQCAARd+gIAAPTGA
Date: Fri, 4 Sep 2020 00:36:05 +0000
Message-ID: <7E637A87-D647-4D4C-B03B-7CEE72EE9E91@storagecraft.com>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
 <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
 <20200902192054.GD26967@jeremy-acer>
 <52d72e81-a811-3297-2e35-0556e3ab3673@talpey.com>
 <20200902211644.GF26967@jeremy-acer>
 <002b1d57-a632-9fd7-e28b-f645d0993c55@talpey.com>
In-Reply-To: <002b1d57-a632-9fd7-e28b-f645d0993c55@talpey.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.40.20081000
Authentication-Results-Original: talpey.com; dkim=none (message not signed)
 header.d=none;talpey.com; dmarc=none action=none
 header.from=storagecraft.com;
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5a2a1f1b-921b-4913-3abe-08d8506a83fb
x-ms-traffictypediagnostic: DM6PR11MB3273:|MW3PR11MB4715:
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: m7yb08U85rXvz28/RkCCWR+Am7MYWe9RToCpjl6NoUaBcFKYWnN0wT8cN3cnokfnO79CFNSQuTpywcSVsrklT725ULysGwkJNGKQXoo5E9CfDanAP32w4SdHvC35cYNdg/+PiepPKwlWSwz2qMDdmbA4pORwyxQX2S8eHS13tgOkuwS7m0lFGeO3BRiissG/1WXsolRihzQY9LvubVCOBiyiw0y6Hw4IpWdTb6HzE3Zi4FbTqUlRoPTNoOU40NRFMjMsSrZPWFSjkZDA+sZZT1ueU6yflmT8YL3UUmzkO70+Rfy/6LgiQwLPv5EYJnoHn3ZiP5Oi/+Q0KvAeTIuFKA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(33656002)(53546011)(6506007)(36756003)(5660300002)(6486002)(86362001)(64756008)(66446008)(66476007)(66556008)(26005)(91956017)(2906002)(76116006)(66946007)(71200400001)(478600001)(316002)(2616005)(6512007)(110136005)(83380400001)(186003)(44832011)(8676002)(45080400002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fJlhh/5lYrOvGBKfoUR+Bk4iMO4ZGUsCN1qZA0De35cgwkMaHhYm3sIgXpXYMvIaD0IErNWuItD4ux+43ZPRRRvIT+Ih7MKUpVEWgRWGyGyugurlFV2vCrf+Vzxv4B6rTK5zilYYuWPOTvJExLcIk/mGYfX0/xeTvOWytQEZm9uqdwiSqoDuGmfQEP8NdSoxTLMxNNxELUOSL3zxLWV/QdopEu8cuMG8jKbRp6P1q9rOjBFsHj3pme8tJpUX5+fKWzhGnS1+HHD1ml8Maw7zNA82mO2C64FGoQcCQvJVdosTcf4zctEIpXz2lurHvx8j+Hb1b60GcC4BVtnwsQOkFmlAxyK0BcZJLKO0rQU0b/sQyu8DsHFHvMiHOK7DATusKOgMqWgJai2lXfuwcYVl/R/BDnOtaFmMR/H5sqg3y6zDXGnL+QGXAaSyKl6z7WibltxXvtjrlSkHHAlmrK+xB/AD2Xs99tc0zhntGwSULBK4WmvsT36HSAT92hLjgpMiPrW3AtlWKbGUkD7Z1y3lTXvgySFd8uev0ZXEQsrR1TgVTMeNEC0pgGwcmSZMJv0wKmONNwyuI7P37KUzBjxsbH9ZJohyK99gKshMQ7KrBoFE+MgasYMXS3u9kG2LgpE62D5cFEfPrYzdSrYHTwTM/w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <79D7E5A34F01124E87A5D9282CC08D6E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3273
X-CodeTwo-MessageID: 44d164d3-8975-4d65-b6ce-f713371ae46c.20200904003607@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ec2afeb4-1bd9-4a5e-6af0-08d8506a82a3
X-Microsoft-Antispam-Message-Info: lhplWTPcYPcqDEna8HDv3fOUs6SaKqXHUMhINfld54W5lBV7BB2izntig+E/vGiAbaZ2pIZGjKWxDkPvCe1Q4I9ZHCXXqJFYtg3Pqfhv3Ya3QTJz5FMUESesXiTDrVpqj5H4osdKglnPZT7l1jTueHboDmlTfEN8Ww5jL0RXLFv8Qf/4NWLN/XNY2zk8DCEq79FYt+2ndpu8WZTvroz8rxoIIKvFHwGoyAkoVWZNc5Hvfxq4QCDqY5YfPORySPZGg5MvmT2mKu1IxYmxWidkaW/wyLUXxcaMxQMCw/EyMnzjApr3YPxue0Toggq7Kmh3ltWSC8kUkY+LBgXc3ADzR/zSOpDw22idEJnzoEV3WIYJXfX0PnOrgZycsZuCFlDPPsBy0NhfDvZDa8mBWWS/xg==
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2a1f1b-921b-4913-3abe-08d8506a83fb
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe46::608
 (mail-bl2nam02on0608.outbound.protection.outlook.com) incorrectly presented
 itself as NAM02-BL2-obe.outbound.protection.outlook.com
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

VG8gbWFrZSBpdCBjbGVhciwgc3RlcHMgSSBsaXN0ZWQgYXJlIGZvciB0aGUgc2V0dXAgSSB3YW50
ZWQgdG8gdGVzdCAqYmVmb3JlKiBhZGRpbmcgdGVzdC1jYXNlcyB0byBTYW1iYS4gT3VyIHZlc3Rl
ZCBpbnRlcmVzdCBpbiB0aGlzIGZlYXR1cmUgaXMgcHVyZWx5IGR1ZSB0byB0aGUgZmFjdCB0aGF0
IHRoZSB3aW5kb3dzIGNsaWVudCBzZWVtcyB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGlzIGRpcmVj
dG9yeSBsZWFzaW5nIGJ5IGNhY2hpbmcgYW5kIHRodXMgaW1wcm92aW5nIHRoZSByZXNwb25zZSB0
aW1lIG9mIGEgc3BlY2lmaWMgd29ya2xvYWQuIFNvIEkgbmVlZA0KdG8gc2V0dXAgdGhpcyB3b3Jr
bG9hZCB0aGF0IGZpcnN0IHdvcmtzIHdpdGggbmF0aXZlIHdpbmRvd3MgU01CIGltcGxlbWVudGF0
aW9uIC4gVGhlIHNhbWUgc2V0dXAgZXZlbnR1YWxseSBzaG91bGQgYWxzbyB3b3JrcyB3aXRoIFNh
bWJhIHNtYmQgZm9yIHVzIG9uY2UgZGlyZWN0bHkgbGVhc2UgaXMgaW1wbGVtZW50ZWQuIA0KDQpP
biB0aGUgbWF0dGVyIG9mIGFkZGluZyB0ZXN0IGNhc2VzIHRvIFNhbWJhIHRvcnR1cmUgc2V0LCBJ
IGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB3aGF0IHlvdSBhbmQgSmVyZW15IHBvaW50ZWQgb3V0LiBJ
dCB3aWxsL3Nob3VsZCBiZSBiYXNlZCBvbmx5IG9uIFNNQjIvMyBwcm90b2NvbCByZXF1ZXN0L3Jl
c3BvbnNlIGludGVyYWN0aW9uLiBUaGVyZSBpcyBubyBpbnRlbnQgdG8gbWFrZSB0aGUgY2xpZW50
LWNhY2hpbmcgIGFuZCBvdGhlciBhc3BlY3RzIG9mIHRoZSBhYm92ZSBzZXR1cCBhcyBwYXJ0IG9m
IHNhbWJhIGRpcmVjdG9yeSBsZWFzaW5nIHRlc3RzLg0KDQoNClJlZ2FyZHMuDQpLcmlzaG5hIEhh
cmF0aGkNCiANCg0K77u/T24gOS8zLzIwLCA3OjQyIEFNLCAic2FtYmEtdGVjaG5pY2FsIG9uIGJl
aGFsZiBvZiBUb20gVGFscGV5IHZpYSBzYW1iYS10ZWNobmljYWwiIDxzYW1iYS10ZWNobmljYWwt
Ym91bmNlc0BsaXN0cy5zYW1iYS5vcmcgb24gYmVoYWxmIG9mIHNhbWJhLXRlY2huaWNhbEBsaXN0
cy5zYW1iYS5vcmc+IHdyb3RlOg0KDQogICAgKioqRVhURVJOQUwgU0VOREVSLiBPbmx5IG9wZW4g
bGlua3MgYW5kIGF0dGFjaG1lbnRzIGZyb20ga25vd24gc2VuZGVycy4gRE8gTk9UIHByb3ZpZGUg
eW91ciB1c2VybmFtZSBvciBwYXNzd29yZC4qKioNCg0KICAgIE9uIDkvMi8yMDIwIDU6MTYgUE0s
IEplcmVteSBBbGxpc29uIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQogICAgPiBPbiBXZWQs
IFNlcCAwMiwgMjAyMCBhdCAwNDoyNzo1NFBNIC0wNDAwLCBUb20gVGFscGV5IHZpYSBzYW1iYS10
ZWNobmljYWwgd3JvdGU6DQogICAgPj4gT24gOS8yLzIwMjAgMzoyMCBQTSwgSmVyZW15IEFsbGlz
b24gdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCiAgICA+Pj4gT24gV2VkLCBTZXAgMDIsIDIw
MjAgYXQgMDU6MTg6MDVQTSArMDAwMCwgS3Jpc2huYSBIYXJhdGhpIHdyb3RlOg0KICAgID4+Pj4g
SmVyZW15LA0KICAgID4+Pj4NCiAgICA+Pj4+IFRoYW5rcyBmb3IgdGhlIGluc2lnaHRmdWwgcmVz
cG9uc2Ugb24gaG93IHRvIHN0YXJ0IG9uIGRpcmVjdG9yeSBsZWFzaW5nIGZlYXR1cmUuDQogICAg
Pj4+Pg0KICAgID4+Pj4gQWZ0ZXIgcmVhZGluZyBtb3JlIGludG8gTWljcm9zb2Z0IFNNQjIvMyBk
aXJlY3RvcnkgbGVhc2luZywgaW4gb3VyIGN1c3RvbWVyIGNhc2UsIGxvb2tzIGxpa2UgdGhlIHdp
bmRvd3MgY2xpZW50IGlzIHRha2luZyBhZHZhbnRhZ2Ugb2YgdGhlIGdyYW50ZWQgZGlyZWN0b3J5
IGxlYXNlIGFuZCBtYWludGFpbmluZyBhIGRpcmVjdG9yeSBjYWNoZS4NCiAgICA+Pj4+DQogICAg
Pj4+PiBJIGFtIGF0dGVtcHRpbmcgdG8gc2V0dXAgdGhlIGZvbGxvd2luZyBldmVuIGJlZm9yZSB3
cml0aW5nIHRlc3QgY2FzZXMuDQogICAgPj4+Pg0KICAgID4+Pj4gICAgIDEuIFVzaW5nIGRpcmVj
dG9yeSBsZWFzZSBjYXBhYmxlIFdpbmRvd3MgU2VydmVyIDIwMTJSMiAob3IgbGF0ZXIpLCBzZXR1
cCBhIHNoYXJlZCBmb2xkZXIvZGlyZWN0b3J5IHdpdGggYSBzZXQgb2YgZmlsZXMvZm9sZGVycyBp
biBpdC4NCiAgICA+Pj4+ICAgICAyLiBPbiBhIFdpbmRvd3MgY2xpZW50IGNhcGFibGUgb2YgdXNp
bmcgZGlyZWN0b3J5IGxlYXNlICwgbWFwIHRoZSBzaGFyZWQgZm9sZGVyIHRvIGEgbG9jYWwgZHJp
dmUgbGV0dGVyLg0KICAgID4+Pj4gICAgIDMuICBTdGFydCBjYXB0dXJpbmcgdGNwaXAgcGFja2V0
cyBvbiBlaXRoZXIgY2xpZW50IG9yIHNlcnZlci4NCiAgICA+Pj4+ICAgICA0LiBCcm93c2UgdGhl
IHNoYXJlZCBmb2xkZXIgb24gdGhlIGNsaWVudCBtdWx0aXBsZSB0aW1lcy4NCiAgICA+Pj4+ICAg
ICA1LiBUaGUgdGNwaXAgZHVtcCBzaG91bGQgc2hvdyBvbmx5IGEgc2luZ2xlIGRpcmVjdG9yeSBz
Y2FuIHNldCAoU01CMl9GSU5EX0JPVEhfRElSRUNUT1JZX0lORk8gcmVxdWVzdHMvcmVzcG9uc2Vz
KQ0KICAgID4+Pj4NCiAgICA+Pj4+IElzIG15IGFzc3VtcHRpb24gYW5kIGFwcHJvYWNoIGNvcnJl
Y3Q/IElzIHRoZXJlIGEgYmV0dGVyL2RpcmVjdCB3YXkgdG8gbW9uaXRvciB0aGUgZGlyZWN0b3J5
IGxlYXNlIGFuZCBjYWNoZSBpbiB0aGUgY2xpZW50Pw0KICAgID4+Pj4NCiAgICA+Pj4+IE9ubHkg
aW5mb3JtYXRpb24gSSBmb3VuZCBvbiBXaW5kb3dzIGlzIHRoZSBnbG9iYWwgY29uZmlndXJhdGlv
biB2YWx1ZXMgb2YgIkRpcmVjdG9yeUNhY2hlRW50cmllc01heCIgYW5kICJEaXJlY3RvcnlDYWNo
ZUVudHJ5U2l6ZU1heCIgc2hvd24gd2l0aCBwb3dlcnNoZWxsICJnZXQtc21iY2xpZW50Y29uZmln
dXJhdGlvbiIuIEFyZSB0aGVyZSBhbnkgc3RhdHMgdG8gbW9uaXRvciB0byBkZXRlcm1pbmUgdGhh
dCB0aGUgZGlyZWN0b3J5IGNhY2hlIGlzIGFjdGl2ZSB3aXRoIGVudHJpZXMgZnJvbSB0aGUgbWFw
cGVkIGRyaXZlIHRoYXQgaGFzIHRoZSBkaXJlY3RvcnkgbGVhc2VkPw0KICAgID4+Pj4NCiAgICA+
Pj4+IE9uY2UgdGhpcyBzZXR1cCBpcyBkb25lIGFuZCBjb25maXJtZWQgd29ya2luZywgSSB3aWxs
IGhhdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvbiB3aGF0IHRvIGV4cGVjdCBhbmQgSSB3aWxs
IHN0YXJ0IGFkZGluZyB0ZXN0IGNhc2VzIHRvIHNtYiB0b3J0dXJlLg0KICAgID4+Pg0KICAgID4+
PiBIaSBLcmlzaG5hLA0KICAgID4+Pg0KICAgID4+PiBUaGF0IHdvdWxkIHNlZW0gdG8gYmUgYSBn
b29kIHdheSB0byBleHBsb3JlDQogICAgPj4+IGhvdyB0aGUgV2luZG93cyBjbGllbnQgYmVoYXZl
cy4gSSBkb24ndCBoYXZlDQogICAgPj4+IGdvb2QgaW5zaWdodHMgaW50byBob3cgdGhlIFdpbmRv
d3MgY2xpZW50DQogICAgPj4+IG1hbmFnZXMgaXRzIGNhY2hlIEknbSBhZnJhaWQuDQogICAgPj4N
CiAgICA+PiBJIHRoaW5rIGl0J3MgYSB2ZXJ5IHJpc2t5IHRoaW5nIHRvIGFzc2VydCB0aGF0IGFu
eSBwYXJ0aWN1bGFyIGNhY2hpbmcNCiAgICA+PiBvY2N1cnMuIFRoZXJlIGlzIG5vIHByb3RvY29s
IHJlcXVpcmVtZW50IGZvciBjYWNoaW5nLCBzbyB0aGUgYmVoYXZpb3INCiAgICA+PiBvZiB0aGUg
Y2xpZW50IGlzIHB1cmVseSBhbiBpbXBsZW1lbnRhdGlvbiBjaG9pY2UuDQogICAgPj4NCiAgICA+
PiBJdCdzIGdyZWF0IHRvIGV4cGxvcmUgYnV0ICJhZGRpbmcgdGVzdCBjYXNlcyB0byBzbWIgdG9y
dHVyZSIgaXMgbXkNCiAgICA+PiBjb25jZXJuLiBXaGF0IGtpbmQgb2YgdGVzdCBjYXNlcz8NCiAg
ICA+DQogICAgPiBUaGUgc2FtZSBraW5kIG9mIHRlc3QgY2FzZXMgd2UgdXNlZCB0byBkZXRlcm1p
bmUgdGhlIGJlaGF2aW9yDQogICAgPiBvZiBsZWFzZXMgb24gZmlsZXMuDQogICAgPg0KICAgID4g
YSkuIE9wZW4gYSBkaXJlY3Rvcnkgd2l0aCBsZWFzZSwgZGlmZmVyZW50IHZhcmllbnRzIG9mIFJX
SCBldGMuDQogICAgPiBiKS4gVHJ5IG9wZW5pbmcgYSBkaXJlY3Rvcnkgd2l0aCBhbiBvcGxvY2sg
KGRvZXMgdGhhdCB3b3JrPykNCiAgICA+IGMpLiBUcnkgY3JlYXRpbmcgYSBmaWxlIGluIHRoZSBk
aXJlY3RvcnkgdmlhIGEgc2Vjb25kIGNvbm5lY3Rpb24sDQogICAgPiB3YXRjaCBmb3IgdGhlIGJy
ZWFrIHRyYWZmaWMgb24gdGhlIGhhbmRsZSBldGMuDQogICAgPg0KICAgID4gV2UncmUgbm90IHBs
YW5uaW5nIHRvIHRlc3QgdGhlIGNsaWVudCBjYWNoaW5nLCBhcyB5b3Ugc2F5IHRoYXQncw0KICAg
ID4gYSBjbGllbnQgcG9saWN5IGRlY2lzaW9uLg0KDQogICAgU291bmRzIGdvb2QuIEJ1dCBteSBj
b25jZXJuIGlzIHRyaWdnZXJlZCBieSB0aGlzIHN0YXRlbWVudCBpbiB0aGUNCiAgICBvcmlnaW5h
bCBtZXNzYWdlOg0KDQogICAgID4+Pj4gICAgIDUuIFRoZSB0Y3BpcCBkdW1wIHNob3VsZCBzaG93
IG9ubHkgYSBzaW5nbGUgZGlyZWN0b3J5IHNjYW4gc2V0DQogICAgKFNNQjJfRklORF9CT1RIX0RJ
UkVDVE9SWV9JTkZPIHJlcXVlc3RzL3Jlc3BvbnNlcykNCg0KICAgIEJ1dCB0aGVyZSdzIG5vIGd1
YXJhbnRlZSB0aGlzIHdpbGwgYmUgdGhlIGNhc2UuIEEgbGFyZ2UgZGlyZWN0b3J5LCBvcg0KICAg
IG1lbW9yeSBwcmVzc3VyZSwgb3IgYW55IG90aGVyIGNvbmRpdGlvbiBtYXkgY2F1c2UgYSBzY2Fu
LiBJZiB0aGUgc2VydmVyDQogICAgcmV0dXJucyBhIGxlYXNlIG9uIGEgZGlyZWN0b3J5IGhhbmRs
ZSwgdGhhdCdzIGFib3V0IGFsbCB0aGF0IGNhbiBiZQ0KICAgIGNvbmNsdWRlZCBwZXIgdGhlIHBy
b3RvY29sLg0KDQogICAgVGhlcmUgaXMgYWxzbyBzb21lIGJpdCBpbiB0aGUgc2hhcmUgZmxhZ3Mg
YWJvdXQgY2FjaGFiaWxpdHksIGJ1dCBJJ20gbm90DQogICAgc3VyZSBpZiBhbnl0aGluZyBpcyBy
ZXF1aXJlZCB0byBsb29rIGF0IGl0Lg0KDQogICAgVG9tLg0KDQoNCg==

