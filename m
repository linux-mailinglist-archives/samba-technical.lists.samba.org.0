Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A188A1A1
	for <lists+samba-technical@lfdr.de>; Mon, 25 Mar 2024 14:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Pa4oM2DJzAWitv2awq7SEZ8m02O49MUxFahnKPIJ7gY=; b=Bb4iL1Igg8hwY/ukzux31jVvYX
	3k2MizfohfOu9jZjlMbkQBosD4VId6dEg4KHt+QDYPVMqWZs+iaL3sjAnzqz48LcWk+gfiYQSfnft
	GvRcBQX67awU1exXK3zKaQ0KKkNUFXypA79i+Uh1mB3d3dIwydYnjF9c0U/j7146KgA7OSApTk0+0
	y5WFcX/HMzkk2hAkJx3/hjem2SZXUYeJaonKHqPfrMp8+iwCWIyu/1G+Q3IgzbOay3KXrca6J/tzT
	vY+pDrQf3oql1E7Bed+zHmKRXorVnsTR9c1hpgZ+ybhlfXreYDVKg0T4bibi72GE8DB6mqbkpiQQN
	WvkAWBNQ==;
Received: from ip6-localhost ([::1]:34720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rokGi-001Eyo-2L; Mon, 25 Mar 2024 13:21:41 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49294) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1rokGS-001Eyc-TI
 for samba-technical@lists.samba.org; Mon, 25 Mar 2024 13:21:39 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 42P8pNLu020195
 for <samba-technical@lists.samba.org>; Mon, 25 Mar 2024 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-11-20;
 bh=Pa4oM2DJzAWitv2awq7SEZ8m02O49MUxFahnKPIJ7gY=;
 b=KhEygcSU0cPGkPx40O2lzQh3iZ0ygHcaBeSe0YqZ3yFERR+7NUoVp57/vD1tnzljeVX3
 BwfpC6ze1eW0Vr4mkk9TRR8yRNo8lWa9SO+RbpbiRTE2hfL2v15rar6hxaMOZC9keh3c
 TO50CF+Kke2CBbHkCG5AeJNLHz7XvSz4FtUNcpVqYWCekrhJjVYpQEozgdkBzM6myy4X
 B9S/ZjrGrUUz7UH1QynalLbvoKF+kIa3lUSh1PjDkHZ0uAjY1QhF5m5muoxXZYT17ksG
 2FwKY2Gg5qIed81LP34kr7dQHr3fqBor2LJwkKECvRzp7XXfWrXNhBU4RZKONnryZEp2 aQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x1np2agqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Mon, 25 Mar 2024 11:48:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 42PA41MS016113
 for <samba-technical@lists.samba.org>; Mon, 25 Mar 2024 11:48:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3x1nh5c8nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Mon, 25 Mar 2024 11:48:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D6gUyveuFFN3yosdGQncCrW5FKQAZY05tsUdfdIZdqk2dtTmuRd8YRQsRVw3mApZTYbCQ+TujsZFS4B/ooz7/BKxFMC+u1rtK5Xcm89IbM16y6PTqTbpAxkuY9A3aLaBSAeJfmZoIvSNsTiqRJYxeWfx1rVcXCJXcuoLlUdSxyVNOxA6XiazwBBROw8ylxxcJMme/th4hQlgV0aNTowi3OSEapREVthEiQATOKdVxdH7y3dNn5MdN68V8DHdc9x3ILuoxzv/u8xayqCmUT13MY2lv68/DHilHR7rAKbkAsgRieqW3QKBMqh5Idbjp7SV04u/nRI0uhC+IEoFB6S10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa4oM2DJzAWitv2awq7SEZ8m02O49MUxFahnKPIJ7gY=;
 b=iuo5O32irdO3eF/0dAwfYncOBB+GE+SsItgfa7uzlMUWpUxRBRMjEMnZcVPuQV4UnZQe3vAT3hFsbDW+j1s87aGBj9vjkYul/5mpZ+HlLBkfvFG5XH1sGpBROnjEh2vCHWXLIeP2dKAo8So3mxkymzuLduD9NixONyjiqMInXr4zDMlrjsO0RhEtx08GBDTLyoy1TB9V3YXkdXFluU/CHm4w9kBjdIB5v0nQJkdi7L4uTZlN+FZb2v+QdrF9uOPZmTgb9NoZRl9H9Kr5V7+4lZI/94X2krzOmUxm5oTmYURMqvv+c7mcJbBmrQ2POpsPsgPZLjxSpiB5ZKUbvk7A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa4oM2DJzAWitv2awq7SEZ8m02O49MUxFahnKPIJ7gY=;
 b=FTYDITYjKUApTS2OuTMce8g8GEW7fCARx6OAZZmxmNrN5spgqgGVBp1rJ4pmWLg+b/NkUV8uGWLS6pAOnHLcV8ojz4xG5MHeYman4MR2awIRWGBN3IXdm5fORmC0ngi/J8VO778B5uJ4I6h4WhiETv+ZnT1KCVuDrKh2ySpDSGw=
