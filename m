Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D601C1127F4
	for <lists+samba-technical@lfdr.de>; Wed,  4 Dec 2019 10:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OylMN4gzR9SJP+j134/E6Ac8AM6X09rv/DvjRw/O1h0=; b=B1qo2uqlwguxaAdwNvHmEqDjFZ
	nj7fb2URkfe7ch3xO5Kk6GX+2ic4Y21ieqEiTQMmaIzTYFEcGfWjnwfdAKQWLIGiimzhDU9zfFB/J
	+uvm2W+cA/ACVmt7j6TwVhExQL6Mbg7HhHqoCwTNXDevHFVO8G8Ekl+FOJrx9gZQfZrCncDf0aVNk
	EdbzaVOeOR4ZelQw9/qF6T/aa2VmmUuLT4SjGSVD7RX+k9YPyzo3IncJxCNWON5lvCNfipSizYn6+
	e5tc2fxjnGbbCstsBK4msfvDsfACHY2DDJGLYuQ+nr76UXszKqHTROv3hHKpVMi6wzKENQU5Qf+wR
	6WeMpyWg==;
Received: from localhost ([::1]:32338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icRAG-005zYx-2y; Wed, 04 Dec 2019 09:41:44 +0000
Received: from m9a0003g.houston.softwaregrp.com ([15.124.64.68]:51344) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icRA5-005zYp-8Y
 for samba-technical@lists.samba.org; Wed, 04 Dec 2019 09:41:41 +0000
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  4 Dec 2019 09:40:41 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 4 Dec 2019 09:38:55 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 4 Dec 2019 09:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq5BoLGDmNvf2QL8YRKaYmXKrs29ut8j+AUNWPoFQwrhW1coYI7afRhBg5Cxf2z0tghSC5aFsOOY9n1eEwSiacunt37oeW6TYuaPwigwQAzJ3No1CiI17q6PArQMCrDyCVVDm5KWDx+BY9gjWnF7Ob1G+c8hM+/0/Ra2BN9k7jj3giQDU1/rOFS5ETVufkns5boDuqDwVz7oxcdeipB2DGzYfF5VUdTVLh8IxnOVCricDxcxNmjZhJQbctvAV9Y+ayxCeYe9IoIaracjrye891tG/QOk199K5zBs7EMkHMDGZvbPwR3cxKZ5lsnsYHgNIT/i1TVAyUzHQHsRrtojkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OylMN4gzR9SJP+j134/E6Ac8AM6X09rv/DvjRw/O1h0=;
 b=ar3WpnlAqyOtfXrsxP9S6aC2LLDs5vFdxTV6K2QdTdy4WWrPbv3Nb/vbsQ1Zo3ObWRFdfbtEQrFH1++9KaSP6VL7+qY6tc9hhRjfO9D8Dje+sqpWBuP4bBo+8sutCN8SEPZkiG2X/syGBUyl5sfydV/BykEVAoldspZtoEn4pffuKWsNF8W8yk8DuchgP8yEqOx0jazdhNGjQJxEkZ9qOAOP1OOn8z6mRKR+mJ0e8KbXQL1Z5SvWaFLHV5W7IxH6AplXDn1EMcF8gXDVG7T/BMnkEX5ZQIATq/gUQfqkbkXbJmny82a9AYhmvRVqzpUHZ4rhtVA30SfvJaLjUYHHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.71.218) by
 DM6PR18MB2620.namprd18.prod.outlook.com (20.179.106.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Wed, 4 Dec 2019 09:38:47 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db%6]) with mapi id 15.20.2516.013; Wed, 4 Dec 2019
 09:38:47 +0000
To: Ralph Boehme <slow@samba.org>, Noel Power <NoPower@suse.com>, Noel Power
 <NoPower@suse.com>, npower <npower@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Thread-Topic: Converting SMB1 tests to SMB2
Thread-Index: AQHVdUNqiOZWCa16a0elHejFomZ1kadQugh0gA6wbN+AAQJmgIAARkCAgAAQXgCAB2I8AIAAAnuAgAAJSYCAAAhSAIAADaSAgAAIYx6ADoq/AIAHznWAgALm3ICACU8HAIAMyTUAgAYLbYCAAEmiAIACBI8AgAjtegCAATN2gA==
Date: Wed, 4 Dec 2019 09:38:46 +0000
Message-ID: <16a391a4-c82b-5809-94b1-f4eb8fd8efb0@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
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
 <c25ed441eedb2a864429c0154859f2afe95f38cb.camel@samba.org>
 <f3fcbb1f-a25c-f7cb-4023-fdef68e208a8@suse.com>
 <a146e395-f9ca-12d0-2cab-ca52e8209706@suse.com>
 <f7229830-b844-a509-ed31-9707e0101666@suse.com>
 <e09044be-713a-f074-ed2f-e41168646d81@samba.org>
 <7a86b0cd-9eea-d077-69ac-9077d0cc12c8@suse.com>
 <70b3cc00-1f71-4f17-f9c4-8fd72b41543f@suse.de>
 <150ed4fe-84d7-f1b4-18aa-5443e063a355@samba.org>
