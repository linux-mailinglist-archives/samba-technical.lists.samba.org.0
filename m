Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D790660F1D6
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 10:06:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=m64w1HcU9dsDgFQU/Xkj10uzhFy/KO82gKYfDQPiwvs=; b=HMUv6Jxr99ZZSgHWkW7mekcwbg
	RyviE29DLsHJbsxT0KQYL249DfJNfLK/IQmbZH5LPc7oP3R875xvTzub0T0ppwVoh/EEcGCV63gXe
	rvWWIdVyAoA6xAAW6oUdjUKo6bR4gfH94cevO1aDe5OTjllOw6XlDrlI5+MfDsjbSeObBIfaruKu0
	7w2V0JNQ4KphJPwQjyICbEBTXSTVOd79NvmkKtV0K84n2AplL4cpWyhj9vf5xv/CkU8Fqp/jlrjop
	0VilPXSSdJ2vO5k/qb27TFoMkZIJLxlj6oT/F7rhYBaCQvl9zo9oCnp96YHzXuv8w2vBIlBhWiucu
	2EJXkNHg==;
Received: from ip6-localhost ([::1]:54370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onxto-006LIX-SR; Thu, 27 Oct 2022 08:06:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58424) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onxtj-006LIO-0D
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 08:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=m64w1HcU9dsDgFQU/Xkj10uzhFy/KO82gKYfDQPiwvs=; b=tfJ4YDUL0erT3ZxjeMe93HTbPR
 BTeo8KOM65wxAIoQ0tfx47V1imE8Mws0UWXP3SeYXqT22aIRCJMsLs7zUdScqSmPI4rndbnX/ltzA
 Rks5tcHIzlVQ0/tQae5YohXne/VhDP4ZyebNNicord2tFLa871LroW/SpnwYpflEsJk7gIxKxMTQg
 rKe0/35ZoyGrM0QOgehxalD0m649fzJd4xaWmfcVhDGay+/QlxcJ6GAnZwtufSoCDzuXgRK0sYP0t
 MRdT0pq7gzPKlREQCUVrX816Wqs+hjGLSIQmcFlSSIIpPqxBWmapKz3uEffoUXf96ZQRXqccIT+zM
 xzVAJtU5HQC7B3RBh+iPUBdpPau6mjBkVnhwQtr9Ex5DKpyO0+lWvK9E3YZ4imL3tXhzDUlSzikfG
 AY+k6CAcSxrOMiPDfymidUbadgJm7HrvLwHsN8C3qH9o+n0lfiuzoJd6X5QOrii0HyO5LTqlxScLu
 VlwVR+BDQ3687xvr80ZS49Jg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onxti-006054-4h; Thu, 27 Oct 2022 08:05:54 +0000
Message-ID: <2a9e4484-4025-2806-89c3-51c590cfd176@samba.org>
Date: Thu, 27 Oct 2022 10:05:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Problems replacing epoll with io_uring in tevent
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
References: <c01f72ac-b2f1-0b1c-6757-26769ee071e2@samba.org>
 <949fdb8e-bd12-03dc-05c6-c972f26ec0ec@samba.org>
 <270f3b9a-8fa6-68bf-7c57-277f107167c9@kernel.dk>
In-Reply-To: <270f3b9a-8fa6-68bf-7c57-277f107167c9@kernel.dk>
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jens,

> No problem - have you been able to test the current repo in general? I want to
> cut a 2.3 release shortly, but since that particular change impacts any kind of
> cqe waiting, would be nice to have a bit more confidence in it.

At least the timing bug is still fixed (as with my change).

>> I'm currently trying to prototype for an IORING_POLL_CANCEL_ON_CLOSE
>> flag that can be passed to POLL_ADD. With that we'll register
>> the request in &req->file->f_uring_poll (similar to the file->f_ep list for epoll)
>> Then we only get a real reference to the file during the call to
>> vfs_poll() otherwise we drop the fget/fput reference and rely on
>> an io_uring_poll_release_file() (similar to eventpoll_release_file())
>> to cancel our registered poll request.
> 
> Yes, this is a bit tricky as we hold the file ref across the operation. I'd
> be interested in seeing your approach to this, and also how it would
> interact with registered files...

Here's my current patch:
https://git.samba.org/?p=metze/linux/wip.git;a=commitdiff;h=b9cccfac515739fc279c6eec87ce655a96f94685
It compiles, but I haven't tested it yet. And I'm not sure if the locking is done correctly...

>>>      c) A simple pipe based performance test shows the following numbers:
>>>         - 'poll':               Got 232387.31 pipe events/sec
>>>         - 'epoll':              Got 251125.25 pipe events/sec
>>>         - 'samba_io_uring_ev':  Got 210998.77 pipe events/sec
>>>         So the io_uring backend is even slower than the 'poll' backend.
>>>         I guess the reason is the constant re-submission of IORING_OP_POLL_ADD.
>>
>> Added some feature autodetection today and I'm now using
>> IORING_SETUP_COOP_TASKRUN, IORING_SETUP_TASKRUN_FLAG,
>> IORING_SETUP_SINGLE_ISSUER and IORING_SETUP_DEFER_TASKRUN if supported
>> by the kernel.
>>
>> On a 6.1 kernel this improved the performance a lot, it's now faster
>> than the epoll backend.
>>
>> The key flag is IORING_SETUP_DEFER_TASKRUN. On a different system than above
>> I'm getting the following numbers:
>> - epoll:                                    Got 114450.16 pipe events/sec
>> - poll:                                     Got 105872.52 pipe events/sec
>> - samba_io_uring_ev-without-defer_taskrun': Got  95564.22 pipe events/sec
>> - samba_io_uring_ev-with-defer_taskrun':    Got 122853.85 pipe events/sec
> 
> Any chance you can do a run with just IORING_SETUP_COOP_TASKRUN set? I'm
> curious how big of an impact the IPI elimination is, where it slots in
> compared to the defer taskrun and the default settings.

There's no real difference between these:

- no flag
- IORING_SETUP_COOP_TASKRUN|IORING_SETUP_TASKRUN_FLAG
- IORING_SETUP_SINGLE_ISSUER
- IORING_SETUP_COOP_TASKRUN|IORING_SETUP_TASKRUN_FLAG|IORING_SETUP_SINGLE_ISSUER


only these make it fast:
- IORING_SETUP_SINGLE_ISSUER|IORING_SETUP_DEFER_TASKRUN
- IORING_SETUP_COOP_TASKRUN|IORING_SETUP_TASKRUN_FLAG|IORING_SETUP_SINGLE_ISSUER|IORING_SETUP_DEFER_TASKRUN

metze

