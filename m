Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F4522B82
	for <lists+samba-technical@lfdr.de>; Wed, 11 May 2022 07:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=8ywQORK+AQvU+9B4t0meP56svF0bPjfVGc75DAbPXbE=; b=B+evkeiMhNkarpGW2mg1IRS4bv
	6HlOu2kNWjaPXvAoTq2G9JWwZKc5hMW/BSvpPiV1toYUapewTbaeB+iP6vdgAkH3FSILGQnYrFSEe
	lXjiAnwHcyowE7wlRstj+d2V2mGXCoYH6LlLyCFxmhDN4nukEQkmQZ9XwsTQvdLZqsgMXfCnQT73t
	J/RHLwt3+wLtqc0Zc6Mofgd/uTiqKtefhSaM0DdZ8A2cwaZxAHPi9DKm5/RdRfB40c4lw83va/Yn2
	5E2Wjmp3d6IM7wk7Fub/zuS4G2ha/SHYVSfUTunCiwifAhOTEPqCPg72rMBu0El5UdTG1JDyE7ne+
	XsxMYi3w==;
Received: from ip6-localhost ([::1]:26958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noeYu-000Xcp-GS; Wed, 11 May 2022 05:07:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61496) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noeYp-000Xcg-Np
 for samba-technical@lists.samba.org; Wed, 11 May 2022 05:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=8ywQORK+AQvU+9B4t0meP56svF0bPjfVGc75DAbPXbE=; b=YeJfz/H5AFI0M6wR3p8mKm1TFO
 x0VtXUPZ92QcfHzv0vZ4mOvp0JU8BgRRnF/RCqlxD5g+U+oUt/8XeNllexagNP9pMwAUD+r3AdUo6
 hB+e0NH+5EcoC1YBDnf5EPZKaKQ80DPn1Lt+hCtcrBdA8zaWUeTEe3qgHRLEuVMsCehxASexA1/Yz
 l6iq0TsEszm1BFMz1vgqKRsC/lPxdlYuHocwq5c/VS7ihwLH33+HpZID8DfkKsdRqEZ295BLPrNOo
 t3NaJR9Vlhw/kUAanzFNIagSr0v57fw2mkgbJUUq3m4N7JcikFWwPq21LimS665/M1nqwHXGCq+78
 cg01+Tnn5K3K1a6FlKYD/+H6VL1k0Gi88OngMTyLtLVmSY7qBlWaGIxQEF2AjnUUP9aeHaWNNEskj
 wDsWNicBe2aBDLDcR+YNIBcsUjFruqdhWNtsbncAFtj3xYcrk/JXhUE0ESQnSGXMb/9ALztZawKJU
 tpMtb5HuUt9oi1T/lhiRkJeO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noeYn-000IfN-PT; Wed, 11 May 2022 05:06:54 +0000
Message-ID: <399cf0a860e1f4758ada3050d0d3d7e11b7a759a.camel@samba.org>
Subject: Re: Status towards using OSU OSL for GitLab CI
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Date: Wed, 11 May 2022 17:06:48 +1200
In-Reply-To: <ddb8bf80-2f8e-b550-8db7-69fff7a68c07@samba.org>
References: <5cfc3706f386d516a520aab0b609aaff9ad10830.camel@samba.org>
 <ddb8bf80-2f8e-b550-8db7-69fff7a68c07@samba.org>
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

On Tue, 2022-05-10 at 18:37 +0200, Stefan Metzmacher via samba-
technical wrote:
> Am 09.05.22 um 03:58 schrieb Andrew Bartlett via samba-technical:
> > I've been looking into what the critical blockers are before we can
> > fire up the runners at OSU OSL for more than tests.
> 
> At least a full pipeline passed! Many thanks!
> https://gitlab.com/samba-team/gitlab-runner/samba/-/pipelines/523380456
> 
> > My current task list (which is what I'm working on, in this order)
> > is:
> >   - provide API keys to cloud_checker.py so it can terminate old
> > Openstack hosts
> >   - test operation with only API keys and not original passwords
> > 
> > The next step would be
> >   - Reconfigure runner limits to per-cloud and to match our OSU OSL
> > quota
> >   - Work out link or otherwise between
> > https://gitlab.com/samba-team/gitlab-runner/ansible-role-gitlab-runner/-/blob/master/vars/docker-machine/osu-osl.yml
> 
> As far as I remember this is not used at all by us.

It looks like gitlab-ci/osu-osl-samba_team.yml has
vars_from: docker-machine/osu-osl

> >   and
> > https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/cloud_images.yml
> 
> These are used in
> https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/osu-osl-samba_team.yml
> and
> https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/blob/master/gitlab-ci/vault_samba_team.yml-REDACTED

BTW, I think the vault yml files have become too complex, so I'll see
if I can rebuild them as public files with only the sensitive stuff in
them.  It should also allow more of the same settings to be used
between test and production, and allow a clearer version control
history.

> With this commit I did today:
> https://gitlab.com/samba-team/gitlab-runner/samba-cloud-autobuild/-/commit/15cbe2f06036d6a7ac5a12fce0a4bd7193797d05
> we should be able to login into the runner as root and inspect
> /etc/gitlab-runner/config.toml

OK.  Otherwise login would have been as 'ubuntu' which is normal in
cloud images. 

> >   - engage with SFC via the PLC to get commercial terms with OSU
> > OSL
> > agreed.
> > 
> > In terms of our fallback position:
> > 
> > I would note that while it would not be ideal to allow all our jobs
> > to
> > run at Rackspace, the cost increase ($700 per month I think -
> > 150,000
> > [avarage mins] / 60 [mins per hour] * 0.28 [price for smaller
> > rackspace
> > VMs]) is not great, but not nightmare stuff either.
> 
> Maybe we can run both and spreed the load?

We could do that, for a price.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


