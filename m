Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE3682EEA
	for <lists+samba-technical@lfdr.de>; Tue, 31 Jan 2023 15:12:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=czeLNgb7LoxtSLWAfCLtVBbXztQ9vuiucjgaR4p7aFM=; b=Odq2BjmVuE1TWzo90GLVzRVIcD
	H30yWzkuoiBC84fX5WLbFUPW5PUi4YN+zFvCOYipKVti5briePntTXrPGxbClKMwyUl8R9PvhVxcN
	9Dp3hQgFCLbb43qJ1loAvOk9CjNHB6Er5H3Z+H+g2DMiNqPsKhUwm/qT4ap4gu8/no8PGp/G8VeYP
	pYabPCVFbfSWiHtuJRrml4/qk0zMq9xOS54Cjo8eWFI5CEow0pc5YfvO+DX7pg3wTRBVlxeUxrdjh
	H2MifY/JLz90I9PHs5fq9vJepqS/fOSjpNxE/IDvYwo3nj7bytGps/cMQ+UrBzuffooxLRjgbtPMt
	O1uarrjw==;
Received: from ip6-localhost ([::1]:31136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMrM5-0053ki-F5; Tue, 31 Jan 2023 14:11:25 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45444) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMrM0-0053kY-BQ
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 14:11:23 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30V7wmum005442
 for <samba-technical@lists.samba.org>; Tue, 31 Jan 2023 12:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=czeLNgb7LoxtSLWAfCLtVBbXztQ9vuiucjgaR4p7aFM=;
 b=o+nWmxr1ch+AkyIk1tBz3+bisK1/L/hBFAtBhDgKwhGoERgIu19gMuiYDHZZEYcPEf9E
 Ee3y931JmojLg4wHWqPgq6tzcPr9LobCYuqxNBeOZGPrkMqGfy08ZOobpYA+g5aHga8l
 ckEPa+x08R0jEeeq70N057sDRAssKUMJ+sZZdGB9eSVtZtof0wgA9ILRCF9m2CkJ/VOP
 1PY6xXOa0ABB0HpQCm4yaTP/fc/jMKNxJEv8I9gQd4nFKQwHklTCtiI8T/8bse3ordFb
 LFFkRlrWJew2Ve+Vba4rkACWHB8/BBj7hlraHqs5O8xjXz36EUyQh10JKPP0sjO/qvGp 0A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ncvqwwe0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 31 Jan 2023 12:21:07 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30VCCGGH010391
 for <samba-technical@lists.samba.org>; Tue, 31 Jan 2023 12:21:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct55tnx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 31 Jan 2023 12:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOqiCgFfjZb2VOboulQnlb1gx3qV7UPlaSXSghQR2br5j0fX09KTiykWaDk8//kuCa3Gdk1ybgZ1CJo8xcG5goKhG4HfbIRDtyWlpBFrxb3eSTvGC3RsAKlHU4EeIInA0rTtnzxCuuXgoqXYTsrU0IN3Zrt5sRXEK0Xq3MOpjODwLqvAbRavnJ3wOY94bmZusEtAC1kvq63T5yllW6zdQNGSb6qzYuEkXQqMftqkFpycwwYkS9MQ/+10MuOWJxXs5L6oUX6f5n4XbXTEZrRCzENV2zB/mvNB1p2wWwI/R/uVp8gJ/SqLoz5fcEnQN4QHwNh4GCSddd0oRtcDBdhODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czeLNgb7LoxtSLWAfCLtVBbXztQ9vuiucjgaR4p7aFM=;
 b=n1xW8d14RN+hjhTuI12ny7TvLr0mfsQnMXhzaFrJ6Ecw5cOerliaLNlbUFMIIATHAxdyYu0tKC1IBIwp7WbugRdbmAmfOj7ydtCoje0OCnvqK2W/iJdhELAfWBzk8VBACJzVeVML1uUv0kjRHSfeSEt6CSvSTjZ4lsHL/bGuEkHFF6G4qUHRDPqbGFtonaATsgX4IoOxp7JKEyfUKwEnKZbymVFGJ+BZhDDQQ4VgtsO39eFmXszMA6AuxQncvJCHMdgGQfrMzs6yskneUJTZctsfo2SZGOpgC2ItU5T11fx7b1zG6KO2AWjqU10V05SdSpGpj9iiLWvIUOQlBl/5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czeLNgb7LoxtSLWAfCLtVBbXztQ9vuiucjgaR4p7aFM=;
 b=kVAJ88mfm0F6nr9rwSdTVGoi9QcPNbs4iooRUDAKW909jE5yIzlh1QpfHc5b/W+++2WSx13QfTN7/wc10tVF6ZeryAeI8Z3f1v4yiLaq3v2nBF0P275a/Sro9ciMcFgVGXsikz2jdCPRBycusxumjX/nd1jV8ZvqaTONlYY21J0=
