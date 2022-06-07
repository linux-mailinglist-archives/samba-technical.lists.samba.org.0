Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59554013D
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jun 2022 16:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zXCWVjJludvQJPQLy3H92OoKnuz3kz/25FzuYYBt/SQ=; b=BktOMF+2ioblP8VucVaCCYxLjN
	iSKSkeZs9moTcZIxiu3e1ZM7oGnlIvF6Sx+LLAyyE4ttrx7umraLo8hEDvJZaWb4OcWqUcA6mpd4O
	B4h2pxoRFAi8nUL7kkQX3rKK6DLtFNYnccl3Mzl1FpQGOnqukQA6PE04rwSQBLa/z0HYhGDdJnK/5
	RWUp6V/aOZVxzsPHF7LYQq/3L0CrygPZvEkzQrcQHh3oQsHkSyYN3pprWhbK/iEWgMLWedVXKwr7K
	IzNJaNNSyagoYpXiq+8Wf9LjYe2O47xXkuzO8i+xIzgnToZG7F+nXxslYPfmFynhfS7AnSzDDqjs4
	5aYDa6rQ==;
Received: from ip6-localhost ([::1]:26452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nya7a-007nyL-C8; Tue, 07 Jun 2022 14:23:50 +0000
Received: from [104.200.28.160] (port=45094 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nya7R-007nvJ-Kn
 for samba-technical@lists.samba.org; Tue, 07 Jun 2022 14:23:47 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id DADCF195;
 Tue,  7 Jun 2022 14:23:35 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: AD DC option to use acl_tdb rather than acl_xattr?
Date: Tue, 07 Jun 2022 10:23:35 -0400
Message-ID: <28842628.1r3eYUQgxm@edfu>
In-Reply-To: <add80d159f1399d7efce0ec93e38cecdc4d52963.camel@samba.org>
References: <5979975.vuYhMxLoTh@edfu>
 <add80d159f1399d7efce0ec93e38cecdc4d52963.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, June 7, 2022 6:02:42 AM EDT Andrew Bartlett via samba-technical 
wrote:
> On Fri, 2022-06-03 at 13:56 -0400, John Mulligan via samba-technical
> 
> wrote:
> > Hi Andrew,
> > During the sambaXP conference you mentioned that there may be an
> > option to
> > swap the vfs/xattr backend even on an AD DC. I'm interested in using
> > this as
> > it ought to avoid the need for always running our AD DC container
> > images in a
> > privileged mode.  You mentioned it should be OK for our use-case
> > where the
> > sysvol is not heavily used. Unfortunately, I haven't found any
> > documentation
> > for it. I looked over the interactive help from 'samba-tool' as well
> > as the
> > wiki and didn't see anything that jumped out at me.
> > 
> > I was hoping you could point me in the right direction. Even if it's
> > an
> > unreleased feature, or needs a "cheat code".  Thank you very much!
> 
> Thanks for asking, and I'm glad I burned the midnight oil to listen to
> your talk, these things are worth attending in real time.
> 

:-D

> So the trick here is that samba-tool domain provision will honour the
> smb.conf it was loaded with.
> 
> so you can set (eg):
>         vfs objects = dfs_samba4 acl_xattr xattr_tdb
>        xattr_tdb:file = $prefix_abs/statedir/xattr.tdb
> 
> (where $prefix_abs is of course a real path)
> 
> And Samba will use those during the provision.
> 

Very useful, thanks!  I think this will help with another issue reported  on 
the DC container that I'm looking at too.


> This is how selftest works, see selftest/target/Samba4.pm
> 
> Andrew Bartlett

Thanks again!




