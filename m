Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD3B607
	for <lists+samba-technical@lfdr.de>; Sun, 28 Apr 2019 15:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b4xsFFRfHe6kxba1lM9EAXBYTG1zOBqgyT4vgDv6Wuk=; b=B43MLwW7Q7xw0qmTPJ3xvb9w7Z
	VNdXGAU1wbrAocA1o/RlCKdR9TSJ5rwi/bs69xrZ9GkPrlpzH5rIrrktdpbnq689OROVUm11xYTv2
	LqnicFWH1qFYzNtnvdFiH8LgSgCt13QBoWnWDpzdXkGPdserd8gtC0V1niHT7nio3xFcTb/5Kglew
	I4tbxnKtrRCOJFXB4tzaDQk6il1qXigTnGDWL6mLd/k/EzaXKLOtpTqnlzyVdaH7Mv8POAHch55Am
	+feZFLTuNCSxLKEMr4p3R+tUP3oTZPJie0tBiSy2u6hs+lXT4SLgSYV4ufZMFyO4wKrA/R4+oqMSc
	/1VOzhzw==;
Received: from localhost ([::1]:61758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKk89-003AKu-3d; Sun, 28 Apr 2019 13:46:09 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:41354) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKk84-003AKn-I9
 for samba-technical@lists.samba.org; Sun, 28 Apr 2019 13:46:07 +0000
Received: by mail-yb1-xb44.google.com with SMTP id a13so2885945ybl.8
 for <samba-technical@lists.samba.org>; Sun, 28 Apr 2019 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b4xsFFRfHe6kxba1lM9EAXBYTG1zOBqgyT4vgDv6Wuk=;
 b=RB6LK2bm4FmooOmmxmEQgkxpC55STLa8bYkKhloIVPDeK+pkonUC++Ue/Vi3/Gim8q
 QdoH0kTLL20ZyMgj0pvsQJY43VGoYaKUdT0pEiCe7oRsoY2gLCXUqIZbucWQ5pdm9TO8
 17mX8utvJDWmLP98PE16P0izPRr4flogn51uvNIxNTdmelvSYGBc33RyQkow9XeYvffh
 Q7gkcBD0pUSuF91tDwYxJR36rmrJWT+kMpvCB6fnNTn+rc4xhJYbA+fw6/gE3DRzHyA2
 rGLqL1E0zawM9MnXPS/j0qh+DIujLzCqsp4aVqhyJfyd46qUZ5XLCZTHchr33JirGZMM
 OQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4xsFFRfHe6kxba1lM9EAXBYTG1zOBqgyT4vgDv6Wuk=;
 b=VyAAfEqeH5pxwNUy8woVpPzKOI1dhvloqJT/UTS7U5sG7Ua7eFEcW0WEfNetXx/EBc
 HA4HsN+FX1HWpvTL4nUx7kfGlS48YHvPk0okhmveXmdpuuAjnUHWtYEV2nKSIqlpi93k
 T3H+TthoBIEfTj3Tebo+6rLkQyrU7HGYqzRsA0xa61G4RelJ8WutdUB1AaICFLScgJrD
 9zvw3c0zNL9npc2rM0uRCas07WwR2mWzSClouFfAGzamFV0+b6d3LP6iB0Fj5omqj9aK
 58d+PsgP40zKM50CnPvP6WWe5gBxUfYbsVN6tWHuDUbO9eyTOiJpEHYITqRCQpTHgVhe
 9Ltw==
X-Gm-Message-State: APjAAAUVdCTRwaJ9j/ohQ9iulVzMj2N6lckiJMZnFNrYWO3WtM37LDfv
 D4lrx2CAJ4Gan+A8TnL8Ok/Y/F1KjSoC1wFrYXY=
X-Google-Smtp-Source: APXvYqxlQ+nFpHDhCuCm2GyvwAD3FP9l5X32QqZIuhgeDd1tawv5iCtlVua/s/Mp5AZgVE7jdxt9pz8vCWLzzA6aRFE=
X-Received: by 2002:a25:b883:: with SMTP id w3mr3404367ybj.337.1556459162048; 
 Sun, 28 Apr 2019 06:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxjQdLrZXkpP30Pq_=Cckcb=mADrEwQUXmsG92r-gn2y5w@mail.gmail.com>
 <379106947f859bdf5db4c6f9c4ab8c44f7423c08.camel@kernel.org>
 <CAOQ4uxgewN=j3ju5MSowEvwhK1HqKG3n1hBRUQTi1W5asaO1dQ@mail.gmail.com>
 <930108f76b89c93b2f1847003d9e060f09ba1a17.camel@kernel.org>
 <CAOQ4uxgQsRaEOxz1aYzP1_1fzRpQbOm2-wuzG=ABAphPB=7Mxg@mail.gmail.com>
 <20190426140023.GB25827@fieldses.org>
 <CAOQ4uxhuxoEsoBbvenJ8eLGstPc4AH-msrxDC-tBFRhvDxRSNg@mail.gmail.com>
 <20190426145006.GD25827@fieldses.org>
 <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
 <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
 <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
