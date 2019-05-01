Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD5103B6
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 03:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Zf4pHG6MnFu6Nqz+EkPRLk1HfFyk7darOJMJ6ZB/IEI=; b=3SSKzJ0z/YyC1tSJhLHXhct4XT
	IWPcW/HnPotjELU/JUWZIxpGGjg4Gau+oXwv6Ha4W+7rZXWxYdJ7xwP7WbMNFvP2WdYyG2Xwmb0xc
	JrWX9LLspbSKoBnTV+YOqJ8mxdYh/emAVLr8NuU+tZ3nIKyzmmAhlcR0r/zdfACEuTnKwPzdTIIXH
	V9o8k1IKyaubM8Wn0tcuLki39VW3fFhUBd5TsOuGWbGpEp/lDe6/fIlaPw0La47fKXJSX4I25OIrF
	Rgot/7GZOVdTfcQNEQraXq7jbJYyo1KnIbtW+T36wH5XcBLX0vLo2QCFgzr+L9xC7n4J3X0XCRhuz
	HqzIQSUA==;
Received: from localhost ([::1]:37746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLeBC-001kiZ-Pv; Wed, 01 May 2019 01:37:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:37006) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLeAt-001kiS-JR
 for samba-technical@lists.samba.org; Wed, 01 May 2019 01:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=Zf4pHG6MnFu6Nqz+EkPRLk1HfFyk7darOJMJ6ZB/IEI=; b=l59V7YpXl5FLBHpHHjrN6zFhV1
 ctWPmuYDNr7kW1wZ1U2piTcNeJuu0W5g1rOuHeo/WRkCVp55VA2CwPn3GO1maRUJhiZmBogLORpAR
 qC/dDg7QE0zbezhwC/+6tDJQc499YVq7coyb4l62kLhh+Wjy/texk41WoglVJtsTY3HY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLeAq-0000qn-NJ; Wed, 01 May 2019 01:36:41 +0000
Message-ID: <1556674596.25595.100.camel@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Christof Schmitt <cs@samba.org>
Date: Wed, 01 May 2019 13:36:36 +1200
In-Reply-To: <20190430230454.GA22132@samba.org>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
 <1556649942.21278.15.camel@samba.org> <20190430230454.GA22132@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 16:04 -0700, Christof Schmitt wrote:
> On Wed, May 01, 2019 at 06:45:42AM +1200, Andrew Bartlett via samba-technical wrote:
> > On Tue, 2019-04-30 at 16:10 +0200, Andreas Schneider via samba-
> > technical wrote:
> > > On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
> > > > 
> > > >  
> > > > Quite right EPEL doesn't have python34-crypto or python34-dns, but
> > > > it
> > > > does have these:
> > > > 
> > > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > > /x86_64/P
> > > > ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
> > > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > > /x86_64/
> > > > Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm
> > > 
> > > I think we are more lucky once RHEL 7.7 is out :-)
> > 
> > Can we use this:
> > https://centos.pkgs.org/7/epel-x86_64/python36-3.6.6-5.el7.x86_64.rpm.html
> > 
> > It would be very helpful if we could have a python 3.6 baseline.
> 
> I have a RHEL7 system and these python 3.6 rpms installed from EPEL:
> 
> $ rpm -qa | grep python36
> python36-libs-3.6.6-5.el7.x86_64
> python36-crypto-2.6.1-16.el7.x86_64
> python36-devel-3.6.6-5.el7.x86_64
> python36-3.6.6-5.el7.x86_64
> python36-dns-1.15.0-8.el7.noarch
> 
> That seems sufficient to run the AD testenvs on master. If those can be
> added to a CentOS7 image on gitlab, that might be sufficient to run the
> tests.

So I guess it should be mostly a matter of adding EPEL repo during
bootstrap.  Currently it runs the same thing on all RPM based systems,
but this can be changed.

See bootstrap/config.py

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





