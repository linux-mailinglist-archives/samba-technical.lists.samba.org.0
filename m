Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFFD3DFA39
	for <lists+samba-technical@lfdr.de>; Wed,  4 Aug 2021 06:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SgNL9C7ZQ2BuIF2Cqvnp5ES+Q76cLjnzON0RnWSjHHc=; b=isH0PsI3UcRBKbcS/qyGSC8tUS
	yvEqADk5+nNGhrIglYvdxHiKEg64+sX1Ov5ZAxJ2av4PoULKxPpzgYmu9F2RXpNjJhnlta083oXnb
	IsBv3vdoJySBqQpE0Iu0BCv7//0ua0184R2njlyOeBerj3eCOkmEuIfZY2LopmvwRNBntyXprbZYC
	X+cI7svtp/1NWKGIGgreAvwdP30YxTgyBWMT2I1yw8YxMSGLzAK3qRNOdZD3g9RlTD3nm0LDvIvye
	EN7lvO24BPku8ewDjR0GhKJU2+s8BTtkGcsV78do5f0X9+OfXdrjBVLvmQhbFhyfpWhuQ03tBB+M/
	FNZuKLKQ==;
Received: from ip6-localhost ([::1]:42420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mB8Mr-004Sfk-Nu; Wed, 04 Aug 2021 04:18:57 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40219 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mB8Ml-004Sfa-Lo
 for samba-technical@lists.samba.org; Wed, 04 Aug 2021 04:18:54 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gfdlf3DMVz9sRN;
 Wed,  4 Aug 2021 14:18:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1628050718;
 bh=SgNL9C7ZQ2BuIF2Cqvnp5ES+Q76cLjnzON0RnWSjHHc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ORtx9ssDQHKrqV4eTF222N6+ybhvs/Ei5OpLxX5FjU7UmvRPzCAUvpMPl7YafvvoI
 oTuNfLLMySnm+6OnfkZztv7AqruLmftn6dDYh33Tba+WGUU2ztGE7ni7QozqaoyNQF
 cnoEfZxxyZUlNdFcv6j7VJkELSPRnk734yDYHUfXUWhho1pPg9medaOU10GgDk3NWr
 +9aioEimmROYwhuVkv+bjA9RRto9dGWnqnQQ/weFl0FafgjFMr/+7J5MVUNVh7m/4y
 JKt3lzBqHt783db5eEWTad+2cRqAds3iVyhc8cXpf1LQj3lJOYAOtfa1aT3b75VRSW
 wHAy7C/SdYzQw==
Date: Wed, 4 Aug 2021 14:18:37 +1000
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
Message-ID: <20210804141837.45723a29@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mTdkF4+52wCfMC1SrmyzJ2Xq4VKKBkJ=qFPgOwiekG2Kw@mail.gmail.com>
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu>
 <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
 <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
 <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
 <CAJ+X7mTdkF4+52wCfMC1SrmyzJ2Xq4VKKBkJ=qFPgOwiekG2Kw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 20 Jul 2021 15:59:02 +1000, Amitay Isaacs via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Fri, Jul 16, 2021 at 5:47 PM Michael Adam <obnox@samba.org> wrote:

> The issue is that CTDB makes assumptions about the orphan processes.
> On most unix systems, an orphan process gets re-parented to init which
> traditionally has pid =3D 1.  This assumption is built into the code to
> avoid runaway orhan processes in CTDB.

Yes, we explicitly check if the parent process is 1 in the lock helper
before continuing.  As discussed offline, we should try something with a
file descriptor event to try to determine whether the parent has gone
away.

> In the container world, what happens to orphan processes?

Everything I can find says they are re-parented to process 1 in the
container.

> > Even if you don=E2=80=99t see a real benefit of this containerized layo=
ut
> > just yet, it might still be beneficial for the code to consider
> > some modifications to make ctdb more =E2=80=9Ccontainer-ready=E2=80=9D.=
.. =20

> Provided it makes sense. ;-)

Yep!  If there is no sane re-parenting of orphan processes inside
containers then we should recommended that CTDB is always run via a
minimal init.  CTDB launches a lot of processes and if it goes away
then something needs to look after them.

As we discussed offline, at the moment the current crash reminds us we
have a problem to solve, so we shouldn't just "fix" it to avoid the
crash.  We should find a better solution for detecting that the parent
has gone away, use that and then fix the crash that may still occur.
We might also be doing a similar thing elsewhere...

peace & happiness,
martin

