Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A192C5EED
	for <lists+samba-technical@lfdr.de>; Fri, 27 Nov 2020 04:20:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zOzfd6t8OdzTWUFkPP5qwzny6x3cfraVb6f38QKM7Qw=; b=lJJ5nkO2AoFPbDnwsKgRr2O684
	LDbXPUPAeBUyWleUmP6nJJOYboI48GeekOcJknrFvFeY7JJNgqB5SBXEmGf4lw+oozIIeYK9aVeut
	oMjWYfWDPVgjk/5KKhon3PrEy5h/RfqJKLOLLiBUh+sUusc7AipNJPc/SPQFS2GL4WOEBKBfPb2XW
	/b5wio6wVi+WloRMLofbPdxFGVjeptrB43mXw4IXy98fGpoRzkqplZXgLQCVKTraxZAxFSC1Qkstf
	YjGyyPw8n0LAAn1D6IsxZgLqym026w1uZ6duiZ2xOJebCpw1ekjtChb1HpOF7Q+9sfMPn/+/sewPZ
	hvohH+NA==;
Received: from ip6-localhost ([::1]:50694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiUIi-002ss0-Aq; Fri, 27 Nov 2020 03:20:00 +0000
Received: from mail-co1nam11on2053.outbound.protection.outlook.com
 ([40.107.220.53]:4064 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kiUIY-002srt-Q0
 for samba-technical@lists.samba.org; Fri, 27 Nov 2020 03:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idIXW8ZRhEQ4dvJexYFy3YVPWM09FqR4cpcyjiZOXUpgiwRewcFtraaZTmEkvoMghL9hlP1mfEJLbYgykmDWjg7RwKiFmN2dnN5WJWxWn1KuiqSvcKqdMkl36AUI6Sojuyab+JY3N5Hb8/HN48bJXAe0VCyOx5IFS0jgkKKittXhejQ+l5f7PStsuSYaGQL0n90uTYpWHLkGa70Xw2sWi5vYTd207x4l5MeBj81M/+Od2Rt1lGg2K/JwozCJyo3bEK3AjmdH75snB5ZeI238FrPtl6wvwgSqHv2j9eQst0RhaTfk+u/vPC9CqShN1G9hUmnCIGonHEpvGvZcp5NXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V8YxqeLRr7ekS1LeXjLF9sFcYVtQ1ITpjjxxNQrZWA=;
 b=lQzV0Tm17FGOiOGd8lWg5L0p5pyDNiL0ItpVa1O8f+ykaUZXCx/uxwkjkIgIlUTYdcijIiGithqr/VM31ZMPJXocD8tNxB2JAIJmsTuKRGymkVfvDXPGh+eCi9VGmKBSHdWiUcBcuFg0Hh/kRVgeejP7h8reDBvhynbbGNdbZ9k/N5vVypD1d+fFGKmi50JePjZmFVod4U4rvCavoJkV9jL4rBbQabEXb6WU/4DRC42AfIPV1OTH5Q0gWtov+vN2u6YTdNXOtgiXF7ty7Mh1byB16c9t7SGPot+yMqwm/ty2yHOCIIctUSl5tgJWwl5jpCmrvt0IOwiw3Rvtwp81YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V8YxqeLRr7ekS1LeXjLF9sFcYVtQ1ITpjjxxNQrZWA=;
 b=waeaDa23nc4MqbH1IGo5tjCb3iXbFyTFPOrgUqD21iqH+MKMyRJLE6sAYXLJyRRXBnsKUImnhmIjFbbb1PLNYuVp6aSRBwb2Q7fnOrB9AvijOHZri6x6u6l2Hflhk/S52SCYMO8qRKq6YqaNTYUCzzdvebFlRbLwOCbdw6ZG50Y=
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 (2603:10b6:803:4e::30) by SN6PR05MB5294.namprd05.prod.outlook.com
 (2603:10b6:805:c7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.14; Fri, 27 Nov
 2020 03:19:31 +0000
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91]) by SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91%6]) with mapi id 15.20.3632.009; Fri, 27 Nov 2020
 03:19:31 +0000
