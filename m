Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A6FB3C8
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 16:34:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1QzykOdpWpy8dMCN+D7FUMAugatdx/HaqUPD7gLUq6U=; b=W62XqtmvhJhd77Ow1I5IBIiprE
	jqGQP6AyeRpbzNeAtHIAd8Kazhku93bj0kjkvkoEO4uucvXjWzEkO2dHPgpl4OYyUxgkJBLseZROK
	KnZXj6cO6vprmesnDTk39aRI/oi5Fg1HQTkPAkHqA57TUSmT41x7ujEtzxKbTIHXeuKjFkkyntETR
	49wGy22cTPxAMr2pTkNIcX6bzItxd3XVTxtAGGuAnLJadFqPfcz6iavfpidFi8JsqYsnAaHGbFWJK
	sC799fXjmyxHyjAp5s+/Vx7czdZq4l+BhWcm6Fox6rjp3hv1soQQqK5G6n9tjrkKQl3G9Vt8Ico/k
	p5k31+wA==;
Received: from localhost ([::1]:19366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUueN-000Bo5-Pm; Wed, 13 Nov 2019 15:33:43 +0000
Received: from m9a0003g.houston.softwaregrp.com ([15.124.64.68]:34631) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iUueI-000Bnt-RA
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 15:33:41 +0000
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Wed, 13 Nov 2019 15:32:59 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 13 Nov 2019 15:23:45 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 13 Nov 2019 15:23:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNC1uM+OY+5XrPPzjcmE9IlxsinAGRUC1IFjkahFWFMTuW0NuU3EBZ6L7VSeJZ3j7hJcZ51Y+9gSo7iS1wE1vy7nTjBgxvxTZT58txbu/9zBdxsP5bOzwieP54FcWYh414KjbELRy9cnUc9xWQw+ZgTFXFmP6mWK/vP4PYEYYPTD9MDlvo3I/LrZfazgbUH1wXipdpH75zOFvwf6hVgWKfgC2O3tQY3ftzhPO5b+1+5nWqG/oGGK+2pppD17kaL8yZHIMoSAr4FVSlTIK7KfK6tOfm7Q7UQH6g+gZv7lAwpxprqCw2QEI4+JOLc6jIHFPHacYcPcezEvu9NXWMw2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QzykOdpWpy8dMCN+D7FUMAugatdx/HaqUPD7gLUq6U=;
 b=O69bZ0bo/Bj+Rs2wQUua7BVUh3Q7Zp6DGfRWN73Is8oug7W5uNO8wtZr/7VhKsKAJXVbbB2XRTTerQT5OmvdUCy1Xik0vqF8aeP/eOFoXvH5YqOZsZN+8hc/4YIuCmSMksw7t3ObWCQPU3gSIoLVgNjUP7GCjyxFybiwfSjDbNv8QzieZd/N3nzQuJ9phGpo/TkmjdhiXTiYPoz6NPYD2cnQy1yUFTY5OSMsK5uZ6qXQHfy140VEAAn65/YXMOyOgkco9z2bPETI6fdPsDD2108Ut11pOlMPGjjXl9jB2ZzA6NQk8kLvLjFHvBqd3pWyeaZcbBoFJDK0JvdHafVjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.105.79) by
 DM6PR18MB3212.namprd18.prod.outlook.com (10.255.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 15:23:44 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6%5]) with mapi id 15.20.2408.024; Wed, 13 Nov 2019
 15:23:44 +0000
To: Rowland penny <rpenny@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: RFC: Add some functionality to net ads changetrustpw
Thread-Topic: RFC: Add some functionality to net ads changetrustpw
Thread-Index: AQHVmi5eYhhxmiZA5Uef7zHFUzBZG6eJMyeAgAAFIQA=
Date: Wed, 13 Nov 2019 15:23:43 +0000
Message-ID: <6974328a-3d55-9f1e-0e37-ef5e45035a54@suse.com>
References: <aa05a22c-1fae-b4e0-c194-88f8609c0307@suse.com>
 <700e8c5e-9fb7-c0e6-75ff-7c82d112864e@samba.org>
