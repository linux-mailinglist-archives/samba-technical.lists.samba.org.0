Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573D36D5F4
	for <lists+samba-technical@lfdr.de>; Wed, 28 Apr 2021 12:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MvWIW8B3RDj4KafIyBF0dTjYtcJnezih/LAd7rW376E=; b=k7hn5J+7zH/8jzabQcsOnP6S3N
	Zoqa3d/5P4l4s59Imw2sFIQqFv/F6hHaMVbMdsww+ETDWYGe0by+7uPx4O7BuuHv04lgtA13aYTYn
	ZhSC+VUm7AScdjdm8NWPsMfFM1b7HQyArpjb0UaKKb24eZasTEVBrskieOZKywTLatePG3QzQQHeX
	ueFGSJdrMXXi7qO4R/d00qevg8l12DoBIdlxo3zXOAYLlfZUffcV3HhQYmHDUpZcuyzMEM6eQFtMq
	HjkNiiOvTmffVxHNN8lZTV0UQCe5bFwGgXJ6l+mIb0+En9CWyoGfokvnbeY9zWpYxVO8P2SRtDRDs
	S+FbHl4A==;
Received: from ip6-localhost ([::1]:28256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbhlx-00Cqya-BI; Wed, 28 Apr 2021 10:50:25 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:51837 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbhlq-00CqyS-OA
 for samba-technical@lists.samba.org; Wed, 28 Apr 2021 10:50:21 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FVb4g4Vfdz9sWC;
 Wed, 28 Apr 2021 20:50:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1619607011; bh=uL25w1tp6bHOjduSzXnRsNyc+ESbJqrwWXCxTXDRtbE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e5zwzZ3LyYgyIbY1v/AToLqwP7n7aL/p1ba698RvPZo5sd0+WQAnuJNJvVLySPaBT
 NvmU8hpqHB5hLnHF58Y2APCk8/DsqWcogoV9t6vOuy59Pn7KzbeSyP9/JdQcRa/xXv
 OwMmSr8v9QD066u44nSinxtLWFNyGVIlRs51m9FTIAiBFeJwmHCsAy6xqcyiAKucdA
 6F0aJJo8LDuj+AFGRVB0hPLRjYjXmcAkqENv5a0v1YySIbQmcq4az9yFhLqLSSsEio
 R26U+q3WnvrfvPsZ2CSKypS8XlFxhpzCJ1FLjxqtB9eI75TiisAlvdMr2H+3/AfXdt
 iLvRiNDYZYjaQ==
Date: Wed, 28 Apr 2021 20:50:09 +1000
To: "L.P.H. van Belle" <belle@bazuin.nl>
Subject: Re: ctdb/utils/etcd/ctdb_etcd_lock python => python3
Message-ID: <20210428205009.6670d5ca@martins.ozlabs.org>
In-Reply-To: <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
References: <vmime.60816792.20dc.4140e8fec807bb2@ms249-lin-003.rotterdam.bazuin.nl>
 <vmime.6082be4c.4114.8306c142307950c@ms249-lin-003.rotterdam.bazuin.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: "samba-technical@lists.samba.org " <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Louis,

On Fri, 23 Apr 2021 14:32:12 +0200, L.P.H. van Belle <belle@bazuin.nl>
wrote:

> > How exactly does the build fail?  

> Well, i use cowbuild/pbuilder in Debian 10 and in the end lintian
> checks the packages and errors with.
> 
> E: ctdb: python-script-but-no-python-dep usr/lib/x86_64-linux-gnu/ctdb/ctdb_etcd_lock #!python3 
> Even after i added in debian/control
> ${python3:Depends} for CTDB package

OK, Debian build fails.  Now I understand...  :-)

> > > I dont know if its really needed but all python references are used
> > > with /usr/bin/env python3. 
> > > 
> > > Just to besure im not breaking something in ctdb here. 
> > > Can someone confirm this? 
> > > 
> > > My fix.
> > > 
> > > --- a/ctdb/utils/etcd/ctdb_etcd_lock
> > > +++ b/ctdb/utils/etcd/ctdb_etcd_lock
> > > @@ -1,4 +1,4 @@
> > > -#!/usr/bin/python
> > > +#!/usr/bin/env python3  
> > 
> > I'd like to be able to give a better answer but I'm not entirely sure
> > that the script works with python3 without any other changes. 
> >  It looks
> > like it should but I don't have a trivial way of testing it 
> > (or time to setup a test environment).
> > 
> > Given that /usr/bin/python isn't supported anymore, we might as well
> > change it as above see what bug reports get generated.
> > 
> > If you're keen to improve the script then you could try to clean it up
> > and get rid of warnings from pylint and flake8.  getting rid of the
> > obvious whitespace issues might make any python3 issues more obvious.
> > Perhaps yapf3 would be useful?  
> 
> I really wished i had these skills todo that, i would then.. 
> :-( 

Let's just make the obvious change that you suggested.   If we only
support Python 3 then we can't leave this script at Python 2.  If it
breaks then someone can report a bug and hopefully send a patch.

Can you post a git version of the patch with your Signed-off-by: line or
should I do that and just push it with my Reviewed-by:?

Does the fix need to be backported to released versions or is master
enough?

We don't have any tests for that script and I don't have time to write
one - I'm guessing that to limit the dependencies we'd need to fake up
a simple etcd or something... seems like a lot of work.

I've done some hacking using autopep8 (rather than yapf3) and then
fixing a bunch of things reported by flake8.  I'll look at pushing some
of them some time later...

Thanks...

peace & happiness,
martin

