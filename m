Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD967474929
	for <lists+samba-technical@lfdr.de>; Tue, 14 Dec 2021 18:21:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8M+FZofuPDntkk616sKfTUbeRp5o4QJpdO9m2gN5lho=; b=ieK39xo2fxREsdkcuuTdMb3Ao2
	feRICVxByYqcLBloP0x6M5Dh3Mv2e/4vDpxaAN/W73ef80koTViGA/tOuagvv0Qjo1BHT/u1GxJ4P
	n4veSNZfVcExOp4wqKPYkdOLZ4R6+oQb+dNdaogX0vwhdJDXatRh2emiHDBYK+ZY7yNZPsbE4SdUu
	I0coPWvWkJiX/awDAGkzljkKIDtFSeMJzc6XRKmaMutlKMqRCZ/krepkgwb9y6MG3ymhPDpmb4Znd
	EqoVv6NwUeq8OWif8R8esF3NpYedHhKDVTN9gS/A59UK2e27egqcod8RnodzFhdKu0VbTHNFD+bva
	ZTIrrqlA==;
Received: from ip6-localhost ([::1]:23392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxBTc-000cOD-JI; Tue, 14 Dec 2021 17:20:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33498) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxBTT-000cO3-3t
 for samba-technical@lists.samba.org; Tue, 14 Dec 2021 17:20:28 +0000
Received: by mail-ed1-x52a.google.com with SMTP id t5so65328546edd.0
 for <samba-technical@lists.samba.org>; Tue, 14 Dec 2021 09:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pdot6ZPQrdFrVUwZVZ5topo1hD5jL5vqaWJlu4tKF4o=;
 b=Nr6F84W5/IWXix3xBFh+Iq4W3GBFdo7FWAYzeHLpYJjyW+qPVuxRDlKMaPOfDsJoYq
 Xah0Urm2w+riwCKUjIsjwnv790Qmi49JbyTENN7txvYqkjhTOEWpKmseitN+BfIg4Ixj
 8R5M5o5IlZTusdbTrsiKbARiNEbc+AOqwl6Bj0a52koSZ5sYOh2w4yp19f+EAdQnd3ov
 ZtheAjNp1qs4PVq/QN4EkXBkNjFbK7+d5oKnFFLBMqFgRBq5NMDDu9ZRwEKGhdlpRwhA
 1otO7ylYK77YBnD+qSZpWHxTK5B2uynWWC8qYA5R1yaZGXReOwcE+mGHz0A+XQnTpqYk
 VElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pdot6ZPQrdFrVUwZVZ5topo1hD5jL5vqaWJlu4tKF4o=;
 b=pSJ3Ov3C+lMpu/6watRsPpodHPWXuUNwu7o81ap2W5E1j38G3XgLOI3STQ+ZBlaoRU
 vK4jCzkWSdmFwg4Ynx7w65tmBAAfsw195ffjfiI+JhzOeh6gG2x+Gzcfl5eA5eiEeiEU
 lPqx1WrFWs7QDSFev0Ns6TDAFClhxMUrUXMZaLjU4MW1vbSFWa7uK7vD2GmuKOafo22y
 NrJokjDu2whheJeF+YEGyde0AJ+dqEHsSs/cGNVVqQulJIoNS4oYY0NRL/DWsUPhSjNC
 SENOhtGATUoEaxDwY99tdXEOi9kA1cT7wQUosq3DpAoOoCGy4rOLcm4zj1t0s7Hd8Vvy
 oczg==
X-Gm-Message-State: AOAM531GxUE1OT0KTl9LlAaWmIYqdjfELlAvD1NmLP1NhnYIGsl5akRQ
 C5Pa6bl80PZL5nthmY7m/PTJpedz+U+flL9oMqu4Fw==
