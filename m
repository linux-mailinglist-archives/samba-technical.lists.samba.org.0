Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E8C8FD6B0
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 21:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oatf7mOY06MOGyYR+tj+zHOrhSnGkDD+2BEa6GPulyA=; b=A8MGpzLe31LY+P0fTDVfdJ0Q1p
	MJbN6nV1qFoMAwkyczOvxY2mI/xoyNXCTxzop8eq6Q6rpPum9DZHHTWCMqxxi2a3fyBpuy75vpDfg
	SXTq5MY/V2H+uPB9u3L64bSHmo9XpHBZVa4ukJPZnJ4okMktAf3qc+ULUErjZWXYJFrt37MmMBqD9
	JdYpbsJzFgMnbfVWYVGyYy3zffuDzqW9WC53kumbT7zq51jXW6AmSDPnYJTO3lfyrnCp84QU021uJ
	Yu006f3iUTmhnO9VkRCCdc2SMzpUUdviJCAGJdknXM7Sd/Ac5muW98AtTNmzqQgvZp9hBmEZ4Lmqc
	0II5NA9g==;
Received: from ip6-localhost ([::1]:41660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEwXR-00Cltl-AB; Wed, 05 Jun 2024 19:43:13 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56014) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1sEwXM-00Clte-Lp
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 19:43:11 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 455J3qQ8002421; Wed, 5 Jun 2024 19:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=cc : content-type :
 date : from : in-reply-to : message-id : mime-version : references :
 subject : to; s=corp-2023-11-20;
 bh=oatf7mOY06MOGyYR+tj+zHOrhSnGkDD+2BEa6GPulyA=;
 b=BNIwGLWs7XTIjoXlAlXDAWnlQEcGoPUo96uP2sRqX98E8CPQslpKJn5taWurPOUJ42M5
 JJgGvjJz19v79ea/h6TmTgjiJ1//wYItYpAmVrNdkIy3b319ymvTImzEPnudRcm9tDC9
 ATJ83eoXwZ+P2sEvLssJd0m6Ff8GH4q4iCuN1B2Geqhu0AlqEMsv6syeYpvnoAvfqxQa
 h4ohWhtvR6v8ifx2pyaWj/wnKmCZqEjGiyRgHvbs/Bvp4NKzNU8rIpzBSgYKpyRqj92o
 zcW+SG6lLbjpy0g0r+JswlN1cSuCmrMg46kirfjU2AAPRcv+T7vWvs0U/xqgfoyukNWt tw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbsq22y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 19:24:34 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 455IC6lo016225; Wed, 5 Jun 2024 19:24:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrsc0bfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jun 2024 19:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfdCTpowseQqilRKhsv16R4VqhxXaFNhoGR9Xg0Bk1nN2EBjx09VGOHXhhUY4ngImCLR2bMBKRtHtzK/uGvVg9DN2dALZ9xCd3cQNMJyiObbHCpV9V4mOO1AQKTOmbBsu3P2WC8+ESttnhZCspC3n9dh2bgrPGXyUb0WgBJnOWVVKkf/mnN4n0/i0dxYM8/KcDdhLaUMOTiZ4q/Ebz0IKgaQMKNoCAoD79EQ5cDgrPBWMfs9EMCTsMNzpDZKWkAysQ493V+gKLy0mOkwMIkKFzsOCjeS67McIB6HdpaEdhUyU4IhvoH32eyoHHKtZSNvrsrheYaCa4Wk9tkAGK+bEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oatf7mOY06MOGyYR+tj+zHOrhSnGkDD+2BEa6GPulyA=;
 b=CeGq/50m2VR031PfvS+B5hRSNvvtrdC4kMLKaIi3r8Zwc3jd4alHUpbUhA1GhfJYBfOzMBklMSHWMcEysj4/Q35x1O0oWYBbaW8HbN6XxS9m1kY42tk+2UIHnSohkn898pIEgaZ4uxliCj5DG4kOukc0BJz1S1Uz7XzyjnS+rbqoiJ/5tvPWTkCkd27yWeJFht3kBGEKfMD4jHdjdjSqAy4gQSLK8keoEPUKk4BM/LO3F6rvRR47DY7djFnAPfm0YOsnnQwQeRZE2yMsEAd+9yl8ETMx1pFFJeT2v2jNIMBuQj9SPBr9Mz77dhpqiSWoUG4rFdt02pXm4OxDiQYKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oatf7mOY06MOGyYR+tj+zHOrhSnGkDD+2BEa6GPulyA=;
 b=c0Skj52rCY2/BMtYedhSWCghIH0Irov7HrdyIuKYia+pKLzY347/OSMf59OtIy++NbuEcRrPZb9D4FU7PzuMX74dWRMexHLYizFyBo4LEhPUja7XyDIUOlq/l32oTizO2qf7MF3T2D7wLaZ/EC/dC3VPx2cmcZO0S/LBRnUH3Yk=
