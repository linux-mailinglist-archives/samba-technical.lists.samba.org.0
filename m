Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70E2760DB
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 21:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QelN3H7wahymcFoljcKVgPE7uCjJPE7W7pICpKyinRo=; b=yGSNM5+fnT6jOReoE30JTCTFfr
	2le5x6cmqnz4Q994EZ1y/I5S7KDYo9AJoAoLhLT9rZ8ecGbG/ogD81q+dcaSojqXeDnipI03NeK6b
	sAfSkoCimamLdwjlMPuBOlVsio54XJQnLSG3hESL6sVZVcQ8sut2uT3uUiA2b37TLZtnh0j8O9xb0
	tGeEuW95D0nKvrX+4VC6pe6vw6JTPssoCUnBvPg/OMhzH08o+DM46Ba+4HrKugOQpNqaBYkqoMso0
	9uWgvhAOdOuhnEFxFTg8FgSHXXqOQqUPYiWLS6dqCM7nKCpJjUa8IBeJ4abTBQC/24tW8DdhpiGCQ
	h2I78gAw==;
Received: from localhost ([::1]:40896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLAGi-006wMb-CY; Wed, 23 Sep 2020 19:17:32 +0000
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com
 ([40.107.94.54]:36318 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kLAGc-006wMU-Fn
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 19:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3fC7mqVIcaOg96UZK2QyTAEYFS3sqnHo9b4XPw4Tn3NRaaLujbz1ZlTyr+sjAYJEd+XTUBySIn9eMn+51i004XAK86l1IV1HYOIw3xp34kDvddbpcoMA/+KgttOKDXfS6v8d4yHvQlBO/U9SeKKLPpdWOsTjrlMOtBqcFs/61Ueuy8lxBGympJ6b/ERJTce4c45bELfHd+pd+bfl6FbluoEDj//W4LqhTA7ED6WlQpvqm31LvcZZph0MPS8wduXferiJkIY3mFcnMQI8FG2sKgWQIXJQxkMUA7v8lb41FyjGKTlYy6YHOF9ebHdP+qnGRCWP2ECu7PB/Cp4wuzFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QelN3H7wahymcFoljcKVgPE7uCjJPE7W7pICpKyinRo=;
 b=VKvspFJeTrXDx4IF8P2W+Yhk59PzsriB///ZEPiqc+MJDzP0tEZPJlfIEZJ7HAXE5efu5YHX1q8TpnuYj3ovozAUXcRA8gPeTxx6klg5ruexc1WBeH3nVq0AaPT2TR86yPDR66TOUvV3rCcMFvqtDuZBJMwke8uBvzt4422dvdnT9iRZFUXpT0dMrrRnUHkszeJk1qIMLYnQnA668Pwpe4V6NZDq67YUnKUSEIarp481ZKDpaDE6Bx/p+Ea0Q8y1YCscPXfPWEGOGeUbDQOZ/ewQD6eQXn8bfH+JvGAuL7D4CxdJX46djQRkfBojOJyHA1iODSafBAt0nt1Ln8kDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QelN3H7wahymcFoljcKVgPE7uCjJPE7W7pICpKyinRo=;
 b=sfJD/HQJmwPeOzQeUp1DMRM/rJgdf7dadJASpjXsSidu7oFxcfO+y98KBd6LEsKMl8/ZDSmCPjHCLrTVDXpPQ+uwC/o2HcD3gN/abWFWDOCcRAO4SL0HlQj1LVB3Cy9B5N1veXdWJ3ab+0gRdpD4jqz90oY1/bIGHoYUp7Wk1sc=
Received: from BYAPR05MB4629.namprd05.prod.outlook.com (2603:10b6:a03:50::14)
 by BYAPR05MB4101.namprd05.prod.outlook.com (2603:10b6:a02:8f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.17; Wed, 23 Sep
 2020 19:17:08 +0000
Received: from BYAPR05MB4629.namprd05.prod.outlook.com
 ([fe80::d13f:b837:ebe9:cb14]) by BYAPR05MB4629.namprd05.prod.outlook.com
 ([fe80::d13f:b837:ebe9:cb14%7]) with mapi id 15.20.3412.021; Wed, 23 Sep 2020
 19:17:08 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Regd. per-share stats/profile support
Thread-Topic: Regd. per-share stats/profile support
Thread-Index: AQHWkXp71t3ZWYAHdEGe3m9CV4dPQal2RvQAgABPKgCAAF9hgA==
Date: Wed, 23 Sep 2020 19:17:08 +0000
Message-ID: <BE2118D9-E910-459A-A3A4-7BDDB863966D@vmware.com>
References: <F750455B-1BA5-4E6F-86C2-C282A3A4FC1C@vmware.com>
 <ABE15E44-4F57-46AB-AC86-039B605145C3@vmware.com>
 <20200923190544.GB1338235@jeremy-acer>
In-Reply-To: <20200923190544.GB1338235@jeremy-acer>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [106.51.116.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d77488b-2d54-481f-3a66-08d85ff543e0
x-ms-traffictypediagnostic: BYAPR05MB4101:
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 94ph3KjPa35NK7ACP8ccFeJRKF3s/6aGwd0HYVtHhkG4BnMu4+8MFSOP36hnKYbss2qGpM4pWawdOqIzgbJJrFiSPTAbdgU3mEhw4EY1qnL/ucqW64bePdJm+3+ryMHqAaJYmwVbYI8tYVSiP/YBaTRv5blIIxyrmYURu2aK241+P8OXyPxr3gYUceLCfWbTHRe/+mABVO20H6ThLe39Fe0OF+qcw9Xr4NpYUZoRqvXVpQdGtFq5jgkP7PIRWCLkMZWMzhEPyyz0TXHQ3jJuEgWFx5bLcUGmTqNiKOD6gcd3fldvkc11LMMNUGjxGEhcoM4r/+rPL7bvD7KPuVXQ+6hzhA/kqCLF5Ormiw2Fy0WwpNqYXpi33Ka9E9SdI7az
x-ms-exchange-antispam-messagedata: TvFw62h40yXFd7EVh9A/87W42ZknIOIt6a+HFsXtadPciSC8SiqFuGfYMt75TLmrVGofHX+WnRiZIDIJzk8HZ2abxnHqy5DLYyPMSYS0Mt/JBh7+brZzS9T++iNnKFI9rSeCsPbQdvBN96bJitKf8yIe4HGNVLF7s4adh/H9bngmiOUEy4W77VYiB0TqilhFnnpPkr1sQ78mzbMIyeUSzA8s3yWF+z1RM55Q4kFn5MB1sFz7We2b5lTs1e7cqnR4aqIVLGINoeCFsVPpbqZjElmHvDtI4163b/vFexnib2pO+6qLtcBhWtgzF4fNntg9GYsvU5WZZioaVRmiNnqUU2wrJwDnD0TG7GixEpc7Y/ziiTbdJ2voOUUCS2R/4qvFx6agnx5ZlXpFap7pts7Vo16SVD7uGa+uXNZorrXwYozvYfFgLZ+9L+PEXtAmHtn4YuS0MAlmgPb+V7i1J5TAZD5kKPE8hda540zzcQzGuCJpR3SIJfWwvmOzR+UqxKOSqReEfrMw4N/g0x4NZpWplK7BZyCrZzByfX0GT/EpasHNPy7HfRk8xqVcNbk5vDJD9DEN3zRlSO9yixMvkdAaEW1TLsqivZEPsmAYXrCdv/fvIXXSjpL/Xk3tQ6hfUGRSZX9j5iN4JZ25c4FH13XPZw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F3EC5F3878F7448B2F0549058575735@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4629.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d77488b-2d54-481f-3a66-08d85ff543e0
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCIn1IkOdqxBt/W8WyT3CAfBFhzYtRt0nXuudVHELKHWZwfZkBZ/EaexSx9F/uJ4NU0PHxAiD8o097FLV0wBKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4101
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.54
 (mail-mw2nam10on2054.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
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
From: Sudip Panda via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sudip Panda <psudip@vmware.com>
Cc: "Christopher R. Hertel" <crh@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmtzIEplcmVteSBmb3IgcXVpY2sgcmVzcG9uc2UgYW5kIGxldHRpbmcgbWUga25vdyBubyBz
dWNoIHJlcXVlc3Qgd2FzIHNlZW4vY29uc2lkZXJlZCBpbiB0aGUgcGFzdC4gVGhpcyBjZXJ0YWlu
bHkgaGVscHMgbWUgYXMgSSBkb24ndCB3YW50IHRvIG1pc3MgYW55IHBhc3QgY29uc2lkZXJhdGlv
bnMgYmVmb3JlIG1ha2luZyB0aGUgY2hhbmdlcy4gTXkgcGxhbiBpcyB0byBtYWtlIGNoYW5nZXMg
c2ltaWxhciB0byB3aGF0IHlvdSBoYXZlIG1lbnRpb25lZC4gV2lsbCBrZWVwIHlvdSBmb2xrcyhT
QU1CQSBjb21tdW5pdHkpIHVwZGF0ZWQgb25jZSBJIGRvIHRoZSByZXF1aXJlZCBjaGFuZ2VzIGFu
ZCB0ZXN0IHRoZSBzYW1lLg0KDQpDaGVlcnMsDQpTdWRpcC4NCg0K77u/T24gMjQvMDkvMjAsIDEy
OjM1IEFNLCAiSmVyZW15IEFsbGlzb24iIDxqcmFAc2FtYmEub3JnPiB3cm90ZToNCg0KICAgIE9u
IFdlZCwgU2VwIDIzLCAyMDIwIGF0IDA4OjUyOjI1QU0gKzAwMDAsIFN1ZGlwIFBhbmRhIHZpYSBz
YW1iYS10ZWNobmljYWwgd3JvdGU6DQogICAgPiBIZWxsbyBFdmVyeW9uZSwNCiAgICA+IA0KICAg
ID4gSSBhbSBuZXcgdG8gU0FNQkEgY29kZWJhc2UgYW5kIGdvaW5nIHRocm91Z2ggdGhlIGJ1aWxk
aW5nIGJsb2Nrcw0KICAgID4gKHRldmVudCwgdGFsbG9jcywgVERCcyBldGMuKSB0byBhZGRyZXNz
IGEgZmVhdHVyZSByZXF1ZXN0IHRvIHByb3ZpZGUNCiAgICA+IHBlci1zaGFyZSBzdGF0aXN0aWNz
L3Byb2ZpbGUuIEFzIG9mIG5vdywgSSBzZWUgd2l0aCBzbWJzdGF0dXMgY29tbWFuZA0KICAgID4g
KHdpdGggLVAgYW5kIHByb2ZpbGUgb3B0aW9uIHNldCksIFNBTUJBIHByb3ZpZGUgZ2xvYmFsIHN0
YXRpc3RpY3MuDQogICAgPiBBbHNvLCB3aGlsZSBJIGFtIGxlYXJuaW5nIFNBTUJBLCBJIGNhbWUg
YWNyb3NzIFNBTUJBIFRBLiBXb3VsZCBsaWtlDQogICAgPiB0byB1bmRlcnN0YW5kIHdoZXRoZXIg
c2ltaWxhciByZXF1ZXN0IChzdXBwb3J0aW5nIHBlci1zaGFyZSBzdGF0aXN0aWNzKQ0KICAgID4g
Y2FtZSBpbiB0aGUgcGFzdCBhbmQgYW55IGFuYWx5c2lzIHdhcyBkb25lIGZvciBzdXBwb3J0aW5n
IGl0IHVzaW5nIFREQnMuDQogICAgPiBJZiBhbnkgYW5hbHlzaXMgd2FzIGRvbmUgaW4gdGhlIHBh
c3QsIHdvdWxkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUNCiAgICA+IG91dGNvbWUgb2YgdGhhdCBm
cm9tIHlvdSBmb2xrcy4gSSB1bmRlcnN0YW5kIHRoYXQgbXVsdGlwbGUgY29ubmVjdGlvbg0KICAg
ID4gY2FuIGFjY2VzcyBhbmQgbW9kaWZ5IHRoZSBwZXItc2hhcmUgc3RhdHMgd2hpY2ggYWN0dWFs
bHkgaXMgYSBjYXNlIGZvciBnbG9iYWwgc3RhdHMgYXMgd2VsbC4NCg0KICAgIEkgaGF2ZW4ndCBz
ZWVuIGEgcmVxdWVzdCBmb3IgcGVyLXNoYXJlIHByb2ZpbGUgc3RhdHMuDQoNCiAgICBZb3UnZCBo
YXZlIHRvIGFkZCBhICdwZXItc2hhcmUnIGZpZWxkIGluc2lkZQ0KICAgIHRoZSBzbWJwcm9maWxl
X3N0YXRzX2J5dGVzX2FzeW5jIHN0cnVjdCBpbg0KICAgIHNvdXJjZTMvaW5jbHVkZS9zbWJwcm9m
aWxlLmggYW5kIGVuc3VyZSB0aGF0DQogICAgdGhlIHByb2ZpbGUgc2V0dGluZyBtYWNyb3MgYWxz
byBhZGQgaW4gdGhlDQogICAgcmVxdWlyZWQgaW5mbyB0byBpZGVudGlmeSBhIHBhcnRpY3VsYXIg
c2hhcmUuDQoNCg==

