Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3C68A7D8
	for <lists+samba-technical@lfdr.de>; Sat,  4 Feb 2023 03:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oXJdUoZ6mFJrlM1P15hw7TUsE3wqme7vKrfj8TNR/KA=; b=xKdQlYdRCVJK5xc7HC8zRt7v0k
	lJMmA8jfzMPMuqOdXyfjwuv8Icgbp6iEF7XXcM5p3j5C0K2E1f8IR/wJcdPFmibbxKl2FtqvifSo+
	/mqcWICHI1Xhwymoid7h0NqMpxqsqFwAiJQaJ1rcDhq2cB+jgYIDjyfQYQLV5LNIVHEBZ9ll2IvsR
	2jdgyRshfJrImzdJ4M4wqNU9nlj1BeROIaiwUOvFu9Jg2de/QI524leZMZdObGuleQrgQXEbXUWbu
	ba9Yein0wPR8shlZS/2IBQuJUcHQImNfirmGrvRMUlM8p3s99RtgV5oUj4Eane/E3tC26+SmChb8o
	v7TpLuVA==;
Received: from ip6-localhost ([::1]:19352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pO8PA-008gFo-3P; Sat, 04 Feb 2023 02:35:52 +0000
Received: from mail-bn7nam10on2062a.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::62a]:56289
 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pO8P5-008gFf-1t
 for samba-technical@lists.samba.org; Sat, 04 Feb 2023 02:35:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbSM2nZAKCbxtdPxAjdRXood7UIkTKD9kK+I12EQAjenOglrkVfNCMmPkfAmpqrRemttR6Z7APYlEewJNXF/ZHnT0astSPvGi4H1U4zGMhT2icsZCbw6gADNzesvM7voYFjTH6055WhqMQrmBbycgIXYAeVRUPQ9/kFaYgjH6MSM6Ii20oRmnthU0+qpvEIR3OsBFbUNMrZQ07tYfhAd6WTLDPYO1TtOU/yL9Getu8tjxgNc6cic4ZuoCA3wJVmAwZQ2D366mY7gE1B4ZN//23Z8UreSqvJL+bod607Z/ZdPrTOzRDGu9qUDpHePdVZAyaMtfAxTAHTIfR3h7Vp8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXJdUoZ6mFJrlM1P15hw7TUsE3wqme7vKrfj8TNR/KA=;
 b=hzNC6vq8F+ioYs3yUagXZxxcrDIojdaZQqdJdqlbRaInR098uD61cDHIH15M9eKCIMqQlirJ+JrjGD4Z+9yqPuCYPAU3pqpb4tOsBtaRud8lxqnddmqATYUAHsOBRf0uNOinjO58Wq8T/vBdTQtJE5bReRPnp97KkQlpC3EjN2TMrrsLD+1lxqssj07+XJV9S5GkRqmwbq0tA+bgsFXu/5nwqWQycFnNNFy3fyCvWDMq5fst5VyyquP4H8yNBbi41d4bFS1QWfmegjSnSJ5EHn4hpiRsl62lxmVHTBofO4wvoI8XaIGaqTqophm+Qv5FND15yF5TsuwwB/Agxu/h7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 DM8PR01MB6855.prod.exchangelabs.com (2603:10b6:8:10::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.27; Sat, 4 Feb 2023 02:35:31 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::d8d6:449f:967:ccb5]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::d8d6:449f:967:ccb5%7]) with mapi id 15.20.6043.036; Sat, 4 Feb 2023
 02:35:30 +0000
Message-ID: <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
Date: Fri, 3 Feb 2023 21:35:28 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, varun mittal <vmittal05@gmail.com>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
 <Y91JdhAtd41n9C7O@jeremy-acer>
