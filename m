Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA07CEEE8
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 00:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=FpYUIr4uxnNrHNUB/8ZlyiVvZ6HGMDOUQ0OE+dwdu+M=; b=IOjEUNWfMKltTaOO5cQyDhQwZQ
	AlcjO8FJDUYLUM9YHbWQTEMheqvPG4jXqbz3TShmagwEYAeDBz+lUDX6MLUQFBMFBxM8WPlNPLR+j
	8FUeslgV8aRtqhEqOowZ9wpoGy5sjV3TnClTpHocXu18ApUNuV1s4EbN7zJZyDV0rDiwZ4MZycGuf
	viy4VRmz4WeJZyqwu+HjZJXA5ImHxaMxKwLRRRJvXgPPhpPM5NuHZuJnxZiDTUesorPo4s2i9QudV
	p4XkibVZUH0PdmVotEwi7DfjJcst7liZER7j0Ji3Wk0e6h4C0cBlCAatBiolI73YKEj6QsFk9J8RQ
	Ge6PSp2w==;
Received: from localhost ([::1]:20728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHbED-001vku-Jo; Mon, 07 Oct 2019 22:11:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46290) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHbE8-001vki-IR
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 22:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=FpYUIr4uxnNrHNUB/8ZlyiVvZ6HGMDOUQ0OE+dwdu+M=; b=Z9XQ/nU+LvO+MaHSn2yOPpxx/X
 louCoTNgREz3TIEQ/SogTHYh1HoyV3BVkUD57NSjNrIZPe+NVV9JKyjPbuLr1SGfJlArt1f1f3XDh
 ZYtNaWqjsgU9ZzFyTon5mUNS+pXftMqFwsJgHJuOHfuOEWdMuKE/epMVSV+5D1Q30X/o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHbE7-0000kA-B7; Mon, 07 Oct 2019 22:11:35 +0000
Date: Mon, 7 Oct 2019 15:11:32 -0700
To: Anoop C S <anoopcs@cryptolab.net>, samba-technical@lists.samba.org,
 asn@samba.org, gd@samba.org
Subject: Re: Implementing SMB_VFS_FCNTL in Samba
Message-ID: <20191007221132.GA4163@jeremy-acer>
References: <7024afc6236a656134f867288cdb37579425e3ee.camel@cryptolab.net>
 <20190923153107.GA4325@jeremy-ThinkPad-X1>
 <98add807a4ac55e5f401522fbdfd47ddf2358d16.camel@cryptolab.net>
 <e9469e1d026b34cf46c0012a463a2fbe610ffd17.camel@cryptolab.net>
 <a71d6def280a3c6125009f3d1eafff54f8f059b4.camel@cryptolab.net>
 <cb57dbab50e84cd24fdccd75530d11d5dbd002ed.camel@cryptolab.net>
 <67b7870a-faed-78bd-8651-6e3226142e70@samba.org>
 <58c5330f19d13a00c107a7d4ddb4c365abb5e067.camel@cryptolab.net>
 <20191004175528.GF159071@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004175528.GF159071@jra4>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ping ! Can I get a second Team reviewer for Anoop's work ?

My VFS_RMDIR removal is waiting on this :-).

Thanks,

Jeremy.

On Fri, Oct 04, 2019 at 10:55:28AM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, Oct 04, 2019 at 03:17:01PM +0530, Anoop C S wrote:
> > On Fri, 2019-10-04 at 10:38 +0200, Ralph Boehme via samba-technical
> > wrote:
> > > On 10/3/19 3:20 PM, Anoop C S via samba-technical wrote:
> > > > On Thu, 2019-10-03 at 18:43 +0530, Anoop C S via samba-technical
> > > > wrote:
> > > > > OK. This should be it. I hope attached patch covers the missing
> > > > > part
> > > > > where recent fcntl() commands are detected during configure. A
> > > > > pipeline
> > > > > has been completed successfully for the attached patches.
> > > > > 
> > > > > https://gitlab.com/samba-team/devel/samba/pipelines/86263033
> > > > > 
> > > > > Reviews are appreciated.
> > > > 
> > > > Please ignore the previous version which had a typo in checking
> > > > HAVE_XX_XX inside vfs_default. Attaching the patches after
> > > > correction.
> > > 
> > > nice addition, thanks!
> > > 
> > > One nitpick and one general question.
> > > 
> > > Please don't do function calls in if expressions:
> > > 
> > > if ((val = SMB_VFS_FCNTL(fsp, F_GETFL, 0)) == -1) {
> > >     return -1;
> > > }
> > > 
> > > Instead:
> > > 
> > > val = SMB_VFS_FCNTL(fsp, F_GETFL, 0);
> > > if (val == -1) {
> > >     return -1;
> > > }
> > 
> > Right. I was also skeptical in putting it that way(frankly speaking it
> > is a copy of current set_blocking() function). :-)
> > 
> > Please see the new patch set attached.
> 
> Thanks !
> 
> > > Then, I wonder why you make a copy of va_args in the time_audit and
> > > full_audit VFS modules before calling the NEXT function. Can't we
> > > just pass the va_list on to the NEXT function?
> > 
> > Two reasons:
> > 
> > * Both SMB_VFS_FCNTL and SMB_VFS_NEXT_FCNTL invoke same
> > smb_vfs_call_fcntl() function which does a va_start() on the received
> > variable arguments. Thus if va_list is passed as variable argument to
> > SMB_VFS_NEXT_FCNTL we again end up calling va_start() on it and a
> > subsequent va_arg() would not give us the required(/original) argument.
> > This lead me to do argument extraction before passing it to
> > SMB_VFS_NEXT_FCNTL. Now here comes the next problem..
> > 
> > * This is the prominent one and I mentioned in one of my previous
> > responses in this thread. Basically the program(in our case smbd)
> > crashes when va_arg() is done directly on the received va_list without
> > duplication. Following blog tries to explain this in some detail:
> > 
> > https://julio.meroh.net/2011/09/using-vacopy-to-safely-pass-ap.html
> > 
> > It may be platform dependent but va_copy() seems to be the right way.
> 
> +1 on that. The va_XXX() calls are complex enough and implemented
> differently on enough systems such that *always* calling the expected
> macros is the only safe way to be portable on such things.
> 
> This new patchset - +1 and RB+ me. Ralph, are you also good with it ?
> 
> If so I'll push.
> 
> Thanks once again Anoop.
> 
> Jeremy.
> 

