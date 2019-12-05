Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22F114071
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 13:01:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gZ974NLdMJxhPNM/+ruLPQ63W5Bi2JQURmwTRu56c+I=; b=hHc5JsJ2ExdLdNI/quDOrekU4M
	jpwpGMvgMy7A4IWq7HcIshNwXpO0wLSHptmPJgZeIbgNjgkd/8eYyYvwttioGZ4wXB7jBwhAB+pH0
	0HH9iev89sjFBowlu4rPD89tvOGlUtHLO62tDXSEFwkwKPJxegWOC5GPcQp21wmWe6dmqyiLmcRC6
	RTPmts+D0rGHQL1hVqpgEVkEjSyneXpQq5m1HkwbwX+8nstHC/PSuc4dH14G6YBGI7hJYQ3BpHiyy
	tdwDZCWSKx0jS+txSYz27HJ0I3o8HIBGbRfUZECkwis4m2+CTLCZIZLYYvOicLEgcqnBTPeWqEdwq
	W09veB0g==;
Received: from localhost ([::1]:45096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1icpp0-006C7f-Kk; Thu, 05 Dec 2019 12:01:26 +0000
Received: from m9a0002g.houston.softwaregrp.com ([15.124.64.67]:38856) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1icpow-006C5w-Cg
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 12:01:24 +0000
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  5 Dec 2019 12:00:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 5 Dec 2019 11:55:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 5 Dec 2019 11:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUez4KZF1+gbdIQz+XSp04TV3FVvJxP7yC824jvnPuMWXdCrNMCVFAVgKjvqYtlD0TkAmvg2wwWaKtxm7CV9YV0uLEaL0cnSho3rALllF7LJ/5GqX4rzkyaJLfxaIkXo9OOJGsAQjocAvOalZbeu43YcZBhjR4INp5Sf5WW7/lTvWrlA5UsvhTPUDboYwGqRe3uoasenxiamn9wni4Kvpd/Dsj3mhOy0yDk5lv1JNLxiA0zprlpOHkpm1L1Rg0W0BDYKgIJlWiEiaXf+3CzWp79KF+b6YHmL0MQOOhKto/kEaHDJ/StJbAROa2QQhdJPgKY1osGG/N0E6WzoDIvG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PzOWLO+LnhzW2E9vrqujd0a4Dc7hV9ePbDE2M1NCzM=;
 b=iYeefgZLlkL7VcSq+HbZw9uMQFuu+agu+0ZugxS7lJ+BcUrL8mcFjYyvKScwvpQIs4zogs3dP8Blk3jJZP86KskkrcjxUH9rgeZ5iL3TTAUnSufWeUi2ZULGVbGX1oxGbE3W+WnDcdaxPS6AydqOVHSUGWerftsF4SHYgyx4+1jBoor/yqwpcWA8KF8B9ECpackEgB91SnZlrDABTBuCrgdGUls8SzcZjAibEPqK2B4+bu1YVD9BXBi5X4piKyRUrnEp2/AyKu51TzSVa/jeVkdsSaXQ1DlowCV2wswIOyabVLbKiDFQf70Vgjen2dCVRkL2DHW/vWhK0yN+jqWxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.71.218) by
 DM6PR18MB3402.namprd18.prod.outlook.com (10.255.172.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Thu, 5 Dec 2019 11:55:19 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::2069:4bc2:2443:c7db%6]) with mapi id 15.20.2516.013; Thu, 5 Dec 2019
 11:55:19 +0000
To: Ralph Boehme <slow@samba.org>, Noel Power <NoPower@suse.com>, npower
 <npower@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Thread-Topic: Converting SMB1 tests to SMB2
Thread-Index: AQHVdUNqiOZWCa16a0elHejFomZ1kadQugh0gA6wbN+AAQJmgIAARkCAgAAQXgCAB2I8AIAAAnuAgAAJSYCAAAhSAIAADaSAgAAIYx6ADoq/AIAHznWAgALm3ICACU8HAIAMyTUAgAYLbYCAAEmiAIAK4e2AgAFSIYCAAaMSAIAABuOA
Date: Thu, 5 Dec 2019 11:55:19 +0000
Message-ID: <222974de-4a41-7431-ea83-3d22baac5c93@suse.com>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
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
 <eefa22c5-b0cf-b9e5-3d20-2fe171c53980@samba.org>
 <c6375fc6-7670-56c6-e7fa-e14acd4a4c08@suse.com>
 <757e29c2-54bd-74d4-ca66-b4a510404401@samba.org>
