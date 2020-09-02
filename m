Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640F25B2D4
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 19:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3Ou0WjiIs/L9DyBg5Szsr3Z0xi1oQuw7isAiK26izRA=; b=eDuUSD4FhaWRVnV8280sMCaI1j
	J8FK1fEpaof+cMiilN8cMkaSPOURzhTYGKYZpq9x6Viv036rKjULtP1YOC3BU4UEPMSM3PrmorLq6
	BDwgoIJOJnG93lwzlL/BIL/1AC3tXQrXaWubxDBDdH6WNaktJgkcXnri8ij1lXsUkpLDblmIqdDky
	0pGUMV4dbi/VphzRKiRrLcIvuK7TevAPUassPMSLZlgJPCwi5Ru8Jlkkp1uxNRUdKqpCHvg7/wu7C
	VTqFWEn8vxflYX/5x7ucvICdzgxlQ0KR2o+5mplMr3hT9uAJYpJ4IdGpy3Keb9qnWGXz0+xWPYaHL
	9nCEyG+g==;
Received: from localhost ([::1]:42248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDWP1-003bVF-7s; Wed, 02 Sep 2020 17:18:31 +0000
Received: from mail-mw2nam10on20631.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::631]:46584
 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kDWOw-003bV8-0F
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 17:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ou0WjiIs/L9DyBg5Szsr3Z0xi1oQuw7isAiK26izRA=;
 b=WgCNL19t9J/84XL0aPap6jx1CsyRasZbkSpBqEuvFHkVMdX/GTx8PGCrnsrqrbhUtWxb463cJKdtYPxUqxeZvhGSKeQpwKT9sQG60TlEzeMacFC8kWn9NuYBNmi3iBBYEpu0v0j2cQG2/AEo/DnbI8+uzhIb+alnu/IoaVvSoHU=
Received: from BN6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:405:2::26)
 by BL0PR11MB3506.namprd11.prod.outlook.com (2603:10b6:208:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 17:18:08 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:2:cafe::7d) by BN6PR11CA0016.outlook.office365.com
 (2603:10b6:405:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Wed, 2 Sep 2020 17:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 23.96.254.246) smtp.mailfrom=storagecraft.com; samba.org; dkim=pass
 (signature was verified) header.d=storagecraft.com;samba.org; dmarc=pass
 action=none header.from=storagecraft.com;
Received: from us1-emailsignatures-cloud.codetwo.com (23.96.254.246) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 17:18:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by us1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Wed, 02 Sep 2020 17:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCN0YmHrw4K3LGsEXXCjtHodjccnVrZagC4+6Q7qJX9or0yOZkIrQZACg7jjjivK7BMj8UP7kjjKxL+dieZcWbON11oXMAxqIVi7lLSPoSI5UtaYShrOF8bn3ZwcVjgn6IpEi9RNcJ+AdmdRTs9XdOZ0dQqhOmmYhjLEuMwLgtuaTpAOTlGEnZy9DqiWgXfHE9uf5oTKJHtTeoSkI2jOhoI/t/xcJa4qX7tXoOhVQDbrvUxRz//NtMO/buerhLs/EibYunVUk9eLXDDBUTJM5YFp0pMv3G/0SGcVhVklmNzwAkF2RyXb2WG1/MhOGUoMlLGLdxiIGG19zxDOD6C8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ou0WjiIs/L9DyBg5Szsr3Z0xi1oQuw7isAiK26izRA=;
 b=UT7DkG7Czn+MGj8dyLNntj+cUEpjAyw1V4mB0TUrepUyU0p0+7zuwDPrcPI/dj89ZAb2Cl/SauZa6Hp7O11Sos2srIzuaVnZHf3P/xbdPYmSdSiYZK+JqsYQav6P34T0LpAtadPDGOP82RpVBm4kUbk+wUk02Y91qIrV+135LmjroAZUpIpvPHjFbmlBrSAr9OZ4IALPxPq9fL057lkK1OKMhWdmbZZpZzimjODHYrfG/DK2Zm6XeO+IVHplOAG8bPrwEXgjDhgPytqsOvaELW9O9zxwqL1Mq6sO1EHhTvd8q6CObFHxBdPrVSO4Aqenn3p4a9KjCcMEdqsLr8tHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=storagecraft.com; dmarc=pass action=none
 header.from=storagecraft.com; dkim=pass header.d=storagecraft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=storagecraft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ou0WjiIs/L9DyBg5Szsr3Z0xi1oQuw7isAiK26izRA=;
 b=WgCNL19t9J/84XL0aPap6jx1CsyRasZbkSpBqEuvFHkVMdX/GTx8PGCrnsrqrbhUtWxb463cJKdtYPxUqxeZvhGSKeQpwKT9sQG60TlEzeMacFC8kWn9NuYBNmi3iBBYEpu0v0j2cQG2/AEo/DnbI8+uzhIb+alnu/IoaVvSoHU=
