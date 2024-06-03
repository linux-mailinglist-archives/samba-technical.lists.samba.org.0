Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917C8D890A
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2024 20:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bmnRfb7SwA45UswWL92KEIohFhmEqwJIji3N//Sv9UQ=; b=4xcu9cGp9rKFrDsW0K0pcexdxO
	fjmDhky1ykYNANaCBbP2Bjp4Rnlw9GDpglnK+G5C6oQc9kLGjXdbRnDE+aWSKgCAz6guBbgtWNMJC
	1UUcNjxe1nDtNnf6NOWZ8GeW3QxK5FQ7Inicm18BVvDpKzAoYRzfIfD2IJwNBeznSSM6KhLb7ViLc
	vHFN8quB29KjyknwqwZiLrAGc9JEYqZrK5gt30WX3nWE6Q+lfjkJpASPSEUAw0vduZupRKE4vYdWf
	325ebIASItsGE8d5X5c1r/e3TMUYo2jCA4OXc72wvWeSt+fXOw2zjpIr9Dfi8xVudAYObQg/faYxd
	+7HL/ZJA==;
Received: from ip6-localhost ([::1]:22524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sECq8-00CRCE-2v; Mon, 03 Jun 2024 18:55:28 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16630) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1sECq1-00CRC6-Vq
 for samba-technical@lists.samba.org; Mon, 03 Jun 2024 18:55:25 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 453Ca7Cr027211
 for <samba-technical@lists.samba.org>; Mon, 3 Jun 2024 17:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type:date:from:message-id:mime-version:subject:to;
 s=corp-2023-11-20; bh=bmnRfb7SwA45UswWL92KEIohFhmEqwJIji3N//Sv9UQ=;
 b=cs4JECk7z086g4WqlFF6MpCYLWGIrktKAhUUXkyp6I82kTssH4WbELvWBCgUM4FzIZYn
 TnxXmXKwKg/XiecB+Racip4ziuf5D0SaslGR86fUuE2wBi1YQjXvAf1grPLniZBqDWqC
 wzXoplLQMaw5xcqIqF0RxMetMOaRS5aAuXtxIHrQ0+L9pZly7d+Xgnbt56THFflE1Ibv
 LaPvbkhA+cgvC48PxguOGOmmzNMr4dNGN3sZ2AM+QfGKiKF6hnC1AAToqjwY+zbF17C3
 dDuGy1J+goy5mBHWI7VJUNdfszO1BMQovWSCN7Y5nH1kA/QAVmybAkMwI0L4dRRSUsml Vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u3cu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2024 17:55:46 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 453GkE55016172
 for <samba-technical@lists.samba.org>; Mon, 3 Jun 2024 17:55:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ygrs91nje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2024 17:55:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD9IVlAnfo6qQX5RGA8mVscdEf3wXRgNYCWSGO+JAwLQoGDp08H83HC7QcStv9k8vnFKwbyk3kLXK4tCzC8FbwH8aIczEaQQIF1J7F0zDNFJTrzoFH+RX0LpPEmQpH5TBfrgssML0tM59Gvffn+OooPDF6VXS92pBp1rwoMUE8MhFUDV0M9wMM0d9wnziZqp1z5Bxp2Yy1L2hEiDa9EZD5svKQb2GCw3MOBSnAqP3Am70bDClhQYru1YSYX/mxVi0+ik4L7DjoHXl2bTaJAOv8ZQuZwnfb7pxNbA0xgvirVygjevpHmQ5qPmXEuOH6r0Z3WZoNQGENpdOMWkM1ixWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmnRfb7SwA45UswWL92KEIohFhmEqwJIji3N//Sv9UQ=;
 b=QUoEzhmExB3uXl64Fs4bs0VeSlYIUbRqHTCOjHal3El+0M5p5uEzzM/u8eYfq2pBsUSl1zpwG1RgYwiP5ur+HtfhOrGb03A6xAeCwRyM5zfGE68KsrZBXnLvDtEiRdBrHKxUUFIfmWy71rC8gWjMamvn2xPIOGWGWfXMwC/VnXdbwEJjisSbTtHEcNAGUKbKL/mpkFYUdPSWhK5fYn35J6aPp97okVhXQWnYlcvJjVeFWORSHng/uxT0ycqFoBOoNBVBJBd12Rvuag2JDRb9Oe8WnROHpISb1EFpigsy+F/ySQFLNZxWtWvjcNFkkQ352t6ShX+NDeQ0hnwa9t15xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmnRfb7SwA45UswWL92KEIohFhmEqwJIji3N//Sv9UQ=;
 b=J+SdC01xTwmof/1L5NVoTHxOqZLZ1L0JvnAdTR4zD7gf7oc9ufCra3IuckWVVYcg6UFbo0iU8b9p1/prOAwxLViFYrBOT0f4DjDi5YeaZZKFg7dWmpt08nGj1Ix1siocWccdhsUBT5+m4Wj0A5F7eHnc5zlXEkLlO8s+B/oouWM=
