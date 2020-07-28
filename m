Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4522523162A
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jul 2020 01:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=R6kw8JikIum8OywHJszn+J/djnkS+FW8a2rH1usIZKI=; b=SMUm4W5vRN8lAWxTxeOGGYVMx9
	Vh83pNY+2KogzwM01v5K012CEc1zbN4z97pI7bx0Q/sPk+awfZzVenn8bVpyv+4iemsK5LiL/llYT
	Abk6txJ7s+CSVFvZ28x8pa/6kBqMoo7bclaCEZSANZj2CFVaIqa7U52nAaKhZCLa0z/jViX82v4LD
	QBkSDtyGAiU4yMEoXJ8lsxStN7ZBBZANvBo6IzYF8L0nO85pv2L83CEA0z5vDiA0TYm7/rbqhzu0m
	kh0tfZd7pYif05nY3D82SHISK+CkrOFZqulq2X6YXXSodWPWPysN3iHGamwUkYVEoviDEDhBSPzB2
	OTZdp/Kg==;
Received: from localhost ([::1]:23270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0Yji-00AB8y-9w; Tue, 28 Jul 2020 23:10:18 +0000
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com
 ([40.107.236.81]:23265 helo=NAM11-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k0Yjb-00AB8r-Io
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 23:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6kw8JikIum8OywHJszn+J/djnkS+FW8a2rH1usIZKI=;
 b=IDqeTd1NcTxzi2h5BAIpoKo3EVFogngImfv+se1SrKonCUjtzjJX+Rm7iaJfWLNQYobKt6NcM+5Qx+4PDBdQ5WN9fC88xqQWieYcsabmwkXBRwS4Cm0/wJ4GU9nIQ9SD1kO8vPDczYK2c+GvDQ/j5l6bjJipkR9XkkRdGB3ZA7E=
Received: from MWHPR04CA0045.namprd04.prod.outlook.com (2603:10b6:300:ee::31)
 by CH2PR11MB4343.namprd11.prod.outlook.com (2603:10b6:610:3e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 23:09:55 +0000
Received: from CO1NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:300:ee:cafe::45) by MWHPR04CA0045.outlook.office365.com
 (2603:10b6:300:ee::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Tue, 28 Jul 2020 23:09:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 65.52.56.186)
 smtp.mailfrom=storagecraft.com; samba.org;
 dkim=pass (signature was verified)
 header.d=storagecraft.com;samba.org; dmarc=pass action=none
 header.from=storagecraft.com;
Received: from us2-emailsignatures-cloud.codetwo.com (65.52.56.186) by
 CO1NAM03FT010.mail.protection.outlook.com (10.152.80.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 23:09:54 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by us2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Tue, 28 Jul 2020 23:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3e3yt0Y6FR2zKWjaW9nd6GD/5pMi9DIAVuXZGcQLFVYIuUyPQPgYU67KajkhQnl355YPN0q+d4JBUnETUn2gFMOaOpr+d0PtmVXqWYu0lHbFGuuPmCMSEvlw6MHbI+AsBbaTUJ6ZIMfTFsEaHLohaEJCNRZVvto3DJkXyyyl9AgG11LdKFJddPGfXBTYv+fnLLnAm8E23OVDM4m2Ae3TtjtXDx7OgM+/1no0LGKSlsYqE+JhaSQaRWuNkCpQwxKKPi2qys11VdJJ2EOETQnfI34NrknQ7qnINS14hQmpyZgPewMK7KIeFALQyucBNh9E3oMHtCCntkwh9XqDPSyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6kw8JikIum8OywHJszn+J/djnkS+FW8a2rH1usIZKI=;
 b=bsNJ5p3N/5WY0n/vm3CdQzoiFj6W7JWUwL0a91+AMeemZm83FkGte+BYd3bs1cj6O9aKs6+28rvLl4qC/Y70WX3nNuxBJ48wElbvfOjb815/9LSCkf3zyIVG7O39efaE9Y20x8TnFZUP6UVnp62ZQjvlyhNGXQzH4rn5lHCnTfrIRxSAQAplfNcARkhMa9pYw0e/Fi4nxL14+yfYtycG3D6JOTNLSTtQN2caaQODXQJR0M1quRroLIqPem+ji3rDUhXZTpNjI/8xP1U8nmBmu9PMx16pO+Vsb4jduWY1rsutoevVtPrSvZ4lImTIbnZUrh0lQOoCzvfBN8+I6ILWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6kw8JikIum8OywHJszn+J/djnkS+FW8a2rH1usIZKI=;
 b=IDqeTd1NcTxzi2h5BAIpoKo3EVFogngImfv+se1SrKonCUjtzjJX+Rm7iaJfWLNQYobKt6NcM+5Qx+4PDBdQ5WN9fC88xqQWieYcsabmwkXBRwS4Cm0/wJ4GU9nIQ9SD1kO8vPDczYK2c+GvDQ/j5l6bjJipkR9XkkRdGB3ZA7E=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM5PR1101MB2252.namprd11.prod.outlook.com (2603:10b6:4:52::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Tue, 28 Jul
 2020 23:09:51 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::e480:d1a9:c503:1558%7]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 23:09:51 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: UNC vs Mapped Drive connection times
Thread-Topic: UNC vs Mapped Drive connection times
Thread-Index: AQHWZS1m2f9cWoeHOE2HCZhE5ocdSKkdkTcA//+XeYA=
Date: Tue, 28 Jul 2020 23:09:51 +0000
Message-ID: <EEB8FCB6-0669-47F2-8787-F282385CF3EE@storagecraft.com>
References: <B08C375D-7730-453F-B11C-1357B78C0C10@storagecraft.com>
 <20200728222358.GC3178@jeremy-acer>
In-Reply-To: <20200728222358.GC3178@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.39.20071300
Authentication-Results-Original: samba.org; dkim=none (message not signed)
 header.d=none; samba.org; dmarc=none action=none header.from=storagecraft.com; 
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c89ce1af-cbe4-47f0-a233-08d8334b56f2
x-ms-traffictypediagnostic: DM5PR1101MB2252:|CH2PR11MB4343:
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: r8mnBeEbPe0rA2lbMTosuJxkdd1EJAsXv9z71I1W/vmAMDPkOa6zG7Z2asv4+fPRvySnG+VaRAOuzGUMWNA1U6m7+wk3PbuTWdcYbM5jDmTiJp05cWigrCDZjLpBcTIpyV2ZCq2hRPKWkYSlOMPooVY59MgsFOCK9ehnt77RDbmbkLXyrYfC7tPtTbRSrgtaJjJLTEOjuVODCGzaFJ+E35nHC3VrgOdInIblw6TcNNdIaNDvBjYPgHlLQZ2eteQL1EfhKQZpsWx3nG1IUxpjl42UZwng4fjAlS/pinToEe2asPw1y263R0oN003RWnojyCqNOYCOXw2BHh9em/Xsow==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39840400004)(8936002)(83380400001)(66946007)(26005)(64756008)(66476007)(66556008)(2906002)(76116006)(6512007)(66446008)(186003)(8676002)(478600001)(91956017)(316002)(2616005)(86362001)(6486002)(6506007)(71200400001)(44832011)(5660300002)(6916009)(33656002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WZmx2EsfywreWGQbRKITmcmk5OTGQjrsPf5kYepnIG9kJ0MdEvM4GzMaL/jTJQivOxndD7cM+zh1YIrdirlaHjqigE7KaKUszz3F5ZMkISB9/YgicNPuHsVCVwTAOrE8SZRtROJ8qdYbvo1KroRtozo7P5zEl2h/6k8L2u8iEFG+uRj2EkL7vF7NIVA6jyrgfbny1q3puwgbmaVpAykLFL9BQx2Zp3pdqwKpL6QuulTDAAbSsA4nk2TVR6Q9TIkYP1AiWPSFj3wVZ+y5r+9RN9Yef9sTKqy6Ecl7295vyLpnaXI+56lfIdnXe7qpHErZce5YdEp3RyK4GY1u7lZeP0i5L/TVKq2PXXB0jK7+Cg/AwLA6WHSPdndIUUCvmD6npNNdMMhZKBe5nxVaQBHtQmSZE5QE5mFinUv6BxY+Emv4tKyfTvcuQezSoxuj3s1YeOL4nEWSSiMr42e4BOZ8c3KcYqun+Qu8FgOkcEyppUpGNBQ9RSZZjTFbokc/2BEn
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9D213955D9DBD4B9BC9C7846408A9C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2252
X-CodeTwo-MessageID: 2030d6fd-ba66-4868-a6ee-8436b644aaee.20200728230953@us2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM03FT010.eop-NAM03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d7443908-b97b-4aba-48c4-08d8334b5538
X-Microsoft-Antispam-Message-Info: JqnpAwu8GRTR05U2DDZTDE43p/8rfLQillCyJ4hLTboIItha6UmJQOSMKpzV9XRGZKM2nYokMNI0XyIVUAhCtmTCnW0CsbaTpPf2ejKmRyfKGh9TwM/mj3D1I7YfvL0Eb7u0CXSvo9BPN1BsXPcKU+jMj5ROioFE6I/MCz6qAwW2xDiUMY2Vjlu+HVIBnjod7Mv6RWBiNYbx72HRbEoFidcLrHYhE7R3wW1EsZ5fXQAlZDFGuWFKu3lIyZG5pOZt4nG6Qex+o8fwctwyXOT+U/TJwY6WFUznd3eb8iBHkPhos83sPixc0EKkA10Qf1K9F9/jAdk4hXKsb6qv8aklc0PKn2GznjjmfkIbcbmN5GyoxWYg5IAiEK6BfZYoF1giiIhi1hcJ0ZC3QKAhumnDtQ==
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89ce1af-cbe4-47f0-a233-08d8334b56f2
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[65.52.56.186];
 Helo=[us2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM03FT010.eop-NAM03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4343
X-Warn: EHLO/HELO not verified: Remote host 40.107.236.81
 (mail-bn8nam11on2081.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-BN8-obe.outbound.protection.outlook.com
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

WWVzLCB0aGUgc2FtZSBjbGllbnQgY29ubmVjdGluZyB0byB0aGUgc2FtZSBzZXJ2ZXIgbmFtZS9h
ZGRyZXNzIGJvdGggdGltZXMgd2l0aGluIGEgZmV3IG1pbnMgb2YgZWFjaCBvdGhlci4NCg0KSSB3
aWxsIHRyeSB0byBnZXQgdGNwZHVtcCBjYXB0dXJlcyBmb3IgYm90aCBhcyB3ZWxsIGFzIEROUyBs
b29rdXAgdGltZXMuDQoNClRoYW5rcy4NCg0KUmVnYXJkcy4NCktyaXNobmEgSGFyYXRoaQ0KIA0K
DQrvu79PbiA3LzI4LzIwLCAzOjI0IFBNLCAiSmVyZW15IEFsbGlzb24iIDxqcmFAc2FtYmEub3Jn
PiB3cm90ZToNCg0KICAgICoqKkVYVEVSTkFMIFNFTkRFUi4gT25seSBvcGVuIGxpbmtzIGFuZCBh
dHRhY2htZW50cyBmcm9tIGtub3duIHNlbmRlcnMuIERPIE5PVCBwcm92aWRlIHlvdXIgdXNlcm5h
bWUgb3IgcGFzc3dvcmQuKioqDQoNCiAgICBPbiBUdWUsIEp1bCAyOCwgMjAyMCBhdCAxMDoyMTox
MlBNICswMDAwLCBLcmlzaG5hIEhhcmF0aGkgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCiAg
ICA+IFdlIGFyZSB1c2luZyBTYW1iYSA0LjcuMTEuDQogICAgPg0KICAgID4gT25lIG9mIG91ciBj
dXN0b21lcnMgaXMgcmVwb3J0aW5nIHRoYXQgd2l0aCBXaW5kb3dzIDcsIDEwIEV4cGxvcmVyLCBj
b25uZWN0aW5nIHVzaW5nIE1hcHBlZCBEcml2ZSBpcyB0YWtpbmcgMTAgc2Vjb25kcyBhcmUgbW9y
ZSBjb21wYXJlZCB0byB1c2luZyBhIFVOQyBwYXRoLg0KICAgID4NCiAgICA+IEkgYW0gbm90IGFu
IGV4cGVydCBpbiB0aGlzIGFyZWEsIGFuZCBJIHN0YXJ0ZWQgaW52ZXN0aWdhdGluZyB0aGUgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gbWV0aG9kcyB0byBpZGVudGlmeSBhbmQgaW1wcm92ZSBh
bnkgYm90dGxlbmVja3MgZXNwZWNpYWxseSBpbiB0aGUgZmlsZXN5c3RlbSB1bmRlcm5lYXRoIFNh
bWJhLg0KICAgID4NCiAgICA+IEdpdmVuIHRoZSBvdmVyd2hlbG1pbmcgbnVtYmVyIG9mIHZhcmlh
Ymxlcy9wYXJhbWV0ZXJzIGluIHRoaXMgY29udGV4dCwgSSB3b3VsZCB2ZXJ5IG11Y2ggYXBwcmVj
aWF0ZSB0aGlzIGdyb3Vw4oCZcyBjb2xsZWN0aXZlIGV4cGVydGlzZSBvbiBwb2ludGluZyBvdXQg
YW55IGtub3duIGlzc3VlcyB0byBsb29rIG91dCBmb3IuDQoNCiAgICBETlMvbmFtaW5nIHJlc29s
dXRpb24gbG9va3VwIHRpbWVzID8gQXJlIHRoZXkgY29ubmVjdGluZyB0bw0KICAgIGV4YWN0bHkg
dGhlIHNhbWUgbmFtZSA/DQoNCg==

