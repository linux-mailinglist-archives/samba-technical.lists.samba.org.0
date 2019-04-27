Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B34B476
	for <lists+samba-technical@lfdr.de>; Sat, 27 Apr 2019 22:18:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=X7nIKq30gmNteOhuVTtXwzawEY+p5Z4tJsssF9WMYtM=; b=Dr+ts5OVrVXu7U2XXc6K5FjWsl
	HyG1Wsv6i3VpCTif63it3s39ctHRcFK/p6Qc9Tr6OtIP1PybfwCKYX7vz7LwKSxESsTCVLcP39Hjs
	gg8KjoB5RT01dkxv8oCCS8uT7kcxQUhTfyhZeB44Hodk/tpDjhTfyqkXxY9QHVO0zIlhfTbo6haQN
	3dHESnIEbKLjqkvLqZBn38WLm4/KvMQGsLWpCtcCIPJ1LauzDyQZuy6hghM8fUohPKU7Js13oIbVl
	1VHARkLaKrVHy38Z2hthrd7FF2EoYI9GXp6MUXtDNldSkOZk94GoVNiQn5T4RpwnQ5r6+Fwv7k0tA
	EKWNB7XQ==;
Received: from localhost ([::1]:55780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKTkr-00383v-LJ; Sat, 27 Apr 2019 20:17:01 +0000
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:44495) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKTkm-00383o-1R
 for samba-technical@lists.samba.org; Sat, 27 Apr 2019 20:16:58 +0000
Received: by mail-yw1-xc41.google.com with SMTP id j4so2368900ywk.11
 for <samba-technical@lists.samba.org>; Sat, 27 Apr 2019 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7nIKq30gmNteOhuVTtXwzawEY+p5Z4tJsssF9WMYtM=;
 b=YTdcDCKFP8Wusps0xQ2BYOOkrKX2CrNRaEUAoW3pFyzoE7aVcc7edu59oCKcG24nJ+
 t/Me5myN59chQFA34FhFOmQG1fmH2ZOk3fofbvgNKEyfaxIvAbNrYBj6cWNXoAUlfTdU
 GLEsxehnNKqlNZKGcakxWNaPTWq+XZkgb6nFap4fcoBc3bN3Odds9I+xneLqT9cnmcq5
 Glw9qWjpfwvK1tfe4ib6jpxC0U3l8BlRPcjo7OaDrS0qH5diX6o86iZAbSaLPRGsBlnR
 OlLgPppHxBGwjqbWnEeA5Bx7lZcjiD93pss3FBIie8vu6FpVnjFO9uuib+AigfiW1t2H
 yroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7nIKq30gmNteOhuVTtXwzawEY+p5Z4tJsssF9WMYtM=;
 b=DY1w6GirtS7kbfnyBPhXkSsFk6hq6tLaN1oZ9XXBBzh+ZC78dkJ/o6XGSSw43aX4TI
 10ExE7WkrKplmaWhsfG+3l+YfLnTCmUcek09CW6q2unLqZccV+EbjMIPqx2aHLAD9T09
 F4KXzt9Zm+BjVw/6pVAtm+63VC5NwbQ12pwoM0SwrZ38YMWc6kTP5bNUzqZszSe3O20g
 byrsw/YUQvomK6rF8tRs1Eo8wtWPQB/IJIBfUTYwHXcmEwI5YkvJXIB7y+ZXO1EtQukr
 JtRJI7XvxLHAOOZ3Iw/RROTi17jhYAtHE+N1H/ScBuH5r6s3bipdN25QWwRVZHz+amCM
 LE3w==
X-Gm-Message-State: APjAAAXh3p7otEJ6m5CF2+Pw6xXAshha+ShbYQu0rHkIC2IQga7iDfyB
 LYlyMF5qxaiBrP0o2Avx5ZwOdUc90JfaSus7YuI=
X-Google-Smtp-Source: APXvYqyMiv4Q75Gsfnaru5UqCRjb6WzLYfjr5aY84foN+Agu0n9ANzxebHWhVCwNu6rZLZknxtXrOi9aQoQvPkCGksc=
X-Received: by 2002:a81:7c4:: with SMTP id 187mr44913328ywh.176.1556396214239; 
 Sat, 27 Apr 2019 13:16:54 -0700 (PDT)
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
In-Reply-To: <e69d149c80187b84833fec369ad8a51247871f26.camel@kernel.org>
Date: Sat, 27 Apr 2019 16:16:42 -0400
Message-ID: <CAOQ4uxjt+MkufaJWoqWSYZbejWa1nJEe8YYRroEBSb1jHjzkwQ@mail.gmail.com>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, Volker.Lendecke@sernet.de,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[adding back samba/nfs and fsdevel]

