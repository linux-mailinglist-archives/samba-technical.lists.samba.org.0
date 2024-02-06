Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C913F84B014
	for <lists+samba-technical@lfdr.de>; Tue,  6 Feb 2024 09:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:to;
	bh=zVAaAYx+uRJrIVM9VYECDgmw/4CaprkfGNuPI6DSTlw=; b=ONfgIWIGRRI3z0lf3ydql8Pq2R
	5RcVmKoapLJiCEIpivgrRvfjCNPfTUebEH2fzJNJ37OD2aTg69aUDJlS4E9avAwDKgNNWwUqA3Cuv
	jkQRsjOxPGn70ctxNnTbBlaRFjqIJRdOIpXpmpab9ho6wKXiQcp9USQ1r/zdm12mhjhJVHLBBuG+n
	/rR5AoAoohwXyAzgGNm1iJZIITHAurN/p2Zz97/jNXLFS1JCKh8LUyO9W+7TqPkZdPVuwoaF4KU5r
	+T6rP+RN+KI65ZiOthoBgqHJlLcp0+NUOvN0c9Zx9fxRECvBEGJaa+ooN2dllGH+0cPUFRJVXXUGs
	3CNVUFSw==;
Received: from ip6-localhost ([::1]:45870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rXGzA-007Zj9-M5; Tue, 06 Feb 2024 08:39:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49861) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rXGz6-007Zj2-17
 for samba-technical@lists.samba.org; Tue, 06 Feb 2024 08:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707208752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVAaAYx+uRJrIVM9VYECDgmw/4CaprkfGNuPI6DSTlw=;
 b=PIsc2qI0gOYOc9gMb65pfBo+TwBWke7nYFE3ALN59Zt9hHJ2kClwhjngb3I/QC8Au5tlqM
 RTDiwNJSDjCdXXSixDzROq5+7C43N/c5/t0S0UaZtZllonzKE8lGItZkn896EImIgkBilK
 edz5T+ExnDdR8NaqaNEDigSYiFtet6k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707208752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVAaAYx+uRJrIVM9VYECDgmw/4CaprkfGNuPI6DSTlw=;
 b=PIsc2qI0gOYOc9gMb65pfBo+TwBWke7nYFE3ALN59Zt9hHJ2kClwhjngb3I/QC8Au5tlqM
 RTDiwNJSDjCdXXSixDzROq5+7C43N/c5/t0S0UaZtZllonzKE8lGItZkn896EImIgkBilK
 edz5T+ExnDdR8NaqaNEDigSYiFtet6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-cq73PueiM7GdY63RPfS8Fg-1; Tue, 06 Feb 2024 03:39:04 -0500
X-MC-Unique: cq73PueiM7GdY63RPfS8Fg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1158383B7E6;
 Tue,  6 Feb 2024 08:39:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61BE3492BF0;
 Tue,  6 Feb 2024 08:39:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <520668.1706191347@warthog.procyon.org.uk>
References: <520668.1706191347@warthog.procyon.org.uk>
Subject: Re: Roadmap for netfslib and local caching (cachefiles)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3114773.1707208741.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Feb 2024 08:39:01 +0000
Message-ID: <3114774.1707208741@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
 Gao Xiang <xiang@kernel.org>, linux-afs@lists.infradead.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Howells <dhowells@redhat.com> wrote:

> Disconnected Operation
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> I'm working towards providing support for disconnected operation, so tha=
t,
> provided you've got your working set pinned in the cache, you can contin=
ue to
> work on your network-provided files when the network goes away and resyn=
c the
> changes later.
> =

> This is going to require a number of things:
> =

>  (1) A user API by which files can be preloaded into the cache and pinne=
d.
> =

>  (2) The ability to track changes in the cache.
> =

>  (3) A way to synchronise changes on reconnection.
> =

>  (4) A way to communicate to the user when there's a conflict with a thi=
rd
>      party change on reconnect.  This might involve communicating via sy=
stemd
>      to the desktop environment to ask the user to indicate how they'd l=
ike
>      conflicts recolved.
> =

>  (5) A way to prompt the user to re-enter their authentication/crypto ke=
ys.
> =

>  (6) A way to ask the user how to handle a process that wants to access =
data
>      we don't have (error/wait) - and how to handle the DE getting stuck=
 in
>      this fashion.

Some further thoughts stemming from a discussion with Willy:

 - Would need to store the pre-disconnection metadata as well as any updat=
ed
   metadata.  When performing conflict resolution, userspace would need to=
 be
   able to access these in addition to the current state (local) and curre=
nt
   state (server).

 - Would need the ability to include extra stats, such as the AFS data
   version, that are used for cache coherency management.

 - Would need to provide an API by which userspace can access both states =
of
   the data, possibly including the original data if we still have it in t=
he
   cache.  That could be a number of ioctls on the target file.

 - Would need a range of resolution options in userspace, not limited to k=
eep
   local, keep remote, but also the option to stash one/both somewhere.  M=
ay
   also need to provide app-specific resolvers - merging git trees for
   example, but also what do you do about sqlite databases, say?

 - There may be bulk changes that the user would want to resolve in bulk,
   perhaps by "everything in the subtree" or pattern matching rules,
   e.g. "disard all .o files" or "take the .o file matching the newest .c =
file
   in the same directory".

 - May need to change how expired keys are handled so that they aren't alr=
eady
   garbage collected, but can continue to be used as a token off which to =
hang
   cached access rights.

David


