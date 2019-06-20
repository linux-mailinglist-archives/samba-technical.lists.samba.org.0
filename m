Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B99EB4D98E
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qTrhFO9rZgpzCy9gg9M8XroqJBkhDyzHymQ8MJawAI0=; b=2DmI0ZB0LwwuLdBeitRRJIFyoe
	+BspHNLpCF6WvU5YNtI+cG5nf7GuXRvK20AZAcDUpMOCR4dkAtvfse9oGbpKXpDklSJA/+0GL4Nl0
	XVzzYiBrUfbTJP3+4fvl7Oce43L9+75s7ga1FxFmlATIHhyvjLkCJKvkkuxxrtKZcZYK2Re54hByz
	9hTIxNtuCoW7XOPFQfS7z4/+D+P666bwXINGWn2qSzrV+lK7/xVTD6sUBz9Oc+w3dAREOhut1kzMF
	8dfEZWIjQTOqKXatq8BMDBVwO3xt5fYTz9DbaIBNrMx4ukAZk8Mf1iWtfXnPY1fEFkQRaK08LDAjx
	kAHXlmxA==;
Received: from localhost ([::1]:31062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he1xR-000nA3-Vf; Thu, 20 Jun 2019 18:38:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1xJ-000n9w-CE
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=qTrhFO9rZgpzCy9gg9M8XroqJBkhDyzHymQ8MJawAI0=; b=uvz9pAL7rXsvs8s0J0nYASPAGa
 OEpqbOhTvBy1fxIf4jNDOVyOxrkItwI/gEei8hJWZEEG3bGeo0HKo8e0bWvKmKIRGp0czV7SMwD1a
 5as+W0vkFPCCNzycMmmurBXkRmcLOKrTj+iXOKkQgmh1oe1sHXSfVrmIEWVQ2GWc8fQg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1xI-0007y9-FP; Thu, 20 Jun 2019 18:38:40 +0000
Date: Thu, 20 Jun 2019 21:38:37 +0300
To: Jeremy Allison <jra@samba.org>
Subject: Re: Using gitlab question
Message-ID: <20190620183837.GB6019@onega.vda.li>
References: <20190620172908.GD109029@jra4>
 <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
 <20190620182657.GG109029@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190620182657.GG109029@jra4>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 20 kesä 2019, Jeremy Allison via samba-technical wrote:
> On Fri, Jun 21, 2019 at 06:23:25AM +1200, Andrew Bartlett wrote:
> > On Thu, 2019-06-20 at 10:29 -0700, Jeremy Allison via samba-technical
> > wrote:
> > > I have a pending merge request:
> > > 
> > > https://gitlab.com/samba-team/samba/merge_requests/558
> > > 
> > > that has been made unmergable by a commit from another
> > > Team member that needs to go into autobuild before
> > > my change (it's a minor change to test code lists
> > > that needs rebasing).
> > > 
> > > What is the correct procedure for doing this ?
> > > 
> > > Do I close the existing merge request and re-issue
> > > a new CI-run followed by merge request ?
> > > 
> > > Or is there a way to ammend my existing merge
> > > request with an updated patchset once I've
> > > fixed the rebase conflict ?
> > 
> > A good question (because it isn't in the wiki really)!
> 
> Any chance it can be added there ?
> 
> > > Just trying to get more familiar with gitlab
> > > workflow here.
> > 
> > Just fix up your branch with rebase, conflict resolution and then git
> > push -f (force push) and it updates the MR.  
> > 
> > That is also the procedure for addressing feedback etc, just keep
> > amending the branch.
> 
> Oops, too late, just closed the merge request
> and planning for another one instead :-).
Just re-open this one. It has 'Reopen merge request' on the right side
of the top line where 'Closed' label is, on the web.

> 
> I'll follow the "recommended" procedure next time,
> thanks !
> 
> Jeremy.
> 

-- 
/ Alexander Bokovoy

