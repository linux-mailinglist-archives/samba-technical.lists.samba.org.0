Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B50304E8FD6
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 10:14:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=myZhXlAzBQX6Yi1RvVXV4fKsQYqGllVdAQvPLpNsqFA=; b=Jg0VZeEKsSkVMlBJ1ZUBcljpgM
	HZhZuJsmdtMS2oUXxR1xDrNE79/LYigzcduUBNEpqnJohQWnYm/d4y9R6cyUkSXpTa8jNMepENPug
	bMMbjWbN8pu5rW6ae4XJJhyRclIb6tHJ5TMpbRhHLGKaTe1lZJPTLS422+roPc9fX7uynSoYxsoQq
	Le9/NL3W07Ls83jGdFynDO/04SG2Jh8a174cjYM2uSq3YluNRN+9hIVAQ81keZkkyZnuLi3LXcktS
	8m62MXlMCYSLXc3GjPI29etLyYoiyA8BN+2T5VTU1OTXb78lrGfSxUjDRnEaDyNpYFEAKnY/3/8yB
	pXLfHF9g==;
Received: from ip6-localhost ([::1]:37988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYkVp-005toZ-QG; Mon, 28 Mar 2022 08:14:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37934) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYkVj-005tnS-RA
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 08:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=myZhXlAzBQX6Yi1RvVXV4fKsQYqGllVdAQvPLpNsqFA=; b=aGUZt/E2Qa0Lt8xQ4g2G13mJIg
 UK5eC91jMaNaH3JIu+cbiIkqp8HEc3ruijrmpDfcnAVNxGmf/QR5fFUIihq9RbPnpROlJ7udefheb
 5h0NuGnBlMTtgcPmiq/Gwz6jgLcxKEGPby7QcZPX0DQvDeiXZYc3DYCIbbg5Io5IzhiuPyjMlCeVE
 DilYOQiY6ev/u8aRJcG0F5GrNla9hjODPAvSXVYwBZkyng20UGYirI8f5nxuuNCwmrlEzPpgI3huA
 okeWV5bx77RTxJ3/mZ3JL2jmNPQdn4YHP9dwrQwU2hy6I2nqpHwBTwUG1UTw+krlLlJ482mDB5Sxq
 jVgXoCG+AZoVM124mHPOOozn0gz9mPvaEaZ6nN1vDtcugIMgbrDL6KkYxoq1v8q9JNz7gIE0O+5mX
 j3uyZ/VgF1p2jxcs8YZWSbg5zScEfGmeT4ZwUvEZYtyhSaaBnzucGGNa4mBi8PHO92rlt4JtH/VxK
 BeHZts2KZ8e4DX/n9QtAAbIy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYkVi-003xDQ-1x; Mon, 28 Mar 2022 08:13:58 +0000
Message-ID: <1769e074c38a67adec435f4b16b29f9eebaf3788.camel@samba.org>
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
To: Stefan Metzmacher <metze@samba.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Mon, 28 Mar 2022 21:13:53 +1300
In-Reply-To: <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
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

Looks like it. 

https://salsa.debian.org/samba-team/samba/-/blob/mjt-4.16/debian/rules#L30

That would explain a lot of 'Debian only' issues, like the big rebuild.

Andrew,

