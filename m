Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7371950BE
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 06:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=407qbvaXOwH4+VFCN4wAc2aTLnpq21I1BrERdNMs2lI=; b=hb+fU5OSVXtvO+y763Oyq8bOXR
	tr83wKfuUVU7jB8a4LcHmeaCB1u9rgjlg4lE6ABEp46u81CbWCbm2slHk65atJQLUQifIkDd4n54X
	Zckb9obUSZ9h9TICzpT3udbmi+A3ZYokysi8x5Ze0/A4MZBWG7pw0raE1Vbd2vKDg7Wj/AabRwjyp
	w1Zb4vGpGNYA1ngsvbZKw0uBMeqLH7sth3BnRRak55A/jj5Fg7qYWuLl8b7OFoaAeyEyAUW7U9qEo
	dSzRPPoHu3ksh8bxGctuEO/c4gjKmeGcrjCc40E8UsG29EgHSHvGaQa5ahUqUcoC5Fd45HXRgG1hW
	Kqd3sO6g==;
Received: from localhost ([::1]:39058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHhky-000peE-HR; Fri, 27 Mar 2020 05:42:12 +0000
Received: from mail-dm6nam12on2103.outbound.protection.outlook.com
 ([40.107.243.103]:17760 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jHhku-000pe7-2D
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 05:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z44uqVSccQvnDr4SEdHQGzndiOSyfPJdJody+6y+F+aQrIlHk7maprXUxLiVW8GUHEx5Lzg2DcRpq2gXIm9V6mb+cNOetyzf3spsxKb45CndNlhQBXFBvXG1bASCuneG85kOUfujFWTctvXU+eSSSj6/MGjQf5ElJRvZU+cXftbpbDv8kTH5zIgjXIVcXgvihlF+kEZXIiDvIvo6mpLvt2R7Nds2/1FJfmKv0JR2q5u7vf55XObbgQp+Bj9zBp3Ejy2wXk39obrNYp4glK0llVfmlhmO7OPx5gOEFCX/OrDjbMLk0u8CwR9ifAGEsH5X1Z0VQcYCPGkpQMgVZ19BSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=407qbvaXOwH4+VFCN4wAc2aTLnpq21I1BrERdNMs2lI=;
 b=NmI7udPVlW46ML/QOvNM5IANXawRo6zBQsvZopGOPJKRSIcGmH30moP4eug3kcJF7XLS/EkFJodX5JsOPKyv6TdXX+btZyrtNlB5TeIYEtqBU6jukGXZIoIfGIx/FRWewyaywsdEDMBqoYazCRBMG3S0sLujqDBFK5nXpk3N3tR8dGk861jw3BLw17MeytFzex/7rVN2FS72lmimtdpabmcf0wVIzLrpGwN80U3WOV9GNCwe1EOwliuifuKTEQkCpIl3GGeOPwl1zvOEsG9FBFJ0ok09kmf31JkU6t+1mcnScJjFvVKuaAI/AO10+jwhyX1VBBeCy1WeTJXKlkozcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=407qbvaXOwH4+VFCN4wAc2aTLnpq21I1BrERdNMs2lI=;
 b=QTtfVH6nKNRCRsd4JLmocuQgsqhM2NnkhnVw6FjDSMbDYUyhphc+x5PiSK2R93Zkf3AkzWM/w+wt0YDXpa2i/pm5fNYQoMtq9+ZuMCWvI2T4/VdzjuW/yLQ+lImyPuuKKFKPemwy4BodZN+JZCL+PvTS4MvYoeR69EvZgrOzD3M=
Received: from BN8PR21MB1155.namprd21.prod.outlook.com (2603:10b6:408:73::10)
 by BN8PR21MB1203.namprd21.prod.outlook.com (2603:10b6:408:76::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.2; Fri, 27 Mar
 2020 05:41:21 +0000
Received: from BN8PR21MB1155.namprd21.prod.outlook.com
 ([fe80::d11:18b7:289c:ea17]) by BN8PR21MB1155.namprd21.prod.outlook.com
 ([fe80::d11:18b7:289c:ea17%7]) with mapi id 15.20.2878.000; Fri, 27 Mar 2020
 05:41:21 +0000
To: =?utf-8?B?QXVyw6lsaWVuIEFwdGVs?= <aaptel@suse.com>,
 "longli@linuxonhyperv.com" <longli@linuxonhyperv.com>, Steve French
 <sfrench@samba.org>, "linux-cifs@vger.kernel.org"
 <linux-cifs@vger.kernel.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] cifs: Remove locking in smb2_verify_signature() when
 calculating SMB2/SMB3 signature on receiving packets
Thread-Topic: [PATCH] cifs: Remove locking in smb2_verify_signature() when
 calculating SMB2/SMB3 signature on receiving packets
Thread-Index: AQHWAtFD/Rup8jtV9E+7q8K5j1eLM6hao/yAgAFKpPA=
Date: Fri, 27 Mar 2020 05:41:21 +0000
Message-ID: <BN8PR21MB1155DCB17C62EDCE529922ABCECC0@BN8PR21MB1155.namprd21.prod.outlook.com>
References: <1585159997-115196-1-git-send-email-longli@linuxonhyperv.com>
 <87d08zzbg6.fsf@suse.com>
In-Reply-To: <87d08zzbg6.fsf@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=longli@microsoft.com; 
x-originating-ip: [2001:4898:80e8:a:ede4:db5c:c6fe:798]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad504827-4ce4-4ebe-7e70-08d7d2117ae9
x-ms-traffictypediagnostic: BN8PR21MB1203:
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xFMuafOfg2MpYCRW0J73xk2KyU92z9bBTq33fh3dW3k0v7Sl57vRRTLl6ZzewWDD+28DytyOpvo+5+JOlEtajK3pXsOVZ4OKyrphyp+0ycWbCqHhEpPtcl7jz8yqp8M6uCOazbnTKaavggh9CywS+mDoIPzLXFn5YGJB13Q8AetDTpf+jSq5tIKJ6gOTMmqCp4xPm0FTGkBTtSypch+Ti3UH0gjL838eZmZ5y022CDvBHmb6B9mrG+AqTGgnb78dkeCBfVV9q80ltJfXg+2+17Wl6DCDlGV/C3MwnekMVKkeY5sKGkxFySWFQD2Gpx9Ii6N3lUMUQcRzYfrX/wa4d6IzdqGuQXWXHN1Lumb+NkqvHt6roHaVKUWb05qtiutNIYM7uCnIsnQzkmSWzZqcqxzlB0SJiZC6GwYmocEbLlGbU3XJrOq7X6A6RgwaM7yY
x-ms-exchange-antispam-messagedata: 6g8bW7480c+UwuZH9UdUt741PkIhZZDYJ1waNUbQhZ7kVFExXNYhXMXUhfZJf/louplyQNADf0M3PssQYL0mxiMD3iL8ULDKYrDGOcho6C6XmnJjiga5uAD52SpLpcxKr92lFMN7Lla+k3V1kVgIAs1Ki31vq+F5/eC4qi1bHdeWr1rc4DQB3S3/AShoIkqKj9tN78ISZoUpI0SrpjbMqA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad504827-4ce4-4ebe-7e70-08d7d2117ae9
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2nJ3RyqF9OWpy+XBO4S1JDSrFM2nnpKcF+Z3r5g41ymIQha5BV6eEGFkKgmOtTSCluB5t7jppAarUmao6tEPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR21MB1203
X-Warn: EHLO/HELO not verified: Remote host 40.107.243.103
 (mail-dm6nam12on2103.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
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
From: Long Li via samba-technical <samba-technical@lists.samba.org>
Reply-To: Long Li <longli@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

PlN1YmplY3Q6IFJlOiBbUEFUQ0hdIGNpZnM6IFJlbW92ZSBsb2NraW5nIGluIHNtYjJfdmVyaWZ5
X3NpZ25hdHVyZSgpIHdoZW4NCj5jYWxjdWxhdGluZyBTTUIyL1NNQjMgc2lnbmF0dXJlIG9uIHJl
Y2VpdmluZyBwYWNrZXRzDQo+DQo+bG9uZ2xpQGxpbnV4b25oeXBlcnYuY29tIHdyaXRlczoNCj4+
IE9uIHRoZSBzZW5kaW5nIGFuZCByZWNlaXZpbmcgcGF0aHMsIENJRlMgdXNlcyB0aGUgc2FtZSBj
eXB0byBkYXRhDQo+PiBzdHJ1Y3R1cmVzIHRvIGNhbGN1bGF0ZSBTTUIyL1NNQjMgcGFja2V0IHNp
Z25hdHVyZXMuIEEgbG9jayBvbiB0aGUNCj4+IHJlY2VpdmluZyBwYXRoIGlzIG5lY2Vzc2FyeSB0
byBjb250cm9sIHNoYXJlZCBhY2Nlc3MgdG8gY3J5cHRvIGRhdGENCj4+IHN0cnVjdHVyZXMuIFRo
aXMgbG9jayBkZWdyYWRlcyBwZXJmb3JtYW5jZSBiZWNhdXNlIGl0IHJhY2VzIHdpdGggdGhlDQo+
c2VuZGluZyBwYXRoLg0KPj4NCj4+IERlZmluZSBzZXBhcmF0ZSBjcnlwdG8gZGF0YSBzdHJ1Y3R1
cmVzIGZvciBzZW5kaW5nIGFuZCByZWNlaXZpbmcgcGF0aHMNCj4+IGFuZCByZW1vdmUgdGhpcyBs
b2NrLg0KPg0KPlNvbWV0aGluZyBJJ3ZlIG9mdGVuIHdvbmRlcmVkOiB3aHkgZG8gd2Uga2VlcCBj
cnlwdG8gc3RhdGUgaW4gdGhlIHNlcnZlcg0KPnN0cnVjdHVyZSBpbnN0ZWFkIG9mIGNyZWF0aW5n
IGl0IGFzIG5lZWRlZCBpbiB0aGUgY2FsbGVyIHN0YWNrICh0aHVzIGF2b2lkaW5nIHRoZQ0KPm5l
ZWQgZm9yIGxvY2tzKS4gQUZBSUsgdGhlcmUncyBubyBzdGF0ZSB0aGF0IG5lZWQgdG8gYmUga2Vw
dCBiZXR3ZWVuDQo+c2lnbmluZy9lbmNyeXB0aW5nIGNhbGxzIGJlc2lkZSB0aGUgYWNjZXNzIHRv
IGtleXMuIElzIGl0IHRoYXQgZXhwZW5zaXZlIHRvDQo+Y3JlYXRlL3JlbGVhc2U/DQoNCk15IGd1
ZXNzIGlzIHRoYXQgY3J5cHRvX2FsbG9jX3NoYXNoKCkgaXMgYSBoZWF2eSBjYWxsPw0KDQo+DQo+
Q2hlZXJzLA0KPi0tDQo+QXVyw6lsaWVuIEFwdGVsIC8gU1VTRSBMYWJzIFNhbWJhIFRlYW0NCj5H
UEc6IDE4MzkgQ0I1RiA5RjVCIEZCOUIgQUE5NyAgOEM5OSAwM0M4IEE0OUIgNTIxQiBENUQzIFNV
U0UgU29mdHdhcmUNCj5Tb2x1dGlvbnMgR2VybWFueSBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIERFDQo+R0Y6IEZlbGl4IEltZW5kw7ZyZmZlciwgTWFyeSBIaWdnaW5zLCBT
cmkgUmFzaWFoIEhSQiAyNDcxNjUgKEFHIE3DvG5jaGVuKQ0K

