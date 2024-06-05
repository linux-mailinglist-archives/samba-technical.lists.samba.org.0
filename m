Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E678B8FD1DB
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 17:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=haXZjV01txwnDFk99CNrXmQcXqnT580tq9VvXOVSe0o=; b=Q1BOKw4cVqZH3EcX2U0Axc084g
	QUDUhfbx0nQpuJ3TH+5eT0DCuJX+6j0Ys2qtgaHII4BTW313lBtcZmF+E5rnh+7cjRMKWULMIoyU/
	NDrTBgtgWf0iXdFDMJPNt6p1w4nQ3ZeOLYRYqbHsTd15vcLDcImM2AYd0pnRaKx3i6Qc43VUStPQV
	q5aDbZQcP7affyLUD1kMlm0XIDD8a2o+ZNx7UFAajNvjCoZSreAhNza8hm5oFHBUN6XEfnZdCyohA
	/rIzdfCffvlm/wb9r2VrpQzPFxAVpeLRNfLgLQvd79KbERvYVzFPgFVC7mC2NqCSs2eIDKSiyBnZo
	ytD//P1g==;
Received: from ip6-localhost ([::1]:49472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEsl5-00CjwW-3p; Wed, 05 Jun 2024 15:41:03 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21064) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1sEskw-00Cjvg-GS
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 15:40:59 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 455CRopJ015747
 for <samba-technical@lists.samba.org>; Wed, 5 Jun 2024 15:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type : date :
 from : in-reply-to : message-id : mime-version : references : subject :
 to; s=corp-2023-11-20; bh=haXZjV01txwnDFk99CNrXmQcXqnT580tq9VvXOVSe0o=;
 b=RYhzrBf7pQFhvsLu1MeL+fBjbmNSx/iJCI1VUvk14Jbj7ZDvT+cbgt/5p6sCCY9GXFV3
 muJHaZS3mhy2lFYp19QbzS1UfboIAQiWPX9KKXVqc8y75fpB2FaWQGVayilZFVBvCDBh
 QmYVblXwizmQwosvwcQR/SICPkqkOtjNdtekrzOFxN30y4ILztptxjGM6fBmkHqaJ8z3
 HXkSYmog7sySzsODulhDxQ+xu4GhrqMdMyOx1O8WyDxYtR+wLeNmK8U+Fk/9PqecV6Y9
 UtnDLNyvaqqDnteolUMl0KinWrVhbRzu8QSddLhtrIg/P3jy6DAigxlnl/SErbeCGVbV nQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbsy9kg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Wed, 05 Jun 2024 15:40:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 455Eisb1023914
 for <samba-technical@lists.samba.org>; Wed, 5 Jun 2024 15:40:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrqyent7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Wed, 05 Jun 2024 15:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJI4BAEOc8BOB8Ud37jsSQcOa5HKu6dIM9LtioLaFdHe68zU3yA9Y6Mr1hzMGv7LdB1+jShcDXeGpoxu/HnMiHs6bSATA/QktH1zGkEfqRjtVWGxtKD7bjJe9crTR2mM61F5cCs7PRgDBsgvvspL9MQFwwaMl/2FpsuAGBCL8E0QUrFKVYhFYUGwM1gxcuKcSR/0fEf1kbXjw9FFr+q2idEbUpgXsZwDfO4L4jZ7G/6o+ewdvaKZ2MFA240qGL++qOr4l2NnVBNP7AnENXdK2Hu0t1b5ATnvz1Fqfiq2q4K7Llz4X0i7WIeX3HiRzR0ItwRGXYxupIHXi6FLfAckfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haXZjV01txwnDFk99CNrXmQcXqnT580tq9VvXOVSe0o=;
 b=LvfrW78iZOETukA2HxhUDc8wiMT4rerCGGUrXwb8lfH6l4DkQQwR4awpqn/nonBlZHddwy4Bn9zZe6DRcDf5KR7z/8ASSzDzxQvE5f9Jiiatg4yId8UEOQLnLZ7olD+MzJcVPQqXnGVPcKAjFow3+f3Li1KXdqpb5GJygBSsJ0lPF7bwGrOhlFOfjfD7DWVjQSL6OHzn4dkGfTbpZ79z+62UwncSIuXZcDjjtRZZx2UVErBfUlg59ln7Yu5SNEaXwuNlszSoN0VToP6wXv3jheQwfCFcUFDwKqoS/Uk3P06zFTXEu85KJgNP8/mf3cEVSo+bSE6o+AHKIRjA+UybBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haXZjV01txwnDFk99CNrXmQcXqnT580tq9VvXOVSe0o=;
 b=pCNIKWzH2SGNOR+geXSYmK7nJ0Al2J3rwLHMGaoH0m86Fa5/zWBis98TmDA1ur2zCiT8OREqkhZx6QCsxJ1G1mkx/YaAV/CzdXYZWuGUX/glcbt9BxKB89hye4peY2fywHDbynvJsIXEOM8RCzxtdC/NLKtYRtrePeoeOqAH+vY=
