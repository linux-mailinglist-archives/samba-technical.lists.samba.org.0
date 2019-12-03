Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D710FC98
	for <lists+samba-technical@lfdr.de>; Tue,  3 Dec 2019 12:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=J9zX8ScfQxXZdzh+iyzj90M8bp/mOblwF9WdXTKdrbc=; b=efT2fG4bq2x2cD27Vamkt7LwY6
	cfnDosjJ2FVEc38CO4RVeW6ok2ZMqw6fMAaB2+OlEOIZMkI8N/Wzmcx+BfVJwrk/b1gxNVH+zo6lb
	PNRiGWpPHw3q2qXeBYuJ7eZNAoZyHJW6l6xozb03wsLCIbTMBeYAQxr3uDHvHQ1pGvLjKaWaQ1mwR
	YSyB6Xxgakh7SMs9TGFVwIyuh0hizB+MdnGgjOz8HFsH9lSNcAk2KgivXsmwjf5+0vf7eNjwkQI8d
	ndzMEZTyQLv8Tot4tYRr8m/kWVx3LhXIUvKrE5hzLFzLXq+tjpXietc5Qz75qLEQacknVTzQnnY/J
	8Tu2oA9Q==;
Received: from localhost ([::1]:33502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ic6YB-005o9p-Sa; Tue, 03 Dec 2019 11:41:03 +0000
Received: from smtp3.jd.com ([59.151.64.88]:2051) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim) id 1ic6Y2-005o8b-EG
 for samba-technical@lists.samba.org; Tue, 03 Dec 2019 11:41:00 +0000
