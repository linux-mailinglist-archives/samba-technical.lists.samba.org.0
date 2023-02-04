Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02E68AA7E
	for <lists+samba-technical@lfdr.de>; Sat,  4 Feb 2023 15:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NFuPYiSibEU3lTIAC6K35LzZS9ehCOFNDLgUNzPP2ic=; b=LIkSNBaF5i5yhF8J3a6g42Ewsd
	nPl6u//MJ+Ov18V1q5Rvk2QZV669GJ4W9XCnSZqRNJT9Y0UNZEcxzlly86Jvsg5VCfJIzXmlP6ss8
	z9nX2NNB1kX009C43QIYw5GuqVCdQ66HyJVRuwObyOt9ULwGCV0W3XDmdkPyfMzE7qrHtw7zXUAnE
	qsnCoFl0svqyGO1t73pR6Rgay5YR6qYLKLrLYL3atuSDACZ9nuAN/MjnZOqHBOqU68nsYwqWUvDiQ
	3A5wL8+FWZyek0O9wwruEaH5HMXzo18myHKYdeuGnHd2k/qurn69OK4KpD2xiKR2m93Gaeknhe9Lg
	jxcJrqBw==;
Received: from ip6-localhost ([::1]:30514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pOJDx-008oNW-36; Sat, 04 Feb 2023 14:09:01 +0000
Received: from mail-bn8nam12on2057.outbound.protection.outlook.com
 ([40.107.237.57]:51392 helo=NAM12-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pOJDr-008oNN-Eu
 for samba-technical@lists.samba.org; Sat, 04 Feb 2023 14:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnSyLeeLB0JYKkZgGmTDl6FTI1VnUUE7WMfeHr3LWjRYL01Uz2UBRtSyInzt7ugPztDmKJjMg9ofBMPwGq37wuZplpDlSxUdklPhE9AN28qtQFol/M1JybqxJOBTlCZCakGi5wnFIk0zf1O0ukdsAI6FALh3dvRw9ZHap48Ad9rhOF1wvLIUtm5Uqn9IIOI9ka+XkCzQcpZbY4YLbd5IzqXs6eQH7x4HOzgbu47AcNW9y+ZuRB1l94WP0zK6NFP5NtiGQ3ocaqY0aCvRRhpsM8ASFsPCd/q48pDeOr+PnUjtgFjEeYuCxOtIM707I5V+oQ/tSTqukYYUCZY/ekZC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFuPYiSibEU3lTIAC6K35LzZS9ehCOFNDLgUNzPP2ic=;
 b=TMA8TqhvOXAFRZcJ/mKlk8x0Hu4q1AwI04tYCTmIIH3SYV/UlBIDVMemzSHrMmxPClsNDcfuTQ9NcmZMbtvpIsEC3C5qBmlglVw713Krni2AdXDQ0Wo7IKIo8ZhapBVNtwY8DaWlwVnN3mQtH/yv1intKY684cALNu3TbuY/qUzgE5phWMiAG0EvIff4jLw4A5aHV5j6XmNCkMFme+pO9xBeTTK3Jqr34INfOFYDc6GclmscoXCF7Y1w+RQMC2qoTOlaAxGn3R64Q2oRGXHZJ6C/01mdsetxXezfnrRzByIX00L6YvPlqwRnLTbenXGYEV+gMwWDEif/O6qAFckYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from BL0PR01MB4434.prod.exchangelabs.com (2603:10b6:208:81::17) by
 MWHPR01MB2286.prod.exchangelabs.com (2603:10b6:300:29::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.31; Sat, 4 Feb 2023 14:08:35 +0000
Received: from BL0PR01MB4434.prod.exchangelabs.com
 ([fe80::13d0:507d:1753:2e72]) by BL0PR01MB4434.prod.exchangelabs.com
 ([fe80::13d0:507d:1753:2e72%7]) with mapi id 15.20.6043.036; Sat, 4 Feb 2023
 14:08:35 +0000
Message-ID: <a395da31-5812-9fb8-6857-7da0bf1b8531@talpey.com>
Date: Sat, 4 Feb 2023 09:08:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
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
Content-Language: en-US
In-Reply-To: <CA+RDaRAUAhjM9CDuJz13HKt9GcbDhMR-HW3YPTpWuMGPLQU-FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR01MB4434:EE_|MWHPR01MB2286:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ed6ef3-616f-470f-30f5-08db06b94df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: MXV3l6m2H3jrKR1PhgakfvJHOC2LXVXkh1GWqZJFpk+o056+6OadPdcKkZ0ffVb3mhPEktWTcenrVzlytoji4um0IbKqeU7byJNlonWedvV7uHEuWDyu6Eamir1CjCTHlM+82oPn0AJZgAK44MJGIrUcrFJPAeB6JmEwycOmHTWEKBzPFYhw7uu+dwoa7s0X3VLoHfAfNpLFJ8vDs5gPXB04KuedVfQZzJUQQg+8u4xhX3yEOwFjsBA7oNb/n8cJFcMHLuozTxnydJZBCx1em6p4XbwSeWfyRrwvrvDJDSHmuPYzJYrf+CN6tf46ra4FALti/lgs9J2UggOTlzX59q5M5yP28hTeEJVnhQE7N05NcSiqcaxu/oANdf3jpjC3V2fVBBNuol8enIy7wWIkFFhN42u+0hAD+y3PTl0LDenErj5K3knpGlOG1cHztUiPBea1V2cEW2uufvriPbUHUFpqKsroGQMe9LCQvSiTE0831umSkL0SEEVHM0HQOXzFQYMSAM5c9ZpWP4/vSX3GhWqOxloXoWHNe+BD16twIya8Um7/bFcSdQ30t6zNcZxfDACuuxDNq3GFrouKQvqvTBuEkS7ZPbNRBpPp05dPgP+2Ty0JXpR4w4zDk68mO1e+mykSKfBxPPkM6PDoJo4tBDzIigz12PNynq02WrMyU7jVK5AKtBhB4pfyWQQRDI7P9hLuJUIn4ThW1r7CmlVmclemjQ2BnFAWC+8fP1CXYvA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtYSnZzMlJuUUtyUnFJRytUSDVQa3VJYjYyUTV5cjhZd25abGVCWkhORW1P?=
 =?utf-8?B?QVVhaHpxWUdndG5JbHVNVUIxSVBieEJ3TzFnKzR2c1Z0MFFDQm5FUWlVYXVH?=
 =?utf-8?B?QklvekFkbjQ4RmYwVE5yUkh2clRFUFU4a2RmL1lDMStPRGxEMmNDYm1WMHlr?=
 =?utf-8?B?anRVa01Uek01WDV6QnRnTUVMRXhrRnd4eHVLcFpDYm9VS2xVb2VLeVY5NmlJ?=
 =?utf-8?B?bU9xeUtGRHhndFFhcm5wRVgwbVNOa0pCaXpBeWI5R0R5Sm9uUFo4SDh4K2VT?=
 =?utf-8?B?WG5iRGkvWVZUaU03R0syTzFIeWkyNHlYSUFENDlmTGtXR3NZZ2l0aTdMV0M0?=
 =?utf-8?B?dWZZOXFUSUdYSUh1WkZLRHhuSFBoUi9oMXd4ZkpoejljNExQL0JLQmRQcnZM?=
 =?utf-8?B?UGFLbHB3d1JWZ05qQUdBWnFYUTFGaE1GZmlscTV1UjFZc1UxeDdaMmdUMXpa?=
 =?utf-8?B?WEg0WE5IbXFjTTZLWDQ5SXk0clY1K0srSElKMEZCbEdkWnhha0lnZ09Bb3lX?=
 =?utf-8?B?Q1pZSUtIRld2dXdydkF6SFg0WUJoa1JWVzNWVDR6MHJLMmtQeU9NNUJLYkUx?=
 =?utf-8?B?RFNUL0p6QlU1eDQ1YlJ3dzBwRis4TXpxRkZZTVV6VlRlZlRzWkR1d1RGL1lm?=
 =?utf-8?B?ZURnYmNkVGF2MlU4eHptUHZISGtiQlB5c014VUVCMlBTRkl6RDZjZjdrRDB0?=
 =?utf-8?B?YlhScUwwdTVWMDBYOUJNWlc1dE8yUGNJM0VSMEdyWkhqcWlHOXNBWVd0Zmkr?=
 =?utf-8?B?TmRMNXh3MWF1K0w1cmxYOUlhdlJVdjVtNU5ENHkyc3FCQkRDLzVWTWxhOUVh?=
 =?utf-8?B?NXpaK2lLY3lzODlpbnZMYWNsYmh3QXpjVURmZWZrQlhzRURaT2RHWE5RWWtX?=
 =?utf-8?B?VnJmbVZ5bEZMTTJSTXdjeVBrbmZQeEpBbnJHanpLUHd1UzdUVGhmMHE3aGRa?=
 =?utf-8?B?cGYxRWNlalZEN1VTVHpwa1JUb2wzUlh3eUpwOER6cGwwamhxQnlUSWpLZTBh?=
 =?utf-8?B?My84T1N3Yk9kZlNpV01sWFJIZnMvdDNaV3RYTGcwckQwNTdKVWFNRk8zRER2?=
 =?utf-8?B?eklyUC9DY0E0WGJ1MGprL1JibEo4eHE5SGFlcmNiUklycmtsYXNyN3RrVjBU?=
 =?utf-8?B?ZThDbUpnS3BCS3ZPc2FkNFFmd09IMUtRdWZ4MUlWdTExUWFSSmRxSHVmSitX?=
 =?utf-8?B?REN5RmtRYmlicUlWN3RMcGxmUGF2NEFSMmlUQUJMVTRjWjZaM1ZyS1lySXJE?=
 =?utf-8?B?ZHQ0TUVlRXErQUZzNXh3cXM1TzZ6UWY4VzZIWTgrRTJCRnE3THgvcElDM1U5?=
 =?utf-8?B?aHFpUzV0N2c3K2JiU3ZrTnFmK0JzUkJTNjhTU0FERzlVdjZTSkNYa0tMZys3?=
 =?utf-8?B?RzFsVmJvbnpBQmsyZW1EWEh3dHdZcnVPUWZDL0p4akpUeE9nb2JXWTF4QjFN?=
 =?utf-8?B?azI4ZS9HTmYvQWd5Sjg1cTM5czhaNE1vTnZmbys3bTFYbm1oTVRtU0o3Tzli?=
 =?utf-8?B?M093SnV3VE5wMllmV2VLZVEydm8vK2VzZ0ozQWdrdnp3Zmd6RmoxRUxnZXBY?=
 =?utf-8?B?VVN4TzRHTGdYVVFOd0FtUHNUUlE5R0gzNy9EbkRXUFBFdEIwUGMyZ3FyenU0?=
 =?utf-8?B?OWhnRkNhWWZmMTZHa1hsdTUyeTM1dW4rMXNrbHFpb214emVtN1VNLzJienZo?=
 =?utf-8?B?bXgvRXRtdFg4WEZVdmdFUGxQbGEwQjh3THZwWTJvUnY5WXVBdlRvT3VQdG1L?=
 =?utf-8?B?R0FWQjU5SVhmVlVPT0hYb3JQZytodDNxQW5BSFB2WVE4cCtOUi9FZ21BY2Zv?=
 =?utf-8?B?Q2ptOXJldGVHNTB1T0RCNzgrWGFzMmNhZU5QWnNmd0RtT0JFWVBVcEpLZi9p?=
 =?utf-8?B?V1lOZSs5VDRBQXdHSW9ITXVDSENJWklPM25XenFZN0JXYXUrYlNZTkkxTmZX?=
 =?utf-8?B?b3A2QllYNStpb2Z5ZUZzdW9jSGFLdkFPWHNhRVE1RTVWTEIrRkZLeWhsZGJ4?=
 =?utf-8?B?TFMvY1hBdFo5SHA4dmNzdUdwaWEzVm9uQjNOaTIxVVYvWURsZEUzNzZidTIz?=
 =?utf-8?B?M1UvK054SUJMMzJOTitRYVpaZVZQb1JiR21IZU1zdDdGZGZmR0VYNzV2KzlK?=
 =?utf-8?Q?1pdXi0QbDzVthj2xO9F3k7JZE?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ed6ef3-616f-470f-30f5-08db06b94df4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB4434.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wq0KXEXROKHPek3hsmktv1zdBsIimcRZLZI4c2MqIi6eTfWCxGrYpZZ4dOs7aAMI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2286
X-Warn: EHLO/HELO not verified: Remote host 40.107.237.57
 (mail-bn8nam12on2057.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-BN8-obe.outbound.protection.outlook.com
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

This is worth figuring out.

Because it's a file in your Downloads folder, it was probably
created by a browser. This means it has an additional stream
which indicates it's from the internet. Defender and other
tools use the presence of that stream to throw the "Do you
really want to open this file?" dialogs.

When you copy the file to a non-stream filesystem, that stream
is obviously lost, in which case robocopy is not going to do
anything special. But when copying to a filesystem that does,
it will take a different path, copying everything. Or maybe it's
the fact that it's in the Downloads folder, and robocopy is
being clever. Or just a bug in the Win10 robocopy you mentioned
you're using.

Would you happen to have a Windows system with an NTFS share
that you could robocopy the same file to, and grab a trace?

It would give us the breadcrumbs to figure out what's missing.
Maybe there's some other volume or filesystem attribute that's
missing, and confusing robocopy.

Tom.

On 2/4/2023 3:17 AM, varun mittal wrote:
> Nothing fancy, simple copy command:
> robocopy C:\Users\mittal\Downloads Y:\Shared\Folder1\Subfolder 
> <file-name> /COPY:DAT /R:1 /W:10
> 
> On Sat, Feb 4, 2023, 8:05 AM Tom Talpey <tom@talpey.com 
> <mailto:tom@talpey.com>> wrote:
> 
>     On 2/3/2023 12:50 PM, Jeremy Allison via samba-technical wrote:
>      > On Fri, Feb 03, 2023 at 08:51:57PM +0530, varun mittal wrote:
>      >>   I was able to narrow it down to the "Named Streams" bit in
>      >>   "FileFSAttributeInformation" response.
>      >>   When this value is toggled from 0 to 1, as is advertised by
>      >>   `streams_xattr` VFS module, Robocopy
>      >>   switched from FILE_OPEN to FILE_OPEN_IF.
>      >>   Thanks
>      >
>      > Thanks for tracking that down. What strange behavior.
>      > I can't see why having a stream would make the open
>      > change to optionally creating the file, but it's good
>      > info to know. Thanks for posting the follow-up to
>      > the list !
> 
>     It's not the presence af a stream, it's that the fileystem supports
>     named streams. It's getting that from a FileFsAttributeInformation
>     on the root directory.
> 
>     Robocopy has a very broad range of OS- and FS-dependent behaviors
>     and optimizations. I bet there's some combination of its 1000-odd
>     commandline options that can change this.
> 
>     Varun, what exact robocopy command are you seeing this from?
> 
>     Tom.
> 

