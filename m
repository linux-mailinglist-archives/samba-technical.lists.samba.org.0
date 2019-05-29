Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 005882D2A6
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 02:01:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=s/v10TBWWF9C8aGA+RxSlp29fB0U2EDMEZt//3QBzck=; b=FnXofmggJRThppsfFOhoYOiiQ4
	8EngFjtzDKQKpS26nbmUOZNselIFmA+z56T8Jtzv42gIrIzBWcxGjOWr8GIpR2JDNP5+wEZw6SUDO
	xUKSmhdhDERv+yeh16PVnVtob2RClepnVGA+JVWE00Luu6hgETHMWDbxyfRXn3CmOlOIS8zugtYKF
	hkTB60LX+7s7LKrGXXzIkUj6odt7+wwmUM2fTLYGh+DTBuHqv8qjLs45RyE8MfzhycwqP+5Xdo8ZD
	M9P1v1s+bpf7BTf0wbQD7VbfFpiB6Pg7B7q2Z1zYOxiXs4bt55l4dHlBzN+n6TU9Krb4yliOtbEFK
	KzjB8mNA==;
Received: from localhost ([::1]:53700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVm10-002PZO-CH; Wed, 29 May 2019 00:00:22 +0000
Received: from [2a01:4f8:192:486::147:1] (port=62418 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVm0s-002PZH-6n
 for samba-technical@lists.samba.org; Wed, 29 May 2019 00:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=s/v10TBWWF9C8aGA+RxSlp29fB0U2EDMEZt//3QBzck=; b=g7WZvAg7AFkQFHw+s/NTZtiPgR
 0IvDjdvjcI55R26qXsvac5ccSBCOUMemcIFQEkVtcBH15EMdw1jZEa0qGwJ/KYmUvyx3mW/H2AqOK
 cuH4pO7aVcs6zpcV2S7o+5aosA8Wpa/x9KitucTUQ9OjIKDJpXyUupb1E5V/wWNuixvE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVm0k-0004Xv-Mg; Wed, 29 May 2019 00:00:07 +0000
Date: Tue, 28 May 2019 17:00:03 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] zfsacl: Fix ACL behavior issues with vfs_zfsacl
Message-ID: <20190529000003.GD2170@jra4>
References: <CAB5c7xr4d8oiKoeL3wYCcH860RTP3LY_FYTsBGC--ukGRiTa5A@mail.gmail.com>
 <20190517054426.aoyovsk4cwsse2li@inti>
 <CAB5c7xofY0NQMrf_UX36JHDucoN5f-N-HdPvXis3PXMRbSEQpw@mail.gmail.com>
 <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <764e0998-97b3-c47d-bbc7-73c8f748d58d@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Christof Schmitt <cs@samba.org>, Andrew Walker <awalker@ixsystems.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, May 27, 2019 at 11:34:17AM +0200, Ralph Boehme via samba-technical wrote:
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

No, I'm pretty sure you're correct there. You just need to
make sure you get it right on create.

> So basically the only thing you need to implement this in the filesystem
> is storing the flag, no need to attach any semantics to it in the
> filesystem. The chmod command could be updated to honor the flag when
> appyling ACL changes in directory tree mode, not sure if how GPFS
> handles this.
> 
> Christof do you know? I guess chmod on GPFS will ignore the protected flag.
> 
> So ideally we could convince the OpenZFS folks to add the flag and store
> it on disk. I'm still not convinced that setting the flag for any ACL
> that doesn't contain inheritable ACEs is a good idea.
> 
> Thoughts?
> -slow
> 
> -- 
> Ralph Boehme, Samba Team                https://samba.org/
> Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
> GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

pub   RSA 2048/0FBC2354 2019-05-18 Ralph Boehme <slow@samba.org>
> sub   RSA 2048/F91FA2D5 2019-05-18
> 