In-Reply-To: <8504a05f2b0462986b3a323aec83a5b97aae0a03.camel@kernel.org>
Date: Sun, 28 Apr 2019 09:45:50 -0400
Message-ID: <CAOQ4uxi6fQdp_RQKHp-i6Q-m-G1+384_DafF3QzYcUq4guLd6w@mail.gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Volker.Lendecke@sernet.de, samba-technical <samba-technical@lists.samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Pavel Shilovskiy <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Apr 28, 2019 at 8:09 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Sat, 2019-04-27 at 16:16 -0400, Amir Goldstein wrote:
> > [adding back samba/nfs and fsdevel]
> >
>
> cc'ing Pavel too -- he did a bunch of work in this area a few years ago.
>
> > On Fri, Apr 26, 2019 at 6:22 PM Jeff Layton <jlayton@kernel.org> wrote:
> > > On Fri, 2019-04-26 at 10:50 -0400, J. Bruce Fields wrote:
> > > > On Fri, Apr 26, 2019 at 04:11:00PM +0200, Amir Goldstein wrote:
> > > > > On Fri, Apr 26, 2019, 4:00 PM J. Bruce Fields <bfields@fieldses.org> wrote:
> > > > >
> > > > > > On Fri, Apr 26, 2019 at 03:50:46PM +0200, Amir Goldstein wrote:
> > > > > > > On Fri, Feb 8, 2019, 5:03 PM Jeff Layton <jlayton@kernel.org> wrote:
> > > > > > > > Share/deny open semantics are pretty similar across NFS and SMB (by
> > > > > > > > design, really). If you intend to solve that use-case, what you really
> > > > > > > > want is whole-file, shared/exclusive locks that are set atomically with
> > > > > > > > the open call. O_EXLOCK and O_SHLOCK seem like a reasonable fit there.
> > > > > > > >
> > > > > > > > Then you could have SMB and NFS servers set these flags when opening
> > > > > > > > files, and deal with the occasional denial at open time. Other
> > > > > > > > applications won't be aware of them of course, but that's probably fine
> > > > > > > > for most use-cases where you want this sort of protocol interop.
> > > > > > >
> > > > > > > Sorry for posting off list. Airport emails...
> > > > > > > I looked at implemeting O_EXLOCK and O_SHLOCK and it looks doable.
> > > > > > >
> > > > > > > I was wondering if there is an inherent reason not to allow an exclusive
> > > > > > > lock on a file that is open read-only.
> > > > > > >
> > > > > > > Samba seems to need it and currently flock and ofd locks won't allow it.
> > > > > > > Do you thing it will be ok to allow it with O_EXLOCK?
> > > > > >
> > > > > > Somebody could deny everyone access to a shared resource that everyone
> > > > > > needs to make progress, like /etc/passwd or a shared library.
> > > > > >
> > > > > > Have you looked at Pavel Shilovsky's O_DENY patches?  He had the feature
> > > > > > off by default, with a mount option provided to turn it on.
> > > > > >
> > > > >
> > > > > O_EXLOCK is advisory. It only aquired flock or ofd lock atomically with
> > > > > open.
> > > >
> > > > Whoops, got it.
> > > >
> > > > Is that really adequate for open share locks, though?
> > > >
> > > > I assumed that Windows apps depend on the assumption that they're
> > > > mandatory.  So e.g. if you can get a DENY_READ open on a shared library
> > > > then you know you can update it without the risk of making someone else
> > > > crash.
> > > >
> > >
> > > I think this is (slightly) better than doing it internally like we do
> > > today and would give you coherent locking between NFS and SMB. Other
> > > applications wouldn't see them, but for a NAS-style deployment, that's
> > > probably ok.
> > >
> >
> > We can do a little bit better.
> > We can make sure that O_DENY_WRITE (named for convenience) fails
> > if file is currently open for write by anyone and similarly for O_DENY_READ.
> > But if we cannot deny future non-cooperative opens what's the point?....
> >
>
> As you said in another mail, the main interest here is in getting
> NFS+SMB semantics right. If the exported filesystem is _only_ available
> via NFS+SMB, then do we need to deny non-cooperative opens?
>

We do not.

> > > Any open by samba or nfsd would need to start setting O_SHLOCK, and deny
> > > mode opens would have to set O_EXLOCK. We would actually need 2 per
> > > inode though (one for read and one for write).
> > >
> >
> > ...the point is that O_DENY_NONE does not need to be implemented with
> > a new type of lock object (O_WR_SHLOCK) its enough that it checks there
> > are no relevant exclusive locks and the then inode->i_writecount and
> > inode->i_readcount already provide enough context to cooperate with
> > O_DENY_WRITE and O_DENY_READ.
> >
>
> That would work, if the goal is to have deny modes affect all opens. We
> could also do this on the opt-in basis that I was suggesting with a new
> set of counters in struct file_lock_context.
>

Ok.

