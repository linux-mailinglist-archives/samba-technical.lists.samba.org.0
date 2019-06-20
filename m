Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB644D879
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Kz18rr/tV4zvA7NeNrkR51M6i434J18nwtz2mif9ZME=; b=jKai1jiprXZ1jftqs8RSqcDoSq
	GXkUIpj1Oqym0F4IJ0iIGorUpVvQQ7GfCwboxqXQR5nfYInIAvLOI/L7jmmU6cKe1vcZrP1FI4R05
	MY/2R2YESZ56vw9S2tuR8p+fqyp5Dq4QbE5D8fUIMcfkbhrsCAstIOQwgJ7ONJW+UqwKM3bQntnSO
	OP+s3RXSmQ5GpHx7F3VFBiaACTBgOOD3fPAUsDPJE0N0tPxySzvuXOwwFKZXqOAFIVPqfssg4qL59
	NZz9OwYT0QC37cf2icUKwv/ZCCF6p2no68xfl+9paaXPs0B2hxC7AdOBAcuD11HiJy0SHK2XGkCRA
	4efcYPZw==;
Received: from localhost ([::1]:26912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he1m6-000mbM-L1; Thu, 20 Jun 2019 18:27:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22050) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1m2-000mbF-7z
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Kz18rr/tV4zvA7NeNrkR51M6i434J18nwtz2mif9ZME=; b=eYPJ5WA2PN+idSYcL/fEc6uHuS
 /46SubEBv1dl7qbXVD8foCRUA3TfYU/IsZgM7bipmAS4FusECSEAmp1XTHX+FD3xoMsRhUGRiJaO3
 ixPlOuX1zreUeOr5Tde4PzsbzmnHXbs2Zk3E9EO1xkOxT0eUWYqv00F3uRIDI23dF7c8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1m0-0007gK-6Q; Thu, 20 Jun 2019 18:27:00 +0000
Date: Thu, 20 Jun 2019 11:26:57 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Using gitlab question
Message-ID: <20190620182657.GG109029@jra4>
References: <20190620172908.GD109029@jra4>
 <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 21, 2019 at 06:23:25AM +1200, Andrew Bartlett wrote:
> On Thu, 2019-06-20 at 10:29 -0700, Jeremy Allison via samba-technical
> wrote:
> > I have a pending merge request:
> > 
> > https://gitlab.com/samba-team/samba/merge_requests/558
> > 
> > that has been made unmergable by a commit from another
> > Team member that needs to go into autobuild before
> > my change (it's a minor change to test code lists
> > that needs rebasing).
> > 
> > What is the correct procedure for doing this ?
> > 
> > Do I close the existing merge request and re-issue
> > a new CI-run followed by merge request ?
> > 
> > Or is there a way to ammend my existing merge
> > request with an updated patchset once I've
> > fixed the rebase conflict ?
> 
> A good question (because it isn't in the wiki really)!

Any chance it can be added there ?

> > Just trying to get more familiar with gitlab
> > workflow here.
> 
> Just fix up your branch with rebase, conflict resolution and then git
> push -f (force push) and it updates the MR.  
> 
> That is also the procedure for addressing feedback etc, just keep
> amending the branch.

Oops, too late, just closed the merge request
and planning for another one instead :-).

I'll follow the "recommended" procedure next time,
thanks !

Jeremy.

