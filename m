Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B425089E
	for <lists+samba-technical@lfdr.de>; Mon, 24 Aug 2020 20:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Zthkb8dKiKyR0+uxJZPmcayeBeEQWADhD5hZAVuRqrg=; b=Sux5GasnDwgzjE3o6TSSlVfvWe
	KK7N7N5hf0OYZjhOREQUYPbjbfDN1sHV+BINJ7t2qc5V/LPNmmhg1TrNfyJJsP7LjumQ3TPfKg/uZ
	NN0Ynd2SjBj5w4qbvej/swimKWFl3WrLfHI53MCRjVrpweQXd7K7NVXz7/jr1ngJJLIR6c6hmT9el
	ueGHWabBqEtOzTOj3orzGFxU8dQrRIgx/ES9yuv44iHhb6Cei5ck2PGXQUyzalfus6u5LCNQOSMYH
	tM7FyjhRAoZYGRgJ+47Q3H+PS99RRplaQBGXdNrBzP80YxKROxLxBh29oEWo1auTi4KW9QE6FJCZg
	b86GVEYw==;
Received: from localhost ([::1]:21104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAHgY-000ITL-QD; Mon, 24 Aug 2020 18:59:14 +0000
Received: from mail-mw2nam10on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::601]:9778
 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kAHgS-000ITC-Ds
 for samba-technical@lists.samba.org; Mon, 24 Aug 2020 18:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zthkb8dKiKyR0+uxJZPmcayeBeEQWADhD5hZAVuRqrg=;
 b=ZlV20w6urqLqmCQFfxEnEHQdFhtMz8Yr9I0OSP5w73K8HjUiKXqrjVu75+tDM0HSKCaBqQN0h3rSgRnO0VdYJJ7Rh1FwxyHsCa3F03hNLKga7AOxJH8pD5PVCmqcDUlRf8W7JwSOZbCMcWzwB3exVBp5ALn+rdxTEV/TMTlZqvA=