In-Reply-To: <757e29c2-54bd-74d4-ca66-b4a510404401@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [51.37.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0551908b-370a-4494-4ac1-08d7797a0014
x-ms-traffictypediagnostic: DM6PR18MB3402:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tcY5rS+EEXeIScgcm+n23acoMUM+nfGIXsbxqUva4rO3VlWVRwWCEmUR37QceFHB5fnef6CDVMzuAFMUfeXluAGYQtlPRpNRuoX2AlDr1JJa/JwT5mJ0OZ3PTqRldFHZHYGy4ZEC5esiQjbo/3nAfEWIC4DHSU85tRhSE0LuSCuU2TTiKcBNjYhFFhEcTOQmSDZdKCspy2j82+OSl6ribX0h2t5NigwDC93SDnq9cqx2dmQGBUzzduV7FpDDhHFpsrg8ml1KLsWmkdl71P19bX0fInD5KUjyWR+LOCdD0CChwseq4U/0FXvqkrXvoCoT8NMmiA2ODuP+pH4IU3WARRbOZsIIYKVkdTDsfyzqKODmdmpagLMiTSbwmItG5YKTI0HpThgXp6dncALT8Qyk+j6feLCqK2wSAfpNOhFugUdv4CIHHB2BtPLR9g36R6hD
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0551908b-370a-4494-4ac1-08d7797a0014
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mli3AQ/3b9YnRPhFjQRXu0+wq70Q4MOrnjEWvvb2zCky+iWJtWlAFMXX3IhznuqZ9muru3GL1h51TfP+OBl/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3402
X-OriginatorOrg: suse.com
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <NoPower@suse.com>
Cc: David Mulder <david.mulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

DQpPbiAwNS8xMi8yMDE5IDExOjMwLCBSYWxwaCBCb2VobWUgd3JvdGU6DQoNCkluIHRoZSBsYXN0
IG1haWwgSSBzZW50LCB0aGVyZSB3ZXJlIGluc3RydWN0aW9ucyBmb3IgZ2VuZXJhdGluZyB0aGUg
bGlzdA0KdGVzdHMgdGhhdCBmYWlsIHdoZW4gYWxsIHRoZSBlbnZzIGJ5IGRlZmF1bHQgZG8gbm90
IG5lZ290aWF0ZSBTTUIxLCBwYXJ0DQpvZiB0aGUgaW5zdHJ1Y3Rpb25zIGluY2x1ZGVkIGFuIGlu
aXRpYWwgc2tpcCBsaXN0LCB0aGF0IGxpc3Qgd2FzDQphdHRhY2hlZCB0byB0aGUgbWFpbCwNCg0K
DQp5ZWFoLCBJIGtub3csIGJ1dCBJIHdhcyBub3QgYXNraW5nIGZvciB0aGUgbGlzdCBvZiBmYWls
aW5nIHRlc3RzLCBidXQgYQ0KbGlzdCB3aXRoICpvbmx5KiB0aGUgaGFuZ2luZyB0ZXN0cy4NCg0K
DQp0aGUgaW5pdGlhbCBza2lwIGZpbGUgYXR0YWNoZWQgdG8gdGhhdCBtYWlsIGFuZCB1c2VkIGFz
IHBhcnQgb2YgdGhlIGluc3RydWN0aW9ucyBmb3IgZ2VuZXJhdGluZyB0aGUgZnVsbCBza2lwIGZp
bGUgKmlzKiBhY3R1YWxseSB0aGUgbGlzdCBvZiBoYW5naW5nIHRlc3RzLCB3aXRoIHRoZSBoYW5n
aW5nIHRlc3RzIHByZXZlbnRlZCBmcm9tIHJ1bm5pbmcgdGhlIHN0ZG91dCBmb3IgdGhlIHRlc3Rz
IHJ1bnMgY2FuIGJlIHBhcnNlZCB0byBnZW5lcmF0ZSB0aGUgcmVtYWluZGVyIG9mIHRoZSBza2lw
IGVudHJpZXMNCg0KDQpCdHcsIGNhbiB5b3UgYWRkIGEgY29tbWl0IHdpdGggdGhlIGluc3RydWN0
aW9ucyBhbmQgdGhlIHNjcmlwdD8gRWFzaWVyDQp0byBmaW5kIHRoZW4gYSBtYWlsIGluIHRoaXMg
dGhyZWFkLi4uDQoNCnN1cmUsIHByb2JhYmx5IHdpbGwgdXNlIG5wb3dlcl93aXRoX3NtYjJfbnR2
ZnMNCg0KTm9lbA0K
