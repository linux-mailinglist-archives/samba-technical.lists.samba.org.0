Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AE2C53FC
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 13:32:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RKdkD2o5Ra1VP1WlJA2YMhQKXNm4Fo8rJHqFDe4CTT4=; b=NC5CG9nhHSGTUP3aewTm3Kub/D
	/dH5Y/Gxs22bucMnir6Zbz5E0JJ2AtAWWVxNuTRmy5s/xUJ5+UfjcFGOEhoEzX4fWS5KW0HfugwcR
	wkopG67VcD8EVBAAAvbChh0X3RHa9pTFOh7/JUXhT9JjXymjgI5xIbjy8ghEGfVNM+hhEdk7XNVgv
	NtuRQWuiu9T3s2M241HF2bsRSGImMwd6IIaL1XE6w+Ym/ElGlmp2j/QKbkJKtz3XeYwujNPCCNZHe
	sD/v0nXeFIR/7m6Ci/2SJcMZos3uw9/dlmKje2e5WCHLhKZA9CsI8YEx/xYOH7x7dX0kjE4tXQJaR
	V0pLZapQ==;
Received: from ip6-localhost ([::1]:18878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiGR5-002m8r-DH; Thu, 26 Nov 2020 12:31:43 +0000
Received: from mail-co1nam11on2071.outbound.protection.outlook.com
 ([40.107.220.71]:34529 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kiGQy-002m8k-8d
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 12:31:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsCdfeI1T94lrCqWQ48/DNFuxrDktBeOvIDUUNpnbNvV5A6T8dGb8WYhU4MHPSU376Mg70mOcVhPjv4AZaKIdh84N6In741uPIQ6+ePvxsJVbbrt0E+CWYphdVDfSaLQYbxgnD2mHVSPY6zzPdMZppiDXHCzcAGmYzDla43/63PbJaaU+3RPcdc8c4LMx/3ZZxNHTT6ISCdMvSMePU2dP0SQYyKAq4jF7TUqc2njzCbAt3MpokI6O959urKbx4TyPClgokeIWKDxE8pTcCcjgU22onsR2rHx0kJzLrqlD4oNPauLmOVN9CQq0R8iSIYTEF4Dkm9cHxs/v2hQFdYZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKdkD2o5Ra1VP1WlJA2YMhQKXNm4Fo8rJHqFDe4CTT4=;
 b=BEN+ftKd9yr2xhvBCmQV5lIQVJ0ennzc7EBy/c2zLNI7Tq2qHT7ZkR9rAOKJh9Hua8m7DGnHMCblc3VNmJQHbUeFB+5x44gm8acTUKXgn4YiwQQlTU2uYIb26JkC7h4MGcfBw691uPXqzsyfvlR23SRAlyFy3xJ9+3xq195EhfZdoquDzl8mYVFHM12/yMH8c2VuZPs9w2m3tusha95/XLFLfCHw8ukBwjunVZxMEJNO8wXZOT1svRuuorEKyo0ZMBf8OvvQww2OssaHevFO66jS1VWnl8xrCPVxlVIWLsLivc7bYizj0lLzTt/W1lGYE9gT0jroEf8Pzp2mvJVSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKdkD2o5Ra1VP1WlJA2YMhQKXNm4Fo8rJHqFDe4CTT4=;
 b=oaFt0Tf42JcB7YsOvns7FUxHgo44AemJ0iN5HxsuSgWu00TDsU6VoS8LeTL87HLHwVvEU/KTCtHMyn7/YfdNqgCj1seCUKmCaVBVgELV0BoDQH2GyKex2BMJAC2QS2VotxJNKJK8LQC1A9WWDiwVGTP0rpI+d7tDGTrsV/mDi+g=
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 (2603:10b6:803:4e::30) by SN6PR05MB5757.namprd05.prod.outlook.com
 (2603:10b6:805:f9::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.15; Thu, 26 Nov
 2020 12:31:13 +0000
Received: from SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91]) by SN4PR0501MB3854.namprd05.prod.outlook.com
 ([fe80::a08f:a4ba:455e:fc91%6]) with mapi id 15.20.3632.009; Thu, 26 Nov 2020
 12:31:13 +0000
To: Ralph Boehme <slow@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: about "ea support" parameter
Thread-Topic: about "ea support" parameter
Thread-Index: AQHWw6zWZtIuZKIKjkWykUOFACJ9vqnas/8A//+CgQCAAKhMAA==
Date: Thu, 26 Nov 2020 12:31:13 +0000
Message-ID: <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
In-Reply-To: <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [101.87.214.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36b7359a-e265-4548-00bb-08d8920729ed
x-ms-traffictypediagnostic: SN6PR05MB5757:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: COToQ07gRd5VZuY8Y2zN18yZSOH9S/SJlWzEJe5HZyYr9zLicJoeYrpqj3NJdQtiAbkeYmE3gXFy4nMle4r/fliZsbBos4+3V2kIz/apa3iq1/7gDG6kAOd40kMZuDLG7VuSO2F0XfIOPDCfK3CC8QICjTyYuo5OtjYMs2v9UJU6lE82E72lfZs/5VTqx6ks7y8EiTQmd3TdvFWftdAcOOQB1QkYgSuBLk2wqBEb7I+itPIdLs7gbh06S524Nr2WnB96TDmLH1T2iVPr7WVaw0zPytY1/kLyHx854OMU2Kx2+0mhDPrzCl12xwV67YsqQUtEvuanNEJu7sKwptSVpoKQcbyhi5Uo9G8aUoK6ysw6ck7SCZGXQy+byfHOcdARi4aA3hlVlYPtFOQIVsx20nYI+vPLa4ehd7lAfTMTqHDJTARQZD+7r7mvvaQip8cB0KpGWx8B9r/0d/yat9q6Lg==
x-ms-exchange-antispam-messagedata: =?utf-8?B?SDlHdGpUNnM4UEo2L3hlM253NHU2VS9nT3FOeU5zUXhoNU9CbTRTZ3JycTB5?=
 =?utf-8?B?dGJSMWovTzQvTHVPN0h4aFFPRlVYWkF1TzB6cFI0UmMrNHBmakovU3N3Wmls?=
 =?utf-8?B?ZTNlZ0RObEtYdnBYL2RnQ1Y2Rm16cVgxT1FFVzNOdU5mMk9qLzlqLy9lVDhn?=
 =?utf-8?B?eWh2SWdNUk5nYnhSQTVUTStubUZJVjJ2KzlWNmw5Rktqcm1hWS9OZEhPRzhx?=
 =?utf-8?B?UEg5bkxQWE9semYzaG5waTFMZmxXK3E5dTN0eWFSdEkxWDRoL0JDWnQ3RDlI?=
 =?utf-8?B?a0pYOHVGKzlwQzI2SkFwZ3pYWGNML2R2bDBtQjJZbG55b3hqZ3dxZEI3cFhi?=
 =?utf-8?B?ZXpnTkdjaFNRVUx5bG5lMjlKcGN6SmZXaXpjWXE0eVlIZEJxWUluaWZBa1ZY?=
 =?utf-8?B?ZjAvOGRZRkJJeENPRUViQm9wZFQ2UzUrQjlkR0F3emxSMERMTmZMQjk3clZw?=
 =?utf-8?B?N1o1eGZvRnBjS0I0NXFKNnRWSlF3Y1lzOHZNTS9ZcVFpRlJISWtVVXg4L2lt?=
 =?utf-8?B?blFDcUlvZmlGZUFqSVkxWHdFbGZBNUhVTnVrZXJ6Q1RMQkhJb05qUmV3RUEr?=
 =?utf-8?B?djdoR1ZyYVI5MlJKZ3A0RkQ0TTREclkxTjdybmsvSEFyZlhMS2JwQVc3T2o1?=
 =?utf-8?B?ZVJyQVRkUUNWaUluRDEzQUFNdE1vRENmNm44TzBrL3RNdDl4dlBpbTVJbnAv?=
 =?utf-8?B?ZVZBSTVzTVl5YS9qbTVFcnJsZmJhczBmNmY2empTMDc0UkhTTWlOUEZlM1hy?=
 =?utf-8?B?SjBjOGZoSmtFeWVNVHk1czJFRkREOEI4QjNUeXhHVWlxdU94Y0V0MmozTkM5?=
 =?utf-8?B?NHVKQXhSY0ZKckROUDVqSVpzT25va0cwMnF1NWk4MHg4RlJEUGJUUE53anFQ?=
 =?utf-8?B?V1VTOHYyc2t2TDRhbDFwb2owTjZUWm9Kb2VmYnhqb1FjYklHL3dWanZMNjJv?=
 =?utf-8?B?cVk5WmJ1NjVvdkpVL1IzZmdwK21Oakxrc2Jtckw4SzQ1YnE3dG0zYmpiV1p4?=
 =?utf-8?B?Y0p3TmhITjI2TjhGRHlGSmQzNXdTT3IyUlVncC9uYi9WdzF1ZXp0S3ZwV2kw?=
 =?utf-8?B?TVZNTDM3OHN4NkFocUIwZ3pUUHR2azdTMWs3VkYzOGZLZ1ZML2ZxdTB5TUZx?=
 =?utf-8?B?YWpTTlkxNk4yTnZqalVYQXVSbVo1YU9FTXlOYnVCSjFqN09PbjR1WlJwQWZs?=
 =?utf-8?B?S3ZMQTZSb0p3Nkc0R3NqcjBCQTNDVWovWjFmdW02R0hjeHlFbGxFRzR5VU1D?=
 =?utf-8?B?UlQ0eFB3cU1JN2p0Sjk5UVFrMjFaR3A0TjZ0MktBNUhWWWRZTzUzNHpaTW9W?=
 =?utf-8?Q?G59bkkOg+LmyXu6iNR0Tppzecd0uwy1QKy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <574BAC0826A8C84B9646573AE3F44425@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0501MB3854.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b7359a-e265-4548-00bb-08d8920729ed
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCZq4Pcnf4q5diZMoqKelfoe3MLGlMJcol9qvVkweBbxg7dO3rUfCbyBWq634ej4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5757
X-Warn: EHLO/HELO not verified: Remote host 40.107.220.71
 (mail-co1nam11on2071.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: Albert Guo <aguo@vmware.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgUmFscGgsDQoNClRoYW5rcyBmb3IgeW91ciBxdWljayByZXNwb25zZSENCg0KR2xhZCB0byBr
bm93IGJvdGggV2luZG93cyBhbmQgTUFDIGFwcHMgbWFrZSBoZWF2ZSB1c2Ugb2Ygc3RyZWFtcyBi
dXQgbm90IEVBcywgSSBhbSBtb3JlIGNvbmZpZGVudCB0aGF0IHdlIGNhbiBkaXNhYmxlIEVBIHN1
cHBvcnQuDQpCb3RoIERhdGEgc3RyZWFtcyBhbmQgRUFzIGFyZSB1c2VkIHRvIHN0b3JlIGV4dHJh
IChtZXRhKWRhdGEgb2YgZmlsZXMvZGlyZWN0b3JpZXMuDQpJIGFtIGN1cmlvdXMgd2hpY2gga2lu
ZCBvZiBhcHBsaWNhdGlvbnMgd291bGQgdXNlIEVBLg0KDQpSZWdhcmRzLA0KTGVvIEZhbg0KDQrv
u79PbiAyMDIwLzExLzI2LCA2OjI4IFBNLCAiUmFscGggQm9laG1lIiA8c2xvd0BzYW1iYS5vcmc+
IHdyb3RlOg0KDQogICAgQW0gMTEvMjYvMjAgdW0gMTA6NTcgQU0gc2NocmllYiBMZW8gRmFuIHZp
YSBzYW1iYS10ZWNobmljYWw6DQogICAgPiBIaSBzYW1iYSBleHBlcnRzLA0KICAgID4gDQogICAg
PiBJIG5lZWQgeW91ciBoZWxwIHRvIHVuZGVyc3RhbmQgdGhlIHNtYi5jb25mIHBhcmFtZXRlciDi
gJhlYSBzdXBwb3J04oCZLiANCiAgICA+IFdlIGFyZSBkZXZlbG9waW5nIGEgY3VzdG9taXplZCBz
YW1iYSBzZXJ2aWNlIHRvIHNlcnZlIFdpbmRvd3MgMTANCiAgICA+IGNsaWVudHMgYW5kIE1BQyBP
UyBjbGllbnRzLiBBbmQsIHdlIHdvdWxkIGxpa2UgdG8gc2V0IOKAmEVBIHN1cHBvcnQgPQ0KICAg
ID4gbm/igJkgdG8gZ2FpbiBtb3JlIHBlcmZvcm1hbmNlIG9mIOKAmGRpcuKAmSBjb21tYW5kIGVz
cGVjaWFsbHkgb24gdGhlIGxhcmdlDQogICAgPiBkaXJlY3RvcnksIGJ1dCBhcyBzbWIuY29uZiBk
b2Mgc2F5cywgRUEgc3VwcG9ydCBkaXNhYmxlbWVudCB3aWxsDQogICAgPiBpbXBhY3QgV2luZG93
cyBmaWxlIHNlcnZpY2UgY29tcGF0aWJpbGl0eS4NCiAgICA+IA0KICAgID4gVGhlIGRlZmF1bHQg
aGFzIGNoYW5nZWQgdG8geWVzIGluIFNhbWJhIHJlbGVhc2UgNC45LjAgYW5kIGFib3ZlIHRvDQog
ICAgPiBhbGxvdyBiZXR0ZXIgV2luZG93cyBmaWxlc2VydmVyIGNvbXBhdGliaWxpdHkgaW4gYSBk
ZWZhdWx0IGluc3RhbGwuDQogICAgDQogICAgVG8gZ2l2ZSB5b3Ugc29tZSBiYWNrZ3JvdW5kOiB0
aGF0IGNoYW5nZSB1bnRhbmdsZWQgdGhlIHByZXZpb3VzIG1peHR1cmUNCiAgICBvZiBjb25maWd1
cmluZyBib3RoIFNNQiBsZXZlbCBiZWhhdmlvdXIgKmFuZCogYmFja2VuZCBzdG9yYWdlIGJlaGF2
aW91ci4NCiAgICBOb3dhZGF5cyB0aGlzIHBhcmFtZXRlciBvbmx5IGNvbmZpZ3VyZXMgdGhlIFNN
QiBsZXZlbCBiZWhhdmlvdXIsIGllIGlmDQogICAgd2Ugc3VwcG9ydCBFQXMgaW4gdGhlIHByb3Rv
Y29sLiBUaGVyZSBhcmUgdmFyaW91cyB3YXlzIGEgY2xpZW50IGdldA0KICAgIGxpc3QsIGdldCBh
bmQgc2V0IEVBcyBvdmVyIFNNQiwgYnkgc2V0dGluZyAiZWEgc3VwcG9ydCA9IG5vIiBhbGwgb2YN
CiAgICB0aG9zZSB3aWxsIGZhaWwgd2l0aCBhbiBlcnJvciwgcHJvYmFibHkgTlRfU1RBVFVTX05P
VF9TVVBQT1JURUQuDQogICAgDQogICAgSG93ZXZlciwgaWYgd2hlbiBzZXR0aW5nICJlYSBzdXBw
b3J0ID0gbm8iIFNhbWJhIHdpbGwgc3RpbGwgdXNlIHhhdHRycw0KICAgIGluIHRoZSBiYWNrZW5k
IGFzIHN0b3JhZ2UgZm9yIHZhcmlvdXMgYml0cyBhbmQgcGllY2VzIGxpa2UgRE9TDQogICAgYXR0
cmlidXRlcywgY3JlYXRpb24gZGF0ZSwgQUNMcyBhbmQgc28gb24uDQogICAgDQogICAgPiBJIGFt
IG5vdCBxdWl0ZSBjbGVhciBhYm91dCBjb21wYXRpYmlsaXR5IHByb2JsZW0gd2l0aCBFQSBzdXBw
b3J0DQogICAgPiBkaXNhYmxlbWVudCwgYW5kIGhhdmUgc29tZSBxdWVzdGlvbnM6DQogICAgPiAN
CiAgICA+IA0KICAgID4gMS4gIEluIHdoaWNoIHNjZW5hcmlvcyB3aWxsIHRoZXJlIGJlIHdpbmRv
d3MgZmlsZSBzZXJ2aWNlDQogICAgPiBjb21wYXRpYmlsaXR5Pw0KICAgIA0KICAgIEFzIGV4cGxh
aW5lZCBhYm92ZSwgeW91IGRpc2FibGUgc29tZXRoaW5nIHdoaWNoIGEgV2luZG93cyBzZXJ2ZXIN
CiAgICBzdXBwb3J0cy4gSGVsbCBtYXkgYnJha2UgbG9vc2Ugb3IgeW91IG1heSBuZXZlciBub3Rp
Y2UgYSBkaWZmZXJlbmNlIGluDQogICAgY2xpZW50IGJlaGF2aW91ciwgeW91IG5ldmVyIGtub3cu
DQogICAgDQogICAgPiAyLiAgSG93IGRvIHdlIGNyZWF0ZSBhbmQgdXNlIEVBPw0KICAgIA0KICAg
IFRoZXJlIGFyZSB2YXJpb3VzIFNNQiBpbmZvIGxldmVsIHRvIGdldCBhbmQgc2V0IHRoZW0sIGNm
IE1TLUZTQS9NUy1GU0NDLg0KICAgIA0KICAgID4gMy4gIERvZXMgYW55IHdlbGwta25vd24gV2lu
ZG93cy9NQUMgYXBwbGljYXRpb24gdXNlIEVBPw0KICAgIA0KICAgIEknbSBub3QgYXdhcmUgb2Yg
YW55LiBCb3RoIG1ha2UgaGVhdmUgdXNlIG9mIHN0cmVhbXMsIGJ1dCBub3QgRUFzLiBUaGUNCiAg
ICBtYWNPUyBjbGllbnQgbWFwcyBsb2NhbCB4YXR0cnMgdG8gU01CIHN0cmVhbXMgYW5kIHlvdSB0
eXBpY2FsbHkgZW5hYmxlDQogICAgb24gb2YgdGhlIHN0cmVhbXMgbW9kdWxlcyBvbiB0aGUgc2Vy
dmVyIHRvIHN1cHBvcnQgc3RyZWFtcy4gV2l0aA0KICAgIHN0cmVhbXNfeGF0dHJzIHRoZSBzdHJl
YW1zIHRoZW4gYWdhaW4gZW5kIHVwIGJlaW5nIHN0b3JlZCBpbiB4YXR0cnMgb24NCiAgICB0aGUg
c2VydmVyLg0KICAgIA0KICAgIC1zbG93DQogICAgDQogICAgLS0gDQogICAgUmFscGggQm9laG1l
LCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KICAgIFNhbWJh
IERldmVsb3BlciwgU2VyTmV0IEdtYkggICBodHRwczovL3Nlcm5ldC5kZS9lbi9zYW1iYS8NCiAg
ICBHUEctRmluZ2VycHJpbnQgICBGQUUyQzYwODhBMjQyNTIwNTFDNTU5RTRBQTFFOUI3MTI2Mzk5
RTQ2DQogICAgDQoNCg==

