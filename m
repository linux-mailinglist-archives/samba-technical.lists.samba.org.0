Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0EC32D74F
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 17:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZqpWTPR7PwDQJaMR8E4mCKz8a5lzevlv4NmTvXakFxc=; b=kVoIByIh7mN88zmOoKZzeqcCrN
	rrNGZrgAXqeRXghBspL/6OQtAarjHlpt6icGQ8bBv51pQg8Anwy4Z2qMRVzp0NvZRLYUa+gdgQsLZ
	pUwJsMNQTV32SHtE6KuwFZrkgivvMP8wSIDe/SYVkKOZmqSqZ2RFijwSgaOdmMc7GNH16zZ10YN7d
	zRqQEWLR1l0k/jnWmt41u+X/A4+an6kWMWFhO1+C8HCrQVh/JMwVWlBtBgoRWqFBKzLK9VP0zWT+7
	OSTr17GdJkB0qrMq5RYh7Xq2yPBLkemhhVhQsuCYBORFtxpp6KMMHgv745O1JtjmC6ZFRZha7pcKU
	8EphtEgg==;
Received: from ip6-localhost ([::1]:36344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHqSy-004Ax1-QO; Thu, 04 Mar 2021 16:04:44 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39983) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHqSs-004Awt-5Z
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 16:04:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id ci14so31353248ejc.7
 for <samba-technical@lists.samba.org>; Thu, 04 Mar 2021 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wys6z0UQrjeVsoYwiKiUWunHKFPVKNXvzL/QloPBRms=;
 b=FMoeVI+4zv7Arz5tBSuP5fdtBQZOo/BrG4axcbuXwu4/VW8dQ/TbUQKGPF/7Pf9Wzm
 v6sbDVko3KAFPypnSbGU50d5mBag/zx+hpW2hE8nkcmwDyUeDjFkjZ/wT2FkKStMwtmd
 byPccdtnh77ESFbDkTOX5qbasmaYc814gQg4/c1fcP/1eshP+ReiHruPrmV5RWAf73Ju
 eYo8+/Mw+IKFC+MMx3h2jnCB081TZzim/Npd4A8UuxXXBK949wlainZOhnxX0QfPfoIV
 vcPhkg92dKaPu/y8gdAAMf+oze9GpZ6sZsoFGRZnuPfR+8y9R5+f67y6qUBei0HjYcMQ
 2XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wys6z0UQrjeVsoYwiKiUWunHKFPVKNXvzL/QloPBRms=;
 b=eKaLTex9/MtPvSEY5vTpwbgHlaFbBpQUQjC2i7pV98jcRFtyT1Qfxd+qseJMRqNwzo
 5dIcvoWHPgYen4McOkLqVVav4jTIR5ytPJbRsEbAfkmqceBmOkSO4Qe96gv78pZNPlTm
 ZkE75WAZgsb2OteSs9h9ddvjumeNcgJHefbXWWs1SeETIndPpJMkeuZd6Mdt8XClkkJ4
 lCtilo/kaDe49QwIcwNL7edfcJ4H3V5A5aJSh1Xp/zg2DI2yhizW2hzj0jnY+N4vA/JM
 1b2xcjklyAO/KM41vm7q533MX2/kBxSjx1CWrLMTaq3+ePqpq/k5ZLf4sI6+dJH4d7hC
 vaUA==
X-Gm-Message-State: AOAM532YeDiyFOvESONlMnj2CQU6siomiO+PlmQzGoFijnHQ7aXTJbZ2
 8MVyKamzSEGH/5ohDvQFEeQm2ZPGnKtcjuI93xovSg==
X-Google-Smtp-Source: ABdhPJy8GYqF7me81cd2bI9a95A1KOlNaChyT6oOhYxQK8PTpgzf49jPaTGLDv3D1pUuHGcDCiVBHU2R4BmFt/pWYwc=
X-Received: by 2002:a17:906:ecf3:: with SMTP id
 qt19mr4891663ejb.467.1614873877248; 
 Thu, 04 Mar 2021 08:04:37 -0800 (PST)
MIME-Version: 1.0
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
 <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
 <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
 <CAB5c7xr4Kr3f7v7rxP14La3QS7SL8FK_SyovqeMcevhssgjXsQ@mail.gmail.com>
 <407eb1b6-d840-d21a-0b03-0d9b1c82a045@talpey.com>
