Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B74686FA6
	for <lists+samba-technical@lfdr.de>; Wed,  1 Feb 2023 21:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vBnL5Y63rlW78r0QrCkOj0z1ZMt1mgBJW4rR/cKmT3s=; b=mgY8qDBfj0PSHSP9TKsTWs8+n/
	0SmM5WAaWZhYiahxAD0YO+5JLlyRd4zEC4cwv46YdOcHMJttNaRcnIKxZGdgl8G0CY/RQxUkHvQfJ
	fsGEPxGFeHwtfQQgbIuZ7HEzjcqjkR+IaX1nNhNo/JC2xJfLCyxc5LWRkLS0dIX5yQxz7Olr/lYe2
	ydpt7VoIKQNEOjTnld4LOyahWriZPUWXZm0qUZSzYcGIUW9osf2EGRgP0JT89zKpqDuynZPMWn3PE
	eplz8W0F34Ec7bp4rMwTy2/0E0mJvYnwLtNye0tUoGs6VgpyiHdda8JsR+icm6zSZxfEe7wxxI13N
	2O2Dyq3w==;
Received: from ip6-localhost ([::1]:29744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pNJjw-007n0U-6h; Wed, 01 Feb 2023 20:29:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pNJjr-007n0L-9F
 for samba-technical@lists.samba.org; Wed, 01 Feb 2023 20:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=vBnL5Y63rlW78r0QrCkOj0z1ZMt1mgBJW4rR/cKmT3s=; b=qgMJZfi1Qqnv8m28cUd0YG3HXP
 i9YUw9x5iMKpFjDxjFG7Le701xm/XbGQRtUrdtOqjdck6kKMOg/OR+UHIp/ZbQZvazkKXErVuHAzH
 PlQwrHX6DBGUFd12GQ9KZ4jkghyt8S+Oa9Ts8Jf30lqDTvEzKb/XJxPm3XfVMd/6cx2230ussknYK
 ZYCx1Gjt50mL1Ahom7S4EAPaLx+uL1R4cjgZeReeTLPtyAElXCqb2eEwyWu+kGvfuD1WnKezsMSU4
 7OdbZaULnvLYBLkwaaBWzLIc/jSMhzqR55NxgRIBb5cYkprI5G4Xy+4ciEQWbWCXGX7Uouu8J8WOk
 VATzMDZdY6LDfuLL4nOl37ZFE24BnKsMjhQ2y0xAjfxzUpiV2GM/M62NiSJBfHF5kHpq2LXaC0UWm
 nkBiw3Mw5N3pF0C4ArsQ4DgcQNTQP3YljLwofzRkfB6HmE45TG/EbGu4pT9H6UR9Utm3Q5PD1N9kZ
 TCGrudMRDG3Nff4wOzRcnU39;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pNJjq-00BHXS-7U; Wed, 01 Feb 2023 20:29:50 +0000
Message-ID: <1b033b5c-3bab-0831-d642-50cce9905b2a@samba.org>
Date: Wed, 1 Feb 2023 21:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Problems replacing epoll with io_uring in tevent
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
References: <c01f72ac-b2f1-0b1c-6757-26769ee071e2@samba.org>
 <949fdb8e-bd12-03dc-05c6-c972f26ec0ec@samba.org>
 <270f3b9a-8fa6-68bf-7c57-277f107167c9@kernel.dk>
 <2a9e4484-4025-2806-89c3-51c590cfd176@samba.org>
 <60ce8938-77ed-0b43-0852-7895140c3553@samba.org>
 <79b3e423-16aa-48f1-ee27-a198c2db2ba8@samba.org>
 <b3cbaa88-9b01-e82f-bcfa-2fccc69b37c4@kernel.dk>
In-Reply-To: <b3cbaa88-9b01-e82f-bcfa-2fccc69b37c4@kernel.dk>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jens,

>> any change to get some feedback on these?
>> https://lore.kernel.org/io-uring/60ce8938-77ed-0b43-0852-7895140c3553@samba.org/
>> and
>> https://lore.kernel.org/io-uring/c9a5b180-322c-1eb6-2392-df9370aeb45c@samba.org/
>>
>> Thanks in advance!
> 
> Finally getting around to this after the break...
> 
> I think your initial patch looks reasonable for doing cancel-on-close.
> Can you resubmit it against for-6.3/io_uring so we can get it moving
> forward, hopefully?
> 
> That would also be a good point to discuss the fixed file case as well,
> as ideally this should obviously work on both types.

I rebased on for-6.3/io_uring from over a week ago:
https://git.samba.org/?p=metze/linux/wip.git;a=shortlog;h=refs/heads/oem-6.X-metze

root@ub1704-167:~/samba.git# uname -a
Linux ub1704-167 6.2.0-rc5-metze.01-00809-g3ffcd1640c8d #1 SMP PREEMPT_DYNAMIC Mon Jan 23 22:56:13 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

I modified the test a bit in order to only test fd events (without signal events),
with this samba code:
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-io-uring-native-ops
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=0ddfc6ac8f0bf7c33d0e273b45d9df1951b6452b

It shows that the epoll backend is still the fasted, see below.
I know that the samba_io_uring_ev_native is not really optimized in userspace,
but I fear the limiting factor is the need to re-issue IORING_OP_POLL_ADD
after each completion.

Having IORING_POLL_ADD_MULTI together with a working IORING_POLL_ADD_LEVEL,
might provide something that would be faster than the epoll backend,
but that would mean we would need to maintain a ready list and
issue only a limited amount of completions from the ready list
per io_uring_enter() in order to avoid overflowing the completion queue.
But I'm not sure how to implement that myself...

So IORING_POLL_CANCEL_ON_CLOSE is sadly not enough to be useful for me,
do you think I should submit it anyway even if it's unclear if samba will make use of it
any time soon?

metze

root@ub1704-167:~/samba.git# time bin/smbtorture //a/b local.event.samba_io_uring_ev_native.context
smbtorture 4.19.0pre1-DEVELOPERBUILD
Using seed 1675281295
time: 2023-02-01 19:54:55.272582
test: context
time: 2023-02-01 19:54:55.275092
backend 'samba_io_uring_ev_native' - test_event_context
Got 1000000.00 pipe events
Got 295844.07 pipe events/sec
time: 2023-02-01 19:54:58.655572
success: context

real    0m3,472s
user    0m1,861s
sys     0m1,609s

root@ub1704-167:~/samba.git# time bin/smbtorture //a/b local.event.epoll.context
smbtorture 4.19.0pre1-DEVELOPERBUILD
Using seed 1675281298
time: 2023-02-01 19:54:58.739744
test: context
time: 2023-02-01 19:54:58.741575
backend 'epoll' - test_event_context
Got 1000000.00 pipe events
Got 326759.90 pipe events/sec
time: 2023-02-01 19:55:01.802051
success: context

real    0m3,147s
user    0m1,926s
sys     0m1,218s

root@ub1704-167:~/samba.git# time bin/smbtorture //a/b local.event.poll.context
smbtorture 4.19.0pre1-DEVELOPERBUILD
Using seed 1675281930
time: 2023-02-01 20:05:30.685121
test: context
time: 2023-02-01 20:05:30.686870
backend 'poll' - test_event_context
Got 1000000.00 pipe events
Got 275666.78 pipe events/sec
time: 2023-02-01 20:05:34.314512
success: context

real    0m3,713s
user    0m1,799s
sys     0m1,911s



