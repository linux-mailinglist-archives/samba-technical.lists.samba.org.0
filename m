Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E9D78019A
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 01:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=L4rxVXeUl+qa3GaJW1cIzYMUQq93MkynYI7LW9q0oPQ=; b=4aNsO4Mgg5wxtunxVYfNpVk5VL
	CpgqV1cPrZLxgGb515JzZWeyWB6flfTb/0Iv2p/9LZHdypm3CaRWSU+52ktEYPAf1KyGrjTi0GY1M
	FBPDPPzcdSuGSBu5DiCIsirfViQl6x7wW6vifto5fAKpL8OlKQqGmCn0ipIIpiiV2f3ce+VmQ9rZh
	tp99lNRPf0MCNqLhceqwExTl8mK9wQE8iMywv3tz6Qr8kGZG7Rp5D2fYMt5V2jnwWJ/RJelmcsVNG
	7qz13joLQiDfx4GdsBvCrfPpqc1fSvep4L4h0LAP3LOFXq+L75dyr4u2uTpEV4ueOxHiEmU6NQSqh
	DmIxF6iw==;
Received: from ip6-localhost ([::1]:38626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWmHu-00Cxaa-Gj; Thu, 17 Aug 2023 23:20:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWmHg-00CxaR-Ci
 for samba-technical@lists.samba.org; Thu, 17 Aug 2023 23:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=fv5SYDsvYxlGb4ge+yJKliaXKY6cYrJWgythkOKyJvk=; b=DOftYCKDqsikKR/0tT1lOIa7bA
 7M5rsLK8T3898KGVcf/tOS0XVqZBroWZQfY6TD61nb54c4aYOKvcGhoDkpRmd/fOh5vUhc0AcAcTd
 iRO2/o2ZUfGoPn+Kbj0OGnMeyXKyn66Jn3pI6RVfpQ4BfCZAnW+5nT+z7MoQl5drVJopJkEWuD7wN
 Wjr3OLH0z4X4EZQRGnQNqm70097JjL79ugqf0RWe7LUWd4hZ2+N5viVl3azp5Tu7h+fyZx4RUzg3Z
 NOuydTiJG/Csp7lwHS7J5+oprauAQO85iOsA5kcAoTtWXMUFl7ObhgGDUL0uhNqfbBNhcsJpoNyU7
 5ExpgrdFfx10UMTmgmDHpk6pZGmrbCB1sRy7iUBKMysWqtVtFhHhKeV3y3tX5aFUkuc2liCGXjPce
 3KRIKsGCZvzN+N2mJBaUzPAhmxexCrvU0PsPqHgdLdlB2lzyi0PeIT0MGZaf3ZemMpEyGeuiz20lH
 2bae0HjgbSBYsu5nTz7+ZZsZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qWmHd-008elC-34 for samba-technical@lists.samba.org;
 Thu, 17 Aug 2023 23:20:06 +0000
Message-ID: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
Subject: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 18 Aug 2023 11:20:02 +1200
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

I was reviewing patches recently when it was mentioned at
https://gitlab.com/samba-team/samba/-/merge_requests/3228/diffs?commit_id=0252ca68359a330a92f9dad01d2c2cd037386c6f
that addClassCleanup() would be a cleaner way to work.

We need to reduce our CI time, and one way to do that is to reuse
objects as much as possible, creating read-only objects once per class,
not per test.  

This is much cleaner if with the addCleanup() and addClassCleanup()
methods, so I would like to be able to do that.

To do that we need Python 3.8.  The primary blocker for this is the
CentOS 7 build which uses Python 3.6 from EPEL, and a newer Python is
not in that repo.

Centos 7 is already only working because of an externally maintained
GnuTLS package, not in any distribution similar. 

I propose that we drop the CentOS 7 CI build, also reducing our CI
count, and increase our python requirement to 3.8.

The other interesting feature, while not a major change, is the =
support in f-strings:
https://docs.python.org/3/whatsnew/3.8.html#f-strings-support-for-self-documenting-expressions-and-debugging

What do folks think?  I know CentOS 7 was for a while quite important
due to the changes in the RHEL clone landscape (CentOS stream etc), so
I'm keen to hear views.
Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
