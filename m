Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9B4D7B0
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 20:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cmIh4bwP/dAnCth+q48eYwWcqTuEVwsFON8HEaQxRIQ=; b=dv5i2fSiRT/25CdUznLRE0/X6g
	TrhXw8fMM5hItPp8zOuY2UWZLMC0Y5/SIdUuVwDv7hclZPTO/fnGMfCbffSlBW/oGWEhs/lwwyb2j
	QsMblWJ7FBX2EH1T9rt0CHtMaITmUMvLwi6be5U0zPO2rhWwTZP1Te33aFA73ZJUgUlgLn/uIUjS5
	bgiYWsWEkG8/IB0ModRikCD1E8JMedXB4dg14xdWA0gcmGkPSEn4Bk/v31abuDMhgOSK1ZaQX6QZb
	WfUIGqJJTkCUfdZFMyHREMdQYYN/8ShwPracefv+08mM9x0oASlYpJwTeVae6ujldtvGt+Sk3vprp
	GhMItsSA==;
Received: from localhost ([::1]:26150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he1ih-000mQq-HE; Thu, 20 Jun 2019 18:23:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19994) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1ic-000mQj-VU
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 18:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=cmIh4bwP/dAnCth+q48eYwWcqTuEVwsFON8HEaQxRIQ=; b=phfzUOB7akVE92Yq9gtwmW2PP6
 ke4Bgt07W98Oxzfytq+Top39auC15rwLzYiEtC7G2PIoWJspHoIJajcfjh+C/d23tMlugkFJmmljA
 HToh3TArkGgvFGQYA0kHPsTMsQ6iHAkwTsgG3Iwu/oyyYqSQ7bb6VB217C1VAK07A/Ls=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he1ic-0007Xi-2B; Thu, 20 Jun 2019 18:23:30 +0000
Message-ID: <19d1f8f70f3d8418dadcd3e92af54dd85bb884be.camel@samba.org>
Subject: Re: Using gitlab question
To: Jeremy Allison <jra@samba.org>, samba-technical@lists.samba.org
Date: Fri, 21 Jun 2019 06:23:25 +1200
In-Reply-To: <20190620172908.GD109029@jra4>
References: <20190620172908.GD109029@jra4>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-06-20 at 10:29 -0700, Jeremy Allison via samba-technical
wrote:
> I have a pending merge request:
> 
> https://gitlab.com/samba-team/samba/merge_requests/558
> 
> that has been made unmergable by a commit from another
> Team member that needs to go into autobuild before
> my change (it's a minor change to test code lists
> that needs rebasing).
> 
> What is the correct procedure for doing this ?
> 
> Do I close the existing merge request and re-issue
> a new CI-run followed by merge request ?
> 
> Or is there a way to ammend my existing merge
> request with an updated patchset once I've
> fixed the rebase conflict ?

A good question (because it isn't in the wiki really)!

> Just trying to get more familiar with gitlab
> workflow here.

Just fix up your branch with rebase, conflict resolution and then git
push -f (force push) and it updates the MR.  

That is also the procedure for addressing feedback etc, just keep
amending the branch.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