Received: from DM4PR10MB5943.namprd10.prod.outlook.com (2603:10b6:8:a1::9) by
 CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 17:55:43 +0000
Received: from DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77]) by DM4PR10MB5943.namprd10.prod.outlook.com
 ([fe80::c7d9:25b8:a7a3:5e77%5]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 17:55:42 +0000
Date: Mon, 3 Jun 2024 19:55:19 +0200
To: samba-technical@lists.samba.org
Subject: missing krb5 dependencies after recent changes in nightly bits
Message-ID: <Zl4Dh9XZ2XsQWROD@ultra>
Content-Type: multipart/mixed; boundary="1nTHuCSQ9m/de2FA"
Content-Disposition: inline
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB5943:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f80854a-0448-4be1-1071-08dc83f66305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmNySkpSeWRUZDEzUVFTMHh4Zi9TdVFWNnljNzVlZXF4ekYrTVZxMWUvUC9R?=
 =?utf-8?B?UEJPaWxxZ2EwS0NDM3FGK0ZTU2E1YXVsVXFmb0p6K3Z4TWRVeG9hMUorS1cw?=
 =?utf-8?B?VGxiT2c5ZEU5Q2VBS0RCeUpLaENpNloxMDZ6MWpnUFZJOCtqMnRHRzBvWFNl?=
 =?utf-8?B?RFZlbWtCWnlFNXE0Y0o3cjNFRS8xZ0dUK0JodWl4STZPOVJPZXhCL3AwS3Nu?=
 =?utf-8?B?dHN1N3Vid2pqTTlVY0FaMkQ1cW1hcXhndVZoWVJJM1p5TmdCbyt5YmJpaDZ0?=
 =?utf-8?B?Q3dOUmtUUlNzaUVLV3dtbnRxeUp2RE53ZmZMNlpaMnZkYjNxTERWbDhocWg3?=
 =?utf-8?B?aDRESXlhOUUxcWdNU1gvK29Gd0wwb25NSzdNaDA3akJDa0VIOUNRT2l3N1Ja?=
 =?utf-8?B?QlViQmhLVnEvdkNTWFRIQVR1QlBRUDR5SG00Z0ttV21pY0tTTHdUN2h3b2dj?=
 =?utf-8?B?Zmh4azdhbVVXclMzbDBGZjVQMkVTYmZmaUJwSjRxQzVpcFptZlc1MWs5eUJi?=
 =?utf-8?B?SlpldEx4WGJuVHhpdUE0TjhMWndpSm90dzJ1ejhsUEw2ZGd2RmhNYllUcTcx?=
 =?utf-8?B?WDliNzlVeUR1U2pyNlVkeS83L1UwN25NZ1lzWUdlbXRycjJkdnlnQStCeTU5?=
 =?utf-8?B?Y2ZESnpLdVhXMWtBSkJRdXVYMi9jWHlXOHdUN0N5Z3RuSzY1ajUyeVRXdmFK?=
 =?utf-8?B?b0t5TThHc213Q3JrYzVVRGRUWVpoelpQZU1pTXBHUVFRdm1vNkhFWStnUzRX?=
 =?utf-8?B?WVF1SW90ZXdWWWdsRlA1SFJOYjIrQ1poYkNpVFcyVDJZN1EzSVE5R3J5OGZW?=
 =?utf-8?B?bjZOT2hOVVo1UjR4aENMRXZLeng3M09heFZHVmYxUmc5c3Z3K01vSEIxeUdR?=
 =?utf-8?B?eXk5Y1FveGM4RnIyRGQ1L3IvWG1CM2EzLzhCS0JCRElOOWZiR2EvT3Z4MzQ4?=
 =?utf-8?B?dzVrNU5aNXlreTVMbFNYMHgxYVM3c3FIME95Vi81UVhJZHF6SXQ3WVpZWTg0?=
 =?utf-8?B?RjV2SVdHdURvb3BQWFZrVExkbHdiaFN5aU01WU1FWDZJVFZNdXp0aVg2cm9B?=
 =?utf-8?B?MUpNczJva005S1VIQmY4cGlkVjd2YUwxWW13T2oyVTZLakVxNDRHK09sTjh2?=
 =?utf-8?B?cXVuZ3V4dDRmeUdKOHVBZVp6blkzSXpJbXoyTVV4OUxpSVd6ak1WaE84a1FO?=
 =?utf-8?B?TmY4R1Nic1R1U0tibW9jcFd2Z29DUzY1TkJmQUJHSHF3bVZRWU52NDhmdWJs?=
 =?utf-8?B?SENHclVFOFNTVWtZano5SFg3OWRpRTlwWWtFQ1ZvcE14UVd0TW9MV0d0akl6?=
 =?utf-8?B?azBZb0JzRGIwYytWZkp4bVNMRDUrczNCM0NvbkttYThNbTFTTmlnUjRxT0RY?=
 =?utf-8?B?ZC9IZ0U1d3AxK3QxbVdKR2tpZ1VXTHRPbG05bmdyVlc4Z2RGZE5WUGwxbGIr?=
 =?utf-8?B?RGpyc2N6T3VDSmYrRW1KZXh4TFdYajZXcTN1UllzV0tFVTBhUGZncXFNSnJk?=
 =?utf-8?B?YUUweGczeGdZdU5iUnVGb3NGUHlQUEtGTm1lRW1nL3hNS280RE5Lc2JKd2Vq?=
 =?utf-8?B?dFVmNXhhdEpFMDF4UnJNVUhSOXVmeUNySEJld052Q3JlaCtzVERkMVdSNXdr?=
 =?utf-8?B?VFhkWGk2N3U3NCtsN0gxTjNhTFh1UDdjeFErRmhGbnhOcnlKNDRzZWdjTEF1?=
 =?utf-8?B?bEJnY2QwQllCVFgrYlU0Sjd4VUlXMy84bm9kekhqSXZ2ZVhFOUZHZ2l3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzlXdkc2ZXVaUVg2cTdkUHpKY0dqNENmbFdYWXpxWFB3SEFEbUxqNGc1NUsz?=
 =?utf-8?B?ZVY1SWJXbkplRFh5cEVkVzQvUWM0SkNMS0EyUjByQnhqTERraUowVXJCNXZ0?=
 =?utf-8?B?THBwQmhhRVF0NmJaWSt6WHB6ZUZvb1hLT1VoY0ZUdkhNVm10bWtad3YxVkow?=
 =?utf-8?B?dnpNQkQ4YjVlYys5VTBqOThHMm5veTBoV2Q1a09xRHFESUMxSzVOa2htN0hR?=
 =?utf-8?B?SWUzdU43cmdRY3VtdjFCd3JUZEhCWFgwSW14WUVHN3NZNS9iVncxK0tvL2pR?=
 =?utf-8?B?WVo4bXZ5NE5zZlordlZ3cmtqUzNYendHMGVwQkl2d0Q5NkhsVDBUaEZWZ3Qv?=
 =?utf-8?B?WEV5OG9oMnVaUjlVZStPZUREYzVpVC9ZaGc4eWxxd3lHUmswdDFnc0QwRDFV?=
 =?utf-8?B?K2FEMFAwaEgvWERoVU1Td1lzK213VlZPRXBYcUF1c0pLQWxUQU5xcWFjWnhI?=
 =?utf-8?B?SUpiZUhmVFlBY2kvOTQzL1BKODFpNE5hUkF2OXZzM3ZCU1piTlduT3JCdUYx?=
 =?utf-8?B?R2xuMmo2RzZUcUJ1dmNjVXNzZEh2ZmxYYlIyY3djMGcrOExlNXVMOWpBVlJE?=
 =?utf-8?B?NkpncWdaM0xILzluT1NSUklVRUowRXd5WmNnd1ZZNzhPaStsNWdOenV0ckFU?=
 =?utf-8?B?RXMwM1ZLVDVNSW9GS0luZDdZNWFOQlZNSmpxRzQ5RXVPMjdBZ1I3b01uVVJx?=
 =?utf-8?B?T1k0dnJkTkRnRTdvTkxzMWpZWGwySlNnbmY3bXdVYzhNaWRTcDZUZ1ZVWnUy?=
 =?utf-8?B?MHJIRFFIS2RDMXVpNkxvZDlzTlVJbEJFTitLYVY1OGQrVHkra3hSaE4ySVVE?=
 =?utf-8?B?QmcyNnd0MHYvYVFnZm1TUW1zejV2U1BYZStHZmJvakZHazhQY3Z0ZlA2eXB5?=
 =?utf-8?B?bFo1Z2o3QXE4bzhwRlFOcllKejREOEFVazlFZXRuRTFKc0Jja0F5Mnp5WmM2?=
 =?utf-8?B?c3hXdy85VTNVaEIwZmFkY3JWMmx5OUdoTHJpaUlqZXFHbUlqZm5iUmNsN0dR?=
 =?utf-8?B?ckNqNm1YNXFGNStLQmdLc1JJSldXWmhWNEdJMmN6cVU4cVNVV3hENEgvUEtV?=
 =?utf-8?B?cWRiWktMeVhzYXNjZUt2STZkTGNMVTRsUXdyVWRzUXBLd0hZejhnREd2eWtQ?=
 =?utf-8?B?NnlnZU5ZWXRyTEd4eC9qM0VzWkllVkxRaUNINmpneHNqcXJvNCtPR3dYTVU3?=
 =?utf-8?B?TGNPU29SeW9Zbkx2UG9BVEZCUEpFV2NPMUozU3EvOTQxa2FYL3FPa0wxUFFQ?=
 =?utf-8?B?eHJXdjBqb3pSTDdaR2JWOHB2aS9zZVU3bEhNdXVXWHIrdlE0REdaMVdxMzN5?=
 =?utf-8?B?dDVJR3doRnhIZ1pCYUZuYThtNWtXamo3ZGxTNEM0bklzT3R4L1lBOHkyOHVG?=
 =?utf-8?B?ZTNvS3RpUTFoQ0FWRWEwcHdRSWk1cW1lQmxNY1ZMOXJOd0RESXVqOTZZSkhU?=
 =?utf-8?B?cUN1cGVnSVZWRDBBQ0ZKZmlBOUNSMlBocW12N1dZUU95U0ZaVzMwelczeisx?=
 =?utf-8?B?Q0txaHA3cWxLcUJmVDJZbklDQmNMVWdzQmgvUVJNdXRpYjNZYmFRNWtIVENh?=
 =?utf-8?B?UDV4eW9CS2w2R2wwdkFHMndVcG4zV29uYXJWVUNHSEJ3S3kwOTZGWERmYmJI?=
 =?utf-8?B?YnJrU25Vb0oxdWZ1RHRmUDd4NG1xUVZDS00xTG5EM25vd0NNRTRMbW40Qkky?=
 =?utf-8?B?RWdHNWl1VW5oN3FyNCtmZ1BGcUZsSHBvRG1tcEs5VnJyZm1CK2FrcWM4dGFM?=
 =?utf-8?B?ZjJUWVAwZzM0ZzZJeFVYYk9pR3VMWEthL2pWSlN1ZWFTL3h4VnZMUUFGNlVY?=
 =?utf-8?B?YmNZeTMwdm81YnZOT09hNzVBbjJ3cVRFcC9HYURsS25RQlBVKzB2bnhlTHlk?=
 =?utf-8?B?cklJcXJibVVRVDVDbUhWc2JIeE5QSzZDMnBBa3NyUFVaRkdKcDZ2Vkx6TG5n?=
 =?utf-8?B?b1FoNkJSejlFZ25TWW14czJpQzVpRzczdG95d2NTa3FEaUI4U1lLS0MzTEN1?=
 =?utf-8?B?K2FNQ1g1dFR4cUwyMy8vTVMrYTdUcWFYK2FRaHIrQ3pPUUFSVW95NHZ5c0ZG?=
 =?utf-8?B?SmV2dUpoTmxiaDZrc3MrcEg2T3ZtanZXNlhlN2F5c0Y2VytBRmx5dWcvRkRh?=
 =?utf-8?B?SDJ2OElPUXY1bDIrSHhKdklYWnRQYU5FcTU4U1krUElkckFuVDhnNDlyajgr?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: p7JLcYbkFDODrcC+aGkr+oprfT+rw3i+hbs3znFDNKna+zmU9gKTYrYqmpJt27rwrCS4Nw2OXj6grB4/yVNQ1saX5cF49ZxVgUdhfi2psxfRWi3nZqybDJNALoY9Y9DphsDWRE3cIH0AgfbjfpPcu7HyPk4H+1zvIhCXdkZ3eCUCq4dqT4eD+SOZ8DPNFbnFfgsrcV+PC+xFbTra//VzLfiYRfk16+W9obdExNbgM5gZJezCex+iZraZiiRZlKiX2lcxjROsN2TFnJHWbn3MFWOjQqVt+fOnM67sEHt3N5QQhYMnBrsytVmpe/XBsXpPaRNbl8hGc10/7y1gpwtZ37NzRxuDTHBmZSTSdSZ6C04rQW4p5aStlJcuy+k+9saG3A6hHON/sbcXFlTKqLUH645b3AKOr1cP+uQyVJG+Lk2j6z45RGPkSEolWzYw8z1YxAcDRzZppz7ZIkcrA0ZLkwZYGXXzS8fU4mfiDYjoaz/9jDC7q+v1y5kxrU0oj7pd48Uk3EOsTVZlfosR35WD+0DPmRuHH+mys4HXjpivDNJDmijWufNSFbfSRA5rgvVD72Ik1k9YX+ToBZnbwzM8gh+lrcDCsKK2ju3W34HMSXI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f80854a-0448-4be1-1071-08dc83f66305
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB5943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LbiycQG+V2LV7GVoITu8ra7UqjEcLSZpnC2QAlB5774AheGMQAgU5Leu8hQECNq+UmVpippPQp96Z1e0COShH51bETD5q0gAD07yFbiktw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-ORIG-GUID: 8vw0RXr8ftpr3o5a4yEfQ3BXIoHH6Iye
X-Proofpoint-GUID: 8vw0RXr8ftpr3o5a4yEfQ3BXIoHH6Iye
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--1nTHuCSQ9m/de2FA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

From time to time I compile Samba source code from:
https://github.com/samba-team/samba.git

- it used to work few weeks ago
- it doesn't work as of today

Please find the error messages in attached file.  The build system is
Solaris and it uses MIT Kerberos libraries from the system. The krb5.h
isn't in a standard location (it needs to be learned from krb5-config
binary). This might be a difference.