X-Google-Smtp-Source: ABdhPJzMWFlcY9jNJ8GzPesK3g7RLrbkUsFagmnoqbPVoTHWxDSjrZNc+8OP3qVTKru3IToxI63+MNd8UbChEQgk+K8=
X-Received: by 2002:a17:906:945:: with SMTP id
 j5mr7061666ejd.446.1639502418610; 
 Tue, 14 Dec 2021 09:20:18 -0800 (PST)
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
 <CAB5c7xrwCW69ivqOPX4nHYv+FF02g0vuiT+-9F2VZCWFLubrCQ@mail.gmail.com>
 <CAB5c7xoSz57aY3vOmNFDajTkCXnMSQ8tWp77piE171KyfB0+Cg@mail.gmail.com>
In-Reply-To: <CAB5c7xoSz57aY3vOmNFDajTkCXnMSQ8tWp77piE171KyfB0+Cg@mail.gmail.com>
Date: Tue, 14 Dec 2021 12:20:07 -0500
Message-ID: <CAB5c7xowobpTQU7mmxRdo2LGV1F7FX-WPXwUNr79w9g5nV+_zw@mail.gmail.com>
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

On Mon, Dec 13, 2021 at 3:23 PM Andrew Walker <awalker@ixsystems.com> wrote:

>
>
> On Fri, Dec 10, 2021 at 4:53 PM Andrew Walker <awalker@ixsystems.com>
> wrote:
>
>>
>>
>> On Fri, Dec 10, 2021 at 4:37 PM Tom Talpey <tom@talpey.com> wrote:
>>
>>> On 12/10/2021 4:23 PM, Christof Schmitt wrote:
>>> > On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via
>>> samba-technical wrote:
>>> >> I believe the EXT, BTRFS, XFS and a few other Linux filesystems
>>> support
>>> >> retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
>>> >> not certain how universal this is. There being hundreds of file
>>> systems
>>> >> in Linux...
>>> >>
>>> >> Could Samba perhaps insert a kernel module, or use the SMB client
>>> kmod,
>>> >> to fetch this? It'd be ugly and will have security implications, so I
>>> >> would not go into it lightly.
>>> >
>>> > I missed FS_IOC_GETVERSION. That might be an option, since that is at
>>> > least supported on the most commonly used file systems (ext4, xfs,
>>> > btrfs). And if the call fails, we could log a warning, that this setup
>>> > might be unreliable for MacOS clients.
>>>
>>> Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we could
>>> cover the basics with a handful of tries.
>>>
>>> What about packing the dev_t, ino_t and generation number all into
>>> 64 bits, without risking a collision? I think the dev_t is needed
>>> unless the Samba server can guarantee the share always maps to
>>> exactly the same one, which seems problematic.
>>>
>>> Tom.
>>>
>>
>> With ZFS it looks like st_gen gets populated with the znode sequence
>> number, which may increment unexpectedly for our purposes (for instance
>> when timestamps incremented). I'll double-check with our ZFS devs tomorrow.
>>
>
> To clarify on this, FreeBSD return inode generation in stat(2) output.
> stat.st_gen. In the case of ZFS on FreeBSD though, this value increments on
> every file change. You can view by running
> ```
> stat -f %v file
> touch file
> stat -f %v file
> ```
> This is a bug and am introducing a patch to basically populate that datum
> with the id of the transaction group in which the znode was created (which
> means that combination of st_gen and st_ino should be unique for
> filesystem). Unfortunately, this means that at least on FreeBSD the
> behavior will be unpredictable depending on the version of FreeBSD (or ZFS
> if openzfs from ports is being used for some reason). I'll check the
> behavior of ZFS on Linux later today or perhaps tomorrow.
>
> tmpfs, ffs, and a few other BSD filesystems randomize inode generation on
> file creation, which seems like it should be fine for our purposes.
>
> Andrew
>

Okay. ZFS on Linux doesn't present inode generation via FS_IOC_GETVERSION.
We've opened a PR against openzfs to add it.
To summarize the current status of using inode generation on ZFS: it
doesn't work properly on FreeBSD and Linux.

FreeBSD fix: https://github.com/openzfs/zfs/pull/12851
Linux fix: https://github.com/openzfs/zfs/pull/12856

I hope this helps somewhat for making decisions. FreeBSD case is
particularly painful.