Received: from DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) by
 DS0PR10MB8174.namprd10.prod.outlook.com (2603:10b6:8:1fc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.31; Wed, 5 Jun 2024 19:24:31 +0000
Received: from DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77]) by DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77%5]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 19:24:31 +0000
Date: Wed, 5 Jun 2024 21:24:07 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [External] : Re: missing krb5 dependencies after recent changes
 in nightly bits
Message-ID: <ZmC7V3JsFXo1tYV-@ultra>
References: <Zl4Dh9XZ2XsQWROD@ultra> <ZmCG254bAl-mvxIt@ultra>
 <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ea6c4d8-b062-4619-87b9-ca7c2064aed0@samba.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB5943:EE_|DS0PR10MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c30233b-407b-489d-6dd3-08dc85951ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MG5adVZ5bjlmRWRrSlFHV1UwdXprVVhzOHI2SVV4Sk9jQ1owSmdRaytKR0VX?=
 =?utf-8?B?RlErdXAwMTFEcjhqMnpUNmQ3RmVBcWoxczZQTlVuWmVzaUp6TXpjQ0ZiQUZo?=
 =?utf-8?B?R3pCdVpmWGZpZEhZdWJ1V1F5UDF3aU5wckd0cjBWdC94aExEcDhCbTlSU2Fi?=
 =?utf-8?B?Q3FDdFMrN1pVVXpMMEMzTHY5cU1aVTdlaXRjTXlucE9GQkZIcUROcGFYMEdW?=
 =?utf-8?B?ek9XMGZrTStlY3MyYUVMdXBFaW81KzNVSjFIUVhEd0ZMV041dk1JK2hYRVFE?=
 =?utf-8?B?QXJ6Sk54QWJkZUlzYy9oVjdCTXhXQndVNnprSVNSL0MzaXk2ZnFVZE9EdWZ5?=
 =?utf-8?B?Ump4QVlIL1hpbStoOVBBNWdadFNQbU9nYmpOUWdZbEhZaFgwc1RMTksxUWFx?=
 =?utf-8?B?czFHOEFtZGs0SC8zRisxcWdycXpSL2YxenNLMVlCYXh5Wnozd1VaamFiLzY5?=
 =?utf-8?B?UWlWVTV5c0tvb2E4THc1NmJxa0FrdVBVVEJWV3lUSEVFL2ZUSDdBOTFXaDFN?=
 =?utf-8?B?VU9hdHZFQ3IwS1JEVDNHZUgyTjBxTnhWL2tmQ1lkeFl4bW53ZDRzYUYwTTFM?=
 =?utf-8?B?WTM5MWR3YUgvWWNtVnBSWGNiN0hYUmNOYVg0MGJJaWJwQWZJZmNDSkQ0SHU3?=
 =?utf-8?B?SzdRYWgxTzFtYTJ6WVVXSHUvdjJCTmQ2R3dVQWV2OUkxU2FSUEF2MnArSklB?=
 =?utf-8?B?Njl5ck0xS3BaWDBSRGozdnVsUmFTdUpVbTI4SlZHQkhQOElmWVlXK3VDcUFI?=
 =?utf-8?B?anB4TlFGTm1jemo2TEk0ZnpnRVU5NG1OZVVCN3RwRGVrRHBYRmYxS3ZRckpr?=
 =?utf-8?B?em5HbjlBWTZqb0taeFlpQ1IyZGJiZmFFOHNyRG9jOWc2VGZsU3BLZ1NQOWNW?=
 =?utf-8?B?cmxmUU0xa05RNWlFeVFLOFRYOVpJS1dBSlN1ZTVJV1BSaTVwTFI2SGRYRncx?=
 =?utf-8?B?Tks4WWlVVGgrYjNWU3V1cFN5SUF5ZCtiNnFRcHkvdmRCcXRzTllnR2h6YUg4?=
 =?utf-8?B?bHQ3eGQxbVpPT2VheitSZmxCSERPWCtiWW5MdldvWVI2YVRmaU9ZK3U3Nm1i?=
 =?utf-8?B?RHNReFpXM3RNdlF0OHdwMzBPbVpqbytHcTBUR1g0NE80QWk5Q1ZaR09COHZ5?=
 =?utf-8?B?czVqTEdoZktFV00weHlaODJkVjhKNUlwUldoWDlRREkvaVNhY21vQkZPWlY2?=
 =?utf-8?B?eE5paWFPclQvZ2s0RWJpVTUzYmZjS21DRmRMS0V6R1ZrM1pQQWplS2tCT0JT?=
 =?utf-8?B?NHd5ZlhCOXg1VUZXVE0zYnorQ0tjQnVmcmdJNmlKTmxlS3VkaW1kMTJxbFhp?=
 =?utf-8?B?TFk1S2JLLzk4bGF2eHM4cFlsYlZOdmhla3YwQ1gwSFdac0Vja0d5b1BOcHpN?=
 =?utf-8?B?TkpnMW8ySWMxcjEzVjRxSzEydWpuZExnS3ZWcmRNL1JUOTU2akxMRC9WTFJU?=
 =?utf-8?B?N2NHODYveE41YU85Qzhac0pLdlNZK2h1R0ZQcFVteUJOQ21yNVpNd3Nha3I1?=
 =?utf-8?B?Z1YzMTgwemxxSXVqN011YnR3eHdXRkpyN3VrRGxoUU1YSWs2cHpBUTRVVjU1?=
 =?utf-8?B?dTRoRXBlOS9TWmpjNU1RZXE0bUZDODVUaHdPK2pNOWQ1UmI1bkd4ampvWVlW?=
 =?utf-8?B?c0pQZFJIVXI1blVySzdmM2ZBUnRQa04vT0J0UVJyaHlHQjFkR1F2WUwralVi?=
 =?utf-8?B?VzU2WjV6RUJYRnFIR0VybEkxdjhoUDJjWnp6OU12V1V6eDNXMU9PUWxBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NOekcyM3NiM3krYVNYQnh6elE1QzJqNllHU2dDK25vMWNqd1NQZWxUM0I4?=
 =?utf-8?B?cWtFRVlvUGdXYy9MZ1B5R3JVK2UzZGd2Y1FZUU1YTER5QUp4QkxvK1dhVzEr?=
 =?utf-8?B?bHhFWFhHWkt5NjRiN1UydjBLM3c2UkdQN3VpSkFPSGhLVVltakwwWmlMeTlW?=
 =?utf-8?B?RWFkek0zOVk4MjBEajZDQStsT0hvYTdrc1p1Rkd1cXFQaUFEOWhMZ0VUNEts?=
 =?utf-8?B?MGRaZjlReHdQTlRLN2d3Q0o2aDhSZElTcWltd29iNE5ZUUZLcnRGRlZKanpa?=
 =?utf-8?B?ZE96NnZxTHUvZ1dWRHE2Ni9HTjZiUVBrakxHeld2M1RjSEZYRkNhMkNOQ2Q4?=
 =?utf-8?B?R1BzQ2pxaDlWbm5lc2gyV1F6UUR3M1AyM3BKbngxM09FcENZMHRWbFYveE1u?=
 =?utf-8?B?ZHZObS9zODVKd0QybG5vcHlhTjkwbEZmOWd3NzBUTlZyd2VyZ2hlMVlCekNF?=
 =?utf-8?B?TXBUbXZMTFZ6TlluMWxNaGIrSkt4UjYwNEczdVhWY2p0MHlHN3JNa3I5b2Rr?=
 =?utf-8?B?UUFrZW0vc0kxaTFxOWp6VFNUelVKMFhzdG5kb0dNSDgyTnZ6TWMxSndQdUtw?=
 =?utf-8?B?TmJaWUphUTRucjhXYzBEd0hjVUVwZGMwUFBWRU8yN1RQZkFHK0pPTnZoT2ht?=
 =?utf-8?B?NENmQU43dGNYblhSZHo2alhURjdMeDBWQ1pjUWZqeEthcjFjSFUzcFRpRnRq?=
 =?utf-8?B?UjVoVTRLR2N0RmNlR0hlZUNXYmw5bnRvMW1aOVBMUkFPZklFcU1kUUdYVGYz?=
 =?utf-8?B?ZkFEdE5SMTlnMjJHNGFrYy8zVjRLLzZCYmo1a0RIT2xJclh6NFRzWFhPSG8z?=
 =?utf-8?B?RjJSU242b01VbTVUV2c5RXlZN25qYUNFOXQ1MDArSzBOdWVDTUdCT05QUmNt?=
 =?utf-8?B?Y2ZoYUZSdG4raUlGa0FoOHhkem5OWTZBQ0FoYmNSRmNEMkE1UVFkcStZQXdK?=
 =?utf-8?B?TlJqMXp3enFDZlhTaDdVNTN4aVpLM09SU1JmczZuSWVJb1d5cDVyeDQxanNY?=
 =?utf-8?B?RmN4V0R2RFlvanhFMmM5YUJ6TWFXRFA0azFFRncvSnRTaXdaM1lkbURSRGpQ?=
 =?utf-8?B?Q3NZanpOTUhBTWM2WFRyT2lGUVZjSVJWZEMwck5uRjdtRWkxWWMranJmZFkv?=
 =?utf-8?B?QTRJWm1lTkZVbGprSlY3bCtWVmNBRkhKRUlVRGJWc2NTVXF0RUlDL2VCL0tI?=
 =?utf-8?B?U1FIa1JTeVZqbVRNZkJvUStSbVB4MTRuTklYdnNoZUlrNGhLWm83SVFyakdt?=
 =?utf-8?B?U2s3R1FvYzFPUXZXZ3poY2NrdmRZK3UrK0JiT2JpaCttUi9IQ0d2c2FHaXV2?=
 =?utf-8?B?ZC9pVUpQb0JqbzdnajdTQjZQK09wbkdIVVNWbFdKZFZkN1Jqa2tRU2RwN1d2?=
 =?utf-8?B?NC8zVkJlaGMydUdXRVNpRWk0eW82OWI5MUZ0b21tRFBiZXdvNms4UTVZbzVv?=
 =?utf-8?B?KzVTRnlJcTZ5bUxBUkVpMFVCUno2TE05NTd5VUlaZkJib1hWcERRVlA4Y3RC?=
 =?utf-8?B?Vm8wMU9JaldnNU5OZ2pKVUNheVZoKzNXNnFuNDQrMGZnQmYwaVVZZk1GaytN?=
 =?utf-8?B?c0RUbEc2OG1EOG1Nd1R1TkFZRmZxekJ1eW5hTWhxSThMTG01N3lWWGZxWnJZ?=
 =?utf-8?B?WU8zYkZUQ2s0eEhuNWhDdzJxVlJTM0svV1hpd01PS0IwMHBTMjN1eDAwUlFF?=
 =?utf-8?B?dFVuOWNTc3ZGYm96a29lWFdocXJFU0w4S1V6R2lHZEdWQ21oQTZVNXNHTEMr?=
 =?utf-8?B?aWJwaUpVNUNqaXE1R1JxVGd3dFNTSjJEVTZZRkdyUGowTjk5YjBVeXNZQ2JP?=
 =?utf-8?B?RkVzbTdaK245VXdOOHVBK1FYejAxcmtxOCt1aVE2UDZaaFdDT0NzLzB4eFN1?=
 =?utf-8?B?Smh3WjdKNitlb3ZuN3BGc3lpQndwQU1RYkVPdEcxZ0lYV3ViOVRZa0ljVUNP?=
 =?utf-8?B?amM3YjI3VEt6VXZXQVlSVTJ5UDRDYWhEVVFLdEJlVkRLRFBTSnFIQ0VXL21W?=
 =?utf-8?B?eXVmQjFjcEk3M3JEMXFYakdiU1NCTlY1UzdFK1VBMzNJSk1kRG91Vkp4Mkg3?=
 =?utf-8?B?blpGQnRHRFRxMHVKMjVWZjdwUzIza21uaUpwUjdzQ2dPek1aY09HamtqS2xU?=
 =?utf-8?B?d0MzSDYySC9RSVZxV2c3NnZGdWZQUzR2ZjJjZ3V3Rmx3YkJWM3VidHFVTjdh?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GxBTWpYIBvRRHyO7OnUp5+Votmjy6pBf235msiTnSb3byTVQ4ru8Mv5iWxV8GWRarRQ7T1Vuzq3QdSuB1agOUoojq2wEsls2uA/jR+6ClC1H44hF+k4uhf7F14tiiWHiRYG4cMaDzwY/wrzk3g4eaUjgYqczmARSKG9i5ggYm7RN3mpVJ7nggPoEEKQwI6Xn3BPuUUYIj68h7sFzwkfzJt+ZBYLXfxBbx7sdgqIbZmaeIOXrtK7RQEXlSlFdWjW1aA5RNHVJHMfhjhiRfY/TDI2fcrmxYNLHVXEpF+1T9OIlRH362EL3TAsXYMsDPW8ghV96lzrc5Uk1be7mdNtVnmJuByadYX7L7XKZ9S2IL0vqNHuZ6oT1bRKooYoY7a46u4HYfZDLbMI2vUwIhFyZoVXFcnfD/z73Em0UatbM585QOmlcaL9AMbuY/Twe0Bf31wwOf/JGiwz3gCaZ1oHL8QlGiOJA8Aqs+vlmXqYgq2qEqDnyut+q0vtcDVQgUtnn0ZIH3i2IRDuZINuX43BVY6Er1iYMlhd/K2S2VKCsqze0fCL2bcVBln/di6vhBOckZ+h/JlbNqkjmP8r9ngBinINjR6qU8ytHH98ahlxyZjU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c30233b-407b-489d-6dd3-08dc85951ff4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB5943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMFialCGIvBMKu2JOoTecP94fukpgu7EQxpAf5teVo5PSwW8gZBkVh6OjBxGjJtY4WVzmuWj0Va5vAd1/4cRcjCKKMRq1xVdT+Hx8ze2e1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8174
