Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FE32F105
	for <lists+samba-technical@lfdr.de>; Fri,  5 Mar 2021 18:21:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=cXNIFNjcFEa/Y6/7kepGaaySnJpBVdrUZGWTyqF+n1M=; b=0CLehH+29Bm5X/lieKatrPcjDQ
	ukbdXluPEJvvr5UcVSIPw9ZkQq/RB4gsYSOCfR/44xIwdBl29jL7yCOxRFMcTks2cMJsR86MgxQ8/
	JcJo10kdR6au3vTYn0sqMalyumpww5sp1kFspfCpD43/0aK8o1xmUS3jBOHutVHro0Z0UT8OvUkm3
	MCPRNxN4Zirx2C6eb5tFedXl083Nv5wEsRqTAZymyqRO3cxK4FQRyQLmC6ChF0RMKxa4/U0fD6yDS
	91xAWuSXPoW7ZL/aaNMj/nn0Zcu/bHnY1/xRpk9OHuzy6+YCnaE+QqNmfmpJA87aDTwmL8eOXy7av
	Sc+rAzDA==;
Received: from ip6-localhost ([::1]:41110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lIE7o-004K1H-W3; Fri, 05 Mar 2021 17:20:29 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24177) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lIE7d-004K19-SG
 for samba-technical@lists.samba.org; Fri, 05 Mar 2021 17:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1614964814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXNIFNjcFEa/Y6/7kepGaaySnJpBVdrUZGWTyqF+n1M=;
 b=Mqrnyh6CF0ra0pGYEtmB0KPYbZD9pqX4qq73zGpnX4CAV3oEhb5kUi7YMbG585iNu6iE/u
 2D8qASSm9YHghTDITQ82i/P7NtVWhwnOZVcEd22hKN36lGb7+uhJXCPo5osanQGRD8xXQh
 njVONXeE5zTz3WphwSCqbZPujywWDus=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1614964814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXNIFNjcFEa/Y6/7kepGaaySnJpBVdrUZGWTyqF+n1M=;
 b=Mqrnyh6CF0ra0pGYEtmB0KPYbZD9pqX4qq73zGpnX4CAV3oEhb5kUi7YMbG585iNu6iE/u
 2D8qASSm9YHghTDITQ82i/P7NtVWhwnOZVcEd22hKN36lGb7+uhJXCPo5osanQGRD8xXQh
 njVONXeE5zTz3WphwSCqbZPujywWDus=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-fTD7NEzVOIG7Cxum0KcBPQ-1; Fri, 05 Mar 2021 18:20:13 +0100
X-MC-Unique: fTD7NEzVOIG7Cxum0KcBPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ferP/psz7Ge/VnecHYUNsKAjSR4rANtSB6ZbVt8+dFYAod2F+LHuTwWAn5zcbPYQh0A7ttHfGAUN8Zwf80TP0UziD2E6FQBFwegrwURO2z4fhyzmYjT5eJ8VDv8gpJqko5mKzCARh772gZ6XCxmPCkAeSrYSaVVgPqnFm73tcsECYSWoeGHhMDGT0v0TbUB85epp/Zob7TI2/QgM+WyiFSJtV9jjE5d7JwV1N97NVNgi3GWTzjs9vXiDJEcsmTdOOJ/s26QWsO7jhk8iPWZkISJfAbOJc/jn36Rzj76lz90QZinz7oLLIjHCq5PzoZfCAVJuDyfBJFoXW43chcHi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXNIFNjcFEa/Y6/7kepGaaySnJpBVdrUZGWTyqF+n1M=;
 b=CDljFuF6A1P/Df1RU+srMmnsEr4xQDDJcvODd/Q+4UpwDFQJ7Npwy4yb1Tym+AMKPR2YtGeE81OXigKysYEdqZR80H6gyo504rM/iS0nI1JQ5yMbVZMeoazqquk3YCy4pvE5lanJyx2tV2ucse94sC00Sg1vDIr6LTHJ1SfzUH7TV4jLrlFQOc+QVWStbC8l3ifG0bwz5lX8AaXE+E8zQMhmk177+akoUNdMitTFiefTESrQWbQpkr1NXGajmuYNBB3oHHETRExpvSsMCTtBrjS6L/TlGhFRQyOPvMH+FrlvkBo4dTdpDfOsTXitxl6nVbsyWmEwXR1QO7Ek5UtENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: samba.org; dkim=none (message not signed)
 header.d=none;samba.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com (2603:10a6:803:3::28)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 17:20:12 +0000
