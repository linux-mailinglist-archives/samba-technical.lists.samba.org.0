Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CAD1CFD6A
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 20:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=abIRnaYuMbOtD4RGAeS56BoPAugRWh7qjUaDeZ+1Cd4=; b=bU4QdOwe1FA+TvXsihvpLhxblG
	PIQ495tZ71ak+02Rj9XFSj2EYo67HmgvZWIRhmMk37f8T3cnKIr2/6uMS2ULvWy8ZDVlPhS2Yfa/a
	VuSaE2J5f9NotUYOLQ0FAkAYEj3VH/iSJwP6Wl6E3ihLzgOCsp4g8CHo/cAJWOaFCkWdqrlolCU0O
	B0WT955ndGnhnQh+nRfFAecXfE8tfJe335cNsmGIXTbFJNg7qcQAG8JxlnPQNZ8Wzrp1Z9YVcaK9o
	aKNbh7O5Lr3TEZbyXqWDJyCQHOPPKMzNQbKaaQBzqf5XLfo/N3xFeAJc4vc7xkT58/yMFgKS1B4Yo
	oB2OOb+g==;
Received: from localhost ([::1]:30000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYZm3-0049Uw-5U; Tue, 12 May 2020 18:37:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43034) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYZlx-0049Up-BE
 for samba-technical@lists.samba.org; Tue, 12 May 2020 18:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=abIRnaYuMbOtD4RGAeS56BoPAugRWh7qjUaDeZ+1Cd4=; b=nncOB66utF/Z2L5s6Weh0/HMKM
 TT4lCO+jnX6vsr7GOMr9vlHdGaERjTXv9ukHXmOHPIlc3Yd65gtHf3w9DYEmXILrnUpGQsY0fnhYF
 M3k4NoEegxLeNS+E/QsqVujo7SahN2OANCQ5v2aCMOfxo+gEvpwDcVf7NNEIwQ4lbZcqfHbydbfeN
 xC8Kc2fm3iyP99rB9+oRudfcIhlqIKwKFJFcsm1dVJ0AXpAaIBGbDfaWMglc1v9BOzR/TBhYbz/lB
 dvoViqy3HS8fmHrYAJIOjjytjFJWkkKaRScbFfEO7Zg4MF6zILsxmTSs5O9ED6Pd8r17RHxMAgFUs
 8HaG6ecp1HChqRy3gE5QUoRt7FNGzvcK4XJrT+UDviJ41PqAD4znJM6Ploe72P+53+bgICBzlNS/D
 oujJVmL1e+dz3SXyPmxJAt98AJUO2QzAWgdLeP78kMxFM7mpPYZU/rxDM3XtJFDV7n5kYjtSybibi
 d3eTEUd8Lt+9vsGyOtDgp+X2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYZlv-0008AT-Vy; Tue, 12 May 2020 18:36:56 +0000
Date: Tue, 12 May 2020 11:36:49 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200512183649.GA17994@jeremy-acer>
References: <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
 <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
 <20200509025010.GA9523@jeremy-acer>
 <ea463fd4-0670-548a-f64b-275e5250a2f2@samba.org>
 <74ef4e9e120ce50f97f8ab493f15e5530f36b847.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74ef4e9e120ce50f97f8ab493f15e5530f36b847.camel@cryptolab.net>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 12, 2020 at 12:50:02PM +0530, Anoop C S wrote:
> On Mon, 2020-05-11 at 21:54 +0200, Stefan Metzmacher via samba-
> technical wrote:
> > Am 09.05.20 um 04:50 schrieb Jeremy Allison via samba-technical:
> > > On Sat, May 09, 2020 at 12:04:55AM +0200, Stefan Metzmacher via
> > > samba-technical wrote:
> > > > Am 08.05.20 um 23:50 schrieb Jeremy Allison:
> > > > > RB+ from me if you add a comment header above the function
> > > > > as well as in the commit so it explains what it's doing.
> > > > > 
> > > > > Feel free to crib my ascii art to explain in the header
> > > > > comment too :-).
> > > > > 
> > > > > Thanks for the cleanup !
> > > > 
> > > > I'll do that on Monday.
> > > 
> > > Here's an updated version with added
> > > comments inside
> > > 
> > > [PATCH 20/29] vfs_io_uring: avoid stack recursion of
> > > vfs_io_uring_queue_run()
> > > 
> > > so I could actually (hopefully) understand
> > > it if I have to go back and look at it in 5 years time :-).
> > 
> > Thanks! I've done some experiments with offset < 0 and it's not
> > allowed
> > for SMB2 read nor write.
> > 
> > I'll post the updated patchset to the merge request shortly.
> > 
> > It would be great if someone could verify it with a 5.6 kernel.
> 
> Latest patch set[1] could successfully copy from and to vfs_io_uring
> enabled ext4 share using Windows explorer against Samba server with
> kernel v5.6.10.	SHA256 checksum of copied files matches original value.
> 
> [1] https://attachments.samba.org/attachment.cgi?id=15971

Thanks for the confirmation Anoop. I've pushed Metze's latest
patchset to master, and we can back-port to 4.12.next as soon
as it lands.

I really appreciate your help in reproducing the problem on
the latest kernels !

Jeremy.

