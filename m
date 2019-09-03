Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D5A720E
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 19:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LimGAZ5qlys5bbKLfla8wXHlvmm+jOBBo5EgiejDv4M=; b=YRIOmA3wWR0IA2PRdcOKSOZfbV
	ddnAx/mvKBxuzIQpa21lGPR2hhs7w2kPtLYAmb/HPFj0BdF0MyjjCzuKXppeETmep1pd9+I4uUJsr
	qXVq8z4lXBBZJxT+/H/SJQ2ogGEp08z3+49kEdR0CiAjS6g4NvUUt4shYXgYMLELGcL7AJ+vFwQ40
	w0ZBGNkMf/tlv1zx0Vx5RtSV+JXmNf5lagY0r++fHMchEpd5XqZVvJZKy+re8vhZ8xPGS2boYD4zS
	g9XRrRwnGyTDeYJblhle1yLc/kSNimk5JPZX+vdBQCNPHEt8F/idWT5pyCf3HGbgC1t6JH1vwXiNV
	Gm/9sCZQ==;
Received: from localhost ([::1]:61872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5D4g-003FLs-4k; Tue, 03 Sep 2019 17:58:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51388) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5D4b-003FLk-Vq
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 17:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=LimGAZ5qlys5bbKLfla8wXHlvmm+jOBBo5EgiejDv4M=; b=p1l3hQUdZbVQAsPRDwMXS7qF6a
 Z1vWERNxOGsBAR/2FLh5ozVYGdBvjeO1+Q+MlEtORxE2I7WnGZxUQUaqJX2m9xZftKeKl5V7LsQUf
 AUQkayLw/SQ6Urs3ZMAaHQuxbScGWOGd7UCPY6QTFNPOw1D+RLxqFSo5wFXQJxE3HAYQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5D4b-0004jE-60; Tue, 03 Sep 2019 17:58:33 +0000
Date: Tue, 3 Sep 2019 10:58:31 -0700
To: Abhidnya Joshi <abhidnyachirmule@gmail.com>
Subject: Re: Query about slow read performance
Message-ID: <20190903175831.GC9092@jra4>
References: <CALmqtCXzTfqrOX_rSoR5nbEqGvcO1Xeuk7a+56+uoC0nh_-Kmg@mail.gmail.com>
 <20190827235014.GB219881@jra4>
 <CALmqtCU-NfivpVAdSz74TP5MX=8o514i0CyvUNixG6Yax06j-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALmqtCU-NfivpVAdSz74TP5MX=8o514i0CyvUNixG6Yax06j-Q@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Sep 03, 2019 at 11:01:33PM +0530, Abhidnya Joshi wrote:
> Hi Jeremy,
> 
> Thanks for your reply. Yes we do see less number of credits being asked by
> problematic client compared to the other Win2k8 client.
> Is there any way to increase the number of credits client can ask for
> irrespective of tcp level delays/sizes in Win2k8?

The client is responsible for the number of
credits it requests, server is responsible for
the number of credits granted.

I wasn't easily to find a Windows registry
tunable for number of client credits requested,
but I didn't spend long searching.


> On Wed, Aug 28, 2019 at 5:20 AM Jeremy Allison <jra@samba.org> wrote:
> 
> > On Fri, Aug 23, 2019 at 12:24:34PM +0530, Abhidnya Joshi via
> > samba-technical wrote:
> > > Hi All,
> > >
> > > Recently while doing single file read testing on SMB2 from our product to
> > > Win2008 (as client), we saw some performance degradation.
> > >
> > > Although we are finding out causes in our SMB server, we can somehow see
> > > this degradation when the Win2008 got security patch applied.
> > >
> > > *2019-03 Servicing Stack Update for Windows Server 2008 R2 for x64-based
> > > Systems (KB4490628)*
> > >
> > > The performance drop is not observed for write but only for reads and the
> > > cap seen is around 260-280 Mbps. (Earlier it was around 520 Mbps). The
> > > security patch does not have anything directly related to I/O or SMB but
> > > this is what we are observing.
> > >
> > > My question here is, has anyone observed any of such problem recently
> > with
> > > Win2k8 used as client?
> >
> > Nope, this is the first I've heard of it. Can you do a comparative
> > wireshark trace between an unpatched client and a patched client
> > to look at the differences in how they're driving the server.
> >
> > Any credit changes ?
> >

