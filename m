Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F60EB8D5
	for <lists+samba-technical@lfdr.de>; Thu, 31 Oct 2019 22:19:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fKSsJBCy9/iqDhyWIRN9uFZlgcJ56RbD8cxsEIs3Xdw=; b=P5w3I+fzD8K3J9nsWeqlkgCVwf
	VovZhLykN+Xsw+j0fKHWq/tv11BE/Ewtll8bUaOyX5DfXg48+nyYkFxfZJFPST/x88vW7c1ZPET3q
	9rmaES55Tfk3UHwKRYyHZjmjpnJIXBQMhdzDD/8RzRZm2gd+BWIAyyjRnCBcYSKmwsq8kN73g9vCt
	tdzUSQP5vIzRIQKLAAsOR8VSJ6vinhhjcxMbw5RlxxLELzPXmLmWF6eIqAouzVSruGUDTNclv4rLD
	lb9rcDJj8HJOLDILbWsDCbxsBWaHv9h+4zidE/K90rgcxWyR9nB/oDHMpdcc04z7hBJ3UtHXnqJA7
	cLtRGHhw==;
Received: from localhost ([::1]:50720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iQHpf-0043zR-1l; Thu, 31 Oct 2019 21:18:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iQHpa-0043zK-7S
 for samba-technical@lists.samba.org; Thu, 31 Oct 2019 21:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fKSsJBCy9/iqDhyWIRN9uFZlgcJ56RbD8cxsEIs3Xdw=; b=Fz7QR2xjf3UxzSjpKrDPJpdgT/
 0WDwaA1rcWCInZ25tnGVDFBQOYrmLsEUYpBXAkB9trPKRyrIJnvQjd6hi7tyO0kxPR0tdWCbM/0M4
 1Y3OgnYtYK9/45IxVtj2T4KMGM8B5hJSQU4pB+smCwTUoVG9RpziaEPEhHi9/9rH35/0CiBD1l5WL
 L2e+HJZofApwsLZyvPWJm1NE5W7TSIYqvHVvj+TkIUomPRpB95bgGR2sdySfckVtvA1SEYrNQ2eaY
 fqImttf+WbdtpZ4n3j0aF0CrzV8zfyMaGgLgzOJaoAZKGKeB66s5VVhaYDT/C+oBIHHbn9Qmx12BS
 I+P2BIhbEpeGSsRJhnmFX+7dyS2RjLOYKMmnOWWFjQSGgsPQzJxjwWQD0SFADfBV4OH3EMqJi0Y5D
 +mraRNnCAtOHZC3f7TCk4BNY1OhKB8jbNVzO4qguVam/od13gjfHZaL8Nwynei//Ond/UyPn0MT8e
 /FjqOL/AZSvHq11KIeZ9F0zd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iQHpY-0002u2-5D; Thu, 31 Oct 2019 21:18:08 +0000
Date: Thu, 31 Oct 2019 14:18:04 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Problem regenerating gitlab docker images
Message-ID: <20191031211803.GA538@samba.org>
References: <20191030223925.GA8185@samba.org>
 <138c4d166b885f6ba112f6e74037a1f1c30ea436.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <138c4d166b885f6ba112f6e74037a1f1c30ea436.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 31, 2019 at 12:18:26PM +1300, Andrew Bartlett wrote:
> On Wed, 2019-10-30 at 15:39 -0700, Christof Schmitt via samba-technical 
> wrote:
> > Hi,
> > 
> > while fixing the build problem with the system heimdal libraries, i
> > am
> > also trying to establish a gitlab test for this build. This requires
> > adding the heimdal-multidev package to the Ubuntu images.
> > Regenerating
> > the images now fails for CentOS7 and CentOS8, which should not
> > changed.
> > I already fixed one problem for CentOS7 to avoid the conflict between
> > nettle and compat-nettle.
> > 
> > Now CentOS 7 fails with:
> > https://gitlab.com/samba-team/devel/samba/-/jobs/337893367
> > + docker build -t samba-ci-centos7 --build-arg
> > 'SHA1SUM=9dae5d8732853f0025bcf9528e94935f0e7ebada'
> > bootstrap/generated-dists/centos7
> > Cannot connect to the Docker daemon at tcp://docker:2375. Is the
> > docker daemon running?
> > ERROR: Job failed: exit code 1
> 
> Garming did this on my suggestion:
> 
> https://gitlab.com/samba-team/samba/merge_requests/803/diffs?commit_id=a6b38e4ed0f409b88ba9df765951afaab9195047
> 
> The issue is that, in order to progress work while the Gitlab.com
> runners are busy, we also declare 'shared' on our own runners. 
> 
> However we haven't worked out how to do the docker-in-docker thing
> there, and probably don't want to (due the security risk).
> 
> The alternative is to stop our runners declaring 'shared' and make our
> jobs that can run on either just require 'docker'. 
> 
> This is probaby the better approach.  It may mean CI for older branches
> take longer when gitlab.com is busy, but master is where all the action
> is.  For our private CI (for security embargoed stuff) we will still
> declare 'shared'.
> 
> In the meantime, just try again later, our own runners have a slower
> tick cycle to try and loose the race if they can.

Thank you. Is there some documentation about the different runners to
understand this better?

Retrying helped with the problems connecting to docker. Now i am down to
the CentOS8 issue. It looks like CentOS8 went from glibc
2.28-42.el8.1 to 2.28-42.el8_0.1 and yum does not handle that.

Christof

