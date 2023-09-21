Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4727A9565
	for <lists+samba-technical@lfdr.de>; Thu, 21 Sep 2023 16:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8eaFicmHRDp6O1Zdbr70ZxlaR/Q3qKqBDIEcltulbeQ=; b=vsZjYjtKIguNarhRXuacvFgvgT
	LYl25QtjH2hO45sT7zTz3E1S5URSitwLysHU/UQZIyP1DH04QHvxHAplt7Vx0HH21hDTNisZPZSDm
	S7rEGPJwnb5vaK6+UXKX5dxq/tm0JBZZ6Ic0ZDx4KQjrQVqCG+rrEF8/WmTJldCDuB9pVOINfFP7Z
	i6mbvZtZ2IfTSWIeYBdXFxb0AHQP2hOPRHhaXMnwrcD4MPp3KU5kokRqr3rwudr/C0EdwI9LFf7it
	4peokuYYPeqIiGLw/vWJGGH717MjCLNo8tVgKO9rCjJugxmj1pkH7WHpURlQHuT15u03l7wIlFFwr
	WDYMk2dg==;
Received: from ip6-localhost ([::1]:44896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qjL5u-005dA2-Hw; Thu, 21 Sep 2023 14:55:54 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16436) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qjL5n-005d9F-MG
 for samba-technical@lists.samba.org; Thu, 21 Sep 2023 14:55:52 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38L9eN5c009243; Thu, 21 Sep 2023 14:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=8eaFicmHRDp6O1Zdbr70ZxlaR/Q3qKqBDIEcltulbeQ=;
 b=Hw1HvKm5qLlrijvEG9U2eWE9Jf5e7TnIzb6C7nTmx8+HuOMzsW4y8EZhsrDZXlakExfw
 Ux57mHbGWF8OU6KtqKG014Pib04rXsMDjrDniTfaEs9OBfP+peCvX4o6o07Y9QS36WWc
 V5aIcsQ10tupXIcgDhAZS9+NpdIAvrk4ocwKOo8AbEYaTj54N1OV/p/7+m1NSkZDNqMg
 X5ha4wyi9q8PDGAIsOK1CRU/9UIM/PZe7tHu9k2eb+vXWRKwaOAPz25CtyU132v4W55E
 DBudOegNfhbYYG3Yz52Zln++H7TJDIL/SgkCyGjb/SFeFSMB3ry+v2vN5Qk77U5t9xJ+ 7Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t52y220b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 14:55:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 38LDhqJ5027126; Thu, 21 Sep 2023 14:55:40 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3t52t8xjgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Sep 2023 14:55:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akDhl3OwW2tfw3tL2uMf42IQrJOfWQTs2FnozM7n0cEJw1+cS7XTBlT37APyfHnogdRDbg+QdghpdyqiO8+pxNxfSmuMIpmiVyCHa/tVKMdVldg1WXNpeEb2od9HBZicMy7ArpEIRTHroFuxU0C3/jOQ3WOUfmcBggduvIrMO1tlp5Aa27Jf1ANxWeqB4zD+bor4mbmaLF/Z3dZ5FFvSsOee43cDgiNtt1+722qxEd3cgDzZ1LU+n5CMl+wY+YecMORn1+LI+e07WXpeirkEvcZ5HtaN7Gzs6tBvoThaQMFcQrX5ga2X+bCr1lBWDdR0OGuAIJlV+0J/03QTMOj0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eaFicmHRDp6O1Zdbr70ZxlaR/Q3qKqBDIEcltulbeQ=;
 b=HNOcxs+Jpj/dfMN4V8Jx4suvszFQ0dWCS/99al7RshEBUWzadgRl6RTJhPjugTKFooYu1ByYkLeaTnf8qdEaYKB1nJ+NXmrJ8CfmbpkS7z0u4XMUp4hyU56UU8UCQQ76dBEjjq0BHdMe2E+w+5uid12CuLxTYd2RnrIc5u6vfXFCyqM1bZ6paIZhdbLHTlQpZVO6RFPwSVw/rFOV1Fi/P3AUi8Egtev+jHl4ibXXqmTTwGcWvyxe4J5f2p0bDh5KKPN8pLC7wsYMFgb9Wi/4RSU7K7gJe0mmn7u8OJLjRxS69SOFHNqrt8gAyQ/AARRlvgcwdbK2cxoTn+hglP5qSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eaFicmHRDp6O1Zdbr70ZxlaR/Q3qKqBDIEcltulbeQ=;
 b=aVbyEbM8fhbe2dykE1PiMCdgq/EZlfEOv9LbXPnYR8YUVg6+Ggimf2Nqhn8mkjNHu6iclV7hhcZE3W9iELdpA4XKTLz5QHQBlEFKNDvQ53qEoAA3M2f+0ijmo0ATFzhTnvrykv4pmekiQ+lrdtBTd8Ehp/myoMmQRAEelixyTBw=
