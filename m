Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B96E58CB
	for <lists+samba-technical@lfdr.de>; Tue, 18 Apr 2023 07:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1uWVUPatiQtvhlBan20nDmH/BZMBpsEwjWzqhHNLs38=; b=1wI5AdVT9oMH3KM2+ViAU8CLBi
	5HRhwW0oTPIostBsXuB+aVllV3JhsGfulKRVem9saI43dEstqW2lhVoXVUZKDQQ+A1sSls3bCI3/5
	c2OG0POyyxQ1JYIiLuauys8fajBPg5MkvRF4tPQeArN2ymC/AWHl84XIW8cKrU1B6xTafdx5CR5l8
	2DpqSRPFu1AHCL99EUqH20jOJUAzJLHSFYele++9SmLa8hcpCwmRicwhMKnmflVBr44BJh6Nmvzur
	L6UgkduqT9na9knl7yM6mraj70LQ5q3KnKxKMlUDkC4eORimohsEpCKfIQAbPSk73h4A2J+rmd5uH
	d4uQxcfw==;
Received: from ip6-localhost ([::1]:31524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poeGd-002OiT-3p; Tue, 18 Apr 2023 05:52:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poeGX-002OhT-NS
 for samba-technical@lists.samba.org; Tue, 18 Apr 2023 05:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1uWVUPatiQtvhlBan20nDmH/BZMBpsEwjWzqhHNLs38=; b=cH8/3tUZ7w5CFnPtRag9aOZqqf
 KgOlCT/NxkszoX2Ww6IhKGd2tXb9PSvgykqwXcj8V8HfhIPEJMqUzNkH8eYQSPaeQYYK4cCac0fVS
 R5yh1pO0Tc5YFk5jft+SXytMNuVL51j6PKkO+QqsxqVnGdbA2+mfG/XqHYxz7Gdtffy/Ze/udZdd3
 oVnrxe512D92eJEWVjS0uknOQ5Am1XQ0XMkAD6NK2Mo+cquTlrsKbuLVW7UTm6Ct0Wa1mchhkA5tt
 YYra3iQRBpDxwbZ6bGylIHWElROw4K421g/0ETB3xy14xG7z3dd821tK897RbtAGFfzn2pk0/iSUF
 qfK/Djna+6o6qsIVM6g4ZJe0fsIF+WojAFnUK1GyQSW1TZE9H0EytiZsCp4swI7ho0OUxIo7VgyIF
 LYz5leoCR1E8uA/hQlDz7F2Sj5ML8pYMI5QcvO1kNJLOksvhc6/16qySsnBIHhaJUnskY7V3XXZ0h
 DFOLvaFdm7q3zmP9J+AvKPY6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poeGV-001kvt-T4; Tue, 18 Apr 2023 05:52:31 +0000
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: talloc vs malloc speed
Date: Tue, 18 Apr 2023 07:52:30 +0200
Message-ID: <4268333.ejJDZkT8p0@magrathea>
In-Reply-To: <871qkigw1g.fsf@oldenburg.str.redhat.com>
References: <3161922.5fSG56mABF@magrathea> <5829842.MhkbZ0Pkbq@magrathea>
 <871qkigw1g.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 17 April 2023 21:15:23 CEST Florian Weimer wrote:
> * Andreas Schneider:
> > On Monday, 17 April 2023 13:07:59 CEST Florian Weimer via samba-technical
> > 
> > wrote:
> >> * Andreas Schneider:
> >> > Yes, we have support for destructor callbacks. Can you point me to the
> >> > attributes which might help talloc?
> >> 
> >> I think of those listed here
> >> 
> >>   <https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html>
> >> 
> >> alloc_align, alloc_size, malloc, nothrow, returns_nonnull are relevant,
> >> but not all them might be appropriate due to the way talloc works.
> > 
> > I've started to look into them, thanks!
> > 
> > The returns_nonnull did recognizable improvements to talloc pool().
> 
> The question is if it's true, it's only appropriate for xmalloc-style
> interfaces.  How does talloc deal with OOM errors?

Oh, then it might be some other side effect.

> > Using alloc_size leads to a lot of reports. As soon we access the talloc
> > header it detects out of bounds access :-)
> 
> Yeah, especially with recent GCC and Clang.

I think I should just define them for public interfaces so users of talloc 
will get better diagnostics.

> > The malloc attribute can be set to a few functions, that helps. I use
> > the attribute with the deallocator to avoid issue on free with
> > destructors.
> 
> I *think* that should be safe, but I'm not entirely sure.  Maybe ask on
> the GCC list?
> 
> > The documentation for nothrow is a bit short. What is an exception in C?
> 
> Same as in C++ on GNU/Linux, but you can't define your own exception
> types.  It's used for pthread_cancel, among other things.  The advantage
> is that there's no function pointer (equivalent) on the stack, unlike
> with setjmp/longjmp-based pthread_cleanup_push.pthread_cleanup_pop.

pthread isn't involved here, so we are fine. Thanks for the explanation.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



