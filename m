Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0069C4D4
	for <lists+samba-technical@lfdr.de>; Mon, 20 Feb 2023 05:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=c2OrAGHoqOqbRSRvoVFjTV7m57+NzAuzxzplAdDaqrs=; b=BCXzEwUpPgvNt1Bc/UbUsd/8Mx
	A4VbtXgtMAU5ZIRfKaTVg816Ta3SsBOi2eQQRbaOiUku5f+g0lrRy0SEGd+yiA5Kixag8Em9X1UG8
	fGiSbKBvQMA0//6AjZQT1b+hIh8kirv0SidjTHeEqp5mRo/kJB/kf+7/ObV+g7tHo+RWZUP6XITyp
	Dzoqe+VEkeYG+UQOkHtIp5LLX/w5FazJwadAnaoyI9lFcxlKmAUpms2GAeefXvtzS1Z2vrho0MD6q
	b5JaSxFUbYb7BgdbnRTT2WVW5yFqV28tqQ4sc5hjtzMeUVuVKz9JXJZOIOjDmFgWInFK/pPrUQSh+
	2CXpCOwA==;
Received: from ip6-localhost ([::1]:51110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pTyD5-00DGwh-Gu; Mon, 20 Feb 2023 04:55:31 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pTyCx-00DGwY-0A
 for samba-technical@lists.samba.org; Mon, 20 Feb 2023 04:55:26 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pTyCK-00DEmI-ML; Mon, 20 Feb 2023 12:54:45 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Mon, 20 Feb 2023 12:54:44 +0800
Date: Mon, 20 Feb 2023 12:54:44 +0800
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y/L9FO3IbPS8/n4g@gondor.apana.org.au>
References: <20230210061953.GC2825702@dread.disaster.area>
 <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
 <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
 <Y+riPviz0em9L9BQ@gondor.apana.org.au>
 <CALCETrXr8vRPqEjhSg7=adQcM7OfWs_+fn2xP5OQeLXAaLzHHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXr8vRPqEjhSg7=adQcM7OfWs_+fn2xP5OQeLXAaLzHHQ@mail.gmail.com>
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
Cc: axboe@kernel.dk, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 metze@samba.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 samba-technical@lists.samba.org, torvalds@linux-foundation.org,
 io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 17, 2023 at 03:13:14PM -0800, Andy Lutomirski wrote:
>
> I can certainly imagine TLS or similar protocols breaking if data
> changes if the implementation is too clever and retransmission
> happens.  Suppose 2000 bytes are sent via splice using in-kernel TLS,
> and it goes out on the wire as two TCP segments.  The first segment is
> dropped but the second is received.  The kernel resends the first
> segment using different data.  This really ought to cause an integrity
> check at the far end to fail.

The TLS layer is completely separate from TCP so it's like any
normal TCP user from user-space.  IOW the encrypted data will be
held by TCP until acknowledged so during retransmission it will
simply resend the previously encrypted data rather than encrypting
the same data twice.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

