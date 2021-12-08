Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FAF46DBED
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 20:17:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y84rIWSqco0yRKHaPlnYcFMIGTlBVEjYK2MMnEuOpBs=; b=rDPaJgsJz6mMZixfUkZXQNAzJO
	9wc4LO/vrcDqYiELRMOLi+BUFxMy6/jfKI/LkY3PYrpHIjcuUUxBZKQm8w5Mi6Dpp6l4egdTxLNJ+
	x2HRof/hKPYeliLl4qKDEy9/LLjBrNl9cgl/pTyn9UCl1KO6iup3XYjGdVX8q2xXvTRnXX3/Oh4KD
	jemBgrXFBNn3g37ZLXn1KOl/+SH0oDHAhiSgWcxB9NsDFDrDOnYkKk6FizUAs4EbZd4/MVusM6qlN
	ngpo2fsm3RwMHoiLRp8JqJqoJX7yACNUvRYjYl5MeIYQLsOVD9RF0D5XEn9I/Q4umPB9nPZeB0WOE
	tHb+3Kpg==;
Received: from ip6-localhost ([::1]:39268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mv2Ro-004LrF-JR; Wed, 08 Dec 2021 19:17:48 +0000
Received: from mx0a-002bd802.pphosted.com ([148.163.151.128]:59646) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mv2Rh-004Liz-FI
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 19:17:45 +0000
Received: from pps.filterd (m0146913.ppops.net [127.0.0.1])
 by mx0a-002bd802.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B891O3B017383;
 Wed, 8 Dec 2021 13:17:36 -0600
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-002bd802.pphosted.com (PPS) with ESMTPS id 3cte229k9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 13:17:36 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN8E0p2Mt8fb2Me0tEW/Chf3g9l0ArVRVsxR7ciLsS9W638DWp4iDwHVKdREp/EBTkmBewPAiqnCBuV40m6MxrFaM1fl5MYQIZLkfXJ7TB9Ve4S8wKWpOi1esWwoFGMou1Qj1RfCT/IjFCBU6z+4EbQ5o6zua5tyhyEDzSANNUambhXNzJQ0VfH5boAwT8NO0hbAm4q1/5FvhpReYpOt0CxkYqe9g3/J14gKGAtMnqpTvBIJtsgPETa81LnAwJp/LbK4cYq9ZOFJgF3ryelqMZ0fbc5eMbbFGW6ocWCsY6CYW+aOFBgHKhzm4flg6/bxnYUa6/nT59Y8+3czeH3GpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y84rIWSqco0yRKHaPlnYcFMIGTlBVEjYK2MMnEuOpBs=;
 b=Pb/Uak2vKIqL2/UPBNeBoC49SoDkWiz2ZwXL+Glfg/EknzVaJPyCTBfEia5WF1HTFGpfx9iYeLw2ttZfUc4BwkaKEYKy0LhMhl9uk3HZFHLMTZd6JFkenUHN0gRPoQB5BlhP9OVKu/a2LQGLNasEyjHaqP6WpwOsaND3s9aYZjcGysuKArreq3wNfl9DQOFkVn5sGu/8cYB35Vo/thh0LoXUCAZwcjNx2kogm5DjRyu40cAa2aHJA1xUQ4XZyqrjodfW3LzU89P5GdQS+ArxY5RWZklJU9vzLfnyFBuC3R0q84+5+NE1ru3P5jrtFht+uZMzvCOje/docLzirOqw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=relativity.com; dmarc=pass action=none
 header.from=relativity.com; dkim=pass header.d=relativity.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=relativity.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y84rIWSqco0yRKHaPlnYcFMIGTlBVEjYK2MMnEuOpBs=;
 b=nTv0JBgI2IAIoJ5eR0s5QZxwR3VssUHlosSJmxWq57/O0unxxaUa25jhvXNU4ut1WQbAKn3d/UjXVOv5dOcJtWdhYgfGMiQ+opWFg/u6MmI8vm3GMKId0I267a9unS6oGF3dIEViLLp+R3U8lDswji6rMFX2U2qUv2GF4J0iAG5r9sYRPnF5XXzhNriTKID5WL6c0bo+d04exdvNSOfT14GxjEOJ1SrZypR4oyrTKTM2ZpTf4eEdcKPTSyedYYws4jtw/PB2E/mbJ6uds129D9bgMEB1gCdjVLiSvuU97fSBwzfxPo9auoaLCWccLPN20ZJgN5PXcE8ppotSThGB/Q==
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8)
 by CH2PR12MB3670.namprd12.prod.outlook.com (2603:10b6:610:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 19:17:34 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::59d:27e5:56a2:513b]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::59d:27e5:56a2:513b%8]) with mapi id 15.20.4755.024; Wed, 8 Dec 2021
 19:17:34 +0000
