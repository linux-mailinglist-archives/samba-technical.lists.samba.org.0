Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D11030E
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 01:06:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DROWRRzrGQ5xHMaAgIs1UUNRoV3a7jF+Gyyx9SwavMQ=; b=ENQ679uMo1k0oVYngb1+2KYppX
	/ITEdYFUW8xYq02Qhf5XUbc96OrsoediNyh7WE66Y0jcY3w7Z6hSjKORqIxNrvnYj7nJ4Vozv7SZ8
	r4PSIzNqPU5M9grCvV2xfFCIjmFWZwrdR3B5pJXc9p+X5bwgkvFFIIcVj/u8V3QZLCxxteT3+1COS
	5nzCdNgZ2Ca5Jh7OM8r1xYqewsJAk1iEV9ZW1Pq2eAiWxj78TUDeN9wFJiKK+1NEjkPmwYu20JaQB
	eJqYSZLTJdyuIC4VzBNDGyhtmwbuhNzFia1Q2ERrRAgTNaz9EeyWhC4Iw5laanTpGQqH6SGOvBp37
	M/t4qXQQ==;
Received: from localhost ([::1]:34544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLboA-00041C-Ro; Tue, 30 Apr 2019 23:05:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:62008) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLbo6-000415-HV
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 23:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=DROWRRzrGQ5xHMaAgIs1UUNRoV3a7jF+Gyyx9SwavMQ=; b=a78z/cFcC9b7rzK+YlMinPE6gE
 jU2vYIV8nBlLagRRtKg0nB3skzcpdobBJbFtZNOErMMNTSGHAWd+imNKZjSQFTmnMvdqoZHVvlRfz
 Nc+nZmlVAS2OGmAZ2AVWZgWhMxjMIYoqPQzsUl3OouTG+bBUWmSjpgwKFZ0IE9mdx1vE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLbo4-00036B-Sl; Tue, 30 Apr 2019 23:05:01 +0000
Date: Tue, 30 Apr 2019 16:04:55 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
Message-ID: <20190430230454.GA22132@samba.org>
References: <20190429193555.GA28948@samba.org>
 <2134250.fEHozF1qz7@magrathea.fritz.box>
 <20190430145845.6fcfb681@devstation.samdom.example.com>
 <3513637.hkN0grMHb1@magrathea.fritz.box>
 <1556649942.21278.15.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556649942.21278.15.camel@samba.org>
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

On Wed, May 01, 2019 at 06:45:42AM +1200, Andrew Bartlett via samba-technical wrote:
> On Tue, 2019-04-30 at 16:10 +0200, Andreas Schneider via samba-
> technical wrote:
> > On Tuesday, April 30, 2019 3:58:45 PM CEST Rowland Penny wrote:
> > > 
> > > 
> > > Quite right EPEL doesn't have python34-crypto or python34-dns, but
> > > it
> > > does have these:
> > > 
> > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > /x86_64/P
> > > ackages/p/python36-crypto-2.6.1-16.el7.x86_64.rpm
> > > https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7
> > > /x86_64/
> > > Packages/p/python36-dns-1.15.0-8.el7.noarch.rpm
> > I think we are more lucky once RHEL 7.7 is out :-)
> 
> Can we use this:
> https://centos.pkgs.org/7/epel-x86_64/python36-3.6.6-5.el7.x86_64.rpm.html
> 
> It would be very helpful if we could have a python 3.6 baseline.

I have a RHEL7 system and these python 3.6 rpms installed from EPEL:

$ rpm -qa | grep python36
python36-libs-3.6.6-5.el7.x86_64
python36-crypto-2.6.1-16.el7.x86_64
python36-devel-3.6.6-5.el7.x86_64
python36-3.6.6-5.el7.x86_64
python36-dns-1.15.0-8.el7.noarch

That seems sufficient to run the AD testenvs on master. If those can be
added to a CentOS7 image on gitlab, that might be sufficient to run the
tests.

Christof

