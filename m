Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB542D1E0B
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 00:06:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=APQnp6GEnaKBwif2rSK+EwoVChT1yncKa0mX3b1glC0=; b=BbbWHIgc1k1t25v3gmpLFEg6T2
	3qsXwCFUG5ZKk6ZVYaeIDQleTZyo3qMi8CS+9mVjaiKu2FHMK5najGHN0dogD3C8EZLXxDkewgr9Q
	wm0UbGj/ssvh1qIGDrYx3TnYR5nf5IaZY6tGeJqgjtFRd1vUGBcNYZFNRyDZLcy/E/mY1+fqHqvJ5
	MLMrQ3V5XaNV6mZutGpPEVSomV0RAXDB5VGVVP0Yg8IQ4NTLFJAGN8CvZT/DFXiA2CXVsekUrjUpq
	bBapPVUfrGBopBsDzNeRA/B9zmHhULFZ1guElfonrrk7qdTQ89+8bNc0gnQVjQ2AgswQnWZwDfQnk
	ku0iU8dg==;
Received: from ip6-localhost ([::1]:59692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmPaP-0008Al-SC; Mon, 07 Dec 2020 23:06:29 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36643) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmPaK-0008Ae-Rg
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 23:06:27 +0000
Received: by mail-il1-x12f.google.com with SMTP id j12so6682771ilk.3
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 15:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=APQnp6GEnaKBwif2rSK+EwoVChT1yncKa0mX3b1glC0=;
 b=Zy1LHhmUJzbJvM0xtAZJRGjViFlgmTAHC5HVtd40xq3bF+Lnq3ej7HpQOyAae0xbSg
 e1wpP6S2XRChU4GnmaRhibr5bKyiia3C+qh7uNH3hn2ndhgLhRtDfqIsx+pzubrP89pW
 9YXFzBZ3gp2qclGXWIo9ggeu7FJkgPS7sYtpGOp+oJU//AKKLP/HUUGS+lxxGgRDjBVP
 xEN2BqwzFD7G4XAVv++n2aB4jZVu1/sczTRULmpWkXhUTcnHegFl7ngNnLqzL9aO3yll
 mtwJpSojBeElE12rVqSjGPFr9t7qlWLEzK5chp8P3gslPJzpb9sLckO/UBbPHR2mT4qU
 Hp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=APQnp6GEnaKBwif2rSK+EwoVChT1yncKa0mX3b1glC0=;
 b=plDVNPZELBgssdQU2wUmLPrd0lWLlyuutNycpGYMq3xhsZsQeWi/shV+5diMDvDVZi
 90q2AhHbZaa0eWK8BFLioFDLVv/4NTMyI/KTCvzC64K1Giy8NmIfe2AfqQku3iCeI5mr
 h13ORAUbsgADwW7BrNjUznMassW7CnXDWN25N+49Sas5EcyOG06SoRNyWVTmgzm8Zpi/
 CCfeMKcJFetgqeOf/o2+jAu3gVFIiMoNyMU1n0Yiu+XWKtAb17NtX6MJmCjvwO/mYFV+
 mHy1uBgjgEUaENXWLKDuVGMpBMtnAat8d/FZLiy8wOa5USqqBLMOEtRQzkuC2usuQ4sM
 WpQQ==
X-Gm-Message-State: AOAM530/s0ZkL8T5ZISEW5R3w4EBRro2JT7qKn3eRSHwP8wsOHQT99c2
 5njnFuAStnMgE1rf2Y39c0UWpgNgbp8LXs6OyAuMmo+j
X-Google-Smtp-Source: ABdhPJy6FWXa5ZO+BE6Q9CHt8LuDPqlFXIe/HUay349hXWx6FKRDD8fBz/r9duYwjD6uCXE8UqqXWmJEXJ4z/Gb4/IY=
X-Received: by 2002:a92:1a0d:: with SMTP id a13mr24384757ila.109.1607382382137; 
 Mon, 07 Dec 2020 15:06:22 -0800 (PST)
MIME-Version: 1.0
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
 <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
 <CAN05THQvhxFS57zggYz_67A6pzdtztZvuy2rhTRjg5mvj-sTMQ@mail.gmail.com>
 <d01728c8-d346-4558-ab93-7eea164d60df@mtasv.net>
In-Reply-To: <d01728c8-d346-4558-ab93-7eea164d60df@mtasv.net>
Date: Tue, 8 Dec 2020 09:06:10 +1000
Message-ID: <CAN05THTimtR6+1Mr5THoZkRiG6JcKFdfOJt0E88Uz7qb0F-2yQ@mail.gmail.com>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
To: Joseph <j@gget.it>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 8, 2020 at 7:36 AM Joseph <j@gget.it> wrote:
>
> Thanks Ronnie for your answer.
>
> I've used NTFS before (ntfs-3g which uses FUSE), but it's slow on RaspberryPi (20-30 MB/s) whereas exfat can reach 70 MB/s.
> One solution would be to wait for the new ParagonSoftware open-source NTFS3 driver which will (or not?) be merged in Linux kernel.
> But I think it won't be easily available on RaspberryPi soon.
>
> So I decided to try with kernel's exfat (non-fuse) which is very fast ... except this problem.
>
> > Try adding a f.truncate(...) to set the file size after you open the
> > file but before you f.seek()
>
> You're right Ronnie: a f.truncate(1000*1000*1000) here takes 16 seconds, i.e. writing 1 GB of null bytes at 60MB/s, that sounds correct.
>
> --
>
> This is confirmed by Jeremy's analysis (via email), here is a summary obtained after looking at my logs where it gets stuck for 30+ seconds:
>
> >  smbd_do_setfilepathinfo: test/a.rar (fnum 1649140843) info_level=1020 totdata=8
>
> -> that's an SMB2 SMB_FILE_END_OF_FILE_INFORMATION call.
> -> This is going into (ultimately) vfs_set_filelen().
> ->  SMB_VFS_FTRUNCATE() call to set the length.
> -> static int vfswrap_ftruncate(vfs_handle_struct *handle, files_struct *fsp, off_t len)
> probably here? https://github.com/avati/samba/blob/master/source3/modules/vfs_default.c#L1813
>
> So two possibilities:
>
> * is there a way to set an EOF on a file descriptor on exFAT that *doesn't* do the allocation? This would require a modification in the exfat driver?

No, I don't think this is possible. exFAT just does not support the
concept of sparse files so it MUST allocate these blocks when you
change the file size.
And since it allocates blocks and makes their content visible to the
user, it MUST clear these blocks or else there would be a huge
security issue with leaking information.
(Unless the kernel would have a-priori knowledge and knowing for a
fact that these blocks are already zeroed out which would be very
hard/impossible for the kernel to know for removable media.)

Any changes for this would have to happen in exFAT since you would
need to change exFAT semantics. So I doubt it is feasible to work
around from userspace/samba.

I think a better option would be to look for other filesystems to use.
ext4?  xfs?


>
> * would it be possible to have a mode in Samba in which it never "truncates"?
>
>     [global]
>     no_truncate = yes
>
> The file size would grow when new data is appended when a file is copied (like my code in Python before, with only f.write(...)), but no truncate at all.
>
> Do you think this would be possible?
>
> Here is a linked report on the Github page of exfat-fuse: https://github.com/relan/exfat/issues/45
>

