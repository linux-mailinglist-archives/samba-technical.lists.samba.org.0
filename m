Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD24735D4
	for <lists+samba-technical@lfdr.de>; Mon, 13 Dec 2021 21:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xfgF2eH4xz4YeygkdnmmWYjMJQMcskhWaTn15cqIWV0=; b=rOSnKETWBMTx+A8OiABRPiQ20c
	i3Ys6uBxvQRmg+F94/IrFEpJU5eMmHWbCn+uD81tYbZEjUPclLu0qhWjNpBlcb4noKDKRgHcSQsyx
	7YaN9MlA23+A0F72cQFnUru84tbzwyPrSINN/S+8BXwV8Di4xq6skmdvweegasLKDjgxTofD5fw0r
	JdKOpM1hZ2G/NCJFK9SZwh/IgjUbjLfCBY8eoJV0835Dg81kz2SdhbkD1pjpQB1cPgF/z/VVhHgX3
	ngryREvto0G0dvSTdO1rbIdoPiK6rQFWxEhc5BUTw1rKVAHSSJ4i8HtONG1357tneCKWfjOr8/L3N
	EjMIpl3Q==;
Received: from ip6-localhost ([::1]:27502 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mwrrV-000IcV-Fs; Mon, 13 Dec 2021 20:23:54 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mwrrO-000IcM-L1
 for samba-technical@lists.samba.org; Mon, 13 Dec 2021 20:23:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id e3so56930855edu.4
 for <samba-technical@lists.samba.org>; Mon, 13 Dec 2021 12:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtZBGynJ8qu/jpKpQybuXbo3mxhWbUpxuMZloqzRt/E=;
 b=Tf2uK+uOLp/ukIm3I+rPD+cqmh47+jp51thiShqm8Mn+QEjkZ5Ig6/Y7oSrV4QO3C9
 /KM7BAmcWj5WMn4EMDNA6vVQHaLF7/OfM/GC+9FqqCOkZ4um3BIPenLlh2OyG1KjzC16
 Quf8mFRJ5RdZh37MjXRzw5AGWEKc8JIMk8hHasZ2X1Hq90/LIsFqsLTBXmt//ciAdUfE
 jQBUou+ZquoKD5E/XfAkr/DJUcrkRhvYugPj3GQbxTYOrak5nyyN/gE/mpjOQLql30IM
 9pkTTyZMvTAqqIQ69eZ7WyTiYeuacAujKVpXE66wErVvEL7r+C1zzqUwESxp5Ez15s0T
 Jv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtZBGynJ8qu/jpKpQybuXbo3mxhWbUpxuMZloqzRt/E=;
 b=DIA9oEysWXSSNbPTvRJxUK6rID6KVn3EX34fzFK/hh5BVk4GfWdJPbcCXiiqBDrj/y
 tnyniAEx2pPph8OkZuUfge6i/w7sIWNWnkw4VKOuUZ+GX8ZYEsO3VhMrKPv4MydUpRRQ
 8RV9Vbj3i8MJnApT3IAwF0+VJt/U9qsHfe4HzcqWyUyFcYQZYT6UEeaBIaa4tXVLGX4R
 1C+UbuRQxZATXNx2l1CEdszCFKrX8P1/kqm6d7r2LFBU0y6PqaOYmUnUZxFB7shto2Ec
 VLKblhdbu/msR90ofj4/IYKz/xukNDN+EQzyrstdfIPHpYxp8ZKMKV367gVtNNF7F4xu
 qNtQ==
X-Gm-Message-State: AOAM532JUivQZDuBC1lTnF44kQp+5Dm7QPtHHCLfaGfl/yQMpNmhm5kU
 2ozgU54KpzIvdjT6rj3QeL9B8Xg1lJWT8QzGZoTDxw==
X-Google-Smtp-Source: ABdhPJw5eraPptC6ZmJtzSQQXf6Ofu1y2QvSA3g/YI57hnefN3kvt0tmwZQkr8qTiKunrBFEK556E3qv2fdj6e8ZpEQ=
X-Received: by 2002:a17:906:1499:: with SMTP id
 x25mr705576ejc.474.1639427025567; 
 Mon, 13 Dec 2021 12:23:45 -0800 (PST)
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
In-Reply-To: <CAB5c7xrwCW69ivqOPX4nHYv+FF02g0vuiT+-9F2VZCWFLubrCQ@mail.gmail.com>
Date: Mon, 13 Dec 2021 15:23:34 -0500
Message-ID: <CAB5c7xoSz57aY3vOmNFDajTkCXnMSQ8tWp77piE171KyfB0+Cg@mail.gmail.com>
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

On Fri, Dec 10, 2021 at 4:53 PM Andrew Walker <awalker@ixsystems.com> wrote:

>
>
> On Fri, Dec 10, 2021 at 4:37 PM Tom Talpey <tom@talpey.com> wrote:
>
>> On 12/10/2021 4:23 PM, Christof Schmitt wrote:
>> > On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via
>> samba-technical wrote:
>> >> I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
>> >> retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
>> >> not certain how universal this is. There being hundreds of file systems
>> >> in Linux...
>> >>
>> >> Could Samba perhaps insert a kernel module, or use the SMB client kmod,
>> >> to fetch this? It'd be ugly and will have security implications, so I
>> >> would not go into it lightly.
>> >
>> > I missed FS_IOC_GETVERSION. That might be an option, since that is at
>> > least supported on the most commonly used file systems (ext4, xfs,
>> > btrfs). And if the call fails, we could log a warning, that this setup
>> > might be unreliable for MacOS clients.
>>
>> Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we could
>> cover the basics with a handful of tries.
>>
>> What about packing the dev_t, ino_t and generation number all into
>> 64 bits, without risking a collision? I think the dev_t is needed
>> unless the Samba server can guarantee the share always maps to
>> exactly the same one, which seems problematic.
>>
>> Tom.
>>
>
> With ZFS it looks like st_gen gets populated with the znode sequence
> number, which may increment unexpectedly for our purposes (for instance
> when timestamps incremented). I'll double-check with our ZFS devs tomorrow.
>

To clarify on this, FreeBSD return inode generation in stat(2) output.
stat.st_gen. In the case of ZFS on FreeBSD though, this value increments on
every file change. You can view by running
```
stat -f %v file
touch file
stat -f %v file
```
This is a bug and am introducing a patch to basically populate that datum
with the id of the transaction group in which the znode was created (which
means that combination of st_gen and st_ino should be unique for
filesystem). Unfortunately, this means that at least on FreeBSD the
behavior will be unpredictable depending on the version of FreeBSD (or ZFS
if openzfs from ports is being used for some reason). I'll check the
behavior of ZFS on Linux later today or perhaps tomorrow.

tmpfs, ffs, and a few other BSD filesystems randomize inode generation on
file creation, which seems like it should be fine for our purposes.

Andrew