Received: from BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 by SA2PR10MB4651.namprd10.prod.outlook.com (2603:10b6:806:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 14:55:37 +0000
Received: from BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d]) by BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d%7]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 14:55:37 +0000
Message-ID: <f900e597-adb0-7f00-4a65-687c1044f229@oracle.com>
Date: Thu, 21 Sep 2023 16:55:31 +0200
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [External] : Re: How modern Samba handle krb5?
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, Alexander Bokovoy <ab@samba.org>,
 samba-technical@lists.samba.org
References: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
 <ZQwEgdmLKEadm6f5@toolbox> <582f39dd-6963-70ad-98c8-d4b2ab8e0812@oracle.com>
 <3013265.mvXUDI8C0e@krikkit>
In-Reply-To: <3013265.mvXUDI8C0e@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:EE_|SA2PR10MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cf31a1-9e21-426d-ec9c-08dbbab2d0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: NjNkUkCV9ID5Hs/2SEacvZgQ6M3nNFZGwjrRZUcyHkrzPOASDTjAfD6xN566g4GtvK/CmbFG61Q0WjvPrcq2+Tdq5N65QzZd1PGocbA4ziwkpdM+99Zea23PxIOQC2SR2CzxrdYMLBtbnGbyYmLqe/q7CQ0lkk0CA2lxdCRlO4OIkZc/pm8U+4XGJ2Mb0FM5i272Tw2UxgMPyPQxs1ogc1oXkzAkHOPsxMm/PqmZO64nPc4+u/1PSxt552sSiB5zUGR7m4mBZQKRPKLALxMe7bUExbt5QDrS5ii7GYoEoazU6QXw/DBEEkLYwuAwXDfazeLl2C8OkLG9KNy1vYEj1TWi+meqLRta/cXR6KHHFaj89VCjieWJX4xk0kdjmQx3mugq1bzBtHEekWvVz8aqRTP4a+/k6jIBeSUt+lo+URj4H/FQLpYJZcjqRH5xFHO+iyENYbERbP/7ot8/1ZtNg8K7MjB6e8PgMMMBsnIi6ELUN5cfrZiyBWJWj9Nsr3Y/Ks6P2Dh+wcmJzVe00cgpzq99ObW79C7yiRNCajgjAiJnxXSHbIC36z3Qyl4GbJKiH5MwZWOsjWrSkRxwaHXHss4APG6NOKq8NvwuKF9y74EpvOVvjmiM4y35Rpv71w918Sm+pZ23xjbCjf6fMrZmYg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUh6WUpkYmU5ejVmTDhoMEg5aTN1VVdzOFFseDQrNDE1YzNtWStzMTA2TlpD?=
 =?utf-8?B?eWFSek9iOXE5TmtCbjZVVUxwNDE0Wld1Tm1oSk5YNCtGcFpRemU0aExnU1d1?=
 =?utf-8?B?eEw2SjZjTElXZ1YyeUFwKzc3UjNDSU5VTk5UL201RmtOVXd4bDhSTTFXRGY3?=
 =?utf-8?B?dmJvaExKUmtvUUh3MElaWWI5UlR5dFF0WGdQdmx1ci9WdXZvb3dGU3lVTCtI?=
 =?utf-8?B?SnNOeTdFQjBwSTQ3MFNrQy84WjNPV2tlUnVmOGFPVmpRclljRjhrTHdubjd0?=
 =?utf-8?B?aDBzMTg2b3ZuKzlJSHBwcTVpcXNlUXN4ZWhRV2xBclFaODExRU9ia3UrR0Rm?=
 =?utf-8?B?aFFKQ3dXbHNRY0RSMDVjckxuVlEwTlVzdFJiWmxKUE9yUVVjR3pnbHo4RDBP?=
 =?utf-8?B?elQ0dFFKaEhDeE56WUtOV0hhR3VGK3lSSVphcG1WaVoyK0pVaUUzK3Z1a3Uy?=
 =?utf-8?B?MW5wYTA5a29UTHQ4QUVzT1R5Vk1rNE9US1IwbnBmZGJrbXM5QnhjZExKSWRW?=
 =?utf-8?B?WHhEZG15eDFUbTJaemNKNUkzQTFBRTlEZC9GbE93TGRIeUpMYWxWUFoxRXB2?=
 =?utf-8?B?UEdoWll6ZnRuRXg5alZnTlZ3N0R4YXhjZ1pyeERZNC9Mb0U2dFZ5L0dNeU0y?=
 =?utf-8?B?Vk16RTNaWE8rK3NTK00rOUtCK1VZUzB6SVZWWWtZejhHb1JvTTA4V3hLTlly?=
 =?utf-8?B?OTFOSWtkRUQ4VzMweG8yNHc1VVlEbGlWUDhnRWg1YzNQTWdHVG9acEhKektW?=
 =?utf-8?B?WS9FQmtYbXF2KzJlM0tvdEVJZ0FKWUlzL2lHaEtyZzl2RnZKdUJzNS95MC9y?=
 =?utf-8?B?dFhtUVBVWU0xN0t3V3EzRlp4Z281aFNEQnFNclpXWW04eWo1MDBaN3loV0ll?=
 =?utf-8?B?ekRBczZMTTRXdzZzbkpPZGJqVzZjNGRkUWRtYVRQK3NnRDhiQW1JdlFrY1hF?=
 =?utf-8?B?ZjRLWTBKQjF2dGI4eFpabFEzMkxUQXl0eWVHUDVDRUZ6MlV3R3M0YmxaZi9V?=
 =?utf-8?B?K3dPOXNyOWtFYnZKdklpcUErYStROVhhelJITy9sR2QzL1oyNDFxNWdvam1p?=
 =?utf-8?B?MFRWK1EzMkJHOHpvWUtmTE5MZWwzSC9BcVpLd3FqSFdnbWhXRmpEc1h3TDd6?=
 =?utf-8?B?SE1hbWJjTjZXWG9oV0E5dnhmN0dvSUhsd1JoYk9pVDVLdkZYbi85RWhqTmhz?=
 =?utf-8?B?ZUNtOEpDdlRCbGJUdjBvVGN3ZFJMMHZIcDA4WFh6a2taZndjSTNwZmZIY3Rl?=
 =?utf-8?B?OUpqYUl1SGM0RnlqM0tlVDVsVG9ZK0R3TWowRTB3eFFVdjFvSWNiKzlkekU5?=
 =?utf-8?B?R0ZZZ3diZGV3Y21MZHJFMi9hZG1DNklJRUtzUk91ZWdyRGIrRDBKVWxYSXBH?=
 =?utf-8?B?QlFLQTJRWVdPeWN2Y0p4SCt6MVBObzcrNTNSM1c4bW0xQlR3OFcxNERGdElG?=
 =?utf-8?B?akhOY0NIc09xNE9LUll5VUtyK25QUnlVTWUvQXI1VjVnc0MvQlZyRWdDVWha?=
 =?utf-8?B?YzdDekZpTjIrZnljbjZSSmtMTzlFYTNCc0k3RldRaFp1WWsxeXcxclNtTjVI?=
 =?utf-8?B?NFk0ZDZtNVp2T2hZWUtYczZyVlZ3RTdYODB4V3ZFSm5kb1VtUmJ4ako3Vzd6?=
 =?utf-8?B?OHFjQWtVVUhRUFNlNGhnTFJDUVVVN01PbmZIL2Yzd09DZ21qOWxLcnF2WkZk?=
 =?utf-8?B?a3RhVFZXTTA1VkR5aTZhQmx6d1ZEUzVaY001bkFibElqem9tUkhTcENBT0Vu?=
 =?utf-8?B?ZGRjdTdmR3F3MEFscmovTHNuNm9OWkEyWndZSG1sa1pSQVlLRU5JdlVTaXls?=
 =?utf-8?B?QUhEdU5TbU1XYy9WMnJDVmpnVC80eVhJaG9qUWJ1ZE9SQ1o0cW1zbUZ5M1Ns?=
 =?utf-8?B?TTFXam9EL3ZvUTVlcnp5WEpjM2lpSHhBRUNsNlhlVXdPc0xXQ1BqRDljZG5o?=
 =?utf-8?B?dEdzNERjbGhYYmVJUHE0TkYzRVpNd3RIaXJvb3M4MnEvR2s2QXRUeVBVLzgv?=
 =?utf-8?B?a0owWURNZ2NrajlKUi8wcFRpa1lsaFdVZXFxYzhoTk9MQ1NqcjhaZk1idHFD?=
 =?utf-8?B?eGZLZlhXWUJzd3AzRStadmpRYVV1QnRNd0Z2ZnlvUWR2Mm5kM29LcXNRbVF3?=
 =?utf-8?Q?uJknpf2J5WQg513ubJvLQhQ/b?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mNK+qbzP9l8OcST55XEwzNAXjPPwwZIE6S8VUu4avdKHkNc5gasUlbdBqKfvRiCvAOIpj1MenySIWT2h8cNtx6l85Qvd7WLJN6YQ/baNl+jwXuRr29xN5dtniCNXEFKCrd2TRfQLVlnLF6MnRmu7afI1j+VZ6FIX+3AhBbYxF7hvi+cr7fAFyKFnnF29Qf1XrGPJCwWwcyd3h2mglVwedjMv13QgFP/Zv2YXqhf9dUsSgnVUcKwyZnRp8HC9u3T5HjxIq3GN4t9KEn+bi94SxBr/1mZfcWUg7I+le2JyOcK1/X/5qY9WJb6CpEr/HRXClQnHMqvoPhbcgFcRjyHyxAYmwCTW7Pg4F1y8/5yUWXGxM/oVbeWf6I2scgNiapkewbV/jc7XepRyhtSVhbi3UGsG2at/F7UTouvY493t04o2HL/h3TPSvQnuSfdRWBNw8hzvRatRBzbds7/iGLl27QDgjvJm2MpwkNbxBn35+3n3Af/eEp24Nq6xIOKoXS9BzRquvhmkRqWdYO7K/ZcEqHX5+CA5HyTscwqe2UYbbVbHjoGFLNU7m45uW5J4wmS1an9orNBR/WioePbXCvMflJcYUqhgTymbEVcyDMPChnvJN8KEACVMhshmnByuCk7017iJMfcObvK6jCbFUUm7xjoGSpKx+xp7Gqtig4sl2Rtp5ZwOucuh0rRBn4qvrSKMt+GaZ4HFkwNBIlPA/sOfTYilNTBTSJD6aMYA0cuLQitv2dq1ORqh3WXotHjgcd2sWjR06rO6Zk0DgbejJCdFq1FIvLQYFH9gtr2IVIccZFs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21cf31a1-9e21-426d-ec9c-08dbbab2d0ee
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3842.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wj4qv33pefct0vpUrqNFdNceFknDTScu4FTMquzLMCgU+c+sYSfDl1SoA+rpnZDgBNgTDpzY70WLLEGZ/oy7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4651
X-Proofpoint-GUID: sMVYqdszTSFbXQ8G0lEeTy4m2XSDftSF
X-Proofpoint-ORIG-GUID: sMVYqdszTSFbXQ8G0lEeTy4m2XSDftSF
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
From: =?utf-8?q?Ji=C5=99=C3=AD_=C5=A0a=C5=A1ek_-_Solaris_Prague_via_samba-techn?=
 =?utf-8?q?ical?= <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?B?SmnFmcOtIMWgYcWhZWsgLSBTb2xhcmlzIFByYWd1ZQ==?=
 <jiri.sasek@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 9/21/23 15:53, Andreas Schneider wrote:
