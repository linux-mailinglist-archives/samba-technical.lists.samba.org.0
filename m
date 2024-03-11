Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5677F8779A9
	for <lists+samba-technical@lfdr.de>; Mon, 11 Mar 2024 02:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=t6Vi+SuqydEAwTCCW5qSwR/Tx4XBQ78/tAodmyjWfcA=; b=N9cU/Scpz01pBuPoo9Aq/pcN5j
	C3/zZhqtsWsn2KFwmcRxdzJhXGRrDSCW2sgb/v+L1MhHdQdfyiHJvSoBS4O96XZRky+mmZUJF19/v
	zyd21RyDqWEWytJpRw6MTovgxKrV032NXY8VL//FFYTw7FbKUxziasuaq0/SEelHI8/+LVvsWlo5R
	f21bDQzgb64InZ3XaxPiA5qq9uqHjfNxVjDNe6yxAMUt/KRR0JFVQQEa7FvjiQqJezp3pqV1RMYqW
	dC6Gyu9oRglBKPbhFcbFIjoEmtGW0sl8uj3i5szAj8hzhqrav6AbY1vfZJpOjGGJhja4ARxDr+sNA
	qk7vI5XQ==;
Received: from ip6-localhost ([::1]:44164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rjUpe-0005xi-VE; Mon, 11 Mar 2024 01:52:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61210) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjUpZ-0005xb-QN
 for samba-technical@lists.samba.org; Mon, 11 Mar 2024 01:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=t6Vi+SuqydEAwTCCW5qSwR/Tx4XBQ78/tAodmyjWfcA=; b=P3FqbH/+wQFTiJRoMA6qRglxCm
 VKWud1LzQ8GX3DoKz+OXfwE+xjrSKmVfOSHLa1qoWa3NAY9qKfyG5F4cOYuZjwqioaxE39EWWlTfh
 5idIHIKUza9RcVJm5KCDBp/0Yabo4fb58BfakQN//cTtBpotAsWYG+MuoL5wFdVE7lk/RUzdhTdrE
 63udHQGNGnKQpAt9VYkbFuu17eCNxLDdj5RGyXpiVuzZWCmw5rjEFvbOr1YxaE8dWEPu8MHtjOkSm
 geTqk9RzpKzUDtMGpDUShZZvquqIR8RaqcsOy1QWo2yuhYomhrL93DBWl+Pp/4AGui/5CuRsQLLJt
 bkJI/tiUXM6B0fbgbR/eBy7Vc6UjpdJe41KDxRonx7E5I6hRW/u2hxNA0QE0MT+cTzxdt7ju/cSpw
 Us7J8CwD90jSao/G7kEkfo89gJVw63A/13mZTiWGFsc8PAmtey1vnOwkokKgLwIkcohrkvLZQeez/
 8TNFC3Xqw3Iz+HxymJXuKgoo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rjUpY-000AtH-14; Mon, 11 Mar 2024 01:51:56 +0000
Message-ID: <f738f2b35864be24916119e36b0b2812c506225e.camel@samba.org>
Subject: practical GitLab steps for the Samba (4.17) LTS project
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 11 Mar 2024 14:51:52 +1300
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
Cc: Santiago Ruano =?ISO-8859-1?Q?Rinc=F3n?= <santiago@freexian.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A few eagle eyed observers will have noticed 
https://www.freexian.com/blog/samba-4.17-lts/

Freexian is very keen to build a community able to support specific
Samba releases, initially Samba 4.17 in this case, for longer than the
Samba Team is promising. 

As mentioned in the blog, they are working with my employer Catalyst to
get things going, with regard to the actual engineering. 

I'm keen to meet a few goals with this effort:

 - make this as much of a community effort as possible
 - be as to be as transparent as possible
 - have a clear agreed, tested tree as to what patches are included in
a Samba 4.17 LTS (so patches are not forgotten).
 - Not be confused for upstream Samba releases, but still have a
trustworthy canonical location. 

What I'm thinking to do is to have a repo under our Samba Team
namespace at (say) https://gitlab.com/samba-team/lts/samba that would
hold the canonical LTS tree.  We would do all the development work for
the LTS in GitLab as normal, except for patches under embargo (if any
work is done pre-embargo).  This in particular will ensure we can use
the GitLab CI system and the Samba Team's runners and GitLab runner
quota to ensure everything keeps working.   

Unlike upstream Samba however, we will do the merge (with rebase) on
GitLab, so as not to put requirements on the autobuild host (it is
fairly easy to keep old CI runners going).  In the short term we would
keep to the Samba Team's rules on patch review, but the LTS team may
adopt different practices over time as the effort develops. 

If possible, it would also be nice if we could have this mirrored to
git.samba.org as a backup. 

To be clear, this would be an LTS only for security patches,
we don't plan to re-open development of other fixes. 

Finally, we do need to track what patches are being worked on etc.  I'm
hoping this will be OK to do in Samba's bugzilla (as this is available
pre-disclosure), perhaps as child bugs. 

Does anybody have any thoughts on this?

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