In-Reply-To: <407eb1b6-d840-d21a-0b03-0d9b1c82a045@talpey.com>
Date: Thu, 4 Mar 2021 11:04:26 -0500
Message-ID: <CAB5c7xo26nKs+tDEpfzLGGCBsqOK9you5_gLj5P_15NtCvbD5A@mail.gmail.com>
Subject: Re: TimeMachine support for Big Sur - missing F_FULLFSYNC?
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Mar 4, 2021 at 10:05 AM Tom Talpey <tom@talpey.com> wrote:

> On 3/4/2021 9:44 AM, Andrew Walker wrote:
> >
> >
> > On Thu, Mar 4, 2021 at 9:21 AM Tom Talpey via samba-technical
> > <samba-technical@lists.samba.org
> > <mailto:samba-technical@lists.samba.org>> wrote:
> >
> >     Just a quick update to say that after an upgrade to Samba 4.11,
> >     as expected Time Machine is working fine from Big Sur. It's
> >     quite simple to configure, in fact - most everything flows
> >     from minimal added settings in smb.conf:
> >
> >        [global]
> >          ...
> >          vfs objects = fruit streams_xattr
> >
> >        [TimeMachine]
> >          ...
> >          fruit:time machine = yes
> >
> >     mDNS doesn't appear to be functioning for some reason, so
> >     I've hotwired avahi-daemon to advertise the share.
> >
> >     There are some quirks due to my use of a ZFS backend, and
> >     the usual set of Ubuntu package mix-and-match differences,
> >     which is why I'm only on 4.11 for now. I'm sorting out the
> >     fruit:metadata, fruit:resource and fruit:nfs_aces options
> >     relative to ZFS, but Time Machine appears to be not so
> >     sensitive to these. One thing at a time.
> >
> >     I'll try to add something useful to the wiki later.
> >
> >     Tom.
> >
> >     On 3/2/2021 8:14 AM, Tom Talpey via samba-technical wrote:
> >      > On 3/2/2021 1:56 AM, Ralph Boehme wrote:
> >      >> Hi Tom!
> >      >>
> >      >> Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
> >      >>> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC
> >     advertisement?
> >      >>> I find some mentions of earlier versions supporting F_FULLSYNC
> >     (no extra
> >      >>> "F"!), but zero mention of either fullsync or fullfsync in
> >     release notes
> >      >>> for any Samba/vfs_fruit version. Is that just a typo, in which
> >     case, why
> >      >>> is Big Sur complaining?
> >      >>
> >      >> You need at least 4.8 for this.
> >      >
> >      > Hi Ralph! I guess I figured Ubuntu would be off-by-one. :)
> >      > I'll upgrade, had hoped to avoid a full network forklift but
> >      > it's perhaps due.
> >      >
> >      > I think it would be good to refresh the wiki regarding this.
> >      > I did find
> >      >
> >      >
> >
> https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X
> >      >
> >      > which does in fact state the 4.8 requirement in rather fine
> >      > print, but the page says things like "here are suggestions"
> >      > to "improve operability with Mac OS X", and "as far as I know".
> >      > I'll see if I can help improve it after I muddle through the
> >      > situation.
> >      >
> >      > Tom.
> >
> > ZFS in general doesn't have an upper-limit on size of xattrs that can be
> > written, but Linux kernel puts cap at 64 KiB for max xattr size.
> > ZFS on FreeBSD allows xattrs up to size_t bytes, but due to API
> > limitations (no pwrite for xattrs) you don't really want to go too
> > crazy. I once tried to write a 30 GiB alternate datastream to a samba
> > share on FreeBSD and was not satisfied with the result.
> > Most of stuff written about NFSv4 ACLs on ZFS don't apply to general
> > Linux case (acltype is POSIX there).
> > One ZFS dataset property that is particularly useful for Samba shares
> > performance-wise (for reading / writing xattrs) is xattr=sa. This
> > attribute is available in Linux, the FreeBSD port of zfs on linux, and
> > base FreeBSD IIRC in 13.
>
> My datasets have the default xattr=on. If I change that to xattr=sa,
> does that orphan the existing xattrs, I assume?
>
>    https://github.com/openzfs/zfs/issues/443
>
> No. It shouldn't orphan any xattrs. Xattrs will be preferentially stored
as SA, but both SA-based and file-based xattrs will be returned in the
xattr list. Having it enabled from the get-go ensures that samba's
DOSATTRIB and NTACL xattrs get written to the "fast" place.

Since I've only used the share for TM so far, it's not a huge big deal
> to wipe and redo, but it's not ideal. I'm not certain what important
> stuff TM shoves into them, in any case. Maybe I'll give it a shot and
> see what breaks!


>
Since this is only a time machine share for now, I wouldn't worry too much.
Slower xattr list / read performance is more of an issue when you have
normal file share.
