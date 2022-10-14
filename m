Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE25FF37D
	for <lists+samba-technical@lfdr.de>; Fri, 14 Oct 2022 20:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0J4U87WZNpw9AmU33/gtd1UUZwyZkLHgTW2GDvC+FP8=; b=v30HqTToNn84/3AJwNO7Scb6QC
	2px/JvPzp/NShhNgel3WwnQmvXtv49zxJSfxj6Fk6XXG2k4TAnX4HnBBhjWZYxgkNiu6Ql56jKl6D
	Cigm/YPep1DHfsS9Xq52dejDqikx0Rp5/eGiEbuPStaV7VtUhZ6gG5tg1XzHV4N2sDYlO02gTsHP4
	KSzVTYf16pxctHoW12iSC4ctZPkXyESmfpXF5Vcd1MbOB6j4+P8VuCBRyCyQkRMSnb8h1Jz1XY8ae
	wlITB2DJ5eGtOEyFYh54aC+vK12dM5Nv8J/146XVR2uRkwGqOL3G5t5dgkkohsrdUkptmd6vBtUTQ
	BamYALeg==;
Received: from ip6-localhost ([::1]:19594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ojPE1-002U3J-6z; Fri, 14 Oct 2022 18:16:01 +0000
Received: from mail-bn8nam12on2081.outbound.protection.outlook.com
 ([40.107.237.81]:35798 helo=NAM12-BN8-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ojPDu-002U3A-HT
 for samba-technical@lists.samba.org; Fri, 14 Oct 2022 18:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9XeKF0P0tk8gS4U7OEtTHxdEtkLnY6Bo40zVsdF2oeQXgda4PTFJbvYLq9tFzVUwZ3JmbKSniZrdSZxEWSZOT6TYTjdeklZY4q5RmD5rvdkg8ZPJLfemvJCHtiqJozfOUSKCcMRZdo5h7cnMRcHJ4RrW2Asf2+jz+DqTYzAg+ezWCJdWzeYG8aY2OqhvphDMxOtQOr7zIVx5dJrTyqQYu1fBOvqK+U2UEt8AWAV2ZAUAiU7P5KbiCw0Wls3Kw8h/bqb7Wuvkd5qkgo3ocUq2IujZI0trSwAoYaDy3GU35+PE8WsV+twzCYyFkBIxmX1nmOTmaEzYMXaWqhRQfgUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J4U87WZNpw9AmU33/gtd1UUZwyZkLHgTW2GDvC+FP8=;
 b=LkEXgg9Ub6HJLAV3vF4TApONPTePV6lU+UHWKsJ6g+02Pqka3y08DubbXFrxZRcajX7kZ3JYfpSBEXwW1XVLHjZCLMa72ksgb5I8wftRhzR6dDXu9BNvRa5cxefbBDbpK3H8Ym3jTqGb1eq7+pkCmLmDNIMNxhBCewFNimsPnfKBQAUPdJTu3oqe+FquvnNjXG0P6tPi/fA5dx3u832Uu4BxKom5VPrzNy3hMckZ6LdCQkEXMPfs2byAVTool7VLtow9KvvgExGxqrbcEuCKb1dhVGbr4S+pGGyWcdqC5++vFTAum/mdkFKhikQPZsnkNjQtwWF95o9RaISiMMx79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 PH0PR01MB6327.prod.exchangelabs.com (2603:10b6:510:8::20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Fri, 14 Oct 2022 18:15:38 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef%5]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 18:15:38 +0000
Message-ID: <844a53dd-3b98-2d16-20e7-b3b4095243a5@talpey.com>
Date: Fri, 14 Oct 2022 14:15:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
Content-Language: en-US
To: Stefan Metzmacher <metze@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
 <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
 <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
 <46642e17-d7b9-187c-acc2-1fb9ccd09ffc@talpey.com>
 <ace9ff7a-bdb3-d2e0-deb0-944a44ce7266@samba.org>
 <0b6c9604-48f6-a00c-3ddd-dacff83f19a8@talpey.com>
 <2086d65d-ca70-a203-93f2-642a50721434@samba.org>
In-Reply-To: <2086d65d-ca70-a203-93f2-642a50721434@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|PH0PR01MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3d61f2-6c67-45f8-5f15-08daae1018b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: mEJBok+yw4TJhF7IKraCd0yPTuwheJ5NhHM/9qQ0s/ShzgFnN6DxPo5pnwplRVU4P/Wob/MGH2CW7GOp+1RpfSMBigvhvAYxE+n85sr2Fl309LfmZxRADrEk2tooOHB9rHDckz9811/SxPvTpNLsRy8NODWpWF3fqNSq0v8Bc9kTEkkV+JtiEr81fFPCC0Mbs1w4XtrJSADWVCXeFTle+4NtKnYnP3nHqmKznahTJeEPz3KjP/Lc76XnCh1wxLZeySEx10G/UFtJUp4NOEIc6Wv0lOcXdDJMZHq5OAY0xPKzASrc7zzOsz/YL5sKYqHHRgRKRipkzSwEbmy09QN56cyonzEh75p8TI+cvNgwyYgNLK//wb4Nslbi9/PpwRh7mOotP0u31iBP/ay8ro2voQG6a4/jMm7TYThekTM2JqIdD8rx19sM0KvxYFxnUWwd7tC7Fh8wy5MaVj5GCicRmaNfbZjj11G8QHEwXSpF+bRAKFuFm5NzWhRWPFNLOfbPI1wEhdLM/u4HNkRyveKABgg4Or9MkSq6953rz/04HFgT4wEXBHzGie0QoRAAVB3GLRxID+JUc73sNAgxynvIUupX+FbsbsSpHhxZQT6HONn+V4JQbnDlBEk4mGAlBgatzo7cdLERtQ1+py2uztx2ErEQm74sNjot6B0uXDbLFT7OwmbWNygf+G2+ZDgCUk8vri5HAffGkZXOSyu1uq4o5OUdFPdQZ79cWAU6Ik0LuJjMQ/7UfECkZAveZN3d0QrGPrI2wt5mKFKx7Dvivv4+sf/Qj903ubFtKZqDlFkYNcEl5wc0okKmBdFbh/eIsg7ZULgbz7k5B/FS1jfMNqhDMQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGs2bjd3SnlMUHFocXlPanphODVNdkY2NVVzcnZFUmZmNHgwUW1yN1A2bysy?=
 =?utf-8?B?dDlJNm5BRktpbEh1YlhPOXRRc3hQTllIRjgxeW96Qk01aWNDTG96UjdIOC9Y?=
 =?utf-8?B?dGh2NVRISWZVTEVtdnI4UzkwV0hVUnhHUlZTQ3NJTU95NERKcW1WSHNHK1dn?=
 =?utf-8?B?aWpVV0VwUUk3NFBYSjFGOGZ4MStzQkY3L1FKTHllK29OamIxV2xZZWNQRndE?=
 =?utf-8?B?Tnh6ZVJpZGZLUEJoTmdONEY3emwzY1MvZUJMaGxiamNsbDZXLzdueWF2TWN5?=
 =?utf-8?B?WnhZRnBhVjFnYzlzRTUvd2hNWnZnUDY1L0NNUzNUZCtLTXVFUHd6OUMrQVd4?=
 =?utf-8?B?bVR4Z0R1aE4ramhycEs3TUVORi9zL0JXb0FYOXdHL1hPd2owVjlMV0RMK2Jk?=
 =?utf-8?B?NDBWZjlHRGthcmVhdUFvNXJ3VGl4WHdDRWFDUUs2L094QnB3bUg3K3JiVC9U?=
 =?utf-8?B?L0hTTTBjZHpHYklKQkdRZzFQdEI5bTlXb2N5S1hXVHplM0J1dlFRSzB2cm9L?=
 =?utf-8?B?OTZLckdhK0xiS25zSkxEVk55cURzZndvbXdITm1jM01yeGdiTUs0RHU0dzZI?=
 =?utf-8?B?eVNKendpSEpaaS9rUWljcUdkWFdlS041RjY2dExZSkhpTmdYOXBQTEIwSXZs?=
 =?utf-8?B?a3owRHRNZlAyMGpXQjc2MFZ2aHI5RUM0TmR5U3ZJM084RDBOdlVXYktaTVRn?=
 =?utf-8?B?cG9JVEc2WUpjdnU5TGRGUXNLL04xWHhVQkhiY3FGcUsxQ0plVW9VdjJ6T0V5?=
 =?utf-8?B?NFBWOVdVMkI2eEtiRytmb1NmS3l5Q0lPSmw3ZnlQOVE2TDZEUlRaY254TVZq?=
 =?utf-8?B?ZExZNGF0cGgrY2NTVUxhM3Jtdk5uckQvdmQ5QnJGUzdnRzBJR0x1TEk3WUJt?=
 =?utf-8?B?ZjRjbjRYQ2pQYjd4RCtYWjZ5UWEzYWJyZ0NodjJxaHRmK09UU0ZpdFhqdlV4?=
 =?utf-8?B?TGdoME8vNlprNTI1d0QyeEpqcXUyeTNRZWlYUnZBMzEySXN5ak9STWRWZW9U?=
 =?utf-8?B?THhVOEY2UHphamNVMnZ3aUdiQ1ZRd25oOU1kditjZ3RpcCtMcU0vS0c1Z3Vi?=
 =?utf-8?B?d0xpZFovbVhxMXJvQUs0M3lNaUNsaWxxcmt3WExmalg0dW5tdFJZamVMQ1h1?=
 =?utf-8?B?dGtaclFCMnlmVFd4d1V2ZkRKdkxSY2d0WTJOejE5OE1wdHY1NnJmSnlRWlpa?=
 =?utf-8?B?b2pKN3ZvTnN2RmFYd2FXMmxFMXRoYTYwamhQU25BazFRUUdHb0tWTDYreklI?=
 =?utf-8?B?UUVZSmJCeW9sSVowaWZyQXhMMTlpbEJDUDhwcEY3WFNhVmJtMytTaVpPcXF6?=
 =?utf-8?B?aTZhRGZRaG13Y0VYU3lJbHhpSlJwaVpFSHpRUURhK3ZGN1J6Vi9IbFFEbXov?=
 =?utf-8?B?Qm0rbzFocCt5aEdFNTY0cnl0bU03dFhXN0lMYTIzRXVFVVZWSXlLUzYveGll?=
 =?utf-8?B?dnBTL1RzN3JZS1FYbkJsS0Z3OXgzblBxeGxUYWpRSmh4M0ZIOU52TEp0d0g2?=
 =?utf-8?B?Z0ozR3M4UXVKOHdRUWJ1cUtjcS9jdDR4VHZ6YlJxQ2cvNlNkaFl3eWIwNExM?=
 =?utf-8?B?YTRJR2l6Y3Y4NXFPUjNwbmI1RjVMMnI5UG5laTYwZnExSzRRRDhYOGl0cUM2?=
 =?utf-8?B?SHAxTEloeEovY2JEZEV5OVZOb055cjAzOVFUMTRKdXczRU92YlRsd0VkZExr?=
 =?utf-8?B?ZkF5UTVUTy9seHFXdlpOSkFSODVPZGcxNS9HaHVhQ1d5d0dWejFCUGlpb051?=
 =?utf-8?B?ZS9NclZYTHVTWEhBOCsrMHVhNEQrMFJIMW9Xc3NHTVJNcnRYcWFZcUZ4TzlE?=
 =?utf-8?B?aXB5SCtmNXpyTG9UNVhwRHJUQUYxVEVwTHh3WXM2LzVBVXFIbnFQVHZoazla?=
 =?utf-8?B?anN6SEh5aWtGSXVBU3dEZFdiZW1Dc2UzaVh3TzF6dVJ4QWpKVDJsaHR5cDRW?=
 =?utf-8?B?TTFGaVpmSmlxWjh5WHhSRVE2NGRiN0NPRmFCNHBLQ2sxNkowb3dRUTBDNys5?=
 =?utf-8?B?NWM4c0RlWms1ZStnYThsK09pRnNCNjBBSFh3OXM2aExweTQ5cHBoeU16aUhX?=
 =?utf-8?B?RDliWVhzK0RGdWhCSUJQN2FWdXlOQUlJNWxEdzBkZHhLRStxL3JVVkJZR0gr?=
 =?utf-8?Q?XZY4=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3d61f2-6c67-45f8-5f15-08daae1018b0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sZZtpcoXVa2UKOhY43G/3EEtALGd4bCvM9dvEjmDhiVQGCNo39bX0wKgk7yyV8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6327
X-Warn: EHLO/HELO not verified: Remote host 40.107.237.81
 (mail-bn8nam12on2081.outbound.protection.outlook.com) incorrectly presented
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/14/2022 10:03 AM, Stefan Metzmacher wrote:
> Am 14.10.22 um 15:52 schrieb Tom Talpey:
>> On 10/14/2022 9:45 AM, Stefan Metzmacher wrote:
>>> Hi Tom,
>>>
>>>>> It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
>>>>> sk->sk_err is not changed to indicate an error.
>>>>
>>>> This is correct, because the TCP connection is in "half-closed" state.
>>>> The peer has closed, but the outgoing stream is still open. The TCP
>>>> protocol has supported this since forever.
>>>>
>>>> This is not a transitory state. The connection can remain in it 
>>>> forever.
>>>> The peer is now in FIN_WAIT_2 and will send no further data. It's
>>>> waiting for our FIN, and in turn the local socket is waiting for a
>>>> close() call to do so. But pretty much any other socket operation
>>>> can still be performed.
>>>
>>> Thanks for the explanation!
>>>
>>>>> It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
>>>>> hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns 
>>>>> -EAGAIN.
>>>>
>>>> Probably because the peer has stopped reading the socket. FIN_WAIT_2 is
>>>> a super-problematic state, because the only way to exit it is to 
>>>> receive
>>>> a FIN or RST, which we're evidently not sending. Most implementations
>>>> run a timer as failsafe, but it's always rather long (minutes).
>>>
>>> Yes, we need 'socket options' with TCP_KEEPCNT, TCP_KEEPIDLE, 
>>> TCP_KEEPINTVL and/or TCP_USER_TIMEOUT
>>> and/or a user space timer in order to have lower timeouts.
>>
>> That won't help. The peer is there, and the connection is up.
>> The keepalive will succeed! Even if it failed, it's not prompt,
>> and reducing the KEEPINTVL is a very bad idea. Servers should not
>> be pinging their clients in any event.
>>
>> What peer is doing this? Most Windows clients will perform an
>> abortive close, but this one is doing it  gracefully. The
>> server should deal with either, of course, so I'm mostly just
>> curious.
> 
> I guess the client is gone or it waits for our FIN,ACK
> but it no longers acks the data from our sendqueue, which we most likely 
> try
> to send out before sending out FIN,ACK.

Technically speaking, it's waiting for the server's FIN. The TCP
layer has acked the incoming FIN, but has left the sending side
open until the server app calls close(sock).

> But I only have the information from the public mails and I haven't
> tried to reproduce it.

I think the challenge is to determine what combination of pollfd bits
come back when the socket is in this state. If the server can detect
this, it can close the socket.

>  From https://lists.samba.org/archive/samba/2022-September/241873.html:
>  > As clients we have some NetAPP-FAS running which doing the auth. via 
> LDAP. On NetApp timeouts for LDAP are set to 3sec per default.
>  >
>  > Some queries seem to need more time to answer so the client tries to 
> close the connection but the (samba-)server-part leaves the socket open 
> in CLOSE_WAIT.
>  >
>  > In some of such cases the corresponding process (ldap-worker) runs 
> forever(?) with 100% cpu. A strace shows the ldap-worker pushing some 
> info (the answer?)
>  > to the socket. If one let it go the server slows down gradually while 
> more and more connections stay in CLOSE_WAIT.

Right, that's because the server is looping between seeing the pollfd
bits, attempting to send, getting EAGAIN, and repeat, right?

We can't just bail out on EAGAIN, so it's down to figuring out the
pollfd, or calling some socket state API when looping,  to detect
the half-close.

Tom.

