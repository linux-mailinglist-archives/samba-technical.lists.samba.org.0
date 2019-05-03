Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E613C13639
	for <lists+samba-technical@lfdr.de>; Sat,  4 May 2019 01:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=u31jIcVkq1YfvPj1JJudpUa4wzt87zrGm/Qc8bu8grU=; b=O5DPHW2fmAds1irMP7/rQs4C6p
	yezOrcRq6ES0R+kNieMyc6DByAEJkqZ4w8zeUdv7d0S/tdVPLFP9S56bR/uM93ylWx2QYd7BQ52ng
	1sSF8NaoHtxqtUrwmIozJ3TmUF6A1cnZlRV0MXv2hO5FSjE6shtJh2yRJI8QE7SZeH1ENHLh/3juG
	dQIjkDh5nWN74uFuhyCZVkbX3Pc1rQqvc3Afga7Kw0CXEE4CZIfeC/TY9a+b/HXO09a1HFcWh53G1
	h11asv8BjFpRtpxVyMVO0zHnw/Svlw55fqJ7Ors6U2kct5ZPZvq0zwKTJtAalKuAisYeQnWtPJRzk
	m2DdMEGg==;
Received: from localhost ([::1]:35888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMhjl-002KIU-D1; Fri, 03 May 2019 23:37:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:25894) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMhjh-002KIN-MC
 for samba-technical@lists.samba.org; Fri, 03 May 2019 23:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=u31jIcVkq1YfvPj1JJudpUa4wzt87zrGm/Qc8bu8grU=; b=WSY2oy3jl+59HKb41BH+pJ9OJU
 FgGl4h2qGctpLmSU0oh/zC2611ifLvKU0eqCYS1U556B0onXQYhXfsAL5GW9TUmFeW6VDXIELQME7
 0UC9X2rqS/ALrlTcNFb/H4SFpFH3nTkbpwHWzCstH+Im/1TRjZvmYHD1JNcYyGM9EWZA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMhjg-0004Fu-6w; Fri, 03 May 2019 23:37:00 +0000
Date: Fri, 3 May 2019 16:36:54 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
Message-ID: <20190503233653.GA12691@samba.org>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
 <1556649942.21278.15.camel@samba.org>
 <20190430230454.GA22132@samba.org>
 <1556674596.25595.100.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556674596.25595.100.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 01, 2019 at 01:36:36PM +1200, Andrew Bartlett wrote:
> On Tue, 2019-04-30 at 16:04 -0700, Christof Schmitt wrote:
> > On Wed, May 01, 2019 at 06:45:42AM +1200, Andrew Bartlett via samba-technical wrote:
> > > On Tue, 2019-04-30 at 16:10 +0200, Andreas Schneider via samba-
> > > technical wrote:
> > > > On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
> > > > > 
> > > > >  
> > > > > Quite right EPEL doesn't have python34-crypto or python34-dns, but
> > > > > it
> > > > > does have these:
> > > > > 
> > > > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > > > /x86_64/P
> > > > > ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
> > > > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > > > /x86_64/
> > > > > Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm
> > > > 
> > > > I think we are more lucky once RHEL 7.7 is out :-)
> > > 
> > > Can we use this:
> > > https://centos.pkgs.org/7/epel-x86_64/python36-3.6.6-5.el7.x86_64.rpm.html
> > > 
> > > It would be very helpful if we could have a python 3.6 baseline.
> > 
> > I have a RHEL7 system and these python 3.6 rpms installed from EPEL:
> > 
> > $ rpm -qa | grep python36
> > python36-libs-3.6.6-5.el7.x86_64
> > python36-crypto-2.6.1-16.el7.x86_64
> > python36-devel-3.6.6-5.el7.x86_64
> > python36-3.6.6-5.el7.x86_64
> > python36-dns-1.15.0-8.el7.noarch
> > 
> > That seems sufficient to run the AD testenvs on master. If those can be
> > added to a CentOS7 image on gitlab, that might be sufficient to run the
> > tests.
> 
> So I guess it should be mostly a matter of adding EPEL repo during
> bootstrap.  Currently it runs the same thing on all RPM based systems,
> but this can be changed.
> 
> See bootstrap/config.py

I tried to fixup the patches from Andreas to use Python 3.6 in CentOS7
and force the new image build:
https://gitlab.com/samba-team/devel/samba/pipelines/59674602

The centos7 image build seems to succeed, but then the centos7-samba-o3
build does not start and only has:

ERROR: Preparation failed: invalid reference format (executor_docker.go:168:0s)
Will be retried in 3s ...
ERROR: Job failed (system failure): invalid reference format (executor_docker.go:168:0s)

Does that mean there is something wrong with the image or the tag?

Christof

