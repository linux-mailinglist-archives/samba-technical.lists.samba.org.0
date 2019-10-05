Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF90CC74E
	for <lists+samba-technical@lfdr.de>; Sat,  5 Oct 2019 04:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dKFFeqNEIfC6bfYX2MCvoQDPGT0qQ00+CPFZGAhucyY=; b=5plnk/zLSrm1tCfqfEEijMfS/a
	Tagz1xnt3Y64548n1OEctZ1MBdAaWhgrAvrT7uLQkrqZTuRzddgHfoLtN5gXpIYenE2D0AHdObj/G
	QrRu7TY6N/BVOTyAp/KxT972zG/tFFTnDCOYNBmY9nnY8/9mGSIKXfF3LlzwFCwOl107yZToaHOB8
	6rc6odgdtpgv1OGXBlpfxSGbXnjQmxQhq/+TQbgUOR10khaxacELInib+TA2bneIjbY9jIhGwV4/5
	tvM8ziulJaPgrvbmpl9r6yrxBynzpnC5/wG6p/Rz+6nVDODeYJxLk7u2kLxjk7bu/2+mjWcIo1AQA
	+Wg4EKBw==;
Received: from localhost ([::1]:52888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGZRH-001IHE-A3; Sat, 05 Oct 2019 02:04:55 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:42549) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGZR9-001IH3-Fe
 for samba-technical@lists.samba.org; Sat, 05 Oct 2019 02:04:49 +0000
Received: by mail-io1-xd41.google.com with SMTP id n197so17473792iod.9
 for <samba-technical@lists.samba.org>; Fri, 04 Oct 2019 19:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dKFFeqNEIfC6bfYX2MCvoQDPGT0qQ00+CPFZGAhucyY=;
 b=XBe5Lfr1WO/ehyz2z39XQtwaT6/KSwCbVEkv+2+0BqSdThjVgBjDT1cuh1+asCPLPx
 7QTCbGMiz4NzONlXxyuS+vu/g3czW4Fyux9aI/D8wbAdKY+FTdHb/l+Dimq5bdZeEzYD
 4PjV2HAXhU3I46PSY0ygDCaTG+Ru7LcYyB6UX2Am/0LP7qsksngNjNGyBQyIMySnfFN1
 726mZeM8PEajpVSZxXtpNoNmFFOwjt1cIweKDUr1Ruq9U/VrEnc87f0/bqTjY1C9PjRL
 CvHxOHCgL0RXpJQPyzDv17vfNua7aQ2gBTO64mLIXl0NIDm8B29bBrZMGg41IB64Hpze
 Hm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKFFeqNEIfC6bfYX2MCvoQDPGT0qQ00+CPFZGAhucyY=;
 b=udIgug3Na6ZO+SvVyO3DumbSeVC5CLoCDUy7Whoo/ePKaytt34tJCkMq8Vz/fxxoG5
 L32rOYDrx2/++qAVeH3/I7zEOpaDaoEwblBR3gRlmHASOm7x2JL+PvIb9HUMlDHJvZqb
 BjXXGUfNdpARTpzgiwk/F+PeHY9541mcbf1UVbQCnxr3Bsq0jVGgnSl11bq8bFrHwCYd
 1SQfGWSkyIqAZkR3s6fDhHFSGEDXlZF5bgj8Defry26rsEpaYdRTdSa3xhuDkLW11uJ7
 DMEgsL1M111XoP6iOVD7o+RlGVfbAVKV4DEdYeFK5Rco0hh0Zuew8x3YF9mkPgsj8foy
 J9JA==
X-Gm-Message-State: APjAAAVy8VeIaE4Dam08KTXIg5lDoymif4oY0EKWnvX5Kc/EoXNR0RYq
 HtSptFCPBQ1u81opOS99l2SIysFSXyxJ6FU94XI=
X-Google-Smtp-Source: APXvYqwBIAoHkqwaCUKDOqze9cchvM+P00vkTrkL1lxkk2uirCl29/HUsptcngeC6wh302S1+9ApJXpS9WjXydrEuD0=
X-Received: by 2002:a5d:8f02:: with SMTP id f2mr8826897iof.272.1570241084953; 
 Fri, 04 Oct 2019 19:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191004140503.9817-1-christian.brauner@ubuntu.com>
 <20191004142748.GG26530@ZenIV.linux.org.uk>
 <20191004143301.kfzcut6a6z5owfee@wittgenstein>
 <20191004151058.GH26530@ZenIV.linux.org.uk>
 <20191004152526.adgg3a7u7jylfk4a@wittgenstein>
 <20191004160219.GI26530@ZenIV.linux.org.uk>
 <20191004165428.GA28597@ZenIV.linux.org.uk>