X-Proofpoint-GUID: eDj7LLSLCBQu1JxTKmUJlQ8DPcd6SHLo
X-Proofpoint-ORIG-GUID: eDj7LLSLCBQu1JxTKmUJlQ8DPcd6SHLo
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

Thank you! That might be it.
Let me try to build with your patch.

Vita

On Wed, Jun 05, 2024 at 05:50:17PM +0200, Stefan Metzmacher wrote:
> Am 05.06.24 um 17:40 schrieb Vita Batrla via samba-technical:
> > I found the changeset that introduced the regression.
> > The git bisect command says the culprit is:
> > 
> > $ git bisect bad
> >
> > I suspect this change in lib/addns/wscript_build:
> > 
> > @@ -11,6 +11,6 @@ bld.SAMBA_LIBRARY('addns',
> >                         error.c
> >                         dnsquery_srv.c
> >                     ''',
> >                     public_deps='samba-util gssapi ndr resolv dns_lookup',
> >                     public_deps='samba-util gensec ndr resolv dns_lookup',
> 
> Sorry for breaking it, I missed this:
> 
> From 67f686a9495649cc2c201c051aaa35d5d8c64133 Mon Sep 17 00:00:00 2001
> From: Stefan Metzmacher <metze@samba.org>
> Date: Wed, 5 Jun 2024 17:46:53 +0200
> Subject: [PATCH] lib/addns: remove unused kerberos/gssapi includes in dns.h
> 
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  lib/addns/dns.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/addns/dns.h b/lib/addns/dns.h
> index abf0906fdabe..6e605cbec2eb 100644
> --- a/lib/addns/dns.h
> +++ b/lib/addns/dns.h
> @@ -27,8 +27,6 @@
> 
>  #include "../replace/replace.h"
>  #include "system/network.h"
> -#include "system/kerberos.h"
> -#include "system/gssapi.h"
> 
>  /* make sure we have included the correct config.h */
>  #ifndef NO_CONFIG_H /* for some tests */
> -- 
> 2.34.1
> 

