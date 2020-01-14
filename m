Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D7E13ADF9
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 16:48:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nEI55wL87fRJ2UVcUzq2S4sH+AeS7hM9/YpdgfLoQ3M=; b=A0z6/TEcN3ohuNGnCHqDqdbsQ/
	DA+vX9QU6tK8lMds7nXVG8hezzJcgBFBRrkroR6HZUk8qad5raEyacBnag1+VgZ2DAJjOifNPamZQ
	ttkusICNL62nTRoK1eM/mE2ALK3kockvxnUN7QUfdZHBNMbYHf2GVoDmXblkpuNBeIIEOeY3/BbMa
	krNOg+Evdr6Kv2+j0aD/YjoxWCzlv0eS6fuUAqmXM7VfXDCnDiIF2ZGqyh41C2ORHVSBWw28SX3dn
	T/9RDeUdrzz0CwjVwIbhEhJILhoRf/mA0kORUXtSUhOb4E3UZPGUry+B4JuVgOHYJ8LbVHul7xnL0
	3IM9ObHw==;
Received: from localhost ([::1]:43604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irOPX-003OMT-Qy; Tue, 14 Jan 2020 15:47:19 +0000
Received: from m9a0013g.houston.softwaregrp.com ([15.124.64.91]:34508) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1irOPQ-003OMM-0s
 for samba-technical@lists.samba.org; Tue, 14 Jan 2020 15:47:16 +0000
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 14 Jan 2020 15:45:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 14 Jan 2020 15:09:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 14 Jan 2020 15:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKYQw0PcHkTCFhKrsJ630jaKewvcNJ+pxq6iYQWNxmT0ehXVrNC4zjRfuy/LocoSncxOOsnPisp+MboxW35QDzNlFo+h6rsKAm2Ix58koPyN+S75ndPdG2p5rY/lFnB1oC+rohwP0xKrV6nYsGDj5l1N/oaYPdg8wqL82W2jVCrgA5QnQLJfESQXLExIao32Lq9DwSFQVl7demcK1ePfhLCUzo75LTO9dZn1CibNytbXBpizRvFzJv/M1ByDCCG6BZvQXCMTPg99iJ5Am4uERC/RXLbJE7Z7rHVP5QCFwMG65iaIVxreGdmbEmx+2Q6PVQ2V3g8MyhLXerIakwMxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5rAHJrlPq/zEmq59o4kyBt/aHRRB0VTOIm1Waibb+Q=;
 b=E4dBI6CzpLE+spJG2PhxTvv3hmvl0EvdpC8I6nGBL2SGFo3EA0EOu67RnA7/dCr1KTpM+DBgXwhr1ovc64hbo6Xbg7giJhTlfVkp7ZUf2jrf8ebUgOD4xXSmj84LbX7JkoOl7VnCJjeCJe9KadcYo38bUcKlJ/al10T++jb975VPvSU8LKkZjT2O5HWsXVpgJjmr3pvkb08aS1Tz7rs6uR9HYoZ1WLLxyy832CHtPGd51aibudpe/27kWt7BhnMx+EVG76m9TOBP47z1E0Pw1xKa3eRt38Ao/fIOebe+/raJ7GbYFTsquCUIkDleYNNmrAQX0gTDOidw55w1ewoxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3161.namprd18.prod.outlook.com (10.255.172.90) by
 DM6PR18MB3324.namprd18.prod.outlook.com (10.255.76.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 15:09:26 +0000
Received: from DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9]) by DM6PR18MB3161.namprd18.prod.outlook.com
 ([fe80::7db1:9ede:a62a:c7a9%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 15:09:25 +0000
Received: from [192.168.1.10] (74.122.77.94) by
 BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.13 via Frontend
 Transport; Tue, 14 Jan 2020 15:09:25 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: SMB2 Write truncate
Thread-Topic: SMB2 Write truncate
Thread-Index: AQHVymNtgk8KnRXXf02IdER3VeVXKafpSMEAgAD7qwA=
Date: Tue, 14 Jan 2020 15:09:25 +0000
Message-ID: <b9d6fbba-dea4-e88f-3d80-c784e073e844@suse.com>
References: <fa364f9a-b16e-9142-177e-a98b6bf8ce0d@suse.com>
 <20200114000836.GA157517@jra4>
In-Reply-To: <20200114000836.GA157517@jra4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=david.mulder@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [74.122.77.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36f10a08-3f15-4f9e-cf74-08d79903be77
x-ms-traffictypediagnostic: DM6PR18MB3324:
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 04MqHg/WJemxujO+jpCSNLdyiE/PCCanHju4LfF4R+dRM3g78h7+uVLOTAuDg0S+5Q30R79wLR58lBcmZZZ36PfsMtMUfwt6CYTaWHGvFwKnSCeYyKirU61BFyrb9mUN8rzing6jK2ZCDBx3dPrhFjAUPHc9Jz8IzMoyil2oBy7BMrzbe0w7BTs5+xFOZ1vNHqNvkGujNgHqzNB6Mr4PO0nNjKNxVMFH3T+qEiaG1/51EqHXGjmdfjliUsLLBr0LAPHhGWWurn0JW4r1UDOHAD9L0BTH8/KMs6wRTkz2y+4k6zjoPwdqM6i/VTo0vZBTWMURl62kp6+UkOJ0XIxxCK3qSHo6Twbc4FmupVB4XQbSAnJ3BNLAAai8ydVLnGXC9oOtvuqvi4h7zxBmKF5g9WZyg6GPgJxJNdHh2jARSQMmg5cxP2/Xkyf3HBVUmQ3P4Goaqp0Iwe4NtG4tz9NSSEPDm7wZ2MfjcXIkGt4Y7RSqLwZ1WGZZNX8GZB7fOiYzOMraAC44DJ67Plw8fpcpEw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f10a08-3f15-4f9e-cf74-08d79903be77
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EScVh+bx61K/CmiMz/7+4ucxaZB0B8Ka0f/xDqWBoOt5+ek25e2pl75BBFm6HSaRfFUbLgEstfKM3213QG5gcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3324
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VG8gdHJ1bmNhdGUgaW4gU01CMiB5b3UgY2FuIGNhbGwgc2V0aW5mbyBvbiBhIGhhbmRsZQ0Kd2l0
aCBTTUJfRklMRV9FTkRfT0ZfRklMRV9JTkZPUk1BVElPTi4NCg0KQWgsIEkgbWlzc2VkIHRoYXQg
U0VUX0lORk8gY2FsbC4gVGhhbmtzIEplcmVteSBhbmQgUm9ubmllLg0KDQotLQ0KDQpEYXZpZCBN
dWxkZXINCkxhYnMgU29mdHdhcmUgRW5naW5lZXIsIFNhbWJhDQpTVVNFDQoxODAwIE5vdmVsbCBQ
bGFjZQ0KUHJvdm8sIFVUIDg0NjA2DQooUCkrMSA4MDEuODYxLjY1NzENCmRtdWxkZXJAc3VzZS5j
b208bWFpbHRvOmRtdWxkZXJAc3VzZS5jb20+DQpbaHR0cHM6Ly93d3cuc3VzZS5jb20vZW1haWwv
aW1nLzIwMTYvZW1haWxfc2lnbmF0dXJlX3N1c2UucG5nXTxodHRwOi8vd3d3LnN1c2UuY29tLz4N
Cg==
