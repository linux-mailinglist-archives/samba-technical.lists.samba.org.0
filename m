Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58B23B1A4
	for <lists+samba-technical@lfdr.de>; Tue,  4 Aug 2020 02:25:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=XJJuU5XcYXdtFOHc2zq8JMaBIwL4ia3FgEzorBtkuWQ=; b=3GBQMYkKKuTS4PCeT7CvWbLhxu
	wegPJ+W1IaEAVsJZLesYEjYx2AzdBXQPsuRAb162ZAi+cR/hKJ4eTXt3xiuPE6tAmJk9Jr0m3DvUc
	5sFsTznTg6Bi/gi8vGHUGPmmjybQt/nYYEfOcivI0lQ2us3apQal73Kr3aIpGbYEqwzbz2kvS2SSd
	7yyho9ptR7da+UdbMi+0BfdKN8N8Q0UbDtNUAu4xKq9dM82e/lq1XVuu5o5QmWdgJzdY9Z4ljGngi
	Isl3liUhDtyyPyBaUzjqWwUIrRY8Or9T7ZDMKaHl2CSNCBTv6QzX/qh9M+bPzlX0Ua6aEWPNdAyWg
	EaKwvqBw==;
Received: from localhost ([::1]:29476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2kkj-00COWC-E5; Tue, 04 Aug 2020 00:24:25 +0000
Received: from mail-dm6nam12on2047.outbound.protection.outlook.com
 ([40.107.243.47]:39649 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k2kkb-00COW5-RU
 for samba-technical@lists.samba.org; Tue, 04 Aug 2020 00:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJJuU5XcYXdtFOHc2zq8JMaBIwL4ia3FgEzorBtkuWQ=;
 b=CQMAjqJGM0Z7/dALxLynDmCDOInGcPuwy3qN4OrPj/WEuiS/uZh7I1IvFXmfemO4hJ63RIuxRWlorgriI3fVwbBpwmeaJQUE4mR+XWNllqGBdGP9QCX6qzCkNt9Dlx3PnQEyyH4g2zouYXI7r4W0ulYU5f/3CL6NZ/cA9OXIXyw=
Received: from DM5PR08CA0038.namprd08.prod.outlook.com (2603:10b6:4:60::27) by
 SN6PR11MB2893.namprd11.prod.outlook.com (2603:10b6:805:dc::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20; Tue, 4 Aug 2020 00:24:01 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::2f) by DM5PR08CA0038.outlook.office365.com
 (2603:10b6:4:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 4 Aug 2020 00:24:00 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 65.52.56.186)
 smtp.mailfrom=storagecraft.com; samba.org;
 dkim=pass (signature was verified)
 header.d=storagecraft.com;samba.org; dmarc=pass action=none
 header.from=storagecraft.com;
Received: from us2-emailsignatures-cloud.codetwo.com (65.52.56.186) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 00:24:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by us2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Tue, 04 Aug 2020 00:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NELq1kWpi7O9vR5/DiCPybS1qfXtXygsG7WvbrbW9+n5AZzTPNTA4zo90bgmkvDCvNQ3s8e1Au2lLSXSvtaZwUTjsfjobwign1Li7g2SWCHuhOQ+t61syXBvc5WgicD3aXhJltw/n3NDvBd3K7Uda59uUrusRgvWYc4nfeLHOH+kNMcfZMsrf5/j9wAClseIY1+wRgoRLAvCWYcbaeSPgFzmC9YtsoUsjEKadYUdEf12sar/0rBjOeHqaADwyMkDUUSkvuDyc0kAr0ynrUG/bprvaSR3O7MsA06xEkhR+sPVVwNad8pVzHTDZABnLMGFV+ye2oZsvQxaHJ8UnLmLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJJuU5XcYXdtFOHc2zq8JMaBIwL4ia3FgEzorBtkuWQ=;
 b=kn1Xe1MjdBGp6GDJvK8OPaDl6HYMc5/KhkgMVNUrfRID73w5YKIhjcZeRQbYQp94cssm2Y/yElzr1LNRZeaKejJ95x509vdi99ER74bOpD8L3U+zbWcE3Eky+Gk1tGWLS8PMijkLIdLPmIuQa8uvADciIx+BT4Nzx7GK5luokwcIpPjZChorZLjjs4XgB9GpsK+zWccuIVUuFTqZR8OOtqIj+QV+8wG5JYJGvQpWyOAyCewavjTPKCbDpEIdVSIfaeQIK1MEzDIA8OCDq+yQGboTK0Q5jHWNqXEgZFE2AmaBQXaA+iYsZfO3RAws6PUevGWkKH/dd5eAKoMHMWr8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJJuU5XcYXdtFOHc2zq8JMaBIwL4ia3FgEzorBtkuWQ=;
 b=CQMAjqJGM0Z7/dALxLynDmCDOInGcPuwy3qN4OrPj/WEuiS/uZh7I1IvFXmfemO4hJ63RIuxRWlorgriI3fVwbBpwmeaJQUE4mR+XWNllqGBdGP9QCX6qzCkNt9Dlx3PnQEyyH4g2zouYXI7r4W0ulYU5f/3CL6NZ/cA9OXIXyw=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM5PR11MB1898.namprd11.prod.outlook.com (2603:10b6:3:114::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 00:23:58 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 00:23:58 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: UNC vs Mapped Drive connection times
Thread-Topic: UNC vs Mapped Drive connection times
Thread-Index: AQHWZS1m2f9cWoeHOE2HCZhE5ocdSKkdkTcA//+XeYCACYKxgA==
Date: Tue, 4 Aug 2020 00:23:58 +0000
Message-ID: <D2DE069A-14B1-49C2-BA0D-694676B54D00@storagecraft.com>
References: <B08C375D-7730-453F-B11C-1357B78C0C10@storagecraft.com>
 <20200728222358.GC3178@jeremy-acer>
 <EEB8FCB6-0669-47F2-8787-F282385CF3EE@storagecraft.com>
In-Reply-To: <EEB8FCB6-0669-47F2-8787-F282385CF3EE@storagecraft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
Authentication-Results-Original: samba.org; dkim=none (message not signed)
 header.d=none; samba.org; dmarc=none action=none header.from=storagecraft.com; 
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4f3e579-841f-4f09-5906-08d8380caf3d
x-ms-traffictypediagnostic: DM5PR11MB1898:|SN6PR11MB2893:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: H+OrrlnDVepAEEPbbdw+PJGOVmRJ1kA48qtcTwe8ydsHF6mcnCSeYwOB2KNtKfXRCxrwqEFTxGx/PUwHFsTEY6PVPLECVJzKfZolxoxz9melqLIvCNQLtbWALiFPW9YAbDbUvTYxCZFhURP5z1VmBuGr+jcXxD+1j8uHlWSTrrt2tTUKBa8kz4ndvt+KAiZDUjpVVg+J+n+ydBr2GMDF3za3qhBDRUXcrwbPfcd6vbc2HJxA27h+0BqWr3waO+i3dhq1oV16jqJIRTxhre9lWKqhmnSKVJZYWTncnrSZAl7m1k8Uozkll34a2cO0x5cDSv2+rvy/Iy4WkH/1nmHkmnI5A7phWs30FcS3H47Z/zcnnCyoJ4btUUWxgRGz51RfVoCEAGBjalGdWZOJKZeTwg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(316002)(66556008)(66446008)(8936002)(186003)(66946007)(64756008)(66476007)(478600001)(91956017)(76116006)(6512007)(53546011)(36756003)(6506007)(6916009)(4326008)(6486002)(2616005)(26005)(83380400001)(2906002)(33656002)(966005)(5660300002)(8676002)(44832011)(86362001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sNTRq13uuzlkApwClCzpq+42FCgOTum5mJPFYj9MCn8HmqKzdbKXhevsXttospYPjvhSPzGLZeDevS8lagXmeuWNE30QPpvQuO0Z9MK/z6oyXuxwxrcyyHMe7GXyd7Zt+F/i4QuCBAY+Qn64XsIKXAtoWt44X1Rg/QVi8BYOBEKylulwTC8OQZS7igOU37LL8I2rLSrR4u96R0nfraK7ShcS4IRzduNBG3xOQk78BwXoFxOXwNhVcZRlJLoOzjXQOHuUst6xbaynFh1VGmgZXZmHZiePa20bMezpRUKeCbPETW900U4SIJhMhKUOpyDsLXE2sTMXuqdnMnqSdo7ZrYG/QJJO17KKYpVtKIcozvGXPsd2sIWXcWrRooAGufM4U9gK7mRfEozBEsw73Tu1KWHXgYuQgRRJzkrGL7nDYlM4ws25eWtjQo6nQ3HmiOqS+cr3x8hTELEqnyFSR1R0TdO0KBrTD/aHqFGTKMyEEyLr2rUdGf8sjrZ4KN1morhsz1jjP9MDf4AbfVnpJrmU++0wNVXYPD3gvKCebH/bL0B9D3WuV1Bj3lgo0gLjZ8HMr0nqX5JpDJ918OGC1OzJSuXa1X/8viXuhPz9DGniGy2++N9zBjqX4Fh++EBKHwEg3iStksG4CRZaGCzh+UEO4Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C2623DB4AB74F4284E51BEFB312D1BF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1898
X-CodeTwo-MessageID: 76c509ef-ab5d-4397-8845-dc51d910f14e.20200804002359@us2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 02a34d5a-42dc-4093-9c06-08d8380cadf0
X-Microsoft-Antispam-Message-Info: HoavWEIaNWp98TTbLHlQLs2RZWMrnCbr3DxcBmOsBrVSuCQgcBO5YozcrhMYPlcUv2BLtVTPYIM1RnGNKbZJaXB4U8LbORHkootssgpqc6A4g3XPAHIfZNh/Y69qaNvGQUKhxNDcNl4PlDdbK0OAPg5+DK+fIBHrB8r8/TxkZXwA+YOq9OiUQMiWhXemQj95bZvvZ8/BNLMBdSPBOeL7lMs8HpUVtD10aqD1v0zWWXyHdPjGimZuHRf3sIla850sdcRhyWV+myyKfoTKIT/OFAgUb19rWwoIPOF36IJPVpqZQ1fv/imjfEyLVWYuJgrhsAebrConORdSTi40bAxJoM/8C57OTUzBPXhsPbMK4M6xxL3RtkVC4GNggR65892hAdunAG9JMj/03S1LeAtCQ53lV7zBDT2HKRqw/KC4CwOccS4ZuMBeIkEor2mAk5dsAzpBqLoPb/9y9eDNn/xyMLdhbaGVcioICAa8it6bKLA=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f3e579-841f-4f09-5906-08d8380caf3d
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[65.52.56.186];
 Helo=[us2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2893
X-Warn: EHLO/HELO not verified: Remote host 40.107.243.47
 (mail-dm6nam12on2047.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SSBhbSBzdGlsbCB3YWl0aW5nIHRvIGdldCBtb3JlIGluZm9ybWF0aW9uIGluY2x1ZGluZyB0Y3Bk
dW1wIGZyb20gdGhlIGN1c3RvbWVyLg0KDQpUaGlzIGVtYWlsIHRocmVhZCBhcHBlYXJzIHRvIGJl
IHNvbWV3aGF0IHJlbGF0ZWQsIGJ1dCBJIGRpZCBub3QgZmluZCBhbnkgZm9sbG93LXVwIHJlc3Bv
bnNlcy4gDQogICAgICAgIGh0dHBzOi8vbGlzdHMuc2FtYmEub3JnL2FyY2hpdmUvc2FtYmEtdGVj
aG5pY2FsLzIwMTctT2N0b2Jlci8xMjM2MTEuaHRtbA0KQW55IGNvbW1lbnRzIG9uIHRoaXM/DQoN
ClJlZ2FyZHMuDQpLcmlzaG5hIEhhcmF0aGkNCiANCg0K77u/T24gNy8yOC8yMCwgNDowOSBQTSwg
IktyaXNobmEgSGFyYXRoaSIgPGtyaXNobmEuaGFyYXRoaUBzdG9yYWdlY3JhZnQuY29tPiB3cm90
ZToNCg0KICAgIFllcywgdGhlIHNhbWUgY2xpZW50IGNvbm5lY3RpbmcgdG8gdGhlIHNhbWUgc2Vy
dmVyIG5hbWUvYWRkcmVzcyBib3RoIHRpbWVzIHdpdGhpbiBhIGZldyBtaW5zIG9mIGVhY2ggb3Ro
ZXIuDQoNCiAgICBJIHdpbGwgdHJ5IHRvIGdldCB0Y3BkdW1wIGNhcHR1cmVzIGZvciBib3RoIGFz
IHdlbGwgYXMgRE5TIGxvb2t1cCB0aW1lcy4NCg0KICAgIFRoYW5rcy4NCg0KICAgIFJlZ2FyZHMu
DQogICAgS3Jpc2huYSBIYXJhdGhpDQoNCg0KICAgIE9uIDcvMjgvMjAsIDM6MjQgUE0sICJKZXJl
bXkgQWxsaXNvbiIgPGpyYUBzYW1iYS5vcmc+IHdyb3RlOg0KDQogICAgICAgICoqKkVYVEVSTkFM
IFNFTkRFUi4gT25seSBvcGVuIGxpbmtzIGFuZCBhdHRhY2htZW50cyBmcm9tIGtub3duIHNlbmRl
cnMuIERPIE5PVCBwcm92aWRlIHlvdXIgdXNlcm5hbWUgb3IgcGFzc3dvcmQuKioqDQoNCiAgICAg
ICAgT24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMTA6MjE6MTJQTSArMDAwMCwgS3Jpc2huYSBIYXJh
dGhpIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQogICAgICAgID4gV2UgYXJlIHVzaW5nIFNh
bWJhIDQuNy4xMS4NCiAgICAgICAgPg0KICAgICAgICA+IE9uZSBvZiBvdXIgY3VzdG9tZXJzIGlz
IHJlcG9ydGluZyB0aGF0IHdpdGggV2luZG93cyA3LCAxMCBFeHBsb3JlciwgY29ubmVjdGluZyB1
c2luZyBNYXBwZWQgRHJpdmUgaXMgdGFraW5nIDEwIHNlY29uZHMgYXJlIG1vcmUgY29tcGFyZWQg
dG8gdXNpbmcgYSBVTkMgcGF0aC4NCiAgICAgICAgPg0KICAgICAgICA+IEkgYW0gbm90IGFuIGV4
cGVydCBpbiB0aGlzIGFyZWEsIGFuZCBJIHN0YXJ0ZWQgaW52ZXN0aWdhdGluZyB0aGUgZGlmZmVy
ZW5jZSBiZXR3ZWVuIHRoZSB0d28gbWV0aG9kcyB0byBpZGVudGlmeSBhbmQgaW1wcm92ZSBhbnkg
Ym90dGxlbmVja3MgZXNwZWNpYWxseSBpbiB0aGUgZmlsZXN5c3RlbSB1bmRlcm5lYXRoIFNhbWJh
Lg0KICAgICAgICA+DQogICAgICAgID4gR2l2ZW4gdGhlIG92ZXJ3aGVsbWluZyBudW1iZXIgb2Yg
dmFyaWFibGVzL3BhcmFtZXRlcnMgaW4gdGhpcyBjb250ZXh0LCBJIHdvdWxkIHZlcnkgbXVjaCBh
cHByZWNpYXRlIHRoaXMgZ3JvdXDigJlzIGNvbGxlY3RpdmUgZXhwZXJ0aXNlIG9uIHBvaW50aW5n
IG91dCBhbnkga25vd24gaXNzdWVzIHRvIGxvb2sgb3V0IGZvci4NCg0KICAgICAgICBETlMvbmFt
aW5nIHJlc29sdXRpb24gbG9va3VwIHRpbWVzID8gQXJlIHRoZXkgY29ubmVjdGluZyB0bw0KICAg
ICAgICBleGFjdGx5IHRoZSBzYW1lIG5hbWUgPw0KDQoNCg==

