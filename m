Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5039665
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2019 22:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WLr0dd2XPkrMx5QGPszCJNf8dsbqIXNaKVpH0ba0GIs=; b=KMSUbiXpMERbdLvsZyRLppO/iO
	USf0tqCJe7tMNTTkJLlS2hZoRSIgFc2cvwe+sy399bnK1mjc5QeavyjgChvrxTmLx3IbOYItB2TWn
	6PMkurWPLPqxE2cN4um9CASgZyMFcvN7lixkao/fIqyIfE7RiKfEKY7qJ8QEgBq4SvF23XCV1rvlj
	RuL1Nao0y8l5uS01VZS5u8je0w0I8ZvUfKumLA78ZnE+4Zlw08cJamiR0gRhRdX54eETDdgNS/3QL
	NXz2qIoN90ngmRXMlQwBdonSxWUFLLmq1O2FdOe6+sajVWogk8sq21z1gt6xS8y8PyVYCwZ70naha
	3y88qQgw==;
Received: from localhost ([::1]:58476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZL4x-000RM9-QZ; Fri, 07 Jun 2019 20:03:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49412) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZL4r-000RM2-4y
 for samba-technical@lists.samba.org; Fri, 07 Jun 2019 20:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=WLr0dd2XPkrMx5QGPszCJNf8dsbqIXNaKVpH0ba0GIs=; b=abWgUGwIGxTZLb1qfnmYpGFoxR
 IN1xOr2XeMKG6iX+A0LANhkLxErfzAczM1cKYM/iqzME6TAi0prCFR3U1HPRqJR8R4jc2cKlv/jbA
 UGYSW3jTwB3JrkMIQQiryjblcGJHhk15UgUR++jD3FyIJBt0ozTxSAuZAmHSia0+vvFQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZL4j-0004L7-5U; Fri, 07 Jun 2019 20:02:57 +0000
Message-ID: <99fb07cd9da7dc0bc5c5d0e1792e8c40ece1dec4.camel@samba.org>
Subject: Re: recent flapping tests
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 07 Jun 2019 22:02:55 +0200
In-Reply-To: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
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

On Fri, 2019-06-07 at 22:42 +1200, Douglas Bagnall via samba-technical
wrote:
> Looking at the ones that flapped more than once, first on 14.04, then
> 18.04:
> 
> Now I'm switching to looking at all our 18.04 bugs since March 1,
> not just the ones that overlap with the final days of 14.04.
> 

Thank you so much for doing these.  It is really important to quantify
this problem space!

> 16 auth_log_winbind failures:
> 
>   10 UNEXPECTED(failure):
> samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTest
> sWinbind.test_wbinfo(ad_member:local)
>    6 UNEXPECTED(failure):
> samba.tests.auth_log_winbind.samba.tests.auth_log_winbind.AuthLogTest
> sWinbind.test_wbinfo_ntlmv1(ad_member:local)

These should be fixed by Gary's patch
968434525480020999a30881ca20b9b13c99ad65 pushed by me on 6 June.


> The to 2019-02-22 numbers are looking at ~53 days or 212 test runs,
> while today's numbers look at ~99 days or 396 tests. Converting to
> percentage chance of failure per test:
> 
> wbinfo:             4.3
> notify:             4.0
> ctdb:               4.0
> auth_log_winbind:   4.0
> password_lockout:   2.3
> ldap.notification:  1.3
> audit:              1.3
> rpc:                1.3
> others:             1.5
> in total:           24
> 
> That is, our flakey tests have been failing 24% of the time. In the
> previous time period, they failed 17.5% of the time, so it is
> unfortunately true that we made things worse.

Hopefully with the above and the CTDB fixes from Martin we are now down
to 16% again, but help on the notify tests would be a good way to knock
another 4% off that.  I think a goal of only failing autobuild 1/10
runs is achievable. 

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



