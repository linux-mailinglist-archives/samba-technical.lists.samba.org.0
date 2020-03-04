Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B3E178DAC
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 10:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=B8GG9wUoUZehw7nEa0OLqmfB9Vx7UULM1Bkhk9DRVsA=; b=SIGSXxMFCbyEfjbmZNm+8BguPb
	MpbjQ5KyzxIKEzhsGmcEKuVmAk7cOBV2rPYj+KV++92qfszCO3XdTlPxdOzC1u6VPKEQUvQZu+eCZ
	MuqnUw4dTE7KEktt6em9+ndUEFXWzHh6hhAOalimU8/c8cSbclyVSKOlJCII3V3FPL78rorBdtjrS
	VFyXVMlLDrGjzxuFgsicKRS1a4V/fripDarKgyv8nFQD1qQOcO27pXKsezRURI/O20KAQxx7DqnQ1
	nQZ2ZLR3fa3E5TfBAWV6Qf3Mf95ZZhFighiPGCrTnT2KqRrSlwUsDVKTywx4PxY3PdZBf4QU6peN3
	XVwOCFLA==;
Received: from localhost ([::1]:31054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9QYc-00Etqf-1W; Wed, 04 Mar 2020 09:43:14 +0000
Received: from mail-eopbgr700093.outbound.protection.outlook.com
 ([40.107.70.93]:55232 helo=NAM04-SN1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j9QYV-00EtqX-KU
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 09:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apfx+diCiMuo7JD8oeDhD56EDMNy5oyIcPp4FUOB30fa/m/zOcHneJreKAqe6ZxWgmA7YkoqOEKSX8ym0UYXJkDBs3ppJVS6aYpj84R0OQr/PSPcSM6wXlLagm6AXYUejtjCYPM1QQla/bg6ydglxe3xuLnG/BYh8LTrTAxSzjoBPS0CLBojGUzjPNo2dZ1v75/ZYfTGzx8jY8y4O+Lr8/ydtDITbxIg1iQpygfmv/YSTHhThfNQdLChLNEwuWO1a3/Vua65U8/BImB6QpsajLZY7Zg/t/IgVWhp10N4YRVjX0+usOxuzF6QLSIraWiEEzyo1Cpzd1U9RImdVzvgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBZnPYqzWKG2ihoZoGJ8cJhAIFEF7ztosuCGHocJyKA=;
 b=luX86VKkkyRMyo8VBfqnApnKSa2qrd4nKfUKSH71IU9Jy6dUdf2oDMYMz0Lbaj/JwrrDsf2JDRip7gtaW1iMQQrgL5J82lR+rfx/WOA5b+NYo9ND5FQLdujUj2jGshm5+i/+fJr872o0Rh4TQrcHLEKkGFfXhkAy6WrqqqCRpffa1QHVfDT/f4VuDvGTD53Q+ZNV0H9+xcbpXaqUyK1i76w0cIrjLSAIxzffE12lNhRiPR/387Q8zqeLmc4k20A5Q/4YhXUB9TYZWnnRRcuz/ToDmogBZpH5bkLQKFwtqXiLSJR1wef2pAmJTUGiKum8izOQeHapGDt2X0eX3FT9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oregonstate.edu; dmarc=pass action=none
 header.from=oregonstate.edu; dkim=pass header.d=oregonstate.edu; arc=none
Received: from BYAPR11MB3782.namprd11.prod.outlook.com (2603:10b6:a03:fd::32)
 by BYASPR01MB0012.namprd11.prod.outlook.com (2603:10b6:a03:15::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Wed, 4 Mar
 2020 06:06:40 +0000
Received: from BYAPR11MB3782.namprd11.prod.outlook.com
 ([fe80::50f8:84b3:699:1f0a]) by BYAPR11MB3782.namprd11.prod.outlook.com
 ([fe80::50f8:84b3:699:1f0a%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 06:06:40 +0000
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Subject: Re: Python 3.6 for Samba 4.13 in Sep 2020?
Thread-Topic: Python 3.6 for Samba 4.13 in Sep 2020?
Thread-Index: AQHV8cPrjldwcwyRUEWq0C2KJ4nFI6g3sk/GgAAeyACAACFGtg==
Date: Wed, 4 Mar 2020 06:06:40 +0000
Message-ID: <BYAPR11MB378223980DE97417B1DBAA9BD1E50@BYAPR11MB3782.namprd11.prod.outlook.com>
References: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
 <BYAPR11MB378209425F94DF58453AE96CD1E50@BYAPR11MB3782.namprd11.prod.outlook.com>,
 <5b5200796a2d31c585fa20c5fcbb3cb4ef2eb4f8.camel@samba.org>
In-Reply-To: <5b5200796a2d31c585fa20c5fcbb3cb4ef2eb4f8.camel@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=morgan@oregonstate.edu; 
x-originating-ip: [71.238.20.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54952c3d-335f-4a3e-8fad-08d7c00234de
x-ms-traffictypediagnostic: BYASPR01MB0012:
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mXrKCWuJX3xrLKkr2KZOl7mj8PmQaXVoT4Zp0m779H209T4GjScxK7KvAp4FdtW7AKmp1BecyIZus3/LnnRJuMTuyd8LsJDQVf4rpBmbRE9Dd7uQdM+jtZ96hk1QS5aPovmZsHiajr1yHLYPl2KIfdclw++54qIvxitUR9Mq957ScFMqYSH1uxH5jkcL/+CwDsw/KbF4LD08NyVe2Eefh2k4HZsL8aur4k+7uwtlVja4TWE3vWajJXqUMtnNJUQVesfF0zBU8QurCaulCiVl67n43fm9/OLjSaMVUL52/G7pm9ZkEx6jpwj6tvoHb+a/sR7DG4uJrYSQIk4EreDjWT38UGLvbaKqd7ek6fL3n/j90jok+E8YQDRTxd5GRFVy5m9llfOVRrNKmBn+r+Y07zoW3WVjKiIGRyI6pzYm89xb1y9vse9K6Q4qpO+fXFWbCfdd4/PaxyyqvrTPHX9qUcic+0DWvACIIffaLnNAlj8oDNYTQHAb2y87nAgWyqNTSUIEDEER0O87y48RMx4iRw==
x-ms-exchange-antispam-messagedata: ISMntSsFwa744RuA0NiviIJgAu09LDO6RyyCSsIEEuLXkfs2qZucaef11PTIHBX4/6l+ftj5lyslBVJprkfnuS47kfu8KW4/5iN1EGVMYs/wBcDqcbIe8RLAkPj7b58PyDAHOd+iRGWUwzQcrfli/g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: oregonstate.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 54952c3d-335f-4a3e-8fad-08d7c00234de
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce6d05e1-3c5e-4d62-87a8-4c4a2713c113
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CZjEqA96VjYZg/YsHrLVRMd7YECQ2N8hKMy1k5AdBZqD9Y5HQqtElxpJ88znokspkNpUIWKF4noGmX7iykEJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYASPR01MB0012
X-Warn: EHLO/HELO not verified: Remote host 40.107.70.93
 (mail-eopbgr700093.outbound.protection.outlook.com) incorrectly presented
 itself as NAM04-SN1-obe.outbound.protection.outlook.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: "Morgan,
 Andrew Jason via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Morgan, Andrew Jason" <morgan@oregonstate.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

T2theSEgIFdlIGFyZSBydW5uaW5nIHRoZSBmaWxlc2VydmVyLCBub3QgYSBEQywgYW5kIHRoZSB0
aW1pbmcgbG9va3Mgb2theSBhbnl3YXlzLg0KDQpUaGFua3MsDQpBbmR5DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2hu
aWNhbC1ib3VuY2VzQGxpc3RzLnNhbWJhLm9yZz4gb24gYmVoYWxmIG9mIEFuZHJldyBCYXJ0bGV0
dCB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPg0K
U2VudDogVHVlc2RheSwgTWFyY2ggMywgMjAyMCA4OjA2IFBNDQpUbzogTW9yZ2FuLCBBbmRyZXcg
SmFzb24gPG1vcmdhbkBvcmVnb25zdGF0ZS5lZHU+OyBVcHN0cmVhbSBTYW1iYSBUZWNobmljYWwg
TWFpbGluZyBsaXN0IDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPg0KU3ViamVjdDog
UmU6IFB5dGhvbiAzLjYgZm9yIFNhbWJhIDQuMTMgaW4gU2VwIDIwMjA/DQoNCk9uIFdlZCwgMjAy
MC0wMy0wNCBhdCAwMjoxOSArMDAwMCwgTW9yZ2FuLCBBbmRyZXcgSmFzb24gd3JvdGU6DQo+IEhv
dyBsb25nIGNhbiB3ZSBleHBlY3QgdG8gcmVjZWl2ZSBzdXBwb3J0IGZvciBTYW1iYSB2NC4xMiAo
dGhlDQo+IHZlcnNpb24gdGhhdCB3aWxsIHdvcmsgb24gRGViaWFuIDkpPyAgV2lsbCB0aGF0IHN1
cHBvcnQgYWxpZ24gd2l0aA0KPiB0aGUgc3VwcG9ydCB0aW1lZnJhbWUgZm9yIERlYmlhbiA5LCBl
dGM/DQoNClNhbWJhIHJlbGVhc2VzIGFyZSBzdXBwb3J0ZWQgZm9yIDE4IG1vbnRocyBhZnRlciB0
aGUgcmVsZWFzZS4NCg0KaHR0cHM6Ly93aWtpLnNhbWJhLm9yZy9pbmRleC5waHAvU2FtYmFfUmVs
ZWFzZV9QbGFubmluZw0KDQpEZWJpYW4ncyBzY2hlZHVsZSBpcyBoZXJlOg0KaHR0cHM6Ly93aWtp
LmRlYmlhbi5vcmcvRGViaWFuUmVsZWFzZXMNCg0KQXNzdW1pbmcgb3RoZXIgdGhpbmdzIHN0YXkg
ZXF1YWwgaXQgbG9va3MgbGlrZSBTYW1iYSA0LjEyIHdvdWxkIEVPTCBpbg0KMjAyMS0wOSBhbmQg
ZGViaWFuIHdpbGwgRU9MIGluIDIwMjIgc29tZXRpbWUuDQoNCj4gV2UgdGVuZCB0byBsYWcgYmVo
aW5kIG9uIHVwZ3JhZGluZyBvdXIgT1MgdmVyc2lvbnMgYmVjYXVzZSBpdCdzIGEgYml0DQo+IHBh
aW5mdWwgb24gYSBsYXJnZSBmaWxlIHNlcnZlci4gIEkga25vdyB0aGF0J3Mgbm90IGEgZ3JlYXQg
cmVhc29uLA0KPiBidXQgaXQncyBuaWNlIHRvIHN0YXkgb24gYSBzdXBwb3J0ZWQgcGxhdGZvcm0g
YXMgbG9uZyBhcyBwb3NzaWJsZS4NCj4g8J+Zgg0KDQpTdXJlLiAgVGhhdCdzIHdoeSB3ZSBhc2sg
dGhlc2UgdGhpbmdzLg0KDQpBZGRpdGlvbmFsbHksIHlvdSB3aWxsIGFsd2F5cyBoYXZlIHRoZSBh
YmlsaXR5IHRvIGluc3RhbGwgYSBiYWNrcG9ydGVkDQpweXRob24zLCBvciBidWlsZCBqdXN0IHRo
ZSBmaWxlc2VydmVyIChlZyAtLWRpc2FibGUtcHl0aG9uKSB3aXRoDQpzb21ldGhpbmcgYXMgb2xk
IGFzIFB5dGhvbiAyLjYuDQoNCkkgaG9wZSB0aGlzIGhlbHBzIGNsYXJpZnkgdGhpcyBwcm9wb3Nh
bC4NCg0KVGhhbmtzIQ0KDQpBbmRyZXcgQmFydGxldHQNCg0KPiBUaGFua3MsDQo+IEFuZHkgTW9y
Z2FuDQo+IElkZW50aXR5ICYgQWNjZXNzIE1hbmFnZW1lbnQNCj4gT3JlZ29uIFN0YXRlIFVuaXZl
cnNpdHkNCj4NCj4gRnJvbTogc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWwtYm91bmNl
c0BsaXN0cy5zYW1iYS5vcmc+IG9uDQo+IGJlaGFsZiBvZiBBbmRyZXcgQmFydGxldHQgdmlhIHNh
bWJhLXRlY2huaWNhbCA8DQo+IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+DQo+IFNl
bnQ6IFR1ZXNkYXksIE1hcmNoIDMsIDIwMjAgNToyNSBQTQ0KPiBUbzogVXBzdHJlYW0gU2FtYmEg
VGVjaG5pY2FsIE1haWxpbmcgbGlzdCA8DQo+IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5v
cmc+DQo+IFN1YmplY3Q6IFB5dGhvbiAzLjYgZm9yIFNhbWJhIDQuMTMgaW4gU2VwIDIwMjA/DQo+
DQo+IEcnRGF5LA0KPg0KPiBJIHdvbmRlcmVkIGlmIHdlIGNvdWxkIHNldCBvdXIgbWluaW11bSBw
eXRob24gdmVyc2lvbiBhdCBQeXRob24gMy42DQo+IGZvcg0KPiBTYW1iYSA0LjEzPw0KPg0KPiBJ
dCBoYXMgdXNlZnVsIG5ldyBmZWF0dXJlcyBsaWtlIFBFUCA0OTg6IEZvcm1hdHRlZCBzdHJpbmcg
bGl0ZXJhbHMNCj4NCj4gaHR0cHM6Ly9kb2NzLnB5dGhvbi5vcmcvMy93aGF0c25ldy8zLjYuaHRt
bCN3aGF0c25ldzM2LXBlcDQ5OA0KPg0KPiBNb3JlIHBhcnRpY3VsYXJseSwgcmVjZW50IHRlc3Rz
IHNob3dlZCB0aGF0IHRoZSBvbmx5IHR3byBwbGF0Zm9ybXMNCj4gd2l0aG91dCBpdCBhcmUgVWJ1
bnR1IDE2LjA0IChYZW5pYWwpIGFuZCBEZWJpYW4gOSAoU3RyZWFjaCkuDQo+DQo+IERlYmlhbiAx
MCBoYXMgYmVlbiByZWxlYXNlZCBmb3IgNiBtb250aHMgbm93LCBhbmQgd2lsbCBoYXZlIGJlZW4g
b3V0DQo+IGZvciBtb3JlIHRoYW4gYSB5ZWFyIGJ5IHRoZSB0aW1lIHdlIHJlbGVhc2UgU2FtYmEg
NC4xMywgYW5kIGxpa2V3aXNlDQo+IHRoZXJlIHdpbGwgYmUgYSBuZXcgVWJ1bnR1IExUUyAyMC4w
NC4NCj4NCj4gVGhpcyBjYW1lIHVwIGJlY2F1c2UgYSBzbWFsbCBoZWxwZXIgc2NyaXB0IGZhaWxl
ZCB0byBwYXJzZSB3aGVuIHdlDQo+IGV4dGVuZGVkIHRoZSBzYW1iYS1vMyB0ZXN0cyAod2hpY2gg
cnVuIG9uIGVhY2ggaG9zdCkgdG8gaW5jbHVkZSB0aGUNCj4gbG9jYWwgIm5vbmUiIHRlc3RzDQo+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLy0vbWVyZ2VfcmVxdWVzdHMvOTM4
DQo+DQo+IEkgcmVhbGlzZSBpdCB3b3VsZCBiZSAnc2ltcGxlcicgdG8ganVzdCBjaGFuZ2UgdGhh
dCBzY3JpcHQsIGJ1dCBJDQo+IHdhbnRlZCB0byByYWlzZSB0aGUgYnJvYWRlciBxdWVzdGlvbiBp
biB0aGUgaG9wZSB0aGF0IHdlIGNvdWxkDQo+IHN0ZWFkaWx5DQo+IGluY3JlYXNlIHRoYXQgbWlu
aW11bSB2ZXJzaW9uLg0KPg0KPiBTZWUgaHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc2Ft
YmEvLS9tZXJnZV9yZXF1ZXN0cy8xMTkzDQo+DQo+IFRoYW5rcyENCj4NCj4gQW5kcmV3IEJhcnRs
ZXR0DQotLQ0KQW5kcmV3IEJhcnRsZXR0DQpodHRwczovL3NhbWJhLm9yZy9+YWJhcnRsZXQvDQpB
dXRoZW50aWNhdGlvbiBEZXZlbG9wZXIsIFNhbWJhIFRlYW0gICAgICAgICBodHRwczovL3NhbWJh
Lm9yZw0KU2FtYmEgRGV2ZWxvcG1lbnQgYW5kIFN1cHBvcnQsIENhdGFseXN0IElUIC0gRXhwZXJ0
IE9wZW4gU291cmNlDQpTb2x1dGlvbnMNCmh0dHBzOi8vY2F0YWx5c3QubmV0Lm56L3NlcnZpY2Vz
L3NhbWJhDQoNCg0KDQoNCg0KDQoNCg==
