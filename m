Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D213807DC
	for <lists+samba-technical@lfdr.de>; Fri, 14 May 2021 13:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zugs79pSAgXzkEQM9lNhDUOLg7k//I+6nOz0Mb+zfdY=; b=ClrRkZMBeQ6CJfX088kYBGpza1
	im+KzjYk0E+ekmi3p+SHaTFvnBHjtGrhKnLKZSC1WvZSV4mLFNYa4ULP/ywApgMyPnEEKq0ilCzOd
	g2RYmHHC5i65fULxOGT2AiiJuRW0xENreYqTTiVG/NG8GH6r9xY07lx+amEF4TNEot6mQgWJ39wN+
	I4MP/jwR3xkqFhLoBwPrqhjevth0LcLUD58A+CVWJnIhxdngsc/Iy9v8SFUr2rXC2/uiPmSP8yNIy
	mmGB84A64Ca/qphOFTnGlAA0MWksp3bBBGyQBgB3/TMG7e6InWe6Mzy29fKv9o+VkwuH55ExgHsFi
	lELQxeHA==;
Received: from ip6-localhost ([::1]:59426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lhVXz-000661-CM; Fri, 14 May 2021 10:59:59 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:45549) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lhVXs-00065s-R2
 for samba-technical@lists.samba.org; Fri, 14 May 2021 10:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620989989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zugs79pSAgXzkEQM9lNhDUOLg7k//I+6nOz0Mb+zfdY=;
 b=j4qC8CKAOF8tViJGiSo1Vo2ocVOhy1IPJAwLPE6/nhBDMGffG3+pwDoBSl1Bj7pZPFALhg
 /RgxKGeGe+NSI2+Aj76WyvQWGUZ0Q9JsIPMkAGA505VYfeHrvudjJ21x+OHDAyL9nr39eK
 /syGHapOltislIospCsxoPlOGPVoP8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1620989989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zugs79pSAgXzkEQM9lNhDUOLg7k//I+6nOz0Mb+zfdY=;
 b=j4qC8CKAOF8tViJGiSo1Vo2ocVOhy1IPJAwLPE6/nhBDMGffG3+pwDoBSl1Bj7pZPFALhg
 /RgxKGeGe+NSI2+Aj76WyvQWGUZ0Q9JsIPMkAGA505VYfeHrvudjJ21x+OHDAyL9nr39eK
 /syGHapOltislIospCsxoPlOGPVoP8Y=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-LNzM6ylnM8eJOXsoCfas2A-1; Fri, 14 May 2021 12:59:48 +0200
X-MC-Unique: LNzM6ylnM8eJOXsoCfas2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9NkOzqeArNMmD1qVFoW5561rGF/5l/ZXdAtF0gEGPCuUCUxC2hg9lMiXb18eeNR2B8+Zdu5hHUPuYsSmwfTZpY3qdN4bGRUQOqZL9R1VKUNh/ozfOsl2ToSTiAERLdrOPGH0uGIjFckqQnSDeL383WuNVw2U0+Dp85nJR3sEompC+cFzhaMrOBV5IpfRPNNlt2sfN9a/RdVrNWqYIxDps0Vdo24MJQtz9SGIIi0zorzV4hk13PtXXubMBJlb9R8hJBw2MbKOYsG0H3WZFaiAUMVtdG36EGybuqvWpolI0W6PpIySKP31d6qyIk/3l0qlOJPO3TdOsp0JdKCPzXbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zugs79pSAgXzkEQM9lNhDUOLg7k//I+6nOz0Mb+zfdY=;
 b=e5x/BhzcYaBZYzb39jriYTorfb17BuuJOStLIVNbnOVCEPEBgIiYZ3M/qWRUamRPZIn8kZYmA49AgmKrBdW6f0qlkMHo4KPv+Xvb23YHKbt4f/Bp8D+h9/9Tm+c71PeLNWDWPW/a0Eq933/M6owgwb/PC7tw7YisfD/pvr5LREmyMf8exCguEK8tgG7BtVVxQvq0pZZmYBfABddTKQJsiA3Jx/70cQl6k4onHW4LR7KgVE3CbL9OLqmeihYCFCSbEzSSgMRQkp2rNBawECsEC3Chr4yW0WZyAUyAo8rRLKVFp4hlBBmVJnbsVB9VY4SjY0/yrq1pTolk173h/BF+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gwmail.gwu.edu; dkim=none (message not signed)
 header.d=none;gwmail.gwu.edu; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VE1PR04MB7485.eurprd04.prod.outlook.com (2603:10a6:800:1a6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 10:59:46 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::3c87:7c9e:2597:4d94%5]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 10:59:46 +0000
