Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B10DBE3CF
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 19:52:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DsW0ClUFJiZ0KGdsb6MLak/edhinVoOImQP/9DpVEWA=; b=EyVZUz3H7cL7hpGNjnEkgqUL6i
	7xCWIczmbevrw+oV+BVMOpulxlCKaFLkwjdz8/4bzQmU+OptH1izXraG8BHW5ByNcHuGOmj7ChBXW
	2eoMPdyfo+SWzHrOYZhz7MKUakXkOrvv/b+L4tmxOIhvKN/QGs2ykQtoe2d6kkaKupyKp7TJqzHUr
	tDyy4dbD7JBqlOIXbUJ4WBeMk/saftKAjDQXOiczcOZBebjU9mNoQnKj2eAagYuiK+TxDjEW8fJDi
	75vjsMF/PC+UcbnGTNuw9lNz1neZJESOEomJXXKjJ8LIovtr4j8ZUBgNVe2Glpd2wahfACeOmzk53
	WYdhd+OA==;
Received: from localhost ([::1]:54572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDBRh-008b43-7V; Wed, 25 Sep 2019 17:51:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDBRc-008b3r-AX
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 17:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=DsW0ClUFJiZ0KGdsb6MLak/edhinVoOImQP/9DpVEWA=; b=frjRDailBJAT/AfBiqrgEsPFnA
 h1dLPjq4p9Fbrvko201dO6V3JbYstOpB1/zgctFcMhWlqSjeqJmBRZ/fHCcI/UmAaX85Zzo1M/KWK
 wx5/2wMr/Aum2U6AJXJ9lcNNd3OhSdhywgyefNW4UPIxt3ppXIUm1YWvBgt/WVpiNyn4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iDBRb-0002ZG-0U; Wed, 25 Sep 2019 17:51:15 +0000
Date: Wed, 25 Sep 2019 10:51:10 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <20190925175109.GA9709@samba.org>
References: <20190923193911.GA9762@samba.org>
 <09e4ae20-3d89-bc2f-3997-306387644207@samba.org>
 <20190923234556.GA6724@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923234556.GA6724@samba.org>
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

On Mon, Sep 23, 2019 at 04:45:56PM -0700, Christof Schmitt wrote:
> On Mon, Sep 23, 2019 at 11:43:35PM +0200, Stefan Metzmacher wrote:
> > Hi Christof,
> > 
> > > The behavior of winbindd changed in regards to whether a group with
> > > ID_TYPE_BOTH returns a fake user structure. This surfaced during a test
> > > of creating files from a SMB client and then checking the ownership
> > > directly on the file system.
> > > 
> > > make testenv SELFTEST_TESTENV=ad_member_idmap_rid
> > > is an environment that provides ID_TYPE_BOTH for testing.
> > > 
> > > 4-5-test returns fake passwd information for the group:
> > > 
> > > $ getent passwd "$DOMAIN/Domain Users"
> > > ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> > > users:/bin/false
> > > $ echo $?
> > > 0
> > > 
> > > $ getent passwd 2000513
> > > ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> > > users:/bin/false
> > > $ echo $?
> > > 0
> > > 
> > > $ ls -l testfile
> > > -rw-rw-r--. 1 ADDOMAIN/domain users ADDOMAIN/domain admins 0 Sep 23
> > > 12:24 testfile
> > > 
> > > 
> > > 4-6-test no longer does this:
> > > 
> > > $ getent passwd "$DOMAIN/Domain Users"
> > > $ echo $?
> > > 2
> > > 
> > > $ getent passwd 2000513
> > > $ echo $?
> > > 2
> > > 
> > > $ ls -l testfile
> > > -rw-r--r--. 1 2000513 ADDOMAIN/domain admins 0 Sep 23 12:30 testfile
> > > 
> > > It looks like the behavior was introduced for Samba 4.5 through commit
> > > 394622ef8c916cf361f8596dba4664dc8d6bfc9e
> > >     s3:winbindd: change getpwsid() to return a passwd struct for a group
> > > sid id-mapped with ID_TYPE_BOTH
> > > 
> > > and then changed for Samba 4.6 through the patches around
> > > bce19a6efe11980933531f0349c8f5212419366a
> > >     winbind: Restructure wb_getpwsid
> > > 
> > > What is the intended behavior here? Returning a fake passwd for the
> > > group makes the "ls -l" output nicer as no manual lookup of the uid to
> > > the group is required. On the other hand, creating fake user information
> > > might cause problems elsewhere.
> > > 
> > > What are other's opinions around this? I am planning to add a testcase
> > > to ensure that this does not change again, but i would like to
> > > understand first whether winbindd should behave as in Samba 4.5 or in
> > > the newer releases.
> > 
> > The 4.5 behavior is what we want,
> > see also https://gitlab.com/samba-team/samba/merge_requests/621
> > 
> > We should fix merge that, could you come up with a simple testcase
> > to that we don't regress on this again?
> > 
> > Then we need a bug report for backports.
> 
> Thank you. I will take a look at the merge request and write a testcase.

I updated https://gitlab.com/samba-team/samba/merge_requests/621/ with
my signed-off on the patch, a reference to
https://bugzilla.samba.org/show_bug.cgi?id=14141 for the backport and a
testcase.

Christof