On Mon, 2022-03-28 at 10:04 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi,
> 
> are your using 'waf build' directly? This that I saw the same
> problem in the past. Please use 'make' and 'make install',
> the difference is that it passes PYTHONHASHSEED=1, without that
> the order is random.
> 
> metze
> 
> Am 28.03.22 um 09:14 schrieb Michael Tokarev via samba-technical:
> > In the other email, we wrote:
> > 
> >  >> First, the includes.  For example, while compiling
> >  >> lib/krb5_wrap/gss_samba.c ,
> >  >> the include-path includes -Ithird_party/heimdal/lib
> >  >> -Ithird_party/heimdal/lib/gssapi .
> >  >>
> >  >> gss_samba.c #includes gss_samba.h which includes
> >  >> lib/replace/system/gssapi.h,
> >  >> which - based on HAVE_GSSAPI_GSSAPI_H, includes
> >  >> <gssapi/gssapi.h>.  The first
> >  >> include path which has gssapi/gssapi.h is
> > third_party/heimdal/lib,
> >  >> so we include
> >  >> third_party/heimdal/lib/gssapi/gssapi.h. But this is a simple
> >  >> dispatcher file, it merely includes <gssapi/gssapi.h>.
> >  >> Which, as we know already, is
> >  >> third_party/heimdal/lib/gssapi/gssapi.h. So we end up
> >  >>  without all the gssapi definitions altogether.
> >  >> The correct file to include for <gssapi/gssapi.h>
> >  >> is third_party/heimdal/lib/gssapi/gssapi/gssapi.h (note the
> > double,
> >  >> or even
> >  >> triple, gssapi in there) - so the _second_ -I path should be
> > used
> >  >> from the
> >  >> above.  This is quite messy and not really reliable.
> >  >
> >  > Again, like symbols, header include paths are dependent on the
> > 'deps='
> >  > of the subsystems.  So a subsystem is missing a dependency.  We
> > have
> >  > had reports (to Heimdal, frustratingly) about this, but someone
> > needs
> >  > to chase it down.
> >  >
> >  > See https://bugzilla.samba.org/show_bug.cgi?id=15033
> > 
> > Too bad I didn't know about this when chasing this issue here :)
> > But it is good anyway to know there's someone else who hit it too
> > ;)
> > LOL :)
> > 
> > Okay.
> > 
> > The thing here is with include path ordering. And with timing
> > issues,
> > it seems.
> > 
> > I have logs from two consequtive builds, one of which failed (bad),
> > and another succeeded (good) without any changes in between (the
> > same source, the same packages installed from debian since I
> > haven't
> > run apt update, - everything is the same).
> > 
> > We should list heimdal_build/include *before* heimdal/include in
> > all cases. Yet the order is random, non-deterministic:
> > 
> > --- good0    2022-03-28 09:59:07.502426113 +0300
> > +++ bad0    2022-03-28 09:59:01.606521064 +0300
> > @@ -2,0 +3 @@
> > +-Ithird_party/heimdal/lib/krb5
> > @@ -3,0 +5 @@
> > +-Ithird_party/heimdal/include
> > @@ -4,0 +7,2 @@
> > +-Ithird_party/heimdal/lib/roken
> > +-Ithird_party/heimdal_build/include
> > @@ -7 +10,0 @@
> > --Ithird_party/heimdal/lib/krb5
> > @@ -9 +11,0 @@
> > --Ithird_party/heimdal_build/include
> > @@ -12,4 +14,2 @@
> > --Ithird_party/heimdal/lib/roken
> > --Ithird_party/heimdal/include
> > --Ithird_party/heimdal/lib/hcrypto
> > --Ithird_party/heimdal/lib
> > +-Ithird_party/heimdal/lib/hcrypto/libtommath
> > +-Ithird_party/heimdal/lib/wind
> > @@ -20 +19,0 @@
> > --Ithird_party/heimdal/lib/hcrypto/libtommath
> > @@ -22 +21,2 @@
> > --Ithird_party/heimdal/lib/hdb
> > +-Ithird_party/heimdal/lib/hcrypto
> > +-Ithird_party/heimdal/lib
> > @@ -24 +24 @@
> > --Ithird_party/heimdal/lib/wind
> > +-Ithird_party/heimdal/lib/hdb
> > 
> > There, I took one command line (compiling source4/kdc/wdc-
> > samba4.c),
> > split it into separate lines, saved into two files, filtered
> > everything related to heimdal, and diffed.  In the bad case,
> > heimdal/include is moved before heimdal_build/include.
> > And this break stuff for the reasons already mentioned above.
> > 
> > So we do have obvious ordering instability.
> > 
> > Besides this, we have one more very annoying issue. Namely, it
> > looks like "next" waf steps always include all previous steps,
> > complete or in parts.  In particular, `waf install' *always*
> > rebuilds about 6k files even if nothing at all had changed
> > in between. While `waf build' builds only about 4k files.
> > 
> > Why it is relevant in this context.
> > 
> > In debian, waf configure step is done with -j1, to avoid
> > parallel/ordering issues.  However, waf build and waf install
> > are done with default parallelism. But since `waf install'
> > re-does some of `waf configure' steps, but this time with
> > parallelism, this may lead to different results with the
> > ordering as we see with heimdal includes.
> > 
> > So it looks like we have 2 or 3 separate issues here:
> > the always-rebuild and install-builds-more-than-build,
> > and include ordering depending on parallelism.
> > 
> > I'll try to figure out what's going on, but these things
> > definitely require good understanding of waf internals
> > and machinery.
> > 
> > The two build logs are available, just in case, at
> > http://www.corpit.ru/mjt/tmp/samba-heimdal-include-ordering.tar.gz
> > 
> > Thanks,
> > 
> > /mjt
> > 
> 
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


