Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A34D973
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rfgv+lPFsPxZ41ph4cIJQmaCijuLsvM2y1MEfCQGW2U=; b=ku9zSGAZDdOlFTSh7BnB547gAO
	28A2GbKq2C7PDZ17vAFI0mp81iWeqJ72DibCvImNx4ey/oG/ZGsnKkqDvSZI7jZ/qxwJFDiEI92TT
	oY1KYPJEW2U+0jaev0kftCK80QyChuI4+4r9clH6i7FnPfIN019NgyXeHPW9/1turQJPV+RkHJZTV
	RDLbCaodyZ0bpC/a9emWqTcGo1NrApRpa8EKRicRxIm7Yeepm3tz/dbiQEo1gSKjcg2eMy+uA9KBq
	cCMKDZX8OG/FISD+lzyUqlZ9SDsYbWfvYuqqqFSlK+8LniVpc3sYtHyJhMacxd1i3ya41J7U4cIP+
	AfvrUqTg==;
Received: from localhost ([::1]:27800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he1ur-000mjH-8Y; Thu, 20 Jun 2019 18:36:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1un-000mjA-KU
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=rfgv+lPFsPxZ41ph4cIJQmaCijuLsvM2y1MEfCQGW2U=; b=u5roQWuTz1k/t1Ru4rCNEWGSAh
 ykOye64JcQ/u4hvu+HdrSeYYJvEUrHmX8FnjO3Y27OzQOOqrKv7Yvk3W4LCuTFJ+4Q+gSF+dbEeQN
 oTcXg2b2s8uzje/tZgP8GvECXDRAjX2kS50lplQnLhkq/FL59FKwGVbLwGfy1enrbb20=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1um-0007tJ-EL; Thu, 20 Jun 2019 18:36:05 +0000
Message-ID: <7c6785a090d40d9136f2522321e6595c296198db.camel@samba.org>
Subject: Re: Using gitlab question
To: Jeremy Allison <jra@samba.org>
Date: Fri, 21 Jun 2019 06:36:01 +1200
In-Reply-To: <20190620182657.GG109029@jra4>
References: <20190620172908.GD109029@jra4>
 <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
 <20190620182657.GG109029@jra4>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-06-20 at 11:26 -0700, Jeremy Allison wrote:
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

It is a wiki, there is a very good chance you can update it ;-)

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

You can just re-open it if you like.

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



