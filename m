Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAC28D81
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 00:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RnHj7F1NHJztX+S8H2Omosk3H6PcgtvQj8Ur51XQ7XE=; b=rTwTBie1wkL3VCdRqrmu+5G6X7
	INidiRrr3M6dJGd5Y5e2Wn+KUbF/1yqdKQHDCM+kclv8u+9fO/axm45+YpTi3tEELnUBOHi2eKju5
	tttbG2cFNn0meS0wOTIaNnFnNMa64TMDKt+w2VNLJEw+YPa4/r3SjldynZcwueiIfSXZHzLtSRyIF
	KzZm52vGKYBOF5W+aHgkE4ycXcVmE4K+aXKT7mncNYBNobD2J/aAmUvcgnL6P1eWcvzdg/KnavfUU
	Wk0LQ04Hv+UBDjItuELgSQOi9JViEmb4TsbF0HDLmmDnrvFMMfGy5h2RmSKSB2z60FZ4EnwJsGzJA
	WtGjhcQQ==;
Received: from localhost ([::1]:21662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTwdF-001Urf-J9; Thu, 23 May 2019 22:56:17 +0000
Received: from mail-dm3nam03on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe49::72e]:29504
 helo=NAM03-DM3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1hTwdA-001UrY-Uc
 for samba-technical@lists.samba.org; Thu, 23 May 2019 22:56:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=j+/x+WVt2O153UMw0lA0BQsY0jsk6FUumg1kXSkFnVjvvqCwxlQVppsLzrXGbOCryMvU04Cs8pP8bTMWOkCM7ZClLib4vXTZEf75wDiwdBsRXUhqqRrOw3UIhkZumqZVrBNtoYrVmvS3QI5IVMi7edEdRPyiwtDJgl1zn3mAdac=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnHj7F1NHJztX+S8H2Omosk3H6PcgtvQj8Ur51XQ7XE=;
 b=WnUpY5iJTWKFhZw6aHJ8BIBxFio8S3Ph4uLHp9r2nWauAzEU729VnURowxCkPWC2JaevibBCw4MBNs3V0V91qzwJ5H+Zkx4XTbVufjfYsENnQfvjsFw21h29uUOyKoRN0w8Cb3n0w+ELqH0dLooT7QdhDx7SoCVZn+YZ0Oirc7M=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnHj7F1NHJztX+S8H2Omosk3H6PcgtvQj8Ur51XQ7XE=;
 b=iyEsm2Pq2lQfoRIC/0a/i4zaV0DwHv8tKYWlkGtX4LT73IM8UzYmfEI2pIlkkgppPPGPbvBuEKxlmjFFwRbaIKM8ULknS5HEPg+v0i2DiB90Dhsm91j/vT5kfBK/1VtZx8tmHrYJG5cdr+ti0pJbMqlFgfIdBEchlkRBclT0ASE=
