Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFC4C085
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 20:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6diCRsa2XRztOkBuYmvWWVWzZ18vfXjsiyrn1agLlaU=; b=EoJO0l4oaOiJLDhUZHylq/0afw
	aaOsUb0HYMfhL+Uk490nj61sWYdQKOxXJISOqyOqtWwgLpxCqZ+Pla9GlPP/WmrMMM9hFsKxIyRSh
	bnXFzkuTcjPhoiylY8Z/6kikI38e9Lzp9hy0uXp5SHY9/gvD+5Z1lD6qgAz3mgLW+K0PnCEqXeQCo
	SCjU6cBkPlvB6DT+sQ4baz7WJUrWkxwjtgoGxr9Y3nPQuihVwUqfEtabaqwnzIqt+kdwrKbUW0Zy9
	eOc7r04S98O4RogTXftmLAIpxV+SS6LTVBnshIzoWdNAEhwYA9bOzaOhAn0XVGgwquwkgJSmLE3e9
	ESAjJFVQ==;
Received: from localhost ([::1]:24002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdeyS-000VHX-6T; Wed, 19 Jun 2019 18:06:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44026) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdeyN-000VHQ-EM
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 18:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=6diCRsa2XRztOkBuYmvWWVWzZ18vfXjsiyrn1agLlaU=; b=vU7aFiwroWjzdc5Cv+0kro4cKm
 ubLS0gzDhiV1MbuxrWFMg//b6GXpdtyP4mzaPS+fNcKIBJ0h+L2fm4vk01ACWIIaJANThqS+PygJp
 tpcbtk+zCpojQ3VKeEqRcp6Z7tqz3oyXhMt3b8wFl+VDkd5Vhl+8CvNApgplY3soYk00=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdeyM-0006XG-CK; Wed, 19 Jun 2019 18:06:15 +0000
Message-ID: <b786a648801d6123fc3778553c634bc67c106b81.camel@samba.org>
Subject: Re: WANTED: bugzilla help (automated and semi-automated) closing bugs
To: =?ISO-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Date: Thu, 20 Jun 2019 06:06:10 +1200
In-Reply-To: <20190619093539.GB1757@sernet.de>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
 <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
 <20190619093539.GB1757@sernet.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-06-19 at 11:35 +0200, Björn JACKE wrote:
> On 2019-06-19 at 17:18 +1200 Andrew Bartlett sent off:
> > Currently these bugs have a BUG: tag in master yet are open[1]:
> > 
> > 
https://bugzilla.samba.org/buglist.cgi?bug_id=8630%2C9976%2C10066%2C10286%2C10440%2C10803%2C10812%2C10882%2C11012%2C11198%2C11592%2C11600%2C11628%2C11665%2C11823%2C11836%2C11894%2C12155%2C12292%2C12293%2C12297%2C12385%2C12399%2C12402%2C12416%2C12423%2C12451%2C12468%2C12739%2C12761%2C12841%2C12845%2C12851%2C12876%2C12881%2C12921%2C12926%2C13004%2C13039%2C13059%2C13093%2C13151%2C13159%2C13178%2C13213%2C13214%2C13223%2C13225%2C13229%2C13247%2C13307%2C13309%2C13311%2C13343%2C13350%2C13353%2C13365%2C13378%2C13379%2C13381%2C13415%2C13442%2C13448%2C13452%2C13458%2C13461%2C13462%2C13466%2C13469%2C13471%2C13475%2C13525%2C13564%2C13565%2C13573%2C13591%2C13604%2C13612%2C13627%2C13630%2C13655%2C13658%2C13680%2C13698%2C13699%2C13723%2C13761%2C13771%2C13772%2C13806%2C13822%2C13825%2C13843%2C13852%2C13864%2C13880%2C13915%2C13932%2C13939%2C13948%2C13949%2C13952%2C13959%2C13967%2C13973&bug_id_type=anyexact&list_id=22103&query_format=advanced
> > 
> > What do folks think of closing those as fixed?  Would someone be
> > willing to write a script to find the git hash from the BUG number
> > and
> > close the bug with that and the version it was found in?  
> > 
> > Or should we just close them all in bulk (perhaps a more refined
> > list)?
> 
> I see the danger, that there can be bugs, which are referenced
> because they are
> partly fixed or the referenced fix went upstream already but wasn't
> the final
> solution or the bug got reopened because the fix was not okay. There
> are many
> reasons why this could go wrong. But the list is great in any way,
> just that I
> think it needs manual work if we want to be on the safe site with
> this.

