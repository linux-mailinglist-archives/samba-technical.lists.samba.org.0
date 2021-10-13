Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EEE42CA93
	for <lists+samba-technical@lfdr.de>; Wed, 13 Oct 2021 22:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=b6UhQ+pINL7LGa3ydziAYaMUsPj0mgxLp9o3IG5/KPc=; b=u6JYM6mJgJKTOstPcOxHNRcGHo
	iFLz4lMNrbWy3vVKTiUGJw7X85Yl4Lax/3e/rX8l93R86nW5S6HEpq9OtmpuGq0HpehVy0FyixuJ0
	sMcAraOfgwasqOL3sNIccbmT5CYrvjtQrI+4haFsrrBM6SaKVaT7DRwXH3vpsZ4PFNB6kvucc3Fb2
	TE8aVwSl/ak06gb0chK6JnUzQhohTskQ8MXJPCga6wkXLRwR9H43zYSt1QKQm4c58cMCf4TxOt/0k
	JSG7ZF2lc3diO/i3OYr5nCwqVW7JVsuv/e66SlU4bNrswyJ0uZqo9T6djJo5uxjSXSl8FqLbJW08q
	lLCYTueg==;
Received: from ip6-localhost ([::1]:49626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1makRy-007ONg-Um; Wed, 13 Oct 2021 20:02:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1makRs-007ONX-GQ
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 20:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=b6UhQ+pINL7LGa3ydziAYaMUsPj0mgxLp9o3IG5/KPc=; b=dMdOzxUObA2cz1RNW+jEXjz5m2
 KCR+ZauQ5XK0SijqNOuZ8s4qTFS2qvIvOU2jVBJu74aNvzNIOGC2v2kzR/PbVvScdLiHyyjQvWgcF
 BXP5T3210rbjyiTS/3aoHSkKgK4lYOFUu5DfBUP1uJvNKGVR5SJ+x5hrdSuxT6BE5HAM8k6zJ/ikM
 vAAgOx4htSRfDP5okv/iVT6aS75Y8s/q/eT6tXFNALTCrC8qHJd5y249d8i7e9xpIe19iDWOdHcZp
 8RxOVvV3k1ocQS33EIQ7yBA56i5mQ9rCJeK3zFaC7Q/mrwnSz/KlnJIMqRJBIq6T5mxZ364odQboF
 g+vbPi1uL8Y7Wi8tGgC/2QGQJKBfYNRuFHOE6iq/4VpVmN9xkTOwSWQt4gSVxtrYvenwDC2nFb8TJ
 SSN8CA+fC06POgU0V241UHsNUucDNp/qrvMFQjTERtO4qrVihIjNiyrKdd8WjzE9F6dy0vubcCOlT
 BbSM2vhOzy9sjKBnza7rYK4e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1makRq-001DLB-O1
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 20:01:59 +0000
Message-ID: <a01a4caeae1cb27f3bd43aef1c4058450e984db6.camel@samba.org>
Subject: GitLab pipeline trouble
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 14 Oct 2021 09:01:53 +1300
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've just put up 
https://gitlab.com/samba-team/samba/-/merge_requests/2204

which should restore running our full testsuite.  Take care merging MRs
proposed until we get the commit in.

It looks to me (I tested, honest!) that GitLab updated overnight, but
perhaps I just screwed up.  I've also found and fixed why it wanted to
double our CI bill, which would have been BAD...

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


