Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804278612D
	for <lists+samba-technical@lfdr.de>; Wed, 23 Aug 2023 22:08:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9dgLhjBJT4J3cfDvzJO+6KdYiY1UYqQ4K/vt2lX1sww=; b=qb+G1xPKn7Vfe4LKA+SR9ZWILk
	EAheXdJIKzFd+OjEsDeUFlfNp52+xrQQPnNK1zadjanatkMeQ71W4xPw+C2eqZBP12LEbZ5NDFnYa
	NbDAfdWAiO+xt405PJsZu+uwtkxdayGpYcRRluy2Lpmljkj0WVBAWlESC9pweEU84cSwYA3ykYALa
	pX4YWOfv7Gq9eyj7OinlCVobjerKecZ5A0UKvVsFFAMu3EY3eXrx9ac3bjz2gsEyNQR8GzM8tMxYo
	Gn/Hj7UK7iS8ay75Dj8PMxrs9k2+PrlHN0/k4+LTpErZMlSzBI+sg55od+RgFrk//4mIrk8Oq5svQ
	vOLtcWKA==;
Received: from ip6-localhost ([::1]:61844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYu8X-00EBhp-Fl; Wed, 23 Aug 2023 20:07:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYu8Q-00EBhf-C3
 for samba-technical@lists.samba.org; Wed, 23 Aug 2023 20:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=9dgLhjBJT4J3cfDvzJO+6KdYiY1UYqQ4K/vt2lX1sww=; b=Ec/8r0UmiwOOkmt/oZaKlYZgiB
 CH+5F6wlih0L6IyRfxO2kGxRTH7xEXqCyQvAdujRqQY+S9kMqMgGwcZ/kttfqZ3wGtCueDyO6mkt+
 Y8E4/fB55WRdrgcNYtWWl1N/WIhBQ0HQkxi8Wd4lFfDRtk8DA7HH4YNcoEGUR5w/ie1B7YJ76ED80
 XxTQWM9RyhgpCUr0FJUwfr6cpw9EViKng3ohrFf1HTKRcM7jDBOze7DBkbGMvvMZ1Sy6WuBKFqYAk
 RL0s6wDNHEhge7dVcjAYdyq4iA690H3KhBgWYZbgLAgh47UM7Y1qxFtoHNM7ZaDyo42SGFohQrst4
 s5Qi4357y5xVLCCSEmP3uOmsXBKUeOKyHGZvnn6G2alfg6YIAQRtjDI/R4s//y5HBc9tSfvmzj4FG
 ld4x9Mdy+ekZUPNyFSRUQNJ9+N6h/bLq5SJ1o3lJbKhytDrpuoSxTtljfgf8YuyRcSwBIzO154lsL
 b/a9SJsHeqJcdyqaIn00KviN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qYu8N-009eQd-1p; Wed, 23 Aug 2023 20:07:20 +0000
Message-ID: <708bf1c53d7086c78f52747b2b85e7dec3451bd4.camel@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Christof Schmitt <cs@samba.org>
Date: Thu, 24 Aug 2023 08:07:14 +1200
In-Reply-To: <ZOZYVWXwm8yL4z4V@samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <ZOZYVWXwm8yL4z4V@samba.org>
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2023-08-23 at 12:04 -0700, Christof Schmitt wrote:
> On Fri, Aug 18, 2023 at 12:08:00PM +1200, Andrew Bartlett via samba-
> technical wrote:
> > On Fri, 2023-08-18 at 11:52 +1200, Douglas Bagnall wrote:
> > > On 18/08/23 11:20, Andrew Bartlett via samba-technical wrote:
> > > > We need to reduce our CI time, and one way to do that is to
> > > > reuseobjects as much as possible, creating read-only objects
> > > > once
> > > > per class,not per test.
> > > > This is much cleaner if with the addCleanup() and
> > > > addClassCleanup()methods, so I would like to be able to do
> > > > that.
> > > > To do that we need Python 3.8.  The primary blocker for this is
> > > > theCentOS 7 build which uses Python 3.6 from EPEL, and a newer
> > > > Python isnot in that repo.
> > > 
> > > I had a look at the Python 3.8 git history for Lib/unittest to
> > > see if
> > > it would be simple to backport/recreate the ClassCleanup code
> > > into
> > > our TestCase wrappers (like we used to do for various assert
> > > methods), and the answer is NO. Thankfully.
> > > I have no opinions about Centos 7, but I do agree that the
> > > supported
> > > Python versions need to be exactly determined by CI.
> > > Douglas
> > 
> > I would note that times when we didn't line up the CI version and
> > Python 'supported' version, it kept breaking. 
> > I note that RHEL7 ends 'maintenance' in June 2024, just after the
> > 4.20
> > release March 2024
> > https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-almost-here
> > 
> > Those dates I think give good cause to drop CentOS 7, but other
> > views
> > still welcome.
> 
> Maybe based on the comments in this thread, dropping CentOS 7 and
> requiring a newer Python version could be takes as two separate
> steps?
> Whoever is running something based on CentOS 7 might not be upgrading
> to
> the latest Samba?
> 
> And what are the Python dependencies? That obviously affects ADDC and
> testcases, but maybe not the file server and AD member parts?

I would rather leave this until we can move for a more significant
reason.  

As an example, I and others put a lot of effort into getting off Ubuntu
18.04 because we could remove a pile of in-tree cryptography, and a lot
of #ifdefs around a GnuTLS feature.  That was a useful gain. 

Getting Python 3.8 features would have been handy, but without that,
and given the work folks have done to get us a GnuTLS backport, the
reasons to drop CentOS become less compelling (essentially just the CI
cost). 

I note that SerNet is still building Samba for CentOS 7: 
https://samba.plus/centos

If we break the AD DC testcases, and worse still the AD DC
provisioning, we also break the fileserver tests, as most of those need
the AD DC operating. 

I'll close off the MR.  It was worth a try.

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


