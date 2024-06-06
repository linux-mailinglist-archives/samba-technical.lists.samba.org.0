Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE598FE3D3
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jun 2024 12:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uwFZKJFsIt+AaK6obnsY0HHwWdbkqNw98Ie+ChXgmU8=; b=Zo3KF916RShbMFK2k7ozpUDlDW
	rXAzJjiurwc5Suv9YNnl8rdc4oZgRnaUDdt951f/M27xmX0qC5zRpTMGWcP1+j3WFjI1HvpmvK8S6
	Aq0NM65dgHjL4w7NHrUEoTU/8HXZ+gnl/96hcCF3Hu0Rksr0smeSSBsdpS+p4QkPaYmRFGiA+SOP8
	V0guHtGxVn3mEqC40VKwTvf79sqIq9e/lJDyKzWHf/WuyzWpiV2hlNSVgh6d/uhj5h8+9xGcj14sZ
	Ub//MkPmqOdS38j1MA+eFz25heaHXD9iq5h9Tev17pO3c6aVjk7zmLlD8EgsjNzc3hdI2ZYWpn7RV
	uuy70j+g==;
Received: from ip6-localhost ([::1]:39532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sFA3w-00CqmJ-Ka; Thu, 06 Jun 2024 10:09:40 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58348) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1sFA3q-00CqmA-GY
 for samba-technical@lists.samba.org; Thu, 06 Jun 2024 10:09:37 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4568iNQD020237; Thu, 6 Jun 2024 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=corp-2023-11-20;
 bh=uwFZKJFsIt+AaK6obnsY0HHwWdbkqNw98Ie+ChXgmU8=;
 b=L3eIINWEpRVHkjUL+9tD+gmiOK3cU2oZPSrMc9784ugG5CWHLecNIDlGBxCe/gUiNEmg
 9irZtLOt93R6BgcePHG45WDazRIWlOTGyhiLrnEU7kEbWmZO0M7FQXpIyNRfhrKqL0M1
 UX1hLI4aiZ2zZbTUfU4sCLVBrpMX8Xp4naoSFIPIMHkB33vQovzCIu9UixVvqotWUX7i
 ewSyOdgtO0liSFVxiZR05E4R1hE4ZhcFoc0ftK4Pa+G6pXZlZTXk3vo6Oh6X96UbyDyT
 WSWD+WUPHyy2liKPWBhDKC0yEB+hIVihoxkS67lT/85x9pmZTFP4rnvZq7UPsk1ZfReB qQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbtwb5k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2024 10:09:28 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 4569Dd1T020553; Thu, 6 Jun 2024 10:09:28 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrj4uxmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2024 10:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZLDGUVTe3o0MraXUH4sDuWXrTHChE8tycoHLtylpI7LFYSujtY0GRZwg34Fj97sOV17AoXCbW2Ma9mTBGe4fk7U2EKQ2MOd5yghJHQMyVmEOm0SL6Gpnk0O8bcapL7Pgjtk4pvfFUIQQpNvpSHGPbINvfLIxBOVuL8it0clin3m7BYrsLGEqWqerqR2oTS74L0bUj7ag99sHuVEyTT5S86MBSEeLdU4t97F7CcVQ3NPSnm4o7ecatcRHn98/qIQdiL2oqF/uvm0VRcppZRk/CA42M5Y3Fd3lPXzNzbazviOArXD+HPHK4WT4YEeVEw2Z0l40w6En6w4AJT/+E1Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwFZKJFsIt+AaK6obnsY0HHwWdbkqNw98Ie+ChXgmU8=;
 b=Po2Ai8akO2KuWMbJ895nc7TqIPvWbCY09rpJHJmwH6vzeLO4Xr3LzJistS+3YCCPg5zbRhOLUQHXiuhTF4qEExFpQt8o0coKUDzPxxzxAg6a9JbWoblTyVsErtYq8CKibie2Wt/s+vpDCSdr/VCDtF2DnR3tXTjQ+GN6kKt9LDrkkohGxgJ+htWakG1gaXVwj6uUAR7521bO9c8lPYFTXcKbuG0DNzwrrOQrRx/w/C53CBOi2HkfAC11QPP4Cxm/1ybRBI+AeGySPU0YyLh1aPK/TloJDjOJyGlEOL8bsRxBNoTXCG4cNeGR9HG3O3ouYSGAkIhPAfautu1u2IrMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwFZKJFsIt+AaK6obnsY0HHwWdbkqNw98Ie+ChXgmU8=;
 b=dy0QPEw+J5l+fPPwCRbKJiL4qExpOOFh23VWeDQPBYvvgYLqdzJP8mLtJ0j1mvLr0aP8gkJjMjIF6o1C//bUAn+CflVoEzfe+THyQhtzXPzwPNPIRd3TjzMAtI7em/lVxRDK24Q8TeKRMbgwwy1Ib6VbB2XXXXSlKc5iWQURnDI=