Received: from DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21)
 by DM6PR11MB3577.namprd11.prod.outlook.com (2603:10b6:5:137::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 17:18:06 +0000
Received: from DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28]) by DM6PR11MB4532.namprd11.prod.outlook.com
 ([fe80::89f0:4c94:f8f9:4a28%5]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 17:18:05 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Directory Leasing feature in Samba smbd
Thread-Topic: Directory Leasing feature in Samba smbd
Thread-Index: AQHWekiX55qIzeduzE+xPMVqwawon6lKqR0AgAmjkQA=
Date: Wed, 2 Sep 2020 17:18:05 +0000
Message-ID: <AE3B2AEB-2208-4840-B88F-103DEF54BFA6@storagecraft.com>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
 <20200826173216.GC16382@jeremy-acer>
In-Reply-To: <20200826173216.GC16382@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.40.20081000
Authentication-Results-Original: samba.org; dkim=none (message not signed)
 header.d=none; samba.org; dmarc=none action=none header.from=storagecraft.com; 
x-originating-ip: [73.157.137.233]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9b0ae5ed-9ef2-4cfc-9ef5-08d84f642942
x-ms-traffictypediagnostic: DM6PR11MB3577:|BL0PR11MB3506:
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: sktiLlZekZpluuFK8u1lMXTFIrqPQVgyYjB2DAcCxs9mD9SDfzvoYvu3VfVL5MClgcx1jVhG9oX+qGKFoB9IDJMpkb00U/0kPFNPkkyjbQFWVNoWH3bDUR+DRCcq8GvR0Fm1qv2/69K1PsrC90KSK3+PRXlhYx/shH/9V1bv+O1eA4eNqEgFnU/jMPNWeNY2o+ys4/Vm2o577geRuq6VxMfb2NA/Tn2knh8sr+g49EuBZg4TEdW6kqiJYdjY9R4d2PDUseHzdR81hPpeeizkV0CFH9y4CQQA8etDqnxPdwKB8wtNpexG/+xWgHMqkzJ9/OaX2oby2ez2rxLfZE3Wcl9LcCGtVKIHDYyJUAJRZoWeaUFV8AWpTSKNW5JztyPAX1KUWnV1Cn5GK0coeUzpLQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR11MB4532.namprd11.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(45080400002)(478600001)(36756003)(26005)(186003)(83380400001)(8676002)(8936002)(86362001)(6916009)(2906002)(53546011)(2616005)(6512007)(16799955002)(6506007)(44832011)(71200400001)(33656002)(66556008)(966005)(64756008)(66446008)(4326008)(76116006)(66476007)(5660300002)(316002)(66946007)(91956017)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: MdRj6TIovY+KyX0+2VBzmZUYwERqNifFkNXRBAmq3sfWmXfuzGeANA8rSQ8rXhAWufmxGbSboxt7Y2Jkqgd42o26QBhvBB8OANqtnsJwAoaPTl7kld482TQNVpwIob8t5v6cyjvwg52a6bM0fqLo9xA125RTIAEJtbe4tT3vp5VMxT46SoeSDDk4zg7o29Y+gax243JAt7vfvxN3gUxzIGNZ4/dh4WZ4IIrQ3g2JuEHoNg1kNIRaKTClRoSax+rhPJdnISEwM3raHliU988X8s2sSzl6vcK9DXiiobowCvtsPJi5B6Y8NA0zVJLorbugljfhD8qwy0Rnit6Wxh/dLehLSbs+RKXVIaU/Ho2GmZ+PgxtAL57Iyrvvrt4ABDMZG9LtovUvlXkjmkpWmywZYN09ndzJSz7oj/ZAqpg6mJcoag9zl/RzkZCvlbaaFTE0tk90ljsPxMe+4VgcDOkfliv21lS3FWqT8Pp9GbFG/zEYNLdmKkLLZrQwlKRQLorU/+M5rQFBkfr9eLr/+xlQYSo22c/CzrvlxXV2NS5wUzPuPkfshBAwXRzKSVGHlaP4jT5PNrYuXXQqiSsCal+iaXbaIxXI6CWl1CDsnRj2v6en56HL7ONY067sjLVkZSxImT7OQ4bO7G9/O1gPRAHeZw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D446A3DF6D500E408E60226858149BA1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3577
X-CodeTwo-MessageID: 8f512538-3fb2-4091-a053-31bee2ebc86c.20200902171807@us1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 25fc605c-b95c-47c0-b0e7-08d84f6427f2
X-Microsoft-Antispam-Message-Info: nJ7n1Do1nT3wXkNs326Cx+vBxo/SsSNTrmgfxE67OsttVy4qigg4OuPdnnFlxNjlLHQ5BECVQfvkURJPDkRz8ghpzEgFxm80+GdMJX11ZPk5oTcGh5YPBzwIY8yOItjRt2YBoaDQgf+4c8ktuFg+SwjU2baXrNmVfI9ZYF2ZwhaBkHYgcOqTnlJN7ge7obhISU1WmPj0pFqRlwCSrM/O3deF832zS+nO8Euymmk2+rvX1bGMaZZe/qBmeg0IospcewOJLQmOyz542Hs0RGG9+hoji4jUdsMF5j+EhTsTC02TWS9lbriuxe1YUbG5ARLx8H0aAE5Q96FjC9nEXNaBNtA7MinXvFBE9I9RkY8BypuDWZ6huAKCu+gebC8lYGxVivHZIJZsxHG4dLALOFjm75unnHf8WChJF4EX67N6j7V4weK74lh1HvokzYQL7L2Qo3mwDdXtYUxN4ZtIWhsCK/CKFRyJ9pWNfIPJ7miGgwY=
X-OriginatorOrg: storagecraft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0ae5ed-9ef2-4cfc-9ef5-08d84f642942
X-MS-Exchange-CrossTenant-Id: 99f4e3c9-bed5-443d-bd53-2b3f22d4eddf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=99f4e3c9-bed5-443d-bd53-2b3f22d4eddf; Ip=[23.96.254.246];
 Helo=[us1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3506
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e89::631
 (mail-mw2nam10on20631.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SmVyZW15LA0KDQpUaGFua3MgZm9yIHRoZSBpbnNpZ2h0ZnVsIHJlc3BvbnNlIG9uIGhvdyB0byBz
dGFydCBvbiBkaXJlY3RvcnkgbGVhc2luZyBmZWF0dXJlLg0KDQpBZnRlciByZWFkaW5nIG1vcmUg
aW50byBNaWNyb3NvZnQgU01CMi8zIGRpcmVjdG9yeSBsZWFzaW5nLCBpbiBvdXIgY3VzdG9tZXIg
Y2FzZSwgbG9va3MgbGlrZSB0aGUgd2luZG93cyBjbGllbnQgaXMgdGFraW5nIGFkdmFudGFnZSBv
ZiB0aGUgZ3JhbnRlZCBkaXJlY3RvcnkgbGVhc2UgYW5kIG1haW50YWluaW5nIGEgZGlyZWN0b3J5
IGNhY2hlLg0KDQpJIGFtIGF0dGVtcHRpbmcgdG8gc2V0dXAgdGhlIGZvbGxvd2luZyBldmVuIGJl
Zm9yZSB3cml0aW5nIHRlc3QgY2FzZXMuDQoNCiAgMS4gVXNpbmcgZGlyZWN0b3J5IGxlYXNlIGNh
cGFibGUgV2luZG93cyBTZXJ2ZXIgMjAxMlIyIChvciBsYXRlciksIHNldHVwIGEgc2hhcmVkIGZv
bGRlci9kaXJlY3Rvcnkgd2l0aCBhIHNldCBvZiBmaWxlcy9mb2xkZXJzIGluIGl0Lg0KICAyLiBP
biBhIFdpbmRvd3MgY2xpZW50IGNhcGFibGUgb2YgdXNpbmcgZGlyZWN0b3J5IGxlYXNlICwgbWFw
IHRoZSBzaGFyZWQgZm9sZGVyIHRvIGEgbG9jYWwgZHJpdmUgbGV0dGVyLiANCiAgMy4gIFN0YXJ0
IGNhcHR1cmluZyB0Y3BpcCBwYWNrZXRzIG9uIGVpdGhlciBjbGllbnQgb3Igc2VydmVyLg0KICA0
LiBCcm93c2UgdGhlIHNoYXJlZCBmb2xkZXIgb24gdGhlIGNsaWVudCBtdWx0aXBsZSB0aW1lcy4g
DQogIDUuIFRoZSB0Y3BpcCBkdW1wIHNob3VsZCBzaG93IG9ubHkgYSBzaW5nbGUgZGlyZWN0b3J5
IHNjYW4gc2V0IChTTUIyX0ZJTkRfQk9USF9ESVJFQ1RPUllfSU5GTyByZXF1ZXN0cy9yZXNwb25z
ZXMpDQoNCklzIG15IGFzc3VtcHRpb24gYW5kIGFwcHJvYWNoIGNvcnJlY3Q/IElzIHRoZXJlIGEg
YmV0dGVyL2RpcmVjdCB3YXkgdG8gbW9uaXRvciB0aGUgZGlyZWN0b3J5IGxlYXNlIGFuZCBjYWNo
ZSBpbiB0aGUgY2xpZW50PyANCg0KT25seSBpbmZvcm1hdGlvbiBJIGZvdW5kIG9uIFdpbmRvd3Mg
aXMgdGhlIGdsb2JhbCBjb25maWd1cmF0aW9uIHZhbHVlcyBvZiAiRGlyZWN0b3J5Q2FjaGVFbnRy
aWVzTWF4IiBhbmQgIkRpcmVjdG9yeUNhY2hlRW50cnlTaXplTWF4IiBzaG93biB3aXRoIHBvd2Vy
c2hlbGwgImdldC1zbWJjbGllbnRjb25maWd1cmF0aW9uIi4gQXJlIHRoZXJlIGFueSBzdGF0cyB0
byBtb25pdG9yIHRvIGRldGVybWluZSB0aGF0IHRoZSBkaXJlY3RvcnkgY2FjaGUgaXMgYWN0aXZl
IHdpdGggZW50cmllcyBmcm9tIHRoZSBtYXBwZWQgZHJpdmUgdGhhdCBoYXMgdGhlIGRpcmVjdG9y
eSBsZWFzZWQ/DQoNCk9uY2UgdGhpcyBzZXR1cCBpcyBkb25lIGFuZCBjb25maXJtZWQgd29ya2lu
ZywgSSB3aWxsIGhhdmUgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvbiB3aGF0IHRvIGV4cGVjdCBh
bmQgSSB3aWxsIHN0YXJ0IGFkZGluZyB0ZXN0IGNhc2VzIHRvIHNtYiB0b3J0dXJlLg0KDQpUaGFu
a3MuDQoNClJlZ2FyZHMuDQpLcmlzaG5hIEhhcmF0aGkNCg0KDQpPbiA4LzI2LzIwLCAxMDozMiBB
TSwgIkplcmVteSBBbGxpc29uIiA8anJhQHNhbWJhLm9yZz4gd3JvdGU6DQoNCiAgICAqKipFWFRF
Uk5BTCBTRU5ERVIuIE9ubHkgb3BlbiBsaW5rcyBhbmQgYXR0YWNobWVudHMgZnJvbSBrbm93biBz
ZW5kZXJzLiBETyBOT1QgcHJvdmlkZSB5b3VyIHVzZXJuYW1lIG9yIHBhc3N3b3JkLioqKg0KDQog
ICAgT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDY6NTg6NDVQTSArMDAwMCwgS3Jpc2huYSBIYXJh
dGhpIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQogICAgPiBBIG1vcmUgZG9taW5hbnQgaXNz
dWUgb2YgbGFjayBvZiBkaXJlY3RvcnkgbGVhc2Ugc3VwcG9ydCBpbiBzbWJkIHN1cmZhY2VkIHdo
aWxlIGxvb2tpbmcgaW50byBVTkMgdnMgbWFwcGVkIGRyaXZlIHBlcmZvcm1hbmNlLg0KICAgID4N
CiAgICA+IEFzIHBlciBTYW1iYSBXaWtpLCB0aGlzIGRpcmVjdG9yeSBsZWFzaW5nIGZlYXR1cmUg
aXMgbm90IHBsYW5uZWQgYW55dGltZSBzb29uLiBMZXQgbWUga25vdyBvdGhlcndpc2UuDQogICAg
Pg0KICAgID4gSSBtYXkgYmUgYWJsZSB0byBzcGVuZCBzb21lIHRpbWUgd29ya2luZyBvbiB0aGlz
IGZlYXR1cmUsIG9uY2UgSSBnZXQgYSBiZXR0ZXIgaWRlYSBvZiB3aGF0IGl0IHRha2VzIHRvIGlt
cGxlbWVudC4NCiAgICA+IEkgaGF2ZSByZWFkIHRoZSBoaWdoLWxldmVsIG5vdGVzIGF0IGh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRndpa2kuc2FtYmEub3JnJTJGaW5kZXgucGhwJTJGU2FtYmEzJTJGU01CMiUyM0RpcmVjdG9y
eV9MZWFzZXMmYW1wO2RhdGE9MDElN0MwMSU3Q2tyaXNobmEuaGFyYXRoaSU0MHN0b3JhZ2VjcmFm
dC5jb20lN0MwNTdmYjExYzRjODE0YjM5OTg0MjA4ZDg0OWU1ZmUzMSU3Qzk5ZjRlM2M5YmVkNTQ0
M2RiZDUzMmIzZjIyZDRlZGRmJTdDMCZhbXA7c2RhdGE9TFJlcDBmUFFCc2xOdlpiZE80Y3BaNTZJ
V04zM0hBMHdVJTJGYTlwekZ5dmdzJTNEJmFtcDtyZXNlcnZlZD0wDQogICAgPg0KICAgID4gSSBh
cHByZWNpYXRlIGFueSBjb21tZW50cyBvbiB0aGlzIHRvcGljIGF0IHRoaXMgdGltZSwgbW9zdGx5
IGNoZWNraW5nIHRvIHNlZSB0aGUgZm9ydW0ncyBpbnRlcmVzdCB0byBjaGFydCBvdXQgdGhlIG5l
eHQgbGV2ZWwgb2YgZGV0YWlscy4NCg0KICAgIEhpIEtyaXNobmEsDQoNCiAgICBUaGUgYmVzdCB3
YXkgdG8gcHJvY2VlZCBvbiB0aGlzIGlzIHRvIGFkZCBhZGRpdGlvbmFsDQogICAgc21idG9ydHVy
ZSB0ZXN0cyBpbnNpZGUgc291cmNlNC90b3J0dXJlL3NtYjIvbGVhc2UuYw0KICAgIHRoYXQgcGFz
cyBhZ2FpbnN0IGEgV2luZG93cyBzZXJ2ZXIgdG8gZXhwbG9yZSB0aGUgZXhhY3QNCiAgICBiZWhh
dmlvciB3ZSdsbCBuZWVkIHRvIHJlcHJvZHVjZSB0byBjb3JyZWN0bHkgaW1wbGVtZW50DQogICAg
ZGlyZWN0b3J5IGxlYXNlcy4NCg0KICAgIFlvdSBjYW4gbWFyayB0aGUgYWRkaXRpb25hbCB0ZXN0
cyBhcyBrbm93bmZhaWwgaW5zaWRlDQogICAgYSBmaWxlIGluIHRoZSBzZWxmdGVzdC9rbm93bmZh
aWwuZC8gZGlyZWN0b3J5Lg0KDQogICAgT25jZSB3ZSBoYXZlIGEgY29tcHJlaGVuc2l2ZSBzZXQg
b2YgdGVzdHMgd2UnbGwgYmUNCiAgICBhYmxlIHRvIGJldHRlciBldmFsdWF0ZSB3aGF0IHNlcnZl
ciBjaGFuZ2VzIHdlJ2xsDQogICAgbmVlZCB0byBzdGFydCBwYXNzaW5nIHRoZW0uDQoNCiAgICBU
aGFua3MgYSAqTE9UKiBmb3IgbG9va2luZyBhdCB0aGlzLCBpdCdzIG11Y2gNCiAgICBhcHByZWNp
YXRlZCAhDQoNCiAgICBKZXJlbXkuDQoNCg0K

