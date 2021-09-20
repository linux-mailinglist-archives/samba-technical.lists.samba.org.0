Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3B4412977
	for <lists+samba-technical@lfdr.de>; Tue, 21 Sep 2021 01:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MZRFQsfgmRwycBkE93mXg/ueBX+E4dJyN6++jE3Jbwo=; b=YFCKvqtp2lCSlsn/Ptv8Vo4BJs
	4d3toudQgzQXc46QrDFTQkWMDDqMzbxTwHTYBTZOgNjpB1kxf8h7YXrIo/ejeDxoJgqYj1mZEG8AG
	aCtOXZGFJEDyolZGsCM+YHFozzbbJ9eGJ8si0H9eo2RUE2HcPhkh6MX0eldXTnTIcYpQVNLDSaimk
	7dqnrRFUIBU5xhAuE1RL+7h6Fp4vTQBqn11EP74dKkf8Ek21QAzqDAWTBk1WiwS8pywM9znYTwpKq
	yt0edMrNw3BIJUwgJ6a3qXBBH80adR/jifWJPMxByJHkm5Sw5W2YyeJBeh+bz7u8gF2jFjw8j7tXC
	FxUePxhg==;
Received: from ip6-localhost ([::1]:22070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSSoB-00GBMn-QE; Mon, 20 Sep 2021 23:34:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21710) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSSo5-00GBMd-0i
 for samba-technical@lists.samba.org; Mon, 20 Sep 2021 23:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=MZRFQsfgmRwycBkE93mXg/ueBX+E4dJyN6++jE3Jbwo=; b=Fw6ad1ipFYzFD0IAtVmTX6ZxZU
 HYTxRii+kYd9r1NedYKceATP+iASjUIFi6sMq0BPhET6V/oKipuFjImGnkav00y6zFJy2kGWKWoHt
 0rPT5K62q7bMZ+XShRTC8ulmcOmE4ARVlswFnVhOUQM6Iwrl/dTEqQxC+AqyemnXmWBeIaZd+x+cw
 zvEHOQRKAjTGf19FDw8BAKSsI5Z7YZ16BeZX874XkyBYvfEu8F9ILW+ibx6I9ohhKwAcncW9lYsqg
 J3VagpUukx4X6PQv4zwEMH3WfgYWo+gTYFT6Lrl+7JR5U+cwJLi1RdTS6bmmJn4bdCBWaPr0oh+j2
 BfiavXmJyNENSwX0R93x0Ps0QlYeB2uoRERw4+PuAKs67jYQnrYqfecrQoci34KQcBN8eQElHPFwY
 GTYEkuDqfAX+hGIhPaml0RfW4cRwCZl7rweWuESQK5+WNceu0o73j/5jTSjPRYkp0X4gqlEBgjgba
 xr6hnZ/CC68NCKLFsfX0ru6i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mSSo2-0073tE-Fj; Mon, 20 Sep 2021 23:34:38 +0000
Date: Mon, 20 Sep 2021 16:34:35 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <20210920233434.GA197511@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
 <20210913195901.GA28442@samba.org>
 <16e822776813310d1635efa74be2455d329308a6.camel@samba.org>
 <20210914000750.GA80819@samba.org> <YT/w7hv4WIH9gwK5@jeremy-acer>
 <20210920174450.GA28517@samba.org> <YUjONiieEwjWLHBM@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUjONiieEwjWLHBM@jeremy-acer>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 20, 2021 at 11:08:54AM -0700, Jeremy Allison wrote:
> On Mon, Sep 20, 2021 at 10:44:51AM -0700, Christof Schmitt wrote:
> > On Mon, Sep 13, 2021 at 05:46:38PM -0700, Jeremy Allison via samba-technical wrote:
> > > On Mon, Sep 13, 2021 at 05:07:50PM -0700, Christof Schmitt wrote:
> > > >
> > > > https://gitlab.com/samba-team/samba/-/merge_requests/2170
> > > > removes the code and does some minor cleanups in related codepath.
> > > >
> > > > Jeremy, could you take a look? Should we keep the "kernel share modes"
> > > > config option? Or just remove it?
> > > 
> > > I think we need to keep it, as on "normal" VFS backends
> > > we need a way to turn it off. I'll comment more on the MR:
> > > https://gitlab.com/samba-team/samba/-/merge_requests/2170
> > 
> > This has landed now. Would it make sense to rename the VFS flock call to
> > something else like "filesystem_sharemode" or "kernel_sharemode". It has
> > nothing to do with "flock" at this point, so it looks confusing.
> 
> Yep. Now 4.15.0 has shipped it's a good time to make
> ABI VFS breaking changes.

When you have a minute, could you take a look at these patches?
https://gitlab.com/samba-team/samba/-/merge_requests/2181

Christof

