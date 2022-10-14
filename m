Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F95FEEE4
	for <lists+samba-technical@lfdr.de>; Fri, 14 Oct 2022 15:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sgTXsH3qYSH2jkOeAJ896D9ikcwJkxTjJY87EQUYUxM=; b=wVkpIIWfcWR/t+8yTr/esKY6xj
	W/J6J3CY/VCCKMLIcbp5N+xME8DuUIjrKt3+rFsmhlaXvwkFnU9ZtngBmCJWemxguOkkxZPh4UjFK
	O3gPUKQnGbPkfCtkFHn4yJNgi0rLSDNtcYCFowz9dCdvgPnaNPHoF/QIhbkNx3vmiQZXOQy21P/DM
	VQFANaHD0oGbzBtYmN9OnIckUNx5M8ZEMj/54JsSe0EK62MKDBioZfCUhmmA4ky8wRseokRaxTnRR
	zSOW58xbQMtDczmOTHRbDcL9oYe8rBNy/Hhcu8qVfbkGZDf8fxURqkVQfFbj3idHftSZJ+Ag8uvxM
	mtPfCNcw==;
Received: from ip6-localhost ([::1]:34204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ojL0i-0022OD-V9; Fri, 14 Oct 2022 13:46:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ojL0d-0022O3-Jn
 for samba-technical@lists.samba.org; Fri, 14 Oct 2022 13:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=sgTXsH3qYSH2jkOeAJ896D9ikcwJkxTjJY87EQUYUxM=; b=qyn5GE56cjPch+8z9V8P8R2mtd
 frsRqtHiSbL8x5COzHXQR0fkgySC5/lfi3WUpg6MTCGZarrl2yGaji3aXncMFKufx2ifIW2Fuaw8a
 bll0VeXKL3URAW24/S4TfHeWE+kp2A//ayCoqjf2/ydWh0ClVdNEvaU0xQz9T1DgPWis6Xxczsyzl
 NMQ0HHS0zyh+m8hxWT4Zc5e2YJMPLrqKOBPravemZsAUxwfvRy0mhyPwpksFtEB3LCCa2IL1HCh5q
 2r2FCWeq0mhWRYFDIyEG/nphYnzA1S/5sUs1UjIyP4+yURgp3VYTAwh6VTA4vv1mBdYF4l6c4vxi1
 GtPkO17XJL0MjnSxerGqj1P4YwpbCAb8tMQRXqAcz1onKx2jWlRDS2V5OVOP5ItJKrQVWc4+8BFIS
 mR6nxy57wiEyi76EBu3Kir4sm04D3zLEVUejV3Io+6ZvmWx46LoDtWqVYbWMRv/LvFEc/wL3py37k
 YxhulS9z47sYBO26UI1M9DK6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ojL0b-004F9A-Tp; Fri, 14 Oct 2022 13:45:53 +0000
Message-ID: <ace9ff7a-bdb3-d2e0-deb0-944a44ce7266@samba.org>
Date: Fri, 14 Oct 2022 15:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Tom Talpey <tom@talpey.com>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
 <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
 <724a820463e6b68137a06d4c8b6ae962c236aa81.camel@samba.org>
 <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
 <46642e17-d7b9-187c-acc2-1fb9ccd09ffc@talpey.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <46642e17-d7b9-187c-acc2-1fb9ccd09ffc@talpey.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Tom,

>> It means RCV_SHUTDOWN gets set as well as TCP_CLOSE_WAIT, but
>> sk->sk_err is not changed to indicate an error.
> 
> This is correct, because the TCP connection is in "half-closed" state.
> The peer has closed, but the outgoing stream is still open. The TCP
> protocol has supported this since forever.
> 
> This is not a transitory state. The connection can remain in it forever.
> The peer is now in FIN_WAIT_2 and will send no further data. It's
> waiting for our FIN, and in turn the local socket is waiting for a
> close() call to do so. But pretty much any other socket operation
> can still be performed.

Thanks for the explanation!

>> It means if (sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)) doesn't
>> hit as we only have RCV_SHUTDOWN and sk_stream_wait_memory returns -EAGAIN.
> 
> Probably because the peer has stopped reading the socket. FIN_WAIT_2 is
> a super-problematic state, because the only way to exit it is to receive
> a FIN or RST, which we're evidently not sending. Most implementations
> run a timer as failsafe, but it's always rather long (minutes).

Yes, we need 'socket options' with TCP_KEEPCNT, TCP_KEEPIDLE, TCP_KEEPINTVL and/or TCP_USER_TIMEOUT
and/or a user space timer in order to have lower timeouts.

>> And tcp_poll has this:
>>
>>          if (sk->sk_shutdown & RCV_SHUTDOWN)
>>                  mask |= EPOLLIN | EPOLLRDNORM | EPOLLRDHUP;
>>
>> So we'll get EPOLLIN | EPOLLRDNORM | EPOLLRDHUP triggering TEVENT_FD_READ
>> and writev/sendmsg keep getting EAGAIN.
>>
>> metze
> 
> I think the code needs to detect the half-close and give up. It's not
> going to happen promptly any other way.
> 
> I may have missed some other message - is a fix proposed?

It was in the next message:
https://gitlab.com/samba-team/samba/-/merge_requests/2749

metze


