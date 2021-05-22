Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A082638D763
	for <lists+samba-technical@lfdr.de>; Sat, 22 May 2021 22:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Q7feBur+1KL35KXAEqKVxowo/XYKJN0DMPls6/e+gaI=; b=YHGJ5ghQqQWgD9+4Kknw2ARRC1
	lRX+lShGoS/mZEPeOZjq64CEQD7zxQ3ZvYT8VOcw6I0RMkQXVnUCkB0oUgAvB2c9q8w6fqbbXgRMo
	r/1s4mphx4KgBfxjgSBjG25M1S/DyPD4ldzj+V4Q8Tb70poUH28U98C9SrUTboRkwZGhR7s0JYnIY
	Qg/FBK1ALU8cEUSU0jdb/8o+ULd5q5Kl7Te5QlAkPLG/SXfwG2GKfINhlrdGxtZTgXcr5eRjFOFn5
	vA+hluI/ci+kQbxJi9dXmjkXzvV8btftDBaTaP9ZsksD5v6dkZslpw6Lz/ULOQhiRmbH9TGqoIhKD
	b9Hv8xyg==;
Received: from ip6-localhost ([::1]:47208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkYD0-0035pG-Uk; Sat, 22 May 2021 20:26:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkYCv-0035p7-2O
 for samba-technical@lists.samba.org; Sat, 22 May 2021 20:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Q7feBur+1KL35KXAEqKVxowo/XYKJN0DMPls6/e+gaI=; b=PEP0ki1zuYY8I48/IoiwJMTSlM
 kfIJaTzAxATwZVXQpdijfcByBQ4fGwzQLyJj27lgE/8LJsOnGejBjRomfG/PDGDuJ0S54pvzwYCa6
 H2f83kJ89N8tKly2p1kSg2F1ixGvbnO6gUdHj4eod8XsT4MMUt6Iflc9Min2xq30TEMBFj+11Q9Y/
 3aL3YxREVjGl0O/BqE2MXXs/Wj4qrJpyY9UsmQD4kGnPu09QQr2uC6i4qBMdhsKe0WYewFaBH7s2H
 zUHhE7W4ztdDUuwnPzxs+UjQvxgQqy7Rs6/hkTgtiQc4wpIxcLci5gxWYdpwqZN9LM4sdDEVM7BPl
 tVDrTbHkxBI/MEizJAkM1wzGPjdJH/eRm05pd0BfFd/n10ZjHA8o8N7Op39OqjHqo4wey/44pGQoy
 KHIMx/DlqNoDBfiCg0iZhPFHYojDPBkkwmF+cvih+RJNRO85gT7ktbhOgp17vzEXpvTWfuiUM/q5U
 hSRoE8lkXhS+hw7lAxXAV+jh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkYCq-0005GA-3L; Sat, 22 May 2021 20:26:44 +0000
Message-ID: <7a3764cb1e5a68f874a0f05711c7b0acbd124610.camel@samba.org>
Subject: SERVER_LOG_LEVEL for s3 testenvs
To: asn@samba.org
Date: Sun, 23 May 2021 08:26:36 +1200
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Andreas,

I tried to use the new SERVER_LOG_LEVEL for s3 testenvs you added in:

commit 79b848fe592036a290941e5a7d44f355dd274fff
Author: Andreas Schneider <asn@samba.org>
Date:   Mon May 10 12:32:51 2021 +0200

    selftest: Also add SERVER_LOG_LEVEL support for s3 targets
    
    Signed-off-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Jeremy Allison <jra@samba.org>

However it seems that -d0 is still being forced into the winbindd path
with:

my @optargs = ("-d0");

I do appriciate the efforts to get some consistency here, so I'm just
wanting to check is there a follow-up patch already in the queue
somewhere, or can you fix this up?

Thanks,

Andrew
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


