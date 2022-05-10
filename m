Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4252216E
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 18:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aRM+AkqVDvqaE+TfOz2fJh9N+A5I+FtktbJuy0KC7Mc=; b=o6HFcbDhcybJ89oya8qN4iHVb4
	QSB8Ji/TjJ4XiU04nOrSklQHpmtmXzZ7cozIoBeoHSV2ZleZagJTvTWjPN50NneBZ7B6+uhVn/DWY
	0Unuabz21Eu/OWPnMsleSf8GtCLpvJ+GHCIazR4zqY9dWn6nHW3TDFziADYll198/bsJ/yxv46a8+
	JkoGM4Nf5kuBw4BIEflsemBi5ayAkhJ566SGI4AHaDJZMfsdiUrlBX4dsjrZr52IrpJqIy5pThvd+
	CMVX3Q4YIZKPMTHE60U3RON3V7EGIpoB2PGreQ/W62YhcZE9jo/iZCcuTTloe+NPWf2aAPVPQDqHW
	Xz7ez+yg==;
Received: from ip6-localhost ([::1]:56114 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noSs8-000OLi-Fv; Tue, 10 May 2022 16:38:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noSs3-000OLZ-Ei
 for samba-technical@lists.samba.org; Tue, 10 May 2022 16:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=aRM+AkqVDvqaE+TfOz2fJh9N+A5I+FtktbJuy0KC7Mc=; b=B6jGMNHVPhMet9mxlaBsvuB6AM
 T2ysGxp2yS63VcGMNPSsbWAEysC/yQSOhmmod7gv5GmO6y19ETX79Fjhq1nhw2VMsfh4bRavken0w
 OKiwZhGdVZu4asF9ltszbb6wQv7tAfy3nAjVgtAAJvgg5ljbIg+I9ufUND6U4ETrhqr7g/wxYCpaH
 TBb/+B9CXolxbFF8ZOAqK2EGsYL299KXJlPSWzdrgP+uu8IOHwOp7cEXPXgR4eDX2DHzWmyP5hun5
 tA5X6K2oByELZuMRplCpVyDA3y7r+CHA9RDPykC/uroCgVBz3O4XAQxRK7jc3vwVM4U3hMEExj1lu
 egDalZ9cJnBZ6WgMKfghtxxaQALEfdA5yXJQZKZ134ET7cj7KzOwb/OgM4CWmOBxHvrRU9iEVtdAI
 spJ/Yv4jJrxd7kW7HLytJf7grtCA5leDcm6ezA/BY821VZ4O65JtbdawFJaPFD4HWcv+hfIoLvyPg
 Dyk7zx9qSlQDHtdg+erPmEeS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noSs2-000Chb-Ch; Tue, 10 May 2022 16:37:58 +0000
Message-ID: <ddb8bf80-2f8e-b550-8db7-69fff7a68c07@samba.org>
Date: Tue, 10 May 2022 18:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <5cfc3706f386d516a520aab0b609aaff9ad10830.camel@samba.org>
Subject: Re: Status towards using OSU OSL for GitLab CI
In-Reply-To: <5cfc3706f386d516a520aab0b609aaff9ad10830.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 09.05.22 um 03:58 schrieb Andrew Bartlett via samba-technical:
> I've been looking into what the critical blockers are before we can
> fire up the runners at OSU OSL for more than tests.

At least a full pipeline passed! Many thanks!
https://gitlab.com/samba-team/gitlab-runner/samba/-/pipelines/523380456

> My current task list (which is what I'm working on, in this order) is:
>   - provide API keys to cloud_checker.py so it can terminate old
> Openstack hosts
>   - test operation with only API keys and not original passwords
> 
> The next step would be
>   - Reconfigure runner limits to per-cloud and to match our OSU OSL
> quota
>   - Work out link or otherwise between
> https://gitlab.com/samba-team/gitlab-runner/ansible-role-gitlab-runner/-/blob/master/vars/docker-machine/osu-osl.yml

As far as I remember this is not used at all by us.

>   and
> https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/cloud_images.yml

These are used in
https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/osu-osl-samba_team.yml
and
https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/vault_samba_team.yml-REDACTED

With this commit I did today:
https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/commit/15cbe2f06036d6a7ac5a12fce0a4bd7193797d05
we should be able to login into the runner as root and inspect /etc/gitlab-runner/config.toml

>   - engage with SFC via the PLC to get commercial terms with OSU OSL
> agreed.
> 
> In terms of our fallback position:
> 
> I would note that while it would not be ideal to allow all our jobs to
> run at Rackspace, the cost increase ($700 per month I think - 150,000
> [avarage mins] / 60 [mins per hour] * 0.28 [price for smaller rackspace
> VMs]) is not great, but not nightmare stuff either.

Maybe we can run both and spreed the load?

metze


