Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 368477A92B7
	for <lists+samba-technical@lfdr.de>; Thu, 21 Sep 2023 10:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DFkeo4aSsvoN3i0NNngIJSbPO3HSJWu2LgFGeXI/anM=; b=jmLy5m18H0aKjKoVg+ZShuiCcf
	CNnUyacfONGRB5HibaPNjH0uCQUKHujqNAbCkJq8uFKb0ed7XKohBkzEpBMjKiYApHa9AeNIYms0z
	KYhJCsjmKiHH2+L5uGsdEcOgYsdpjd6+cIe1RVv+7GCbk4dxc8jgQS+TPsrQ3tp0io1xnwnXiZUyN
	Ylw/gP6Fw1qGyNE4ukT7sRzj+iYfwEUhQpt9IJ45oeOqGFg2267Y9QtRbxCawH9Y+cPrfP9Q7u1Ri
	35ZzqEmnORzlPSrjOK/ZJgi+NFzxRn1b+bYbga9fvQJmKRghCfuxcnVpoTLtjrKnp9NwmjjXxkogK
	KPLg3z6A==;
Received: from ip6-localhost ([::1]:62658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qjFDZ-005ZV7-4O; Thu, 21 Sep 2023 08:39:25 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16282) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qjFDR-005ZUy-H3
 for samba-technical@lists.samba.org; Thu, 21 Sep 2023 08:39:21 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38KKJ04l003987
 for <samba-technical@lists.samba.org>; Thu, 21 Sep 2023 07:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : to : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-03-30;
 bh=DFkeo4aSsvoN3i0NNngIJSbPO3HSJWu2LgFGeXI/anM=;
 b=F7x/9I4aLa9z8317VCLHsbbHaAPBWrbvuvVyK+LpYzDdZv6yUaHbYuT4TSJAMK6APz3A
 dQ2KuUSsPENLBYmUtmcwWWeicnKzj/j2BIKnYr4Xuz1ElyE1FJFF4Refq6GV0vs20nnw
 6VjBcVs24DO8Q6aYxIwQ58JjlZMrezXjbLxnCGoNXatFUF6qn/OGJ2ycjreN+CSZ3hYh
 cTCHg4t416viYu8YSJmxkDtGPUcuCe72Jp+u71VptcTaqL3ub2U0d3qhGNFhBBDFoPPf
 hATLy+s9L+BFGUDFRrx+kPeK8Exbma7YAOn7e6mjMrvg8h67Rg3ugFWATUjDjpcwyVe9 9g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t535313q7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Thu, 21 Sep 2023 07:19:48 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 38L5ASjI016059
 for <samba-technical@lists.samba.org>; Thu, 21 Sep 2023 07:19:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3t52t7w9qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Thu, 21 Sep 2023 07:19:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oL0NuNRiSUjjBX75PZ0UkdClZmEGjlV2w0LRh/2kFdL3Z3p1Vox5IpQB1DURcbuykDx77p2frSJ+9kNy/LEbd9+8OGDnJm+aPXRyimQx1pdlKKbgSmHarP4IMRt0eXr199gfpJKLCwJDjihyjCSSIJnLxUghCzPH8PRo/Fs25fWXTwA+N+SVJPAI5sLwfbLiJ+PTdNkceTE0rz9SsBgqh1asdQoL9O2dFDRoFeUEybXS45YWeIn36nFY15tvAI8Nr2IRt7oKoWx8FSbe4Hhnp8hhtQX8Odmj1u3LaoolZ9lhpaRja1ByXTUDq8FIM9Ab6aCojhOGSuWWn7kYGMDEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFkeo4aSsvoN3i0NNngIJSbPO3HSJWu2LgFGeXI/anM=;
 b=Zw0g//ieWuL2dIaGm5F9s4N1S1R2YMNcEobCVhXaSSYtoVwYf5Yz99jm3++18fHnWvuhIskSZNi4CLkxWLT/gL1FdsXT3IyFcCPQofmRQ4GyXjCIPZR+XWVRLA+j1oQC9Sgii/pfV0pNmUl/uELhqUxZu2EVs6NZ8AfPfSnflZkq31WheDw19ti/I5UPbqqP2keBIw1huI+ccwu1nMmCPkFHDUfTbZYoXDKLVIctjo2pKhSojuu1X8aUQ7ichNaFSex0Iszs4xmV2CBXEvsDvPH6FwWnJeUQdtssYRhdgbpLIqY2rDuGo/7byLB+Jvz2eeGEA0lbaM4oiDv3Il6Wkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFkeo4aSsvoN3i0NNngIJSbPO3HSJWu2LgFGeXI/anM=;
 b=KeY39KgnzzZh9WN0wJ/jIkcZe9SYHcMoGTs+zIlF00M07ZMfHkYNKvtGNrpxV+mMbwPeh+a3mCClyHqHd+TBOG0GWe0JK0v4OMu7vyjyjECF4YP1omstGeXq7ETn0IT7anl2VC9ocsXBUxJLRVU9PHfE48vYME/i1qpbAP0bpww=
