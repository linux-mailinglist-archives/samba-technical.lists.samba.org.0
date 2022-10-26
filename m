Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0D60E62F
	for <lists+samba-technical@lfdr.de>; Wed, 26 Oct 2022 19:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lYZpE8lGnFpdCamBUGvNH6rEk6rbs2VVHXMxMEt2jkY=; b=njajXSSUUm6pjcqm9mF3/QHyVl
	BAErVD+vGtqDiP8sGHEk9/OlzB7dNld+yC2RME9aJYEWkSP1dxqI50AKI/8eYz7arJQvm+3UMdUTO
	x3kD4pvTswF9OIZC4wCLiPv7+mtBRyF0jtEjLHmtDuo4rsxIG7RN/x87kn5csnHSJx1IY7T7eZD4X
	RQz072dx8sOXCVQYBHFK1AZX4+1E4CeJMs1vqvIkPp/OJXZTHRbZaGHGjgHz+L6+nkbB8lkdJK7nS
	ODiuXYhPTUhPOvNSwzbBfvFdR1pl7nZWYxcWtSSCvCw2ROs77nZEhSEifBFeBeRDsSscaUeMprCjZ
	Ge+fBlag==;
Received: from ip6-localhost ([::1]:38872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onjto-006H5m-Bg; Wed, 26 Oct 2022 17:09:04 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:40734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onjti-006H5d-Fj
 for samba-technical@lists.samba.org; Wed, 26 Oct 2022 17:09:01 +0000
Received: by mail-io1-xd30.google.com with SMTP id q75so4239179iod.7
 for <samba-technical@lists.samba.org>; Wed, 26 Oct 2022 10:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lYZpE8lGnFpdCamBUGvNH6rEk6rbs2VVHXMxMEt2jkY=;
 b=GyGnRMJ4jADBJT/vXAsPkcvHEvFwYF3hKiJOoUbzqkzhKAK8kWjqW1wZLznlQ2eoMQ
 AbTZ4HOXw55e7ggAOaHW6HGNg5Yit5TIMUuX/bxOO/HPNb44LhmXu6tlfUIW9JSK1VCR
 SIfCVQY+hTNiS1oywEEBhptTjdVCwjAwGLYtvi6XQsTKhVUWC1ElhmAQjJcL1Jg/jIaN
 U/UAN6g7lw3sLK4k5Jieg1jMIHMSW2JU0FjNrsjoofFdg6Ape9hxWvewATCGXdsFdDOp
 XoZAKc5ieVQsKvlF/+UFuQ63n9ePHkTXgEdINoDsaANqz8+3aIeSHeI1reK5UkP0Q9Qv
 njoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYZpE8lGnFpdCamBUGvNH6rEk6rbs2VVHXMxMEt2jkY=;
 b=UMsXg3wPVxDAjYNkMpOKnfkRDjHR0oYuhAH9RsLW9X/+lKw8/LgHJ5BsFnXsVO3niX
 0+dwZC7MWpIrwsau1Ic+CJFuX+KOWpZaDVFW39P70Cf+bc2ywJaki8qy1XtuMGBbYlkp
 8BjnzhRQPFc37CU2/MH4LBWthoJinSAM/wC/k8GCPrg/hHv24Ke1kAH2WLV4xxhrowGJ
 sS6IAR2nmF+Q537B2uM2uxnIQUbWnHmQwtlBkGyKE290R6Rky529QY6V4mKjPbL5TMfu
 83wLm7dYv1/m5xUJv1mJ7Yinb6A2nrahFg6308PZDu1bnh9Am9PXIamciAhUMJsvcNdg
 218Q==
X-Gm-Message-State: ACrzQf0m5a/tK6BiUXe93Yeq2TyvZu9cGoF9QKV9IxKEuU4is3JA5q4m
 jMaqE3xEymStgoTd7c7t/gUpJg==
X-Google-Smtp-Source: AMsMyM6tT3iVUILrjNpi91sxVXY8ST7Hons8zyrag5CjVfH0/oTSQ6so1fRiYJK08b9KuZjDXKLEbg==
X-Received: by 2002:a05:6638:480c:b0:363:aed5:ed3c with SMTP id
 cp12-20020a056638480c00b00363aed5ed3cmr27088649jab.207.1666804136084; 
 Wed, 26 Oct 2022 10:08:56 -0700 (PDT)
Received: from [192.168.1.94] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056e020cae00b002ffcf2e2e05sm2194671ilg.58.2022.10.26.10.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 10:08:55 -0700 (PDT)
Message-ID: <270f3b9a-8fa6-68bf-7c57-277f107167c9@kernel.dk>
Date: Wed, 26 Oct 2022 11:08:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: Problems replacing epoll with io_uring in tevent
To: Stefan Metzmacher <metze@samba.org>
References: <c01f72ac-b2f1-0b1c-6757-26769ee071e2@samba.org>
 <949fdb8e-bd12-03dc-05c6-c972f26ec0ec@samba.org>
Content-Language: en-US
In-Reply-To: <949fdb8e-bd12-03dc-05c6-c972f26ec0ec@samba.org>
Content-Type: text/plain; charset=UTF-8
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
From: Jens Axboe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jens Axboe <axboe@kernel.dk>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/26/22 10:00 AM, Stefan Metzmacher wrote:
> Hi Jens,
> 
>> 9. The above works mostly, but manual testing and our massive automated regression tests
>>     found the following problems:
>>
>>     a) Related to https://github.com/axboe/liburing/issues/684 I was also wondering
>>        about the return value of io_uring_submit_and_wait_timeout(),
>>        but in addition I noticed that the timeout parameter doesn't work
>>        as expected, the function will wait for two times of the timeout value.
>>        I hacked a fix here:
>>        https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=06fec644dd9f5748952c8b875878e0e1b0000d33
> 
> Thanks for doing an upstream fix for the problem.

