Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E684013DF6B
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 17:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=zBWAkBCgMCH5Fcm6ZxmStZxoVTn7xTmWCfDmYMgzUMI=; b=JnDDOO1+beJ8lEdYF/MF1yMpZb
	RhqPSN2zCw4nBTJ7rb83d9h/6sinel5eQhte3AqnB+upcXp5fkyyrAiQTx2DZx5dnd5VjOr/U7rIA
	mOcz4zgFylcHyzAhdmTGX4lCz2pO6mTF2laDVS/Sdj2OCcnrAAWJoYxLBDHWMWsT+NEWP203f4pMz
	IC3OQ7SYDYFqE3PVBkUsXE0cnJM16ymEehrePa0PEOeLMW7sAB+Tpl/BHUstqMjfiGd4sAKgRRGBl
	GiYjbFhJCv6FXVu/pHVSnhIaIgq9wuadqE335q45UlweVRqkDGFtRgJtAn56wwEQMXhk0f6yqr8Bv
	cBjOX9KA==;
Received: from localhost ([::1]:34248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1is7Xn-003dwu-7X; Thu, 16 Jan 2020 15:58:51 +0000
Received: from m4a0072g.houston.softwaregrp.com ([15.124.2.130]:39496) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1is7Xg-003dwn-Js
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 15:58:49 +0000
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Thu, 16 Jan 2020 15:57:27 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 16 Jan 2020 15:45:32 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 16 Jan 2020 15:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBbqce2QvX8+aNd9xIlRGV2q5GzHFiuLGHFjUdYrIV7yLJzR/M0t5kzdutyTsszZeHQhAADIaNP0N/9dD6quKGfHQT+rHRnIdE8z/b9MQe7CkDBBGqLNaT9LSIf2X2Qg5OWALVZvOgyCMzbOSCIuXCf5s2e55U9eiHvB9YMs1Cn65jKb7aYTx0+ym7HYEpeH65Y1Vik4kQRGAwCvHkC/QDhIbMa9iFPlcycVv5OezhNsaeSf838mc6OSE/7yK0+/V8D33y7d8KQ4k6E0lA4M50Ph4lM7puHTbt5KAduX5SjQ7xxB4zfRLmvHQwiU3e0g+kP5YhILsTFdumGvQFp4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMw3ozuCnDLtSl2raTGnKOCvsCzyj5dbtk/czPQE0no=;
 b=URNBM6N8JnWdM/rB1SE3j5X2ya2plvMrsDLVqCwaDoujM7VWC4m3hgQvwjm4Wx6q+osLAo8qEOc+Nzo2L4dE7BwboX5PjNOopeNWuyMGEixoD6rlyjxBStnLAJKfs+XD4e8yTsV9aGWPdiaX0N2gPoycqzU9eblPubid4jSLLXuGRoLxySjaU5GSE+9oMFvg0fZWnITyhoFd4mPzr68tzuzLus+DwAvaft2vydpGW64H0llL1uVq3JIusJ7q246jHCb3xPvSoyKknugz6dVzSfYBHF3dNI/w+TGujwT9atnCiLwYgfn+pEu31RGlxFuR1Fe70tGuvc9fciZLptSDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3161.namprd18.prod.outlook.com (10.255.172.90) by
 DM6PR18MB2604.namprd18.prod.outlook.com (20.179.106.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Thu, 16 Jan 2020 15:45:31 +0000
Received: from DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9]) by DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9%6]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 15:45:31 +0000
Received: from [IPv6:2620:113:8044:4009:ffff:ffff:ffff:fff5]
 (2620:113:8044:4009:ffff:ffff:ffff:fff5) by
 BY5PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:180::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.12 via Frontend
 Transport; Thu, 16 Jan 2020 15:45:30 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: negnowait test for smb2
