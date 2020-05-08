Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 927731CB7B1
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 20:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+hbCRJw9dHHPOvyQd8v/JAAHgnoehLtEprrs2HpIeiM=; b=PnIcS8tC1syFaLkcYQ8UR2fhvX
	eNFFuwbxpSOh0K4TYzKwzMlkGtUr7lSd0ToKawyvHsfv7dmzZmet85UO6Lh0sAWeBe2s4X3R6jIQf
	PIlNeCgh5DHlCN2tsVsQMfMgdvUrl+fq3KggBQDdBmD6rVNSfwQX2hyDDi3qSLpNWKeztER6KPRNh
	lccKw/752/ZbWkd38HplsOA7V2QDNtdV6g3S4eIMdohI5IdF6BAE4g1OZFeYSf7628VaZn+GR2PAK
	ggiG/oTBGS5xBsH7W7Be53iXl7crrID3AP0lGVeVu4lQsSTWC/+CHd1kUB0eUWSnCBamwgLRp+sFD
	3zaMoxew==;
Received: from localhost ([::1]:21604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX88B-003GQg-9M; Fri, 08 May 2020 18:53:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30644) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX884-003GQY-ND
 for samba-technical@lists.samba.org; Fri, 08 May 2020 18:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+hbCRJw9dHHPOvyQd8v/JAAHgnoehLtEprrs2HpIeiM=; b=jaXwqe4I1Lqz4Iuz7kPwQ+Lhjx
 sq3oHWjnCUUZeHrHJZ0eO+TMv/46VbeLkrkykRJjbygjOFM0xTX5JaVFgIiCy/iiX9VGGLvxvcKLv
 7z3RrfAzBqV8XSnIM8rzj2zSQk8LXGOivUbOB85duQbtZZEbIgcx8macBoMvnKo+8KykaCjYj2Zg0
 XoWOcQimWHvgevg9jF9kBONyCPLUbCeqJfFddl+cDODqa52p99iITGUJW50sQidh1hwkbQ5O1Wa3P
 FjOQbXqKv+6A7PivmIp9PEVA5t094MoBusN1UqjhYm/KoD4usvhb7U+jOhGPUoVwCuXfagp0j6F8Y
 1sidly1iXivfpwnk9AWvew+iJ0d6M4JyGyNc1fLWhoNi5VnSnAxS25WzUr/USoagX6MUEyyCeKZJ5
 M1AMkulxpy+4boCQ8L9rhGIW6Lex+WD18c2DR9nXHtWrKCNjudbQU8ALa7QpQ1RG9jibK3K6PbP4+
 zbwkt0rPsFeuKj+ei0DPOY/M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX883-0007p7-2p; Fri, 08 May 2020 18:53:47 +0000
Date: Fri, 8 May 2020 11:53:39 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508185339.GD26399@jeremy-acer>
References: <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
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

On Fri, May 08, 2020 at 09:35:40PM +0530, Anoop C S wrote:
>=20
> Jeremy's patch(for handling short reads) still works with updated
> kernel(v5.6.10).
>=20
> > Can you please also test the patch I posted here:
> > https://bugzilla.samba.org/show_bug.cgi?id=3D14361#c21
>=20
> Unfortunately copy failed to start with this patch set. I don't know if
> its because of updated kernel(v5.6.8 -> v5.6.10) but smbd terminated
> with SIGABRT right at the beginning of copy. I have attached backtrace
> and log file. Please have a look.

I see the problem. It's the reason I initially introduced
an immediate event, and then refactored my code to call
_vfs_io_uring_queue_run() in a loop if it returned 'need_retry'.

Metze's current code is recursive, and it's running out
of stack.

It uses:

vfs_io_uring_pread_send()
	->vfs_io_uring_pread_submit()  <-----------------------------------
		->vfs_io_uring_request_submit()                           |
			->vfs_io_uring_queue_run()                        |
                                                                          |
But inside vfs_io_uring_queue_run() once a read                           |
completes it calls:                                                       |
                                                                          |
vfs_io_uring_queue_run()                                                  |
	->vfs_io_uring_finish_req()                                       |
		->cur->completion_fn()                                    |
                                                                          |
cur->completion_fn() for pread is set to vfs_io_uring_pread_completion()  |
                                                                          |
vfs_io_uring_pread_completion()                                           |
	->vfs_io_uring_pread_submit() -------------------------------------

(the ascii art will probably only work in fixed-font text mailers
but you should get the idea).

I don't think this pattern will work. You have to exit
=66rom vfs_io_uring_queue_run() all the way out so that
you've called io_uring_cq_advance() to move the completion
queue forward before you can submit another request to
finish the short IO.

That's what my initial patch did with an immedate event,
until I got the idea of wrapping vfs_io_uring_queue_run()
inside a retry wrapper function.

I'll take a look to see if I can fix this so the short
read re-submission happens *outside* of vfs_io_uring_queue_run(),
as I think that's the only way to make this work.

Jeremy.

