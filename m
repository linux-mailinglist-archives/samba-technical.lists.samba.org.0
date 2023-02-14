Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B86955DB
	for <lists+samba-technical@lfdr.de>; Tue, 14 Feb 2023 02:23:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=noof38ztG5GXl4xAcPVkAZGPJ/TjlKQKq5fmiptHs/w=; b=TpTN8JiTmnKOt1n+agQz5199HM
	mPO7Ln79PSq9Y0W+drp52hXHT71RbdFY5co5NjX6EJI65ngsrinS0RW3eT7Pzcfmtwqj9mVqdOFU6
	uDEYwPnWGG4niq66KtPzicFarD4i7tGjd8VxrYHiq9NJjcy4xMavACJiEoxWVsK8fFDtmY884LM6/
	XnXsU6nrNR2aGhkwsmWdPBYhliEtNpVIE0e0FiCK2aUDQwzikC8qHdGe/OyG5cXbNPENxK8heED4E
	+8IPIEzuxtayI1IKYS/eBaDeJeAP+zoblRHoJyZifCwaW640AuqOkdVNbg/6Imn9cUcooR8kpi+bs
	GE/z+iDA==;
Received: from ip6-localhost ([::1]:26534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRk21-00ByHP-BQ; Tue, 14 Feb 2023 01:22:53 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 ([167.179.156.38]:43724 helo=formenos.hmeau.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pRk1w-00ByHG-F4
 for samba-technical@lists.samba.org; Tue, 14 Feb 2023 01:22:51 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pRk1G-00ArAi-1U; Tue, 14 Feb 2023 09:22:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Tue, 14 Feb 2023 09:22:06 +0800
Date: Tue, 14 Feb 2023 09:22:06 +0800
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+riPviz0em9L9BQ@gondor.apana.org.au>
References: <20230210061953.GC2825702@dread.disaster.area>
 <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
 <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
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
Cc: axboe@kernel.dk, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 metze@samba.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 samba-technical@lists.samba.org, torvalds@linux-foundation.org,
 io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 13, 2023 at 10:01:27AM -0800, Andy Lutomirski wrote:
>
> There's a difference between "kernel speaks TCP (or whatever)
> correctly" and "kernel does what the application needs it to do".

Sure I get where you are coming from.  It's just that the other
participants in the discussion were thinking of stability for the
sake of TCP (or TLS or some other protocol the kernel implements)
and that simply is a non-issue.

Having a better way to communicate completion to the user would be
nice.  The only way to do it right now seems to be polling with
SIOCOUTQ.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