Received: from CY4PR21MB0149.namprd21.prod.outlook.com (2603:10b6:903:b2::19)
 by CY4PR21MB0632.namprd21.prod.outlook.com (2603:10b6:903:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.3; Thu, 23 May
 2019 18:24:16 +0000
Received: from CY4PR21MB0149.namprd21.prod.outlook.com
 ([fe80::557b:1240:94cb:8f77]) by CY4PR21MB0149.namprd21.prod.outlook.com
 ([fe80::557b:1240:94cb:8f77%9]) with mapi id 15.20.1943.007; Thu, 23 May 2019
 18:24:16 +0000
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>, Steve
 French <smfrench@gmail.com>
Subject: RE: [PATCH][SMB3] Add missing defines for new negotiate contexts
Thread-Topic: [PATCH][SMB3] Add missing defines for new negotiate contexts
Thread-Index: AQHU9gDJf2vMizjMXkSZLohRVXfnP6ZCKvuAgAYumJCAEUrw8IAfTKaAgABIIdA=
Date: Thu, 23 May 2019 18:24:16 +0000
Message-ID: <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
 <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
In-Reply-To: <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=ttalpey@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-23T18:24:14.8917842Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=60cc6b91-783b-435d-92ad-2f59cbef9eee;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ttalpey@microsoft.com; 
x-originating-ip: [2601:18f:902:71e2::1001]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36021535-165d-4d80-26e9-08d6dfabdd48
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR21MB0632:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUPucgYIwoHhaTFxxyQqt5hRnWghDavgmvDuxSic4Fy+Z570sOhf1D06pKO7Nf71/lgFlrpvADOzYIkhaGi3JiBBp+h7AjnPxtAv6eisTB8BjMrJo225BgZwHlkofbXYJ26rYuiuDZ5VsE6ldt9nq53qIy3wFn224weMuR/s/kWsYezlLOadQu2OPNn4C4aNKTKY8+19kplExUx5xHGKjEKMVmtfisMpO4AgmR7cBUFwKPGG91P2fP/q2App+M/DKk+PZfUlRG1B62ONp7MOU2b1BZIuaHqkZLD2r2jlA3Fd/jgC6cUruf8zv2rJB7JFFTbr76kvCAgECxQPfCPVWwlqflbT6YEPusqQsL5Ph2uJuLgA3M+2/ip9pugg9XP7aYAHKHavoT5SgQ6eofbmdnk8oc8RhakiCfVd+ntLGx4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36021535-165d-4d80-26e9-08d6dfabdd48
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttalpey@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR21MB0632
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <ttalpey@microsoft.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8
bWV0emVAc2FtYmEub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIzLCAyMDE5IDk6NTEgQU0N
Cj4gVG86IFRvbSBUYWxwZXkgPHR0YWxwZXlAbWljcm9zb2Z0LmNvbT47IEplcmVteSBBbGxpc29u
IDxqcmFAc2FtYmEub3JnPjsNCj4gU3RldmUgRnJlbmNoIDxzbWZyZW5jaEBnbWFpbC5jb20+DQo+
IENjOiBDSUZTIDxsaW51eC1jaWZzQHZnZXIua2VybmVsLm9yZz47IHNhbWJhLXRlY2huaWNhbCA8
c2FtYmEtDQo+IHRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdW1NNQjNdIEFkZCBtaXNzaW5nIGRlZmluZXMgZm9yIG5ldyBuZWdvdGlhdGUgY29udGV4dHMN
Cj4gDQo+IEhpIFRvbSwNCj4gDQo+ID4+IFRoZSBXaW5kb3dzIHByb3RvY29sIGRvY3VtZW50cyB3
ZXJlIHVwZGF0ZWQgb24gTWFyY2ggMTMgZm9yIHRoZQ0KPiA+PiB1cGNvbWluZyAiMTlIMSIgdXBk
YXRlIGN5Y2xlLg0KPiA+Pg0KPiA+PiBNUy1TTUIyIHZlcnNpb24gcGFnZSwgd2l0aCBsYXRlc3Qs
IGRpZmZzLCBldGM6DQo+ID4+DQo+ID4+IGh0dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2VuLXVz
L29wZW5zcGVjcy93aW5kb3dzX3Byb3RvY29scy9tcy0NCj4gc21iMi81NjA2YWQ0Ny01ZWUwLTQz
N2EtODE3ZS03MGMzNjYwNTI5NjINCj4gPg0KPiA+IFNvLCB0aGVyZSB3YXMgYSBkZWZlY3QgaW4g
dGhlIHB1Ymxpc2hlZCBzcGVjIHdoaWNoIHdlIGp1c3QgY29ycmVjdGVkLCB0aGVyZSdzIGENCj4g
bmV3DQo+ID4gdXBkYXRlIG9ubGluZSBhdCB0aGUgYWJvdmUgcGFnZS4NCj4gPg0KPiA+IFRoZSB2
YWx1ZSBvZiB0aGUgbmV3IGNvbXByZXNzaW9uIGNvbnRleHRpZCBpcyBhY3R1YWxseSAiMyIsIGJ1
dCB0aGUgZWFybGllcg0KPiBkb2N1bWVudA0KPiA+IGluY29ycmVjdGx5IHNhaWQgIjQiLiBUaGVy
ZSB3ZXJlIHNldmVyYWwgb3RoZXIgZml4ZXMgYW5kIGNsYXJpZmljYXRpb25zIGluIHRoZQ0KPiBw
aXBlbGluZQ0KPiA+IHdoaWNoIGhhdmUgYWxzbyBiZWVuIGluY2x1ZGVkLg0KPiA+DQo+ID4gUmVk
bGluZSBkaWZmcyBhcyB3ZWxsIGFzIHRoZSB1c3VhbCBzdGFuZGFyZCBwdWJsaWNhdGlvbiBmb3Jt
YXRzIGFyZSBhdmFpbGFibGUuDQo+IA0KPiBUaGVyZSdzIG5vIHNlcnZlciBiZWhhdmlvciBkZWZp
bmVkIGZvcg0KPiBTTUIyX05FVE5BTUVfTkVHT1RJQVRFX0NPTlRFWFRfSUQuIElmIHRoZXJlJ3Mg
bm9uZSwgd2h5IHdhcyBpdCBhZGRlZA0KPiBhdCBhbGw/DQoNCkl0J3MgYW4gYWR2aXNvcnkgcGF5
bG9hZCwgYW5kIGNhbiBiZSB1c2VkIHRvIGRpcmVjdCB0aGUgY29ubmVjdGlvbiBhcHByb3ByaWF0
ZWx5DQpieSBsb2FkIGJhbGFuY2Vycywgc2VydmVycyBob3N0aW5nIG11bHRpcGxlIG5hbWVzLCBh
bmQgdGhlIGxpa2UuIEl0J3MgYmFzaWNhbGx5IHRoZQ0Kc2FtZSBzZXJ2ZXJuYW1lIHRoYXQgd2ls
bCBiZSBwcmVzZW50ZWQgbGF0ZXIgaW4gU01CMl9UUkVFX0NPTk5FQ1QsIG9ubHkgaXQncw0KYXZh
aWxhYmxlIGVhcmx5LCBwcmlvciB0byBhbnkgU01CMyBwcm9jZXNzaW5nLiBPdGhlciBwb3NzaWJs
ZSB1c2VzIGFyZSBmb3IgbG9nZ2luZw0KYW5kIGRpYWdub3Npcy4NCg0KSXQgaGFzIG5vIGFjdHVh
bCBmdW5jdGlvbiBpbiB0aGUgU01CMyBwcm90b2NvbCwgc28gYXBhcnQgZnJvbSBkZWZpbmluZyB0
aGUgcGF5bG9hZA0KaXQncyBub3QgYSBtYXR0ZXIgZm9yIHRoZSBNUy1TTUIyIGRvY3VtZW50LiBX
ZSB3b3VsZCBob3BlLCBob3dldmVyLCB0aGF0IGNsaWVudHMNCndpbGwgaW5jbHVkZSB0aGUgY29u
dGV4dCB3aGVuIHNlbmRpbmcgU01CMl9ORUdPVElBVEUuDQoNClRvbS4NCg==

