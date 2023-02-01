Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1A685D8E
	for <lists+samba-technical@lfdr.de>; Wed,  1 Feb 2023 03:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vZgeku3RI6fljdnDkwwpHi4eif+WwXicTuMDFkV7PyY=; b=Rh+VKFUKLTAnPDe35SqqNeup6i
	tiUCCLzArilbSvqKDlrmdmrU25s4ccJKL61T/Xmmp26azcada2my3womZvJ7EPWVk2XnQYy3Ge8sp
	f+92IUgFTQGwC/N6QEnF9Dy4zlmFD9mTNXCVByJpTsltXDarYwImDa8FtfBTdHFA7gal1o1+OOpWZ
	pNu0ghrFkVj5DLe32O/6rlRZ16K0y14RwqxzlrstT7RtGVyzYH5JzBn5icqTP9V6mWioNshKbTpfg
	CUHEsn5tXVrWkFxMZGSgfEfXMj4eHFsn5fjbuVmJd8VBVgRtLIA/bSsDxDc8ajrQUUEfRiURBGbeA
	HAmBD2qg==;
Received: from ip6-localhost ([::1]:21770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pN3Ek-007D6e-ME; Wed, 01 Feb 2023 02:52:38 +0000
Received: from mail-tyzapc01on2139.outbound.protection.outlook.com
 ([40.107.117.139]:44243 helo=APC01-TYZ-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pN3Ed-007D6V-Mx
 for samba-technical@lists.samba.org; Wed, 01 Feb 2023 02:52:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCp+7+SuQeF5PwQYpRDf9XfHGZ+XaxRkpha12p2+f7s/I/I9pa3ReZpLI6Spi4RRqSpAtQZPNfdSsPqV9m+ahp/M5Vy90PEg1gNJCfz9tv9H4BYarIQNgesS4pBOhh525pHot6t5k5wep5IjR5dEhNtILEY3DT0db7EeoCb/ouJMTyZnylAHvu2q/O9ZCU0T7AC7fKXm5Pr8B+hM/kG01fP9XmYTIi++GOuFe+hd9ixn6WPnGYc5R812SsJvxZ/MRoHmg6X0qautzg+dB0Ir8NOjX0FQP44mrR/21/pcFBBIWbbVzOjFH9mIlvYYfLhwANgpfklKkjdyjf6QF3P3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZgeku3RI6fljdnDkwwpHi4eif+WwXicTuMDFkV7PyY=;
 b=ne+Wr4CsAAG3doozeJMJD3k1SJctETNtUE6cpWC/SKtrArJo/NF2Ybw3vY7RPJIjPTn8kVmgU7lxTs9WZgMkinFmKRGiCSGhbV/Ae6ABOmFRD/dC7Gf5A6wvX/8wP/JM0wg4XT90jlEz8xfQL7VrSxzb7hO6ymJqFVPhI2FQnJ30XANBoshh0d8balZb1o1gvuyZxIGpJHjg3cJI3uw/lEHyzh+p2gAHToqjFAzCtgnOCmxy7RNUzt6CpHTUBPo0TP/D+YzU+GAb+dl74WjQVa7Jelo8Ap4kgLYigbKvfoD8hvHpE5jLulMhxOpSUAzhAU5B6ebabM9RKG8HZf3vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=grown-up.com; dmarc=pass action=none header.from=grown-up.com;
 dkim=pass header.d=grown-up.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grownupgroup.onmicrosoft.com; s=selector2-grownupgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZgeku3RI6fljdnDkwwpHi4eif+WwXicTuMDFkV7PyY=;
 b=XwvHmQ4g9yWhcZrsKQwH4I3arW96zaQ595nk5OpRR8feZDe/qIeU0mqQcdyzeQLtzD+11uOmy8R8ZsMRmYXvWLaPvZXWRavXdQd3Q+MeExZkTmkZQmTyaiamyirl62v0t+Fif6EeNgoCDuXuSDfWYBd3O/LbSF1bOGdy+ijy92k=
Received: from SG2PR01MB3564.apcprd01.prod.exchangelabs.com
 (2603:1096:0:3::12) by TY0PR0101MB4820.apcprd01.prod.exchangelabs.com
 (2603:1096:400:278::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:52:14 +0000
Received: from SG2PR01MB3564.apcprd01.prod.exchangelabs.com
 ([fe80::6378:80b2:8b18:5ae7]) by SG2PR01MB3564.apcprd01.prod.exchangelabs.com
 ([fe80::6378:80b2:8b18:5ae7%4]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 02:52:14 +0000
To: David Mulder <dmulder@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: Re: problem with GPO Policy after rename
Thread-Topic: problem with GPO Policy after rename
Thread-Index: AQHZNSjp98oJzN48tkWwOsKAkcqFnQ==
Date: Wed, 1 Feb 2023 02:52:13 +0000
Message-ID: <9C3B2AD3-BE38-47A5-848A-0FE930B5468E@grown-up.com>
References: <3E14DFAD-1094-4089-8897-88AF7CA133EF@grown-up.com>
 <e0eb8658-8c7f-b270-df2e-c19bfa5c9841@samba.org>
In-Reply-To: <e0eb8658-8c7f-b270-df2e-c19bfa5c9841@samba.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23011802
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=grown-up.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR01MB3564:EE_|TY0PR0101MB4820:EE_
x-ms-office365-filtering-correlation-id: 539b5fae-40d1-480e-8893-08db03ff527a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 0pmUllW/ML6Z3aYpgrc1G3DIymZ9T4L34GSy7G9KDTqHGnJCleRPfsxX16khnbumCr/sFgxrwG2Lvpy7O5bLzNFs0oAJ/cqeuufacZ6fiTVI2fzSswmigWBtGvB5VHYt0G+wf66JokRc6RQ4ppsIGEhISqzzchOvbhZsAhiESXgidNloHMtdvIDrDh3UvbmrznC5SNC5L2Q5luGXlOSHiLZERdRNOc8IY53gDlESc1JIJ2mgScpO+OZA3QsKEVe0X9fSSf63TDL1Iblh8XT+4VD90/R6X11LygdbpnYgTPRmyst4PTTIvE+60FJrSIPT9gAQDtu3uXNMKx9up1X9hHoic2GHyukjl7OqQ/U+1fwL2GmiWL5Y+cb0/kjGLwY7UGVWHsOwx2Z9d6NQelp1LNEuySTRL6j0N5levrLXIBmhtHC61jjBr7s10U9ZyzyQCwtCEgjXjTwGbeUSWGhNMDMYZEdmVPY4vrB/JRG1yheMSCCNlrRoZTBpSYjzgCVBRv/Z5KoCL21lfYaxCb63LyIkO65zCt3r1qfcLLIXTy+sFoKF1abKZcOo+Q3NATFBAm04aC6jQRJVQMar9GujGmxdQtBTyCskr+u9VkbiMWPG+P8vd6WZUyzwTF5miCvKwzeKYxgM6oyiob7C6bheqbUPjvp8gosI79RAKw4T/tP6XXsL0lCs2CLJdYG/C/OsmmdBOS4vrhP4O+GWPNCy7uNyFktWfV0XcdBF1bLTR/U=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckpleUZWdGdMSVBlK1VhdTlER094YjBhaHJFMTg2aW82cG9UZE5KejhNakpz?=
 =?utf-8?B?Ym5XQ3gvbVc2MDhFbjhSTTE3MFRXY2tiK2ZxajJVNUxaNmNROHcyN24xY3Uz?=
 =?utf-8?B?bm5CZUdPNDdpTGJjSVVDelQ5emNBamwrT2liNFZ5Zko4ZVZxN2VtOVR1SlJv?=
 =?utf-8?B?Tk9rbzlxQ3AvZ2FWQ0c2QUtVbEgreTUwcTR0OUFTd0FUM3hDRUw4Wjh2UmZl?=
 =?utf-8?B?c0xNTkxWa3VDSHF2RXEzaG9UZWZSSlhYaS9aTUdHTnM1UFJQaUxHYmdMTmtB?=
 =?utf-8?B?UWVHNENORkp6dVc1RnEweHljQUQvWkNYM1M3a3N0UldFc1dxZkhURFlVdGZr?=
 =?utf-8?B?SlF6NUphRnhmN0FjVkVFNyticmVtMzg4eGIzR2hDbDRaSmpZRnFzVzQvcnd6?=
 =?utf-8?B?YXJGQ0JlOW1XVDJsZFJoRkF1ZllpdDFSR0M2ZFJrSVRLRlQwRGdRSVFFSGFs?=
 =?utf-8?B?a2JSajIwNUpyRmhHRHlSWTFabXppamduWStrUTF5R1ZPdkNNcGNjWVdyMXFv?=
 =?utf-8?B?ZlE2WEkvWld2MDZLN2xaWEhaWnRrQTIrVjJkSzNnZ0MyR2pKUVNwbStoQ05v?=
 =?utf-8?B?Uy9iKzJ3UGd0NFI1ajdIcVg0blpoK3pTK1VMdFpWeHgzdHBHb1NKN1lJNlMz?=
 =?utf-8?B?UWR0R1VscmNXZFF1aUo2THEvc3FINHU3UHpCcFJ1ZFJhUU5INEd5U0NoSDA3?=
 =?utf-8?B?bVJUcitkYXphb0NlM1BWM0FnNm1yd1h2dGkrMDF5SXd6a0NwYzdzc1BJYUZD?=
 =?utf-8?B?SnhIOWNKcWxxakgwOHROVzZaOHdPWGUzTVQyTi9FM09veWlkVjQ3cTZQbXFY?=
 =?utf-8?B?STZUaGNBcGpUT0pLYVZCUmxiekRiSUVkdy81NEZKYk9FVTBGZHlZbnZ1eEdR?=
 =?utf-8?B?ZXNDU1o3elM2aTIrYkp6Q0tNWGx3eG9yODduYjN2R3BvdUsxS0RodFdxTTcy?=
 =?utf-8?B?UDd4YU5JSStya0ZpUStQdy9oNk1kK3c5RENzSFEzWDg1NHNVMDNoZi9DaDI1?=
 =?utf-8?B?TUh2T1M1biswSGNZaGZGbkxPV0tSSlE3eFNUUXB2WDJlSGp4VFRMaHRsL21Z?=
 =?utf-8?B?Y29vNXFQZXlCWFdEZ0ZkZmFtUGxkVkNEQ2lsNHlFWlBnZXIzbHBoR29ZTHdT?=
 =?utf-8?B?MElsN1RIZmpLV1drZ1ZGSjBzQUY5a3ZKL0VmN2hxVFVIRDdCWXlERThYODZj?=
 =?utf-8?B?NkxGL1JTS3F1dy9UbkNlQUJYaUoya3BIRGVHYlJGaEJ1MG9jZU8wR3lrdWtU?=
 =?utf-8?B?eFhwQ3M1dXE4Q3dZc01CNGs5S2tXclRpVmNCblBTSHlpaFNsR01Pd2NsWDVW?=
 =?utf-8?B?OE15dFRwcFVhTXMwZkNCa2x3NDBYSU9YUVpxT09IeDd5R0VMWitMVE9OOGho?=
 =?utf-8?B?dkUvSmpDSGk3TnkwSjMxOWdwTnNvZ1RZR2dxWUJzeGtmbjJtMmg3T2FoV3Jz?=
 =?utf-8?B?Z0dvSXZEMHgwT1d6VHFpcS9IN0R4dFRzL2RPajlhQUxwNFRudm1Yby8rSk4v?=
 =?utf-8?B?YmxjUHRKVkErOEhpcENqSHphSnNFTm5NYi9EQWNGWm1UdGVsWWcxNjhOeWVR?=
 =?utf-8?B?YVllSkFrTVdYQlUrWFd1MmpjVmdHWUNoMk9mNkI2U0V6Qy9XSkVXY0h4M25K?=
 =?utf-8?B?YXhmQnVoeGdmTDFwaUJlbFVsbXFpZWtvR2tHMFBQcTB0S05KQkc5VjQ5akps?=
 =?utf-8?B?NG1rMUhhNlB2THJzV3V3TVJDNzhhL1hmY0Y4Qjh4WmZpL0ZqcFRJN2NTODFM?=
 =?utf-8?B?TUJaL2RDdnd2WHBFbkdlOEozMk1tZjZMZjZuQUx3ekkrckhvTVN2aUNEVmpZ?=
 =?utf-8?B?elRJc1FGOXNYS0NBekRFazI5NCtoUlM5UEpoQnVBd3VNOVhwMkJ6Yi90VFcy?=
 =?utf-8?B?TXpQTFJGTDJlMGhBWHM2clV5SGVWbkJRNWVJWENUeXNFSE4yWXdWK25jb0tx?=
 =?utf-8?B?cjRwYjFiKy8zamRYK0E5SWFRR3RCN1Y4RGZPTHFoaVBoZGNmTnRqcHBVa3hx?=
 =?utf-8?B?bE1sNDljRmVoTDhZOUNWUGl4SFhuSHVra1k5VHdpbzhVWlhiUzBIUW40LzJP?=
 =?utf-8?B?M1Z1YWxnWkIwWElUanB1Q2QyMXcrN3hoSWNGOXVoMU9qZ0hDVVpPMTM5Szhz?=
 =?utf-8?B?MzQ1UjBRSWwwMk13VUJEalpnSE5Zc0FUb0pmY29qWXcxU0Ruc1JTN2ZhbVJx?=
 =?utf-8?Q?WYyiMKXo/yFe7dd+Kaqmyqk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90F8328413A29347A390756DE0BACE35@apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: grown-up.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB3564.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539b5fae-40d1-480e-8893-08db03ff527a
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 055f2264-e854-4baf-a73b-40bb967b417c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCmrtwuNAk9Pu3lbXmL2lEIQDP+ENuykzbcM4M9E4P81DM+d/ysOglPRW4OnBs2LXySZC6ZT2ZIwdpGge12+AI9Ml7fc7C9mgf9P9BbqSVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4820
X-Warn: EHLO/HELO not verified: Remote host 40.107.117.139
 (mail-tyzapc01on2139.outbound.protection.outlook.com) incorrectly presented
 itself as APC01-TYZ-obe.outbound.protection.outlook.com
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

T24gMzEvMS8yMDIzLCAxMDo1MCBQTSwgInNhbWJhLXRlY2huaWNhbCBvbiBiZWhhbGYgb2YgRGF2
aWQgTXVsZGVyIHZpYSBzYW1iYS10ZWNobmljYWwiIDxzYW1iYS10ZWNobmljYWwtYm91bmNlc0Bs
aXN0cy5zYW1iYS5vcmcgPG1haWx0bzpzYW1iYS10ZWNobmljYWwtYm91bmNlc0BsaXN0cy5zYW1i
YS5vcmc+IG9uIGJlaGFsZiBvZiBzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnIDxtYWls
dG86c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4+IHdyb3RlOg0KDQoNCk9uIDEvMzAv
MjMgMTE6NDYgUE0sIGl0ZGVwdF9oZWFkIHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6DQo+IFNh
bWJhIDQuMTQuNA0KPiBNaWdyYXRlZCBhIGRvbWFpbi4gd2l0aCBhIFJlbmFtZS4NCj4gVGhlIGRv
bWFpbiBpcyB1cCBhbmQgcmVzb2x2aW5nIGNvcnJlY3RseSBhbmQgbG9ncyBpbiBldGMuIChzZWVt
cyB0byBmdW5jdGlvbiB0b3RhbGx5IGNvcnJlY3RseSkNCj4NCj4NCj4NCj4NCj4gQXMgc3RhdGVk
IGluIGRvY3VtZW50cyB0aGUgR1BPIHBvaW50IHRvIHRoZSBvbGQgZG9tYWluLg0KPg0KPiBPbGQ6
IG5zMDEuSmltLmNvbQ0KPiBOZXc6IG9yZy5ib2IuY29tDQo+DQo+DQo+IEhvd2V2ZXIgdGhpcyBo
YW5ncyB0aGUgd2luZG93cyAxMCBncG1jLm1zYyB0b29sLg0KPg0KPiBGb3Jlc3Q6IG9yZy5ib2Iu
Y29tDQo+IERvbWFpbnM6IG9yZy5ib2IuY29tDQo+IG9yZy5ib2IuY29tDQo+DQo+IGFzIHNvb24g
YXMgeW91IHNlbGVjdCB0aGUg4oCcb3JnLmJvYi5jb23igJ0gdG8gbWFpbnRhaW4gdGhlIHRyZWUg
b2YgdXNlcnMvZ3BvICxldGMgeW91IGdldCBpbnRvIGFuIGVuZGxlc3MgbG9vcCBzaW5jZSDigJxu
czAxLmppbS5jb23igJ0gY2Fubm90IGJlIGZvdW5kIChhbHNvIHlvdSBtaWdodCBub3Qgd2FudCBp
dCByZWZlcmVuY2luZyB0aGUgb2xkIGRvbWFpbikNCj4NCj4g4oCcRG9tYWluOiBuczAxLkppbS5j
b23igJ0NCj4g4oCcVGhlIHNwZWNpZmllZCBkb21haW4gZWl0aGVyIGRvZXMgbm90IGV4aXN0IG9y
IGNvdWxkIG5vdCBiZSBjb250YWN0ZWQu4oCdDQo+IFRoaXMgdGhlbiBwdXRzIHRoZSBNUyB0b29s
cyBpbnRvIGEgdGlnaHQgbG9vcCB3aXRoIG5vIGNhbmNlbCBvcHRpb25zLg0KPg0KPg0KPiBRVUVT
VElPTjoNCj4gV2hlcmUgaXMgdGhpcyByZWZlcmVuY2UgdG8g4oCcRG9tYWluOiBuczAxLkppbS5j
b23igJ0uIGtlcHQgaW4gdGhlIExEQVAuDQo+IFRvdGFsbHkgZGVsZXRpbmcgdGhlIEdQTyBmcm9t
IFNZU1ZPTCBBTkQgZ29pbmcgaW50byBDTj1Qb2xpY2llcy5DTj1TeXN0ZW0uIFRvIGRlbGV0ZSBh
bnkgdXNlZCBHUE8gbGlua3MgLCBhbmQgcmVzdGFydGluZyB0aGUgc2FtYmEgZG9lcyBub3QgcmVt
b3ZlIHRoZSByZWZlcmVuY2VzLg0KSUlSQywgdGhlc2UgYXJlIGtlcHQgaW4gJ0NOPVBvbGljaWVz
LENOPVN5c3RlbScgaW4gbGRhcC4gSSB0aGluayB0aGUgDQpvYmplY3RDbGFzcyBpcyAnZ3JvdXBQ
b2xpY3lDb250YWluZXInLiBJJ20ganVzdCBza2ltbWluZyB0aHJvdWdoIGNvZGUgdG8gDQpzZWUg
dGhlc2UuIFlvdSBzaG91bGQgYmUgYWJsZSB0byBkbyBhIHN1YnRyZWUgc2VhcmNoIGZvciANCico
b2JqZWN0Q2xhc3M9Z3JvdXBQb2xpY3lDb250YWluZXIpJyB0byBmaW5kIGFsbCB5b3VyIEdQT3Mu
DQoNCg0KLS0gDQpEYXZpZCBNdWxkZXINCkxhYnMgU29mdHdhcmUgRW5naW5lZXIsIFNhbWJhDQpT
VVNFDQoxMjIxIFMgVmFsbGV5IEdyb3ZlIFdheSwgU3VpdGUgNTAwDQpQbGVhc2FudCBHcm92ZSwg
VVQgODQwNjINCihQKSsxIDM4NS4yMDguMjk4OQ0KZG11bGRlckBzdXNlLmNvbSA8bWFpbHRvOmRt
dWxkZXJAc3VzZS5jb20+DQpodHRwOi8vd3d3LnN1c2UuY29tIDxodHRwOi8vd3d3LnN1c2UuY29t
Pg0KDQpZZXAuLi4gSSBzYXcgdGhhdC4uLi4uIGJ1dCBpdCdzIG5vdCB3aGVyZSB0aGUgYWN0dWFs
IHJlZmVyZW5jZSB0aGF0IGJyZWFrcyBHUE1DICYgb3RoZXIgTVMgdG9vbHMgc2l0cy4uLiAoSSBz
cGVuZCBkYXlzIHBsYXlpbmcgYWJvdXQgaW4gb2J2aW91cyBhcmVhcykNCkV2ZW4gZGVsZXRpbmcg
dGhlIHJlZmVyZW5jZXMgaW4gdGhpcyBkb2VzIG5vdCBjbGVhciAgR1BNQyBsb29waW5nLg0KDQpJ
dCdzIGluIHRoZSB0b3AgbGV2ZWwgZG9tYWluIGNvbnRhaW5lci4uDQpvYmplY3RDYXRhZ29yeTog
Q049RG9tYWluLUROUyxDTj1TY2hlbWEsQ049Q29uZmlndXJhdGlvbixEQz17aG9zdCBuYW1lfQ0K
Z1BMaW5rOg0KDQphbmQgdGhlcmUgaXMgb25lIGRlbGltaXRlZCBzdHJpbmcgIGluIGVhY2ggIk9V
IiB0aGF0IGhhcyBhbnkgR1BPIHNldC4NCmdQTGluazoJW0xEQVA6Ly9jbj17NTlBNDkwQ0MtNTlB
Ni00OTIwLTk2QTItOTRBNTFGOEVBMUMzfSxjbj1wb2xpY2llcyxjbj1zeXN0ZW0sREN7b2xkIGRv
bWFpbiByZWZ9OzBdDQpFZGl0IG9yIGRlbGV0ZSB0aG9zZSBzdHJpbmdzIGFuZCB0aGUgR1BNQyBp
cyBmaXhlZCB1cCBpbW1lZGlhdGVseS4gRG9lcyBub3QgZXZlbiBuZWVkIGEgc2FtYmEgcmVzdGFy
dC4uLg0KDQpUaGF0J3MgdGhlIG1hZ2ljIHNvdXJjZS4NCg0K

