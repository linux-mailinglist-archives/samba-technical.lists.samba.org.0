Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B191E5F0B37
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 14:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=so2nUJVv2fNA8JjrjkBSPrg6bJ1tMmIqhrZIaMu6s2E=; b=AxZvgsDrTTYJTr4rrHp8fIwRvT
	y7fH+uavfS6wGU5Q/IleJsIVLU/18G4gzeTng2h5mRrFwq7XOP7+XjQ/vB4vEY5LSJ9F3+Y89D3J2
	qPFxtK2O6FNX4n1yYQcPGwXZLxldwS2T/jzhuFCJe3OiFRdew/KCpd/4di9+g2rLs+2UwerMprD5q
	1JF55SZqeyHF44Zs9080lipEh/9tPyKQwUwT01uquEZX38ZmUxvrntFgMr282+NZ8UygRKVlCQFA6
	NJRmLzaMKKZp3ibr/bcn/5HZeQdPAbOnsTdhAbdtThSwfJDnolhSBUCAnukD3aNCkM/QE/YuKOO7L
	fyM+Rw3A==;
Received: from ip6-localhost ([::1]:30884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeEh8-0053dO-9J; Fri, 30 Sep 2022 12:00:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeEh2-0053bz-E6
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 12:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=so2nUJVv2fNA8JjrjkBSPrg6bJ1tMmIqhrZIaMu6s2E=; b=Dp8u2Y4vROUr14lgm5lJCaK6HE
 HjuQ31V/ryB+mv/HO1loZP7xN5uj5uk1VnN9URy0C32qYdvXhZcQjSTaxcqzXGeWt5GYIeF5/jkxC
 FAo+MfqH972pHc+YRhqd0HM4Qadx1zdO/A0CYwgNpR31P37cKLp3Y9bKWJrnei9mBG1FWCWsnZErz
 /gErXwO29IfMXsgbdZhab8Hlp1XRxDA4n78fzOlngL368xuGT1/lbz7rwNrTCfdIAidzyd2F9rRKX
 w90+/ymChG0+dsIAb2bHnrJzN8MrqPPp+kCI3OerW8QmzQVotvttXFJpJIWFIrHCMiBwiMojJDZw/
 6JNEUx6NB7PKXQ0QjklybDMFX4/tpwHDCj0pU4kmOmei2MFE9ij1O1W6GkIlfDxtKWmRL1uz63oqV
 f/vngL198cvUETYTVGMyxg02fVPvTn+6tgVe9yKVzfNTQAJNYnZSiix6VblqxNu/8wsG/+NPrtBe1
 gSsH3grWOk2d2FQ2TumbgHtR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oeEgv-002UXB-9Q; Fri, 30 Sep 2022 12:00:30 +0000
Message-ID: <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
Date: Fri, 30 Sep 2022 14:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Isaac Boukris <iboukris@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 30.09.22 um 13:31 schrieb ronnie sahlberg via samba-technical:
> On Fri, 30 Sept 2022 at 21:12, Isaac Boukris via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-technical
>> wrote:
>>> I've been trying to chase down the CPU spins reported by our users in
>>> the writev() codepath from our LDAP server.
>>>
>>> A private mail the the strace output shows the sockets are in
>>> CLOSE_WAIT state, returning EAGAIN over and over (after a call to
>>> epoll() each time).  That alone would be enough to keep things
>>> spinning.
>>>
>>> But they are being shut down, however our LDAP server won't be
>>> triggering a read any time soon, it is waiting to flush the response
>>> out.
>>
>> Why wouldn't it? I mean why does the read waits for the write? if epoll
>> says so then we should read, then we may detect that the client closed
>> it end and may decide to give up the writes.
>>
>> Technically, I think there is no problem to write to a socket after the
>> peer sent us FIN,
> 
> I think possibly the problem is that IF the tcp tx buffer is full, you
> might get -EAGAIN instead of a better error
> if the socket is only half-closed.

The question is why does epoll report EPOLLOUT in that case.
If we don't get that and get EPOLLERR|EPOLLHUP we should
disable reporting unless TEVENT_FD_READ is requested.

See epoll_event_loop() and epoll_handle_hup_or_err().

metze

