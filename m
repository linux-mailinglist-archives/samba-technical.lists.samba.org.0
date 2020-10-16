Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A32AA290CB5
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 22:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3hdm7vAzJ0zR8kC6ye+KrGlAtXo+AhxRTyFvEGvw74s=; b=199pD8Om4FH7y15THDXM6ZTRBI
	eqzEBLWA5Lk+IaO5ONiTJReGWxhh+hG9gqJYQ6cXHXsqNQds/RKARB7jkzTNsnxAZpg7wlLkKR+GD
	kBUorjzDLYlFiPATFCf1jajItzi0dCbokE9yCWoFJH609PeAZgXCZxakTPRv6h+9p4wJNV6FC9OTP
	g1BJ1qMcptzdQ2dDTkONEtL+3Zy49qiIUB9A0+4/VKFYvrHLRZLA/c6HC18Z35Ps3k80HQLhORFv6
	FhysCvH1UeR+2Ixecijgo0sFkTWZ16lT6J8IumfgD3/048EO/1R3jT7zISR/qVOH3yF0hF8ZhG/vv
	yU4paoPg==;
Received: from ip6-localhost ([::1]:64368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTWIC-00CSRa-KJ; Fri, 16 Oct 2020 20:25:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45478) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWI8-00CSRT-Bb
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 20:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3hdm7vAzJ0zR8kC6ye+KrGlAtXo+AhxRTyFvEGvw74s=; b=FQ2Fi1BM+KHKqUK6ds/FtKwNd0
 nLkknFIxzsAuK4NggghIMIsOPrMoZlypuSpimX/2ZRF4nVfJhZk6M87yHx9ACWAGVpwYeEZjiKlfO
 46QqoLEtkwQV8A7wRyQ6Zv0JnKAVYs2+AZwTJR613+dkdAio07CFBXgeM2qQzyJz5ksKFa6FcnsiB
 U2wz1DBOhBs0SEiK/4l7pgSZO1cONc4Cv/IkXOKw6V4y8KYjshOsPeXz2birrZul6ggwNT8fmuxKa
 RNu8H4m5rjIuu9KhzjUi0zp2lmGxhfOZMnWDWMTgGMgZoAE9ngptLeqc/UUMk6fGFY+aLitYlMdIN
 Dnso6RBWH4CE4L4oqS9TSmxbZ5QeSqxRFG/1gZ4FCx7zrRGWhqPvR01NZ/FdQuqc4gfP85IHm+Ojd
 ry/5KhT7zrQFTRF3aX+ffcOLAf7fod4MjKJMeLMwezPa95EDyiE2Hq6/Y6+6N1thMqXaUL+aNOgKa
 M5d9n9noiP/FtLn5ijlqgCLf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTWI7-0006OG-Mw; Fri, 16 Oct 2020 20:25:32 +0000
Date: Fri, 16 Oct 2020 13:25:28 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201016202528.GF67086@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 03:04:36PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> 
> As for what the semantics should be, I was thinking that, yes,
> a pool in its entirety should be included in the memlimit calculation of
> its parent chunk, but if a memlimit is set on a pool directly,
> only the memory used by the children should be included in the
> memlimit check.
> I didn't get far enough into the code to see how many assumptions would be broken by this.

All of them I'd guess :-).

> An alternative that'd still satisfy our immediate need would be to have talloc_set_memlimit simply fail when someone tried to apply it to a pool (as you suggested), and add an optional flag that'd prevent allocations from occurring outside of the pool.

Please wrap your responses to 80 columns :-). Makes
quoting your replies really hard :-).

What you're asking for is more complexity in an
already overly complex part of the code (which
to be honest I wasn't even sure people were
using :-).

I think you can do what you need by allocating
a pool as a talloc child of a context, and setting
the memlimit on the that context.

