Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D929F96
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 22:13:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zvs3yNO9V3xzSx6JRydF61u5dYCHxpS2pcdQDykdrKQ=; b=lIx86KkSaDzmdm6HBJO99eWKG5
	dJd6og2olsHadB3LWO6bMkAEs1qEsCforvY+IBi+e57nH9+9chf065kUdsc8AjPozylToyIfVDZQS
	hU24JW5qC/06AU11zm2hUpJdRQ6BsP3lhmPPzI7n1ryfqGPnLOpk3GRYxYOU2BJ+0LKo5WNKx7Nkj
	ydusSUf6Ms8PUf/ttGi7phEdghbg2R5oSIurF1WI789m1xCidVNdj481WY2j/xcEzN4XURWD3vw57
	NbcWUcfTb+5DKhF7+MPLqQJBK5oUI5o5+TwdQUR7PJ+w7RV+wr6C6WMUZbJDNyGNaqKl08R1KZKQl
	u9cquNAQ==;
Received: from localhost ([::1]:34660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUGZO-001eWd-Vp; Fri, 24 May 2019 20:13:39 +0000
Received: from [2a01:4f8:192:486::147:1] (port=37056 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUGZK-001eWW-8D
 for samba-technical@lists.samba.org; Fri, 24 May 2019 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=zvs3yNO9V3xzSx6JRydF61u5dYCHxpS2pcdQDykdrKQ=; b=srqrVXvwBWYtaCew+DAPjr/kiA
 TrSrh+eFBja+B2jS8OttwrWV886ad8rL0JdIinYYh4Wbxznhh3TtJEnEhTXNRVZ9oGpdjIyP4GEOT
 VVB6o8WNkz1ngu7hsIEL/yAOsO2H3wkEQfuhuI6bPV98lMd8UbzPwbdn7WJiBDAlcbnE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUGZD-0004QX-Pl; Fri, 24 May 2019 20:13:28 +0000
Date: Fri, 24 May 2019 13:13:25 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: gitlab question.
Message-ID: <20190524201325.GC191396@jra4>
References: <20190524174326.GB136126@jra4>
 <20190524200453.an67hsjv3uwy3egn@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524200453.an67hsjv3uwy3egn@inti>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Fri, May 24, 2019 at 10:04:53PM +0200, Ralph Boehme via samba-technical wrote:
> On Fri, May 24, 2019 at 10:43:26AM -0700, Jeremy Allison via samba-technical wrote:
> > Asking to improve my gitlab-fu :-).
> > 
> > Ralph has a branch containing modifications
> > to a patchset I posted here:
> > 
> > https://gitlab.com/samba-team/devel/samba/tree/slow-bug13964
> > 
> > I want to check out that branch so I can
> > see his changes as a list of git refs
> > (i.e. I want to checkout a copy of the
> > repo it created for him).
> > 
> > How do I do that ?
> 
> add this to your .gitconfig:
> 
> https://paste.fedoraproject.org/paste/lSDOgcCzTXpYK9ggkIBXIw
> 
> Then run:
> 
> $ git fetch gitlab
> ...
> $ git load gitlab/slow-bug13964
> 
> To view the patches of a merge request:
> 
> $ git mrl $MERGE_REQUEST_NUMBER
> 
> eg
> 
> $ git mrl 490
> 
> to view your own recent merge request.
> 
> Hope that helps.

That helps *amazingly* ! Thanks everyone
for being so helpful !

If I could.... :-)

https://www.youtube.com/watch?v=hcJAWKdawuM

Jeremy.

