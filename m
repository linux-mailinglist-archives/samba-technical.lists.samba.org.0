Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA3C41B88
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 07:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=zGdwDPNckoBRRtD9cXzg0le/Wmfv41ZafKjf2urwMcA=; b=nxh2xH8nyJUVfuGnqKs2D65eo2
	TRMjaDbSXGHwgZCTuot2HfWfSqiot5h2U5MhRvG7Lf52FUFM2R/fZ9qo9Jg4L5U770XCY2sG44p5K
	1ZSo4t0/XbfInPnhQ9LjHcpQWR/YKRzRti63nYdBLimXKxgXVvB73p1aDootC82IQbxz4r2qVqmhY
	Hr45IAoSYx4E+xTaugCsKXOuRofmOJtc+Sq6L0NtBtudzuBM9uQ+U+ouEThVgpjt/bAGogUgz4iSC
	IGs2FJIOX7PzpWpNCqzFfoMxnJmSu3UhWe3VctlUrdEThJCwQxWz1j8VzWVkudE7FTyXknT6j0vIx
	sYXudESA==;
Received: from localhost ([::1]:29466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1havko-0014lz-H6; Wed, 12 Jun 2019 05:24:58 +0000
Received: from latitanza.investici.org ([82.94.249.234]:22585
 helo=mx1.investici.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1havkk-0014ls-7e
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 05:24:56 +0000
Received: from mx1.investici.org (localhost [127.0.0.1])
 by mx1.investici.org (Postfix) with ESMTP id BC56212053C;
 Wed, 12 Jun 2019 05:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1560317090;
 bh=zGdwDPNckoBRRtD9cXzg0le/Wmfv41ZafKjf2urwMcA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=u2mJLZX6V81cFexgxxJJTIwqkEN1RRPq+u4avlgeI7R13jD6sd1VbYFCYJcl3WOxj
 yfcUXxBBxn7w+Tb92pnBUB4qWHxqIoaLCz/FIsxI2/v26LoWERPUZ6fh/uQsxnD96g
 jROt2wsRL4LDc7gLwy1zZva69m7cc+IqXa5BizVE=
Received: from [82.94.249.234] (mx1.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 0A98A1204BC; Wed, 12 Jun 2019 05:24:48 +0000 (UTC)
Message-ID: <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
Subject: Re: Some bugzilla work and thoughts
To: Andrew Bartlett <abartlet@samba.org>
Date: Wed, 12 Jun 2019 10:54:46 +0530
In-Reply-To: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-06-12 at 00:05 +0200, Andrew Bartlett via samba-technical
wrote:
> G'Day,
> 
> So some of you may have noticed I did a bugzilla spree today.
> 
> We have a problem.  There are 2400 or so open bugs across the Samba
> products, and I managed to touch about 64 of them today in a
> meaningful
> way, not just automated closing. 
> 
> The challenge is that while there are so many open bugs it is hard to
> find where to start or feel like one in making progress, a bit like
> the
> multiple pages of GitHub merge requests that built up before we
> migrated away.
> 
> On an interesting note, while closing out up to 10 year old bugs may
> seem pointless, I've found about 1/3 were still relevant in some way!
> 
> Dealing with just 2.5% of the bugs probably not the best way to spend
> almost an entire day, but I was inspired because I got some honest
> feedback recently that the sheer backlog discouraged the filing of
> new
> bugs, because any new bug would just be a drop in the bucket. 
> 
> Of course I emphasised that we deal with new bugs with much more
> focus
> than the backlog, but the point still stung a little. 
> 
> Many of our bugs are there because it is practice to file one 'in
> case
> a backport is wanted' that never comes.

It would be good to have an indication regarding the release
version/tag to which a particular bug fix has gone through while it is
getting closed as RESOLVED+FIXED. We could either use a bugzilla
comment or built-in 'Fixed in version' field to mark the version/tag.

> Because we have no link
> between git, gitlab and bugzilla many never get even a tag as being
> merged into master, except by manual intervention. 
> 
> Coupled with the fact that the patches themselves need to got to
> GitLab
> (or in the past the mailing list) for merging is also a challenge, as
> patch development doesn't happen here either. 
> 
> I offer no solutions, not even my normal engineering ones, just my
> observations. 
> 
> Andrew Bartlett


