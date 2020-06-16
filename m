Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC151FAE59
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 12:45:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=R1a/wdDTH4oDw8qOrUCJg8RK8fS+9ovcuImhXnOC8Pg=; b=UhW3w6KHXEHobV8xvKGKtsre9V
	6AIsckjuuY+5h9z9r8zx+rr7dCkngqRDC1g8OvefksXQqC1y09/6A0BGj83eL0gdRCWP6b6N9XJou
	lnl/QNNqxVBHVBYAubXRhpWOSyoXUt+yJJ6SBfu+lpGrjZ7d67iYEEA0kZBrV0BDewwe6yppJ0HIO
	mtnr71YJIBQLGU1lMfC8m0gnBHSG9KzuvQO5BzeZzuAMkHza4iDD1nbZ9uKBEpEadz7GlK+CoHlXz
	/tVZH+duPaaIsioxVjBMh0Tapkd7UE7nSvQAWU0WsHjGyq4GZ/eZZpJrM+2zgnKRvdp8FRleN43me
	1HCO/aDg==;
Received: from localhost ([::1]:22258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl958-000cS8-Tz; Tue, 16 Jun 2020 10:44:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl952-000cS1-0f
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 10:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=R1a/wdDTH4oDw8qOrUCJg8RK8fS+9ovcuImhXnOC8Pg=; b=f8ROnKydIH6trrh8hW9UZqIZjb
 /Oyb2A9ORTSn0G4um9VXL61swWnOs0ii5JGfe0PQBW1wxy24g21rvmYqCXOE5LipRjCIID7rGAhpU
 kWP7XSVEfgrOD1EPcKx4N+e2feAtgdArsIzQdHhzmPEmFYvVfJpykbttPQuP6y0sPCHh72a9VDSJP
 faycVqC4p8hpDOGYHJI5TFnFD6Rt4sGR6OUBT5x04HrCrk0lVMjWLHeZpSY3JFzFgooMz/lP1krB7
 xnLyhjEmYqOgVVlphH4WKvMvSlISPAQYRsxsCPcsFP11YKaSdGwr6TNRSlAAC6DGfNDfdbmOBKJDP
 NkTyaR0BWrZEuhsAFIac7n+VIpRbE7V9I+8B7LfcL4/R9tqr7hoJ775Ey08VdgIsjT/lfD7hHEDqs
 FEodEiUveQwwhw4BFbFYxAW8tLloK5GlzsG+BXzfVNuUBdyiVVFqeLSYkgTWlQzML3qSzTHDc1rPN
 EBI3pc9MBsjG+ESAdh6EYPKw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl950-0004f7-KB; Tue, 16 Jun 2020 10:44:35 +0000
Message-ID: <d018b61c8a0123f5c5b2d155088501e9e2ad599d.camel@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to
 allow removal for Samba 4.14 in March 2021?
To: Alexander Bokovoy <ab@samba.org>
Date: Tue, 16 Jun 2020 22:44:30 +1200
In-Reply-To: <20200616095350.GE3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-16 at 12:53 +0300, Alexander Bokovoy wrote:
> On ti, 16 kesä 2020, Andrew Bartlett wrote:
> > On Tue, 2020-06-16 at 11:26 +0300, Alexander Bokovoy wrote:
> > > What is required from FreeIPA side is a set of operations to
> > > provide
> > > implementation of PASSDB interfaces that deal with searches:
> > >  - search users
> > >  - search groups
> > >  - search aliases
> > 
> > Can you do that on the FreeIPA side?  pdb_ipa isn't in the Samba
> > tree,
> > could you handle the maintenance of the code it depends on?
> > 
> > Presumably you have plenty of other ldap client stuff on the
> > FreeIPA
> > side of the fence you could plug into?
> 
> So basically you are saying that you don't care how FreeIPA would
> handle
> integration to Samba PASSDB, neither you care about PASSDB being
> testable and used. Is that right?

Not really.  FreeIPA isn't Samba, and it isn't my primary concern, and
so I would suggest that some things are perhaps best handled on the
FreeIPA side of the fence, where you maintain the module anyway.

Now of course it is your concern, and I look in equal parts wonder and
horror at the way Samba is used in FreeIPA, which is why I'm asking for
feedback, because FreeIPA (and apparently NAS internals) clearly isn't
my area.

> My concern is that you are looking to deprecate interfaces without
> providing sufficient functionality to handle those needs, neither
> acknowledging existing proposed replacements need to be improved
> before
> even considering them.

The supported replacement of the Samba NT4 DC is the Samba AD DC.  

As pdb_ldap is outside of FreeIPA's use case it seems to me that there
is very little maintenance of this code, and so while it seems we will
kick this can down the road a little longer, the costs to maintain this
stack will continue to come back at us.

> Outside of FreeIPA, most of home storage devices built on top of
> Synology, for example, rely on pdb_ldap. There is support and
> integration for Samba AD DC to be run on Synology but there is a
> separate LDAP Server component and an integration with that one for
> Samba requires use of pdb_ldap.
> 
> As far as I understand, same feature and support is available in QNAP
> devices.
> 
> I personally don't think it makes sense to deprecate pdb_ldap now.
> Instead, I hope to look into improving its test coverage now that we
> have a good way to create test environments and use them in CI.

Thanks for your feedback, that is very interesting.  This is why we
raise such things on the mailing list.

I look forward to seeing the tests!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




