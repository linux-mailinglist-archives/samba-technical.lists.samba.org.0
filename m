Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E64D3C4
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 18:29:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=l4LDjAg6YKDyVT3JTFmDSzSvy4BDbY14M4KIxUwKOsM=; b=VcLUMND4umlLf323Reucb2HCGY
	EliPl+AvRCWHoUudPPBINJ9GalFMt5x/tceo1zhg5dJ66tZoF7yrWQ5XVHLUaudCn+L9DhFpEynBx
	kaciVwowmOk2OQYU+pLd4WKjlGTR+M84ZL/y8q4gaSGnEvhH8vw3JfyZQhR8UQ39L4POyMh9pFmrB
	Qo6BXiOBPNP2PM9tOtlzuNEfTt48NJlHYD+RflAeV0Ux23GLkRZWFuCDVTGybl9/CwcDg5BzpDZyt
	kVGSIwsYy7RxPR06ExINaWqeSfPr2sFVpzyNXIWuoGxjskCBE73CTzZD/L6Rxk8Um3OUA58auDTXz
	5brp9h7w==;
Received: from localhost ([::1]:56134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdzw5-000jtS-QX; Thu, 20 Jun 2019 16:29:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14538) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdzw1-000jtL-55
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 16:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=l4LDjAg6YKDyVT3JTFmDSzSvy4BDbY14M4KIxUwKOsM=; b=nijcVUtcGxjhbPJGQLFgmHum4a
 aBThNcuvxbiiXJ3qibIy1y7dTooinCDwSC3iDz9vipfXHVMF6KrkZMSuXIj4CKGEFJupSH9XDgubi
 WS+OnTCzA/+wTo1nJiuPxrsDHm+7poem234W5s4r31dJUYOerR485IgutzwBNkS/yoIo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdzvz-00064x-W9; Thu, 20 Jun 2019 16:29:12 +0000
Date: Thu, 20 Jun 2019 09:29:09 -0700
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Anoop C S <anoopcs@cryptolab.net>
Subject: Re: WANTED: bugzilla help (automated and semi-automated) closing bugs
Message-ID: <20190620162909.GB109029@jra4>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
 <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
 <20190619093539.GB1757@sernet.de>
 <b786a648801d6123fc3778553c634bc67c106b81.camel@samba.org>
 <20190620092220.GA20926@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190620092220.GA20926@sernet.de>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jun 20, 2019 at 11:22:20AM +0200, Björn JACKE via samba-technical wrote:
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
> 
> My concerns that I had and still have are about the automatic closing of huge
> numbers of existing bug reports, only because the bug number was mentioned in a
> commit message for example. For huge numbers this would not be verifyable.
> 
> A good start for anyone to tidy up hir own backyard would maybe be to look over
> hir self-reported and self-assinged bugs and have a look which of thos can be
> obviously closed.
> 
> https://bugzilla.samba.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&emailassigned_to1=1&emailreporter1=1&emailtype1=exact&field0-0-0=bug_status&field0-0-1=reporter&list_id=22179&type0-0-0=notequals&type0-0-1=equals&value0-0-0=UNCONFIRMED&email1=FOO@SAMBA.org
> 
> Just replace FOO@SAMBA.ORG with your own bugzilla mail address.
> 
> I would also recommend to save this search request for quick and easy future
> use, you can do that by giving it a name like "My Bugs" and press the "Remember
> search" button at the bottom of the search result site. You will then have a
> link "My Bugs" at the bottom of each bugzilla site.

That's a really useful link - thanks a *LOT* ! Saved as "MY BUGS" :-).

