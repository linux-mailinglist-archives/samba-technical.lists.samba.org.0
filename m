Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA37933BC
	for <lists+samba-technical@lfdr.de>; Wed,  6 Sep 2023 04:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1TFD8Vi8CSn6R1t6NzleK9NTioSHTAGviC89S898VA4=; b=YQqQMmxS90Ka7LK7DhvCe+iGfW
	F6yCzJWbBXxYTMY0hnCmLE7B264S119jUxIoKiPBCBGj9TdSqCZuhYhpD57Ymh8tLwNS6sit8+kq6
	5YOZGNz9M43nw6TJgnLSMgp55zU0LDiTgRhWBgHzQWxLdHUOmWZ7Hh3Qx8GK2m0ArnFBdaqU9r4Qf
	qbAIz0KXFOvaex2QjqPq4QNDxzLhQCgYmKAxCe3LNA5olMvZIECHBMtoIQDNOnwelLUoDE8EfNBCO
	ouac1i1K8djV/1Qx6oY0mYUd0JeUIGorrKDoRLkV2zUZv2KIa8DD7nzgtJLW4w40i7E1fHz8nQHYN
	4qCBlCvA==;
Received: from ip6-localhost ([::1]:47064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdiDI-0014sv-Ug; Wed, 06 Sep 2023 02:24:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12582) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdiDC-0014se-LE
 for samba-technical@lists.samba.org; Wed, 06 Sep 2023 02:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=R8XG3QaG5vozRoVfEifOoEV1t6eP2abs+7IZb98JaY4=; b=1nWHBiE/Omupkd6DqU/NGHRvm/
 buStlNghRuwOPcclJfg190Z9cmfUSxJ+lAgF6WsxuNQhxRNEkENpVVATLw0/xxc93JCN87SOHOYOp
 XvUP4/qTCqwdjErnRa3RIoug/RZUKpXZDW5Sw1w+MqObX+NXWnnCOtjwJuBHEEYmgYdIFAsZ0tWvO
 yeqZpFUOb9Uhuo5u+JQd8Xs5u5Qkb+Cl2U4DIJp+J8dToFwMRc0tvdPVAiwn7911ZGEzGnMBsrkl5
 aQV15JwAhjj6si18ybS4jzw6KvsWGCOPakorUccT0oO4Dpi+FpuoJ8V1COfFn5GIwhhwjFiaxW4KB
 xL1+y8mNhQ/y5Qy6sJKSjYWqdQJcgjBdTs+kYW0LYwwKpUzhlO0BuTgOLYzbHkyzWpri9qQdSxaBy
 419X6qxn+roCufwavUStsmAEJi3E8rdIQgI/IgjtjL4X3Hw01hd/Rg8s4qwWFT+0bWa1U0cwZhI8G
 dsAWfVItr8/vBA+YGffLdzR2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdiD8-00BzMI-2C for samba-technical@lists.samba.org;
 Wed, 06 Sep 2023 02:24:07 +0000
Message-ID: <38e471b78bcb1e2584adb304bafa7090c18616b2.camel@samba.org>
Subject: GitLab runner update - fix samba-fips on Rackspace runners
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 06 Sep 2023 14:24:02 +1200
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

Just a heads-up that I've rebuild the GitLab CI runner at Rackspace.

The old kernels were  4.15.0-159-generic from Ubuntu 18.04

The Kernel under our CI images is now 5.15.0-41-generic from Ubuntu
22.04 

The shared runners are 5.4.109+  BTW.

This seems to fix a persistent failure in the samba-fips test, eg as
seen here: https://gitlab.com/samba-team/devel/samba/-/jobs/4840635606

I've also taken the opportunity to set the maximum job timeout in the
Rackspace side to 4 hours - within 5 hours a VM will be terminated by
cloud-checker.py, as script running on the bastion host, and to make it
not block.  (Blocking deleting hosts is bad, sometimes the calls stall
and fail to complete, preventing other VMs from being killed off).  
This should help keep our CI bill under control.

Also of interest is a MR to only use shared runners
https://gitlab.com/samba-team/samba/-/merge_requests/3255

I'm shocked to see this all green!

This would mean we could save our private runners for security work
only.

Finally, I've noticed that GitLab upstream has removed their reliance
on Docker Hub, so the limitation (an aggressive rate limit) that
blocked our move to OSU OSL a while back no longer applies.  If we
chose to go the other direction (move more CI to OSU OSL, say if GitLab
changes their CI terms/fees) that should now be entirely practical. 

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



