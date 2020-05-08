Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECF1CA2AC
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 07:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sqcrqI6Lt7eWVlW2SKDg+87aQnIZEKSxS4RzleH+dnU=; b=kP9Mpqk2pJClQuMDWoTB5dxBea
	O+UDio8bvUKShrV9IuJpbC6qa1zsZu8RuD7gAhKvAHFVVnRHbNqlOvEGtVMWwODsk892BLiKw3Lq+
	dGMeyiDslI4W8i5anj/kZUpMrz/Alj+7osw6cfuYGZPj9q9EYG6er2glpc41yWDHAmRUysL27WOsa
	8g2vTsFYHxKZie24o+WTRhc+dWyYvttB28HNVVA3u8rF7+qsIkJSVql0NS1gx9Lb9s5PYkCPF0tsd
	ty+aQ/xjEpTQA5XMFhWYAchcfc1tkPXacNAG29T/601PZdFFhZhUHbS6ObG8wIX8mir9bvvpHOS8q
	kSz3lLug==;
Received: from localhost ([::1]:56124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWvcs-003DDk-GT; Fri, 08 May 2020 05:32:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWvcm-003DDd-1C
 for samba-technical@lists.samba.org; Fri, 08 May 2020 05:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=sqcrqI6Lt7eWVlW2SKDg+87aQnIZEKSxS4RzleH+dnU=; b=Y1EkYviPMKspAyZFxQ+SkjvW/x
 XWsBEBcuihCl2NWzFBLafqkiZOd/fqc/nOAG1849bNYSOxXyI1UjscW4YgapWxFBOm1feClEPgwKk
 ofXGhtjVYo32WdnHPh+iBbyZPxjr1onScHADBcjfJ18SlVZ6EhnyaQpMWp81H6JbFnq9c6gWAS92I
 4SQLUz57mxVDG6MY6YG+U446F1a6FI6o+tj7l5uTv7/RCe9fcc2nP276EvTf0f1wZy6AmOUihBIbs
 biCl7W3BjwxFQwLqK7TzlHnpIh47yNPXVPAnxBv3YHPGotw6iba6iYCTWTk3SR7EU3A+N42f8poMg
 B0kx+c23JxRpH4eMuhC4Z+Mo9BoGJkzeLEHRqFZ81aR8grTqQe/WTTRO/YsyfP1xVCmYAw7Zu6ksm
 e8I2pJ2Ax/Ojaqsv/rMlf3nqmhjy2r1eydBLR2v8m7xRj1wiwT0iK0rp1379U1sLj/ZBMRBzxS/RA
 2R8K7aRt5utLvHt2g9OSdQO8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWvcj-0008Gl-NU; Fri, 08 May 2020 05:32:38 +0000
Date: Thu, 7 May 2020 22:32:31 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508053231.GA28687@jeremy-acer>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
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

On Fri, May 08, 2020 at 10:39:38AM +0530, Anoop C S wrote:
> On Thu, 2020-05-07 at 21:07 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Thu, May 07, 2020 at 02:30:02PM -0700, Jeremy Allison wrote:
> > > On Wed, May 06, 2020 at 03:53:26PM +0530, Anoop C S via samba-
> > > technical wrote:
> > > > > reproduce the issue.
> > > > 
> > > > I could reproduce the difference in SHA256 checksum after copying
> > > > a
> > > > directory with 100 copies of test file(provided by reporter) from
> > > > io_uring VFS module enabled share using Windows explorer(right-
> > > > click-
> > > > > copy/paste). Only 5 out of 100 files had correct checksum after
> > > > > copy
> > > > operation :-/
> > > 
> > > Anoop,
> > > 
> > > I'm working on a fix for the vfs_io_uring module
> > > to retry short reads/writes.
> > > 
> > > Do you still have your test environment so
> > > you can test what I come up with ? I don't
> > > have a reproducer here at home so I'll be
> > > dependent on you to see if the fix works.
> > 
> > Anoop, here is a *MASSIVELY* prototype fix
> > for the io_uring short read problem. It still
> > is very ugly and contain extra debugs etc.
> > 
> > It works for me here if I enable the JRATEST
> > code that forces short reads if read_len > 4096,
> > but I never was able to reproduce the Windows
> > issue (my kernel isn't modern enough).
> > 
> > Can you test it on your Windows environment
> > and see if it fixes the SHA256 checksum problem
> > after copying 100 test files ?
> 
> Your patch fixes mismatch in SHA256 checksum of 100 bin files copied
> using Windows explorer in my environment.

WooHoo! Production-ready, here I come :-).

Thanks so much for testing Anoop !

