Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7094D9B3
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=NNtAGhd+5kKXQFbXb7OFmtMXfaNY45fpZMgwUEkMM+c=; b=fUZgclkRH/H+z5tbMlmT/jzMdx
	dj81ywWR+llcP6/XMDH8tT9WjppBCPduyIErnHHIrz2MvFpuPdwKX7V+WWsR7lt5rkdY2sz67AXMK
	iXNl69WLKtsP7JW0e9ptSJ855CcA9fb+6AG/BxGk/l9qSbOtxcfD/Z6iNjtYD8i/L8RF1MTpyUTMH
	tLKA+nr/qMu1waKibqKjV801zxT55yRw7IJSPWMj6/qb5C3rIwuONcFjT6U2mU+uvLVdVyHOhm9PN
	5MdVhX+kkMkXZkvXCOMSIIwsMZ09XMaLxHFa4voOkuCq9V8+JFAuBoJdftaR7Ddu11D29VK0gXq7B
	fIk9/AhA==;
Received: from localhost ([::1]:35106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he26A-000nh2-Ot; Thu, 20 Jun 2019 18:47:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he266-000ngv-Cu
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=NNtAGhd+5kKXQFbXb7OFmtMXfaNY45fpZMgwUEkMM+c=; b=ciyy7ErpkmL41vTPbZWk3UKPgj
 FpndQVyMe5nPhbdmpjLm1sRboKCiJ4o+nTULgGM71JXw8Z7TDlz5JBjm/G2eFKNoy41HZUoEItcYw
 HI4oevPA+a5xaBAFSNuJbjA3FkytPtwfquJjSUl4MD2M549zYmPrDvnPpSSXqNR6w1rA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he265-0008D7-HG; Thu, 20 Jun 2019 18:47:46 +0000
Message-ID: <abb0ec616b2065aa1ddf4f4ebe5e08efb27df580.camel@samba.org>
Subject: Re: WANTED: bugzilla help (automated and semi-automated) closing bugs
To: =?ISO-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>, Upstream Samba
 Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 21 Jun 2019 06:47:41 +1200
In-Reply-To: <20190620092220.GA20926@sernet.de>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
 <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
 <20190619093539.GB1757@sernet.de>
 <b786a648801d6123fc3778553c634bc67c106b81.camel@samba.org>
 <20190620092220.GA20926@sernet.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-06-20 at 11:22 +0200, Björn JACKE wrote:
> On 2019-06-20 at 06:06 +1200 Andrew Bartlett sent off:
> >  1. push to autobuild
> >  2. wait for autobuild
> >  3. enter git hash and version into gitlab and close
> >  4. enter git hash and version into bugzilla and think about backport
> >  5. do backport
> >  6. get reviews
> >  7. assign to karolin
> >  8. Karolin then pushes to autobuild
> >  9. Karolin then updates bugzilla as pushed
> >  10. Kaorlin then updates bugzilla as in the release and closes.
> > 
> > Steps 1-4 and 7-10 are way to manual, and so much falls between the
> > cracks, and when it doesn't, it takes way too much time.
> > 
> > I think we should at least try to automate 1-4, so MRs and bugzilla
> > entries close as soon as they are plausibly merged, or we switch to
> > tooling that is joined-up, where this happens out of the box.  
> > 
> > If the developer really cares about the issue (and the automated
> > process was wrong) they can re-open things of course, but in the
> > meantime things are ready for the next major release. 
> 
> I go along with this reg. adding such an automation process for new bug
> activities because for currently open bugs with activity the process is
> "reviewable" via the samba-qa mails. I'm happy to help with this also.

Great, that sounds like a way forward!  I've found this script, which
while unmaintained might be a good place to start: 
https://github.com/gera/gitzilla

Could you have a look at that and see if it is viable?

> My concerns that I had and still have are about the automatic closing of huge
> numbers of existing bug reports, only because the bug number was mentioned in a
> commit message for example. For huge numbers this would not be verifyable.

I agree for huge numbers.  Thankfully printing the git commit (bonus
for a version) and not closing it would be a great start, and is pretty
harmless. 

Also with that much done a human or humans can review what is actually
only 100 bugs much faster, so there is hope we could even close them
manually.

> Last but not least we should have a look if the default assignees for the
> components are well chosen. It doesn't make sense for example, if a component
> has a default assignee, because he is responsible for that component but at the
> same time not reading mails from bugzilla regulary. The current list is
> attached as html to this mail. In order to not poisoning the "My Bugs" list
> mentioned above, maybe we should get away from personal default assignees
> completely?

I agree, default assignees are essentially pointless for the way we
work.

Thanks for putting thought into this!

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



