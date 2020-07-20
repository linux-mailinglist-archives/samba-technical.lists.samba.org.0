Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E482272CC
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jul 2020 01:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Lh28VeauogY1ma7Wkk6dJvvTx0TOC9moAgXwQu9lqP4=; b=qMA2m+1amSf8jR1qMuGbjlXReb
	+cqX1IZkdw/E4JgQ0b7ES2xLKaXN46B6KIJINYb7kSzf9nHwfz4IZAJjMR1gDacsu0kNjC6nr1jth
	L1njStvg09fsTiev5RR1MI1EjnNjCbAXWUgp4sNH7jSgxZFAZ2/6jeoxTqTDrBsltNvzyilQcxvmg
	z64swuJXSMGl8oRnpp1yqTGhNF8rhqlwglA/JcFjqO5n49Y/3sclvYgT0FtmkHnJd3b7IT7maf9tk
	3ubSWW+6fUCzLcQW8ULqAIvTKZcTaLIb0yK/YxQ7/DHrk4p3sIHjuz8Q0TNHH0Z1MPLnKudEm+A1Q
	8F9Yrtlg==;
Received: from localhost ([::1]:43788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxf8w-008wcs-Bn; Mon, 20 Jul 2020 23:24:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxf8o-008wcl-Ke
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 23:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Lh28VeauogY1ma7Wkk6dJvvTx0TOC9moAgXwQu9lqP4=; b=RnTbCP5kwlt96/pXpcipGC/nn8
 rzJIWQOkwV2jGIfAprML53sRPvRBulmmb6CN2TFaoFO00Ondo7ZUJ70Ki4tcpfYRiUM6Yw0A/NLRB
 oxr+7VoaZAOSnEUlBZBon/BsG5wDDUZ5Tn3EUF89LUVxFrP9ynXk2WsM4SK9vqqOw3HwhCVeljYpQ
 NbBOHPm/FilYqzr/uzKlBo013Ib/pqTDvK5q5//DP8fHDR1qG1WfwL2cXN+TLPmPMnOUARhYkMPXU
 8oO5Cip95gRrkD4Fa2Skov2Si1IaoMLshhIPSnpsas7DbS4aqBtv+mTlpNFpRcLUQ1GOljdCshyPz
 OpPqI+WI6aNJpaXuMVt7M59nDGo5A88mBKKw8MvCikP7Ar1RGiNFizCxYH/gAIms2UeiIC0KMy4To
 B2DYAafIH/tODpAFhbtJ1Wa7LBHtMYUIiC4xPlRV6B7Xjzc06zeiHDRAY8MiRICPDzMM57Wz9Gbop
 UA/IhcL4pHfLv9HTx9OFhyLB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxf8m-0006b1-1w; Mon, 20 Jul 2020 23:24:12 +0000
Message-ID: <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: David Disseldorp <ddiss@samba.org>, Ralph Boehme via samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 21 Jul 2020 11:24:03 +1200
In-Reply-To: <20200720170142.1583649f@samba.org>
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-07-20 at 17:01 +0200, David Disseldorp wrote:
> [sorry about the late response. I just returned from vacation]
> 
> Hi Ralph and Björn,

(reply below, much context retained because it is actually really
important context to this issue)

> On Mon, 13 Jul 2020 18:48:50 +0200, Ralph Boehme via samba-technical
> wrote:
> 
> > Hi all!
> > 
> > Am 7/10/20 um 9:44 PM schrieb Björn JACKE:
> > > 
> > > I tried to descibe that in the bug report. Our correct way to
> > > disable shared
> > > modules is to use --with-shared-modules='!module_name'.  That
> > > mechanism gets
> > > broken by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a. So the new
> > > option
> > > introduced by 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a is not
> > > needed and it
> > > makes our generic mechanism to disable the shared module stop
> > > working.
> > >   
> > > > and configure would just fail if dbus-1 is not available.  
> > > 
> > > that's what it currently also does. This is because in the
> > > discussion it was
> > > desired that this should be a forced enabled feature by default.
> > > Personally I
> > > would prefer forced-enabled features for developer builds if this
> > > is meant to
> > > detect failrures in autobuild. But that's another discussion. In
> > > any case
> > > configure fails (intentionally) with
> > > 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a
> > > and without 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a by default
> > > if dbus-1 is
> > > unavailable.  
> > 
> > of, what a mess! :)
> > 
> > Currently the snapper configure check is the only one of the three
> > (snapper, cephfs, glusterfs) VFS module configure options that
> > implement
> > --enable-NAME=yes "correctly" (as per --enable-XXX configure
> > semantics).
> > 
> > The other ones (ceph, glusterfs) will just silently pass if a
> > dependency
> > is missing, effectively implementing default="auto" behaviour.
> > 
> > I don't think we want all of those modules to fail with a
> > default="true", that would result in too much configure churn while
> > user's configure runs fail one after the other, forcing them to add
> > --disable-XXX to the configure invocation.
> > 
> > I guess we should just default to "auto" for all three modules.
> > 
> > Here's a MR that implements this:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/1461
> > 
> > If we decide that we really want all three modules to use and
> > enforce a
> > default value of "true", this can be achieved by merely switching
> > the
> > defaults in the above MR.
> > 
> > Thoughts?
> 
> When discussing 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a, Andrew and
> I
> both agreed that "auto" behaviour is undesirable, as it leads to the
> kinds of inconsistent build results carried in Matt's initial report
> at https://bugs.gentoo.org/721320 .
> 
> I don't feel strongly as to whether or not vfs_snapper should be
> built
> by default. https://gitlab.com/samba-team/samba/-/merge_requests/1335
> eventually saw it enabled by default, with clear documentation on how
> it can be disabled at configured time.
> 
> Given that Björn's initial complaint was with the inconsistent /
> broken
> --with-shared-modules='!module_name' behaviour, would it be okay if
> we
> just fix --with-shared-modules='!vfs_snapper' and drop
> --enable/disable-snapper?
> 
> Either way, it'd be nice to wait for Andrew's input here too.

