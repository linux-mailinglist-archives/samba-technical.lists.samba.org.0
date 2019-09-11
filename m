Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6FEAF4A0
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2019 05:18:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4lamdIrs3N4eqdk8kDFnp2Cs/26VSi003tBxEg6+cFo=; b=zcQHzuNFC7epguureM84iwg1nV
	RsMbMg7SJrIltWTBerV2qKYvG/hFXOFzmzDcxheE42R+0LlUFKuMJOmDlpT+ScAMrq2HOyhWUwml5
	UEX+h2Lhs7GvTYeHByySitv43evvjGGMnbtqLYQcc3bvvqRiK+z1AIY8ZLnlAeTNEftOY8PxbgRL8
	gHavbds3OvFAvR1QhV8fud4ursEGWnMxd9NysMDXa1QIinOCZRW/Q4eUfVJaTqEWeFEgeXleqrNto
	tfZZWG0teqWQ70pPl5Vwdp4OZ/hEIlbP9CDvua2s2ZmB1egMU3EIqncrgk43us40PrtB8oH2AeswR
	9ryzEszQ==;
Received: from localhost ([::1]:49226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7t8f-004dqA-RW; Wed, 11 Sep 2019 03:17:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49234) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7t8Z-004dq2-Lt
 for samba-technical@lists.samba.org; Wed, 11 Sep 2019 03:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=4lamdIrs3N4eqdk8kDFnp2Cs/26VSi003tBxEg6+cFo=; b=EH/4FLlcWMj0vX1PJr4h99lPNk
 ussen0FPGpxliP1HdF2IgVYt7+ieF9yPHVCcSXGe7sMC5VuO39eiNmITgRY2xKAnjQwQeacxAYKbT
 X7UtLIxyYoT25p18LYsOukB8PA4310D0YXRQODlHSuiVIRyCrC0z4C9JlrFS3iYqwaf4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7t8X-00051I-6m; Wed, 11 Sep 2019 03:17:41 +0000
Date: Tue, 10 Sep 2019 20:17:28 -0700
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190911031728.GA31067@jeremy-acer>
References: <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org>
 <1567745657.20732.13.camel@samba.org>
 <20190911113418.5475ad27@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190911113418.5475ad27@martins.ozlabs.org>
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
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 11, 2019 at 11:34:18AM +1000, Martin Schwenke via samba-technical wrote:
> On Fri, 06 Sep 2019 16:54:17 +1200, Andrew Bartlett via samba-technical
> > I would document it as (roughly):
> > 
> > - GitLab is the strongly perferred method to contribute to Samba. 
> > - Patches mailed to the mailing list may still be considered, but
> > require additional work on the part of Samba Team members so are
> > discouraged. 
> > 
> > If you are interested in reviewing patches submitted to Samba, please
> > ensure you have a gitlab.com account and are watching our public gitlab
> > repository. 
> 
> Sorry, but NACK.
> 
> Samba is a Free Software project.  While that is true we must not
> mandate a proprietary platform as the only way of contributing.  Nor
> should we discourage contributions that are not made via a proprietary
> platform.
> 
> There are many reasons why a new contributor may be unable to use
> GitLab, including:
> 
> * They may not agree with the terms of service
> 
> * They may not wish to take the time to setup an account and be added
>   to the required project
> 
> * They may find the user interface unusable
> 
> * They may not have (reliable) web access
> 
> They may still be able to make very worthwhile contributions.
> 
> Ironically, Git - and, therefore, GitLab - exists because the founder of
> the Samba project did not think it reasonable for a proprietary product
> to be mandated for development on another project.
> 
> More pragmatically, GitLab may go away, so we should keep our options
> not only open but also active.
> 
> We should continue to encourage this mailing list as an option for
> contributing to Samba.  If a reviewer prefers seeing a GitLab CI
> pipeline pass before they look at code then, if a mailing list
> contribution sounds interesting, they can save the patch, run "git am"
> and push the resulting branch to GitLab GI in less than a minute or 2.
> They can then reply to the contributor saying "looks interesting,
> waiting for GitLab CI pipeline <url> to complete".  This mailing list
> isn't so busy that hand-processing a few contributions will swamp any
> reviewer's time.
> 
> Sorry, mate!  This is a hill I'm willing to die on...

So if you feel so strongly about this (and I'm sympathetic
to the web UI being just "someone else's computer" issues :-),
is it the wording of:

"Patches mailed to the mailing list may still be considered, but
require additional work on the part of Samba Team members so are
discouraged."

you really object to ? The mailing list isn't going anywhere,
as it's the primary technical discussion list.

How about we re-word this such that we encourage contributors
to use gitlab if they prefer or are used to this interface (as
many new developers are), but still encourage patches on
any medium - including the mailing list ?

We're not so developer-rich that we can afford to turn away
help given by any means :-).

I think the "require(s) additional work on the part of Samba
Team members so is discouraged." is a statement of fact on
Andrew's behalf. It may not be the case for all Team developers
of course.

Can you suggest alternative wording that would work for you ?

We do want people who are used to gitlab to feel comfortable
using it to contribute, semi-proprietary though it is:

https://akr.am/blog/posts/gitlab-isnt-really-open-source

But we obviously still want to encourage pure Free Software methods
of collaboration.

Would that work for you Martin ?

