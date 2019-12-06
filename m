Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99940114D77
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 09:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=05kOKfczLY6YlVBtG9PLmSOsqoJfn1BNWHZT2nOkO5o=; b=hG0Er6EzqpiWI60vfX7mPhxKSM
	EHK3Kj4B3TdrS8h54k6fyVQAA10Y40K6r++ICufOsAeKd9kua579Aj42h+5y7IGAUOKVSydh0rchz
	OKUw86Tas7+hi3qPxMKu7/Wn91okjnsnXEjnmL6TF/EmiLQ/snHix4o3FBgUtAEsBV1f1eG2OLCNr
	UZ8uJCzNPOD2hD+jn33k7p2TnDNFIitEYDoKbxkhKh5K1XC0m842bG8jF0gWBs16xkgI2UZiDIk3d
	vY7itsgM/0g3dl/3Dw/bzJNHzXRuroP4psJjShavoDJJk6M+8kyQzzMcwvul9IkCEbnG/ORJe+008
	CwO1v5hA==;
Received: from localhost ([::1]:60382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id8ov-006NXv-DP; Fri, 06 Dec 2019 08:18:37 +0000
Received: from m9a0002g.houston.softwaregrp.com ([15.124.64.67]:60229) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1id8oq-006NXU-UT
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 08:18:35 +0000
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Fri,  6 Dec 2019 08:17:53 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 6 Dec 2019 08:15:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 6 Dec 2019 08:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljqzVbAaF52XKlYURyOkvbYThLOrg9tXBDSZwC9r5qdWH7xDklXU8YNlDIYw9tKjGb01XOtjnL6uFGZkcE6VxtCXLeJ/W8BIM9gSGwKnNIl2lz10aT5Dci/zebhy7MjPMpfDJ2D2+ElvNgGBI+tinkngqqQLLzu03HcIf3NZJTRJL7jOD2Dtg34pWwb1kNPv1bvEU4rId3dLa3TBGQx1xag/Coh4knFcka1TIVHy7YxWuXhKZGzjN7ElSHBtIs6NpphnTTN0qcFhrniqNHOL5F/4wHROgtNdXjQAlbivZAuanUsY1aYnXC8sbvOh12Sopp7qUhRI6Za6ItYrbf8WoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05kOKfczLY6YlVBtG9PLmSOsqoJfn1BNWHZT2nOkO5o=;
 b=IwhhFbv+/McDinyiJJvEUQGu99Zv5h6RyBfwKXHaUnCAT861p5RGXJjrv7/Ml6r8djKN0zrc+VOEIGwbNWjmUjH3M4QRJM/oLZZC/Kpb0jsuB6nzfif7J9npEO+uRr6QMQSwkjuUgJlb9zVmdU1l3ZvEtOI7ivsGMI946+r3bzc/U01erBGME+kVfloAprAXgolB2KfENdAn8Uv2FpyxyO2KLM7io6z2voTEXjdWpRTuTU5vZ0CFvUyMynAWpq08BykmzzJtcViPdfh2JUEuVt7+9xiVYbEuA5qVHqoMeUJkmArtV8IVZb8bkcFEisnqrGKyQMd0GjybWWSa2sry7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.71.218) by
 DM6PR18MB2890.namprd18.prod.outlook.com (20.179.49.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Fri, 6 Dec 2019 08:15:29 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db%6]) with mapi id 15.20.2516.013; Fri, 6 Dec 2019
 08:15:29 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: creating certificates for dc, user etc for samba tests