Thread-Topic: negnowait test for smb2
Thread-Index: AQHVzIP7F9v+COK0xEiYBpwmRFJ6ow==
Date: Thu, 16 Jan 2020 15:45:30 +0000
Message-ID: <fc2075c1-a01a-91e3-32f4-af13496f0c81@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:113:8044:4009:ffff:ffff:ffff:fff5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c005357b-13fd-4290-10d8-08d79a9b1dc3
x-ms-traffictypediagnostic: DM6PR18MB2604:
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AgdzDQVL0AGKVzfqc6m5fk8RM6Qi6yxQzd6Eaoo25ja78KM6UNBQjGTR3U8J2RYBV5viNzJ45WnzQw+B6K5bGg4CAlZM8ORswoLYNtY+0gKuF+sGyt18hhzSKPaJvAOhYOSzu7+GcFfeBENo+r/N750Z+iHgGMLsf/wY6FJSM6IF615Kl705DkzLD87YfKGkctSNlhQ2+g6AWoqwccCtwqNbsK+Kg4VK4+uZ9PpcrlEdud/EVfDRomPkDACun9Mg+RHEO4H1HDcQW528c5PE8zUsn5wHDH+LUoaPQjJ0r/9PZgMlgiwYv+EMsKW6SdjIvkU3tgiTFYfun8GtfMyw6aOPpFHc1XvlqTcCuPcZWXMz7v31HWkW1L0N5MzXOWBh5HRC8H6Rg1vvcpqu4qREGOxTCqBZwSS2N7U8Qcp3lfubvhcZLbs5XeioYOQAGKZyw40DVw7qyfxubvRe1lnRxz/UipA0F47SeWQbubYavKk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c005357b-13fd-4290-10d8-08d79a9b1dc3
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXefWaH923gk30RmepDitmpaa7jgwrf1SRWcSv61er54pJthIKmrzzaHcROESPAYUNDg0nzK5WEJotoFk6e+Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2604
X-OriginatorOrg: suse.com
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SSBjb252ZXJ0ZWQgdGhlIGJhc2UubmVnbm93YWl0IHRlc3QgdG8gc21iMiwgYnV0IGl0IHNlZW1z
IHRoYXQgdGhpcyB0ZXN0IGlzIG1lYW5pbmdsZXNzIGluIHNtYjIuIFRoZSBzZXJ2ZXIgbmV2ZXIg
c2VlbXMgdG8gZ3JhbnQgbW9yZSB0aGFuIDEgY3JlZGl0IGR1cmluZyBhIG5lZ290aWF0ZSwgc28g
d2UgYWxtb3N0IGltbWVkaWF0ZWx5IHJ1biBvdXQgb2YgY3JlZGl0cyBhbmQgYnJlYWsgZnJvbSB0
aGUgbG9vcC4NCg0KSXQgc2VlbXMgdG8gbWUgdGhhdCBJIHNob3VsZCBqdXN0IGlnbm9yZSB0aGlz
IG9sZCB0ZXN0IGFuZCBtb3ZlIG9uLiBEb2VzIGFueW9uZSBkaXNhZ3JlZT8gTWF5YmUgSSBjb3Vs
ZCBydW4gdGhpcyBkaWZmZXJlbnRseSBzb21laG93Pw0KDQpNeSBXSVAgYnJhbmNoIGlzIGhlcmU6
DQoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL2RldmVsL3NhbWJhL3RyZWUvZG11bGRl
cl9zbWIyX25lZ25vd2FpdA0KDQotLQ0KDQpEYXZpZCBNdWxkZXINCkxhYnMgU29mdHdhcmUgRW5n
aW5lZXIsIFNhbWJhDQpTVVNFDQoxODAwIE5vdmVsbCBQbGFjZQ0KUHJvdm8sIFVUIDg0NjA2DQoo
UCkrMSA4MDEuODYxLjY1NzENCmRtdWxkZXJAc3VzZS5jb208bWFpbHRvOmRtdWxkZXJAc3VzZS5j
b20+DQpbaHR0cHM6Ly93d3cuc3VzZS5jb20vZW1haWwvaW1nLzIwMTYvZW1haWxfc2lnbmF0dXJl
X3N1c2UucG5nXTxodHRwOi8vd3d3LnN1c2UuY29tLz4NCg==
