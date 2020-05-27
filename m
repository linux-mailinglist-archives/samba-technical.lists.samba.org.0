Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A45291E5112
	for <lists+samba-technical@lfdr.de>; Thu, 28 May 2020 00:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=eqZ7HBF8wjjvIUqKc4Kz04iyya4LWX36cDGDbq+zfjc=; b=lugoLhbipAdr7XCEXNAuU+xreU
	pyYRm1nrzgB79CdtkOXtcSHlGZm1EaouZlCCblCZzmqyGIhKIhQhrGZlaPN/BseRNAW9JIUYK0XPr
	qZzmR4T6VKvM41bs7QIfumSTQH3yaNi19xvgv5uP110RzEgd/RRSeRWN/S2oCa5yrAK/0Bqjn8c9l
	5JPGU/Y5jxWvCL9rMwHJoYe2KQ4HizFfyxgFbsR6vsW3ENFu1359pWQv90R6+FqDcL0fl2xOIAoaN
	IxhECNtsiyloNKjr7QO9XZFf/80346TJLpr9UdP1UGpmccYf439LpHYu0CjxJk36Ys6kubJEZ6qs+
	xCjt5rKQ==;
Received: from localhost ([::1]:24954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1je4M0-0066Ot-NJ; Wed, 27 May 2020 22:16:52 +0000
Received: from mail-co1nam11on2066.outbound.protection.outlook.com
 ([40.107.220.66]:6160 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1je4Lo-0066Ol-2Z
 for samba-technical@lists.samba.org; Wed, 27 May 2020 22:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqZ7HBF8wjjvIUqKc4Kz04iyya4LWX36cDGDbq+zfjc=;
 b=LqHUJ91cHsrp9vVciBsQUM+WHX8eY9euk2PQStvx90PEWii0RkiPTSuYT4i3p6RiKaGkvb6JQ5CLuHBS10GZBsC/4oky1rPeYYuZyMe4mMBMe3QCJ3l7jAn1ApfQbCQMz1vNDaJEaBxmJ9RQNkCjqTYbjePQLrJ+xUZLTMJz8bE=
Received: from DM5PR18CA0051.namprd18.prod.outlook.com (2603:10b6:3:22::13) by
 DM6PR11MB3161.namprd11.prod.outlook.com (2603:10b6:5:e::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19; Wed, 27 May 2020 22:16:23 +0000
Received: from DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:3:22:cafe::51) by DM5PR18CA0051.outlook.office365.com
 (2603:10b6:3:22::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Wed, 27 May 2020 22:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;samba.org; dmarc=pass
 action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 DM3NAM03FT045.mail.protection.outlook.com (10.152.82.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 22:16:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Wed, 27 May 2020 22:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQ5QiiCn5xyTgVXngsJZP20y1GkQ/Zstx+dM6gIuoxxoPSFI07SAlTHffw8h8FmLX6yxB4yn7tdE4VWnJ9nV8l1LteyUdgBggNkua6kdwFoQ7xtCVmSg9qeUoYaLIvYRM7DxGMiomXVSs0zNUCHqzg83y2X875X8dHmedq6GQkkxTW6lKiM53VcRKcDXo7Psw/eJcKIHHEpyEw/7+YkFmFCTbYrRHtxRrRjfmeMPNsfpZVbEDAHbZCo0mT2h/LQshENOBjvWt8lxgHlDB/7SAXLNuvtcwnqWIdV4HFPCHtC28KxdsS/G9gCogxWRFfMtm7JXBz95CFfvcjTixC4W0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqZ7HBF8wjjvIUqKc4Kz04iyya4LWX36cDGDbq+zfjc=;
 b=I4+CVjjKS5wW/vaMPXekzHLpvE2sAnbP+/ShcPzIKyOaimiE4cbF2FrdcK+9N/gFpnUwimiRCQz7GjE8yAVkDb69ZGaLaGJYAcQQLLsLPSd61MBLa7WgCrTDz9jGADWxEQJS+lv76h5SW4gWtVVNcTEx/SEVdrBvXusepPZDbnsm15Rk9Ntl+PD3Mxdp3LTmQFKV4VDT0FT1W/+p7JzHAw8WNiGAECHtVqslSWAw4bqQjiwm5FnAPq07YQMXmRb8aH8TJo25Seo0rh0zc4iSq6fcVZDxzmmRD5ngj70o+jr2LZ/kJMsVTUWeFjuP1EyP9oA+zDR66gPoME9aUwt9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqZ7HBF8wjjvIUqKc4Kz04iyya4LWX36cDGDbq+zfjc=;
 b=LqHUJ91cHsrp9vVciBsQUM+WHX8eY9euk2PQStvx90PEWii0RkiPTSuYT4i3p6RiKaGkvb6JQ5CLuHBS10GZBsC/4oky1rPeYYuZyMe4mMBMe3QCJ3l7jAn1ApfQbCQMz1vNDaJEaBxmJ9RQNkCjqTYbjePQLrJ+xUZLTMJz8bE=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB3962.namprd11.prod.outlook.com (2603:10b6:5:192::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Wed, 27 May
 2020 22:16:18 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a%8]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 22:16:18 +0000
To: Rowland penny <rpenny@samba.org>, Isaac Boukris via samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: Samba user quota implementation question
Thread-Topic: Samba user quota implementation question
Thread-Index: AQHWNF7zbmQ9XIiNp0+V9JbVx3GYtqi8WCwA//+yn4A=
Date: Wed, 27 May 2020 22:16:18 +0000
Message-ID: <CD19BF6F-5055-4697-A1BD-C8FF6948FD51@storagecraft.com>
References: <4D14BB46-74F3-4EB7-A3F4-0C290A464D16@contoso.com>
 <beb6a045-722d-fe0d-e41d-ab7a25fbc5fb@samba.org>
In-Reply-To: <beb6a045-722d-fe0d-e41d-ab7a25fbc5fb@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.37.20051002
Authentication-Results-Original: samba.org; dkim=none (message not signed)
 header.d=none; samba.org; dmarc=none action=none header.from=storagecraft.com; 
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1db13110-cdd8-4a44-b972-08d8028b96c5
x-ms-traffictypediagnostic: DM6PR11MB3962:|DM6PR11MB3161:
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: F/nK1ZrwmBs8ZaRRUw95IF3CpqZaY+rftOZI9W4c5rFxLG2s1RlnKTBDM55lbfcnraK9W4tMip/BgKg+v4+AVzgtDe5MagRUTjN4VcmHxZmKtNF28hynoTebwXpjhr5AsAxRWCtw6qPwi10i/R/mr4dxWF0eRhCgihmVzpRXXMh9IMePSljpimG7qfOK8mKY018s/hQKPxldZIq9nBHqT8/mV/EV0v6hHLdJtBRq+k/Ec0XM9pDJ2BFvFCdIZ3AjgWN89JQ7gwcBogOS4Kn+HdADrMHjNnbjuMofPEde1I+7z2VyBujSRyZctQDLCQb6GeOlXBVPf3MDYqneJG8EXgcE3NljTY3MbVUzK9NQjOXOaLXvRqnmR7JInh2MnwwjcZDMnVKDzEgKvXwhtZJN0w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(86362001)(6506007)(966005)(53546011)(5660300002)(478600001)(45080400002)(83380400001)(33656002)(8936002)(76116006)(66556008)(316002)(66946007)(64756008)(110136005)(66476007)(2906002)(6512007)(6486002)(66446008)(8676002)(26005)(186003)(44832011)(91956017)(2616005)(71200400001)(15650500001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0hrhDEhhNKPunEi0p4bTfvkCEGRates8Bte/0NzgdPRKfIKrcTRBzi13OC3sNjGwsi/0l1+68tDd3rcFT5EGyiWKO/huYQkM/bm5BjDaXLjO+X9rhZYgxXs+H5WVwJ/1UZtY2AB/GpnTdQx319TSjrtJjE/CpwLFMXLMXaWOXqpouxgcbFvIHYXrwX3by2UHqIshEfGBuOgmZsZ1ywviHdbaF6e4+WsuzKXlL6645KSiIXwpWFcbrtAAsKErRiGnDkD04tBbPqLIzRHTMqRFpAakhvRBcTqGkD19AJmT6zma1O9RRyzEm8uuSOQ9RobolZ9dB0cdVl60qqYWtQt8gAkQ1TGBCwF6VldEnbqKJKfEjOwtrCC9LxrYwqWrnUOk8qKfsrGwsy5e9IOx8MsE88dB6MSISqHNs0MHzXBMBkt1PV53tgurLQb493LdCaD6ZO5TYK0o0DEkGfBeQnn+pqBFJts+4WoSDaoAapoMfydGoQx8kIaD17bVRFMonJKC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC1B3D74EC1F4045B3F952B2113A5722@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3962
X-CodeTwo-MessageID: 51cd47a8-72b3-4a12-abbd-d26785223fbd.20200527221621@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM3NAM03FT045.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc06d7af-2a0f-41c9-3608-08d8028b9466
X-Microsoft-Antispam-Message-Info: CaqzNXmlmUsjD8EtwsjgaHI4H0YipGKPHkAbVo7qNBuS8S7MVtIi53eDDaM943m97A6tpUu+khwSF4zrT7E4q7t98hCaB4K9wOJ6t37yC/VELeeqseoLBM/bTjYRuN9w7bVraIvFERsIcXjOxnzLhmB008twi4uGWiLrVy6WJzKX6ifYgTXJhL6Ju5eiIjDib9jyYg0qYEkjzdjTn0fFBimKPQhNRC2ujM++pptnuC7qhus3pjDrXGZOw3ajKgtt+sMra7+e/LLvQe76mJLJHe7UjqH0KLeydlJFtQHL2EHpIQih9aCswBjRBQoVrcwUOilK66Y+sAIpKrToQRV9JWLpZdSQLr1namc0noCtvmZ59raezF5RzPdEKiebSAv8dR7x82A9lbVOwod03jlhqfsMrPraR2Up9UBYnHYK+8781/A3BmY4agY63d8sti0p+iPFQ3vbhW0dbRi0vP9HaPbTB73LNmJ3oLORPiETyqk=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db13110-cdd8-4a44-b972-08d8028b96c5
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3161
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.66
 (mail-co1nam11on2066.outbound.protection.outlook.com) incorrectly presented
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

T24gdGhlIGNvbnRyYXJ5OyBub3JtYWxseSwgdGhlcmUgaXMgbm8gcGFzc3dkIGVudHJ5IG1hZGUg
Zm9yIGEgQUQgdXNlciBpbiB0aGUgbG9jYWwgcGFzc3dvcmQgZmlsZS4NCg0KVGhlIHNldCB1c2Vy
LXF1b3RhIChmb3IgYSB1c2VyIHVzZXItcXVvdGEgd2FzIG5vdCBzZXQgYmVmb3JlKSBpcyB3b3Jr
aW5nIGZpbmUgYXMgaW50ZW5kZWQgd2l0aG91dCBhbnkgbWFudWFsIGFkZGl0aW9uIHRvIGxvY2Fs
IHBhc3N3b3JkIGZpbGUuDQoNCkkgaGF2ZSB0byBtYW51YWxseSBhZGQgdGhlIHVpZC9naWQgZW50
cnkgb2YgdGhlIFNJRC9HSUQgb2YgdGhlIHVzZXIgYXV0aGVudGljYXRlZC9hdXRob3JpemVkIGJ5
IEFELCAgaW4gb3JkZXIgZm9yIHRoZSB3aW5kb3dzIGNsaWVudCB0byBsaXN0L3Nob3cgdGhlIHVz
ZXIgdGhhdCBoYXMgdXNlci1xdW90YSBhbHJlYWR5IHNldC4NCg0KTXkgcXVlc3Rpb24gaXMgLSBp
cyBpdCBleHBlY3RlZCB0byBmaW5kIHRoZSBzdWJzZXQgb2YgQUQgdXNlcnMgd2l0aCB1c2VyLXF1
b3RhIHNldCBpbiB0aGUgbG9jYWwgcGFzc3dvcmQgZmlsZSA/DQpJIGFtIHRyeWluZyB0byBmaWd1
cmUgb3V0IGlmIHRoZXJlIGlzIGFueSBvdGhlciB3YXkgdG8gYWNjb21wbGlzaCB3aW5kb3dzIGNs
aWVudCBsaXN0aW5nIGV4aXN0aW5nIHF1b3RhIHdpdGhvdXQgdGhpcyBtYW51YWwgaW50ZXJ2ZW50
aW9uLg0KQnV0IGlmIHRoaXMgaXMgZXhwZWN0ZWQsIEkgd2lsbCBmaW5kIGEgd2F5IHRvIG1ha2Ug
dGhvc2UgZW50cmllcyBpbiB0aGUgbG9jYWwgcGFzc3dvcmQgZmlsZSB3aGVuIGEgcXVvdGEgZm9y
IGEgbmV3IHVzZXIgaXMgc2V0Lg0KDQpIb3BlIHRoaXMgZXhwbGFuYXRpb24gaGVscHMgdG8gZGVz
Y3JpYmUgdGhlIHByb2JsZW0gbW9yZS4gSSB3aWxsIHBvc3QgdGhlIGFjdHVhbCBzbWIuY29uZiBm
aWxlIGFzYXAgKG5vdCBhdmFpbGFibGUgYXQgdGhpcyBtb21lbnQpLiBXZSBoYXZlIHRoZSAiZ2V0
IHF1b3RhIGNvbW1hbmQiIGFuZCAic2V0IHF1b3RhIGNvbW1hbmQiIHZhbHVlcyBhbmQgQUQgc2Vy
dmVyIHdpdGggaWRtYXAgImJhY2tlbmQgPSBhdXRvcmlkIiBhbmQgcmFuZ2UgY29uZmlndXJlZC4N
Cg0KUmVnYXJkcy4NCktyaXNobmEgSGFyYXRoaQ0KIA0KDQrvu79PbiA1LzI3LzIwLCAxMjo1MyBQ
TSwgInNhbWJhLXRlY2huaWNhbCBvbiBiZWhhbGYgb2YgUm93bGFuZCBwZW5ueSB2aWEgc2FtYmEt
dGVjaG5pY2FsIiA8c2FtYmEtdGVjaG5pY2FsLWJvdW5jZXNAbGlzdHMuc2FtYmEub3JnIG9uIGJl
aGFsZiBvZiBzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPiB3cm90ZToNCg0KICAgICoq
KkVYVEVSTkFMIFNFTkRFUi4gT25seSBvcGVuIGxpbmtzIGFuZCBhdHRhY2htZW50cyBmcm9tIGtu
b3duIHNlbmRlcnMuIERPIE5PVCBwcm92aWRlIHlvdXIgdXNlcm5hbWUgb3IgcGFzc3dvcmQuKioq
DQoNCiAgICBPbiAyNy8wNS8yMDIwIDIwOjQyLCBLcmlzaG5hIEhhcmF0aGkgdmlhIHNhbWJhLXRl
Y2huaWNhbCB3cm90ZToNCiAgICA+IE91ciBPbmVYYWZlIEZTICBzdXBwb3J0cyBzaGFyZS9mcyBs
ZXZlbCBxdW90YSB1c2luZyBzbWIuY29uZiDigJxzZXQgcXVvdGEgY29tbWFuZOKAnSBhbmQg4oCc
Z2V0IHF1b3RhIGNvbW1hbmTigJ0uDQogICAgPg0KICAgID4gV2UgYXJlIGN1cnJlbnRseSBleHRl
bmRpbmcgc3VwcG9ydCB0byB1c2VyLWxldmVsIHF1b3RhcyB1c2luZyB0aGUgc2FtZSBpbnRlcmZh
Y2UsIHdoZW4gU2FtYmEgc21iZCBpcyBhbiBBRCBEQyBtZW1iZXIuDQogICAgPg0KICAgID4gU2V0
dGluZyB1c2VyIHF1b3RhIGZyb20gYSB3aW5kb3dzIGNsaWVudCBpcyB3b3JraW5nIGFzIGV4cGVj
dGVkLiBCdXQgb25jZSBxdW90YSBpcyBzZXQsIG5vbmUgb2YgdGhlIHVzZXJzIGFyZSBsaXN0ZWQg
aW4gdGhlIHF1b3Rh4oCZcyBwb3AtdXAgd2luZG93LCBzbyBjYW5ub3QgZGVsZXRlIG9yIG1vZGlm
eSBxdW90YSBwcm9wZXJ0aWVzLiBNb3Jlb3ZlciwgY3JlYXRpbmcgYSBuZXcgcXVvdGEgZW50cnkg
Zm9yIHRoZSBzYW1lIHVzZXIgaXMgZ2VuZXJhdGluZyBhIOKAnHF1b3RhIGVudHJ5IGFscmVhZHkg
ZXhpc3RzIGZvciB0aGlzIHVzZXLigJ0gZXJyb3IuDQogICAgPg0KICAgID4gQnkgdHJhY2luZyBn
ZXQvc2V0IHJlcXVlc3RzIHRvIG91ciBmaWxlIHNlcnZlciwgSSBzZWUgdGhhdCBvdXIgRlMgc2Vy
dmVyIGlzIHJlY2VpdmluZyBhIGdldCByZXF1ZXN0IGZvciBTYW1iYSBmb3IgZXZlcnkgdXNlciBl
bnRyeSBpbiB0aGUgbG9jYWwgcGFzc3dvcmQgZmlsZSwgYnV0IG5vbmUgZm9yIHRoZSBVSUQgb2Yg
dGhlIERDIG1lbWJlciB1c2VyLiBCdXQgSSBkbyBzZWUgYSBkZWZhdWx0IHF1b3RhIGdldCByZXF1
ZXN0IGZvciB0aGUgZ3JvdXAgR0lELg0KICAgID4NCiAgICA+IFRoZSBwcm9ibGVtIHNlZW1zIHRv
IGJlIHRoYXQgdGhlIGdldC9zZXQgY29tbWFuZCBpbnRlcmZhY2UgZG9lcyBub3Qgb2J2aW91c2x5
IHN1cHBvcnQgYSDigJxsaXN04oCdIHVzZXIgcXVvdGEgYXBpIHRvIHRoZSBob3N0aW5nIEZTLg0K
ICAgID4NCiAgICA+IFF1ZXN0aW9ucyBvbiB0aGlzIOKAkyAgV2UgY2FuIHBvc3QgYW5kIG1hbmFn
ZSB1c2VyIGVudHJ5IChob3N0LWxvY2FsIHVpZC9naWQpIGNvcnJlc3BvbmRpbmcgdG8gdGhlIERD
IHVzZXIgc2lkL2dpZCB3aGVuZXZlciBhIOKAnHNldCB1c2VyIHF1b3Rh4oCdIGlzIHJlY2VpdmVk
LiBJIGRpZCB2ZXJpZnkgdGhhdCB3aGVuIGFuIGVudHJ5IGlzIG1hZGUgbWFudWFsbHksIHdpbmRv
d3MgdXNlciBxdW90YSB3b3JrZmxvdyBiZWhhdmVzIGFzIGV4cGVjdGVkLiBJcyB0aGUgcHJvYmxl
bSBhc3N1bXB0aW9uIGNvcnJlY3QgYW5kIGlzIHRoaXMgYSB3YXkgdG8gaW1wbGVtZW50PyBJcyB0
aGVyZSBhIGJldHRlciB3YXksIGdpdmVuIHRoZSBjb25zdHJhaW50cz8NCiAgICA+DQogICAgPiBX
ZSBhcmUgdXNpbmcgU2FtYmEgNC43LjExIHBhdGNoZWQgd2l0aCBodHRwczovL25hbTAzLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZidWd6aWxsYS5z
YW1iYS5vcmclMkZzaG93X2J1Zy5jZ2klM0ZpZCUzRDEzNTUzJTIzYzE3JmFtcDtkYXRhPTAxJTdD
MDElN0NrcmlzaG5hLmhhcmF0aGklNDBzdG9yYWdlY3JhZnQuY29tJTdDYjAwZjY4YzAyODMyNGVh
NWVjZTMwOGQ4MDI3N2E3YzMlN0M5OWY0ZTNjOWJlZDU0NDNkYmQ1MzJiM2YyMmQ0ZWRkZiU3QzAm
YW1wO3NkYXRhPVQ2RmJCeTA0VHFTeEolMkZGeCUyQlozblZGMjloJTJCb0hkTkVxcUl3dVpYem0w
aFklM0QmYW1wO3Jlc2VydmVkPTAgZml4IGZvciA0LjcuDQogICAgPg0KICAgID4gQW55IGhlbHAg
aXMgdGhpcyBpc3N1ZSBpcyBtdWNoIGFwcHJlY2lhdGVkIGluIGFkdmFuY2UuDQogICAgPg0KICAg
ID4gUmVnYXJkcy4NCiAgICA+IEtyaXNobmEgSGFyYXRoaQ0KDQogICAgIEZyb20gcmVhZGluZyB0
aGUgYWJvdmUsIGl0IGxvb2tzIGxpa2UgeW91IGFyZSBzYXlpbmcgdGhhdCB5b3UgaGF2ZSB0aGUN
CiAgICBzYW1lIHVzZXJzIGluIC9ldGMvcGFzc3dkIGFuZCBBRCwgaXMgdGhpcyBjb3JyZWN0ID8N
Cg0KICAgIENhbiB5b3UgYWxzbyBwbGVhc2UgcG9zdCB0aGUgZW50aXJlIHNtYi5jb25mIHlvdSBh
cmUgdXNpbmcgb24gdGhlIE9uZVhhZmUuDQoNCiAgICBSb3dsYW5kDQoNCg0KDQoNCg==

