Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4506DDC3F
	for <lists+samba-technical@lfdr.de>; Tue, 11 Apr 2023 15:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=D/OEqXJiML8X5MY7mM+9CbkZuprCZp9mlUeLAYBjNyc=; b=2PetciO5VfQHOmms+L13Kkpn3Z
	4FbRjj8Hjd+eIu+ThMgpUEQRtwqLS4A4MB9h7CVLXVRlGQ+nmerGg13e6RrMIdgBFwlPjp6CKI8B0
	fDCU9SDt8E22MJosdARwJ04cLobJPpsApTzI/joBXafh4R48CsnXLXIRp9bRfrMI2k43r4IyadE8j
	gDiqUrym94mvwm4et6v2seF9mdJk73rP2gDdGPenDpl/y7sY33p/bxeqdQuHI4FYA/bMrqCzYUfsC
	HKnHe2r+ESNpq8dDOegiPMNaTqx3i/uvfyDab8l8qRIaMwj1h7jnjlStFCUSM9KRNTwJJgaqzKOp1
	s5SyM3dA==;
Received: from ip6-localhost ([::1]:20606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmE9V-000MIT-HF; Tue, 11 Apr 2023 13:35:17 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49256) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pmE9L-000MIK-AA
 for samba-technical@lists.samba.org; Tue, 11 Apr 2023 13:35:09 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33BBOUYS028983
 for <samba-technical@lists.samba.org>; Tue, 11 Apr 2023 12:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2023-03-30;
 bh=D/OEqXJiML8X5MY7mM+9CbkZuprCZp9mlUeLAYBjNyc=;
 b=lw7OagwgxjBgkLQ0usJiWwpHg003yLGme139zbpIEgD9QL56USFEWC35fpwtbzN0WfuC
 dv5aMW2WYzJqI/EnvYp4gC1LO0ll1FcmsX8aaIysK7gyCd7qfpkYTf/ZUdomjyW//52q
 QQioD2yyHrpFHnif9DRZ+p1T1XMvSpKg5MNvoA3a8uD+AXDzY1uqeq3sw1Rs0K5gha/3
 xeKQCqt1roF0XODfaGcllfeI+5blWueN/vQg5xAt6gq6WMAXNWGOcQWEhhcNi+sv059x
 tHqS0B9abyaoFsb0iLme/wGL0FgA8atrYBkYoCgVm+NsoUySmWKmpG3GIxBz/sLUCqcJ DA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0bvw9qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 11 Apr 2023 12:31:51 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33BBDlY7030989
 for <samba-technical@lists.samba.org>; Tue, 11 Apr 2023 12:31:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3puwbmyfxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Tue, 11 Apr 2023 12:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g79dmo8QAhxSp7sM0EgGGEWfupHWTMceQFYDpfk0VtNXjWDvwvdp8iPWMrqxoaCaAmW9cLWqjY9O0tZ6XpsSFWKOaJJsQ/oA3A5AENh75HrYSehThnvIlHPXYbogBqjaC7blO0tn6iK9hTIxYE2hG5TIihyXIBFX6ysXO33fIDaWrtdMsVHnCftK2dNMvHO/oIq84ZMtnBWS1oM8Dl2rLfyONTRAqhzPmWT8f2YY/dJ2yEEQ4f+8pBDnVp7CZk7d/m/HeJIQWQB/xQyIc1fs2N2bbnz9wydOfLhbbzP1oZ861aE/F3IC6u4WrUc+0F+wPpS0GQ4Eg3yA5C8M/g8HbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/OEqXJiML8X5MY7mM+9CbkZuprCZp9mlUeLAYBjNyc=;
 b=lxmJn3cFjOgLM+j3FAgkBavcqI6bERFV4BqBgjpEbUWWQV/nHRChDgJCxFmijAukmT+MCiE6I27TLWhxOrBiTjsh6jAZ8aLFVQuO+O6MWRWSE3IMWSjOxk4VWYttR4RUS6qLRu06zERqDnEm7YUBbpWXoEwkubrW9z/uS+GyK8aH9hCfveDK4vaERJI3BJSSVu+qqwaF+Hyt7gFC4OQIDnTYOyWnKLG8V9FNymlMyz14RZRcqgATWp6IRmzstneCMUJg3UtPPzi45eDcvO0VLMPKCi1VKRXC+lEG7/5Z1ujo4FA0TxfmQmC75cNXjSxRFHJbEvns43ZgyvDGKIWTjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/OEqXJiML8X5MY7mM+9CbkZuprCZp9mlUeLAYBjNyc=;
 b=NYs09UK5SrbbbVrGAJHFgKpt5XQB8r/VRsbvHEjfOICp68lfy8MZH3WxVYPy0N0U/GwIG3NMuDbee2bFGJm8Lp3Ws7CO7wPzvjJbmhJkmdDQu1aeXRy1h4/osZKt4Jfet8rxMuxPflQ0P9srlrBXNfndMKtenNPw9uaAiGNRBDY=