In-Reply-To: <150ed4fe-84d7-f1b4-18aa-5443e063a355@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [51.37.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ea2ff39-dfbe-4df4-1469-08d7789dc22c
x-ms-traffictypediagnostic: DM6PR18MB2620:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xEdpXZqfAl9h3p+aJzqBIuXImn2eIEp0IbqFqnFUR4Je1znaG1kWCU8tRy+nMP4d1/xN6NTxw35FeZ5mDMeZ1FWex2DIPcZUbFYjJsWqKvie0aI/T1alPfRCzSFHg9VT3toHuLgEMV7hAsFjMreQEbM4ddIurXHjACYp8duTH0CBoPxgl4FVOdiAE8A2W42NAiA7xjsNRi3mcC5dJidP6wyBXt8lV4xCtgTb8d3/0d7hsh7vSHq/TCm9UCyJn5DhYptZfQcrC0Zh9CKemW8zKLD8MHZezgSYsX1V9dF5fM7Sf0TqOdLFaz+Rb4SYi4SPxs+Dv9Zin6+Mv9Ifbc3EgV0ihevu0qIG43yrvYs5Y/IFOGfi/b17yuRwynB4vfT64AjIXPEV1kFizfRH3zRo0N591ay7KAqj4jUirMAtjBOaP+E1fkSkTKtLBVioIYMthsrrzg51OgNNQ0yuh7QZSMaj4K5VZ7XjpHuAuIluts0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CE88AF61E05BF4CB4F9FE96D8E8D71D@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea2ff39-dfbe-4df4-1469-08d7789dc22c
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G6rNP+y8uLne7sY+UqJqXPOKojNbX9swdeereF8YOYaXp+s6WBkMHNU3SNNzRAVMHLMeyho0qXXSWrykcitywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2620
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
Cc: Stefan Metzmacher <metze@samba.org>, David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgUmFscGgNCg0KT24gMDMvMTIvMjAxOSAxNToxOCwgUmFscGggQm9laG1lIHdyb3RlOg0KWy4u
Ll0NCj4+IG9rLCBJIHBva2VkIGFyb3VuZCBhIGJpdCB3aXRoIHRoaXMgYWdhaW4gdG9kYXksIHdp
dGggdGhlIGFkX2RjX250dmZzDQo+PiBjaGFuZ2VzIHRoZSBsYW5kc2NhcGUgb2YgZXJyb3JzIHNl
ZW1zIGEgbGl0dGxlIGRpZmZlcmVudCBhbmQgbXkNCj4+IGltcHJlc3Npb24gaXMgbm90IGFzIG1h
bnkgbm93IGhhbmcuIFNvIG1heWJlIHN1Y2ggaW5zdHJ1Y3Rpb25zIGNvdWxkIGJlDQo+Pg0KPj4g
wqAgKyBhcHBseSBhIHNtYWxsIHBhdGNoIHRvIHRoZSBleGlzdGluZyBza2lwIGZpbGUgWzFdDQo+
Pg0KPj4gwqAgKyBhcHBseSBwYXRjaGVzIHdlIGhhdmUgYWxyZWFkeSB0byBtYWtlIHRoZSBlbnZz
IGRlZmF1bHQgbm90IG5lZ290aWF0ZQ0KPj4gU01CMSAod2l0aCB0aGUgZXhjZXB0aW9uIG9mIGFk
X2RjX250dmZzKQ0KPj4NCj4+IMKgICsgcnVuIGF1dG9idWlsZCBvciBzdWJtaXQgdG8gZ2l0bGFi
IGFuZCBzY3JhcGUgdGhlIHN0ZG91dCBsb2dzIHdpdGggWzJdDQo+Pg0KPj4gVGhhdCBzaG91bGQg
c3VmZmljZSBmb3IgKHJlKWNyZWF0aW5nIGEgc2tpcCBmaWxlDQo+Pg0KPj4gc2tpcCBmaWxlIGF0
DQo+Pg0KPj4gaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vZGV2ZWwvc2FtYmEvY29tbWl0
cy9ucG93ZXJfd2l0aF9zbWIyX250dmZzDQo+Pg0KPj4gd2FzIGdlbmVyYXRlZCB1c2luZyBhYm92
ZSBzdGVwcywgdmVyaWZpZWQgaGVyZQ0KPj4NCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10
ZWFtL2RldmVsL3NhbWJhL3BpcGVsaW5lcy85OTA0NjY3Ng0KPiBMb29raW5nIG11Y2ggYmV0dGVy
Lg0KPg0KPiBNYW55LCBtYW55IHRvcnR1cmUgdGVzdCByZWFsbHkgY291bGQgYmUgcnVuIG9ubHkg
YWdhaW5zdCBvbmUgZW52IGluc3RlYWQNCj4gb2YgYWRfZGMgYW5kIG50NF9kYywgZWcNCj4NCj4g
c2FtYmEzLmJhc2UgLT4gZmlsZXNlcnZlciAoYW5kIHRoZW4gZmlsZXNlcnZlcl9zbWIxKQ0KPiBz
YW1iYTMucmF3IC0+IGRpdG8NCj4NCj4gQnV0IHRoYXQgaXMgcHJvYmFibHkgYSBsb3Qgb2Ygd29y
ayBvbmx5IHNhdmluZyBvbmUgc21iMSBlbnYuDQoNCnNvIGp1c3QgdG8gYmUgY2xlYXIsIGZvciBl
eGFtcGxlIHNhbWJhMy5iYXNlIC4qIHRlc3RzIHJ1biBnZW5lcmFsbHkgaW4NCm9uZSBvciBtb3Jl
IG9mIHRocmVlIGVudmlyb25tZW50cyAoYWRfZGMsIGZpbGVzZXJ2ZXIsIG50NF9kYykgZWl0aGVy
DQpmaWxlc2VydmVyICpvciogYm90aCAoYWRfZGMgJiBudDRfZGMpIHNvIHlvdSBwcm9wb3NlIGFz
IGEgZ2VuZXJhbCBydWxlDQp3ZSBydW4gYWxsIHRoZXNlIHRlc3RzIG5vdyBpbiBmaWxlc2VydmVy
ID8gKHJlYWxpc2luZyBvZiBjb3Vyc2UgdGhlcmUNCm1heSBiZSBzb21lIHRlc3RzIHRoYXQgZm9y
IHNvbWUgcmVhc29uIHJlYWxseSBkbyBuZWVkIHRvIHJ1biBpbiBhZF9kYyBvcg0KbnQ0X2RjIGJ1
dCBub3QgYm90aCkNCg0KYW5kIHNhbWUgcHJvcG9zYWwgZm9yIHNhbWJhMy5yYXcgKHdoaWNoIHVz
ZXMgYWRfZGMsIG50NF9kYyBvcg0KKnNpbXBsZXNlcnZlciopIHNvIGFnYWluIHJ1biBhbGwgaW4g
ZmlsZXNlcnZlciA/DQoNCkkga25vdyB0aGVzZSBhcmUgcHJvYmFibHkgYm9yaW5nIHF1ZXN0aW9u
cyBidXQgY3VycmVudGx5IHdoaWxlIEkNCnVuZGVyc3RhbmQgYSBiaXQgYWJvdXQgdGhlIG1lY2hh
bmljcyBvZiBob3cgdGhlIHRlc3Qgc3lzdGVtIHdvcmtzIEkNCmRvbid0IHJlYWxseSBoYXZlIGFu
eSBrbm93bGVkZ2UgYWJvdXQgdGhlIGVudmlyb25tZW50cyBhbmQgd2hhdCB0aGV5DQp0YXJnZXQs
IHdoZW4geW91IHNob3VsZCB1c2Ugb25lIGluc3RlYWQgb2YgYW5vdGhlciBldGMuIFNvLi4uIGhv
cGVmdWxseQ0KeW91IHdpbGwgdW5kZXJzdGFuZCB3aHkgSSBjdXJyZW50bHkgbG9vayBmb3Igc3Bl
Y2lmaWMgKGFuZCBwcm9iYWJseQ0Kb2J2aW91cyB0byBldmVyeW9uZSBlbHNlKSBkZXRhaWxzDQoN
Cj4NClsuLi5dDQo+PiAmID49IFNNQjIgdGhlIGZvbGxvd2luZyBlbnZpcm9ubWVudHMgYXJlIGFm
ZmVjdGVkDQo+PiBlLmcuIFRoZSBmb2xsb3dpbmcgYXJlIGp1c3QgYSBmZXcgZXhhbXBsZXMgb2Yg
bGVnaXRpbWF0ZSB0ZXN0cyAodGhhdA0KPj4gZG9uJ3QgbmVlZCBwb3J0aW5nKSB0aGF0IGN1cnJl
bnRseSB3b3VsZCBmYWlsIGlmIHJ1biBhZ2FpbnN0DQo+PiBlbnZpcm9ubWVudHMgdGhhdCBjYW5u
b3QgbmVnb3RpYXRlIFNNQjENCj4+DQo+PiBzYW1iYTMuYmxhY2tib3guYWNsX3hhdHRyLk5UMVwo
ZmlsZXNlcnZlclwpDQo+IHJlbW92ZSB0aGlzIG9uZSwgb25seSBydW4gdGhlIFNNQjMgdmFyaWFu
dC4NCj4NCj4+IHNhbWJhMy5ibGFja2JveC5pbmhlcml0X293bmVyLmRlZmF1bHQuTlQxXChmaWxl
c2VydmVyXCkNCj4gZGl0by4gQWxzbyBsaWtlbHkgdHJ1ZSBmb3IgYWxsIHRoZSBvdGhlciBibGFj
a2JveCB0ZXN0cyB0aGF0IHJ1biBOVDEgYW5kDQo+IFNNQjMuIEJVdCBhZ2FpbiBwbGVhc2UgbWFr
ZSBtaWNybyBjb21taXRzIHNvIHdlIGNhbiByZXZpZXcgYW5kIHRlc3QNCj4gaW5kaXZpZHVhbGx5
Lg0KPg0KPj4gc2FtYmEzLmJsYWNrYm94LnNtYmNsaWVudF9iYXNpYy5OVDFcKG50NF9kY19zY2hh
bm5lbFwpDQo+IHJlbW92ZSBpdC4NCj4NCj4+IHNhbWJhMy5ibGFja2JveC5zbWJjbGllbnRfbGFy
Z2VfZmlsZSAtbU5UMSAtZSBOVExNXChudDRfZGM6bG9jYWxcKQ0KPiByZW1vdmUgaXQuDQpJIHRo
b3VnaHQgZnJvbSBwcmV2aW91cyBjb252ZXJzYXRpb25zIHRoYXQgdGhlcmUgd2FzIGEgcmVxdWly
ZW1lbnQgdG8NCmxlYXZlIGFsbCBTTUIxIHRlc3RzIGludGFjdCBhbmQgcnVubmluZyB1bnRpbCB0
aGUgU01CMSBjb2RlIGlzIHJlbW92ZWQ/DQpJcyB0aGlzIG5vIGxvbmdlciBhIHJlcXVpcmVtZW50
IG9yIGlzIHRoZXJlIGEgc3BlY2lhbCBydWxlIHRvIHVzZSB3aGVuDQp3aWVsZGluZyB0aGUgYXgg
KGp1c3QgdG8gYmUgY2xlYXIgSSBhbSBub3Qgb3Bwb3NlZCB0byByZW1vdmUgU01CMSB0ZXN0cw0K
Oi0pIEkganVzdCB3YW50IHRvIHVuZGVyc3RhbmQgdG8gdW5kZXJzdGFuZCB0aGUgYW1iaWd1aXR5
IChvciByZWFsaXNlIGlmDQpJIG1pc3VuZGVyc3Rvb2QpDQo+PiBBZGRpdGlvbmFsbHkgdGhlcmUg
YXJlIHF1aXRlIGEgZmV3IHRlc3RzIHRoYXTCoCB1c2Ugc21iY2xpZW50NCAoYW5kIG90aGVyDQo+
PiBzNCBjbGllbnRzLCBlLmcuIGNpZnNkZCwgbG9ja3Rlc3QgZXRjLikgYW5kIHRoZXNlIGFsbCB3
aWxsIGZhaWwgYmVjYXVzZQ0KPj4gdGhleSBhZmFpY3MgY2Fubm90IGhhbmRsZSBzbWIyLiBDb3Vs
ZCB3ZSByZXBsYWNlIHVzZSBvZiBzbWJjbGllbnQ0IHdpdGgNCj4+IHMzIHNtYmNsaWVudCBpbiB0
aGVzZSB0ZXN0cz8NCj4gT2gsIHRoYXQncyBhIGdvb2QgcXVlc3Rpb24uIDopIEkgZ3Vlc3MgYXQg
bGVhc3QgdGhlDQo+IHNhbWJhNC5ibGFja2JveC5raW5pdCB0ZXN0cyBjb3VsZCB1c2Ugc21iY2xp
ZW50IGZyb20gczMuDQpnb29kDQo+DQo+PiB3aGF0IGlzIHRoZSBwbGFuIGZvciBzbWJjbGllbnQ0
LCBpdCBkb2Vzbid0DQo+PiBzZWVtIGZ1bGx5IGZlYXR1cmVkLCBpcyBpdCByZWFsbHkgdXNlZCBv
dXRzaWRlIHRoZSB0ZXN0cywgaXMgaXQgd29ydGgNCj4+IGludmVzdGluZyB0aW1lIHRvIGNvbnZl
cnQgaXQgdG8gdXNlIHNtYjIgPw0KPiBOby4NCm9rIDotKQ0KPg0KPj4gSSBzZWUgY2lmc2RkIGlz
IHBhcnQgb2YgdGhlDQo+PiBzYW1iYSBzdWl0ZSBzbyB0aGlzIG9uZSBuZWVkcyBhZGp1c3Rpbmcg
dG8gYmUgYWJsZSB0byB1c2UgPj0gU01CMg0KPiBJZiBmZWVsIGxpa2UgcmVtb3ZpbmcgaXQsIGJ1
dCBtYXliZSBzb21lb25lIHdhbnQgdG8gY29udmVydCBpdC4gVW50aWwNCj4gdGhlbiB0aGUgdGVz
dCB1c2VzIGFkX2RjX250dmZzIGVudiwgc28gaXQgY2FuIHN0YXkgYXMgaXQgaXMuDQp3ZWxsIGNp
ZnNkZCBpcyBhZmFpY3Mgbm90IHNwZWNpZmljIHRvIGFkL2RjIG9yIGFkX2RjX250dmZzLCBwcm9i
YWJseQ0KZmlsZXNlcnZlciBpcyBhIGJldHRlciBjaG9pY2UsIEkgYWxyZWFkeSBzdGFydGVkIHRv
IHBvcnQgaXQgKGFuZCBoYXZlIGFuDQp1Z2x5IHZlcnNpb24gd29ya2luZywgb24gdGhlIGJhY2sg
YnVybmVyIGZvciB0aGUgbW9tZW50LCBJIGd1ZXNzIEknbGwNCmNvbWUgYmFjayB0byBpdCBsYXRl
cikNCj4NCj4+IFdoYXQgYWJvdXQgczRtZW1iZXI/IChhbmQgb3RoZXIgZW52cyB0aGF0IGFyZSBk
ZXBlbmRhbnQgb24gYWRfZGNfbnR2ZnMpDQo+PiBzaG91bGQgdGhlc2UgYmUgYWRkaXRpb25hbGx5
IHRyZWF0ZWQgdGhlIHNhbWUgYXMgYWRfZGNfbnR2ZnMgYW5kIGFsbG93DQo+PiBTTUIxIGFsc28g
Pw0KPiBJaXJjIHM0bWVtYmVyIHN0aWxsIHVzZXMgdGhlIE5UVkZTIHM0IGZpbGVzZXJ2ZXIgaW4g
bXkgYnJhbmNoLCBzbyB5ZXMsDQo+IGlpcmMgbXkgaWRlYSB3YXMgdGhhdCBhbGwgdGhvc2Ugc2hv
dWxkIGtlZXAgc21iMS4NCm9rDQoNCj4NCj4gYnR3IEkgb3BlbmVkIGh0dHBzOi8vZ2l0bGFiLmNv
bS9zYW1iYS10ZWFtL3NhbWJhL21lcmdlX3JlcXVlc3RzLzk0NyBmb3INCj4gc29tZSBwcmVwIHdv
cmsgdG8gc3BsaXQgdGVzdHMgc28gdGhleSBjYW4gYmUgZGl2aWRlZCBhY3Jvc3MgZW52cyB0aGF0
DQo+IGFyZSBTTUIyIG9ubHkgYW5kIHN0aWxsIHN1cHBvcnQgU01CMSAoaWYgd2UgZXZlciBnZXQg
dG8gdGhhdCBwb2ludCA6LT4+Pj4pDQo+IEknbGwgdGFrZSBhIGxvb2sgdG9tb3Jyb3chDQo+DQp0
aGFua3MgYWxvdCwNCg0KTm9lbA0KDQo=