Received: from DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) by
 DS7PR10MB7322.namprd10.prod.outlook.com (2603:10b6:8:e5::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Wed, 5 Jun 2024 15:40:36 +0000
Received: from DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77]) by DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77%5]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 15:40:35 +0000
Date: Wed, 5 Jun 2024 17:40:11 +0200
To: samba-technical@lists.samba.org
Subject: Re: missing krb5 dependencies after recent changes in nightly bits
Message-ID: <ZmCG254bAl-mvxIt@ultra>
References: <Zl4Dh9XZ2XsQWROD@ultra>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zl4Dh9XZ2XsQWROD@ultra>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB5943:EE_|DS7PR10MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ef8800-a1ae-4cbd-1495-08dc8575d75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDJXSUg5YWRuZTlxeDRycERQeWtBeDhZWTEzOHdFaktnZGc2cWZtT2NkWFIx?=
 =?utf-8?B?a2NyL21pRnBBR0hzZ0szZ21ZRTNSSFVFVTFtdFdxQ0Q1UXAvSmdXVkx6MHpG?=
 =?utf-8?B?ZGJsOUJQSUlyeUNQeExwNXJ4RjBuWDJxamNENDRGVFNFMnVRNXY4Vm4ycklK?=
 =?utf-8?B?YUw0bzhZcmh3SDdMT0RKSXdkazA5WGdLS25hUXRUdlhGeStmRzhSMlVydjNl?=
 =?utf-8?B?ZnRvYzlJdzhWOGdMSTluRjE4NUhxelFML3lSZzNCTnVpRjNub0tPb29uVExx?=
 =?utf-8?B?aVBLNXFmU28xMkZhUnlLcmJBNWhDb1A3RE1xQ0NXczY5Qy9qYlZOVlZZa2pw?=
 =?utf-8?B?RlRRR2ZkcFRpc0F5UENKRE45TS9CNkphbzBmcmJkTEY0SlVUeHkwWlhCdGg1?=
 =?utf-8?B?cXRkRGFUM3FjK2pUVkNqS0ZwYWk0ejhYMnJtdHpyQ3NUNnBydVl1WEU0SXBm?=
 =?utf-8?B?R3BMY1ZEYVhUaVRMd3pGN2g1RWYyVVpvbDZ4d2xCeGtOM2Q1RlBlQmN1YjJR?=
 =?utf-8?B?bXdqY2RBQzlTVGhqaFJtVm8zOTZwV3RjaEVhUkl4dDhYSTZMbzZ1VVhySWZa?=
 =?utf-8?B?SXZBOGFqOG9zMmRxZkY1bS9OeW13dUJHL2kxNzM1ZjVlcW8wQ3hlZElYalJa?=
 =?utf-8?B?MWJ2ajhXWDhab2FNV2EydVZOUVlHQ24vYUlRc1pmRWFJc0ZTdUI0UktMVDk3?=
 =?utf-8?B?b2dzUUd4MkpQcExhaXJqY2xqRXR1VTAxQmwxRE9EdHpLL1RpUDFwY3BxRFhK?=
 =?utf-8?B?NVI0R1Fwemg2eEZtbkR1VVkzeTVpUkY2NElZMnRHbTE0OW1HQ2owMmxPczVP?=
 =?utf-8?B?NjZLQ0tJWjdUZjBRWGc4anppU2NYczJzbWd6VTJFeG9EK21DNlBidGhROHdW?=
 =?utf-8?B?V2pFYkxjQWNOMkY1VzZFMFJ2bVg2bVBIL2VpRndvOWtBY3dMZEZjcVJJa1RS?=
 =?utf-8?B?dlVSU0kvM29hRXpaaUtFWDRUOXpQNXYxek5BQWZlRWhYSUtXT3lnMFRGNFRZ?=
 =?utf-8?B?aVRPeU5TZHJoa0k0TVhNNVhZVlFhYU5WdXNsekQ3bXJMZmxvUVpSNUNuLzNk?=
 =?utf-8?B?MG13dktIMzh2TmZCaUxwNDdkQndFVEJsK0tSRmtMRmp2ZXo2VVB2S0J5Rnlj?=
 =?utf-8?B?UDZnZks0U0ZscnNOR3IyU25sbTNvdXhXMnN5TDFFM2FuV2RUT1VaYXNqWjl4?=
 =?utf-8?B?T1A1elc0NGIyVGV3SmtUWkk4cGVpdU11SkNrWmlaMzFVcThydGt1dHZyOHUw?=
 =?utf-8?B?dkx3WlJVc0h5ZG5qWkxGSXExOVN2dnBlZkNTODVGYVQxeFZkcEhWOERxSzNJ?=
 =?utf-8?B?K0tOb1JldGpwZ1J0QnYrWFZ2VEdneGxteEM4YUluSldGcWZqZFdtWTJMN3pj?=
 =?utf-8?B?bHlSZXpkQkVCZkNFb0ZxSm5BWWlwbFZPNmcrMjBIQWRlMnhHeWp0Nmx1a0Na?=
 =?utf-8?B?Q254WFNmMEU2Uk93Tnh2NWt0MmpwMjNBWm5nb3pwZFVoL1Jndlhad2pmM1VZ?=
 =?utf-8?B?WTZ4YzVhdVhpS0dhWWRpa2NPTkZYWDJHalN0VDljM3dnWlJsY1FKTm9kUk1o?=
 =?utf-8?B?cEVyeS9UT0l3VVR6dURid1FtZFY0MklJYi8xdlU3ekF2NnllM2NyWXcxMG9Y?=
 =?utf-8?B?UERyY2lqL3BwcGkrVW9SdDVKWHl5ZVUwWlRJdHJWZ1M2aTl5U0FkRGw4VDk3?=
 =?utf-8?Q?hlpBEySuckrEl0oQQiXK?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpTQ25ObXRlcGpjTzZlUTA4eGxNWnZMOHhJNU5ZZk9PRHQyMkNENk81WTVp?=
 =?utf-8?B?STBVaTExVlhSb0NNT2hUWGdORGRTYXBkUUdKQTZBbmpTWFQ3ZnRCZ0VBeWFY?=
 =?utf-8?B?ZE1wZGpQdWhZRjFmbHorL2E4NU94V2lhR3BkS0FSRHQxb284VHNIS0czd3VQ?=
 =?utf-8?B?MnIwRksvMVFjTU9iRm83SE9lVTIrSTdUTEhhdjVDNlJoOXd5NnNqNWFoV2Vr?=
 =?utf-8?B?RnBSdFhMQnpwc2p6SmZpZXh1eTloZUdwUGNaQWtRS3M1SXBkNDY3VkpEYUF4?=
 =?utf-8?B?Q3JUSWVmb0ZPZHZ1VTFJd0QyUUJzdU1LT2o5YmEzZTBTMThQcFFlVmxzM0Vk?=
 =?utf-8?B?aXJTaWR3ODFuMFJmT2RiRlBHK0JabFQyYlRxMCtKRjNpMHVCNW4yUzdRTnBY?=
 =?utf-8?B?bCtVZDkrVUxWeWU5ZU9YQ2JXdy94cENPUEgrV2xHdHUwWW8yMUhPREJLT3lo?=
 =?utf-8?B?UUFsWHFmQmxoSk02V2MzN3FIQkRoVEhQV1NNMzdJKzZyd2ZabFQveFlua0sx?=
 =?utf-8?B?bENVcllrSUhQVjB5eWVxZ1dWY1VKSWVuam5SbHpUVkNucm5oRTIrcWIvYnFm?=
 =?utf-8?B?YnBUNTRRSkJqZ29pbnhiemtoVWlFTGJLbS91OVdwaTlDVU5XRWRQNmtydmEx?=
 =?utf-8?B?cDRrYjJ0Vkt2ODJEeUF4S0ptSjE2RlNzV2VxcnE0c2V2THd5d3RuaTFEdHh5?=
 =?utf-8?B?TDR5Z1VvcThjcHJJZzRjeENlbk5hYnlNcHVYM3BBSm1QSEpMNzdva3BZcE5v?=
 =?utf-8?B?Y1FSVWkwY2QrNEN1UlRMdGFacHNVRUZjalhpL1ZrTWF3RVY3dDBTcDdTZDVT?=
 =?utf-8?B?WVF6dW1nUmFrYjI1UU9FTys0WTFLUHdjSytYbmwwd1dZSlpCaHlLM0xUMWVt?=
 =?utf-8?B?Tjg2NExveGg5dUwrMFdNVGRMWWt5SVhSRHNTVktEeEhnQlZWSVNrTU5CblJv?=
 =?utf-8?B?MDVHaVVGNUNUdG9maUM4SGlGdVJtN3RyUlcrcGk1ZDJYZ2JaVWpBczF3MC9B?=
 =?utf-8?B?QkVxL3c1ZjJLTUtvQWxxNXNKMUN5dnlDUk9IaURDQjVzM09GeUxlNU0zRElo?=
 =?utf-8?B?TVNFSVErVHNCNnZGUmFGaFNhUWxpTFIvTldhNkJFcG1MYkZYVEgxbTQ3OVJ2?=
 =?utf-8?B?SGNrcGFubStjS2laZ3l1TkdSMnRMZGVZRkYzdWlIYmNKQnM2UVNOemNBenhE?=
 =?utf-8?B?cXh3bzFVMktVQnExU0VJdHRDcFA1dmhjWEM2R2xrS3ZrSnhXa0NNN3BaRk52?=
 =?utf-8?B?aHE2TFBkNnVhKzAwUEJEVllURGU2Y2hOamFiOUZ2L3owTm9QZnBkUkZ0dW9D?=
 =?utf-8?B?aDc4OTRJWWd5YUJYTnVobCtMYzBKWGYvd29OTGZqL0FCK2NCN1lWT3VoSDgz?=
 =?utf-8?B?UzhDalZDV0JmV1JucnZuSWNzSEQ3YW96N3lTVFp3UmxUV0Vhd0ZNbDZVSm0z?=
 =?utf-8?B?VVVlT2dudU9vdVArZGtmMlhuZWdseit3ZjkycUpRM21tQmh6WTZFd3d2ajNa?=
 =?utf-8?B?dExMVFRYaDhjUklBcFh0Y0FjVGt5S1lRWmM4WFIwZmNRVldhRHlTOGw0R2g3?=
 =?utf-8?B?VEE4SzJtZ1QwU2VLYmxXYmR2UTU2dUdJbkhNRmNKNUlOUElLVUxTMDA4WW9v?=
 =?utf-8?B?TDBwT0s5UGo0aDdxYzIvT0Z6Q2Z6SnJqRXd6MjQveDM3ZVFYaURqaUcxaUo2?=
 =?utf-8?B?aG1OcURwM2RJV0JoMnhhVURxaUU5RVk4WWo5a3RoUlVPakVDNnNuRTFhdnFR?=
 =?utf-8?B?dldzK09WVmd3c3hmSnJCK3dhQ1RYekhWbU9KaHV3aEI4MmtZcmJ5aTAxZ3g2?=
 =?utf-8?B?SzZmVi82T0RsUzBpcHlUakRHTDVwaUZaZ0lvaHJ1b2FjZjAyNXVFWnRHaUJm?=
 =?utf-8?B?Z3IrTmZYVW8zUkVFTmlDTGJSWUNCaXk4TzJxVlgwVDhMaHFPa0QzOXgvbEtV?=
 =?utf-8?B?bXZyU1dUbmtLZG5SdG8yVml1a0h2ZVJSSHcxcXVQOTJqTWNkZzZMYXFhb0da?=
 =?utf-8?B?allkRERkMEN3SWNnRHJDdkU2cmZzaWhYdDR1NGJRVzVPZmxEUjAwb2Z4SnYz?=
 =?utf-8?B?SnU5UEQ0ZktpWHRuZGN2K1pjd205K1Bud0tvMUZlcGJRbVRnL0dFQ0p1YStK?=
 =?utf-8?B?UlF4VGsvZWo0UmJkZGZLVWpsd3VCM0UrZGtlRTZGb0Q3MEN2WGRvbFpTMEVP?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: m3CDSzTnoIgDPboaSb08QFtlOFj9sSx89iMxs67sf/cUxQ/JbyW08mByImDlGf3+2soP6W1PeKUZI7m/zYU1eMVssqBvjTEqd43XlBx8oUR4EqIHCtMRpLRjwuVJv0CF6oDh22FSCJaNraw7nEd86XGmJpPlfkuBAletBIfeb+A2gtuMLi8hEE2nRZza0r1q8IZ78LSMbaKL7R6dIgBlCOfuoMG8qQDzpxNTlRxA/O29g902PObBdKBbpr5dgbJnColzMzwLFdE0ER4S+qZI6SvK91czau47E6N9gMcMsA7t1tw1LphmqHCoagfLDL94mUFINNwqHmnWwCAsZQHa3aNdTGEuVybOWyVaCcsYGvvNIEt6eRhypcCpDAYkTlGI2YyxwEejovND69cDCft7QCCmapTeA53w6VNqgm1wGeVYW2+I1Ik+ssfp3JP1SjGfr+UEblNiwHthxNpCnnZ8FCu2WaJNh8Z1PuoGoebGlM9lvIRJGK93hY2OHZRZ34kSkLTmmgcD2yWGpfWYmP915q0McgDfMTy3XXCI+x3gdKOI23In8q6yH/ngRAMjLMaIxkZ1FwV27gCaIvQH7jCZXk0AhY4E5QrbkPz/1+MdEBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ef8800-a1ae-4cbd-1495-08dc8575d75e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB5943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CcdfAV5/048pl0zNFeEk/0bGgLaAwNpHW993O5tJfF2lvELruH0Q+6wy7EUBJ1oKd8LCZUbkdOqad7xNEJDMwG5QvD3XD/4Df77bf0rb0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7322