To: Andrew Walker <awalker@ixsystems.com>, Ralph Boehme <slow@samba.org>
Subject: Re: about "ea support" parameter
Thread-Topic: about "ea support" parameter
Thread-Index: AQHWw6zWZtIuZKIKjkWykUOFACJ9vqnas/8A//+CgQCAAPa0gIAAqcqA
Date: Fri, 27 Nov 2020 03:19:30 +0000
Message-ID: <BF5BBABB-8C12-4D9F-8530-4D12A72C5DA2@vmware.com>
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
 <CAB5c7xrF9uSQ6PwyojwAUiCK_H7-p-Lvtsj88OZ4BQSRuCWS3g@mail.gmail.com>
In-Reply-To: <CAB5c7xrF9uSQ6PwyojwAUiCK_H7-p-Lvtsj88OZ4BQSRuCWS3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ixsystems.com; dkim=none (message not signed)
 header.d=none;ixsystems.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [101.87.214.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a43ec5a-3562-4416-b6f9-08d892834190
x-ms-traffictypediagnostic: SN6PR05MB5294:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BQvC2m2mFTBVdpjJHUkh6sTFBDGvKkJMyD9kNeDHwN0Fm4YN4eFT9Rf1oGvyP+7fyqSsOZlz2Wgqk7WxxPID24p9UrHNbeM8MJxgw/oQG410/kPPM8Pet1s8lwH3lI9GlFQJvBQhOwmQMLstZGF12RakpaGFEGk+loS3mpGcSF7Soh8E/C730vpPiLfgK+yW1HXD/C67E3Z/okW5b2UAKJeRJH7PJzZrHwDQf2dqKQkjfEggf4TOnSiIVDQe1HaR7ej7S9rRXacX00hgnn1cEKjA3QrJ9hiNEMCLP6FNU1yOEWwkKII2blXYQmu9fCFsquqQpGAaovk3F6QpouZA++Mu8XlSBFF4e/RCRbqht0kgGV48lEIP66aYm8coBb9GAoIfe5BfGaTyStgtnJWlTQ==
x-ms-exchange-antispam-messagedata: =?utf-8?B?emVXVDFOYVNsa1RzTytSR292S2dkdDVZVXdZQWRpQUZlZDlUQXBPWU95Tk1Z?=
 =?utf-8?B?R002bS9jbEh1TVFuQlFqVGNDSGpsRTByNnFzYWpvUm9OUUdlU0NyQWc4czkw?=
 =?utf-8?B?UjgvckVQUk0rbHY1LzZ0U3FidlFQRUJ6eDR6V0JISmpYWUJVNzh6SWVIdHFp?=
 =?utf-8?B?OFJRa3BDYlJKTTZnMjd4MStKa1JBK3l1VXFJekRSaHEwMkRzVW1wZTdXWlZl?=
 =?utf-8?B?T1dwQm1VUVIvK0w1dXlyT2dXdVVlV3grelEvb3Zzeno3OXJUZEh6SjNBK0Mz?=
 =?utf-8?B?UTVneTZVb1cydGliZU1CUHRtM2hRQ2tMRmtxQ3Y1Rks4eDhManNpWS9iMWJS?=
 =?utf-8?B?Sk5LNW9tc0tUakFMWjkrM3pmdUFWR3FtcHhQQkxlUnpiVlJVSVlBa2piYmZ1?=
 =?utf-8?B?NFdQMWl3eGFRUnBxamI3T2ZwYktxUFFDbzg5SVNLV2pYelJZbm1tMW5OZHB0?=
 =?utf-8?B?QU1SMHdvVGR0RFJKQ3p5T25HKzZqZExsUHZFS2E2RG9zeG9hajlZc05jbmdx?=
 =?utf-8?B?bzRKWS9ES0laVkJRU21NbGhMVURtNnR2dDhuWEpEMzRwL3J6dXpJZ2xOdmVS?=
 =?utf-8?B?TnVVL0JVRHZFb1k4YVBYRkxXVTdsQ2FJZURtOU8rRTJPWjdyREVMbDRDQkJE?=
 =?utf-8?B?d1E3OUNvUzFvVHhVa0RxU0RRWThpQ1NHOFJlaFJuWXh5dXhVQU1PWG13OTUv?=
 =?utf-8?B?eFF5Smpxc25mWTcvTFkwdDc1UUk2Wm9IcTRFS1pObnNoR3hzMG1KTXErQ29N?=
 =?utf-8?B?R1M3WFI2cWxsck5DQkRWUUNBN2VmWG8xZ2s3ZWlLbmMvVUxRQ1R2ZnRLUVRj?=
 =?utf-8?B?VVVaZGJsNWRGSCtIZGlsazZHaVhkM3hTTUgwTG8ycElSZ0h2dElxNkRJOG93?=
 =?utf-8?B?cWJCTTI1VmR0UDVvOFVZQ2R1WEt0KzNkNnZFMzZDTUdqYVQ2TDRXZjZyQVUx?=
 =?utf-8?B?cDYrUk8razdFdjFmWUdHVWZ6OFpHSEdSeXdodytQemRXN0JBS0dpSzA5OVZP?=
 =?utf-8?B?UDFjOENseW93ajRGakZ0ZStHRzh5dnlSRTAwRTNaNjBtMWUvUW1xK2RIQVFv?=
 =?utf-8?B?RzJUbWRMY3dGTWQ5eHQvcGxvWEozaVpLbEdVaEFMN1diTmhJUnVmaWJQampP?=
 =?utf-8?B?MkJlNWpLQjFCWTlWMmRSc2ErRzlQRVBsQUY2cGlRUXo3RGRZaWt3cEFtd2hB?=
 =?utf-8?B?b2p4ak8xUC84U2s5cVNSS3h4Tm9OdUkxVzJmbHZaa0xkR1JCTU5CQ3N0elBr?=
 =?utf-8?B?bjNTcURYZDJwdjRiS1lTblNjWWNvWDJDMkZERWt5b3laMmFaNGRVblZhTGdo?=
 =?utf-8?Q?rFFEyb2slj8I55YTxk1xLehEUc3xk8kLVD?=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0501MB3854.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a43ec5a-3562-4416-b6f9-08d892834190
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXqy1elao47rYbxfIyrHr96xq5Tf5gessiIadnvg/mumCpOaLHCzBreLPXQ6cxhM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5294
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.53
 (mail-co1nam11on2053.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
From: Leo Fan via samba-technical <samba-technical@lists.samba.org>
Reply-To: Leo Fan <xfan@vmware.com>
Cc: Albert Guo <aguo@vmware.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhhbmtzIEFuZHJldywgeW91ciBpbmZvcm1hdGlvbiBpcyBoZWxwZnVsIQ0KDQotTGVvDQoNCkZy
b206IEFuZHJldyBXYWxrZXIgPGF3YWxrZXJAaXhzeXN0ZW1zLmNvbT4NCkRhdGU6IEZyaWRheSwg
Tm92ZW1iZXIgMjcsIDIwMjAgYXQgOToxMiBBTQ0KVG86IFJhbHBoIEJvZWhtZSA8c2xvd0BzYW1i
YS5vcmc+DQpDYzogTGVvIEZhbiA8eGZhbkB2bXdhcmUuY29tPiwgInNhbWJhLXRlY2huaWNhbEBs
aXN0cy5zYW1iYS5vcmciIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPiwgQWxiZXJ0
IEd1byA8YWd1b0B2bXdhcmUuY29tPg0KU3ViamVjdDogUmU6IGFib3V0ICJlYSBzdXBwb3J0IiBw
YXJhbWV0ZXINCg0KDQoNCk9uIFRodSwgTm92IDI2LCAyMDIwIGF0IDU6MzAgQU0gUmFscGggQm9l
aG1lIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc8
bWFpbHRvOnNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+PiB3cm90ZToNCkFtIDExLzI2
LzIwIHVtIDEwOjU3IEFNIHNjaHJpZWIgTGVvIEZhbiB2aWEgc2FtYmEtdGVjaG5pY2FsOg0KPiBI
aSBzYW1iYSBleHBlcnRzLA0KPg0KPiBJIG5lZWQgeW91ciBoZWxwIHRvIHVuZGVyc3RhbmQgdGhl
IHNtYi5jb25mIHBhcmFtZXRlciDigJhlYSBzdXBwb3J04oCZLg0KPiBXZSBhcmUgZGV2ZWxvcGlu
ZyBhIGN1c3RvbWl6ZWQgc2FtYmEgc2VydmljZSB0byBzZXJ2ZSBXaW5kb3dzIDEwDQo+IGNsaWVu
dHMgYW5kIE1BQyBPUyBjbGllbnRzLiBBbmQsIHdlIHdvdWxkIGxpa2UgdG8gc2V0IOKAmEVBIHN1
cHBvcnQgPQ0KPiBub+KAmSB0byBnYWluIG1vcmUgcGVyZm9ybWFuY2Ugb2Yg4oCYZGly4oCZIGNv
bW1hbmQgZXNwZWNpYWxseSBvbiB0aGUgbGFyZ2UNCj4gZGlyZWN0b3J5LCBidXQgYXMgc21iLmNv
bmYgZG9jIHNheXMsIEVBIHN1cHBvcnQgZGlzYWJsZW1lbnQgd2lsbA0KPiBpbXBhY3QgV2luZG93
cyBmaWxlIHNlcnZpY2UgY29tcGF0aWJpbGl0eS4NCj4NCj4gVGhlIGRlZmF1bHQgaGFzIGNoYW5n
ZWQgdG8geWVzIGluIFNhbWJhIHJlbGVhc2UgNC45LjAgYW5kIGFib3ZlIHRvDQo+IGFsbG93IGJl
dHRlciBXaW5kb3dzIGZpbGVzZXJ2ZXIgY29tcGF0aWJpbGl0eSBpbiBhIGRlZmF1bHQgaW5zdGFs
bC4NCg0KVG8gZ2l2ZSB5b3Ugc29tZSBiYWNrZ3JvdW5kOiB0aGF0IGNoYW5nZSB1bnRhbmdsZWQg
dGhlIHByZXZpb3VzIG1peHR1cmUNCm9mIGNvbmZpZ3VyaW5nIGJvdGggU01CIGxldmVsIGJlaGF2
aW91ciAqYW5kKiBiYWNrZW5kIHN0b3JhZ2UgYmVoYXZpb3VyLg0KTm93YWRheXMgdGhpcyBwYXJh
bWV0ZXIgb25seSBjb25maWd1cmVzIHRoZSBTTUIgbGV2ZWwgYmVoYXZpb3VyLCBpZSBpZg0Kd2Ug
c3VwcG9ydCBFQXMgaW4gdGhlIHByb3RvY29sLiBUaGVyZSBhcmUgdmFyaW91cyB3YXlzIGEgY2xp
ZW50IGdldA0KbGlzdCwgZ2V0IGFuZCBzZXQgRUFzIG92ZXIgU01CLCBieSBzZXR0aW5nICJlYSBz
dXBwb3J0ID0gbm8iIGFsbCBvZg0KdGhvc2Ugd2lsbCBmYWlsIHdpdGggYW4gZXJyb3IsIHByb2Jh
Ymx5IE5UX1NUQVRVU19OT1RfU1VQUE9SVEVELg0KDQpIb3dldmVyLCBpZiB3aGVuIHNldHRpbmcg
ImVhIHN1cHBvcnQgPSBubyIgU2FtYmEgd2lsbCBzdGlsbCB1c2UgeGF0dHJzDQppbiB0aGUgYmFj
a2VuZCBhcyBzdG9yYWdlIGZvciB2YXJpb3VzIGJpdHMgYW5kIHBpZWNlcyBsaWtlIERPUw0KYXR0
cmlidXRlcywgY3JlYXRpb24gZGF0ZSwgQUNMcyBhbmQgc28gb24uDQoNCj4gSSBhbSBub3QgcXVp
dGUgY2xlYXIgYWJvdXQgY29tcGF0aWJpbGl0eSBwcm9ibGVtIHdpdGggRUEgc3VwcG9ydA0KPiBk
aXNhYmxlbWVudCwgYW5kIGhhdmUgc29tZSBxdWVzdGlvbnM6DQo+DQo+DQo+IDEuICBJbiB3aGlj
aCBzY2VuYXJpb3Mgd2lsbCB0aGVyZSBiZSB3aW5kb3dzIGZpbGUgc2VydmljZQ0KPiBjb21wYXRp
YmlsaXR5Pw0KDQpBcyBleHBsYWluZWQgYWJvdmUsIHlvdSBkaXNhYmxlIHNvbWV0aGluZyB3aGlj
aCBhIFdpbmRvd3Mgc2VydmVyDQpzdXBwb3J0cy4gSGVsbCBtYXkgYnJha2UgbG9vc2Ugb3IgeW91
IG1heSBuZXZlciBub3RpY2UgYSBkaWZmZXJlbmNlIGluDQpjbGllbnQgYmVoYXZpb3VyLCB5b3Ug
bmV2ZXIga25vdy4NCg0KPiAyLiAgSG93IGRvIHdlIGNyZWF0ZSBhbmQgdXNlIEVBPw0KDQpUaGVy
ZSBhcmUgdmFyaW91cyBTTUIgaW5mbyBsZXZlbCB0byBnZXQgYW5kIHNldCB0aGVtLCBjZiBNUy1G
U0EvTVMtRlNDQy4NCg0KPiAzLiAgRG9lcyBhbnkgd2VsbC1rbm93biBXaW5kb3dzL01BQyBhcHBs
aWNhdGlvbiB1c2UgRUE/DQoNCkknbSBub3QgYXdhcmUgb2YgYW55Lg0KV2luZG93cyBTdWJzeXN0
ZW0gRm9yIExpbnV4IHVzZXMgdGhlbSwgYnV0IHVuc3VyZSBvZiBpbXBsaWNhdGlvbnMgb3ZlciBT
TUIgcHJvdG9jb2wgKGhhdmVuJ3QgbG9va2VkIGludG8gaXQpLiBJSVJDLCBJbGx1bW9zIGRpc2Fi
bGVzIEVBIHN1cHBvcnQgYnkgZGVmYXVsdCBpbiB0aGVpciBTTUIgc2VydmVyIGltcGxlbWVudGF0
aW9uIGZvciBwZXJmb3JtYW5jZSByZWFzb25zIGZvciBkaXJlY3RvcnkgbGlzdGluZy4NCg0KaHR0
cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy93c2wvZmlsZS1wZXJtaXNzaW9u
czxodHRwczovL25hbTA0LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZkb2NzLm1pY3Jvc29mdC5jb20lMkZlbi11cyUyRndpbmRvd3MlMkZ3c2wlMkZm
aWxlLXBlcm1pc3Npb25zJmRhdGE9MDQlN0MwMSU3Q3hmYW4lNDB2bXdhcmUuY29tJTdDZTlhMTM5
NjRmMzg5NGU2MTUxNWMwOGQ4OTI3MTcwYzclN0NiMzkxMzhjYTNjZWU0YjRhYTRkNmNkODNkOWRk
NjJmMCU3QzAlN0MwJTdDNjM3NDIwMzYzMjE0ODU2MDYyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNk
OGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pY
VkNJNk1uMCUzRCU3QzEwMDAmc2RhdGE9UVZaSkoyOEIlMkJUMnRuciUyRmRGcnZZc1ZDQUNtNXB4
QVR6MDFiOHlBNGoyUzQlM0QmcmVzZXJ2ZWQ9MD4NCg==
