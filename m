Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE1809241
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 21:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=J3biu68YQAZZ3rzYHSdaJY1DN7JHOdBazW27PIXPoMs=; b=Km7wt0SGjIQg2dgMpZgcxQZeEw
	2XdwZmOvN53ie5TVisURG/f4EEjD3GqrmhxUVLEc6CGHLdAk5lHbuAfa8PQRLrAlBhioAdya3g9WJ
	sgnxOZyKtjF2Zxv1dKwPBqZNdANxKdMRHNrdBSBKs+55daJtx8aWmm8K+kpD6IkqYOgnGeM4NFcsW
	WrkLR2Ejn/XDn/G3V7OYVT6Pax5ShpubCtXG7lpK72ys587QvIAp4RteQzskH0//BuOor5ie7o8DX
	fAiMXX0fA+ECcNBrDRtnRfT+sxwd86xMk6VkvzLd5t0f7k4s/Hbh6yOJKHZiMIj1TFazpCPvEc0rv
	U1iXRLAQ==;
Received: from ip6-localhost ([::1]:48760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBKwE-0052mf-IL; Thu, 07 Dec 2023 20:25:38 +0000
Received: from mail-mw2nam04on2042.outbound.protection.outlook.com
 ([40.107.101.42]:41257 helo=NAM04-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rBKw7-0052mU-OB
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 20:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxuN1mcp79IaT1fWSfzgv5Se+1EGO+5cYPsXEidrmgg8fK1c8pxr1ufxXDh0WOZEhBO6Oi2JInr4a6XiZ9Lvu/ovEamXg48KLnXemzLvC8CXrmXJyJPimIyQmJqtJBBjzGyWvl6mesAHggi1a4iIeeN1Lt/y+9kkPcoQVKznOXZcQMzHbTzKEdeNgna+fGk717d9C8aQaqePS55GfIR7MYXlY+Brmn7wKh91ebPKfIRFq1z5t9YosdFClqkgdSZ6KCCLs8yc2pNZCGfj5Fh3CxGMARVlBUq3rta+YvWQoAxLcIsttvIBdxMup3blDP1fIC3NLWNzQBax0/6Qf9qI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3biu68YQAZZ3rzYHSdaJY1DN7JHOdBazW27PIXPoMs=;
 b=c7Z3v8LfM5s6I3zIBpI7OWIxX297U044qtviwlKH1SCzM0p7PEfcyi37r77GUffCNFnnJTPwE79mthx3hBhJJuWGAQVROpGcgrQX8KjGCe9nMJHrzRu6Nxk0jKewCSELkc63OC4gn+02RCizyYGXE/Uots/cPQ9Leh/SLbqdl0/UQhTDnCBw74F5hPkxcsxGgw4Pj60IjJ3cwleHMDeBFpAauRkkMWdMtYoxgA1JNRgHtAOwHFqkvxKuUpylntVxcQ36+4uJNO6Z9Kr6emU9dcROHkDhwtgIrMsorJnWSIguNPeygMTxU/t75Ezx4gouLKlVFW1res6ml3LjWclOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 PH7PR01MB8641.prod.exchangelabs.com (2603:10b6:510:30d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Thu, 7 Dec 2023 20:25:12 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061])
 by SN6PR01MB4445.prod.exchangelabs.com ([fe80::e38:e84:76d4:5061%2])
 with mapi id 15.20.7068.027; Thu, 7 Dec 2023 20:25:12 +0000
Message-ID: <5b412c23-8439-4838-8ee5-56c8f1e5fbe2@talpey.com>
Date: Thu, 7 Dec 2023 15:25:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, David Howells <dhowells@redhat.com>
References: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
 <700923.1701964726@warthog.procyon.org.uk>
 <1215461.1701971450@warthog.procyon.org.uk>
 <ZXIPuwnUNycH+ZuI@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZXIPuwnUNycH+ZuI@jeremy-HP-Z840-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|PH7PR01MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecd9ffe-86e6-4861-429b-08dbf7629d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: MuPKHW/DmkqR4Ow35OeiwsO/WM5X9le5gem/GiYj+EWF+Na4KDR44fwvlCBEl8/fJfrGkAMM5rKI/znlagDUWBGCP4An4iI8ySf30EGJkIsKt4HKF55MObYyznpcPc9TZQ7CViVTjPbtIkc2wN0uISXYiwD8oy0i7sQiF3EGeTVMdVsn7O9/7NTH9feB6sHglLGn3oFqVWACfnjT+hu41GmN6uJ5BxZu/bQd8lsNZpT/sq+LpsvM/JONB+a1sk5EQWp3y2PnI9YtOlxwOUvYT2+iGZpKLZha7lzicOIVPW6tYFaldv9Mopjz5xwWOcEGHKmXC4dJETIvPschjBKuwNc349gF9OKx2OYdEsRT5h7hAknC5kSuc4GrQd8klEe8PwaDTPMaqkKJOBik5wq4f+zYXBAfs7p6Xh9KyhgrnhHmjTu0+wUiD0PE0+kpyY6xnhTRvVgcUVnb1QzjrZ9oLHNG82yMG4zv1dUOO1uHLOgbwhi64sObmDKXE5bm1lGnpMtJ6l2/P7SZfPu+Q6GRDJm49z87HgQetgR15ApsyESYXF0iU2WkrDPhYc1iu4XIhreQy2mG4g333fsVVRVsWEGsTkC2mXxbw/xAov6bXLWOeiuuqtgAKhbfnYAkFivi
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hLSGg5ZEJRTHZGcjRaOVdwODVLbS9MeHh6bllmRXQ1OUk4Y1BzVi9oNWE0?=
 =?utf-8?B?c2t0djdTNTFvbzE5dnY3YTVOcTJLOVh5TkVoaUFPU0lycWVyK3plRENUMjR1?=
 =?utf-8?B?MVYxdml4L3YzQjlVTmRuRXN0c0JqUDRaQmcxU1IxOGdTd092ZDVrS0k0TjNJ?=
 =?utf-8?B?NmxmR1NPWnNmZkU5NkpXeG9NUWp5TjlxbThpL1U1SEczcmV2bTNjOFVVbE5U?=
 =?utf-8?B?UkMzUGorSGE1cFNHUzB3V0w4UHFMa0tIMDhOUFdIdUNCaElpNm1FM1V5N0ZH?=
 =?utf-8?B?WXNxSXV3L3lLSi81bmVCaDBYTHZYampDMjZrRWpNZmFLekI4WCtiVW5jSFJL?=
 =?utf-8?B?eGFvb0VUQjI4a1cxT0xlWnQ2T09wY3o0QmI2MzhsOFlEbzFKL3kzajBPcWFj?=
 =?utf-8?B?andLTW5abElURGpCNTdWWjRvaE9LVlR4QkFzUzJvLzZVMWNIMFdBaVpXcFpY?=
 =?utf-8?B?VWhiSWNGSE83cnpiU3YvQStoSlNXZE5GZnRYaTkvSTBVOEppL2wxNlFNcXhU?=
 =?utf-8?B?WFJBeTBjclA5SzluR3JHQlJpd2tlaHI3TmZFcXNkWFFEeGVyU3NjQlgyZkZ6?=
 =?utf-8?B?eHRQMGRlU2gvcU9DYm4rVjNSMldzYVBYeHRwTTRYSGlxMGtPOG0zRHIycnJR?=
 =?utf-8?B?OFRURTVvcW5KSW9CVHJ4a0tmeDgzQnZ4ZVhRWTcwR2FUdkRXdmFaUzd2NHB1?=
 =?utf-8?B?ZU0zY2xKOXRwZkxiSUxuZXk3V0ZOZ1BSRk1Va3c4aVVadm5rZk8xTlUrUG4r?=
 =?utf-8?B?dHp6QUlvbTlxV0I0NHRBWUV4RjRpdXB6UkJFWkQzd0tlTmY1cjZCVVpTSVJo?=
 =?utf-8?B?bkQxbWZNd0xtYldwc045cGQ0VWFTc0RqdXlaaFNQeGhvVDdmTSswYzd5bUUw?=
 =?utf-8?B?d0FjUFpmZEE3Q2hpUlhqaUtFazVqVHBpNUdiVnZvem5oVEVKZDkyZ04xd2dl?=
 =?utf-8?B?VnhpRFRVTEVqVjB3OExIRFJPZVBIZTAzWGhOT2lUY0t2dDlDY3lRdkJOLzZI?=
 =?utf-8?B?Z0FwTklOcUxBTUEzUERRdER5TTNpbEcwc3RTdHNDcDhvdDlkUjBjR0FsZVRF?=
 =?utf-8?B?anp0NW50em91RnlqcmhqVUYwMnR3SlhERVF6RTBvMHRmTCtib1pnUzhKR1ZM?=
 =?utf-8?B?QUd6eUgvOWxVL3ViNERxWEhuY3JSK3U1OVhxSyt3b1g3SVB0RmlheTR4R3Na?=
 =?utf-8?B?akVmUk5qVWQ5b0R5Q3JyMWJReVgyZ0xQckZYT2Y4dStiQmdmYmxPOVlrYnor?=
 =?utf-8?B?UCs1Mm1meGkydC9FTG4rd0wzN3pTN3I3Y0RPY25SMlpuQmVNczEvcVFoN3E4?=
 =?utf-8?B?QThJMVVpaHR3UklXNjJlU3ljRlV3V3hPa2ZucDd0YlA3MFRHT2RHY2x2NUN1?=
 =?utf-8?B?ME9PTXgxaVM5NzZGcS9EUUlxOGVlUW9jcnFMTWVFU256QVNweGo2V1pHVFZC?=
 =?utf-8?B?aHNobU1qcENDaHlNZkZhUzVmUGJDMFhVWXFqNS9NSnFWcnErdTdIV3FGSzln?=
 =?utf-8?B?UDBOenFoMEhnNXptMHVMZG9zM2NPcllxYWFqdmpaSEhaMGhLNGc4bno2NGpm?=
 =?utf-8?B?OUx1Q2VVMHNyL0RUU2pGaithSzJjOXhwRU51cnd4Vm1UZ0RybHJxU1MrckVz?=
 =?utf-8?B?UWo0dU9BdHpsQWdtaFQzNHMxM3hGTlhlZ2xLSittVVh4Z0JpQjVJV0c0QmtE?=
 =?utf-8?B?U0RrVHlBYWsrSTRqc3RkeUhodnQ0dFJzWk5aeWFWanlpVkpOZStRM2NialFU?=
 =?utf-8?B?cEpPV09wdXFtdkY1c21uSlRLdFhYajY0VkJhU2pEb1NMUC91a04zUFZoU2No?=
 =?utf-8?B?TmdiOEtsMlBYMDJaNVRFdm1aZkM3enF0U2tRSXlPbDFtL1dQS0tUUmswaFpz?=
 =?utf-8?B?TVRzTmpkeEFsQlFBTE5QcjV4Vmx2bktkT0p4NWFuZlI4VjJmRDB4bzV2Vy9y?=
 =?utf-8?B?ZHpXbVNzMEJxVEJoVFVVWHFQTWFZb20wVGVKRElzY0lKdlBXSXpFQlh2bzVr?=
 =?utf-8?B?cGV2Qkl0MzgrYUtEeWNvUHlNTEFxT1h3WVFtWWpNeTc0RUlBUi9ESWdJMkhG?=
 =?utf-8?B?Q09PaWlPQTlaMEdOQ29lTDJDcVQ4YVpHZW95aDBVNnF0cThNbHQ2UGNWOXkx?=
 =?utf-8?Q?H55o4aXPlVmGNEhZ8Y/ZDTGj/?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecd9ffe-86e6-4861-429b-08dbf7629d32
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0KE8z1vDqaCYL4Paum4MPICib/65oVCAnsdJdA3V38GlvPvp+AFVg18JTJ04DDH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8641
X-Warn: EHLO/HELO not verified: Remote host 40.107.101.42
 (mail-mw2nam04on2042.outbound.protection.outlook.com) incorrectly presented
 itself as NAM04-MW2-obe.outbound.protection.outlook.com
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 jlayton@kernel.org, Stefan Metzmacher <metze@samba.org>,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/7/2023 1:32 PM, Jeremy Allison wrote:
> On Thu, Dec 07, 2023 at 05:50:50PM +0000, David Howells wrote:
>> Jeremy Allison <jra@samba.org> wrote:
>>
>>> >Further, are the two ops then essentially done atomically?
>>>
>>> No. They are processed (at least in Samba) as two separate
>>> requests and can be raced by local or other remote access.
>>
>> So just compounding them would leave us in the same situation we are 
>> in now -
>> which would be fine.
>>
>> What do you think about the idea of having the server see a specifically
>> arranged compounded pair and turn them into an op that can't otherwise be
>> represented in the protocol?
> 
> Complex, ugly code. How long does the server wait
> for the second operation before proceeding with
> the first ?

So existing SMB operations do this, but somewhat arbitrarily. An
operation can "go async" in the middle of a compound, by returning
STATUS_PENDING and subsequently completing with a second response.
Some operations pretty much always do this, for example directory
change notifications.

>> Or is it better to try and get the protocol extended?
> 
> If this is a Linux -> Linux op, we have a protocol
> space (the SMB3+POSIX) we can extend without having
> to go via Microsoft. But this would need to be very carefully designed.

True, but as you say, risky as heck. Don't forget the rather large
third-party SMB3 support from other vendors who may or may not be
on board.

I would STRONGLY discourage considering extending compounds in an
attempt to provide atomicity. But, perhaps some super-hairy ioctl-type
request, coupled with persistent session support? Heavy lift.

Tom.

