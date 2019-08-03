Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEE6805B1
	for <lists+samba-technical@lfdr.de>; Sat,  3 Aug 2019 12:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0canQ8sSK5SfPyGFJwII9PQX0yXhUxCO3xp3WVOP300=; b=jkSRvoRTHFsz0eMA82y1TYrbi9
	Vk6wBrcPx/VNMK5BTlzOMODPkM0DSCOjuzwwSVSyCxUbXZLTT+OntiMtJe9J9AlivwJ9gceLirF4/
	k0iS/mYIwL9xTxdIE0jb3MBeRT0mlZsf+EF4q+I0mVPqq4rki2Z6OEeWZ/3xhfTAqJ/MDNFyZunCj
	vXYAdBwJJDD5ZPdlG8JkdSgndyG8m0+JlFFO+MnbtWuYREhy+WoxdAbI3Kiuc2iKUtftSJAxU0vMZ
	W+CjDr7kCHD1jfZBcL0TIaixjHSpTcBJAmEAYOqdx+UpCnw8AyvzUau7DI8VoFC+3/y59nCmQMVgp
	ZmMUKy7g==;
Received: from localhost ([::1]:56834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htr9N-003dz0-Pi; Sat, 03 Aug 2019 10:20:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htr9I-003dyJ-Q2
 for samba-technical@lists.samba.org; Sat, 03 Aug 2019 10:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=0canQ8sSK5SfPyGFJwII9PQX0yXhUxCO3xp3WVOP300=; b=hSTeNr1tUd4g3RLIs1vBwiwC6r
 1lt6OqhRisEVQWsxp7/CxUe1g19ojPUkSqgdar0kiiahFXsH5m/C93GCL1KyyXdaBv7fQsiFq+B0t
 MNFcIGXaYeAJZoFP4pqZmWwy9enHx61nHNk3c6YDYHGovA8/+4tO4SmaM/asWK81PFoQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htr9F-0002th-DV; Sat, 03 Aug 2019 10:20:25 +0000
Message-ID: <b99b1b00868c25e6a59b5bd41039e728b68f848d.camel@samba.org>
Subject: Re: libcephfs and supplimentary groups
To: David Disseldorp <ddiss@suse.de>
Date: Sat, 03 Aug 2019 06:20:15 -0400
In-Reply-To: <20190729152150.2b9daa4b@suse.de>
References: <20190725170749.4c4466e7@suse.de>
 <e3088b317f691edffdf4aff719199db608f89506.camel@samba.org>
 <20190729152150.2b9daa4b@suse.de>
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 "dev@ceph.io" <dev@ceph.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-07-29 at 15:21 +0200, David Disseldorp wrote:
> On Thu, 25 Jul 2019 14:34:13 -0400, Jeff Layton wrote:
> 
> > On Thu, 2019-07-25 at 17:07 +0200, David Disseldorp wrote:
> > > Hi,
> > > 
> > > Without calling ceph_mount_perms_set(), libcephfs consumers such as
> > > Samba can rely upon UserPerm::uid() and UserPerm::gid() to fallback to
> > > geteuid() and setegid() respectively for things such as ACL enforcement.
> 
> ^ that should be "geteuid() and getegid() ..."
> 
> > > However, there is no such fallback for supplementary groups, so ACL
> > > checks for a user which is only permitted path access via a
> > > supplementary group will result in a permission denied error.
> > > 
> > > Samba ticket: https://bugzilla.samba.org/show_bug.cgi?id=14053
> > > 
> > > I've written a patch to address this (it currently omits the get_gids()
> > > codepath):
> > > https://github.com/ddiss/ceph/commit/035a1785ec73d803fead42c7240df01b755a815b
> > > 
> > > Does this approach make sense, or should Samba go down the
> > > ceph_mount_perms_set() route to avoid this bug? The latter
> > > would likely be problematic, as user/group details for a mount will
> > > remain static.
> > >   
> > 
> > I think that a better approach would be to have samba just call
> > ceph_mount_perms_set to set the credentials soon after forking. Is there
> > some reason that doesn't work here?
> 
> Samba becomes root for some privileged operations where Windows would
> permit access. E.g. "acl group control", vfs_acl_xattr, etc.
> 
> We should be able to change Samba's vfs_ceph to use the ceph_ll_X
> API to handle the user<->root perms switches and add corresponding
> geteuid()/getegid() checks in each VFS call, but IMO this is still
> something that should be fixed in libcephfs, to compliment the existing
> geteuid/getegid() fallback behaviour.
> 

I'm not a fan of that fallback behavior, tbqh.

I think it's something that could be subject to race conditions,
especially in threaded programs. I know samba is mostly single-threaded, 
but it does occasionally spawn threads and change their credentials to
handle certain calls. Trying to keep the library's creds in sync with
the process/thread creds seems fraught with peril.

I think it'd be best if programs explicitly set what credentials they
want to use by default, and override those creds at appropriate points
as needed.

The thing with the ceph_ll_* calls is that most of them require Inode
pointers and such. They were more designed for an NFS server usecase
where you're dealing with filehandles. You might be able to get away
with using those in a few cases, but I think samba will still want to
use the "normal" ceph_* calls since they are mostly path based.

We could look at adding UserPerm arguments to some of those calls, but
that may mean revving the client library version...which can be done,
but it's not a trivial amount of work.
-- 
Jeff Layton <jlayton@samba.org>


