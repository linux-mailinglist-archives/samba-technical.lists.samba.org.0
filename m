Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A0470C79
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 22:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Kr+ATXJBahZ+ftJd9INORZ54Ye/fb0XFFvxgRFQlZKc=; b=A8Ee+XUxbcEDdWWGFg1N90E9ak
	EdpdBlvm9yddHkG7CQATvop0l3SWC9UBKscKlKZX7pcCegcVl64PE05reVXlSVwW4oMlVPjUEpjNJ
	c15o+oefzkvWltdC+KPhF1Xot5cdr3MOqxaw4ZTt0kjOBX+1Wc0l+Du8pGRggBvlNgnTo8g77BPQa
	EChoQaixMR5N4A89cXZ0hQB6BLMs/rWtO809SDK99LR1JscJBS8SKXn7pDetShLw2ch87sfzuhZSH
	dfrLRHuBfbpBc6avsAT2OBqdTO0GyjliBV8GWVeF139MUGg8WaAZji/zlpC27Ch4LKTQusHfykeRT
	j/ZLiVHw==;
Received: from ip6-localhost ([::1]:51110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvnN5-0057Cb-7b; Fri, 10 Dec 2021 21:24:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvnN0-0057CS-Ec
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 21:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Kr+ATXJBahZ+ftJd9INORZ54Ye/fb0XFFvxgRFQlZKc=; b=Qq4FMUezD/1HD2Lz7ByULcihsU
 bPTGgHfyLeSCeRmbIcz1RYEvQRqWiLmCCQUl/WuGhHXuhH1Yso0PB801W0q8/c22orzZP6I46PLp5
 LlVBAVqVhMc48nfMajJKLjULEXsoU/2Uh7g92eKLu1naFZBAcaxrKgxKsS66/6yOaX9VSxsxE4jat
 h+au0rayKKiISheL1qOWGRjUTuUKERxccER3N80U/LMeMJGONHNcyIvo57fkk9pMONB3DBsq0mJuZ
 Sajvdrp3CcYH372FWEvvG6jyDvLsRq609wI0lqAJwBdOOPI4G3lfjcGCEJTGIVjw5UO7iXrcuFabu
 39Cka/geeXsFtLA/S+2W5CSKlrfXH9QJbM3cE2W66SkXU6pF0Ion6b5PEiovI4Wfegr+1zR+yveRK
 BSFUMpapNP15JO9djmKiAWRNzd08wAJ71KC/w2xYkt4vG1uwCVLakcs0KGZtwQc2P6rt3z+fHkdFV
 w7T0suMOBkFpA5KAxPF9PFdY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvnMz-002EPl-Be; Fri, 10 Dec 2021 21:23:57 +0000
Date: Fri, 10 Dec 2021 14:23:54 -0700
To: Tom Talpey <tom@talpey.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbPFaoMg4CUEkf0o@samba.org>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Andrew Walker <awalker@ixsystems.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 04:04:09PM -0500, Tom Talpey via samba-technical wrote:
> I believe the EXT, BTRFS, XFS and a few other Linux filesystems support
> retrieving the generation number via ioctl(FS_IOC_GETVERSION). But I'm
> not certain how universal this is. There being hundreds of file systems
> in Linux...
> 
> Could Samba perhaps insert a kernel module, or use the SMB client kmod,
> to fetch this? It'd be ugly and will have security implications, so I
> would not go into it lightly.

I missed FS_IOC_GETVERSION. That might be an option, since that is at
least supported on the most commonly used file systems (ext4, xfs,
btrfs). And if the call fails, we could log a warning, that this setup
might be unreliable for MacOS clients.

Christof

