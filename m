Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C4978CB1
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2019 15:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CQYgrDKl0hkmmcAKnkq/B+eOdxv8U8/jqocqCMmimPM=; b=kCXxRtJSLOVGXANJyCNuG06aPM
	g75z3JpkiAGVkWYjdghKPkyDbfhQPtqh06xLw2RaSImtv+ccWBEyzWYhNIYtc3IpYebz3Kk5U9act
	+Xtlj5d5BPBbDzttR6+QfUHOckeCzJERd1OiBT73dqsbOsB4XyYTZD8AowMz0jl4byOSX4uJn5ZvW
	k2ixWvVwmISvbKm4H4//tdIRT6dc22HVT5SJD0uqtcCYRUOh2sUZ6x6+RIS4MRhyGr2KMmKa7arUm
	/LeUkXOdsrovHdg94OHcgsyMM33njb/iKsZgvBj1gr0O8tPNq1RZBmsq1sWuERUNkXIrcTBgj0j72
	m3hiN3pA==;
Received: from localhost ([::1]:51880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hs5bb-000kB8-Uv; Mon, 29 Jul 2019 13:22:24 +0000
Received: from mx2.suse.de ([195.135.220.15]:43750 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hs5bW-000kB1-Ju
 for samba-technical@lists.samba.org; Mon, 29 Jul 2019 13:22:21 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89B2BAE84;
 Mon, 29 Jul 2019 13:22:10 +0000 (UTC)
Date: Mon, 29 Jul 2019 15:21:50 +0200
To: Jeff Layton <jlayton@samba.org>
Subject: Re: libcephfs and supplimentary groups
Message-ID: <20190729152150.2b9daa4b@suse.de>
In-Reply-To: <e3088b317f691edffdf4aff719199db608f89506.camel@samba.org>
References: <20190725170749.4c4466e7@suse.de>
 <e3088b317f691edffdf4aff719199db608f89506.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 195.135.220.15 (mx2.suse.de)
 incorrectly presented itself as mx1.suse.de
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@suse.de>
Cc: Samba Technical <samba-technical@lists.samba.org>,
 "dev@ceph.io" <dev@ceph.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 25 Jul 2019 14:34:13 -0400, Jeff Layton wrote:

> On Thu, 2019-07-25 at 17:07 +0200, David Disseldorp wrote:
> > Hi,
> > 
> > Without calling ceph_mount_perms_set(), libcephfs consumers such as
> > Samba can rely upon UserPerm::uid() and UserPerm::gid() to fallback to
> > geteuid() and setegid() respectively for things such as ACL enforcement.

^ that should be "geteuid() and getegid() ..."

> > However, there is no such fallback for supplementary groups, so ACL
> > checks for a user which is only permitted path access via a
> > supplementary group will result in a permission denied error.
> > 
> > Samba ticket: https://bugzilla.samba.org/show_bug.cgi?id=14053
> > 
> > I've written a patch to address this (it currently omits the get_gids()
> > codepath):
> > https://github.com/ddiss/ceph/commit/035a1785ec73d803fead42c7240df01b755a815b
> > 
> > Does this approach make sense, or should Samba go down the
> > ceph_mount_perms_set() route to avoid this bug? The latter
> > would likely be problematic, as user/group details for a mount will
> > remain static.
> >   
> 
> I think that a better approach would be to have samba just call
> ceph_mount_perms_set to set the credentials soon after forking. Is there
> some reason that doesn't work here?

Samba becomes root for some privileged operations where Windows would
permit access. E.g. "acl group control", vfs_acl_xattr, etc.

We should be able to change Samba's vfs_ceph to use the ceph_ll_X
API to handle the user<->root perms switches and add corresponding
geteuid()/getegid() checks in each VFS call, but IMO this is still
something that should be fixed in libcephfs, to compliment the existing
geteuid/getegid() fallback behaviour.

Cheers, David