Received: from VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9]) by VI1PR0402MB3359.eurprd04.prod.outlook.com
 ([fe80::9c1d:89de:a08e:ccc9%4]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 17:20:12 +0000
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 samba-technical@lists.samba.org
Subject: Re: flock possibly missing in SMB3 POSIX extensions?
In-Reply-To: <20210226184037.GB94004@jeremy-acer>
References: <878s7aztu8.fsf@suse.com> <20210226181702.GA94004@jeremy-acer>
 <20210226184037.GB94004@jeremy-acer>
Date: Fri, 05 Mar 2021 18:20:11 +0100
Message-ID: <87czwdwm9g.fsf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2003:fa:70b:4a89:f10d:233d:fc9f:58b]
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2003:fa:70b:4a89:f10d:233d:fc9f:58b) by
 ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:20::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.18 via Frontend Transport; Fri, 5 Mar 2021 17:20:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40fa555c-bccc-43e5-faf1-08d8dffaef29
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: i5tk+mmhRc3eLNBPRxibIBw9DQaC6HX9IiBlMVAsOx3AiqpRpWe72F5qXtoSf7W4hPmUzBN7gZ6vNCgGzqY/oSwjLLNAZ9Dc9vo+ZteckE8ciZwzQFjkPEFGUmTuMH8IpFruZ+AF4YWENvf3n3B3BBff+gV0b/c2EfmYVHhPOnU9bKpiMVtCo1d6OdBtSVDFd0HW8mbb60eMEVZvoy5yEivic7btUy69SxVAL7CZ2sao8JiE6HYwFKpHWNq7z0dejkZ73apZg+XUrHEakpqycO3mP0OyzOjcZ2ufY3xFW3xgg69Q9mkxql+eMJ+8w5Gq8QWmwAfzTRhbjXw4F39Dgqf4ON2l1Cd+dk/G1o7hu91Hiory2MlZQz+OklXGvDoB894AygKua04NphbePQUOQ2larhLFl3mSO05m6KYvWvcE2/vE8hDJAK5WqZMug1iNtTJQk8WDwl1uhb3YZVZQ1MZS6aFufuwKCfaM49NQBLnUfJAD5bILH7bNxZks/w2DQ015psmoMFeDWeq8aD9fCg==
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WXJ3QldwYWVxcmJtZG9LdkxFREVkVVc1b216eEZ3alh1VzdQQWdIcGU0cXNQ?=
 =?utf-8?B?bENJQXM4SCs2ZktzY2p6ZWJxZGY2REZzdXVod2pDelZxRWpJb3NVYjRWNXM4?=
 =?utf-8?B?a3I0ZnhqNENpNVdtZzY2T2lOcjNJVGpWMmYzdlBMbS9GVWErcm9HZGtudFA5?=
 =?utf-8?B?ZVZYNUJCRVc4ZVpuNkhTQUM1V2JQRGhyTVUyd095WEQ5VHYrZ0dLV3g0S09O?=
 =?utf-8?B?Y0hZeTNrRlF4bjBsK28xYkZsdFgwNHRaWGFQQzBsZE9vVHVreTAwNWJsRFJX?=
 =?utf-8?B?YlR4TVhON0N6enAzcVZldzJwUy9qMnk3ci9mTFlVV1ZhZWlQblZFbE9IU1ZS?=
 =?utf-8?B?dW9FYlQ3YzUxV21ONWJVbmFaNEtxRitMTzMrU1hZaXptTmdkMnlYOXRMVlZP?=
 =?utf-8?B?YVZsQXV3anhBem5GVzhQRVZFOGU2c3NWbTBSdmlnVmFQTEZrTXpzQ1BuWERP?=
 =?utf-8?B?UHhuVWxPbnhZOUV3aDBhQVpELzJ5SFNwU0tiaVEvczNsVGdPYzF1TjRGSTZt?=
 =?utf-8?B?WkxEWVp0TEtKZ0pPSnc0a1A2NUZmVTF2Rm1JVkVyb2p5aGxDVmNBSTJ4anln?=
 =?utf-8?B?b29BUVRYbmZkNUdVTFQyRjNEK05GN2tIUGlUZk1zTzViQ1lzZ3hPdlRKK1RG?=
 =?utf-8?B?L2Vyc0puaUovdkt5ZHNoSldqMC8zcHpWREsyNDFHa1A0cXp2bndnRU9ZYXBN?=
 =?utf-8?B?Vk9KSGllTytoODRkb0tZcDJ5Wkg3Q0FSZnBQVWJrTEVxcDdCMnZxc3dmUTFU?=
 =?utf-8?B?VERWb0Q2M3dyZ1ErcENSalVUZXFTNHVDTzV0dDgrdS9Dc2E0UTJlQVp5Y1hq?=
 =?utf-8?B?RERmTXhWUEQyb0NuckJRWmNGUTBPYWM4aWxVUlBuRVhUWlNaVVk0L1hIbmlt?=
 =?utf-8?B?NUZMWjRMVzNDb0J6MGhnM1pSRUgvK09tb3c2djZMQUFIblYzQnVrZnVLYWMy?=
 =?utf-8?B?R2xVbkQ1WXpDRnBnbzNZblJyM1BsTG1US2FRUnQ1MUt2eHFZM1NmL3k0MDJ3?=
 =?utf-8?B?NzJkZDdpV3RiR25MU3lLak44YVQ5YmpjT253YmphUXRLTG5RclpkdDkvdzk5?=
 =?utf-8?B?bEdLbktLMEdkTklEVVJHb1JWZmk5b0hKRTg5YmNsajhETmx6RUZ5N2NwRG9v?=
 =?utf-8?B?enJMWVpHOWZJVnFiQjZISUdoZmVublRYQUFqelZUb0tDZXlRMmZDd0E0L1dK?=
 =?utf-8?B?dHBGazlzYjRmTndENUdKM0drK2l2U3hVUnhvTnk0MTZPVkJLdVJudEZ3TzNq?=
 =?utf-8?B?VTduOEFqSjgxNGEvbzRjQlVodHNYQ3I3bU9QL3JEOVRBeWRYdFRpc3dMOFRV?=
 =?utf-8?B?NVRKdWQ5VDFlWjA5NDRwZW9yQWZBWVlwQjJWVU91eTJIaTh6ekZqTEJ0VXhP?=
 =?utf-8?B?M1h4N1A4Q3ROOTZ5U3oyckFFYlA1amx2b3FtMjBnM0lrV29PeE92aTBDNVM1?=
 =?utf-8?B?cEF1czhhTGdyOTRjZ1BlZlVURjlFcGk4Q0NxUmNKeXBiaW9HY2Y1MVYzVW1T?=
 =?utf-8?B?a2pwaVdoVnhEK2dISHM1NHlzR0paTUE5d0ZGVlB1ekVIbHJwUm41K3NRZUxP?=
 =?utf-8?B?Z01RZmxkVUFRZTEwR2NVcmtXN1YrQVgxeU96TjhYK2lnZXNYSWQwcmo0TTNz?=
 =?utf-8?B?QW1iN3BJazRxbUxQdWZwMGxIcjBBbGpCc3NxaE9vWUVSVFM2QjhFQ25OVjY1?=
 =?utf-8?B?Sy9Xb3BXdU1ZVHRCSzF2bHErVlFtRTFOK1Vicmx1WThNeEYzY2NUQjlFd0l4?=
 =?utf-8?B?VWNJVWw2WHg3dkg5RlBya1BNVlEvazdSMmlaWHdHMTd4L3FlZGRoU2hnd3lQ?=
 =?utf-8?B?VkZXWnpLZ0h2VkZNWGVsTmsrNGFITk1QVFl2VVdLU3V0WGpMcWNLRUVQbWRF?=
 =?utf-8?Q?e7UEHfF23tQS+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40fa555c-bccc-43e5-faf1-08d8dffaef29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3359.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtvgDWFxphvTdAZIOs2tG/5jCDTvxRcBzR2bljiA1t7fAgXnDLS88O3MQaQgesbF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for taking a look Jeremy.

Jeremy Allison <jra@samba.org> writes:
>>Indeed, from man 2 flock:

Side node: I've sent a patch to the flock(2) man page to include current
behaviour of CIFS.

> So the plan would be once a file is opened with a POSIX
> context, emulate flock(2) by getting a byte-range lock
> on the whole file. For a POSIX context this is an
> advisory lock.

Ok. I will update the wiki.

> This matches what NFS does, and applications using
> flock are usually not also using fcntl locks.

Matching NFS is sounds good, less cases to think about for users.

> I'd rather not add "special" extra flags to the
> protocol that need extra logic to implement. The
> locking part is complex enough in SMB1/2/3, and
> as NFS shows it's possible to emulate using advisory
> byte-range locks anyway.

Ok

> Of course this doesn't help SMB2+ without UNIX
> extensions, but there are many POSIX things that
> won't work there anyway :-).

If we can make SMB2+UNIX work as well as NFS that will already be nice :)

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, D=
E
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)


