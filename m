Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5184CAB9
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 11:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CDU0aiCrGelSEQA9b/GEXQzNAiWAtieC2z7HkoK9D7U=; b=W91/D0Z27BahukIRg+d7hvFbuC
	lYGvhesbEejNzeeuUq1U24nfbhrMKTyCxRlDf7Zd+GpJGNOEpHrAn3ahhURq2P4q6eRrPQvgtUVjW
	j3oRKnLcYkoWQUADdZ3qD5rls7pGB7pZlvEW0tj02ntwwY+zqwL/HlRcmjkERpAUjRrEPIkvgC35E
	5xT5v9liYfxtwSn/B3j9ThLtpKzkmC8N/RMTJjHMgTyx9t0sZ5AsFEJIzdkYedPCaeMI48IlCaJ6C
	IHbl2S0t58EitMrSllvQQysjO+VBndOaWY5j5+tIoV2JYYuHpFjjfOLEETkVMtcJbv2VkFA/TZBw9
	q6mshUlA==;
Received: from localhost ([::1]:27184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdtIV-000epu-Jb; Thu, 20 Jun 2019 09:23:59 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:47489) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdtIP-000epn-QV
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 09:23:57 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1hdtIM-00016h-L9; Thu, 20 Jun 2019 11:23:50 +0200
Received: by intern.sernet.de
 id 1hdtIM-0004Wc-FV; Thu, 20 Jun 2019 11:23:50 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1hdtGu-0007JD-Fh; Thu, 20 Jun 2019 11:22:20 +0200
Date: Thu, 20 Jun 2019 11:22:20 +0200
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: WANTED: bugzilla help (automated and semi-automated) closing bugs
Message-ID: <20190620092220.GA20926@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Anoop C S <anoopcs@cryptolab.net>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
 <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
 <20190619093539.GB1757@sernet.de>
 <b786a648801d6123fc3778553c634bc67c106b81.camel@samba.org>
MIME-Version: 1.0
In-Reply-To: <b786a648801d6123fc3778553c634bc67c106b81.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2019-06-20 at 06:06 +1200 Andrew Bartlett sent off:
>  1. push to autobuild
>  2. wait for autobuild
>  3. enter git hash and version into gitlab and close
>  4. enter git hash and version into bugzilla and think about backport
>  5. do backport
>  6. get reviews
>  7. assign to karolin
>  8. Karolin then pushes to autobuild
>  9. Karolin then updates bugzilla as pushed
>  10. Kaorlin then updates bugzilla as in the release and closes.
> 
> Steps 1-4 and 7-10 are way to manual, and so much falls between the
> cracks, and when it doesn't, it takes way too much time.
> 
> I think we should at least try to automate 1-4, so MRs and bugzilla
> entries close as soon as they are plausibly merged, or we switch to
> tooling that is joined-up, where this happens out of the box.  
> 
> If the developer really cares about the issue (and the automated
> process was wrong) they can re-open things of course, but in the
> meantime things are ready for the next major release. 

I go along with this reg. adding such an automation process for new bug
activities because for currently open bugs with activity the process is
"reviewable" via the samba-qa mails. I'm happy to help with this also.

My concerns that I had and still have are about the automatic closing of huge
numbers of existing bug reports, only because the bug number was mentioned in a
commit message for example. For huge numbers this would not be verifyable.

A good start for anyone to tidy up hir own backyard would maybe be to look over
hir self-reported and self-assinged bugs and have a look which of thos can be
obviously closed.

https://bugzilla.samba.org/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&emailassigned_to1=1&emailreporter1=1&emailtype1=exact&field0-0-0=bug_status&field0-0-1=reporter&list_id=22179&type0-0-0=notequals&type0-0-1=equals&value0-0-0=UNCONFIRMED&email1=FOO@SAMBA.org

Just replace FOO@SAMBA.ORG with your own bugzilla mail address.

I would also recommend to save this search request for quick and easy future
use, you can do that by giving it a name like "My Bugs" and press the "Remember
search" button at the bottom of the search result site. You will then have a
link "My Bugs" at the bottom of each bugzilla site.

Last but not least we should have a look if the default assignees for the
components are well chosen. It doesn't make sense for example, if a component
has a default assignee, because he is responsible for that component but at the
same time not reading mails from bugzilla regulary. The current list is
attached as html to this mail. In order to not poisoning the "My Bugs" list
mentioned above, maybe we should get away from personal default assignees
completely?

Thanks
Björn