Received: from PH7SPRMB0112.namprd10.prod.outlook.com (2603:10b6:510:27b::15)
 by CH3PR10MB7713.namprd10.prod.outlook.com (2603:10b6:610:1bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 11:48:31 +0000
Received: from PH7SPRMB0112.namprd10.prod.outlook.com
 ([fe80::275d:1e2:ebd2:e8df]) by PH7SPRMB0112.namprd10.prod.outlook.com
 ([fe80::275d:1e2:ebd2:e8df%4]) with mapi id 15.20.7409.026; Mon, 25 Mar 2024
 11:48:28 +0000
Message-ID: <60725160-9dc1-446e-8abf-c96be94b50a8@oracle.com>
Date: Mon, 25 Mar 2024 12:48:23 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: How to obtain username in idmap_tdb2 script?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0112:EE_|CH3PR10MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: cc47f0c0-2030-4d50-0172-08dc4cc17c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: TisYgOO+zl9s8bxOmCd4mAtwikT/AWKR23YpH+dNAj2XaGRufoWFtTPo+MFP9KFpPYfI1QaG2xeuI0+N8fvza1ExObMluNqszWBdX0O6cbOF+Wv34UG4MHJLmvSizY8OV9qxaD68aRkllPv1yaR3oeUjRDiuIAR/9J+8vmFW7lwpxnv32BfzYUTgSYcmlGcBRMd9IblyQzdAkVRzcg/e8wuJn6Q/060S3tyvkhfPyKWpAhkFgHU/yS89k5ul/1yqr+iexaGQKouLIP9+iK2vOZeNIGj3gN+cqiBwB7tigkPHV3zyiHP6uELIssoW28/kzDW7fKC0l7gBbihIW3xpe8iag5lI06t3vcZ6KzncCvfvclU2uU7s52S3/dcIj3ecdHNydsLR+dbABlwVHlO2mqz8JOVr6ei2AmeTuyKFQEK/8WYGqer4AwJRHk6auuU5jb6hL4LUnOBNKfdxhrOEGsn3N68vPPRsfwtOjHzoEGni2AsN3ZoZz8KtUbwWo6nvpNevXlj+zjq8nZ8O5+zu1Rxtrd8puOMg0kOl1IUwGNkygrtlFWH8PWEs9f7aaGY4UPAu0Xu0mdKHnDFHstbZ4rKeV0otUpy+sEOry423PoaarDTHgND0WxfmZHASxGKP7c8ExjA16jG5b3FvX2dX/jWFqEn9/UNL5pfTdFALQxk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V25QZFJFVDc3TnoyTnlCUmhGOW5TU1NVT3JrNjRGQlZ1RStqaDVGQTdGMEVV?=
 =?utf-8?B?d3JVRzQ0VE9qR3g4ZXIxNWZMeUphdEtsbzNDMmFoQ1o3UlB2b1M1b0svb0JU?=
 =?utf-8?B?WFVwTEpDLzRDWHJ3TXdWR2FxekxRU3lkUnFRaHhWM0JJdmI5MHNLRGZla3Zr?=
 =?utf-8?B?SzZzNVphU0FCOVpSOUdrM21ET1hZaHcydXhxNmZxM3I0UExTMEZ6QXlOdjZs?=
 =?utf-8?B?dmx0WDBvYkE4WmVEMncxeVJqZHZ0eGdIOEJIMkNIdEE4UktSYTIzdmh1SUxm?=
 =?utf-8?B?MFhmb2ZWdEZaUUFFQU1QRytMVGNaY1NnQlRFMGlRZnh2MG5ueklyblVib3Jh?=
 =?utf-8?B?TyttcVJTMDNCV0VnMmRhQTVEdDc2clBLVi9DYVdxUDJIOHRTTlRXa1E0S2VB?=
 =?utf-8?B?dTN0S0pnY1pzMThHd0xEb3NZb3Y1WDY0R0Nudmc0bllOZ1kwOUp1TENhOTFO?=
 =?utf-8?B?WHdVVkdiZEdaTU9sYmNWaFRob1lpUi9LMUFVUHU2aTk5QkZiZlg4dEw2cUZU?=
 =?utf-8?B?OEE3Rk1xYkFSbzlldUdCTS9aVW5wYlV1dGtSN3lwdzN6ai9EWlJQR2ZzVFRZ?=
 =?utf-8?B?cnVWejlJOGs4TW5JQzZzRDRMcnhPV2tUdUlodjlMWldRQzJwWjdva0luNDhu?=
 =?utf-8?B?ckhpSHhncUt6ZUhqSklaaVBRd0RhVFZBNm1sMndJWUMvdjNYaGtDTzZqWGNM?=
 =?utf-8?B?TzNPd3NxVDRKUCtCWTZvRmZ3T1NhVEd6d0pmVk9KbTNZeTRjZmVXUFBxeUhp?=
 =?utf-8?B?WGI2NlNwTTBmek1SWDZCUTJ0Y2xuMVoyTjlOejVGQldUeXlwZ1dlOVBTZlBz?=
 =?utf-8?B?UlJLVEhTeTJPc3kwNEVlTEwxdUZPeDZoTFhVUXI4bGc0LzM1cmxzNUp5dG8x?=
 =?utf-8?B?VkJuTitteWpWRTE5cE1PVnNPWFZXdXZJTmVzREpzNkpvaGo3ZW04UG9rL1pF?=
 =?utf-8?B?QXZGL2Y0U2JXWkxPUitFRkVGbTRjaGEvcGdtajdFbU4xRVE1L0VjSVI5WVUy?=
 =?utf-8?B?NVJQQWNENVIrM1lIUEtLNnRTZkZ5WU1lb0hHQXErZlZHODVWVXJtS0lUd014?=
 =?utf-8?B?OXVCSnNIVEhXN0dCejdWdXBlNFlKb3J0aDZDcmxuR2ZsRExUampRQ09ld3pF?=
 =?utf-8?B?NkRHejlVL0FFNGo5MThzVzVqaVpnZ3VqeHJCcER1VzlmTWo2KzIyUk5RcVB6?=
 =?utf-8?B?WHV0K0J1cnR5ZCt2WkI1ZVlSYWRyU3NxY04vNTcyaDhJTHo1Ni9ISy9PR2dV?=
 =?utf-8?B?YSttQTIxc2QwRHM5YldxRURuL3p1WHRMWEVHRDRuaGQyS29iblh1Q0x1Vzhi?=
 =?utf-8?B?N1dFZFJSTkx5eitEWHpHcGEyZVZNdDNVNHlVenZWUnV6WXdzcWNRcVFQMzZi?=
 =?utf-8?B?Z0k4cmRxUFVSZWswODZIUXp4d0FQSjhFckdZU2pKbUgrbWk4aHk5VzNDT2RD?=
 =?utf-8?B?SXlYSVZQbmEzUWhmSzB5YkFmK3VFSTg0cUJJdHc0ZHMrMGVqR3ZGenorUXoy?=
 =?utf-8?B?dC96a25iY08wcmRCZ2FSUytITlNrVDFIREhYcGtUM2ROYXlEeEJsUjRrQ2VQ?=
 =?utf-8?B?QXFjN1JPdWlFREpYWEJhZW9BRTkxaDZEa2FXZmc5RnFEcGZqN0h2R2JCbDUz?=
 =?utf-8?B?ZWhEbmpsZkY2SUgvdkp5RzFvVXVOekVLYXlRWkd1SkFpQnVmcEZkZGxaVkF0?=
 =?utf-8?B?SkFyWDdzZE9RSXBLakZyaUFMOEU3RCs2d3BiTUJNMG52WG4vVUpKbERTTjJM?=
 =?utf-8?B?d0ZUME1obE9EWExuVE1DQWxNVWxBcE9rOWR0OWNJcVN4MXRqMXlkWE9Ld1RI?=
 =?utf-8?B?WVpFSy84MkgwM2lSaSsxV1BNMlMvaXNFV0hsYTJJRVQvQTRZUmJCdUp3Yith?=
 =?utf-8?B?aHh0djVXbXdsZWNtWUtSWFBoeW5wMlByU05qd2drM2tjWjlFMVpjd21PYlBY?=
 =?utf-8?B?aDdyc0VKNFhPZm9MUTFBQ2NMRmxQNVpCNnVCUFN4K2NtS2tYakh4OWFZTnkw?=
 =?utf-8?B?R3p0RHFET3dCd3k3QUxHSFpCNW1FekgrZW5HcWw3SEUyT1JNZWg5UEE3b3Rq?=
 =?utf-8?B?V2M4SU5rZXdoVjk1ejRHa0RyWlQweXNPNWFuNlIvNVY2SHFxL3ArdXVyYnhP?=
 =?utf-8?Q?5NBUpZwy1k7wnr2ii0ZwWVHS+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ZhFjy0w6ka/D39q5ZejQrm8SKVCUPyMb1RLfKlzqkBySVUCPFcOYpWAI0vzOvoa/hNxr+fKCGtJUD+Ffc4wSPxfjYGcaobQQvuweUAQDFaox7m1zs1N6xB1LKc9c92MDXzNuY+Dxxt2RQ26FILnfKWyTuu3wjFJPzDDmya6pnq93iY1QuTsOT+pvSjmJXxZGCg1fbfUOBZtyZRLkVziwvpC/svYAkJ8fjvssBPYlGv8hQTTulJsMHpZCCxhb8WCNF1nninXaGrhtAmqV3SZdP1OZk2yOs5P2/V1T59/1BH1YiUwcftKymv8OmWZEETHekh39TgEb2mSLbU9us2d83KxAOCQlZpQnHyvigmAfBUym04AXh7lRHjNP3iwkB//o/S8dXEOlL46cIgYjrW9yPHLjCobIOJkrblDy3tPEd3mppqIqeAwfHsGugypvg5uW5w5wC7pBPWLAJfPvlxfh7XpiU58ggOQJ3MygCPAYILaO0X5sTH3zZxFr/meURKCer3rqG00PVirXVHz34ulFVAZSVNNblOPwR3NbscWsBpF5WQueZZ497BdtyPi7Ql1GhzsWHKk3EwPIktKCPGnmi3OjXdK1qgp+SBPfsbRLE0A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc47f0c0-2030-4d50-0172-08dc4cc17c9f
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0112.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXk9F9iLUkVypgHXyorl11Y1zYBDKzQSIMshvJoq25ueEqk4lHs8VhWxmrs6Ga4B1063JqLKWZllCEuqRH6i/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7713
X-Proofpoint-GUID: ay34NWJxJdodOiHRiTNC97JCYZ1EYO7P
X-Proofpoint-ORIG-GUID: ay34NWJxJdodOiHRiTNC97JCYZ1EYO7P
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

Hello experts,
I tried a script like:

#!/bin/bash

case $1 in
   SIDTOID)
     echo $1 $2 >> /var/samba/log/idmap_script
     name=`/usr/bin/wbinfo -s $2`
     echo resolved $name >> /var/samba/log/idmap_script
