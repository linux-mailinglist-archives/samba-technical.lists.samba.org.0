Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B95FBB70
	for <lists+samba-technical@lfdr.de>; Tue, 11 Oct 2022 21:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ecviW7WUnlWqnDxjLnDMgBOpd5Irt1EQ+9NxLPyWbXA=; b=cOsa2LmQQb8McPrD3tzxM3ngZh
	KHbhGpXTA80matRMsWDGOnly3zPFQzr+EmkUA0+j5/P6i5v8AwLCkalitf+RZlaMn93ovIzJkhtJl
	YHjDXrKajHATLgM0Akd8KuuLmD75/BqotuvLsfCnMUmyKRWOWW7/JEsx+xSQcrJzSUu4t+w54xmLZ
	ACFRFtXF8JgBGMf8LJWqwryknuC/qmk3BDcYwzRFocmnsrDlJyGaOqbcSHy6NbE32qBXUv/79VmBT
	8FQSrQjd5HwqR12CZFp2T+dMr55aIOyJLQ/lGJxuueFvq4xjA34W6XymIxkE+H82Vn4k/uGD9gfl3
	HLE2VUIA==;
Received: from ip6-localhost ([::1]:57954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oiL76-001L5K-Ea; Tue, 11 Oct 2022 19:40:28 +0000
Received: from mail-bn1nam07on2067.outbound.protection.outlook.com
 ([40.107.212.67]:55917 helo=NAM02-BN1-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oiL6u-001L4r-46
 for samba-technical@lists.samba.org; Tue, 11 Oct 2022 19:40:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhbaP//3rvKWtVkIphDtisbY/XfqT1WrlxxKqIk9XA0/tK38nq0snXfcBL5yVBvdtwkI7VN5CJkGbMvq6ICWDQeh4vTd91QVVzyud2EcAT2IftybRZzGl8ke2a7iDiTCb4jPFLoVJeLdCVWgTtZJAV3AocEho8E1o956ul7uDv4xKB/p2tqGyaLm+Lu6OQweWLEIF0ryqhCRIqQiP4AxibeGe8QLlML8Y8YUkcPK11t1pGAWWo/chbDHL1SCEyio6sSQwwJYWxS/MEf/Em529/1q/dgCBSAmNMnaUa1kFa003G7/pp0nRwIMAnmOj8oSLzLi5qGRGYpcMi5tEu7q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecviW7WUnlWqnDxjLnDMgBOpd5Irt1EQ+9NxLPyWbXA=;
 b=j0KL0+28efppQ76SVP2QYKCKGXOo2uLFA//4CQJHLufQNfw/IiI5KyaI+HLpay6AQ3yXflQXU4/AwgtTxwGv0TjHc1dtCyzG/QHLPdXM+8abTjz90nryWnRRbwUY65/GtdtlT1rE+0AB2/mmxdf9/S6HtQA82IfdZ3jVV5V89JTeqGO8Zi3pYc1n8mrDmNcl2q8eVk/i1C2W0sibFoRFnbbEgTc6djoLCZD0dusquyKvUBs5jBtT+jT+iqy8LNWGA8jIEA5DWoLiqPepnkmnZlGHAhJhtimLlkwk+8/yz9ZQPISkX+ZKtaTYH/H4vuCTH0+ebax7eFK7iz+sZpkKLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 MN2PR01MB5597.prod.exchangelabs.com (2603:10b6:208:115::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Tue, 11 Oct 2022 19:39:59 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef%5]) with mapi id 15.20.5676.028; Tue, 11 Oct 2022
 19:39:59 +0000
Message-ID: <f2452332-c85b-ef7d-7f96-de097e0594b0@talpey.com>
Date: Tue, 11 Oct 2022 15:39:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
Content-Language: en-US
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
 <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
 <CAH2r5msDX4eaGuyine__ePtOTRoSBDjiUN_dthaHpiA9UKm0yg@mail.gmail.com>
 <d7bf66c8-0695-a239-4bfb-d234241479ac@talpey.com>
 <CAH2r5mtyshZWxN9nycxyu-_mDsJBkmFP_JMJZCm5RL_FP+3bmA@mail.gmail.com>
 <CAH2r5muv++9HAyCMfxuez8DakR=1-kkGYpGNVF=TE86FvsUkBA@mail.gmail.com>
In-Reply-To: <CAH2r5muv++9HAyCMfxuez8DakR=1-kkGYpGNVF=TE86FvsUkBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|MN2PR01MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6bb7b8-9c51-451e-95bc-08daabc061d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: nh6a5PQyTM75EPDz2j/QVdVusXgA8zHRnr4YRe9O2yr2MeYp+0I4X90Ic+H11sfT9SjzQ9FUsp2DauzPurn5XNj9NZCNazwhtfVVDJ9fG26jP8eqznfuWknKqzGntYUgcRjqBfh1hLnbmQXlWWZ5jV6wt5UGEZTUdhAuT5iTeKjSXC7JtcEckk1FYRdJFBExwjpQfvu6KbY48ijT65jgJ4YhbXiW4ScxC6wZsdJ6fKosFSFMORoLlch3th4BoCgOYQmCtd1ONdPLe7Ps71+XFII8PsnNcQysGmwEXI0GcJqbvj797TG01SR4wqAL8OYp7ZYCcqpQbnKGCSW4xepw9BR+kaEsjfEeL830En38Hl6Luf4QxHaObSF7ni3EsII+asnYbSdBswGldY5BNybhT+VymzpH1RVRfBCVZAqa9HiPyfNCHFbYxdcWhUChJmdzQqIGoaQe4BboS1bF+FFAJX/y/jefG4ZaMZovF/CUvkPS48GM7qQHG9/VhCweX7CsCXzirQONh2fZBofAx9urLXSAlNkDnhrD/Yhyl+pELf2TaNycqekgbGcE/ZJo68XYw8ZQaHOZoEvQmDq71soOPtvPKy6FhfdqiEzm5oMHHqMfsxGiygp9E2+ZeD6sZQJZfLXcx4RgsPpWcEMtVa8hrdfvh63RUwEXcvaMDUEDUb3ME8uCt6sXFrArKGY8DI4I9wgVOE14xGFS2xiDJQdhN57NnVp86RNpl1TUTKAI7LghxaAHaAdemT59CN/+Q3+4ZMqcIaDcTbxKkoxQsMr9LoG9GIsw4GQGHyvz2Ssp+m0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUhKWmFyUGRqajhsV25QV3ZITXJOZWYvUmVROEsxb09lM2xPL2Y4dy9DcUdV?=
 =?utf-8?B?eXZ0eTNHUVVwS29Dci9xOW0vZ3hqZHpjVWNiK2tTZ2xkOElWQjkwdEQ5cmdW?=
 =?utf-8?B?ZE14RHN1S0lpSnV3Tk04V1owYmpiWEdsbWRvb1Aydjc2R1V1L0JBTmg1c2Mv?=
 =?utf-8?B?SU5uUmVLUmRHQXBKV1VlL0swWGRRQm9xL1BqaTgvVFJBNEpzcXBXRU9OZmZE?=
 =?utf-8?B?Qm5CYm9PVFBXQnNVWnhhcm9TUHNCbUtYQ2IzbW1LT2NkYWVVOUhvcnVTWTRS?=
 =?utf-8?B?QnArZm1uNTIwU0N4MVhsNlFNbUJFQVNpNlRlY2FJVldqZ0VRSlVYUy9xV3lZ?=
 =?utf-8?B?WGZ6QXFoWUNIKzdJMmt1RHhqb3RFc1V2bDZFbGlPWDhBSG9ZY3piK2cySnJQ?=
 =?utf-8?B?Q2tzaktPOFh2dC9kWmZ2TURjS0VGc0N3QmhPc05ISjRySGtZV0ppMURNTXFS?=
 =?utf-8?B?b3FDOFQyM3RHVkdaTnIwSlpEVjNySExPNnpzRUNpNTFNWk5UM2lTWmlnaFcv?=
 =?utf-8?B?M2tKV0Y5QzJZRTgxeWZpQkFIYzNPbjFvS1ZDNFVwSWhxS1lyWEw0L0JIS2hK?=
 =?utf-8?B?MTNuRlhZR1NSL1o4MmNYWDRTNDBVc2VyYlQ4SEdBa2ppSSsyTnUwVWR3c0h3?=
 =?utf-8?B?cy83SXNlcEdZVnovbXJ3TmNMSC9EUDBaUDFJTWNKY2FpaU1GMG9KeFpCdjg4?=
 =?utf-8?B?U3JHcVFYSVZNU0daak1pQUJ0eHhOZ3A2Wkl1TEVjZ041NnZhalVKYVhkK3ht?=
 =?utf-8?B?SWJjTXQ5ZlZDeGVBSEdIZDIrUDRlZHZaZXA1cnBZT1ZMOU13Y3ZVeEJVUG13?=
 =?utf-8?B?L0hObk1NTTYvc3JRWTgxR1crSHgyckpaSFhnKzd6bkoyN2FIOVdzUksvUHN0?=
 =?utf-8?B?NDZqakNTdnFoYkVZOU1CK05Qc0NzVjFpNHplUHV4akNoNmVxMEQydXcyNmRl?=
 =?utf-8?B?UXlyNmk4aGhpbGdTWUczVERmMVVpMm01eWZtTDN5NWphdjYxSGI4cVJoY3JV?=
 =?utf-8?B?MHA3bWE5Mzg1a2F0UzdqNHlHcG5DR0pZT3BEOEpNMXJXVkR4TFMrMnBmNmlW?=
 =?utf-8?B?dm9KNVhMNzhVNEViUlF3QjBDVVorRytQb0Yra2VUTFNoWkd3a3U3RTFaRmU5?=
 =?utf-8?B?SnF3d0pkN1A3bkc2MkZNbkRFcFJwOHlrdGdIcW53bEN4c3V6KzZxbllSSkg1?=
 =?utf-8?B?Mm1oRlp6Z0FvQ05RSEZZRklvcTFkWU54UnlMUmJhN25sY205ai8yNk1QU24z?=
 =?utf-8?B?Q0tnVjd0ZC9DZXNPTzdoTDlxYVoxNVVsVUt6UkEvTUREeWRuZUczdDhiSERZ?=
 =?utf-8?B?dld2YWtYWDFwUk9VUHd1N2Y1ZFQydUpHbkJjaWlRM3EyeXgvVng0TmxTcVNh?=
 =?utf-8?B?V2JoZGhnaWdWdXpKOG5YeUpVVjZwdHExV3RVUVJEcGxqR1djY3VLdFZMK2Fa?=
 =?utf-8?B?dHR4WWZyRTdiYVEvNEtnR1RCTXFFaE01Qy8vb0xKcXJqcnVDMHpDV1BUOW02?=
 =?utf-8?B?QmdhdExmUUdlQWR3TkRaK01mUEFXOFEwVGlGQk1IVzNITC9jUXdKY2ZMb2o4?=
 =?utf-8?B?WVR4dG8zN0FVNHFSWFVQZ2J5QXpJbVE1QUI1eG5PZkhCVXlTNFFJWEdiRExq?=
 =?utf-8?B?NS96YmhWMkZ2NVRJM0hkT2IzcGNUdVRiSHI2RklSV3pSREVja3ZCUWxRZXpv?=
 =?utf-8?B?bXA4S1oyLyt3dG1NZ21KS25rdS9KWit0aVJGRkxReGRjSEhZcDl4N2p0ZG4r?=
 =?utf-8?B?djFiR1dZZWprdzB6elBNaUhpQXpRWGNyaFA4Y09GR2NTVi9jVWJ4TjRSQlh0?=
 =?utf-8?B?ZU5OVnNUNmQ5aXp5K3JNbWNwMExKV3hpUmhOMUgxeXZZRjYyQmFLTHlhZ0Vk?=
 =?utf-8?B?SDgzN2FmL3RFUHNPZHB6dHJyL0REN2N4ODJISFFQU1Q1bjNqZVlJQW1SY2c4?=
 =?utf-8?B?cExHVEFrT1NjQXliUmZYekRpVkFZbjh2MXlBTThNdml4TDB4MlkvY2lUb044?=
 =?utf-8?B?KytQM1ZsdFYxdE5UendUa2NwS2hhZHFVYnhhNVFYZzhMYm5LY2R1em05L1FZ?=
 =?utf-8?B?OVZIY1VjWE5vL1QvclNtVWYxNU1BT09rUVN5ZC9Zc2ZnNTNCWFluV0g5UXAw?=
 =?utf-8?Q?A2hw=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6bb7b8-9c51-451e-95bc-08daabc061d3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi6385v/Tlyhhz76NIki0msL1bCyFgxwvGTgqWGBex5XgYHYIB3LFb8wiHwZbc+o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5597
X-Warn: EHLO/HELO not verified: Remote host 40.107.212.67
 (mail-bn1nam07on2067.outbound.protection.outlook.com) incorrectly presented
 itself as NAM02-BN1-obe.outbound.protection.outlook.com
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In the patch:

> +	/*
> +	 * Samba server e.g. can return an empty interface list in some cases,
> +	 * which would only be a problem if we were requesting multichannel
> +	 */
> +	if (bytes_left == 0) {
> +		/* avoid spamming logs every 10 minutes, so log only in mount */
> +		if ((ses->chan_max > 1) && in_mount)
> +			cifs_dbg(VFS,
> +				 "empty network interface list returned by server %s\n",
> +				 ses->server->hostname);
> +		rc = -EINVAL;
> +		goto out;
> +	}



This logs the server name, but it might be confusing to the
admin since the mount does not actually fail. Perhaps add some
words to the effect of "multichannel not available"?

Acked-by: Tom Talpey <tom@talpey.com>

On 10/3/2022 6:36 PM, Steve French wrote:
> attached wrong patch - resending
> 
> 
> On Mon, Oct 3, 2022 at 5:32 PM Steve French <smfrench@gmail.com> wrote:
>>
>> updated patch to:
>> 1) log the server name for this message
>> 2) only log on mount (not every ten minutes)
>>
>> See attached
>>
>> On Mon, Oct 3, 2022 at 9:21 AM Tom Talpey <tom@talpey.com> wrote:
>>>
>>> On 10/3/2022 12:38 AM, Steve French wrote:
>>>> On Sat, Oct 1, 2022 at 6:22 PM Tom Talpey <tom@talpey.com> wrote:
>>>>>
>>>>> On 10/1/2022 12:54 PM, Steve French wrote:
>>>>>> Some servers can return an empty network interface list so, unless
>>>>>> multichannel is requested, no need to log an error for this, and
>>>>>> when multichannel is requested on mount but no interfaces, log
>>>>>> something less confusing.  For this case change
>>>>>>       parse_server_interfaces: malformed interface info
>>>>>> to
>>>>>>       empty network interface list returned by server
>>>>>
>>>>> Will this spam the log if it happens on every MC refresh (10 mins)?
>>>>> It might be helpful to identify the servername, too.
>>>>
>>>> Yes - I just noticed that in this case (multichannel mount to Samba
>>>> where no valid interfaces) we log it every ten minutes.
>>>> Maybe best way to fix this is to change it to a log once error (with
>>>> server name is fine with me) since it is probably legal to return an
>>>> empty list (so not serious enough to be worth logging every ten
>>>> minutes) and in theory server could fix its interfaces later.
>>>
>>> Ten minutes is the default recommended polling interval in the doc.
>>>
>>> While it's odd, it's not prevented by the protocol. I could guess
>>> that a server running in a namespace might return strange things
>>> as devices came and went, for example.
>>>
>>> It's not an error, so the message is purely informational. It is
>>> useful though. Is it possible to suppress the logging if the
>>> message *doesn't* change, but otherwise emit new ones? That might
>>> require some per-server fiddling to avoid multiple servers flipping
>>> the message.
>>>
>>> A boolean or bit in the server struct? A little ugly for the purpose,
>>> but surfacing multichannel events - especially ones that prevent it
>>> from happening - seems worthwhile.
>>>
>>> Tom.
>>>
>>>
>>> Tom.
>>>
>>>
>>>>>> Cc: <stable@vger.kernel.org>
>>>>>> Signed-off-by: Steve French <stfrench@microsoft.com>
>>>>>>
>>>>>> See attached patch
>>>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>> --
>> Thanks,
>>
>> Steve
> 
> 
> 