Received: from BJMAILD1MBX22.360buyAD.local (172.31.0.22) by
 BJMAILD1MBX45.360buyAD.local (172.31.0.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1415.2; Tue, 3 Dec 2019 19:40:30 +0800
Received: from BJMAILD1MBX23.360buyAD.local (172.31.0.23) by
 BJMAILD1MBX22.360buyAD.local (172.31.0.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1415.2; Tue, 3 Dec 2019 19:40:30 +0800
Received: from BJMAILD1MBX23.360buyAD.local ([fe80::28e4:e9be:9dfd:bf5]) by
 BJMAILD1MBX23.360buyAD.local ([fe80::28e4:e9be:9dfd:bf5%17]) with mapi id
 15.01.1415.002; Tue, 3 Dec 2019 19:40:30 +0800
To: Martin Schwenke <martin@meltin.net>
Subject: =?utf-8?B?562U5aSNOiBjdGRiIDQuMTEuMiB2ZXJzaW9uIGZhaWxlZCB0byByZWNvdmVy?=
Thread-Topic: ctdb 4.11.2 version failed to recover
Thread-Index: AdWmfHNSooFM126fQ8yTFgxj1mNy/wACQcCQALAevIAAIaHzsA==
Date: Tue, 3 Dec 2019 11:40:30 +0000
Message-ID: <514ee7328ed64e62bda7f2ab5fcc70fa@jd.com>
References: <07289a1fd0a740db8e1f0abad2b7a49c@jd.com>
 <20191203142321.29eb01a3@martins.ozlabs.org>
In-Reply-To: <20191203142321.29eb01a3@martins.ozlabs.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.14.18]
Content-Type: text/plain; charset="utf-8"
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
From: =?utf-8?b?6IC/57qq6LaFIHZpYSBzYW1iYS10ZWNobmljYWw=?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?6IC/57qq6LaF?= <gengjichao@jd.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

PiAgSSBhbSB3b25kZXJpbmcgaWYgeW91IGFyZSB1c2luZzoNCg0KPiAgKiBpZmRvd24gPGRldmlj
ZT4gKHdoaWNoIHVuYXNzaWduZWQgdGhlIElQIGFkZHJlc3MpDQoNCj4gICogaXAgbGluayBzZXQg
PGRldmljZT4gZG93biAob3IgaWZjb25maWcgPGRldmljZT4gZG93bikNCg0KSSB1c2VkICppZmRv
d24gPGRldmljZT4gY29tbWFuZC4gVGhlcmUgYXJlIHR3byBwdXJwb3NlcyBvZiBteSB0ZXN0aW5n
Og0KVGhlIG1vc3QgaW1wb3J0YW50IG9uZSBpcyB0byBzaW11bGF0ZSBuZXR3b3JrIGNhcmQgZmFp
bHVyZS4gVGhlIHNlY29uZCBpcyB0aGF0IGFkbWluIGFjY2lkZW50YWxseSB0YWtlcyBkb3duIHRo
ZSB3cm9uZyBpbnRlcmZhY2UuDQoNCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6
OiBNYXJ0aW4gU2Nod2Vua2UgW21haWx0bzptYXJ0aW5AbWVsdGluLm5ldF0gDQrlj5HpgIHml7bp
l7Q6IDIwMTnlubQxMuaciDPml6UgMTE6MjMNCuaUtuS7tuS6ujog6IC/57qq6LaFIDxnZW5namlj
aGFvQGpkLmNvbT4NCuaKhOmAgTogc2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZw0K5Li7
6aKYOiBSZTogY3RkYiA0LjExLjIgdmVyc2lvbiBmYWlsZWQgdG8gcmVjb3Zlcg0KDQpIaSwNCg0K
T24gRnJpLCAyOSBOb3YgMjAxOSAwNzoyMDo1OSArMDAwMCwg6IC/57qq6LaFIHZpYSBzYW1iYS10
ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+IHdyb3RlOg0KDQo+ICAg
ICAgICBJIHVzZSB0aGUgY3RkYiBvZiA0LjExLjIgdmVyc2lvbiwgaW5jbHVkZSB0aGUgbmV3ZXN0
IA0KPiBwYXRjaChodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQx
NzUpLiBCdXQsd2hlbiBJIHRlc3QgdGhlIE5JQyBleGNlcHRpb24sIEkgZW5jb3VudGVyIGEgcHJv
YmxlbSwgdGhlIGN0ZGIgY2x1c3RlciBjYW4gbm90IFJlY292ZXIgTm9ybWFsLg0KPiAgICAgICAg
VGhlIHRlc3Qgc3RlcHMgYXJlIGFzIGZvbGxvd3M6DQo+IA0KPiAx44CBIGN0ZGIgY2x1c3RlciBo
YXZlIHR3byBuZG9lcywgbm9kZUEgYW5kIG5vZGVC77yMdGhlIGNsdXN0ZXIgc3RhdHVzIGlzIA0K
PiBPS+OAgg0KPiANCj4gMuOAgSBJZmRvd24gdGhlIG5vZGVBIGFuZCBub2RlQuKAmXMgTklDLCB3
aGljaCBjb25maWcgcHJpdmF0ZSBJUC4NCj4gDQo+IDPjgIEgQWZ0ZXIgMjUgc2Vjb25kcywgbm9k
ZUEgYW5kIG5vZGVCIGRldGVjaCBlYWNoIG90aGVyIGRlYWTvvIx0aGVuIGNhbGwgDQo+IHRoZSBm
dW5jdGlvbnM6IGN0ZGJfdGNwX3Jlc3RhcnQtPmN0ZGJfdGNwX25vZGVfY29ubmVjdCwNCj4gYnV0
IGJpbmQgZmFpbGVkLCBwcmludCB0aGUgbG9nOg0KPiANCj4gbm9kZSAxMC4yNDAuMjI2LjIxMTo0
Mzc5IGlzIGRlYWQ6IDAgY29ubmVjdGVkDQo+IA0KPiBUZWFyaW5nIGRvd24gY29ubmVjdGlvbiB0
byBkZWFkIG5vZGUgOjENCj4gDQo+IEZhaWxlZCB0byBiaW5kIHNvY2tldCAoQ2Fubm90IGFzc2ln
biByZXF1ZXN0ZWQgYWRkcmVzcykNCg0KSXQgcmVhbGx5IGRlcGVuZHMgd2hhdCB5b3UgYXJlIHRy
eWluZyB0byB0ZXN0IGFuZCBob3cgeW91IGFyZSBkb2luZyBpdC4uLg0KDQpJIGFtIHdvbmRlcmlu
ZyBpZiB5b3UgYXJlIHVzaW5nOg0KDQoqIGlmZG93biA8ZGV2aWNlPiAod2hpY2ggdW5hc3NpZ25l
ZCB0aGUgSVAgYWRkcmVzcykNCg0KKiBpcCBsaW5rIHNldCA8ZGV2aWNlPiBkb3duIChvciBpZmNv
bmZpZyA8ZGV2aWNlPiBkb3duKQ0KDQpUaGUgZmlyc3Qgb2YgdGhlc2UgZGVmaW5pdGVseSBkb2Vz
IG5vdCB0ZXN0IGFueXRoaW5nIGxpa2UgYSBoYXJkd2FyZS9saW5rIGZhaWx1cmUuICBOb3JtYWxs
eSwgaWYgYSBsaW5rIGdvZXMgZG93biB0aGUgSVAgYWRkcmVzcyB3aWxsIHN0YXkgb24gdGhlIGlu
dGVyZmFjZS4gIFRoaXMgY2FzZSBpcyBtdWNoIG1vcmUgbGlrZWx5IHRoYW4gdGhlIGNhc2Ugd2hl
cmUgYW4gYWRtaW4gYWNjaWRlbnRhbGx5IHRha2VzIGRvd24gdGhlIHdyb25nIGludGVyZmFjZS4N
Cg0KPiBzb2x1dGlvbjoNCj4gICAgICAgIHdoZW4gYmluZCBmYWlsZWQsIG5vIG9uZSB3aWxsIHJl
ZXN0YWJsaXNoIGNvbm5lY3Rpb25zLCBldmVuIHRoZSANCj4gTklDIGlzIHVwLiBJIHRoaW5rIHdo
ZW4gYmluZCBmYWlsZWQsIHdlIHNob3VsZCB1c2UgdGhlIHRpbWUgdG8gcmV0cnkuIA0KPiBUaGUg
cGF0Y2ggaXMgZm9sbG93LCBJIHRlc3QgaXQgd29yayB3ZWxs44CCDQo+IC0tLSBhL2N0ZGIvdGNw
L3RjcF9jb25uZWN0LmMNCj4gKysrIGIvY3RkYi90Y3AvdGNwX2Nvbm5lY3QuYw0KPiBAQCAtMjM2
LDYgKzIzNiwxMSBAQCB2b2lkIGN0ZGJfdGNwX25vZGVfY29ubmVjdChzdHJ1Y3QgdGV2ZW50X2Nv
bnRleHQgKmV2LCBzdHJ1Y3QgdGV2ZW50X3RpbWVyICp0ZSwNCj4gICAgICAgICAgICAgICAgIERC
R19FUlIoIkZhaWxlZCB0byBiaW5kIHNvY2tldCAoJXMpXG4iLCBzdHJlcnJvcihlcnJubykpOw0K
PiAgICAgICAgICAgICAgICAgY2xvc2UodG5vZGUtPm91dF9mZCk7DQo+ICAgICAgICAgICAgICAg
ICB0bm9kZS0+b3V0X2ZkID0gLTE7DQo+ICsgICAgICAgICAgICAgICB0bm9kZS0+Y29ubmVjdF90
ZSA9IHRldmVudF9hZGRfdGltZXIoY3RkYi0+ZXYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG5vZGUsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGltZXZhbF9jdXJyZW50
X29mcyg1LCAwKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjdGRiX3RjcF9ub2RlX2Nvbm5lY3QsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbm9kZSk7DQo+ICAgICAgICAg
ICAgICAgICByZXR1cm47DQo+ICAgICAgICAgfQ0KDQpTbywgd2hpbGUgeW91IGhhdmUgaWRlbnRp
ZmllZCBhIHNpdHVhdGlvbiBmcm9tIHdoaWNoIGN0ZGJkIGRvZXMgbm90IHJlY292ZXIgYW5kIHBy
b3ZpZGVkIGEgcG9zc2libGUgZml4LCBJIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB3aGF0IHlv
dSBhcmUgdHJ5aW5nIHRvIHRlc3QgYmVmb3JlIHdlIGFncmVlIG9uIHRoZSBiZXN0IGZpeC4gOy0p
DQoNClRoYW5rcy4uLg0KDQpwZWFjZSAmIGhhcHBpbmVzcywNCm1hcnRpbg0K