Received: from BN3PR03CA0059.namprd03.prod.outlook.com
 (2a01:111:e400:7a4d::19) by DM5PR11MB1338.namprd11.prod.outlook.com
 (2603:10b6:3:b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 18:58:49 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:7a4d:cafe::98) by BN3PR03CA0059.outlook.office365.com
 (2a01:111:e400:7a4d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Mon, 24 Aug 2020 18:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; lists.samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;lists.samba.org;
 dmarc=pass action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 18:58:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Mon, 24 Aug 2020 18:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsSf8cuu8xccBlp7o0MkDXRct4eztZKMxKcRH5m9b+xOaY8DWd4kUJ/01kVjFHi98co42VOiqJjBuL3b0YNo1Pi/pp1mYI2HRpayqjOXHmZHqVu3KblJ7xcMrMraOMzAmtHz1XYdKaDspsP2R8HqHOZumwXmMCVWs5PusWwhx3yakBU1GrpHG/G3wahUWIrY4WcVjc5b8KPnvbIZpqsPmi68pfgXo1Pbuk0vuQYJ4qYwAAx9l6CAsF2E7vAiViNfsBJt8a73xZSFvHHG2QkTey8ewi3/MUA6XSoJV6999G76QAdGRb0vE+yEunecSm7CvKFKjuMVnVn/a7qCSOIT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zthkb8dKiKyR0+uxJZPmcayeBeEQWADhD5hZAVuRqrg=;
 b=T0b9LJ0qLRHBkEOcMtKoN4k5ybHt76GfuprcH6fBqaW1e0NXna49RRXDq4ljwd+Ar27Os3j/UgjMX0vdgQKrtlqrWdimzNC1Hkt+67OMDyzjYfwe9RJZx/gXaV7wzoORgQwEQSDe40vKjK8lglZFt4ha6rtDn1XCRWo8n2lxAD3eat04rk4eE3JJ1kAPdCW7HuNqU2Pqk3wxTNCt68u5jFGCYCZpYAqBer0/azPxC8m9AQbIvy7CoB+lHOgK3fjPZzuC7CvUtLVRi+7gqAu2gqN/P8F68f1uLMhyqsAheX5MyJO8pZixabDJH0IvEuPZBCPx0jpQlkcwby4V8y+XvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zthkb8dKiKyR0+uxJZPmcayeBeEQWADhD5hZAVuRqrg=;
 b=ZlV20w6urqLqmCQFfxEnEHQdFhtMz8Yr9I0OSP5w73K8HjUiKXqrjVu75+tDM0HSKCaBqQN0h3rSgRnO0VdYJJ7Rh1FwxyHsCa3F03hNLKga7AOxJH8pD5PVCmqcDUlRf8W7JwSOZbCMcWzwB3exVBp5ALn+rdxTEV/TMTlZqvA=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB2922.namprd11.prod.outlook.com (2603:10b6:5:63::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 18:58:46 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28%4]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 18:58:46 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Directory Leasing feature in Samba smbd
Thread-Topic: Directory Leasing feature in Samba smbd
Thread-Index: AQHWekiX55qIzeduzE+xPMVqwawonw==
Date: Mon, 24 Aug 2020 18:58:45 +0000
Message-ID: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.40.20081000
Authentication-Results-Original: lists.samba.org; dkim=none (message not
 signed) header.d=none;lists.samba.org; dmarc=none action=none
 header.from=storagecraft.com;
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4fbfbca-0e9c-450f-d61d-08d8485fbc18
x-ms-traffictypediagnostic: DM6PR11MB2922:|DM5PR11MB1338:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KVpnG8+wJ+b7Ou4psFlS83iZTV3lN+AnsQ/bekrrxFaGtykqVea3mrmxJUkIs+AnAoUtGIGGA75vVSqs7jZz3AmagGT4zF2mMkdyyrQPtLZq9Kby09pIw5Tp9bWbR/FWsUafV8nKaAt9Aq2cils7Ove/CJJDGKfv5jGKbbKfE7Lfx/FklPCYA4p7/lnDwUuQDnUN6AkLLHDyBJq8xAobvqoBfahWDOvLRD5ClGj3SMDXUrcxOp4OettFEKG88dRruXBigOmaI4GHlpYxRVs1rc7h7rVgQkP+HgeIVFcKfjbcpDEpo6FpdfDPZpu+ZH1yuSLBy6G8XQ3dxEodBvLXVrEWlObZBZjPW3N36Il1t2plqXZEPZAEqieyBa4uuAMJv6o0u8kQt/x8mJqWlZ3UZA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(66446008)(71200400001)(33656002)(478600001)(966005)(6512007)(66476007)(64756008)(8936002)(36756003)(91956017)(16799955002)(83380400001)(66556008)(76116006)(66946007)(2906002)(316002)(2616005)(5660300002)(8676002)(26005)(186003)(86362001)(53546011)(6506007)(6916009)(44832011)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qrAdD9weJyiuIdYDp2nMzlOZEM3pCrMfGEl2mIvkHF7OlTfMyItxtfYo4/EKK1Sg1h30VjmjftcSSknWl21qQ1MNezhVXX/qEdC4ZL9putuxCVz3cwaNC+tzX8bYuIOJriqh7gQ1cpufhZr6A/Ye5xAwNzKbgbJHTyJWf5R8jGndpbF2arksPSkhQGYeYIQ6QpZZQ2FV/4g5C58dDzuvcDsD9Pgp7JCbJ6ZED4AKfOd6tLqmo9HQ3RVSU81gjxuei/aKOop42epB4ZsClPrqJxHRQl3oF65G8Q/4wxsjiP13VZNmATYaXjpDkelptmp2Z4K3vUPD44M6pl1e0o4uJsGtvxUqYjfyz6jqUhdEih4PwDs921D/R6S1eb2zNUQqU/1tGmipiiJV7h5HSNt+vSwI8+cqkT8KlWLPseA+O29XkvxuvyK8v/podm2pZsPCEvpnJYaWhB6GQCqebKcW0goawgbeMlTy+Zn/juaLZGe4ZwE5WebLKZrbKaRIxrdrxVNfzl/Oi6GXsdh1HPHhDO23vbwGGL+C85cbREYN+/ptH5swQV4LRAonT0RzqmwOj6bOsYbgc4Xe+jMeempx95X+83gOjVwX/+AW4/2ZEgimDFknRmuzdDkLLd/Ta/DQdDWVOe/FP4dCt3w5Vbz4eg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7366A781FEBBA340A2A1914559DE7833@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2922
X-CodeTwo-MessageID: bd7975b4-cb7c-475b-9f9c-ac75e102eb90.20200824185847@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3109b0a8-df4b-45ac-fd03-08d8485fba95
X-Microsoft-Antispam-Message-Info: E0T1sOtlxLaJDBe+dy3ldSOCsz5I1IcJwn8hygjAnmoNGAnH1IoGjXzRXXp0FLuRBowxwgNjwZRCPtBY1ifrL52koMsnSkTgfEGshTLrLrXRDXyB9C0isquzw/WYuzAMAIexLbUYgdHxDFVpqhgGs8FVdg9jfJmRJxt8BgBuwhfUSyebJAzJLP33mzQQ4jb6GxnF6gOGtwRHtAtb2G+DXCkYR+rThBDjfvq0hfknDXMJn4XMFUcnjE7JvaRqR/u0/vIQH32tXKq8Bpt7qPx3uYdZSMPbvc8lbhC9+OsetCnoEpf52AUxEho/lG+Hw2a0uAdALrUiwsuBYCSQL5ctX/2E6BhKFj2DqZDjoPzyXRkbcsC8+oz+z/n9fDO+t84VA3Uk4zXB4SdBWHGU/bZIuoBO7RXycm4sgB6L+fOhzVsZ/5ZBQ+ublIahDLYek1xjdJOYygCr+l7tIsXZQipgzINeak/cyhhjJcq5uoIZmJ4=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fbfbca-0e9c-450f-d61d-08d8485fbc18
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1338
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e89::601
 (mail-mw2nam10on20601.outbound.protection.outlook.com) incorrectly presented
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

QSBtb3JlIGRvbWluYW50IGlzc3VlIG9mIGxhY2sgb2YgZGlyZWN0b3J5IGxlYXNlIHN1cHBvcnQg
aW4gc21iZCBzdXJmYWNlZCB3aGlsZSBsb29raW5nIGludG8gVU5DIHZzIG1hcHBlZCBkcml2ZSBw
ZXJmb3JtYW5jZS4NCg0KQXMgcGVyIFNhbWJhIFdpa2ksIHRoaXMgZGlyZWN0b3J5IGxlYXNpbmcg
ZmVhdHVyZSBpcyBub3QgcGxhbm5lZCBhbnl0aW1lIHNvb24uIExldCBtZSBrbm93IG90aGVyd2lz
ZS4NCg0KSSBtYXkgYmUgYWJsZSB0byBzcGVuZCBzb21lIHRpbWUgd29ya2luZyBvbiB0aGlzIGZl
YXR1cmUsIG9uY2UgSSBnZXQgYSBiZXR0ZXIgaWRlYSBvZiB3aGF0IGl0IHRha2VzIHRvIGltcGxl
bWVudC4NCkkgaGF2ZSByZWFkIHRoZSBoaWdoLWxldmVsIG5vdGVzIGF0IGh0dHBzOi8vd2lraS5z
YW1iYS5vcmcvaW5kZXgucGhwL1NhbWJhMy9TTUIyI0RpcmVjdG9yeV9MZWFzZXMNCg0KSSBhcHBy
ZWNpYXRlIGFueSBjb21tZW50cyBvbiB0aGlzIHRvcGljIGF0IHRoaXMgdGltZSwgbW9zdGx5IGNo
ZWNraW5nIHRvIHNlZSB0aGUgZm9ydW0ncyBpbnRlcmVzdCB0byBjaGFydCBvdXQgdGhlIG5leHQg
bGV2ZWwgb2YgZGV0YWlscy4NCg0KUmVnYXJkcy4NCktyaXNobmEgSGFyYXRoaQ0KIA0KDQrvu79P
biA4LzMvMjAsIDU6MjMgUE0sICJLcmlzaG5hIEhhcmF0aGkiIDxrcmlzaG5hLmhhcmF0aGlAc3Rv
cmFnZWNyYWZ0LmNvbT4gd3JvdGU6DQoNCiAgICBJIGFtIHN0aWxsIHdhaXRpbmcgdG8gZ2V0IG1v
cmUgaW5mb3JtYXRpb24gaW5jbHVkaW5nIHRjcGR1bXAgZnJvbSB0aGUgY3VzdG9tZXIuDQoNCiAg
ICBUaGlzIGVtYWlsIHRocmVhZCBhcHBlYXJzIHRvIGJlIHNvbWV3aGF0IHJlbGF0ZWQsIGJ1dCBJ
IGRpZCBub3QgZmluZCBhbnkgZm9sbG93LXVwIHJlc3BvbnNlcy4gDQogICAgICAgICAgICBodHRw
czovL2xpc3RzLnNhbWJhLm9yZy9hcmNoaXZlL3NhbWJhLXRlY2huaWNhbC8yMDE3LU9jdG9iZXIv
MTIzNjExLmh0bWwNCiAgICBBbnkgY29tbWVudHMgb24gdGhpcz8NCg0KICAgIFJlZ2FyZHMuDQog
ICAgS3Jpc2huYSBIYXJhdGhpDQoNCg0KICAgIE9uIDcvMjgvMjAsIDQ6MDkgUE0sICJLcmlzaG5h
IEhhcmF0aGkiIDxrcmlzaG5hLmhhcmF0aGlAc3RvcmFnZWNyYWZ0LmNvbT4gd3JvdGU6DQoNCiAg
ICAgICAgWWVzLCB0aGUgc2FtZSBjbGllbnQgY29ubmVjdGluZyB0byB0aGUgc2FtZSBzZXJ2ZXIg
bmFtZS9hZGRyZXNzIGJvdGggdGltZXMgd2l0aGluIGEgZmV3IG1pbnMgb2YgZWFjaCBvdGhlci4N
Cg0KICAgICAgICBJIHdpbGwgdHJ5IHRvIGdldCB0Y3BkdW1wIGNhcHR1cmVzIGZvciBib3RoIGFz
IHdlbGwgYXMgRE5TIGxvb2t1cCB0aW1lcy4NCg0KICAgICAgICBUaGFua3MuDQoNCiAgICAgICAg
UmVnYXJkcy4NCiAgICAgICAgS3Jpc2huYSBIYXJhdGhpDQoNCg0KICAgICAgICBPbiA3LzI4LzIw
LCAzOjI0IFBNLCAiSmVyZW15IEFsbGlzb24iIDxqcmFAc2FtYmEub3JnPiB3cm90ZToNCg0KICAg
ICAgICAgICAgKioqRVhURVJOQUwgU0VOREVSLiBPbmx5IG9wZW4gbGlua3MgYW5kIGF0dGFjaG1l
bnRzIGZyb20ga25vd24gc2VuZGVycy4gRE8gTk9UIHByb3ZpZGUgeW91ciB1c2VybmFtZSBvciBw
YXNzd29yZC4qKioNCg0KICAgICAgICAgICAgT24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMTA6MjE6
MTJQTSArMDAwMCwgS3Jpc2huYSBIYXJhdGhpIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQog
ICAgICAgICAgICA+IFdlIGFyZSB1c2luZyBTYW1iYSA0LjcuMTEuDQogICAgICAgICAgICA+DQog
ICAgICAgICAgICA+IE9uZSBvZiBvdXIgY3VzdG9tZXJzIGlzIHJlcG9ydGluZyB0aGF0IHdpdGgg
V2luZG93cyA3LCAxMCBFeHBsb3JlciwgY29ubmVjdGluZyB1c2luZyBNYXBwZWQgRHJpdmUgaXMg
dGFraW5nIDEwIHNlY29uZHMgYXJlIG1vcmUgY29tcGFyZWQgdG8gdXNpbmcgYSBVTkMgcGF0aC4N
CiAgICAgICAgICAgID4NCiAgICAgICAgICAgID4gSSBhbSBub3QgYW4gZXhwZXJ0IGluIHRoaXMg
YXJlYSwgYW5kIEkgc3RhcnRlZCBpbnZlc3RpZ2F0aW5nIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHR3byBtZXRob2RzIHRvIGlkZW50aWZ5IGFuZCBpbXByb3ZlIGFueSBib3R0bGVuZWNrcyBl
c3BlY2lhbGx5IGluIHRoZSBmaWxlc3lzdGVtIHVuZGVybmVhdGggU2FtYmEuDQogICAgICAgICAg
ICA+DQogICAgICAgICAgICA+IEdpdmVuIHRoZSBvdmVyd2hlbG1pbmcgbnVtYmVyIG9mIHZhcmlh
Ymxlcy9wYXJhbWV0ZXJzIGluIHRoaXMgY29udGV4dCwgSSB3b3VsZCB2ZXJ5IG11Y2ggYXBwcmVj
aWF0ZSB0aGlzIGdyb3Vw4oCZcyBjb2xsZWN0aXZlIGV4cGVydGlzZSBvbiBwb2ludGluZyBvdXQg
YW55IGtub3duIGlzc3VlcyB0byBsb29rIG91dCBmb3IuDQoNCiAgICAgICAgICAgIEROUy9uYW1p
bmcgcmVzb2x1dGlvbiBsb29rdXAgdGltZXMgPyBBcmUgdGhleSBjb25uZWN0aW5nIHRvDQogICAg
ICAgICAgICBleGFjdGx5IHRoZSBzYW1lIG5hbWUgPw0KDQoNCg0K