Received: from BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 by DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Tue, 31 Jan
 2023 12:21:04 +0000
Received: from BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::ff33:e85b:2d10:68f6]) by BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::ff33:e85b:2d10:68f6%7]) with mapi id 15.20.6064.022; Tue, 31 Jan 2023
 12:21:04 +0000
Message-ID: <313c49ae-fde5-bea8-e150-676176a6f8c9@oracle.com>
Date: Tue, 31 Jan 2023 13:21:02 +0100
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: How to handle @LIB_RPATH@ macro in a/source3/libsmb/smbclient.pc.in ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:EE_|DM6PR10MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 4423bc26-1d60-46e3-967d-08db03859efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: 2N9REdxX5B4ddfbK0p1VK/8Zzuw9vx4NKk2YffKfzq3Pq+5sUD4Y1n18VgRLm3OyPbkGpJn6s2xjytMm4F9jnU2XS/nlv+2BQtxwsowbRdQDjwy+qAxpL5qPTWzwEqj/oPLQgSBXnoX++ww/pJo4Oi6PlrlKO7aNjATQ/4YJ+TA6fCuv6mBgGjqoKAklzx4L4HHs6qed/FiKSy0neKGEEf7ex2yxdwPhEvQzWLa+nzxaDpHCE0UymSEfcCc+qtWhmzGz9PsnQrSsZi5r7zQ5bzNaAZnEqiQYzA/pWiB3aVEl/FVVXJU047x6ohkldjIhLgA3tAwW3ttdkmGn0oRGiFu3crCP445YABCWhqUQBz3/E1MRKJFtJFzjLt4QfS2nC1oWcYL6kIOYIe4yLoXbY709UEEOp+PW3r6R+r1yo8wZr+qS1UD8YRE+fe8Cuh+8gV8Lap3UAz7O1YWT2iyhj2aZ8U+XO+i1dVSZTiMyheWysm6MGAC8HHJfCbXhj+yGkEoC6UkFwyLX8+luwIqHB+uGoIg5UQWZRFZqFMUNb7nN5H5LrOElMqFQMIrF02qjVSZzvhgGdeRsaQOLM/vIDr2xYT0R+DI6oujF39JKuiKxigbxC5UQTcRQ/v5oGedaTOI/icRm8VuAMuNdfSYjJhan9H09n/6wUvngKFBlHsNlsR2NPWRYwBehLUIvtDK1v6IQYW+4fxrG8eKD8KsmJFUoWS6PPlNDvjZQnmFebaM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWdkVSs1RkxqZW9lb2ticEkzdG94YlJSNTliY2tXaFhEbmpiOTlIcnV0YlBu?=
 =?utf-8?B?K0hQbzdVY0kwU0FHRDZ3aEI2L1ozaW9MaUphQ2lVRmFtWEdoYTVqSDlWYTVm?=
 =?utf-8?B?eEZxL05vTzV1ZUQybk9QWWV6a29xSDlpRDNsMElpSDRIRXJVcHNncGUrektj?=
 =?utf-8?B?QVBPQnhlT2Z2bm5zL2RhZG82VG9CSUUyQzJLVmM1NnRuc1FJYVpzTVV3YXla?=
 =?utf-8?B?dHN4RVRueTYxODNtKy95UStpNUpRRzFSYXlLcEttbEc5ZThRS2NkYnBOVk5B?=
 =?utf-8?B?RVhHY3pycDJHdUhSRkV4NHNua1YwZjFsVXEzRFRaWlc3OSsybmVmSW8rbGJ5?=
 =?utf-8?B?SFZCVWhCaS9pWGhPTjdtcTZUYmZJcWFJMERKNFlEeDlibk1hRHJ6VEJHcnh2?=
 =?utf-8?B?bmxLMnYraS9rMGt3ZlpYYWhNMU5RZzVwUVdNRmRWR1ZUcFFnemdIaWhjZng0?=
 =?utf-8?B?aWlCSmx5YUUrdXphd1ZGMmg1c1lDL3hwTTRSTEZuUVFkSGlHS09HSFRjYzZ6?=
 =?utf-8?B?NmFwWE5HVzM5S0hGQTdGUGFWWnV6ZmZuRm1rdkM0bnNIWlU0L2xtS3dVZEtY?=
 =?utf-8?B?WHdjZ3BOeXo3OElhV2V2bjRNdnZDb1cvV1dsanowYWNnY3lIbjQvdU1vRUc0?=
 =?utf-8?B?dXd4eHE1L2ZvVUJ5UnlxMXRiT3pWQkxQK0s5aDQ2S09sQnB4U2FXR3dwTzRD?=
 =?utf-8?B?bmZ4WDlLR3VvZ0t1N0FlSEdxazViN1RPUm1vcXF2U3RoaWZBblQ0UjZ6UXhD?=
 =?utf-8?B?Vy9hdUdwMGNnelQ1Z1F2NHl5WnpvcThPWGRjS2pZa0xXS1NXL2w3Uks2T2FE?=
 =?utf-8?B?d0lYZFVUQ1dUTHN5Z0R4U3lUU3FyV3ZJQWZuMmFQZXczVXVXN2NvUENOOS82?=
 =?utf-8?B?ZWlrZEN5SzlJTHZvTTNLR0RPZDF5K3czZm84ZWZKQ045aXJxWGlxN3dwVnhq?=
 =?utf-8?B?VGxVODUrMjh0dHBjU28wNkd0QytOTnoxdmRwZ2hqK0l1VmwxK2o0ekVFNGFT?=
 =?utf-8?B?M0dzMURoWnQ0ZW1EZmY1RDBiTEd2UGZwbXovZmNrTTZxMWhDVzJDTHNGVldt?=
 =?utf-8?B?QXpqZmJjd1lwR21tRzBqby92S0V2cDY0WmVGZ3haRmZWZE5rc2g5M1FYRnd1?=
 =?utf-8?B?OVU3dHc0SGxXdHZOV3lkN2hyYWVTY0t6aUlGUnd1ODZKR0pSWUUxM3pmZHRj?=
 =?utf-8?B?L2U2UUN6cXQ3b2dtWktWYWZKZm4za3UwM2FRZDN6bmhBeElBSmIrNjBNV3pR?=
 =?utf-8?B?Y3YzVlF1TmNMT2pJU2hrQ1RqOHpqV2hCVUJ6Y0dUeWZTYWVsQmRxcDR1N1ln?=
 =?utf-8?B?NjMxL3J4N20zdy9KYUl5dDVGWnNKU0lXQzlwUHFYYk45Rlc1cGtGb3NyQzFV?=
 =?utf-8?B?UFkvb1hqcWhKR2Izd1dzK2dNSkxJQ1JLYkhza2YzMEdrK1hHRXZwTmRhWEtB?=
 =?utf-8?B?a2VFaEpIOXBUQnE5R3YybzRoTXRBdkpKa0lCL1loRHcva3c0TFRLS0REazdw?=
 =?utf-8?B?TUgvd2RjQnB0ZEw4d3lkTmhieTV1WnpxUSthcUVPRDRsUmptaFJ6d0sxMHlU?=
 =?utf-8?B?K1doS3N2ZytaU2trNzQreFI1REFwdTBOVFpBYWt3VWNJZCswRWlWZ0g0MVcx?=
 =?utf-8?B?eWdVb0szckk1WDczM0NzMkgrejBsckZYc2p2YWozeWJxcjdwUnh2UnB6U0ww?=
 =?utf-8?B?SDZTTzZjb0NxSXJTZGdHSVVoYzRZcVN3MEJMd2JZZVVQMXdBYTRYc3NtTnFH?=
 =?utf-8?B?L3JaakRmUFVGdHg1akMwSVN6SUxuNFRRQnp0NjhtUE9kM2hVNWVTT2NBOWNP?=
 =?utf-8?B?YjRidGVlcWxYVjhHdmhKcmVaWExGb1BuTjhPeE9ocWZiOHJ3OFlNYnJpWWZY?=
 =?utf-8?B?ZkpWbmhqQldqQ25ITFpENXdwdUhxaVRVcmR5Mlp2RkdHemFjYkpQYnhEMEpL?=
 =?utf-8?B?OTdrSHlITXRIeVNMcCsvemkyY2J2cnhsV0ZGOU5KRWliZE0zWStWb01aQmZO?=
 =?utf-8?B?OFFzMXh4MTJDeUZFZTJlVnRiRHNTZGZhWmQrWjNOQlR0emtIZFU4d1lxOFZx?=
 =?utf-8?B?RWh6OGFoTkF2L2U4Ylh1WW15RHJaelN1NDJjVFlheklGZmt6V3hMakhxR3pS?=
 =?utf-8?B?NkFubDhtMjdSQWdqZGdzc2twT2tJWkM2SEcvOGtFK0VkQ0s2Mk9uM0E0bGJN?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p314gXjGCNGxre8vupdyfmIJL64YIkFpU4XwHSj5kfqzhQdYXlg2n0n/wr8ItDNxN7k3UuyRq63NVJ1+nR954Usx0KZNhSf/aXe6gpkaiSCw7aHQK7EWwYUs2Ktpz8psW5k0vexRNWxdDr5I3cDY/+5m+1dL3I5Qy5UPiaLGQGMr9cIYD9DjUyXjdx6HdVvjIZh5DQQvHnyuHRW05fKta6gQw/nYXbk8q2i7rIAybPRWB4VT+IAHc2irebpmCoBQppS/yv+b6wGLcq0r7+FG5inrsBYpqVkjbdRgQKXnZJcvTTZ17KERz0nU/XUc1dIR+PoCMCeKU57ODWUah8OsUzMs6h2xwwEQuGcM21r0jhGLMmc7gih+ayE/h75XEvDWdG3HGTdqCiWn62u409IIdZv3ZD1qeVcaonPVchi3XshvPu7jerDIHC5mjamZCvhJBiQoQVtjglSMBjkbS0SpZBrRSplx1ULmY4D14eR/vCkBgD8P1HptxxWqr3eLxtTH73WDogfFVX4A0OBZ74mnO7cLPC2v/OdfB4wpFWZ+Ai+jcZPklidkRnUB0VgeCgL2aqxbdCKoT0VUtOhJ7YeRQKYfFc2tT7ZO58qCTTvLgbfNn9YqVWQBMO7sJdjQT4Ya0qFCMiNMa3TSiHfOLVHAyTVrRNz+SHwkUKqWsZpjTkDcfvChasuwAJzhYglrK0MMaXifmg+Ej9dgcxBl20OZOKdUcJaWU8aFcMdqQoRsYvRky77ZdMMIPM3BtWy14ThSK15uIKZuMBz8G3ZHkBAN7w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4423bc26-1d60-46e3-967d-08db03859efa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3842.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IimkkWO9EJdyfm60zJFfjr/0WydPZUGUL9dARW6E14x6hm8u5VzhYWGxNSAaSteVnd0VIs7tzVu8hvKCRHFaQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4313
X-Proofpoint-ORIG-GUID: qYCDWxzGNEVsJ-mbmhwXWikHagJSgciI
X-Proofpoint-GUID: qYCDWxzGNEVsJ-mbmhwXWikHagJSgciI
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

Hello Samba hackers,
I understand it is under the level of problems discussed here but I 
would like to know how to deliver -R${libdir} into Libs: in .pc files. I 
think the LIB_RPATH macro is the correct way but I can not find the 
option to unpack this macro.
Thanks,
Jiri

