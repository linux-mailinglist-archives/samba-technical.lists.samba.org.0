Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CE4F1FC4
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 01:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Y85ZQKW1FgRi/HQ2tM5bWkatinFC8jxxEpAIitwxiu0=; b=2WR8Vo9vbJZGo5akuo6FQx7VL5
	Q7dPgm+riywkANign10kr/YYkHEvFBXCUQyHJBbMZnMEggrXBBE9KyzcdOZqLJzvGBxr4aLVR497M
	1boARvF0mzCrEGLwCVtIm/lXPaZdcl0HyJIRih1VtDbZ3coHlyeqXCduMd+6+CQk49pj3QhYz3cGp
	fivzOlNWkkYbQdJ9teTuGKKoCVqbOjqGnwPaE8vBo3cCod0ukIzNYKHtfKSSG1dTUS+i7iBnLvi1d
	dpcgKLIm6Q/ic9BXIYb/gfP+4wH8+pPpQFYWAo7CxefjsveAPanQ+xe2YprUKvtOUM7HXtTLyQta7
	wucdqqrg==;
Received: from ip6-localhost ([::1]:49702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbVjM-009umN-Ee; Mon, 04 Apr 2022 23:03:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbVjH-009um9-BD
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 23:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Y85ZQKW1FgRi/HQ2tM5bWkatinFC8jxxEpAIitwxiu0=; b=cERnum7Ak27xQxGDj7qxQwj2fJ
 7YH628Pc0a061q3I4cfezljfPylywApdH1iXQLpvz9cmR5tlm0USxMWow6qDGes1RoFw2mi/IPSEd
 l9kyLaVyZ7uHZSA10q39MXNqbNHHjEhJi9ACWA7c1c1kNptAcc/NVttQMzouQfe/5Rkru3XrZOV0z
 gYqpYD8VaxKnURpQ6kCReZMCpV3ilnN/T2bnvBGU2CB8yn85Pgyh/ziEdU0MhRCmjQizoIJbLHSWA
 L6p1Jc/GXNB6avn9+lSE7rU5XwMXo44HIzX/XCbbQ0+9QgVXLTpWiVvagxFHV62RilYBskS5yy6HP
 2hITFL8dOLSFBk31nVRMl3Bk92HtDK1hhjUlDNcLujQPwhQydoEegwuYex74koktbu3BAs8mZw1iz
 Filvew97s3t/byjuGH7pzBYFEWrb90Px8/P9tDEbMwiNQIu7fW7jYWy+2Z3cBhtR8NFytQdCLPsOM
 u2sSzhCiJ/KnLlDlGIgV/i2p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbVjB-005JmL-GP; Mon, 04 Apr 2022 23:03:18 +0000
Message-ID: <b804e4c335c917d8eb1892d37298f66ff7e14c98.camel@samba.org>
Subject: Re: doing a test build of samba
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 05 Apr 2022 11:03:11 +1200
In-Reply-To: <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
 <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
 <81341b54-feea-514f-a2b0-3d0b4b5ffa60@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
 <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
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
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-04-05 at 01:52 +0300, Michael Tokarev wrote:
> 05.04.2022 01:31, Andrew Bartlett wrote:
> [..]
> > Samba really doesn't want to make security support promises for
> > code
> > compiled with --enable-developer or --enable-selftest.  There are
> > other
> > #ifdef things, like fault injection (root-only I think) and in the
> > past
> > we would honour more environment variables for unsafe things.
> 
> Yeah, fault injection and sleep in smbcontrol, I mentioned that.
> 
> Now when I think about this, maybe it is not just "root only" it
> _might_
> be more than that - say, different apparmor profiles or selinux
> contexts
> or containers or whatnot, but you gain control over the socket and
> you can
> do evil things. Probably still a moot point though, since other stuff
> is
> possible already. But it is still something to think about.
> 
> Overall things definitely does not look as bad as you describe.
> To *me*, - sure, I know right to nothing about it.  After all, maybe
> one day there's some new code guarded by WITH_NTVFS_FILESERVER or
> WITH_SELFTESTS by someone who didn't think some weird distribution
> enables this on production...

That is more my concern.  

> > We try not do make it horribly unsafe, but I would be disturbed if
> > a
> > major packager distributed binaries compiled that way.
> 
> So I'm back to my other question, - is it possible to build it in a
> different directory, not in ./bin[/default]/, so there's no need to
> mess up with directory renaming?

No.  This is essentially another variant on the request for an 'out of
tree build' which some folks ask for from time to time, which we don't
support (a pile of subtle but painful gotchas). 

> There is --with-selftest-prefix= but not --with-build-prefix.
> 
> And there is, apparently, this:
> 
> wscript:out = 'bin'
> ctdb/wscript:out = 'bin'
> lib/ldb/wscript:out = 'bin'
> ...
> 
> So it looks like the answer is "no" :)
> 
> I just dislike the hacking around renames or duplicating the
> source tree for different builds.. :)

Sorry.  Duplicating it sounds the most safe.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


