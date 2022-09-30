Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860C5F0B91
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 14:19:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zin/IAlMn5ZkpxltWrzYV0UndYb/MoOyRU3Z/WNe2AY=; b=O5kF1W2j0hQo62pkzvd+K5KAQL
	ykxhVDY9OCDBw3kcKauUP218AtyiRdlf8ZxKxaV6tWYGsODiNjov34eh1Cs5xdOAdqZvO1PMSz0+Y
	qwseBDYJBCV3dS3bj4o9K0DkauW2gjvjKsXF7D58ZgJCY1YriSKKbl/j3iglrgHvRRvptAHExTj89
	Hi7ytgibd2e5cvT6nAI/amydn67fuNDexsj6kD8aCj093cw0NKNBi/JzQo2rh2lTVBds0mhFv8WfF
	D6H46gOUC2+fYscCRRTomwV3yzA1E/IkYd7ZMmoQei1VJTOtnRurLuter+4AyGbiScSBJY4yWSDRW
	+n4+qn/Q==;
Received: from ip6-localhost ([::1]:48394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeEyW-0055Rz-5p; Fri, 30 Sep 2022 12:18:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeEyR-0055Rq-MH
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 12:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=zin/IAlMn5ZkpxltWrzYV0UndYb/MoOyRU3Z/WNe2AY=; b=Gw2SfgEknjaTSHNoCc4Bd6LTif
 klffZvbfSFsLB+NUv42lOZf5MYMsMsj+XuWbBmjM3PmCe422NIoN7MPPqhZSL3IYRpNK08oNBgoHO
 ckJB8R1S1xX0BMpHrvVCNQbDkfz+r0+cEYctDbV5hx4SsmOtkbLi+3+hvZ5wLBn8thGuw/j944BKf
 i1BVewrLRdc45GYNGavctj/QECfAvRgEID/SsalS6YeCYCQnqB7RxzJr2MsmgJm6k8tepaWxiikDN
 fDcbnsvLUifsT5Q9uFDcx2H1Uo4IL3Ms/mK1m9lFF62Ov7rXp8Guhbso8MzZuixInZZzSJKefQ1UT
 vjKq452Yp/qfatAUTv6NBt0KmSRqcJnJ3x/JJJE9HJZis24pdWyMSEGHP5NjHBtfyBB2PJwiwwaFV
 qPx2MTxxLp9foqn4Kht9rFZR5hGka83cXV2/vETjxRFPfWe7rh1l4bW6Up6QbwxOe46ObxB+LNpXo
 6dUD3I1PFEUEzKyFVTzo9DkN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oeEyP-002UyJ-EO; Fri, 30 Sep 2022 12:18:33 +0000
Message-ID: <54c46768-ff78-f9ed-fab5-da20d79ce31e@samba.org>
Date: Fri, 30 Sep 2022 14:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Isaac Boukris <iboukris@samba.org>
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <0fdfd28f916f5260e99c7b6463eb37080e129fa6.camel@samba.org>
 <CAN05THTFo3rKAahxaK9U44NO8K4YNROFUmHS3WyQ7QqwXeeZFw@mail.gmail.com>
 <4f5684e9-81b3-f602-d5f5-f2ed3e312b03@samba.org>
 <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
In-Reply-To: <bfbb1347-be6e-a7c8-497a-f8a08248cdc0@samba.org>
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

Am 30.09.22 um 14:05 schrieb Stefan Metzmacher via samba-technical:
> Am 30.09.22 um 14:00 schrieb Stefan Metzmacher via samba-technical:
>> Am 30.09.22 um 13:31 schrieb ronnie sahlberg via samba-technical:
>>> On Fri, 30 Sept 2022 at 21:12, Isaac Boukris via samba-technical
>>> <samba-technical@lists.samba.org> wrote:
>>>>
>>>> On Fri, 2022-09-30 at 14:26 +1300, Andrew Bartlett via samba-technical
>>>> wrote:
>>>>> I've been trying to chase down the CPU spins reported by our users in
>>>>> the writev() codepath from our LDAP server.
>>>>>
>>>>> A private mail the the strace output shows the sockets are in
>>>>> CLOSE_WAIT state, returning EAGAIN over and over (after a call to
>>>>> epoll() each time).  That alone would be enough to keep things
>>>>> spinning.
>>>>>
>>>>> But they are being shut down, however our LDAP server won't be
>>>>> triggering a read any time soon, it is waiting to flush the response
>>>>> out.
>>>>
>>>> Why wouldn't it? I mean why does the read waits for the write? if epoll
>>>> says so then we should read, then we may detect that the client closed
>>>> it end and may decide to give up the writes.
>>>>
>>>> Technically, I think there is no problem to write to a socket after the
>>>> peer sent us FIN,
>>>
>>> I think possibly the problem is that IF the tcp tx buffer is full, you
>>> might get -EAGAIN instead of a better error
>>> if the socket is only half-closed.
>>
>> The question is why does epoll report EPOLLOUT in that case.
>> If we don't get that and get EPOLLERR|EPOLLHUP we should
>> disable reporting unless TEVENT_FD_READ is requested.
>>
>> See epoll_event_loop() and epoll_handle_hup_or_err().
> 
> Is this plain tcp or via tls?

Ah, we register tstream_bsd_fde_handler() with TEVENT_FD_READ|TEVENT_FD_WRITE
and have this logic:

static void tstream_bsd_fde_handler(struct tevent_context *ev,
                                     struct tevent_fd *fde,
                                     uint16_t flags,
                                     void *private_data)
{
         struct tstream_bsd *bsds = talloc_get_type_abort(private_data,
                                    struct tstream_bsd);

         if (flags & TEVENT_FD_WRITE) {
                 bsds->writeable_handler(bsds->writeable_private);
                 return;
         }
         if (flags & TEVENT_FD_READ) {
                 if (!bsds->readable_handler) {
                         if (bsds->writeable_handler) {

=============> here we have the loop

                                 bsds->writeable_handler(bsds->writeable_private);
                                 return;
                         }
                         TEVENT_FD_NOT_READABLE(bsds->fde);
                         return;
                 }
                 bsds->readable_handler(bsds->readable_private);
                 return;
         }
}

We call the writeable handler (which is non-blocking) when we get TEVENT_FD_READ
because we assume it will get an error if TEVENT_FD_READ was generated by
EPOLLERR. I think moving TEVENT_FD_NOT_READABLE(bsds->fde); before
if (bsds->writeable_handler) would make sure we only try that path once
and not many times in a busy loop.

And in ldapsrv_call_writev_start() we may want to use tevent_req_set_endtime() on
the subreq of tstream_writev_queue_send(), so that ldapsrv_call_writev_done()
will get ETIMEDOUT from tstream_writev_queue_recv() and call ldapsrv_terminate_connection().

metze


