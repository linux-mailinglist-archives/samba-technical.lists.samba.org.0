Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C27D122D
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 17:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=yBamlIOBZtWXx8jdxsZPZ10jjY6IhaxNrT2N4pOwGng=; b=jLv7ZRNRZJgTjfbzxy3qVeU4ny
	1ombumbKObUiYZ2O/ZQa2ftpHUmYVqpPIeKX0mVnSh99TFiEmrS+Ggm3f1OMa/B05gwBvY8UuObcb
	c51LCmo+hLrTm8otjZ1C5w8utDFVEQ5yqdJaktDMWuMBZ2cxIrF+sAJeu7zjes8uiSyvrwaHS1wS1
	RZRS7PX2qSeMmvJWx0h3yZOEXtjcsT5luGFrvQt3Qts2ZXcNQDDZYB4HvH87myG/P71dr+9a1oeBt
	3+3R6p+yYNetmU2Z4Tl9vfheRIaog3et8219my4UbgBW38F/9c7IcmpqLQ72B/mIsK9zUl6i9Xdiy
	J2wiTykQ==;
Received: from ip6-localhost ([::1]:52314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtr4F-001W7S-Jm; Fri, 20 Oct 2023 15:05:39 +0000
Received: from mail-bn8nam12on20730.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::730]:63585
 helo=NAM12-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qtr49-001W7I-B4
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 15:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTefJBrieBGEzB+HT+uWO5BIPvjekgiz2U75XeP+DcKq8N+wOGMUlWVEulW0pXxeF329KjdcJTJoDya3adOSmKAVI3WZbh7L26vwhOxhxb+O+c+as/C8bFHqrpjoqnOVnHDwPo4qC38sAEpAtJFqbhgYtG5jsZl/9WyzYAH9jiSePs86TjylnGPwETW8n86ryTthMGqPJayqh30Be0gXNmvvNsK0p1HbPCGR5yfxk9Sy2CUtzPb78vYYJbrBVFvF8XWEed5aMrALAnEuCnSeoKpB29K5HAb9GPk83WaP3QMj3/NQj5sjhYxgPDK0DPlBJuZPX8fgS2E2lpHBzlgQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBamlIOBZtWXx8jdxsZPZ10jjY6IhaxNrT2N4pOwGng=;
 b=jWNbAwJ8i5nxDTrsJ8mQUV9sT1KNa7it3kz+yFvJTs25qvEZfHkjBBQMLGOhRY6a6Ap7bdUeQJJfaQofjDF5kpYeuxMvgYybURsJ3I7QCAhShWLq5nE+f3TyPHGdfFaPf4z2XWkj4C0yK15692RDWaI8Vrii/EV4UmhgLwg8LW0RJ6RkB0yOQanAF58qAD8XwaU9O4x/5ikxxL4UU+L3zFRmgayA+whlqiH7AAAL9zC0YIhwONQ4qgrWYJF+cUhtmBTR7bh5w3RHmnzI0btPGkDOtFmUm8c1SBlcziJfx/0DRpNY9S2l2lTZ4vQe0KLoNmllBqgAYLVi7gjmcCEKIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=miami.edu; dmarc=pass action=none header.from=miami.edu;
 dkim=pass header.d=miami.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=miami.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBamlIOBZtWXx8jdxsZPZ10jjY6IhaxNrT2N4pOwGng=;
 b=p+H0E7tmhUOL7e2sNaGIWrnl8PK3n8+zHe3cx5FIiOTcijogTJ+48gYLuKbxZXtd72Ohz+i0TVMPP0HxEGIlpUxJMnwwgMmlB2124UEOMqbEsK7UryJmg/1Ik2Tj2x5sUEr+RhgF8XnePncmp0mT4NwkH16hwog6j/lgrtt6kps=
