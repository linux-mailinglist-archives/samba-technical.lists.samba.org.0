Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8935AEA7A7
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2019 00:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Dy6hW5X73/WWlIhuOXMVaeoTvVauVcFMUkXh0YZcJMM=; b=dXG0N9OqfGDr/6oTUR3gcc3Hu3
	Wg9fWiHzPDXFkNWshPiiOgPltQaucy6jaIQEJ15I67djRxhbb8/1GQKTLF5igGS/ZMwy/xWeisoZG
	b/PcrcaQCOuJgOXHc8kLsmwy0RSDONn0xM+hNqe9wDN4zEVmbMDXuCTIsChPF99G9Bm6TzZFn3aOM
	GK1nx54IgBekSBwAp+CUsxe00n3FMtjD9gZVoCKDndVeot/g6ky4DGGjw3ZzWTbjRG1H8/yqZ7zeQ
	A9PnUzmy7kkYn93xaJ/YZo+dmY5urhEq70vWxr504l5ISyPM8lAg3ruN33xjvtlKFwcxVCLhck9i2
	qQ0Z8Mig==;
Received: from localhost ([::1]:49280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPxEi-003qtt-8c; Wed, 30 Oct 2019 23:18:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPxEe-003qtm-Mx
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 23:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Dy6hW5X73/WWlIhuOXMVaeoTvVauVcFMUkXh0YZcJMM=; b=LVPSCKpYukKaamonroR8W2zvlg
 +7Ym8ZQRySI4ms7iA+K1zZUeghxiBIT2/YZBJRcPqlJe0HA5iZkjgyAfwbmXVDfQ9iTJDC+HlLf4D
 OyX+IF3+gkfgSyUAy0erW0dpxrdlm6TVLTrzKjM80GQvh0RV2K+I/aSkx8f7lzEeSFLqt2UnJHMsC
 UmX3H+JBYZsxILXPxdAvVse59uqZ1Xro9DAdUfSEh4olQlLU8b/nspE9bNCY1NaHoY+8vVPo60opq
 Uu9Cxye84vDHpMZiPg/WEmz81pQJ9yc6v7HSjI9BbpN6Z3NdVTFgnNgVN8/s5EbixwUxiKmnE81bS
 +HH8dOYl4VSu6W6japlz6DVn/9KGAdWiAHjByRTG8V5NBTjljSAPj43ws2lR8wjonD6AL7zwTyW9D
 7rLh8q0urEDes4YaIANVqMrD12DW732Q5n1+AEEW69JnA27W1pe4RMVYe0sTVidTBnLazEugClcJ8
 y9RWTbOytGay6SzifM3MDniH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPxEd-0000Ah-KQ; Wed, 30 Oct 2019 23:18:40 +0000
Message-ID: <138c4d166b885f6ba112f6e74037a1f1c30ea436.camel@samba.org>
Subject: Re: Problem regenerating gitlab docker images
To: Christof Schmitt <cs@samba.org>, samba-technical@lists.samba.org
Date: Thu, 31 Oct 2019 12:18:26 +1300
In-Reply-To: <20191030223925.GA8185@samba.org>
References: <20191030223925.GA8185@samba.org>
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

On Wed, 2019-10-30 at 15:39 -0700, Christof Schmitt via samba-technical 
wrote:
> Hi,
> 
> while fixing the build problem with the system heimdal libraries, i
> am
> also trying to establish a gitlab test for this build. This requires
> adding the heimdal-multidev package to the Ubuntu images.
> Regenerating
> the images now fails for CentOS7 and CentOS8, which should not
> changed.
> I already fixed one problem for CentOS7 to avoid the conflict between
> nettle and compat-nettle.
> 
> Now CentOS 7 fails with:
> https://gitlab.com/samba-team/devel/samba/-/jobs/337893367
> + docker build -t samba-ci-centos7 --build-arg
> 'SHA1SUM=9dae5d8732853f0025bcf9528e94935f0e7ebada'
> bootstrap/generated-dists/centos7
> Cannot connect to the Docker daemon at tcp://docker:2375. Is the
> docker daemon running?
> ERROR: Job failed: exit code 1

Garming did this on my suggestion:

https://gitlab.com/samba-team/samba/merge_requests/803/diffs?commit_id=a6b38e4ed0f409b88ba9df765951afaab9195047

The issue is that, in order to progress work while the Gitlab.com
runners are busy, we also declare 'shared' on our own runners. 

However we haven't worked out how to do the docker-in-docker thing
there, and probably don't want to (due the security risk).

The alternative is to stop our runners declaring 'shared' and make our
jobs that can run on either just require 'docker'. 

This is probaby the better approach.  It may mean CI for older branches
take longer when gitlab.com is busy, but master is where all the action
is.  For our private CI (for security embargoed stuff) we will still
declare 'shared'.

In the meantime, just try again later, our own runners have a slower
tick cycle to try and loose the race if they can.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






