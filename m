Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5175FDD1A
	for <lists+samba-technical@lfdr.de>; Thu, 13 Oct 2022 17:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MqNULQAwKFFnO+2ZcbX2Lxpk4IWGQUP+XxkVoou8oMo=; b=ZF41thH8MEy2wM8fKxjmTFs45y
	oL7/HvNDlmmcmg/YxUu83EXTGSIlPZxN1llAdINxSXGjSfyQ24eH41JgKatuwG6yrOpjOgAFx5Nuq
	9Z6pqYTDv+kSF6ENuMWMuKEgobsz/m7cYsLrIwdkThDegrvuQA/d09ef/fZ3e6M2VqQB2w8PduoMV
	PtwWrdxrJ0GzcrIfGLH11Ti+QmnhLxtZ7cXYBwBqBVHKMDYypb8Ffbz5ASaMXIHQC6aMNi9xHk//c
	V3MReK87ExDR5MsPoKr+8JyVKs5x0znPSz7oRp7IQPP/lTM8x98YyeqGQu0JIA2gQtjRl7tXRaQZe
	opffwWWQ==;
Received: from ip6-localhost ([::1]:20776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oj03Y-001vAn-RP; Thu, 13 Oct 2022 15:23:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oj03R-001vAL-5o
 for samba-technical@lists.samba.org; Thu, 13 Oct 2022 15:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MqNULQAwKFFnO+2ZcbX2Lxpk4IWGQUP+XxkVoou8oMo=; b=kIrluOdLoULmZ0wqqbdG/oR9bz
 dU0vIFcpWkmI0vUkANwjQQooLqsNGlJgIZV5iU5k+lSmx8AHqvTg4UDBfdA7ZO2IbGFpoYaDPxYaL
 8rHTpVhpuJWe7m6YSAGMKq4R80muCAB/YYVQgKo9vjepgOyO1+ra7Z8VS3+6MF8mtUdo5Urk039He
 ij3YGsRJv4vvVNcbRx6arGr47XRaCFa7HuBNmaBtOP3N2TR1VLXjCBRPwNRA+IdIiLfJo9O4zUL3q
 0qylvs3/v1EN/918dXI58WuU+4/IvlTVKTcCGB9qC1mi7pKl8X5I2QbxgAuYs7k0QMBkKpaAW2610
 X5VH4iGrR7c+YOVqMwqmqq/Ghthi7ts8MRseX72FzgXtcvd2f2KNE7Cyrkz8XCOYRKIkW6fe3zfSR
 gDLK95gntDb3fzaLnumiWF5xxkEhq/jO3vE1wz3MPvLvkdS8xEsW8ikZOuxUcL1pMvYZ7IHkETJda
 lAT2qtGgjTlr1DYUlmgnEtPo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oj03H-0047QF-MA; Thu, 13 Oct 2022 15:23:15 +0000
Message-ID: <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
Date: Thu, 13 Oct 2022 17:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Andrew Bartlett <abartlet@samba.org>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Isaac Boukris <iboukris@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
 <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
Content-Language: en-US
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

>> Ah, we register tstream_bsd_fde_handler() with
>> TEVENT_FD_READ|TEVENT_FD_WRITE
>> and have this logic:
>>
>> static void tstream_bsd_fde_handler(struct tevent_context *ev,
>>                                       struct tevent_fd *fde,
>>                                       uint16_t flags,
>>                                       void *private_data)
>> {
>>           struct tstream_bsd *bsds =
>> talloc_get_type_abort(private_data,
>>                                      struct tstream_bsd);
>>
>>           if (flags & TEVENT_FD_WRITE) {
>>                   bsds->writeable_handler(bsds->writeable_private);
>>                   return;
>>           }
>>           if (flags & TEVENT_FD_READ) {
>>                   if (!bsds->readable_handler) {
>>                           if (bsds->writeable_handler) {
>>
>> =============> here we have the loop
>>
> 
> Awesome debugging!


I created https://bugzilla.samba.org/show_bug.cgi?id=15202 for the problem.

And I understand what happens in the kernel...

tcp_fin() has this:
         struct tcp_sock *tp = tcp_sk(sk);

         inet_csk_schedule_ack(sk);

         sk->sk_shutdown |= RCV_SHUTDOWN;
         sock_set_flag(sk, SOCK_DONE);

         switch (sk->sk_state) {
         case TCP_SYN_RECV:
         case TCP_ESTABLISHED:
                 /* Move to CLOSE_WAIT */
                 tcp_set_state(sk, TCP_CLOSE_WAIT);
                 inet_csk_enter_pingpong_mode(sk);
                 break;


It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
sk->sk_err is not changed to indicate an error.

tcp_sendmsg_locked has this:
...
         err = -EPIPE;
	if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN))
		goto do_error;

	while (msg_data_left(msg)) {
		int copy = 0;

		skb = tcp_write_queue_tail(sk);
		if (skb)
			copy = size_goal - skb->len;

		if (copy <= 0 || !tcp_skb_can_collapse_to(skb)) {
			bool first_skb;

new_segment:
			if (!sk_stream_memory_free(sk))
				goto wait_for_space;

...

wait_for_space:
		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
		if (copied)
			tcp_push(sk, flags & ~MSG_MORE, mss_now,
				 TCP_NAGLE_PUSH, size_goal);

		err = sk_stream_wait_memory(sk, &timeo);
		if (err != 0)
			goto do_error;

It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns -EAGAIN.

And tcp_poll has this:

         if (sk->sk_shutdown & RCV_SHUTDOWN)
                 mask |= EPOLLIN | EPOLLRDNORM | EPOLLRDHUP;

So we'll get EPOLLIN | EPOLLRDNORM | EPOLLRDHUP triggering TEVENT_FD_READ
and writev/sendmsg keep getting EAGAIN.

metze


>>                                   bsds->writeable_handler(bsds-
>>> writeable_private);
>>                                   return;
>>                           }
>>                           TEVENT_FD_NOT_READABLE(bsds->fde);
>>                           return;
>>                   }
>>                   bsds->readable_handler(bsds->readable_private);
>>                   return;
>>           }
>> }
>>
>> We call the writeable handler (which is non-blocking) when we get
>> TEVENT_FD_READ
>> because we assume it will get an error if TEVENT_FD_READ was
>> generated by
>> EPOLLERR. I think moving TEVENT_FD_NOT_READABLE(bsds->fde); before
>> if (bsds->writeable_handler) would make sure we only try that path
>> once
>> and not many times in a busy loop.
> 
> How would we then, in this case, detect that the socket is closed?
> 
> While we would start processing other connections, wouldn't we change
> to a not-busy wait never closing the socket as there is still data to
> send but never getting to read the EOF?
> 
> How can we proceed to closing the socket?
> 
>> And in ldapsrv_call_writev_start() we may want to use
>> tevent_req_set_endtime() on
>> the subreq of tstream_writev_queue_send(), so that
>> ldapsrv_call_writev_done()
>> will get ETIMEDOUT from tstream_writev_queue_recv() and call
>> ldapsrv_terminate_connection().
> 
> Do we have a good precedent for what the send timeout should be?
> 
> I can't see any good examples elsewhere in the code sadly.
> 
> One option is to reuse the search timeout, so that a query could at
> most take 240sec, eg 2x 120sec, once for the search itself and once to
> send over the network.  This would give only one knob to change (which
> is good and bad).
> 
> In the meantime I'm going to try and mock this up in a self-contained
> cmocka test.
> 
> Andrew Bartlett


