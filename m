Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79E2E2C4
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 19:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MWNIaMWySiEVUvMuVIyFcreMIcQVI8X1ssZyjPKk5d4=; b=55JAAgNFYAvSN4Q3LKoL5ogDc9
	Eusg2cYsmXNbXpJCFghtqazAk1jfM38RRcqwUCUm6BsUWipeRQxQJoZU7FTLvBnDfTRJ6p2sGMGZ8
	LLgxvnGSFGPJYHxfzy4kcvk6nyeZ5y7lANo6oD5KXPit+vQ6c7RBXo4dgYPrRACW4TqPC4yBtbdYt
	oDH2AOnkC1n+BpNWWX8dj03kvGJ83dDenk5lK8E6Fqx/1fMR23UbIc+ZZNwT1mptp+/7rri9On0L/
	SsOXCPdmPWSenZWU65HBh34BkHVkIkfnQ3BbOVrCqni17XDpkpN3ESLnpB24bPwXIYjaAkEV073Sp
	Sq6a0/lw==;
Received: from localhost ([::1]:37676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW1yl-002Vbz-KS; Wed, 29 May 2019 17:03:07 +0000
Received: from [2a01:4f8:192:486::147:1] (port=16320 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW1yg-002Vbs-98
 for samba-technical@lists.samba.org; Wed, 29 May 2019 17:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=MWNIaMWySiEVUvMuVIyFcreMIcQVI8X1ssZyjPKk5d4=; b=va0xlnXHwdhgfbMeYLPmfQbWqo
 M7nYOERwzg012+4AX2Vf4n44hkknNcQEQfzpd19TvGGSx5nXu9AYwfzX7bn8aslcI2c7gBj4l2Cjy
 FaPXsl5jfgqSI7R+3GHZvw/lP0TGv+5m79slzPM8wgyfUy/YCI5ZF0cET7w38dURb2FI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW1yX-0004CP-PH; Wed, 29 May 2019 17:02:54 +0000
Date: Wed, 29 May 2019 10:02:50 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
Message-ID: <20190529170249.GA12186@samba.org>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
 <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
 <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org, Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 27, 2019 at 11:34:17AM +0200, Ralph Boehme wrote:
> Hi Andrew,
> 
> On 5/20/19 1:00 PM, Andrew Walker via samba-technical wrote:
>  > Thanks for the feedback and suggestions. I'll try to get this done this
> > week or next week. You are correct that ZFS has the  NFSv4.1 ACL flags, but
> > FreeBSD does not currently implement NFSv4.1 ACL inheritance. The
> > suggestion of just mapping what we receive over the wire is a good one. I
> > could probably do this for the case of Solaris and Illumos.
> > 
> > One possible alternative is that I could move this logic/lies to libsunacl
> > (the library that maps ZFS ACLs to FreeBSD ACLs) so that there won't be a
> > FreeBSD-specific parameter for vfs_zfsacl. In this case the only thing I
> > would need to add to fix disabling inheritance in samba is mapping the
> > NFSv4.1 ACL flags to control flags like gpfs does.
> > 
> > Let me know if you prefer the second approach.
> 
> Not sure if I like either of both. :)
> 
> Iirc the protected flag only comes to play client side, when Windows
> Explorer performs tree inheritance for new created ACEs. My NT ACL mind
> model is currently swapped out and not fully swapped back in, so I might
> be missing something. Jeremy?
> 
> So basically the only thing you need to implement this in the filesystem
> is storing the flag, no need to attach any semantics to it in the
> filesystem. The chmod command could be updated to honor the flag when
> appyling ACL changes in directory tree mode, not sure if how GPFS
> handles this.
> 
> Christof do you know? I guess chmod on GPFS will ignore the protected flag.

Is that the SEC_DESC_DACL_PROTECTED flag? For GPFS, gets mapped to
the ACL flag and stored in the file system ACL. There is no behavior
attached to that flag.

chmod in vfs_gpfs does not check the PROTECTED flag. We probably could
add additional logic if necessary.

Christof

