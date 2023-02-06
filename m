Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3359268C547
	for <lists+samba-technical@lfdr.de>; Mon,  6 Feb 2023 18:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4WIMRNoS2dqHAiTgX7nv0dYWgHw21yUnwWlOpLV7JsU=; b=D7dKoOQusS7jw7SuoY1JTEWmUA
	+j4XGkqCHRucSFZhlfAwEbqt1ctMPvHAIl1AjSPp2wBg+yyr2TRZ7YNH699EpWyVezgm/RjiYDm9C
	QBTfPo/rs1q9buZ1i3Gyf4p+7FtrD9pSOkvPwGGBoLgA6lGPWXfdWx0pDCw4CgJVq7x0unBphXnTW
	wG1jZgA+69unPsPKfR61ludyWTkn5jfBbj1gA1XttPdgFwbXKK+oj3uSfYP5NOe/LHelbC38MBBni
	F3B5xuse5oknd+dhQDjdzSgYemZSBsOWyNuQCewumh7sLPTwZeFu216T8nb8j8BtujmTsriNdSUbO
	OZMc5YuA==;
Received: from ip6-localhost ([::1]:43772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pP5hr-0090G0-Jq; Mon, 06 Feb 2023 17:55:07 +0000
Received: from mail-bn7nam10on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::60d]:46656
 helo=NAM10-BN7-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pP5hl-0090Fo-V1
 for samba-technical@lists.samba.org; Mon, 06 Feb 2023 17:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ar5lOXpUeaj5JU2zNn5Kqds7Tg/qkgpUkvCL2NmfFcc218kfwMvanQCWQFQpNQKCLA+pupZ15eoFyjtrRmvXvQI8x17wIQr1d3oF+YyQ0uT7IACfkm3ffFyRB25TBiQmg5hSGkAw945D2OeU+PH94NCN9KeBzYHIEBlT/LcengJbtT/w73R4A1NubW4AljXXGBjVZYA6thwEtp7E6noCxHLG11D8AZygLluXJovYnXPCuZag1FmmlvtFQPDOg+6sTnO4vIwcQd8sOL7FKE/93x9mppqqDT1B+oxZzRe+15StWuV4TmiVoq4bf9MXPyXPg4/3ysUO1TSc7E/YrT7Rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WIMRNoS2dqHAiTgX7nv0dYWgHw21yUnwWlOpLV7JsU=;
 b=aeXM+GXZWTZYbJUPYZrIR6/PNMC/PEc9yV4yoJc38ILyZ2514z6JnqV8oyP3/ZKAoS/O396uSE7jrBR5DK9VUCBZi4wKDsu6wxHYThRIK6ebO6vdqFIkgU4xzASPMVZQ4psOkERwx1UGmESMfm5NwiNd4Ubw1RI9n6l6oe7xzisSogUe6NbKHxwFtsRuxXiivbyS7ij86jJy4bA2p7dQplKoCLdiDDqqYhiq+GIpbfV8Dr55w6o1vK2ugxEg85wdSUhbjuvZ1Nflk8iwLYN4rgPaTOj1pwTnS0gqkMK6g7OJtEF/KOmBihSwNrCTQDvtsqWbQLVavG4zve5o2LHg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 BYAPR01MB4133.prod.exchangelabs.com (2603:10b6:a03:5f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Mon, 6 Feb 2023 17:54:47 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::e58f:c83c:6b17:d3ba]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::e58f:c83c:6b17:d3ba%6]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 17:54:47 +0000
Message-ID: <d59214c5-6917-94ca-0608-1832d8de916a@talpey.com>
Date: Mon, 6 Feb 2023 12:54:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Content-Language: en-US
To: varun mittal <vmittal05@gmail.com>
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
 <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
 <Y9QgJwNzUh9EQFQV@jeremy-acer>
 <CA+RDaRCMPnsbg9yH9ciO_uPErDm_pKa+_fZtLtu0JbRpPkJUnw@mail.gmail.com>
 <Y9QuBd7wf9hfbpT5@jeremy-acer>
 <CA+RDaRAxOKK9FmwOFrh=ZNkw1ZP7xZiyah=NjKjjxvs7HnK7tA@mail.gmail.com>
 <CA+RDaRAY7WLbZf=8Bp=jA0X435SvoQLFv7EK-WcbFCpPy67S4w@mail.gmail.com>
 <Y91JdhAtd41n9C7O@jeremy-acer>
 <48083804-dfef-7348-7e8c-9bc10fab9db3@talpey.com>
 <CA+RDaRAUAhjM9CDuJz13HKt9GcbDhMR-HW3YPTpWuMGPLQU-FQ@mail.gmail.com>
 <a395da31-5812-9fb8-6857-7da0bf1b8531@talpey.com>
 <CA+RDaRDGLQya8TzsUrBDR4vV28HcoxsEaJSE9_r9bn_Rc=f9BA@mail.gmail.com>