X-Proofpoint-GUID: H-ewWOzbA0j93ZG6WN51Cm9d2yRlwgc5
X-Proofpoint-ORIG-GUID: H-ewWOzbA0j93ZG6WN51Cm9d2yRlwgc5
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
From: Vita Batrla via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vita Batrla <vitezslav.batrla@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I found the changeset that introduced the regression.
The git bisect command says the culprit is:

$ git bisect bad                                                                c95a2785e209cbd0fcec5f6a553a95e12ff19fa1 is the first bad commit                commit c95a2785e209cbd0fcec5f6a553a95e12ff19fa1
Author: Stefan Metzmacher <metze@samba.org>
Date:   Thu Mar 7 12:03:05 2024 +0100

    lib/addns: rewrite signed dns update code to use gensec instead of plain gssapi
    
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>

 lib/addns/dns.h                  |  18 ++-
 lib/addns/dnsgss.c               | 240 +++++++++++----------------------------
 lib/addns/wscript_build          |   2 +-
 source3/utils/net_ads.c          |   2 +
 source3/utils/net_ads_join_dns.c |  86 ++++++--------
 source3/utils/net_dns.c          |  94 +++++++++++++--
 source3/utils/net_dns.h          |   3 +
 source3/utils/net_proto.h        |   4 +-
 8 files changed, 200 insertions(+), 249 deletions(-)

