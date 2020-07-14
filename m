Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39621FDDE
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jul 2020 21:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3dI9ksEk1AcgHrrNhAB1NFdtY3/jlm+spjMJyPy0n94=; b=tWdUxsEqcaTrzfWiXcEZoeifOM
	Xmqr/fnDQoOr0GzluqpPTuyDdKLY6zI2XgDWsxRAUe8vNeYwMVcJWKVjzucPcBFuxuwGqtEu+R74A
	5roEiFgyXzyZBSABp7C33dUS1LJ0lAUNvIQkYRJiQkUUfwDsntVYu7w9Pk5xyPFGmzoAS4TV78o/P
	V5LLm4I3utc9EV5uEoXCEqKUBCxUXlEtIY/++B/Ewofb/nDwOO+LMrqKUUwj8zdQwVYfcPfu1DLVM
	OB3f9pe2aeuJbqev/8Gyzt81Odr4JGdAg0DT44jRBWCYVk2u3zwgzFtJ4z/cJekj8HXxMDRoSC93T
	UDL87ZIg==;
Received: from localhost ([::1]:37578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvQxf-007X9Q-JC; Tue, 14 Jul 2020 19:51:31 +0000
Received: from mail-mw2nam10on2052.outbound.protection.outlook.com
 ([40.107.94.52]:58336 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jvQxV-007X9G-WE
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 19:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dI9ksEk1AcgHrrNhAB1NFdtY3/jlm+spjMJyPy0n94=;
 b=pzIx6mKOzaWXJ25iTDlkB+CjaYDjYjqDDVyxih+7wiPjI0X7ZBdiVUSvNEC7kGU2vovI9xITogM/Vxo05z8u5++R2bxcWSw8FXwKt0nuLvEdFYWgLg/kb9aaIWq7CJb9Xi7dRTFEnWIZIcMM9MWLXQhjWY4mM0QrHZv7AbsFme4=
Received: from MWHPR10CA0049.namprd10.prod.outlook.com (2603:10b6:300:2c::11)
 by DM6PR11MB2667.namprd11.prod.outlook.com (2603:10b6:5:c1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 19:51:05 +0000
Received: from CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::b8) by MWHPR10CA0049.outlook.office365.com
 (2603:10b6:300:2c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23 via Frontend
 Transport; Tue, 14 Jul 2020 19:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 65.52.56.186)
 smtp.mailfrom=storagecraft.com; samba.org;
 dkim=pass (signature was verified)
 header.d=storagecraft.com;samba.org; dmarc=pass action=none
 header.from=storagecraft.com;
Received: from us2-emailsignatures-cloud.codetwo.com (65.52.56.186) by
 CO1NAM03FT003.mail.protection.outlook.com (10.152.80.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 19:51:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 us2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Tue, 14 Jul 2020 19:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtM7gXIe7IgDYkErqFicFXdYMA5c3deg+Ox0aBEsBQXXmVRgkMELw5s/hHi/cDwReRKqghrDKJBki41zq7Ou7K7HGl2bBkMztS6Eff/s1LKqdKYq6AcdwkBrABCnS69gV2fN1kiRjt+JvSuEUKRu7BzT8dBW7VoaUvHHZwJygDeCKU1Fx7+cSX58cz2Cv++j9IkEjwj478ScpW30Lh7x9hHZZiEd0sobBPyctxgmyzqjaXIMSBSsIFVj2Kljd8KpaYy+VT6fQZnSKrR9s9hwAfj3WxE1z8X41Jaxvd1CJd0THl6X4me4ciJm4KntPzi5f/WAkqSbF6tnkyVxe3ullA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dI9ksEk1AcgHrrNhAB1NFdtY3/jlm+spjMJyPy0n94=;
 b=Lrg7lj0xGo6I+l2vjny7oyWvgRabRJ+GGsQ4EMMC57m8RYip89I5uBnzAayezVWm+Q19eFBHBmNGtt5dYZKWs6np8Ikiygzz92fZAcLerwz5DI2kSJ7PMgk/c32/9px7vfZKCQw/Q3DHYFwwdTYRpxSIflDvz967BAJOtIxQHts93OLIp1fBwz3si3bmWGoH+V7rsBqniDC+qpvU9OierVUXtIo/QtTzPuATGSTrQDW3cI2AgYh41Dxpf/F/7JazO4zNv2992I0I5CB0qAwoVMhspfdxr/L8u84dROmNdrzFrS/mpGofInHRd7sH1e27IPAsCFU2PBQ2aEfPtYfRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dI9ksEk1AcgHrrNhAB1NFdtY3/jlm+spjMJyPy0n94=;
 b=pzIx6mKOzaWXJ25iTDlkB+CjaYDjYjqDDVyxih+7wiPjI0X7ZBdiVUSvNEC7kGU2vovI9xITogM/Vxo05z8u5++R2bxcWSw8FXwKt0nuLvEdFYWgLg/kb9aaIWq7CJb9Xi7dRTFEnWIZIcMM9MWLXQhjWY4mM0QrHZv7AbsFme4=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB2924.namprd11.prod.outlook.com (2603:10b6:5:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Tue, 14 Jul
 2020 19:50:45 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::6d63:5f8a:f1aa:d51a%9]) with mapi id 15.20.3195.017; Tue, 14 Jul 2020
 19:50:45 +0000
To: Christof Schmitt <cs@samba.org>, Rowland penny <rpenny@samba.org>
Subject: Re: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Thread-Topic: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Thread-Index: AQHWNUdA+kJKRM4BfUKiWqZicZITNqkHOLSAgACF64D//5GZgA==
Date: Tue, 14 Jul 2020 19:50:45 +0000
Message-ID: <5989551C-3360-4B58-8AC6-C00520B3CC6F@storagecraft.com>
References: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
 <32C63F09-210A-4BCA-B603-1DFADDDC6F70@storagecraft.com>
 <20200714192552.GA25797@samba.org>
In-Reply-To: <20200714192552.GA25797@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.38.20061401
Authentication-Results-Original: samba.org; dkim=none (message not signed)
 header.d=none; samba.org; dmarc=none action=none header.from=storagecraft.com; 
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7ced3c45-92da-4e8f-06ec-08d8282f3de6
x-ms-traffictypediagnostic: DM6PR11MB2924:|DM6PR11MB2667:
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +EXRrTd8JCkSbX6Bb/WiwRSkphhaTNPuAbI6fe00VEd1+ai/oozduAMpg76HZg4b6WwtuLGctVIBqr3N3HOF6VMdP52Iqx73C76/ivsT245XGixvIEETQhV21BBuKcJNlP/JrKcgYUFsZEW88RcPqrFbc8/fMrYwMzJD/zPZD+JaVe/6R+s7v7dApGjXWVK9ohhFTE4zdpjt/9GqxtuHTE0e6KBQJgmFgN2rhprs1dyapWwuKQ4wYgJCPVjLH2Q/S0xSXuR73C++h5zQJ5N3YOUDJWG93jx5pubmE3qENf5anOcmpPffE5Zp9AJ73scC1nCXimBf3LRcFrxJfR0r/XHNJGXsjSjK2jwYPGgpy/j/wj81i+RoUYk4Rvdht+Y6XDfS1sOj0HvLsVRUbFql9A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(26005)(4326008)(66946007)(66446008)(186003)(66476007)(966005)(76116006)(66556008)(91956017)(64756008)(86362001)(6506007)(316002)(110136005)(83380400001)(2906002)(8676002)(8936002)(2616005)(6512007)(44832011)(33656002)(6486002)(45080400002)(478600001)(5660300002)(36756003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: mzBnbPpiMepfr0atQvQl8wL365RWvqkOf8686HmWm+VY6Rs4HucAhVUN/KHLcYVtQVQLUhjh0XI738tpx7X76hpq/3zsbAjtTna5ggQSGpj8Hbj6sQ0QhH64Vmz+ypp46KDKfI6R0/viYdaND1JlNklQwPUeegp84zOdErie3SEk0m7kHvZaeWDwjLreIckjrtOV8yPkVmU09LRMmUcfAbQMD2wWQNj5NMkY7oX8uxKZ0iZCKLnS32XNeH6uDZTxwkLqkcxz6orTIavlvrImLCQcUBEb8Vyag7nrzVex5YYJnpR/u5ncvmy0srG38VDl3EeQA+zpIP/0wCf+2TVkYhZ5ZxGtAeVPL/GcmjG9VNGOXt+xaA9WwQszT71Lx9AxqXY8Tz92l5fqBwGeaSJMegxc+sqjeaRwcdKCUJAJmQbTzR6SBXfvz95ASdG/Spmukqa8H9UOd0B29J+wxk0cJA/3fGX5+FrhWHk8aLusGoD1ctxvmJhI8MRBd/aAn6pL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF5363790611B444B25A4F77748D667A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2924
X-CodeTwo-MessageID: 1e4c8bbe-59f6-4413-9ae3-2f7da4f45e78.20200714195047@us2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 67e2c18f-00d3-4b24-ac1d-08d8282f32d9
X-Microsoft-Antispam-Message-Info: z43CuDkr89498xWJxR8shQy//GktTdnmfRSt0S4EOSLSr8VorbKPn4ThWF/2pBbqxX9U5epo/EWZnFBRfMYUdDYhNHQRP45ABnMSCJ2nkiPIntixsEF6SlRkFoB5+jVqRDyV1ZtxbkoUVrYj2j7sDR9zBJOKtZWK36lusTXEgKFOCRZrMqbYPoJRm7+zSUzKd3mWN7sZVrd1RxakdkKAbpFh4HV8MVGGxLVhZ9gfvnyNlmcchs2USt+/aAhhS3LCUCzKFQGF/8AGtwb+qT1FrWoq1PvEXf60a12jXUYoUPhtggR27VBIlYxryRG7tdJpkemXawx0jaMFISOIh2lVxMkXILZkMyMitmMac3t8K+cJkCIL6jYA93+o/DDGTfeLJW96C57yFSWnKH04vZPPeojTEKItLSt8uoC/6klZIxRFEiBP48SVXafiu1chqB/LRblULXYQ/3ZCqwTNYEmCQjYsJLg6hLeYLp3tpKLZvIY=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ced3c45-92da-4e8f-06ec-08d8282f3de6
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[65.52.56.186];
 Helo=[us2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM03FT003.eop-NAM03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2667
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.52
 (mail-mw2nam10on2052.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
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
Cc: Vidhesh Ramesh via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Q2hyaXN0b2YgLSBUaGFua3MgZm9yIHBvaW50aW5nIHRvIGEgcG90ZW50aWFsIGZpeCENCg0KUm93
bGFuZCAtIHRoaXMgaXNzdWUgaXMgZmFjZWQgYnkgb25lIG9mIG91ciBjdXN0b21lcnMsIHNvIHdv
dWxkIGxpa2UgdG8ga25vdyBpZi93aGVuIHRoZSBpc3N1ZSBpbmRlZWQgd2lsbCBiZSBmaXhlZCBi
eSBhbiB1cGdyYWRlLiBJIGhhZCBhIGZvbGxvdy11cCBxdWVzdGlvbiB0byB5b3VyIHN1Z2dlc3Rp
b24sIHRoYXQgQ2hyaXN0b2YgYWxyZWFkeSBhbnN3ZXJlZC4NCg0KVGhhbmtzIHRvIGJvdGggZm9y
IHRha2luZyB0aW1lIGFuZCByZXNwb25kaW5nIHNvIHF1aWNrbHkhIA0KDQpSZWdhcmRzLg0KS3Jp
c2huYSBIYXJhdGhpDQogDQoNCu+7v09uIDcvMTQvMjAsIDEyOjI2IFBNLCAiQ2hyaXN0b2YgU2No
bWl0dCIgPGNzQHNhbWJhLm9yZz4gd3JvdGU6DQoNCiAgICAqKipFWFRFUk5BTCBTRU5ERVIuIE9u
bHkgb3BlbiBsaW5rcyBhbmQgYXR0YWNobWVudHMgZnJvbSBrbm93biBzZW5kZXJzLiBETyBOT1Qg
cHJvdmlkZSB5b3VyIHVzZXJuYW1lIG9yIHBhc3N3b3JkLioqKg0KDQogICAgT24gVHVlLCBKdWwg
MTQsIDIwMjAgYXQgMDY6MjY6MzZQTSArMDAwMCwgS3Jpc2huYSBIYXJhdGhpIHZpYSBzYW1iYS10
ZWNobmljYWwgd3JvdGU6DQogICAgPiBJIGFtIGNvbnRpbnVpbmcgdG8gaW52ZXN0aWdhdGUgd2h5
IGEgY2xpZW50IGlzIGdldHRpbmcgYW4g4oCcaW52YWxpZCBzaWduYXR1cmXigJ0gZXJyb3IuDQog
ICAgPg0KICAgID4gU2VxdWVuY2Ugb2YgZXZlbnRzDQogICAgPg0KICAgID4gICAqICAgU21iZCBn
ZW5lcmF0ZWQgYSBTVEFUVVNfTkVUV09SS19TRVNTSU9OX0VYUElSRUQgZm9yIGEgcmVhZCByZXF1
ZXN0DQogICAgPiAgICogICBDbGllbnQgcmVxdWVzdGVkIGZvciBhIHNlc3Npb24gKHJlKXNldHVw
IG9mIHRoZSBjdXJyZW50L2V4aXN0aW5nIHNlY3Rpb24gKHNob3duIGJlbG93KQ0KICAgID4gICAq
ICAgU21iZCByZXNwb25kZWQgd2l0aCBTVEFUVVNfU1VDQ0VTUyBidXQgcmVzcG9uc2Ugbm90IHNp
Z25lZCAoc2lnbmF0dXJlIHdpdGggemVyb3MpIChzaG93biBiZWxvdykNCiAgICA+ICAgKiAgIFdp
bmRvd3MgU01CQ2xpZW50IG5vdGVkIHRoZSDigJxpbnZhbGlkIHNpZ25hdHVyZeKAnSBldmVudCAo
ZGlzcnVwdGl2ZSB0byBjbGllbnQgYXBwbGljYXRpb24pDQogICAgPiAgICogICBOZXh0LCB0aGVy
ZSB3YXMgYSBuZXcgc2Vzc2lvbiBzZXR1cCByZXF1ZXN0DQogICAgPiAgICogICBGb2xsb3dlZCBi
eSBzbWJkIHJlc3BvbnNlIHdpdGggU1RBVFVTX1NVQ0NFU1Mgd2l0aCBzaWduYXR1cmUNCg0KICAg
IEZyb20gYSBxdWljayBzZWFyY2gsIHRoaXMgY291bGQgYmUNCiAgICBodHRwczovL25hbTAzLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZidWd6aWxs
YS5zYW1iYS5vcmclMkZzaG93X2J1Zy5jZ2klM0ZpZCUzRDEzNjYxJmFtcDtkYXRhPTAxJTdDMDEl
N0NrcmlzaG5hLmhhcmF0aGklNDBzdG9yYWdlY3JhZnQuY29tJTdDMTlhZGFkNmZiYWQyNDk5NjY4
YTUwOGQ4MjgyYmJlMTglN0M5OWY0ZTNjOWJlZDU0NDNkYmQ1MzJiM2YyMmQ0ZWRkZiU3QzAmYW1w
O3NkYXRhPWl6WnZmZmlBckl2M0JJOFo4QVhpeUdXV3I3JTJCbTBJZnVUWGMyWlh3dFh4MCUzRCZh
bXA7cmVzZXJ2ZWQ9MA0KICAgIFNhbWJhIDQuOS4zIGFuZCA0LjguNyBoYXZlIHRoZSBwYXRjaGVz
IGZvciB0aGlzIGJ1Z3ppbGxhLg0KDQogICAgQ2hyaXN0b2YNCg0K