In-Reply-To: <700e8c5e-9fb7-c0e6-75ff-7c82d112864e@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.76.44.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9889b58f-9d51-46ff-04bf-08d7684d785d
x-ms-traffictypediagnostic: DM6PR18MB3212:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YT8FAqQuCoCwcQMA8yNuEQTa23/shrVWbjUVm+Ouk3fGyj9IrURImyiZbPDuzXqm7odgB+3ZGSl4R8ok4UoIwTe75w4fjE+MjCQKz5SdfBjzbJG52bCbGphKicKYLex67InMO2PpVL4SCoV912065Y4Rz8fsZhmHt5o44pteMlY8JT/cs5Y/LVLZm/d9MoGKIrUTtosamP0GhNxiD0TBPA+PnNXxQQ+L3RL3359QqR72WgiVBJh7KY8Y8wZhBX5hRVi/QGU83NouXKFcJcAHbnG4dT7ZXMU3f4CCvJ8JfLy9uivbxaksZ0f44jSZdC62OPG0ied5Y2FNdC9jLBzgtoci/9LeamwSP6ocPCEnTlpCaUec2IAN/0Bon4/qn1J51AkTy0IqucOj+bgLlpFamHGE5Nuh8yat7wZwPymaXYvYtXc1/cwwc/p/1Z8AZC0t
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2B4BA6BA063FF4DA84F6C815BBB096A@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9889b58f-9d51-46ff-04bf-08d7684d785d
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jm+rEaRg/r2qFpwR+XIdQPqdDXeHn9glvYefmN51935B4+r0dJj8QL3njerJ100o0YjmaO30lwM+WrQSUW3E0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3212
X-OriginatorOrg: suse.com
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <NoPower@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

DQpPbiAxMy8xMS8yMDE5IDE1OjA1LCBSb3dsYW5kIHBlbm55IHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IE9uIDEzLzExLzIwMTkgMTQ6MjYsIE5vZWwgUG93ZXIgdmlhIHNhbWJhLXRlY2hu
aWNhbCB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEkgaGF2ZSBhIHBhdGNoIGhlcmUgcmVzdWx0aW5n
IGZyb20gYSBjdXN0b21lciByZXF1ZXN0IHdoZXJlIHRoZXkgd2lzaCB0bw0KPj4gYmUgYWJsZSB0
byBwZXJpb2RpY2FsbHkgcnVuIGEgY29tbWFuZCB0byB0cnVzdCBwdyBhZnRlciBhIG51bWJlciBv
ZiBkYXlzDQo+PiBoYXMgZXhwaXJlZCAoc28gc29tZXRoaW5nIHRoZXkgY2FuIHJ1biBpbiBjcm9u
IGpvYikgVGhlIHdvdWxkIGJlDQo+PiBzb21ldGhpbmcgc2ltaWxhciB0byB3aGF0IHdpbmJpbmQg
ZG9lcyB3aXRoICdtYWNoaW5lIHBhc3N3b3JkIHRpbWVvdXQnDQo+PiBwYXJhbS4gU28gdGhpcyBp
cyBzb21ldGhpbmcgdG8gYmUgdXNlZCB3aGVuIHdpbmJpbmQgaXNuJ3QgdXNlZC4NCj4NCj4gTm93
IEkgYW0gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgaGVyZSwgYnV0IGRvZXNuJ3Qga2VyYmVy
b3MgdXNlIHRoZQ0KPiBtYWNoaW5lIHBhc3N3b3JkICh3aGljaCBtZWFucyBhZHMpIGFuZCB0aGlz
IG1lYW5zIHdpbmJpbmQgbXVzdCBiZQ0KPiBydW5uaW5nIChhdCBsZWFzdCBmcm9tIDQuOC4wKQ0K
DQpJIGRvbid0IHJlY2FsbCB3aGljaCBzYW1iYSB2ZXJzaW9uIHRoaXMgd2FzIHJlcG9ydGVkIGFn
YWluc3QsIGJ1dCB0aGVuDQphZ2FpbiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIGFib3V0IGlmIGl0
IGlzbid0IHBvc3NpYmxlIHRvIHJ1biB3aXRob3V0DQp3aW5iaW5kIGluIG1vcmUgcmVjZW50IHZl
cnNpb25zLg0KDQpBbHNvIEkgYmVsaWV2ZSBpdCdzIHBvc3NpYmxlIHRvIHJ1biB3aXRoIHNzc2Qg
YW5kIG5vIHdpbmJpbmQNCg0KQW5kIHRoZSAnbWFjaGluZSBwYXNzd29yZCB0aW1lb3V0JyB3b3Jr
cyBvbmx5IHdpdGggYSBzdWJzZXQgb2YgdGhlDQona2VyYmVyb3MgbWV0aG9kJyB2YWx1ZXMNCg0K
Tm9lbA0KDQo=

