Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9722CC792
	for <lists+samba-technical@lfdr.de>; Wed,  2 Dec 2020 21:15:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fWgviIM/kh6A4olBYyIeaG8QUFnj1BTrZadN544BQ2o=; b=XBAiTmpR+ht/mKhnx1HHly2Kzp
	4AQk0fqjaGmJHNzkL9LxAitBTp+Tlc6LqWGmx681C8uIDEMEgbrCeQzxHlpALft7CdKT6ku8Na4t4
	0Dq4M3B+RedCaVgqw1MZ9SyPsDxS8IHj3/vA74vXrT4Du+DyPofJaZKf5ZIds/riX9dxnGniVWPZd
	lu1D9lznCqKROsQHwpIfopNFLxlpqCq7JtrPXaWLYtMhkh/zoKNKRexgjNhxbYqFnGSoL9q8O7wuP
	VuEuqCmech8IhA2WFDYOBv4DwSeUsi4YjpyOr3sL94XzGIDEuETh1N0t/JYtX6zS2xx9DRktrnLg+
	NdJEttMA==;
Received: from ip6-localhost ([::1]:50530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kkYWQ-000DZH-Cw; Wed, 02 Dec 2020 20:14:42 +0000
Received: from mail-eopbgr760071.outbound.protection.outlook.com
 ([40.107.76.71]:7822 helo=NAM02-CY1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kkYWJ-000DZ9-NN
 for samba-technical@lists.samba.org; Wed, 02 Dec 2020 20:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQYpC5g16MON+xF/WEb9m9wjDPU+6NsecJ+X49lZSV5dpdz+hThBp5l2gGdM0ddCIY9zK4jrkSg6PstCmXNG5tqTxTxEwBNqtrR/mlC8E0lnMcfOEE/y/wLSYUDdewr0x/HK7YVc1uqfPgQ+aS+4VB5HWAXMgQ+ZMBOyiQONXSzGzuQa8Eys6PWRLVedRrxyaH3NA8xfunS80tD81f5HULlsVV5OnSUzlMpluDDPa3vz4RBbJ3I1wkd/PXFccMq4oSbgj5RAGUM7+7v6uutMtr5MB8etJjcdKz/QidJs2/oR7UOqMW6ABJWViTMXfxNffSh3C0i0RiBhcgmFPch2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWgviIM/kh6A4olBYyIeaG8QUFnj1BTrZadN544BQ2o=;
 b=AbUP0cWKeaHB2h1W/9ux8GqBpQ49NH/S5n2mnFVYG9w6Du9ivlo+epckFKVF+3rDPdC0t37QwHPHYpdZNY/1cfvzfd4V4zTLcCI7OKVYGGRF8SWPjsMVUby3x6NEJou1BgUAYXWHRH9sMvygin7V1tm6yYnTtc0CBGGsFkZxHct3g8L8k6WjVhaTl4FXtrxfsIcBkZ2l6Pu2IKyFXIufG2tptxaWjLs1H87ScLxahD7PwM6HYc85QBnYBoR1bGAU2QryyKtcHOCj1J0osHY3mYnvQUs0lRZX7JqWnvRuyzAtey+C5mMRZlQ8UK9kCFseYUOItW76NlWBD9syYlj/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=komprise.com; dmarc=pass action=none header.from=komprise.com;
 dkim=pass header.d=komprise.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=komprise.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWgviIM/kh6A4olBYyIeaG8QUFnj1BTrZadN544BQ2o=;
 b=N+0RBf0E0+B/Jb/DEy8m0HMzIUcjnmTkZDgCpIZXkAskd1QRK+xfVme3fhiW+3XrDF0AylR7IbioCWrOA/vcFi++n60GMl0rS9gZhuzqfx7GQP0EFM7JUvYyLgyvnzwYe93cjRYlemryyNP7lvbzqO5xB26qB1PF6vnwLIbx1AI=
Received: from BYAPR16MB2615.namprd16.prod.outlook.com (2603:10b6:a03:8f::17)
 by BYAPR16MB2743.namprd16.prod.outlook.com (2603:10b6:a03:ea::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 20:14:11 +0000
Received: from BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::116d:161c:4a50:e9bc]) by BYAPR16MB2615.namprd16.prod.outlook.com
 ([fe80::116d:161c:4a50:e9bc%6]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 20:14:11 +0000
To: Steve French <sfrench@samba.org>, Steve French <smfrench@gmail.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Merge commits to v4.19 from 4.20 & 5.6 for cifs backupid fixes
Thread-Topic: Merge commits to v4.19 from 4.20 & 5.6 for cifs backupid fixes
Thread-Index: AQHWyOXkpLlUzO54vUW55IcwP/u2Qw==
Importance: high
X-Priority: 1
Date: Wed, 2 Dec 2020 20:14:11 +0000
Message-ID: <BYAPR16MB26150D5743AEE86BA8D1B095E2F30@BYAPR16MB2615.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=komprise.com;
x-originating-ip: [24.5.2.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8215c75-3479-42f3-d5bb-08d896fed54e
x-ms-traffictypediagnostic: BYAPR16MB2743:
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MjeMEXYVMmxXLBRkhWcCEgON+boLzmaPGc11CJtUgiwzmAJyE4tcLDUeSqBhq+ohGU0KnmqdqLAIFtdQh6nD1hMi3q1VE3NISGVNAMYgEqueoB0z7pPoDunA18d7zS5MxaLAQgQdnCYskGKiqdTSvu+WatrEk0DIftS8BNLUyaYFhaGdI3ZjV6pdBdAs/rQKCs3k2AuuYvR98ORPe5/sXuqz6ccr3whC5xwS332KqoRQ8P3FFS5Y/Q/Non9zLY6h6OTdm6/KKhQfYVzWFEcOV7WgU9yrDlSlOJYGFWr4xP6WTvdqrwi8Kqlebjdaw4k4nRiXAs7CAOtuiUDWCBY/J9t5oxWh6433OA96xnlAY0XcoRHumcsWMHJK3abYVaK4KEmFgzF6gUCGmNTIV79FEA==
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?hv64pVN9bfBhDyvJHmBisr53l6mdSA265IRIddymSdFFPyyqGcR6GYkDtx?=
 =?iso-8859-1?Q?2YLyFWK2UT7wesLBi+r4aQ3JACrMR2Cn6T3eHbGDgJZw6L6d0n4eg7eQ12?=
 =?iso-8859-1?Q?SRFQQy4949aw/5pTIiDx/cyWQ6IPZV11C4VlvNjkXNIXRTP7ySr1zpRn+a?=
 =?iso-8859-1?Q?L7ep5jYpBEJB35IMtObIczD6SyD9ZAl2oH9zyFKOEOkn2cMvppAnTecl5g?=
 =?iso-8859-1?Q?TT2aMmt2/pRthdyZqGPyDUJO9dWRrVoMTNsbKGb+l21U4Rqq1W6HY1OUXe?=
 =?iso-8859-1?Q?L5XsbIPKGkpD8J1Pere88gmNSkNvwZ2+QXlxPjTS7r1MqAkmtaFcBPJxSh?=
 =?iso-8859-1?Q?J7WhGU1q4A2S94X9gSTzSvWBs2fIehnRlPyWdxZ1X0S+RQJNIli6nosAIE?=
 =?iso-8859-1?Q?IHy0qSU7nNk4UQZXo7qmesuzSvGhe6MSxU15vTvWkJjjj6UBZHhOIAIFll?=
 =?iso-8859-1?Q?0s1nINHRayS5apD/G7scsWIsUlI99U3saqFJdKf/fpBV8htA2MTcN6yaZC?=
 =?iso-8859-1?Q?WPfil64a+3h0h4S8VE/Efg7WAnwechkO2Lf/G2li/feAlAd9uNMVZKWyRx?=
 =?iso-8859-1?Q?PLavwrRiTv2iDZ1ksa9+lXjBMaHUwtj8EslyTI+8ZiNkWvgFotV3nqPKBs?=
 =?iso-8859-1?Q?cOsyz+6KFhW0VWNSGegWinPAtwo1DoMytMCfXTjUCrlKmZCZ28oQDsV/ti?=
 =?iso-8859-1?Q?mhZih0VlZK/VQD1JGMPQBLbMp+cDFfHayt8l/3fOIoLDQ5iEgok5+Mxp9g?=
 =?iso-8859-1?Q?DVMiUy60/+y3+R0UTp1sHNahoobbprOw2yXOUszNRBYSI8xSjX2zAvn1aB?=
 =?iso-8859-1?Q?xrzkbrCajq8wadNFB8zF4KXlmQFTTlaadnmeM4ZLA2Sromxe6+iGQLHhfC?=
 =?iso-8859-1?Q?RkFOsNxq/iGBKGrMMFYFhqufNj/YpfojB6SQhwC2tuSDJWy6Vo+CJT9V75?=
 =?iso-8859-1?Q?xQF1EH/v58Nh1FooL9X9W37eNkCJA9m60qauLI+iEwNZdPsi4KK1ZWvClQ?=
 =?iso-8859-1?Q?JjBlM6beJ8viKRV/c=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: komprise.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR16MB2615.namprd16.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8215c75-3479-42f3-d5bb-08d896fed54e
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a5a9d78-0afb-4c20-b729-756d332680db
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlheesKEntFmKUO/2wvHcMB+DdnV9YwHxq5v4PiXDGPT1gCtk3bA/q2gtgLHMDvOpFzsebc012349cGgI6yZVBt+xaNGeb9z2ZoMORUP8A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR16MB2743
X-Warn: EHLO/HELO not verified: Remote host 40.107.76.71
 (mail-eopbgr760071.outbound.protection.outlook.com) incorrectly presented
 itself as NAM02-CY1-obe.outbound.protection.outlook.com
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
From: Vidhesh Ramesh via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Cc: Nahush Bhanage <nahush.bhanage@komprise.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,=0A=
=0A=
We mount cifs shares on our centos machines running kernel v4.19 using back=
upoperator privileges using backupid, however we do not see that the backup=
 intent is used for all calls. We did find fixes for them in 4.20 & 5.6 but=
 not in 4.19. Would it be able to merge these commits to 4.19 as well ?=0A=
=0A=
Here are the commits of interest.=0A=
1. https://github.com/torvalds/linux/commit/5e19697b56a64004e2d0ff1bb952ea0=
5493c088f - v4.19.rc1=0A=
2. https://github.com/torvalds/linux/commit/61351d6d54e651ec4098445afa5ddc2=
092c4741a - v4.20.rc1=0A=
3. https://github.com/torvalds/linux/commit/4d5bdf28690a304e089ce750efc8b7d=
d718945c7 - v4.20.rc1=0A=
4. https://github.com/torvalds/linux/commit/0f060936e490c6279dfe773d75d526d=
3d3d77111 - v5.6-rc1=0A=
=0A=
Vidhesh Ramesh=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=

