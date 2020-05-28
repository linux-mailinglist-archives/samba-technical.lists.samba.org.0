Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAADF1E6C0E
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 22:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xUQ4dxhQsTKLZNFQ++e2FE/EmVLEjoSwPQ7AqzwBqyA=; b=18IxwNTyFofTRUc/REmKX/o0eH
	hwtOw5MrSktU8A4vu9Maoj7zLsgvAonnVEZP2KvTMz1FzcvVW6TyMO1fnAcHO0NGNaa1n5j5iBP7v
	1mAyvCtw3vlgwoi76M8IYPiaCHpoAUGYEGzmFX2srKN3LMc4QeeSrAXkWy53muVgFm7Q7y333Zux3
	bJKj3JnappWaiXfFC9OJvfw6+3iZj4Q4z9UvonQ6jgncIvGDmxtQ9azVaZ8+1eCo74HZ9TgOXfcvP
	exy/CEn928HecEHLm48tJeh4PhMTUl0TISWqElvEls3wkL5A23bO6dVkeTg9nKtFeYlnTT9+nsRWs
	GYNNiP1A==;
Received: from localhost ([::1]:27134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeOnw-006Ebn-2u; Thu, 28 May 2020 20:07:04 +0000
Received: from mail-co1nam11on2075.outbound.protection.outlook.com
 ([40.107.220.75]:36541 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jeOnn-006EZe-Sf
 for samba-technical@lists.samba.org; Thu, 28 May 2020 20:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUQ4dxhQsTKLZNFQ++e2FE/EmVLEjoSwPQ7AqzwBqyA=;
 b=dDiT2pkl4dy6oqJFvjLx9oev7R/UrlKKCOX080l2scbZhxJ3TQsQM3Xbsl8l/rX7r47oz+OzDHu6gKYFgTJXcviOoHDlDwy24FMengcu/N1u5XsyJqyTGtZa7LNmgetsY5/fBzaEkI3aUPRMJ/R9xpVgYrgD56z64MnFDHroisY=
Received: from MWHPR11CA0044.namprd11.prod.outlook.com (2603:10b6:300:115::30)
 by BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Thu, 28 May
 2020 19:51:04 +0000
Received: from CO1NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::7d) by MWHPR11CA0044.outlook.office365.com
 (2603:10b6:300:115::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 19:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; lists.samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;lists.samba.org;
 dmarc=pass action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 CO1NAM03FT032.mail.protection.outlook.com (10.152.80.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Thu, 28 May 2020 19:51:03 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.50) by
 us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Thu, 28 May 2020 19:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRbHnVF6vXlclZO8DLSSJD48nLsmzz9peBCnBZ8BVn50X1pPP6D1mkxvyPs5H6qwVwktP/8c0ypynWoEfGJqcxHJtuj974ekrPGzlqWlKOEdtBEO6o6YkOwzpNtl2R9FyM/nw6M8thLaQE18CRejDJOA7/PpSW5aaMNoSrQPFhwp/3Id7ZQwtaMiOQtsGXS70WeoxbJolid7pF43JfsfTarHGBIKFkun//qmrcxEq/dkFHNt7o/jxdX8Jjrw0WewEYk98qE8+XNdvTdoXCXp0t+lhW6G8w3C1lhlUF/UuzyJK0CErLSrVx605aUQVulkvpyLghrzDttWOsN5lFnesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUQ4dxhQsTKLZNFQ++e2FE/EmVLEjoSwPQ7AqzwBqyA=;
 b=Y7b2sgFzUvSHZfrGcO3Wk6WP105yPqvA2Vhx+kZqhj9Q5yzx8u6/+N/RSVik+lSFEMV8CKyV7pCG4UgZo3mOkrNc/IStL4a/1QBtj2eVZXNakngLLeEviJKrm/PtndOobdwZ56DE489p9BPH0w+zKu/G+WRS1z7OmlI6F0ayxazU+IwUxq8C2zAlRBCXFDWho5GfsYvhkFLVD0UcCAOiq2p3nEsZXpR3/20LyQToNK7dynnxCm9WYPqZ6GhCeFgQSIfPTgThHXQY1+6bCNgV3IIc0pBiteFeREbzrQ8wg06DB2kzcfnv9q1vA2tdSX9EaYpj3lC5dmQ1ebpko/cvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUQ4dxhQsTKLZNFQ++e2FE/EmVLEjoSwPQ7AqzwBqyA=;
 b=dDiT2pkl4dy6oqJFvjLx9oev7R/UrlKKCOX080l2scbZhxJ3TQsQM3Xbsl8l/rX7r47oz+OzDHu6gKYFgTJXcviOoHDlDwy24FMengcu/N1u5XsyJqyTGtZa7LNmgetsY5/fBzaEkI3aUPRMJ/R9xpVgYrgD56z64MnFDHroisY=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB3803.namprd11.prod.outlook.com (2603:10b6:5:141::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 19:51:01 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a%8]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 19:51:00 +0000
To: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Samba user quota implementation question
Thread-Topic: Samba user quota implementation question
Thread-Index: AQHWNF7zbmQ9XIiNp0+V9JbVx3GYtqi9J9kAgABMroA=
Date: Thu, 28 May 2020 19:50:59 +0000
Message-ID: <A4FC67D0-2745-4470-9B66-9553332248E5@storagecraft.com>
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
 <1af2ea27-dcf3-6401-acde-c4b5021f2d03@samba.org>
In-Reply-To: <1af2ea27-dcf3-6401-acde-c4b5021f2d03@samba.org>
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
X-MS-Office365-Filtering-Correlation-Id: 76381d72-1d13-42f9-6a80-08d803407471
x-ms-traffictypediagnostic: DM6PR11MB3803:|BYAPR11MB3205:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: T7FBnvBKaowL22JatJmWVh3JGbcgMtQC/UtGD9sXuweAkoRl9xIO94hgj5hyh0oeS45AgjVsGRL7Vvub01102Y+KeBMLAWkNE7pVCLDn3RYdZ7ChGuAXk9yzACDSPr8xcLLG45pGJ3HfGulHmXUrQQTj4VBpBwQCQmtRHtjSrZ2Ni7mkJMe4Elj4M1HGijYy08JfsPQ/Zjub9AECTfC6TgAR/me8c2ldqNSsy7MxVXj6wWzNoJnCyTvfXBm6TGzI10Nqm4RNESGxzZc76IkPAp/OvBBMxKmEkxBS4SJZwi44W9oSHBmQl4hDvQcMGPflnTJ9r/AKkrQVjCrd1BK5z/pRT2EUphAIp86iOVPW80XKBVSJ4FC3MMrMHcYQnnXdO5W4/K8AO3/Gw88pt8GcTg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(91956017)(6512007)(45080400002)(186003)(2616005)(6916009)(44832011)(83380400001)(71200400001)(33656002)(2906002)(8676002)(36756003)(66556008)(8936002)(316002)(76116006)(15650500001)(6486002)(26005)(5660300002)(86362001)(64756008)(66446008)(66946007)(478600001)(66476007)(6506007)(53546011)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: kqeGTVNBcAyBH6h58t5rhxe2kPOwOmq0uRP2UBpFjggWLpV9U6TiJnxDBXOKPdQOkUB8bsqKXOV3EV0bBEmGgv1G9CxBW2OYhqUWsnKTten6HglnAOw5caBKw0UpC7pmVGmlM93cO/0TNU5bYak+EIkovEC91oZfaDiJtBhhmhNIVk1E7VZ7iGeN9Eu0fP9L8GX1FEDbbivnufDj4ePHEiGCnGiOsJxJFyC9WIplh/4i/7eOmsKdBjCT0cKNLE7zounLxQQ2Z4CL4n6fhLUMoIsnmoCqThetAdANCh6XW7YAeqzdBiVhQgSWBxdY+aNj5x5Hh5S1KNGJoQmNYIp+LrEor80DCE4WJF0WWsgU0lIwylvJVseX+EXbTGkyJWhU8laLZaKynNY9pN+NTq3m/XtKwDlsbMsKl8yovs3VOf7qpcTzlAV96SbFc6fjgJDYLybVPkf43CNZJ3HPT30W7G7bLAHdNNmJW/a+PM96ROPVesVl4iRpvKRgInwApfGd
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B19B4FE64470B46B10DA122227BE4E6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3803
X-CodeTwo-MessageID: b3ea34c0-e27b-4e3d-8de8-bed8af36fd11.20200528195102@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT032.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fc51d9ec-86d0-4320-6a40-08d803407244
X-Microsoft-Antispam-Message-Info: USSZaYAEesR6xxPOjpH0dA9XJrBCjlAIO/4Mr/zjq4x1b0MYE0hV5rIgpR76HQUeZWuWY0+bxb3qtrdHrTqHwIzEkxS7oTnZE7p9O35NFtYIMFVJcfumu0uCYSjV+2RFe1X0jlbbWpUQg40VlMjYMBTfq3ui9hYwlLIsqDMuyrz5nUn7QHSjNRKuUNwBxmNnP80d8NnEbcMwrJcO8B2aoJLchebZ0sZz3jRac+9mcGaFHRTQeLEFJBn4MY97golFiP/uCLqN5Ww0UslFntfd3e4ecTptkVoLiqPKE+gQftd2yzS6UXQxoK/4vCCKgktUjGaSWwX9HIgdKZqLmoUk0xoxUn+GylvIxFmncToWfhFtrVYCbww/zrltpiwBvIO12uE3mgb6Jqqj0VAErgMBc9B1L/0sj6IWjKJDCntSJC95WnIPs6v3LgvqDcJCTlCJl+5DKcs3dZ+0VRDcMe0D00vXCgqaVV/fX13xOmbp4FY=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76381d72-1d13-42f9-6a80-08d803407471
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3205
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.75
 (mail-co1nam11on2075.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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

VGhhbmtzIHRvIGFsbCBmb3IgcmVzcG9uc2VzLCBhbGwgeW91ciBjb21tZW50cyBhcmUgdmVyeSB1
c2VmdWwuDQoNClJvd2xhbmQgLSBJIGNsZWFuZWQgdXAgc21iLmNvbmYgYXMgeW91IHN1Z2dlc3Rl
ZCBidXQgcmVzdWx0ZWQgaW4gbm8gY2hhbmdlIG9yIGltcHJvdmVtZW50LiAgSSBhbHNvIGhhdmUg
IndpbmJpbmQgZW51bSB1c2VycyA9IHllcyIgYW5kICJ3aW5iaW5kIGVudW0gZ3JvdXBzID0geWVz
IiBhcyBwb2ludGVkIG91dCBieSBBbmRyZXcsIHRob3NlIHdlcmUgZGlzYWJsZWQgdG8gYXZvaWQg
dGhlIHByb2JsZW0gVXJpIGJyb3VnaHQgdXAuIEJUVywgIlB1YmxpYyIgYW5kICJUZXN0USIgc2hh
cmVzIGFyZSBub3QgTkZTIGV4cG9ydHMgYW5kIG1haW4gZm9jdXMgZm9yIHNldHRpbmcgdXNlciBx
dW90YSBpcyBvbiB0aGUgbm9uLXB1YmxpYyAiVGVzdFEiIHNoYXJlLiANCg0KVXJpIC0gdGhhbmtz
IGZvciBwcm92aWRpbmcgaW5zaWdodCBhbmQgY29uZmlybWluZyB3aGF0IEkgd2FzIGluZmVycmlu
ZyBhcyBob3cgcXVvdGEgZW51bWVyYXRpb24gd2FzIGltcGxlbWVudGVkLiBFdmVuIGlmIEkgZ2V0
IHRoZSBlbnVtZXJhdGlvbiB0byB3b3JrIGluY2x1ZGluZyBBRCBEb21haW4sIEkgY2FuIHNlZSB0
aGF0IGl0IHdpbGwgZW5kIHVwIGluIHRoZSBzY2FsYWJpbGl0eSBwcm9ibGVtLg0KDQpBcyBhIGZp
cnN0LWN1dCB3b3JrYWJsZSBpbXBsZW1lbnRhdGlvbiwgSSBhbSBsZWFuaW5nIHRvd2FyZHMgbWFr
aW5nIGFwcHJvcHJpYXRlIGxvY2FsIHVzZXIgdWlkIGFuZCBncm91cCBnaWQgZW50cmllcyBpbiB0
aGUgbG9jYWwgZmlsZXMgd2l0aCBhIHN1Y2Nlc3NmdWwgc2V0IHF1b3RhLA0KY29udGFpbmluZyB0
aGUgc2NhbGFiaWxpdHkgcHJvYmxlbSBmb3Igbm93IGFuZCBhdm9pZGluZyBhZGRpbmcvY2hhbmdp
bmcgU2FtYmEgaW1wbGVtZW50YXRpb24uIEkgaGF2ZSB0byB0aGluayBhIGJpdCBtb3JlIG9uIHRo
ZSBpbXBsaWNhdGlvbiBvZiBhZGRpbmcgdGhvc2UgZW50cmllcywgZXNwZWNpYWxseSBvbiB0aGUg
bGlmZS1jeWNsZSBhbmQgY2xlYW51cC4gDQoNCkFueSBmdXJ0aGVyIGNvbW1lbnRzIG9uIHRoaXMg
aXMgbXVjaCBhcHByZWNpYXRlZCBhcyBhbHdheXMuDQoNClJlZ2FyZHMuDQpLcmlzaG5hIEhhcmF0
aGkNCiANCg0K77u/T24gNS8yOC8yMCwgMToxNiBBTSwgIlVyaSBTaW1jaG9uaSIgPHVyaUBzYW1i
YS5vcmc+IHdyb3RlOg0KDQogICAgKioqRVhURVJOQUwgU0VOREVSLiBPbmx5IG9wZW4gbGlua3Mg
YW5kIGF0dGFjaG1lbnRzIGZyb20ga25vd24gc2VuZGVycy4gRE8gTk9UIHByb3ZpZGUgeW91ciB1
c2VybmFtZSBvciBwYXNzd29yZC4qKioNCg0KICAgIE9uIDUvMjcvMjAgMTA6NDIgUE0sIEtyaXNo
bmEgSGFyYXRoaSB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KICAgID4gT3VyIE9uZVhhZmUg
RlMgIHN1cHBvcnRzIHNoYXJlL2ZzIGxldmVsIHF1b3RhIHVzaW5nIHNtYi5jb25mIOKAnHNldCBx
dW90YSBjb21tYW5k4oCdIGFuZCDigJxnZXQgcXVvdGEgY29tbWFuZOKAnS4NCiAgICA+DQogICAg
PiBXZSBhcmUgY3VycmVudGx5IGV4dGVuZGluZyBzdXBwb3J0IHRvIHVzZXItbGV2ZWwgcXVvdGFz
IHVzaW5nIHRoZSBzYW1lIGludGVyZmFjZSwgd2hlbiBTYW1iYSBzbWJkIGlzIGFuIEFEIERDIG1l
bWJlci4NCiAgICA+DQogICAgPiBTZXR0aW5nIHVzZXIgcXVvdGEgZnJvbSBhIHdpbmRvd3MgY2xp
ZW50IGlzIHdvcmtpbmcgYXMgZXhwZWN0ZWQuIEJ1dCBvbmNlIHF1b3RhIGlzIHNldCwgbm9uZSBv
ZiB0aGUgdXNlcnMgYXJlIGxpc3RlZCBpbiB0aGUgcXVvdGHigJlzIHBvcC11cCB3aW5kb3csIHNv
IGNhbm5vdCBkZWxldGUgb3IgbW9kaWZ5IHF1b3RhIHByb3BlcnRpZXMuIE1vcmVvdmVyLCBjcmVh
dGluZyBhIG5ldyBxdW90YSBlbnRyeSBmb3IgdGhlIHNhbWUgdXNlciBpcyBnZW5lcmF0aW5nIGEg
4oCccXVvdGEgZW50cnkgYWxyZWFkeSBleGlzdHMgZm9yIHRoaXMgdXNlcuKAnSBlcnJvci4NCiAg
ICA+DQogICAgPiBCeSB0cmFjaW5nIGdldC9zZXQgcmVxdWVzdHMgdG8gb3VyIGZpbGUgc2VydmVy
LCBJIHNlZSB0aGF0IG91ciBGUyBzZXJ2ZXIgaXMgcmVjZWl2aW5nIGEgZ2V0IHJlcXVlc3QgZm9y
IFNhbWJhIGZvciBldmVyeSB1c2VyIGVudHJ5IGluIHRoZSBsb2NhbCBwYXNzd29yZCBmaWxlLCBi
dXQgbm9uZSBmb3IgdGhlIFVJRCBvZiB0aGUgREMgbWVtYmVyIHVzZXIuIEJ1dCBJIGRvIHNlZSBh
IGRlZmF1bHQgcXVvdGEgZ2V0IHJlcXVlc3QgZm9yIHRoZSBncm91cCBHSUQuDQogICAgPg0KICAg
ID4gVGhlIHByb2JsZW0gc2VlbXMgdG8gYmUgdGhhdCB0aGUgZ2V0L3NldCBjb21tYW5kIGludGVy
ZmFjZSBkb2VzIG5vdCBvYnZpb3VzbHkgc3VwcG9ydCBhIOKAnGxpc3TigJ0gdXNlciBxdW90YSBh
cGkgdG8gdGhlIGhvc3RpbmcgRlMuDQogICAgPg0KICAgID4gUXVlc3Rpb25zIG9uIHRoaXMg4oCT
ICBXZSBjYW4gcG9zdCBhbmQgbWFuYWdlIHVzZXIgZW50cnkgKGhvc3QtbG9jYWwgdWlkL2dpZCkg
Y29ycmVzcG9uZGluZyB0byB0aGUgREMgdXNlciBzaWQvZ2lkIHdoZW5ldmVyIGEg4oCcc2V0IHVz
ZXIgcXVvdGHigJ0gaXMgcmVjZWl2ZWQuIEkgZGlkIHZlcmlmeSB0aGF0IHdoZW4gYW4gZW50cnkg
aXMgbWFkZSBtYW51YWxseSwgd2luZG93cyB1c2VyIHF1b3RhIHdvcmtmbG93IGJlaGF2ZXMgYXMg
ZXhwZWN0ZWQuIElzIHRoZSBwcm9ibGVtIGFzc3VtcHRpb24gY29ycmVjdCBhbmQgaXMgdGhpcyBh
IHdheSB0byBpbXBsZW1lbnQ/IElzIHRoZXJlIGEgYmV0dGVyIHdheSwgZ2l2ZW4gdGhlIGNvbnN0
cmFpbnRzPw0KICAgID4NCiAgICA+IFdlIGFyZSB1c2luZyBTYW1iYSA0LjcuMTEgcGF0Y2hlZCB3
aXRoIGh0dHBzOi8vbmFtMDMuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmJ1Z3ppbGxhLnNhbWJhLm9yZyUyRnNob3dfYnVnLmNnaSUzRmlkJTNEMTM1
NTMlMjNjMTcmYW1wO2RhdGE9MDElN0MwMSU3Q2tyaXNobmEuaGFyYXRoaSU0MHN0b3JhZ2VjcmFm
dC5jb20lN0NjNzQ3YTgzNzFiYzg0ODI3MmVlZjA4ZDgwMmRmNzE0NCU3Qzk5ZjRlM2M5YmVkNTQ0
M2RiZDUzMmIzZjIyZDRlZGRmJTdDMCZhbXA7c2RhdGE9b3JkYUVYYWllOHlFVDdSWnI3M3NFTEVB
OWl0TllrS3d2ZVUlMkJZWUQyOWxrJTNEJmFtcDtyZXNlcnZlZD0wIGZpeCBmb3IgNC43Lg0KICAg
ID4NCiAgICA+IEFueSBoZWxwIGlzIHRoaXMgaXNzdWUgaXMgbXVjaCBhcHByZWNpYXRlZCBpbiBh
ZHZhbmNlLg0KICAgID4NCiAgICA+IFJlZ2FyZHMuDQogICAgPiBLcmlzaG5hIEhhcmF0aGkNCiAg
ICA+DQoNCiAgICBIaSENCg0KICAgIEkgYmVsaWV2ZSBTYW1iYSdzIHF1b3RhIGltcGxlbWVudGF0
aW9uIGlzIGxhY2tpbmcgaW4gdGhhdCByZWdhcmQuIEkNCiAgICBndWVzcyBub25lIGhhcyBldmVy
IHRha2VuIHRoZSB0aW1lIHRvIGltcGxlbWVudCBpdCBwcm9wZXJseSwgYW5kIHRoZQ0KICAgIGN1
cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgZW51bWVyYXRpbmcgcXVvdGEgZW50cmllcyBpcyBhdCBQ
T0Mgc3RhdGUNCiAgICAobWVhbmluZyB0aGF0IGl0IHVuZGVyc3RhbmRzIHRoZSBTTUIgcHJvdG9j
b2wgYnV0IHRoZSBiYWNrZW5kIGlzIG5vdA0KICAgIGltcGxlbWVudGVkIGZ1bGx5KS4NCg0KICAg
IFRoZSBjb3JyZWN0IHdheSB0byBlbnVtZXJhdGUgIHF1b3RhIHNldHRpbmdzIG9uIDxzb21ldGhp
bmc+IChiZSBpdCBhDQogICAgZGlzaywgYSBzaGFyZSwgYSBmb2xkZXIsIC4uLikgaXMgdG8gbG9v
ayBhdCB0aGUgPHNvbWV0aGluZz4gYW5kIHNlZSB3aGF0DQogICAgcXVvdGEgc2V0dGluZ3MgYXJl
IHRoZXJlLiBUeXBpY2FsbHkgd2Ugd29uJ3QgZmluZCBtYW55IHF1b3RhIHNldHRpbmdzIC0NCiAg
ICBtYXliZSBvbmUgcGVyIGdyb3VwLCBhdCBtb3N0IG9uZSBwZXIgdXNlciB3aGljaCBhY3R1YWxs
eSB1c2luZyB0aGUNCiAgICA8c29tZXRoaW5nPi4NCg0KICAgIFNhbWJhIG9uIHRoZSBvdGhlciBo
YW5kLCB0cmllcyB0byBlbnVtZXJhdGUgYWxsIHVzZXJzLCBhbmQgY2hlY2sgZm9yDQogICAgZWFj
aCB1c2VyIHdoZXRoZXIgdGhlcmUgYXJlIHF1b3RhIHNldHRpbmcgZm9yIGl0LiBUaGlzIGFwcHJv
YWNoIGRvZXNuJ3QNCiAgICBzY2FsZSB3ZWxsIGluIGFuIEFEIGRvbWFpbiB3aGljaCBoYXMgbWFu
eSBtb3JlIHVzZXJzIHRoYW4gdXNlcnMgb2YgdGhlDQogICAgPHNvbWV0aGluZz4gaW4gcXVlc3Rp
b24uIElmIGl0IHdhcyB1cCB0byBtZSwgd2UnZCByZW1vdmUgdGhlIGFiaWxpdHkgb2YNCiAgICB3
aW5iaW5kZCB0byBlbnVtZXJhdGUgYWxsIGRvbWFpbiB1c2VycyAod2UgYWN0dWFsbHkgdHJpZWQg
dGhhdCBvbmNlIGJ1dA0KICAgIGdvdCBhIGJhY2tsYXNoIGFuZCByZXZlcnRlZCB0aGUgY2hhbmdl
KS4NCg0KICAgIFNvIHdoYXQgSSdkIGRvIGlzIGNvbWUgdXAgd2l0aCBhIG5ldyBWRlMgQVBJIGNh
bGwgdG8gZW51bWVyYXRlIHF1b3RhDQogICAgZW50cmllcywgaGF2ZSB0aGUgZGVmYXVsdCBpbXBs
ZW1lbnRhdGlvbiBleHRlbmQgdGhlDQogICAgc3lzX2dldF9xdW90YSgpL3N5c19zZXRfcXVvdGEo
KSBmdW5jdGlvbnMgd2l0aCBhIHN5c19saXN0X3F1b3RhcygpIG9yDQogICAgc29tZXRoaW5nIHNp
bWlsYXIsIGFuZCB0aGVuIHdyaXRlIGEgVkZTIG1vZHVsZSBmb3IgbXkgY3VzdG9tIGZpbGUgc3lz
dGVtDQogICAgKG9yIGEgVkZTIG1vZHVsZSB0aGF0IGNhbGxzIGEgc2NyaXB0IGlmIEkgd2FzIHdv
cnJpZWQgYWJvdXQgR1BMKS4NCg0KICAgIEkgaG9wZSB0aGF0IGhlbHBzLA0KICAgIFVyaS4NCg0K

