Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2FB32C8
	for <lists+samba-technical@lfdr.de>; Mon, 16 Sep 2019 02:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IrOrO9WLvH+f2YwAZY4YhZgqNQGw2ysTPARub0O3PVI=; b=fqdagbyj2rGIIRDexVjr6zEhkS
	FxU6e0vzlumM+CIp/BoLLD8Cr0Eu6ZuiI/omY6nY0CxAqX+sehPPEHyN4FDWSbuWHRHPLmfjOqT3n
	TZrUdFq1t0HaxsKAaRxRcTC/bP6d7EiqbTdv5PSop4ctVkeWJeDJ1CZwjRnLrX/i34qU1d0W1IG5z
	L5YOsIk6I8o6no7uLzVobI7GhrdugZNZL4elGKOpvZgm5E/vgPOtlK2fRFAwsiMCSMMvdeJF2N00x
	zQLE5IZS7+xaQsiamGbSXd7vfc//2ojLNY/G6vv7OgM8FmEP/IyyLzuGIEzDPwOJIBnjyV12EL52C
	tP4mLWuQ==;
Received: from localhost ([::1]:47146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i9ess-005pcI-7O; Mon, 16 Sep 2019 00:28:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46074) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9eso-005pcB-A6
 for samba-technical@lists.samba.org; Mon, 16 Sep 2019 00:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=IrOrO9WLvH+f2YwAZY4YhZgqNQGw2ysTPARub0O3PVI=; b=p3HUCLvSepbn98SKOmMnrY+Wpj
 e06yZFVKCHyHpS7vFGNYchKV/Eb41Wm++teipBAO2j+MWy6vBlEelLhlg1611N2UTI/0nDGllXRpu
 ZzL3c62dMcEmo8oFpQV50r9DbX1m2lQgBZRSPbaX1RyogtPxljGbOcF4GLMlQJfuIaQM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9esn-0001sn-CY; Mon, 16 Sep 2019 00:28:45 +0000
Date: Sun, 15 Sep 2019 17:28:39 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Is it correct to have an INHERIT_ONLY, CI, OI ace with
 GENERIC_ALL as the only perm set?
Message-ID: <20190916002839.GA20437@jeremy-acer>
References: <CACyXjPxfTd-DOVA3L1eqF_RZa_iKnnPEtiwX7dQP3jRr9kx3tw@mail.gmail.com>
 <20190916001515.GA18760@jeremy-acer>
 <CACyXjPw-2t+f8ZSGvCJCenPO1f1JPXkKZmdH+CZKZZ9WfHgLRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPw-2t+f8ZSGvCJCenPO1f1JPXkKZmdH+CZKZZ9WfHgLRg@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Sep 15, 2019 at 05:19:40PM -0700, Richard Sharpe via samba-technical wrote:
> On Sun, Sep 15, 2019 at 5:15 PM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Sun, Sep 15, 2019 at 05:04:17PM -0700, Richard Sharpe via samba-technical wrote:
> > > Hi folks,
> > >
> > > I have a capture from a GET INFO SEC INFO from a NetApp C-Mode
> > > simulator where one of the two ACEs on a dir is an IO, CI, OI ACE with
> > > GENERIC_ALL as its only permission bit set.
> > >
> > > Is this legal?
> > >
> > > If so, I guess it maps to 0x1f01ff
> >
> > Isn't that the equivalent of a POSIX directory
> > inheritance ACE of wrx ?
> 
> Well, it seems that Windows does allow it, if this is to be believed:
> 
> https://stackoverflow.com/questions/25163174/get-generic-folder-permissions-like-generic-all-using-javas-aclfileattributev

Ah, I misunderstood you initially. Yeah, a GENERIC_ALL
should have been mapped to the file-specific bits on set
I would have thought.

