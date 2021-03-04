Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD232D598
	for <lists+samba-technical@lfdr.de>; Thu,  4 Mar 2021 15:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iIfAJdHWBZhwYJSpYfi9s5a1gSYGEXSLjfqqYEg41xA=; b=i1u3ezDVpaJmkhVStdqmIUtn1b
	bPD9FPDiVF2rMZZmleYNCOSfM9rDznp1Dgo6C6ktIEXgKt9svhoZSCaHmojrQP62hg0MjWZy3McZ0
	c5D46Vz/aX8CWiiOZCOpykE9xjrisfDUGiJGEFxFG8T8tN1DSkgiB4qhDvNadUlqQuHcDLH8dmrlB
	gEvcKmXlo4PP0ViYwdPHTHN0Pg5DgeNKv/0jqbW5SUuhYyPPvNuUu4lvZUBnHVnh2rP/bvh4gfZuJ
	pJzK2N7J1BU1IhKERxMh5pylDZDH7+jDi/htSoqg/NnGelPc4usVd1Al8ARJgM8X80Jf6UHzzLlgt
	yYO2q+7g==;
Received: from ip6-localhost ([::1]:28220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHpDV-0049mG-MM; Thu, 04 Mar 2021 14:44:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHpDQ-0049m9-0A
 for samba-technical@lists.samba.org; Thu, 04 Mar 2021 14:44:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id jt13so49943362ejb.0
 for <samba-technical@lists.samba.org>; Thu, 04 Mar 2021 06:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h62yfqiomizs8IfJD7t+SldwTdNdHagObTdcTmqxaiQ=;
 b=PWbgkXrjmsDNj+bSQDkGUpI4CBUrbwgcnkfiC+Agg3n2CaM8xfzaVrhieMX9QwQ/p3
 ovkq7YlVEMF1HXTs7URb7R3WILydWl6Cp+6IqzMVVkR71Gjjp+wt05jOVhUaOs6JHb5j
 RUZPLEeYLNFqzOMGVwK6hjnSToAxt3LKj371Jm1emKesNAJbfw+yFsAXiagWU1oBAxoa
 hN+2M6bYyQc4PrL1Pv33m2Dm2axsWqsd82Pa8PqQqF3N/4TL5rB/AXf6fsKDwblRhibp
 85jJvG+AgO41m8RZqRNssQSTKVuPoXdKBQIwMB+IFtnhT8XYVbZsPFBe8ij+U6hoRVvT
 2cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h62yfqiomizs8IfJD7t+SldwTdNdHagObTdcTmqxaiQ=;
 b=FnqFK/Vw5dm59I6UJJ7ZwLSZmtncd0GmrVlcdISUQXxv9OeeeQU/Lh+dhB8OBcXMw3
 mBgHtpvOD1k2AxSjBGOud71dbSxc0Li2WzlwCj1997uRNnCKweMm2ZposdjvbxbjtFyB
 s70guX+z7Y8B4Nk6eD7lZoR7inJpwY1vJKoV9nrFkYcuVrS40ch9AlY7eBQeFQI1rGmq
 LUE4DOpKbSbmjpcQj3b6QnAYuofsjk6wWIYHemcRreNIBE/jbSXF0WGA0+n17j0eQvR4
 JstGov5R85gyf69NcVkGwpCNDIpZ4qy94X5j6/HuVexhryAsmMUzIZD59Y1qnqvwB41A
 q+OQ==
X-Gm-Message-State: AOAM532rIv4b1WEeAqBfwRH34Uu0dfkEgWahgvrXn4BLCxBQCZjdJB/M
 V+tEANeHlbyC7Hk8odWaw8JSrPjx0o545wjosr1xtQ==
X-Google-Smtp-Source: ABdhPJzpTjprvjKFxgKH9liLbV/MnnWJ8Uq+epeQBfImpuDB8OWASFd/EXo0mQKM7DswLA8LAdNrVmwyGxQXCBRwkIw=
X-Received: by 2002:a17:906:ae8d:: with SMTP id
 md13mr4614321ejb.275.1614869074984; 
 Thu, 04 Mar 2021 06:44:34 -0800 (PST)
MIME-Version: 1.0
References: <65d1ab99-7c0b-1fa0-b42e-bce947d9295a@talpey.com>
 <3868fb70-aba6-bb75-f831-7bff958d0ebc@samba.org>
 <4b9a8546-4be1-edb9-afc4-84798b20fba1@talpey.com>
 <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
In-Reply-To: <b40f0b6a-4c33-f9c6-8cf3-6124e952467f@talpey.com>
Date: Thu, 4 Mar 2021 09:44:24 -0500
Message-ID: <CAB5c7xr4Kr3f7v7rxP14La3QS7SL8FK_SyovqeMcevhssgjXsQ@mail.gmail.com>
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

On Thu, Mar 4, 2021 at 9:21 AM Tom Talpey via samba-technical <
samba-technical@lists.samba.org> wrote:

> Just a quick update to say that after an upgrade to Samba 4.11,
> as expected Time Machine is working fine from Big Sur. It's
> quite simple to configure, in fact - most everything flows
> from minimal added settings in smb.conf:
>
>   [global]
>     ...
>     vfs objects = fruit streams_xattr
>
>   [TimeMachine]
>     ...
>     fruit:time machine = yes
>
> mDNS doesn't appear to be functioning for some reason, so
> I've hotwired avahi-daemon to advertise the share.
>
> There are some quirks due to my use of a ZFS backend, and
> the usual set of Ubuntu package mix-and-match differences,
> which is why I'm only on 4.11 for now. I'm sorting out the
> fruit:metadata, fruit:resource and fruit:nfs_aces options
> relative to ZFS, but Time Machine appears to be not so
> sensitive to these. One thing at a time.
>
> I'll try to add something useful to the wiki later.
>
> Tom.
>
> On 3/2/2021 8:14 AM, Tom Talpey via samba-technical wrote:
> > On 3/2/2021 1:56 AM, Ralph Boehme wrote:
> >> Hi Tom!
> >>
> >> Am 3/2/21 um 4:51 AM schrieb Tom Talpey via samba-technical:
> >>> Does the 4.7.6 version of vfs_fruit support F_FULLFSYNC advertisement?
> >>> I find some mentions of earlier versions supporting F_FULLSYNC (no
> extra
> >>> "F"!), but zero mention of either fullsync or fullfsync in release
> notes
> >>> for any Samba/vfs_fruit version. Is that just a typo, in which case,
> why
> >>> is Big Sur complaining?
> >>
> >> You need at least 4.8 for this.
> >
> > Hi Ralph! I guess I figured Ubuntu would be off-by-one. :)
> > I'll upgrade, had hoped to avoid a full network forklift but
> > it's perhaps due.
> >
> > I think it would be good to refresh the wiki regarding this.
> > I did find
> >
> >
> https://wiki.samba.org/index.php/Configure_Samba_to_Work_Better_with_Mac_OS_X
> >
> > which does in fact state the 4.8 requirement in rather fine
> > print, but the page says things like "here are suggestions"
> > to "improve operability with Mac OS X", and "as far as I know".
> > I'll see if I can help improve it after I muddle through the
> > situation.
> >
> > Tom.
>
> ZFS in general doesn't have an upper-limit on size of xattrs that can be
written, but Linux kernel puts cap at 64 KiB for max xattr size.
ZFS on FreeBSD allows xattrs up to size_t bytes, but due to API limitations
(no pwrite for xattrs) you don't really want to go too crazy. I once tried
to write a 30 GiB alternate datastream to a samba share on FreeBSD and was
not satisfied with the result.
Most of stuff written about NFSv4 ACLs on ZFS don't apply to general Linux
case (acltype is POSIX there).
One ZFS dataset property that is particularly useful for Samba shares
performance-wise (for reading / writing xattrs) is xattr=sa. This attribute
is available in Linux, the FreeBSD port of zfs on linux, and base FreeBSD
IIRC in 13.
