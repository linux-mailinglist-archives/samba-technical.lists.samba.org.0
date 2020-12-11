Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A11872D7A84
	for <lists+samba-technical@lfdr.de>; Fri, 11 Dec 2020 17:11:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Z8bTYj3SSEDieHBrMYWJilvmygA/4jWvIm936w6ywnA=; b=Jay1AMKacuE99gjuSr/RYxPIY7
	KcEzOuP+pG1mVGGzwgTHgLXxCzMLw7l7XiAgAIWqtA7vmjbRfmiTe9jM0HbHtZAPeLEiSe2lyQeAJ
	SFd3+kPh1Wn0Nl+aRCjOCMhBUfnQ8oQRQgNCq2rzc99YCYOKMG9eHhtej97aoYNwmMtOjys6UdKzf
	WKvUT6HVhl+M6YHyLjMKfl3xWP6+bZoIgYlISdc0k4W5TdExH1SbsWl2SnX8iWKm7W2sX9iRou2+S
	kaPj7NLmxGtkzj2Rqb+h3O00gL5qbPWsBG6yFylw8fmaFwDjqXFoTgT0ksJ74pwbv1WVyWtdfbJMS
	0X/4DYPQ==;
Received: from ip6-localhost ([::1]:46020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knkzb-000a7R-5W; Fri, 11 Dec 2020 16:10:03 +0000
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:44153) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1knkzV-000a7K-Hx
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 16:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1607702997; x=1639238997;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=Z8bTYj3SSEDieHBrMYWJilvmygA/4jWvIm936w6ywnA=;
 b=a33UfXsjz6SMsOWIfQH+zQDFTW7ZOlqVniMY0jiqdkq/JYoCP/eFQ18A
 nTEuejdI0c9Ol/dvToxnUmFVIAk8+fjkI0B6LnoFTHJbH4oPzhW1bF5od
 rVFqdcYZJI/60p3rvxZ2R1qJpvgU3oTUkjjW/E0GnDZZX0RZYKUlDkpXH c=;
Subject: Re: [PATCH] Extend cifs acl utilities to handle SACLs
Thread-Topic: [PATCH] Extend cifs acl utilities to handle SACLs
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 11 Dec 2020 15:53:57 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B8ED8A1D22; Fri, 11 Dec 2020 15:53:56 +0000 (UTC)
Received: from EX13D11UEE004.ant.amazon.com (10.43.62.104) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 11 Dec 2020 15:53:56 +0000
Received: from EX13D11UEE004.ant.amazon.com (10.43.62.104) by
 EX13D11UEE004.ant.amazon.com (10.43.62.104) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 11 Dec 2020 15:53:56 +0000
Received: from EX13D11UEE004.ant.amazon.com ([10.43.62.104]) by
 EX13D11UEE004.ant.amazon.com ([10.43.62.104]) with mapi id 15.00.1497.006;
 Fri, 11 Dec 2020 15:53:56 +0000
To: =?utf-8?B?QXVyw6lsaWVuIEFwdGVs?= <aaptel@suse.com>, "Boris Protopopov via
 samba-technical" <samba-technical@lists.samba.org>
Thread-Index: AQHWvryk1O5nAWQx/kq/f8btwT55N6nRkIQAgCAhYwCAACh2gA==
Date: Fri, 11 Dec 2020 15:53:56 +0000
Message-ID: <022C2616-108B-420D-BFA8-45D30122C945@amazon.com>
References: <20201119214042.6113-1-pboris@amazon.com>
 <20201120214918.12517-1-pboris@amazon.com> <87lfe4d9v1.fsf@suse.com>
