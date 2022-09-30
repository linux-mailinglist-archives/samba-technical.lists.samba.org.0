Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5F5F0B44
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 14:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tiKhX0IUN56SlsBq5PEAg821Y7a4jDmYOMDQH/D+C5o=; b=dE/I8ihzn3LXNFwPqjT3Uxkr1m
	Fr8YqFTkkGUj1wT2bKdm6/4qjdXTR+oS+sR1izqSnHqVrRhWGRrYKM6C9kbdnURWYUmmb9xQFNduL
	8X01VISycnoGcPiA7/fousEGfzeeXtDwYu3OXNXb1GxWd8W/YESJIc2ZB/6/pKaX6RMr6LiRzlV/q
	89qGIZEfr4W3OioVHaRghGk4gM5Ob58e7gCkTRyLbMc3hU7U/BMIy1TLrY4+v80O3LopfKM9rQekl
	ddD9GqESTTnJG0xWXdmgnJxYxAQvlhTAKvQNHyK0HgbpomPfEP6xxWUvVctKNDuUk64xEy2WxEKqk
	B33z3VtQ==;
Received: from ip6-localhost ([::1]:52308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeEm2-0054jq-RO; Fri, 30 Sep 2022 12:05:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48846) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeElx-0054jg-H2
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 12:05:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=tiKhX0IUN56SlsBq5PEAg821Y7a4jDmYOMDQH/D+C5o=; b=q1/KEE1T4ZRHAXs1KN0Adhr/en
 /nVABid0GRH/eUDa33UL2qLG4F0WtMWCJ7tDDKTwhI4WBVKQYw+XSrJ7ftwLmPahtP6+BspIZgMml
 BzVtQI+dUzWYy9sBvZDwyRm9RiVlSTJF/3SqcPhM0W9G3FaVyak3sex+dzUTuyp2liLV7RQKBPVKP
 hr6P0M8zEgT/coBhh+Ro9VknNb7i+TM5gSrUt50Tqjjg0pzUZ9osqtkCWjfFqbI5xCFipXt9a7gMS
 O6NljbRi2GZ0WDrI1rSEZsrSpUp6kp+xdbWBlF+OGVrAraCM4UsmpWIcW1ajMx2fxtzeb2AZlj87x
 vqSfYyWUrINFDntFeJFrfBM7xZQlELwniu5q3FiHgS2iI2pScjn3xb+adxaZ1uljnS0rZaUCRD0nt
 amEpgMqlO7BVRlX3CZxSEiwL9RTmqoaAy3/mqgJyAbU4Y5bxQQ/6eRO9FbzvfoTTkie+n88kkcNZ4
 GzKRLB9kmB37tlsDrSLjaqSV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oeElv-002UcY-VV; Fri, 30 Sep 2022 12:05:40 +0000
Message-ID: <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
Date: Fri, 30 Sep 2022 14:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
Content-Language: en-US
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Isaac Boukris <iboukris@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
In-Reply-To: <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 30.09.22 um 14:00 schrieb Stefan Metzmacher via samba-technical:
> Am 30.09.22 um 13:31 schrieb ronnie sahlberg via samba-technical:
>> On Fri, 30 Sept 2022 at 21:12, Isaac Boukris via samba-technical
>> <samba-technical@lists.samba.org> wrote:
>>>
>>> On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-technical
>>> wrote:
>>>> I've been trying to chase down the CPU spins reported by our users in
>>>> the writev() codepath from our LDAP server.
>>>>
>>>> A private mail the the strace output shows the sockets are in
>>>> CLOSE_WAIT state, returning EAGAIN over and over (after a call to
>>>> epoll() each time).  That alone would be enough to keep things
>>>> spinning.
>>>>
>>>> But they are being shut down, however our LDAP server won't be
>>>> triggering a read any time soon, it is waiting to flush the response
>>>> out.
>>>
>>> Why wouldn't it? I mean why does the read waits for the write? if epoll
>>> says so then we should read, then we may detect that the client closed
>>> it end and may decide to give up the writes.
>>>
>>> Technically, I think there is no problem to write to a socket after the
>>> peer sent us FIN,
>>
>> I think possibly the problem is that IF the tcp tx buffer is full, you
>> might get -EAGAIN instead of a better error
>> if the socket is only half-closed.
> 
> The question is why does epoll report EPOLLOUT in that case.
> If we don't get that and get EPOLLERR|EPOLLHUP we should
> disable reporting unless TEVENT_FD_READ is requested.
> 
> See epoll_event_loop() and epoll_handle_hup_or_err().

Is this plain tcp or via tls?

metze