Received: from BY5PR10MB3842.namprd10.prod.outlook.com (2603:10b6:a03:1f9::15)
 by SJ0PR10MB4462.namprd10.prod.outlook.com (2603:10b6:a03:2d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 12:31:48 +0000
Received: from BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::3f33:6792:e45c:770a]) by BY5PR10MB3842.namprd10.prod.outlook.com
 ([fe80::3f33:6792:e45c:770a%6]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 12:31:48 +0000
Message-ID: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
Date: Tue, 11 Apr 2023 14:32:27 +0200
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-US
Subject: Recent Samba (4.18.0+) winbind configuration ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3842:EE_|SJ0PR10MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: eef03c14-e348-4b5a-fd61-08db3a88b830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: ORGeuqxkioKO8ZvxKzQwRPH9esmuN4UPBBJdJmS+6fkwEGj6yV22jeCS40NTztYSrpFH/D18a4OdXy9mO/cCCZt6jKN39Bx1WyYGMRmy0fJLa7wjf7+a1hPDk5xzk9HNhGewDmayRekuu9KUCZlCb1NQ4th7LUasRupoR15E0EgfnGqvLGKkXfMbp0F0b9dn8pQaYbaA6+iO2FEB7oYyUYwdBTboKxxVH+4uogC89Lv2coF4/S5nKNQSsvJaHKbtVVhsEka7lNfzabIiP7/oD+pfjhyZQv9dQiVw0WJnxVKPxDGXOQqt9eNbH5leinLNmIVavlpl00AcLhbFd2hxLV8xA08RsirCPNTY6EwLwyR1rFC5JSft5Hl09M6sRRe9RHTVAZ3rAl+2Pd4Jv+P+aEXvjYm3rqmlI+1ATTjSP6hzeiA5X4kgtuAg6EzSkK/+173bidmBlW41QUpf+2G0R8RRF5nYf7Grb2GYqGQrWpSEQgtGeS6OVg8VhD0SJwd/csJRwa7RYQ0s9rgDTvqhtycm8aNvSEAJ0VxHaoQgULDjjtMHbxEvCgbA/ah7pn5NWkb5Vq5ZHVuz3zkzUZkqZ71JGBsZf0Dxz3vw8hpcUczmMW3hVRf3OOYC16uNKxgozqwvpqczSelaZsyzmGMWBQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUwwQjVmQklkUHhqd3FPaHJsUkFXWFZMOWdKVnJ4SElzK1Zwc1JmL1ZaSWxN?=
 =?utf-8?B?TG9SWERmcnRrTm1NLzM4TnZ0NWNFdnhPVmpxZ21DMFpJVjdsV2lnOGlQUllM?=
 =?utf-8?B?bEpYZ3FuR1F2L3EwdHB3QTRaT2VDWjV0Mk1UVEdzYXpOb3FFL0pHQ3JpUkdu?=
 =?utf-8?B?c1FRTmthRERqVlNvYktTWFZYNlU4NU5jQUdSRGI0UmxQeE1tVHVmRHgyMGEy?=
 =?utf-8?B?cm8zVVQzNUErTW4zbGVodkYrSHZQMXcyQ0xjWERHYUNJcHdhSDRPU2pkWktw?=
 =?utf-8?B?d09KcFR1UlNRUzlsV1ljaXI1Z3ExODYyeWFFRGoycWNFSG5EeTFENHZFaEF0?=
 =?utf-8?B?WFJOcVQ1UnFCRXFadzVyUk53K09NQTg2MnliTys2TDZzOE5Fc1JsTzRGeERq?=
 =?utf-8?B?VXRqcENkb3gwOWZ1V1JacHREN1VYbHUralJlSkZyODNOZW1wTnRoQ0E1dkUr?=
 =?utf-8?B?UzJRZ0JkUVVUSnNrdGNlQXIzaUdCTTZiYXhtSERieTVlekpOcXlVZTZxRVRq?=
 =?utf-8?B?eFU3bXozUXk5NHMyUVNoRmc2SmpSZC9hVGpUd21DaVBsQlB2VThBMWhPOGll?=
 =?utf-8?B?M1I5WFJibVhvT1hBc2NseDhKam8yUFRZdEZkeEsrV1dTOFJnZlU1QS82K1pR?=
 =?utf-8?B?c0pBZE1ZQWN2Qkl4OGNHc0dMa2dVQmg4M0lNU1pUdkdsT3hSYXVmZnpXT1U2?=
 =?utf-8?B?bjBhWHhPa3hjS09tQ3lJbGM5U0x5TDZnSEZJVHVocFUxUjA3UEtQeXlmNlVt?=
 =?utf-8?B?cCtId3ZiTUFRYk5BeXFRdzc5RjA1d05qRnZ5WUZGQzR3aGxtRGNFa2FyYmhM?=
 =?utf-8?B?MlBuZWZlSlhueHJzUWNlV0ZmZm1LaWZBVVZaK1MzTElEaXM1Y0krSmkzUnJx?=
 =?utf-8?B?a29CME5YdlA2N2ZzL0xzeGZOdUdXemxRNWU4cDBvUit1cVNIeStFZzYrOTJW?=
 =?utf-8?B?dEFrSU5UTlRCTGU5RXprTG55dFJqMDRxR2FBVjgwVTFienEzaTBjc3BweGlD?=
 =?utf-8?B?V2FRT25kU01TRW0wdVNlVldib0o4Q21UOEtQNGV5Nk9uK1lvV2NHZ216RnM0?=
 =?utf-8?B?dFB4OHlITUZNazFRbzZxWTJBa1JnUUxrVEk0SG5aZWdhaU1ONVlnQU85L083?=
 =?utf-8?B?QUxqVnEraDBFVEk3eWVpL21xa2E5cnNKVGJGeUZibFluZ2Qyd1k1cFpwbW0x?=
 =?utf-8?B?YlNaNEo1aVlXQ3k1RTNrUWhNSlVETjFrdWlQWEVob084cWFna29SN0dIeGxT?=
 =?utf-8?B?SzRNN3ZWWnYzTHNTanYwdWtaNTZXTVFRbzI2czR0MDl6UDZ2anpDY2hrUS9B?=
 =?utf-8?B?d3BjaHpBdS9vU3hVclVTRHFieWJXYzdxYWhQUllQN0o0ZFlPSk1ERXNZTE8y?=
 =?utf-8?B?eDQ3M1BRUGZaR1ozV1Z2eE5TYXJQcW1yeEJydUFoTHdRaklCVDl0SEU2UzNr?=
 =?utf-8?B?K2ZoQ3ZSTVpncUdBY2M5WVlaeVpCY1RaRndZMzhXZ1VGTXB3Mkk0L0JYamk4?=
 =?utf-8?B?amRnRyt6em9BWlZqcmpmMmY1NFZHQ3VwY3hVVnBKOTJ5R0xXS1lZeWdkNU9o?=
 =?utf-8?B?eWNCdEhROTRvSEp3bXlMeWtHbmxqcW9UUGR3eSt1NmxXL3NOWm9idmlUQjNG?=
 =?utf-8?B?UUJpTWs4RHpZTVBJQlUxUTNyUlVzL05aZVNJc3QydjRpSVJERnpNNmlRRGI4?=
 =?utf-8?B?bVNqdUFPQ3dTN1dqckRWNmVJM0FoVjRIVkp6KzIyQXQ0YnJYN1BaTTVmYXZw?=
 =?utf-8?B?aEM2ZDExSnRPcXFsNmx1ZlZLKzBtd09DdHN6Y2hnVlA3SENIMTluNFllamxN?=
 =?utf-8?B?dEpGam5mUWxvcWptak10eUZLejFmVkhUNTN1ZHUwUXBldU9KVmNHdW9mTHdS?=
 =?utf-8?B?OG1BMDk1Q2J3aUNjd3NUaXdmeFI1VW1VdUprcHZRZldUSGg1QjhDR2VRU2kr?=
 =?utf-8?B?MFpZTHhTZGZ5bXJ3YlpUWUh3TUdtVVkyRDlvdFNzbEMrZW16a0xXOVNBbHY1?=
 =?utf-8?B?c3dLZU8yeWhrdkNHZEV1eGVOMkY0RVVOVGVzVGdSamk3WHFRN2hxM1A1T0NI?=
 =?utf-8?B?S1U2Vk90RlpRdWl0QnF1RWFHa0RwVktRZ053c1ZHVVFlOVVYcVJDaXNvVnZz?=
 =?utf-8?Q?FooBGLnCva6sDNYZg7ixpO+LJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nojxMuN6t50fAMxYNol9LjQRuurG/UmWn5OHxNoCbg8sHItN9tku8X7A57p1aRaSKmTlJU5e9EcssnNoUSn2F08o5o9AnTeBbwRps2pDFE86SkAfqIjPIRAN1tIdxYIjHGxztK3MvEyz5jxZXHEX+0SZD218kzf+Njkl5dYDnZkm90fUs7ShNGDi4v7AwXei/4WoD+H6aKtaIxcIgAvnoRyAwpSq331Ke6DvDMbdBJfqVaLhITNNEANdVORibLDA7nRAgajDuKR7SglYLRoqLh6FIzsy3hWctJsBp/785w0LD11+w4Dkt3ZQGKCTBR5+aJinuasff+ne/qUdRf4x9y+ZZGSDDVhYDLt8FujhfS4eRyv4aqlRxLey0smVVEaysnkduxos03YyH2oRwGt1js0t0M4tar2Y3JggAYySbp1iJEIACj31hlmo6zaJRZc5oAxQB9aflK+7y2xVp+V3vnG5rjoxOxFR+bGW9h/Qcm/B/DrA5U2JFGZkRSLo/cxodtV0fWzooh2d3UFtNw3z+gWEwF1t6+ghZHRi3W0W1T5MZ4REzEtdz9urrRYUMbOrWATq/8+AHhbzXx0lEcJgYPoH4AY2aSsV2TknpxkzOIYnt0PbLz29PMJsw+3Q/1PR+KPpeOIpg4C6poLMY4DWQFkCvlL9u9Wq5k9UYD/QpHI6oHrhe2VGwaWOYhDBahUSxRsxWSo7KpvMRMYy4CwNdWz1UdidDKkcT5HwjIJGPo/WeKy4VGcmFcwp+Nc3HwIhOn2nJTJmcbuRp4k17PkRNA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef03c14-e348-4b5a-fd61-08db3a88b830
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3842.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEy+bUS6WhN5BbO5e0UsVPh8JanHNEJKhaHEVStUgwkVJhLtBslVf2IQBgjgDW+JRuWRW1iBF0L8SRCi4+R1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4462
X-Proofpoint-GUID: hFfxfiagqE1IET3mLOtKunFY5bmbZNJS
X-Proofpoint-ORIG-GUID: hFfxfiagqE1IET3mLOtKunFY5bmbZNJS
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

Story begins when Samba 4.14.0 changed its VFS so we decided to skip 
4.14.x and also 4.15.x releases to bundle it on Solaris but various 
problems were also with later releases and we were only fixing issues in 
4.13.0 . Currently (4.18.0) the situation can called be critical so I 
focused on recent release.

winbindd is giving up and I think the key could be in log message:

[2023/04/11 11:28:53.090661,  5, pid=1525, effective(0, 0), real(0, 0), 
class=winbind] ../../source3/winbindd/wb_lookupname.c:
52(wb_lookupname_send)
   WB command lookupname start.
   Search namespace 'smbsetup' and domain 'smbsetup' for name ''.

...where "smbsetup" is my domain  ...and I have added core-dump here to 
freeze the stack:

[2023/04/11 11:28:53.090780,  0, pid=1525, effective(0, 0), real(0, 0)] 
../../source3/lib/dumpcore.c:315(dump_core)
   dumping core in /var/samba/log/cores/winbindd


I went over such many frames of "tevent's" but I do not know where to 
start evaluation. I only catch the (PIDL) generated code was 
optimized-out by gcc (11.3.0) so I built the code with -O0 and now the 
code is available.

In the mood of total madness I also tried ChatGPT which suspects my 
smb.conf but answer on my question:


Q:
what was changed in idmap configuration in smb.conf between 4.13 and 4.18 ?

A:
There have been some changes to the idmap configuration in Samba between 
version 4.13 and 4.18, although they may not necessarily be related to 
the issue you're experiencing.

One notable change is that in Samba 4.18, the idmap config parameter has 
been deprecated in favor of the idmap_ldb parameter. This new parameter 
uses an LDB backend for id mapping, which allows for better performance 
and scalability than the previous tdb backend.

Another change is that the idmap config parameter in Samba 4.18 now 
accepts a backend option, which allows you to specify the backend to use 
for id mapping. The options are rid, ad, autorid, and autorid_compat.

The rid backend continues to be the default, which means that if you 
don't specify a backend explicitly, Samba will use the RID algorithm to 
generate UIDs and GIDs.

In summary, if you're upgrading from Samba 4.13 to 4.18, you may need to 
update your smb.conf to use the new idmap_ldb parameter and specify a 
backend if you're not using the default rid backend.

....looks suspectably because I can not find "idmap_ldb" in man smb.conf 
so I asked again:

Q:
backend option of idmap config was available even in samba 4.0.0 smb.con 
so what exactly has been changed in 4.18.0 ?
A:
Something went wrong. If this issue persists please contact us through 
our help center at help.openai.com.

...I do not want to push here the way how to shot-down the f'g ChatGPT 
but I would like to know if something was really changed. I went through 
the RELEASE NOTES and there is nothing directly concerns to idmap config 
AFAIK

constraints:

  - net ads join works as usual include adding of "A" record to DNS

  - despite of successful join it looks DC can not be located:

[2023/04/11 11:28:53.083220,  1, pid=1525, effective(0, 0), real(0, 0), 
class=rpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
function_debug)
        wbint_PingDc: struct wbint_PingDc
           in: struct wbint_PingDc
[2023/04/11 11:28:53.083291,  1, pid=1525, effective(0, 0), real(0, 0), 
class=rpc_parse] ../../librpc/ndr/ndr.c:490(ndr_print_
function_debug)
        wbint_InitConnection: struct wbint_InitConnection
           in: struct wbint_InitConnection
               dcname                   : *
                   dcname                   : ''

...so it really looks like a stupid mis-configuration issue of mine.

Google is silent on all my attempts to ask "him".

If someone have some good idea please share it with me.

Many thanks,
Yura

