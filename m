Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75DBFC12
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 01:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Uo1uA6tlnoMu4/yRCYzMq+9POj23JlfHWaeDpmx/QYY=; b=zQpGhV00tk9nL7FY0Wq/JYBhaG
	xp8rAFlj8+Ws3Ha9kdT7SQjtQjLpBl93W+zuv4aGm6NoL3mshboaq5KlXHDtuNjfIhjYDbXVRIutn
	nW11h2hEKExbIpnseR7dcDq9Zp04l5Sx8PLuTtZTy6PGs3KGcPStZ7qjjbs98ZyJftgQTsWHTeVhi
	8dRrvbNJU/r1SuzGqJoiiVH+r1EJo2HqhrZqOd/SCaiU7TF2Zhj14QqtyVZPdH20o0CoNHIWcLGKG
	lf85XKdRFnD4tjmEE87eKFCO3Ry37THwHrGKQ5Ac+tuQyMINehxwHwWg5QbHq8iDkk3YMXs0LRMMI
	AwM/NrIw==;
Received: from localhost ([::1]:24086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDdbq-008zzt-S3; Thu, 26 Sep 2019 23:55:42 +0000
Received: from mail-eopbgr780050.outbound.protection.outlook.com
 ([40.107.78.50]:26144 helo=NAM03-BY2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1iDdbl-008zzY-TQ
 for samba-technical@lists.samba.org; Thu, 26 Sep 2019 23:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieeeglobalspec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo1uA6tlnoMu4/yRCYzMq+9POj23JlfHWaeDpmx/QYY=;
 b=Uuu58Jefj46O8TrZs7kkvIUC6AGxIV9B30DuwhE+XUosjMp+DvWTin+UbUdwiwrc8f/UQrDVwxbCjPz6FH35jOpZztyE6+UaxbKKhTcpbSeAXJDZBncLduv2FpN9eG4213Pf1wFohosMCkq0PkEBryBEPrakmyr3VBqk56/pK7s=
Received: from BN6PR19CA0099.namprd19.prod.outlook.com (2603:10b6:404:a0::13)
 by DM5PR19MB1019.namprd19.prod.outlook.com (2603:10b6:3:2d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20; Thu, 26 Sep
 2019 23:55:21 +0000
Received: from BN3NAM04FT061.eop-NAM04.prod.protection.outlook.com
 (2a01:111:f400:7e4e::209) by BN6PR19CA0099.outlook.office365.com
 (2603:10b6:404:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 26 Sep 2019 23:55:21 +0000
Authentication-Results: spf=pass (sender IP is 209.235.67.34)
 smtp.mailfrom=ieeeglobalspec.com; lists.samba.org; dkim=pass (signature was
 verified) header.d=ieeeglobalspec.com; lists.samba.org; dmarc=pass action=none
 header.from=ieeeglobalspec.com;
Received: from mxgateway.ieeeglobalspec.com (209.235.67.34) by
 BN3NAM04FT061.mail.protection.outlook.com (10.152.92.233) with Microsoft SMTP
 Server id 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 23:55:20
 +0000
Received: from mxgateway.ieeeglobalspec.com (localhost [127.0.0.1])
 by mxgateway.ieeeglobalspec.com (Postfix) with ESMTP id AEE3C4E962;
 Thu, 26 Sep 2019 19:55:19 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ieeeglobalspec.com;
 s=green; t=1569542119;
 bh=Uo1uA6tlnoMu4/yRCYzMq+9POj23JlfHWaeDpmx/QYY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=5FJabF+8VxtzvqB5Kuooh8rQQ6k/7mct1SP8mz0uGf1+3hjEVKBh1pO/fSMp62hyK
 sMMUjyCm6WQQwcnDpDiQqPX7bXu+c2WaI8T6BRv9xGcrZHtZPkgLMjgPvsoV1pcT34
 2Xf1zltxGOu5J+Bn5ofI4XYaeYfb5Lc5sbOfBOpA=
Received: from localhost (localhost [127.0.0.1])
 by mxgateway.ieeeglobalspec.com (Postfix) with ESMTP id A89D64E916;
 Thu, 26 Sep 2019 19:55:19 -0400 (EDT)
Received: from mxgateway.ieeeglobalspec.com (localhost [127.0.0.1])
 by mxgateway.ieeeglobalspec.com (Postfix) with ESMTP id B179F4E890;
 Thu, 26 Sep 2019 19:55:15 -0400 (EDT)
Authentication-Results-Original: mxgateway.ieeeglobalspec.com; arc=pass
 (as.1.microsoft.com=pass,
 ams.1.microsoft.com=pass)
 smtp.remote-ip=104.47.45.52;        dkim=pass (1024-bit rsa key
 sha256) header.d=ieeeglobalspec.com          header.i=@ieeeglobalspec.com
 header.b=Uuu58Jef header.a=rsa-sha256 header.s=selector2 x-bits=1024
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2052.outbound.protection.outlook.com [104.47.45.52])
 by mxgateway.ieeeglobalspec.com (Postfix) with ESMTPS id BD26A4E654;
 Thu, 26 Sep 2019 19:55:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIxpx47ODkNmPk1ejHisEYqdycAGUucc1+KaIbkCQB9v2gDqaFuMmMrnu1PJlh+89iBnEhioFfFbCOiHFiGrlVFtJ7TfCSgmLjLms9tj77mcXPxyd5Wa88+4YLGdxXOn893iNrbtb5b7Z/oBeE1kV3NfncN0CdgHuB6V1IyWTjM2A588UOZHYdEte0ThSXDRIVeaaVBWV2fgoqt1q0Idrctw2B/0sZIhcrz+F0aUHKkAM6dZwwAJ3uFFlKBA1Se16nPysaMFoOVE032A5G+Nit65mVS382hsDFdmrhLqtbqZCxskApBpZ7ci81mXdoU0iZoR11xB7FTEkOat9m7Amw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo1uA6tlnoMu4/yRCYzMq+9POj23JlfHWaeDpmx/QYY=;
 b=XZwc44JHi3NyOKKafC41fwzbfs8CVHAf9cfy8kGvxrKaZdr9/Vw6l8nkZcpriWE4UNIsBCJNaJxXhrg8maHUc/nOVTId32oajPB57X9YdC7nk1Z/OdIb1O3gp5tXSzLMn3aqJmqHs5DCQqwgSuSTgu+p2Z0n2qZLsRU6B7wqvbPWR1bAusSV77Pf0I2WE770E/0Rk9s44UTlUxGCnomQUOEQhtHTrDLalSMDnFAT0IWZbaTu9bY4nN730pTvVkpw2wwsnIet1Py0pAAlgED8xlRSks82IguJ2lnPz7kiMoIJxmizmMsiu0G1F3hpGQ7Znx3da/R2S1nOM6jJZVKtig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ieeeglobalspec.com; dmarc=pass action=none
 header.from=ieeeglobalspec.com; dkim=pass header.d=ieeeglobalspec.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieeeglobalspec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uo1uA6tlnoMu4/yRCYzMq+9POj23JlfHWaeDpmx/QYY=;
 b=Uuu58Jefj46O8TrZs7kkvIUC6AGxIV9B30DuwhE+XUosjMp+DvWTin+UbUdwiwrc8f/UQrDVwxbCjPz6FH35jOpZztyE6+UaxbKKhTcpbSeAXJDZBncLduv2FpN9eG4213Pf1wFohosMCkq0PkEBryBEPrakmyr3VBqk56/pK7s=
Received: from BN6PR19MB3089.namprd19.prod.outlook.com (10.255.128.26) by
 BN6PR19MB1634.namprd19.prod.outlook.com (10.175.189.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Thu, 26 Sep 2019 23:55:07 +0000
Received: from BN6PR19MB3089.namprd19.prod.outlook.com
 ([fe80::a01b:597:ce39:629f]) by BN6PR19MB3089.namprd19.prod.outlook.com
 ([fe80::a01b:597:ce39:629f%6]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 23:55:07 +0000
To: Martin Schwenke <martin@meltin.net>
Subject: Re: CTDB Assigned IP not on an interface
Thread-Topic: CTDB Assigned IP not on an interface
Thread-Index: AQHVdIvAB/OSwJ2XTUmUhJfCAoJqvac+DjMAgACJlQD//8ebgA==
Date: Thu, 26 Sep 2019 23:55:07 +0000
Message-ID: <65195A0F-90EB-4298-AF6E-4218C14E855D@ieeeglobalspec.com>
References: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
 <F637268B-A385-4A24-92A4-7CAB5754CCC1@ieeeglobalspec.com>
 <20190927091634.5adcce10@martins.ozlabs.org>
In-Reply-To: <20190927091634.5adcce10@martins.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1e.0.190918
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Max.DiOrio@ieeeglobalspec.com; 
x-originating-ip: [74.76.12.245]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a4c94ca4-5a4e-4a54-71dd-08d742dcfd6c
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR19MB1634; 
X-MS-TrafficTypeDiagnostic: BN6PR19MB1634:|DM5PR19MB1019:
X-MS-Exchange-PUrlCount: 1
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(136003)(39850400004)(396003)(199004)(189003)(186003)(6512007)(6916009)(6306002)(256004)(14444005)(6436002)(66066001)(91956017)(14454004)(6486002)(71200400001)(6246003)(71190400001)(58126008)(99286004)(36756003)(966005)(11346002)(446003)(316002)(229853002)(476003)(2906002)(26005)(6116002)(6506007)(53546011)(86362001)(486006)(8936002)(5660300002)(3846002)(25786009)(76176011)(2616005)(81156014)(81166006)(478600001)(33656002)(4326008)(66946007)(66446008)(8676002)(66476007)(64756008)(76116006)(66556008)(102836004)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR19MB1634;
 H:BN6PR19MB3089.namprd19.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: XUtMyiiu8hHKJgJu4yjDERamGrkHn3TXnnQFcvugPjOVVxUDzgTyEZHUbGIO2HNQJpUgO7tWTJZuar0SquSSFJA9yLSsYDVlZZRHtGFsV5viqlGAeAH1UVItEFUHwuVIxQLkT8kmdMVyOJM8MrEgyOCTmsCK2vIacqjZ32KJH4BXR6y5+i2jIRNYguWE5Z6sggcO4Jzs5/JTJYs930A/KX5MQ7FPhmvqcnmOLdbhjNBBRgbNKcQ0/k2u4/fdF5u2lVKJQaobMAV/NZ/ASmiqG98fxqib87ykXWw94UORB5CH+IWp6Bi+nmvpNmRX+dprbPaYjmrfkxf4ksBYbeblsnMUbWHK8bOf8icCnfUvkch2dBU67zkiYc8866gKb9Byiei0LHua5xfLFr/I1ZUN7yaAbA/Cty8yhZ7T4t1njw+rJlPCrDlkoa+LobIUR5+v8NPllpixDO1Snt1ZiQpjbQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D753F25BB3C43C43A587B197327EA1F5@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR19MB1634
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN3NAM04FT061.eop-NAM04.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9a4a7b56-7d4a-42be-a656-08d742dcf581
X-Microsoft-Antispam-Message-Info: ZqH7WG4YV49xeHro8bqa9uSkzosk2pHTSOCR5OJ2sKNFzf7/R1R846Vp+8mhoZcX4Gwpa0ctfnhEoMXisMFAk+Y7BpgDjPBJvMIkV0a9/e9d94sktoBngypEjByBFGgjxQVErI6WknThwmdjvMZmpQg11uCBxCJ/7lOKjtxaTziciTkwocL+ysejklOPntZW3wCmXoeeV1H7ez2LQsUD6lmjMcjsTvZQH67THvdKMC2UdFYxCfDRPoCtdYPyRZxcE4dSdYu9S17eV6Mb44FkFh0P378GXHh3+9NBSjgqr9fFHghfn5hKck/9aJwD848V+OAfq07DgrbIYb+6p3N+MLL5OZ18tHpDPXOvZojC/oGgE0seFFMJv4UXdpE8zYguVXyvZ+ApXwLT5JnbLQMIM5FpC+NngEARoW0tLQTUDN88T9NdSPPmX0nVJ5fwc4nwDOTKkGN8fTGaEDta//JnCQ==
X-OriginatorOrg: ieeeglobalspec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c94ca4-5a4e-4a54-71dd-08d742dcfd6c
X-MS-Exchange-CrossTenant-Id: cf3f664a-66a9-41c6-bdd5-b7c67d0a9e9c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=cf3f664a-66a9-41c6-bdd5-b7c67d0a9e9c; Ip=[209.235.67.34];
 Helo=[mxgateway.ieeeglobalspec.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1019
X-Warn: EHLO/HELO not verified: Remote host 40.107.78.50
 (mail-eopbgr780050.outbound.protection.outlook.com) incorrectly presented
 itself as NAM03-BY2-obe.outbound.protection.outlook.com
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
From: Max DiOrio via samba-technical <samba-technical@lists.samba.org>
Reply-To: Max DiOrio <Max.DiOrio@ieeeglobalspec.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmsgeW91IE1hcnRpbiEgIEkgc3BlbnQgaG91cnMgdHJ5aW5nIHRvIGdldCB0aGlzIHdvcmtp
bmcgdG9kYXkuICBNeSBnb29nbGUtZnUgd2FzIHdlYWsgdG9kYXkuICBJIGRpZG4ndCBmaW5kIGFu
eXRoaW5nIGFib3V0IHRoZSBmb3JtYXQgY2hhbmdlIG9yIHRoZSBkaXNhYmxpbmcgb2YgdGhlIGxl
Z2FjeSAxMC5pbnRlcmZhY2UNCg0KQlRXLCB0aGF0IHN0cmFjZSB3YXMgb2YgdGhlIGN0ZGIgbWFz
dGVyIHByb2Nlc3MuDQoNClNvcnJ5IGFib3V0IHBvc3RpbmcgaGVyZS4gIEkgZ29vZ2xlZCBjdGRi
IG1haWxpbmcgbGlzdCBhbmQgdGhpcyBpcyB0aGUgb25seSBvbmUgSSBjYW1lIHVwIHdpdGguICBB
Z2FpbiwgZ29vZ2xlLWZ1IGZhaWxpbmcgbWUgdG9kYXkuDQoNCllvdSByb2NrIQ0KDQpNYXgNCg0K
DQrvu79PbiA5LzI2LzE5LCA3OjE2IFBNLCAiTWFydGluIFNjaHdlbmtlIiA8bWFydGluQG1lbHRp
bi5uZXQ+IHdyb3RlOg0KDQogICAgTk9URTogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLg0KICAgIA0KICAgIA0KICAgIEhpIE1heCwNCiAgICAN
CiAgICBPbiBUaHUsIDI2IFNlcCAyMDE5IDE5OjA0OjMxICswMDAwLCBNYXggRGlPcmlvIHZpYSBz
YW1iYS10ZWNobmljYWwNCiAgICA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4gd3Jv
dGU6DQogICAgDQogICAgPiBBZGRpdGlvbmFsIGluZm8gLSB3aGVuIHJ1bm5pbmcgYW4gc3RyYWNl
IG9uIHRoZSBwcm9jZXNzOg0KICAgID4NCiAgICA+IGVwb2xsX3dhaXQoMTEsIFt7RVBPTExJTiwg
e3UzMj0yMTc5MjE0NDAwLCB1NjQ9OTQ1NDI5OTkzMzM5NTJ9fV0sIDEsIDExNCkgPSAxDQogICAg
PiBpb2N0bCgyNCwgRklPTlJFQUQsIFs5Nl0pICAgICAgICAgICAgICAgPSAwDQogICAgPiByZWFk
KDI0LCAiYFwwXDBcMEJEVENcMVwwXDBcMFwzNTJrXDM1d1w3XDBcMFwwXDBcMFwwXDBcMlwwXDBc
MFdcMjRcMVwwIi4uLiwgOTYpID0gOTYNCiAgICA+IHN0YXQoIi9ldGMvbG9jYWx0aW1lIiwge3N0
X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTM1MTksIC4uLn0pID0gMA0KICAgID4gd3JpdGUo
NSwgIjIwMTkvMDkvMjYgMTQ6NTk6MzYuMDU1NDY4IGN0ZGJkIi4uLiwgMTMwKSA9IDEzMA0KICAg
ID4gc29ja2V0KEFGX0lORVQsIFNPQ0tfU1RSRUFNLCBJUFBST1RPX1RDUCkgPSAyNQ0KICAgID4g
YmluZCgyNSwge3NhX2ZhbWlseT1BRl9JTkVULCBzaW5fcG9ydD1odG9ucygwKSwgc2luX2FkZHI9
aW5ldF9hZGRyKCIxMC44NS4xMzYuMTA4Iil9LCAxNikgPSAtMSBFQUREUk5PVEFWQUlMIChDYW5u
b3QgYXNzaWduIHJlcXVlc3RlZCBhZGRyZXNzKQ0KICAgID4gY2xvc2UoMjUpICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gMA0KICAgID4gc3RhdCgiL2V0Yy9sb2NhbHRpbWUiLCB7c3Rf
bW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MzUxOSwgLi4ufSkgPSAwDQogICAgPiB3cml0ZSg1
LCAiMjAxOS8wOS8yNiAxNDo1OTozNi4wNTU3MzEgY3RkYmQiLi4uLCAxMTgpID0gMTE4DQogICAg
PiBzdGF0KCIvZXRjL2xvY2FsdGltZSIsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT0z
NTE5LCAuLi59KSA9IDANCiAgICA+IHdyaXRlKDUsICIyMDE5LzA5LzI2IDE0OjU5OjM2LjA1NTg0
OCBjdGRiZCIuLi4sIDE1MykgPSAxNTMNCiAgICA+IHdyaXRlKDIxLCAiMFwwXDBcMEJEVENcMVww
XDBcMFwzNTJrXDM1d1wxMFwwXDBcMFwyXDBcMFwwXDBcMFwwXDBXXDI0XDFcMCIuLi4sIDQ4KSA9
IDQ4DQogICAgDQogICAgTm90IHN1cmUgd2hhdCBwcm9jZXNzIHlvdSdyZSBydW5uaW5nIHN0cmFj
ZSBvbiBoZXJlLiAgQSBoaWdoZXINCiAgICB2YWx1ZSBmb3IgLXMgbWlnaHQgaGF2ZSBnaXZlIGVu
b3VnaCBjb250ZXh0IGluIHRoZSBsb2cgbWVzc2FnZXMNCiAgICBiZWluZyB3cml0dGVuIGluIHRo
YXQgc25pcHBldC4NCiAgICANCiAgICBIb3dldmVyLCBJIHRoaW5rIEkgY2FuIGd1ZXNzIHRoZSBh
bnN3ZXIuLi4gc2VlIGJlbG93Li4uDQogICAgDQogICAgPiBPbiA5LzI2LzE5LCAxOjAwIFBNLCAi
c2FtYmEtdGVjaG5pY2FsIG9uIGJlaGFsZiBvZiBNYXggRGlPcmlvIHZpYSBzYW1iYS10ZWNobmlj
YWwiIDxzYW1iYS10ZWNobmljYWwtYm91bmNlc0BsaXN0cy5zYW1iYS5vcmcgb24gYmVoYWxmIG9m
IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+IHdyb3RlOg0KICAgIA0KICAgID4gICAg
IENUREIgaGFzIGJlZW4gd29ya2luZyBncmVhdCBmb3IgdXMgdGhlIGxhc3QgZmV3IHdlZWtzLiAg
VG9kYXksIEkNCiAgICA+IGRpZCBhIHl1bSB1cGRhdGUg4oCTIGFuZCBub3cgdGhpbmdzIGFyZW7i
gJl0IHdvcmtpbmcuICBUaGUgcHVibGljIElQDQogICAgPiBhc3NpZ25lZCBpcyBub3QgYWN0dWFs
bHkgYmVpbmcgYWRkZWQgdG8gdGhlIGludGVyZmFjZSwgYnV0IENUREINCiAgICA+IGNsYWltcyB0
aGUgbm9kZXMgYXJlIGhlYWx0aHkuDQogICAgDQogICAgPiBbLi4uXQ0KICAgIA0KICAgID4gICAg
IEN1cnJlbnRseSBydW5uaW5nIGN0ZGIueDg2XzY0ICAgIDQuOS4xLTYuZWw3LiBvbiBDZW50b3Mg
Ny43LjE5MDgNCiAgICANCiAgICBJJ20gZ3Vlc3NpbmcgdGhhdCB0aGlzIHdhcyBhbiB1cGdyYWRl
IHRvIDQuOSBmcm9tIGEgcHJldmlvdXMgdmVyc2lvbi4NCiAgICBJbiA0LjkgQ1REQidzIGNvbmZp
Z3VyYXRpb24gY2hhbmdlZCBhIGxvdCBhbmQgc28gZGlkIHRoZSBldmVudCBzY3JpcHQNCiAgICBo
YW5kbGluZy4NCiAgICANCiAgICBUcnkgcnVubmluZzoNCiAgICANCiAgICAjIGN0ZGIgZXZlbnQg
c2NyaXB0IGxpc3QgbGVnYWN5DQogICAgDQogICAgU2VlIGlmIDEwLmludGVyZmFjZSBpcyBsaXN0
ZWQgYW5kIGhhcyBhICcqJyBuZXh0IHRvIGl0IHRvIGluZGljYXRlDQogICAgd2hldGhlciBpdCBp
cyBlbmFibGVkLiAgSWYgaXQgaXMgbGlzdGVkIGJ1dCBpdCBpcyBub3QgZW5hYmxlZCB0aGVuOg0K
ICAgIA0KICAgICMgY3RkYiBldmVudCBzY3JpcHQgZW5hYmxlIGxlZ2FjeSAxMC5pbnRlcmZhY2UN
CiAgICANCiAgICB3aWxsIGVuYWJsZSBpdC4NCiAgICANCiAgICBZb3UgbWF5IHdhbnQgdG8gY2hl
Y2sgdGhhdCBhbGwgdGhlIGV2ZW50IHNjcmlwdHMgeW91IHVzZSBhcmUgZW5hYmxlZCBhcw0KICAg
IGV4cGVjdGVkLg0KICAgIA0KICAgIFRoZXJlIGlzIGFuIGV4YW1wbGUgY29uZmlndXJhdGlvbiBt
aWdyYXRpb24gc2NyaXB0DQogICAgKGNvbmZpZ19taWdyYXRlLnNoKSB3aXRoIENUREIgaW4gdmVy
c2lvbiA0LjkuICBJdCBpcyBwcmV0dHkgZ29vZCBidXQgd2UNCiAgICBsZWZ0IGl0IGFzIGFuIGV4
YW1wbGUgYmVjYXVzZSB3ZSBkaWRuJ3Qgd2FudCB0byBkcm93biBpbiBidWdzIHRoYXQNCiAgICBt
aWdodCBiZSBwcmVzZW50IGluIHRoZSBzY3JpcHQuICBJIGRvbid0IGtub3cgaWYgQ2VudE9TIDcg
c2hpcHMgaXQuICBJZg0KICAgIG5vdCwgeW91IGNhbiBnZXQgaXQgYXQ6DQogICAgDQogICAgICBo
dHRwczovL2dpdC5zYW1iYS5vcmcvP3A9c2FtYmEuZ2l0O2E9YmxvYl9wbGFpbjtmPWN0ZGIvZG9j
L2V4YW1wbGVzL2NvbmZpZ19taWdyYXRlLnNoO2hiPXJlZnMvaGVhZHMvdjQtOS1zdGFibGUNCiAg
ICANCiAgICBJZiBJIGhhdmVuJ3QgZ3Vlc3NlZCByaWdodCB0aGVuIHBsZWFzZSBwb3N0IHlvdXIg
Y29uZmlnIChjdGRiLmNvbmYsDQogICAgbm9kZXMgZmlsZSwgcHVibGljIGFkZHJlc3NlcyBmaWxl
KSBhbmQgdGhlIG91dHB1dCBvZjoNCiAgICANCiAgICAjIGN0ZGIgZXZlbnQgc2NyaXB0IGxpc3Qg
bGVnYWN5DQogICAgDQogICAgSWYgbm9uZSBvZiB0aGlzIHdvcmtzLCBzaW5jZSB5b3Ugc2VlbSB0
byBiZSBhd2FrZSBub3csIHlvdSBjb3VsZCBqdW1wDQogICAgb24gdGhlICNjdGRiIElSQyBjaGFu
bmVsIG9uIEZyZWVub2RlIGFuZCBsb29rIGZvciBtZSB0aGVyZS4gIEknbGwgYmUgaW4NCiAgICBh
bmQgb3V0IGZvciB0aGUgbmV4dCBjb3VwbGUgb2YgaG91cnMuDQogICAgDQogICAgVGhhbmtzLi4u
DQogICAgDQogICAgcGVhY2UgJiBoYXBwaW5lc3MsDQogICAgbWFydGluDQogICAgDQogICAgcC5z
LiBBcyBhIHVzZXIgbGV2ZWwgcXVlc3Rpb24sIHRoaXMgd291bGQgaGF2ZSBiZWVuIG1vcmUgYXBw
cm9wcmlhdGUgb24NCiAgICAgICAgIHRoZSAic2FtYmEiIGxpc3QsIHJhdGhlciB0aGFuIHNhbWJh
LXRlY2huaWNhbC4gICA6LSkNCiAgICANCg0K