> > I need to see if incrementing inode->i_readcount on O_RDWR opens is
> > possible (right now it only counts O_RDONLY opens).
> >
> > > I think these should probably be in their own "namespace" too. They
> > > could use the same semantics as flock, but should sit on their own list
> > > in file_lock_context.
> > >
> >
> > I would much rather that they didn't. The reason is that new open flags
> > are a backward compat problem. The way I want to solve it is this API:
> >
> > // On new kernel this will acquire OFD F_WRLCK atomically...
> > fd = open(..., O_RDWR | O_EXLOCK);
> > // ...check if it did acquire OFD lock
> > fcntl(fd,  F_OFD_GETLK, ...);
> >
> > We'd need at least one new l_type F_EX_RDLCK and maybe also a new
> > semantic F_EX_RDWRLCK, although similar in conflicts to F_WRLCK it can be
> > acquired without FMODE_WRITE. Though I personally thing we can do without
> > it if the only way to acquire F_WRLCK on readonly file is via new open flag.
> >
>
> I don't think that will work at all. Share/deny modes are entirely
> orthogonal to byte-range locks in both NFS and SMB. Consider:
>
> Two clients open a file with O_RDWR | | O_SHARE_WRITE | O_SHARE_READ.
> One of them now wants to set byte-range write lock on the file. That
> should be allowed, but now it'll be denied, because the other client
> will effectively hold a whole-file readlock on it.
>

Got it. flock semantics (as Pavel chose) are a better fit.
It only does not support O_SHARE_WRITE | O_DENY_READ naively,
but easy to add.

> There is also the problem that read and write deny modes are orthogonal
> to one other, so you have to have a way to deal with them independently.
>
> I'd suggest an API like this:
>
> // open read/write and deny read/write
> fd = open(..., O_RDWR | O_DENY_READ | O_DENY_WRITE);
> // test for flags with F_GETFL
> flags = fcntl(fd, F_GETFL);
>
> That would also allow you to use F_SETFL to change those flags on an
> existing fd.
>

Nice. If only old kernel wouldn't give out in F_GETFL any garbage flags
you piled on open.
That's why I wanted a different way to check if lock is taken and thought
of F_OFD_GETLK as a natural candidate.

We can play this game:

// New kernel doesn't copy O_TEST to f_flags
#define O_DENY_READ O_TEST | __O_DENY_READ
fd = open(..., O_RDWR | O_DENY_READ);
flags = fcntl(fd, F_GETFL);
if ((flags & O_DENY_READ) && !(flags & O_TEST))

A bit ugly, but if its wrapped in a library function
get_open_flags() who cares...

> > > That said, we could also look at a vfs-level mount option that would
> > > make the kernel enforce these for any opener. That could also be useful,
> > > and shouldn't be too hard to implement. Maybe even make it a vfsmount-
> > > level option (like -o ro is).
> > >
> >
> > Yeh, I am humbly going to leave this struggle to someone else.
> > Not important enough IMO and completely independent effort to the
> > advisory atomic open&lock API.
>
> Having the kernel allow setting deny modes on any open call is a non-
> starter, for the reasons Bruce outlined earlier. This _must_ be
> restricted in some fashion or we'll be opening up a ginormous DoS
> mechanism.
>
> My proposal was to make this only be enforced by applications that
> explicitly opt-in by setting O_SH*/O_EX* flags. It wouldn't be too
> difficult to also allow them to be enforced on a per-fs basis via mount
> option or something. Maybe we could expand the meaning of '-o mand' ?
>
> How would you propose that we restrict this?
>

Our communication channel is broken.
I did not intend to propose any implicit locking.
If samba and nfsd can opt-in with O_SHARE flags, I do not
understand why a mount option is helpful for the cause of
samba/nfsd interop.

If someone else is interested in samba/local interop than
yes, a mount option like suggested by Pavel could be a good option,
but it is an orthogonal effort IMO.


> > > If you're denied, what error should you get back when you try to open
> > > it? It should be something distinct. We may even want to add new error
> > > codes for this.
> >
> > IMO EBUSY does the job. Its distinct because open is not expected
> > to return EBUSY for regular files/dirs and when open is expected to
> > return EBUSY for blockdev its for the exact same use case (i.e.
> > exclusive write open is acquired by userspace tools).
>
> That works for me.

From Pavel's v6 cover letter:
"Make nfs code return -EBUSY for share conflicts (was -EACCESS)."
;-)

>
> We should probably have a close look at the work that Pavel did several
> years ago too. It has almost certainly bitrotted by now, but it may
> serve as a starting point (and he may he may have valuable input here).

I looked at the patches. There's good stuff in there.
Once we agree on the specifications I can rip some code off ;-)

A lot of the work in Pavel's patches evolves around making the
mount option work and respecting O_DENYDELETE.
IMO, that is not a good use of up-streaming effort, because:
- NFS won't ask for deny delete
- IMO, Windows applications should be used to being denied
  a DENY_DELETE and fall back to SHARE_DELETE

So while implementing DENYDELETE may fall into a category of making
samba server behave more like Windows server, I don't think it falls into
the category of better samba/nfs interop.

It is something that we can add later if anyone really cares about.

Thanks,
Amir.

