Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E30251C9D45
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 23:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CzvjfUNoAZp9XYSbg3e6DI/AfpDruyqJvrt+vpj2gy0=; b=0ukkKnqMkEmiomzlVOU381Q2w4
	z7trCUqUKHNCMXxPDlSByGv72nXxj+0P0pTjiz3XiwXmqgnJEx9JmLWD1p3DWjPqFZEuW7FmNtY3k
	TIRLOcifpnKsU8JP/d8KwmWlJCvifQH9Yx/Mzaf8prlihMDputbOnOIveu8guIVyaBAXIKccU/CiB
	LyV7XWpNua6/lMwuYgST34sHHkzxbtZ6HPcIPkija+QJvui/AmYK8ZheP1uyZl+PbfnVFLenL13+q
	0xcrcArSBW6KZEgEUXNBL8QLMnElqAJ1ERTCpNcioZ/1rdr+YJsYc/qhr4fDfu8t1MHreKpElQoJU
	q1P/FckA==;
Received: from localhost ([::1]:47010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWo5y-003BHM-3x; Thu, 07 May 2020 21:30:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65050) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWo5r-003BHF-Bb
 for samba-technical@lists.samba.org; Thu, 07 May 2020 21:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CzvjfUNoAZp9XYSbg3e6DI/AfpDruyqJvrt+vpj2gy0=; b=BIuc22f7ZWoZ7FlvvNll6XGohm
 H2w8VprqC4b9h/vpf7bWZ8F3Td/rw34a7JQOQ9HZ6NMOMKidK8iDwxYDgixAvfEIezT9mDUQznMbX
 LHgIC31YtyuTb0J0b7pLQ2dGjaDohRLbm4AVT+Z7vFzSfNI50sGnfpyvz/Vv8UadYfiwOjoIpAMVH
 szrw5mastCNQvRPUjYByQhwu2cMM+50LKO6dFmAgott8TF67hBKEMdLf8Z4nCRoxJ/wcjEGoa6KRa
 BL/Qd80UL3ZS4Ieali6TZFUbz6SwXe04nUm3sZnD6U9MzSHoZo9myMoBJ5LiU/Iq0LL31qFRSLTus
 0rceSP7fNtexg7Tf+qRV3j/DBdiiPZTcAnUrydQYxpxRbgCVKVE9gNeV75gNcPb81HwpVZJzzcyEn
 Ftk/CBBV58ZiNVrMkZyOaF3fxLeoB4oVqEkRstU1rNT+DN2nP4Fo+Atl+NL90MTODunBws59GRHr3
 fSGo8kDHPhp3kKSVFugOFg7L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWo5o-0004ou-Cr; Thu, 07 May 2020 21:30:08 +0000
Date: Thu, 7 May 2020 14:30:02 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200507213002.GG14929@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
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
 Samba Technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 06, 2020 at 03:53:26PM +0530, Anoop C S via samba-technical wrote:
> > reproduce the issue.
> 
> I could reproduce the difference in SHA256 checksum after copying a
> directory with 100 copies of test file(provided by reporter) from
> io_uring VFS module enabled share using Windows explorer(right-click-
> >copy/paste). Only 5 out of 100 files had correct checksum after copy
> operation :-/

Anoop,

I'm working on a fix for the vfs_io_uring module
to retry short reads/writes.

Do you still have your test environment so
you can test what I come up with ? I don't
have a reproducer here at home so I'll be
dependent on you to see if the fix works.

Cheers,

Jeremy.

