Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA99292097
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 01:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1P75ZhsMcACwsjB0Y05FXkBlNcTcFVCemAEKgDNO9PI=; b=1W0AVuTr40zx+9kokivbaILjRr
	9KdNoVhFPglz7/uR9wLm9vNQVgF4cRpXRMOwl4mH4PazI6/nL1y7f9AhZQSjScrUtX7n+RD6ssYsq
	SpcU2Lug7HWR5kV0edJcntadqMM8WW6pGIAXrlZhq8WeFIN67NVyiJFXGTOhi3AI+KBhCIzdUnT0j
	KH3513VtAyWp3ApFdgTO77GO08fFp3wcKmMfzGw3jwWskdKKt8mqOwGSkhhBnp3rLdT3N0SH4KC/c
	QVtRYhLebJkYDZWjEowLUrt/RyPFP8iPgJhtyNtCEaxQ9tKcyDwfYBSgwZoPOYNBypqvjdShX7EAj
	dLA4CY1w==;
Received: from ip6-localhost ([::1]:20060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUHyQ-00Cdti-AE; Sun, 18 Oct 2020 23:20:22 +0000
Received: from bedivere.hansenpartnership.com ([2607:fcd0:100:8a00::2]:48446) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUHyB-00Cdtb-GV
 for samba-technical@lists.samba.org; Sun, 18 Oct 2020 23:20:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id A0C3C128046E;
 Sun, 18 Oct 2020 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1603063197;
 bh=d9XQH0qN6zXy7szn3zDvlot4T58H9RcPDuIU4ySvZSY=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=DWZd3dyjzWDe0mEAE1Sk8CCApgvWts1nQJ1bd3LFJ9OgTUnCBiuy8TuC8xoKJbdy1
 2FI5NDkiA9iMWEGK0mRGzjT4IBGZwOMVvtHUIbI6ylJ+YZml3Rc5LCY0bLLGnKOc2s
 rk2CGHJSbi0Dei2Hn5jbFx3+ITKJxL8P0n7l5+H8=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id CSUDdgUKLRkc; Sun, 18 Oct 2020 16:19:57 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::c447])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4681F1280456;
 Sun, 18 Oct 2020 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1603063197;
 bh=d9XQH0qN6zXy7szn3zDvlot4T58H9RcPDuIU4ySvZSY=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=DWZd3dyjzWDe0mEAE1Sk8CCApgvWts1nQJ1bd3LFJ9OgTUnCBiuy8TuC8xoKJbdy1
 2FI5NDkiA9iMWEGK0mRGzjT4IBGZwOMVvtHUIbI6ylJ+YZml3Rc5LCY0bLLGnKOc2s
 rk2CGHJSbi0Dei2Hn5jbFx3+ITKJxL8P0n7l5+H8=
Message-ID: <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
Subject: Re: Clarification around the DCO
To: Andrew Bartlett <abartlet@samba.org>, "Bradley M. Kuhn"
 <bkuhn@sfconservancy.org>, samba-technical@lists.samba.org
Date: Sun, 18 Oct 2020 16:19:56 -0700
In-Reply-To: <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: James Bottomley via samba-technical <samba-technical@lists.samba.org>
Reply-To: James Bottomley <James.Bottomley@HansenPartnership.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-10-19 at 11:00 +1300, Andrew Bartlett via samba-technical
wrote:
> On Sun, 2020-10-18 at 13:38 -0700, James Bottomley via samba-
> technical
> wrote:
> > On Fri, 2020-10-16 at 19:38 -0700, Bradley M. Kuhn via samba-
> > technical
> > 
> > wrote:
> > 
> > > Jeremy Allison via samba-technical wrote:
> > > > Ah, I've just remembered *why* we have a difference from your
> > > > "standard" DCO text.
> > >  
> > > Yes, a tremendous amount of time and effort went into figuring
> > > out the right policy for Samba with regard to contributor
> > > licensing.  Some of those details were reported publicly, and
> > > some were reported privately to the key folks in Samba.  I myself
> > > put in many hours of work on this, as did many other Conservancy
> > > staff, lawyers and Samba volunteers.  Nothing has changed with
> > > regard to the analysis.  We also had a private discussion at a
> > > developers' meeting at a Samba XP about the reasoning, IIRC.
> > 
> > In legal terms you usually really, really don't want to be special
> > because it causes all sorts of complications if there's any
> > litigation.
> > 
> > This reasoning lies at the heart of our desire to move the DCO
> > beyond the kernel, because if we keep it to the kernel it becomes
> > our legal specialness problem in the same way.
> 
> That is all well and good, but the way this is playing out here is
> really awful.
> 
> It would be one thing if somebody, perhaps you, came to our project
> politely suggesting 'have you considered the benefits of'...
> 
> The process here is just rubbing everyone up the wrong way.

I understand, so let me try to explain why this all blew up.  The
origin is a row on another list which is populated by a load of
lawyers, a lot of whom are also Corporate Counsels.  This other list is
governed by Chatham House Rules

https://www.chathamhouse.org/about-us/chatham-house-rule

Which forbids quoting what was said and who said it.  However, I'll try
to describe what happened without violating this rule.

For background, a large number of corporations, through their counsels
(who are mostly on this other list), have requested changes to the DCO
over the years (a lot of which were trying to prevent patent capture). 
All of which requests we've rejected on the grounds of not wanting to
cause DCO fragmentation.  On this other lists, there was a discussion
of the DCO which lead to the implication that we'd authorized Samba's
change while refusing all of theirs'. We were forced to deny this
implication robustly in case the other list members got the wrong idea.

Our robust denial got back to the SFC who engaged us privately on this
topic.   What we actually said to the SFC was we'd obviously done
nothing about the Samba issue in the past and had no plans do do
anything now; however, if the SFC could help us engage in discussions
with Samba, it could potentially lead to a a win-win outcome we could
report back to the other list.  The SFC told us that actually they
preferred to let the matter drop.  Thus it was rather a surprise to us
to find Bradley's patch on the Samba list, but we figured that now the
situation had been broached we may as well try engaging.  All the rest
you've seen on the samba-technical list.

If there's no desire here to investigate DCO alignment at this time, we
can let this aspect simply drop and you can resolve Bradley's patch in
the way you see fit.

James



