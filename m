Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54231C06E
	for <lists+samba-technical@lfdr.de>; Mon, 15 Feb 2021 18:25:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=As9syGKeS8VicVqj8x+9+NIbGNI174mKBlFqRorjxMU=; b=CM3dxqkkamRThNIBBPD/9Sb6hO
	+nk5QS6W00JN/iOZj0sR/q5QXFJb3zOQxLpQVYRqerAZ+eXnC29TwYVtQqXqO/v2Is/UZaVkoPbot
	eG+1nxLN7nAaKoQbUGeDH4FVzx9lxrwkhzmhTjzuee5gJGfy4rdqq3Es4ynTgTVeXeUyQdCwX7xXh
	39Ijap8dD4BiGCvgzdf7DJ4GWuMHz3gq+Qjad0mZyY1vzoU8JgpPr1QLeoxwXy1EjXP9Ism1izKNs
	aPHie6rHyqiLZUhFdMXweZzqHu/oHcM8w47DMdSKQvsNC6LLxNz1D5FgaVuxubny797FiI2k3iw1V
	HyZ/qvTg==;
Received: from ip6-localhost ([::1]:39450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBhcB-00CkDI-TT; Mon, 15 Feb 2021 17:24:51 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42537) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lBhc6-00CkDB-0x
 for samba-technical@lists.samba.org; Mon, 15 Feb 2021 17:24:49 +0000
Received: by mail-il1-x134.google.com with SMTP id z18so6073653ile.9
 for <samba-technical@lists.samba.org>; Mon, 15 Feb 2021 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=As9syGKeS8VicVqj8x+9+NIbGNI174mKBlFqRorjxMU=;
 b=Nj7vSYL8CgpybKQ+Q9LX7Ux9NuBxbcmlsUwaWY2aB+oPm9yzHNYdxWC8ElT4jg5lep
 Ktx3PvLCKOBUWeGkILBZoh3J1YA4dkVN821auLypTNmuts+BTA+v0uGmkqf+QdxFxHfP
 +Rs+bS+1ue0KttvzcmYgt/MjjnonsjvO8wGdPrOAeudhgZtUzuuj2lcrWOl0JQVwZcKm
 aqeJFdyp6BIHmpDrs9Td1wsqx97DgcYO2JD6TYMZr2yV2NC5jpovL5Ja+Ywgwur/JeDW
 qyNnyTSxdPpvEMwgb2HlMC+BF3ljnP0PlBcihGbtJbnt+YsknChbiXK5/vN0txOQ7B/m
 oN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=As9syGKeS8VicVqj8x+9+NIbGNI174mKBlFqRorjxMU=;
 b=IOpkctaFFfK9xUfGzGn35Nz6xJxGC+ziVo3OmLdlIPcMSBIfHqCryD75r9H5FyRjvb
 1wGGOG8CHgE7wHRP+y+/8kgpo4cPoW4vNaerhMq/CKukeVmpwqANbcxGaKPNSs7GQccZ
 DgkqtAUlZM0TBP3V7paG/j7/aSFUvzRS8r8/pR7vd/icFLYwVHm9wX0ZsYGpxE4HorxQ
 LmXtVk3LS3IITDAsvWYkTWM6SP6BiaObZ+wjwkQ0hWozLFkvnFXJPQJpbc39l6/F8W9M
 WTzbzBegmnGAv/fXaW4NsCyyCwMlCZR9MZdQH8mcL6hajeeg6hj+Z7qCuE93QlhlrfS7
 z7tA==
X-Gm-Message-State: AOAM5332kYoi9fD+wo1pPUZHaoF0rKPbenGb15dQ+rq6NzWwu3+Ra/3a
 RMT26X82F23oYnn3InJgX8YL6+Xqr3PGYQ99iXY=
