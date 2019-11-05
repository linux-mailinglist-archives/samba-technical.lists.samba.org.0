Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814CEF6C4
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2019 09:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qSYUKZOvOpbx0wt+oq1P9tCcU6q4keywbsfAsirxKFE=; b=czWOHc4xwyJrosLSj+nQDTlsd2
	6iZUmdHTrgD2xnB9K9mYNDupRbB1ZXQBzksCp+AM6fjpXK1PTwkBoqpgoLbFcEiXdXxO0Lz+p7k0V
	OmqnMOA5HuDpVxWUzy20ldNlLXNGYXOfX5nCJb8nwGHiM63ak55K45HX8cub4hLvxbLZgiv7VsalT
	8IFGdTaJt85s5Xba92xzTXLcn2RXvdTMiuYAoRoqSxhr6Kn0lDwB1J7XauNmiitvN8pqKyQyS/Y2B
	xF6DpiRPXXyw6z/ZIMj2IjlftDV9uQnWqKnZmVT/DqMC1hhp3m6ZsKHyOaIBreDYI99HRWHq7b8K6
	xOUAPzGg==;
Received: from localhost ([::1]:42158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRtmx-006bER-PM; Tue, 05 Nov 2019 08:02:07 +0000
Received: from m4a0041g.houston.softwaregrp.com ([15.124.2.87]:50830) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iRtmr-006bEK-4E
 for samba-technical@lists.samba.org; Tue, 05 Nov 2019 08:02:03 +0000
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  5 Nov 2019 08:01:01 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 5 Nov 2019 08:00:08 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 5 Nov 2019 08:00:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INxFd/ApqPGrTmFqpUkKOcgBS6eYf3zwhmxa3YQYlZQpHuZLrUJOnWQm6xNUTCIcCS+bnlAw3GxA/5HFBNFDxaTHnD44cE3Rr2HFUvellj5LfD3dbNECiKev2LYWp6wQ+RdFJ2jsJyF+sY4uD0Xdo6lBJ8Z69yFS5K8yRRTHP5CQI8Qx5xS/KlJCLQ7CcT7F4XcRSz9djAXFO9v1snp8aulM7q91J2s4FWkQFagFwqxBt1mZsWJ9paxFmMnnrmFO5h+BANwqBnsFatlZa6BgXl6OOwgO+SxULUZygRfjlkFkfqQmPJsWsFy6xR3odTAozxKhEmgBg7pXC6xJa+LAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSYUKZOvOpbx0wt+oq1P9tCcU6q4keywbsfAsirxKFE=;
 b=QGKyNkjHkra4/r1K0PmVnnKfcIddKQWuUGsBrBfzSeOwednFhbvbhYR8JefO+9y1S9oVvbWua0hvf8aAdquyL1vMysI0AqBojFlW7hTdsxfQX7SgdJA4iML0jx8VTf59t1KLFvxahzz114R6H3OhLEXkV0D1k2v7etkqY4H5OTL87E1GbMdtZpnaY89nWDayI21gDlDeMMoHGyebnhJrD/PdDqRQBn9BPCje1BcD0dDHrhnaxCsqLeMYNfXTakVwN1JGt7Ag6jRn6Ri4hdcFlda4+KQ1hGIuUInl8Mkba3R/1s394oVMeArNE2+xMVKwwoO+VDMSJCo5meo2gBfVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.105.79) by
 DM6PR18MB2922.namprd18.prod.outlook.com (20.179.51.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 5 Nov 2019 08:00:06 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 08:00:06 +0000
To: Ralph Boehme <slow@samba.org>, Noel Power <NoPower@suse.com>, npower
 <npower@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Thread-Topic: Converting SMB1 tests to SMB2
Thread-Index: AQHVdUNqiOZWCa16a0elHejFomZ1kadQugh0gA6wbN+AAQJmgIAARkCAgAAQXgCAB2I8AIAAAnuAgAAJSYCAAAhSAIAADaSAgAAIYx6ADoq/AIAEHdOAgAF7GYA=
Date: Tue, 5 Nov 2019 08:00:04 +0000
Message-ID: <c204db75-aabf-2e40-5c81-47dadcba834b@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
 <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
 <f5970612-2998-cef1-dcca-40188c7a176f@suse.de>
 <361f5a38-66fb-e18c-7858-c5db6e93424e@samba.org>
 <dc95f81c-90ba-a368-9b3e-ccdcf067edaa@suse.com>
 <1f594677-aa62-6d89-fa34-b95f05edd27c@samba.org>
In-Reply-To: <1f594677-aa62-6d89-fa34-b95f05edd27c@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.76.44.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 205e80b7-cf85-4d36-f591-08d761c62aef
x-ms-traffictypediagnostic: DM6PR18MB2922:
x-ms-exchange-purlcount: 2
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mexKTNnU0f5yKyw5CDXDCqBKQXQnmyRZAI89FN56+vK+7LKtPWVZq5+0JE6uWWc/gsya8nM+0pAQi5Vijg3g6uHFufQKqxrhWTURq5ODJUzvTMDgjozZyVlbGCkziNHP80/ekGDcqoABDuIJ6+DfgGidtk6uEqEuMxJPTLdCZo81R8Cb3DRxQ2zlprSodyM+q0nMp+Cc8HhASM8eAlygtSDNe4NoHEeUWidsyMVYiajBO6Pcko7WJZBRQGN/rgVem8HeETot+fFgcT0A2tS0sdLtMI9W7Ss5o/we5mXrVhDOMwkdqUzUZa5zWZQu+G4V4DUunZKj7VR7yXz0VAcHaB27g3m5lpl3Tp66ZZ9N6f7kRZTwOpoXvsqXSdt/CDlTrqsPf4UcMAT+H/TE3FS5xBaOyq7/kE3L3/qItAHUfYRNB1FCfu3dKdUbPTGDoLyoJgR5EtkxnDi9tRh95vWCEuMy8cT04YV2YzmNHv3UYYs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A094F604DE25B046B6DEE62C03A05044@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e80b7-cf85-4d36-f591-08d761c62aef
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6PifpHZChPjfD64hJ/R7XlJY1JfKa+Th3dzpzGBrKpA/A74nf/8lGUmDcpN/4EgwTA7E0owQH9sLcFazIk/2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2922
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
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

DQpPbiAwNC8xMS8yMDE5IDA5OjIzLCBSYWxwaCBCb2VobWUgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gT24gMTEvMS8xOSA3OjMxIFBNLCBOb2VsIFBvd2VyIHdyb3RlOg0KPj4gSGkgQWxs
DQo+Pg0KPj4gSnVzdCB0aG91Z2h0IEkgc3VtbWFyaXplIHdoYXQgd2UgKG15c2VsZiAmIFJhbHBo
KSBkaXNjdXNzZWQsIGZvciBteSBvd24NCj4+IGJlbmVmaXQgYW5kIHRoZSBiZW5lZml0IG9mIG90
aGVycy4NCj4+IC4uLnNuaXAuLi4NCj4gdGhhbmtzIGZvciB0aGUgc3VtbWFyeSENCj4NCj4+IHBy
b2JsZW0gMSkNCj4+DQo+PiBUaGUgbWl4dHVyZSBvZiB4eXogJiB4eXpfc21iMSB0ZXN0IGVudmly
b25tZW50cyBzZWVtcyB0byBjYXVzZSBzdHJhbmdlDQo+PiBpc3N1ZXMgKHNlZQ0KPj4gaHR0cHM6
Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwvc2FtYmEvcGlwZWxpbmVzLzkyOTQ1MTI4KSwg
bWFueQ0KPj4gdGVzdHMgZmFpbCBvciBoYW5nLiBSdW5uaW5nIHRoZSB0ZXN0cyBhZ2FpbnN0IHRo
ZXNlIGVudmlyb25tZW50cw0KPj4gaW5kaXZpZHVhbGx5IHdvcmtzIG5vIHByb2JsZW1zLiBNb3N0
bHkgSSBndWVzcyB0aGlzIGlzIGFuIGlzc3VlIHdpdGggdGhlDQo+PiBmYWN0IHRoYXQgdGhlIE5F
VEJJT1MgbmFtZSBvZiB0aGVzZSAnZHVwbGljYXRlZCcgZW52aXJvbm1lbnRzIGFyZSB0aGUNCj4+
IHNhbWUgYW5kIHRoaXMgY2FuIGNhdXNlIGNsaWVudHMgdG8gY29ubmVjdCB0byB0aGUgd3Jvbmcg
c2VydmVyIChmcm9tIHRoZQ0KPj4gd3JvbmcgZW52aXJvbm1lbnQpDQo+IG1heWJlIHlvdSdyZSBq
dXN0IG1pc3NpbmcgdG8gYXNzaWduIElQcyB0byB0aGUgbmV3IHRlc3RlbnZzIGluDQo+IHNlbGZ0
ZXN0L3RhcmdldC9TYW1iYS5wbT8NCg0KeWVwLCBnb29kIGNhbGwsIHNlZW1zIEkgaGF2ZSB0byBw
YXNzIGRvd24gc2V2ZXIvaG9zdG5hbWUgd2hpY2ggKGJlY29tZXMNCk5FVEJJT1NOQU1FKSwgYWRk
aXRpb25hbGx5IHRoZSBzZXJ2ZXIgaXMgdXNlZCBhcyBhIGtleSBmb3IgaW50ZXJmYWNlDQp2YWx1
ZXMgd2hpY2ggaW4gdHVybiBhcmUgdXNlZCBmb3Igc2V0dGluZyB1cCB1bmlxdWUgSVBzIGZvciBl
YWNoIGVudi4NCkRlc3BpdGUgeW91ciBiZXN0IGVmZm9ydHMgdG8gaGVscCBJIG1hbmFnZWQgZmly
c3QgdG8gd2FzdGUgYWxvdCBvZiB0aW1lDQpnb2luZyBkb3duIHRoZSB3cm9uZyByb2FkIChiZWNh
dXNlIEkgZGlkbid0IHJlYWQgY2FyZWZ1bGx5IGVub3VnaCB3aGF0DQp5b3UgbWVhbnQgYWJvdmUp
DQoNCkkgYW0gdHJ5aW5nIHRvIHdvcmsgdGhyb3VnaCB0aGUgY2FybmFnZSByZXN1bHRpbmcgZnJv
bSBteSBlZmZvcnRzIHRvIGZpeA0KdGhpcyBub3csIHN0aWxsIGxvdHMgb2YgdGVzdCBlcnJvcyBt
b3N0bHkgSSBndWVzcyBqdXN0IGZyb20gc2lsbHkNCm1pc3Rha2VzL3R5cG9zIHdoaWxlIHRyeWlu
ZyB0byBtb2RpZnkgdGhlIGVudmlyb25tZW50cw0KDQo+PiBwcm9ibGVtIDIpDQo+Pg0KPj4gWWVz
LCBub3QgYmVpbmcgYSB0ZXN0IGVudmlyb25tZW50IGd1cnUgYW5kIGJlaW5nIG1heWJlIGEgbGl0
dGxlIGxhenkgYW5kDQo+PiBJIHdhbnRlZCB0byBhdm9pZCB0cnlpbmcgY2hhbmdlIHRoZSB0ZXN0
IGVudmlyb25tZW50IGZvbyB0byBjaGFuZ2Ugb3INCj4+IHBhc3MgZG93biBORVRCSU9TTkFNRcKg
IChzZWVtZWQgYSBsaXR0bGUgcmlza3kgdG9vLCBtYXliZSB0aGVyZSBpcyBvdGhlcg0KPj4gdGhp
bmdzIGxpa2UgdGhpcykuwqAgU28gSSBkZWNpZGVkIHRvIGNyZWF0ZSAyIG5ldyBhdXRvYnVpbGQg
am9icyB0byBydW4NCj4+IHRoZSBzbWIxIHRlc3RzLiBVbmZvcnR1bmF0ZWx5IHRoZXNlIGZhaWwg
aW4gQ0kgKHNlZQ0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwvc2FtYmEv
cGlwZWxpbmVzLzkzMDI5MzI1KSBXaGF0IGlzDQo+PiByZWFsbHkgd2VpcmQgaGVyZSBpcw0KPj4N
Cj4+IMKgwqDCoCBhKSBydW5uaW5nIHRoZXNlIGF1dG9idWlsZCBqb2JzIGxvY2FsbHkgb24gbXkg
b3duIG1hY2hpbmUgY2F1c2VzIG5vDQo+PiBwcm9ibGVtcywgYm90aCBqb2JzIHBhc3MNCj4+DQo+
PiDCoMKgwqAgYikgcnVubmluZyB0aGVzZSBqb2JzIGluIHRoZSAqc2FtZSogZG9ja2VyIGNvbnRh
aW5lciBhcyBDSSB1c2VzDQo+PiAodXNpbmcgdGhlIHNhbWUgYXV0b2J1aWxkIGNvbW1hbmQpIGFn
YWluIHdvcmtzIG5vIHByb2JsZW1zDQo+Pg0KPj4gwqDCoMKgIGMpIHJ1bm5pbmcgdGhlIHByb2Js
ZW1hdGljIGpvYnMgb24gc24tZGV2ZWwtMTg0IHVzaW5nDQo+PiBhdXRvYnVpbGQtcHJpdmF0ZS1z
ZWN1cml0eS5zaCBhZ2FpbiB3b3JrcyA6LSgNCj4+DQo+PiBJIGFtIHRyeWluZyAoc29mYXIgdW5z
dWNjZXNzZnVsbHkpIHRvIGZpZ3VyZSBvdXQgd2h5IHRoZXNlIGFyZSBmYWlsaW5nDQo+IFRoaXMg
bG9va3MgdW5yZWxhdGVkLCBidXQgbWF5YmUgdGhpcyB3aWxsIHdvcmsgdG9vIGlmIHlvdSBmaXgg
dGhlIGFib3ZlPw0KDQpJIGRvbid0IHRoaW5rIHRoaXMgaXMgcmVsYXRlZCB0byB0aGUgaXAgaXNz
dWUgYmVjYXVzZSB0aGUNCnBzZXVkby1kdXBsaWNhdGVkIHRlc3RlbnZzIHdlcmUgcnVuIGluIGlz
b2xhdGlvbiwgaW4gZmFjdCBJIGV2ZW4NCm1vZGlmaWVkIGdpdGxhYi1jaS55bWwgJiBhdXRvYnVp
bGQucHkgdG8ganVzdCBydW4gb25lIG9mIHRoZSBwcm9ibGVtYXRpYw0KdGVzdHMgKHNhbWJhMy51
bml4LmluZm8yKSBieSBpdHNlbGYgYW5kIGl0IGZhaWxzIGxpa2UgOTklIG9mIHRoZSB0aW1lDQph
bmQgb25seSBwYXNzZXMgaW5mcmVxdWVudGx5LiBUaGUgdGVzdCBoZXJlIGlzIHByZXR0eSBzaW1w
bGUsIGNyZWF0ZXMgYQ0KZmlsZSBhbmQgdGVzdHMgZmlsZXNpemUgKGFtb25nc3Qgb3RoZXIgdGhp
bmcpIHRlc3Qgc2VlbXMgdG8gZmFpbCBkdWUgdG8NCnVuZXhwZWN0ZWQgYWxsb2NhdGlvbiBmaWxl
IHNpemUgKHNvIHNlZW1zIG1heWJlIHNvbWV0aGluZyB0byBkbyB3aXRoIENJDQpmaWxlc3lzdGVt
IGZ1bm5pbmVzcyBvciBzb21ldGhpbmcpDQoNCkFueXdheSBjdXJyZW50bHkgSSB0cnkgdG8gZ2V0
IHRoZSB0ZXN0cyBydW5uaW5nIHdpdGggdGhlICd4eXpfc21iMScgZW52cw0KcnVubmluZyBhbG9u
Z3NpZGUgdGhlICd4eXonIGVudnMgaW4gdGhlIG5vcm1hbCBDSSBqb2JzDQoNCg0K

