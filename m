Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C48C19E4
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2024 01:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MD3crVYHpGjQqNA6k/A2tiUbZnk1em7RMpqJ5zwyCPo=; b=YvPX98sBbLt9R/3zEsGPMmTyys
	voUEqe4DHZlgGHTkKq/YYokAWpSyZF00g2GJiUtcIJBOUp8VOGytiDLSIKuv4sI8u5aPxDd5HdZ+2
	KRGWay7WpfLaE6ULxjPRu5m7wMf1J9kEQZFlRYxtHrP6M6xeUImwze5zM+bENL4XKDGH1JMRl+smo
	+Us9OHXMOhA2igVbzrd8zAANjivquVan7tKdBRaoM03ZPUOw0bFa2fltXPvhffwmFwODYASX5URzf
	b8gbboWx12J9THJq8M3ZzEU/AcCPUzqVe+QLTNXh1SbabgzDGWu2lBJ3XuDX0x0nReayspMzGP7wa
	9bfnmnPQ==;
Received: from ip6-localhost ([::1]:32006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s5D91-008bUj-5u; Thu, 09 May 2024 23:25:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18814) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5D8t-008bU1-7P
 for samba-technical@lists.samba.org; Thu, 09 May 2024 23:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=N+pID+dnUd7gzMHBRofZ20LX8g9hQnh1rX8IMQmQEVc=; b=Hf8Arxq18dA8YT4An/5CJHKaYJ
 A/MU43PqtYp9V/oddYDLtozvS3PfS2Qc+CDQhW2diNGlW8MULmWu/z0lFPR6iXOVDcUcS2aTxdB6q
 wJUfAdOjZpW01V8RmyfeuP3tDRzITyNd+vDdVaGDIHtXjgOiKKVd6KvSjrtvowtD6xSCun7JeyfLa
 ieNUi1Xsd0zj5ge7r7PN7wlDMT6R4m+sqhw2RgY3Jn2KwUs+slJfq1LS2iEX6c2lh30IqYVrqzEHj
 HXlufR0VPy2st9xYPbhHOLiPvZmzUR/pOVjAvMusSk12S7CsxAzr9dz+Ufd+Gdxn+Emb8Ty47IAyV
 /IUIsL8UQp/mWxTGwg5MxQpN8dxmPehWl6Z5rlhcxWfM1yU777+TClCbX/LRq+r4NZKxHFW+ETNQe
 YOR2OU7dOyQg5wKxl3byBaieWrUafoZyVgA/AdpJrD2tbY+qn5XQGoVI3O1sM71QLZLS++Jrcsxux
 f8XjP6njYyCeav/NSF296UJA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5D8k-00AfwD-0Y for samba-technical@lists.samba.org;
 Thu, 09 May 2024 23:25:30 +0000
Message-ID: <6ce4a15a3edac8db93fc9a744aebb0138d9ff5db.camel@samba.org>
Subject: Rackspace runners rebuilt:  Also note on differences between our
 runners and gitlab.com runners
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 10 May 2024 11:25:27 +1200
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a note to say I've rebuilt the Rackspace runners.  Still on Ubuntu
20.04 due to availability, but rebuilt.

It will means that if you have not rebased your branch on current
master, it will now be 'stuck' waiting for runner tags that won't
appear. 

One challenge I will note is that GitLab.com is now running an 2 CPU
8GB runner, but our 'untagged' runner at Rackspace is only a 4GB
runner.

To upgrade to an 8GB runner at Rackspace is double the price, because
it comes bundled with 4 CPUs.  

In normal use we would only use untagged runners after our CI mins
expire (currently we have plenty) or if there is an outage or
throttling, but for security patches we use this 100% of the time.  So
we have a choice:  Assume we still fit the 'untagged' jobs in the 4GB
of ram, or pay twice as much and not waste time chasing
incompatibilities during security work. 

A security CI run would then cost $24, rather than $12.  

BTW, if we don't make a change now and are in a pinch, the
configuration of tags -> runners is now in the GitLab GUI, so I would
like to document that we can pause the 4GB runner and select 'allow
untagged jobs'.   

Finally, given the way the new GitLab authentication token setup works,
the next person to rebuild the runners will want to rework the scripts
to have the 'blue/green' pattern used in dev-ops.  So instead of
'testing' and 'production', we would have 'testing, prod-green and
prod-blue' with different authentication tokens, so we can pause the
new/old runners again in case the prod deploy doesn't go to plan. 

Andrew Bartlett
