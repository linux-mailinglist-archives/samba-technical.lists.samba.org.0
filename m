Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA446333CB
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 17:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hll3mxyxrGFaMUeLVO6Xq4dQuG1TboqPGzg9vvLZ0Ew=; b=rwyUiSVi4TTKsYlEV49osQqkse
	mkXD8Qd4NJjM+R2uTOfnKg8Fnp+XribQudQjhEinKt5P9gENqjTV+2rUf82zPZH9N40HwcIaLVm23
	cA5t8jsxXznmG6aktVnzjAqHIMWx2keGLk9/y86rf+RVqKqAefUpfWJRSG+Pp9Ol51B0YUVBoMjuw
	qHlMrPkc6YsglWELSxY27JpULaZ/3hsczYevv7Zm3EEX/jShYRIKTP8T1gCma/kbmrrD+3f5ZC0vK
	zkasFHwL+SNpZOi5V29G9PqQpwVKCgAgYHe+EJ5t9WqsJAD8YtvBT23oO1AktsVQw9QT1HU5PjNon
	cCJHNTrg==;
Received: from localhost ([::1]:38932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXp6h-004u6n-Gs; Mon, 03 Jun 2019 15:42:43 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:46553 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXp6T-004u15-6l
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 15:42:35 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45HfSW6wgCz9s00;
 Tue,  4 Jun 2019 01:42:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1559576542; bh=u+f/SYyRE9okT4rpVoC/hwTpygrtEGT72Lgj2/QcVQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UJ5rm4uU+SJWY4wmHKDUQXrwNS/bAXZrQn7zl9I/2fuJeLUPEfV5jPz4lmRI+idGq
 CMWLflvCDvGn7mBwDiyco/q+HUmO7nsXqWXs8oxmpvSUqhbt1yLvNqrnFMWKcLf6z4
 GduFVtoM9VLViTnK1j8s9JccmOlhO2+HmgMW864dg2nJCisBKAMLCl3IDGQWx3WgzS
 5JIXGx+QgxWzH7Z+JEFHHfbCe4PxcPPgUe+VDu3E8Sc+09CjgRWyr00t0mbxYfuCoW
 QAXVRpOWUOO6q2WvJbfCAWdsy5uwjrHukbunN/Ez1c6omZbhIp5BsylV9h8uOgUYNi
 CfCjX8VGi+7tQ==
Date: Tue, 4 Jun 2019 01:42:10 +1000
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
Message-ID: <20190604014210.030a5e11@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mTNwN+E4=g0B8Djjh1B=Rkiy7kjNJYMM7y-LYQ3zuy1CA@mail.gmail.com>
References: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
 <20190604004059.6b52af7c@martins.ozlabs.org>
 <CAJ+X7mTNwN+E4=g0B8Djjh1B=Rkiy7kjNJYMM7y-LYQ3zuy1CA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 4 Jun 2019 00:47:03 +1000, Amitay Isaacs <amitay@gmail.com>
wrote:

> On Tue, Jun 4, 2019 at 12:42 AM Martin Schwenke via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > On Sun,  2 Jun 2019 23:44:15 -0300, Rafael David Tinoco via
> > samba-technical <samba-technical@lists.samba.org> wrote:
> >  
> > > net.ipv4.tcp_tw_recycle has been removed from Linux 4.12 but, still,
> > > makes sense to check its existence. Unfortunately, current check does
> > > not test for the procfs file existence. This commit fixes the issue.
> > >
> > > Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
> > > ---
> > >  ctdb/config/nfs-linux-kernel-callout | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/ctdb/config/nfs-linux-kernel-callout b/ctdb/config/nfs-linux-kernel-callout
> > > index def69a04649..71d8ecf8074 100755
> > > --- a/ctdb/config/nfs-linux-kernel-callout
> > > +++ b/ctdb/config/nfs-linux-kernel-callout
> > > @@ -281,8 +281,8 @@ nfs_startup ()
> > >      basic_stop "nfs" || true
> > >      basic_start "nfs"
> > >      _f="${PROCFS_PATH}/sys/net/ipv4/tcp_tw_recycle"
> > > -    if [ "$_f" ] ; then
> > > -     echo 1 >"$_f"
> > > +    if [ -f "$_f" ] ; then
> > > +         echo 1 >"$_f"
> > >      fi
> > >  }  
> >
> > I actually prefer this version.  The script already guarantees that
> > PROCFS_PATH is set, so let's not complicate this fix with an
> > unnecessary check.
> >
> > Now that I'm old, I also prefer the explicit if-statement in this
> > version, instead of the && pipeline in the later version.  The more
> > verbose if-statement is easier to read.  :-)
> >
> > Reviewed-by: Martin Schwenke <martin@meltin.net>
> >
> > Can the 2nd reviewer please add:
> >
> > BUG: https://bugzilla.samba.org/show_bug.cgi?id=13984
> >
> > to the commit message before pushing?  We will backport this fix to
> > stable releases...  
> 
> Reviewed-by: Amitay Isaacs <amitay@gmail.com>
> 
> Martin, you can push the right patch with the required bug tag.

Wunderbar!  Pushed to autobuild...

peace & happiness,
martin

