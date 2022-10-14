Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7A5FEF0F
	for <lists+samba-technical@lfdr.de>; Fri, 14 Oct 2022 15:53:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R680seYan2JoesrbJm+kB84tFoHBh1AiSt+yPx0vnO8=; b=XzH4Jrq94dPaloVUb2FzuoOBx4
	IEd43D48ba6GaUOL7Mp6igTJieLVu8H3/+HgWKxpgYuToLGvXsZ7qUFnruvdkDlVCsStV+PdM6c5A
	l+8tbcekudJivUqtgjpp4D1fZ4b25jS4x9hoEUndHq+8ockY4Quknt8rNZ7cjQYvGGpQkf7dEN3wC
	XVBk4YFfApa4eCHPSIPxkbFcWSuESFygBDpG6q2XFdOrK1QsgQ+NCp9CB5peDttxxGzo1RE3uwQ+/
	vCJcdFyWIQZggV1zCPCodvoOZDbIr1dohOVf94CHCmengVqhNQcIVwFOJPyFx/IVK6pyiyyK+hyJi
	5w1A6EeQ==;
Received: from ip6-localhost ([::1]:19338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ojL79-0022fy-PK; Fri, 14 Oct 2022 13:52:39 +0000
Received: from mail-mw2nam10on2059.outbound.protection.outlook.com
 ([40.107.94.59]:12001 helo=NAM10-MW2-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ojL72-0022fo-Fi
 for samba-technical@lists.samba.org; Fri, 14 Oct 2022 13:52:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN/mdYAKsEzNUKkOx5nXnA6GzKEXh5M0gptc9gMF4cp0PKHl9FBcxv5lCrvITH/YZTTMUlclARlrpTVi6iue70Cg3JVImrYrwIkX1o6465rnXv5yxO1nAYmNClqNxq2lQ+O4ZXZMrbZBNcCtHYFITw8v7UfoSEHpqH+D6gv1d8TxrjjK6Fh9kK5zNxB4lvfLz6DbCFazQSMEMl3FU+VZt+rDP1HyUCgEIgXnQY6C+nOHnFuWmEOnVkTd96+47//mMs9Gd76aysomjeIwS1D4o8ROe3K0Z8VVtGvC2PW4BrIL/H3Kmuc88SQaVBj9Y/D9YqZ0dGxIO/CoptYmL/99Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R680seYan2JoesrbJm+kB84tFoHBh1AiSt+yPx0vnO8=;
 b=Jq7/SBZlQQd7KEUVBaKJK6S2kgGMudYeiKWYdem+QhJsWICKlfqPq7pyZbe6E9YIXvYw5QH/IjScywmse7Ss5hb58xBPb1KHDoSzWg5hlA8ijrbgR9bIl7KVIbdF8vlitgQlFm2YxPlxx3b67dyiGFYZHLmali+x5CqGQUAYmkJPrPddD7AwW7xTppth6yJy1JbN3yp8r2OPsZ3+ODBarCt2cONl6BCVAhVNr0IPLfD5wR25JASkju8UpScBhATIXQir0yaaMNyrTcbdf/AJVqaNpK9fIlyqrQF725aUZs7IxahGhAKlyBLLkITRaImnhzSapRaqIvnodbU/bzZ89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 BN3PR01MB2180.prod.exchangelabs.com (2a01:111:e400:7bbd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Fri, 14 Oct 2022 13:52:17 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef%5]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 13:52:17 +0000
Message-ID: <0b6c9604-48f6-a00c-3ddd-dacff83f19a8@talpey.com>
Date: Fri, 14 Oct 2022 09:52:16 -0400
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
In-Reply-To: <ace9ff7a-bdb3-d2e0-deb0-944a44ce7266@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|BN3PR01MB2180:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bea5d4-9145-49a7-cb1f-08daadeb4e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: nGV6Ab6Wl6kKrf7NmAHWyq8Z1IdRIbIaK1UoYsrjYV+r/JrAnxCQTl+FfTxI0JeDfb/LVqh78U1//uNZSQkfBGjY3FW8GSuUT13mDxE5DAplfCrtmJfKsHAwMeYhICKwXO9redQw6v4+zSeB3aiidFxfI29IlFqDdJUBkJTUtSIGVH26MiiPfMtj4D26FzdM/6ORkXjwPqU+9LzJhoFWD8lCS7ST2f4d5G9NcBWM7sOVaNBr0J5HhC64nXsVdWR5ReLWx1Aq9TLLZ86vke5CWENDNTk/ynVntEY0Aprn54t3l2e2atIpZr1KelbhO88RsVIKPr+6I2qbIQ07lDLYNDEMPqC5THuAm3E6t1LhA99JernalnQs0w26YYYs4xFefvox6B/1Ps6CeswvnUnOgeHwt0LWvG19k1I0FJOHkkyfe1gPKsSJj9rEMmAcBl/u/leObagx1U/zuEI1vqplIovqz66UFT3riNm/5VNPHIsjAR4zp/pV8QhMKZIUbuVEuCCt0xmiIShoqbQExGm/z+E8Rqy5jFL+OFkyDLvXMZ7DYyaD8c3bWjVRNRETnn35Vi2WOfbTkMOi6qOGA0zR80XC4FyefVXNZT2eiD15e5rZn36xMhJ6umQvIPB+KelXzNTIytFJVkxAJ4wINN24vnKzgyg3FgW95BA4r5CUic1/ptSh3xLmrb1rIZH6Rm+ZHtzDYY+bo5QDqjcuywxZGx4ELBusq0LY2vw9FrGwmM/TUxKn/n5dy1W54aryDZVRC18hxgZ0pY40Si6pSdFlCNq/UcC/r4+Aig2JdzsY5+RBS4hZ+9YmdZD/FnCWEVhaV7L5ivGBvBz+JtduAtuskQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dOeWwxcUlsaXlibGtFWkRoaHFVQ2x5N1Y3QitadDdvc1hHQU1Wb0FtR0hx?=
 =?utf-8?B?MlZ0ZWwycWt1b0FTZnBCOXFYVGxNT3FnYitGWkV2QWNIRStlL1B0KzNsemxz?=
 =?utf-8?B?K002RmVSRmxTRjBuMGZLcUhwQWIxdFVDWUxxUEVKM25UYXViVVBHU1I0UDlG?=
 =?utf-8?B?REl0NVk0bmVDcVFSVnVMeXVKNFFqM1VWQ1E1QTRlclh0K2w3aFc0b0N5V3Ir?=
 =?utf-8?B?aitkdTE3ZklIMCsxaTFleG54eGlxM0RkTDJGSzBNalVSak5iQ2k2OGovMjF2?=
 =?utf-8?B?d0drK3JMbWhacUFqdm9ZQ3pBYTlqUEFyOXR3VUFvakJBaHR6ZDgrQXl1Smo2?=
 =?utf-8?B?U3N4b1FJaU9tQlpBbE9FaXpxeDVIZ0NOVllRb0hwcDh4R0E4c1NtcG1FY1JU?=
 =?utf-8?B?Y1pvWXVVamV3M091ZGt5c1drL2hXVm5VVEF5Tk54eCtGSWd5YWdrNlFOd1hl?=
 =?utf-8?B?cVB0QXE5ZHZqVXJsWHh6cmRuMkFvdzNjaVVJMldrc0cybWVVL3FNdlMrdm5O?=
 =?utf-8?B?Rm1USU9uUmxOMWdKSGsySGNBd0ZtYkk3dG1UZFUvS3BBQUVqbUZsZHBxUG5G?=
 =?utf-8?B?RzhjanQxQXhQZlo5VUhPUVZEVCthVkVBNDRzbExMSUdTcERhcHl4ajFkTllS?=
 =?utf-8?B?dU9BT0JTZ3FhVUJMc05heHJXY2M0NVIwbnlmS0RCSlhhd3JhS0xHSExiUVRk?=
 =?utf-8?B?OWREUzBkNCtEQ0tWd3RuOVc4VVA1bElpWit6b3dtZHFKazNJZExvak45aGlE?=
 =?utf-8?B?NWJjYjhGRDlCTU92T2pNZG5mTEUzRXRKak9WMUF6N2Z6UEplaW9sT1JDc1hz?=
 =?utf-8?B?dlA1eDFZejc3cWlUMS9TMTZZdDlPa1pORjNTMjlmWUVsYXltUHFBbHVHbkZh?=
 =?utf-8?B?NGV5WDBMNERVNlBQL1BYRnpOTGtmUkQ5M2JVcXdyTkd1MVhabVp3NTZXcXpM?=
 =?utf-8?B?ZlJ3VUJUc1dyRWJqVWR5N29Oei8zNjY3RDNLN3lZWWhhTExJWTlPVklwb2JN?=
 =?utf-8?B?V0o0bzZ0Mmc5TlhBL3M4KzJtRVdmSUZSdTVZRUhkVzVCc2RhNlFyVTZoT25h?=
 =?utf-8?B?OEVUWW15dUN4WkREajFtaDZOWWlFS01BTmM0V244cG5sUStVdy9VUWtGZDg3?=
 =?utf-8?B?bUtaam1OUG1KQ1hQRlJwdEg1YmxHcWNTSVk2Q1ovVHAxMlg1Wk9oWkNzTHF4?=
 =?utf-8?B?MzI1RmxlWEp4S0Q5aVltb05DcWpjZGJsMldJWHU0Mm5rSVpLZ205aXV4MG5o?=
 =?utf-8?B?SGc5bDllMnJyWmRkUDViRC9SWE5RWm1RUGlBZzJyc2E3SFYrOEJKK2JORnlh?=
 =?utf-8?B?L2NBSTRMNUpGTzhRNnFYTjkxTTBiRzVqbE5DMDdWQXE0akFEYzh0UkhOdEgz?=
 =?utf-8?B?RFVpQWZYQ0gzV3FXQzRERElsVEFjVEdDc0crMDhUZEhHNDUveEhPRW5EV20y?=
 =?utf-8?B?amV2WUltL1F3cTRTd29QNEpPalUzMUZra2RGSkZQSDdsVDJ2Z21TSVdSWERF?=
 =?utf-8?B?cG95SE05RWM4Yk5VRVNXQVRtVjFoMWczNUhRcVhnbmd5WkgxdkhIbWtzdDhr?=
 =?utf-8?B?N3AxZXdNa0t0Ri9Ja1hMMUw1N25kN1NXZW1QY0xUR1NUTEI4djBBako0d2Jj?=
 =?utf-8?B?cU8vQUdwRDEwNU9PV040UUFydWJWVjEzSHVUOUsvbXdQK2RndXRZZkJsNjk4?=
 =?utf-8?B?emVpazNYZzRoSlBnTVU1VVRFU3NtM3lJREdvVTlUVEZvdWdRN2hzVzN2OVFi?=
 =?utf-8?B?Ni91cXo1Y0VBcmQ0RW1yWXBsaC9rVE9qU0d1TVdmQURsdkRXd2k1YWtNTi81?=
 =?utf-8?B?OG9DdFM2WmhKbjJPMHdiYTVyV3dkVTBWY2trWVdIYmEraXEzZU5zTVZGVXVn?=
 =?utf-8?B?L0o2UnJsVk1wZW1rSHZ3UGFoNXhYTmJ1V2txejNYdHQyai9CajdaRmpxVlI2?=
 =?utf-8?B?VjNaekFsZk0vMVNYeGlHVE1maHVBcGprZDNzeFdzREphNm5LSmZoUVRwTmFE?=
 =?utf-8?B?TzNydWhCZWtzaVBnUVhEeHo4akFNcXhua2pES0VVQXBqVGkwanFxNTRkeFpJ?=
 =?utf-8?B?ZnJQZlkva2FMV3E5TTI4ZVhkT01WWVM4ZzBmS1NoQ0s0c2VwSmFIQ251cXdt?=
 =?utf-8?Q?NnpCN65n53N4dY9tTK+3aHewn?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bea5d4-9145-49a7-cb1f-08daadeb4e76
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsWpuQAFF5TTYENPkjHHZX5FCtvM92+/QmWGFldfe38WCyv1WZOl/+z2vo4uDDNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB2180
X-Warn: EHLO/HELO not verified: Remote host 40.107.94.59
 (mail-mw2nam10on2059.outbound.protection.outlook.com) incorrectly presented
 itself as NAM10-MW2-obe.outbound.protection.outlook.com
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

On 10/14/2022 9:45 AM, Stefan Metzmacher wrote:
> Hi Tom,
> 
>>> It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
>>> sk->sk_err is not changed to indicate an error.
>>
>> This is correct, because the TCP connection is in "half-closed" state.
>> The peer has closed, but the outgoing stream is still open. The TCP
>> protocol has supported this since forever.
>>
>> This is not a transitory state. The connection can remain in it forever.
>> The peer is now in FIN_WAIT_2 and will send no further data. It's
>> waiting for our FIN, and in turn the local socket is waiting for a
>> close() call to do so. But pretty much any other socket operation
>> can still be performed.
> 
> Thanks for the explanation!
> 
>>> It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
>>> hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns 
>>> -EAGAIN.
>>
>> Probably because the peer has stopped reading the socket. FIN_WAIT_2 is
>> a super-problematic state, because the only way to exit it is to receive
>> a FIN or RST, which we're evidently not sending. Most implementations
>> run a timer as failsafe, but it's always rather long (minutes).
> 
> Yes, we need 'socket options' with TCP_KEEPCNT, TCP_KEEPIDLE, 
> TCP_KEEPINTVL and/or TCP_USER_TIMEOUT
> and/or a user space timer in order to have lower timeouts.

That won't help. The peer is there, and the connection is up.
The keepalive will succeed! Even if it failed, it's not prompt,
and reducing the KEEPINTVL is a very bad idea. Servers should not
be pinging their clients in any event.

What peer is doing this? Most Windows clients will perform an
abortive close, but this one is doing it  gracefully. The
server should deal with either, of course, so I'm mostly just
curious.

Tom


> 
>>> And tcp_poll has this:
>>>
>>>          if (sk->sk_shutdown & RCV_SHUTDOWN)
>>>                  mask |= EPOLLIN | EPOLLRDNORM | EPOLLRDHUP;
>>>
>>> So we'll get EPOLLIN | EPOLLRDNORM | EPOLLRDHUP triggering 
>>> TEVENT_FD_READ
>>> and writev/sendmsg keep getting EAGAIN.
>>>
>>> metze
>>
>> I think the code needs to detect the half-close and give up. It's not
>> going to happen promptly any other way.
>>
>> I may have missed some other message - is a fix proposed?
> 
> It was in the next message:
> https://gitlab.com/samba-team/samba/-/merge_requests/2749
> 
> metze
> 
> 

