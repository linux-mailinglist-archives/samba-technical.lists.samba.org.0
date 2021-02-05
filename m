Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F9310F52
	for <lists+samba-technical@lfdr.de>; Fri,  5 Feb 2021 19:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=BBbkwFaadncbMBFMV7pzrkj2mqL+BgH65k0ibyjLDnk=; b=yWQLFUv8NtYJMSIgSD3o1yLAhW
	0j4oPaUBp36mAjdeuqoiBz49AQ5VJQ3dPfGVxsE18wchOhJNct4gGLIE1rU6GL2/QqN9OEDePpXRg
	qzJ0a2H24pVicGFnqb5sVKFRw9u+bS0AiG25zCfKcU4ZrDHdzmQ02LT5FHP934WPxIREGK13AJk6x
	s/+G9LKEAOUys0pEUm8TcI1DvvdxbODEUaj1Tp+Hw9zGA1hE4D3Acb5nfwmPTuaxJ8XLZ9bmf/A+7
	CZh6nPrwogMm/DFQd8SL/YYMpyLJoR/XOqLbU7oMRDNE9kZMH7OGZupxJu8bpXkbp8ButtZxbkhDf
	AuQys0VQ==;
Received: from ip6-localhost ([::1]:51954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l85P5-00B8rd-Gn; Fri, 05 Feb 2021 18:00:23 +0000
Received: from mga05.intel.com ([192.55.52.43]:35325) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1l85Oz-00B8rW-MU
 for samba-technical@lists.samba.org; Fri, 05 Feb 2021 18:00:21 +0000
IronPort-SDR: Z5DarWzpP3LOCCgJ41vjT5Ioa0ydNzgbTWxxe4FWSbJlp+15zxx5sDx8CA8hjgRyZPyrOAmRb9
 +4v1pnCDJ+Eg==
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 09:44:28 -0800
IronPort-SDR: 6sIaDpKyOcprUtTx5nOnJgSE4KUcbOkpHUQAVHczr66vPPVNikLL8dL+MSSF7hxOiLtnKT/qOG
 rhcjWn5YLpNA==
X-ExtLoop1: 1
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2021 09:44:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 09:44:27 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 5 Feb 2021 09:44:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 5 Feb 2021 09:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz2iXurSST9GplN/yod8Oof1SYmSADvS4WEg58rO19ny4YWgItQrnuHBUhZThd5x5kNMFZs3N077Qd4WVyvVlLoUVqGgqG+vbpMhXST22kvK16ExDfOOBNtTcnLvklRyObx5itMIv74S1TI+pdc8rjQ4FmL8zIr6d/hDfk6lQe8qgPdCku3bxX1Bs2q07eR6RknR2B1dIPL7XKEoxTWpEvngqPA9RxgLgMr1bMPpPzc+oiPE+zzmYJmqe8ZVDE9jxHNJuYwQwLNa7Ae/iEBv7CUDcje3hfBTr/SJk8ApuOw/P/7cptB3Gn4roHvWapicmSpskeE0kplkG6aZGgXO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBbkwFaadncbMBFMV7pzrkj2mqL+BgH65k0ibyjLDnk=;
 b=ItRwe9Te9rzUpdjdY90C2RD3UQjmvdEQtMa2g54J+ODgWSXw5rrjMFcklYWSjBd0XrOc8M3eSSBKqqkylUSrP+rzXh+Q7qlJLpaXMI5f0ihPpqPJQFxq/z7E4bIWTBD3wJZeyCSaUoWdFipmz2pR154ikO4XeTl9sHl0F1FyicDr/YA/EM/EAiqGU4DFS1MpuAOdhao2OhtNaSiKJsUqSqQYPDPXUgdKj5SLx5NnvfF5W5Am6vcgOCzgD4MJrf1miCsKpu4GOtkPoQ+YVhVL0HA/bGU09nCdjhF+a4hLz/bCnBaKHt/2ajLzSGQ254f6sBHRUJuxn3qC+YlpPnRzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBbkwFaadncbMBFMV7pzrkj2mqL+BgH65k0ibyjLDnk=;
 b=FOXwdbimXhPOYRKx3pPHBMlVE/QsmNrEYNdrO5ZMtMDItr4pe/ulav2BHx+y0NRvFeqMlk6/o3uOX2c/sZIR6xd3+UEmPwP4+Pg+v7YIdgFBntvUSynf8ziRoHCeRJ/Fr6hyR4Xcz0JwmI0aNIzPQ4r8lq2SGwCWh2qZx6BVy3g=
Received: from BYAPR11MB2888.namprd11.prod.outlook.com (2603:10b6:a03:8c::19)
 by BYAPR11MB2965.namprd11.prod.outlook.com (2603:10b6:a03:82::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 5 Feb
 2021 17:44:26 +0000
Received: from BYAPR11MB2888.namprd11.prod.outlook.com
 ([fe80::3177:568e:e8b5:371f]) by BYAPR11MB2888.namprd11.prod.outlook.com
 ([fe80::3177:568e:e8b5:371f%7]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 17:44:26 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: should lack of secrets.tdb prevent smbd from starting?
Thread-Topic: should lack of secrets.tdb prevent smbd from starting?
Thread-Index: AQHW++aLka8wspPjRkCI1+F6OlS80Q==
Date: Fri, 5 Feb 2021 17:44:26 +0000
Message-ID: <0caea8c7c56110ebe0f6be13531b1c03805c45b8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.136.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01053231-4660-4264-e090-08d8c9fdae6c
x-ms-traffictypediagnostic: BYAPR11MB2965:
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gGcl7dZby3ztksmzgYUq22ontKw2iLFMRYUP8Oo3kflzIE9BMw8PRX8tNOOC4Cq2dt2g6T82KMqXmXEHI6IRk0urQRg+Ht5Q+CvjBPuAimmuiWRFGpmfQPzgV2Iei9zaCZhK5YVocjexPpETQKK9aZjvjDHyJeAoas3Cw7lBryGz6AnvakQlHocByUPMIMqeULoMiU3DZ/FUJSeyt9iq02nl/LJT5hH8mRboYWAiRaFbKHgutaCHKt5m32FqrVrUNk0bUDLtsmcXW4tZPz4nx5Y/8/NMAcUnivE++hEHDH0c5+0Aw8iz4lRxDt5DQhPszwruihYiHEw3YXfE/cZ5/W5OLAN1Pg+RXzJ1xKh9aRtOyGsocvywgzhJEPHUoREJz1Rl7EHg25vRd43VzPoP/NgxmuzLgOVapWAHlZQKOAPjU4ZSneMqFXKCNh8MY14zdW/WXNkBzqTKvCGYTLuphn9I4ZK7MhXt496AmR2UOHE4bZB+U84bje4m/mtmOVtr3T2KQdDHhqviD5jgXxoIGg==
x-ms-exchange-antispam-messagedata: =?utf-8?B?WDhDM2xuV2pyUXRrODFTQmdHdlh2MUtTc2xoZ3ZwYi9CdWlqVmVQS013QWsr?=
 =?utf-8?B?MGszODRXTXpPRWx4QStZNVV2bjRNckFsSlFWbUpGTXBnOVpOMXowcWpxZG40?=
 =?utf-8?B?M0owZ09KUTBObUxhcmtMaC9rM3UxYXpobkJSR3ZZcmJzTjNoTXk1R29tSzV2?=
 =?utf-8?B?bG53UzdYaUtBanlYRUhmYVpuN1d6bkt0QzNHMVc1dUZ5N21ZakYvSUpmZU4z?=
 =?utf-8?B?akRtQzFSVzlsZGdmTDdQSXpybzRHNFB2bUI0MlcxLzUwRVV2bkRVd005WG5w?=
 =?utf-8?B?UVBXa0g2WnVjU2JrUG4zK0NkMTRUWHVodnRyYjdBSEtYVTk3NSsyeW0vQld1?=
 =?utf-8?B?ZEpJY1Z1bzl3NUJ6ajlvSnVsS1dnVWxuSEVnN2F3QUYyV2E4WkkyeldXcjhs?=
 =?utf-8?B?Sjl0NE1JYi9WNXVPQWlvZnRnNmNMZU1GdjlPSUdaanZrdXhvckFoUURRSVdH?=
 =?utf-8?B?WXh3bTNSemVTKzVOSWJJUHhSS1JTdjdLNlpzQmNZWWpPVTNMeDJ1VGs4bWtt?=
 =?utf-8?B?ZEo2bHlsaTZ1UnpFL2JETEdNR3gvalJoUmx3Q2tCVGQ1SnBVYktKOXRSbDlx?=
 =?utf-8?B?SDVQL29rWTlFZ2VkaWI3OWZDdXZzUjV5eFdJWFpaWVJuTDZCWG16MnR1K2wv?=
 =?utf-8?B?SlZwL081VUlUd2JpMXBJT2dVU2ZJN0dsemJkV2l2Yy9LcXVnYVVSdXhRcXRS?=
 =?utf-8?B?bUtxWDFteVd2UzAyOGlLOG1uWUlBUmNiUnRERkkrNGVrMmM5T0JuU0NLbkJt?=
 =?utf-8?B?MTdlUmdwTVdYNUNmcmZLcUhEeGNHMVF4elY5VDMzbUw0UE50WlJ3aCtWZU00?=
 =?utf-8?B?KzJ4MWVGL1VUbEE1RTRKMUg5RVZrTEFHeGVXS3JPODdNNThpY2Z6NnZlNTFy?=
 =?utf-8?B?NGNrWGJYWk00TkFZS3RWdHR0V0psMEh3TDl6NTVKOUZZS3VmWithVHlBbXdB?=
 =?utf-8?B?L0ZkNWRrT1BpUjZSMGJCMC8xbHBWUjFTT1JXS3FDNitWMExqOEMxdDdrY3R4?=
 =?utf-8?B?NGUyekM2ZUZaWnk4Q2FGbXFRR0JlS0NXSUtPTUFic0U3YldLZlMxeTBia2E2?=
 =?utf-8?B?a1pHRUtOQUMrTXFTcGVnYmtXNDNNek9RZ3hLU2dnSzdYY0pubUNqc2piYUhC?=
 =?utf-8?B?YTBtTXM2aFUvK1NiS1ZkSGZhcTVFbVJuTVkvL0p1Tkd2Tm4zaGFBRHdGRmMw?=
 =?utf-8?B?Ym1ZcEVMcHF0c2Z4a2swcVNxSDJrdGR1S0M5K1ptZHhOQVVpZlE2WWNGczNZ?=
 =?utf-8?B?UWJkTDNHd0s2MWhjWEFjcjZHdnFCRmpQb3lRUmh4b3IvZldHUnRmVW5CN2ox?=
 =?utf-8?B?RTh6RGxzRi9BWU0rZTc0L3gyTGxPVmJKenZJYjZhZHFJM3JwU1p2NUlaVVpF?=
 =?utf-8?B?TUh4L1JyQzVXaFRBVzBqamVNUXprZFRwRW83Um90bHZVKzRRSFpnVEcza1Rn?=
 =?utf-8?B?UmFaVW5uTWd0WVhWdkExa0ZnODFucFNEczhwN0oyajJaQVR0YWF2cWs2K1B5?=
 =?utf-8?B?dFF0M0pZaUh3M0tiWGQyUFdYRWEycWsreFFGTlkyUUtqb1AvUUFCUm5TRGNu?=
 =?utf-8?B?R1g4L243b3o0dWhaMzFNanUyTGVwc0dJTUwwUXRFL2xsQmRjZmFRMTBnb3gx?=
 =?utf-8?B?YURia3BIUy9ucmtLQUw3UVBEZFBWZVJyYWh0Q2haVDNnblZwdDlvMnNBeHJy?=
 =?utf-8?B?SG50VHd3MEZoZ0c1cWpPUGphcmZGVWkwanNwdnR3MnZKV0MxMXBpaStHM3pT?=
 =?utf-8?B?TmdneUVWQ01oWDlvU1ZQc1FiWW4zSGkyamMxTUx2U00ySVBVNW9heDZGZ2o5?=
 =?utf-8?B?MDlrRFlnZnBwRkx5eWhudz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <76D5106E36CBED4D9A1D3CC4E3B71117@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2888.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01053231-4660-4264-e090-08d8c9fdae6c
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kBDlQUr14nAmxbjbqdD1LwWm28qMFF1LctGKxrFjXFTzPmo7yWHWzF8OL9vi4HU+ZfwGS3EZ0XFv1rmTIPHPlDruKaeLR6k6YdsFqPTB5jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2965
X-OriginatorOrg: intel.com
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
From: "Christian, Mark via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Christian, Mark" <mark.christian@intel.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SSB1c2Ugc2FtYmEgdG8gcHJvdmlkZSBhY2Nlc3MgdG8gZmlsZSBzaGFyZXMgb3ZlciBjaWZzL3Nt
Yi4gSSBoYXZlIG5vbi0NCnNhbWJhIHByb2Nlc3NlcyB0byBtYW5hZ2UgaG9zdCBrZXl0YWJzIGFu
ZCB1c2VyL2dyb3VwIG1hcHBpbmdzLiBNeQ0Kc21iLmNvbmYgInNlY3VyaXR5ID0gYWRzIiBjb25m
aWd1cmF0aW9uIHNlZW1zIHRvIHdvcmsgYXMgaW50ZW5kZWQsIGJ1dA0Kb25seSBpZiBJIGVuc3Vy
ZSBhICJnZW5lcmljIiBzZWNyZXRzLnRkYiBmaWxlIGV4aXN0cywgb3RoZXJ3aXNlIHNtYmQNCndp
bGwgcmVmdXNlIHRvIHN0YXJ0LiBNeSBhc3N1bXB0aW9uIGlzIHRoYXQgYXMgbG9uZyBhcyB0aGUg
QUQgY29tcHV0ZXINCm9iamVjdCBhc3NvY2lhdGVkIHdpdGggdGhlIHNhbWJhIGNpZnMgU1BOcyBk
b2Vzbid0IGhhdmUgaXQncyBwYXNzd29yZA0KY2hhbmdlZCwgbXkgc2FtYmEgc2VydmljZSB3aWxs
IGNvbnRpbnVlIHRvIHdvcmsuIEFtIEkgbWlzdGFrZW4/IFNpbmNlIEkNCm1hbmFnZSB0aGUgc2Ft
YmEgY29tcHV0ZXIgb2JqZWN0IGFuZCBrZXl0YWIgb3V0c2lkZSBvZiBuZXQgYWRzLCB3aHkgZG8N
CkkgbmVlZCBzZWNyZXRzLnRkYiwgYW5kIG11c3QgbGFjayBvZiB0aGlzIGZpbGUgcHJldmVudCBz
bWJkIGZyb20NCnJ1bm5pbmc/DQoNCk1hcmsNCg==

