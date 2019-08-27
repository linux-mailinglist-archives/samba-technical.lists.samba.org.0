Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43F9EFC0
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 18:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kQ9RdvVEqiWR83iB8EJasOHK6Ut3mpaEID4bDWXVfeU=; b=Ygxdu+8lHmlB9kc0d2XmKQ7qQj
	X+0z+r6GCHXLBCJbS5GRAy2/cWbviHXtTFeX8KyaDz5lRcCl3NTL4ZChQCfVufam3yQLy2Fb4toSG
	cBPZSUQp8vXicgSnPFl8MqY7XSAoTpNWvwhE9CB6otSuforuJm03WNPidPrSD/AjBwoR9ad2YqUob
	SIsCawog67wlXOqw0BLcEmEnGOX+PcP+StSIDg4MycULlDlWaLTCZBgZCZ7kXvzjGFOakBcslSsD4
	8ikfnbF9x88vZty7gApQtMe/CBl0wM4F1VO5rSm7sHv/o21DVEMDuR1fQqOPDX3GPKzquql10Eu2A
	m878JL1Q==;
Received: from localhost ([::1]:18892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2e1v-008lJl-Qa; Tue, 27 Aug 2019 16:09:11 +0000
Received: from mail-sn1nam04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe4c::731]:21801
 helo=NAM04-SN1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1i2e1q-008lJd-2j
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 16:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XxKW8rQLHGg8CXpRCjxB8+7D9URnV2MxszJbaRyzTF7ILGuJmwwnxQMM5um+XHeOFDBEr1U0b65XyPBd3FABZlwLJcIHqULObOfPkGu/QUHdwYQ1PJ5UdVDyaz5FNljymS2nLyalLMhism+OBk+3NFeH6wMU14Pvb+7pdVrB6LwkAUryhkeM+dLeXFj93gYK990dOjJeIKIlxsL+1505DW6NzHMVspbl1eoeW18033w3RpgiAIXHNjXiZBdwXkwbGox9w4/fzSKtpjCta6C/xGdwsm9nHdAHQIyH8UHvLgBUOwqvxonlh5e1R8x2D9ZtiqK9vO3bVwFzIhVZid328A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ9RdvVEqiWR83iB8EJasOHK6Ut3mpaEID4bDWXVfeU=;
 b=PYhjXtD7hn2YJHA7J5vKeZ1c5fhag7vX0sUx1Peh/q+ppcKAelajRIs9wzwQpVsk2c85k7jTTpYY+AqSf5MikuXLrKsRwcxJoF0A0VbUdBG8/kpqOIhtae9d9mi/6pK/2kEIT3R1GLwVvD9rRwtMlXxcEULhOpJABbxU/VOhP5m6eKBhh6Fhx3jVmI0K2hxPPuyAVLveOu4GFXn4xbpW0tuYghQwYNtbIYZACreyCLjeEx7k5HAFLqXMwwdwygXUQ/S9K3BkQD598dkNoTAdzU9QlTpprTaI47/NXOjL8OEG5CJUKUNym45DB2RKOBQhYGPdsiJQad/CGj+EjxUPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ9RdvVEqiWR83iB8EJasOHK6Ut3mpaEID4bDWXVfeU=;
 b=OCCqRyfAlDHH7wtA/eOg0+O9ZfTP8GeHizyl0Og8dw2OryzNt3SmdCKmj64a9ktpIQh13sretCCQyuEIn1UrSFisE95cJiutKSE7LFmDCjo5i9TDQxkk+JbXo3Swz4cqteLaVGHkHdJsQji+wCqrv+P09VTjsL2OVuaEjYNXYto=
