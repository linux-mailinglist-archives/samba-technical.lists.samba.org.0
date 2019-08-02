Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD2A7F510
	for <lists+samba-technical@lfdr.de>; Fri,  2 Aug 2019 12:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=a1sBj8eVWfmYtq61mrC0Etl/alJwheg8nfae/xJr2X0=; b=SxYB561r77Zss7Rl2Hfgy0MR/m
	orw7mLKZ3Ii6xqhwVoQs6IIwdFVu2c1hs1c24bL5edHd/4dhmzjw2EO9HsbwLDxG6+wlwbXr4nQFF
	5uP6cNQRmWcwLIohDhent6QKZqGjoUHzpa3KBZgTHlgdm2H7a/hK3jNXR4fOdwdhtp/7Cqz8CcQ5h
	EFB1dN8vKNUv/S5QNlYoFf651SStb/bFdkSQAVo90l5araciDETSUc7J/9nmhtlFBt5Q1EDEEeuCJ
	KFZovZYjZu9ui8mi02awfPuD5k/sSKsPgewXYhYvwVL1ui0Tu72U556Zg3tems7ey+csCwDMUDp+z
	XX0tDU0w==;
Received: from localhost ([::1]:60424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htUrU-003Vld-TG; Fri, 02 Aug 2019 10:32:37 +0000
Received: from mail-eopbgr80059.outbound.protection.outlook.com
 ([40.107.8.59]:25336 helo=EUR04-VI1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1htUrO-003VlW-Ov
 for samba-technical@lists.samba.org; Fri, 02 Aug 2019 10:32:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1IA8rlJOIC8gj7xeq67YV2pReCy7NalLIUXhiWE1q9+KBheiN2M+j5mROku3TaT/QpOopp10Ypz+FNstZnDZvhxc765h0/NjgUeUhstayPdjnGV2dwZnw/PR4oZHx+//TCcOg/HMLrVluCM1/RybdbYHaGQFxnGvee/mBQ2FoU2I2hDcySxcwtFEiLEjajm3LdykNUR6Da8Vbwj9L9GVSRSOq1iVH/iN1wBTuJmIc1jZmLCFF3JZZCTQFNNH6wWGjvjwR+Tb4eIGT+L87SgstiGRUxascz1pGwOxnCdm255N8DaCkCpzO4PRUq/4J6zaekYRdA/fi3P4bXPqcN03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1sBj8eVWfmYtq61mrC0Etl/alJwheg8nfae/xJr2X0=;
 b=HYakVBbrjvYfFZ+FyNdf06GwUN6fC1A5TKcF9+Xh5RadqKzXrRooVcawlU5h42srZwAxMJoZMuYNVgg+kPL4W0+4TxgeXtIECgGrM2I2JQKlPU7Q+A51nr3zhUprBr57hDGA6Ky1hUr4rTodzqQ+Y4PpRcz+oYOo/Kj4j5hicB5eliC2muOeDFSlgazYbflG7Etsu7dQC8QMwy8sW0uVAhWM4Y6SrIc5jfT/KIOJuwkntS2YjzPFL4s4JkHOQpKHcjgUCMJWtA8jBx2vBVqgWLcRUG6rOQ8g/YW4buheL5oSbY8gT4q3F95Gq2C2IQYoyY7AzIxjAUuUINHu5jbQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wallix.com;dmarc=pass action=none
 header.from=wallix.com;dkim=pass header.d=wallix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wallix.onmicrosoft.com; s=selector2-wallix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1sBj8eVWfmYtq61mrC0Etl/alJwheg8nfae/xJr2X0=;
 b=WBKoaJH+fTXxUq96LZ1VpHnywOqvMVJVHHatmm22J9UnEXFJZc1+sQOxb/fPS5mkO2Do2r2TVJEjYPhzTzpnvNtBXH82dK5b0h2ca/56vuQQ7KOaU4hC2TvWcqZnQlh6J8Fm96DMhHE2O4Vai8KP0STLBPyBu31RTjWJxpd7QCU=
Received: from VI1PR03MB6190.eurprd03.prod.outlook.com (10.141.128.75) by
 VI1PR03MB6158.eurprd03.prod.outlook.com (10.141.128.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 06:58:38 +0000
Received: from VI1PR03MB6190.eurprd03.prod.outlook.com
 ([fe80::4d7c:17b1:9d63:4403]) by VI1PR03MB6190.eurprd03.prod.outlook.com
 ([fe80::4d7c:17b1:9d63:4403%2]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 06:58:38 +0000
To: Steve French <smfrench@gmail.com>, Pavel Shilovsky
 <pavel.shilovsky@gmail.com>
Subject: Re: PROBLEM: Kernel oops when mounting a encryptData CIFS share with
 CONFIG_DEBUG_VIRTUAL
Thread-Topic: PROBLEM: Kernel oops when mounting a encryptData CIFS share with
 CONFIG_DEBUG_VIRTUAL
Thread-Index: AQHVQwVbrMDmWO2VoUeqR7dMvDyd06bbyvGAgArH3YCAAOaQAA==
Date: Fri, 2 Aug 2019 06:58:38 +0000
Message-ID: <35ee3dd4-19dd-4a27-6160-4080bdeaea48@wallix.com>
References: <380e1b86-1911-b8a5-6b02-276b6d4be4fe@wallix.com>
 <CAKywueSO=choOsw6THnEnmN4UwhACHU1o1pJX8ypx0wjVTmiKQ@mail.gmail.com>
 <CAH2r5ms1qgpPrB+oOHWF7TVoZ36g3iska1PQ3dBGMrscq2K51g@mail.gmail.com>
In-Reply-To: <CAH2r5ms1qgpPrB+oOHWF7TVoZ36g3iska1PQ3dBGMrscq2K51g@mail.gmail.com>
Accept-Language: en-150, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cmucchietto@wallix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.87.189.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 037bf5ac-b34e-4e7c-ee5c-08d71716d858
x-ms-traffictypediagnostic: VI1PR03MB6158:
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NxCXPojoloFVVufq1OtsY45LaTsABbQ0JN4caHlONFuW92LR1EbLIQUCgXzh1exTxpqWrC1Ri6ZGFJxUZan3lpd1jqUk+JfAvbBDmmkZsXv/0Cth/pPYKG8js38aOg9jd6QFD6EctbB6pBCAbJOZKTvAIgo0qVC/0jsYMuFFTZc1a41+/47vhWXQVLbCbYeMSXgj+3ZiOp7SN1ao3IIZj5iILGQTV9aiCZxLfsUZaUUi99lzf+ANcp5flSaR2EOY303Nl9sJLBN2lkxK/71rUphzIg/t2fZH/HCVYTOIxvIu7IeOtKMiUve3iPgeR8E5VQFitPQP/hZakdGGyWGcHz9JPjlFMxow6dYIAuxAwiLmU5Xv0hAL8W0LM3fk2/fljYGpqGe65EgIrRPUcD138YOaXPu1eav5/J69z5lTuAo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEDA740230A54C4DA0AB0EEACF33A3DB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wallix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037bf5ac-b34e-4e7c-ee5c-08d71716d858
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f6bb2bd8-b6f1-4c26-8e2b-61c79722df19
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cmucchietto@wallix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6158
X-Warn: EHLO/HELO not verified: Remote host 40.107.8.59
 (mail-eopbgr80059.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-VI1-obe.outbound.protection.outlook.com
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
From: Cyrille Mucchietto via samba-technical <samba-technical@lists.samba.org>
Reply-To: Cyrille Mucchietto <cmucchietto@wallix.com>
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Sebastien Tisserant <stisserant@wallix.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Cristian Popi <cpopi@wallix.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

T24gOC8xLzE5IDc6MTMgUE0sIFN0ZXZlIEZyZW5jaCB3cm90ZToNCj4gU2ViYXN0aWVuLA0KPiBJ
IGNsZWFuZWQgdXAgdGhlIHBhdGNoIGFuZCBtZXJnZWQgaW50byBjaWZzLTIuNi5naXQgLSBjYW4g
eW91DQo+IGRvdWJsZWNoZWNrIGl0IGlzIGNvcnJlY3Q/DQoNClNlYmFzdGllbiBpcyBub3QgYXZh
bGFpYmxlLCBidXQgd2UgY29uZmlybSB0aGF0IHRoaXMgcGF0Y2ggaXMgY29ycmVjdA0KDQpSZWdh
cmRzLA0KDQpDeXJpbGxlIE11Y2NoaWV0dG8NCg0KDQo+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0
IDM6MzUgUE0gUGF2ZWwgU2hpbG92c2t5DQo+IDxwYXZlbC5zaGlsb3Zza3lAZ21haWwuY29tPiB3
cm90ZToNCj4+INGH0YIsIDI1INC40Y7Quy4gMjAxOSDQsy4g0LIgMDk6NTcsIFNlYmFzdGllbiBU
aXNzZXJhbnQgdmlhIHNhbWJhLXRlY2huaWNhbA0KPj4gPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5z
YW1iYS5vcmc+Og0KPj4gLi4uDQo+Pj4gbW91bnQgd29ya3Mgd2l0aG91dCBDT05GSUdfREVCVUdf
VklSVFVBTA0KPj4+DQo+Pj4gSWYgd2UgZG9uJ3Qgc2V0IENPTkZJR19WTUFQX1NUQUNLIG1vdW50
IHdvcmtzIHdpdGggQ09ORklHX0RFQlVHX1ZJUlRVQUwNCj4+Pg0KPj4+DQo+Pj4gV2UgaGF2ZSB0
aGUgZm9sbG93aW5nICh2ZXJ5IHF1aWNrIGFuZCBkaXJ0eSkgcGF0Y2ggOg0KPj4+DQo+Pj4gSW5k
ZXg6IGxpbnV4LTQuMTkuNjAvZnMvY2lmcy9zbWIyb3BzLmMNCj4+PiA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4g
LS0tIGxpbnV4LTQuMTkuNjAub3JpZy9mcy9jaWZzL3NtYjJvcHMuYw0KPj4+ICsrKyBsaW51eC00
LjE5LjYwL2ZzL2NpZnMvc21iMm9wcy5jDQo+Pj4gQEAgLTI1NDUsNyArMjU0NSwxNSBAQCBmaWxs
X3RyYW5zZm9ybV9oZHIoc3RydWN0IHNtYjJfdHJhbnNmb3JtDQo+Pj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBzbWIyX3NnX3NldF9idWYoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZywgY29uc3Qgdm9pZCAq
YnVmLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJ1ZmxlbikNCj4+PiAg
ew0KPj4+IC0gICAgc2dfc2V0X3BhZ2Uoc2csIHZpcnRfdG9fcGFnZShidWYpLCBidWZsZW4sIG9m
ZnNldF9pbl9wYWdlKGJ1ZikpOw0KPj4+ICsgICAgICB2b2lkICphZGRyOw0KPj4+ICsgICAgICAv
Kg0KPj4+ICsgICAgICAgKiBWTUFQX1NUQUNLIChhdCBsZWFzdCkgcHV0cyBzdGFjayBpbnRvIHRo
ZSB2bWFsbG9jIGFkZHJlc3Mgc3BhY2UNCj4+PiArICAgICAgKi8NCj4+PiArICAgICAgaWYgKGlz
X3ZtYWxsb2NfYWRkcihidWYpKQ0KPj4+ICsgICAgICAgICAgICAgIGFkZHIgPSB2bWFsbG9jX3Rv
X3BhZ2UoYnVmKTsNCj4+PiArICAgICAgZWxzZQ0KPj4+ICsgICAgICAgICAgICAgIGFkZHIgPSB2
aXJ0X3RvX3BhZ2UoYnVmKTsNCj4+PiArICAgICAgc2dfc2V0X3BhZ2Uoc2csIGFkZHIsIGJ1Zmxl
biwgb2Zmc2V0X2luX3BhZ2UoYnVmKSk7DQo+Pj4gIH0NCj4+Pg0KPj4+ICAvKiBBc3N1bWVzIHRo
ZSBmaXJzdCBycXN0IGhhcyBhIHRyYW5zZm9ybSBoZWFkZXIgYXMgdGhlIGZpcnN0IGlvdi4NCj4+
Pg0KPj4+DQo+PiBUaGFua3MgZm9yIHJlcG9ydGluZyB0aGlzLiBUaGUgcGF0Y2ggbG9va3MgZ29v
ZCB0byBtZS4gRGlkIHlvdSB0ZXN0DQo+PiB5b3VyIHNjZW5hcmlvIGFsbCB0b2dldGhlciB3aXRo
IGl0IChub3Qgb25seSBtb3VudGluZyk/DQo+Pg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IFBh
dmVsIFNoaWxvdnNraXkNCj4+DQo+Pg0K

