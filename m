Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0180474A04
	for <lists+samba-technical@lfdr.de>; Tue, 14 Dec 2021 18:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XWgtUii97qBy45CrHzQ78DczIduFq6HWc4Q8dhJ2Mm8=; b=pp3LK2waeqsLVcEXlYtYrKLKpe
	G3RDESXFCW9eGa8PsiZ6v5YQZ4Fe1cVBWQRhRefm3HjJubkqsDAadsi7dklUvBLZxroAEZcdw10G6
	33YQIfSLsL/qC98bo6AyVasHuTj/JuNl4yNrDZ/pdMgqWdJycYsl3c0qadDiUpg7C5OvgTXcAIJuR
	ocuO8MLhI5m8IT83Cq2bHT9l6jMMLsACqtR6uVGlwG+c5+jW1vpRSAADBo24f8MPcQT035hdgGvuO
	cugAiJ2w3oGcpJOjxi1QbjWwaAnkL2o25RtBiABnbehgtd1oSpor34LQpd6RpXkSs+nMb7y868gHo
	ZHs9roXg==;
Received: from ip6-localhost ([::1]:24766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxBti-000d1q-UR; Tue, 14 Dec 2021 17:47:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mxBtc-000d1g-3z
 for samba-technical@lists.samba.org; Tue, 14 Dec 2021 17:47:27 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o20so66202310eds.10
 for <samba-technical@lists.samba.org>; Tue, 14 Dec 2021 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zls98WkVJFgwPl1yOIRI0PIJGorv8PsUexT2PkhyM94=;
 b=CDy9w49uj0BOyQIvKi9QAsRKfFqDaOieUCQC6nIiL/vHwCxqc8Hv/ycPlcM+APb3xR
 gKTTgM2BdL7YWwPI6iQR8ZjdRZ43k/h8MIhnEf/yleh13gZ+2whsxbyiVRZM3fPxTE4t
 SgRZfCFEfXw/aMRP74XiSpVLiAR48N5kLupWHFbxovfsxkbKq95WVJl/fQZcMFugjlRH
 CCKLNXHC6bXAeGMjIyEPR2ybWUDvaj51g3i5OdO0GhtmOlYi/YQ422CMESLgk8wfsg2D
 VnZ+dLvA/0Aeng6xczxgaQnhCalgC3XFP01aUmVn1RwDPNYNLJKtaHK/06QlC6q2Bx7D
 lVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zls98WkVJFgwPl1yOIRI0PIJGorv8PsUexT2PkhyM94=;
 b=NE/J+/t0Za5xaF3cX4e537R/PkglMcLgwUINs/j9UORYuaxEeRH6G+DFZEii8LYczm
 m7NNx75hX1wE05dbsWgPalj8tTABiICb/k47vTT00SSJ7AMP3fHqn/+oSfQl1EKSfrSO
 F1IhUZOW160JnCa/NVj+tc5QWP0ho2eo2FnpO8lEhGs45Y0/kd/f4u5CG4BNXqMw2MMz
 Q67W39uTH3GQaK2fCA6Z6qJxYxcLPXrFdM8olWoVl41QaWxjzmC0J6R5J+gHyK+0GdbF
 VGk9qLaCd0jN46VhUQjvkw84hPelIIRgA5n9tFuri9wgVfqK58BkzP9wKcAuVlSqgJBX
 GMxQ==
X-Gm-Message-State: AOAM530xUV+hnDR6aFnFZF4N9/juVdxnOaq7PAhiRei7YaBDRM0I3Jeq
 hdCjZB0YW95yEm/q8PpHMLUw7F2mmIjbA0Hl3o7t/n6NmQj5FA==
X-Google-Smtp-Source: ABdhPJzTTxR3iRCqqnj4uEQ0sT6DhRaXKf5Xh7qc8R5bTk0khLAGEm8xgCz+4UMsP97gEF/yo0655a98vQa9I76i2B0=
X-Received: by 2002:aa7:d288:: with SMTP id w8mr10105826edq.404.1639504043137; 
 Tue, 14 Dec 2021 09:47:23 -0800 (PST)
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
 <7d8fb90a-6673-a5e2-0fd6-1ca05bd1928a@talpey.com>
In-Reply-To: <7d8fb90a-6673-a5e2-0fd6-1ca05bd1928a@talpey.com>
Date: Tue, 14 Dec 2021 12:47:12 -0500
Message-ID: <CAB5c7xrrVQ4aRWqaq2mNGgqJS2ke7xmX5JCA9F7wHApSJurpjQ@mail.gmail.com>
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

On Tue, Dec 14, 2021 at 12:36 PM Tom Talpey <tom@talpey.com> wrote:

> On 12/13/2021 3:23 PM, Andrew Walker wrote:
> >
> >
> > On Fri, Dec 10, 2021 at 4:53 PM Andrew Walker <awalker@ixsystems.com
> > <mailto:awalker@ixsystems.com>> wrote:
> >
> >
> >
> >     On Fri, Dec 10, 2021 at 4:37 PM Tom Talpey <tom@talpey.com
> >     <mailto:tom@talpey.com>> wrote:
> >
> >         On 12/10/2021 4:23 PM, Christof Schmitt wrote:
> >          > On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via
> >         samba-technical wrote:
> >          >> I believe the EXT, BTRFS, XFS and a few other Linux
> >         filesystems support
> >          >> retrieving the generation number via
> >         ioctl(FS_IOC_GETVERSION). But I'm
> >          >> not certain how universal this is. There being hundreds of
> >         file systems
> >          >> in Linux...
> >          >>
> >          >> Could Samba perhaps insert a kernel module, or use the SMB
> >         client kmod,
> >          >> to fetch this? It'd be ugly and will have security
> >         implications, so I
> >          >> would not go into it lightly.
> >          >
> >          > I missed FS_IOC_GETVERSION. That might be an option, since
> >         that is at
> >          > least supported on the most commonly used file systems (ext4,
> >         xfs,
> >          > btrfs). And if the call fails, we could log a warning, that
> >         this setup
> >          > might be unreliable for MacOS clients.
> >
> >         Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we
> could
> >         cover the basics with a handful of tries.
> >
> >         What about packing the dev_t, ino_t and generation number all
> into
> >         64 bits, without risking a collision? I think the dev_t is needed
> >         unless the Samba server can guarantee the share always maps to
> >         exactly the same one, which seems problematic.
> >
> >         Tom.
> >
> >
> >     With ZFS it looks like st_gen gets populated with the znode sequence
> >     number, which may increment unexpectedly for our purposes (for
> >     instance when timestamps incremented). I'll double-check with our
> >     ZFS devs tomorrow.
> >
> >
> > To clarify on this, FreeBSD return inode generation in stat(2) output.
> > stat.st_gen. In the case of ZFS on FreeBSD though, this value increments
> > on every file change. You can view by running
>
> Oddly, I don't see st_gen in any online FreeBSD manpage. Totally
> agree that it's useless to bump it on any file change. How wide
> is the field? Historically, generation numbers were small, 8-16b.
>
> But I do see that FreeBSD does provide an st_birthtim. That seems
> like a better option, if populated?
>
> Tom.


```
#if defined(_WANT_FREEBSD11_STAT) || defined(_KERNEL)
struct freebsd11_stat {
        __uint32_t st_dev;              /* inode's device */
        __uint32_t st_ino;              /* inode's number */
        mode_t    st_mode;              /* inode protection mode */
        __uint16_t st_nlink;            /* number of hard links */
        uid_t     st_uid;               /* user ID of the file's owner */
        gid_t     st_gid;               /* group ID of the file's group */
        __uint32_t st_rdev;             /* device type */
        struct  timespec st_atim;       /* time of last access */
        struct  timespec st_mtim;       /* time of last data modification */
        struct  timespec st_ctim;       /* time of last file status change
*/
        off_t     st_size;              /* file size, in bytes */
        blkcnt_t st_blocks;             /* blocks allocated for file */
        blksize_t st_blksize;           /* optimal blocksize for I/O */
        fflags_t  st_flags;             /* user defined flags for file */
        __uint32_t st_gen;              /* file generation number */
        __int32_t st_lspare;
        struct timespec st_birthtim;    /* time of file creation */
        /*
         * Explicitly pad st_birthtim to 16 bytes so that the size of
         * struct stat is backwards compatible.  We use bitfields instead
         * of an array of chars so that this doesn't require a C99 compiler
         * to compile if the size of the padding is 0.  We use 2 bitfields
         * to cover up to 64 bits on 32-bit machines.  We assume that
         * CHAR_BIT is 8...
         */
        unsigned int :(8 / 2) * (16 - (int)sizeof(struct timespec));
        unsigned int :(8 / 2) * (16 - (int)sizeof(struct timespec));
};
#endif /* _WANT_FREEBSD11_STAT || _KERNEL */
```
st_gen is uint32_t. On ZFS it's returning txg in which file was created,
and so will typically be higher than you would see on an FS where number is
monotonically incrementing. On FreeBSD tmpfs and a few other FSes it is
populated via arc4random().

Birthtime on FreeBSD may be changed via utimensat(2) and futimens(2), and
so it should not be relied on to uniquely identify a file.
