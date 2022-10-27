Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F848610206
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 21:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G97Z2J1cNivVK76dFGonYvCkq38FRu/3xZu9FHl61AU=; b=OzxhZJU74m4BzRyjBDLHdapS7s
	eq6sjh/nTNYPzRPNjwo+VAbf0e3rcGKaLw8hxdfSBGR4+iZuGMC8DpAIGhE/h2Qx7pg3CkfjIw6UD
	y+jgsKOT2y/q+4r6Ru0hefqdNRT3Wh9I+hzFU6Fx+Cy478K1BtxAJ7lZ/IjLmAzjvs3AQCLxGZIy4
	zdmyYXlaJp7n3ynRemhBZEGN4xDBCxiMbDu71/albotAZtHNlJQIptpEL3+Ai9PfuozrdyIWqlovG
	/1ZqCC3bGr84ZOEBNMfDGg+42dtQs4ZfgMYwQ3BxQyuBP+mfZ305NXfKor1jkS2qmZj4NoZqH7rf8
	mCQoBROg==;
Received: from ip6-localhost ([::1]:28588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oo8xn-006YDz-Ur; Thu, 27 Oct 2022 19:54:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19982) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oo8xj-006YDq-7R
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 19:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=G97Z2J1cNivVK76dFGonYvCkq38FRu/3xZu9FHl61AU=; b=UchYPw4AYukGxbgRgKCverekHn
 +yU7KiHDTFallLcmfb6Xh7EsnFyQVpoLoeUVL3MUX2bDb+ME9UEKMbWUZvhAqz3nYFMlKEsMkDBxa
 6N6igsVkMyfHcITuXHtfXtyUImr4/k7iEHDr0KLXH00JLwULV+NAdJ4NE7JnPtlpWvGvepUbRC3ML
 7MgeTT9XkQg49xKNbsVEGN6X5jDqkhhR0V+heTkZPhf7v7fDM3aAlVg0TR7x9n3DOF1WLjj5zzW43
 Wdsrrk9L59H7tCTPU7cRxMdEZp5GAoknMkdhsIcsfq5QTLVi/AZi8ghgfQch4yssTsnSmSpGjeyhr
 97lb/x2L0pGZbWNtlyFcU+7DDzEEEpDiUsAG3Rd0ALcwWBdfSpfaEGhy5yvf0KFQ6LTkOjppz0sT2
 G+Gt+/SG3EpHlgIuPr1vowLBf0yknxLkmdMrQ8Rfu5JnWEA4nWQBXbXkbH82Q5/lSckMRJv0L9x3C
 k1CbS/1pMtJxzmbWR3RArc7U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oo8xi-00654Y-10; Thu, 27 Oct 2022 19:54:46 +0000
Message-ID: <c9a5b180-322c-1eb6-2392-df9370aeb45c@samba.org>
Date: Thu, 27 Oct 2022 21:54:45 +0200
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jens,

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

It should work fine with fixed files, but I haven't tested it.

But from reading the code I'm wondering what happens in general with pending
requests on a closed fixed file? There's no referencing in io_file_get_fixed(),
or is it done via io_req_set_rsrc_node() together with the
io_rsrc_node_switch_start()/io_queue_rsrc_removal()/io_rsrc_node_switch()
within io_fixed_fd_remove()?

But IORING_POLL_CANCEL_ON_CLOSE doesn't have any effect together with
REQ_F_FIXED_FILE (in my current code). Maybe a io_fixed_fd_remove()
should call __io_async_cancel with IORING_ASYNC_CANCEL_FD_FIXED.

I was also thinking if any pending could be canceled by a close(),
because they all have the registered in the struct file list...
But that might be overkill and io_uring aware applications can just use
IORING_ASYNC_CANCEL_FD_* explicitly. Also fixed files are also only
used by io_uring aware code.

metze