Received: from DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) by
 SJ0PR10MB5664.namprd10.prod.outlook.com (2603:10b6:a03:3e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Thu, 6 Jun
 2024 10:09:25 +0000
Received: from DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77]) by DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77%4]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 10:09:25 +0000
Date: Thu, 6 Jun 2024 12:09:01 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [External] : Re: missing krb5 dependencies after recent changes
 in nightly bits
Message-ID: <ZmGKvScdp9MWeljZ@ultra>
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
 <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
 <ZmC7V3JsFXo1tYV-@ultra> <ZmDA14dT72iP-Hjg@ultra>
 <b857325a-d937-44d5-b9f0-7b366a4b2fb9@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b857325a-d937-44d5-b9f0-7b366a4b2fb9@samba.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB5943:EE_|SJ0PR10MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4a2d4a-fce0-400a-af8c-08dc8610be88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm1Nc3czaVRYTkdyMWlkR0loVGtGK0FtSnpVMmtRSGgvV1RVR1ZuS0Ryc2x4?=
 =?utf-8?B?VVNWK0ZyRmp1NW5TVGNBUkhNSkdSTVhlS1NkZ2t6L3RrN0RidzhiYVVXclFQ?=
 =?utf-8?B?R2RUZWcrd0dackhaKzR4VmNzeGxNU3JOdWgwRE9zZC90ZE1QeXVPZjNkL2R3?=
 =?utf-8?B?SmdaV1hsVUNxbkxiZUFYTHlwYU1TcU1sakNWcTcxSDFLUlhWbFdvREl3QXUv?=
 =?utf-8?B?MlFFQlNmeks5UzBMb1dNdUtaTFhmQit6cFJyWWRDOFdlRURUT1pYVXN6cVlZ?=
 =?utf-8?B?b2RYU1hSVUJLVWlBVXc1czNsVFZ5ZUNLV1RMOFpvSitYeEtMa3p3bit3Ukcz?=
 =?utf-8?B?eWoxUHBxd2JhODIyQzB5YS94YUVUY1VuNnVMOW9vbXNzUjhuMy9XYUpPTFJ2?=
 =?utf-8?B?MnJGOTZiYnd1MGNhVXRCZk1LSWNoSU1BcmtJVVRzbjA4aGFvVDlNQ0ZERnFp?=
 =?utf-8?B?UUNDSTc5M1lTdWNaeWJFbWJUaEh2dUV4ck1tR0dRT1JZUmhGTHFXa2NxR3Rr?=
 =?utf-8?B?NVR5RVhiQTVvRCtycnNPd3BVTUtTZ05YMG5QTUtUZ3dJTUVjUnRpaHg0OExa?=
 =?utf-8?B?TDgyamtYaFdQSTMxYVdlOEYydGhVLzZrQ3ROYURvbEJaT09DQjV0RXFOSHVy?=
 =?utf-8?B?WWU4djN5cUVxaGVreDAwbEcxOHJDSG1Da1d6N25GV1lJdGtzZkJ5NndreEJl?=
 =?utf-8?B?Nm9QUXFQV0xDQzNoSWl2dzYyY1ZLRWlFNHZXWGdnNEtzMERQemk3UFc1SVNN?=
 =?utf-8?B?N0xyTWFvZ0IySnpnOVE1UUY2U3hnMVpVRi9QNVNxcHc5VXg0N2pwV2xoTzFG?=
 =?utf-8?B?MER0UkNhbUpDclVJb1ZzMnlGbUYvczZtU0VXdm9jRlc5UzRCdjhvZ3psTFA4?=
 =?utf-8?B?NGhvR0NuZWZIUDdJaEJwYy9PZ3pmaFpVNlRJb2I2eHozRzRneW42ZmFmeHM5?=
 =?utf-8?B?MFg3aTFpdnFnMlYyRlRyZDJVcDZ1SW5odnJzZ3dLRUVSd2tVUzFWL2JWdTlJ?=
 =?utf-8?B?YTMyS3dFUy83anN3cXRuOXE1cXV2NllYeWVPY1BkVmZNbW82UlBoblhMdlJC?=
 =?utf-8?B?NnNBQmJoQVN1bHV2VGRvWFJuemRKYzJsamhvTlR2Z3BneXRaZ2hZY1Z2MzZ0?=
 =?utf-8?B?eG5tY0NkUVMwT3kzZEJJelZaUnVYaUE2UnhPd2kwSFJNbGhUcjUwbnRFai9N?=
 =?utf-8?B?NXFyQzUveERabTFTaXVjdjEwNTZoVVN4RDFZelgwVlIyMWR4RVlSTGtiMDFQ?=
 =?utf-8?B?VlZTOU5ZeUt2TGdtZzdPNEYzNVRpbFBGSXpmOEhmQXMzUkxQMEU3eE5HdExC?=
 =?utf-8?B?RlgrbExXUGdRcEEzeVcwTGhwTHViT0Z0QmU0eFcxWEdVZWpacWRCenEvSXM3?=
 =?utf-8?B?bUxhNlVvRmwwUXNNVDZqTjFGVFc3ZXNSNHU2N0R5OFZES2dvL2owNmZjZlVr?=
 =?utf-8?B?b0xFQmVRTTBibFVQbHh3RVFRenBMNWh2eGtBRFBNbmtMYWIwYmVNcmQ2V1Zu?=
 =?utf-8?B?aU9KS3l4TE1SalJzR3BBUWl2Z0gwVWlxMFFkbFNLaUFKSXBwYldXVzBqMHRL?=
 =?utf-8?B?QzE5dCtJYTdBWDhUUDRhSC9lNjBFK3VPQnNKM0xxd3BueEo2aDFsc29jVHNk?=
 =?utf-8?B?c1dIanhiS2hFZWxwMmZSN1VhYlJqNEJyeXN3QW9JK0UwV1AzYWMvTkdsWSs2?=
 =?utf-8?B?T1NBNDdJMEcrTnBDa3IrVXpIV2FjMlNONkk3UDZKT1FId0JaQzk0QkNaS2xr?=
 =?utf-8?Q?PqkUhCQVJPnjpadn4299pw99wMv8ZAS7noxzvb9?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZoTTZ4QU5DczJMUnlZTWh5UFUzczliN2xienp1U1d4N3VEY3Y2R1BDTGc5?=
 =?utf-8?B?Skd0c2NRYUtNTHhIOENlendPL3hOVXRjdE10RlFZbG8wY3VKTUlTdFVMeXdj?=
 =?utf-8?B?NHNlTVVrRExZZXZWMTFiR3V5YUs0N0ZPZjBIZ2Rlcy9tM004bXZ2Ui9OSjN3?=
 =?utf-8?B?Q3hub21rL3JuM1RFeWtwOE96U1ZkbzR2NFFZQjlvbHpuSG11djBxVGRaK0pt?=
 =?utf-8?B?V1ZCcUtpZUNIeU55UVdYQUQvbjVJVHR6NytpTjRGMWVHN3lOWWwwL0NXUUJK?=
 =?utf-8?B?eTdaTUNKQWFOL2JWTVcySXd3ZEQ5TUdZcVFQRmFQb2YrSVZOemNEUHBmTmtS?=
 =?utf-8?B?TUkwY01vWTYvNVV5U3FrQ2JVTGxBQytWc05PekdoYnpFakxjdjZ1WnNMRmtZ?=
 =?utf-8?B?S3d1ZllVQ1UvNFpIZ1dOajk5NjNtR1B4b3RwaGhiQk9RcFdTSU8rMTlXRVI0?=
 =?utf-8?B?WVFsVDk4T2hYbVlUYnFXVkdhTEg5VWdlWXhObU13T3d1YVRGYmJuRjlYblZ4?=
 =?utf-8?B?cVdLWndEbTA3dXlsZFJWN3d1VENTSkMxTVRabFE4d09iMkFlVG93SHV6WHRB?=
 =?utf-8?B?T242c1JzOFB2SFpCcVlKMGl5SEhsdjE1RGRYdFp3Ykt0YXJoSjR6eTVaMnJl?=
 =?utf-8?B?cWRuZC9HNUhjcU5RM0I5TnVwaVZZbG9tK3ZqRVZmNW9PYkFwVnNFWHZFN1pE?=
 =?utf-8?B?ODFzMWpjd3kzQXhlZEgwYXI2b01UUU5jWlZkblNkLy9EOUhGaHk5bXlMeWVu?=
 =?utf-8?B?Vk1pUnhCcjM0UXR4SmtUeHl6cVhlTm1xZUVCRFVLYVptQVZRRVkxOXVwL3lk?=
 =?utf-8?B?WVlOeC9rSWQyek5NR0JUQUxtM0RDem5QZEVxQkFDQ2RlalBnSklISmpWR1hq?=
 =?utf-8?B?WW5YaXU2dU5NR0VybnNBNjFaemRTQ2R2RmVxTThpZ2oreXVMeWlyNDNZWU5o?=
 =?utf-8?B?ejR5MFJWUS9XdGtsUG14K005MjEyV3RFcEZybFZxVzhFYzRJeTNIYm9KcTcr?=
 =?utf-8?B?RnlZTDBBeHAvRXpHUzJ1ZVcwRk1LL3cyL2QzWUlvSlh1aFd4TlBhUVlYekFr?=
 =?utf-8?B?d2Q0cy9ZanlHSHU4VFpMT2d5WExTMjBpaFNRRWkydEpDOGpVTnoyWEhPZTVs?=
 =?utf-8?B?RFdoR21sRm4zcEloZHI4akgyK3gzSG0vRmRHOTY3ZDB1eG1rem9nRDVHd1Bn?=
 =?utf-8?B?SmFWYkRCZmhGNVp3cDV2NVNxdXZYSzRJd2RDb1hEcWJRWDk4ZG1vWGxvM3hV?=
 =?utf-8?B?TGkyMjNQd0VIU1J5NFBDTHpuMi9TZEpBUENCWC84UDQ2bzJpTU5reTg2Zllq?=
 =?utf-8?B?QlBxNHMxd2Nuckk3TXhjK2FRZHVQN0w2UnVEY2Zhb3Eyc0Q3eTBYZ0RwM1dl?=
 =?utf-8?B?eldKdXJ4a0YwWnBld2lJamlxcy9zM1FDZVl6SjZpUit1dUoxQXJYSEpRbzFP?=
 =?utf-8?B?Z2R3VmV0REdCUEh2TjZlVHVoNllNZWF1Z0poY0ZRUk5QNHNiR1ljZmwvTFFD?=
 =?utf-8?B?WXFyVVJHVWIwZFpDY1dETE9QV0VhSWhWYlJONGF4eGV2M25OUmd3Mk0wd21i?=
 =?utf-8?B?OHNmdUNoQktHN0x6SW80NkNpRXd0blZ4Z01laTJrV2kvaE5XOWcxaHdjUXA3?=
 =?utf-8?B?cEFVVTQ2ZUxsSkhMa09tSXBpdXRpckJ0K0FGdHVMUzlzc1l5ZjAwRG9RSm1E?=
 =?utf-8?B?VjhCQkY4MGZzYUtoTWFQRjhlc0FXWm5HQThmL09nZm54c2g1UmhSZ1lUbjBH?=
 =?utf-8?B?eGtkR2lEaE1SQWtkTjJTSHZWNGRTV1cySHhpcEJuNFZFYWNLRlBiejMrMlJt?=
 =?utf-8?B?WjZ5M2RKNDJveVNVaWcyWE1hbXlrQU1TdTV6ZHhSNmlocERwUjRTZUlHeVIw?=
 =?utf-8?B?azR3RExjZjMxK1JmNmFYZ1FRWFlPWHhvNHNUTUx0ajVnRHA4ZzVwYyt0VlEr?=
 =?utf-8?B?clhmTUlEN3RQR1dXYnh4SFowaUltdEREc3NFMm1GRFd0UFpIeTdadi9PTjJO?=
 =?utf-8?B?NEZEdkdFYWhxZ3JLcnpoS0J0Ly9XdHNvdFZGTnhIN2xIVkVLeldBdWo0Q3ZD?=
 =?utf-8?B?bU5VaUFRcDFhanJrRW96OHY2UENMWkk5TzQ2bmUreHhxUVRScTQ5M1AvTEFl?=
 =?utf-8?B?dERtRGE2RzExZlFYd29zQ1hKVVpXU2FMOThORFNtajdtTlNmYkpncGpzQjMr?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2t/Up4EhaLmjtU+EAmtgGujmByi8N7H8Hcnhr+aOjkuT1Yc6A8ZsdFGI/41UsooVfOEHoE8kg+NFDP+F7FThVkTh8Qb6/TWMXSW7adS8Xt/CbuB1ckRcos9+xZMFw9FVLTF/8dWUyAp+eBovDggOWmX2fytlr4LbdUdo7pzA7r/ArujsxMggTH5mciZ4iwQHhPglv5BvUerAmAX9EeeGcStSPVz6ZGxS/hosqszrpLKPGteFh/tPoEBwKI5w6DjGD940AWQxy505p/VtIZXOIjk4/G1L2q8L9TBm9iyfq/croONagVKg6vSdfeTYkGInhGKJ1qx9g7hH6MIONAWAr2Yg2FMRLrIzCcwArXku1fS9sgcwBLXnTVxxrlOgGte8Sx632dyHLgYy8RlyV3MEIs+sMF9ZH1HomT31zv4XJH1x0SFliApfgCxRLbpcTmMo6ZZRXuboQUI0dQqLxF5HnfT/bm7s8WAFK/b2wxGdkPH0S+9Z6yE6Vf7oy6rVlAYzCVvAOYEuNCbPgA1HaJaPgqEgNIM9rFAF4lBo86ArH9QyZOTVXI+ID9WD25r2ES58BzXkLVuSRwOiZ5Qx7+vLXl8SVBBptxlzur8zPtuKWHo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4a2d4a-fce0-400a-af8c-08dc8610be88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB5943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGqKGk3aOt5EMMV4A/x97X2Q+eBWX0LkenSapBRR4SkAdtFXp4KWfucRo5quLiGS6wr4/yg0Onz2i3gQoFr1oE55QBocRLUFoWGMgRPEX3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5664
X-Proofpoint-GUID: FE-KktXRJDlcjRIKDIZufBwWNxTFwvdm
X-Proofpoint-ORIG-GUID: FE-KktXRJDlcjRIKDIZufBwWNxTFwvdm
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan,

It works! I applied the patch from yesterday on top of what I already
had from you and it builds again. Thanks for fixing it promptly,

Vita

On Thu, Jun 06, 2024 at 10:51:06AM +0200, Stefan Metzmacher wrote:
> Hi Vita,
> 
> > Still fails. With your patch it's better, LP_RESOLVE builds,
> > but DNS_UTIL and LIBNMB do not build.
> 
> Thanks for testing!
> 
> > The 'krb5.h' seems to be included through libads.
> > Maybe libads needs to define its dependency on 'krb5'?
> 
> Can you try https://urldefense.com/v3/__https://gitlab.com/samba-team/samba/-/merge_requests/3662__;!!ACWV5N9M2RV99hQ!P8ndlyEWxU0idYjfl7KfKl2mabtIGhZVnEqwQCh6q6Hd_wbvy0ouAvRTrtM4f0jDpz3Vx_ow4UOXd-l6Nhk$
> 
> Thanks!
> metze
> 