To: Jeremy Allison <jra@samba.org>
Subject: RE: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Topic: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Index: AdfrvsECucADkDAcQeeM2h+0DdErwgABWQgAACgBI2AAAP6YkA==
Date: Wed, 8 Dec 2021 19:17:33 +0000
Message-ID: <CH2PR12MB41522ECF11B46232765D40FF9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <Ya/xevFuEmiugek+@jeremy-acer>
 <CH2PR12MB41528BA180EBB8C57C50F5E99F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB41528BA180EBB8C57C50F5E99F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec6636a6-876a-41ae-82c2-08d9ba7f636e
x-ms-traffictypediagnostic: CH2PR12MB3670:EE_
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 9OoOJGL02VzceX24MkhxpSJX937ZkxwZcJVcSG9r9opi/efAtLrsFNK49+XOLW0pWOfsRLs+TdrNOKrIXV9gczcjPwNW28b/2f1JeWddFgfqU1YPu4sjIDvYW9kRMOvJsss1ZjaqBaskz6eSpM212VRT145WPmPZBfMKDUhK2Rzedrv6ISP0zY6hj+Ah3b/ENT7vEfdhScf1W1G9s/v3ocHYuWIceKOCum9fWg8xT9s5FSz3JapFbZsFn6VTuvY1JR5dl23bf8NLgUrQPkQgAAUhHzBdlaqBC9CKzP0yht3A3avY4U8h6igqNoUzOL1O5Wh9zZdVFJ1wEciqLGxfCltHRKiSao6TzS5VBhtIlQnEZfR5DYK2xZQrJ6eYnfgLYEIQzBsggts2BZs18C//b7htopPuG5je9XKaRmcM10G7cG4HGCGHzpsVK6cX2hJFLlww1ymwISZfaFr37uKMoXdadzIrdU9kB0txwZp/vf+rPGXjYxwtD2WHQjZeWMBCIltNTQqwUDLnHEQRnu64EhmKkAhEJlF317FI4iGSrwzmKXcPsovOWYPrWWUuaLz8HH4SlWQcyTmuIVGRsIpiEeEPDJCcNzrMvhClc+VZ298MuzcUUUct+U29vCEj0Vln644OpxlLQm3QTv1KdegVl6KfefnGi5WIAgahxGvsthQ=
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bkqhrKJgbQii8NO2pjuQrtUh2y5Gp8iqd4sQCVBH1wvE+XVkc/vThIWEmoaz?=
 =?us-ascii?Q?ZhPbuYApQA2TqfMn3uEfChca96CJ6ct06Dyvrmf/POoKBFxow/7wc++gSl7r?=
 =?us-ascii?Q?u0komZkCWdDmRSRmCAoHnLr7aSlKIxuldAwGW1Pno7H1z8RuAjnvZNGejNei?=
 =?us-ascii?Q?9zmydyvPZpLlsQ3OyUxGMEDBJiEA7MHHxSWtzbnTqoumWAkQR1Q2TnaVwCmC?=
 =?us-ascii?Q?Z0Irl1tVAKhQZI6x8nGpRd/EklZVNKXBID0Abbkdbu6PduL/DC6TyXlrGiDP?=
 =?us-ascii?Q?4a4YSwm2N1u75f4t9s8OrOsBPIlha7eGNjihcC/NEVoniQQpa+NcT97cdcBh?=
 =?us-ascii?Q?JRMfFxkncydroyFTuVQGc8DmpHjBd9gaqA2zfiHk339g98dprqw3GzW0a6hc?=
 =?us-ascii?Q?8ty8MiX1a2ACIhQX86dS5Nbe5U+DQHaV5IMj+4AiX77zDDG0qCVxA22sy9nr?=
 =?us-ascii?Q?weesSYkzk6vd6O1ShmE+NujWm67D5TVtT/SQ8Oy01TBN+s+YnXLiA3+a7SgQ?=
 =?us-ascii?Q?DOK8KoeR43Krv+YIOvb1bj672hkKc08CAW7qTlyeVqXU46A69kDnYSDatQfB?=
 =?us-ascii?Q?OBWWrWwsDXLRFI2r/SM6it/PEdUPbpP5JgmN9P5AIK4K4jxHSKqUhgPOuVR1?=
 =?us-ascii?Q?nb7DR76hIMu2H6IkgtDX4W8jnPphSU/FTYcf46G/jn2NbsXxicRJoMUrG01k?=
 =?us-ascii?Q?O2nZF2IRQ+giCIf2fAXoX3ulMrvnyQ8WCBazeJEOMNqmltrEgGhYgxqJreF1?=
 =?us-ascii?Q?JzndWjWXURPFlRCoxQUfENBpGqdMKKAFCBwVUmB0Z9KUb+LavxlDq31z8x+t?=
 =?us-ascii?Q?Pk5RfSgxgLCP6DzIrB6xgUZ47Mx71QvHhIPBRQyAU9C29ILGSmr0BeFM2+tQ?=
 =?us-ascii?Q?on6oDiFrjeWGN/taaEsHrnP4hUJ3xVoNPdR/MjhG+QNOj7mks1FdsljaTH78?=
 =?us-ascii?Q?4gegpIZUqnkX9+EySVr+eUIoTpGQCsrCPsD9TuNFu4rpvY/8uAjJ/gg9/CGu?=
 =?us-ascii?Q?lsffge8Bzl25U05kOMZSisUx2hHQaVTnrNP6AjMhvR2Vu8AHJu6gK4+6hsYD?=
 =?us-ascii?Q?RnTRdB/2H6OWdS2ZSMwqQVUsuV/VCE69ZzgqNSZk+9SGMB3RL2scgWvuMoyx?=
 =?us-ascii?Q?hSa3kwZbkMbHmDz9DWCyCqkJnhBqbwKiRZm5HVPDAFZV7/WwLZFL/FXwzkqr?=
 =?us-ascii?Q?OILIfy7OYwSYIFQ9qJGaD9umDLmt7vC1yMTB6JeimP1xPRA3W/tmp/PJsWTv?=
 =?us-ascii?Q?2QYQ5MApoTngfKBe5YQoRFPfqQWLmNnLw5X6iMJidlHp/wurNuZck5mRyBX1?=
 =?us-ascii?Q?lRZKt79jzgn5kmv9FH+0wZhf3YTDPhSplbugXwJsH9TrT0swnc0ViDf/G3Wi?=
 =?us-ascii?Q?FESTUlSBqGVUaQqRuoGwUKRyJAS99QPKtKFW2giZRC/+tst63fGMx67pyVAj?=
 =?us-ascii?Q?M5tGQeVQxdzwyBcB11DjZowimv8Y4lFNdQTwR/UI1JYDwrRGn9urdGfP1beL?=
 =?us-ascii?Q?aQgLPDZmPdn7YORDPtJgGxc/7m4wutwa5rwIwqJfwS2zbKI7YdLECLuYQU5m?=
 =?us-ascii?Q?j9+c30yJCZk3I36CJesb9JY5ROg36DLNuqu6grja0Ue0yrHAw4Ht0rtd6GR9?=
 =?us-ascii?Q?U/3D2ym9UL7QftlPEuzwn5yLL1v1+eU9qO/OhvP6+d7vbSBHin8pTRxp+mwx?=
 =?us-ascii?Q?XsdUh3Qq4WO6zHQtyHbadMj3aogyjgzZdCZ8E5WDxSrFMwkLtUURqhzaDMSM?=
 =?us-ascii?Q?5SE8zPbwO6qQK4Dwdyq7p08XsrM0rek7PuFLpz3O8QO58RKfDvEE7RI/uMwe?=
