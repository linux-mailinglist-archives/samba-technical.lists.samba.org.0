Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F1417E5
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 00:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=+yDi/kQpp4kLHOq5Tt3rcjvr31Jt06Wp7FESo9aCeGU=; b=azQHiYPBMsRi8/TnNlo8YAKwrP
	XuISjUeysHrdcRH69yilpo6b9xf8fH7k1+Xi3dLEBSj1+iSLkXhgWDbddCKNNp3naZnq7qT20KwjQ
	llzygd1DETLHY+Y/tGeaBZXPZuQGcIFOYQNhTXJTKml+PNzgT9A4QBa8hgxf4r8Di6OlQbudrx7nn
	mRgMJMw2wbfZCi5FH9xCHizeiUkXFPUbtfnrlcdIcjzhRGSHp5JQVUrAFFeU6hHM7780nriknYy4W
	3G7JvI3bPcA3UJDcXjOdh/IAFT4r/qavswmrq4CmCi3BZXtGZTA6h+GosbbA5FEnoJCCpksQqgj++
	jAOk2VOw==;
Received: from localhost ([::1]:23294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1haotz-0013Nv-NV; Tue, 11 Jun 2019 22:05:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1haotv-0013Nm-9s
 for samba-technical@lists.samba.org; Tue, 11 Jun 2019 22:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=+yDi/kQpp4kLHOq5Tt3rcjvr31Jt06Wp7FESo9aCeGU=; b=LfMRpYDwPYQ2wTISyFX9hi/+Zz
 Kkq0Se0kEOBUggW3FPAEqjbcnmaVZklH+EWd/2kgjy3SlE0eLuwO8IommjgWyfLeM2qILMGs0QhT+
 hScfVwbZ9012YX+rGKzqbuwC0kyr1vGFG857MJuoVUDYiBUCHykJp4tVZr8u47Y6xJEI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1haotu-0005dv-EB
 for samba-technical@lists.samba.org; Tue, 11 Jun 2019 22:05:54 +0000
Message-ID: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
Subject: Some bugzilla work and thoughts
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 12 Jun 2019 00:05:52 +0200
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day,

So some of you may have noticed I did a bugzilla spree today.

We have a problem.  There are 2400 or so open bugs across the Samba
products, and I managed to touch about 64 of them today in a meaningful
way, not just automated closing. 

The challenge is that while there are so many open bugs it is hard to
find where to start or feel like one in making progress, a bit like the
multiple pages of GitHub merge requests that built up before we
migrated away.

On an interesting note, while closing out up to 10 year old bugs may
seem pointless, I've found about 1/3 were still relevant in some way!

Dealing with just 2.5% of the bugs probably not the best way to spend
almost an entire day, but I was inspired because I got some honest
feedback recently that the sheer backlog discouraged the filing of new
bugs, because any new bug would just be a drop in the bucket. 

Of course I emphasised that we deal with new bugs with much more focus
than the backlog, but the point still stung a little. 

Many of our bugs are there because it is practice to file one 'in case
a backport is wanted' that never comes.  Because we have no link
between git, gitlab and bugzilla many never get even a tag as being
merged into master, except by manual intervention. 

Coupled with the fact that the patches themselves need to got to GitLab
(or in the past the mailing list) for merging is also a challenge, as
patch development doesn't happen here either. 

I offer no solutions, not even my normal engineering ones, just my
observations. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




