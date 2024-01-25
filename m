Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFC783C44A
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 15:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=e12SznbgNVYlJuZvyyzaU+LAE5U/U9H1zetulJ+CfWs=; b=u08TOKLJiq2J+TRcYg/ekgxTI/
	vKDeGLuBLlXTOTKUgnNvbAaLcaiKQ7L7Dzob5Tdi3rYCVKh3qh0WueOLfs9tUtDfpEI92Gm430pIg
	pfyU3i1ef67Eu1lEGXhETKgPuZOuJtos4HCC2OSsoJJXns/l8RRldwlg9LmrV9dFTjgtPFgnBDapi
	kyuRWu5Jh1bBhJ5NgtSm7xZyxzfoqG102K/36zJEXe0DVoafBBiMNVwT2T3O3f8IhYt8bGJSV8B5c
	sFhpYn0WXxUsXL7HeH1RRPn6/uUg//EIF/vO9rYdJPNGImiD8WJxHTpsIiqbJ8v7QJAJvf9bg/hwQ
	kBzWiDpA==;
Received: from ip6-localhost ([::1]:20770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rT0M6-004RL7-TE; Thu, 25 Jan 2024 14:05:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37360) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rT0Lr-004RL0-Jd
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 14:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706191503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=e12SznbgNVYlJuZvyyzaU+LAE5U/U9H1zetulJ+CfWs=;
 b=f21ZAQG6QJAhgr5MHWbnB6iUQXgIGH7lFpWNgib/ZcOl2tYBSH40jq3KaVhA8eAZ6Tt5/A
 hKA15/3aflDIPgxavf8a46B1RN6TjI2QUY9dhwANzVojSeShpFAI3Gm7qxMvciDe2wFUne
 qEshOTCEOckIphkSe92QziU9VlCyyM0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706191503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=e12SznbgNVYlJuZvyyzaU+LAE5U/U9H1zetulJ+CfWs=;
 b=f21ZAQG6QJAhgr5MHWbnB6iUQXgIGH7lFpWNgib/ZcOl2tYBSH40jq3KaVhA8eAZ6Tt5/A
 hKA15/3aflDIPgxavf8a46B1RN6TjI2QUY9dhwANzVojSeShpFAI3Gm7qxMvciDe2wFUne
 qEshOTCEOckIphkSe92QziU9VlCyyM0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-ak9liix9McKY6rZIJ6D-Rw-1; Thu,
 25 Jan 2024 09:03:00 -0500
X-MC-Unique: ak9liix9McKY6rZIJ6D-Rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 831452837815;
 Thu, 25 Jan 2024 14:02:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC13951D5;
 Thu, 25 Jan 2024 14:02:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: Gao Xiang <xiang@kernel.org>
Subject: Roadmap for netfslib and local caching (cachefiles)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <520667.1706191347.1@warthog.procyon.org.uk>
Date: Thu, 25 Jan 2024 14:02:27 +0000
Message-ID: <520668.1706191347@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Eric Sandeen <esandeen@redhat.com>, samba-technical@lists.samba.org,
 v9fs@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Here's a roadmap for the future development of netfslib and local caching
(e.g. cachefiles).

Netfslib
========

[>] Current state:

The netfslib write helpers have gone upstream now and are in v6.8-rc1, with
both the 9p and afs filesystems using them.  This provides larger I/O size
support to 9p and write-streaming and DIO support to afs.

The helpers provide their own version of generic_perform_write() that:

 (1) doesn't use ->write_begin() and ->write_end() at all, completely taking
     over all of of the buffered I/O operations, including writeback.

 (2) can perform write-through caching, setting up one or more write
     operations and adding folios to them as we copy data into the pagecache
     and then starting them as we finish.  This is then used for O_SYNC and
     O_DSYNC and can be used with immediate-write caching modes in, say, cifs.

Filesystems using this then deal with iov_iters and ideally would not deal
pages or folios at all - except incidentally where a wrapper is necessary.


[>] Aims for the next merge window:

Convert cifs to use netfslib.  This is now in Steve French's for-next branch.

Implement content crypto and bounce buffering.  I have patches to do this, but
it would only be used by ceph (see below).

Make libceph and rbd use iov_iters rather than referring to pages and folios
as much as possible.  This is mostly done and rbd works - but there's one bit
in rbd that still needs doing.

Convert ceph to use netfslib.  This is about half done, but there are some
wibbly bits in the ceph RPCs that I'm not sure I fully grasp.  I'm not sure
I'll quite manage this and it might get bumped.

Finally, change netfslib so that it uses ->writepages() to write data to the
cache, even data on clean pages just read from the server.  I have a patch to
do this, but I need to move cifs and ceph over first.  This means that
netfslib, 9p, afs, cifs and ceph will no longer use PG_private_2 (aka
PG_fscache) and Willy can have it back - he just then has to wrest control
from NFS and btrfs.


[>] Aims for future merge windows:

Using a larger chunk size than PAGE_SIZE - for instance 256KiB - but that
might require fiddling with the VM readahead code to avoid read/read races.

Cache AFS directories - there are just files and currently are downloaded and
parsed locally for readdir and lookup.

Cache directories from other filesystems.

Cache inode metadata, xattrs.

Add support for fallocate().

Implement content crypto in other filesystems, such as cifs which has its own
non-fscrypt way of doing this.

Support for data transport compression.

Disconnected operation.

NFS.  NFS at the very least needs to be altered to give up the use of
PG_private_2.


Local Caching
=============

There are a number of things I want to look at with local caching:

[>] Although cachefiles has switched from using bmap to using SEEK_HOLE and
SEEK_DATA, this isn't sufficient as we cannot rely on the backing filesystem
optimising things and introducing both false positives and false negatives.
Cachefiles needs to track the presence/absence of data for itself.

I had a partially-implemented solution that stores a block bitmap in an xattr,
but that only worked up to files of 1G in size (with bits representing 256K
blocks in a 512-byte bitmap).

[>] An alternative cache format might prove more fruitful.  Various AFS
implementations use a 'tagged cache' format with an index file and a bunch of
small files each of which contains a single block (typically 256K in OpenAFS).

This would offer some advantages over the current approach:

 - it can handle entry reuse within the index
 - doesn't require an external culling process
 - doesn't need to truncate/reallocate when invalidating

There are some downsides, including:

 - each block is in a separate file
 - metadata coherency is more tricky - a powercut may require a cache wipe
 - the index key is highly variable in size if used for multiple filesystems

But OpenAFS has been using this for something like 30 years, so it's probably
worth a try.

[>] Need to work out some way to store xattrs, directory entries and inode
metadata efficiently.

[>] Using NVRAM as the cache rather than spinning rust.

[>] Support for disconnected operation to pin desirable data and keep
track of changes.

[>] A user API by which the cache for specific files or volumes can be
flushed.


Disconnected Operation
======================

I'm working towards providing support for disconnected operation, so that,
provided you've got your working set pinned in the cache, you can continue to
work on your network-provided files when the network goes away and resync the
changes later.

This is going to require a number of things:

 (1) A user API by which files can be preloaded into the cache and pinned.

 (2) The ability to track changes in the cache.

 (3) A way to synchronise changes on reconnection.

 (4) A way to communicate to the user when there's a conflict with a third
     party change on reconnect.  This might involve communicating via systemd
     to the desktop environment to ask the user to indicate how they'd like
     conflicts recolved.

 (5) A way to prompt the user to re-enter their authentication/crypto keys.

 (6) A way to ask the user how to handle a process that wants to access data
     we don't have (error/wait) - and how to handle the DE getting stuck in
     this fashion.

David


