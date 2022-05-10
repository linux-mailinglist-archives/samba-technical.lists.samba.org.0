Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4E5224D4
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 21:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=neCr4LpN4mP1ZTNX/5tcZULVXM1lL4EXX33GyUDbiko=; b=WyZVk13PadjTdTEw+u31KXSPqG
	8pCw8xCGCj7yOX7suCbcTFUt1bLpTso4pcJDW4Gw493vYSStz+OhBqMzm/9afWqzdFkEWGr9cTcwo
	8/qmg9Ciw+WvwLxXwryqV3J85vpOt7ZtCmdR41K4DgZMSDTfkef4v8dFGDNoSz7VTJskpE6HJVGNs
	TdILfl0QakZrPdT8SC9EQJxOoXfOX6h72B38Sf8Dqqq1A/fQKrECR0bfIawm2qg0HM8zwiRVlPHLZ
	ypJdnWymrPgP5bhf+LPTDZNrztwnao3ysrh63nuLKb6shcjjZYdRKswSwZu4QeZDiUNOwYsV5T1jk
	eiHD2Mdg==;
Received: from ip6-localhost ([::1]:21136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noVZO-000Tw4-5I; Tue, 10 May 2022 19:30:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noVZI-000Tvu-VP
 for samba-technical@lists.samba.org; Tue, 10 May 2022 19:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=neCr4LpN4mP1ZTNX/5tcZULVXM1lL4EXX33GyUDbiko=; b=hbQIKOYlZJ0KSIEPOcKrL7FD2h
 zwA7jFEhweO/qGYtYJ6DBkBeg/oEpR7E87Gj9eTLPpE8w++Sxsn6hQXzMTH57NE94CJmU+sD7/3rg
 D2Lyw1NQjvuXVCIV+cxmsuqOO1rxV+0zCow/bW0n8m3atF41SFj2zhuFoCJ6Bk+WkGsNDz5g2Lqk1
 sxYFbqIqZOdWeYmvpPUjde6zVV7JYonJToCNcbwWwcqAwY3Z0JYVK6avZVsmZbZPQUGG/rddG8E08
 UA4NxjOaAT2xuTXvY56ebjJ7+FzhvSB/upix3z8JPt7kh6Dx/NddTxU3ABfN8Q04e21tThHW7u2CB
 h2GE6nDoKSh/gRBmeGKcYhvsCN93JfSlYdKdWkrJBIy+0sSXK8FbSbXAOcdTbtYa0e5KvobLpJ/A7
 JxTaIy9UyUze3x7gDzej+rdvnMhYFaruEo4tJXWRpSb00/1v017xkvCCZkMnDqyOrQ9opQ257rD3/
 5p1qrSDt/3GFwGMyIOpTnHb+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noVZH-000ENL-30; Tue, 10 May 2022 19:30:48 +0000
Message-ID: <f9b03bbc8b024fd7a109c8edb4a6d58494fe6b9d.camel@samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
To: Ralph Boehme <slow@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Wed, 11 May 2022 07:30:43 +1200
In-Reply-To: <3bbc4681-be2b-8ba5-a04b-9d8ec997f436@samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
 <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
 <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
 <3bbc4681-be2b-8ba5-a04b-9d8ec997f436@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Tue, 2022-05-10 at 21:23 +0200, Ralph Boehme wrote:
> On 5/10/22 21:06, Andrew Bartlett wrote:
> > On Tue, 2022-05-10 at 20:02 +0200, Ralph Boehme wrote:
> > > On 5/6/22 04:57, Andrew Bartlett via samba-technical wrote:
> > > > I'm more than happy to answer any questions.
> > > 
> > > afait this shouldn't be needed given podman can be used to build
> > > containers in rootless mode and gitlab plans to support podman in
> > > the
> > > future as pointed out by Andreas, right?
> > 
> > Well we can't really wait for the future, the need is imminent,
> > unless
> > we dedicate our entire GitLab.com quota just to image rebuilds
> > (possible, just costly).
> 
> well, until the future is here I would be ok being restricted to be
> able 
> to rebuild images only at the beginning of the month when we're
> still 
> within the 50k limit. Or is this too odd?

My initial reaction is that I don't think that is really viable: The
images don't get rebuilt often, but it isn't something that really
should be blocked like that.  Our workflow and the the (to the team)
volunteer resources shouldn't be held up like that.

But I guess if the team has a credit card set up with GitLab I guess we
could add on credits when needed.  I do fear silly effects where a lot
of engineering time is wasted to avoid a $10 or $20 charge being made
however (to the the admin overhead). 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


