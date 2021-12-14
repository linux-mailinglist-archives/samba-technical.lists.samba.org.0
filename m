Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DC4749C6
	for <lists+samba-technical@lfdr.de>; Tue, 14 Dec 2021 18:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=s4xnMXqjMVvD1zs00JMnrTO1pufIQRHG98zjv39iO5o=; b=FjBSH1BXcBretVwQjBIcNpUyh2
	oDxXOWhzB0VwK8TS1vsKJyJzagW/ahkw+hrtxpZ+h5b8ah4iMD6HvoTWWeKhCg7q/Ob9gOWFQo6AL
	JXqHCcodVOGyl4g6W79N7kVal94CqlOhHhT0qbSx3alLIhEPqSZgdil8XxT54t420cEZwxWQsfX5C
	ULXl49oHXY4sQUAdZGTqtIhnTnWPZl9b+go0nfUGEOA7m7KN2sZCUKWAZNX8MqfTsoSCS8AG7Munm
	/TRu9R8mzAa1mifMvUt1wrhf2abkiAFg51mjsl6VHQUNhyPnj8Mq+JNbA5qrz1NjFIYwFEuOlACd7
	pGb7w7lg==;
Received: from ip6-localhost ([::1]:24084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxBlD-000cih-Dj; Tue, 14 Dec 2021 17:38:43 +0000
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
 ([173.201.193.105]:57495) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mxBl5-000ciY-TD
 for samba-technical@lists.samba.org; Tue, 14 Dec 2021 17:38:38 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id xBiomyRWF9itNxBiomqbDS; Tue, 14 Dec 2021 10:36:15 -0700
X-CMAE-Analysis: v=2.4 cv=JcZ5EWGV c=1 sm=1 tr=0 ts=61b8d60f
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=3wrpl_rMAAAA:8 a=SEc3moZ4AAAA:8 a=LOZZrQzJ7PnPOC7NP_YA:9
 a=QEXdDO2ut3YA:10 a=wVKCuHpmm_5FZbsenW_a:22 a=5oRCH6oROnRZc2VpWJZ3:22
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <7d8fb90a-6673-a5e2-0fd6-1ca05bd1928a@talpey.com>
Date: Tue, 14 Dec 2021 12:36:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
References: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
 <YbPFaoMg4CUEkf0o@samba.org>
 <9da525cd-3e76-ba44-8da4-c2d69425fb3a@talpey.com>
 <CAB5c7xrwCW69ivqOPX4nHYv+FF02g0vuiT+-9F2VZCWFLubrCQ@mail.gmail.com>
 <CAB5c7xoSz57aY3vOmNFDajTkCXnMSQ8tWp77piE171KyfB0+Cg@mail.gmail.com>
In-Reply-To: <CAB5c7xoSz57aY3vOmNFDajTkCXnMSQ8tWp77piE171KyfB0+Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAcdwYrQtmOF9I2IQybBtVCEPy/uR0XcSLjkmN6PNfOItrFZ9BrtZei2Trni8uG94g2S1OJ/H/g4SfVPu1WVpkOAFhUxnEdaGDyoHwXCCKPvIfWn0x7t
 wYU3zNvCRUrm/P0bbKdkMuAYq06WtwZxoVkAMYLLEYO+hQaQTRCA3i6JUVM4EKDP4PiZfTHbOj3l8dmT5ogFZQFF1vJ1Yd+hiqEdReL7U5VaHOpKcNRi5h8C
 xC+hqX7cqZssqgTncqq0qh7p6PL21Cfl6QQNp/6geSI=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/13/2021 3:23 PM, Andrew Walker wrote:
> 
> 
> On Fri, Dec 10, 2021 at 4:53 PM Andrew Walker <awalker@ixsystems.com 
> <mailto:awalker@ixsystems.com>> wrote:
> 
> 
> 
>     On Fri, Dec 10, 2021 at 4:37 PM Tom Talpey <tom@talpey.com
>     <mailto:tom@talpey.com>> wrote:
> 
>         On 12/10/2021 4:23 PM, Christof Schmitt wrote:
>          > On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via
>         samba-technical wrote:
>          >> I believe the EXT, BTRFS, XFS and a few other Linux
>         filesystems support
>          >> retrieving the generation number via
>         ioctl(FS_IOC_GETVERSION). But I'm
>          >> not certain how universal this is. There being hundreds of
>         file systems
>          >> in Linux...
>          >>
>          >> Could Samba perhaps insert a kernel module, or use the SMB
>         client kmod,
>          >> to fetch this? It'd be ugly and will have security
>         implications, so I
>          >> would not go into it lightly.
>          >
>          > I missed FS_IOC_GETVERSION. That might be an option, since
>         that is at
>          > least supported on the most commonly used file systems (ext4,
>         xfs,
>          > btrfs). And if the call fails, we could log a warning, that
>         this setup
>          > might be unreliable for MacOS clients.
> 
>         Looks like ZFS has its own idea, ZFS_IOC_OBJ_TO_STATS. But we could
>         cover the basics with a handful of tries.
> 
>         What about packing the dev_t, ino_t and generation number all into
>         64 bits, without risking a collision? I think the dev_t is needed
>         unless the Samba server can guarantee the share always maps to
>         exactly the same one, which seems problematic.
> 
>         Tom.
> 
> 
>     With ZFS it looks like st_gen gets populated with the znode sequence
>     number, which may increment unexpectedly for our purposes (for
>     instance when timestamps incremented). I'll double-check with our
>     ZFS devs tomorrow. 
> 
> 
> To clarify on this, FreeBSD return inode generation in stat(2) output. 
> stat.st_gen. In the case of ZFS on FreeBSD though, this value increments 
> on every file change. You can view by running

Oddly, I don't see st_gen in any online FreeBSD manpage. Totally
agree that it's useless to bump it on any file change. How wide
is the field? Historically, generation numbers were small, 8-16b.

But I do see that FreeBSD does provide an st_birthtim. That seems
like a better option, if populated?

Tom.

> ```
> stat -f %v file
> touch file
> stat -f %v file
> ```
> This is a bug and am introducing a patch to basically populate that 
> datum with the id of the transaction group in which the znode was 
> created (which means that combination of st_gen and st_ino should be 
> unique for filesystem). Unfortunately, this means that at least on 
> FreeBSD the behavior will be unpredictable depending on the version of 
> FreeBSD (or ZFS if openzfs from ports is being used for some reason). 
> I'll check the behavior of ZFS on Linux later today or perhaps tomorrow.
> 
> tmpfs, ffs, and a few other BSD filesystems randomize inode generation 
> on file creation, which seems like it should be fine for our purposes.
> 
> Andrew

