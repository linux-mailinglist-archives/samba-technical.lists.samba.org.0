Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 195DB8FD6C0
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 21:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4NPzuA8YzO+mEb5K5htOLJRYHNpQ6NrpyWsowGGEZZA=; b=QCW9/RBu7WGDDKNe79X6q8/sZN
	gpixrgY3fFqVTRt1mXkPkVhCGeyLNsCUWzk6D7cmieJbAbxNzQrKiOQoL7+Y8fe9k8d8kc34tvJNq
	zfhhhTF0dTb2f3BqyzHFzcmK1JAarAepgk73VHQz4ZSDJg2usQP8NjQON4SoIHWwhXp+aXYTzIlhY
	BmkgqMIwZDdZ5EFTMvmlzBaA9ahRHqCItor3dl+yoUxZLnbH5F8rHCTMP7TaSXURmRfcZCLK+NIYR
	QwwhI92CSOu9sLurd2YvLsGb1VgX3RKhvtIAcVTI/lT2ji3kCfe54Sz5B9dH949O/oTmV8admVdTv
	ZVu1mUbQ==;
Received: from ip6-localhost ([::1]:27766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEwcg-00ClzI-O1; Wed, 05 Jun 2024 19:48:38 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61750) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1sEwcc-00ClzA-5h
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 19:48:36 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 455JINNw015747; Wed, 5 Jun 2024 19:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=corp-2023-11-20;
 bh=4NPzuA8YzO+mEb5K5htOLJRYHNpQ6NrpyWsowGGEZZA=;
 b=Chx4SiSVVHpz4H9uEjCXAoJuM1D2kbTopKdYJfK8t/0Kf0y/RWyv7ka3TKDaZBOELymz
 gXzrqf8wMLrlGnAt6+8lI9OjP3KqKLOKAZETpOT5SbEDJLOA8ZR2L9y+3ZvdV4vlV0mO
 P07CZsjf9M8aDO0KltqhldL05ou6P/vCTGGcE1JJkny1npUA4dLSRBijIEa5GUhF0s+K
 GvEa8+A+XuycOdtG93h2ajknNLPqxesC0WJCxidP8STcTeW9jahemm9+AN6oOajc5AhM
 Idi2iPWTVjprbb4c+uWu8vS68hVd8znOA0dLchRiOS5d1fh52LE/0JDKVRY5nTFEHX3G eg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbsya4eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 19:48:29 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 455JCrbZ005555; Wed, 5 Jun 2024 19:48:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrmff051-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 19:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hF/CAWDvJgC+5wPnidMsqJdB7XXq+l4sZx05l7h8BWiVkjTOZZw0YK3RDVwDvUEbr4GQmGCOvJ4nUFwsX7MCm37bAmzd/Y0iZV0J4k6CDuYaWba1PjGMVmFPsrGONRX4KtQKo+MtqOtSW5neFJGUNtCxoj4vLQb0Fw4eUVOsWSBukEoqIznnoASHe3qvF1X4JL705/eE3ppeHiVDM+uVLTN4tFSiNuel5bMTkqpi6fgG0alkRN3SxO78fNMzzooClvxkuvP1QtNiOy1NJr4v8T8Isi55/cjEWuYoH0tr0MlzRpuIT9Q0pQl+82H2F6s4TkXT4ZPOD3NU0UUmfLVOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NPzuA8YzO+mEb5K5htOLJRYHNpQ6NrpyWsowGGEZZA=;
 b=HInjJFA4ilgW6FapvMv259Tf0bJyrWMsrgKGGkC5NEnBOg0w5Om/+R2sDcnzTTopE+QiF49qDgOfESL4hFyEI3EUGRtDsWI+7OQGW3ZxaQB3gTI3hihT6zNNOpyrleFBEZYk4bYpNV5qxY5zvnxf6IoKHvKa9QURWTPFIqOQ9AAVHSqKNQIwYq/U8x0WNEM1YcQFTikxBxC4ffI4x3QU6lHkxcVSOzxR8tFcnMVCWoSBBTHsW7JA/xe7q2BDxH7vLbc1gg4lT4jRjGOccMU1XTaqVApWeHihQTAKpCJXVj+gCMYOJ2dllUlTUD9cMgSLBeIg2nsgDGb+lls+a5jv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NPzuA8YzO+mEb5K5htOLJRYHNpQ6NrpyWsowGGEZZA=;
 b=S9Qy9ZtK9RLLUr2DtBRrDdxmuqZ6Qls0LQEP8TL51wKII4qIpoFVj79YD5YpYWSKpN1I1G4DzCjjmla25cfIzdKDUiOxEggoWH72HWc7+o5VClpWIFV5V377DD06xUJ/AivBX7TXriE8s87leL4cA1hTXFPEtJVdJoX967hklIY=
