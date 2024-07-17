Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249E933BF8
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2024 13:13:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=yu8y1KkZOv+oEANpLIokkQn6XJ1KzzTgEYVVu7dFJFc=; b=5vUDoWDk0jBn65PhW8AV5t4bMB
	L/Yujo/8Lsmd1KDeOKn7hyjTA5/2HuO3W8c/Ex/GFKK9BFA0Rr5SnBAe/Du9EEjzQdr/daeu9aoy6
	DF6fTUs1+2e6fgagMKreRGP7ltfxp/t4SHMnp9XyEX9/U8LjA+J5oKDt6N8hcNlEQwVbkCOdDDTQ2
	ZknfKU20im2qthNfxS0X2lxVXS9S6wnqSEtmX1kjhHmCiB88gZVuc/CiuZikVim6vNoQR3XTZlRD/
	sRruVwb+PYNCqqNS9x3YRdYJCM7VDxoAwhPRSNI8IXwONwppj7DaX8H7Xzo5y51l/3y+Mxna9zeXu
	M+2VIx/A==;
Received: from ip6-localhost ([::1]:31752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sU2aI-000szL-LA; Wed, 17 Jul 2024 11:12:34 +0000
Received: from mail-eastus2azon11020087.outbound.protection.outlook.com
 ([52.101.56.87]:30181 helo=BN1PR04CU002.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sU2aD-000szE-Dn
 for samba-technical@lists.samba.org; Wed, 17 Jul 2024 11:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i5blXndEcxaIcSM+zRUJMelevu5PLA8jnC7A6uRqo9qM4oHEEuFllZjUMfHNpQt3m1VGXv68mCuZ4lQBA4ROfLutHDCW9zCARw76aW3CrXxD+XGRIubb9u0haysqtFbk5mNioglCgaeR39SGs+eCG0I+YXqMuW0xTy4ewtfORxvrXA3eOJpQj6WAoP/ZDQDXQ0bJggwo4RIz/NKxIV460PDNmIlg5D6674uJ5jx9UkWznSy4GiduXeY+TkvhtrnO09UNhIEp2DMZ9Srd1v92is3OqoYWOCNgK1r1RUuyv8/U02VbEdDTdG+wJ9NwWiyWse3c6oeduPKcPJ96bgdkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yu8y1KkZOv+oEANpLIokkQn6XJ1KzzTgEYVVu7dFJFc=;
 b=mUKq61T64hZpJSr16AXHNIX8oYXYyK0asx0pviD82PKA4QlAuHMLhq4td9Kl+GN4suH184st8FjyoINxEEsT1Ocal9vTHyMgUtLmdfjikb+vkwI/GB2BPR+Xc89WRvXczxlsufyG1HG3ThhaYG4T31IuIYqfEccmmzMiXaHTEt/fdnW4ZaKCSjZuTzat/b5JJ778fjsQ7szzb+P86RyDWXFpcq8JKg8XHfUcEJJjoJM+QLXtSupvlJQrDDx/2YOkMqUUP1+vj/PEiNJU862dH+MZ93vGp96vk4sj7DlqcQ3kAjsnP/z4qRVpWs6/0U6NV4F++EM4I6hUmZt2XzOssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from CH0PR01MB7170.prod.exchangelabs.com (2603:10b6:610:f8::12) by
 SA1PR01MB7247.prod.exchangelabs.com (2603:10b6:806:1f2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Wed, 17 Jul 2024 11:12:13 +0000
Received: from CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511]) by CH0PR01MB7170.prod.exchangelabs.com
 ([fe80::97c:561d:465f:8511%7]) with mapi id 15.20.7784.015; Wed, 17 Jul 2024
 11:12:13 +0000
Message-ID: <f55af0a9-e3ae-4d48-9463-d40144a5338e@talpey.com>
Date: Wed, 17 Jul 2024 07:12:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: Return SMB2_CREATE_FLAG_REPARSEPOINT in create response
To: samba-technical@lists.samba.org,
 "linux-cifs@kernel.org" <linux-cifs@kernel.org>
References: <64d192b4-8ab9-44f4-a1e5-a62ff5ed0d20@et.byu.edu>
Content-Language: en-US
In-Reply-To: <64d192b4-8ab9-44f4-a1e5-a62ff5ed0d20@et.byu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7170:EE_|SA1PR01MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fefad8-9f40-46df-3910-08dca6514f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVJrMVhLMkd4aW9uRmFLRk5HK2JFTkZ4TUJXWEoyK3Q0QXU2MHRjOTlWbzBD?=
 =?utf-8?B?aERJVFJENStUbk1JT3pEUWxoTG8vSmxMV0Zlc1pzK1FoZW9rbEhEU2U5Tzc3?=
 =?utf-8?B?RmpvKzdKWHd3UFZ5dXA0Z2RnTWhDRGczZkVCWWNsR3V0S0dIMkpXMG0zdEt0?=
 =?utf-8?B?WmNLbHZ0Sms0RTZQbkc2M0xkVFhsNnhFTTIxak55Q1BmT3NudC9VRXZ5WW1p?=
 =?utf-8?B?MkV6R01QaHNwZ1ZMSmVZb0p3K2pRZ3VYMkxyRHZtSG5MSHpFZzBXM3k4azNI?=
 =?utf-8?B?SnRlNWZSUlJpOUVDYW9LQzhnWmZHdEUvdEhYbmdTb0o3TThwdGF1ODhRVzFZ?=
 =?utf-8?B?aWJkZ3VydkhkOUsxTUtkcER1T05RdDNsZm5Td0d4YU1tTVlBbVFCOHZrZmFU?=
 =?utf-8?B?SEE2Q3ZHbktmZTNTUVoyU1g1clUydkZuRzVpUXNCb1VxaFoveTljL2ZNbmxO?=
 =?utf-8?B?RFBDUTJobkM3THVwd3VocGd4M0pjL3V3Y004QlRqOEticE1kK1E4TXBVd0V5?=
 =?utf-8?B?MzJmdFEwNHdtazYwaVczSXF4REYvVTViNUN3RlRaREI5dy9UV1QzaDdXQkIx?=
 =?utf-8?B?OVpySVpLQUhoQ3FKNDI0WHl5UUJLUnpjVmVubjFXWVA4Lzc3S050S21Iajdu?=
 =?utf-8?B?cGV2bXJ4dmRVVGxscmlOc21teWdCaVFZeGdvVTV5cktRTzkrVExtSDFWSDQ1?=
 =?utf-8?B?K1lrL2p2VFdsMnR2Njg0NVdyWGRWWTIzNDVPQVhmMDZpZnlUOVNWNTlUMXFl?=
 =?utf-8?B?RFRHZXZFSlh6K1VkU1F4c2g2cjRDeHFlUHF4dnhOVWZEdXd4NDlUd3doTkhK?=
 =?utf-8?B?a2lhajhCdTBsTklCVjE0eUI5Q3RZZEtlK0toRXRqWTNQM1hxRkZDSEhyemxN?=
 =?utf-8?B?emtjZFdCMmlPNUhQQUVPYjVnZFFONTV1ZDJZWmRHQS9icDhyRzRqUE83Mm5h?=
 =?utf-8?B?M3NiQTNyajlmUTBtdGQ1MkgyQWdSZ0oyY3k1M0RyT3dSTldRYnFtb1pzam01?=
 =?utf-8?B?M3lSclJvTkpxbC9pbzNUMGFRWU5qOHMrZDJkaEtKL2t0NVh0dXVqMndEbzhQ?=
 =?utf-8?B?Uk1DTHAwV1dYUlEwSVFLUDJxdWcxODhPNFRqWlcxZGlzQ05MRkpETDVIVFBG?=
 =?utf-8?B?TFlJMFZpZ0lSK08zZktCNTcrdFpBQ0l0VGNZOUdYeDJIdS9VQk1lRndJTG1P?=
 =?utf-8?B?Y2RIRHQ4d3VnK3AySFY5ZkxiU05NZ09ZVmptT1FOalVaR29RenpjK0l3bnli?=
 =?utf-8?B?b0trZlFGQlMyZ0k1Y01IVEFmbzVWRlBqWC9qUVRsSHptYmQwUldQd0o3ZXht?=
 =?utf-8?B?RktrOThnRHZBRUNyNm1JNlJpSTlMdmsyQjNVSHJiZ2FRV05uRXdjNVpPd283?=
 =?utf-8?B?UGZvb1NvQnQyTytjOXpTeHh4VnlUeG91Q0p1bUQ0dGYyTmg2b0E5R0NGSks3?=
 =?utf-8?B?NHdNK2s0QlpXb2oySHZQMjFoM3JVcVV6THd1OWJXZHUvV1JtZW8wTjJrVnk0?=
 =?utf-8?B?N1FNNm9ZVC9PZDJPS0ZZeGVCQnh2cytnQSthUmhnbjlOUHF0SjAwR2YwTzFO?=
 =?utf-8?B?Qm5BTlNaMk5tbTZydDQ1SUNyMW5Fc2FlOHN2UmNvbHVqU01kRWsrWW1oL0xK?=
 =?utf-8?B?aHJIbUhXdkJuMFVqNHI2SkN2S3dWU1NGOHhIWXVETUJPcXd2MTE2cldERWZT?=
 =?utf-8?B?cGI1dGIraThhQWZ5WXUyVi9FYlRTenlLd1htV0Z4TWwrc0N6TFZ4SUYxVy9X?=
 =?utf-8?Q?tdGdxovgA6IhPIsncI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZsaXdZVjJyVyszdDFJL1gyRm9yQnFCTEZjdy9tR1NwYnhkcUg5QjB5dHlF?=
 =?utf-8?B?QU1vY1hiTUtMQUpobGFURDNjaTNPeTN6MXk0WVdGTGFjOWtpM0tCaWYzVlVT?=
 =?utf-8?B?M2J3WTFHUk1PZGxCN1JJRktvUEdYN3lHZG5HSXRCRkQyZ3lMejZ0Q2ZwQUNp?=
 =?utf-8?B?dWFoeWFCT0QxajFsdHVVYU1mOFRrQ0xwd3FnVEtFRDhDSzVtWTJ4eGtBV1Vi?=
 =?utf-8?B?KzFBeGlOL0pGMmlRUEk3b3lVQkMvNHh1MEdNN1lTclB3eTNPRFZMTTU0N1pX?=
 =?utf-8?B?ZmxqbkNaVm1MVzZtaVd5SndNUk5RcWE5d1Q2UERVNjJVVjJqcGpqa0dyRU5y?=
 =?utf-8?B?bEY3UnVieUVHLytyRklDdHg4Y3A3MlR1MkRzU0dvdmNRN0JyQTRxa0xmMGk4?=
 =?utf-8?B?S2R3QSt1NWVJN0dXQWtnY0tnM0I3ajlqYityWm5iektZUmJxbzY2SEZNUmZF?=
 =?utf-8?B?MGNsSUFOOWo2MXRuSzVjcjU5VnNqQitRTk9OQmlTb2pmZ2pyQTJEVytFQlBP?=
 =?utf-8?B?UVcreWdkWGczRE82Yk1KeDlLK0s2MDRFNjhRR3BIMXpIalJtSWd5RGRUQVl0?=
 =?utf-8?B?cmE0bUp0SHc0ZWI3TXgvdFhzRFNWbUtmaVlUVEZiNVIyTW1lVHcvVWpmYm04?=
 =?utf-8?B?VlF3S1BzekZ2ZEVqVENvUG9ScVM2L21vSVpoVGlpNFBQWHBxTHY3ZCtoNlgw?=
 =?utf-8?B?Y0d4ZVZIcHc1Smg5bmpBYjJlak9pQU1kcHVIeTF2RjZmQWoxaUYvdDZPeU5a?=
 =?utf-8?B?Mk5zRHFvZEpPRnp3M1lHYml4SHRiU2FuVDNMaGN3djFqcm12SnZ3WEU5d3ls?=
 =?utf-8?B?S2JqdlpCS0NGelVNVCs4S2lLUHZqVHM4Vzg3aE1jR2M3VHJQbmx4WUIrbDR3?=
 =?utf-8?B?enlsQVlWZE0reFZIRW5aY2RONjgzRnpKQmZ0Q3R6VG5peFlBNk1jK3QzKzJr?=
 =?utf-8?B?TC9CYUlDeUVRMFZ1QVM4Mi9mRDM1UU5DRFR3Sm9lUkdSaStjRklnSWhHTTVO?=
 =?utf-8?B?MTB2TDdhM0Z3RWRLaFFMVXJ2Z0dhTXdQL0ZhTEpOcC9IREhGL2pWMkx2TmtP?=
 =?utf-8?B?am9ycUVKalFpVFRSdWdkWEdvZCtuQ2t6ZkR3amFvUUpabWR2ZEoyd0FsTjYy?=
 =?utf-8?B?TmsxM2RqWkJqdGJkaHFodEJVWXZ5TWpLQnFLaHRTTFYybzdSbzExTnh1UmhC?=
 =?utf-8?B?M0liYS94MjVhT3I4bkVad2haWUIrOGlKdnZaWUpCRkNJbmJ5bElsMzBNcklG?=
 =?utf-8?B?bmR6NW5IUFl1UFI4dDQvdUFqakM3dTQ1MTFXZzNhMWQ5ZjhjRWlLRThFNHA5?=
 =?utf-8?B?YXBBZjE0NldrWVlmN1lFeXlSODVyVkEycGpSRzlkSmw2aVVweU1LeHI3eGcv?=
 =?utf-8?B?NjhCRU5ZQmhkUDRMNmo3b0J0eHVVS0QrVDdxa1pKVDV1ZTlzNCtPUzhlNlA0?=
 =?utf-8?B?Y1lCRk1adFBIczBRa1Q4QThUVTFESG9KcisvMmtBWkxnTkFkZFFMN3FBZ3hZ?=
 =?utf-8?B?UlNmOWJVUmIxd0ErZ3p4aDBSdHlaSld5K2ZvdXEyMHd3STdvSjlZRW5VL05u?=
 =?utf-8?B?azkxTVpueWJ4a3lLaWRuZzFhRTBkV1VuTDFhbEsrYkVMK2ZBaUhkUVR6UThH?=
 =?utf-8?B?ditxSkt2Z2dxUndQOGcyNDNpVmo4cUp2MnovT1lsVlFUdFcvREFtVkdXaUNT?=
 =?utf-8?B?OWQwNkRqVnN1NmpSWXhoeXNuajhRUjBRV0FsYWRzTWYrcDdJbWduMlgweGFZ?=
 =?utf-8?B?YlM0RVhnWjVIUHNUdHBHeHRQWXhTNktpN3FwM2tvSVdoVldlU3p3SFJSZ0ZP?=
 =?utf-8?B?OEY0a3MycUhrT3NGZWNYY3dyMVJrYlpSbnRCb1NVRWtOOGd4bUdyaDk1Ylpk?=
 =?utf-8?B?c2Z0NVpwT1B0NGluUUp1c210ZExqdHlCRVdHNFAwV3JMTDJnakVHemRhMGxH?=
 =?utf-8?B?YkRXTUZjMmErblBab2cxTFh0dU5EU1JzZmNJbXcyVFMzYWJ2NG51akpsZTNS?=
 =?utf-8?B?Skd6bSt1Q3VyOVRvWnZUQU5UdHhKSlV3ZGlUQVRyR0ptdEZndUR6UDdSd3hU?=
 =?utf-8?B?WTdWRkxocmJST1V4NXpLeDdkMnAvYUxESzd0UzNETEYvNkV6djkzL1Awbmtx?=
 =?utf-8?Q?zDFw=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fefad8-9f40-46df-3910-08dca6514f3f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7170.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmiTrx/7UNxNcaH4aWO1oxd9AkdlO7NMb6nolTeMAK3RbYU67uT2L58iMeC+QFRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7247
X-Warn: EHLO/HELO not verified: Remote host 52.101.56.87
 (mail-eastus2azon11020087.outbound.protection.outlook.com) incorrectly
 presented itself as BN1PR04CU002.outbound.protection.outlook.com
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/16/2024 6:08 PM, Carson Buttars via samba-technical wrote:
> Hello all,
> 
> I just completed the mountpoint detection patch I've been working on, 
> and feedback on it would be great. Here is a link to it: 3141 
> <https://gitlab.com/samba-team/samba/-/merge_requests/3141>.
> 
> In working on this, I also stumbled upon the 
> SMB2_CREATE_FLAG_REPARSEPOINT (MS-SMB2 2.2.14 
> <https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/d166aa9e-0b53-410e-b35e-3933d8131927>) field in the create request, and it seems to not be implemented in any way. There's not a lot of information on it, but as far as I understand, it should be returned if the requested file is opened without the FILE_OPEN_REPARSE_POINT create option and the file is a in fact a reparse point. Am I understanding that right? Is there a good reason to or to not implement it?

The protocol requires the server to set it, and the Linux client does
inspect it, so clearly yes it should be implemented.

The Linux client sets a reparse_point boolean in the cifs_open_info_data
here:

 
https://elixir.bootlin.com/linux/latest/source/fs/smb/client/smb2inode.c#L851

But the document is silent on what the Windows client does, so it might
be worth raising a dochelp issue to clarify - I'll do that. I'm guessing
it will lead to incorrect behavior, but it's pretty much a corner case.

Good catch. Adding Linux client list btw.

Tom.