In-Reply-To: <CA+RDaRDGLQya8TzsUrBDR4vV28HcoxsEaJSE9_r9bn_Rc=f9BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|BYAPR01MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 17914f44-0fd7-4405-abbb-08db086b3ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: /5X/647SLBcNlB3R/1UnxyEJZA/DlT/n0NTpaFO/d2iBMW5Vu20GuWBPQsox3n9Pwdff/JyrHYyx3ob/oSdzZUTscLTcPrTA7HbFEmym9ygPsH9GiNvIuzsZ/j7qqN5wZjWGXXwmpm3jQzwRTPkP91zWjQwUgT3+nbW+15IWksiW+C+ekWVnV2aprdY1dedPIEEZnnaUB9KAzIY8hkmD8VWcl5lJ7DndJQ9vVYu6TWzkya7B+i4zuWMuhF548s4vO3glHkd+8jgqOKCtToIwoeMRd3t/7bWy+DkBcU2z+EqY8cBz7G6oTjuJQraEyBi3HjxchqLY33Cw81NkIL8HELL9FDj7iNL3nKxag2W8FJnmlTOTtfR8YTE1aYXUKXOGH76hr61+rMDhpVVcPuHSDitEWrXSUSl21H5Obix22AxN9+NAleWGwcYaiJwsvzc8S2tngOtAYNMcRl6gv2YijlsPdL6Wdiiid8XaToQIVgefYWMDT6aQSxQfnhXI3dxC5AH2gT2k+jFMCt2AicSgaPmoH+kI9JnR9fixxHHnwl7Sll95usBzKuCVPhXvJNrg+yf30radrQZSfwk0DvUbrAh5o0dhk3rJ0KyUJZRJkgTREIhTAcwjyfnenArp2hyjn/uNNOzVYtjSgJvWwXFe6IiooAY7FiQ4llMA7wCGVFvkSZpnM1bMnqp+E1mCx6v9IUlO8rvaoZoxzV+iionMWG6NYdjVXfFwUvEzYjoE3692FVQeb3sZ/8kDRe8QsdkDm0de9raPTgZfTLEsMmrSog==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1BN0tYQjczQlhuNHd1NXFUZjI0N2ZYR1hMbDRzaEQwY3FWS3FraFFGTkpW?=
 =?utf-8?B?NUgzeUJPWDFKUTdzclR2UWpnUHNCM3dCVDRoQmUvaGY0UlZ0eitOWm9velE5?=
 =?utf-8?B?d2lWY0NXOVZ1VE5xZWFkSXF3OStSczBHUnlTMkNPUEZ0Sy9PL1JmVk5vNGFj?=
 =?utf-8?B?M1k1Zlg1czk4NFFBYmp3bEVYeXhIclY4QmlpN2NKdm1GbUVuRXhad3NDSXI4?=
 =?utf-8?B?ejcxYzBVc0Z2WjM3QnhDZVBoNTZXSWJ5ajlTemR3S1JmbEpMaHFab3dZU3pU?=
 =?utf-8?B?anhLb0JvKzl0ZnBCaUJrd3VzQStHTy9CUmhma05tMnF6L2NTd2hIWittZEVZ?=
 =?utf-8?B?b1pvVnJtOEtvQ0hPcCtqRmZMeVVESVZ2YTUrNlpWdE16dS9Ic0JQSkNiV0Zk?=
 =?utf-8?B?Q2NBRDBSelBiRjRKN1dsdHE0eGVzbVMvT3VaYTBSYUpTbGJhTUl2aGdMY2x6?=
 =?utf-8?B?WXhQMUIwYnJUUE1ZWTB0U2NVN3Q2ckcvbGM5MFM1MU5iYU00T0xKTWNiMk9Z?=
 =?utf-8?B?UmVHY1BDZUZzYjI2TWxtQTZMN3g3a2JNbXArRGcxeDg0dmVRdmJ6dCtnd0dE?=
 =?utf-8?B?anFXa09vS0Uzc0N3M0xzZVo3TEc5NDhpZkcrQ3lXYnh0b01xa2V2Q0lwQ25y?=
 =?utf-8?B?eUN5R1RNaW1YdlpQanJ1NHhOV2IrNW5ZNXQ5K1A1SFNweEMwc1NkRFNnSDMy?=
 =?utf-8?B?MlZHZXE4U1JDMkV0V2tNVTBlTEpINnRwTllxYnJJS0hleklqWHdDTjhrRHE3?=
 =?utf-8?B?MTRBY3FxL2FBVTdhc2JqeXRFT0dXa3NMeG1nMzNMZWplSlZ0YzF5VmdOSFJT?=
 =?utf-8?B?TTJ2aVBwcHlWc0YzNlFhUDY2Vnl2eG96bUhpcmxRZ0k2WEZjeFNXbFIzcVV4?=
 =?utf-8?B?Z2lES21zZkh2bmlkTVhuTWtSYlFQRU9iRXRZVjBHVzlsQWF2dFVKOVVKK01i?=
 =?utf-8?B?VWNKcUVlbkZVWUFkU3pXck9FTHBIQytZRDJwZzBYN014UVFid1dYeCtCK3Ix?=
 =?utf-8?B?bEVBZ29iVXZKdDJLck1IQlpoVW91Tm1TdEorVlVoQTdVbHpmVHlJNE9tSnJx?=
 =?utf-8?B?OXl3UzYvK25yY0N5R0RhTGZxQTJmVU5ZTHlSb3MycTh2VXlmKzd3WWVPMmU4?=
 =?utf-8?B?Y3lxblp5azFMR3FubUZEUVNHbktwVWppVmIzbjIrWDF6UlFKVS9MRzQ4VnRC?=
 =?utf-8?B?WDZBbm1yMXZEcGRQUjF3Rm52NmswYWNOd2hPcGVZMWErQjJhUWhNc0JvV3Fh?=
 =?utf-8?B?a0t0eWwxYlVrZGtVZjBiNWkrL3phMnF6VzEyM0gyc3pMeUUzakx5ZEsvWnpr?=
 =?utf-8?B?bldJTUwrSUZoWXhOMThySm8wanNBanhYeTU3eTFhQnk3ZUhSL1Vpcm1NMkds?=
 =?utf-8?B?SDBTWDN2cDMzM2k4Q2pqcVFUMkI0NGNBdVJTazh0alhsVXVIWGpoelkzVk5I?=
 =?utf-8?B?d29XLzdwRnhaZXlLL0t5U3lDSmxQMDVIbk56c2xLZ0szTTZZV2drR1FCdWtw?=
 =?utf-8?B?SVNrY2g1L2ttQmFtWmtQUDVSZXRrMVRjcFJkQks2UWF4SHZzWS9zWldDOVJn?=
 =?utf-8?B?NkwzblNYODRveVpiS3Y3TFBCTEtwcExJQ2F3YmdBakJ5eW9WS014bWhtTlNI?=
 =?utf-8?B?UElSOHZOWjRXVkVSZ3FyOWl6aTJBUkhRUE01ZEUzQ2dnNzZmWWJyMWg3bmxB?=
 =?utf-8?B?Z2RrTHdzUDJHOFlxNDdXSDNuRDB0bWE3QTgwQSt5SWRSaDZpTFphUXl5V1R2?=
 =?utf-8?B?b3JONnhFRU51UEtnL2FCYVBvMkpidEJ6SExLNjlGWWk3UXlROXpCYXFWZUZV?=
 =?utf-8?B?c3Z0ckJ5M3FEOHpGTjhUU0owV0xEZStITUNVVWZ2VUNVSUpGdE9wUm92aE5D?=
 =?utf-8?B?Yk9GL1JrVTZiSzViak90T0M2bG5zUmNCa0FMT1hBQW9MN0FhaVpZbkZ4RXlO?=
 =?utf-8?B?aU95NzNza08xM2JwTEp4Z0NEcHkwa3RYRGlobzhtOFVVUUxFeVdiUDhud2Z4?=
 =?utf-8?B?dm1OZTNUUWpGUnA2UldyOC84NUV0UzZQZm15dEpqVHdxVHplVE5PbEY0S1ZI?=
 =?utf-8?B?YjR2ZDl4cVl4V2dCQWNtRG1ocTE5QnVhSHNnQ1J1MlVEbnRkK3VBRDRkMlFE?=
 =?utf-8?Q?geqSAc3sScxgGgayEKRT3Yn2n?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17914f44-0fd7-4405-abbb-08db086b3ca9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g60kb9qhP33MYE/9/DccPw+uAmKAJSxbkYjDslhar8zROE0gsRLK5XUrPaXbTfXz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4133