Received: from BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Thu, 21 Sep
 2023 07:19:45 +0000
Received: from BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d]) by BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::da7:3e01:f986:129d%7]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 07:19:45 +0000
Message-ID: <85be042b-f13e-2280-e0aa-5d074fd3e4c6@oracle.com>
Date: Thu, 21 Sep 2023 09:19:38 +0200
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: How modern Samba handle krb5?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd76c9d-f9b5-42f5-c260-08dbba732172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: UMAnvh82e2mG1BB4vRLOYHghF8pj4lvmTsUTM6ObBFWPCoQfkGoR2+kzOwg/mF2K9x91zk4xUAIiOJM+hQhvlwoynGNmnXdNoT0yPQOlfpQ1l04Qb7kLO5pWpdFxqGeBPRhZpOJSkvcXe4EEHz/a2pDHzCYp7gBTeWt0ruhdnUqVghzs8GLqC2CZlnO/ndFVR1lXbMPXb4XByo+lHjnfzRlISKu3ZxCvc2j6A1cZ9IToqyW89phfY/JmCojpwhiYSh9CRiNRsEeu6yxeALIM9/SYpY5D5uvA97pg64S6q9RuPUiwWFfOhdNsLoqV7dWpq+ddJAuRSXEdbtCbu9uogdeLDNxHb9gHPKFu/AzTLYnERL9QtcvFx1hWN1yIbXjrhBh0OSFPDTMpshz5IbwYgv20yUvcmF7WDjvbJbw6XA4ScVtGkhESSlRCsBmkoFMBuj38E4ItvHSGATCTITVK7Lua0CLaRu49Vh3wDk4S0Wysf9ObehBFazvptHPHIxrcbdiZJC0/WQcwf0BIGbF6NURzvSZzL+qKhXasHYx8apS4fAsC1WEMHVSu7aIW5jn5ZnFRzcztx88bmvxn/n0kzMjKo8o2057sQK+ss4WVzlxegf4fLyIao+ZmsW+gY991mng9hq5P2ngdKk4Sxbj6ww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJ1Uk1oYlpzRlg4aXc2OXhZakFJSDY1c1A3NFY2aktnYWNGbXU0SlhNbHNr?=
 =?utf-8?B?VVpaMGsxUThXYk94R2ppcFBmajJ3YUI1Qk5keXZIOHlscGwrOHRzZGtLb00x?=
 =?utf-8?B?T0dkT05tc0RRYm1mZWFDWERSR3VxMjVwNzNIR2xha1Q4ZmZiRVlQQU1OL2Fm?=
 =?utf-8?B?ZG4rYXBaU2NBbmhXa2xLZEM0c0dET2tOZzEyY0dJS0JobFdnbXQvR2JHanNW?=
 =?utf-8?B?bURzUVR6NnMxV05LaGdDSDM0c3FTRmlncVA3dkJJbnBXblZkSTZvNGExeUZU?=
 =?utf-8?B?TEhxUU5GOEE0QStuUE1lOUY2L2xqZERNVWlLU3ArQU1zYTlGR2ZJWk1GSjBB?=
 =?utf-8?B?U01raStEbjZRckFMVlVjT0pmVVN5RVJJNWFwOFRWYlVRYTI0dWEwRDdMdmkv?=
 =?utf-8?B?Yk9acU9IMXZpbTRjQWxjenhqUjRnZkR2K2VWZldEOUpENklheUlrYjRoZTRU?=
 =?utf-8?B?TWhJTnRSbStDY1dNeDFna1JiT052VnlmSnRnN0xCcEdqU2VYMng2d09ZV0Rk?=
 =?utf-8?B?WUF2QTBPclZ2RzI1NHVWMG5zS1lQUEw5MkNiNnV5endmL3IrMEFVbnpNNTlD?=
 =?utf-8?B?WXJxNUNIYThyMytvYnVNbHVoTmltMWVoQjNmL2ZUKzNIK2svbEFzSEswMi82?=
 =?utf-8?B?aEFMaHZ4VEd6UzJUcW9mekxFYnZPVjk2ZVVsM0x2U2psMUJ0WlBMLy9OeTdl?=
 =?utf-8?B?VjlJa1l1VU5wSExhNXA3TjhNaGVxb0J2eTMrV0FldFVaM2lBRGpuYUVEamd3?=
 =?utf-8?B?c3p1bERDWktXdlNCbG9BNk9IRERCZ1ZqSDVYb1Zvc01jK1A1VzkyMjUrQzV0?=
 =?utf-8?B?N0RZamlvcHlyZ1h3NE9MbXlMdkt4SVpjRVppcjNhWXplSlYvV1NqRGlkTEln?=
 =?utf-8?B?TmR0bUIxTVlSV3RJL3BxdnVJeHAxbmZKeS8wR05CaUtQTURzb3RQSS9RdzM0?=
 =?utf-8?B?eGlQVWtlTDd1ZW9VRUZDclN3WldXNlJQNTNNREtSQ3ZJMzNlSEhwa0lHTDQ0?=
 =?utf-8?B?VzdIQnJQZmxnWGZaWlpPWTFzWWx2alRINWx1VjBUbm93TExDTjR6cnowck8z?=
 =?utf-8?B?YzVSVkl6UWdSVHQvTFRuM1hXeU1qbmxOR0VUUVMvUkNUWWtUSmIrU252WHRN?=
 =?utf-8?B?d1pQRFY4NDJyYk1Zc3U1RlJBOVp5V1hJSytoajkwdDVCak5MRzNQUGdrb0tD?=
 =?utf-8?B?MFYycmk1czltd3BPdnpBcnhBSEE2VjFDSjhCd2g1Ykt2QmVZZFlIWmN4SWk3?=
 =?utf-8?B?TnNKcFBQa1RyYkxhWVNoelJxUnV2Q1kyNjB4MFRkUjZqQ0R2Q0svN0lWaU5X?=
 =?utf-8?B?dDRpSjRpZ0ZXV285UGl0OXBqc2FDYStFMC83TjAyZEZJZkpVVS9RODdtcDNx?=
 =?utf-8?B?amZmUkhTVlhwMHJtY2s3WXJybHoxeElSQjIyTXNFODBjdFYyZ3JrbVRkbDF1?=
 =?utf-8?B?TEVyT3lmakNyQXlqUTk1cGwwSldwS3EwZUpTWW53OFVCTVdDTS9nS3RSMFV5?=
 =?utf-8?B?eDN5SVQ1NTFZVUZxdng4WVBhdldFbGVCeWtVQm82bDl6UC9TU3ZMR3lFOWNp?=
 =?utf-8?B?NDZSR2hPQVpVb2VQbnNMbEdYcUJhRE9Nb1VMRFFyaGZQbHRNOXlzb0RJby8z?=
 =?utf-8?B?c0J4bW9pU1ZIa2oxN0RVSENuaHpjdWN6ZWhncitER3U5eldWK2dKVWd3QjBa?=
 =?utf-8?B?V000eXAxbjR2U0FwamVEN1B4K0tuUFpQL1o1MnYweXdEdlp5d3c3RHRPVmRQ?=
 =?utf-8?B?dGp3Uk5nUkVSZitiL0xEN3NiQkpvL3dVYnVIQUhjVnhFTzB5YmJxblpQZlFt?=
 =?utf-8?B?bkNRaTA4R2VFMjZzV0JmSjRBeUp6Mk9tc1hoOXNGRjEyN0I3R09SVTdONlgr?=
 =?utf-8?B?a1RVYTZqS0JPQjJxZWpibkErK0tWR3A0S25weXRYQTdDR2tQQ2RlRWYza3ZL?=
 =?utf-8?B?eTRPQnZzdjFubHJwelNSUktoeGRFcU9naFNHNThOajRmajhtQXcxMVY4RUtZ?=
 =?utf-8?B?NXBrY0ZwQlkyZEx3N3hBUGplekFvM3pJL3J2ZVZQaTl6a2FDMVQwdlJSZWZJ?=
 =?utf-8?B?bXl1U3JIVDdjMzE4UkV3WmNrY3labEVrdnA3WXJtV1RmbkM5Ty9PdmFqZDU2?=
 =?utf-8?Q?EM++4KcEY6z66JU9e1g4OsXOO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nARpkZc0lmcsnVbuS4wAVXx39mBrThBfa/I45LtJtMNyrOvOVSkClPeaV6LciKNVMC9BGq0xABzL2W5g8VKalDsITlHJ0Bzw3cdK9FfoP7E7+mVGFwPQru4DZoPv/q+SWiAbKaME84L4bAsdW7UOwRDQcs+9keyTpXsFWZ2XcsrXslftRV789t+mB1rlBSCymfctEerVhUIFMEnVreQAJYEvbRCEjVkPouju3id3qQXK7571T3EXLEWm2t/byMynz73W2a+xEuXddHZ7sCZD3zy3FSBhg/+Jt0rE8FQs+mrf6I23XuTL9y/UNSQrSIyadNVCz2wcbl8B714vbQLNZ1+pFxFlWMfLzX6F32Agdhf3SsrjjagLMA9rtdAYT3A5LoDNLlriej2tVcVa1Q05jF2OpvDGoOzxdaJZz61hNqZgSD96muIPrbm5WwCACPqWM5vX6E0/kHYlo/5nQur/8xKNbZpTJem2sqg/htWiui7iVxlV+taMCTlupyfCV0kfOXf6rlVk7ckZQTa2ty/3ZmvAcaCLj1NZNPpxtxrGs1MWvC886Io+29hUUQ2guV7dvBZJBcWEw9T4+zfKC3jg7/RHCCiPiNlVj9DkbWWgaUDYCAzImYjzd5RIhw68FZV1biUUbYuN4mxwSPBXFlxh+QJITlIkvMLyLGsDo2leDTKGNPfJySp26xWdOuzPy5QRWVVCbsYFq3VBpntWgp64/tLIUIqTON6MeB7zPvQezQdngRBziHJGyPNf7Km1huWGPXvO/vNvfAZdbGLPCzJQKA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd76c9d-f9b5-42f5-c260-08dbba732172
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3842.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFLucOyLm24Dgp9fSw6OSX2cwuv/9kBUULaRsKT43h1rFcsp3WbN/HcNWEqiYsyucZFeuCMB6JdYrKfJRFQdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-ORIG-GUID: tTMfVFek9D1-Jc1iAPAqavC6mI2Hzq3H
X-Proofpoint-GUID: tTMfVFek9D1-Jc1iAPAqavC6mI2Hzq3H
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

