Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 531644F958E
	for <lists+samba-technical@lfdr.de>; Fri,  8 Apr 2022 14:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hDn6VIMsaEiC9TB/kb+iU33HZYms/qziFgqeiJIUADI=; b=aO1PBPGTSSggIDieXz/+6jIbg8
	C9U25KdQjy1a2VSySe9YrZatl/McCwX86tBNKDVzM97gFpKBWtoyTc64/vHz/3QQyVUjldMBk1Ci/
	d2ISHgZbC4IWdI8XrW6wi4iGXwuUmcyUmADAn3pMujTnsjtPQK/7Qc6bh4cWkN9z7QQcqzr0v0s/Q
	p+8qAx5VX7LnPHhPp3zUuvAxEBRDd6aMxVo2o2IfU62c6p8+nWeYreCPXWcH/1ixqSpQg75MZ1/uq
	X3QTM0OdL6PDLJ3ntMjJdchYp1HBDolipQPSFVqVnulfGeOWzOp9M6cxiGy40XKMQBwaTyXHMYpTK
	izTkD2Jw==;
Received: from ip6-localhost ([::1]:19276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncnc0-00B8XS-1p; Fri, 08 Apr 2022 12:21:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncnbs-00B8XJ-8i
 for samba-technical@lists.samba.org; Fri, 08 Apr 2022 12:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=hDn6VIMsaEiC9TB/kb+iU33HZYms/qziFgqeiJIUADI=; b=2H1u77xrWFALPf8nPCgZaJvSNJ
 Rde/F/lzjpUVNFs56unjYxg34IGZa09tbnMFe2qfD9rspsIE7kKhYeMFADVzgQPLyExIvcvlyBmc4
 dtrxuV0J+CTDzWBF4n8sqHy5pzFUEiueV19VrArqhsLjJm3w6lgQPU0uzEl1tcgt/0aA3DMYZXU+T
 y82uVucgI5tHl3hjRSuLqOfK7sTCKOV78ffsn/HLKAOMnc/Qb/YVuyUSR3zpcZlY9KnDX/0pGVtNl
 bNQlqn4nYNLx1fTjuMrlsBHYhsTek8qaoFroHWywESNMVLCbWpDys9DCYDKSf7HDrpYftaeh7dhWG
 u+m96IwA7ZtCGs95xuFChPn2j8lkO+2jsFcl125EkqqekstE1qXL7uRUppq1oqsHSqAU0064eHdpX
 R2hZjUtSePm7xNRKkNWLPlNT8U7DzJlNsv3nUqFp1JSfK9hEusNc5ieX5RiifMOyYYDlA8/gmvFOc
 UrSbBudvdqVzzRtWHZdoPqSF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncnbp-0061LL-8V; Fri, 08 Apr 2022 12:21:01 +0000
Date: Fri, 8 Apr 2022 15:20:59 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: downstream packaging of smbtorture and other testing tools
Message-ID: <YlAoq/GFlLKBwnZH@pinega.vda.li>
References: <237b5bea-9cf2-6f77-211d-908810d97953@msgid.tls.msk.ru>
 <b96e3d94078ce9751af25856e2be985951c384c1.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b96e3d94078ce9751af25856e2be985951c384c1.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On pe, 08 huhti 2022, Andrew Bartlett via samba-technical wrote:
> On Fri, 2022-04-08 at 11:25 +0300, Michael Tokarev via samba-technical
> wrote:
> > Hi!
> > 
> > In Debian, for a long time we ship samba-testsuite package which includes
> > smbtorture binary (the main part) and a few other similar tools, --
> > gentest locktest masktest ndrdump.  Apparently fedora/redhat also ships
> > a similar package.
> > 
> > I found no good usage examples for these (smbtorture manpage does not
> > make it clearly), so I asked a (seemingly simple) question about what
> > it is and how to use it.
> 
> I find the ratio between samba and samba-testsuite enlightening.  I'm
> also pretty sure the 500 users who have installed it just installed
> everything samba-*.
> 
> https://qa.debian.org/popcon-graph.php?packages=samba-testsuite+samba&show_installed=on&want_legend=on&want_ticks=on&from_date=&to_date=&hlght_date=&date_fmt=%25Y-%25m&beenhere=1
> 
> > Is this tool set useful for a linux distribution somehow?  Or maybe it
> > should be built in -enable-selftest mode only, for internal usage?
> 
> That is my suggestion, but I would love to hear from the RH folks about
> their use of the samba-test package.

We are working with assumption that we'll need those for testing
individual parts -- like vfstest can be used to test external VFS
modules and smbtorture is priceless for behavior testing against other
SMB systems.

I am more intersted in python3-samba-test where the whole Python part of
our tests is located in Fedora. In my plan is to improve Kerberos tests
to be able to run them against FreeIPA. It doesn't need much, just
fixing the setup code that it wouldn't assume being run against Samba AD
and use of ldb.

For this reason, we keep them available outside of selftest environment.

-- 
/ Alexander Bokovoy