In-Reply-To: <Y91JdhAtd41n9C7O@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|DM8PR01MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c99fd92-c140-4f65-e1ce-08db06587b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: f6Plija04AFzAH+ralKD9Npj/r6LPmjNslKEy3gbGXfGCRRa1cYRp/aRU6bgQBNVuNxfr3ef1BKYRII7xwNz6uJBddj6JLdpmH8XFyQnW91WdfkR9h7Us1QjJ8yO8PsKODgr6Ha2eapeulc5kUJm531ifnsQHZ9ZH4tBV1XiaK8QLpnNy0xrqpQhsAotWFJCOim2q1Cut3spEXcoz3atznmLWcc2QUWCKyhkBVa/KSAUAALBmIjwZqTyGQbzJsy9qQVpMd8fL0SX9dl8MH89BS1T739E3AzF+o0myf2OS83hVMBBZNDsnuOPRD2ycj3Kp1KvC2Oe7qZ5L8275if0lG6OYdZLw/d3YL7plsFctNRg9um1fCkxvXPxqwWeluIJETlyfa0LjOnF1JUDwVXLLH5gSW/ZCEpHm14lE3z98Xtn1cg8ep8V6PIACUmtW0EaBFmLMVuMqXMz/z3pOVVRhfUeX6uT5/QjwU0pFqF8o6iK3vVFuztQWrgNyh+IFM1rEQGTKymIOI/dNeAOFHMzB6w5LxFQJF11P3kfsfzzDvDCD8LJkP8wRhse+bRYlSY85vvoZ44nNLM8U80kM5tCcKjN73fzzUIcPbhgDhIYK8/ABeLf8UHzNVF54H+Btu+9BajFYIa/n8yzsYfNcL+a2UyZKFkn178KjhqtQ87x9BYHuC7CoS6vSsfHc6H5iP7qZZMQhA2+7zMruJcOCQJwBzWEq9g71zbZb+cko2ZU5tE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ZsSjZVV2RQdFF5Qzl6SVRneTJXUVIrTjRJNEM3YUdmMHBrbDJtK2ducnps?=
 =?utf-8?B?U1FRWkF4QTRlSzE5T29MZGlhemxkbTVDT0QzNkZqOFI1WndOdnc1dXFpeVFE?=
 =?utf-8?B?bmJ2amVJam5rU2YvUkFSQ0l3OHZtTUs1RktEOUhDY2pwM01LNE8xaDZFb0ZF?=
 =?utf-8?B?LzdVaktGTVBBQ1ArelhiV1EwU05XQWZ0QkR4MGNZb0g0eFQwZE0xakdxVVhK?=
 =?utf-8?B?TWhnVG5QOCtxTXgweDJtcitITjFVSWpsaEQ1Y0NOODIwbnFna1FNK2dKOG5P?=
 =?utf-8?B?c0xFbEpqcTkxdUhmSnR2bm1WL05SbFlKMXpRR2ZPNlZqOWJjNzZXWWVhVzNn?=
 =?utf-8?B?QUxBQTRRK1FwTWxxR0pIa2p0SS9MTHlUUlViN2FwQzhobXpVeWkxV1lIMlhR?=
 =?utf-8?B?MXpyQVFmbHM2SjNPb3B3ZThEd1d4b3ByUVhyRmZ4WGRDZGg2ZEcwVVVjOE01?=
 =?utf-8?B?djJWbnRjelI4U2FXOXNMWEkrVVJLNitIaFVSVjNwRUpsTXkxN3VyUWpLZ0h2?=
 =?utf-8?B?dC9RMXU2ZVZBQVRQM0lyYzIwN3UzUUR3ZSs4aTFlV2RhaVhqeGxNT2hZU2tE?=
 =?utf-8?B?NFJGZUlINWMxMC9NazJMdG9Zbml6N0lYdlE5bmpJVWdDZXR0U1RYM1UxUkJN?=
 =?utf-8?B?QW5ZdUpLUnQ1L1lkd1p4RHN4YS9BR2JyTGZOSEtqT2lLbDBibXdJdWdDRGpz?=
 =?utf-8?B?MjJjRlUyRWV1eS9JVklhcVFoUnkzdG5tZGxPU1NyTFNOYy82THIvWTdTTnk4?=
 =?utf-8?B?S1V0dkM0bGl4YVJnMkxBNlQ5eWU4bFppYUQ5VE5UWWQrSUc0M1RPYmtFTERI?=
 =?utf-8?B?TDFMNmJRem9VK2ZtWTI2aitwdU1RNjJ2aU9CL0VBbmozcUhGUWE5WElqczJw?=
 =?utf-8?B?SUdDQjcxdFd5ZVpJYXhuTEtoMG5TWHQ2c1dHMmdXRWQzNElCQWZyUXBLVFoy?=
 =?utf-8?B?SlUwRnMvTXYrSnhnS0lObmtkWlZKN2JMV0lRR3VQOWpXeXBZcGUwMDNiUEVG?=
 =?utf-8?B?dEQ1MzBPVEovMk10S3JVYUQ2OFVlTEpDTEVha0tvQzA3UzlJaWRncXJCWUhH?=
 =?utf-8?B?QWlYQU5CTTlXTStaUUdpeEZMaUwrVkxFTXV5ZHZUTU9vSnhlRCtrenFrbHN5?=
 =?utf-8?B?OXdPSnN6TEhMeGdqVHh4Wi9KSGU5bWV5V3F0ckp2WjdzL0pFcGJVM0ZIc0ha?=
 =?utf-8?B?N01abHVqSjZRMGl3MDhtdWF1c1grajlDRUpROTE2TmVXeVRUQmRFYS9sZzBw?=
 =?utf-8?B?c1doWXJ0RjJQVUVCVzVEUmRSVGVoSisvNTZYREZablIweGdKMSs4Q1h5elhI?=
 =?utf-8?B?d0VpNlRrWmVQeGloTDA2ci9mRzIxZmQ3WWo3d0dhcWRkRUF6cDRPVC9uUWdo?=
 =?utf-8?B?bkwwT3pHYzdkbDdmVUZGenA5Zkw3d1lRQTVnYmRGdGtPalVqMElRanFOd1BR?=
 =?utf-8?B?WGxvMzdHTy8wemRrVWp2WHJsZEpyRENJYmlqakpNTmxpU3V2ditEYUxtZW8z?=
 =?utf-8?B?ZTJLYlRXV01aamlVVWgzR1Q2NjNkZEVsYVpsVEh6YzBFdGZzbTM1YnhIUGwz?=
 =?utf-8?B?cEVZOTZLTkdMUDZUUDhES3pIRFFzOEpmaE1wN1dhdUhCTlpkR1p5czZGZHIr?=
 =?utf-8?B?MVZjTmZNYW1MUGtZK3hTODV5czZTb2ZIb0MvMEtMNUdIay9ZaFlocVJtdFla?=
 =?utf-8?B?WkZQZDUyLzk2bDFySlNTaEJraHB4TWViUXk3R3pZZnF6S1dnMjhxZ3VhbTBr?=
 =?utf-8?B?a2ZKRmlQYm4wZkpESG43cXFlZUtzRFN1Zkw3b3BtTW1mbGY4OExNaGYzdjA0?=
 =?utf-8?B?ZjFBc2E4NE43MVYvQzBnNnBLUHFXd3ArbXJ4VHFzYVRmcGtLZk9xcVRwY3dw?=
 =?utf-8?B?WituTGhPOTRzcHEvdlF2L2VjMlo3WnJIYUJ3TU0zMEJHZmJwMWNEMEo0SXhZ?=
 =?utf-8?B?bTJVc28xRXlmVmFxdS82dXd6ZnNKcWZHbVp0bW9aNURIWjlUcTN5djdXQjVW?=
 =?utf-8?B?aTZ4Slp1Y1dyT0pOcTBMQ3loc3BjQ0lrN2hWdzVFeUFyY01qL2xyMytveVZl?=
 =?utf-8?B?dlB0NEszUFRRT2xLSTRmanRVdDM2TFNzamYzenFleEZ3bzd0K0lZbjJGKzNy?=
 =?utf-8?Q?iGGGPk5v3oaH349QMSvlbO5AX?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c99fd92-c140-4f65-e1ce-08db06587b80
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvtlE7Rcg4LSKXJDlfENb5UEmDF0twMtknW4t040TCPTG5Imv9IgofJbfGuxP7jW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB6855
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8a::62a
 (mail-bn7nam10on2062a.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical wrote:
> On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
>>   I was able to narrow it down to the "Named Streams" bit in
>>   "FileFSAttributeInformation" response.
>>   When this value is toggled from 0 to 1, as is advertised by
>>   `streams_xattr` VFS module, Robocopy
>>   switched from FILE_OPEN to FILE_OPEN_IF.
>>   Thanks
> 
> Thanks for tracking that down. What strange behavior.
> I can't see why having a stream would make the open
> change to optionally creating the file, but it's good
> info to know. Thanks for posting the follow-up to
> the list !

It's not the presence af a stream, it's that the fileystem supports
named streams. It's getting that from a FileFsAttributeInformation
on the root directory.

Robocopy has a very broad range of OS- and FS-dependent behaviors
and optimizations. I bet there's some combination of its 1000-odd
commandline options that can change this.

Varun, what exact robocopy command are you seeing this from?

Tom.