On Fri, Apr 26, 2019 at 6:22 PM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Fri, 2019-04-26 at 10:50 -0400, J. Bruce Fields wrote:
> > On Fri, Apr 26, 2019 at 04:11:00PM +0200, Amir Goldstein wrote:
> > > On Fri, Apr 26, 2019, 4:00 PM J. Bruce Fields <bfields@fieldses.org> wrote:
> > >
> > > > On Fri, Apr 26, 2019 at 03:50:46PM +0200, Amir Goldstein wrote:
> > > > > On Fri, Feb 8, 2019, 5:03 PM Jeff Layton <jlayton@kernel.org> wrote:
> > > > > > Share/deny open semantics are pretty similar across NFS and SMB (by
> > > > > > design, really). If you intend to solve that use-case, what you really
> > > > > > want is whole-file, shared/exclusive locks that are set atomically with
> > > > > > the open call. O_EXLOCK and O_SHLOCK seem like a reasonable fit there.
> > > > > >
> > > > > > Then you could have SMB and NFS servers set these flags when opening
> > > > > > files, and deal with the occasional denial at open time. Other
> > > > > > applications won't be aware of them of course, but that's probably fine
> > > > > > for most use-cases where you want this sort of protocol interop.
> > > > >
> > > > > Sorry for posting off list. Airport emails...
> > > > > I looked at implemeting O_EXLOCK and O_SHLOCK and it looks doable.
> > > > >
> > > > > I was wondering if there is an inherent reason not to allow an exclusive
> > > > > lock on a file that is open read-only.
> > > > >
> > > > > Samba seems to need it and currently flock and ofd locks won't allow it.
> > > > > Do you thing it will be ok to allow it with O_EXLOCK?
> > > >
> > > > Somebody could deny everyone access to a shared resource that everyone
> > > > needs to make progress, like /etc/passwd or a shared library.
> > > >
> > > > Have you looked at Pavel Shilovsky's O_DENY patches?  He had the feature
> > > > off by default, with a mount option provided to turn it on.
> > > >
> > >
> > > O_EXLOCK is advisory. It only aquired flock or ofd lock atomically with
> > > open.
> >
> > Whoops, got it.
> >
> > Is that really adequate for open share locks, though?
> >
> > I assumed that Windows apps depend on the assumption that they're
> > mandatory.  So e.g. if you can get a DENY_READ open on a shared library
> > then you know you can update it without the risk of making someone else
> > crash.
> >
>
> I think this is (slightly) better than doing it internally like we do
> today and would give you coherent locking between NFS and SMB. Other
> applications wouldn't see them, but for a NAS-style deployment, that's
> probably ok.
>

We can do a little bit better.
We can make sure that O_DENY_WRITE (named for convenience) fails
if file is currently open for write by anyone and similarly for O_DENY_READ.
But if we cannot deny future non-cooperative opens what's the point?....

> Any open by samba or nfsd would need to start setting O_SHLOCK, and deny
> mode opens would have to set O_EXLOCK. We would actually need 2 per
> inode though (one for read and one for write).
>

...the point is that O_DENY_NONE does not need to be implemented with
a new type of lock object (O_WR_SHLOCK) its enough that it checks there
are no relevant exclusive locks and the then inode->i_writecount and
inode->i_readcount already provide enough context to cooperate with
O_DENY_WRITE and O_DENY_READ.

I need to see if incrementing inode->i_readcount on O_RDWR opens is
possible (right now it only counts O_RDONLY opens).

> I think these should probably be in their own "namespace" too. They
> could use the same semantics as flock, but should sit on their own list
> in file_lock_context.
>

I would much rather that they didn't. The reason is that new open flags
are a backward compat problem. The way I want to solve it is this API:

// On new kernel this will acquire OFD F_WRLCK atomically...
fd = open(..., O_RDWR | O_EXLOCK);
// ...check if it did acquire OFD lock
fcntl(fd,  F_OFD_GETLK, ...);

We'd need at least one new l_type F_EX_RDLCK and maybe also a new
semantic F_EX_RDWRLCK, although similar in conflicts to F_WRLCK it can be
acquired without FMODE_WRITE. Though I personally thing we can do without
it if the only way to acquire F_WRLCK on readonly file is via new open flag.

> That said, we could also look at a vfs-level mount option that would
> make the kernel enforce these for any opener. That could also be useful,
> and shouldn't be too hard to implement. Maybe even make it a vfsmount-
> level option (like -o ro is).
>

Yeh, I am humbly going to leave this struggle to someone else.
Not important enough IMO and completely independent effort to the
advisory atomic open&lock API.

> If you're denied, what error should you get back when you try to open
> it? It should be something distinct. We may even want to add new error
> codes for this.

IMO EBUSY does the job. Its distinct because open is not expected
to return EBUSY for regular files/dirs and when open is expected to
return EBUSY for blockdev its for the exact same use case (i.e.
exclusive write open is acquired by userspace tools).

Thanks,
Amir.