Received: from DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) by
 PH0PR10MB4503.namprd10.prod.outlook.com (2603:10b6:510:3a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Wed, 5 Jun 2024 19:47:59 +0000
Received: from DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77]) by DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77%5]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 19:47:59 +0000
Date: Wed, 5 Jun 2024 21:47:35 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [External] : Re: missing krb5 dependencies after recent changes
 in nightly bits
Message-ID: <ZmDA14dT72iP-Hjg@ultra>
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
 <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
 <ZmC7V3JsFXo1tYV-@ultra>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmC7V3JsFXo1tYV-@ultra>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB5943:EE_|PH0PR10MB4503:EE_
X-MS-Office365-Filtering-Correlation-Id: d378d89a-0581-47ce-fe31-08dc8598674e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTdHNEdmOXVLSjVMKzZncjJ5RXZWYTdQS1V3SU8wdE9XdnptOWRCTDhCTFds?=
 =?utf-8?B?cUZNKzhwNWxCdkJFOEVHaGFwL1hwQnRFeTdtRGJoTy9yeUlmaEt6eVk4Tm1s?=
 =?utf-8?B?YzQ4NFBPMFBHMmZNVDNRRU9pTTcrT0o1MlV5YjhQcFI1VitKRlB4TUVYd3Vr?=
 =?utf-8?B?NlBHZ1ZSMmd1NjF3VmZMVXJVU1U3dW1nTWgzVzhVSDd0ci9rNUJOamVWdm5D?=
 =?utf-8?B?M3BkRU5sRFpqZjBBbmo0WUJCT2NPa0RzdGt2cTVacXN5Ymo1bENocjI5dWxZ?=
 =?utf-8?B?ZUJCRXlmVnk0aDArb3ZVWXI5M0c3YWRvZUR6eUFOakVONHVvQkRPaTNudDFi?=
 =?utf-8?B?OHdQSnJBVk5LbGYwM3ZyTjFYdXpwc3hXSGdQMFA5QmE5UHhxSjd5K0VHTHZy?=
 =?utf-8?B?bHNaNFFpaWlXa3BJNkV5M2hhcFRna3pjUnlUVkRaQ3Zuci96N0dRVWFhdlc3?=
 =?utf-8?B?eHRKNUw5cXE1QjRvU1VDVXBjdUlNbWc1UFQ4ZU1DSXFtdDlCcDBNUVhCb0R3?=
 =?utf-8?B?Unk5NkQ2L1pTVHh5bis4MlIrcUIxN1B5eVhYNi8vT3NHc3h0WHpPcG81VE8z?=
 =?utf-8?B?bkZSWWFobFlJYy9iU0ljeUQ3L1hnWUdGTWNReXBwdVRscm8vUWhtNEQzQ2o3?=
 =?utf-8?B?bVBrSkd5Sms5NDF3QTQrL0IvMG5rK1Q0RGJFeW5rYXlXZjg3RXJ2TE1NaG5r?=
 =?utf-8?B?TmlNU2taalpHRzh3YnJuclBFYjlWZlVVMUh4bnE4UU4ydzNVSHZyM1lucnY0?=
 =?utf-8?B?eUJoTXhoaUgxWDM0WlNjK1UyUGRkdmtrVFNNaFE0dk9hdWZ4ZlBUbUdqMlZQ?=
 =?utf-8?B?Y0JMaUY1OE5kckxDVUxEdk5TS3hqTFUyUjh0MklZYW0waEdKbTltUERIcGJV?=
 =?utf-8?B?UFp6K1NkNWgwQzNEYkZpYTNVdFFseTVpbTZzZWJwZmRGSlBqUGlKU0s4V2JJ?=
 =?utf-8?B?NkpWME5oNWJtQklxN0FmVU5qZGw0NHlDK243R2s3MkdXNDNwMG43ZzdCdFJZ?=
 =?utf-8?B?WXVZSlQvVUVYT09nL2o3RW5xVUVYOEtIWHdFNVJNT1lyTnhoZ3d1ekE2dFcv?=
 =?utf-8?B?cWJ6aTZ6V0VZS0pMaUFoSGJFRkZLWFVIeDU0TnZMTFZ3R2lERHk4VHU4L2l5?=
 =?utf-8?B?aXZMTmFsYklZSEpIT1J5ckhjSXFJVjE1dGJWcDF1aDVsZHd3ckNDNVFVM2Y2?=
 =?utf-8?B?VG1jcmE1eVRuMEp2dzN3dXZtRzJkSzE3WWs1c2YrTG9ZOGUwN2pORVVrR0Ny?=
 =?utf-8?B?aEVlaDgwWWJwVGx2cW9qeGhNSTdGTXVQNWdDUnd4YXl1Yko2QzhSMys0RVIy?=
 =?utf-8?B?NGQ4blVhcWp2Znh5UjFtOFlmRTRiNXhKUzZwL3l3TW0zSmIxanZETUJabEtl?=
 =?utf-8?B?U00vK1dPVmJBK2gxR3Z4K2xxZ2ZUaTdhNDBMalpsS0hEc3MvOXJod1QrSkQv?=
 =?utf-8?B?SmFSWlQyWEsrUTJwRGg0RzVzR0IyU1BRSjVuRGpZUC8wM2dGbDRhODRic0Zj?=
 =?utf-8?B?WVBMSDZ6NTNEM1M2UEpGeHdsbE5IeFo3Z3RSZlBYWjEzVC9GTTQ0THlhazg1?=
 =?utf-8?B?bWY4KzZiOTg2dGQwNEZLZFZnVHc3UjBwM2EyVmZVNmFLUkc0L01SeVgvRU1N?=
 =?utf-8?B?VjRwcTlkbHRVNE1hZXF2OFlHUmpITVNyUkpTa3NneVQzUUpGU2liRURyRkJX?=
 =?utf-8?B?VG5mb1l3SjJRdXcyWGk0aUtIeE9TL3RxZVczcFRaQitwWmo1eExFcmp5SXlG?=
 =?utf-8?Q?irFMvuPk5CvHhPYdw4+G5ZOJnR99JTpzxPxzbr0?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVPL0Q0cVhNUU5LRzZ6K0F6ZThGTGh5UWk5dnMvNWNqazkyYlNqclZOYWRB?=
 =?utf-8?B?b1UwUy8ybTNBbkU1SUlXc3FsK0FwNDBuSFdsaVVteWtTUGFYYXMvSFdXanNT?=
 =?utf-8?B?WkxIcnRKNkN5SkdWeVVsc25obHZEM0o0cGU0QlJPZ0p4NnRZVEhKMW9hRmRw?=
 =?utf-8?B?Ym96MHE2R0dnM200ZjBnbTdoU3ljQTdCVDVXYjVPdHMrZmdNeG1hSU04VkZW?=
 =?utf-8?B?QlFDOEV5aFZrVkJTd0E3MU03bVc4RHNRRmJ3WGRia21xZ2h4KzhnOUM0enZ0?=
 =?utf-8?B?YWVVblVvU2s4QUN0QXpObDFCTmhDS2RDUk1aeDFIQWYrakZCQjJlT01rRWFC?=
 =?utf-8?B?QzRhWGFUTVlyL1l3K05TUCtZWExOMFVZaU90TjNqcWp1V2cxa0Rxclp3cUJW?=
 =?utf-8?B?OGdSbUQ0NHBvcG03SlRkd0pjMm5HUHNpdVRoZ011RVNINmlZdHdnY3lDOFY1?=
 =?utf-8?B?Q2hFRGs5U1NvZ3lRWFVoUDU3b0h1eUU0d2M5NzR2UE5VVzRzdlJBQ0xvVHkv?=
 =?utf-8?B?ZGVpdm4yemV6cVlwdmZRdXNEczdVaCtPeHNuR1hyU1J1K1RnZGJwR1BwdGxm?=
 =?utf-8?B?T2pkelhGL0U4S2RPbWZpUUMyZWJiSEMwbWFyZ1A5UEtZOG9IUUI0a25jcDFV?=
 =?utf-8?B?NHUyZUh1cmppOTJqNkJoQlpZVURIQW9NcXkvZGQzRE80UDMxaGtGenZwMGhl?=
 =?utf-8?B?OE01TDNPTGR0Sm1pMm16RklxVGpiSUhBeWl5Y3BSOWpzNHNuY2J0WTZvT2Zo?=
 =?utf-8?B?dEczdUU4WHUvcDFMNk05cWYwM2RSQVBoZWNqRzd5OEtGWk1hS2ZuWlR2MUU2?=
 =?utf-8?B?djdUM05KcmJuY2tWcjdxem5IVWdCR0E3OVlNVFdpTkVTWHlBOUNHOTJ1Zzcz?=
 =?utf-8?B?NjhTbzJNbmxQbmlYL0EvbG05Y0tYSWNpTmNDMmJhUEJEd2dYelFabDVuNUFB?=
 =?utf-8?B?dUdUcjQ5M3l4Q0tqM2RiazYxMTVCelZFRE1vMHVGc1ZTRTkwYWZzbkkvRVI1?=
 =?utf-8?B?MmF1V2FjRnozdllyYWovNldCOFlnQzVtcXdYTm5VTjI1akF2bWt5T1AwbHMz?=
 =?utf-8?B?WjhpMWR5YnYwZlBsU0hWQTR0TTdYdi8yNXdXaGlFYnJSbEorVy9iTnFVQ25L?=
 =?utf-8?B?N3pWb3V1SGRiQU5HWUlVbEdoQzkxRzRqQWMrRGtCanhjcTRRVjU5eERHbXJ1?=
 =?utf-8?B?VW1UK3p4RkgxODFVNWF2VnozTGNMWVBRRUhQTkRJYm9XaGV6VzlKdzhPeVdL?=
 =?utf-8?B?VW1sZWpRUWljcDVVdkNwVVh6MmUwSTRQSk9reDhlNkFFTTdpc2hYSzhRSjRQ?=
 =?utf-8?B?RCt1RG54akpxTGhvS1hCS3BIUms5SmhTS0xlcWVvZHNWdHZUVzlyc09NZGhq?=
 =?utf-8?B?eWpza3kzR2cwbG45b3FYUWJCVHpTWnpaVm5aUEJHMSt1c0hRanV1T3pCYWhU?=
 =?utf-8?B?U0gzSlhyanZZckpqOTVwZVFDa2s4YmdENHowM2htLy9mOEgza09LOW8rVGl6?=
 =?utf-8?B?WWF4QS9rajUrMEhOaGR2TGllbDV3dmdkcThYS0NXcklCZmlPUHJnbDNhajhy?=
 =?utf-8?B?Njd0OWJVYi9VbGJmS0hlSmNQSlhsTXQ5Nm5WcVk2c2lnTERvMExCT3FxQVZa?=
 =?utf-8?B?bjVoYXJKaitTaXdpUU0wSHFOTzBqVjlyQ0Q4eGFMTjE3ZTZjNjV4R3p2U2JY?=
 =?utf-8?B?QS9MMXoxaWVsU01YZmRjaWtjMnh5OHFpTG5YU2Q1UUhVZVRqcjhTdjd5Y1pF?=
 =?utf-8?B?d1ZMYXFRNE5TTDgvQzQ3MGpWU05aRjMyM3hqSW5lOUF4ZGxFZUNWbzFhK2kx?=
 =?utf-8?B?UnJ1WUM3S05PaDU3SndJVjNCamJLbzc4Qzh0U1pJSGxsOUE2QVU1ajBWNnUr?=
 =?utf-8?B?QkxKR1Q5MHRNUERSai9mTEIyREVJd0RyaS9BQ0hhN1NSRGRYMTlDNEZSK2Vs?=
 =?utf-8?B?OWJNajE3SlBrYWh3bGNhVkxhdUJDb2tWckxRVkJSM3V3bFVPQVA3d2YyNlly?=
 =?utf-8?B?S2QranRxak5KblVRanJ5aEltSWV2RlZMOVJKNXU1MXgwSDVXRGFDUFRvMVp0?=
 =?utf-8?B?NlJ2RHliNzI1VkZFUlBYbmZFK0dkK0V4MnBCN1ZhTmI0TDgwMCtMVjA0aWhN?=
 =?utf-8?B?VStsRlAvdjRCSzJpSmhZdERxUVJjc0l3Vk9qMkZLSDRYVjlZNWtKUmp6SXNP?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 3sVKsoW2xZW3M8YMSha40Fmkc3nkC/RF6i6EqmtJoBwRh+c6yoVQganWdps664JZ4JXYVdzjWJBHpt407FDZEabzC9xVzu+fTKSS1fgzNu+cZZdQCyhn7uNJ8rCduYKpw7puwac5hwes4Kf/wbG5ITqDFEeLWKFbCM3YForYCjHt4g+7Sc2ondxp/auT+fcDVCe//EmsSG/K1l0HHtFqP4ArPWwQYd+K9sHoNWAoFtKcpBtYniI0LKjTUhF2csZWaufLfML3VxlP0Y6DiC6wsM5gkh+SHjHsC4s7kOQyWnUs52M0AwCnfCpB/GIALHUECcaJYAr7L9PNR7O66SdDzz76srelXqdAaS3f25x3aXltdYWpMv9h7GxuP8VdAruzu9m8MTlP79UtDu9sRS+07fpogMUMpS2p4K9Fvabd/c0KJaj5FzAmg32D2F4iGH4U2jp4PIvR+xEuJdgUauFpiYIHUnhoRDccH2V50dwfgtMIgCBFlJMnMzWVAGOzAOciz7xDBNTNg98XrmEZUaChEQ2qMCANlm5RhsWVNI53a1w60Mf7qQ1w75WS+Hd+pbef771inaae2LnigJ3vwl6xnYPInUYJmxs53QzBx/VVXc0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d378d89a-0581-47ce-fe31-08dc8598674e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB5943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NjodytebjJ0GLMUoGAMMjCy9fHfzTzU/y9T7DYXo8B4BaKP3YJX63K8OK8kkUgCI2XuVnJ2PS7fIMbRPdJy5UJyebSp0eRupbiFKu+Udgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4503