Is this a known issue? I attach a patch that seems to fix the problem.  I
would be glad if someone here can check the problem and fix the code if it
is not yet already fixed (not synced to github clone).

Thanks,

Vita

--1nTHuCSQ9m/de2FA
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="build_errors.txt"

[1119/3103] Compiling libcli/netlogon/netlogon.c
[1120/3103] Compiling libcli/cldap/cldap.c
In file included from ../../lib/addns/dns.h:30,
                 from ../../source4/libcli/resolve/dns_ex.c:42:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or 
directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
Build failed 
 -> task in 'LP_RESOLVE' failed with exit status 1 (run with -v to display more information)


....

[1203/3103] Compiling source3/libsmb/cliconnect.c
[1204/3103] Compiling source3/libsmb/cli_smb2_fnum.c
In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/libsmb/namequery.c:33:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
Build failed
 -> task in 'LIBNMB' failed with exit status 1 (run with -v to display more information)

...

[1948/3103] Compiling lib/tdb/tools/tdbtorture.c
[1949/3103] Linking bin/default/lib/talloc/pytalloc.cpython-311.so
In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/include/ads.h:79,
                 from ../../source3/utils/net_proto.h:26,
                 from ../../source3/utils/net.h:183,
                 from ../../source3/utils/net_ads_join_dns.c:24:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

