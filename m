Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06933277634
	for <lists+samba-technical@lfdr.de>; Thu, 24 Sep 2020 18:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4gtI1aWzcgqGjjxMD4xZVQWKewjJQ2FboKi/WnRjC/A=; b=09/xpqRvyX1ZVAJekyNTZL5UDq
	BJncITvirxRh2ZsQkEvmyKoCyAEB/p39zcSg/D3y0vSMJqedq97G3NPpRl8mleJsyL3qvOYb9pzSS
	lVBOrYGckhJTjXBfLScVjd8mdYbmMD2rGy6dwBg4A0WHvfye2GEMbDHNUtASquXlSXiNM793gEAqg
	4UdyCrasZyH93LrDx/1xVkeK0W9XFwWQlBXLybSA74glZSPMMzm7dnKa+X0gsSGHgBc4U/5T4pkvo
	e5bGu4tNGRwjc8QExZQKG7hYJuMzc6iZTJEahPUKEuErYzYkrUo3HQOt+V2zjc2W9DsbqrrM6oiz5
	5XVnMpzw==;
Received: from ip6-localhost ([::1]:52716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLTk1-0077YO-Eh; Thu, 24 Sep 2020 16:05:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLTjx-0077Y4-2a
 for samba-technical@lists.samba.org; Thu, 24 Sep 2020 16:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4gtI1aWzcgqGjjxMD4xZVQWKewjJQ2FboKi/WnRjC/A=; b=v/q5XMRw47qyRdNZ0cqs4L1aRE
 oRNeGJ3LcF+tAJrizAloxezNXLvrY6lm0eb6mDINr1rWgLIeiUK+tcnB/NNpKeX+FQT+3Z6w14W8c
 au3fjNrnJVPW7a2iLBkAJPgPvo8SC1VOl94+t1NUWKjRwj9Nb+E4PB+AJC5G7gjv88cOZoti1NGEG
 fhrZ3aei3aHqOqvF4HtFhm6FqCzZZIHIeH1Czc/p2OAE1UAab3Od/IfzAaS4BcYFTX43vokTLvAqi
 lVb8MALKIfgr/tjszqLRWvSie1DXtaL7RoFfq75ttpZRhVaZFY4pZpnay1WeEfiT5u9HbDYwPRS4m
 miJpqmtfwbplrZK+4E1wuAnR4imnn/T+jFI3CChHSFLdiQS/CuMxM12iTbUZyQEsKw3mJwdbugupG
 oOD36JMU5QGVGInA/obI0e3UgVm+txUYg0fKGqIs3c3/wGV2X5lwjxb+yeil7K7ixDGX5WUoKYS0J
 VcJkHNcSQ269aTe6qvSRb6Gv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLTjv-0006Zb-Vh; Thu, 24 Sep 2020 16:05:00 +0000
Date: Thu, 24 Sep 2020 09:04:54 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Subject: Re: Need tips on debugging assert_no_pending_aio() cores
Message-ID: <20200924160454.GA1395554@jeremy-acer>
References: <BN7PR07MB4402C07BF8C5EB753481AD53CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR07MB4402C07BF8C5EB753481AD53CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 24, 2020 at 02:44:53PM +0000, Ashok Ramakrishnan via samba-technical wrote:
> Hi:
> We use Samba on top of our user space (fuse) file system. We just recently updated to samba 4.12.6 (still in pre-release testing internally) and we are running into these smbd cores after very heavy IO load. On looking at the core, I see that there seems to be a race (or a mismatch) between the num_aio_requests accounting and the actual requests linked to the fsp structure (fsp->aio_requests)... Since we are on 4.12.6, we already have the fixes for https://bugzilla.samba.org/show_bug.cgi?id=14301. My question is, how do I debug this issue further? Is it just code inspection, adding additional debug logging? Or is there a better way?
> 
> Also, I could use some help understanding this code block in aio_del_req_from_fsp()
>         if (i == fsp->num_aio_requests) {
>                 DEBUG(1, ("req %p not found in fsp %p\n", req, fsp));
>                 return 0;
>         }
> Why is it OK to not find an aio request attached to the fsp while destructing it? Is there a valid use case where this is expected to happen? I am not sure we are running into the above code block, plan to set log level 1 to see if that is the case.. Just noticed this during code inspection and trying to understand the logic there.

That's the destructor for the lnk struct, created
as a talloc child of the outstanding tevent_req.

The fsp->aio_requests[index] can be deleted
in a SHUTDOWN_CLOSE independently of the lnk
struct, so the lnk struct needs to allow
the associated fsp->aio_requests[] value
to have been freed.

Check the code and comment in:

source3/smbd/close.c:assert_no_pending_aio()

for details.

I wrote much of this logic, so I can
help you track this down if you can reproduce
it.

