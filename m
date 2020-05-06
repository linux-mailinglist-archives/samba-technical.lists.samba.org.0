Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B00231C7788
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 19:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=2uC3V/gMGc0geLbCCw2n5WItILjRdpfiemIHGcFO0qs=; b=l4AZ+WFTIK+B2nKDzdSsM8uD3J
	eqKh5SIGXO8f9AAfu+/E4DmAeIrHYcBpw8/MatF6c2cXGb5H6WGsEipfxwOthvdKKvXEsfya1vy0M
	wsJxQYF4IcRgx1lIzg44axo+RTycc5YNB9jvoBmnb50AO1rYG9zZt9ysUPVd0KGcOlciN0mfw89Bi
	Md5YxckyVqA0NZCka/3j4uZig4VCkAjkekHrN+n+QxXaHBhYdL2PS50vTsactaJngTcRsHbwFEZm9
	COD23RU3PKhU0OYzWlYeR7+Oyn4Pzczy+DvFjv3QIitbFzBIp/iUcorbZvxmA6f/Om47Tm5azx57w
	YoZiyZjQ==;
Received: from localhost ([::1]:49976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWNbk-00333D-DO; Wed, 06 May 2020 17:13:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32084) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWNbc-003335-7u
 for samba-technical@lists.samba.org; Wed, 06 May 2020 17:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=2uC3V/gMGc0geLbCCw2n5WItILjRdpfiemIHGcFO0qs=; b=SIBgQ1S3SQ5EselIzBcu6arXTH
 w9++ZhBDZN5o6afpbhz+H/sIFIgnV/18ZEcB/ZKK/AnUDBkoKNLCvWit5gMo9ZzB+p6zKpG4UAqUM
 f21jdIBKBHkIBl/NM2VsZDhGVLgepWlpoM+Gy8WitwhBa2De0sUg2/TU7FRnqHY68/Ybr9Ud/lqQo
 hfMZaFBLOGJpyVaGX9KxtQGTMPnusuDA8z3UxKlvtY4WBRLquv8y7L3ICqh7G1NeL6FuorUxuW8NW
 r1Xr2WzZ+1i1cQ1D2TmPadxlv/SY0aX/qc7U5fo9xhyn8jyhcenrmeh0jXm30NgoSxv7E2epnE2vD
 apmrJngYREEFVgmyRge+d56pkloWRIbiNfuCHlxbpq6eZM6Qj1UW2aIHjLUXuxT38tqqQMKn3VFAI
 PukHFTynGHiQ7z9PjePGIbZJATvRwB0Mj2hx4vGbTMsShKLXYRuxf7ac5fxajJA/woGDvLdhCFk5g
 qbiOjcDF85Br4fpqmdmMSU/P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWNbb-00087y-3F; Wed, 06 May 2020 17:13:11 +0000
Date: Wed, 6 May 2020 10:13:04 -0700
To: Stefan Metzmacher <metze@samba.org>, Jens Axboe <axboe@kernel.dk>,
 Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200506171304.GC3447@jeremy-acer>
References: <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <f782fc6d-0f89-dca7-3bb0-58ef8f662392@kernel.dk>
 <20200505174832.GC7920@jeremy-acer>
 <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <48c9ddf2-31a3-55f7-aa18-5b332c6be6a6@samba.org>
 <62e94d8a6cecf60cfba7e5ca083e90bc8f216d61.camel@cryptolab.net>
 <36fd1c62-abfb-931c-ac31-f6afbbb313fb@samba.org>
 <20200506170344.GA32399@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506170344.GA32399@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 06, 2020 at 10:03:44AM -0700, Jeremy Allison via samba-technical wrote:
> 
> Well we pay attention to the amount of data returned
> and only increment the next read request by the amount
> actually returned.
> 
> I'm amazed that the Windows client doesn't seem to
> check this !
> 
> > The attached test against liburing (git://git.kernel.dk/liburing) should
> > be able to demonstrate the problem. It can also be found in
> > https://github.com/metze-samba/liburing/tree/implicit-rwf-nowaithttps://github.com/metze-samba/liburing/commit/eb06dcfde747e46bd08bedf9def2e6cb536c39e3
> > 
> > 
> > I added the sqe->rw_flags = RWF_NOWAIT; line in order to demonstrate it
> > against the Ubuntu 5.3 and 5.4 kernels. They both seem to have the bug.
> > 
> > Can someone run the unmodified test/implicit-rwf_nowait against
> > a newer kernel?
> 
> Aha. I wondered about the short read issue when this
> was first reported but I could never catch it in the
> act.
> 
> If the Windows client doesn't check and the kernel
> returns short reads I guess we'll have to add logic
> similar to tstream_readv_send()/tstream_writev_send()
> that ensure all bytes requested/send actually go through
> the interface and from/into the kernel unless a read
> returns 0 (EOF) or a write returns an error.
> 
> What a pain though :-(. SMB2+ server implementors
> really need to take note that Windows clients will corrupt
> files if they get a short read/write return.
> 
> The fact that early kernels don't return short
> reads on io_uring but later kernels do makes it
> even worse :-(.
> 
> There's even an SMB2 protocol field in SMB2_READ:
> 
> "MinimumCount (4 bytes): The minimum number of bytes to be read for this operation to be
> successful. If fewer than the minimum number of bytes are read by the server, the server
> MUST return an error rather than the bytes read."
> 
> We correctly return EOF if the amount read from
> the kernel is less than SMB2_READ.MinimumCount
> so I'm guessing they're not using it or looking
> at it (or setting it to zero).
> 
> MinimumCount is supposed to allow the client to cope with
> this. Anoop, do you have wireshark traces so we can
> see what the Windows clients are setting here ?

Just did a quick check myself and Windows10 clients
are setting Minimumcount==0 on read, so any amount
should be good here.