No problem - have you been able to test the current repo in general? I want to
cut a 2.3 release shortly, but since that particular change impacts any kind of
cqe waiting, would be nice to have a bit more confidence in it.

>>     b) The major show stopper is that IORING_OP_POLL_ADD calls fget(), while
>>        it's pending. Which means that a close() on the related file descriptor
>>        is not able to remove the last reference! This is a problem for points 3.d,
>>        4.a and 4.b from above.
>>
>>        I doubt IORING_ASYNC_CANCEL_FD would be able to be used as there's not always
>>        code being triggered around a raw close() syscall, which could do a sync cancel.
>>
>>        For now I plan to epoll_ctl (or IORING_OP_EPOLL_CTL) and only
>>        register the fd from epoll_create() with IORING_OP_POLL_ADD
>>        or I keep epoll_wait() as blocking call and register the io_uring fd
>>        with epoll.
>>
>>        I looked at the related epoll code and found that it uses
>>        a list in struct file->f_ep to keep the reference, which gets
>>        detached also via eventpoll_release_file() called from __fput()
>>
>>        Would it be possible move IORING_OP_POLL_ADD to use a similar model
>>        so that close() will causes a cqe with -ECANCELED?
> 
> I'm currently trying to prototype for an IORING_POLL_CANCEL_ON_CLOSE
> flag that can be passed to POLL_ADD. With that we'll register
> the request in &req->file->f_uring_poll (similar to the file->f_ep list for epoll)
> Then we only get a real reference to the file during the call to
> vfs_poll() otherwise we drop the fget/fput reference and rely on
> an io_uring_poll_release_file() (similar to eventpoll_release_file())
> to cancel our registered poll request.

Yes, this is a bit tricky as we hold the file ref across the operation. I'd
be interested in seeing your approach to this, and also how it would
interact with registered files...

>>     c) A simple pipe based performance test shows the following numbers:
>>        - 'poll':               Got 232387.31 pipe events/sec
>>        - 'epoll':              Got 251125.25 pipe events/sec
>>        - 'samba_io_uring_ev':  Got 210998.77 pipe events/sec
>>        So the io_uring backend is even slower than the 'poll' backend.
>>        I guess the reason is the constant re-submission of IORING_OP_POLL_ADD.
> 
> Added some feature autodetection today and I'm now using
> IORING_SETUP_COOP_TASKRUN, IORING_SETUP_TASKRUN_FLAG,
> IORING_SETUP_SINGLE_ISSUER and IORING_SETUP_DEFER_TASKRUN if supported
> by the kernel.
> 
> On a 6.1 kernel this improved the performance a lot, it's now faster
> than the epoll backend.
> 
> The key flag is IORING_SETUP_DEFER_TASKRUN. On a different system than above
> I'm getting the following numbers:
> - epoll:                                    Got 114450.16 pipe events/sec
> - poll:                                     Got 105872.52 pipe events/sec
> - samba_io_uring_ev-without-defer_taskrun': Got  95564.22 pipe events/sec
> - samba_io_uring_ev-with-defer_taskrun':    Got 122853.85 pipe events/sec

Any chance you can do a run with just IORING_SETUP_COOP_TASKRUN set? I'm
curious how big of an impact the IPI elimination is, where it slots in
compared to the defer taskrun and the default settings.

>>        My hope would be that IORING_POLL_ADD_MULTI + IORING_POLL_ADD_LEVEL
>>        would be able to avoid the performance problem with samba_io_uring_ev
>>        compared to epoll.
> 
> I've started with a IORING_POLL_ADD_MULTI + IORING_POLL_ADD_LEVEL prototype,
> but it's not very far yet and due to the IORING_SETUP_DEFER_TASKRUN
> speedup, I'll postpone working on IORING_POLL_ADD_LEVEL.

OK

-- 
Jens Axboe



