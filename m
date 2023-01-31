Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC966824CC
	for <lists+samba-technical@lfdr.de>; Tue, 31 Jan 2023 07:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=sGnNe8qJE2X3yj5rqYKUQ6LbP0wF0XqKxGbve+l6rv8=; b=Gm8eVpmqePfqR8rZeLKH3pieP+
	eGu48RLQ+zrTbZ4h8cr9N9/oQVWwr9OWXe81t+JzqQvBGyoD7L1C9D/DPkVMOz2MxsbSdCILlViLq
	tMGOoxXDLLosRleZUeURmRldzQvPv/QMD+R+GoXwajNHy90w8aOB2asTeaOW94ftKdjswZ1TIb3bv
	BG6EhWHHqXjj8A/sFvs3dO1/67ihbw2WVgiN/KQlO2aaQxUXCmFwXnz5dqS+fcQ3QLDPW7c0yU/gi
	/V0T0cB59gN5k9HdEQ7Ddi0x5DWQs3ByIO0x9gBWimo2DjB4DxI0igFUydvqCUfD2eZqX+s0FO1i7
	T81MMo2w==;
Received: from ip6-localhost ([::1]:32666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMkQ9-004yKb-V3; Tue, 31 Jan 2023 06:47:10 +0000
Received: from mail-psaapc01on2123.outbound.protection.outlook.com
 ([40.107.255.123]:9568 helo=APC01-PSA-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMkPu-004yKR-W6
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 06:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oec66MA+Vior57MHHOPq77ST+kHjhhIKcDnn8fDKUDSttHob/yrwsq8daKo2LB0wfsjaYqUAKcVRejl8l8oQLUrX7BD9ewCF66oJpDM2eBCGcJED7L4h1Qe9vK7hAXSt++z9v1aO1epHht1YS+gFcNG9sjRtkEnU2h/3zez9+wlNUBqrRzGFe5d1mn75ywAZSQWFltmUNL9dpnUYAcN3srEsPsFDBwAgtjcEibTE+gDfSq+T25kfL244TrQKD+FMbBySWSF0Sf3f46CI7tYgrmaoNcT/jSjKE41EFhjbaPanz6qzK37alNNodSbyB5yzmNLValFn0TTReRxDUNL4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb20FGU7PaRdkUl0xbuQO2dmKdPuGpW3hL5bQn854+M=;
 b=c4GWIkWBnrFOZGFj1a2fKiAG8bSjnkoG4X0iEPO2304shBWO85kQxmtqQiyZVdVcWtBL5cQ8ZTc3zEuVYfZB+lFJQxhhLuV9HKIvgGPuYCRG82b6zgYNoI1YERpAuyzozZ+P1kJoXSKi2SgM1ObFzLH12hC3L1Q7D6O6TNwbMqPzbyMXKDG2foBW3mHSVYYHZ3h+rEj3LtWEwh+ftOQEfqRsoeBKbZhF8bEeEEDSBWjLA6+iHhut8SdCqCbd256UHO2chlMXexQ1YBUW4bkeeG9qr8r1TUXB+96lt55cIpT09quuxWUaKQl7oX492gHxMsS/vIU/xiTOSnvee1gHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=grown-up.com; dmarc=pass action=none header.from=grown-up.com;
 dkim=pass header.d=grown-up.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grownupgroup.onmicrosoft.com; s=selector2-grownupgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb20FGU7PaRdkUl0xbuQO2dmKdPuGpW3hL5bQn854+M=;
 b=NPNij1roLKnoLzL8cCiHz7VekZaJ7MyD2ikBXnLQY3PlUumu/OoN13A0pQ4eIXOmcTTG20+/SHZNrW0g9EtCZdDjoZqwmpTwrhH7Md+Bp3pVUHGJzEesA4xyQL7dtneSDsH6lN1RINe7ah2p20KubWmXI4Ji/TdehA8vRw1Avj8=
Received: from PSBPR01MB3558.apcprd01.prod.exchangelabs.com
 (2603:1096:301:9::8) by TYZPR01MB3886.apcprd01.prod.exchangelabs.com
 (2603:1096:400:33::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 06:46:35 +0000
Received: from PSBPR01MB3558.apcprd01.prod.exchangelabs.com
 ([fe80::a913:96e4:25dd:87c0]) by PSBPR01MB3558.apcprd01.prod.exchangelabs.com
 ([fe80::a913:96e4:25dd:87c0%4]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 06:46:35 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: problem with GPO Policy after rename
Thread-Topic: problem with GPO Policy after rename
Thread-Index: AQHZNSjp98oJzN48tkWwOsKAkcqFnQ==
Date: Tue, 31 Jan 2023 06:46:35 +0000
Message-ID: <3E14DFAD-1094-4089-8897-88AF7CA133EF@grown-up.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=grown-up.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSBPR01MB3558:EE_|TYZPR01MB3886:EE_
x-ms-office365-filtering-correlation-id: 61d7b821-978b-40b7-4d97-08db0356e594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 9uWGf/tatixFbEdn65j3Bh+CyIiGEUf3pJ6nIDLXLAgMYLt5CFrMynP3r4IdNzKe7ZnaY6zZzc+hfJxrJLnYirfyjn1DGkNkXi5x/9vtOBs/UK9dJXQDGWz5by5DnKqMcyDmirbgvLMlHm2mlJwiYgtDFsP190X4SA/12S/bFiX2v0++5u0Rud1Pm+1ak4Rl5vTuFQ+ScmNGQh28b7NYFQUpJvdxBz4Jzmx+Ky256sJIJFhXf6fGREfERos1kQTUczZvhvfQFJipk00kX959XZc94/RyPJ0OZDd2P9RnvDE50taunFlYClrNDyMs1AxhyE8Mecd1/zo+w8CGBWZ8YP3ZjMeezLe/w0Hh/hHLLeCpbo9MLGhfM/MU9gAJMPOYa3tf+dKR8AYZEYeZagYenuMI7KP5hVJm758h814XD+JDdAK4T8ynlCBZMMEVALopvmMWk4A9SdgVWkvuiJrPqQiWghPI3V0scM0KYyqQStDfiNCoaYSVzwINB8rof0AVM/eMJYJJWIISih0PBuR+73zVddG106Yo4/uhhAbccG/t83exbng2UTV7sS+LUi8bLBOuNsFb0BUwWgSVplrYKc1G9sdKQahSZ1HcZxKLb5X/3JUYQt9Owh60UB6+zcBrcM9jeM55bF2y+LFxEhUpCxBi8rfIcgEUyN9N+DY43pIgujGa1BJfuLijLTnoGpwty2hap1xzihQAH3S8fr8aoQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGVVZS9BUFh6MXFLSHQzN2loNitDN1BKcFRsb2hrOE9tbXZoTlZJcG90Yjcv?=
 =?utf-8?B?OFlmVWd6MVFyTllaN1p6eUpsMENhemNndkJXWjQ5eFR3U2U3eEoyRHV5OFph?=
 =?utf-8?B?NjhHVUh6a3dwYW9ERG9rMEVtYjZVb0tKbTZoMTVDT1lhaE5KWVNCZVZPc3lX?=
 =?utf-8?B?bW5vVUJHdkk1YnV4UFFHdzM4a2xjS0FLNlUyWkpVZEY5RTFFQllBWjJ5dzUw?=
 =?utf-8?B?a0phcS9wdkdaamQrTmJJQTBHblp3K0NTbzFxWDE3Q21mNkVDdHRwd0JaemUr?=
 =?utf-8?B?RFBJR0VWRVdrbzFHM2RmMkMyTnovbmlHY1FNMWJXdjN1RFBwSzlBWm5Ia3hO?=
 =?utf-8?B?ak10UjM0ODdJL2FOT25BUHRJb0NtWXNNV29OQlEzYUJuVUtqQnU5MDIveDNj?=
 =?utf-8?B?V3N1Y1Y3U0NUTm84ZmR1Kyt5Z2JNL3JIUkRPaEhHazdsd2t0cVJaajhudEdu?=
 =?utf-8?B?RU9pcktIa2lXcjlzQnJ1NUFtcGpFMjV3clU2Qm1NQVhCNXU3Q2pHQy9wMElm?=
 =?utf-8?B?R0RyUFRxMnNvNWVWT2ZGN1NUVDJUNDdycndMaXRvemZ0SjgzWm9qbjhJYWFU?=
 =?utf-8?B?S0FGb0w1dW5kV3lUY01LekVJUnlkaEZ4MnZYcUFHallBVDRWOWVEamNmRkZ1?=
 =?utf-8?B?Qm1rUjNkVXdlbXFIazdDeEhGQzBaa1JoUElJcjYzUmtDc3h5U3llWnAvZTJx?=
 =?utf-8?B?dkhzWUZNSzZ6aFdhckhlU1lUdU5MaGtvY2FLWFhlSFZQdlgwb3I0aEZvWW5I?=
 =?utf-8?B?ZWQ2SjdzK2huK3A0SFpuOStISzdGd2R5TEdwOVpNNzBzQ0dDUFJwSTlGQ0dM?=
 =?utf-8?B?UXc4VGpQR2t6RjZ1eGc3b00rVWltNlBmZUpIWlowMTZGYXE5Vi8wNkR0Q2c3?=
 =?utf-8?B?NFNpbmwyK2tFNTZxTHVlaUlWUHBQMVhuSW1NcjRMZ0hXeTE0U2RSMm5naWx0?=
 =?utf-8?B?bVIvSWJEV2I4elBoc3RtOElDRzFYREhUSi9GNWdrUHBVUG5naytLUmd0dVN3?=
 =?utf-8?B?cmt0cnROQkxWSXhpT1JKaXYxR3VVQjR0VmpJVURsQXZtSisrMTJLWldPaEpF?=
 =?utf-8?B?dHlObWtnUktZRE1WZ0xUTXlrOGs3bm9xaHhjUDJObTJtc1B2MEwwNkFvWVNN?=
 =?utf-8?B?djc3MENsbXlrK3NTc3IzZ24zb3BXTUNRUlNzdVJ3UHRKQlpBSXZvRUNFV0tq?=
 =?utf-8?B?Y2w4M3l1STI5RHhseDMzUWZsbk9aM0psb0dVWlp6V3BNdjgwNTA0ZytnWjlK?=
 =?utf-8?B?V085d0FEaTcxSTd2RU9uVEZSWWZzUFV1cFdISmlEaWYwN3ZlN2ZlQ2k3Tm9E?=
 =?utf-8?B?akNRb3Z1VDhGQks0ZjNsL3hsbDh1eXZrME5adTJ4OVNINWhlUThpaEUyVFg4?=
 =?utf-8?B?ODl0NVh2d3loc3ZLRWpad283QUU3Mmh2TFEwbU82VkRlTkpwWWdxYSsxcjRC?=
 =?utf-8?B?d3N0U1NucUR4S2RyOWsvU2Y3RE03OGFhSVNCcU00dDdQcVdPbUpMMUhRNzVq?=
 =?utf-8?B?WnNVWFlBNzRHbCs1d01PYkJWYy8yMEkyL3pzSmRMTnMramJIVldJaGtqMkNP?=
 =?utf-8?B?N1Z1dnlwTklQTzcydUhWSnkxaVdlTXp0eENXb014RG15VEk0aG5ZbEtWMVJq?=
 =?utf-8?B?T1dmZHkzVWdObGZkcjlReHhkTXZMQ0pTaTIvdFdyY29vVmFPeTkzZDM4Y3p5?=
 =?utf-8?B?ZlNXMGVSb0FwZU1uTGdCK2x4MGhqWmFhbFh3R1RaSkRwYVBzS1Y5a3FlOXJV?=
 =?utf-8?B?ME02N2NnUWdLUlpOajMyL0dTNW5QVnoycCtzbjdJeW9TOFRRdXRCMGFRUTB4?=
 =?utf-8?B?MTdDdTlsL1lpN1VZM0gxRTIrTUZRYkU5ZHF3dExtOHhPSHFPL2tDNmN6Tm0v?=
 =?utf-8?B?eVNlRDl6YVZ0QzhxNnEzZXBQbDFUVTBnQTYrV2p5RWkyMzdDZ0RybUhHWnJP?=
 =?utf-8?B?dmJMelRHcVJJZUo0NW9Nakwyb0laSjJMVnRUejA3a2txN0w1c1FBRkJlQStJ?=
 =?utf-8?B?RUdwcDN2Yk5oZ2xJU3daUC8ycXBoZVVhV0JOT0dHVE9qTWNsbHlpWTVya2NC?=
 =?utf-8?B?TzdBNVBrNFlDQTVOTWMwZlgzN2xEOFMyNFNxSWxDdnJka09XSjBFOUo3TENm?=
 =?utf-8?B?bTlGK1NqakZuK1BzbDNCUmN1ZkJMQjRCUXlGMktPVTFncFRKQWdlYnJrWG1G?=
 =?utf-8?Q?r4BDBMoE2D21FY/evh1hEPY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: grown-up.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSBPR01MB3558.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d7b821-978b-40b7-4d97-08db0356e594
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 055f2264-e854-4baf-a73b-40bb967b417c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6j5W/Zi5csRsNFlfKo/2E0NTzEAQtUoH0JPRxBUzzJos22SSwAU7XbYwrIsALPfkYGC9onRhY+a9cO3Gl88yCSamjapluTM2NjfXGDbkkTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB3886
X-Warn: EHLO/HELO not verified: Remote host 40.107.255.123
 (mail-psaapc01on2123.outbound.protection.outlook.com) incorrectly presented
 itself as APC01-PSA-obe.outbound.protection.outlook.com
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
From: itdept_head via samba-technical <samba-technical@lists.samba.org>
Reply-To: itdept_head <itdept_head@grown-up.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

DQpTYW1iYSA0LjE0LjQNCk1pZ3JhdGVkIGEgZG9tYWluLiB3aXRoIGEgIFJlbmFtZS4NClRoZSBk
b21haW4gaXMgdXAgYW5kIHJlc29sdmluZyBjb3JyZWN0bHkgYW5kIGxvZ3MgaW4gZXRjLiAoc2Vl
bXMgdG8gZnVuY3Rpb24gdG90YWxseSBjb3JyZWN0bHkpDQoNCg0KDQoNCkFzIHN0YXRlZCBpbiBk
b2N1bWVudHMgdGhlIEdQTyBwb2ludCB0byB0aGUgb2xkIGRvbWFpbi4NCg0KT2xkOiBuczAxLkpp
bS5jb20NCk5ldzogb3JnLmJvYi5jb20NCg0KDQpIb3dldmVyIHRoaXMgaGFuZ3MgdGhlIHdpbmRv
d3MgMTAgIGdwbWMubXNjIHRvb2wuDQoNCkZvcmVzdDogb3JnLmJvYi5jb20NCkRvbWFpbnM6IG9y
Zy5ib2IuY29tDQpvcmcuYm9iLmNvbQ0KDQphcyBzb29uIGFzIHlvdSBzZWxlY3QgdGhlIOKAnG9y
Zy5ib2IuY29t4oCdIHRvIG1haW50YWluIHRoZSB0cmVlIG9mIHVzZXJzL2dwbyAsZXRjIHlvdSBn
ZXQgaW50byBhbiBlbmRsZXNzIGxvb3Agc2luY2UgIOKAnG5zMDEuamltLmNvbeKAnSBjYW5ub3Qg
YmUgZm91bmQgKGFsc28geW91IG1pZ2h0IG5vdCB3YW50IGl0IHJlZmVyZW5jaW5nIHRoZSBvbGQg
ZG9tYWluKQ0KDQrigJxEb21haW46IG5zMDEuSmltLmNvbeKAnQ0K4oCcVGhlIHNwZWNpZmllZCBk
b21haW4gZWl0aGVyIGRvZXMgbm90IGV4aXN0IG9yIGNvdWxkIG5vdCBiZSBjb250YWN0ZWQu4oCd
DQpUaGlzIHRoZW4gcHV0cyB0aGUgTVMgdG9vbHMgaW50byBhIHRpZ2h0IGxvb3Agd2l0aCBubyBj
YW5jZWwgb3B0aW9ucy4NCg0KDQpRVUVTVElPTjoNCldoZXJlIGlzIHRoaXMgcmVmZXJlbmNlIHRv
ICDigJxEb21haW46IG5zMDEuSmltLmNvbeKAnS4ga2VwdCBpbiB0aGUgTERBUC4NClRvdGFsbHkg
ZGVsZXRpbmcgdGhlIEdQTyBmcm9tIFNZU1ZPTCBBTkQgIGdvaW5nIGludG8gQ049UG9saWNpZXMu
Q049U3lzdGVtLiBUbyBkZWxldGUgYW55IHVzZWQgR1BPIGxpbmtzICwgIGFuZCByZXN0YXJ0aW5n
IHRoZSAgc2FtYmEgZG9lcyBub3QgcmVtb3ZlIHRoZSByZWZlcmVuY2VzLg0KDQoNClRoYW4NCg0K
a3MNCg==
