Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF78FB5D6
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 18:01:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=bSVDIsPaAfHEzMDWm83h9RkQiYWVw0SpwRaxG3nV5e4=; b=zkq6A4GwppPPzMGY8knxn/S/AJ
	p5HOQpRs9OK0KSTmBQXPI8QLytjcw+BGlDmOBJamUnQHsrdaWDFTufnnWgEVFNRj20m3hS+RFx0V0
	zkEOfRoNRt4gPsS+1rHBUnCUygXoUa7IwHQm83R1HkPZSmQsCl4ZDGnQgPDyWQtF4gtlxHEcBGjHs
	uCR6i1fdhQye6TdBz9YLmSs+HwRONDatUvq4U9TOr3bYUlklIf5gILZCCNtJ6eT6kvOjHVe3KIqIx
	datqXhXvWTvLdpA8Z2vxPcV9P/9HlF2hpLZNtzvYbxxrhBxJsbgrIMDTlKP4lGzlYOU+3vC/1wP+U
	Lk8JgmQA==;
Received: from localhost ([::1]:21820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUw0k-000DZF-LZ; Wed, 13 Nov 2019 17:00:54 +0000
Received: from m4a0039g.houston.softwaregrp.com ([15.124.2.85]:51128) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iUw0a-000DZ8-Sm
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 17:00:50 +0000
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP
 FOR samba-technical@lists.samba.org; Wed, 13 Nov 2019 16:59:29 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 13 Nov 2019 16:50:26 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 13 Nov 2019 16:50:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEa+gsvBXMg42+xlm8MPGunGj28Olx3GxEsyC+6OeGe4PBFhsnos3Xk4koXkYOeDGqKGbgRKgWVOGt3JTrDUfZQ2wCADpiEzZA67rKfxlm0fI3atSMnbe2TPO/3Wr7qXXep3je8wT5E5ObEm8VDukn8asRxCDEA6D+U+JggJm2YhOh8SxFJ+DCHGA610s0LouwT9nBRpeekZv6cJWd5TF70Ruw6AOEE/WTvmcR6/ubz+rfCSTUGiCKuxzYQg6Mq6JeEoJza1OulIRMAZO2e/LjQm9NShexQU6I4UtaTocYQOFZH3Dju9FHdgO1mY3KcMakBnaf1Edp9ypQq79fOwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSVDIsPaAfHEzMDWm83h9RkQiYWVw0SpwRaxG3nV5e4=;
 b=PqJhvUnxKIIqQfeeFj/GImP1WMp/5vHJvKUyitJSRYBdTKCcQWRLFzpGEq9RHDKRP6MqoZ9NIFPpyALFbsMvAe0zgGju/9CGud1xqEBrj3cfj6RnNlS0WotFROgzJNfbg3TQwqYIGsAgPJXgbp+lzA7enGXLygdtjj5foJjG9Y889sLtn7U/qrC3RlG7r+SO0yDtKZ9zjYUEaCc3bN29KWX5TE1U31sDYMbsRVU3SBbiN1bgl4ydUVETPXfP9/96Su7EITyY8KgFEx3Cm8RvbGM/5kd1UxXivKLRvSC9BriG2uYHEMwrqWvui3331XAf2LgOJW59vSTw99w21Zibag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB2507.namprd18.prod.outlook.com (20.179.105.79) by
 DM6PR18MB3049.namprd18.prod.outlook.com (20.179.48.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Wed, 13 Nov 2019 16:50:23 +0000
Received: from DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6]) by DM6PR18MB2507.namprd18.prod.outlook.com
 ([fe80::31ca:a807:241:adf6%5]) with mapi id 15.20.2408.024; Wed, 13 Nov 2019
 16:50:23 +0000
To: Rowland penny <rpenny@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: RFC: Add some functionality to net ads changetrustpw
Thread-Topic: RFC: Add some functionality to net ads changetrustpw
Thread-Index: AQHVmi5eYhhxmiZA5Uef7zHFUzBZG6eJMyeAgAAFIQCAAAqlAIAADZIA
Date: Wed, 13 Nov 2019 16:50:23 +0000
Message-ID: <162a149c-6615-1f14-9fc2-cc3e76041bb2@suse.com>
References: <aa05a22c-1fae-b4e0-c194-88f8609c0307@suse.com>
 <700e8c5e-9fb7-c0e6-75ff-7c82d112864e@samba.org>
 <6974328a-3d55-9f1e-0e37-ef5e45035a54@suse.com>
 <8afaa4f8-da9f-5459-cd0a-4dff22b9ff0e@samba.org>
