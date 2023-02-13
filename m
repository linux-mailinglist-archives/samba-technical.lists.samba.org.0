Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E250A6941A2
	for <lists+samba-technical@lfdr.de>; Mon, 13 Feb 2023 10:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VbLJr6FRXNzAvtIZ5lHbaJiMqKpuKiqFpV9HjzQ8zy4=; b=GqxdjM4L5zXxWKtPT5hWoKOr0+
	rXVYcwgcX95gbKtzKfhQV28ZuysgiR43ArQJmkabQDDWcFEV4Y9iIO2Rfj6BK4dwWdtwoxndVdxz8
	e0QLueTg0t3CT7CHG0G5qVOPglx64Ka8reOl+k14+olQE/6fvCs3y4L10k7Fj7y1FnuMei0FQOVe0
	BikQOIb/EfOu/IwGirXQztFJFv4cNh0GT5Ar25osi8JKIjCGMG4kfLDdWzWPlwrGGCs+zRcfrbnAN
	dE4fidRLCi3CeATCOWQvh6zhUL3kFYe7wfkGZYejO2ngVgO6sQjPPRpdUWVhPtJEVmkS53G21pVB7
	6082QeYA==;
Received: from ip6-localhost ([::1]:52966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRVNb-00Bgl2-D2; Mon, 13 Feb 2023 09:44:11 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43722 helo=formenos.hmeau.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRVNT-00Bgkt-J9
 for samba-technical@lists.samba.org; Mon, 13 Feb 2023 09:44:09 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pRUoP-00AWqI-Sv; Mon, 13 Feb 2023 17:07:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 17:07:49 +0800
Date: Mon, 13 Feb 2023 17:07:49 +0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+n95VtIG09MxZde@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg2Mb4ZgRuBthw6O0KLhZNksGBQNs73386Gdg4gHny=XA@mail.gmail.com>
X-Newsgroups: apana.lists.os.linux.kernel
X-Warn: EHLO/HELO not verified: Remote host 167.179.156.38
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net) incorrectly presented itself as
 formenos.hmeau.com
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
From: Herbert Xu via samba-technical <samba-technical@lists.samba.org>
Reply-To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: axboe@kernel.dk, linux-api@vger.kernel.org, david@fromorbit.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, metze@samba.org,
 viro@zeniv.linux.org.uk, luto@kernel.org, linux-fsdevel@vger.kernel.org,
 samba-technical@lists.samba.org, io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
>  -     if (!(sk->sk_route_caps & NETIF_F_SG))
>  +     if (!(sk->sk_route_caps & NETIF_F_SG) ||
>  +         !(sk->sk_route_caps & (NETIF_F_HW_CSUM | NETIF_F_IP_CSUM)))
>                return sock_no_sendpage_locked(sk, page, offset, size, flags);

NETIF_F_SG depends on checksum offload so it should already be
calling sock_no_sendpage_locked if checksum offload is not
supported.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

