Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CD7DBFD0
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 19:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bIhbQRsGpGesCGxUjYuD8awobtZjog9vZGPql4LGK88=; b=ngi98CzfbYrjNEqJJHrKXbrH4W
	8sT8v6N4Hzok0D6LOLvTFGrSxGgujpBRJGgCDji66BVeb2xise5aICe4xR7zhtGGvOsyw+aY+pq9C
	5GLhk+aFXd8bikCk+5i16Bx1VyS3vnPkc4jpzFBg3TJVKdKfjjsRSHhvk9SZ6eCoYdpe9uAq+e5DF
	fNB5OAW7q9QeO/8dzTW8ox0Pfmaw3v+aRAwU56/r3S/xzJ5UuiX78j6OyDzgsjgH3/gOPTX4zSmg5
	1Rltmyi5xTPGPkkn8fniHRUGjrngHCIvAXdJqfRM5yNd1Qr2MndNOBcJnY6xUjBVPJO18jQ/8gQMs
	B1M75wQw==;
Received: from ip6-localhost ([::1]:27142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxWxG-003bSw-AP; Mon, 30 Oct 2023 18:25:38 +0000
Received: from mail-co1nam11on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60d]:52704
 helo=NAM11-CO1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qxWx3-003bSn-8d
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 18:25:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp8CDcyxBkH6NMHZMrmoD8Op0I8M77zyOSwiGWv9ZD99FCFxuYNH2rEi3IeK3RmC9cWnakuqpsurO6IYHa5uBFrIR49sBBgU/IGYHV8Mhr3Gv68Xat3+50RIwCyDJoAEp6LioOfF6xnecyuR6rvNJFuFCSQbW/SYFevgTh6OkKQt8AWds8/v50I+cYDR2mf5JGoW9n8lRuN3dgTlLx9BnoMMQSAK2bLVj+tHPL7cg13l+J+hkwdqyYEJPSccMjVO8wZTBO0QX5u3Rpc4f81TyyyKl7tT3aP7SnOIeNgzPIqwDHHMWTL6Nn8mZxbPSnsV2HUYn6sy92xaffcnjNDh5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIhbQRsGpGesCGxUjYuD8awobtZjog9vZGPql4LGK88=;
 b=SbUZv1Az3iXW8uGMhETf6rHjbOVOi6Mkbmw3eUvx9AdHDAP4NQVZ/R0qfbf6W+IulkWT7EI1zKIXK3RDw1ysJz15TxYCeEMT4Q1df16Umuf2WPHu0ggcsGMVOSMZzwXvbJ/do8MhwyC+e+fFDPxoj4QE1pcpQozUVrZqaPMDNE5jE+/cOTpwdoioQcAToiyA1OW22M9X8PxQMSOMrMyH/YWJR2g5C1zixuXPx9U/efjHxeqEbi7TjJlJ1GugxUPH0rEusToDQ6WFAtBdaRdO2ldCdhBvcfTaPsVhoaj2wsxdiaMPMHSNMeJy45ID2kidCOk4v8O8v9J5gDPV5j3QpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 CH0PR01MB7002.prod.exchangelabs.com (2603:10b6:610:107::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.24; Mon, 30 Oct 2023 18:25:07 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::1df3:d3b8:e0e0:b36d%6]) with mapi id 15.20.6907.032; Mon, 30 Oct 2023
 18:25:07 +0000
