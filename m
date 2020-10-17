Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0375D290E9D
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 05:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XDNNOa2NaCLSpbunRiV7ZdYDBHbOEpbR6t+ykySPiyo=; b=E9rD75PhZNH6uvklIjAeIUc6lv
	NQNM5TaRSgspQSCIBYk+QPKI+TdJrd2HSRUk6MgLDSwuGksFupdZ6L6T/M86UbXNIJfXwuULegv0v
	juzVAyAYW6YHAySuvvX9FlG0yBF980VykXyL5C6TqBQzYyRAYLwZeiQ4DWBwDmvlgmSa46O5WfRyC
	uqHdd01Cs/2GAjUxWwvRJ+LELLQ4Bh8JxCM73q8TR+jgc7HD1J9Fqa1u6u2vr7+YEqHz66oKzkQsp
	/BrXbOAfPiNwKgKoB/ZsUsY4csy17NILL6qAEzG/FKOqPiq2goBWD6yh7Mitz0DlLiVpTAGyxDJHo
	gZzYx+pA==;
Received: from ip6-localhost ([::1]:28864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTcpM-00CUeu-Vh; Sat, 17 Oct 2020 03:24:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTcpH-00CUen-Ap
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 03:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=XDNNOa2NaCLSpbunRiV7ZdYDBHbOEpbR6t+ykySPiyo=; b=mlWbANLQ6ToNWwY9BVf6CaKfxX
 j5H1z5aDgxSFfPCSPOVUdRfHcrHGFnjHkZH92/dYX4VNyEA7WbbPj+75pPb4h4qQ4VuwSSIaSxals
 +Cma/0mJdoxQTnECYnJt4yv5IsAlxtzgZxJt03gXpXQew15txPNwo7QGh/i8bGh7n6abFflHm0LxX
 dDTSehvx7eF3/2cuYb6wPyLfshd8EcRuZXH+2kcxCvJ/YLjn1ORoKz2t7M8P5UuFSgsQOuVe9hF0a
 Vq2279L5DoDGC5EtzoHh9kacdEa0bEYMmkuJu3D+SyFWru65oLx10RwYI2AKIh2Q4igbVBP9AogCI
 wfe+TdmA7OQyx6BaBk4wZuukxDtIL1FlAeeCRm+mEuwVfE/NguiINs9V+wIiTbiuJ/snItClS72+s
 w1RmzMWdkim8KGtlQyVZeifRndirbDM4XFFYRXXu5rwymk1veG5LjXT+02Noo5ayspx9Frz4DYBkd
 9fHZB3TgAaOjRhGz9Jaw+/Z/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTcpG-0000AO-Lb; Sat, 17 Oct 2020 03:24:11 +0000
Date: Fri, 16 Oct 2020 20:24:08 -0700
To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Subject: Re: Clarification around the DCO
Message-ID: <20201017032408.GD360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
 <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017023840.GA344206@ebb.org>
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

On Fri, Oct 16, 2020 at 07:38:40PM -0700, Bradley M. Kuhn via samba-technical wrote:
> Jeremy Allison via samba-technical wrote:
> > Ah, I've just remembered *why* we have a difference from your "standard"
> > DCO text.
> 
> Yes, a tremendous amount of time and effort went into figuring out the right
> policy for Samba with regard to contributor licensing.  Some of those
> details were reported publicly, and some were reported privately to the key
> folks in Samba.  I myself put in many hours of work on this, as
> did many other Conservancy staff, lawyers and Samba volunteers.  Nothing has
> changed with regard to the analysis.  We also had a private discussion at a
> developers' meeting at a Samba XP about the reasoning, IIRC.
> 
> Obviously, if Samba wants to redo that analysis at this time, we'll do what
> needs to be done to help Samba as a member project.  But I don't see any
> reason given here to redo that work.
> 
> I already made a merge request days ago about changing the name and there is
> a thread discussing that (but consensus hasn't been reached).  The name
> really doesn't matter, but the content of the terms certainly do.  What works
> for Linux as a project doesn't work for everyone.  One size doesn't fit all.
> James has every right to his stated agenda of getting the whole world to use
> the unmodified DCO, but the statement that Samba is "outside the fold" for
> failing to use the specific terms is just rhetoric.  Samba doesn't use
> Linux's license (GPLv2-only) either, and is unlikely to want to switch to
> GPLv2-only.  But changing your contributor licensing terms is as big a
> change as changing the license of the project itself.  It's not usually
> considered particularly friendly for folks outside a project to come by and
> ask for the project to change its license details.
> 
> Finally, changing the *name* of your developer representation statement and
> its *contents* are very different discussions and should not be conflated.
> The former is an easy change and purely cosmetic.  The latter is hard and will
> change policy and legal outcomes for Samba.  IANAL and I'd want Samba to get
> confidential legal advice from a lawyer that represents Samba's interest (as
> it received back in 2013) before making the latter change.
> 
> I suggest the community first consider the name change and execute it, and
> then only after that's done consider whether the contents need to change.
> 
> I'd be glad to update my merge request on the name change to a name
> that you all reach consensus on.  I haven't seen anything that indicates
> a name change is mandatory, but it would clearly be a nice thing to do.
> One of my life philosophies is to generally try to do almost anything
> someone requests if it's an easy thing to do and won't cause us trouble or
> substantial extra work.  It's that principle that makes me support the name
> change but oppose changing the contents of the developer representation.

Just to repeat what I proposed to James:

"In the meantime the quickest way to get to a non-conflicting situation is
to change our name to "Samba Developer's Declaration"
(if everyone on the Team agrees) and add the CC-By-SA
(C) notice so we're fully in compliance."

We can then consider how and if we can unify with the Linux DCO
at more considered pace.

