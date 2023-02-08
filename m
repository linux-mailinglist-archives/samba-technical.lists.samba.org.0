Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0168E817
	for <lists+samba-technical@lfdr.de>; Wed,  8 Feb 2023 07:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Le1ab+vDipW1HXOD1JPHPtyOltcQgp3K04hHQi9K/1Q=; b=sZr0Xphd0oS4b9c5RmJEia7jtl
	P2u21ojIbnFhAlbTBDCFedNBZqm+AAVYKS5v0XthZbGgSkHrnI00zIuz8C33/iwI+RZYxA8okJat8
	aczHrAqKy21S2DYKKnJmMho/4m63Ur3NSGMW6M4OEgPOXgk9W+D7wrJeP8dYjCjLadkJvDpYEfQgr
	/2PvUh2JHqgQzLTR04J0AvVrOtUZdN/2yyzghlCjMqUMJFYiZ5pL6awRSKXuA5FgSOtIUqp4arf4Q
	l6wiNwqfpypo6vnY/WnSulDUIaJ/ODfVds9QR1nj0p9oyCUVUjBO3nHG5dQk/OXTjQznURlR6aAOc
	s4eXGnaQ==;
Received: from ip6-localhost ([::1]:45348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pPdh6-009Xzq-Ir; Wed, 08 Feb 2023 06:12:36 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29068) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pPdh0-009Xzh-MN
 for samba-technical@lists.samba.org; Wed, 08 Feb 2023 06:12:33 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3180hxmM028753; Wed, 8 Feb 2023 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Le1ab+vDipW1HXOD1JPHPtyOltcQgp3K04hHQi9K/1Q=;
 b=VeEco5ogETBuSqUyd+3XYptYvaP5dxY42NlButRLkjKZ9yS9U/JEca+NHFiBmQXAlQqF
 LGjyVQByKUcoY1Jeu764ctJOuXYKEyX71Ral00e+JoTxwCfrd53f2mBfZ5zm4M8pIVhz
 OAuVhspbmpFV2iBa2Zim3Wt9FYYXeUj0CYs+CImXvVW5d183DANB8Sj7OortgjNB2JX8
 1NBkR5ZVGJVQ56T6lrXAShRsSwGJ/rLGxMG3e60BIvU0n10kdNd7zjuS6NCChDvX5TzK
 mvlSE8XgYNqi9B1FC1r/U2s0uMlwR/e7CVFM8ZmF1n6cI6cl2aIhuez3WnfMl/diHbsj 9A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu78je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 05:49:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31857qOr007931; Wed, 8 Feb 2023 05:49:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt76ttj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 05:49:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbtZMufKaiua/vyga8A1Te/C9UqbUAKYxtkFojmqjTHjwTOjL/LfIJsZVkNhdroYvXLDDxvSuDQhRPWyTAgdSl3kyEKaJA1wYU9KICI9aWe8yaDayhmPlExTepD3s+E17Wz1/yXzK45SPqBQVbiA9QGvA2AW+FrMZzDPMQ/7xopyL1W7zzdOcoQS1EcOWN37KLHksUILhgh1p6xR4DtgLq+hdtzEbHaTIbcAJ3KF5BxiK+tgAoEpXUF15h2aT1zxhfa+qwQeZVR9cqRV8HX6D76MDu3o0gMSI2T2ar4y5RJNKV6AZe8meAyS8yGqzWYAmjbaixhS2muQcQBqEm6PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le1ab+vDipW1HXOD1JPHPtyOltcQgp3K04hHQi9K/1Q=;
 b=TUkUjRvOOrNdr9niqo091TIPj20WcZO54ZXy69IWYq1zz330lZQ7GhhYBYjDa2KMf9vjv6L2M55RE1Ok4AOX6DDMC41bD9FoZKYYM9aA72DlAcECa+r3PrzEEpuAqPJMXtQ5t0vh+QTEvvRofddN9yplHi35D7jEY9KDTlbyNTK8lMmKCpVsVnvb3kEu5Lo5bXbY0lVSmHHEeyIHwMZ0Io/18gIa092z9d+bT+H0ezkrayPwT7sJx1YLPWXL4ECP2ZzJ2BKRreXbDF04hln52ayQabrGdHoXVRsZGjMxQiyZrBcLHMg3VgCDCL8TdQVmSSZZVSER0JF0Q+Z2bELqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le1ab+vDipW1HXOD1JPHPtyOltcQgp3K04hHQi9K/1Q=;
 b=P0FomUwSTScRu4fDiFZ2EPBA07xAuphsYDCnTUfAJ7BdBYPowJeLQVWv7ShnbgjYlrLstYyw1VUdyu8InmjMyIxPvbbpRbpLHrdkq3azz7dYKj4fBULxCZfJ3Bhwms2O8PIr8EMlxVohsqRESKHPLSzOxtTBKF5b3A+hZhOjbtw=
