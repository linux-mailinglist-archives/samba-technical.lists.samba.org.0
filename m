Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6A4E48F
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 11:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Zj3WBoYCoFh21KPz+e4iaweSHS3LK06MzmrqSK78yCM=; b=mwziFT9O3cmSHXK0RF8j9pECL/
	+TBJxsOXt8zD110p4zlCIKzQNSUI5d9drRDxLWn5RyomTXJjIRaOSwp4KeiAk5nRcCXpXDFu7155K
	R7yUM9EXlog3X/NL1DdrTN2XPKBr+Pfnk1LJqdfTMMKZ58Lyr7mxQqt4f/51OTOrYx3x8UmoxWK/e
	3Xl0HSX+Ph9L2QpGnezt25BiESgYg2RuY/+qOgshj2A8IDi4JwNscFqA9Y6pyBs0xKA65S6wgcqNK
	GA52N/aafhSN5G9vBjPgUafFC8j5/0madQWSy+e8hBGh5VpACqMV5wTUJAjPClKe2NCd5icXj4r/f
	MaUC1n/A==;
Received: from localhost ([::1]:25472 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heG95-000vRd-IJ; Fri, 21 Jun 2019 09:47:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heG91-000vRW-Fk
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 09:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=Zj3WBoYCoFh21KPz+e4iaweSHS3LK06MzmrqSK78yCM=; b=fj5kUHXTBsUoItOKDOpbOHNBXc
 BqeIAjAOpNKa4a2TOEliFQkB+JdXe37ti82OYTFz6rAhPT5GOqZIqpYfwrjlD6sT53dXxrgSmiN73
 Amq+rruWe3s1e7QNvayDIGDAG5hg4oDqopfOTz1ZjR/lgK84O887XkkwKZaSxULgvupo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heG90-0001t6-0E; Fri, 21 Jun 2019 09:47:42 +0000
Message-ID: <26844fe9f6e345124b6109e408af38a0063f1cf2.camel@samba.org>
Subject: Re: [Release Planning 4.11] release notes !PLEASE READ!
To: Karolin Seeger <kseeger@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 21 Jun 2019 21:47:37 +1200
In-Reply-To: <7d897a6a-fb3c-a8fc-8ea5-5199153ab3b1@samba.org>
References: <7d897a6a-fb3c-a8fc-8ea5-5199153ab3b1@samba.org>
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

On Fri, 2019-06-21 at 11:23 +0200, Karolin Seeger via samba-technical
wrote:
> Hi,
> 
> as Samba 4.11.0rc1 is scheduled for July 9, we need to fill in
> release
> notes. So, please describe what improvements/new features you have
> introduced since 4.10. Please remember that this is very important
> a) for your own visibilty :-),
> b) Samba's reputation,
> c) users/admins using Samba.
> 
> If you don't want to add the changes yourself, please send me either
> your text or at least a few bullet points.
> 
> Thanks a lot!

We (those involved in the work) will get you proper text for a massive
performance improvement in our AD DC:
 * new LDB pack format allowing operation at the 100,000 user + 100,000
computer scale
 * LDAP server memory efficiency improvements
 * Many other small changes along the way to allow practical operation
at that scale

Also LDB index safety improvements (the patches that just landed) and
the bootstrap system showing users what packages they need to install
to build samba from source. 

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




