Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55864474E36
	for <lists+samba-technical@lfdr.de>; Tue, 14 Dec 2021 23:52:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1UQ7k1hiDEnANasfDNfUdFkEYnpme+Fm2GmNWhjs/SY=; b=kfQx5esftXKl2fwvsp7k0SFqWq
	LbEKjcoNvL9onIrYZhsQ0IH3HJfXwTVrDIQYbxHJFi7dGgou+1JpbPp5qec45GBFGBB+VE9jP9fsy
	C0I6HtI0s8mHJHJrERIAgvq5V0hkfma3es6dxDtzxYC5R2b5PEbbKyPD1up5S5zwq5t0/51c671N/
	fM2VFf+Lzr3w4wKutkQ4FMu/nphV0cNSVSKWO+Rz9cvgGrU5V98fMOM+uxKnUBsoYxcO3u3ed7mpm
	FP2hb+lcN0ZSrx3+C4i2wy2Hsf3EfSpdrJ1X7tdfpqvD8Onpya+GVNMl47cKsQf8DRBZ8VYGPAvvi
	KTadIavw==;
Received: from ip6-localhost ([::1]:25512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mxGdU-000dml-D1; Tue, 14 Dec 2021 22:51:04 +0000
Received: from fieldses.org ([2600:3c00:e000:2f7::1]:41644) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mxGdO-000dmc-Qa
 for samba-technical@lists.samba.org; Tue, 14 Dec 2021 22:51:01 +0000
Received: by fieldses.org (Postfix, from userid 2815)
 id C9DCE689F; Tue, 14 Dec 2021 17:40:45 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org C9DCE689F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
 s=default; t=1639521645;
 bh=1UQ7k1hiDEnANasfDNfUdFkEYnpme+Fm2GmNWhjs/SY=;
 h=Date:To:Cc:Subject:References:In-Reply-To:From:From;
 b=ywjnxveIdDiAg2tvyHCNeNc+Pp+GSEAHEtGyv6gSEKqJqfLHwBBetuolvbMj5/Zla
 34zAoRWoAA0bPra6s8wy5eKPAiHNNVZWiCSFfMfMX50LmtcffKAshh+e7r7L9LDPVG
 3p5Y6Gp99Wml7DyUAD1nJb0sWzHLECGFoEIZSxi4=
Date: Tue, 14 Dec 2021 17:40:45 -0500
To: Tom Talpey <tom@talpey.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <20211214224045.GB15579@fieldses.org>
References: <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: "J. Bruce Fields via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Andrew Walker <awalker@ixsystems.com>, Christof Schmitt <cs@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via samba-technical wrote:
> On 12/10/2021 2:08 PM, Christof Schmitt wrote:
> >As this thread shows, timestamps are not a universal solution.
> >In vfs_gpfs, we are able to retrieve the inode number and the inode
> >generation and use that to generate unique ids. That seems to work
> >reasonably well. But even the standard Linux statx() call does not
> >return the generation number.

I wonder why not?  Maybe it could be added.

> So that would only be solution for file
> >systems that that provide an interface to query the generation number.
> 
> I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
> retrieving the generation number via ioctl(FS_IOC_GETVERSION).

There's also name_to_handle_at() to get a filehandle, I don't know if
that's useful for your purposes.  (It can be tens of bytes long, so
you'd have to hash it and do some back-of-the-envelope calculations on
collision probabilities for the typical client cache sizes.)

> But I'm
> not certain how universal this is. There being hundreds of file systems
> in Linux...
> 
> Could Samba perhaps insert a kernel module, or use the SMB client kmod,
> to fetch this? It'd be ugly and will have security implications, so I
> would not go into it lightly.

Even if you could: it's true that there's an i_generation in the generic
struct inode, but I doubt there's any guarantee it meets your
requirements (or is even initialized to anything at all) for a given
filesystem.

(Whereas if it were added to statx then the filesystem could choose to
return it or not depending on whether it's supported.)

--b.