...

to resolve user-name instead of SID to be able to lookup local 
passwd/group tables for UID/GID and return it from the script.

note: I also tried to set domain:
   wbinfo --domain SMBSETUP ...

Goal is to avoid of using the username map in case the thousands of 
users are needed to map.

tested by command:
wbinfo -i SMBSETUP\\User01

/var/samba/log/idmap_script:
SIDTOID S-1-5-21-2333814099-3920965580-3603487294-8647
resolved


/var/samba/log/log.winbindd-idmap:
[2024/03/25 10:19:11.783791,  3] 
../../lib/util/modules.c:167(load_module_absolute_path)
   load_module_absolute_path: Module 
'/usr/lib/samba/sparcv9/idmap/tdb2.so' loaded
[2024/03/25 10:19:11.784043,  1] 
../../source3/winbindd/idmap_tdb2.c:561(idmap_tdb2_db_init)
   using idmap script '/etc/samba/idmap_script'
failed to call wbcLookupSid: WBC_ERR_DOMAIN_NOT_FOUND
Could not lookup sid S-1-5-21-2333814099-3920965580-3603487294-8647

on command line (for reference):
wbinfo -s S-1-5-21-2333814099-3920965580-3603487294-8647
SMBSETUP\User01 1
...it works fine

Do you have an idea how to solve this issue?

Is there any better interface i.e. on python ABI?

Many thanks,
Jiri

