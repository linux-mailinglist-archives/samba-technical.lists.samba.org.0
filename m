Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D115D691223
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 21:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=8lKrEZV9yEJIi0kn0dn+QeXatghJ23bQPCt58aXU5vk=; b=T9ynEy2tHyu5zS1qVmRGHiZ7Ic
	uOdTxdrtgaSTr2Nfb3MapIo9bFvmdTx1q1xoPKVPYViKWsqhjj2eJJloi9j0yZnij8b+3uDmkU78+
	I7A+vACAWmcqHW0Opz/+BifoPOV78fFp7suMqNpm9/b4DD0zFJtWJ5ezOZ5KkXLNk0Bq0kcEoIpgx
	Et/j+OTiiR9jftwgSpRT4mJfAptUsoYem6meoFnzP0u4g1u7KGmCd4YoK5bnyEeR2mYp/6KWR1N+s
	AGkpP2EPxt4mLW+bedsRx40SYzRO87OkjaB4IKStM6zzZzdWUjRqA59sC82sS9wgrt6gnkONTpMXV
	55iMGJOw==;
Received: from ip6-localhost ([::1]:61114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQDbW-00AYv2-Do; Thu, 09 Feb 2023 20:33:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24388) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQDbQ-00AYus-Mt
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 20:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=8lKrEZV9yEJIi0kn0dn+QeXatghJ23bQPCt58aXU5vk=; b=Z0gY7l7FeI7MJx19vhNl6NnbDu
 8xSDF8e5b9YUCAK3UUK8QxLZecE0pnvOvxwtqwJFCqoL5n4/QOgDaxH/g0z0Lvm4pLDD7nPTmp70E
 LgTLVc0mjTeFBy41EZK6oxCrkDx2BrN4y1v+Xi807y3QLOTcFM130sdSD9Ic+uyoeh+8ayqGKSZGI
 0SU3ycY+SWwXkIuQJDsnpwqO9wSmQ0vxoT04q2dBeyOMptdo3dTXddhJ96BSQXVhZGpGAMUBgTiwu
 GCzlwCCC59bwKGaMcI6YciLBEHKKOucH2zTdzeaO5BMeZ0PEK6JYTr917AkEkWjl9BBpNTqxfEHhe
 NAJjwlngIEA9L2pEpt7WU+OshjR/7EfRRqs+ZUTEbROgH9ynob+3bB9oYICMSR9J9wqISR9oh4xvf
 rL87QFt8m+WLjNQfd5aTlabU/MQt7NCu9J5FOQVvw6aVOL+kvbWTX1uezc2//GiplGcL4/yVWzXwQ
 N1BFCjs14bjZ0GX/JlSygJZb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQDbM-00CsAc-96; Thu, 09 Feb 2023 20:33:04 +0000
Date: Thu, 9 Feb 2023 12:33:00 -0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+VYfHcNdvez6M2a@jeremy-acer>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
 <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
 <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 09, 2023 at 11:48:35AM -0800, Linus Torvalds via samba-technical wrote:
>
>So this is exactly *why* splicing from a file all the way to the
>network will then show any file changes that have happened in between
>that "splice started" and "network card got the data". You're supposed
>to use splice only when you can guarantee the data stability (or,
>alternatively, when you simply don't care about the data stability,
>and getting the changed data is perfectly fine).

Metze, correct me if I'm wrong but isn't this exactly the "file
is leased in SMB3" case ?

We already know if a file is leased, and so only use the splice calls
for I/O in that case, and fall back to the slower calls in the
non-leased case.

