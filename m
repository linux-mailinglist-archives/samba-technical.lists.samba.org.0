Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7622262F8
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 17:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ReBGB6i1XnC2QJcaeU070ORhGYeOXiKTRaPoaIxugDM=; b=mg5VhXRaRxlH95QQvWuuPmAD+w
	5dybKFgou19wIgi0haEoNaWlJvdbTcP5u0dmPwFAJ6GtkfH2CYOkWm4IAdka4FlpOWo6w2GzysQtw
	pb7YhnHP2q7llK3DnbQPFApLubY6tSTHDwLT/Zqq69KiFbr5yAoolA8Ie8QjjTUVXJYBhkywW6bTs
	xe3pAmhpo5Igstv1MyZIgESk1XnTaekBsKxyG3p2YDQk+9JLyHHfhB/Nwz8ju7AbuzVgvGcQxxJ2K
	in59p4KfFvwkjxNW/qv4/77AIh04fxwUNuTVPDlZRqpUZavzP7Hwd8noyVRxVb7M+CgADcYWItZ9b
	letNvsdw==;
Received: from localhost ([::1]:30838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxXOR-008tqN-T7; Mon, 20 Jul 2020 15:07:51 +0000
Received: from mail-eopbgr770119.outbound.protection.outlook.com
 ([40.107.77.119]:64533 helo=NAM02-SN1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jxXOJ-008tqG-Fe
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 15:07:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc91+ypr1ys/RxXw4A8KfuEe+S52+DLgKAfbG34e9lklr1RqCPaZ3oQz+VLFQNTvKxrCgYNzhjDoWLgQn98bjD7GnAZVS0RxjVOcv7URJF1Rg2VaTYMp31mZ25tNPbS/pFIdOEs7pd1tU8FjA8mni0cQnhwsopie0tqdivpQjFqS2Rp8/a13K/QSIAyCFT40rEQQYh/BaEHH+swAcLTv6K4iUSow34+ZCgdJWRyjd6WwWQv2Z1a8mPDGSf6EGlt+ZbnUepkKn5wXu/tvzu/SsIBbAtByWG/NUg8MvbU1DNFFx5htF4GBZW/0tDAff1g1jOo+8z1Cdyrpoa3cZVCBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReBGB6i1XnC2QJcaeU070ORhGYeOXiKTRaPoaIxugDM=;
 b=UF4RQsqWm1uppdofsk0sts1wTHUoWv3O7Tk7TvFbMrHQHFazh6NMUvACRd4wLMV10Phxx5n1yvA15RWemNB4mb8B8i0TkQuRwFleYApWyjY/Xk/5KODWZC7NGN+giGQZB1+jWeKkXf2px5RiBl012NlcPf+xiWKSAU57HE/ZEzc7NKFORpcyrDy9tl1R7jhJVoQJJhNmlDK1dzCei5x2sixayugfsqFHF3IRtl3axMuoIQ5KJ/mBIZ3ELe0bLUbcoUccCm7Utnj0RbbeMWvzxPLJmdl1ZFEQ00fsKcISL7wxrXmg2XTrNnQtlm0WEDdfMFsiT5+66i7m9EbD9IJ8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=commvault.com; dmarc=pass action=none
 header.from=commvault.com; dkim=pass header.d=commvault.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=commvault.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReBGB6i1XnC2QJcaeU070ORhGYeOXiKTRaPoaIxugDM=;
 b=hcPfvpy72eLJGg6OcP8uaQnRu4UTFMjBrzj6Aq5cKXECKKF08RamJs0rnEyExG7YLp5CuUccOnvKU/75nFroBaGZGASAUTao0+gIZz8DV6xq+OqN0+dvf0GK8bLhqF6siVYaLoGVZPknh1wYYhITnL+39A561r2k1KTH3knQfYc=
Received: from BY5PR19MB3096.namprd19.prod.outlook.com (2603:10b6:a03:182::29)
 by BYAPR19MB2423.namprd19.prod.outlook.com (2603:10b6:a03:12d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 20 Jul
 2020 15:07:27 +0000
Received: from BY5PR19MB3096.namprd19.prod.outlook.com
 ([fe80::a468:d4c3:9485:837]) by BY5PR19MB3096.namprd19.prod.outlook.com
 ([fe80::a468:d4c3:9485:837%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 15:07:27 +0000
To: Ralph Boehme <slow@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: RE: Samba 4.10.4 - Error loading module nfs4acl_xattr due to
 dependent libraries
Thread-Topic: Samba 4.10.4 - Error loading module nfs4acl_xattr due to
 dependent libraries
Thread-Index: AdZeZWKV0/pBpYqlScGFyi/z1rB3JAACIAAAAAk8DNA=
Date: Mon, 20 Jul 2020 15:07:27 +0000
Message-ID: <BY5PR19MB3096FAF614DA77FC3FB5F9C4DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
References: <BY5PR19MB3096D158005BDD10D2A4CF17DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
 <39d17620-cef7-7f45-a372-2a3a6d900591@samba.org>
In-Reply-To: <39d17620-cef7-7f45-a372-2a3a6d900591@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=commvault.com;
x-originating-ip: [103.226.169.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aea1ddad-c473-4fd3-6d59-08d82cbe9da4
x-ms-traffictypediagnostic: BYAPR19MB2423:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h9EzZeENAik/2GhiCrpAKDgm/3Wne02hgEA7ZKgrBpAPn+Am9TMx6VkK2I1Fsxsr/dk9oEAgA8axt+0AJvQY6mceFqX8dm5RPIFygy9BaU9yrHUj3v9EjGH4I3HGn8L7rf4R7oqFaM6JoiayWaBV/U3FVUIjg7I5SnLChUZXZQDo5TBlgDI7X24FH5sijUkbDntwjiCjYYCV5cYfEtgnDICCPgE+SWtrZNg1tlMBiY0wlB2kxWPXrLFCyaPl6Chlf2WMIBBGTNVxKkoVSCBn6DoVJAL0/aPAmZr/39kN/rxGIRgeO4Ujc7ivLDOfXQyyzDmYiyLYgd64bfIxz0F2mBqlrjJrTHZdBfWrxDzZzzvn81ySjyzPQsjGUt012B2oIs6kMEOA0O3KLnUn7y9Cxg==
x-ms-exchange-antispam-messagedata: tvQGwj/pPDWAkyxIDPBkg592OIHkj/WthsVFE5HCsVAZZRjtIX3uNwmI1wL9FNubhKz8TchkAIL4zFurob1hUcau8bi09DNMkn4ZEO5Fus/X6Y4AElJmo923KdYEPTD5bN0WPYOw51NYWgXDZLP5o4GVufb5zMvhqiPLbCSiWEnBs5zUYy6fCPMYEs6GHwbwT1RKGDB//nMjuDduUrN+9VLati0uaSayCNFqAESd94yyBfyzEUsKK6NsxP/zO5266XZYtE47fUn1CrCBzlIkE95/5BmgxGG87yTMfl95WxFbm3wZafKOtv1oz18VWqO4MsxiwanKC5YXU7eFLgvTDfDNA8AeHztx6e3eQVyx4SppDLleLOnVNASt52ClbjlP3LevNHZSJHFlgfBjOiM8TWp/bbzGwdtef88JgNvFeF4Bipwsht6Zo4nEIB6bjGjGWy5wgOlC4TAFW5ffF63J1QJRWlEOAEGOjE9I4M0cXBFDh7XXRAJ8Tlk9oLHIvKXP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: commvault.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR19MB3096.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea1ddad-c473-4fd3-6d59-08d82cbe9da4
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40ed1e38-a16e-4622-9d7c-45161b6969d5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMnacCvH7euyS5m2PA8fGcLYi05ZPCylYLaTJJKCQ4uTuBwJvB1WkOl+M0eOG6APMmSnMLzneZfXf4cff5DnB03Y2kallkB2oW173OHhTM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR19MB2423
X-Warn: EHLO/HELO not verified: Remote host 40.107.77.119
 (mail-eopbgr770119.outbound.protection.outlook.com) incorrectly presented
 itself as NAM02-SN1-obe.outbound.protection.outlook.com
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
From: Sandeep Nashikkar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sandeep Nashikkar <snashikkar@commvault.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYWxwaCBCb2VobWUgPHNsb3dA
c2FtYmEub3JnPiANCj4gU2VudDogTW9uZGF5LCBKdWx5IDIwLCAyMDIwIDE6NDUgUE0NCj4gVG86
IFNhbmRlZXAgTmFzaGlra2FyIDxzbmFzaGlra2FyQGNvbW12YXVsdC5jb20+OyBzYW1iYS10ZWNo
bmljYWxAbGlzdHMuc2FtYmEub3JnDQo+IFN1YmplY3Q6IFJlOiBTYW1iYSA0LjEwLjQgLSBFcnJv
ciBsb2FkaW5nIG1vZHVsZSBuZnM0YWNsX3hhdHRyIGR1ZSB0byBkZXBlbmRlbnQgbGlicmFyaWVz
DQoNCj4gQW0gNy8yMC8yMCB1bSAxMDowMiBBTSBzY2hyaWViIFNhbmRlZXAgTmFzaGlra2FyIHZp
YSBzYW1iYS10ZWNobmljYWw6DQo+ID4gSGVsbG8NCj4gPiANCj4gPiBJIGFtIHRyeWluZyB0byBs
b2FkIFZGUyBtb2R1bGUgbmZzNGFjbF94YXR0ciB3aGljaCBpcyBjb21waWxlZCBhbmQgbGlua2Vk
IG9uIFNhbWJhIDQuMTAuNCBhcyBzaGFyZWQgbW9kdWxlLg0KPiA+IEl0IGZhaWxzIHRvIGxvYWQg
d2l0aCBmb2xsb3dpbmcgZXJyb3I6DQo+ID4gDQo+ID4gICBFcnJvciBsb2FkaW5nIG1vZHVsZSAn
L3Vzci9saWI2NC9zYW1iYS92ZnMvbmZzNGFjbF94YXR0ci5zbyc6IA0KPiA+IGxpYmdzc2FwaS1z
YW1iYTQuc28uMjogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUg
b3IgDQo+ID4gZGlyZWN0b3J5DQo+ID4gDQo+ID4gSSBoYXZlIGJlZW4gdXNpbmcgdGhlIG1vZHVs
ZSBjb21waWxlZCB3aXRoIHNvdXJjZSB3aXRoIHNhbWJhIGluc3RhbGxlZCBmcm9tIHl1bSByZXBv
IHRpbGwgU2FtYmEgNC44LjMuIEkgZGlkIG5vdCBmYWNlIHRoaXMgaXNzdWUgYmVmb3JlLg0KPiA+
IENhbiBzb21lb25lIGd1aWRlIG1lIHdoeSBkb2VzIGl0IGRlcGVuZCBvbiB0aGlzIGxpYnJhcnkg
YW5kIGhvdyBjYW4gSSB0YWNrbGUgdGhpcz8gRG8gd2UgbmVlZCB0byBpbnN0YWxsIGFub3RoZXIg
cGFja2FnZSB0byBmdWxmaWxsIHRoZSBkZXBzPw0KPiA+IA0KPiA+IFRoZSBsaWJnc3NhcGktc2Ft
YmE0IGxpYnJhcnkgaXMgbm90IHByZXNlbnQgaW4gc3RhbmRhcmQgbG9jYXRpb25zIG9uIGEgc2V0
dXAgd2hlcmUgd2UgdXBncmFkZS9pbnN0YWxsIHRoZSBzYW1iYS00LjEwLjQgdGhyb3VnaCB5dW0g
cmVwb3NpdG9yeS4NCj4gPiBJdHMgcHJlc2VudCBpbiB0aGUgLi9iaW4vZGVmYXVsdC9zb3VyY2U0
L2hlaW1kYWxfYnVpbGQvbGliZ3NzYXBpLXNhbWJhNC5zbyB3aGVuIHdlIGJ1aWxkIHRoZSBzYW1i
YSBmb3IgdGhlIG1vZHVsZSBpdHNlbGYuDQo+ID4gSWYgd2UgcHJvdmlkZSB0aGUgTERfTElCUkFS
WV9QQVRIIGFuZCB1c2UgTERfREVCVUc9bGlicywgd2Ugc2VlIGl0IGxvYWRzIG1hbnkgbGlicmFy
aWVzIHdpdGggLXNhbWJhNCBzdWZmaXggZnJvbSB0aGF0IGRpcmVjdG9yeS4NCj4gPiANCj4gPiBE
byBJIG5lZWQgdG8gYnVpbGQgc2FtYmEgbW9kdWxlIHdpdGggYSBwYXJ0aWN1bGFyIGNvbmZpZ3Vy
ZSBmbGFnIHNvIHRoYXQgdGhlc2UgZGVwZW5kZW5jaWVzIGFyZSBub3QgcmVxdWlyZWQ/DQo+ID4g
QXBwcmVjaWF0ZSBhbnkgaGVscCBpbiBhZHZhbmNlLg0KDQo+IHdoYXRldmVyIHB1bGxzIGluIHRo
ZSBkZXBlZGVuY3kgZm9yIGxpYmdzc2FwaS1zYW1iYTQuc28gdG8gbmZzNGFjbF94YXR0ci5zby4u
LiB3aHkgZG9uJ3QgeW91IGp1c3QgcGFja2FnZSB0aGVtIHNvIHRoZXkncmUgYXZhaWxhYmxlIGF0
IHJ1bnRpbWU/DQo+DQo+IC1zbG93DQo+DQo+IC0tIA0KPiBSYWxwaCBCb2VobWUsIFNhbWJhIFRl
YW0gICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQo+IFNhbWJhIERldmVsb3Blciwg
U2VyTmV0IEdtYkggICBodHRwczovL3Nlcm5ldC5kZS9lbi9zYW1iYS8NCj4gR1BHLUZpbmdlcnBy
aW50ICAgRkFFMkM2MDg4QTI0MjUyMDUxQzU1OUU0QUExRTlCNzEyNjM5OUU0Ng0KDQpSYWxwaCwg
DQoNCkkgY291bGQgbm90IGZpbmQgd2hlcmUgbGliZ3Nzc2FwaS1zYW1iYTQgaXMgYWRkZWQgaW4g
YXMgYSBkZXBlbmRlbmN5LiANCkl0cyBidWlsdCBhcyBwYXJ0IG9mIGhlaW1kYWwgd2l0aCBiZWxv
dyB3c2NyaXB0Og0KDQpzb3VyY2U0L2hlaW1kYWxfYnVpbGQvd3NjcmlwdF9idWlsZDogICAgICAg
IGJ1bmRsZWRfbmFtZSA9IGxpYm5hbWUgKyAnLXNhbWJhNCcNCg0Kd2hlcmUgbGlibmFtZSBjb21l
cyBmcm9tOg0KDQogICAgSEVJTURBTF9MSUJSQVJZKCdnc3NhcGknLA0KICAgICAgICAgICAgICAg
ICAgICBIRUlNREFMX0dTU0FQSV9TUE5FR09fU09VUkNFICsgSEVJTURBTF9HU1NBUElfS1JCNV9T
T1VSQ0UgKyAnJycNCg0KSXQgaXMgbm90IGxpbmtlZCBleHBsaWNpdGx5IGFueXdoZXJlIGVsc2Ug
YXMgZmFyIGFzIEkgY291bGQgZ3JlcC4gDQoNCkkgc2VlIGZvbGxvd2luZyBsaWJzIHdoaWNoIGFy
ZSByZXF1aXJlZCBieSBuZnM0YWNsX3hhdHRyIG1vZHVsZS4gDQoNCmxpYmdzc2FwaS1zYW1iYTQu
c28uMg0KbGlicm9rZW4tc2FtYmE0LnNvLjE5DQpsaWJjb21fZXJyLXNhbWJhNC5zby4wDQpsaWJh
c24xLXNhbWJhNC5zby44DQpsaWJrcmI1LXNhbWJhNC5zby4yNg0KbGliei1zYW1iYTQuc28NCmxp
YndpbmQtc2FtYmE0LnNvLjANCmxpYmhjcnlwdG8tc2FtYmE0LnNvLjUNCmxpYmh4NTA5LXNhbWJh
NC5zby41DQpsaWJoZWltYmFzZS1zYW1iYTQuc28uMQ0KbGlic21ibGRhcGhlbHBlci1zYW1iYTQu
c28NCg0KUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZywgYnV0IGFyZSB5b3UgYXNraW5n
IHRvIGJ1bmRsZSBhbmQgc2hpcCBhbGwgdGhvc2UgbGlicyB3aGljaCBhcmUgcmVmZXJyZWQgYnkg
bmZzNGFjbF94YXR0ci5zbyBtb2R1bGUganVzdCBsaWtlIGxpYmdzc2FwaS1zYW1iYTQ/DQoNClRo
YW5rcywNClNhbmRlZXANCg==

