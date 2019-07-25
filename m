Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E948275701
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 20:34:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=KYvE03E0fL0ddkdTxX6OgsI7zrrbUeRxEbQvrSmos3I=; b=yHgpoByw0jEFazw0oET6wV691v
	Y2I4ybabSKGtnPiLR5aL/CvFoXBdMsZO0o7R7hNnN6C1MNnnYzQeXsHzCk5ynbhZhSHMUq7tr3zY4
	0QibPlqIluoWi6Ypgl5qhhLprQ6sEqBthSyPEW2fr7VKWY9K7Q5Cc/vlB6PEwUQBg7fRmQydHu38u
	vXRcVQ61KdBcNnhorxs/D9b1acbXX0V7rdVkeoGXfZ78mFkNLwtT0GKAU/kBflyBCQT1fGgSMtOfq
	KD181MrRT2u5nOsVDD6hswUTJaEjW2X2sP+0vdXVdh3pddZaK2Vbxp9ntRTZTblelYMzEJt8lALwy
	hc6u5r8A==;
Received: from localhost ([::1]:64786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqiZQ-000Jq7-Fq; Thu, 25 Jul 2019 18:34:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqiZM-000Jq0-2e
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 18:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=KYvE03E0fL0ddkdTxX6OgsI7zrrbUeRxEbQvrSmos3I=; b=SGCCfPe3//EZAm3OgEryfrG11f
 ViTpTfa+LG8jrS32IIbFzpCzli4jvp2t4iU+tIudSzV0kAEqpzoeilIxlQYVkuqqvcnHemM4CYQb1
 NLp4fNgDCycxkmN9sI0AgjPBSd6jOTF+G8Hn5n8JwWyXt6an7AStGdaCA92BwY/RS8wk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqiZL-0002AW-EP; Thu, 25 Jul 2019 18:34:23 +0000
Message-ID: <e3088b317f691edffdf4aff719199db608f89506.camel@samba.org>
Subject: Re: libcephfs and supplimentary groups
To: David Disseldorp <ddiss@suse.de>, "dev@ceph.io" <dev@ceph.io>
Date: Thu, 25 Jul 2019 14:34:13 -0400
In-Reply-To: <20190725170749.4c4466e7@suse.de>
References: <20190725170749.4c4466e7@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
From: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Layton <jlayton@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-07-25 at 17:07 +0200, David Disseldorp wrote:
> Hi,
> 
> Without calling ceph_mount_perms_set(), libcephfs consumers such as
> Samba can rely upon UserPerm::uid() and UserPerm::gid() to fallback to
> geteuid() and setegid() respectively for things such as ACL enforcement.
> However, there is no such fallback for supplementary groups, so ACL
> checks for a user which is only permitted path access via a
> supplementary group will result in a permission denied error.
> 
> Samba ticket: https://bugzilla.samba.org/show_bug.cgi?id=14053
> 
> I've written a patch to address this (it currently omits the get_gids()
> codepath):
> https://github.com/ddiss/ceph/commit/035a1785ec73d803fead42c7240df01b755a815b
> 
> Does this approach make sense, or should Samba go down the
> ceph_mount_perms_set() route to avoid this bug? The latter
> would likely be problematic, as user/group details for a mount will
> remain static.
> 

I think that a better approach would be to have samba just call
ceph_mount_perms_set to set the credentials soon after forking. Is there
some reason that doesn't work here?
--
Jeff Layton <jlayton@samba.org>


