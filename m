Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D90327ADC
	for <lists+samba-technical@lfdr.de>; Mon,  1 Mar 2021 10:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=U0tHW0i5oDVI9yZGVORKnUi2dP63NMwDoPpziLhzTSU=; b=4UYkSOYl7erXr/X5un7stBcuTO
	jOddXt5HkSfQnw4nuDUZS0JHhEp0hXiVr5WFOtpvJttI8bgBjPQZi2mAE8XB38DZ2neBETbXZiekV
	cOXnfCyF7SMVBWB/qFWDrO6lKp5s05KyEaebfa57XpEPvedD861DfOual3jnjcfjmRFflwstDqrhj
	v/YhycaIRcK+ya8/ub+4rE+lvb+rDgXUgCHFuX1rNDFmshEUJpGukmVwMPIgzA8e8UVeQpr18nHSq
	Fh51rOVX2+xuvZ5t0X3VRmki6qQv4piU2HXoDHbhjwGERhU9hFPss+ZFHvuvPlEUAw5KRtT/v3H3F
	pWyhsPKw==;
Received: from ip6-localhost ([::1]:23822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lGeww-003aaH-Ps; Mon, 01 Mar 2021 09:34:46 +0000
Received: from mail-eopbgr60069.outbound.protection.outlook.com
 ([40.107.6.69]:38880 helo=EUR04-DB3-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lGewp-003aaA-Ng
 for samba-technical@lists.samba.org; Mon, 01 Mar 2021 09:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRwJsGQArqsiwYewVffQftyKpCapeI4m71IHgQYPaEuPhT4WrDfVecx+ERMG+aso8EUtT95V9DmHdq0Z/SxFLFKXAx3w+XZS9xgqf4SDx+Orzhfx1T+VSNrWBlwl4u4Os/ocUxkf+OMh0o29dhljgOd9nAPDmlW5+z7+8zXG7TdYB07qEELp6ssSRsXYb803xtIyFkZX/4aYMfMlrlIao8EFNSw5IUOx9oz4pr85fr3iXs9uQJYgfARgwiC2q23sA1HqWCHeFtA2f6SyqkQUy6cnGyPv5E1AAPF4oaG2rGhCe8s1iPFr1N5MevOB2uioD9QW5/s/7PlD/pZ4Vi7iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0tHW0i5oDVI9yZGVORKnUi2dP63NMwDoPpziLhzTSU=;
 b=VRe7w1gNCDt00svRZSk+kQgDLbom/7eZmHLWfop/P8U5T5rp0p+R42GnlOtz79io9uFZv0XN8tqxeYzC3qixBzbSJ76EA8S5EtH2bphvPWfEcqO1+OLKLnrvmROKXcJoN1N+aCdjJQ6Pqph+s+d+oqhA6G+H0kErwUKRl5hYcjoyKlQ+WmTnckPWKKt7S4sya3J84HlsFH6V8gnwqmbm5Z8yr46leV2KmtrCmbX79b0+/IhXenXPZydoA1HyUo0js0tGEHyT8JfQr7Lbckhq/tv4ibdne83+UQN4da9PgEfEWPF+EApk5vFzk05M7iKd5IUMaZh3HngeT58hswt73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digitx.de; dmarc=pass action=none header.from=digitx.de;
 dkim=pass header.d=digitx.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitxgbr.onmicrosoft.com; s=selector2-digitxgbr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0tHW0i5oDVI9yZGVORKnUi2dP63NMwDoPpziLhzTSU=;
 b=XiWdkIUU2VS/ZscMnH1U2BB49BQAaWwlFp9bprUxAUGIVPL2i+rHGtDKa8wzlg4HhrAv7DVtaEHmuASackaZke7JIiOUmh5loZ/YRK+Nxo57PJXbNUhv+2F5CB8Hxtt7ZPylf3paVm61yasvecTwhl1165MEx5cAv92II1R3oRw=
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com (2603:10a6:20b:2c8::19)
 by AM0PR05MB5828.eurprd05.prod.outlook.com (2603:10a6:208:11f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 09:33:58 +0000
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b]) by AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b%6]) with mapi id 15.20.3890.026; Mon, 1 Mar 2021
 09:33:58 +0000
