Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C72902BAE
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jun 2024 00:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=CgGmJn0pb/aOAtqZ3gmxAL5TtOo2jsF4w3LU8lHc8vE=; b=ojduj4evZdexsno0IFc1duFEv1
	lPgMkVLEV1mCyIZrFirSm8STCXyNDyaG0CsJRB5CWAikLvQZfAa042zJFeCKciXsqv4WAj2ZOI5qR
	kXejQhZYD68NfpD9WbofeOwuq5g2bPV/lOVf0twUpWyiE7MP7zpirHewQpcTcB/pRl7XlDhhMiDv4
	yNG/mrdqrjaF+Tun3RLB/Zhj+sY+zVl1yW7Uu1WuBpQ23vgobD18xm0seuHO2MHJC71g1/7YXw8ZA
	c5PPQW5/IbGj2bqHkeqd/u7gfNA3le4097iQcSyCQvbiJY/1CLS9kZt+IQXgPj/sLzVOY1IOwP/bu
	PUSyCWzw==;
Received: from ip6-localhost ([::1]:57938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sGnVq-00DPJC-Ix; Mon, 10 Jun 2024 22:29:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54862) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGnVm-00DPJ5-Df
 for samba-technical@lists.samba.org; Mon, 10 Jun 2024 22:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=MJmvug0Rz+swhBJxo8MsmeY/EYav62uTPxJXcU2JyZE=; b=ayNjfo5Dj1iRLHqPdGf/xrWWnC
 8irbnleBlwWCZUorgLuDYPvHglKo7sQa1g4LCwvQ4yQiZr1Yx5E+HUdRKKYwMIFlF193Z6YQxprvf
 2lIb7Ehbbz1w75kbPcWZhXCvkCULXvXWO9U97Pg9kRkLByC4KTb49tWnOw4cubUc8HGrbi+6Y9+1a
 zpogVXhxrGvXEibR+0sCIwRbvl+AskxR11y0zIKPZEipzlYEWOsaJz5n37953x35KVw1W13JEUvng
 Lq2rbo11mda5syL3x1TSe9vsC7vQdYZlMFTr9Ci9SluPJOU/yQLxzWw5ObZxPor0mVtcBP7STDHC+
 0QOIjk6r0eIEFtfHdkS9vlETcnqrpQKDRq5+mJwfnKkQAJzIV+E+dYxpRNhBSHyAPkcn5ZjIOhe7b
 iSCpgGWnoP64zQ6+z//wl8odsnMx1gvNU+IYHhCDRKx9uZ1Y1k5nY19+5H4ysGYKvXmCS9S7xnN+f
 6N64eZByY1O60yJcaHqvNs7E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sGnVl-00G21b-0f for samba-technical@lists.samba.org;
 Mon, 10 Jun 2024 22:29:09 +0000
Message-ID: <d5f766b90be9baa1a3f0eba4ec6e9ffcd7e5ca6b.camel@samba.org>
Subject: Options for Samba LTS merge practices
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 11 Jun 2024 10:29:05 +1200
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

I've been thinking about how to do merges in our LTS repo at 
https://gitlab.com/samba-team/lts-community/samba

I'm asking only for LTS as it is being done just in GitLab 

I'm thinking this repo will, at least initially use 

Merge commit with semi-linear history


https://docs.gitlab.com/ee/user/project/merge_requests/methods/index.html#merge-commit-with-semi-linear-history

I think this avoids the branch spaghetti issue with merge commits and
keeps everything bisectable, while grouping patches (which is helpful
in this LTS environment) to ensure good traceability in this effort
back to the MRs with the approvals (upstream we do that in the
bugzilla).

Anyway, I wanted to check here for any strong views.

(If this goes well, perhaps we might consider something similar in our
main repo, but I'm not suggesting that now)

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
