Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD89411FF4
	for <lists+samba-technical@lfdr.de>; Mon, 20 Sep 2021 19:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=l4fy9bOPzbNcaK0P8jcK18JGO4Y8EyJcJepQkAb9cZM=; b=ILKTv3niR49haTCfSdnTNQJXC9
	x1dXdCnH6jPWkAqoUvu7yfZp9c/vpZnYsuHxTHNPe1/YZKE/XWtBvKgWo88O3TEXlGrY+CbLHZsA3
	LpHcElWb4ap19O+nwi9M3rBQ9N/VqcEOEj6rv5C8YUjQGGMNakXqUTcFCCaxr+d/nyYJOPG23Vl70
	ebCll8BMQnLrPy786K6gcf+YlSrBJnQmfkptYEfq5YauXUXTCjDC0qlxuC0WdxOkp7enax4rHgaoA
	aOVPPp8NxQWNYjw80D9OdVejs3F48uUhMUp1DDZM/O4cC67nzNXQ7Si1iSBjDE1cXtBgSyHTDZaBf
	3MzVKMNw==;
Received: from ip6-localhost ([::1]:63300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSNLi-00G8JQ-TO; Mon, 20 Sep 2021 17:45:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSNLd-00G8JG-5P
 for samba-technical@lists.samba.org; Mon, 20 Sep 2021 17:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=l4fy9bOPzbNcaK0P8jcK18JGO4Y8EyJcJepQkAb9cZM=; b=XrwVbnxe4yi4/uY+tlnLJLadgR
 I32sQv+aipsK+A+pxZAJbVKZ69pgsRCu3v0Qk5E3wo5WgTrkG7js1iLLu36J/ix9wnsRbwFTofYWB
 4MFzYcQxmT46/reWMwHRndACc+pfV/qny/4V1e7T0C/loALvSlA8dFyiEAhfjo/2w9OoN+otpIXuz
 IxCE9e0hENOWiC9F57Hhbw2BvpkDMZxPM1ivZwNkNPMPDSriIOKwWCpC1MsStT58lo+jfPv3E1d+m
 3+k8d3zMEQ7rSWOax0VlFiyv8QzPpj/uwDcyMCLYlNLeZjHbXQOXa5Kj7ltzPBYvg0+In/Bg8UFKw
 Nsga/P1zblRiznQmpjAt8GNqZfh4gEkOUfx9T5U7xYVamEc2gF9w1e3/CECUa8Hmv7xThcakZJH56
 m1cwPd9sIzKOMPlvyFM0f3GcmBL+0UGvJzP1ehGsgHsB7zLfXuuQexKC0z0ERvT9Ovn+DhJmgteAo
 XGH3ZlbR3PvtVEfJyqHt/YVm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mSNLb-0071br-8r; Mon, 20 Sep 2021 17:44:55 +0000
Date: Mon, 20 Sep 2021 10:44:51 -0700
To: Jeremy Allison <jra@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <20210920174450.GA28517@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
 <20210913195901.GA28442@samba.org>
 <16e822776813310d1635efa74be2455d329308a6.camel@samba.org>
 <20210914000750.GA80819@samba.org> <YT/w7hv4WIH9gwK5@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YT/w7hv4WIH9gwK5@jeremy-acer>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 05:46:38PM -0700, Jeremy Allison via samba-technical wrote:
> On Mon, Sep 13, 2021 at 05:07:50PM -0700, Christof Schmitt wrote:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/2170
> > removes the code and does some minor cleanups in related codepath.
> > 
> > Jeremy, could you take a look? Should we keep the "kernel share modes"
> > config option? Or just remove it?
> 
> I think we need to keep it, as on "normal" VFS backends
> we need a way to turn it off. I'll comment more on the MR:
> https://gitlab.com/samba-team/samba/-/merge_requests/2170

This has landed now. Would it make sense to rename the VFS flock call to
something else like "filesystem_sharemode" or "kernel_sharemode". It has
nothing to do with "flock" at this point, so it looks confusing.

Christof

