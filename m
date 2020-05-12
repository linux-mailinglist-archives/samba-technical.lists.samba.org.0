Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F341CEDEF
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 09:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=mSWBcj0pcB4hyZe+9H4LOiMEUFZAsblx8f7c7t7K1hY=; b=m/b2WWtg/hvbhlUB4CdmS92Jvs
	sKU3v6Iqxo0tFOXpi+ye+LmaMW+bYuiGWg1mfEaJ31k/ag359QIOXo1rplfCeQpRMpPKtRXMrWyJD
	ewaS74Mk8tK7sbOhxwPPDvBEnCwboGMO6C+pNBurK0+yPOxfHG1Nru2a3ttM9V/MKUjY768AVB5YY
	oeaby1a485HV5EINtKk7lsgHfGQ1Jr/OHWoSKdN/WI8/KbiBHgsZic0zEFLjYRkbBV9acEzeJ8PDt
	24Bl6fda+kDnG+Rk3yhp57A3Cj2njNo/LDzEDoRgYwnklrWwq7v4d6M5JWaDyv7eYfxODejB8n2Sv
	KtoMgN7A==;
Received: from localhost ([::1]:34758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYPDQ-003vzS-J1; Tue, 12 May 2020 07:20:36 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:62031) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jYPD7-003vzL-Md
 for samba-technical@lists.samba.org; Tue, 12 May 2020 07:20:23 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 84C2612165D;
 Tue, 12 May 2020 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1589268014;
 bh=mSWBcj0pcB4hyZe+9H4LOiMEUFZAsblx8f7c7t7K1hY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=J34ZBr04tUWMr2I9HLP+MEhoRq/Z6HmmpDYW4YqX99A3GwW77cUk9GDTICF2rituE
 OeLGrzWFHxZ1qRYAwVnOV/euWsARrzxQDKRFjLlo1TfowwS+JeZ0dFnCoU9ESDCazy
 TQu0lvCb63pZRhY8+4iPJ/FKGs7j1DAR7OAYCVSY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 47BE812164F; Tue, 12 May 2020 07:20:10 +0000 (UTC)
Message-ID: <74ef4e9e120ce50f97f8ab493f15e5530f36b847.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
Date: Tue, 12 May 2020 12:50:02 +0530
In-Reply-To: <ea463fd4-0670-548a-f64b-275e5250a2f2@samba.org>
References: <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer> <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
 <20200508215055.GA2912@jeremy-acer>
 <9ba6f926-f0b5-6cd1-36f1-2ccdf1c8b5eb@samba.org>
 <20200509025010.GA9523@jeremy-acer>
 <ea463fd4-0670-548a-f64b-275e5250a2f2@samba.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-05-11 at 21:54 +0200, Stefan Metzmacher via samba-
technical wrote:
> Am 09.05.20 um 04:50 schrieb Jeremy Allison via samba-technical:
> > On Sat, May 09, 2020 at 12:04:55AM +0200, Stefan Metzmacher via
> > samba-technical wrote:
> > > Am 08.05.20 um 23:50 schrieb Jeremy Allison:
> > > > RB+ from me if you add a comment header above the function
> > > > as well as in the commit so it explains what it's doing.
> > > > 
> > > > Feel free to crib my ascii art to explain in the header
> > > > comment too :-).
> > > > 
> > > > Thanks for the cleanup !
> > > 
> > > I'll do that on Monday.
> > 
> > Here's an updated version with added
> > comments inside
> > 
> > [PATCH 20/29] vfs_io_uring: avoid stack recursion of
> > vfs_io_uring_queue_run()
> > 
> > so I could actually (hopefully) understand
> > it if I have to go back and look at it in 5 years time :-).
> 
> Thanks! I've done some experiments with offset < 0 and it's not
> allowed
> for SMB2 read nor write.
> 
> I'll post the updated patchset to the merge request shortly.
> 
> It would be great if someone could verify it with a 5.6 kernel.

Latest patch set[1] could successfully copy from and to vfs_io_uring
enabled ext4 share using Windows explorer against Samba server with
kernel v5.6.10.	SHA256 checksum of copied files matches original value.

[1] https://attachments.samba.org/attachment.cgi?id=15971



