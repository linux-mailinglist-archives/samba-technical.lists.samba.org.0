Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF0C7BCEA
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 11:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hv4aNK0DjQ9nZRi9SaY0bma0jLcE1afzw5ZtjGNeze4=; b=EerykHj4+eV1Yjl+U8Vf7CAEcS
	hgKnSkQ7dR29BxIXHQLVC3dxsWxkdLtPR8L2n3oTdPbV7jiVo8aloFDXss3ZSYjbKaqriQRVeoGMt
	h/Aoxf93xjOYl0i7Yb1j2F0WLeKOBrQHM97obPa2kdC62K+e+fEHymbNwSYCrnuZLezhbS1+QfeC7
	O2zhTNxadedywxEbDbywJYfm3QlhhvLkJ9lyVLt+mHltDYVCvRlTiH+Mp9ofpfn2TlxbhRlXJphSN
	t8f1ug+r188nXOeC5T06Uo70oSGk+6Osr/Gtzfy064EcH8zri/iOYBnwr5aoDUWith1ZAOdd7EWKI
	eyCHorMg==;
Received: from localhost ([::1]:31252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hskpL-001AbM-LJ; Wed, 31 Jul 2019 09:23:19 +0000
Received: from m4a0041g.houston.softwaregrp.com ([15.124.2.87]:46801) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hskpF-001AbF-I4
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 09:23:17 +0000
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Wed, 31 Jul 2019 09:23:10 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 08:35:15 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 08:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ31vW2SQLWwRKJ6Ie87dUIq1k06QaPD//d/0sopbkwYEK1USgMLHD9g+KXOkEv2+3mBvBmUUbkxjYel+K6XsshR6vaRPEoWFkh9Ks8gVreF2qgGYmStlNYewlq4fr5zV2P4u5yQMoSY8sfzamFAYvREXIAdVuXo/WtzqRCDqmzPgoE8evOBRdxpB1x7H8lRE3sfUilwjdR8mj6cN88xT+PaO1NIJrSqpiEgV4JTu72mKWuxTE71MXg9sN+6DfHShfeDmBEjnMLqTliQ0tO8Qsb3EtA2LqANM8P9zlAeTvjicZ+RW+MtRF2h45YZC3lGu9Uv6UmXNnVOBl4GOseuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv4aNK0DjQ9nZRi9SaY0bma0jLcE1afzw5ZtjGNeze4=;
 b=WET+hIWfs7Y0zxtOcsLl1HGm+J6IyWyfgSZbr/Ooo2aN981FKHOZJB/wfSLXoudlsNZxHxUNtXhX7aPX/6hoQhfT+J0Q/ZPgwHAUDfWWsz4EPLaFY/jixYROBl7L2OQ925pMhz+hRkLnCuUmJMQZhraFpn+3voIxZmcqq4bQZ0DSHrycrw8f2UZLdF/9+nCzfPa0yfkxMWm0r/KxrZZPRqhhJmhZi1ik9qDS2GFIGyg1I+X3DrDWGYH0nJS+QmM5ie4/cYIvFmroXXaNdjXKcg1IGBL912MXAsDSG5IVpA7HTbty58j0lrtuZSe/XX+VZe5c1F0zLSM8450JzRYyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3267.namprd18.prod.outlook.com (10.255.138.24) by
 BY5PR18MB3410.namprd18.prod.outlook.com (10.255.137.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Wed, 31 Jul 2019 08:35:14 +0000
Received: from BY5PR18MB3267.namprd18.prod.outlook.com
 ([fe80::8877:5f44:3f1b:fdd7]) by BY5PR18MB3267.namprd18.prod.outlook.com
 ([fe80::8877:5f44:3f1b:fdd7%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 08:35:14 +0000
To: Noel Power <NoPower@suse.com>, samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: RFC --picky-developer (for developer builds)
Thread-Topic: RFC --picky-developer (for developer builds)
Thread-Index: AQHVRfLO8KMdRYThTUuLY0ugiHTshqbkacqA
Date: Wed, 31 Jul 2019 08:35:14 +0000
Message-ID: <ab16fa62-dbef-9281-da4d-6ae2e6c9d1db@suse.com>
References: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
In-Reply-To: <82e23c37-0bdc-e35a-373c-71b0591becd9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.77.40.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6579f198-bda1-4912-77a8-08d71592020d
x-ms-traffictypediagnostic: BY5PR18MB3410:
x-ms-exchange-purlcount: 3
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y7eLuPXsQx/VdHRbUWWORo449BFB6QX72CROMw453GdcGqJ/414mrTgMtngFiqilWwd0HHFQ2NnIjEtBeojZbjNumsV9juKyW56z9KwNQ8OI1KXkOqNCMY8AnvyGRSvoHSJzyLUb9M6Gp4ngXLMVkKu5CTZd4fHYGN/6tmLJFavdGf4bHpdOgpl0RDu7N3Cd08XLCuPg2aw18OHLrgfYdwwzeF/0Cz03Z4pi4j2afL4w4kCs6ownhM73N4LPQOeWyTCyn2vRzS3oQrvAMJuvTi8QTrCEyZV4lOKohsE3uPfhiB3dBsHEskK34K8dKGKZr2yohTVGWojL1D1lhEepG/U3mr4yw9cbT4mefzSTq4c/VePyD6zzx/Acn5QdVknewouj+cUU/EKP1hWFuKji3B+X/fBk0byywOfxq/EQdPU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79363254E9CEE8488F89620E213FD81E@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579f198-bda1-4912-77a8-08d71592020d
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoPower@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3410
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

DQpPbiAyOS8wNy8yMDE5IDEwOjQ4LCBOb2VsIFBvd2VyIHZpYSBzYW1iYS10ZWNobmljYWwgd3Jv
dGU6DQo+IEhpIEFsbCwNCj4NCj4gSSBoYWQgYSBtZXJnZSByZXF1ZXN0IGh0dHBzOi8vZ2l0bGFi
LmNvbS9zYW1iYS10ZWFtL3NhbWJhL21lcmdlX3JlcXVlc3RzLzU5MSAobm93IGNsb3NlZCkgdG8g
ZW5hYmxlIC0tcGlja3ktZGV2ZWxvcGVyIGZvciBkZXZlbG9wZXIgYnVpbGRzLCB0aGlzIHdhcyBh
IHByZXR0eSBsb3cgaW1wYWN0IGNoYW5nZSB0byBtYWtlIGRldmVsb3BlciBidWlsZHMgYnVpbGQg
d2l0aCAnLS0tcGlja3ktZGV2ZWxvcGVyJyBieSBkZWZhdWx0Lg0KPg0KPiBub3RlOiBpdCBtb2Rp
ZmllZCB0aGUgY29uZmlndXJlLmRldmVsb3BlciB3cmFwcGVyIHNjcmlwdCByYXRoZXIgdGhhbiB0
aGUgLS1kZXZlbG9wZXIgb3B0aW9uIGl0c2VsZg0KPg0KPiBNZXR6ZSBob3dldmVyIHBvaW50ZWQg
b3V0IHRoYXQgaGUgaGFkIGFuIG9sZCBicmFuY2ggaGFuZ2luZyBhcm91bmQgdHJ5aW5nIHRvIGFj
aGlldmUgdGhlIHNhbWUgcmVzdWx0IChidXQgSSB0aGluayBhdCB0aGUgdGltZSB0b28gbWFueSB3
YXJuaW5nIGFzIGVycm9ycyBzdGlsbCBleGlzdGVkIGluIHRoZSBjb2RlYmFzZSkNCj4NCj4gTWV0
emUncyBicmFuY2g6DQo+DQo+ICAgYSkgcmVtb3ZlcyB0aGUgJy0tcGlja3ktZGV2ZWxvcGVyJyBv
cHRpb24gYnV0IGluc3RlYWQgbWFrZSB0aGUgLS1kZXZlbG9wZXIgb3B0aW9uIHVzZSB0aGUgc2Ft
ZSBmbGFncyAoaW4gb3RoZXJ3b3JkcyBtYWtlIC0tZGV2ZWxvcGVyIGRvIHRoZSBzYW1lIGEgLS1w
aWNreS1kZXZlbG9wZXIpDQo+DQo+ICAgYikgcmVwbGFjZXMgdGhlICctLXBpY2t5LWRldmVsb3Bl
cicgb3B0aW9uIHdpdGggJy0tZGlzYWJsZS13YXJuaW5ncy1hcy1lcnJvcnMnPGh0dHBzOi8vZ2l0
bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhL21lcmdlX3JlcXVlc3RzLzY2Ny9kaWZmcz9jb21taXRf
aWQ9MzE5NWU0YTU3ZWE3NGZhZTJiODE1MzZiMzI3YzEzMTQ4YjE1MjlmYT4gdG8gYWxsb3cgdG8g
YXZvaWQgLVdlcnJvcg0KPg0KPiBJIHRoaW5rIE1ldHplcycgYXBwcm9hY2ggaXMgYmV0dGVyIGFu
ZCBzbyByZWJhc2VkIGhpcyBicmFuY2gsICAoc2VlIGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10
ZWFtL2RldmVsL3NhbWJhL3BpcGVsaW5lcy83Mjk3NTAwMykNCj4NCj4gU3VyZWx5IGl0J3MgYmV0
dGVyIChmb3IgZGV2ZWxvcGVyIGJ1aWxkcykgdG8gYmUgYXMgJ3BpY2t5JyBhcyBwb3NzaWJsZSBh
bmQgZW5zdXJlIHdlIGtlZXAgcGFzc2luZyB3aXRoIHRoYXQpDQo+DQo+IHdoYXQgZG8gb3RoZXJz
IHRoaW5rPyBJJ20gYWxsIGZvciBtZXJnaW5nIHRoaXMgYnV0IHN1Y2ggYSBjaGFuZ2UgcHJvYmFi
bHkgbmVlZHMgc29tZSB3aWRlciBkaXNjdXNzaW9uL2FncmVlbWVudA0KDQpJZiBJJ20gcmVhZGlu
ZyB0aGUgY29tbWVudHMgZnJvbSBvdGhlcnMgY29ycmVjdGx5IHRoZW4gSSBkb24ndCBzZWUgYW55
DQpvYmplY3Rpb25zIHRvIHB1c2hpbmcgdGhpcyB0byBhdXRvYnVpbGQgcmlnaHQgPw0KDQpQbGVh
c2UgbGV0IG1lIGtub3cgaWYgbm90IDotKSBBbnl3YXksIEknbGwgbm90IGRvIGFueXRoaW5nIGZv
ciBhIGNvdXBsZQ0Kb2YgZGF5cyB0byBsZXQgYW55b25lIGVsc2UgY2hpbWUgaW4gaWYgdGhleSB3
YW50DQoNCnRoYW5rcywNCg0KTm9lbA0KDQo=

