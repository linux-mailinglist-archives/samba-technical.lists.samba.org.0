Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA62BBC52
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2019 21:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OAzWjHpwu9yIBzF1Z7jmVdwEBQSTJzAP9pelKpMEbEE=; b=tNPC+z4+o1oOLeYYSCFeUh7JJj
	mGCf4/EEQn9Egi6kISK7yj90Fq6TGLteTzPR/PXM+dTe1yQ7CMQTFOjlRUwwLZZRzqxlBOpBrQ/ai
	w3AS7PBcfqfnExPhEGmoQc2J4eXn03WECdGDhjMbAQuWY873ZJ5ONJ44uGAn8LwIdZCN21CSZ9B6J
	wNINVJDndaT9r95tdEIHOTR54CT+/95rWG2Yy+NxAUwVqOFxGG40KSA+dNmEjxJsAsz/0XZqDBY+Y
	L1CP7SckP8qhQGmn7a7kHeTDQh3OXi9kH42yrj9IacJFB6on+i8k5ty6+5ieH4lzOxPK+kIjWy7SU
	VYzw2Jrg==;
Received: from localhost ([::1]:62958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCUB6-0083js-8t; Mon, 23 Sep 2019 19:39:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11818) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCUB2-0083jl-4G
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 19:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=OAzWjHpwu9yIBzF1Z7jmVdwEBQSTJzAP9pelKpMEbEE=; b=PFpjCUmXi1Jt/y+boOvzZi5Oge
 7K2ddTeqhe1mPiDxrnebZVeROKBtETDb/4TA17lv7GIkrQvpDqXZC1POQMerj6Eu3tX/WX1w+D9Jq
 zzV06skCG4rXdGDa0Qv6DVDKBylLA95wdqQOzSPXOL26leGItJDB7kvreRGoBrA2W5o4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iCUB1-0005m6-Bj
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 19:39:15 +0000
Date: Mon, 23 Sep 2019 12:39:11 -0700
To: samba-technical@lists.samba.org
Subject: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <20190923193911.GA9762@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The behavior of winbindd changed in regards to whether a group with
ID_TYPE_BOTH returns a fake user structure. This surfaced during a test
of creating files from a SMB client and then checking the ownership
directly on the file system.

make testenv SELFTEST_TESTENV=ad_member_idmap_rid
is an environment that provides ID_TYPE_BOTH for testing.

4-5-test returns fake passwd information for the group:

$ getent passwd "$DOMAIN/Domain Users"
ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
users:/bin/false
$ echo $?
0

$ getent passwd 2000513
ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
users:/bin/false
$ echo $?
0

$ ls -l testfile
-rw-rw-r--. 1 ADDOMAIN/domain users ADDOMAIN/domain admins 0 Sep 23
12:24 testfile


4-6-test no longer does this:

$ getent passwd "$DOMAIN/Domain Users"
$ echo $?
2

$ getent passwd 2000513
$ echo $?
2

$ ls -l testfile
-rw-r--r--. 1 2000513 ADDOMAIN/domain admins 0 Sep 23 12:30 testfile

It looks like the behavior was introduced for Samba 4.5 through commit
394622ef8c916cf361f8596dba4664dc8d6bfc9e
    s3:winbindd: change getpwsid() to return a passwd struct for a group
sid id-mapped with ID_TYPE_BOTH

and then changed for Samba 4.6 through the patches around
bce19a6efe11980933531f0349c8f5212419366a
    winbind: Restructure wb_getpwsid

What is the intended behavior here? Returning a fake passwd for the
group makes the "ls -l" output nicer as no manual lookup of the uid to
the group is required. On the other hand, creating fake user information
might cause problems elsewhere.

What are other's opinions around this? I am planning to add a testcase
to ensure that this does not change again, but i would like to
understand first whether winbindd should behave as in Samba 4.5 or in
the newer releases.

Christof