In-Reply-To: <8afaa4f8-da9f-5459-cd0a-4dff22b9ff0e@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=NoPower@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [109.76.44.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f597085-d1df-40e4-261c-08d768599397
x-ms-traffictypediagnostic: DM6PR18MB3049:
x-ms-exchange-purlcount: 1
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hHzxFVfe+zoH16eR0enf+cpbdqqqXSzLr3it0dqsFAbP1Es7AIVEaJHFCk49XiODObLYn9IRAqBlt/xTRZdUHIA+MZlJZk1Eaw6pMjQsebG4bmFFrJ5DZ/SQC+ipD8bE96pG6OAiod2Re9hvo1ut8eN0oKIwzMRHwv1x9BUgOflWnqBYK6OO/XnLErEunoDCH1w+h29GcwSNTttklRd/mIsrgR5DyYsC92XAdRUNcKMPl3oy6cu7RCqFsO/ov6zjGcBDfFBcqj/yuxwOFntIRxlB0Wf3dwuc+hl8WKhzSMdd9Fl35CtX+zk7yKgbqgQu2OqoXJSKR3TxGm+hk6hA9DJgqoAvpVL5b+vuySFTebGCt5DjfTvgHGS2YMrVYn8oEMdKX+UCIrzLvnC5h/v2TVqz+I6dxuHjtrGbdOub8CKdcKtdwPJqyrCAF6HsaHtkNFe1TqPWI+IUcayX02RRCNIn/rCq6JK4FEx7uuS2/fs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8466C60ABA35478EF0B09279561C01@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f597085-d1df-40e4-261c-08d768599397
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CAJqvd+VRIIeXa8BjHDH6a7arncRLFYVcA5SZ21TQRJ/Bdfue+1kcwGKwI21h5thKXaKGwQENU3ur7ZQjRIW2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3049
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

DQpPbiAxMy8xMS8yMDE5IDE2OjAxLCBSb3dsYW5kIHBlbm55IHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IE9uIDEzLzExLzIwMTkgMTU6MjMsIE5vZWwgUG93ZXIgd3JvdGU6DQo+PiBPbiAx
My8xMS8yMDE5IDE1OjA1LCBSb3dsYW5kIHBlbm55IHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6
DQo+Pj4gT24gMTMvMTEvMjAxOSAxNDoyNiwgTm9lbCBQb3dlciB2aWEgc2FtYmEtdGVjaG5pY2Fs
IHdyb3RlOg0KPj4+PiBIaSwNCj4+Pj4NCj4+Pj4gSSBoYXZlIGEgcGF0Y2ggaGVyZSByZXN1bHRp
bmcgZnJvbSBhIGN1c3RvbWVyIHJlcXVlc3Qgd2hlcmUgdGhleQ0KPj4+PiB3aXNoIHRvDQo+Pj4+
IGJlIGFibGUgdG8gcGVyaW9kaWNhbGx5IHJ1biBhIGNvbW1hbmQgdG8gdHJ1c3QgcHcgYWZ0ZXIg
YSBudW1iZXIgb2YNCj4+Pj4gZGF5cw0KPj4+PiBoYXMgZXhwaXJlZCAoc28gc29tZXRoaW5nIHRo
ZXkgY2FuIHJ1biBpbiBjcm9uIGpvYikgVGhlIHdvdWxkIGJlDQo+Pj4+IHNvbWV0aGluZyBzaW1p
bGFyIHRvIHdoYXQgd2luYmluZCBkb2VzIHdpdGggJ21hY2hpbmUgcGFzc3dvcmQgdGltZW91dCcN
Cj4+Pj4gcGFyYW0uIFNvIHRoaXMgaXMgc29tZXRoaW5nIHRvIGJlIHVzZWQgd2hlbiB3aW5iaW5k
IGlzbid0IHVzZWQuDQo+Pj4gTm93IEkgYW0gcHJvYmFibHkgbWlzc2luZyBzb21ldGhpbmcgaGVy
ZSwgYnV0IGRvZXNuJ3Qga2VyYmVyb3MgdXNlIHRoZQ0KPj4+IG1hY2hpbmUgcGFzc3dvcmQgKHdo
aWNoIG1lYW5zIGFkcykgYW5kIHRoaXMgbWVhbnMgd2luYmluZCBtdXN0IGJlDQo+Pj4gcnVubmlu
ZyAoYXQgbGVhc3QgZnJvbSA0LjguMCkNCj4+IEkgZG9uJ3QgcmVjYWxsIHdoaWNoIHNhbWJhIHZl
cnNpb24gdGhpcyB3YXMgcmVwb3J0ZWQgYWdhaW5zdCwgYnV0IHRoZW4NCj4+IGFnYWluIEkgYW0g
bm90IGVudGlyZWx5IHN1cmUgYWJvdXQgaWYgaXQgaXNuJ3QgcG9zc2libGUgdG8gcnVuIHdpdGhv
dXQNCj4+IHdpbmJpbmQgaW4gbW9yZSByZWNlbnQgdmVyc2lvbnMuDQo+Pg0KPj4gQWxzbyBJIGJl
bGlldmUgaXQncyBwb3NzaWJsZSB0byBydW4gd2l0aCBzc3NkIGFuZCBubyB3aW5iaW5kDQo+DQo+
IFNvcnJ5LCBidXQgeW91IG11c3QgaGF2ZSBtaXNzZWQgdGhlICd1c2luZyBzc3NkIHdpdGggU2Ft
YmEgaXMgbm8NCj4gbG9uZ2VyIHN1cHBvcnRlZCcgZGlzY3Vzc2lvbi4gSWYgeW91IHVzZSAnc2Vj
dXJpdHkgPSBBRFMnIG9yICdzZWN1cml0eQ0KPiA9IGRvbWFpbicgd2l0aCBTYW1iYSA+PSA0Ljgu
MCwgeW91IG11c3QgcnVuIHdpbmJpbmQsIHNlZSBoZXJlOg0KPg0KPiBodHRwczovL3dpa2kuc2Ft
YmEub3JnL2luZGV4LnBocC9TYW1iYV80LjhfRmVhdHVyZXNfYWRkZWQvY2hhbmdlZA0KPg0KeWVw
IEkgbWlzc2VkIHRoYXQsDQoNCmFsc28gc3RpbGwgIidtYWNoaW5lIHBhc3N3b3JkIHRpbWVvdXQn
IHdvcmtzIG9ubHkgd2l0aCBhIHN1YnNldCBvZiB0aGUNCidrZXJiZXJvcyBtZXRob2QnIHZhbHVl
cyINCg0Kc28gSSB0aGluayBpdCBpcyBzdGlsbCBtYXliZSB1c2VmdWwNCg0KTm9lbA0KDQo=