In-Reply-To: <87lfe4d9v1.fsf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.60.188]
Content-Type: text/plain; charset="utf-8"
Content-ID: <032D857DB4E8494BA9F7B257709D46E0@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
From: "Protopopov, Boris via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Protopopov, Boris" <pboris@amazon.com>
Cc: "sfrench@samba.org" <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGksIEF1csOpbGllbiwgDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuDQoNCkhpLCBQ
YXZlbCwgDQoNClNvcnJ5IGZvciB0aGUgdHlwbywgY2FuIHlvdSBwbHogdHdlYWsgdGhlIHBhdGNo
IHByaW9yIHRvIG1lcmdlOyBhbHRlcm5hdGl2ZWx5LCBJIGNhbiByZXN1Ym1pdCBpZiB0aGF0IGlz
IHByZWZlcnJlZC4NCg0KQm9yaXMuDQoNCu+7v09uIDEyLzExLzIwLCAzOjMwIEFNLCAiQXVyw6ls
aWVuIEFwdGVsIiA8YWFwdGVsQHN1c2UuY29tPiB3cm90ZToNCg0KICAgIENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0
aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCg0KDQogICAgQm9yaXMg
UHJvdG9wb3BvdiB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2Ft
YmEub3JnPg0KICAgIHdyaXRlczoNCg0KICAgID4gRml4ZWQgZXJyb3IgY2FzZXMgZm9yIGluc3Vm
ZmljaWVudCBwcml2aWxlZ2VzLCBhZGRlZA0KICAgID4gYXR0cmlidXRlIG5vdCBzdXBwb3J0ZWQg
ZXJyb3IgY2FzZSBmb3IgZ2V0Y2lmc2FjbC4NCiAgICA+DQogICAgPiBTaWduZWQtb2ZmLWJ5OiBC
b3JpcyBQcm90b3BvcG92IDxwYm9yaXNAYW1hem9uLmNvbT4NCiAgICA+IC0tLQ0KICAgID4gIGdl
dGNpZnNhY2wuYyB8IDE3ICsrKysrKysrKysrKysrLS0tDQogICAgPiAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQogICAgPg0KICAgID4gZGlmZiAtLWdp
dCBhL2dldGNpZnNhY2wuYyBiL2dldGNpZnNhY2wuYw0KICAgID4gaW5kZXggMWM3MmU3Yy4uYzE5
NzRkMyAxMDA2NDQNCiAgICA+IC0tLSBhL2dldGNpZnNhY2wuYw0KICAgID4gKysrIGIvZ2V0Y2lm
c2FjbC5jDQogICAgPiBAQCAtNDQ1LDE1ICs0NDUsMjYgQEAgZ2V0eGF0dHI6DQogICAgPiAgICAg
ICAgICAgICAgICAgICAgICAgZnJlZShhdHRydmFsKTsNCiAgICA+ICAgICAgICAgICAgICAgICAg
ICAgICBidWZzaXplICs9IEJVRlNJWkU7DQogICAgPiAgICAgICAgICAgICAgICAgICAgICAgZ290
byBjaWZzYWNsOw0KICAgID4gLSAgICAgICAgICAgICB9IGVsc2UgaWYgKChlcnJubyA9PSBFUEVS
TSB8fCBlcnJubyA9PSBFQUNDRVMpICYmDQogICAgPiAtICAgICAgICAgICAgICAgICAgICAgICAg
IShzdHJjbXAoYXR0cm5hbWUsIEFUVFJOQU1FX05UU0RfRlVMTCkpKSB7DQogICAgPiArICAgICAg
ICAgICAgIH0gZWxzZSBpZiAoZXJybm8gPT0gRUlPICYmICEoc3RyY21wKGF0dHJuYW1lLCBBVFRS
TkFNRV9OVFNEX0ZVTEwpKSkgew0KICAgID4gICAgICAgICAgICAgICAgICAgICAgIC8qDQogICAg
PiAgICAgICAgICAgICAgICAgICAgICAgICogYXR0ZW1wdCB0byBmZXRjaCBTQUNMIGluIGFkZGl0
aW9uIHRvIG93bmVyIGFuZCBEQUNMIHZpYQ0KICAgID4gICAgICAgICAgICAgICAgICAgICAgICAq
IEFUVFJOQU1FX05UU0RfRlVMTCwgZmFsbCBiYWNrIHRvIG93bmVyL0RBQ0wgdmlhDQogICAgPiAg
ICAgICAgICAgICAgICAgICAgICAgICogQVRUUk5BTUVfQUNMIGlmIG5vdCBhbGxvd2VkDQogICAg
PiArICAgICAgICAgICAgICAgICAgICAgICogQ0lGUyBjbGllbnQgbWFwcyBTVEFUVVNfUFJJVklM
RUdFX05PVF9IRUxEIHRvIEVJTw0KICAgID4gICAgICAgICAgICAgICAgICAgICAgICAqLw0KICAg
ID4gLSAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiSW5zdWZmaWNpZW50IHBl
cm1pc3Npb25zIHRvIGZldGNoIGZ1bGwgZGVzY3JpcHRvciBmb3IgJXNcbiIsDQogICAgPiArICAg
ICAgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJXQVJHTklORzogSW5zdWZmaWNpZW50
IHByaXZpbGVkZ2VzIHRvIGZldGNoIFNBQ0wgZm9yICVzXG4iLA0KDQogICAgVGhlcmUncyBhIHR5
cG8gV0FSR05JTkcgLT4gV0FSTklORw0KDQogICAgLS0NCiAgICBBdXLDqWxpZW4gQXB0ZWwgLyBT
VVNFIExhYnMgU2FtYmEgVGVhbQ0KICAgIEdQRzogMTgzOSBDQjVGIDlGNUIgRkI5QiBBQTk3ICA4
Qzk5IDAzQzggQTQ5QiA1MjFCIEQ1RDMNCiAgICBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgREUNCiAgICBHRjogRmVs
aXggSW1lbmTDtnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWggSFJCIDI0NzE2NSAoQUcg
TcO8bmNoZW4pDQoNCg0K

