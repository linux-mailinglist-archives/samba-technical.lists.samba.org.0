Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28C7A66CD
	for <lists+samba-technical@lfdr.de>; Tue, 19 Sep 2023 16:35:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d/c3H1VAKGytmUMsig1MW9nSSPi6U1IOOkfwFsf0xVQ=; b=d0h9f0HxVPPsj1CqVjmsSBj3d1
	TsXTX1d/TliFei70yAzvMaiolMjIFZ2UFKvDWYCpW0ztm31/7/T1bwaiAqj96FjwxDWC8QQVY6e12
	wBSVp7plBzvj/5L/t6kDN5mgonymednr0pS5wgVhouCvG/q4nRt9LNidzyHmEvsasv9KdNj5IniH0
	ldEO+uylIobvVTz/b6pC9YZlcsoASAdpoi8o1NboRUJ6lTKRAo1AZEcFVKxKRMf3FdlJItj5JsPUH
	7dTCYd5y098afLKpByFLqlAbQXme5m0nR/AxsGphU9cUqV5sqElQwien4nqmtkifsVZp5z2M2jqXd
	HK/+5hNw==;
Received: from ip6-localhost ([::1]:65466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qiboV-005JhN-Pt; Tue, 19 Sep 2023 14:34:55 +0000
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com
 ([40.107.92.43]:45024 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qiboN-005JhD-A0
 for samba-technical@lists.samba.org; Tue, 19 Sep 2023 14:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRS/vB3PdFhEbuzv52uy4p2PFp/efULQ/2R38f8H4Xu+mAklp/kd2w6V5mdrQ5Ji97G0WhOawgK5UVibMYN0gXmb0cTN99U7zvF8J0s9dhjf0qQV0WYNnUh397FAoLzzTD/Z2Jtj1CwO1UpxXz99fUN1G/8zdWBUTFAab/w3jF50IEtK3BuWwRkOylcwUHwGFAVlVni3rbL5Aog7HLVCP+brtxGUokAOjoa5WeRqJMJm8SiuIhLlL9xwHTHado+jKu8eSzC4pRzF+wcmYDvuzcCECnUf1GGqC4wYopRIVBm9FaqwJLbFkUi5brNZJdY5KzQFb/Lbsuilgr67+dzhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/c3H1VAKGytmUMsig1MW9nSSPi6U1IOOkfwFsf0xVQ=;
 b=OX5RjaQhBnHcfikSNCibQpEIqkQMjWZ8MX4duYFggNbGI9VRdM1Dt98Grp989Y8Qskrb5LV3shfhLzQ+TeFkVCvcPjlWsMJxiNMEOxws0wJEZC64HvRRE7dtFNQ3omcgbFVWQVvcYoEOtOF6b5c1s/HNyAyUHYrzoXCwmatJ5uz33k/+KEE4duphOLG0473tD0687kmxfs+UEatOW7GFNYQIsgO8dUadhiNLx+6sgFMAKhglUD/MiUdtT8ITW3SSqpowXeHKX3Q6iZ6aTTQYaSDDTydPEzxguevdr4bsGNiIXvYfl1KJRhiOLyzufQZ0xF9+mojEr4reLz1YCnSKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 LV3PR01MB8510.prod.exchangelabs.com (2603:10b6:408:1a4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.23; Tue, 19 Sep 2023 14:34:31 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::cbe6:1667:cce0:3485]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::cbe6:1667:cce0:3485%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:34:31 +0000
Message-ID: <b442e3f0-8a49-2252-fd02-f2c62ecd13a5@talpey.com>
Date: Tue, 19 Sep 2023 07:34:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH][SMB3 client] add dynamic trace points for smbdirect
 (RDMA) connect
Content-Language: en-US
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mssSM9HhMXVu8570jX7Yx1CyERhjeg4S+Rp77HWrTHb6g@mail.gmail.com>
In-Reply-To: <CAH2r5mssSM9HhMXVu8570jX7Yx1CyERhjeg4S+Rp77HWrTHb6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|LV3PR01MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1cb68e-4e45-457f-0ed1-08dbb91d891e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: a9+DyTNzI5p5HY4hqvY2fU7GmGIHXG7buSeFNBjH7Vt7+xa8vrpSARnzUw/b0hJbRyA0WUQeuQMFNXB394DQHPauwdXliwYjYvV6Yw2R5LBsSUWBD+M/GmUZTuyoGI4tJ9/39CVY0+9UR9t8oceSz/gc0wpKxJd8NrKghj+blAsSoU0V4MxNg2V+HYma+CUp52+Fmdx1NydpMNLfo7vcADcQJCyDT9IoiuFNjdcuuBhaiDjc0XdExbc3nhbBp4vm4VSt0M0bGuT1jwTTFQ6paXlHosV5E6GOBoI7u0BI3I1yZCGRqkJldh6EpN7ReNNDoHu2b9yrT0A1LCnr2GKQc0DBEIVjGMcZI6ODt9Eq1aChs5VVjql3QzZ61EfQ7ZOrqlVnfnCDO9XxPIuPGJrbtcg/dFpTDnxm1X3txtjc5udiX8NoGhLq45QGU/3yz2FxrSSpbx5R9fc5M+YsVgUqrRJhe/M/Q4JCMYV+oqs8HWl/lHya/5nlrnPdlAahcIjYR4w3dRssE7mBxjeiJ20Tu+M/3IPIniDJtV4tE4IzNsap0SQ13t4FSW3yarTD1bYMhYGVyMMXPH/ETFA3c2oSwMIVCxgdoU7q7OBKJdd6Wz/skfjHwiQ9Z1aBpBjCy4O6iu+qY/iKSa7aAi7IDfeLeA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wml4bUQ4M1FOVEo5RUtSanl1RFRiaklwbEVuYTM2NE5US0QzNHh2ZWROdHhI?=
 =?utf-8?B?blBBcFhOejRpdks2TTJTR29Ta1J2Qko2M3lrZ2ZlMjdLZFJrVHJFd2FzL3ZJ?=
 =?utf-8?B?QTlxVEVCdXdaTGYzMkxBUEhicDBBcGJuSUdubno4S3g1b0lsbitSbVAydHU3?=
 =?utf-8?B?NkpabmRhWmt1eVV4Sm5XQlBtOWE2WFhTUjNNelU5QUlVZU5BZ2hLRHN4dlV4?=
 =?utf-8?B?ZEN6REJMRW93enI4VmtYWTkzOWdZK2hmRDRldXBZY1E0KzJ5QkpXVDNPL1Ar?=
 =?utf-8?B?Q1k4akRCL29EVDRBQ1VnOTYyWk5QajhxREhIUnVQUnZvT0NwRDhUWEYvekhZ?=
 =?utf-8?B?ZUxmRUpESTJFWnhVMXpJMGJHUnB5M085aUtwV0Zaa2NzbkMvZEF6OWd4eHJE?=
 =?utf-8?B?ZzJ6OTFXYkFGUElZdTVvbWZtL2VvSUQvNktoUGdOTmhIL2VtcHoxcDFkMFBo?=
 =?utf-8?B?bFhXNlF5QVRabHBWUllWVXBCdWVKNzA0SlNGNWFyYUdTQVloVjZXNjJnNW40?=
 =?utf-8?B?STNQT3BaWUxmSXR4YXFtclhGMW1aNVpiQVZOOE1rMHJyS1RzNVl2SHo4TnRW?=
 =?utf-8?B?TS9QYURFYnZ3V1VrQmxTc0h6eUFFdlIxUi96T2RpSEZpdXJKdGZoOHU3endp?=
 =?utf-8?B?UXVBTm1wMmdnWnlQTzd4MlJPTnhqdTJtOVQxQ2c1S3NIbWdnMjJ6bUd1U1Uy?=
 =?utf-8?B?Q0lpWkhUallwV1pHN2JieXV3SVcwNVNDUXcxMVp5UWhobVRVM0lDTUpxL1VK?=
 =?utf-8?B?TWVEaWlsU1hIbjJ1Mkg1T0xUMU9URURnTGoxaUh2Vk5yNERqRzF5TUU1cmxT?=
 =?utf-8?B?VXdVVWE3QzdKNUZMKzZ6NWErSCsxVU42VFlKRG85T2xmbE1JMTVhTU9Xc3FG?=
 =?utf-8?B?Z1hWYlhibTRrUGoxSG1TMUxSeWo0cDJkZGRTbFBDUUtEd2cydXZyaFlROHkx?=
 =?utf-8?B?WmJ0K2luUmJCZEpUQ2FVVS94UlVmWG1lYmE4RVB2N0xWNFN0eUEwWEFrdW1n?=
 =?utf-8?B?WFNQMWh0a0lwYVRCVVJjdXlzSGg3VE9Bb2swOS9abm1EMmJ6S3dYMXBaNnBE?=
 =?utf-8?B?WlJPaW1XZUdIUmVWdmc0a0FpRzV4TGJCV0NuOHhSMkF1UTVmR1FqRmFZMW9I?=
 =?utf-8?B?dGE2OEUrVEFMcURXSC9SOUt3b2xLLzJ5WFBCa0RIZlo3QkVKdlhXdU5hZDFk?=
 =?utf-8?B?V0FNb3habUQxNG1xVU94MEFWUXBOeEJHS01VK01uUXExN1YxWURHY090bTB6?=
 =?utf-8?B?RGdlMzcxaWEyOENSSTJ3Ly9wTitxWk83VEVlVytwa212UXBObktIaTl4U1BH?=
 =?utf-8?B?UGNiQTUvcWZ2a3hqZjZWY0V4SCsrd2FWRkczc3owSXd3aEpyZ0VGejdBZjFW?=
 =?utf-8?B?VTJLakFSVTFDQld3elhzNVhWQ0JUNFl3Y25RVlROZGVpMlVpVDloR09WREJS?=
 =?utf-8?B?SzBOSkdGVnVTbU1HbGtJd0lob1FKL2RxRVNCVlFtcm9lMEJ4eHRIaEUwMmEw?=
 =?utf-8?B?a0s5VnhTb0hvWU1EWTNDcVdya0ovSEJxUHNJZWZPWTJxMm4zQ1B3dGhySDBa?=
 =?utf-8?B?WGNkR1dZK1JueFRLa2hjOW9jRnZVNlBpdUhDM3MzczB5R294VTRGbkRsaVZI?=
 =?utf-8?B?WTJFREtwRVM4eFUwckVCb081U0NEbEpka2J1Q3NVRTB6MGpLQjd2YkIyY2JN?=
 =?utf-8?B?UGNnWlo1SVN3WFVrWC9GSlJucXhTNmRmN1FuVW45dWFRV002VXRnVlNFaTJH?=
 =?utf-8?B?NDI3eTBabmJpc0RGQ3hjS3FYMGlZL2pKd2oxWElUby96NHVPUDdRb3N1b0NR?=
 =?utf-8?B?K3FrK0t4MnhwVWpBU2NrTnVzR253RjZrK1ZEeThlOFNYMGJPTXJBbmZ3NXk1?=
 =?utf-8?B?MTZ3OWRKRG5FU0tRTFlIUTdPVjJYZkJkNGI4aExCckFleTVxMVZZcnRtQjZt?=
 =?utf-8?B?VmtTRmZ0Y3VIZURYN2FuOU9BZmRDaFdacEJmcnNrVUtzeXVTWTRGeVZtVFBL?=
 =?utf-8?B?UnlVcjhDcVNwaVU2RGJkdXBwYkNHdVJZNUQ3Q1NRbWJ1cmFEbmZ5dXZoQjJm?=
 =?utf-8?B?OXhoMHBRN1Y3aGZoQ0M1N0Q5aDZaQU5paXpMVnB1VnNCd2cveS8wNDJza2tx?=
 =?utf-8?Q?Gi2bqCh/5OpHNn79KEo2bl7dm?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1cb68e-4e45-457f-0ed1-08dbb91d891e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/mx1SxYUXaz6jNpGG7zdpAF4BLjGLyWTmZAofnZwQMOo6xni321PBCdElDP8bBc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8510
X-Warn: EHLO/HELO not verified: Remote host 40.107.92.43
 (mail-bn7nam10on2043.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-BN7-obe.outbound.protection.outlook.com
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
Cc: Paulo Alcantara <pc@manguebit.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/18/2023 11:20 PM, Steve French wrote:
>       smb3_smbd_connect_done and smb3_smbd_connect_err
> 
> To improve debugging of RDMA issues add those two new tracepoints. We
> already had dynamic tracepoints for the non-RDMA connect done and
> error cases, but didn't for the smbdirect cases.
> 
> See attached patch
> 


This looks fine but it's pretty basic. The entire smbdirect handling
in both client and server has its own idea of debug, with two (very)
different ways to enable various levels. It requires a silly combination
of /proc, ksmbd.control, "class" and "level" selections, and some weird
other thing I don't even try to remember. Combined with the ancient
cifs_dbg stuff, it is all just... unprintable.

Anyway
Acked-by: Tom Talpey <tom@talpey.com>

Tom.