Received: from MWHPR2101MB0731.namprd21.prod.outlook.com (10.167.238.165) by
 MWHPR2101MB0875.namprd21.prod.outlook.com (10.167.238.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.3; Tue, 27 Aug 2019 14:33:54 +0000
Received: from MWHPR2101MB0731.namprd21.prod.outlook.com
 ([fe80::3d90:14fd:609c:d53d]) by MWHPR2101MB0731.namprd21.prod.outlook.com
 ([fe80::3d90:14fd:609c:d53d%5]) with mapi id 15.20.2241.000; Tue, 27 Aug 2019
 14:33:54 +0000
To: P Mairo <akoudanilo@gmail.com>
Subject: RE: GSOC 2019 - Final report
Thread-Topic: GSOC 2019 - Final report
Thread-Index: AQHVXBApdnbIrJYDZESb4sJMFMFKT6cPEBbQ
Date: Tue, 27 Aug 2019 14:33:54 +0000
Message-ID: <MWHPR2101MB07313A73451E5E60C3AB5D96A0A00@MWHPR2101MB0731.namprd21.prod.outlook.com>
References: <CAELK94cBsS_+AfvaNRCkSdsdjLv5os2D_Wuy5ni41t+jrrYDhA@mail.gmail.com>
In-Reply-To: <CAELK94cBsS_+AfvaNRCkSdsdjLv5os2D_Wuy5ni41t+jrrYDhA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=ttalpey@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-08-27T14:33:52.4247239Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=dacf6fc1-5769-47f0-aa35-3aae5c989759;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ttalpey@microsoft.com; 
x-originating-ip: [2601:18f:900:895::1005]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d87a6266-f941-4652-c257-08d72afb9637
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MWHPR2101MB0875:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +E3PoliPII7L+x4RnD0hAuHsmd4s0mryIwg50rN7ElJvd0cZe/gzOh4BdaStxsaCsUs2/94GN96klQyU8o3plBggjhO63V8OrjkMR+yWzbqThsc1oUIR+2DyYOMgBODV7zdYX33oBv7c0WpB8B6IG2XgSLh0wdo6dsEbmijkhU8G2himmFifhkGXpIYZ88pAkUgEJlGEx2iavsMZMdDUIgkC+xltikiZOV+ZWWzWQTAsUbSA0zBBATiMyiTlm5gJ9Vzv3szW15Zh965Z+SKXKK824KvKoLYXau+fyKPj+jQvNC+QRMdvXyjj/xVYvbYk7VpD8zmng4LiZQ40cc3vvgnIPHa7BETd9LAGLnISpKPU5xyxjM0w/tNhbcb7wZrQ+u6R4VGtcl51YYenMKTq8XlBJ2z/VIQhpb4jdMX794s=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87a6266-f941-4652-c257-08d72afb9637
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8g41cMTGiSnkaeIJFjTdhZxfzMLforr8Ffb//ESQPqUXn7HKkbt/mwWbunmtxWpkZZu4ELVgBK3IeDUz7NrL7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2101MB0875
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe4c::731
 (mail-sn1nam04on0731.outbound.protection.outlook.com) incorrectly presented
 itself as NAM04-SN1-obe.outbound.protection.outlook.com
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <ttalpey@microsoft.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Q29uZ3JhdHVsYXRpb25zLCBNYWlybyEgSXQncyB2ZXJ5IG5pY2Ugd29yayBhbmQgd2UgaG9wZSB0
byBzZWUgbW9yZSBpbiB0aGUgZnV0dXJlLg0KDQpUb20uDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWwtYm91bmNl
c0BsaXN0cy5zYW1iYS5vcmc+IE9uIEJlaGFsZg0KPiBPZiBQIE1haXJvIHZpYSBzYW1iYS10ZWNo
bmljYWwNCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMjYsIDIwMTkgOToxMyBBTQ0KPiBUbzogUCBN
YWlybyB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3Jn
Pg0KPiBTdWJqZWN0OiBHU09DIDIwMTkgLSBGaW5hbCByZXBvcnQNCj4gDQo+IEhlbGxvLCBoZXJl
J3MgdGhlIGxpbmsgdG8gbXkgZmluYWwgcmVwb3J0DQo+IA0KPiBodHRwczovL3JtcHIuZ2l0aHVi
LmlvL2dzb2NfMjAxOS8NCg0K

