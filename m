Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D5BBF0D
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 01:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=r1XkoxCuTzfdaebpqIj7i+FtiNX/iUeeBTUgdtth3sw=; b=gUXQlSLwHfS71Sw8EHKRkFGVP0
	1Va1/ulQpQ/eK3cmJg0+VWKmAX8uC9Ij3JdjGZGqk2xeEWpLr6yIuisJ6pblRhVt4J6Z5Kms0Y5Jg
	qbpS4Dt8hxkWp8VjCV36ft/zOjo7VWP3Scwo23kmNQA7KoLxFAqiW8QBZEdrGEmNm2mqdwXmEFJ+j
	EdMXd7RvCTUod4PEc5Y8zIxb3YSy7kaRIxhOU3h26LYo5S3F9L0sKKh/9+4V9NID9LAVMdOilAcJY
	uvvPVULpHrSkEsK8juA5RcGgYzsEVBLi3czkWqDmOxndSYtASiPGgguw15qyoYABTYSwyxcZbBAtx
	UVt0ZSgQ==;
Received: from localhost ([::1]:20168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCY1v-0085OF-3t; Mon, 23 Sep 2019 23:46:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36700) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCY1p-0085O8-8W
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 23:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=r1XkoxCuTzfdaebpqIj7i+FtiNX/iUeeBTUgdtth3sw=; b=J5D84fsOH2EIilWBuTMxbv++8D
 Ic7NIOvdhypKhxJLvwYHxLxLC1txmOpVJ041YgNf28nTbQQ/wS1l/9UULweZVvUrkkCQzCDSZ/NGt
 IpQRpV5OteWlSBK9gzJTgcSk4PiQLTpW8c3Abi6EwgMTK2omosw1weflfCA9ebPhrrgs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iCY1o-00088V-6G; Mon, 23 Sep 2019 23:46:00 +0000
Date: Mon, 23 Sep 2019 16:45:57 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <20190923234556.GA6724@samba.org>
References: <20190923193911.GA9762@samba.org>
 <09e4ae20-3d89-bc2f-3997-306387644207@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09e4ae20-3d89-bc2f-3997-306387644207@samba.org>
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

On Mon, Sep 23, 2019 at 11:43:35PM +0200, Stefan Metzmacher wrote:
> Hi Christof,
> 
> > The behavior of winbindd changed in regards to whether a group with
> > ID_TYPE_BOTH returns a fake user structure. This surfaced during a test
> > of creating files from a SMB client and then checking the ownership
> > directly on the file system.
> > 
> > make testenv SELFTEST_TESTENV=ad_member_idmap_rid
> > is an environment that provides ID_TYPE_BOTH for testing.
> > 
> > 4-5-test returns fake passwd information for the group:
> > 
> > $ getent passwd "$DOMAIN/Domain Users"
> > ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> > users:/bin/false
> > $ echo $?
> > 0
> > 
> > $ getent passwd 2000513
> > ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> > users:/bin/false
> > $ echo $?
> > 0
> > 
> > $ ls -l testfile
> > -rw-rw-r--. 1 ADDOMAIN/domain users ADDOMAIN/domain admins 0 Sep 23
> > 12:24 testfile
> > 
> > 
> > 4-6-test no longer does this:
> > 
> > $ getent passwd "$DOMAIN/Domain Users"
> > $ echo $?
> > 2
> > 
> > $ getent passwd 2000513
> > $ echo $?
> > 2
> > 
> > $ ls -l testfile
> > -rw-r--r--. 1 2000513 ADDOMAIN/domain admins 0 Sep 23 12:30 testfile
> > 
> > It looks like the behavior was introduced for Samba 4.5 through commit
> > 394622ef8c916cf361f8596dba4664dc8d6bfc9e
> >     s3:winbindd: change getpwsid() to return a passwd struct for a group
> > sid id-mapped with ID_TYPE_BOTH
> > 
> > and then changed for Samba 4.6 through the patches around
> > bce19a6efe11980933531f0349c8f5212419366a
> >     winbind: Restructure wb_getpwsid
> > 
> > What is the intended behavior here? Returning a fake passwd for the
> > group makes the "ls -l" output nicer as no manual lookup of the uid to
> > the group is required. On the other hand, creating fake user information
> > might cause problems elsewhere.
> > 
> > What are other's opinions around this? I am planning to add a testcase
> > to ensure that this does not change again, but i would like to
> > understand first whether winbindd should behave as in Samba 4.5 or in
> > the newer releases.
> 
> The 4.5 behavior is what we want,
> see also https://gitlab.com/samba-team/samba/merge_requests/621
> 
> We should fix merge that, could you come up with a simple testcase
> to that we don't regress on this again?
> 
> Then we need a bug report for backports.

Thank you. I will take a look at the merge request and write a testcase.

Christof

