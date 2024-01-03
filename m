Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D88228FC
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jan 2024 08:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=4e5YnvaFY0mSgRdYnS7WoTZXIZ1M95Q3a/owLHKjCsw=; b=hYOa/mK5E6obfTk5pIgX0fVkd9
	MYNA1kBpfYVouhC8Q4caDotyWdxYwb0oiAjkogyQ/n8E1uj7VqMoWukD2zQ613ENIE6/Dj5mMGmBh
	XWFqgWt7scG6Lu/VT9giw1UwWjM58XbNvVInRRE4hjnJ+VH5RCb/7B5sKkScgRsxHR0dAB+Lk8fkn
	1IylnhU0J/pvq/F8xDUoeVl9/YyQsOzOmb2AyLWyzeQjIIraaLE0mIIDb/kbECBt0bFlySsnbq1a0
	6ie0non1+6k/bFk4v7YA1v3rh+ql2f0og6LqAaKb+PlGpE8OC6/uBovmURD+QnP1xyKQEp3x3zwxL
	uUifzRBw==;
Received: from ip6-localhost ([::1]:38204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rKvgl-002C9J-Ls; Wed, 03 Jan 2024 07:29:18 +0000
Received: from mail-db8eur05olkn2097.outbound.protection.outlook.com
 ([40.92.89.97]:50529 helo=EUR05-DB8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rKvgf-002C9C-8g
 for samba-technical@lists.samba.org; Wed, 03 Jan 2024 07:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lx3ZXwa6pSLz1Yg4fikGxiBW79hOOVTjdaDzFi+g4Rgf9Bw41/23qFR8qyrAKruxDx4CfHwoKIsRcCsElldTcMufstGbVeubYksH8VJU3Et/fORPGNok0PdS9emKIegRVeBC60/VxCqETYHvBnHM9rCmD9kL2XxjSHEVq8sBRE/vOJLJN2UZnYM8IogmZcMyA96LMUw76XYbazKuQfb8CEjzQRMokNWU1/NIQ9NghWd2fFRkwutvvhZYdt3NUjQLNeiKNo73UGXHOp5SWRsFVvl+KgRUX8Ny1ZeXou/XkThzTD9Ie+MR9z29mMRZ4j4EaE16XAaXmlp4nTgIH6LE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwoT/uzJuXru5Wi2ZBJpP8JGwyi7GMGqzdVQu3F+ScY=;
 b=O8/PMW8f55gxu/rUigTQinB3wmhAugN2ajMCWYkf8/2F2G6YxaBV44uwN20iRjeaE0KotNWjOe7Pop6MkCM+rtlhyQspheM8PaZSeN7nn+0eByqKnNeQevvex3nCJDgtBpL4z5cdUB4o8Vj6vFeu785PUqtK0THpXpL+jSoifxOUs3LZmTdNIyT0oug47KCtFodHW2rBmt9r6Es0CycI/2ZxaLrX6Bk1C+3uEZsdcB201e7WrdPJO+ODEXkXZrkngxPP89NQzXJugJVAEDGRrJJYMHOduR4sO+YklHNUZNLKVoIHx1C8XegBXQcklNXmPO+kilknvEDP+DGJDhLvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwoT/uzJuXru5Wi2ZBJpP8JGwyi7GMGqzdVQu3F+ScY=;
 b=h4x60gD4wC0c1UHg2UdMCZCr/YsHp8cv7xKf+vsJUnv4gq1znkDl4EZEQ6fTXR5ZQ163N8BGofmvB6LojZWgJnO4eBAzzV3oo6QA9dEnZzqb1lRbo8LeaSaITjwJVWim6+99dIH26fRKoKLFCMziaKd3dtG37U7lPTsI7wbdNZuyrlkGeOIDNzyFkvA+i56mLSM1QpMhXkhtetEdttZvAujMOa+jCCEvt5wsgQYWJZV06j4VYNwpmL5QFbeKZ3fpXOK3SIXNzXYG2V10IuOK+qR4of9tqQNOMYgRHBHPbjY1DZGGaRaGI2/V9EQqRen4fyLKsyj7YM8Wg1w88U9ieg==
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:390::17)
 by PR3P192MB0973.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:a8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 07:28:58 +0000
Received: from DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::f84:4c00:b5d7:32e0]) by DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
 ([fe80::f84:4c00:b5d7:32e0%3]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 07:28:58 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: =?utf-8?B?5Zue5aSNOiBDVERCIGFuZCBwZXIgcmVjb3JkIHBlcnNpc3RlbmN5?=
Thread-Topic: CTDB and per record persistency
Thread-Index: AQHaOJfcgdPVrr0z7UO2fkgP/Bojv7DHsQIAgAAJGjk=
Date: Wed, 3 Jan 2024 07:28:58 +0000
Message-ID: <DB9P192MB1684640CE6DB300D687CEED8FE60A@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
References: <DB9P192MB1684F7EFAB5DCC7D2390DB77FE9FA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
 <20240103175012.51d1d4bf@martins.ozlabs.org>
In-Reply-To: <20240103175012.51d1d4bf@martins.ozlabs.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [QMmQoD4PSztOs38Dkdxb/XJ3IAWt64NlJXA5N2BcM+Y=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P192MB1684:EE_|PR3P192MB0973:EE_
x-ms-office365-filtering-correlation-id: d6e99d0e-4b5a-4c08-99d7-08dc0c2da65f
x-microsoft-antispam-message-info: sj5skh5N4S2tH9StwmJcrZu/fysQgWI8sQoWdfWLcxabh3W1Kr0K8I1QCXb/Q81mRUN3cAfsJ/Q3OtPrbMFZdENIyCB8W7/JGc0+XAwk9x0qM4NYlLwej1hm0BfF6GKzNLLoQnPL4TYcfA4/Uhu6syalnKWhCXbA6+fO5A7th+VymqweA22bSbRDgBNndivSzAmS7kU8Bg8RMI/BFXnoiYB/wFDcSuwszRPSiYmqAiOTMyG3nFDmxtjmcTFOzLtTvY+bAoCzJ3EXu3xvgacZ51/BBt++xlzLc1V5pk0zqfA7TvQe7fQK0K+wyXNwPEcoWb9AmaUcXu11RT7O+l+a4yuCRtAOWo1stcmaCmEyLYCELx88a+IVfWjHdUzlEjUiVZRAaelWRdbovD/Wl06xHEf7fq35W0NG7voOB7ziCi07PAmSoSRtiSe2Klbq5vlQVCQaxzmAdMHTcFYNph0ZkvNyJ+YfP8k0l3xo6Q9UQYpkFXAXYeM7scxh3Bj1Fyqlr2JVYSamxp7uNQOUtxwXilQGJq3y/JDk/X0w7nDeBN+HcocvTs6I8BqdGsyAaUvi1Tam0jiUKtHghY2RzvzAcfwSXmdbrDLJpAl4iwegEkPPSfCq2Dh9LnCs4t6UUC0u
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFJXSVp6TUI4SkYrMW43RndKOGlOL1FXQjlnemI3K2JKZWxGa1JlQ0x0SzF0?=
 =?utf-8?B?UnVZb1NLdDc2ZWFhNFJ5blJxVzNOb1A2SnRyTFU1MkhSMkNGcnViRjBhSjBT?=
 =?utf-8?B?RHMrek1nbXU5VGdxcDZwTjVFRVR0N0d1MzhQRHIrNkE1Z0tDb1VrYzRESE9p?=
 =?utf-8?B?YThsN2k3Nlg4NzQ1YUZsVEFROUoyenBaQ3VYTEdLc2ZlL1BNTEpsTHYvd3ly?=
 =?utf-8?B?amhXQXJEdDc3Vnc5ZkFkcDdJS0NwM2dKeVVBQ0pNQUVFNjM3S002amsramZG?=
 =?utf-8?B?U1lZNUx3MjZKY3RZRjJpcytzZ3pUM2I5SHlWQzZtdzdkRks4Z2RJZnlMZEQv?=
 =?utf-8?B?NVpNdkhTWHFWemdNOG93eFZ3QW5zVHZSN0lWUXprbEZFa3RzbmpLazJZUG1W?=
 =?utf-8?B?M1BkOGFQejRzR1l3aCtwczJ5SXdYeXNoaGtuTDVKVVBvczFQaUU3UzY5TUxN?=
 =?utf-8?B?eDV1T2VLZHJpYmxabnl2c1A5amk3TEpUMkQ3aXdpa3hENGNVc2h2am1iM0du?=
 =?utf-8?B?cXlwSTJ6VUxQbnAzejJpNi9tYUw3Q1R0RHBHUjNobWhnNlJWVUVLL2phei9n?=
 =?utf-8?B?WjE1SGZHZmZ3T0src1BvazRPOGF3eVR5NmxYMUMzNk1iL3VVZjV5VmV4Rm44?=
 =?utf-8?B?NFVaUjN6dEJmMWQ2aW1pRGRSZDhJdzlRcGVaTTYzT0V0dGtydVd6ZVFEbWZn?=
 =?utf-8?B?ekFFRXZlOXkvc3lMSkZSdzBXU1YvMnM1UE9kVExvWmZKcmxleURqQU5kZ1lQ?=
 =?utf-8?B?S1p4OW9kNzF5aVp6RkZtZmMyaGZLUUVodGVESmV2MitSclgyeDBnQS9xRitq?=
 =?utf-8?B?dm8rQVFBaEs5SWFiZHFHNUFzWHJqcG5OSXBqTDdrOVMwaVRrZk5nU3pwaUh0?=
 =?utf-8?B?bkhuT1ZPZEo5VXM0UTJ1K1NuSjEzK2FPSXRiQnVINkFSbU9CNXo0RFBSNFA4?=
 =?utf-8?B?SFlLUklzaXNKL3BVZldQWldtUlZ6NUZVdWpLZGN3MXRKMnUwMk50TGRkN0xV?=
 =?utf-8?B?SFN6Tm5UTVN2N3ozdVBEL1RnM1NMN0U3RVhMREY3T2ZjNlZESVA4bVR5RW5I?=
 =?utf-8?B?cHg1MjVMTUFzUktja0VJejRXc05la0NQNlNWczRNQk9MRStCaGViVEltYUNO?=
 =?utf-8?B?ODJieXFZVTFwSlJtR3p2OFM0THRkZk1rK2lmNzRZTkRQMTRNSmRLNThCNkF1?=
 =?utf-8?B?WU1RYXNaV1NXdXpNa0k2dmZiZ3I2cWJlbVNKSU9zc2Y1SkdDRUhnNUMxL0VT?=
 =?utf-8?B?bFhROWFGbjc5UjhKeXJRdG1Cd1o2aFBQS2czdm1GeWgvZ2JUV0Z4NThHZlFU?=
 =?utf-8?B?QSttVVhRMG9PaTIyOWdTeW1wQno2cDFuU2wvVkxhbGk2elEyckp4SkRjTVBj?=
 =?utf-8?B?YXFtNUVIQjlSV0JTWllUOEhUZ1hOdjF0U0RoOXROWHNVRHpkQnBvSG04aDkv?=
 =?utf-8?B?VzAwVmFiVEJuaFQ0bTQvbG8xQ0IydzUzMTE5OE5nRXFPSktpaFpHU2M4K2NP?=
 =?utf-8?B?RGtBd0lJVmVwem9jcGRFRzY1MUxRVCtQdkFsQUVLaG0wR09wejhqbFMrMmln?=
 =?utf-8?B?L2dYSWwyUlo5SzQ1aDF0SVlTSWUwVnJoTWJKcVpTMGd0RFNZRnNaeWhxd1cv?=
 =?utf-8?B?R01BYVNLUW1waTRhYlk0VStFbXlSdkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1684.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e99d0e-4b5a-4c08-99d7-08dc0c2da65f
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0973
X-Warn: EHLO/HELO not verified: Remote host 40.92.89.97
 (mail-db8eur05olkn2097.outbound.protection.outlook.com) incorrectly presented
 itself as EUR05-DB8-obe.outbound.protection.outlook.com
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
From: =?utf-8?b?6ZmIIOaWuei/myB2aWEgc2FtYmEtdGVjaG5pY2Fs?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?B?6ZmIIOaWuei/mw==?= <sharingfun520@outlook.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGVsbG8sIG1hcnRpbi4NClRoZSBmaWxlIGNvcHlpbmcgc2NlbmFyaW8gIGludm9sdmVzIGEgY2x1
c3RlciBidWlsdCB1c2luZyBDVERCLCB3aXRoIHR3byBtYWNoaW5lcyBzaGFyaW5nIGEgY29tbW9u
IHB1YmxpYyBJUC4NCldoZW4geW91IGNvcHkgZmlsZXMgdG8gdGhlIHNoYXJlZCBkaXJlY3Rvcnkg
YW5kIHRoZSBub2RlIHdpdGggdGhlIHB1YmxpYyBJUCBleHBlcmllbmNlcyBhIGZhaWx1cmUgd2l0
aCBzdWJzZXF1ZW50IGZhaWxvdmVyLCB0aGUgZmlsZSBjb3B5aW5nIHByb2Nlc3MgY29udGludWVz
IHNlYW1sZXNzbHkgd2l0aG91dCBhbnkgZXJyb3IgZGlzcGxheWVkIG9uIHRoZSBXaW5kb3dzIHN5
c3RlbS4NCkRvIHlvdSBoYXZlIGFueSBtZWFucyB0byBlbnN1cmUgdGhhdCBmaWxlIGNvcHlpbmcg
Y2FuIHByb2NlZWQgbm9ybWFsbHkgZXZlbiBkdXJpbmcgdHJhbnNwYXJlbnQgZmFpbG92ZXIgZXZl
bnRzPw0KQmVzdCB3aXNoIQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCuWPkeS7
tuS6ujogTWFydGluIFNjaHdlbmtlIDxtYXJ0aW5AbWVsdGluLm5ldD4NCuWPkemAgeaXtumXtDog
MjAyNOW5tDHmnIgz5pelIDE0OjUwDQrmlLbku7bkuro6IHNhbWJhLXRlY2huaWNhbEBsaXN0cy5z
YW1iYS5vcmcgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+DQrmioTpgIE6IOmZiCDm
lrnov5sgPHNoYXJpbmdmdW41MjBAb3V0bG9vay5jb20+DQrkuLvpopg6IFJlOiBDVERCIGFuZCBw
ZXIgcmVjb3JkIHBlcnNpc3RlbmN5DQoNCkhpLA0KDQpPbiBXZWQsIDI3IERlYyAyMDIzIDA3OjQw
OjU3ICswMDAwLCDpmYgg5pa56L+bIHZpYSBzYW1iYS10ZWNobmljYWwNCjxzYW1iYS10ZWNobmlj
YWxAbGlzdHMuc2FtYmEub3JnPiB3cm90ZToNCg0KPiBIZWxsbyAsIEkgbGVhcm5lZCBmcm9tIFJh
bHBoIELDtmhtZSdzIHNwZWVjaCBvbiBwZXJzaXN0ZW50IGhhbmRsZXMgYXQNCj4gdGhlIDIwMTgg
U2FtYmFYUCBjb25mZXJlbmNlIHRoYXQgYW1pdGF5IGhhZCBwcm9wb3NlZCBhbiBpZGVhDQo+IHJl
Z2FyZGluZyB0aGUgcGVyc2lzdGVuY2Ugb2YgZWFjaCByZWNvcmQgaW4gQ1REQi4NCg0KPiBJJ20g
Y3VyaW91cyB0byBrbm93IGlmIHRoZXJlIGhhcyBiZWVuIGFueSBwcm9ncmVzcyBzaW5jZSB0aGVu
Lg0KDQpBcyBmYXIgYXMgSSBhbSBhd2FyZSwgdGhlcmUgaGFzbid0IGJlZW4gYW55IHByb2dyZXNz
IG9uIGEgbmV3IENUREINCmRhdGFiYXNlIG1vZGVsIHRvIHN1cHBvcnQgcGVyc2lzdGVudCBoYW5k
bGVzLCB3aXRoIGhpZ2ggcGVyZm9ybWFuY2UuDQoNCj4gSWYgbm90LCBhcmUgdGhlcmUgYW55IG1l
dGhvZHMgdG8gaGVscCBDVERCIHNlYW1sZXNzbHkgaGFuZGxlIG5vZGUNCj4gZmFpbHVyZXMsIHBy
ZXZlbnRpbmcgZmFpbHVyZXMgaW4gdGhlIHJlcGxpY2F0aW9uIG9mIGZpbGVzPw0KDQpJJ20gYSBs
aXR0bGUgYml0IGNvbmZ1c2VkIGJ5IHRoaXMgcXVlc3Rpb24sIGJlY2F1c2UgSSBkb24ndCB1bmRl
cnN0YW5kDQpob3cgInJlcGxpY2F0aW9uIG9mIGZpbGVzIiBjb21lcyBpbnRvIGl0LiAgSXQgaXMg
cmVhbGx5IGFib3V0DQpyZXBsaWNhdGluZyBmaWxlIGhhbmRsZSBzdGF0ZS4NCg0KSSBhbSBzZWVp
bmcgdGhpbmdzIGxpa2UNCmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL3NhbWJhLy0vbWVy
Z2VfcmVxdWVzdHMvMzQ2MSAod2hpY2ggSSB3aWxsDQpyZXZpZXcgdmVyeSBzb29uIDotKS4gIE1l
bnRpb24gb2Ygd2l0bmVzcyBwcm90b2NvbCBtYXkgaW5kaWNhdGUgdGhhdA0Kc29tZW9uZSBpcyB3
b3JraW5nIG9uIHBlcnNpc3RlbnQgaGFuZGxlcy4uLiBidXQgSSdsbCBsZWF2ZSBpdCB0byBvdGhl
cnMNCndobyBrbm93Li4uIHJhdGhlciB0aGFuIGd1ZXNzaW5nIG15c2VsZi4NCg0KcGVhY2UgJiBo
YXBwaW5lc3MsDQptYXJ0aW4NCg==
