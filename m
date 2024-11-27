Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BE9DA1AF
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2024 06:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Yx3Ws1+Z9YUFSrUlgt7O8F7mnV0eu74NHDXhot4qDGA=; b=iHcETG4vdFIA2wm0s8P2+bIWRE
	xHzgOrIyINkDkkcT3FgpiX9fYu4my8LJo/CnlVSRfITCALlqkyl2fKPc8dpHb6FzRvnfIBvE/WKW1
	ZhnqDEaZrYhn+66P5QUWfLWmHM7hn5e2R0wK3J0w+qY0CPCzwHfHXnDRrTHfmiLfg9R5Z9KtiUfVf
	CoAr/9koAWtBIzdmdtpgoj5xqZigv9dFCuJWJDEE6HY2IDPvqo3Pmea+dyZmTFo5FDTWvVOkCwwYn
	guba4hSTXjrX66RzBN32l2bpacyjDOscuckKJnx5/nUSo1SWEBEeQI+Zf84OEp/Tot7Cb18wUQvAD
	ANmYMeOA==;
Received: from ip6-localhost ([::1]:35936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tGAZJ-000wjj-L7; Wed, 27 Nov 2024 05:26:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52062) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGAZD-000wjb-2V
 for samba-technical@lists.samba.org; Wed, 27 Nov 2024 05:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Yx3Ws1+Z9YUFSrUlgt7O8F7mnV0eu74NHDXhot4qDGA=; b=fRLeEHmVW2ZSLkRhwHzbR7tjOt
 /rQn0FV55/q9HZFvSWhxibkCQVXvXQ2qOmC4pq9eXGWZd/duZPfqCsrMx5xWTaJ5Uo6nJnZ++SRsx
 uapy23kZFwY2CNver7YyGwyp/tcC75xibK41QNn3Bvlk+tzPx+IzjI3BRUALmDkeFvpXIu601Qa8z
 dvam66TX5AcA4aZ4uKlI42NNDnnIOqgl5vzrp2jjNjOEF7jhqKxMCpTM2v8KWfbXzYgXWfUD1pE8t
 mrFARK56xusFA7kgOD7DucktX4zmgTl4JPYYF/bq+aKCHu3aNu/BY6c9fOk/l68AbEZNCVkBY1OJ6
 FMEaEXzUXYslBZYj41o/vQpLgvALO+wxVzkzSS04reJPiE/x9HkWxx+g3Rl8tSqGMmyFjLp50uCnC
 jswT056zLCbkmIcS0Y60a2+GdrrBk/nwW0tCzFrWnXD5ZRv+4SvYmjL2fFsZJtCEuIJs9SL40sGHy
 ccj4f7o/O5ufPTKd3SDSLTRL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tGAZA-001dUG-25; Wed, 27 Nov 2024 05:26:22 +0000
Message-ID: <71cfea1803e9e86dad4734dc28ea992e4d74db80.camel@samba.org>
Subject: Re: [debian] building bundled talloc/tevent/tdb libs out of main
 samba sources
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Date: Wed, 27 Nov 2024 18:26:15 +1300
In-Reply-To: <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
References: <d033ddfb-9e93-4bdf-8cbb-ec8d0ace7702@tls.msk.ru>
 <f6a0c35c4b22bfc273b812fabdaa65e80991c3b5.camel@samba.org>
 <548706c7-22f9-4715-8fb9-90aed04b8c54@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2024-11-27 at 08:12 +0300, Michael Tokarev via samba-technical
wrote:
> 26.11.2024 23:49, Andrew Bartlett via samba-technical wrote:
> > On Tue, 2024-11-26 at 21:39 +0300, Michael Tokarev via samba-
> > technical
> > wrote:
> > > Hi!
> > > After a few times dealing with incompatibilities of older
> > > talloc/tevent/tdblibs with new samba and shipping stuff for
> > > debian
> > > backports and other olderdistributions, I decided to give it a
> > > try:
> > > to build these 3 bundled libs outof samba source, without using
> > > separate tarballs (which also lacks githistory).
> > > The result is rather simple, speaking for the packaging it's
> > > available at
> > > https://salsa.debian.org/samba-team/samba/-/merge_requests/64
> > >  - 3
> > > commitsimporting packaging for tdb, tevent and talloc libs, one
> > > by
> > > one.
> > 
> > I support this idea.
> > 
> > Rather than needing to patch the wscript files, have you tried:
> > 
> > --private-library=!tdb
> > My intention (but I didn't do any testing with the other libraries)
> > was
> > to try and have this as generic as possible, pulling any library in
> > or
> > out if needed, with only the default position being encoded in the
> > source, to help with this kind of thing.
> 
> Unfortunately this option does nothing for this kind of libraries.
> This is exactly why we had to patch ldb in debian before (when
> switched to building ldb from samba sources), in exactly the same
> way as I'm patching tdb/etc now.  And this is exactly what you
> did with ldb too, in de1ab855ee2 "lib/ldb: Always build standalone".
> 
> Without patching lib/tdb/wscript, it is always built as libsamba-
> private-tdb.so,
> with no headers installed.
> 
> Please note that currently, --private-libraries=!ldb does exactly
> nothing to the result - ldb is built as a regular public samba
> library,
> by default already. --private-libraries=ldb however, disables this
> "publicity", and builds ldb as libprivate-samba-ldb.so (with no ldb.h
> installed), - it looks like 4.21.0 WHATSNEWS.txt entry about !ldb is
> wrong.

OK.  On further memory I think that syntax required that the library be
declared as a public library first. 

> > I'm not in a position to follow up on the review, but a patch that
> > allowed this if it didn't just work I hope would be considered
> > positively upstream.
> 
> We had this patch to make ldb stand-alone for some years in debian,
> it were written before my time, by Mathieu Parent in 2021 in his
> draft series to build ldb from samba sources (which I used as a
> base for this work later).

That's how far back the suggestions to do this went.  I was involved in
suggesting this, and encouraged the effort.  It took some years to gain
consensus within the Samba Team on the approach, and then time to implement it in a way I was happy to propose upstream.  And yet it seems from the above that for ldb it still has edge cases.  Sorry about that. 

> I see nothing "uneasy" about patching this place a bit for tdb/etc,
> it's rather stright-forward, but since whole samba build system is
> rather complex, it's more difficult to do within samba.
> 
> 
> But my attempt were unsuccessful so far, as it turned out.
> 
> Once I arrange to build all 3 libs out of samba, the build system
> suddenly stops embedding rpath-private into all binaries, so the
> resulting thing, while having the same set of files, actually does
> not work, - not finding samba private libraries in libdir/samba.
> I'm investigating it now, - but again, the build system is just too
> complex and very difficult to debug, so it might take some time.
> It's something I didn't expect at all, as all other changes are
> rather simple.

That is why I'm suggesting looking at what I did for ldb, and trying to
make that more general, because we worked on some of those details.

Perhaps try what I suggested and your patch?  If you mark the library
public, it should start to do the right things.  I hope.

Regardless, thanks for all your efforts in Debian and for your care of
Samba.  We do greatly appreciate that you put time into sharing your
thoughts and difficulties in packaging Samba - this kind of feedback is
critical.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