X-Proofpoint-GUID: V91XPY6zoJtO9rUKf3r-biPHXvPKXXms
X-Proofpoint-ORIG-GUID: V91XPY6zoJtO9rUKf3r-biPHXvPKXXms
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

Still fails. With your patch it's better, LP_RESOLVE builds,
but DNS_UTIL and LIBNMB do not build.

The 'krb5.h' seems to be included through libads.
Maybe libads needs to define its dependency on 'krb5'?

Errors:

[1175/3103] Compiling source3/libads/kerberos.c
In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/libsmb/namequery.c:33:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or
directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

Waf: Leaving directory `/builds/vbatrla/samba/bin/default'
Build failed
 -> task in 'LIBNMB' failed with exit status 1 (run with -v to display more info
rmation)

---

[1982/3103] Compiling lib/ldb/tools/ldbadd.c
In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/include/ads.h:79,
                 from ../../source3/utils/net_proto.h:26,
                 from ../../source3/utils/net.h:183,
                 from ../../source3/utils/net_dns.c:23:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/include/ads.h:79,
                 from ../../source3/utils/net_proto.h:26,
                 from ../../source3/utils/net.h:183,
                 from ../../source3/utils/net_ads_join_dns.c:24:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

Waf: Leaving directory `/builds/vbatrla/samba/bin/default'
Build failed
 -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)
 -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)

