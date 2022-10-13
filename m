Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BE5FDE2A
	for <lists+samba-technical@lfdr.de>; Thu, 13 Oct 2022 18:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=EtXxGSDMZfUvRdgzdGnQH5XdD/KwC5qpacfJ2ZY8T6c=; b=FCAmPf8yWWzAfkR7MmDblR7jPu
	eVr0sfQ7rCCY5NXB/qy1a/tMwdofhXspRNQrpkWmgj1tWW8mq8wkQvoqAJsCkhhdJKuIj9BoT46ZB
	oY3ajnjp5snfZbmTl5SJFL+2aHZMV5Lo8SeitaHvYKDaHf/fOAeK1rQBmOmAMv+s3A2/Z0EvQmeJn
	CrkB3GMeoObE6gqa77oAr4/0BvLYIiEhACguinxjkviyXuunDDIAbIVphGQ2b0ywF7kzJ5Se16HDN
	NYdKE4gg5SQwXWwQKRemE43j5Fte0W64Sg5Q1/gZadV9Evwj1ZfNvZxC3wS2GTM2/iXmkTSTjWQIc
	aoFkgWaw==;
Received: from ip6-localhost ([::1]:34706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oj0xK-001y6G-Tx; Thu, 13 Oct 2022 16:21:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oj0xE-001y67-Vl
 for samba-technical@lists.samba.org; Thu, 13 Oct 2022 16:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=EtXxGSDMZfUvRdgzdGnQH5XdD/KwC5qpacfJ2ZY8T6c=; b=bExyRkzDExdB5Xo44bKfHoAhAS
 KqV5f0oxJAf9VQF8Pf1sjfexsy9hhHwLpDya0Aeh1+KTzi2YnXFqm23JEr8U2VG+SSF7U7ihTmHJT
 f9b7jC8xWh7V44MDHcFl4BR/86C0N+3JbofbQ+yPvjrVgR64SlusgU63upuKTqAz76v2gmyiXqrWU
 8DPAV9U9icATPZSztp8/m6x4vAWd2nQ3b14U8rK+J7Ll8rqApcgM2pEobHjiQRknvNhBhLSU/4yO5
 a4gvpCn+OFcm+wfDJjgc7Kqfuf4CXck/uT/XsO8jpQC1cY72edl8BzPT7ywUSqmQX/xxX1E2VGeye
 ef87Hy/x60oicUIqz+IdjQiWelA2Za4x52fdcEZk5Hszs1JFOiZbQPYPstpnopRwR7Zb7x6cFMBr9
 bhXho8wqKNRIAgdyCsDcGQzi6KYAMZlwuiFjEGaWaKzYeCa5KHOczH4LFXp+yvn/JhjLMsdp3K37D
 nsK7I4nufKhbnd0qGKqDbYru;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oj0xD-0047ni-MB; Thu, 13 Oct 2022 16:21:03 +0000
Message-ID: <7afae9df-4750-3d83-ead9-f63b049bb372@samba.org>
Date: Thu, 13 Oct 2022 18:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US, de-DE
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
 <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <35d239c7-86c6-dccd-815f-0a4c771204c3@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 13.10.22 um 17:23 schrieb Stefan Metzmacher via samba-technical:
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

And here's a merge request that tries to fix it

I haven't done any runtime testing with it...


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

The first time we get TEVENT_FD_READ with just a writeable handler,
we'll use poll() in order to detect POLLRDHUP which indicates
we're in CLOSE_WAIT state and map it to ECONNRESET.

Other than that we just wait for the kernel to detect the fully broken
connection, which may take a while. This can be altered via
the 'socket options' option in smb.conf setting
TCP_KEEPCNT, TCP_KEEPIDLE, TCP_KEEPINTVL and/or TCP_USER_TIMEOUT
(or changing the kernel defaults.

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

I used the idle timeout (which is the closed logical match)
which is 900s.

>> In the meantime I'm going to try and mock this up in a self-contained
>> cmocka test.

reading unix_poll() from the Linux kernel, shutdown() on the client
might be able to reproduce this (hopefully) with and without socket_wrapper.

Are you able to test this, even if it's just by hand?

metze

