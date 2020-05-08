Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A61CA28B
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 07:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7eQOFCICKnHZo3J/YvkfvzPK9RFnzLKxSIm+eQbbh9w=; b=SfShizR3eYqzL6SE9SgmvSpAk4
	iUl8dksXFwcPC8cTTJPkAurddV2Yhdkl2IJBCNNXv1XPNL7BNm1hyxo/WyR9QCjPKdD+fM2l4bKrt
	0HTH/A/fTr8RytQkt8xtKW+pLzRGC00H/30XUvR1V9hnCcDhou4hPKecaN3hTC/3t5l+yaGAZJU+m
	H28FbEmqi6GR85yctqD6sJprEgn2caXNhJBLqPAslFlT/R5LSIFmVRG2rED2K7yCobYRb+yJocpI3
	nthVw/Mow1B2HREa/CFTxBxedjkjBkj/+/J7mw4zSNyLFKr/Y6w+p2hxxcbHsdGQQEN28ct0SCdtX
	0fVq1Q5Q==;
Received: from localhost ([::1]:55380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWvGl-003D6u-K3; Fri, 08 May 2020 05:09:55 +0000
Received: from latitanza.investici.org ([82.94.249.234]:55203) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWvGe-003D6n-LF
 for samba-technical@lists.samba.org; Fri, 08 May 2020 05:09:51 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id E4111120187;
 Fri,  8 May 2020 05:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1588914585;
 bh=7eQOFCICKnHZo3J/YvkfvzPK9RFnzLKxSIm+eQbbh9w=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Zsb34S1MNLOCG+DkNOj202oHfOMwZUbfgzF+z24kPzy1d3r4mbHqAxuk3qwJJYb6r
 xwOM2+NX9Oea3GabI9nor5ZY8pEC23hCNA1k6EdYOW+Ttt2V5K2F6HWxPE+3mZQQCu
 01WfMIGGH9tTo5Nss7Z4SpgH51JBGAI8lWZKN5EY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id C006E120185; Fri,  8 May 2020 05:09:43 +0000 (UTC)
Message-ID: <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>
Date: Fri, 08 May 2020 10:39:38 +0530
In-Reply-To: <20200508040711.GC3369@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer> <20200508040711.GC3369@jeremy-acer>
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

On Thu, 2020-05-07 at 21:07 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, May 07, 2020 at 02:30:02PM -0700, Jeremy Allison wrote:
> > On Wed, May 06, 2020 at 03:53:26PM +0530, Anoop C S via samba-
> > technical wrote:
> > > > reproduce the issue.
> > > 
> > > I could reproduce the difference in SHA256 checksum after copying
> > > a
> > > directory with 100 copies of test file(provided by reporter) from
> > > io_uring VFS module enabled share using Windows explorer(right-
> > > click-
> > > > copy/paste). Only 5 out of 100 files had correct checksum after
> > > > copy
> > > operation :-/
> > 
> > Anoop,
> > 
> > I'm working on a fix for the vfs_io_uring module
> > to retry short reads/writes.
> > 
> > Do you still have your test environment so
> > you can test what I come up with ? I don't
> > have a reproducer here at home so I'll be
> > dependent on you to see if the fix works.
> 
> Anoop, here is a *MASSIVELY* prototype fix
> for the io_uring short read problem. It still
> is very ugly and contain extra debugs etc.
> 
> It works for me here if I enable the JRATEST
> code that forces short reads if read_len > 4096,
> but I never was able to reproduce the Windows
> issue (my kernel isn't modern enough).
> 
> Can you test it on your Windows environment
> and see if it fixes the SHA256 checksum problem
> after copying 100 test files ?

Your patch fixes mismatch in SHA256 checksum of 100 bin files copied
using Windows explorer in my environment.

> If so I'll fix it up to be production-ready,
> (for example I think I can get rid of the
> immediate event useage) fix the pwrite case
> and then cut it onto bite-sized reviewable chunks.
> 
> Cheers,
> 
> Jeremy.


