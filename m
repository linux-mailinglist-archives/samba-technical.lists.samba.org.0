Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D35B1CA842
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 12:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Os12wVpnIS0uBHQAEKhapJ5zjdDIvoTP3lq56g9yerM=; b=iXiBZQYC/uFAFoKs8rAu+REsv+
	7sl18PoBzutc3ZA255whdEYTFCkot2EtcGED2x/YXBaaH9jOJOuanc5QUV7gaA8lvvbf3bmBSmlLB
	mUNYwWqePPgsKuNCqv5R+tVPpQgm3phfRWrthFXTFwxf42tJfYUlNMCwXmHEuoASjl0snB3wkp04e
	uMWp5PguG5P7ZpDMHtDhhWwTcR2rBEvSoUQxbXv/a/pWOYFOs6VaJPaVrQa3tXZQD0mt5QnlOck0J
	k5DU1bhbZQ2z5TiB/nSCqWRXNymzxv7wL9P8YdoXymnnvdHUyn42bVqgrumcX2qM8LrqASeDLmbtI
	6VDMZanQ==;
Received: from localhost ([::1]:58748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX098-003E7F-JG; Fri, 08 May 2020 10:22:22 +0000
Received: from devianza.investici.org ([198.167.222.108]:20727) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX08x-003E78-Iw
 for samba-technical@lists.samba.org; Fri, 08 May 2020 10:22:18 +0000
Received: from mx2.investici.org (unknown [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id 2CC13E06AA;
 Fri,  8 May 2020 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1588932329;
 bh=Os12wVpnIS0uBHQAEKhapJ5zjdDIvoTP3lq56g9yerM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=gQFdxvvB8IRBR/eQqqedXiFHAljKrwrsPb/v1a/w4WLxIdC2sG7X9E2ID7o8JU0MF
 kFbZOkuDPsEC8aLcKPJiRL2jvNeVn0iriqhgDVNDREPz1kVHeI1g8OUyuJ/x+60TFG
 3xd5G48w01AcM/4TGcN6GJWooYE5USHluBptam7o=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 1CFC5E06A9; Fri,  8 May 2020 10:05:26 +0000 (UTC)
Message-ID: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>
Date: Fri, 08 May 2020 15:32:19 +0530
In-Reply-To: <20200508062725.GB28687@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-05-07 at 23:27 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, May 08, 2020 at 10:39:38AM +0530, Anoop C S wrote:
> > Your patch fixes mismatch in SHA256 checksum of 100 bin files
> > copied
> > using Windows explorer in my environment.
> > 
> > > If so I'll fix it up to be production-ready,
> > > (for example I think I can get rid of the
> > > immediate event useage) fix the pwrite case
> > > and then cut it onto bite-sized reviewable chunks.
> 
> OK, here's the "production ready" version.
> Gets rid of the crappy immediate event.
> 
> Still doesn't fix the io_uring pwrite issue

Just to mention...

...at least copying good set of files into vfs_io_uring enabled share
using Windows explorer didn't cause any mismatch on final SHA256
checksum.

> but if can confirm that this version also fixes
> the problem (and it's a much cleaner patchset :-)

This patch set also fixes corruption with copying of files from
vfs_io_uring enabled share.

> then I'll add the pwrite fixes next and I'll
> try running in CI.

Cool.

> Then we should have a fix for io_uring in 4.12 !
> 
> Cheers,
> 
> Jeremy.


