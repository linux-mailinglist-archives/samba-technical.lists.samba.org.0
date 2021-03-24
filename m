Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 780013482A2
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/VuqUyVNxtDRxIvSz7pV5RC3bc0jhSljeyEOxCouXDQ=; b=rQiBSyz0WBqdflrjgJ0xWBApPG
	m5JEV52/koapM1IGo6UV20hCt5DWcr8pc2y8fnMipHgcD6khcTJgXR2JJCbbAgzWGGMjHJo+BqXlI
	v2GwYwWrz+4Syc4zz/04mpPg18CsQQWkCZqbnlB6nKfcSOE1NZRczSYImC/eNrZg41JCfaPBdGUtf
	4TCUQX+uJ/ELgcJYgPKPYKYtKziZ88hs1+cArssY8nlhlxSqOdmkHcluP9N09smL6KzZcKu8o0rUq
	h+JSiBP0NGje4v+OS6uQicqze0pu+JPYQFaN8ls+mRgIu/gWaUH6omiXAGQ/7yNgnMad/ZQdsDGAy
	4siYOMcw==;
Received: from ip6-localhost ([::1]:49636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9so-006e4Y-7r; Wed, 24 Mar 2021 20:13:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9si-006e4R-G7
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=/VuqUyVNxtDRxIvSz7pV5RC3bc0jhSljeyEOxCouXDQ=; b=QorVCtCsO9eNFg/KoTYofyucfx
 +yiin6Tpm4b2SNvSFh4dICVd18TxNVHBbYBmsVlKZxZTXMuq00CkEy3OtgnsQczu/cW9ynR9UtJPV
 eK/6k5e8IkwjE2JKW3Pf/L00HUDDQpdbMWhlwM8hCa+kKo244JgxOANtSbxYAPKwkp02bqrQNyxom
 XxNQNAvwW++CvGNSeQhrkmhSxRJ2yDJPK6VOTrPR9E/o/gyiR/zcrJuHrEOz+Bl3ZWjF5kw/z/2OD
 SX2+uQXxjKqSiOPg+zqniNs5d8xtjUPd7DTO1TTq3yPJNWzRJRpNf7jCDYUWoWD9vvBGI1vQjHGwF
 AHqzLvKw4N6akKIMR+hDpGTC5X6NkMI0CwK8Rox/tDMbP91oXeD8WNQjDkz/q75fR+JX3ZBFJrJur
 k9o8GDBI9fNQNOTYr5waZgqVbDZojIvU6TT1UjhWpCMmEz8znMMX6Eu3X+FU/2XeGlbz3xOYKs8x8
 sFKVgIxnAt2YEhblUmDkC3jY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9sh-00087e-6i; Wed, 24 Mar 2021 20:13:31 +0000
Message-ID: <c0ab22d7832cc8c9d7e1abb7ef729161f46814ee.camel@samba.org>
Subject: Other things to drop (was: Re: Drop NIS support)
To: Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>
Date: Thu, 25 Mar 2021 09:13:27 +1300
In-Reply-To: <20210324161244.GB818616@jeremy-acer>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
wrote:
> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
> samba-technical wrote:
> > Hi,
> > 
> > could we drop NIS support for Samba 4.15?
> > 
> > This means getting rid of lib/replace/system/nis.h and yp_*() ...
> 
> +1 from me. Let's see if anyone else is still
> using it.
> 
> So the current list for 4.15 will be Tru64, HPUX, NIS.
> 
> Any more for any more ?

How about some more of our compilation options?

Could we merge --with-dnsupdate into --with-ads?

Does --without-iconv ever work or make sense (it builds)?
(or in the alternate does anything but UTF-8 still make sense?)

Is --with-fake-kaserver still relevant?

Is there a better way to do --disable-fault-handling
than having a configure options?

On one we can probably agree with, --with-ntvfs-fileserver should just
be a side-effect of other options like --enable-selftest, it should not
be an option on it's own. 

commit b990279304b5e2b2ee0f64480cb09eda33f76beb
Author: Ira Cooper <ira@samba.org>
Date:   Wed Mar 14 12:56:02 2012 -0400

    util: Add --disable-fault-handling.
    
    On some platforms you can not debug coredumps after the default
signal handler
    gets done dumping core.  This allows waf to have an option to
disable our
    default signal handler.

"Just asking questions" ;-)

But more seriously, I would like us to have less ./configure options so
we have less build profiles that we promise work, which in turn means
less CI resources to prove them (they are $$$) and more chance that
what we ship works for our users.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