x-ms-exchange-antispam-messagedata-1: UF6wD+2J8rNC4Q==
Content-Type: multipart/mixed;
 boundary="_002_CH2PR12MB41522ECF11B46232765D40FF9F6F9CH2PR12MB4152namp_"
MIME-Version: 1.0
X-OriginatorOrg: relativity.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4152.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6636a6-876a-41ae-82c2-08d9ba7f636e
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8afe73f9-0d93-4821-a898-c5c2dc320953
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54UnycnyXv1ZPrQ8t70Yv+KAqlX6jRyfQ58GmycmfZYYz4seE89s1U+ubMchi83iwNXeiOsYeiBMO3vRL4OMKplzrw6N1QW1U05Oz74OG+jczqmNPAvERc5++L+0VWgT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3670
X-Proofpoint-GUID: 2IWcNiIKZD9jgxi99aXpJBpgfG18iC98
X-Proofpoint-ORIG-GUID: 2IWcNiIKZD9jgxi99aXpJBpgfG18iC98
X-Proofpoint-Spam-Reason: orgsafe
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
From: Steven Engelhardt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steven Engelhardt <steven.engelhardt@relativity.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--_002_CH2PR12MB41522ECF11B46232765D40FF9F6F9CH2PR12MB4152namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>>> While trying to roll out recent versions of Samba, we believe we have d=
iscovered a bug in Samba related to SMB file id generation which can lead t=
o Windows SMB clients to observe wrong data.
>>=20
>> Could you share any test code/scripts you have for this so we can ensure=
 we have a good regression test for this when we fix it ?
>=20
> Attached a few files, hope they get through.

Oops, I forgot one... here is statres, which we use to estimate the resolut=
ion of the system's stat(2) timestamps.

Steve

--_002_CH2PR12MB41522ECF11B46232765D40FF9F6F9CH2PR12MB4152namp_
Content-Type: application/x-zip-compressed; name="statres.zip"
Content-Description: statres.zip
Content-Disposition: attachment; filename="statres.zip"; size=1775;
	creation-date="Wed, 08 Dec 2021 19:17:12 GMT";
	modification-date="Wed, 08 Dec 2021 19:16:40 GMT"
Content-Transfer-Encoding: base64

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
AAA3BgAAAAA=

--_002_CH2PR12MB41522ECF11B46232765D40FF9F6F9CH2PR12MB4152namp_--

