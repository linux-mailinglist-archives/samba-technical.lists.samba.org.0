Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6569470CC3
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 22:53:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ce4kfh5VLRjy1P06EG3BXsy41yP+6i79qy4raANjvlY=; b=NRuX5RfCBOSUtTtmGIcgbO+rGG
	zQbhbaPqHXWqio3AFrLhlyQrJ5Sy+wPqcKJuUqzeBiI4OVTbw21Z/qBt0kIYdyiOxR2yJI3QZTDkA
	XxIxXI6Kngj267XTOwMMw4u81gD1OoTm9ZR7ucnduBbSqKZJgDyZFVODC2q12ZsYxLwOkWab/V7Kr
	Kw5LybmJYfZykcoGabUY4A2ooblJJrhiJ8+dxO9tHDe5NyCSjUnlYiQ30SGYoprprEOVfIH1lNMAA
	BLqDhgXFCIpgh5k7J56HEQwLE8fI6Szc0zgd4EHvEw2EdTlgjMgPDYZnp3E5iXDsFCuH3SdbMMBkc
	qzlP//Iw==;
Received: from ip6-localhost ([::1]:52448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvnpa-0057oN-8v; Fri, 10 Dec 2021 21:53:30 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvnpS-0057oE-TM
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 21:53:27 +0000
Received: by mail-ed1-x535.google.com with SMTP id v1so34455560edx.2
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 13:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=srhOwuidztikFpixZQyg0Vzk4eB1h7NgpSmrvqRs1Zk=;
 b=RqBeUgeOZcqa8Q/he+fkFdoYoLYOd+gL1lIUXE/ceVcUGX1dME9vY/br2BtfcM+MAZ
 EpGg7G2JbDmF3iSht1bKUZm8JtUKDT7kCrWpsDLhx/QuAk0NQb9ySz8eRj0IEBxvrbTR
 nKYyN4u5VLkQE8iOSTYEI1C6ShjQ73GpqzajOZEQNJwVWIOUsPjA+ta5+KpQS/1PGd4a
 6Gnkz1wXnBKeqzwMvDigVYumjDCAwYsidxEZWqdBh7TKrUTkd4l7G8zr49z3OGDsG4fS
 +69e6QXsHcqlnpyMFgHTWXUxduF94uz/XNZpCl0p0KRkINgeP+qZinq+X1M2z0xB8SPn
 5IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srhOwuidztikFpixZQyg0Vzk4eB1h7NgpSmrvqRs1Zk=;
 b=LtBKuoc4uMcBbA/kdcTvqY4Pt+ks17Nea4RT4i/n3/9cjYBAM2mMJwmWGkZEc7Knxi
 ztYD78598S8Ie1/bT/vXvAvaMdEGjYZ936ihKhDLFyxardFt440HY7pkatgCvWjOvD7p
 WH2jIeUrehBPiev4+hXT2FpFMdvZ3UGWYxyGzjkPfXnWqXV03+aJ+loVZpjSVBZf+3sQ
 gbXTR0kGAlsGDdHxxO9Cb/yUZENdeUu21DUUMxVIm5dY3nTcu0O6dVvxWgIGWHy8nU/w
 b7KWW1DpxOOceAdJSglZGYhJlM/aVQSrl7wGLL8qC6crURnBJjd0jTlXaQc4c4dl+OZD
 8+Fw==
X-Gm-Message-State: AOAM532rd9KRjqCkBoDxiE7mVzY8gmc8x+ixR3Yik4m0uCcg1SHMQSPx
 DBa41l3JTIgcFpZYthSCdeB7qLcPxIv1WOOwLxpWBA==
X-Google-Smtp-Source: ABdhPJwY/RhJ47DmSjTUaC1fcJ5rN8qNMe+b5OkKvTN+BUbWvgI8Ku7Oapn60sHyFRuJXysEJHZpoNNMg05Y1lSFdtk=
X-Received: by 2002:a17:906:9756:: with SMTP id
 o22mr28283217ejy.324.1639173201922; 
 Fri, 10 Dec 2021 13:53:21 -0800 (PST)
MIME-Version: 1.0
References: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer>
 <YbOlvjkCcbp41r0e@samba.org> <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
 <YbPFaoMg4CUEkf0o@samba.org> <9da525cd-3e76-ba44-8da4-c2d69425fb3a@talpey.com>
In-Reply-To: <9da525cd-3e76-ba44-8da4-c2d69425fb3a@talpey.com>
Date: Fri, 10 Dec 2021 16:53:10 -0500
Message-ID: <CAB5c7xrwCW69ivqOPX4nHYv+FF02g0vuiT+-9F2VZCWFLubrCQ@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 4:37 PM Tom Talpey <tom@talpey.com> wrote:

> On 12/10/2021 4:23 PM, Christof Schmitt wrote:
> > On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via samba-technical
> wrote:
> >> I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
> >> retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
> >> not certain how universal this is. There being hundreds of file systems
> >> in Linux...
> >>
> >> Could Samba perhaps insert a kernel module, or use the SMB client kmod,
> >> to fetch this? It'd be ugly and will have security implications, so I
> >> would not go into it lightly.
> >
> > I missed FS_IOC_GETVERSION. That might be an option, since that is at
> > least supported on the most commonly used file systems (ext4, xfs,
> > btrfs). And if the call fails, we could log a warning, that this setup
> > might be unreliable for MacOS clients.
>
> Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we could
> cover the basics with a handful of tries.
>
> What about packing the dev_t, ino_t and generation number all into
> 64 bits, without risking a collision? I think the dev_t is needed
> unless the Samba server can guarantee the share always maps to
> exactly the same one, which seems problematic.
>
> Tom.
>

With ZFS it looks like st_gen gets populated with the znode sequence
number, which may increment unexpectedly for our purposes (for instance
when timestamps incremented). I'll double-check with our ZFS devs tomorrow.
