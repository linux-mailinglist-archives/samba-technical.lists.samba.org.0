Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE550A8383C
	for <lists+samba-technical@lfdr.de>; Thu, 10 Apr 2025 07:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cwwL1x2qwnrrKzJsh0i5QXtSSNqY3eNytg5aWX/O4mU=; b=oLmIV+xEIWAlSe9k2E5rzS0LZy
	4Cx3ihtVKxd1eWpg0E4yov4SblqPBYH33WNwHIvCYHa3z50fuyo/3aGF4aevQzmzCoFKHL/fCykSV
	DuKmsvxwbpKqnJ5UUIDv9NkXavjZF1pJvGbk629Q9NeiDz+8Cmyf41FX0SFdrT5mGLEt8xqAzQfM9
	fz1ksHMred4Z2iJG6sKkcmYCx0XFdCIx4uMhscS7gTjqZAjfp9CEAQIDk5wrLyvmUk2yLMxh559Io
	p/zv2kHmRazq+EZpuMiWQ9OpDjHy67XjYDv8TBYhbCWcFVSqdQKvHERCy+YqffSFQK077Xt4pdbE+
	eVSRMc9g==;
Received: from ip6-localhost ([::1]:64892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u2kOp-0025wh-29; Thu, 10 Apr 2025 05:24:27 +0000
Received: from mail-dm6nam12on2136.outbound.protection.outlook.com
 ([40.107.243.136]:60800 helo=NAM12-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2kOk-0025wZ-Hi
 for samba-technical@lists.samba.org; Thu, 10 Apr 2025 05:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpDhB+rcn8zfbx20F17KVGkXZsXJ9uunMHnAn43RnsqzRQVSLPtdUMY7Y+4xgc9qs5JowEbGZ5UREBtDMKc75axAwhvIjDMUvsB5oPiDTroH5V4QxqHOcJbNDDMLiq8zG7l4roiQctKTtar18gFS8VAcfsYgmWtBkdajcOF3tZDg5UG1yWaKjAN/fDX/bdYkyiCjYGk+xvvoSSP8DTrIh/VXwbbpxdEqMCxvcAoFVcZVcgu7DGEnnZxjXrsOSLYDsYXOQzgUWySueZTxxC7pd6SgOSXYxcGWWm8QNjmCKP2i0RdcZ4yEJSrqr/TK4WbdpoBFPkvvZQupELBkP5OjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwwL1x2qwnrrKzJsh0i5QXtSSNqY3eNytg5aWX/O4mU=;
 b=BJwSOnmZWzK04wO7smutTQXh6UdjJ9wiI5mDM4XspkRqpdD5r7MsWwLJj0Rl/5ki4ymLVfh2iOWNAFjCYDw1kAFBZxHkNVexv44G1SV4fr5DaQQB9UvEIhVB5nEgij9oFK+jqaJ/L+5zXTxvEk2+8gBSjceWA+efiozmo1efG6BLHmn1+bKXfiRKCRJ+xa7dhNYwFsT3XLy/mb2ZQysshdweXnYB9PdQ10MljEnKTfjND+zmY0Km4zAP/j/s30cbzbYB/xhUZfQjKgRrTor7FFgUYGxohO/KrVP64stLea4HIDv3ICTB/h38Ow1Rx5vRcfFG/aDw05EqO8Tc5ZEI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB3854.prod.exchangelabs.com (2603:10b6:805:19::20) by
 DS7PR01MB7736.prod.exchangelabs.com (2603:10b6:8:7c::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.33; Thu, 10 Apr 2025 05:23:54 +0000
Received: from SN6PR01MB3854.prod.exchangelabs.com
 ([fe80::66af:6788:adc5:f856]) by SN6PR01MB3854.prod.exchangelabs.com
 ([fe80::66af:6788:adc5:f856%6]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 05:23:54 +0000
Message-ID: <a60852f5-cb90-4614-b35c-91d6507aee0a@talpey.com>
Date: Thu, 10 Apr 2025 07:23:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Ralph Boehme <slow@samba.org>, Steve French <smfrench@gmail.com>
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <CAH2r5mt2032HC_yLrqGoAY-J6JZfP_2zjOjoKiY92YUrxBiqnA@mail.gmail.com>
 <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
Content-Language: en-US
In-Reply-To: <a5c81acc-1e85-463d-925e-eb5b05af9ee7@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB3854:EE_|DS7PR01MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 33fca2ef-f8c4-4c19-5a92-08dd77efe26b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnZkMk85bkdQUkx2NTBSZXIvK0pMejZqNncyRGdpbkUrNGlDS0RLYzdwa0pO?=
 =?utf-8?B?YWxUSWpjRlJUTGNwUFE2TkhyeUYrbUx4Zi9qWG1oTzBVQ1dGclJKNEJyRHlk?=
 =?utf-8?B?LzlWMFhMRTF3Z25nTFdRUExtbXIvbWQyeWtVRHMwZXBsakdGVVh4cjBmM3BP?=
 =?utf-8?B?ek1tN1hxV21Pa2FDV1pmOUIrZkJzamxmSWQ2czBEN1lGWjY4WjdiUk1jMUtq?=
 =?utf-8?B?S0FNSGdZMHZzNkRPTllEN2psdFBnTSs0Y3dNWDFWdWhmTVB0am5XR1BGM2Vx?=
 =?utf-8?B?VFdVMzBQdWpZNlhKNjBMQmVnWkFaMjdtdEJtalc1MVBtY3kvNUpUc1BRMUpm?=
 =?utf-8?B?NU1NeGY2SHE4emNoTWg0QzVLc2hudjdqZlhxaTR0R0N3VXJjR3lTeG0ydTlM?=
 =?utf-8?B?dHZVajgwcC93VUV1UE5udDU3clkzMUZyZFFpSkJ5OXJtUjYrSjlXUHlZMy9R?=
 =?utf-8?B?bnA5UXRtaTFIdUV1MzVjZ1hsNlpJdTN4OStoR0h0Z1RjU1JiVW5KbTlkR3Ey?=
 =?utf-8?B?cTV3VFZuc05uUzBXMFh4Q3I5VXpMREVmVWtWZmZtY1l5eHRaeWlvTnNHckxn?=
 =?utf-8?B?TEp2SjZjRFplemE3QjFya29Qb1UzZmIvSXBSWVNXYS9rdytxaXBuMVB0K2M1?=
 =?utf-8?B?bXVjSThnTWJOOWVKWUJxMDhvTklZOUc5SFVWYzRLczkyUFF2TE9lZU1JYlRv?=
 =?utf-8?B?Lytxb0JqUVZqSktuYkxodzNiK1dQc0svdnFwUU5BMktLTGRucnhQM0liTHdr?=
 =?utf-8?B?bDhmUDZLTFlpWVRWWU95eC9aKzJ1SGsyUS80T3JUTGVNMjNBVjVCUzZDc0pC?=
 =?utf-8?B?NW9GQjlSQjJQVUJob3NLZlN0WlNMMGw5MUR3c29YVlBSdnlYdmtteHJSUzhl?=
 =?utf-8?B?T1FsN2ticytSaVFHa1p2dStTQ3pGYkdaU1ZjUENBZjExbHc3Y2ZhZ3Vnb2Fo?=
 =?utf-8?B?SUcrMlBXalcxZVhDTEh4QXA3K0F4NkVNd0dMbU02c1F2QTFxTzdrcUttZ2RX?=
 =?utf-8?B?dWJldjdCWFBnWVF6dG9WQXhhN1A2dStIMCtWdzRMTnk0aHpFaUV1b0xkZTcx?=
 =?utf-8?B?WldvY3dwbFhKVzh2SjRhdDNtcFRCMWVNdjR5cE5iaFNZSUU1V0twVWZCRjhY?=
 =?utf-8?B?VU4zSU1GbFhFRVdMRUxubEM1K2djdjVnM09zUmYzV0hJSGptZU5hZFlMUjJx?=
 =?utf-8?B?SVpmc1lwT2pXeFRyTmF3eTcxbW9uQnFnVUdyczFvNFpRRVgrRURwU0ZEK1Bn?=
 =?utf-8?B?TTZHQ2J1YVpuSi9VVXpzOWRpaHdEQkNNWFozZjk4QjJnNUdaWnFmU1F3VFE0?=
 =?utf-8?B?Y0p0ckR5cEtsVmJBdlcvTGdWSHk5RE9UWVBaR1RUNlZ5OFQ1bmNScDcrMjRI?=
 =?utf-8?B?dEhHaTluQm4vWmhQb0IzNC9wRDFtYndTWHhRMlhmTml1TU9KdWc2MVFVcndp?=
 =?utf-8?B?YjNxMWpwSDBsdllhaStNZUZDbUp5bnA3NkVpci93OEgwUFN5MVRTYy93bVVk?=
 =?utf-8?B?RTZKZ2lnVldxeFJsTGVUYnZTRXRWd1Fua3Fxb2hmeG1LZUtVejJ6eVAxVGJK?=
 =?utf-8?B?NS8vRms5TU9TU1pja256TmVFbk1CQUx0U25na1JoV1ZiSzFiRWpscnVPMTV3?=
 =?utf-8?B?UW8rQ0M1eUE1eklYMmF4WFZSSUtDNmhybXlyM0ZGSkVaVFQ0cTRLejZzbG1m?=
 =?utf-8?B?enhvbnZjdlIrM2lLRFJvcXM3Z3RJZkxaNXNmY1E0LzNTNHIyRnNaVzlNY002?=
 =?utf-8?B?UFgxZlZXbzNMWkpuM3QvK0U2eEVXNXo3d0lTTm9KRk5rUGRNcFl0ODlCVkVW?=
 =?utf-8?Q?Mslud2xIA0LR/G8Zyl7to0l5N0lSYU5lnnerM=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enFQb0tEOTE0Q2gvSEdWNTB0Z0hIWC9CWlRIa0pNWWdyRDFWVTJlUmVhUlB6?=
 =?utf-8?B?d05qc0FsNFVEc21MWSttemRNS0p4aWgrWTVZRUozTG9CQ1pRWGIwM0d3WDFs?=
 =?utf-8?B?RlZpYVNaY1RwVEdVb21uUmJFNU5zSUpqNlZWdktvb0JTZUpadmllVVl2dWxT?=
 =?utf-8?B?bmtKM2ZjZWJLK1F3WkJJSHVYTVJzUVo0cFpab3QzTkE5SllheGJnQXpBcjNT?=
 =?utf-8?B?ZnJRcDZWMjlVV3FEd0NkZ3FTbTRLZEk4Z2phNUdhcVg3WldKQThGSWJRZE9v?=
 =?utf-8?B?VHpRdkYrRHVjMFV2bkh6amRiTG5XL042bWZvcjcvRjFFa3R5QjJrNWRCL3N1?=
 =?utf-8?B?QVhJQUQ3ZEpiTCtyWXVmbFBjbkNPZGN1c293Y2FiNlhReGhobWY2WlR5K3hW?=
 =?utf-8?B?clNsQzFBZmkrMEpaVnBWNHZzVnlJMnVWOHR2ejM5eHBaVm10eFlmSFVmemVC?=
 =?utf-8?B?SitoeHFOQW4vZ3JRMzlzNEVyZ1BSeFhFT21ncXordmlnZTg1MEZWVjZsOEgx?=
 =?utf-8?B?cVZJMXFNWTdNOUtFQTVsMURRMUV3VXQ2OGNOdTJQQkg4d0lWczZRSlRtWGxt?=
 =?utf-8?B?NVRsMjYrdURzWDZ2aDl0WDRyVXoxSjVxMDdYbGRnQnUwOTA5SEVLd2tQVGNt?=
 =?utf-8?B?cmV6Rm8zZ3FVclBuN0FlUmNjWEpqOFhkRy9YQUFkTEYwYUlhZXNJbU4rckxz?=
 =?utf-8?B?UzB1RFQ5SmtGNW14SkJxdkRUWXJVTWFOTEMyV0dTeVExbnRmcEd4bkNySTd0?=
 =?utf-8?B?dDY2WE50c1hYall2djA1Y0txekpRcVUyRUo0Vk1QSkg4UmxPTE50elRLRHpi?=
 =?utf-8?B?VkxSSzlINWRMWEdkT05TQ2dPNklBbjRGRkFvcWcvSDlsVWUrcCtpZnVlOHlv?=
 =?utf-8?B?d1FGSVhpeEM5bVNlVVhDejhndW91MjgzUUhwTUhGR29iVDJkSlJnR2kyU1Fv?=
 =?utf-8?B?SndiSHlUQUJnbWdNWEVobkdpZTdMYXp3MEpHUFNHVHJuRWJwY3MzSld4OCtt?=
 =?utf-8?B?d1B4TmhvR0hEVzFOanpjcG5md0FHVURzMkVRWXRzeVZpWE9mc2ZMWlAwRGZS?=
 =?utf-8?B?cWVtbVdtcDdnUWxoS291bHZ2OVArOXNyd2hrRmxwZnFlL3A4THR1bmRVSHBy?=
 =?utf-8?B?VFRURHRWRkl3dDgzN3FFbzIrY2ZhcjZzWEVZR09NMWM4UE1hWXhJZU1HdUNQ?=
 =?utf-8?B?ckpjVEE1dk5LUjRyS05HcExWRzRoR3l1Y2xISVA4c0trc0s0RzdpV3FWT3k3?=
 =?utf-8?B?WXo0bmNWVTZiZkZSZkp3Nnd0OHNtemlMK3piTVh1TzdWK3NWMTVGT3l4YTd4?=
 =?utf-8?B?RHhlOGdCbnJDKzIxZ3RjWUhxbUNibzRRNTliV05Tc0hpelVQQnZHbDIrNTBy?=
 =?utf-8?B?Ym44Qy9HYWxvcXJWaUJmalFTcjFBSUxqVFZGcDBYQkE0R2JJSG01aytyYjFy?=
 =?utf-8?B?MDV5eXM5anV4NGJGYU84aFVDWFg0ZmYveWRzblg3TlpUSU9oWWJrbm5DemRy?=
 =?utf-8?B?dEpod1ZKNStrMlRMK1NyL1lXWm51RVMxenhVUXcyKzMyL013Vzlua3RpV0I5?=
 =?utf-8?B?Q3VtOFZIM0NvR0dxMDJFbi9vNmduR0haVGpFSzM2ODNXUWY4QUhsY1J5Ylhj?=
 =?utf-8?B?aWJiY2ZxRlJmTExLMEc5L2ZxVkVZcjRWRFRuSmdpMVhxUG8xNk9DSENHL1lE?=
 =?utf-8?B?d0NVZEZFVldBbXlZUGdEL1JBUytlSm9XOVRaL1hYMWI4S1huSTkrVUR3Nm1Y?=
 =?utf-8?B?elMxM3RRcXFsZmZEOFpNUy9jQUsxd0hZbjhDc2k5VHV5S24wbnMrL3FVRU9V?=
 =?utf-8?B?ODRDbVF4VDg1eDR6dVlnSm93aFhMQVRlWVU1bFNTd0VRRm1nRVhhb0ZDZGs5?=
 =?utf-8?B?eFZnd0xIdlpaZmhoV3FWc3lxeTg3djdXRlY1TXBUeTBkUTdQQU5hMWllRmov?=
 =?utf-8?B?UHYvbno5aHV6dVFYK09LVDNSTTdCblN3MzI5UTdDS1hacnFEV3ltcWdxN3hZ?=
 =?utf-8?B?RDR6Q0NyMmN3WHNUKzJoSHIzZ2I0aGpKQWhIY09aL0F6SHFlSTFGRm02YkZ4?=
 =?utf-8?B?ZVdYYkJPRFgyb1drMjIrTjFVN3BXYjRhb0Y3dlQrT3hHbjh0Tk9ISFRVMXo5?=
 =?utf-8?Q?K5wc=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fca2ef-f8c4-4c19-5a92-08dd77efe26b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB3854.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSOd2qT0exfz0fpYHsgCbupFVutNNxzwjNkHx4wvIcHFn6n6pL56nCk473b3HGZy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7736
X-Warn: EHLO/HELO not verified: Remote host 40.107.243.136
 (mail-dm6nam12on2136.outbound.protection.outlook.com) incorrectly presented
 itself as NAM12-DM6-obe.outbound.protection.outlook.com
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
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, "vl@samba.org" <vl@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 4/9/2025 9:06 PM, Ralph Boehme wrote:
> On 4/9/25 8:43 PM, Steve French wrote:
>> On Wed, Apr 9, 2025 at 1:18 PM Ralph Boehme <slow@samba.org> wrote:
>>> what should be the behavior with SMB3 POSIX when a POSIX client tries to
>>> delete a file that has FILE_ATTRIBUTE_READONLY set?
>>>
>>> The major question that we must answer is, if this we would want to
>>> allow for POSIX clients to ignore this in some way: either completely
>>> ignore it on POSIX handles or first check if the handle has requested
>>> and been granted WRITE_ATTRIBUTES access.
>>
>> I agree that to delete a file with READ_ONLY set should by default 
>> require
>> WRITE_ATTRIBUTES (and delete)

Since when does Posix require this?? All that's required is that the
/directory/ is writable. The rm command will prompt if the /file/ is not
writable, but the unlink(2) itself is not denied.

https://pubs.opengroup.org/onlinepubs/9799919799/

Tom.

> 
> delete will be checked the usual way, so nothing special there.
> 
>> permission (better to be safe
>> in restricting a potential dangerous operation).
> 
> yes, that was my thought as well.
> 
>>
>> But this is a good question ...
> 
> That's why I brought it up :)))
> 
> Thanks!
> -slow
> 
> 