Thanks David. 

**
I totally agree we should have consistent behaviour.  I also agree with
this approach.
**

As to 'auto' options, my position, and one that I thought we had agreed
(it was written into BUILD_SYSTEMS.txt before that was removed, now in
the wscript and source3/wscript) is that Samba should require all
'optional' libraries by default.

The reason, as seen here, is that auto behaviour creates a difficult
issue for packagers.  Because packaging is a particular skill set, and
there are a lot of small distributions most of our packagers (with
exceptions of course) are not Samba experts.  The lack of a build
output (eg a .so) may be the only indication they get that a feature
has vanished when they package a new version of Samba.  

This is why auto-magic dependencies are a problem, even for non-
developer builds.

This appears to be a broad concern, these reasons apply beyond just
Gentoo:
https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependencies

Furthermore, in the real world my recollection is that it has really
happened that the first this is noticed is when an end user finds their
package is using a workaround (eg lp* based printing vs CUPS) or is
missing a feature altogether.

I realise that it is annoying for a individual systems administrator
who is building Samba, particularly on a non-linux platform, to have to
turn off many of our optional features first.  

This is the reason we agreed that we would spit out an error as early
in the build, not just a late compile failure.  

Thankfully the person in this situation is likely to understand what
they are disabling and know if it matters for their particular install.
Also, we know the vast bulk of Samba users get Samba via a distributor,
so anything to make this more fail-safe is, in my view, worth the
trade-off against the inconvenience of our manual builders.

So, in this case, we certainly should make the behaviour consistent.  I
don't mind if it is --enable/--disable or otherwise, as long as it is
never 'auto', and the correct option to disable is listed in the error
text.

We should also work harder to get our options code in common - we have
subtly different code in wscript vs source3/wscript!

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




