Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4761A5FEE76
	for <lists+samba-technical@lfdr.de>; Fri, 14 Oct 2022 15:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=osP3oVMGswsXApSPIuWgPMm2zII2Nlkup3D4qQOiPSA=; b=4Yo7sILY+3RpgEo2aqlVRIvobT
	BC+4F4JpFClb7UL1k3FDc3AHle3eIvHLxhfhcN9NdKAXC2lu3+iKUmHWlsoD2dkn3nEnQ8Y8asCQi
	+V5cTMEdTotswyr3ZRP07pK2FCok/uNJAV2U/47GmoRyhMVEfNzNJjRPhFyFLDbP9FexscRy/dQjG
	P+DG8QSL2KIKdWBDjeoNbQWrMRphTPIpSlqvH0w5Dmoz1Zbx43nOEYYsWrPzL+ojAmMyizxYADFmv
	senFRS+vLJ63LIpBxV8AA2sTKCRf/QwTc6vvwdsNicLF3RsEKyUoy94M8cAwJz8ceVsDVxkL1Kq5n
	yFVSYn4Q==;
Received: from ip6-localhost ([::1]:38138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ojKcY-00221e-9F; Fri, 14 Oct 2022 13:21:02 +0000
Received: from mail-dm6nam11on2043.outbound.protection.outlook.com
 ([40.107.223.43]:58081 helo=NAM11-DM6-obe.outbound.protection.outlook.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ojKcP-00221V-Gw
 for samba-technical@lists.samba.org; Fri, 14 Oct 2022 13:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c887nqbJ97PZGnZPNBgJf/st4Nx07fRAKj7N5u+6VP1ifX6u6xR2segYtonyiQTaTRU/OxSVrpNd3Mk+AdN359M65/Vn6Mwyrl6T8YSfwePDUlRZyQ4jG7WdwsJRxCTm0yOaKnl5cyjOpaT6zkBrKbfs1Unxzvg3KNBzYwfU5/llUmKy8kN3rHAZS7AORu7pWoACpcYKfoCa8QVfXgY/0jVlw9YsoQZTW8g39NReq3F9+m1iaYHsMKCzkvx0GhmlZeqzuaEpSafinek0DcFCww84x6BOS5rFDAQNIsTo10rRaKPPa+aPKQysTBt1RRPpshWJGSHoL9oz5V7L/Axwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osP3oVMGswsXApSPIuWgPMm2zII2Nlkup3D4qQOiPSA=;
 b=hfcbjkrP9TXqvVEXDt1hxObkuG/T65wB9KTqIF3Zg6BwdV/hyWeWzsmetHEkZ4TF1lYjON5yHW6ey0CBAtqYuOzlsyRK+nNHIqux5XfrogZgIQcE8dT3BhDmoPqVhffpfqlFqCBS2lEYtzwcFz4d8HATZbEMPPjtdCdgXTBaRgy9QEkaS/a1C9zsMen8ttYOTomCROc4GkeStuD92pTLlTXiG0N1XZuhUFT6wuVnrm08e+YCa5dHb3jJ0VYCk3HM5l5PBlrdFaN3XMWh/Y0W/2hs4a5hnQhGOVSliLQTS9prYaSkOEghmx/Wb2cgGse+Wgm9kdXpYvOAYIhfG7Hj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=talpey.com; dmarc=pass action=none header.from=talpey.com;
 dkim=pass header.d=talpey.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=talpey.com;
Received: from SN6PR01MB4445.prod.exchangelabs.com (2603:10b6:805:e2::33) by
 CO6PR01MB7483.prod.exchangelabs.com (2603:10b6:303:143::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Fri, 14 Oct 2022 13:20:27 +0000
Received: from SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef]) by SN6PR01MB4445.prod.exchangelabs.com
 ([fe80::454c:df56:b524:13ef%5]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 13:20:27 +0000
Message-ID: <46642e17-d7b9-187c-acc2-1fb9ccd09ffc@talpey.com>
Date: Fri, 14 Oct 2022 09:20:26 -0400
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
In-Reply-To: <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4445:EE_|CO6PR01MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: f812e66a-94c1-4219-6e85-08daade6dc3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: N/BqMCULcVQ7fXW5A55ClAYTIQxv2J7BhzHtL+XpFzT1R8hLqPaqhn0pZVWzP+exuvhtx2OFHCDCEvafSDleKAtwz5mgbkp83XSV0Qm7ad2LdOQ0/URw5I7SwJglDXqFXOIWDYx5K3/w+EFvhwJwX29RB0HjSOOnDtVnrUEhrk3p0GSOOjQwOhkbYzbvKCjZWS/E9rTGWHrKeryoWqOpN8k2zr9wnZSRGPvkDqIj5YddifgjA1s3JetGEcl0nhqGlVp9cLk/TIzfjNuvsCFophJURak49UrjkHI9wGpeiiSPg76UncYV4uJNxKfEReqSCehsgIfpRoumnJwmt0+lRCYdYiPZad5D7Hkrv6VPoH/Gni6qMAR8W5aIawbCVIOEW5FGKlttqYL1wNsR50Vn9Mb7yraISKM7fKhtq5kmdwxAQT0VKVA5YbtrlyYjht/Nyl1Z/CXRZ41rjBk0cniLkgH6BTZu7olK6vva5m7i3e5LD63tXhaNFQynbsqcTHe9DyIULJz+msMrgX8k+tiE0OWHhkI8rVsEfeX9cUDqrZ1tk2AGXgLLf7Ov4HhXfjN8N7LGqG0E8tjlrUUszyycpwxyzsG4/CGP05IefxdbikcqXC32O6t1DwSszUklksm4EjQXnC/Sxxu2jsxxxlM9WBpbYdjNPBObGKOuMBTiIH48xkODLWfk8YVTp02/rYF+EXxaQd5zF+QSnN6Oo6fyOz/YMjJiYGXqm+np1a0PsEC1Odii0ObCi+Tz0IL9zMTqOVG/Sa7sHLvCDMWnpsR4uXy6uccIbAIQcThTSMDLkShkNa9fVsnqniE7xRAGeQ5ff7X5Vx7cDHR6+DXlCrwg5w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTVGTnlidEtNRWxESUZYVmdxeUpoU2tWdnlZeUNMZGpqSXo0aEh5ZjU2djZJ?=
 =?utf-8?B?WEV5UzN5a2RHZGN3dWpGRlVReHlKQjlBbDNOSU45NWs3MTl5c1Z6cEYvZFBC?=
 =?utf-8?B?NjdoWW9oNWFJbEkrdTV3QXp5RS9sd1oyUkxlakp1T2hvNmg4YzlKSTc5Wm5K?=
 =?utf-8?B?OTA3Tm1wYzE5bFNTRzY2UUMwME1ia0FIeHRGbE1tc3dsVGRwdDl4empmWm10?=
 =?utf-8?B?NURpSzlyaGlDbktjM3ZzQzQzWFhGTzdnVDRrSlZhd2lwTUVsWVF0MForRGxu?=
 =?utf-8?B?TzlsaGJwT05Rc2R1Szk4TGFwWUQ1NDFGWTNRdld3Y05UUjRpWE9UTkNFOHpR?=
 =?utf-8?B?RWNhcmxwQzJLaTZEdXIxdlFad0lVVlJxUDQzUmpZUSsya1prekkxTDVjZEE1?=
 =?utf-8?B?d3ZNZXlqdy9TV3lYUnFvTk5HRWowazAvRXZZc2w2WTM1TUc5SkZFdTB0YUlm?=
 =?utf-8?B?SjY0Y2dwTWhGcTJXTjljVXUrbytaTGFna3VtR0ljRDViWHhIcGtEc0RWTXpt?=
 =?utf-8?B?UGNqK2x0UWhVNUprVytzbGRXMkpLeE9Hc2RpT3F3KzJWL21VNWcrOE1qNFYr?=
 =?utf-8?B?VnlJYStyelBXL3RDK2Z4RFpPWUFYc25wZTBPUlNGV3RHMGJoYmIrbElRZFE5?=
 =?utf-8?B?MUk3L2hScDBIL0daVldvNWNHZm5JUUJoRlJlejhTZW54dy9FQ0dSY3p2U2pJ?=
 =?utf-8?B?dXMrcjRRNUh4elRCWmhyQ1dJSCs2eWtyOVRzdWZ6UzhWZXJRTWFVUUl5cVhJ?=
 =?utf-8?B?SnpNckU5c1dUZ2NwVDNBWFloQU1sM2QxQUZjK0daeGczMHN4SEp2eER0WU9B?=
 =?utf-8?B?WHhZczhlRFBHelBzWit4b1FGb2M3M0UvRXpFaElZaUVtTDREeHYrUndvQUhY?=
 =?utf-8?B?am1lQnhzUjFMTlFQQVBGc2VwTFkrVllSa21LODRLdVVHS1VJeWswUEh0bWdX?=
 =?utf-8?B?TGt0S0RtM0VpZmxkZTFCTXpwWCtVTU91MXEvZGVHVzRnZ0U3amNVZVo4VHFL?=
 =?utf-8?B?RHhtUjMzejArWjRTUHJDU0RpSG5TRXRNZVVZVnU3N0lScXZBSVF4ZDFoV1Vu?=
 =?utf-8?B?WmFocEtsVDJEcFJXZFVCbDBXS21aSUxKUTNTS3gxOENkZVZ5V3FwMytlemJH?=
 =?utf-8?B?YmpycUEzNWVFRjBiWnJ3bTlFMFcrbmF0RC9ReXJDRlFLVWpuNFRMYWF5bFZq?=
 =?utf-8?B?cnBJaW5zdFN2d1F0VHc4SHQrNmFIVWwxTkk2dUhZc2g4K044dXY0bHVOKzlk?=
 =?utf-8?B?czNNSllBT2FQTFJjellIUDJ5Y3I0a0YySWVQcHA5Vk9tdERmZnVDQm9CdlZn?=
 =?utf-8?B?d1NUeXY3MFFCRVZNeC83V1lNanlJdUNQNjB4ZGNHdi9ET1hpR3I0QkdjUzVN?=
 =?utf-8?B?bTdwVFJpRlNidnZ1OHdnRWYzdTRuemkyQ0grVEc2bis0SExBTlc1K0pINUFX?=
 =?utf-8?B?czN6UzloWFZ3dTJBUFJ6SmozNjcvT3VYcWNKeDYyZzFxTXpMTnJxSWN2ZUs3?=
 =?utf-8?B?NThaVHhENHZyelZKWXozNlpTeXFYSitOQlltNHlHQXFoUmZyWW0weHBaYnp2?=
 =?utf-8?B?QXdET1k1QjZ6eWtvYXRmaWNhRzdSSTlBcVlGcmduaHp5NVphRjFYZzhZWVBK?=
 =?utf-8?B?NXRyUVlnZmNJWVR2MCtmOFRZSjV4RFVWZE5yUnpSam15dUsvOUhEeEprVDg3?=
 =?utf-8?B?My9oUG5yUnVxbk1EQzJxamE5M29FMDJkYmRjaUtzZFhPU2pSMFZtTDNUT1RX?=
 =?utf-8?B?cWRodnd4clJBSGhqdUpXYy95UUNMa0FvTml1ZncyUXJNbDFoNWpjdVR5cFFZ?=
 =?utf-8?B?aW13akNHK0RJR2NCUHhPVnRkWURYMFFmS1g0a3RZS3JPb0toaVg5VWMrUm5a?=
 =?utf-8?B?WXBQait2QzRSc2ovN2Q3UEdOampOOG1IR1FOQUpuOWVRUTFnOWJXeWpaUFNu?=
 =?utf-8?B?ZWdLQVdSOXZ4Z1c3K3FPR3BxaVl6Y0hmRlJ6TnNpM3pkWklFaDI4bGdzY1dI?=
 =?utf-8?B?Y3d2U0l2K1FsNXphM0YzdTYxZDBZSnBGUXlVbEdpV2NPWmN6cEpFdjIrNWdW?=
 =?utf-8?B?VE04c0tEcSt4Rlh5ZzhaV0c1aS85K3lqUTlFaTJPMGxadzU3NFVOdmVGdXY4?=
 =?utf-8?Q?RiYM=3D?=
X-OriginatorOrg: talpey.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f812e66a-94c1-4219-6e85-08daade6dc3c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4445.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2b2dcae7-2555-4add-bc80-48756da031d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKySZu5tjMN0UMRNGVfiv4tBVKQGY11g35Ld25Ke1jJsqAJed89rMXj0RdIVYETA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR01MB7483
X-Warn: EHLO/HELO not verified: Remote host 40.107.223.43
 (mail-dm6nam11on2043.outbound.protection.outlook.com) incorrectly presented
 itself as NAM11-DM6-obe.outbound.protection.outlook.com
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

On 10/13/2022 11:23 AM, Stefan Metzmacher via samba-technical wrote:
> Hi Andrew,
> 
>>> Ah, we register tstream_bsd_fde_handler() with
>>> TEVENT_FD_READ|TEVENT_FD_WRITE
>>> and have this logic:
>>>
>>> static void tstream_bsd_fde_handler(struct tevent_context *ev,
>>>                                       struct tevent_fd *fde,
>>>                                       uint16_t flags,
>>>                                       void *private_data)
>>> {
>>>           struct tstream_bsd *bsds =
>>> talloc_get_type_abort(private_data,
>>>                                      struct tstream_bsd);
>>>
>>>           if (flags & TEVENT_FD_WRITE) {
>>>                   bsds->writeable_handler(bsds->writeable_private);
>>>                   return;
>>>           }
>>>           if (flags & TEVENT_FD_READ) {
>>>                   if (!bsds->readable_handler) {
>>>                           if (bsds->writeable_handler) {
>>>
>>> =============> here we have the loop
>>>
>>
>> Awesome debugging!
> 
> 
> I created https://bugzilla.samba.org/show_bug.cgi?id=15202 for the problem.
> 
> And I understand what happens in the kernel...
> 
> tcp_fin() has this:
>          struct tcp_sock *tp = tcp_sk(sk);
> 
>          inet_csk_schedule_ack(sk);
> 
>          sk->sk_shutdown |= RCV_SHUTDOWN;
>          sock_set_flag(sk, SOCK_DONE);
> 
>          switch (sk->sk_state) {
>          case TCP_SYN_RECV:
>          case TCP_ESTABLISHED:
>                  /* Move to CLOSE_WAIT */
>                  tcp_set_state(sk, TCP_CLOSE_WAIT);
>                  inet_csk_enter_pingpong_mode(sk);
>                  break;
> 
> 
> It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
> sk->sk_err is not changed to indicate an error.

This is correct, because the TCP connection is in "half-closed" state.
The peer has closed, but the outgoing stream is still open. The TCP
protocol has supported this since forever.

This is not a transitory state. The connection can remain in it forever.
The peer is now in FIN_WAIT_2 and will send no further data. It's
waiting for our FIN, and in turn the local socket is waiting for a
close() call to do so. But pretty much any other socket operation
can still be performed.

> tcp_sendmsg_locked has this:
> ...
>          err = -EPIPE;
>      if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN))
>          goto do_error;
> 
>      while (msg_data_left(msg)) {
>          int copy = 0;
> 
>          skb = tcp_write_queue_tail(sk);
>          if (skb)
>              copy = size_goal - skb->len;
> 
>          if (copy <= 0 || !tcp_skb_can_collapse_to(skb)) {
>              bool first_skb;
> 
> new_segment:
>              if (!sk_stream_memory_free(sk))
>                  goto wait_for_space;
> 
> ...
> 
> wait_for_space:
>          set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
>          if (copied)
>              tcp_push(sk, flags & ~MSG_MORE, mss_now,
>                   TCP_NAGLE_PUSH, size_goal);
> 
>          err = sk_stream_wait_memory(sk, &timeo);
>          if (err != 0)
>              goto do_error;
> 
> It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
> hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns -EAGAIN.

Probably because the peer has stopped reading the socket. FIN_WAIT_2 is
a super-problematic state, because the only way to exit it is to receive
a FIN or RST, which we're evidently not sending. Most implementations
run a timer as failsafe, but it's always rather long (minutes).

> And tcp_poll has this:
> 
>          if (sk->sk_shutdown & RCV_SHUTDOWN)
>                  mask |= EPOLLIN | EPOLLRDNORM | EPOLLRDHUP;
> 
> So we'll get EPOLLIN | EPOLLRDNORM | EPOLLRDHUP triggering TEVENT_FD_READ
> and writev/sendmsg keep getting EAGAIN.
> 
> metze

I think the code needs to detect the half-close and give up. It's not
going to happen promptly any other way.

I may have missed some other message - is a fix proposed?

Tom.


> 
> 
>>>                                   bsds->writeable_handler(bsds-
>>>> writeable_private);
>>>                                   return;
>>>                           }
>>>                           TEVENT_FD_NOT_READABLE(bsds->fde);
>>>                           return;
>>>                   }
>>>                   bsds->readable_handler(bsds->readable_private);
>>>                   return;
>>>           }
>>> }
>>>
>>> We call the writeable handler (which is non-blocking) when we get
>>> TEVENT_FD_READ
>>> because we assume it will get an error if TEVENT_FD_READ was
>>> generated by
>>> EPOLLERR. I think moving TEVENT_FD_NOT_READABLE(bsds->fde); before
>>> if (bsds->writeable_handler) would make sure we only try that path
>>> once
>>> and not many times in a busy loop.
>>
>> How would we then, in this case, detect that the socket is closed?
>>
>> While we would start processing other connections, wouldn't we change
>> to a not-busy wait never closing the socket as there is still data to
>> send but never getting to read the EOF?
>>
>> How can we proceed to closing the socket?
>>
>>> And in ldapsrv_call_writev_start() we may want to use
>>> tevent_req_set_endtime() on
>>> the subreq of tstream_writev_queue_send(), so that
>>> ldapsrv_call_writev_done()
>>> will get ETIMEDOUT from tstream_writev_queue_recv() and call
>>> ldapsrv_terminate_connection().
>>
>> Do we have a good precedent for what the send timeout should be?
>>
>> I can't see any good examples elsewhere in the code sadly.
>>
>> One option is to reuse the search timeout, so that a query could at
>> most take 240sec, eg 2x 120sec, once for the search itself and once to
>> send over the network.  This would give only one knob to change (which
>> is good and bad).
>>
>> In the meantime I'm going to try and mock this up in a self-contained
>> cmocka test.
>>
>> Andrew Bartlett
> 
> 
> 

