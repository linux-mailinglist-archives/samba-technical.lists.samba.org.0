Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE9514FA73
	for <lists+samba-technical@lfdr.de>; Sat,  1 Feb 2020 20:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5ZM+XG0Qafoo8yoA94Tb8BHY4hUIVe3CK4bN+n5GzG8=; b=SvQ6xGvvQdZ7h6Ok24ReiJaL4X
	priG8SOA+wGvVmrzIJKfaReWjUyQIG/zJ+IwwgtrMRqlvrUNTVuI4K4VcPhoKfsvLNW7dXf3k5iqD
	E6Yo/UO4TPIUgB6R06AV77PREOHiT3l/1OF+v3NJtCG3PHxihwJf8EqqQfSIWBqNqv93iY2j5VGoN
	YcEHjp1lYs25Kuc4amRP3n0PgNppvXscP3LGdvVTplqcY6WwzaMQiyKSVDwiIRYDamCyYl7ZlasKu
	WGkGLys7UyFbk6KYhmD4sGazVU4liTJNh8yCMeadc6zUz0y3bjiCQoj01TGHTlGCkAXe4Tt5sBTKq
	nU0npeWQ==;
Received: from localhost ([::1]:61622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixyr9-007l4x-Gn; Sat, 01 Feb 2020 19:55:03 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:36172) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ixyr5-007l4n-Ke
 for samba-technical@lists.samba.org; Sat, 01 Feb 2020 19:55:01 +0000
Received: by mail-il1-x142.google.com with SMTP id b15so9252679iln.3
 for <samba-technical@lists.samba.org>; Sat, 01 Feb 2020 11:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZM+XG0Qafoo8yoA94Tb8BHY4hUIVe3CK4bN+n5GzG8=;
 b=nM4GcWpAjqrvtL0Lcot/MfvVHtdRX+7g84363eMq/9AuOgxISlHekqaj3V52RNVmkm
 /ioWKfJZAkxg9iBcZUCW+mJwCkoFS+Gb2xhExyOKZiXItEGsDEX6Dt5Bf541NXK0sTHQ
 OfSkxk/se9sB5wMFojGXz6KvoP2KlTASo44Wb5gNchmhOs5LdCdGhr1HSlyzGMHAbUM0
 1vOEEpt5AHGPBBXSY3iF3kHqh/J8eRjPlfPcq8DEwu8wYUDvZ1sFG07i5GXZDeTamJaW
 wKuM+UDaxinaG+hK+FRey6eXOpNF3EFJAePEkon67a03z3EeFPsWnfyVfm251IsJtyWl
 LvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZM+XG0Qafoo8yoA94Tb8BHY4hUIVe3CK4bN+n5GzG8=;
 b=knq9f9WmvVCkB515dJTDVEwo6hfkiV4SiI0FenTJkEFp5DaJF2KcujGg0vpMvbmuGe
 eAT5ax1gzeJBWWnOtUSIDEXd1MlmgoBOCkNZsoi0KbvdOhGl2I8IQwaNk1W3PoTNcTgz
 Dz9eeSB4oPpT69yne3DK9NoW461s5Ji71UXbgXZkiEL4j0auEQ7fa+1/ubV0eaKbdHlh
 +kCliATrV2dyHeliBvgxdtL0yCMxOjmQN2RnKGDfabhcLT/As05GJmb26omD9zcuJlTF
 9hRR3wcbMDGGXaMHfGE7ANjNcgUsUYq01N6cA84/ZXbO0eHlIEMUnswQaBTvhhL77a8s
 y/Ww==
X-Gm-Message-State: APjAAAVlWR4KmeWvRnSa+tpHUrLeEtac3+dele6BZBwYvNkUciPRgukB
 2snc5mSUFQGtBLBlpkNbKXiDYe2F8D5eF8CVpY8=
X-Google-Smtp-Source: APXvYqwLHAZsySBQ5toZfqW/3M9sNi5WUjCIwF+SI1xCAeDRgfX4LKqJmF2bmQV/9y0r2Ld5SOqDmVCpjzeN7PYQtxs=
X-Received: by 2002:a92:d642:: with SMTP id x2mr8368738ilp.169.1580586897434; 
 Sat, 01 Feb 2020 11:54:57 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvYTimXUfJB+p0mvYV3jAR1u5G4F3m+OqA_5jKiLhVE8A@mail.gmail.com>
 <20200130015210.GB3673284@magnolia>
In-Reply-To: <20200130015210.GB3673284@magnolia>
Date: Sat, 1 Feb 2020 13:54:46 -0600
Message-ID: <CAH2r5mv55Ua3B8WX1Qht1xfWL-k5pGJrN+Uz0L4jHtYOo9RMKw@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Enhancing Linux Copy Performance and Function
 and improving backup scenarios
To: "Darrick J. Wong" <darrick.wong@oracle.com>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, lsf-pc@lists.linux-foundation.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 29, 2020 at 7:54 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
>
> On Wed, Jan 22, 2020 at 05:13:53PM -0600, Steve French wrote:
> > As discussed last year:
> >
> > Current Linux copy tools have various problems compared to other
> > platforms - small I/O sizes (and most don't allow it to be
> > configured), lack of parallel I/O for multi-file copies, inability to
> > reduce metadata updates by setting file size first, lack of cross
>
> ...and yet weirdly we tell everyone on xfs not to do that or to use
> fallocate, so that delayed speculative allocation can do its thing.
> We also tell them not to create deep directory trees because xfs isn't
> ext4.

Delayed speculative allocation may help xfs but changing file size
thousands of times for network and cluster fs for a single file copy
can be a disaster for other file systems (due to the excessive cost
it adds to metadata sync time) - so there are file systems where
setting the file size first can help

> >  And copy tools rely less on
> > the kernel file system (vs. code in the user space tool) in Linux than
> > would be expected, in order to determine which optimizations to use.
>
> What kernel interfaces would we expect userspace to use to figure out
> the confusing mess of optimizations? :)

copy_file_range and clone_file_range are a good start ... few tools
use them ...

> There's a whole bunch of xfs ioctls like dioinfo and the like that we
> ought to push to statx too.  Is that an example of what you mean?

That is a good example.   And then getting tools to use these,
even if there are some file system dependent cases.

>
> > But some progress has been made since last year's summit, with new
> > copy tools being released and improvements to some of the kernel file
> > systems, and also some additional feedback on lwn and on the mailing
> > lists.  In addition these discussions have prompted additional
> > feedback on how to improve file backup/restore scenarios (e.g. to
> > mounts to the cloud from local Linux systems) which require preserving
> > more timestamps, ACLs and metadata, and preserving them efficiently.
>
> I suppose it would be useful to think a little more about cross-device
> fs copies considering that the "devices" can be VM block devs backed by
> files on a filesystem that supports reflink.  I have no idea how you
> manage that sanely though.

I trust XFS and BTRFS and SMB3 and cluster fs etc. to solve this better
than the block level (better locking, leases/delegation, state management, etc.)
though.

-- 
Thanks,

Steve

