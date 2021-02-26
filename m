Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17416326016
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 10:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2vY8+oNCkt89Rk3oiLctaNFEpHwBmJ67xMHg1V9zQ10=; b=aFh6YQRuMnHZ8zdZVPrrVImbj/
	7SYofMI9SaigSfx9R6CPgDlRvbVqsn4D9TcyLde30Iv1UFCPOHUXU1sJklFmmgdGe2hzCE+gHofeY
	nlaKG8kC228M3r4SzcOyWAjgNH72rA/KQQciVirbaVLfEYHPtR6fSGpP1G3AS/+5k9WQVARr3urZE
	21O+zlWM3GeHQpmNj5iYEGmdTDfntfnUDTB+NxdmdbefiqTcKD/zhZ/X522SSx4zPx0aJzDB9b+yJ
	+ffZX4YPTCdyUw0czJCZdUrkPE2iperbPfOgCrdQRBykN9DbOTTib4+BVEFhnCHXRad9IbhCcpr1t
	CVv1kOwQ==;
Received: from ip6-localhost ([::1]:32654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFZUA-001YKs-Jc; Fri, 26 Feb 2021 09:32:34 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47079 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFZU4-001YKl-OQ
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 09:32:31 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dn4Dl4t1kz9sCD;
 Fri, 26 Feb 2021 20:32:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1614331930; bh=HOfu1+vubTnWyITW8G1US/2l7vKvH5QGXKgPjmApJao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hWJlZfUNJRTypsuF5wDNHneIWsu/IXLei5F9mPLVSdHiNn74r5Wobq6DtGr4cqjWF
 w9zBbxOCn18fwfhdLcyPhAOVd4PnZqfQy/rvvnOOhLgCrm8YhD31v2Kkoum523iMdG
 N570l65D0hnHP5By1UiTIwX5s03od4A0Hd1EEsOkMRoAV+H4uVd5XD759KByb7wgZF
 UAm50fw7R/0XNtdG4KEZkDGwyp2tlR9MJPTvKZBmcf3Z9JxFYjnSa2ButCdw+yor3t
 WCHyydRMYLJ+f50JGFnvh9MEfghPTHrKvk8x8nwUGIkBls4rhdj4ZRM04VEZbURhEI
 /xr6EELF3Ghzg==
Date: Fri, 26 Feb 2021 20:32:06 +1100
To: Amitay Isaacs <amitay@gmail.com>, Ralph Boehme <slow@samba.org>
Subject: Re: Possible bug in ctdb
Message-ID: <20210226203206.3ad1b29c@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mTqfRixnRWn96oZ9VdQ4k7e3v+GzKazUB+0WWiwvuA=Hw@mail.gmail.com>
References: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
 <20210226145736.316f50b7@martins.ozlabs.org>
 <CAJ+X7mTqfRixnRWn96oZ9VdQ4k7e3v+GzKazUB+0WWiwvuA=Hw@mail.gmail.com>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 26 Feb 2021 17:22:56 +1100, Amitay Isaacs <amitay@gmail.com>
wrote:

> On Fri, Feb 26, 2021 at 2:57 PM Martin Schwenke <martin@meltin.net> wrote:

> > On Thu, 25 Feb 2021 13:05:52 +0100, Ralph Boehme <slow@samba.org> wrote:
> >  
> > > I noticed the following if condition in check_static_boolean_change()
> > > (defined twice):
> > >
> > >      if (mode == CONF_MODE_RELOAD || CONF_MODE_API)
> > >
> > > This will always evaluate to true, I guess that is not intended and the
> > > fix would be
> > >
> > >      if (mode == CONF_MODE_RELOAD || mode == CONF_MODE_API)
> > >
> > > (WIP attached, lacking bugnumber).  
> >
> > Yes, obviously a bug.  My bug.  Fix looks sane.
> >
> > Note that this code is actually a no-op and it just logs a warning.
> > CTDB doesn't currently support reloading the configuration at run
> > time... but the config system does. When reloading is implemented it
> > will flag that after a config reload we don't look at the new value of
> > the variable that points to that config value, so there is no change the
> > daemon's behaviour even if that config setting is changed.  There are
> > just some things that you can't (or don't want to ;-) change at
> > run-time.
> >
> > For consistency I'd almost like to see that condition coded as:
> >
> >   if (conf_maybe_updating(mode)) {
> >
> > although perhaps we should just write it as:
> >
> >   if (mode != CONF_MODE_LOAD) {
> >
> > since that catches the other cases consistently.
> >
> > Let's see what Amitay says.  :-)
> >  
> 
> Let's do mode != CONF_MODE_LOAD...

Sold!

Ralph, do you want to update your patch?  In addition to fixing that,
it is probably worth changing other similar checks (which currently
just check for CONF_MODE_RELOAD).  If not, then I'm happy to do it.

I have some patches somewhere to move all of the config stuff into a
single directory.  Amitay and I decided that dispersing the config
stuff doesn't make total sense because options don't necessarily map to
subsystems - some affect overall behaviour.  So we'll be able to get
rid of some of the duplication later on too.

Since it doesn't have a real impact, we probably don't need to backport
it.  If we can see a misleading message in a log somewhere (e.g.
systemd journal) then it *might* be worth backporting...

Sound good?

peace & happiness,
martin

