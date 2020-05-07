Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1F1C96D4
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 18:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WecCRazrxaFpvMW3HKYQzmdBAteDpHr7s+WueDxLEas=; b=YH/m72klG6Ckl5IYh3WxbGydP/
	sSaotvDX7FxOHpCmiPX33BpWnZWEmcDOOwqcYWdERGFuwy1Oeu7R7S6mo9FX2jrXeRiSbN6oggb9K
	CnChZnw3NVSfNoJ/IvhbEpaTJhLVxAd2ub/w9l+6BZ+fzIV/7stThFuEAGrqbbw+BZlXEcYtLQcgP
	NPsB3UNZyk02rARlSOugs8hO4mFUxEeLis8KYL1yf8WrLyOycYpyZGAnLLhW40FqNcw7GpNiryDAW
	dnm10CFD7JFgyo4DEv7v4P4KnTrDwIFY8EN8idxswiBeOaS2bJrZY2IRczO8L/vP9frmE9hh4QQNZ
	lRejSHaA==;
Received: from localhost ([::1]:36100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWjh3-0039TM-4h; Thu, 07 May 2020 16:48:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15590) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWjgw-0039TF-KQ
 for samba-technical@lists.samba.org; Thu, 07 May 2020 16:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WecCRazrxaFpvMW3HKYQzmdBAteDpHr7s+WueDxLEas=; b=BzvOcAn6mP19uoDjHC2Adcfkvt
 tUWkuj0GBfnIsCH+b91UFraNVAsA6OFA42Jof9FJIg5/OQCCeMYnEi6i/5ynEkjEtK1Tiz9xOkHYo
 vkp5ckUNzKQznGmgRy4fnqK8dwWzSuT99iWtTrFDLgWP5M7cC+qWI7uNulrzT/dCCM+OUgl3FQhOD
 cf00MpWTMSiS1bDtuhQ5OX5a4ml5kCeMFFmfj5n+WGKdNEW65L159RBdl2ZcaR+b89c5huNfOxG/8
 bVET4ka8/a7V0zYDVdTojN46Bh6L5ZceCiy3cZqBxQt6Bxhnfd53jV6A322V2vqFzAHPCqsLHHSkq
 YcfxrYJfIG0WhK0HqBKfRAAqXT0u8u/Bltmr5sS0cQtv+dL+qpAG8Ih7KNfMHdZzlbnw57y7XrH0I
 LFfGtDnM7okFsBPFPbVCfAN4bhlaRriTaWcGoE1tzU/qB24s+PCazWQNnRPWApE2u3FvcD78/Yr9g
 JB9HAk0BU9+BUFJUpcVd0Tv5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWjgv-0002eB-51; Thu, 07 May 2020 16:48:09 +0000
Date: Thu, 7 May 2020 09:48:02 -0700
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200507164802.GB25085@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
 <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
 <117f19ce-e2ef-9c99-93a4-31f9fff9e132@gmail.com>
 <97508d5f-77a0-e154-3da0-466aad2905e8@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97508d5f-77a0-e154-3da0-466aad2905e8@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Pavel Begunkov <asml.silence@gmail.com>, jra@samba.org,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 07, 2020 at 10:43:17AM -0600, Jens Axboe wrote:
> 
> Replying here, as I missed the storm yesterday... The reason why it's
> different is that later kernels no longer attempt to prevent the short
> reads. They happen when you get overlapping buffered IO. Then one sqe
> will find that X of the Y range is already in cache, and return that.
> We don't retry the latter blocking. We previously did, but there was
> a few issues with it:
> 
> - You're redoing the whole IO, which means more copying
> 
> - It's not safe to retry, it'll depend on the file type. For socket,
>   pipe, etc we obviously cannot. This is the real reason it got disabled,
>   as it was broken there.
> 
> Just like for regular system calls, applications must be able to deal
> with short IO.

Thanks, that's a helpful definitive reply. Of course, the SMB3
protocol is designed to deal with short IO replies as well, and
the Samba and linux kernel clients are well-enough written that
they do so. MacOS and Windows however..

Unfortunately they're the most popular clients on the planet,
so we'll probably have to fix Samba to never return short IOs.