Received: from MN2PR10MB3856.namprd10.prod.outlook.com (2603:10b6:208:1b7::12)
 by IA0PR10MB7302.namprd10.prod.outlook.com (2603:10b6:208:407::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 05:49:36 +0000
Received: from MN2PR10MB3856.namprd10.prod.outlook.com
 ([fe80::dd5a:bd5b:ec92:6b90]) by MN2PR10MB3856.namprd10.prod.outlook.com
 ([fe80::dd5a:bd5b:ec92:6b90%6]) with mapi id 15.20.6086.009; Wed, 8 Feb 2023
 05:49:36 +0000
Message-ID: <aac4d753-6e3d-664e-2ed2-e3e43e3b3124@oracle.com>
Date: Wed, 8 Feb 2023 06:49:37 +0100
User-Agent: Mozilla/5.0 (X11; SunOS i86pc; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [External] : Re: How to handle @LIB_RPATH@ macro in
 a/source3/libsmb/smbclient.pc.in ?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <313c49ae-fde5-bea8-e150-676176a6f8c9@oracle.com>
 <cce5d58d9dc31c7080a5ee775785c83e79f47838.camel@samba.org>
In-Reply-To: <cce5d58d9dc31c7080a5ee775785c83e79f47838.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3856:EE_|IA0PR10MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: fe42236d-111f-4671-89c4-08db099842ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: ghvo4qER7T6ieGfe/fIf5NpUe8bb+FsiudlSCRHee7maP6J4tJYWtcUMfBlflksc/psul4B9L2pXNYd4XG6nj5vqPTsFDyPcAdLlwHQAiKqZw8dL4UwHTttZb3YNJ8KfuH+/NI1LYYOZbZsScM76CzoSKIeB5VBe/s9kYVCM+rluaDvBKOYmhIgMoqXVjzYFWfThVR7iUVQIzmTslNaan2r3eM5nZUbXiCFtIsty6/GHtIpC3+94khcX7RnurHh5bxb9YSJjBT/2iVbmGVoYRgrtp2vrwkG6FfygxWFzKuy5aFAYXCAVZFnlVIcc7M0ev68bvW+rf55cCN2aR2hWhliqVIMC392Xu/WCOMJ452VBBOsGEQ/IT+ajoLLp1Yz1c/curCwrb9myebJvim8HrJdwGBDO7FgWHfU9zmbCpf4tJg3oDHVfMpV81eAVFwN+HMXTAtz23hN8XnJuElidwMX23DAWXPFZSMZlp4MYmQnz/tCej0L10PBooYTOziuHIutfzvFdwBF9F0kGD66tCR8AECpqLL/zG7XPvU1hnZQCZ5V8SjJQVIRBS3RcUTF7CTy5znKVdUMxyq6RpM1H1Z04fEZwnR/aXB0gOoI8qNFpDGXkyTtBzUUZWXLTSZbjh3csY9bxXAwVD5SmMAo7fRn5Ca65TvkQKcdeVrwHGLg3wYu/HOGRqEI2zcYAGM9LoingBXS8kGNISRHRf95xpCqOsU2saRC6Eh+LHH9i6iRzFj0xuhlSsPDGok+BIRga
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SURKalAzMEFoYVpmbHNNYUFJbzcrTGxKTFE1aUZuZzR2S3Exa092UXQ0dkZJ?=
 =?utf-8?B?Ynh4bHhhbTA0Z3k4L05ORWF5Q1dlRUcxYnRacFJZQlVWeDhjeTVhMEhiS2hO?=
 =?utf-8?B?VFVZMmRyYnpDcDhlZzcwci9qTjZxQm9KclhJdE5ud3BVKzNCZXdZS3pseE9z?=
 =?utf-8?B?UEZITGx3SkNvVHlCWDVFc0xPQWhXcml6VEFnL3BBT0Z6WWFJdWY2Sm9lNGdU?=
 =?utf-8?B?dmRSZUphZURpeWhlbmVpMzVvR2IvU014ejJkVkU1Q1JVU0xJdlFqcVpZQzFw?=
 =?utf-8?B?ZGV4SENnTnZUQWNYVEhQOGdYbXpXdnlzTGlZdmlzYVM4Ymx4RkU1OE5QS0Qr?=
 =?utf-8?B?OFNIaGkzNmM2L2dabGEvVGVUQ2dnV01VVE1ZTGJTamIzZEVGZ3QydS9ZQmt2?=
 =?utf-8?B?Qm1CQzhxMzNmVkg2aEJOK081ZUVuck0wY3J5RW9ac3daYTlNVW9XbmFBcHZv?=
 =?utf-8?B?ckhyWStaTkJMVmtGSHJ3YkhPNmtRMThkRksyUkJhdGo0cWJncldBOUFhRnp6?=
 =?utf-8?B?T1U4aDhSSDBOWFE4OHBKaU5JZnVLZzQwN0J6QmdkbXJUSThudnhPS1MrNk4v?=
 =?utf-8?B?SmNRbkE5OXEwZUJUMjdtbjUrNFZHZ1hPc29TenEwRHBhL1M4NU1hQXZQbHNx?=
 =?utf-8?B?Y2svT3FpZGpKUXdKYTZ2dVlXTytBV0lxall2cjYzTjhMMittbXlsUEVPMU5N?=
 =?utf-8?B?S3ozUzRFS29MTFFmMUpvcDZsVkFqNjRZU01ROWZvNGdkbUZyQXM2dzRtWFVO?=
 =?utf-8?B?dmNRVWc2aTEwak8wNVBWUGZoVytBSUVEeEJpRUZtQmhRU1crOXFqU0hsTjM0?=
 =?utf-8?B?NmNKam9GWStYUXc2bGUyZWhWRm91bmVYb1JZSHRrSUtOUU8xYzZlVUtKMXIz?=
 =?utf-8?B?K2o5U3FJdzJObzNmU3p6K2FrOEcwT1M0UFlDTzVpbko3VElScFhUSFdQRzVD?=
 =?utf-8?B?ODBNWk9RMHBocVZTcWFvdmhVMVU0WkxYVENZcUYrVzFyN0xuRUlDNks3RHQ4?=
 =?utf-8?B?US82dWpva3lqc2FhNlV2SFBUQUJPYTkwMzBVOXNmN3ZlRm9QU2txMWErR2FX?=
 =?utf-8?B?VEFBWWJ5NlJzeEhaV2lIZTJSd2JtaVdVbGRKYUsvczJINTY2MUF0U2pBUVpr?=
 =?utf-8?B?cHJpaUlxZDY5VGhFRFk0enBtQW0zS1VrUE5CVDVYOW9YVTRETER0eVhpOVhk?=
 =?utf-8?B?WlV2YXdjYk1OdlZ3WXdWcUJFaVlHNmZZbUsyWXVJdzRTSHBMV1NyaFoyOFEv?=
 =?utf-8?B?d28rQlhYeTZYTWRpS2V6L25IREIwK3NvVll6RUJQQXN5MHVUbjU2NVVhTXhO?=
 =?utf-8?B?cEpSQmhxc1h0S1BoQ0lwZWg4S0wzQ0JRRnY3Z1NwVDdRL2p5a3dsYkNMV1VN?=
 =?utf-8?B?MDFEWjFyWFhoOCticzQrMmRibXhBMVpkTE0zV2EycGsxZ3ZKZEtsQTBhaHBP?=
 =?utf-8?B?aTBhbWVaa0Q2NEpQY1pCMURrRDFac2lnZFRxdzlkMlNUaGMzTHRhbjYyK0R6?=
 =?utf-8?B?ZGk3K09VU2QwQkFxMnY2aWoxYzFLd0hpTXhaMGJOd1ZHZVd4Ymk2NzhVc2VW?=
 =?utf-8?B?cTdwZjYzcW1IczVzY3lXSU13ZTI4dWFMa21LUisyZDQrdG8rRlR5R1NrWERx?=
 =?utf-8?B?bXF2TEE3UmJ6dnc4cXJLMXFmbmVVd3hwbXJDVDYwbDN0ZytHcytXR0N3V1NZ?=
 =?utf-8?B?YmQ2VXFaTWhDVDRVbW5RaFowTXJmN1dIbCs2OFZ6dnpQR2tBYTlKdVQ3WThF?=
 =?utf-8?B?QXdqemlmUFQwY1JVMFVwazJrWWN1Y2JzbnluT1d3RTJleER5azFlMUphY25U?=
 =?utf-8?B?NmM0ZlNHdXYweVg2TG9LZGxUSnpvcnlHK0s4RzcyMVlMRHUvNFU1TXQ5UmRI?=
 =?utf-8?B?M014N1UyY3Q2L3VtN21SWkh1M2ZkRk1ObmRwbkhwMXJsbnBIRHFmRkd6QXls?=
 =?utf-8?B?YjV5VFdvR09MZkkrcmV2SUdFTUQzSW9UM3ZmREZlY3BiZEdSc2hWUElkQnY0?=
 =?utf-8?B?cTZFVHQ5Y0o0RlZWcmlPU1NndU9uRjFQQ3MwblMwVTRhNkNFY2hLWUo4RDJ2?=
 =?utf-8?B?UTNsaFpGRmpIN24rZGdUZ09nMnJQcHlaUFU0K1NuZHZENTdwOFQyOHgxOHVl?=
 =?utf-8?B?bFpGaTZtRHk0VVU1emdlYXZTc3FTMitnOHZTSjJwcjA2SGRnTzRRWEVrZmFL?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zW5kH/GWGPVzAbaDRVx76CHgboH1585658uyou6azEyu99T38wkAqgRqzNWqIiJgeRntSUTKPnv87zfLshHC2ei0ebUhP8heSmF1lCNz2xSMMN2p1l72LhdQJWIalzN5/16cXVOC0WJpYbriH0dy6Clt1t4ndQzgXMWMa91sE0HpsKEaTAzuXsjntHDMEr4BVyfz4ZgVN4f4beasTZM1XYnYI26VN7O5xUU7mMNq8B5rIUqREcN1pVMf4864PQsN0G3cXbBPyMwltUTN7f6eSciLJjtbY8Dgzudp3+AbnN4+n8yzKqQjXnvydqTKMQUrskr8xRvQTWGDeHpON+6sb7aXvvR8fkXZIvQq/bNurHNakPp2qha+I2hdKkbFPddtuD06yLaisB0Q2gP96k1XWhtLfMWKNnKcZ9XQuFLVjJLVqptoDBLdm1QSlPoUdtqtRToWp/qiW1fQfatc/VgtBuEKsKrJrYiBiBQuW4W/gKnM49ACiyT94MYKIYXlJgpRScTB0WSHvXuh1B/Yqj6mP6vYRy4SF3CBp7jP8nW/6PRCGWeUjJi8jURyAVD3+uKBBVOemq2BY5/FO7qc4BMdRT0N9ynOjPfadPfaGr3/sw/Jh0HUfJGwOq32XUjEj3g0ZttIqvp2VYLCmC8bZCp5/oeG5ZNtYfUov86G+HNY8sOmXF6JGAlqGJawMkNTURDozHHqvEoqy/wgLoViw/7qQnfcYACoQudYVD206yk38V7YXoqd2MzK8fOogI/DK/EbSzKUMjbuJs4pg+OPyz5RtrsHH5wGgHc3a7m0WQZ98Ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe42236d-111f-4671-89c4-08db099842ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3856.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnupBynYh2l6T1TH9f40+KnjlIA4b65abVSXOgyV4bylnd9kJe3+YDEMZCB1LIBWTMsO9tnx7RRE7JZ7Q6I4cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7302
X-Proofpoint-GUID: 0vvuoiakpSvxCUyN4Fb1YrJMXFCF4rOm
X-Proofpoint-ORIG-GUID: 0vvuoiakpSvxCUyN4Fb1YrJMXFCF4rOm
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

Yes I need help how to set configure options to evaluate this macro to 
generate -R${libdir} eventually -R${privlibdir} instead to be able to 
build gvfs with it.
Many thanks,
Jiri

On 2/8/23 03:39, Andrew Bartlett wrote:
> On Tue, 2023-01-31 at 13:21 +0100, Jiří Šašek - Solaris Prague via 
> samba-technical wrote:
>> Hello Samba hackers,
>> I understand it is under the level of problems discussed here but I
>> would like to know how to deliver -R${libdir} into Libs: in .pc files. I
>> think the LIB_RPATH macro is the correct way but I can not find the
>> option to unpack this macro.
>> Thanks,
>> Jiri
> 
> Were you able to work this out or do you still need some help with this?
> 
> 
> Andrew Bartlett
> 
> 
> -- 
> 
> Andrew Bartlett (he/him) https://samba.org/~abartlet/ 
> <https://urldefense.com/v3/__https://samba.org/*abartlet/__;fg!!ACWV5N9M2RV99hQ!Id5xK3uV_R3dEGD_9EPN3T7dkrBT7lb8x_IpGIj9jJu8B9mJ85PuP3YHYU85qD0_pTyjD6mtZDCwA_ekOA$>
> Samba Team Member (since 2001) https://samba.org 
> <https://urldefense.com/v3/__https://samba.org__;!!ACWV5N9M2RV99hQ!Id5xK3uV_R3dEGD_9EPN3T7dkrBT7lb8x_IpGIj9jJu8B9mJ85PuP3YHYU85qD0_pTyjD6mtZDC6qF1SEA$>
> Samba Team Lead, Catalyst IT https://catalyst.net.nz/services/samba 
> <https://urldefense.com/v3/__https://catalyst.net.nz/services/samba__;!!ACWV5N9M2RV99hQ!Id5xK3uV_R3dEGD_9EPN3T7dkrBT7lb8x_IpGIj9jJu8B9mJ85PuP3YHYU85qD0_pTyjD6mtZDDGca6MPA$>
> 
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group company
> 
> Samba Development and Support: https://catalyst.net.nz/services/samba 
> <https://urldefense.com/v3/__https://catalyst.net.nz/services/samba__;!!ACWV5N9M2RV99hQ!Id5xK3uV_R3dEGD_9EPN3T7dkrBT7lb8x_IpGIj9jJu8B9mJ85PuP3YHYU85qD0_pTyjD6mtZDDGca6MPA$>
> 
> Catalyst IT - Expert Open Source Solutions
> 
> 