X-Warn: EHLO/HELO not verified: Remote host 2a01:111:f400:7e8a::60d
 (mail-bn7nam10on2060d.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Aha - ok, if Windows-to-Windows is broken, it's in robocopy.
Interestingly, I can't repro this from my Win11 system to
a Samba server with streams_xattr loaded.

Yes, I'm aware it's the directory create that fails.

Maybe one other thing to test. What if you add the "X" copyflag,
which turns off copying streams? Perhaps your robocopy.exe will
ignore the filesystem stream attribute and use FILE_OPEN like usual.
It's purely an academic exercise though.

robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder 
<file-name> /COPY:DATX /R:1 /W:10



On 2/5/2023 11:44 AM, varun mittal wrote:
> Hi Tom
> 
> I did test it with Windows share too and the behavior was the same.
> But please note, the FILE_OPEN_IF I am chasing is for the Directory
> and not the files.
> In my case, the source directory doesn't have any named data stream.
> The files in the source directory also didn't have any ADS. These files were
> generated locally.
> 
> On Sat, Feb 4, 2023 at 7:38 PM Tom Talpey <tom@talpey.com 
> <mailto:tom@talpey.com>> wrote:
> 
>     This is worth figuring out.
> 
>     Because it's a file in your Downloads folder, it was probably
>     created by a browser. This means it has an additional stream
>     which indicates it's from the internet. Defender and other
>     tools use the presence of that stream to throw the "Do you
>     really want to open this file?" dialogs.
> 
>     When you copy the file to a non-stream filesystem, that stream
>     is obviously lost, in which case robocopy is not going to do
>     anything special. But when copying to a filesystem that does,
>     it will take a different path, copying everything. Or maybe it's
>     the fact that it's in the Downloads folder, and robocopy is
>     being clever. Or just a bug in the Win10 robocopy you mentioned
>     you're using.
> 
>     Would you happen to have a Windows system with an NTFS share
>     that you could robocopy the same file to, and grab a trace?
> 
>     It would give us the breadcrumbs to figure out what's missing.
>     Maybe there's some other volume or filesystem attribute that's
>     missing, and confusing robocopy.
> 
>     Tom.
> 
>     On 2/4/2023 3:17 AM, varun mittal wrote:
>      > Nothing fancy, simple copy command:
>      > robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder
>      > <file-name> /COPY:DAT /R:1 /W:10
>      >
>      > On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com
>     <mailto:tom@talpey.com>
>      > <mailto:tom@talpey.com <mailto:tom@talpey.com>>> wrote:
>      >
>      >     On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical wrote:
>      >      > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
>      >      >>   I was able to narrow it down to the "Named Streams" bit in
>      >      >>   "FileFSAttributeInformation" response.
>      >      >>   When this value is toggled from 0 to 1, as is advertised by
>      >      >>   `streams_xattr` VFS module, Robocopy
>      >      >>   switched from FILE_OPEN to FILE_OPEN_IF.
>      >      >>   Thanks
>      >      >
>      >      > Thanks for tracking that down. What strange behavior.
>      >      > I can't see why having a stream would make the open
>      >      > change to optionally creating the file, but it's good
>      >      > info to know. Thanks for posting the follow-up to
>      >      > the list !
>      >
>      >     It's not the presence af a stream, it's that the fileystem
>     supports
>      >     named streams. It's getting that from a
>     FileFsAttributeInformation
>      >     on the root directory.
>      >
>      >     Robocopy has a very broad range of OS- and FS-dependent behaviors
>      >     and optimizations. I bet there's some combination of its 1000-odd
>      >     commandline options that can change this.
>      >
>      >     Varun, what exact robocopy command are you seeing this from?
>      >
>      >     Tom.
>      >
> 