In-Reply-To: <20191004165428.GA28597@ZenIV.linux.org.uk>
Date: Fri, 4 Oct 2019 21:04:33 -0500
Message-ID: <CAH2r5msU43=Nc=Az05y9mXwKSpe5YC1gL1KHYiu7eowP+sYZog@mail.gmail.com>
Subject: Re: [cifs] semantics of IPC$ shares (was Re: [PATCH] devpts: Fix NULL
 pointer dereference in dcache_readdir())
To: Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Varad Gautam <vrd@amazon.de>,
 Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>,
 Jan Glauber <jglauber@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Your questions are interesting and rarely asked.

On Fri, Oct 4, 2019 at 11:57 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Oct 04, 2019 at 05:02:20PM +0100, Al Viro wrote:
>
> >       * (possibly) cifs hitting the same on eviction by memory pressure alone
> > (no locked inodes anywhere in sight).  Possibly == if cifs IPC$ share happens to
> > show up non-empty (e.g. due to server playing silly buggers).
> >       * (possibly) cifs hitting *another* lovely issue - lookup in one subdirectory
> > of IPC$ root finding an alias for another subdirectory of said root, triggering
> > d_move() of dentry of the latter.  IF the name happens to be long enough to be
> > externally allocated and if dcache_readdir() on root is currently copying it to
> > userland, Bad Things(tm) will happen.  That one almost certainly depends upon the
> > server playing silly buggers and might or might not be possible.  I'm not familiar
> > enough with CIFS to tell.
>
> BTW, I would really appreciate somebody familiar with CIFS giving a braindump on
> that.  Questions:
>
> 1) What's normally (== without malicious/broken server) seen when you mount
> an IPC$ share?

IPC$ is for "inter process communication" so is basically an
abstraction for named pipes (used
for remote procedure call queries using the old DCE/RPC standard).

To Windows it is possible to mount IPC$, to Samba you can connect to
the share but
due to a Samba server bug you can't do a query info on "." (the 'root'
of the IPC$ share).


> 2) Does it ever have subdirectories (i.e. can we fail a lookup in its root if it
> looks like returning a subdirectory)?

In Samba you can't query subdirectories on IPC$ because even open of "."
fails, but to Windows the query directory would get "STATUS_INVALID_INFO_CLASS"

An interesting question, and one that I will bring up with the spec
writers is whether
there are info level which would be allowed for query directory (probably not).

Another interesting question this brings up is ... "should we allow
enumerating the 'services' under IPC$
via readdir"?   You could imagine a case where mounting IPC$ would
allow you to see the 'services'
exported by the server over remote procedure call ("server service"
and "workstation server" and "netlogon service"
and the global name space (DFS) service and  perhaps "witness protocol
services" and "branch cache service" etc.)

And then thinking about Dave Howell's changes to the mount API -
should this be a mechanism that is allowed to be
used to either browse the valid shares or better access the root of
the (DFS) global name space.

But the short answer is "no you can't query the directory contents
under IPC$" (at least not without changing the
abstraction that we export on the client) but I am open to ideas if
this would fit with Dave Howell's changes to the
mount API or other ideas.
> 3) If it can be non-empty, is there way to ask the server about its contents?
> Short of "look every possible name up", that is...
>
> As it is, the thing is abusing either cifs_lookup() (if it really shouldn't
> have any files in it) or dcache_readdir().  Sure, dcache_readdir() can (and
> should) pin a dentry while copying the name to userland, but WTF kind of
> semantics it is?  "ls will return the things you'd guessed to look up, until
> there's enough memory pressure to have them forgotten, which can happen at
> any point with no activity on server"?

Server's realistically must expose a share "IPC$" so in theory it can be mounted
(despite Samba server's current bug there) and there were some experiments
that Shirish did a few years ago opening well known services under mounts
to IPC$ (to allow doing remote procedure calls over SMB3 mounts which has
some value) but AFAIK you would never do a readdir over IPC$ and no
current users would ever mount IPC$

-- 
Thanks,

Steve

