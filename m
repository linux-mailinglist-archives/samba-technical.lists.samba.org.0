Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316827501E
	for <lists+samba-technical@lfdr.de>; Wed, 23 Sep 2020 06:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=G+VK4bx4KvpqV3eujjSkIGSiJvltZ+JhHfN27fV+6tA=; b=QtFERcVdP8SJhdiPva9k/HIaiu
	V7mbPszVebUzrJbAKPwlr+uwYdHzAmHt5M+AmdtP/6GkRIV1CV2vRvAVTq5/9qLDPYEIwaFYCaRyZ
	62nlSAYKqDkoH6H5MTzrqZZ1hD1ZgO5LC3yvdMh8fst74Jmok1p7Ed5SXGv7dT5ri0+R1PvcTBoXE
	haHLKbLqgjRd5HW6AJUZQKlTHXjxQ5OC0nWTXyXfAAFBUoE/9sJdAi1wsPnaNTggEJz7VmvUWH1VP
	aF6+f7WsqpGhFpRqhrrsPsVfYV0Au1B/s73x/NjETK8y3e26nfvuO6O+cXa811/XSwAjVDkKNKEjS
	nvuI8C/Q==;
Received: from localhost ([::1]:47340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKwpt-006p6T-00; Wed, 23 Sep 2020 04:56:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKwpn-006p6M-Ei
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 04:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=G+VK4bx4KvpqV3eujjSkIGSiJvltZ+JhHfN27fV+6tA=; b=tAs3mSfY7YQadU3WdvKWQ7oq2A
 SKqQf+TCGjYWrHv28y9sku/c7UmOon2YM3qREU3ydZaIy4GheMFCWLFrJQWRliOXVag1Hg4t05oZu
 ZKb9QNP7CZ2LALzIA/C5D1731T16svPx5nIU0NXDahSnuTH4pqn3ErMZcpFXjqIu3hitgsv7YKGiG
 ZCqep20CagtkjUbXSzVAOIJw4X9kMT4UXj0XOFa6VYDUiYdj++LbylrRSaEHkfj4Wc2HYcrdbSutY
 cQzbyK6t7wr+hW+v/zcFaKVMuF+tfMPqfU7xc1LMjp4YW4qA+AFBMMwXY+Sa32gH6NZJZxcpartAk
 QkbWqS7rmZ9rswWjgCZ/h3Sly8YB+aAhK/zgqqHZ6DqNKs/jOoPo/XN/5QkFNOF96g/gVzOrZZ/Kw
 kH73h2b12JmYj1jseDo9V+mFhVoS22al+FHsvC3T0O3TsyI31ZCj0godLbbj2UN9gE3u5qc6nvhkU
 YeNB1pTZIfbTAEfPQv57LWGx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKwpm-0005cm-2R
 for samba-technical@lists.samba.org; Wed, 23 Sep 2020 04:56:50 +0000
Message-ID: <bdf12b6b4f7f11047fb626930586bd9774dafb0b.camel@samba.org>
Subject: Samba CI resources
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 23 Sep 2020 16:56:43 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

Samba uses a lot of CI, and the number of CPU hours consumed has
increased drastically over the past few years.

This has made an awesome positive change to Samba.  While time spent in
CI has a real cost, so is engineer time wasted looking at patches that
are not ready yet.

However, every CPU hour spent in CI is a real CPU - the cloud is just
somebody else's computer after all.

When we started with GitLab CI, we took about 4-5 CPU hours.  With all
the parallel builds we get back an answer in 1 hour, but we now take 20
CPU hours to do it.

I would like the team to think of is ways to reduce our CI.

Towards that I have two MRs pending review:
 - https://gitlab.com/samba-team/samba/-/merge_requests/1281
 - https://gitlab.com/samba-team/samba/-/merge_requests/1568

I would also ask that we all think really carefully before adding one
more build job or supported distribution (as those run a samba-o3
task).  Each job really costs someone, be it the team, gitlab.com who
provide much to us without charge, or the planet warmed by the waste
heat and the energy input.

I would also ask for other ideas to reduce duplicated testing.  I know
David is trying to do that - removing duplicate smbtorture3 tests - but
that got a bit stuck (it is really hard work).  I do wonder if we could
reduce how much of our testsuite needs to be duplicated for the MIT
build for example.

I also think we should also reduce, or at least not increase, the
number of supported build combinations.  We try hard to test Samba in
all the build combinations we support, but each of these has a very
real cost.  

For example, while we can't unscramble the egg that leads us to having
to support MIT krb5, lorikeet-Heimdal and system heimdal, but we should
try hard not to do that again and take my MR 1568 to take out the py2
builds.

Finally, if you are just doing a 'push to save' on a WIP branch, add '-
o ci.skip' to save a CI run.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




