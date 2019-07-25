Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C075287
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 17:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hhPL4ZIeBrx6epDzSR+CLXm6QH1UJX9UEMIKX64dLVQ=; b=gleUBN72bjTc2d3bmE6X0UFUA/
	icLKTvq3LE/SnAdIgkeeZLLaEJVp3EoZ6YVeMArMGfQITh/55bKHa4Ss9WnalNMa5zoCBpv0BDSC1
	OvwiZ1CVZR9ABCnjzs7t9BQpBIBHu81cYa8YOEKDp4EySsAKMIdiWQ/NFVhtVHUluLAe/bVQupHSA
	8AvSBMRvBMjb0BL5M8/QD5Y2UUIOceKtEoTDqQDATsvykBN62s5b4yLy1QRQxfhSZP7zyvQ3nMoB0
	8xKpDLZfS2Xb//+0TTfUfE8siLZInsuGOp8bVDOCzVXZ2hEeRDGHSXhUPshNoj4dv7p1GLLXTliIM
	H9UTfmXQ==;
Received: from localhost ([::1]:32446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqfb6-000FKD-6m; Thu, 25 Jul 2019 15:24:00 +0000
Received: from mx2.suse.de ([195.135.220.15]:33624 helo=mx1.suse.de) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hqfb1-000FJs-Dp
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 15:23:57 +0000
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62FE2AF00;
 Thu, 25 Jul 2019 15:09:18 +0000 (UTC)
Date: Thu, 25 Jul 2019 17:07:49 +0200
To: "dev@ceph.io" <dev@ceph.io>
Subject: libcephfs and supplimentary groups
Message-ID: <20190725170749.4c4466e7@suse.de>
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
Cc: Jeff Layton <jlayton@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Without calling ceph_mount_perms_set(), libcephfs consumers such as
Samba can rely upon UserPerm::uid() and UserPerm::gid() to fallback to
geteuid() and setegid() respectively for things such as ACL enforcement.
However, there is no such fallback for supplementary groups, so ACL
checks for a user which is only permitted path access via a
supplementary group will result in a permission denied error.

Samba ticket: https://bugzilla.samba.org/show_bug.cgi?id=14053

I've written a patch to address this (it currently omits the get_gids()
codepath):
https://github.com/ddiss/ceph/commit/035a1785ec73d803fead42c7240df01b755a815b

Does this approach make sense, or should Samba go down the
ceph_mount_perms_set() route to avoid this bug? The latter
would likely be problematic, as user/group details for a mount will
remain static.

Cheers, David

