Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F151F292
	for <lists+samba-technical@lfdr.de>; Mon,  9 May 2022 03:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AKqUq01TDAF15zfpdLlHaS/w3ULfAwqSSNiuxxbx6g0=; b=1ZjrJBZAOw2xX7MRbeLVuIwFGu
	C17z6CrfKvIaNYW/xiXHcZUhuEyHVYddGhxcrfpyNwLpFbfipigmh33HfpBSNqnMlnl8anFpp9toE
	RwfJeKnf6mxNyrk2iZPvH7GnjqY9bWJ7vsPcpuTRK4zggqX/GFTLl6nPzDs6NxdMxjkyqRTdRMB1t
	k3sbPXyvgVq5X6XVLw/W3h4EQNi4mPHSCLJYchYU2lcOh/WQEKrrg9Sifmq0W2AlpjB7CYhpwI1lo
	XkVTtOAAW7pgGMb1K0Rspq8Kwz698Ru4y+PJPBYjHVn/SIogDl6/nq4vXesgSMWhH5NkwKqvQmi0i
	XSqYZ1dg==;
Received: from ip6-localhost ([::1]:28594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nnsfd-006pj9-ID; Mon, 09 May 2022 01:58:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nnsfY-006pj0-Pm
 for samba-technical@lists.samba.org; Mon, 09 May 2022 01:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=AKqUq01TDAF15zfpdLlHaS/w3ULfAwqSSNiuxxbx6g0=; b=ZcJvpM31Fq1LZ2Kj1fkkkc6VR3
 EFTSEIFoEu428n6mXi7CVxTt2VXXWfwRU3GA449Hfcr1i+QzdvDK5nm4e9u4HIpnKT764KDV5Ym6z
 7jRKmR12hfm75aRwPoSWgzRDT4+HXYVxY5X4pLqu6Opl7b7Rs6a2EFyPdalxMC0KomqeFiB7/8xCY
 0TpxRmWm+t93VIwwptJ9sze2pHC/OUC75xDZ3Avt5xXIK9TiD120xKGoi8V85vfOsApWoOPDqF2/O
 SEI50iM15NdrnQY6aDS70oRymFKdIplw7cAkZi8D0jsGbbiFdT2NvOujTrHMPcnuM/IEQuAVz0LkO
 /b4b5p48V9mIp1ruKrIR7ly3wxTGE2jo3As3enscKECSXedfqV7UTt+NKlwZkM7/T5cwIMwiwGLoP
 LpO4YWm3Ucq3GxdIjP0SXLuSqRSb+AdluLd7SdIIHEJDOSLSTVbWvnqL0fE7f62zB8sMb2qrVlSw0
 Dlmc5VVnkC3uFhYZkpt2v7NS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nnsfO-004z8X-Tc; Mon, 09 May 2022 01:58:31 +0000
Message-ID: <5cfc3706f386d516a520aab0b609aaff9ad10830.camel@samba.org>
Subject: Status towards using OSU OSL for GitLab CI
To: samba-technical@lists.samba.org
Date: Mon, 09 May 2022 13:58:27 +1200
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
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've been looking into what the critical blockers are before we can
fire up the runners at OSU OSL for more than tests.

My current task list (which is what I'm working on, in this order) is:
 - provide API keys to cloud_checker.py so it can terminate old
Openstack hosts
 - test operation with only API keys and not original passwords

The next step would be
 - Reconfigure runner limits to per-cloud and to match our OSU OSL
quota
 - Work out link or otherwise between 
https://gitlab.com/samba-team/gitlab-runner/ansible-role-gitlab-runner/-/blob/master/vars/docker-machine/osu-osl.yml
 and 
https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/cloud_images.yml
 - engage with SFC via the PLC to get commercial terms with OSU OSL
agreed.

In terms of our fallback position:

I would note that while it would not be ideal to allow all our jobs to
run at Rackspace, the cost increase ($700 per month I think - 150,000
[avarage mins] / 60 [mins per hour] * 0.28 [price for smaller rackspace
VMs]) is not great, but not nightmare stuff either.

Andrew Bartlett
 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