Thread-Topic: creating certificates for dc, user etc for samba tests
Thread-Index: AQHVrA1SBi1NkoR2Nk6XE0eutegUWA==
Date: Fri, 6 Dec 2019 08:15:29 +0000
Message-ID: <5f6a93e3-ff99-6a5e-9465-9249bbd8aeb4@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [51.37.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9712a94-0917-470e-989f-08d77a2474cf
x-ms-traffictypediagnostic: DM6PR18MB2890:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XS32WNIgz+NEmYdbrV7NW10e4oO2pU1jLE8wHMAOdGSyG6kH9AmlAWtQZL2n+mFgohHaO2syJrh6WCcchhf/PlsFy/zR6Bg4ds2+lgt2NFVYrPI6ZEMQ1alUvm5LllmkiinhnTz1dh1PwJOaSRPP35mw/2FfF2QQHrYicUdffC15vQ6t/RFJwUzs4opzVerdJ/thWBK8RwQGWlCss4jPCtzoKI6+CorfYRM7mFBODtrh0D0oa+yvP3pd1Zar8QK3gj0LneSrrFZKiz8zFLGqGVtvpLKTAJv72awUCPanOna8pawdO+NOrCSlplHHeliLFn694BUYB5+Z2WIBqcQVEUEDVwieKk+GSU9ugLLAQ2R4G+8ES3zVublnsQl81pSugjnRiSRJcnnZ0cydSnZz024usDqc3kNNN0dsCegNN9HOLjkObpz6Pn1+pmJuxjIW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACBCE229A76E8B41A620380CB90B5067@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e9712a94-0917-470e-989f-08d77a2474cf
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Mwn0AB0RdCrvLujMQrLTu55Ga1P0cr/ftCjKqs6tzc+Hu00Nkd7si60nf50qIweQo2YLAMPB0Iflo5ax2e/Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2890
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

SGVscCEhDQoNCkRvZXMgYW55b25lIGtub3cgYW55dGhpbmcgYWJvdXQgb3BlbnNzbCAmIGdlbmVy
YXRpbmcgY2VydHMgPw0KDQpJIHRyaWVkIHRvIGZvbGxvdyB0aGUgaW5zdHJ1Y3Rpb25zIGF0DQpz
ZWxmdGVzdC9tYW5hZ2UtY2EvbWFuYWdlLUNBLXNhbWJhLmV4YW1wbGUuY29tLnNoDQoNCmUuZy4N
Cg0KwqAgLi9tYW5hZ2UtY2Euc2ggbWFuYWdlLUNBLXNhbWJhLmV4YW1wbGUuY29tLmNuZiBjcmVh
dGVfZGMNCnRlc3RkYy5zYW1iYS5leGFtcGxlLmNvbSAwMTIzNDU2Nzg5QUJDREVGDQoNCsKgIHBy
b2JsZW0gY3JlYXRpbmcgb2JqZWN0IHNjYXJkTG9naW49MS4zLjYuMS40LjEuMzExLjIwLjIuMg0K
DQrCoCAxNDAwODc0MDM5NDc4NDA6ZXJyb3I6MDgwNjQwNjY6b2JqZWN0IGlkZW50aWZpZXINCnJv
dXRpbmVzOk9CSl9jcmVhdGU6b2lkIGV4aXN0czpjcnlwdG8vb2JqZWN0cy9vYmpfZGF0LmM6NzA4
Og0KDQpzb21lIGdvb2dsZSByZXN1bHRzIHNlZW1lZCB0byBpbmRpY2F0ZSB0aGlzIGVycm9yIHJl
c3VsdHMgZnJvbSBjaGFuZ2VzDQppbiBvcGVuc3NsIHdoZXJlIHNvbWUgYXR0cmlidXRlcyBhcmUg
bm93IGluY2x1ZGVkIGJ5IGRlZmF1bHQgKGlpdWMpIHNvIEkNCmNvbW1lbnRlZCBvdXQgdGhhdCBh
dHRyaWJ1dGUgaW4NCm1hbmFnZS1jYS50ZW1wbGF0ZXMuZC9vcGVuc3NsLUJBU0UtdGVtcGxhdGUu
Y25mDQoNCnRoZW4gdGhlIHNhbWUgZXJyb3IgZm9yIG1zVVBOICYgbXNLREMgKHNvIEkgZGlkIHRo
ZSBzYW1lKQ0KDQp0aGUgcHJvY2VzcyBnZXRzIGZ1cnRoZXIgYnV0IGVycm9yIG91dCB3aXRoDQoN
ClVzaW5nIGNvbmZpZ3VyYXRpb24gZnJvbQ0KQ0Etc2FtYmEuZXhhbXBsZS5jb20vRENzL3Rlc3Rk
Yy5zYW1iYS5leGFtcGxlLmNvbS9EQy10ZXN0ZGMuc2FtYmEuZXhhbXBsZS5jb20tUzA2LW9wZW5z
c2wuY25mDQpFbnRlciBwYXNzIHBocmFzZSBmb3INCkNBLXNhbWJhLmV4YW1wbGUuY29tL1ByaXZh
dGUvQ0Etc2FtYmEuZXhhbXBsZS5jb20tcHJpdmF0ZS1rZXkucGVtOg0KRXJyb3IgTG9hZGluZyBl
eHRlbnNpb24gc2VjdGlvbiB0ZW1wbGF0ZV94NTA5X2V4dGVuc2lvbnMNCjE0MDE4OTgzODAzMDY1
NjplcnJvcjowRTA2RDA2Qzpjb25maWd1cmF0aW9uIGZpbGUNCnJvdXRpbmVzOk5DT05GX2dldF9z
dHJpbmc6bm8NCnZhbHVlOmNyeXB0by9jb25mL2NvbmZfbGliLmM6Mjc1Omdyb3VwPUNBX2RlZmF1
bHQgbmFtZT1lbWFpbF9pbl9kbg0KMTQwMTg5ODM4MDMwNjU2OmVycm9yOjBEMDY0MDdBOmFzbjEg
ZW5jb2RpbmcNCnJvdXRpbmVzOmEyZF9BU04xX09CSkVDVDpmaXJzdCBudW0gdG9vIGxhcmdlOmNy
eXB0by9hc24xL2Ffb2JqZWN0LmM6NzI6DQoxNDAxODk4MzgwMzA2NTY6ZXJyb3I6MjIwNjcwNkU6
WDUwOSBWMw0Kcm91dGluZXM6djJpX0VYVEVOREVEX0tFWV9VU0FHRTppbnZhbGlkIG9iamVjdA0K
aWRlbnRpZmllcjpjcnlwdG8veDUwOXYzL3YzX2V4dGt1LmM6OTM6c2VjdGlvbjosbmFtZTptc0tE
Qyx2YWx1ZToNCjE0MDE4OTgzODAzMDY1NjplcnJvcjoyMjA5ODA4MDpYNTA5IFYzIHJvdXRpbmVz
Olg1MDlWM19FWFRfbmNvbmY6ZXJyb3INCmluIGV4dGVuc2lvbjpjcnlwdG8veDUwOXYzL3YzX2Nv
bmYuYzo0NzpuYW1lPWV4dGVuZGVkS2V5VXNhZ2UsDQp2YWx1ZT1jbGllbnRBdXRoLHNlcnZlckF1
dGgsbXNLREMNCg0Kc28gSSBhbSBzdHVtcHRlZCBhcyBJIGFtIHRvdGFsbHkgY2x1ZWxlc3MgYWJv
dXQgdGhlc2UgZmlsZXMgYW5kIHRoZWlyDQpjb250ZW50LCB0aGVyZSBzZWVtcyBwbGVudHkgb2Yg
Z29vZ2xlIGhpdHMgYWJvdXQgc2ltaWxhciBlcnJvcnMgYnV0IEkNCmRvbid0IGtub3cgZW5vdWdo
IHRvIGludGVycHJldCB0aGVtLCBjYW4gYW55b25lIGhlbHAgPz8NCg0KTm9lbA0KDQoNCg==

