Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B5290EA2
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 05:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XpUX18po0yqXaRGmN6XrZtQPCj6RoqmsswRu60/bV1E=; b=RRSpmEB4DN49N82En6uJPwOB5R
	F9vjRHbmt8xGxxz30Z/yBfKoJ6Vw8TzNS7HNJ88+NF+mdmybB2cylWQNVY0ACDCRN1NLhvklo0k0f
	iC7mAkYkLsWGbI/+57WazPrCl+88KzeKsBzE6/IcQSL986u03NrhWmGcApLdDKxKgHmOeJgT/c0mB
	ruYLZQUpQAivphaX/7Iuvjwbl/dzk60o5XSEn+XX4sr492vYmRA5e9kRZRbp41/hHs6re+MV9j+/s
	843VV5arGqtTxrTIMS26+O5YKvMZdcLd3Qq8FPcyRLiU1ibeOg7TMTtL2QCImntUO3jsePWPB19wE
	J9kKzY7A==;
Received: from ip6-localhost ([::1]:29590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTczI-00CUm1-41; Sat, 17 Oct 2020 03:34:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTczD-00CUlt-1J
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 03:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XpUX18po0yqXaRGmN6XrZtQPCj6RoqmsswRu60/bV1E=; b=OMwF+u1yXOE4yGe43OkTYo9DQv
 ya6odSU2YHGM1Dezol63OWhACh93VFVj53BJcrlQ+uKlG7s0EQjZN142yesvhjveYKmBKixJeHnQ4
 ES5cZuJFbWGYtGmgt57gPrRTiE5P58RH+3vHrzWWV0R6YFceIQtoNH3tLfqMb6aw2qNV2TvJxZSOz
 tmeSlAM0uSImQfkWk1b4VzfrOJh9YPtd2slGK2WrhQUyTcI11NTBVCrNLPf+Q/HRpgVIXsKkL+pQ6
 2EQTZV93NXbguhEc1LHIZgCt8ZxGBStZROdybLX5Zxg+tviKMjIawmUp6I3FN4TAcZpdqY2YipRJw
 JTVKq5XfPpTuCOWPeYs7uS26yAawTktlblNNLneU8fPJdTA09jk8ssXtnOWrfn2K3k6ok16oWqLxF
 Tk0v+F7S/3aq2jHkVyx4K7oW7HTV2sq7dh9wUlWPxC+XvuxzuD01I8TKdiGKB7oweSmIQbexF/OTS
 Rc/G0AUGRvS/l0fvcMWWoffH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTczA-0000EL-Gt; Sat, 17 Oct 2020 03:34:24 +0000
Date: Fri, 16 Oct 2020 20:34:22 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201017033422.GF360279@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
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

On Fri, Oct 16, 2020 at 07:52:48PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> 
> >> An alternative that'd still satisfy our immediate need would be to have talloc_set_memlimit simply fail when someone tried to apply it to a pool (as you suggested), and add an optional flag that'd prevent allocations from occurring outside of the pool.
> > 
> > Please wrap your responses to 80 columns :-). Makes
> > quoting your replies really hard :-).
> 
> Will do :)
> 
> > 
> > What you're asking for is more complexity in an
> > already overly complex part of the code (which
> > to be honest I wasn't even sure people were
> > using :-).
> > 
> > I think you can do what you need by allocating
> > a pool as a talloc child of a context, and setting
> > the memlimit on the that context.
> 
> I just tried this and it didn't work, the reallocs still fail.
> 
> This is likely because the limit needs to be the size of the pool plus 
> headers.  I don't believe there's any way for the caller to know the size
> of these headers, but maybe you know better :)
> 
> talloc_get_size() returns 0 when called on the ctx or the pool as the
> docs suggest it should.
> 
> Do you have any idea how I could determine the correct value to
> pass to talloc_set_memlimit?

OK I'll take a look and see if I can get your sample
code to work. This will be on Monday at the earliest
though, I'm trying to shut-down for the weekend :-)

I still think trying to have a separate memlimit for
a talloc_pool is A.Bad.Idea.(tm) but that's due to
the fact that talloc pools are widely used for efficiency
reasons and the memlimit code is at best a horrible
carbuncle I wish we could get rid of :-).