> On Thursday, 21 September 2023 10:57:51 CEST Jiří Šašek - Solaris Prague via
> samba-technical wrote:
>> Many thanks for railing me back, Jiri
> 
> man krb5.conf -> dns_uri_lookup
many thanks to point me there

> 
> It can be set to false ... ;-)
it is set to false in (system) /etc/krb5/krb5.conf

but Samba creates own /var/samba/lock/smb_krb5/krb5.conf.SMBSETUP :

[libdefaults]
         default_realm = SMBSETUP.CZECH.SUN.COM
         default_tgs_enctypes = aes256-cts-hmac-sha1-96 
aes128-cts-hmac-sha1-96 RC4-HMAC
         default_tkt_enctypes = aes256-cts-hmac-sha1-96 
aes128-cts-hmac-sha1-96 RC4-HMAC
         preferred_enctypes = aes256-cts-hmac-sha1-96 
aes128-cts-hmac-sha1-96 RC4-HMAC
         dns_lookup_realm = false
         dns_lookup_kdc = true

[realms]
         SMBSETUP.CZECH.SUN.COM = {
                 kdc = 10.163.87.58
         }
         SMBSETUP = {
                 kdc = 10.163.87.58
         }

is it possible to avoid it?

Thanks,
Jiri

> 
> 
> 	Andreas
> 
>> On 9/21/23 10:53, Alexander Bokovoy wrote:
>>> On Чцв, 21 вер 2023, Jiří Šašek - Solaris Prague via samba-technical
> wrote:
>>>> Hi Experts,
>>>> While sniffing packets I have found "net ads join" and "winbindd" handles
>>>> krb5 by such strange way:
>>>>
>>>> No.	Time	Source	Destination	Protocol	Info
>>>> 47	38.477244	10.163.87.117	10.163.87.58	KRB5	AS-REQ
>>>> 48	38.478496	10.163.87.58	10.163.87.117	KRB5	KRB Error:
>>>> KRB5KDC_ERR_PREAUTH_REQUIRED
>>>> 49	38.479156	10.163.87.117	10.163.87.58	DNS	Standard
> query 0x439f URI
>>>> _kerberos.SMBSETUP.CZECH.SUN.COM
>>>> 50	38.479597	10.163.87.58	10.163.87.117	DNS	Standard
> query response
>>>> 0x439f
>>>> No such name URI _kerberos.SMBSETUP.CZECH.SUN.COM SOA
>>>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>>>> 51	38.479833	10.163.87.117	10.163.87.58	DNS	Standard
> query 0x0e56 SRV
>>>> _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM
>>>> 52	38.480165	10.163.87.58	10.163.87.117	DNS	Standard
> query response
>>>> 0x0e56
>>>> No such name SRV _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM SOA
>>>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>>>> 53	38.480366	10.163.87.117	10.163.87.58	DNS	Standard
> query 0x50be SRV
>>>> _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM
>>>> 54	38.480658	10.163.87.58	10.163.87.117	DNS	Standard
> query response
>>>> 0x50be
>>>> No such name SRV _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM SOA
>>>> win-lqmsb4eue0v.smbsetup.czech.sun.com
>>>>
>>>> ...where Add-DnsServerResourceRecord do not support URI RR-type and also
>>>> the _kerberos-master is not commonly supported in DC. Can Samba still
>>>> work with Windows/based DC?
>>>>
>>>> Older Samba releases were able to respond on err: preauth.required by
>>>> preauthentication so I am curious why the modern Samba will fall into
>>>> such
>>>> madness in such case. Is there an option to rail even the modern Samba
>>>> back?
>>>>
>>>> Note: on Solaris I am pushed to use MIT krb5 API where my attempts to
>>>> build
>>>> Samba with Heimdal to check if it will not work breaks on conflicts with
>>>> system headers.
>>>
>>> URI-based discovery is part of MIT Kerberos handling of realm and KDC
>>> discovery. Added in MIT Kerberos 1.15 or so, in 2016, to implement what
>>> was later transformed into
>>> https://urldefense.com/v3/__https://datatracker.ietf.org/doc/html/draft-i
>>> etf-kitten-krb-service-discovery__;!!ACWV5N9M2RV99hQ!JvbS6_IjJ09-nGc1XUuY4
>>> c0iwfiGYV79OB_gjoMan2IRb2ov-cFNsdc0nJvXtsxPko2rWYKUhQ$
>>>
>>> It has nothing to do with Samba and in general Active
>>> Directory implementations do not support URI-based discovery, though
>>> they probably should, for MS-KKDCP implementations be better
>>> discoverable.
>>>
>>> We use it actively in FreeIPA.
> 
> 
> 

