Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8024D321A83
	for <lists+samba-technical@lfdr.de>; Mon, 22 Feb 2021 15:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Eb0O8ez8J7CNL9OOFJNiImBs+4moKeiulaforjr/zuk=; b=ZPDdhkFlrxNwtXQTMVJqB2xYp3
	cxVm3whJyRXziWj0eyfs5QZWo2VARMnTtE4hYbd01Len3sxdRCgoFhgrgABD2Cy5Taty6JljvSmtL
	oFFjJuO1tsFiEtRrXB/mgmQp8kuCiBBAgZ8V3e88iI/pzS/tEOrSb2bztsZoQIWJe7WuDONuKDEZT
	i05NColmf6aghXsO+ZYQe9fVS74fGl8v/bbwbBrFPJtLGa5LJgzHFO22B81iF9IiAcAS7g22bMPb3
	lxEECT1WBHSXZcMgLHDDzWu9LivN4PgvlFuMMJXVyXGOxhuTWcLzBML9Ji2lkThY9m080CsDR/D+l
	9KRuuJkg==;
Received: from ip6-localhost ([::1]:41120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lECU7-000vFC-CJ; Mon, 22 Feb 2021 14:46:51 +0000
Received: from mail-eopbgr150073.outbound.protection.outlook.com
 ([40.107.15.73]:58020 helo=EUR01-DB5-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lECU1-000vF5-Ti
 for samba-technical@lists.samba.org; Mon, 22 Feb 2021 14:46:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNIQ4PxN3c1RJIf1JsaCKENvT6u9W8tDh1uKlxIde9Y7uWdEyOUb5XIF2lg2YymCKT2UTwSRjCVRZC8AVE4YpkSibAjUEcoBVArO0d4p+Z0beY4kifwwrDcxyD41t1Du+MpKwk3zL9l5g3DN1JwePBdp8DTrq1hEDQpTws1Jd3+Sul3WGhPAlv6hd1R3mEeFmx+EhdPXLKklB+fc3+MaEiK3WPb4QdB0x/sftBhNlMqf4lcRWZegm/hwuBpG9Jh7t/qGBMkV6CL3Nnxg+1ULFQqwCKZ0S/n8s0fXdnwUcNgcVjtvAtbXgHHrJvOHBj7zpZg1SWgT1MVdm7c4i2tPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb0O8ez8J7CNL9OOFJNiImBs+4moKeiulaforjr/zuk=;
 b=E6BNa9xkV4+n+YZw56rdb5ipf8RdNttCvDAOOZMil9EsC3SrViRkuVjxF4vGOe4pBrh7dJoF33TyNKpJIoXkiLmxdDtSVZhp5WBhfEiRO/lWu5eWby/L78ARQmJWrhlXqXqt015yRL31o7mH+laOf7bV40+XWR5jehJC5gqZFC6u18vnD3vdglBA+b7QS7tTN1/B9jRMKU3rCorRr3rISIP4BEgwlHjqTu/cqDw9P0i5aUlBT5nOCeM7qmpIPN1JKUYUl3E+IZFiYX0CrrK5EKmsjy6MKtG/eyvcu7UveKT3fukwcEWu99bOwzGBgbiVMpk0RX9rYCjCFJr7+IzRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digitx.de; dmarc=pass action=none header.from=digitx.de;
 dkim=pass header.d=digitx.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digitxgbr.onmicrosoft.com; s=selector2-digitxgbr-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eb0O8ez8J7CNL9OOFJNiImBs+4moKeiulaforjr/zuk=;
 b=gST88yn+/iriqHW38sUI4A0goTG4KzbHWmxHDvvwgf8OUf0LvnmkWhgO/WarjEKAxlefSjwEmEo6VTE3i+NYJqXq/7mJL722X3ilWKDOagdc7CFRm12Ow4ZiWeBLRkwY8c3qVKBBBbxhHuKzDPTUniDyLgWNzbYvRMX34Tsxkec=
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com (2603:10a6:20b:2c8::19)
 by AM0PR05MB4659.eurprd05.prod.outlook.com (2603:10a6:208:b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Mon, 22 Feb
 2021 14:46:32 +0000
Received: from AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b]) by AM9PR05MB7636.eurprd05.prod.outlook.com
 ([fe80::d00d:53da:6d2d:d23b%6]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 14:46:32 +0000
To: Ralph Boehme <slow@samba.org>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Subject: AW: Provisioning an ADDC with vfs_nfs4acl_xattr
Thread-Topic: Provisioning an ADDC with vfs_nfs4acl_xattr
Thread-Index: AdcHun2iwMTUQqs8RQKkd3jDlP7KGwBWxM4AAAOOZXA=
Date: Mon, 22 Feb 2021 14:46:32 +0000
Message-ID: <AM9PR05MB7636145E0BC84892C3DBF11BCF819@AM9PR05MB7636.eurprd05.prod.outlook.com>
References: <AM9PR05MB76360A339F47095CA02FA87DCF839@AM9PR05MB7636.eurprd05.prod.outlook.com>
 <82963790-7a08-9e22-1baf-2a5d2bf4e712@samba.org>
In-Reply-To: <82963790-7a08-9e22-1baf-2a5d2bf4e712@samba.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=digitx.de;
x-originating-ip: [93.217.247.182]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 454bcca7-660a-4483-5453-08d8d740a53b
x-ms-traffictypediagnostic: AM0PR05MB4659:
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kF78IWnxsKoQhgHjtHPZ8iFb/mnDR+ZxRHsVL34PaBtskRuVCQM6MNY2BZAFMowwrBDyDFw3eopu3YaClf0PZB6Xl7ULNb51shlSK+NtpU2iYl/hAYaj+FUL3G4O72pWQvbwkJkxYETetji/9PM5HQg46TszikCLcjA1dCpR4Akc9+nS2hKdat4HthVQRKLpOfK7PkHSrLPeX/KOSauNHVrG/LwjuzhqwiSZq3jv86LN/R7CBjWD7PuXYj7VHaTlYgCzyffrzLwKXxaIhBNFka92eGe+Ix00eYCpJ0eqe/VsnYEZcMRLHZ8Z5LN1T7DaAhsJlKAb5VKluoBzQgsOVx6KlPFLm1lGH1zcvxAWFyQ1jBqUD5r1dgCtb69r9DV9Na3gbabR5DUj55KCgg7UepwC/v67R1tJu2MiQzCvN93RAVVRpW6aWPG9E2rQXTO3/0x8oWBFxl3m8n3sOns5wIsCPgMFXc1h7kHqFCHSq3PBkKFAjwGMdf5K9j8vmayxqX/Gqo5o64Q+kIKyOtv2W5Dbhyysolv+K4WWu0AYumRFPJE08P4ROev9LIxT41TaHDJw6WMCKEbANVmbjE82ug==
x-ms-exchange-antispam-messagedata: =?utf-8?B?dElTZ2xBMHZ0bXhDaDRscHRpNVY1b05DRys4YjF1NVRmeHFISG9QZEJIbVJX?=
 =?utf-8?B?aDBMakQyRnRFcVFRSWlpKzR2ZWcvdzl3RGpBUnhnTFNXOExnSlI2SFFyajQx?=
 =?utf-8?B?UFRPejVzMU5lVWlIRHd0bS91MWZ0cDl5T0RpemRBN3hvY0pWam02dXpKYUg5?=
 =?utf-8?B?U1kzaHUxRGdwZjBBU0dzZUhIenhsT3ZIWGRMdTlmcDlqMnZIck8wOHZGdllV?=
 =?utf-8?B?ZUp1M29BZjUvZnR0cE8vdFp1RklQVVl1R0hrN0tDL3drb2daNkVCcFdPekpa?=
 =?utf-8?B?RGQySjBiT095SHhlVmVqa0duOTFKSitlV3JnSXB1UUthRCtMUVcvS3R0dU5B?=
 =?utf-8?B?REN0bWtkWVdZTzh6bG9nS0VZYk82OWluSDNCTDg5aS90anhxRGZjUXRnYXJ5?=
 =?utf-8?B?cEczUllSVDkzQnNFVjMyUzRqM1o3QVEvWHZoMjMzcVdUMmpqK2c1UHArNUI5?=
 =?utf-8?B?LzR2bWdWOStXWCtaS1lsVVNYSzdzUXU0MVpadkVQZ2J1ZGhHTVZUV2JSQms4?=
 =?utf-8?B?L20vNjNrR0N3Ymk2dThZV0lNOHNqN3M2eW5WYlBxbUpicnI2UFJ3VzN0ZG1Y?=
 =?utf-8?B?MCtsQXhTbDI4TmVsWHVmSmp4cTk1MzFRb1NCdzZTL211d2F2NUozQ1c3Yldn?=
 =?utf-8?B?ejBCb0dKQ0RIcjFJUzVwKzIxSy9RWUg2L3hua20xbkNqZTBOemw4VkxXRngx?=
 =?utf-8?B?MVpnL0grZ1NxQkozRTFNVWVrTEgxL2ZXNEpuQ21CN0oxSFVxMU0yRjNkMjY3?=
 =?utf-8?B?a25WSzlYMDdLR0F3VmNLVG9YQjg4QVU4MjJRUDdJdXNKVERHanBzdWYyWE9m?=
 =?utf-8?B?UGxTK1VKSE5XQnBaREFjWjZiUVFUY1JtNTJvUS9pTFVLK2RJYWYwNDNsVUxU?=
 =?utf-8?B?bGdCdTFXTkROdi84N0NaajRWRDZpbzlQMjRZRVJKUUVCcG1pOGdFeitWUjd1?=
 =?utf-8?B?bCtlY0VQVGprSmMyTGVFdTdaemRMbFAwaHE5c1pla2JpTFdNaE1Sc1BENEds?=
 =?utf-8?B?MjRIQ1V0SW41YXNwcmlDZVNidmd0NlhIblZaSzhxek9qSCtTSVU3bGR0WUY0?=
 =?utf-8?B?ZW12MFdkOFZDWDkwTkdKUWdsbmpvK09wUVpmcGViRmdjaFpQTVhOcWJYaGwx?=
 =?utf-8?B?NFlveFYybyt6OStRbDRRM0VuUFNzWXNGdzI4aFV5dXozb1VwMSs2SEp1cDBT?=
 =?utf-8?B?c3R5ME1vcHBXODlFcFR4YjluYThJWldycDg1VGZJemllMVZOei9LbEk5bFl1?=
 =?utf-8?B?S2pTcjN4Z0VCT2NQY0prUFJpUzdjVHNrL09iakl0d2pBeHhGamNKd1pSNVd1?=
 =?utf-8?B?bm43WkxPbTRXd25jejVzUjVyWkxLVUN5Nk1zOHQ3Skk5bTVGTnQ4d3lyKzBm?=
 =?utf-8?B?UFJDVVdkNXlVM3BVaW91V0dkN1lwdk8rbGhjSmMwSjR3SkN2MExpV09LS2pi?=
 =?utf-8?B?SzFLd3ZXeU9xVmc0WDA0c3BaaHBtU1FuUkxUMUJMamtaZnA5QTFqS0RmMHla?=
 =?utf-8?B?clNraGgvYlJadTZ5L3FFWFBNSldrenN1VnJGdmVaRiszRHhhQUJNRUtYL1Yv?=
 =?utf-8?B?MW5EMkt4alk4QXJmVm9obzdsUnZzS3JmVStuRndUODBsaHR1SlAwQ2p2SzNo?=
 =?utf-8?B?Wkxyait1M2kwdmpENHQ4WnFrRXF0K013ZDY5dDJYVmxJclloT1BXSHMyMUlx?=
 =?utf-8?B?WUlncVJBRnNrRWJpWDJSamtPTVdmV0YzamVFUmxIN05zN2c0VFYyWWZsdFVV?=
 =?utf-8?Q?VxjrwM1MLgiSPaukOEIUXJapfw5nch5PDxPYUoA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: digitx.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR05MB7636.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454bcca7-660a-4483-5453-08d8d740a53b
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 545eefb3-8b20-4e2a-bcdb-884c876d0f6c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RXzxSqpUJty+0K7JnWtmwctQ0X/Cxs7RDe1I08JnqM9Fvjz9PHYNUPFjAaNjBFO+ZHU0TB4J3doJUQz+Ng5ayg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4659
X-Warn: EHLO/HELO not verified: Remote host 40.107.15.73
 (mail-eopbgr150073.outbound.protection.outlook.com) incorrectly presented
 itself as EUR01-DB5-obe.outbound.protection.outlook.com
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

LS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KVm9uOiBSYWxwaCBCb2VobWUgPHNs
b3dAc2FtYmEub3JnPiANCkdlc2VuZGV0OiBNb250YWcsIDIyLiBGZWJydWFyIDIwMjEgMTM6MjQN
Cg0KPiBJIGd1ZXNzIG5mczQ6YWNlZHVwID0gZG9udGNhcmUgc2hvdWxkIGZpeCB0aGlzLg0KDQpJ
IGRpc2NvdmVyZWQgdGhpcyBwYXJhbWV0ZXIgd2hlbiBza2ltbWluZyB0aHJvdWdoIHRoZSBjb2Rl
LiBNYXliZSBpdCB3b3VsZCBoZWxwIHRvIGluY2x1ZGUgdGhlIG5mczQgcGFyYW1ldGVycyBpbiB0
aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGUgdmZzX25mczRhY2xfeGF0dHIgbW9kdWxlLg0KSXQgbG9v
a3MgbGlrZSB0aGV5J3JlIGFsbCBhcHBsaWNhYmxlIGJlY2F1c2UgdmZzX25mczRhY2xfeGF0dHIg
aXMgdXNpbmcgdGhlIG5mczQgZnVuY3Rpb25zIGluIHRoZSBiYWNrZW5kIHdoaWNoIHdlcmUgb3Jp
Z2luYWxseSBjcmVhdGVkIGZvciBhbm90aGVyIHZmcyBtb2R1bGUuDQpOZXZlcnRoZWxlc3MgSSBv
bmx5IGZvdW5kIHRoZXNlIHBhcmFtZXRlcnMgZG9jdW1lbnRlZCBmb3IgdGhlIHZmc196ZnNhY2wg
bW9kdWxlLg0KDQpIb3dldmVyLCBzZXR0aW5nIG5mczQ6YWNlZHVwID0gZG9udGNhcmUgZGlkIG9u
bHkgaGVscCBmb3IgdGhlIEFDTCBvbiB0aGUgc3ViZGlyZWN0b3JpZXMuIEl0IG1hZGUgdGhlIGRp
c2NyZXBhbmN5IGZvciB0aGUgQUNMcyBvbiBmaWxlcyBldmVuIHdvcnNlLg0KDQo+IEkgZ3Vlc3Mg
dGhpcyBjb3VsZCBiZSBidWcgMTQ2MzEuDQo+IDxodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9z
aG93X2J1Zy5jZ2k/aWQ9MTQ2MzE+DQoNCkhtbSwgbm90IHN1cmUuIEFzIGZhciBhcyBJIHVuZGVy
c3Rvb2QgdGhpcyBpc3N1ZSBmcm9tIHNraW1taW5nIG92ZXIgdGhlIGJ1ZyBkZXNjcmlwdGlvbiBp
dCdzIHJlbGF0ZWQgdG8gdGhlIGZsYWcgdGhhdCBzaWduYWxzIHRoYXQgYW4gQUNMIHdhcyBpbmhl
cml0ZWQgZnJvbSBhIHBhcmVudCBkaXJlY3RvcnksIHJpZ2h0ID8NClRoZSBpc3N1ZSB3aXRoIHRo
ZSBBQ0wgb24gZmlsZXMgaW4gdGhlIEdyb3VwIFBvbGljeSBmb2xkZXJzIGlzIHRoYXQgaXQgY2Fy
cmllcyB0aGUgaW5oZXJpdGFuY2UgZmxhZ3MgYWx0aG91Z2ggYSBmaWxlIGNhbm5vdCBpbmhlcml0
IGFueXRoaW5nIHRvIHNvbWV0aGluZyBlbHNlLiBPciBkbyBJIGNvbXBsZXRlbHkgbWlzdW5kZXJz
dGFuZCB0aGlzID8NClRoZSBuZnM0IGNvZGUgcmVtb3ZlcyB0aGUgaW5oZXJpdGFuY2UgZmxhZ3M6
DQpTTUJfQUNFNF9GSUxFX0lOSEVSSVRfQUNFDQpTTUJfQUNFNF9ESVJFQ1RPUllfSU5IRVJJVF9B
Q0UNClNNQl9BQ0U0X05PX1BST1BBR0FURV9JTkhFUklUX0FDRQ0KU01CX0FDRTRfSU5IRVJJVF9P
TkxZX0FDRQ0KZnJvbSB0aGUgQUNFcyBvbiBhIGZpbGUgd2hpbGUgdGhlIHZmc19hY2xfeGF0dHIg
bW9kdWxlIGRvZXNuJ3QgZG8gaXQuDQoNCj4gTWF5YmUgaXQncyBlYXNpZXIgdG8gdXNlIHZmc19h
Y2xfeGF0dHIgaW5zdGVhZCBhbmQganVzdCBwYXRjaCBpdCB0byB1c2UgYSBkaWZmZXJlbnQgeGF0
dHIgbmFtZS4NCg0KTWF5YmUsIGJ1dCBJJ20gbm90IHN1cmUgaWYgaXQgd291bGQgYmUgc3VmZmlj
aWVudCB0byBqdXN0IHBhdGNoIGl0IGluIHRoZSBvbmUgcGxhY2Ugd2hlcmUgdGhlIFhBVFRSX05U
QUNMX05BTUUgaXMgZGVmaW5lZC4NCkFsc28gcmVnYXJkaW5nIHByb3Zpc2lvbmluZyBhbiBBRERD
IG9uIHZmc19uZnM0YWNsX3hhdHRyOg0KQW0gMi85LzIxIHVtIDk6MTUgQU0gc2NocmllYiBBbmRy
ZXcgQmFydGxldHQ6DQo+IFllcywgaXQgd291bGQgYmUgYXdlc29tZSBpZiB0aGlzIGNvdWxkIGJl
IG1hZGUgdG8gd29yaywgcGFydGljdWxhcmx5IGlmIHN1ZmZpY2llbnQgZW11bGF0aW9uIHdhcyBh
dmFpbGFibGUgc28gaXQgY2FuIGFsc28gd29yayBpbiBvdXIgc2VsZnRlc3QuDQoNCkkgZ290IGl0
IHdvcmtpbmcsIHdpdGggc29tZSBtaW5vciBjb2RlIGNoYW5nZXMgZXhjbHVzaXZlbHkgaW4gdGhl
IHByb3Zpc2lvbmluZyBQeXRob24gc2NyaXB0LCB1cCB0byB0aGUgcG9pbnQgdGhhdCBJIHdvdWxk
IGxpa2UgdG8gcnVuIHNvbWUgdGVzdHMgdGhhdCBjb3VsZCBnaXZlIGFuIGluZGljYXRpb24gaWYg
dGhlcmUgYXJlIG1vcmUgaGlkZGVuIHByb2JsZW1zLg0KSSB3b3VsZCBiZSB2ZXJ5IGdyYXRlZnVs
IGZvciBzb21lIGhpbnRzIGlmIHRoZXJlIGFyZSB0ZXN0cyBhdmFpbGFibGUgdGhhdCBJIGNvdWxk
IHJ1biB0byBjaGVjayB0aGUgQUREQyBmdW5jdGlvbmFsaXR5Lg0KDQogIC0tLS0tLS0NClRoYW5r
cw0KVGhvbWFzDQoNCg0K