Message-ID: <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
Date: Mon, 30 Oct 2023 14:25:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
To: Ralph Boehme <slow@samba.org>, Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
Content-Language: en-US
In-Reply-To: <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|CH0PR01MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac59cb8-9ca7-401b-7bc2-08dbd9758b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: IEQrtTxhmJBucDkkmDh+QeZezASopOL7ImoGP/ZdAiEvNzxkzTq7OldpPUk1b7qaL96KThokxLGL05c6oSlA8RtdQRYWLPuQKvH3+Rl4NdjYTRvVpaFlbjWvF19MNkLepk2qtgHpV9QwxjwUAl16JP07h8efnsf5vouRu2zYiDk6eRQxyVZinfUcLVHlikkiGwqqkhTBSWDDpHHSR+eh3RElI8NyOUa/nIDYYvzdvJbZCUNsLCj4Eolkga6K1IKsv7HZOG1tjOQr+FYyC2fYkznsbp/l76uCxGE0C1VisUI+INq9Q+0iUITUhx+G564z6ejBEDv0kgjq+VBSeLPS8zRbmoZaNPy7QrXA8iYrUVSykt5RoBlhy9ndwsdqnLz0hDwxTIALcNxUMU/+vRw/t7abvkl2tLUrZI4l1X75em6RLkNd5wGB5Fzzx2OhUJ5IEK8SZKlRRipfq8MsmyGM+MVCglB3K63HHA8yaVE8b2WPzHSaPnf91k2nIbMruewFUt+1Vu6p2nrHT4M6NhSrdStmMpvpGHqxVFvI2411YX0TY8tIaYD3vH3w/d2Yn8UUYICZboRTIG/2Xv+pgr5DlF0wVR41kW3cNIWWTAsZIkUHI2ZHwEsNrVY5zR9SOiqy
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHB6VVVHVEQrb1Nkdm0xYkdTTTJBN29WeWR5RDVoUHRhUXNNaTZxU1pEZExO?=
 =?utf-8?B?czBTdGtCMXNMT3RISitSSGtSbHEyazdBY0tjd2k2MTdCVnd6S2N6OG1LQ1Nn?=
 =?utf-8?B?R3hsVDlydXBIbnpWdGxnRTZnUk0xYmI2bDV5bHo1eUhudm12c0lDdElxRGk2?=
 =?utf-8?B?ako5UmEvNG9GM0IybW8zTVF1OHN0SG0wZms2UEtWVDVKUFdmbjVLeDlQL2JU?=
 =?utf-8?B?djAzVkRrWkR0bnJMMmtpUmJ3Z09rYjNiUnNIbC9zTUJ2OXdYenpseVIvZGND?=
 =?utf-8?B?MlpweUdOOW1UaXNvV01rN1RScjBESTlrV0xDNk0zdkozTW9zQ0J3cERYQlVW?=
 =?utf-8?B?ZGhkNXpzSllOWDBmL1NlSERjbHoxMGI2L3BRdzMvejJ0bXVFRHcwRHJDcGtQ?=
 =?utf-8?B?bERQam5SaGlZYTNmd3dmM0VlV3AvTVZyZVA1Y1UrNmt1RkQvWFNJdFpscHow?=
 =?utf-8?B?T3hTNmkxanN2bW5tTVFMdE5NQzBlbWE5bGZuOGZqUzZoenBFR0h1L3ZqWnly?=
 =?utf-8?B?Vlg5Y0RuSHo1U1hsNlpnUVd1MzFOUm9ha21Fa1llS09yUTJnWWZZU1prQjhx?=
 =?utf-8?B?cVRpcjNKRHBYMU8zTTVVUFZVenZLb3BJVHQ4eDFlSWFHR1JLaGFXNmdTSGR4?=
 =?utf-8?B?ZEJkVEtoc2dzZE56N0lOVHprTlVUUFRna3ZEeEhrVDFUeXBTeGt4Q0FlWjNu?=
 =?utf-8?B?ODZTY3hHWFc1Y3Z6Rm41U1RpeEhzaVZPTmlUZ1VWcEJwN1RwRzNidFpKK1JP?=
 =?utf-8?B?SDFrSnB2TVBObjVoZGJyb0Zob2NlQ3JVNVp3Z2dTYWxDTVpXQWZZb21FTW9V?=
 =?utf-8?B?TjhIWHlZUUxtTm5ZOVZ0NGtEOVFRMXlMUXBhQmRtNE9nQytqZnhjYWd1Q0Iy?=
 =?utf-8?B?ZWNxaGpkQ25OS3BldU5mYTZ1SE1pNkVjdGVxWitNcmh3TDRFTURnYmx0S2Nx?=
 =?utf-8?B?VFNCb2hEdi9NUFNuL1gvaXlhR0wwcHhhVldxdFNIUFNEZ3YzcXhiNHBtd05x?=
 =?utf-8?B?VXdmRUs2RlhWckN3Wk9sSW13Y0hRMGMxdjJFMkNvSENvWVNsVVRBeHNZLzFm?=
 =?utf-8?B?aElZSkdScFJ0akRFTzBtTk1mY0JaTXNqNGJlRVZRNGNlcDNTMzdyaHhJbDN1?=
 =?utf-8?B?cW1KaDJIZ3RMRlZyb0hQcWw4RGp3QTQzYjdPYVk1RnRYRDBObk83RTArUUk5?=
 =?utf-8?B?OEdMSWxCSnN3cEtDcS9ySzZQYzlhdkdTSkZ1aStIYzh3V0NkRDViZ0ZOTTFh?=
 =?utf-8?B?SWc2WDM3a3RDeDNuczl0RWxNMDlDaU92UzBrNXFTWUdBUTh2cUtzTVc3VE50?=
 =?utf-8?B?NHlRNkYvblhiMnc0VWd6WjY4dTY1bVVRVDJTMUpqeFlPQmhwbTkyVFFXT2ZS?=
 =?utf-8?B?WHBDQTh3MVZnZkU4Ung1eU5OSmFUMm9rUUxUVW03ejRFbGhRTW5KWWJ4UDZM?=
 =?utf-8?B?NWEvZzBSUmNodUtLRzlGSVVnRjc3bFlHbmMxQ1czTUNMNlltMFIxK3FJZkcr?=
 =?utf-8?B?WlN5eDR4UG9vZU16T0ltOUdhekE2Z3RVWUtPTE16R2FnY1NvWkJ3TWs3YWhm?=
 =?utf-8?B?clBiSmFBMTBQWXJ1allDd2VaWVloL2hTdzJsVWhFQVBLMThWcDd0T1B4QTNK?=
 =?utf-8?B?MGFLSmF2NXp1RFhTbW9XWm45TWMrRzgyR2NES3lEVFNXZDlBODIvamovd05F?=
 =?utf-8?B?aTEzc1VmVFpNRWs2RFMwRXlWYlpBSHk1bnU0c2o0L3ZHQWhEc0l0eEtzUURX?=
 =?utf-8?B?WTR2ODR4SG93MVhkY3V4KzZzZ3NIT2NHN0lTMmZZVm5Ic29wdy9EOTM2M0xP?=
 =?utf-8?B?WmNpZVdiaWQ0YTJQZDh4OWNBNEl5c3JBWldLVitkcmxCSlJyWDVEMVZnaWJY?=
 =?utf-8?B?ZkpLeWhFWlhjSmtncGd2UmhFMGpaSnVkVGZkRXpFR1VZOFN2Zk1pRzRwcjJ1?=
 =?utf-8?B?MHJlYk9HZWVUVHRTODdKVEVSTHRCaW03NHhXOXlPUEphZW9DdmYwbmhZZDh0?=
 =?utf-8?B?YVZxbHp5RDMyTzNTdFR3YmFzVFgzbVQvZEkwb2lJdnE1dFhvdHZlWGFTOW5z?=
 =?utf-8?B?MngrRHJ0TW1KN0xPRmtvWHJYSFdOWHMvWE44ZEVzajlGODBKaHV6VFJDR2ho?=
 =?utf-8?Q?oakaEiHw6ZuQ7mpKYTHPbi1wL?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac59cb8-9ca7-401b-7bc2-08dbd9758b18
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl3pOSwxGDRASuQK9uFUXjV1rOG56um5BYE0HV3aEAil/8ufoKG03NyTIRT4bdeR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7002
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7eab::60d
 (mail-co1nam11on2060d.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-CO1-obe.outbound.protection.outlook.com
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/30/2023 2:13 PM, Ralph Boehme wrote:
> On 10/30/23 18:52, Jeremy Allison wrote:
>> Yep, sounds good to me !
> 
> ok. Noticed we need the tweak at a slightly different place, but anyway, 
> working on it while at it.
> 

Is this really worth it? It seems odd to set a Windows-only attribute
from a Posix system, just because it's there. I guess it's mostly
harmless though.

Tom.

