Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422819CD97
	for <lists+samba-technical@lfdr.de>; Fri,  3 Apr 2020 01:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1JTVnAQmEeaBklnR8uh18k/ou+wIqJyNIpnL+Sq4dLM=; b=ZgNDU8jMOO0XxYm7YKN9Tuxmyc
	P1ZcmdqBOye8+LyDDzTiaOgKIa3b58292fLNOHCXCO7HF1DB6Eq5jkgAX+IQ4MQt/BDqAf98e2Fci
	+Nuh7580Qb1QAnFVhDtxTSQfPXI0kQ3pL9XbQRXx98fTeNe4JIfbiKxfCfiKqZjyrHpsLXaCYVuyi
	gzNJfl08vyoGEOQGwoZg849eof9PxhZBhPko7pV3fL1FMOWPPWDA+Ju/GRsE+oxf2zudhmJIDNHdT
	8pJxx6UL5HIDybVS50m0HYur3tRQbSHq0oOUwAnu7euok/exVc4b8sgsY1czCyJTfFgmA8ZPV3pKB
	MFI4BtFQ==;
Received: from localhost ([::1]:42076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jK9Z8-003AaF-OD; Thu, 02 Apr 2020 23:48:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27172) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jK9Z4-003Aa8-PO
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 23:48:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1JTVnAQmEeaBklnR8uh18k/ou+wIqJyNIpnL+Sq4dLM=; b=JT2JpXgwKhuInV/TpJyZ6LtWfc
 VAmHbDlKGCLRAlPfsBdM6cxD/0gEirLro9X6hcWGgW1GCZ0/tHnPuSm+7XPClkqkFoJlzxTFTZ0z2
 KMQ2eVlQMJOshYg1+auYQFF8bflO2GUIcjTqxmLSZnIq5WPMYmHsKwJYv4LJpCZKdJCulgqP0Zv/0
 VjgtALq2G82IEQIXuMitoF9kPuE9T4WS1oyeXbXz8RGSQiUvefazm6TXUcLzYeQI8zcI/5VS67kur
 zPpEIbTSwg8Whf85k4Ok+wp54urxYsvyzA8fKGfytx9wBqCH2BV8qHg5EJ+orIJD2E0S58p9Z6h+x
 4oIPWQUgDu2pHedf1cYeNLkITpjqKZwbEnz2cSorPSYXY+7WPF0gKsx1d5wgpc6QSFj/ijKySZaQB
 EZ4CzCyyshU//iwd9ABekT4q2K49knutu3AiWXu5raNgZ81yA2NUclWHZAfz/WqLB6afDffn7IH+8
 zUmDuDS4YUkW+OA9vu4QlUvz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jK9Z4-00060f-9v; Thu, 02 Apr 2020 23:48:02 +0000
Date: Fri, 3 Apr 2020 01:48:00 +0200
To: Rajendra Prajapat via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Add torture test for AsyncStartPagePrinter method in MS-PAR
Message-ID: <20200403014800.24afaf10@samba.org>
In-Reply-To: <CAMO=cWeR9+qtgES6gW=Z-0WmvDwXVotFP=xHHeHG0KDq47a2LQ@mail.gmail.com>
References: <CAMO=cWeR9+qtgES6gW=Z-0WmvDwXVotFP=xHHeHG0KDq47a2LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Rajendra Prajapat <raj.code.pra@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Thu, 2 Apr 2020 10:15:44 +0530, Rajendra Prajapat via samba-technical wrote:

> Hello everyone
> This is Rajendra Prajapat. I have written a torture test for
> MS-PAR(iremotewinspool.c) here
> <https://gitlab.com/Rajpra786/samba/-/commit/17a2b16656af5997a8f8a5c56eef91a978e578ac>,
> please verify and provide some suggestions.

Thanks for your patch! I've provided some feedback via Gitlab.

> Day before yesterday I have written a same test(same code) which passed all
> pipelines on Gitlab but in that branch I had too many commits for a single
> test and was't according to Samba guidelines so I created a new branch and
> commit with same code. But for this commit  samba-admem
> <https://gitlab.com/Rajpra786/samba/-/jobs/494918258> pipeline failed.
> Previous pipeline which passed all pipelines:
> https://gitlab.com/Rajpra786/samba/pipelines/131551644
> New pipeline which failed at samba-admem:
> https://gitlab.com/Rajpra786/samba/pipelines/131826696
> Here is the error, at which the pipeline samba-admem failed

This looks like an intermittent shared runner failure. I wouldn't worry
to much about it at this stage.

Cheers, David