Received: from BN0PR07MB8262.namprd07.prod.outlook.com (2603:10b6:408:115::9)
 by CH0PR07MB8947.namprd07.prod.outlook.com (2603:10b6:610:f1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 15:05:15 +0000
Received: from BN0PR07MB8262.namprd07.prod.outlook.com
 ([fe80::1819:8c18:2367:35a3]) by BN0PR07MB8262.namprd07.prod.outlook.com
 ([fe80::1819:8c18:2367:35a3%6]) with mapi id 15.20.6907.025; Fri, 20 Oct 2023
 15:05:15 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: [PATCH][CIFS] allow creating FIFOs when "sfu" mount option
 specified
Thread-Topic: [PATCH][CIFS] allow creating FIFOs when "sfu" mount option
 specified
Thread-Index: AQHaA2bUJDArMo0x2ki9aV02v/OC9Q==
Date: Fri, 20 Oct 2023 15:05:15 +0000
Message-ID: <29169963-d1c6-4972-8e68-1f24d8d2e5b9@miami.edu>
References: <CAH2r5mvve4euMUqsBBqRr2VWgz7ukEZ15vZRVDO=zbzY=XhF1Q@mail.gmail.com>
In-Reply-To: <CAH2r5mvve4euMUqsBBqRr2VWgz7ukEZ15vZRVDO=zbzY=XhF1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=miami.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR07MB8262:EE_|CH0PR07MB8947:EE_
x-ms-office365-filtering-correlation-id: 51af1c92-f251-4cea-d115-08dbd17df76d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: WWd2zQYoFjvLsXLnliE7d6bli8gVPUZHmTAbGIxu53T0JkqcON0DszUjJOjCbw1vl9fkoLp7eGZG0HEtJke9gYok0kHJCSvTMfrqEDFX7QFQGfsCOsslQUuiCx40E7jABl7DWaZnEZ30XJicciYLTtonzWL6DroZ75YfQob8aCI23TQsvrc+F5eGQejHkxeSm/qiLQeVSv9+a8a9q4ngWVINGuBxd/84rdUYDll8fsLS+2W7ziVmifvDXwHxCSqnI2lxxWGUZ/VAbdG6FmQyPd+ASDlCEpMbyjy7L22S878DRhDqhFCpmtk0VPqQbIOxXR03Xwtrp9vw7Q8cMIybsXnc+CScIfCruubCSvpjnRhFu+mS4rLy09RyUZegU7fVOo6lDd3UM4tU2pWqZAJhj4PB6tDuY2w9LtGIATTaBS/aZnxWf04Uactn3M/6+2AgP+HyR8+5bTbHLcPX/Zk7JF/pL6ptMFpK/AflR+e2kOUKzva1OVoaJHk9LjPh1O75601NFkp9JTfWb2bSZUl4D2RkA+l8qxjQwM55ADNkEAyVGMUNHJ28fK/62OxDB0KnoFEdKoShSa9ex07Cynyw7aYm6kJiZm2KtZ454sY8fGsy+bf6dxqOEOPcx54/omDPfWrHNxRode2uAxkC6SiYB+iau+S0gEILwWUesv622dMaMtMz8BdhY62jVcBd9ohb
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2JRaU1kZERsZXJNMFBvUldpT0JNRG5uZWFhRjExcmtrMGc0MVIzbGV2UmdD?=
 =?utf-8?B?eXdyNzR3SWZqTEtVUENUOFRwMkUzNDRKNUV5anMwSzBoY0NjUFhKY0ZkZlpV?=
 =?utf-8?B?eEJycnJQOGc1Z3lqNnlRV3JjeDJaMGZxcEF2TVFRZDdGcDVLc1VsYXQxcGVv?=
 =?utf-8?B?QzFBWGd3aUxIM2FUVzQrajdxSkZYbHF6N09TTmpObXY5MGNzaXI0aXVpWGlX?=
 =?utf-8?B?TU43WHczRlpFVDdHQ1FpUVB4a1huMU5uSXp5WXRIS2d2WHFrUjFUQlVUeXhC?=
 =?utf-8?B?OHlsVEhXMXNOWGZ1VGFpTWZZRU44cGdQYjRodkkyQUF0MVpNR3JqT0V2R2l4?=
 =?utf-8?B?eU40cS9WZDk5U1VZTjVGWnE3YXBSYldjc2draW5meGp4Y1dsUkFxTlB0M3Bl?=
 =?utf-8?B?ZlhpaHY2QXNVMHFEUjJSajVpU1kraFIxbUpZMll3UXQrWkl4ck4wVlZ0Y3R0?=
 =?utf-8?B?WDdSbmFsNmR5M2VSbVkrYkxFZ2k0eVh2dGdTeUlkOThoMlh3TW1kV0RIVGFT?=
 =?utf-8?B?WmJYSm85S0p1VDNqeWV1Z0s4NGZMejBObEkxaEQzdGJ5S0ExL0tYZzNSRi9s?=
 =?utf-8?B?RkExZFdCTUlOMVBTcG9mcHMzajBwekduUFhrUnEwSCt0Y3R3clhDd3p5SG54?=
 =?utf-8?B?RFdSaDR5cERKTmRZcWY4QmtVVjFobTJWb1lYTDFzMW40TXhrdmYrOWRJNGVD?=
 =?utf-8?B?NUpRWFN0L3BzcTJ5ZWhrNXdCOGJWMDVSMlJ2SWlRVGxVcEdWRDE2WEdNUVdh?=
 =?utf-8?B?alR0Q3U4OHJCcDhWTW9aUWorQndrTXdYTHI1T3pjSjJGbWZzb1EyRlJ0ekN0?=
 =?utf-8?B?eDhMV0h3cWtZeHhpMCtSMnhoNm1ocFJaSkxLRnozYmUwdk9YY0E4aVhjdVNI?=
 =?utf-8?B?L0syLy9oNElTK3JVWWJTZmd1ODgxbmR1OGVRRE1Ua2tFWFRtT1MxcVJKd1c3?=
 =?utf-8?B?azdBSjVUUWt3QzNsZTFJbGdPZEJITkxaOGhuYll6alNLUWV3WUFvcVpRSzJH?=
 =?utf-8?B?a3RHeGRLTW92WWdxeDR2YjlwUWd4R3hxcjQwT2U1cUp4dWpVQ1NMVllubzBk?=
 =?utf-8?B?eEhDQXdZbDRLQUZoMWJQSmlHNE5Gd29QZnVwMCtyem16SDBtLzh1VVprcmZ1?=
 =?utf-8?B?ZHJIc1hyelZGeHJ6ZVBlL0V6cWRBc1kyUmZvNlE5dG1XajVXVk1saXFEcUV5?=
 =?utf-8?B?U2N0Rzc0d3RXM2JYYkxjY1dndE4rT1lDcXMxaWZ0S2hpYVhma0hReFZQSGtO?=
 =?utf-8?B?dmJZWGdHTm5DRlB0U1R0WUtJR2IrSmp2U0MzUFd0TzA2ZVh3RUJXeExPL2Zu?=
 =?utf-8?B?ZUlCVVQ5OVlmSjFqb0pxQzRacUNkNUQ4S2h4TTJEZmdXdnlNcUVZeHZjUENU?=
 =?utf-8?B?N0VCeEgybFBkcno5V0FJZHJBUjk2NWZNb3RYT01RemlpUHlWYVp3V0M0S1Bm?=
 =?utf-8?B?M3ovYXNXY2xvcE5qc2N3VFFJNHU0UHBnbnZXSTY5WE8yOGUzcDQwNk05dDhs?=
 =?utf-8?B?U0laR1dIVnorVFRTUHdLYjNnbGpCYlhIQ3AyU3pVNWFtNlloYzU2M3gzcUNP?=
 =?utf-8?B?NU1uRXpHS1hONXdVYVEvblNVZzNOb2t4YTZQZ09LUnNDV2FaMjN6TnA3Zm85?=
 =?utf-8?B?R3ZRdmNNRkJPSDlQZ1k4NDFnbkVha0wyeCttTGNmWG8vTVVKeEkrY0JMblcv?=
 =?utf-8?B?emZRekxJMVJld3ZWaVVPeThHOVhtNjVTQlF5TW15QkRNQStITWt4dGthVUNR?=
 =?utf-8?B?bHJMMHZXZ004L0t3U2owcXZwV05BYk8ybDRiS3pqdjdTNnNZeUppOXFSOEds?=
 =?utf-8?B?SFd5VkhzeGFFTm9pRWRNWHljM2RwM012ZVFuVWJ6cytXeXA3OWl5ZzhZUWhY?=
 =?utf-8?B?cm9HSjZDbTNwQ1pUWWFCcDhsWklsMVlCVEM4VnR3dk4zMVZTcU14aTFjMkxq?=
 =?utf-8?B?SVFiV2VZYkhGRjNTbDlMN2U1SHUwa05VRENsNzdwaGY5OW93YXJIVXlzRFhm?=
 =?utf-8?B?TU9HTSs4RlBHR1M2c2twK2ZxNTdDWkNySGV5cmc3aE15THpiL2REdTljS3RB?=
 =?utf-8?B?M1FxOFBDd3FWb3BUaitybElYTEQ4SzBrY0E4bmRYZ2MzZDVNQkxvMmJSWTVo?=
 =?utf-8?B?VEpUSCtuM01IZVdEcVkwYWNSbFk4a0ZaWkYwRStmSXVEaEJDWVg4V2VsWjZs?=
 =?utf-8?Q?Tv++t4ZNtlpTshZVvcnvqMT7fULW5qKZ8+0Sg6hcYBSi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DD1786900AC0C479D33FC72A1FDB16A@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: miami.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR07MB8262.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51af1c92-f251-4cea-d115-08dbd17df76d
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a144b72-f239-42d4-8c0e-6f0f17c48e33
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxd8zflXWLGMsZnT4lg4GHuEdPKFIfO1CwyMxu8M0Zgw8aDVdDw7QWWLVmWlsnCDhudUMBjCyz1r49ZMvOlS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR07MB8947
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:fe5b::730
 (mail-bn8nam12on20730.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-BN8-obe.outbound.protection.outlook.com
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
From: "Brown,
 James William via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Brown, James William" <jim.brown@miami.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

T24gMTAvMjAvMjAyMyAxMjozMiBBTSwgU3RldmUgRnJlbmNoIHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgdGhl
IG9yZ2FuaXphdGlvbi4gRE8gTk9UIENMSUNLIE9OIExJTktTIG9yIE9QRU4gQVRUQUNITUVOVFMg
dW5sZXNzIHlvdSBrbm93IGFuZCB0cnVzdCB0aGUgc2VuZGVyLg0KPg0KPiBtYjM6IGZpeCBjcmVh
dGluZyBGSUZPcyB3aGVuIG1vdW50aW5nIHdpdGggInNmdSIgbW91bnQNCj4gICBvcHRpb24NCj4N
Cj4gRml4ZXMgc29tZSB4ZnN0ZXN0cyBpbmNsdWRpbmcgZ2VuZXJpYy81NjQgYW5kIGdlbmVyaWMv
MTU3DQo+DQo+IFRoZSAic2Z1IiBtb3VudCBvcHRpb24gY2FuIGJlIHVzZWZ1bCBmb3IgY3JlYXRp
bmcgc3BlY2lhbCBmaWxlcyAoY2hhcmFjdGVyDQo+IGFuZCBibG9jayBkZXZpY2VzIGluIHBhcnRp
Y3VsYXIpIGJ1dCBjb3VsZCBub3QgY3JlYXRlIEZJRk9zLiBJdCBkaWQNCj4gcmVjb2duaXplIGV4
aXN0aW5nIGVtcHR5IGZpbGVzIHdpdGggdGhlICJzeXN0ZW0iIGF0dHJpYnV0ZSBmbGFnIGFzIEZJ
Rk9zDQo+IGJ1dCB0aGlzIGlzIHRvbyBnZW5lcmFsLCBzbyB0byBzdXBwb3J0IGNyZWF0aW5nIEZJ
Rk9zIG1vcmUgc2FmZWx5IHVzZSBhIG5ldw0KPiB0YWcgKGJ1dCB0aGUgc2FtZSBsZW5ndGggYXMg
dGhvc2UgZm9yIGNoYXIgYW5kIGJsb2NrIGRldmljZXMgaWUgIkludHhMTksiDQo+IGFuZCAiSW50
eEJMSyIpICJMbnhGSUZPIiB0byBpbmRpY2F0ZSB0aGF0IHRoZSBmaWxlIHNob3VsZCBiZSB0cmVh
dGVkIGFzIGENCj4gRklGTyAod2hlbiBtb3VudGVkIHdpdGggdGhlICJzZnUiKS4gICBGb3Igc29t
ZSBhZGRpdGlvbmFsIGNvbnRleHQgbm90ZSB0aGF0DQo+ICJzZnUiIGZvbGxvd2VkIHRoZSB3YXkg
dGhhdCAiU2VydmljZXMgZm9yIFVuaXgiIG9uIFdpbmRvd3MgaGFuZGxlZCB0aGVzZQ0KPiBzcGVj
aWFsIGZpbGVzIChhdCBsZWFzdCBmb3IgY2hhcmFjdGVyIGFuZCBibG9jayBkZXZpY2VzIGFuZCBz
eW1saW5rcyksDQo+IHdoaWNoIGlzIGRpZmZlcmVudCB0aGFuIG5ld2VyIFdpbmRvd3Mgd2hpY2gg
Y2FuIGhhbmRsZSBzcGVjaWFsIGZpbGVzDQo+IGFzIHJlcGFyc2UgcG9pbnRzICh3aGljaCBpc24n
dCBhbiBvcHRpb24gdG8gbWFueSBzZXJ2ZXJzKS4NCj4NCj4gQEAgLTUxMzUsNiArNTEzNSwxMiBA
QCBzbWIyX21ha2Vfbm9kZSh1bnNpZ25lZCBpbnQgeGlkLCBzdHJ1Y3QgaW5vZGUgKmlub2RlLA0K
PiAgIAkJcGRldi0+bWlub3IgPSBjcHVfdG9fbGU2NChNSU5PUihkZXYpKTsNCj4gICAJCXJjID0g
dGNvbi0+c2VzLT5zZXJ2ZXItPm9wcy0+c3luY193cml0ZSh4aWQsICZmaWQsICZpb19wYXJtcywN
Cj4gICAJCQkJCQkJJmJ5dGVzX3dyaXR0ZW4sIGlvdiwgMSk7DQo+ICsJfSBlbHNlIGlmIChTX0lT
QkxLKG1vZGUpKSB7DQo+ICsJCW1lbWNweShwZGV2LT50eXBlLCAiTG54RklGTyIsIDgpOw0KPiAr
CQlwZGV2LT5tYWpvciA9IDA7DQo+ICsJCXBkZXYtPm1pbm9yID0gMDsNCj4gKwkJcmMgPSB0Y29u
LT5zZXMtPnNlcnZlci0+b3BzLT5zeW5jX3dyaXRlKHhpZCwgJmZpZCwgJmlvX3Bhcm1zLA0KPiAr
CQkJCQkJCSZieXRlc193cml0dGVuLCBpb3YsIDEpOw0KPiAgIAl9DQo+ICAgCXRjb24tPnNlcy0+
c2VydmVyLT5vcHMtPmNsb3NlKHhpZCwgdGNvbiwgJmZpZCk7DQo+ICAgCWRfZHJvcChkZW50cnkp
Ow0KPiAtLSANClNob3VsZG4ndCAiZWxzZSBpZiAoU19JU0JMSyhtb2RlKSkiIGJlICJTX0lTRklG
TyI/DQoNCmVsc2UgaWYgKFNfSVNCTEsobW9kZSkpDQoNCmVsc2UgaWYgKFNfSVNCTEsobW9kZSkp
DQoNCg==