I totally agree, there are risks (everything in life and Samba
development has risks, costs and rewards).  

But what is "the safe side" anyway?  Currently we have 2400 open bugs
in Samba, almost all misleading in some way.  Of the 100 above, is it
better to have most  of these bugs misleadingly open, or some of them
misleadingly closed?

Or is this the best way for a Samba developer to spend a couple of days
full time?  (I estimate from my little spree recently that it takes
about 5 mins on average to close, properly, a bug with information on
when it was likely fixed, or to resolve it properly some other way.)

> What we would need is that all of us take care of our own bugs, own
> bugs
> includes bugs that we reported ourself. If I file a bug report that I
> fixed, I
> need to take care that the bug report gets closed also or correctly
> assigned to
> Karolin for merging. I should also not file bug reports that have no
> descriptive
> body text but only a more or less cryptic summary line. What I want
> to say is
> that we all need to change the way we use bugzilla and we should all
> give it
> more love and attention.

I certainly appreciate the sentiment and perspective.  

On the specific point, we get the cryptic one-line bugs because our
procedures require a bug number for anything that someone *might* want
to see backported:

https://wiki.samba.org/index.php/Samba_Release_Planning#Patch_Process

More broadly, the challenge I see it is that in the history of Samba,
asking folks to follow even very clearly spelled out but quite
elaborate procedures has been a high-cost, low-reward exercise. 

I'm a believer in human factors, best understood from aviation:
 - Rather than (first) blaming the pilot, why couldn't the pilot save
the plane?
 - Did the plane, process and tools to hand help or hinder good
decisions?
 - Was the workload simply too high/poorly managed?

Back to Samba what has been successful for us is when our tools help us
(eg autobuild, GitLab, git commit whitespace checking), indeed isn't
that the fundamental definition of a tool, right back to the stone age?

Currently even our good tools fight against us the whole way, they are
not joined up!  Each use of a tool finishes with 'now do manual
process'.  

For example, for a patch.  Having got reviews on a gitlab MR:

 1. push to autobuild
 2. wait for autobuild
 3. enter git hash and version into gitlab and close
 4. enter git hash and version into bugzilla and think about backport
 5. do backport
 6. get reviews
 7. assign to karolin
 8. Karolin then pushes to autobuild
 9. Karolin then updates bugzilla as pushed
 10. Kaorlin then updates bugzilla as in the release and closes.

Steps 1-4 and 7-10 are way to manual, and so much falls between the
cracks, and when it doesn't, it takes way too much time.

I think we should at least try to automate 1-4, so MRs and bugzilla
entries close as soon as they are plausibly merged, or we switch to
tooling that is joined-up, where this happens out of the box.  

If the developer really cares about the issue (and the automated
process was wrong) they can re-open things of course, but in the
meantime things are ready for the next major release. 

Other projects, say using GitLab or GitHub natively get this for free. 
Issues mentioned in merge requests can be closed by commit message, and
merge requests of course close when merged!

https://docs.gitlab.com/ee/user/project/issues/automatic_issue_closing.html

We may not be ready to leap that far, but I would implore that we at
least try and automate more, drowning in a sea of bugs isn't a good
spot either.  (And reflects poorly on the project, it looks like we
don't care, when in fact we really do). 

Thank you for taking the time to read this far,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




