Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2332795
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 06:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=nB9pOcSd+0efKMvhuYRldOmu7osST32jPnZ3hL0iL64=; b=M12oXv13W/v9ChxkbeSuzvj2S0
	h7/j7iEiXDSs4BNe36OJSeyP7p5UE42AJ4mEjXvMSBO5LvQ8YMrS8gkbc2CnynO2hOwIvcnQMafcQ
	6cVQZ8sonYSPC3VYCstdtxl2kPdjU/u27OB+/fpjqwRtLOJaxQi28lRPaqzb/lD4bVUpaw4hQCWkH
	NEkxVBwCtWxBa6hUFJtvHaPL3jbOCFCRODjdzyIcWLlAhrQYEeBDV6UEzGzcPG4srSWvCsBT0J1jN
	dw9eiLwaOGamYH37Y4CW/g7dWHhkuNIUcG9aUZr/tR7T+Z8Bw28x71CZZoAVtMQDgP6RAoKVUgMIE
	Gyz0LUog==;
Received: from localhost ([::1]:59624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXecm-004iov-KK; Mon, 03 Jun 2019 04:31:08 +0000
Received: from mail-eopbgr820132.outbound.protection.outlook.com
 ([40.107.82.132]:35261 helo=NAM01-SN1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXecg-004ioo-6r
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 04:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=miami.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nB9pOcSd+0efKMvhuYRldOmu7osST32jPnZ3hL0iL64=;
 b=NNollLZ31iYTqabEtm4jZsWqZSk3RknzOCMVXVJw2+j4jY462huKt0UXSngIc00gi4Ao1EDwkSWsa/AxOTTadBnqP/8ARDAQyNmqIqzKQmfdSgoyQI5ThkhjRgArJyqGwnQdT6gUCnvPHtNvseSP4GqeMjFeQzQ553vK9bLkwQY=
Received: from MW2PR07MB4059.namprd07.prod.outlook.com (52.132.179.30) by
 MW2PR07MB3931.namprd07.prod.outlook.com (52.132.178.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.20; Mon, 3 Jun 2019 02:56:16 +0000
Received: from MW2PR07MB4059.namprd07.prod.outlook.com
 ([fe80::d5c9:ec4d:8f2d:d0c3]) by MW2PR07MB4059.namprd07.prod.outlook.com
 ([fe80::d5c9:ec4d:8f2d:d0c3%3]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 02:56:16 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
Thread-Topic: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
Thread-Index: AQHVGbZH5mNETOwPaE+A4nWj94aV7KaJPF4A
Date: Mon, 3 Jun 2019 02:56:16 +0000
Message-ID: <2ff36d47-49fb-30b3-f953-53b6364a5949@rsmas.miami.edu>
References: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
In-Reply-To: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jim.brown@miami.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [104.4.177.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6db48da7-ad41-4083-4742-08d6e7cf0bdb
x-ms-traffictypediagnostic: MW2PR07MB3931:
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OXXBi3rRFqvmL9cIit9yOfW8JSbEcYcYmR9XPscWu17ofWITXQ2ffcQi+hIcEg43SLgdZDiDfJxLq0VouMjoNXGNjl4cjHylPDqPXbS+FpVOAuisZudGzRvpf0xgr0GDkhsmwwF14jOFPFhVql/z31SRf4/SwEqK593x7q8qMn8Ja1e8e6w2Y0amBlKPKwrzB2Jp5MOGEqwtZSbpzdABgkgt//V8B0IMJ/V5MdrKOLAn+WQErRtgLFB3g0OEzK6LU/5wiBJT2wpSBgvd8QWq6fjl1xXCKI9wfSkai+vTFPZDu6NGzjqr57EanAHlioa58DBN1A1RShqGkjl+6VuCL1Pzri/1xhSiqW4ttAmgNTT2pzoJ+T2CM5NSPLbgpJscqgrSkdhy9Ero5prF2s/9jomwWNOkV7JjsQtYhBSZmNg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BB67BD3796B1F4B9539752604FA746F@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: rsmas.miami.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db48da7-ad41-4083-4742-08d6e7cf0bdb
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a144b72-f239-42d4-8c0e-6f0f17c48e33
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jim.brown@miami.edu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR07MB3931
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: jim via samba-technical <samba-technical@lists.samba.org>
Reply-To: jim <jim.brown@rsmas.miami.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TWFrZSB0aGUgdGVzdCBleHBsaWNpdCBmb3Igbm9uLWVtcHR5IFBST0NGU19QQVRIOg0KIMKgwqDC
oCBpZiBbICIke1BST0NGU19QQVRIfSIgJiYgLWYgIiRfZiIgXSA7IHRoZW4NCg0KT24gNi8yLzIw
MTkgMTA6NDQgUE0sIFJhZmFlbCBEYXZpZCBUaW5vY28gdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90
ZToNCj4gbmV0LmlwdjQudGNwX3R3X3JlY3ljbGUgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIExpbnV4
IDQuMTIgYnV0LCBzdGlsbCwNCj4gbWFrZXMgc2Vuc2UgdG8gY2hlY2sgaXRzIGV4aXN0ZW5jZS4g
VW5mb3J0dW5hdGVseSwgY3VycmVudCBjaGVjayBkb2VzDQo+IG5vdCB0ZXN0IGZvciB0aGUgcHJv
Y2ZzIGZpbGUgZXhpc3RlbmNlLiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgaXNzdWUuDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IFJhZmFlbCBEYXZpZCBUaW5vY28gPHJhZmFlbGR0aW5vY29AdWJ1bnR1LmNv
bT4NCj4gLS0tDQo+ICAgY3RkYi9jb25maWcvbmZzLWxpbnV4LWtlcm5lbC1jYWxsb3V0IHwgNCAr
Ky0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2N0ZGIvY29uZmlnL25mcy1saW51eC1rZXJuZWwtY2FsbG91dCBi
L2N0ZGIvY29uZmlnL25mcy1saW51eC1rZXJuZWwtY2FsbG91dA0KPiBpbmRleCBkZWY2OWEwNDY0
OS4uNzFkOGVjZjgwNzQgMTAwNzU1DQo+IC0tLSBhL2N0ZGIvY29uZmlnL25mcy1saW51eC1rZXJu
ZWwtY2FsbG91dA0KPiArKysgYi9jdGRiL2NvbmZpZy9uZnMtbGludXgta2VybmVsLWNhbGxvdXQN
Cj4gQEAgLTI4MSw4ICsyODEsOCBAQCBuZnNfc3RhcnR1cCAoKQ0KPiAgICAgICBiYXNpY19zdG9w
ICJuZnMiIHx8IHRydWUNCj4gICAgICAgYmFzaWNfc3RhcnQgIm5mcyINCj4gICAgICAgX2Y9IiR7
UFJPQ0ZTX1BBVEh9L3N5cy9uZXQvaXB2NC90Y3BfdHdfcmVjeWNsZSINCj4gLSAgICBpZiBbICIk
X2YiIF0gOyB0aGVuDQo+IC0JZWNobyAxID4iJF9mIg0KPiArICAgIGlmIFsgLWYgIiRfZiIgXSA7
IHRoZW4NCj4gKwkgICAgZWNobyAxID4iJF9mIg0KPiAgICAgICBmaQ0KPiAgIH0NCj4gICANCg0K