Hi Experts,
While sniffing packets I have found "net ads join" and "winbindd" 
handles krb5 by such strange way:

No.	Time	Source	Destination	Protocol	Info
47	38.477244	10.163.87.117	10.163.87.58	KRB5	AS-REQ
48	38.478496	10.163.87.58	10.163.87.117	KRB5	KRB Error: 
KRB5KDC_ERR_PREAUTH_REQUIRED
49	38.479156	10.163.87.117	10.163.87.58	DNS	Standard query 0x439f URI 
_kerberos.SMBSETUP.CZECH.SUN.COM
50	38.479597	10.163.87.58	10.163.87.117	DNS	Standard query response 
0x439f No such name URI _kerberos.SMBSETUP.CZECH.SUN.COM SOA 
win-lqmsb4eue0v.smbsetup.czech.sun.com
51	38.479833	10.163.87.117	10.163.87.58	DNS	Standard query 0x0e56 SRV 
_kerberos-master._udp.SMBSETUP.CZECH.SUN.COM
52	38.480165	10.163.87.58	10.163.87.117	DNS	Standard query response 
0x0e56 No such name SRV _kerberos-master._udp.SMBSETUP.CZECH.SUN.COM SOA 
win-lqmsb4eue0v.smbsetup.czech.sun.com
53	38.480366	10.163.87.117	10.163.87.58	DNS	Standard query 0x50be SRV 
_kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM
54	38.480658	10.163.87.58	10.163.87.117	DNS	Standard query response 
0x50be No such name SRV _kerberos-master._tcp.SMBSETUP.CZECH.SUN.COM SOA 
win-lqmsb4eue0v.smbsetup.czech.sun.com

...where Add-DnsServerResourceRecord do not support URI RR-type and also 
the _kerberos-master is not commonly supported in DC. Can Samba still 
work with Windows/based DC?

Older Samba releases were able to respond on err: preauth.required by 
preauthentication so I am curious why the modern Samba will fall into 
such madness in such case. Is there an option to rail even the modern 
Samba back?

Note: on Solaris I am pushed to use MIT krb5 API where my attempts to 
build Samba with Heimdal to check if it will not work breaks on 
conflicts with system headers.

Many thanks,
Jiri