Thanks,

Vita

On Wed, Jun 05, 2024 at 09:24:07PM +0200, Vita Batrla wrote:
> Thank you! That might be it.
> Let me try to build with your patch.
> 
> Vita
> 
> On Wed, Jun 05, 2024 at 05:50:17PM +0200, Stefan Metzmacher wrote:
> > Am 05.06.24 um 17:40 schrieb Vita Batrla via samba-technical:
> > > I found the changeset that introduced the regression.
> > > The git bisect command says the culprit is:
> > > 
> > > $ git bisect bad
> > >
> > > I suspect this change in lib/addns/wscript_build:
> > > 
> > > @@ -11,6 +11,6 @@ bld.SAMBA_LIBRARY('addns',
> > >                         error.c
> > >                         dnsquery_srv.c
> > >                     ''',
> > >                     public_deps='samba-util gssapi ndr resolv dns_lookup',
> > >                     public_deps='samba-util gensec ndr resolv dns_lookup',
> > 
> > Sorry for breaking it, I missed this:
> > 
> > From 67f686a9495649cc2c201c051aaa35d5d8c64133 Mon Sep 17 00:00:00 2001
> > From: Stefan Metzmacher <metze@samba.org>
> > Date: Wed, 5 Jun 2024 17:46:53 +0200
> > Subject: [PATCH] lib/addns: remove unused kerberos/gssapi includes in dns.h
> > 
> > Signed-off-by: Stefan Metzmacher <metze@samba.org>
> > ---
> >  lib/addns/dns.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/lib/addns/dns.h b/lib/addns/dns.h
> > index abf0906fdabe..6e605cbec2eb 100644
> > --- a/lib/addns/dns.h
> > +++ b/lib/addns/dns.h
> > @@ -27,8 +27,6 @@
> > 
> >  #include "../replace/replace.h"
> >  #include "system/network.h"
> > -#include "system/kerberos.h"
> > -#include "system/gssapi.h"
> > 
> >  /* make sure we have included the correct config.h */
> >  #ifndef NO_CONFIG_H /* for some tests */
> > -- 
> > 2.34.1
> > 

