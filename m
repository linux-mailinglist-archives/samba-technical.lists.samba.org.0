Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A6290E95
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 04:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DkyiEIkar+e/EGQbuP9Wz2K+U3enDXkmeJpss4VV1AU=; b=vuEVjHU+lqiztKaiNK+ZifJSq6
	ai/wIgl/q/pfvWiJMLGYHAenTBjuG/g22qAYR7WBZ9qnopt70981qya9UDj5LwwOmsp/g6vLhpUVt
	rW9Hzko0kFrRJ2EMXj1d0NJSMmAkGJXy56DiF0eMKztYy4E0MfCyVzj9td3DbzBBipdhYf9po9Qcg
	qybXaIAIGyht3ZPgXhug86DZ6GsjgYRl9xwVihCRVB6JHXQWUab4eqtl1fgLpAxyOhZuYAaURxStD
	yJNDsphsva3Pt443B8Xskx4XZ6MEseYZOeAk+4ITHmuH6hFncxVZAii2+28VlMMBQL0VCJoHm02jT
	lSRnGmmQ==;
Received: from ip6-localhost ([::1]:27410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTcM5-00CUQX-0u; Sat, 17 Oct 2020 02:54:01 +0000
Received: from pine.sfconservancy.org
 ([2001:4801:7822:103:be76:4eff:fe10:7c55]:38038) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTcLu-00CUQN-Oh
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 02:53:57 +0000
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by pine.sfconservancy.org (Postfix) with ESMTPSA id 53691EA8C;
 Sat, 17 Oct 2020 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
 s=pine; t=1602903209;
 bh=Fin7NYC94qEzw0nG3Un0Om1jEiE6uvrSjWYGrUVn2X8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=V5fPrduuPnIirDTMfHzOc4T23ZPDmkKVzkO9qy6+NItj5rULgcnXB7SQ5AU2y9+57
 vWUWiMnjYBNmItGBarB5viSFne8IDhV7AR1SI0tss328HnsOio8TSqQfilO10ess4S
 LBrhzlDBS9v+DQknfNpjPsaYhP8oBUyLe13miLpFLdum7PiA60KPXSTjmSmpSIlt3C
 ghK10jeXYagANeWHegsX/Y9tLDeybPs1lLjjK1MtCDZ9q3I6C03DcbyjVpX8+2FLwZ
 lbHjZ5VayrTmwmuUbv9L7qMViTXz0/LniYRKQXvTtw6ZyEQTTzyOkEDS1F+9E1x58X
 WiNg2TpJ5Uo2Q==
Date: Fri, 16 Oct 2020 19:38:40 -0700
To: samba-technical@lists.samba.org
Subject: Re: Clarification around the DCO
Message-ID: <20201017023840.GA344206@ebb.org>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
 <20201017005611.GB360279@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017005611.GB360279@jeremy-acer>
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
From: "Bradley M. Kuhn via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jeremy Allison via samba-technical wrote:
> Ah, I've just remembered *why* we have a difference from your "standard"
> DCO text.

Yes, a tremendous amount of time and effort went into figuring out the right
policy for Samba with regard to contributor licensing.  Some of those
details were reported publicly, and some were reported privately to the key
folks in Samba.  I myself put in many hours of work on this, as
did many other Conservancy staff, lawyers and Samba volunteers.  Nothing has
changed with regard to the analysis.  We also had a private discussion at a
developers' meeting at a Samba XP about the reasoning, IIRC.

Obviously, if Samba wants to redo that analysis at this time, we'll do what
needs to be done to help Samba as a member project.  But I don't see any
reason given here to redo that work.

I already made a merge request days ago about changing the name and there is
a thread discussing that (but consensus hasn't been reached).  The name
really doesn't matter, but the content of the terms certainly do.  What works
for Linux as a project doesn't work for everyone.  One size doesn't fit all.
James has every right to his stated agenda of getting the whole world to use
the unmodified DCO, but the statement that Samba is "outside the fold" for
failing to use the specific terms is just rhetoric.  Samba doesn't use
Linux's license (GPLv2-only) either, and is unlikely to want to switch to
GPLv2-only.  But changing your contributor licensing terms is as big a
change as changing the license of the project itself.  It's not usually
considered particularly friendly for folks outside a project to come by and
ask for the project to change its license details.

Finally, changing the *name* of your developer representation statement and
its *contents* are very different discussions and should not be conflated.
The former is an easy change and purely cosmetic.  The latter is hard and will
change policy and legal outcomes for Samba.  IANAL and I'd want Samba to get
confidential legal advice from a lawyer that represents Samba's interest (as
it received back in 2013) before making the latter change.

I suggest the community first consider the name change and execute it, and
then only after that's done consider whether the contents need to change.

I'd be glad to update my merge request on the name change to a name
that you all reach consensus on.  I haven't seen anything that indicates
a name change is mandatory, but it would clearly be a nice thing to do.
One of my life philosophies is to generally try to do almost anything
someone requests if it's an easy thing to do and won't cause us trouble or
substantial extra work.  It's that principle that makes me support the name
change but oppose changing the contents of the developer representation.
--
Bradley M. Kuhn - he/him
Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
========================================================================
Become a Conservancy Supporter today: https://sfconservancy.org/supporter

