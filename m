Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B954E38B
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 11:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eD9GbCzs5C63si8x0tiDEJz9eOJnC01oi5q7qTtryLA=; b=BgLk9OSX9sYHii5IMbvc8FP0Cg
	z8HqeaRs/6dFTUDmvO9BK41NCqp3Flapl4OyEfJ31AnBWF8lhnAtZQ3WjrSA6DIHFX/pxs5AD5x5c
	KJfWoxwD8svIkdVFPIajb13fRrkjQZUVLuZXlEziWsmM9sWv2PL3ACDl4PlvQXEy9bDJjnGrOvOdx
	/3p7seA4G61ptnUTsHi7z526m2MQCYmtFc79zpOJFXyxcmhJsKLC6LBgs1v4Yz1W7JDGfWyBVEQ4I
	sKcn6+9yK+HRhEG8p9ic963IEeEZrSE9q9vzN4iBAMsAjWS0aVM92ugU+E6ZJBsRnv7DTegVZ1kxn
	m9hin94w==;
Received: from localhost ([::1]:22160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heFqO-000uzR-NO; Fri, 21 Jun 2019 09:28:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFqK-000uzK-1b
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 09:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=eD9GbCzs5C63si8x0tiDEJz9eOJnC01oi5q7qTtryLA=; b=o7SGWnqowjogFQ4UcOU1qKEJpw
 KAeICiYw9KcL3zm4nymJqcolc8D4qKLnVtuh983oUq5Rg1YaQCfy2kuezXf4os7EWqyPEjcmBhf9H
 jEzChmpyJADMM7bX1ozn1bs6Qz7WmQ6FCp73D9IlV7UcLDW73nlNthpti2XHZc4dWxa8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heFqI-0001fJ-Qb; Fri, 21 Jun 2019 09:28:23 +0000
Message-ID: <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Fri, 21 Jun 2019 21:28:18 +1200
In-Reply-To: <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-21 at 19:05 +1000, ronnie sahlberg wrote:
> I think something like this needs a lot more discussion than "need
> new
> process because I don't want to read patches."

G'Day Ronnie,

I do wish to be very clear, this is not a discussion about a new
process, this is a discussion about formalising our current practice.  

Over the past few months, only Martin and to a lessor extent Christof
has sent a significant number of patches via the list, the rest go via
GitLab.  

I'm sorry you haven't noticed, perhaps you thought we just went quiet!

> Now, samba is a very active project, and like the linux kernel, a
> very
> unusual project in that almost all main contributors are
> paid to work part or full time on samba,
> That is not the norm for the average open source projects.
> 
> Anytime you add special hoops and gatekeepers to contribute patches
> you will turn away new contributors.
> That is fine if you don't see it as an issue if it might turn
> occasional contributors away.
> The norm for most open source project IS to send patches to the list
> and get feedback on them.
> Even the linux kernel works that way, although it is split into
> several subsystem specific mailinglists.

I would dispute that it is the norm, but I guess it depends how you
measure the norm.  Very many projects only accept contributions by
GitHub pull requests. 

> I think from what you are saying is that the real problem is that
> contributors send patches to the list but the core
> developers do not care/ do not want to do patch review, and that is
> why the patches are ignored and forgotten.

> If that is the problem, then just changing to a much much harder and
> different process to  contribute patches
> is not going to address the problem. I mean, if people can not care
> to
> review patches that are sent to the list, why
> would you think people would review the same patches if they were
> contributed via a different mechanism?

As someone who has the great pleasure of reviewing a significant number
the patches submitted to Samba, I find that GitLab merge requests are
significantly easier to review because:
 - The patch, CI results and discussion are all in one place
 - The original submitter gets the CI feedback automatically, so I
don't have to tell them it failed
 - The outstanding patches are in an ordered list that I can work
though.
 - I can pull them to my local system, on a branch, rebased on master,
with simple aliases around wget.

I do this day in, day out and find it has greatly boosted my
productivity, and so improved Samba because I'm able to do even more
code review!  I got 1700 patches reviewed last year, I used to only
manage 1000.

Even our contributors praise the use of GitLab, because they too love
knowing that their patches pass CI, and so are not a embarrassment
(while not a problem you suffer, first time contributors tend not to be
very confident). 

> If the problem is that core contributors do not want to or have time
> to review patches then the correct solution would
> probably be to have everyone set aside one day a week to work on
> project hygiene, and spend that whole day ONLY on working on
> patch review rather than invent a new system that might stop these
> patches from being submitted in the first place.

While I'm incredibly grateful to be in a position to do code review
actively, on the Samba Team we have not found that berating other
developers has worked well for, well, anything (frankly).  

But we now work smarter, rather than harder, and I'm just trying to get
consensus to update our docs to match our new, better, reality.

> You even say in a post that you don't care and wont review any
> patches
> that are sent to the mailing list.
> If that is how most core developers think of patch review, maybe that
> is the actual problem.

I think you totally miss the point here.  

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