In file included from ../../source3/libads/kerberos_proto.h:33,
                 from ../../source3/include/ads.h:79,
                 from ../../source3/utils/net_proto.h:26,
                 from ../../source3/utils/net.h:183,
                 from ../../source3/utils/net_dns.c:23:
../../lib/replace/system/kerberos.h:33:10: fatal error: krb5.h: No such file or directory
   33 | #include <krb5.h>
      |          ^~~~~~~~
compilation terminated.

Waf: Leaving directory `/builds/$LOGNAME/samba-nightly.ul/components/samba/build/amd64/bin/default'
Build failed
 -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)
 -> task in 'DNS_UTIL' failed with exit status 1 (run with -v to display more information)


--1nTHuCSQ9m/de2FA
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="wscript_build.patch"

diff -rup samba-4.19.6-master/source3/utils/wscript_build samba-4.19.6-master.new/source3/utils/wscript_build
--- samba-4.19.6-master/source3/utils/wscript_build	2024-06-03 13:10:11.000000000 +0200
+++ samba-4.19.6-master.new/source3/utils/wscript_build	2024-06-03 19:39:18.683596593 +0200
@@ -9,7 +9,7 @@ bld.SAMBA3_SUBSYSTEM('CONN_TDB',
 
 bld.SAMBA3_SUBSYSTEM('DNS_UTIL',
                      source='net_dns.c net_ads_join_dns.c',
-                     deps='addns')
+                     deps='addns krb5')
 
 bld.SAMBA3_BINARY('profiles',
                  source='profiles.c',
diff -rup samba-4.19.6-master/source3/wscript_build samba-4.19.6-master.new/source3/wscript_build
--- samba-4.19.6-master/source3/wscript_build	2024-06-03 13:10:11.000000000 +0200
+++ samba-4.19.6-master.new/source3/wscript_build	2024-06-03 19:24:17.763401587 +0200
@@ -908,6 +908,7 @@ bld.SAMBA3_SUBSYSTEM('LIBNMB',
                           addns
                           lmhosts
                           resolv
+			  krb5
                           ''')
 
 bld.SAMBA3_SUBSYSTEM('SERVICES',
diff -rup samba-4.19.6-master/source4/libcli/wscript_build samba-4.19.6-master.new/source4/libcli/wscript_build
--- samba-4.19.6-master/source4/libcli/wscript_build	2024-06-03 13:10:11.000000000 +0200
+++ samba-4.19.6-master.new/source4/libcli/wscript_build	2024-06-03 19:22:02.200073053 +0200
@@ -65,7 +65,7 @@ bld.SAMBA_SUBSYSTEM('LIBCLI_RESOLVE',
 bld.SAMBA_SUBSYSTEM('LP_RESOLVE',
 	source='resolve/bcast.c resolve/nbtlist.c resolve/wins.c resolve/dns_ex.c resolve/host.c resolve/lmhosts.c resolve/resolve_lp.c',
 	autoproto='resolve/lp_proto.h',
-	deps='cli-nbt samba-hostconfig netif addns'
+	deps='cli-nbt samba-hostconfig netif addns krb5'
 	)
 
 

--1nTHuCSQ9m/de2FA--