X-Google-Smtp-Source: ABdhPJyS0gg9wa1MhtvivwZaHgvvfmhIjg4ematsrIzr026LqeDgZZJICHfG2UVQFit/iYOcTM0dnl0qk6xqffDOJmI=
X-Received: by 2002:a92:c90b:: with SMTP id t11mr14031289ilp.275.1613409883706; 
 Mon, 15 Feb 2021 09:24:43 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxiFGjdvX2-zh5o46pn7RZhvbGHH0wpzLPuPOom91FwWeQ@mail.gmail.com>
 <20210215154317.8590-1-lhenriques@suse.de>
 <CAOQ4uxgjcCrzDkj-0ukhvHRgQ-D+A3zU5EAe0A=s1Gw2dnTJSA@mail.gmail.com>
 <73ab4951f48d69f0183548c7a82f7ae37e286d1c.camel@hammerspace.com>
In-Reply-To: <73ab4951f48d69f0183548c7a82f7ae37e286d1c.camel@hammerspace.com>
Date: Mon, 15 Feb 2021 19:24:32 +0200
Message-ID: <CAOQ4uxgPtqG6eTi2AnAV4jTAaNDbeez+Xi2858mz1KLGMFntfg@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: prevent copy_file_range to copy across devices
To: Trond Myklebust <trondmy@hammerspace.com>
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "darrick.wong@oracle.com" <darrick.wong@oracle.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>, "iant@google.com" <iant@google.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "lhenriques@suse.de" <lhenriques@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sfrench@samba.org" <sfrench@samba.org>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "dchinner@redhat.com" <dchinner@redhat.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "llozano@chromium.org" <llozano@chromium.org>,
 "anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 15, 2021 at 6:53 PM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Mon, 2021-02-15 at 18:34 +0200, Amir Goldstein wrote:
> > On Mon, Feb 15, 2021 at 5:42 PM Luis Henriques <lhenriques@suse.de>
> > wrote:
> > >
> > > Nicolas Boichat reported an issue when trying to use the
> > > copy_file_range
> > > syscall on a tracefs file.  It failed silently because the file
> > > content is
> > > generated on-the-fly (reporting a size of zero) and copy_file_range
> > > needs
> > > to know in advance how much data is present.
> > >
> > > This commit restores the cross-fs restrictions that existed prior
> > > to
> > > 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
> > > and
> > > removes generic_copy_file_range() calls from ceph, cifs, fuse, and
> > > nfs.
> > >
> > > Fixes: 5dae222a5ff0 ("vfs: allow copy_file_range to copy across
> > > devices")
> > > Link:
> > > https://lore.kernel.org/linux-fsdevel/20210212044405.4120619-1-drinkcat@chromium.org/
> > > Cc: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Luis Henriques <lhenriques@suse.de>
> >
> > Code looks ok.
> > You may add:
> >
> > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> >
> > I agree with Trond that the first paragraph of the commit message
> > could
> > be improved.
> > The purpose of this change is to fix the change of behavior that
> > caused the regression.
> >
> > Before v5.3, behavior was -EXDEV and userspace could fallback to
> > read.
> > After v5.3, behavior is zero size copy.
> >
> > It does not matter so much what makes sense for CFR to do in this
> > case (generic cross-fs copy).  What matters is that nobody asked for
> > this change and that it caused problems.
> >
>
> No. I'm saying that this patch should be NACKed unless there is a real
> explanation for why we give crap about this tracefs corner case and why
> it can't be fixed.
>
> There are plenty of reasons why copy offload across filesystems makes
> sense, and particularly when you're doing NAS. Clone just doesn't cut
> it when it comes to disaster recovery (whereas backup to a different
> storage unit does). If the client has to do the copy, then you're
> effectively doubling the load on the server, and you're adding
> potentially unnecessary network traffic (or at the very least you are
> doubling that traffic).
>

I don't understand the use case you are describing.

Which filesystem types are you talking about for source and target
of copy_file_range()?

To be clear, the original change was done to support NFS/CIFS server-side
copy and those should not be affected by this change.

Thanks,
Amir.