I suspect this change in lib/addns/wscript_build:

@@ -11,6 +11,6 @@ bld.SAMBA_LIBRARY('addns',                                    
                       error.c                                                  
                       dnsquery_srv.c                                           
                   ''',                                                         
                   public_deps='samba-util gssapi ndr resolv dns_lookup',       
                   public_deps='samba-util gensec ndr resolv dns_lookup',       

This snippet caused lib/addns to drop dependency on gssapi. My guess is
that since this changeset got integrated, the build using MIT Krb5 fails if
the headers are outside of /usr/include in a non-standard location. That
might be because .c files that include "dns.h" will indirectly also include
"krb5.h", but they may miss the right CFLAGS. The right CFLAGS might have
been pulled in past from gssapi dependency, and gssapi pulled them from
krb5-config.

Does it make any sense or not?
Thanks,

Vita

On Mon, Jun 03, 2024 at 07:55:19PM +0200, Vita Batrla wrote:
> Hello,
> 
> From time to time I compile Samba source code from:
> https://github.com/samba-team/samba.git
> 
> - it used to work few weeks ago
> - it doesn't work as of today
> 
> Please find the error messages in attached file.  The build system is
> Solaris and it uses MIT Kerberos libraries from the system. The krb5.h
> isn't in a standard location (it needs to be learned from krb5-config
> binary). This might be a difference.
> 
> Is this a known issue? I attach a patch that seems to fix the problem.  I
> would be glad if someone here can check the problem and fix the code if it
> is not yet already fixed (not synced to github clone).
> 
> Thanks,
> 
> Vita

> [1119/3103] Compiling libcli/netlogon/netlogon.c
> [1120/3103] Compiling libcli/cldap/cldap.c
> In file included from ../../lib/addns/dns.h:30,
>                  from ../../source4/libcli/resolve/dns_ex.c:42:
> ../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or 
> directory
>    33 | #include <krb5.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
> Build failed 
>  -> task in 'LP_RESOLVE' failed with exit status 1 (run with -v to display more information)
> 
> 
> ....
> 
> [1203/3103] Compiling source3/libsmb/cliconnect.c
> [1204/3103] Compiling source3/libsmb/cli_smb2_fnum.c
> In file included from ../../source3/libads/kerberos_proto.h:33,
>                  from ../../source3/libsmb/namequery.c:33:
> ../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
>    33 | #include <krb5.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
> Build failed
>  -> task in 'LIBNMB' failed with exit status 1 (run with -v to display more information)
> 
> ...
> 
> [1948/3103] Compiling lib/tdb/tools/tdbtorture.c
> [1949/3103] Linking bin/default/lib/talloc/pytalloc.cpython-311.so
> In file included from ../../source3/libads/kerberos_proto.h:33,
>                  from ../../source3/include/ads.h:79,
>                  from ../../source3/utils/net_proto.h:26,
>                  from ../../source3/utils/net.h:183,
>                  from ../../source3/utils/net_ads_join_dns.c:24:
> ../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
>    33 | #include <krb5.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> In file included from ../../source3/libads/kerberos_proto.h:33,
>                  from ../../source3/include/ads.h:79,
>                  from ../../source3/utils/net_proto.h:26,
>                  from ../../source3/utils/net.h:183,
>                  from ../../source3/utils/net_dns.c:23:
> ../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
>    33 | #include <krb5.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
> Build failed
>  -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)
>  -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)
> 

> diff -rup samba-4.19.6-master/source3/utils/wscript_build samba-4.19.6-master.new/source3/utils/wscript_build
> --- samba-4.19.6-master/source3/utils/wscript_build	2024-06-03 13:10:11.000000000 +0200
> +++ samba-4.19.6-master.new/source3/utils/wscript_build	2024-06-03 19:39:18.683596593 +0200
> @@ -9,7 +9,7 @@ bld.SAMBA3_SUBSYSTEM('CONN_TDB',
>  
>  bld.SAMBA3_SUBSYSTEM('DNS_UTIL',
>                       source='net_dns.c net_ads_join_dns.c',
> -                     deps='addns')
> +                     deps='addns krb5')
>  
>  bld.SAMBA3_BINARY('profiles',
>                   source='profiles.c',
> diff -rup samba-4.19.6-master/source3/wscript_build samba-4.19.6-master.new/source3/wscript_build
> --- samba-4.19.6-master/source3/wscript_build	2024-06-03 13:10:11.000000000 +0200
> +++ samba-4.19.6-master.new/source3/wscript_build	2024-06-03 19:24:17.763401587 +0200
> @@ -908,6 +908,7 @@ bld.SAMBA3_SUBSYSTEM('LIBNMB',
>                            addns
>                            lmhosts
>                            resolv
> +			  krb5
>                            ''')
>  
>  bld.SAMBA3_SUBSYSTEM('SERVICES',
> diff -rup samba-4.19.6-master/source4/libcli/wscript_build samba-4.19.6-master.new/source4/libcli/wscript_build
> --- samba-4.19.6-master/source4/libcli/wscript_build	2024-06-03 13:10:11.000000000 +0200
> +++ samba-4.19.6-master.new/source4/libcli/wscript_build	2024-06-03 19:22:02.200073053 +0200
> @@ -65,7 +65,7 @@ bld.SAMBA_SUBSYSTEM('LIBCLI_RESOLVE',
>  bld.SAMBA_SUBSYSTEM('LP_RESOLVE',
>  	source='resolve/bcast.c resolve/nbtlist.c resolve/wins.c resolve/dns_ex.c resolve/host.c resolve/lmhosts.c resolve/resolve_lp.c',
>  	autoproto='resolve/lp_proto.h',
> -	deps='cli-nbt samba-hostconfig netif addns'
> +	deps='cli-nbt samba-hostconfig netif addns krb5'
>  	)
>  
>  