To: Andrew Bartlett <abartlet@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: RE: "make test" of samba master fails in a privileged Linux container
Thread-Topic: "make test" of samba master fails in a privileged Linux container
Thread-Index: AdcNG8nJepFNSaPLTkq06ebMQr602QBAK8MAABc5YqA=
Date: Mon, 1 Mar 2021 09:33:58 +0000
Message-ID: <AM9PR05MB7636EBA1FFBBB331E763289ECF9A9@AM9PR05MB7636.eurprd05.prod.outlook.com>
References: <AM9PR05MB7636914952B5F2FFB0567C54CF9C9@AM9PR05MB7636.eurprd05.prod.outlook.com>
 <33eb694cec3bfd3c47089a72d79497665a88b8b8.camel@samba.org>
In-Reply-To: <33eb694cec3bfd3c47089a72d79497665a88b8b8.camel@samba.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=digitx.de;
x-originating-ip: [93.217.244.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8eedbe7-c1a0-4a3b-61a1-08d8dc9523db
x-ms-traffictypediagnostic: AM0PR05MB5828:
x-ms-exchange-minimumurldomainage: samba.org#8451
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1rrOIQ053pQR7w3+v+HvvISvQElemMkMqdPLJz302nqfKOWtAr7ll2eKZ4ldZWsZ/IRQv9f5WC5V/JHpOeLTUYsuOzF5fDk+Gs/ENzzoKoqJ1r8SdY/uP8jah+D3hlmujxshKT1RYPXsIcKQAc4OU7B9XMXJ2avRBrM+AuTs8C7wF6pDGFUWax3PRCBmc6648JHzmN32wtQd9LX7JSSqsTd8Y63EHPFTYUiQnsuVz7g4nglDVx6QqAHTEIEJDLxhiDmHP8j90VGmgskoYCZT/ja7Lu/IyEHBou/nbOu4CVddZ2pSGKcF1OVXaTRiiAr8IYwg/Omw9YIScieYgL8NEKLUdn1p7q3eWCZmoTs7xq9KvbqahfKVn3lu55TO7ZMhBUUXuM3Km3N4+4jqCpQw4qYuBSqNav9Pv1lI2j6greLk0Or07O2o9B31lMqo0BRD+0YfemKZfjKwOqdweU/2FEWxB+8cC6jDhtH3Tvwa8MML1KWJz1Rqx3CO7ZKh3IFqRnw2XcbYB+QziU5hsdOu1HfbyM8R7gNUG4LIZOWD4TXAr3+cN5KV0tebbimvFmWJPGEL865Xqe78RYsit9SHwD2Gh2VbLZqydlNTCoeJ5sM=
x-ms-exchange-antispam-messagedata: =?utf-8?B?UGZsN1kvMDR4dGNZRzJQMk9nVVBVYk9pNEd1VU94R25EbWVmU0RCRHliM24r?=
 =?utf-8?B?N3VKN3BHSzlSaHBPeExTRUplT2t4NjFtaXVQTFlJQ2tXSCt6VTBoT3M2TDhz?=
 =?utf-8?B?Q3RYMU56Vnl3cUFhbGNEaUZ0aFpUYk9VL3ZnMW1qUThoVXRjWkhXaVh5SWR2?=
 =?utf-8?B?TFdMSzVkVHlZNzRQWDlJeVowRWczSWtmZUl5bFRGMWlUMWgxUEZKejJRSGhK?=
 =?utf-8?B?UlpvUEZ1cmtLSHUvRHZnb2xScmVFRUJVdW13ZXkwbHVYUm9iamNqNGhGWUNI?=
 =?utf-8?B?aUh5bTFIR2xocUxtZnFqSm1FeXJWdEVEMGJVRnJ2ZlpTeFcrVTZBelErMDB1?=
 =?utf-8?B?VzV2aDZPZDJSL3NDdkV4U3lNcGd4bnc4U3AvdVJaQjZOOUFhbldLYnVJQVZj?=
 =?utf-8?B?N2h2YWRQQmNkZnlxeXQ5QVVrbXdnSnBPcFdKdThMZ1pHRGNpYU5IamFuYUtJ?=
 =?utf-8?B?ZHNJRG1rUkcrS3poOUxHNTNXZzNnQkpJUThLYTJsK1BVSW9tVXQ4bERYeVRB?=
 =?utf-8?B?c1B0R1lyTEp0SmhyeXhacnpnWmVab0xsOXg0MUxOekIyeGFSWlhRZi9qNnB6?=
 =?utf-8?B?WUhsTmtvTjdZL0JwY0p3dEpyTHhZN1pzbnpsSHRkTjVCQXUxSU1NRERDV29l?=
 =?utf-8?B?bnNoZUV3dllXMmtiSEg4R0FDUmwvOE81Y3ZRT2FCZEtaUVBvQ0N1ckNCRSto?=
 =?utf-8?B?Zkt1RnVocm1jT1d1R1h6RjJHT3BTNjgxdXdEekd0SVFuTkJ5d0hBcjFvMFNz?=
 =?utf-8?B?Nk91RXhhdlIrbmtFallsMEFWSUozbDRmWGw1emFRaVdDN0lNY25jQU84NXh5?=
 =?utf-8?B?S0lnSXl5NHNIUFpDZWxZdmJGdVVNZGhzL2lGR2w4dmVJN2MxV3A1Qm5VWkcy?=
 =?utf-8?B?UlFmNUw5NkFTczBBSktqSUZDdDRFN2laRjRnY202YTkvdGVvL3RUYzNTVjgr?=
 =?utf-8?B?RnMxQ1FDQ2JiVGU2T21wdjN5SUdyRW53a3VKY3pVNnl6SWgySWptUGlwNUF1?=
 =?utf-8?B?eThQZnlHTnozTUpzSjhqZWltbi9iRUY1SDBRNmxVTzVLeTFXMmJJcmJ3UDho?=
 =?utf-8?B?aGQvRjErdEQvTGhsZzF4UWJCdFRtQkN4eFZJc0E2VXYxVTJ6c1M3b1hlU1ll?=
 =?utf-8?B?REgrMXJ1akdXT09JemtOQUdjbGZ6MTZ3YnZCZm96bHBLcFdEVkJRRnJWUXZZ?=
 =?utf-8?B?aDZoVUxsMFI2NFVrZ1d0V0lMUVAvR1FYNjZuTGtzdjhVMXY1YWhxUkxhTm9K?=
 =?utf-8?B?a2pMUnpER2ppN2ozTEd3SjJNMm4wcDFkeFNPOFRMOElXN3ZCei83QjVKVkM1?=
 =?utf-8?B?ajFDSnZSSkRTYVNBdXd1ci9xaEM4OE9mZ0wzYjl4b2wzT0dWdFVBS2NNd0wr?=
 =?utf-8?B?NmZtT1AzNHQ5K0JHYmJjV2RYeWRwdDZmSlBoalg0N1RsajRpWS9UeDlQUUo0?=
 =?utf-8?B?a1Q4cGNWaFdyUWlTajBoM1BaVlNWeUFVWFRjYSt0V3VkbERhbEE5N2NJUnFN?=
 =?utf-8?B?VnhXeGYrZElqNmx6azg1SHVUZTJDdmM0c2ZzRzh1RHdPTTFnNVRyNlRzTy9t?=
 =?utf-8?B?dVk4aVJxVXY0SFA4SkZNZ1Arbkh5c01XT0JabGlsSmZYNm5FZ0hJcUgzb1U1?=
 =?utf-8?B?b21VbURQUmE4Z1dBTUxId2Z6Zmpvb2tXMkh0cFg0YmR6YU05S0Y3ejdHTzJU?=
 =?utf-8?B?TGpXdDY0UEtKR25sbGs3ZXNSSkNUTUpMWEVZWHAyZGsvWENyWWpkdU15QXpO?=
 =?utf-8?Q?9oP1oLvTQcY3EvJ+os=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: digitx.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7636.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8eedbe7-c1a0-4a3b-61a1-08d8dc9523db
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 545eefb3-8b20-4e2a-bcdb-884c876d0f6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tcrKZD5mN2qGq/kwha9t+/9cY5GEHHPfW4BN4u204dVmLXNXCBYL0fn1Qp3VwZ55LNlXs6eZPI5DxwmkFbOKDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB5828
X-Warn: EHLO/HELO not verified: Remote host 40.107.6.69
 (mail-eopbgr60069.outbound.protection.outlook.com) incorrectly presented
 itself as EUR04-DB3-obe.outbound.protection.outlook.com
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
From: Thomas via samba-technical <samba-technical@lists.samba.org>
Reply-To: Thomas <tgeppert@digitx.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

T24gU3VuLCAyMDIxLTAyLTI4IGF0IDEwOjU2IFBNLCBBbmRyZXcgQmFydGxldHQgdmlhIHNhbWJh
LXRlY2huaWNhbCB3cm90ZToNCj4gUGF0Y2hlcyB0byBtYWtlICdtYWtlIHRlc3QnIHJlcXVpcmUg
YSBURVNUUz0gcGFyYW1ldGVyIG1pZ2h0IGJlIGEgZ29vZCBpZGVhLCB0byBzZXQgZXhwZWN0YXRp
b25zIGNvcnJlY3RseSwgdXNlcnMgd2FudGluZyB0byBhdCBsZWFzdCBydW4gb3ZlciB0aGUgd2hv
bGUgdGVzdHN1aXRlIGFueXdheSBjb3VsZCBydW4gd2l0aCAiVEVTVFM9LiIuDQpUaGFuayB5b3Ug
QW5kcmV3IGZvciBtYWtpbmcgdGhpcyBjbGVhci4gSSBkaWRuJ3QgZmluZCB0aGlzIGluIHRoZSBk
b2N1bWVudGF0aW9uIHNvIGlmIEkgaGF2ZW4ndCBvdmVybG9va2VkIHNvbWV0aGluZyBpdCB3b3Vs
ZCBwcm9iYWJseSBiZSBnb29kIHRvIGhpZ2hsaWdodCB0aGUgZmFjdCBpbiB0aGUgd2lraSBvciBt
YWtlIGl0IG1vcmUgcHJvbWluZW50Lg0KDQpOb3cgSSBuZWVkIGEgbGl0dGxlIG1vcmUgaGVscCBw
bGVhc2UuDQpMZXQgbWUgZmlyc3QgZXhwbGFpbiB3aGF0IG15IG9iamVjdGl2ZSBvZiBydW5uaW5n
ICJtYWtlIHRlc3QiIGlzLg0KDQpJIGRpZCBwYXRjaCB0aGUgc2FtYmEtdG9vbCBwcm92aXNpb25p
bmcgc2NyaXB0IHRvIGVuYWJsZSB0aGUgcHJvdmlzaW9uaW5nIG9mIGFuIEFEIERDIHdpdGggdGhl
IG5mczRhY2xfeGF0dHIgVkZTIG1vZHVsZSBpbnN0ZWFkIG9mIHRoZSBhY2xfeGF0dHIgbW9kdWxl
Lg0KSSBjYW4gbm93IHByb3Zpc2lvbiB0aGUgQUMgREMgd2l0aG91dCBlcnJvcnMgYW5kIGFsc28g
cnVuIHN5c3ZvbGNoZWNrIGFuZCBzeXN2b2xyZXNldCB3aXRob3V0IGVycm9ycy4NCk15IHBsYW4g
d2FzIHRvIHVzZSAibWFrZSB0ZXN0IiBhcyBhIG5leHQgc3RlcCB0byBjaGVjayB0aGlzIHNldHVw
IGFuZCBzZWUgd2hhdCBib21icyBnZXQgZHJvcHBlZCBvbiBtZS4gOi0pDQoNCkFmdGVyIHN1cGVy
ZmljaWFsbHkgc2tpbW1pbmcgdGhyb3VnaCB0aGUgY29kZSBmb3IgIm1ha2UgdGVzdCIgaXQgbG9v
a3MgbGlrZSBJIHdpbGwgaGF2ZSB0byBtb2RpZnkgc29tZSBvZiB0aGUgdGVzdCBlbnZpcm9ubWVu
dCBzbWIuY29uZiBmaWxlcyBhdCB0aGVpciAiIHZmcyBvYmplY3RzIiBkZWZpbml0aW9uIHRvIG1h
a2UgdGhlbSB1c2UgdGhlIG5mczRhY2xfeGF0dHIgVkZTIG1vZHVsZS4NCkluIHBhcmFsbGVsIEkg
d291bGQgbGlrZSB0byBydW4gdGhlIHRlc3RzIHdpdGggdGhlIHN0YW5kYXJkIHNldHVwIGZvciBj
b21wYXJpc29uLiANCg0KV2hhdCB3b3VsZCBiZSB0aGUgcmVsZXZhbnQgaW5pdGlhbCB0YXJnZXRz
IHRvIHVzZSBpbiB0aGUgVEVTVD0gcGFyYW1ldGVyIGZvciB0ZXN0aW5nIHRoZSBiYXNpYyBBRCBE
QyBmdW5jdGlvbmFsaXR5ID8NCg0KICAtLS0tLS0tDQpUaGFua3MNClRob21hcw0KDQo+IEkgZGlk
IGNsb25lIHRoZSBzYW1iYSBnaXQgcmVwbyB3aXRoaW4gYSBwcml2aWxlZ2VkIERlYmlhbiAxMCBM
WEMuDQo+ICJjb25maWd1cmUiIGFuZCAibWFrZSIgY29tcGxldGVkIHN1Y2Nlc3NmdWwgYnV0ICJt
YWtlIHRlc3QiIGZhaWxzDQo+IHdpdGg6DQo+IA0KPiBGQUlMRUQgKDE4MyBmYWlsdXJlcywgMCBl
cnJvcnMgYW5kIDIgdW5leHBlY3RlZCBzdWNjZXNzZXMgaW4gNjMNCj4gdGVzdHN1aXRlcykNCj4g
DQo+IEl0IGlzIGFuIHVubW9kaWZpZWQgYnVpbGQgb2Ygc2FtYmEgbWFzdGVyLiBXaGF0IGFtIEkg
bWlzc2luZyA/DQo+IElzIGl0IG5vdCBwb3NzaWJsZSB0byBzdWNjZXNzZnVsbHkgcnVuICJtYWtl
IHRlc3QiIGluIGEgcHJpdmlsZWdlZCANCj4gTGludXggY29udGFpbmVyID8NCg0KSSB0aGluayB5
b3Ugd2lsbCBmaW5kIHRoYXQgJ21ha2UgdGVzdCcgZmFpbHMgYWxzbyBvbiBhIGZ1bGwgVk0sIGJ1
dCBpZiB5b3UgbGlrZSB5b3UgY2FuIGNoZWNrIGlmIHlvdSB3YW50IHRvIHNwZW5kIHRoZSB0aW1l
IGFuZCBDUFUgY3ljbGVzLg0KDQpVbnRlc3RlZCBjb2RlIGlzIGJyb2tlbiBjb2RlIGFuZCB0aGVz
ZSBkYXlzICdtYWtlIHRlc3QnIGlzIG9ubHkgcnVuIGluIGNodW5rcyBhcyBwYXJ0IG9mIG91ciBh
dXRvYnVpbGQgYW5kIEdpdExhYiBDSSBwcm9jZXNzLCBzbyBpdCBpcyBubyBzaG9jayB0byBsZWFy
biB0aGF0IGl0IGZhaWxzIGFzIGEgd2hvbGUuICANCg0KSSdtIHByZXR0eSBzdXJlIGl0IGhhcyBi
ZWVuIGxpa2UgdGhhdCBmb3IgYSB3aGlsZS4NCg0KUGF0Y2hlcyB0byBtYWtlICdtYWtlIHRlc3Qn
IHJlcXVpcmUgYSBURVNUUz0gcGFyYW1ldGVyIG1pZ2h0IGJlIGEgZ29vZCBpZGVhLCB0byBzZXQg
ZXhwZWN0YXRpb25zIGNvcnJlY3RseSwgdXNlcnMgd2FudGluZyB0byBhdCBsZWFzdCBydW4gb3Zl
ciB0aGUgd2hvbGUgdGVzdHN1aXRlIGFueXdheSBjb3VsZCBydW4gd2l0aCAiVEVTVFM9LiIuDQoN
ClNvcnJ5LA0KDQpBbmRyZXcgQmFydGxldHQNCg0KLS0gDQpBbmRyZXcgQmFydGxldHQgKGhlL2hp
bSkgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvfmFiYXJ0bGV0Lw0KU2FtYmEgVGVhbSBNZW1iZXIg
KHNpbmNlIDIwMDEpIGh0dHBzOi8vc2FtYmEub3JnDQpTYW1iYSBUZWFtIExlYWQsIENhdGFseXN0
IElUICAgaHR0cHM6Ly9jYXRhbHlzdC5uZXQubnovc2VydmljZXMvc2FtYmENCg0KU2FtYmEgRGV2
ZWxvcG1lbnQgYW5kIFN1cHBvcnQsIENhdGFseXN0IElUIC0gRXhwZXJ0IE9wZW4gU291cmNlIFNv
bHV0aW9ucw0KDQo=