To: wenhuizhang <wenhui@gwmail.gwu.edu>
Subject: Re: [PATCH] cifs: remove deadstore in cifs_close_all_deferred_files()
In-Reply-To: <20210513165516.17723-1-wenhui@gwmail.gwu.edu>
References: <20210509233327.22241-1-wenhui@gwmail.gwu.edu>
 <20210513165516.17723-1-wenhui@gwmail.gwu.edu>
Date: Fri, 14 May 2021 12:59:43 +0200
Message-ID: <87sg2pshr4.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:713:d396:524:65d3:25:9e8c]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:713:d396:524:65d3:25:9e8c) by
 ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Fri, 14 May 2021 10:59:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8934cbe4-67a6-4b4c-0aa2-08d916c762a8
X-MS-TrafficTypeDiagnostic: VE1PR04MB7485:
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b/T6oQenlnQQv/yKmzL8tPjskgzY+FdA/hQpncmDHgo5QAsjSLqk9Fb0GebsVC56PsNzq59BW8D3UVOhXBaR3L2wSKqYqf4yqpXyRoQZM5THbUM6MFlvUiAmQkl0oKjCtd23oimPSYATfqcz1LK+r/nQHz9PUJKVRkAX5XcbxBeCwEMsBdL7CDH3GZVHA95gaJe8alc2j7je47/nskl1GsZrH+9tpjMh3Z40Nd25sZlzCylWx3bSjxN0QSx2U9D3XGtt+FHH+4WQJtWDo8oWoqD2IhVdGARQtxiyVOTVJ9LffCAAhCRUBdeuZDPRsdeDD1EnjdtDH6TSKuAaae+U6fXRPj1+FryfjRhGkpg3pVfVI/VwNqg7RXU0ldj4/tBDXmjbEvpqmIDEHHIRUT7e09VZW8e2hipQPdp5zJ9XP7cwr8myH+VEDsg6LRsVxtV/F4Gf2efTj1605MoPdMCfus18GlRbUCRb434APEi2RRyA/u5Lha1yvuBBV3QDarccazXZaJ+mJzjuzwVFQSl4Y1j2ewQwTGjMx6gA+5n6PP/kjCckBm5VTaKLm47X0gYofskcVvhKTedJgJNmVk0iLg==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDVJYkNEMkg1NDRoZzF3OFFYQXVyN3hML3Z0dW44eGdLRFVRY3pxdnlEUzhz?=
 =?utf-8?B?N3YrRHU5Ly9URVFSbU0vcXBGZ0VSajlrUkhWMHI3amhiOStiZyt2WXdtVi9p?=
 =?utf-8?B?SWhDc1hLZE9HWG5uREwvWXNEQlV0QkkvQlZHc1BieVpJbStUM0JLV2YxMktM?=
 =?utf-8?B?WVZ6NzhrWE9kRXdoUkU2R2pvUm5VSUtxcnFGYkFabmRaWENhckNVTldlTWhw?=
 =?utf-8?B?N2cwd3kxbFJOajVMOGswakRTSjh1QzNMQ3NZRmd3QzdmbFdTSVhzMWZTWW8w?=
 =?utf-8?B?TkVabDV4Vm9SeENqZWg1VXR4QWpTU1UwVmZlM3JmeEwySnBBSDk5UVhmS2po?=
 =?utf-8?B?NmsrK1hBM1psM3oycUF3L0pIZTVxU2xNSkk0dzF0aFMvaThTbVZacno5cEp2?=
 =?utf-8?B?TVBicFhydGNweUlkaUFqMHdoQ1k5T1VhSURFQ1JLME1pd3lHc0JOeDhUSDBx?=
 =?utf-8?B?bHlpd3hBUExzV2FvUUZ5WTg1U2FrbnRKcG5qYVNXZEMycC8zQlBmdmkxR2hk?=
 =?utf-8?B?eERZbWljQ3FlZHNIRDBtbW5pYlZFN1JiL216RW1VanJiRm53WWJQT3BoemtH?=
 =?utf-8?B?SlJlUU9VMTYwVEhQdkh1WmRGZmk3ZG1TY1NiVmFJb1BqUy9iS3FVV3o5L2pE?=
 =?utf-8?B?U04vemMxU0pCc0NDSUV0R1g4NUNsbWpvbFFPK2VSejVVUmUxUXR4b1AxWG1C?=
 =?utf-8?B?K2JVb3djeEpEM3k0NEtzR2k1V2lpelFSNnNzM0hRdzl4MjM3TnkrbUVjenVx?=
 =?utf-8?B?dXJ6ZmY4NDd5b29OV3J1SGp0eHBnR3hxMkN5NnZ2L0I5dWNvNlRuOXprK3lO?=
 =?utf-8?B?cjFqcGhNOThlNTZlcXN3VFhyMFJiZ1pTVnJWYXRrcTRmM21EZ3B3SHp6NzJs?=
 =?utf-8?B?N1J6dnR0cXFJTllEdVZ4RUFWRld1WDNSa0J5Y1hrdlkzbFZreldVQXoxSXZT?=
 =?utf-8?B?ZlNlbVVTRVNoWjBaaURFUnppNWsxbUJFRUlXTzQzWmNOS2p0eVhtbE1xQm54?=
 =?utf-8?B?eVY5SUFjakhRQ1hyNkJpVjNTVG5iRE5OakZ1WlIvTFNPQUx3TUIxWjEvU2FR?=
 =?utf-8?B?Z1ZSOUY3WDkySlc2d0IzbmJFdWpYUytneHZmam45ZmpnV2Q5Qmx1MnRvcjk4?=
 =?utf-8?B?dzJyR2xyaXh0MzlhTEpad2lHV3dIQSs5eVI4c203dzJaR29TcEZHWTV1Znhu?=
 =?utf-8?B?Y2QwRmpvdUNwWXRwMDdaQkhzVkpqU05OYzJtMzM2OFlCMklIOThNUU9KTVY4?=
 =?utf-8?B?dEt6RkZWRm1TU21sMUtnOGZVZVZiaVZkMDdiRHRyVG5STmVscHQvbDFmMSs3?=
 =?utf-8?B?TkVxUFRldXFiaEVZQkZSR0ZnNVZvT2c5MGhueW1WbFdXZGRoSjA5UjNaMjN3?=
 =?utf-8?B?Z2FCcVExTXA3NWNPMFVUVmVsWkhCOGFPMmtTSFBRSWhHRW85a3pGaFJlVWdR?=
 =?utf-8?B?eUVydmlUeW9Tak1TR2ZXdHVsaVAybHcrbVdsV0JRY0lTdWR3bHpjODFlREsx?=
 =?utf-8?B?UFVCcW5tbVIxQkVTUTFEZE50Y0hrZUlZdlVtd0NlWUxkU2NXWlVWVnpaUTlU?=
 =?utf-8?B?Mnk5Z3JpSEhUSDhNOTF2bHdrb1d6SGpyYzhDT2JSUjRjKzAxd0hrR0hjTnVC?=
 =?utf-8?B?OStLc05WMjRCeWc5bjRqY0tsbEhGWmVUakJ5Tm0yMDJoVDV5OUNUcXB2aVBk?=
 =?utf-8?B?c0hzUVIwdmsydVVZaGhNbk90c0JSS2pDLzlFc3VFZEpsdHAxQldweVQ2djBp?=
 =?utf-8?B?cngzRVlQdmdvZllZMFgycmFIV0tnalQ2MjkyS0l6d1lDRVdrc0NGaG9YYXUy?=
 =?utf-8?Q?S8QHRhwnzlixMlNvjtO5laAPgfl7j0ie5DNTI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8934cbe4-67a6-4b4c-0aa2-08d916c762a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ko8PRYpvth0eGQt0lR1VTqX9htw09qtVaqJq04wPzZ5TSpsixP87jEz/7lt5zVG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7485
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Cc: Steve French <sfrench@samba.org>, wenhuizhang <wenhui@gwmail.gwu.edu>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Reviewed-by: Aurelien Aptel <aaptel@suse.com>

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


