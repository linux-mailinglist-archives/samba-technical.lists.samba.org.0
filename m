Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 031D869411A
	for <lists+samba-technical@lfdr.de>; Mon, 13 Feb 2023 10:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9nxMKSsHTuG2SwwDRKCvJBDvhDG18EzjNxBsagTTgkw=; b=tG6fPNxkc5sLPz+ouKr25gTTGF
	VYiJ7U6HnbpgOJTKMaZ0r1fu3SzNfPjqgSDYPDEj6Dtp8WQpm9QyJgSRbURRxA1LvKhwjNQ8npcET
	joxZsAgMOdkzwHlXeTPcw+Uq2IfUHgHZ3FDMGIpWB6wrvnUtM6H7JoGJEL8QBsujm0V/3aKV/RpJY
	m6Yi8mSyXfCZ11AA5qFRbL6D/+NpJYl9r12ifu9+dnoBWhsMfjBEAtPDP8zh65QxY7G5PFs//nNvb
	QMRgYa4yfF4B2O+oQZl85UGiX3l3c/ZUWQkBfosbeaK9jlPf1iMFHjGCl5YhpUO1NgwpOiG/s61eW
	ST0+Xfxw==;
Received: from ip6-localhost ([::1]:35112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRV8s-00BgBl-TL; Mon, 13 Feb 2023 09:28:58 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43718 helo=formenos.hmeau.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRV8m-00BgBc-1G
 for samba-technical@lists.samba.org; Mon, 13 Feb 2023 09:28:56 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pRV8C-00AXUe-BO; Mon, 13 Feb 2023 17:28:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 13 Feb 2023 17:28:16 +0800
Date: Mon, 13 Feb 2023 17:28:16 +0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+oCsDslHb4fTt3d@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgXvRKwsHUjA9T9Tw6n5x1pCO6B+4kk0GAx+oQ5qhUyRw@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, metze@samba.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, samba-technical@lists.samba.org,
 io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> Ok, so I decided to try to take a look.
> 
> Somebody who actually does networking (and drivers in particular)
> should probably check this, but it *looks* like the IPv4 TCP case
> (just to pick the ony I looked at) gores through
> tcp_sendpage_locked(), which does
> 
>        if (!(sk->sk_route_caps & NETIF_F_SG))
>                return sock_no_sendpage_locked(sk, page, offset, size, flags);
> 
> which basically says "if you can't handle fragmented socket buffers,
> do that 'no_sendpage' case".
> 
> So that will basically end up just falling back to a kernel
> 'sendmsg()', which does a copy and then it's stable.
> 
> But for the networks that *can* handle fragmented socket buffers, it
> then calls do_tcp_sendpages() instead, which just creates a skb
> fragment of the page (with tcp_build_frag()).
> 
> I wonder if that case should just require NETIF_F_HW_CSUM?

NETIF_F_SG already depends on checksum offload (either via
NETIF_F_HW_CSUM or something else that is equivalent).

So are you guys just imagining non-existant problems?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

